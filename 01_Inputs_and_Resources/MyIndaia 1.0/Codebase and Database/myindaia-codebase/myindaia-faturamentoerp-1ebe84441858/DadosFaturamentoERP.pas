unit DadosFaturamentoERP;

interface

uses
  SysUtils, Classes, Variants, DB, DBTables, ADODB, cxStyles, cxClasses,
  DBClient, Provider, InterfacesERP, StrUtils, Sapiens_NotaFiscal,Dialogs;

type
  TdtmFaturamentoERP = class(TDataModule)
    Connection: TADOConnection;
    qryConsulta: TADOQuery;
    qryPendentes: TADOQuery;
    dsPendentes: TDataSource;
    qryTipoPendente: TADOQuery;
    StringField1: TStringField;
    dsTipoPendente: TDataSource;
    qryTipoFaturar: TADOQuery;
    dsTipoFaturar: TDataSource;
    qryTipoFaturarTipo: TStringField;
    qryCalcReceita: TADOQuery;
    qryCalcReceitaVL_RECEITA: TFloatField;
    cxStyleRepository1: TcxStyleRepository;
    cxsHeader: TcxStyle;
    cxsTipoNumerario: TcxStyle;
    cxsTipoPagamento: TcxStyle;
    cxsTipoReceita: TcxStyle;
    qryUsuarioV2: TADOQuery;
    qryUsuarioV2name: TWideStringField;
    qryUsuarioV2status: TBooleanField;
    qryUsuarioV2username: TWideStringField;
    qryUsuarioLocal: TADOQuery;
    qryUsuarioLocalCD_USUARIO: TStringField;
    qryUsuarioLocalNM_USUARIO: TStringField;
    qryUsuarioLocalAP_USUARIO: TStringField;
    qryUsuarioLocalNM_EMAIL: TStringField;
    cxsBranco: TcxStyle;
    qryTipoFaturarCodTipo: TIntegerField;
    qryClienteLocal: TADOQuery;
    qryClienteLocalCD_EMPRESA: TStringField;
    qryClienteLocalNM_EMPRESA: TStringField;
    qryClienteLocalAP_EMPRESA: TStringField;
    qryClienteLocalCGC_EMPRESA: TStringField;
    qryClienteLocalCPF_EMPRESA: TStringField;
    qryClienteLocalCofins: TBCDField;
    qryClienteLocalIR: TBCDField;
    qryClienteLocalOrgaoPublico: TStringField;
    qryTipoFatura: TADOQuery;
    dsTipoFatura: TDataSource;
    qryFaturas: TADOQuery;
    dsFaturas: TDataSource;
    qryTipoFaturaCodTipo: TStringField;
    qryTipoFaturaNomeTipo: TStringField;
    qryFaturasItens: TADOQuery;
    dsFaturasItens: TDataSource;
    qryCustomClearance: TADOQuery;
    qryCustomClearanceaKey: TWideStringField;
    qryCustomClearancecustomID: TWideStringField;
    qryPendentesTipo: TStringField;
    qryPendentescreated: TDateTimeField;
    qryPendentesreceivedDate: TDateTimeField;
    qryPendentesseniorKey: TWideStringField;
    qryPendentesValor: TBCDField;
    qryPendentesstatus: TStringField;
    qryPendentesitem_name: TWideStringField;
    qryFaturasItensTipoNota: TStringField;
    qryFaturasItensTipo: TStringField;
    qryFaturasItenscreated: TDateTimeField;
    qryFaturasItensreceivedDate: TDateTimeField;
    qryFaturasItensTotal: TBCDField;
    qryFaturasItensseniorKey: TWideStringField;
    qryFaturasItensstatus: TStringField;
    qryFaturasItensdestino: TWideStringField;
    qryFaturasItensitem_name: TWideStringField;
    qryFaturasItensitem_aKey: TWideStringField;
    qryFaturasItensitem_active: TBooleanField;
    qryUnidadeV2: TADOQuery;
    qryUnidadeV2aKey: TWideStringField;
    qryUnidadeV2name: TWideStringField;
    qryUnidadeV2seniorKey: TWideStringField;
    dsUnidadeV2: TDataSource;
    qryItensV2: TADOQuery;
    dsItensReceita: TDataSource;
    qryItensV2aKey: TWideStringField;
    qryItensV2active: TBooleanField;
    qryItensV2name: TWideStringField;
    qryItensV2seniorKey: TWideStringField;
    qryItensV2type: TStringField;
    qryItensV2productItem: TIntegerField;
    dsItensNota: TDataSource;
    qryItensFaturaEnvio: TADOQuery;
    qryItensFaturaEnvioTipo: TStringField;
    qryItensFaturaEnviodestino: TWideStringField;
    qryItensFaturaEnvioprice: TBCDField;
    qryItensFaturaEnvioaKey: TWideStringField;
    qryItensFaturaEnvioname: TWideStringField;
    qryItensFaturaEnvioseniorKey: TWideStringField;
    qryItensFaturaEnviotype: TStringField;
    qryClienteEnvio: TADOQuery;
    qryClienteEnviocity: TWideStringField;
    qryClienteEnvionumber: TWideStringField;
    qryClienteEnviostate: TWideStringField;
    qryClienteEnviostreet: TWideStringField;
    qryClienteEnviozipCode: TWideStringField;
    qryClienteEnvioname: TWideStringField;
    qryClienteEnviotaxID: TWideStringField;
    qryClienteEnvioneighborhood: TWideStringField;
    qryClienteEnviofax: TWideStringField;
    qryClienteEnviofone: TWideStringField;
    qryClienteEnvioinscEstadual: TWideStringField;
    qryClienteEnvioinscMunicipal: TWideStringField;
    qryClienteEnviotype: TWideStringField;
    qryClienteEnvioseniorKey: TWideStringField;
    qryUnidadeEnvio: TADOQuery;
    qryUnidadeEnvioCD_UNID_NEG: TStringField;
    qryUnidadeEnvioNM_UNID_NEG: TStringField;
    qryUnidadeEnvioAP_UNID_NEG: TStringField;
    qryUnidadeEnvioCGC_UNID_NEG: TStringField;
    qryUnidadeEnvioEND_UNID_NEG: TStringField;
    qryUnidadeEnvioEND_NUMERO: TStringField;
    qryUnidadeEnvioEND_COMPL: TStringField;
    qryUnidadeEnvioEND_BAIRRO: TStringField;
    qryUnidadeEnvioEND_CIDADE: TStringField;
    qryUnidadeEnvioEND_UF: TStringField;
    qryUnidadeEnvioseniorKey: TWideStringField;
    qryCustomerProfile: TADOQuery;
    qryCustomerProfiledescricao: TWideStringField;
    qryCustomerProfilesendToBank: TBooleanField;
    qryCustomerProfilewithCashRequest: TBooleanField;
    qryCustomerProfilecostCenter: TStringField;
    qryCustomerProfileconsolidatedBilling: TBooleanField;
    qryCustomerProfileconsolidatedInvoice: TBooleanField;
    qryCustomerProfileloadDITax: TBooleanField;
    qryClienteLocalEND_CIDADE: TStringField;
    qryClienteLocalEND_UF: TStringField;
    qryItensFaturarTipo: TStringField;
    qryItensFaturarcreated: TDateTimeField;
    qryItensFaturarreceivedDate: TDateTimeField;
    qryItensFaturarseniorKey: TWideStringField;
    qryItensFaturarValor: TBCDField;
    qryItensFaturarstatus: TStringField;
    qryItensFaturarCD_ITEM: TWideStringField;
    qryItensFaturarCD_CALCULO: TStringField;
    qryItensFaturarNM_CALCULO: TStringField;
    qryItensFaturarNM_STORED_PROCEDURE: TStringField;
    qryItensFaturarCalcValor: TFloatField;
    qryItensFaturarValor_Item: TBCDField;
    dsItensFaturar: TDataSource;
    cdsItensFaturar: TClientDataSet;
    cdsItensFaturarItemFixo: TBooleanField;
    cdsItensFaturarSelecionado: TBooleanField;
    cdsItensFaturarTipo: TStringField;
    cdsItensFaturarstatus: TStringField;
    cdsItensFaturarValor: TBCDField;
    cdsItensFaturarValorSelecionado: TFloatField;
    dspItensFaturar: TDataSetProvider;
    cdsItensNota: TClientDataSet;
    cdsItensNotaTipo: TStringField;
    cdsItensNotastatus: TStringField;
    cdsItensNotaValorNumerarios: TFloatField;
    cdsItensNotaValorPagamentos: TFloatField;
    cdsItensNotaValorReceitas: TFloatField;
    cdsItensNotacustomID: TStringField;
    qryItensFaturarContaFinanceiraImp: TWideStringField;
    qryItensFaturarContaFinanceiraExp: TWideStringField;
    qryFaturasakey: TWideStringField;
    qryFaturascreated: TDateTimeField;
    qryFaturasdueDate: TDateTimeField;
    qryFaturasinvoiceReceiverType: TStringField;
    qryFaturasir: TBCDField;
    qryFaturasseniorDateNFE: TDateTimeField;
    qryFaturasseniorKey: TWideStringField;
    qryFaturastotal: TBCDField;
    qryFaturastype: TWideStringField;
    qryFaturasvalorTibutavel: TBCDField;
    qryFaturascustomID: TWideStringField;
    qryFaturasCD_CLIENTE: TWideStringField;
    cdsItensNotaCustomClearance_id: TStringField;
    dsClienteLocal: TDataSource;
    qryFaturascofins: TBCDField;
    qryFaturasirRetained: TBooleanField;
    qryUsuarioV2id: TLargeintField;
    qryUsuarioV2gender: TStringField;
    qryUsuarioV2branch_id: TLargeintField;
    qryCustomClearanceid: TLargeintField;
    qryCustomClearancebalance_id: TLargeintField;
    qryCustomClearancecustomer_id: TLargeintField;
    qryCustomClearanceservice_id: TLargeintField;
    qryUnidadeV2id: TLargeintField;
    qryUnidadeV2taxID: TWideStringField;
    qryUnidadeV2organization_id: TLargeintField;
    qryItensV2id: TLargeintField;
    qryItensV2taxable: TBooleanField;
    qryItensV2ContaFinanceiraImp: TWideStringField;
    qryItensV2ContaFinanceiraExp: TWideStringField;
    qryPendentescustomClearance_id: TLargeintField;
    qryPendentesparentID: TLargeintField;
    qryPendentesid: TLargeintField;
    qryPendentesuser_id: TLargeintField;
    qryPendentesitem_id: TLargeintField;
    qryItensFaturarparentID: TLargeintField;
    qryItensFaturarid: TLargeintField;
    qryItensFaturaruser_id: TLargeintField;
    qryItensFaturaritem_id: TLargeintField;
    qryFaturasid: TLargeintField;
    qryFaturasbranch_id: TLargeintField;
    s: TLargeintField;
    qryFaturasCustomClearance_id: TLargeintField;
    qryFaturascustomer_id: TLargeintField;
    qryFaturasItensBilling_id: TLargeintField;
    qryFaturasItensParentID: TLargeintField;
    qryFaturasItensid: TLargeintField;
    qryFaturasItenscustomClearance_id: TLargeintField;
    qryFaturasItenscustomer_id: TLargeintField;
    qryFaturasItensitem_id: TLargeintField;
    qryFaturasItensprice: TBCDField;
    qryFaturasItenscustomID: TWideStringField;
    qryItensFaturaEnvioBilling_id: TLargeintField;
    qryItensFaturaEnvioid: TLargeintField;
    qryItensFaturaEnvioitem_id: TLargeintField;
    qryClienteEnvioid: TLargeintField;
    qryClienteEnvioaKey: TWideStringField;
    qryClienteEnvioactive: TBooleanField;
    qryClienteEnvioCountry_id: TLargeintField;
    qryClienteEnviodefinitions_id: TLargeintField;
    qryClienteEnviogroup_id: TLargeintField;
    qryUnidadeEnvioid: TLargeintField;
    qryCustomerProfileid: TLargeintField;
    qryCustomerProfilelimitValue: TBCDField;
    qryCustomerProfileproduct_id: TLargeintField;
    cdsItensFaturarcreated: TDateTimeField;
    cdsItensFaturarreceivedDate: TDateTimeField;
    cdsItensFaturarseniorKey: TWideStringField;
    cdsItensFaturarCD_ITEM: TWideStringField;
    cdsItensFaturarCD_CALCULO: TStringField;
    cdsItensFaturarNM_CALCULO: TStringField;
    cdsItensFaturarNM_STORED_PROCEDURE: TStringField;
    cdsItensFaturarCalcValor: TFloatField;
    cdsItensFaturarValor_Item: TBCDField;
    cdsItensFaturarContaFinanceiraImp: TWideStringField;
    cdsItensFaturarContaFinanceiraExp: TWideStringField;
    cdsItensFaturarparentID: TLargeintField;
    cdsItensFaturarid: TLargeintField;
    cdsItensFaturaruser_id: TLargeintField;
    cdsItensFaturaritem_id: TLargeintField;
    cdsItensFaturarcustomClearance_id: TLargeintField;
    qryItensFaturarcustomClearance_id: TLargeintField;
    cdsItensFaturarcustomID: TWideStringField;
    qryItensFaturarcustomID: TWideStringField;
    qryProcessoLocal: TADOQuery;
    qryProcessoLocalCD_AGENTE: TStringField;
    dsProcessoLocal: TDataSource;
    qryProcessoLocalNR_CGC_AGENTE: TStringField;
    qryProcessoV2: TADOQuery;
    qryProcessoV2id: TLargeintField;
    qryProcessoV2aKey: TWideStringField;
    qryProcessoV2customID: TWideStringField;
    qryProcessoV2balance_id: TLargeintField;
    qryProcessoV2customer_id: TLargeintField;
    qryProcessoV2service_id: TLargeintField;
    dsProcessoV2: TDataSource;
    qryFaturasobs: TMemoField;
    qryFaturasstatus: TWideStringField;
    qryItensFaturarValor_Cliente: TBCDField;
    cdsItensFaturarValor_Cliente: TBCDField;
    cdsItensNotaValor_Cliente: TBCDField;
    cdsItensNotaparentID: TLargeintField;
    cdsItensNotaid: TLargeintField;
    cdsItensNotaValor: TBCDField;
    cdsItensNotaitem_id: TLargeintField;
    qryItensFaturaritem_name: TWideStringField;
    cdsItensFaturaritem_name: TWideStringField;
    cdsItensNotaitem_name: TWideStringField;
    cdsItensNotaValorTotal: TFloatField;
    qryFaturasiss: TBCDField;
    qryExecuta: TADOQuery;
    qryReembolso: TADOQuery;
    qryReembolsoValor: TBCDField;
    qryReembolsoDataVencimentoFat: TDateTimeField;
    qryReembolsoDataPagamento: TDateTimeField;
    qryReembolsoGrupo: TStringField;
    qryReembolsoDias: TIntegerField;
    qryReembolsoReembolso: TFloatField;
    qryReembolsoBilling_id: TLargeintField;
    dspReembolso: TDataSetProvider;
    cdsReembolso: TClientDataSet;
    dsReembolso: TDataSource;
    cdsReembolsoValor: TBCDField;
    cdsReembolsoDataVencimentoFat: TDateTimeField;
    cdsReembolsoDataPagamento: TDateTimeField;
    cdsReembolsoGrupo: TStringField;
    cdsReembolsoDias: TIntegerField;
    cdsReembolsoReembolso: TFloatField;
    cdsReembolsoBilling_id: TLargeintField;
    qryReembolsoItemPaymentRequested_id: TLargeintField;
    cdsReembolsoItemPaymentRequested_id: TLargeintField;
    qryFaturasItensReembolso: TBCDField;
    qrySaldoProcesso: TADOQuery;
    cdsSaldoProcesso: TClientDataSet;
    dspSaldoProcesso: TDataSetProvider;
    dsSaldoProcesso: TDataSource;
    qrySaldoProcessocustomID: TWideStringField;
    qrySaldoProcessocustomClearance_id: TLargeintField;
    cdsSaldoProcessocustomID: TWideStringField;
    cdsSaldoProcessocustomClearance_id: TLargeintField;
    qryFaturasSituacao: TStringField;
    qryFaturasuser_id_1: TLargeintField;
    qryFaturasname: TWideStringField;
    qryItensFaturardestino: TIntegerField;
    cdsItensFaturardestino: TIntegerField;
    qryFaturasnumdfs: TLargeintField;
    qryFaturasPercISS: TBCDField;
    qryAtualizaNrNf: TADOQuery;
    qryItensFaturar: TADOQuery;
    qryFaturasBRANCH_ID_CUSTOM: TLargeintField;
    procedure ConnectionAfterConnect(Sender: TObject);
    procedure cdsItensFaturarSelecionadoChange(Sender: TField);
    procedure cdsItensFaturarCalcFields(DataSet: TDataSet);
    procedure qryCustomClearanceAfterOpen(DataSet: TDataSet);
    procedure qryFaturasAfterClose(DataSet: TDataSet);
    procedure cdsItensFaturarAfterScroll(DataSet: TDataSet);
    procedure cdsItensFaturarBeforeInsert(DataSet: TDataSet);
    procedure cdsItensFaturarNewRecord(DataSet: TDataSet);
    procedure qryFaturasdueDateChange(Sender: TField);
    procedure qryFaturasAfterOpen(DataSet: TDataSet);
    procedure cdsItensFaturarAfterInsert(DataSet: TDataSet);
    procedure qryFaturascreatedChange(Sender: TField);
    procedure qryFaturasirChange(Sender: TField);
    procedure qryFaturascofinsChange(Sender: TField);
    procedure qryFaturasissChange(Sender: TField);
    procedure qryFaturasAfterPost(DataSet: TDataSet);
  private
    FMensagemErro: String;
    FPath: String;
    function PreparaConsulta(ATabela, ACampo: String; ACamposFiltro: array of String; AParams: array of Variant; AQuery: TADOQuery = nil): Boolean; overload;
    function PreparaConsulta(ASQL: String; AParams: array of Variant; AQuery: TADOQuery = nil): Boolean; overload;
    function DefineParametros(AQuery: TADOQuery; AParams: array of Variant): Boolean;
  public
    function AbreUsuario(NmUsuario,Email: String;CdUsuario : integer): Boolean;
    // Transações
    procedure BeginTransaction;
    procedure Commit;
    procedure Rollback;
    function InTransaction: Boolean;
    // Consultas
    function ConsultaSQL(ASQL: String; AParams: array of Variant; ARetorno: String): String; overload;
    function ConsultaSQL(ASQL: String; AParams: array of Variant; ARetorno: Integer): Integer; overload;
    function ConsultaSQL(ASQL: String; AParams: array of Variant; ARetorno: Double): Double; overload;
    function ConsultaSQL(ASQL: String; AParams: array of Variant; ARetorno: TDateTime): TDateTime; overload;
    function ConsultaSQL(ASQL: String; AParams: array of Variant; ARetorno: Boolean): Boolean; overload;
    function Consulta(ATabela, ACampo: String; ACamposFiltro: array of String; AParams: array of Variant; ARetorno: String): String; overload;
    function Consulta(ATabela, ACampo: String; ACamposFiltro: array of String; AParams: array of Variant; ARetorno: Integer): Integer; overload;
    function Consulta(ATabela, ACampo: String; ACamposFiltro: array of String; AParams: array of Variant; ARetorno: Double): Double; overload;
    function Consulta(ATabela, ACampo: String; ACamposFiltro: array of String; AParams: array of Variant; ARetorno: TDateTime): TDateTime; overload;
    function Consulta(ATabela, ACampo: String; ACamposFiltro: array of String; AParams: array of Variant; ARetorno: Boolean): Boolean; overload;
    function ExecSQL(ASQL: String; AParams: array of Variant): Integer;
    function GetQuery: TADOQuery; overload;
    function GetQuery(ASQL: String; AParams: array of Variant): TADOQuery; overload;
    function GetQuery(ATabela, ACampo: String; ACamposFiltro: array of String; AParams: array of Variant): TADOQuery; overload;
    // Atualizações
    procedure AtualizaItensFaturar;
    procedure AtualizaItensNota;
    procedure VerificaNumeroNF(CustomClearanceId : Integer; NrProcesso : String);
    procedure PegaNFSE(NR_PROCESSO : String);
  public
    property Path: String read FPath;
    property MensagemErro: String read FMensagemErro;
  end;

var
  dtmFaturamentoERP: TdtmFaturamentoERP;
  CustomClearance_id : integer;
  CustomId : string;
implementation

{$R *.dfm}

uses
  Funcoes,DebugDataset, Global,GeraNotaFiscal,ClassesERP, DDENFSEIntf;

{ TdtmFaturamentoERP }

function TdtmFaturamentoERP.Consulta(ATabela, ACampo: String; ACamposFiltro: array of String; AParams: array of Variant; ARetorno: TDateTime): TDateTime;
begin
  Result := StrToDateTime(Consulta(ATabela, ACampo, ACamposFiltro, AParams, DateTimeToStr(ARetorno)));
end;

function TdtmFaturamentoERP.Consulta(ATabela, ACampo: String; ACamposFiltro: array of String; AParams: array of Variant; ARetorno: Boolean): Boolean;
begin
  Result := StrToBool(Consulta(ATabela, ACampo, ACamposFiltro, AParams, BoolToStr(ARetorno)));
end;

function TdtmFaturamentoERP.Consulta(ATabela, ACampo: String; ACamposFiltro: array of String; AParams: array of Variant; ARetorno: Double): Double;
begin
  Result := StrToFloat(Consulta(ATabela, ACampo, ACamposFiltro, AParams, FloatToStr(ARetorno)));
end;

function TdtmFaturamentoERP.Consulta(ATabela, ACampo: String; ACamposFiltro: array of String; AParams: array of Variant; ARetorno: String): String;
begin
  if not PreparaConsulta(ATabela, ACampo, ACamposFiltro, AParams) then
    Result := ARetorno
  else
    try
      qryConsulta.Open;
      if qryConsulta.Fields[0].IsNull then
        Result := ARetorno
      else
        Result := qryConsulta.Fields[0].AsString;
      qryConsulta.Close;
    except
      Result := ARetorno;
    end;
end;

function TdtmFaturamentoERP.AbreUsuario(NmUsuario,Email: String;CdUsuario : integer): Boolean;
begin
  if qryUsuarioLocal.Active then
    qryUsuarioLocal.Close;
  qryUsuarioLocal.Parameters.ParamByName('CD_USUARIO').Value := CdUsuario;
  qryUsuarioLocal.Open;

  if qryUsuarioV2.Active then
    qryUsuarioV2.Close;
  qryUsuarioV2.Parameters.ParamByName('username').Value :=Email ;
  qryUsuarioV2.Open;
  Result := qryUsuarioV2username.AsString <> '';
  if not Result then
  begin
    if qryUsuarioV2.Active then
      qryUsuarioV2.Close;
    qryUsuarioV2.Parameters.ParamByName('username').Value := qryUsuarioLocalNM_EMAIL.AsString;
    qryUsuarioV2.Open;
    Result := qryUsuarioV2username.AsString <> '';
  end;
end;


procedure TdtmFaturamentoERP.AtualizaItensFaturar;
begin
  cdsItensFaturar.DisableControls;
  cdsItensFaturar.OnNewRecord  := nil;
  cdsItensFaturar.BeforeInsert := nil;
  cdsItensFaturar.AfterScroll  := nil;
  try
    //if not cdsItensFaturar.Active then
      //cdsItensFaturar.Open;
    //cdsItensFaturar.EmptyDataSet;
    qryItensFaturar.First;
    while not qryItensFaturar.Eof do
    begin
      cdsItensFaturar.Append;

      cdsItensFaturarItemFixo.AsBoolean            := True;
      cdsItensFaturarAfterScroll(nil);
      cdsItensFaturarSelecionado.AsBoolean         := False;
      cdsItensFaturarTipo.AsString                 := qryItensFaturarTipo.AsString;
      cdsItensFaturarparentID.AsInteger            := qryItensFaturarparentID.AsInteger;
      cdsItensFaturarid.AsInteger                  := qryItensFaturarid.AsInteger;
      cdsItensFaturarstatus.AsString               := qryItensFaturarstatus.AsString;
      cdsItensFaturaritem_id.AsInteger             := qryItensFaturaritem_id.AsInteger;
      cdsItensFaturarcustomID.Asstring             := qryItensFaturarcustomID.AsString;
      cdsItensFaturarcustomClearance_id.AsInteger  := qryItensFaturarcustomClearance_id.AsInteger;
      cdsItensFaturarValor_Cliente.AsFloat         := qryItensFaturarValor_Cliente.AsFloat;
      cdsItensFaturardestino.AsInteger             := qryItensFaturardestino.AsInteger;

      if qryItensFaturarNM_STORED_PROCEDURE.AsString = '' then
      begin
        //cdsItensFaturarValor.AsFloat := qryItensFaturarValor.AsFloat
        cdsItensFaturarValor.AsFloat      := qryItensFaturarValor_Item.AsFloat;
        cdsItensFaturarValor_Item.AsFloat := qryItensFaturarValor.AsFloat
      end
      else
      begin
        if qryCalcReceita.Active then
          qryCalcReceita.Close;

        qryCalcReceita.Parameters.ParamByName('NM_STORED_PROCEDURE').Value := qryItensFaturarNM_STORED_PROCEDURE.AsString;
        qryCalcReceita.Parameters.ParamByName('NR_PROCESSO').Value         := qryCustomClearancecustomID.AsString;
        qryCalcReceita.Parameters.ParamByName('CD_ITEM').Value             := qryItensFaturarCD_ITEM.AsString;
        qryCalcReceita.Parameters.ParamByName('VL_RECEITA').Value          := 0;
        qryCalcReceita.Open;

        cdsItensFaturarValor.AsFloat      := qryCalcReceitaVL_RECEITA.AsFloat;
        cdsItensFaturarValor_Item.AsFloat := qryCalcReceitaVL_RECEITA.AsFloat;
        qryCalcReceita.Close;
      end;
      cdsItensFaturar.Post;
      qryItensFaturar.Next;
    end;


  finally
    cdsItensFaturar.EnableControls;
    cdsItensFaturar.OnNewRecord  := cdsItensFaturarNewRecord;
    cdsItensFaturar.BeforeInsert := cdsItensFaturarBeforeInsert;
    cdsItensFaturar.AfterScroll  := cdsItensFaturarAfterScroll;
    cdsItensFaturar.First;
  end;
end;

procedure TdtmFaturamentoERP.AtualizaItensNota;
var
  ValorTotal, ValorNumerarios, ValorPagamentos, ValorReceitas: Double;
begin
  cdsItensFaturar.DisableControls;
  cdsItensNota.DisableControls;
  try
    if cdsItensFaturar.State = dsEdit then
      cdsItensFaturar.Post;

    if not cdsItensNota.Active then
      cdsItensNota.Open;

    //cdsItensNota.EmptyDataSet;
   // cdsItensFaturar.First;

    ValorNumerarios := 0;
    ValorPagamentos := 0;
    ValorReceitas   := 0;

    cdsItensFaturar.first;
    while not cdsItensFaturar.Eof do
    begin
      if cdsItensFaturarSelecionado.AsBoolean then
      begin
        cdsItensNota.Append;
        cdsItensNotaTipo.AsString                := cdsItensFaturarTipo.AsString;
        cdsItensNotaparentID.AsInteger           := cdsItensFaturarparentID.AsInteger;
        cdsItensNotaid.AsInteger                 := cdsItensFaturarid.AsInteger;
        cdsItensNotastatus.AsString              := cdsItensFaturarstatus.AsString;
        cdsItensNotaitem_id.AsInteger            := cdsItensFaturaritem_id.AsInteger;
        //cdsItensNotaitem_name.AsString         := cdsItensFaturaritem_name.AsString;
        cdsItensNotaValor.AsFloat                := cdsItensFaturarValor.AsFloat;
        cdsItensNotaValorTotal.AsFloat           := cdsItensFaturarValor_Item.AsFloat;
        cdsItensNotacustomID.AsString            := cdsItensFaturarcustomID.AsString;
        cdsItensNotaCustomClearance_id.AsInteger := cdsItensFaturarcustomClearance_id.AsInteger;
        cdsItensNotaValor_Cliente.AsFloat        := cdsItensFaturarValor_Cliente.AsFloat;
        cdsItensNota.Post;

        if CharinSet(cdsItensFaturarTipo.AsString[1], ['N', 'n']) then
          ValorNumerarios := ValorNumerarios + cdsItensFaturarValor.AsFloat
        else
          if CharinSet(cdsItensFaturarTipo.AsString[1], ['P', 'p']) then
            ValorPagamentos := ValorPagamentos + cdsItensFaturarValor.AsFloat
          else
            if CharinSet(cdsItensFaturarTipo.AsString[1], ['R', 'r']) then
              ValorReceitas := ValorReceitas + cdsItensFaturarValor.AsFloat;
      end;
      cdsItensFaturar.Next;
    end;

    ValorTotal := ValorPagamentos + ValorReceitas - ValorNumerarios;

    cdsItensNota.First;
    while not cdsItensNota.Eof do
    begin
      cdsItensNota.Edit;
      cdsItensNotaValorTotal.AsFloat       := ValorTotal;
      cdsItensNotaValorNumerarios.AsFloat  := ValorNumerarios;
      cdsItensNotaValorPagamentos.AsFloat  := ValorPagamentos;
      cdsItensNotaValorReceitas.AsFloat    := ValorReceitas;
      cdsItensNota.Post;

      cdsItensNota.Next;
    end;

    cdsItensNota.First;
  finally
    cdsItensFaturar.EnableControls;
    cdsItensNota.EnableControls;
    cdsItensFaturar.First;
    cdsItensNota.First;
  end;
end;

procedure TdtmFaturamentoERP.BeginTransaction;
begin
  Connection.BeginTrans;
end;

procedure TdtmFaturamentoERP.cdsItensFaturarAfterInsert(DataSet: TDataSet);
begin
 // frmGeraNotaFiscal.label15 := strtofloat(frmGeraNotaFiscal.Label15.Caption) + cdsItensFaturarValor.AsFloat;
  if (cdsItensFaturarcustomClearance_id.AsInteger = 0) and (CustomClearance_id <> 0) then
  begin
     cdsItensFaturarcustomClearance_id.AsInteger := CustomClearance_id;
     cdsItensFaturarcustomID.AsString := Customid;
  end
  else
  begin
     cdsItensFaturarcustomClearance_id.AsInteger := Parametros.Processoid;
     cdsItensFaturarcustomID.AsString := Parametros.Processo;
  end;

end;

procedure TdtmFaturamentoERP.cdsItensFaturarAfterScroll(DataSet: TDataSet);
begin
  cdsItensFaturarparentID.ReadOnly  := (DataSet <> nil) and cdsItensFaturarItemFixo.AsBoolean;
  cdsItensFaturarid.ReadOnly        := cdsItensFaturarparentID.ReadOnly;
  cdsItensFaturarValor.ReadOnly     := false;
  cdsItensFaturarstatus.ReadOnly    := cdsItensFaturarparentID.ReadOnly;
  cdsItensFaturaritem_id.ReadOnly   := cdsItensFaturarparentID.ReadOnly;
  //cdsItensFaturaritem_name.ReadOnly := cdsItensFaturarparentID.ReadOnly;
  cdsItensFaturarSelecionado.ReadOnly := (DataSet <> nil) and not cdsItensFaturarItemFixo.AsBoolean;
end;

procedure TdtmFaturamentoERP.cdsItensFaturarBeforeInsert(DataSet: TDataSet);
begin
  CustomClearance_id:= cdsItensFaturarcustomClearance_id.AsInteger;
  CustomId:= cdsItensFaturarcustomID.asstring;

  cdsItensFaturar.DisableControls;
  try
    cdsItensFaturarAfterScroll(nil);
  finally
    cdsItensFaturar.EnableControls;
  end;
end;

procedure TdtmFaturamentoERP.cdsItensFaturarCalcFields(DataSet: TDataSet);
begin
  if DataSet.State = dsInternalCalc then
  begin
    if cdsItensFaturarSelecionado.AsBoolean then
      cdsItensFaturarValorSelecionado.AsFloat := cdsItensFaturarValor.AsFloat
    else
      cdsItensFaturarValorSelecionado.AsFloat := 0;
  end;
end;

procedure TdtmFaturamentoERP.cdsItensFaturarNewRecord(DataSet: TDataSet);
begin
  cdsItensFaturar.DisableControls;
  try
    cdsItensFaturarAfterScroll(nil);
    cdsItensFaturarItemFixo.AsBoolean     := False;
    cdsItensFaturarTipo.AsString          := 'Receitas';
    cdsItensFaturarSelecionado.ReadOnly   := False;
    cdsItensFaturarSelecionado.AsBoolean  := True;
    cdsItensFaturarparentID.AsInteger     := 0;
    cdsItensFaturarid.AsInteger           := StrToInt(FormatDateTime('hhnnsszzz', Now));
    cdsItensFaturarSelecionado.ReadOnly   := False;

  finally
    cdsItensFaturar.EnableControls;
  end;

  cdsItensFaturarAfterScroll(cdsItensFaturar);
end;

procedure TdtmFaturamentoERP.cdsItensFaturarSelecionadoChange(Sender: TField);
var
  parentID,destino: Int64;
  Selecionado: Boolean;
  Tipo,item: String;
  Bookmark: TBookmark;
begin
  if (not cdsItensFaturar.ControlsDisabled) and (not CharInSet(cdsItensFaturarTipo.AsString[1], ['R', 'r'])) then
  begin
    Selecionado := cdsItensFaturarSelecionado.AsBoolean;
    parentID := cdsItensFaturarparentID.AsInteger;
    Tipo := cdsItensFaturarTipo.AsString;
    destino := cdsItensFaturardestino.AsInteger;
    Bookmark := cdsItensFaturar.GetBookmark;
    try
      if (cdsItensFaturar.State = dsEdit) then
        cdsItensFaturar.Post;
      cdsItensFaturar.DisableControls;
      cdsItensFaturar.First;
      cdsItensFaturar.Locate('Tipo;parentID', VarArrayOf([Tipo, parentID]), []);
      while (not cdsItensFaturar.Eof) do
      begin
        if (cdsItensFaturarTipo.AsString = Tipo) and (cdsItensFaturarparentID.AsInteger = parentID) and
        (cdsItensFaturarSelecionado.AsBoolean <> Selecionado) and ( cdsItensFaturardestino.AsInteger = destino) then
        begin
          cdsItensFaturar.Edit;
          cdsItensFaturarSelecionado.AsBoolean := Selecionado;
          cdsItensFaturar.Post;
        end;
        cdsItensFaturar.Next;
      end;
    finally
      //cdsItensFaturar.Locate('Tipo;parentID;id', VarArrayOf([parentID, id]), []);
      cdsItensFaturar.GotoBookmark(Bookmark);
      cdsItensFaturar.EnableControls;
    end;
  end
  else if (cdsItensFaturar.State = dsEdit) and CharInSet(cdsItensFaturarTipo.AsString[1], ['R', 'r']) then
    cdsItensFaturar.Post;
end;

procedure TdtmFaturamentoERP.Commit;
begin
  Connection.CommitTrans;
end;

procedure TdtmFaturamentoERP.ConnectionAfterConnect(Sender: TObject);
begin
  qryTipoPendente.Open;
  qryTipoFaturar.Open;
  qryTipoFatura.Open;
  qryUnidadeV2.Open;
end;

function TdtmFaturamentoERP.Consulta(ATabela, ACampo: String; ACamposFiltro: array of String; AParams: array of Variant; ARetorno: Integer): Integer;
begin
  Result := StrToInt(Consulta(ATabela, ACampo, ACamposFiltro, AParams, IntToStr(ARetorno)));
end;

function TdtmFaturamentoERP.ConsultaSQL(ASQL: String; AParams: array of Variant; ARetorno: TDateTime): TDateTime;
begin
  Result := StrToDateTime(ConsultaSQL(ASQL, AParams, DateTimeToStr(ARetorno)));
end;

function TdtmFaturamentoERP.ConsultaSQL(ASQL: String; AParams: array of Variant; ARetorno: Boolean): Boolean;
begin
  Result := StrToBool(ConsultaSQL(ASQL, AParams, BoolToStr(ARetorno)));
end;

function TdtmFaturamentoERP.DefineParametros(AQuery: TADOQuery; AParams: array of Variant): Boolean;
var
  I: Integer;
begin
  try
    for I := 0 to High(AParams) do
      AQuery.Parameters[I].Value := AParams[I];
    Result := True;
  except
    Result := False;
  end;
end;

function TdtmFaturamentoERP.ExecSQL(ASQL: String; AParams: array of Variant): Integer;
begin
  if PreparaConsulta(ASQL, AParams) then
    Result := qryConsulta.ExecSQL
  else
    Result := -1;
end;

function TdtmFaturamentoERP.GetQuery: TADOQuery;
begin
  Result := TADOQuery.Create(Self);
  Result.Connection := Connection;
end;

function TdtmFaturamentoERP.GetQuery(ASQL: String; AParams: array of Variant): TADOQuery;
begin
  Result := GetQuery;
  PreparaConsulta(ASQL, AParams, Result);
end;

function TdtmFaturamentoERP.GetQuery(ATabela, ACampo: String; ACamposFiltro: array of String; AParams: array of Variant): TADOQuery;
begin
  Result := GetQuery;
  PreparaConsulta(ATabela, ACampo, ACamposFiltro, AParams, Result);
end;

function TdtmFaturamentoERP.InTransaction: Boolean;
begin
  Result := Connection.InTransaction;
end;

function TdtmFaturamentoERP.PreparaConsulta(ATabela, ACampo: String; ACamposFiltro: array of String; AParams: array of Variant; AQuery: TADOQuery = nil): Boolean;
var
  SQL: String;
  I: Integer;
begin
  try
    SQL := 'SELECT ' + ACampo + ' ' +
           'FROM ' + ATabela;
    if High(ACamposFiltro) >= 0 then
    begin
      SQL := SQL + ' WHERE ' + ACamposFiltro[0] + ' = :' + ACamposFiltro[0];
      for I := 1 to High(ACamposFiltro) do
        SQL := SQL + ' AND ' + ACamposFiltro[I] + ' = :' + ACamposFiltro[I];
    end;
    Result := PreparaConsulta(SQL, AParams, AQuery);
  except
    Result := False;
  end;
end;

function TdtmFaturamentoERP.PreparaConsulta(ASQL: String; AParams: array of Variant; AQuery: TADOQuery = nil): Boolean;
begin
  try
    if AQuery = nil then
      AQuery := qryConsulta;
    if AQuery.Active then
      AQuery.Close;
    AQuery.SQL.Text := ASQL;
    Result := DefineParametros(AQuery, AParams);
  except
    Result := False;
  end;
end;

procedure TdtmFaturamentoERP.qryCustomClearanceAfterOpen(DataSet: TDataSet);
begin
  if Trim(qryCustomClearancecustomID.AsString) <> '' then
  begin
    if qryClienteLocal.Active then
      qryClienteLocal.Close;

    qryClienteLocal.Parameters.ParamValues['CD_EMPRESA']  := '';
    qryClienteLocal.Parameters.ParamValues['NR_PROCESSO'] := qryCustomClearancecustomID.AsString;
    qryClienteLocal.Open;

    if qryPendentes.Active then
      qryPendentes.Close;

    qryPendentes.Parameters.ParamValues['customClearance_id'] := qryCustomClearanceid.AsInteger;
    qryPendentes.Open;

    if qryFaturas.Active then
      qryFaturas.Close;

    qryFaturas.Parameters.ParamValues['customClearance_id'] := qryCustomClearanceid.AsInteger;
    qryFaturas.Open;

//    só verifica processos antigos. porque de 2018 pra frente será atualizado pelo robo myatualizanffaturamento
    if StrToInt(Copy(qryCustomClearancecustomID.AsString,15,2))<18 then
      VerificaNumeroNF(qryCustomClearanceid.AsInteger, qryCustomClearancecustomID.AsString);
  end
  else
  begin
    qryPendentes.Close;
    qryFaturas.Close;
  end;
end;

procedure TdtmFaturamentoERP.VerificaNumeroNF(CustomClearanceId : Integer; NrProcesso : string);
var
  i:integer;
  faltaNf : Boolean;
begin
  faltaNf := False;

  qryFaturas.First;
  while not qryFaturas.eof do
  begin
    //se esta faturado e não tem numero de fatura...
    if (qryFaturastype.AsString         = 'TAX_INVOICE') and
       (qryFaturasstatus.AsString       = 'INVOICED') and
       ((Trim(qryFaturasnumdfs.AsString) = '') or (Trim(qryFaturasnumdfs.AsString) = '0')) then
    begin
      faltaNf := True;
      Break;
    end;

    qryFaturas.Next
  end;
  qryFaturas.first;

  if faltaNf then
  begin
    qryAtualizaNrNf.close;
    qryAtualizaNrNf.Parameters.ParamValues['customClearance_id'] := CustomClearanceId;
    qryAtualizaNrNf.execSql;

 //   PegaNFSE(NrProcesso);

    if qryFaturas.Active then
      qryFaturas.Close;

    qryFaturas.Parameters.ParamValues['customClearance_id'] := CustomClearanceId;
    qryFaturas.Open;
  end;
end;

procedure TdtmFaturamentoERP.qryFaturasAfterClose(DataSet: TDataSet);
begin
  if qryFaturasItens.Active then
    qryFaturasItens.Close;
end;

procedure TdtmFaturamentoERP.qryFaturasAfterOpen(DataSet: TDataSet);
begin
 if dtmFaturamentoERP.qryFaturasItens.Active then
    dtmFaturamentoERP.qryFaturasItens.Close;

  dtmFaturamentoERP.qryFaturasItens.Parameters.ParamValues['CUSTOM_CLEARENCE']  := qryCustomClearanceid.AsInteger;
 // dtmFaturamentoERP.qryFaturasItens.Parameters.ParamValues['CustomClearance_id']  := qryCustomClearanceid.AsInteger;
 // dtmFaturamentoERP.qryFaturasItens.Parameters.ParamValues['CustomClearance_id1'] := qryCustomClearanceid.AsInteger;

  dtmFaturamentoERP.qryFaturasItens.Open;
end;

procedure TdtmFaturamentoERP.qryFaturasAfterPost(DataSet: TDataSet);
var
  bmPosicaoQuery : TBookmark;
begin
    bmPosicaoQuery  := qryFaturas.GetBookMark;
    qryFaturas.close;
    qryFaturas.open;

    qryFaturas.GotoBookMark(bmPosicaoQuery);
    qryFaturas.FreeBookMark(bmPosicaoQuery);
end;

procedure TdtmFaturamentoERP.qryFaturascofinsChange(Sender: TField);
begin
 if dtmFaturamentoERP.qryFaturas.State <> dsEdit then
    dtmFaturamentoERP.qryFaturas.Edit;

  qryFaturas.Post
end;

procedure TdtmFaturamentoERP.qryFaturascreatedChange(Sender: TField);
begin
if qryFaturasstatus.AsString <> 'INVOICED' then
    qryFaturas.Post
  else
    ShowMessage('Fatura já foi enviada!') ;
end;

procedure TdtmFaturamentoERP.qryFaturasdueDateChange(Sender: TField);
begin
  if qryFaturasstatus.AsString <> 'INVOICED' then
  begin
    qryFaturas.Post;
   // qryFaturas.close;
  //  qryFaturas.open;
  end
  else
    ShowMessage('Fatura já foi enviada!') ;
end;

procedure TdtmFaturamentoERP.qryFaturasirChange(Sender: TField);
begin
  if dtmFaturamentoERP.qryFaturas.State <> dsEdit then
    dtmFaturamentoERP.qryFaturas.Edit;
  qryFaturas.Post
end;

procedure TdtmFaturamentoERP.qryFaturasissChange(Sender: TField);
begin
  if dtmFaturamentoERP.qryFaturas.State <> dsEdit then
    dtmFaturamentoERP.qryFaturas.Edit;
  qryFaturas.Post
end;

procedure TdtmFaturamentoERP.Rollback;
begin
  Connection.RollbackTrans;
end;

function TdtmFaturamentoERP.ConsultaSQL(ASQL: String; AParams: array of Variant; ARetorno: Double): Double;
begin
  Result := StrToFloat(ConsultaSQL(ASQL, AParams, FloatToStr(ARetorno)));
end;

function TdtmFaturamentoERP.ConsultaSQL(ASQL: String; AParams: array of Variant; ARetorno: String): String;
begin
  if not PreparaConsulta(ASQL, AParams) then
    Result := ARetorno
  else
    try
      qryConsulta.Open;
      if qryConsulta.Fields[0].IsNull then
        Result := ARetorno
      else
        Result := qryConsulta.Fields[0].AsString;
      qryConsulta.Close;
    except
      Result := ARetorno;
    end;
end;

function TdtmFaturamentoERP.ConsultaSQL(ASQL: String; AParams: array of Variant; ARetorno: Integer): Integer;
begin
  Result := StrToInt(ConsultaSQL(ASQL, AParams, IntToStr(ARetorno)));
end;

procedure TdtmFaturamentoERP.PegaNFSE(NR_PROCESSO : String);
var
  Msg: string;
begin
  Msg := GetNFSeInstance.SalvarPDF(NR_PROCESSO, True, False);
  if Msg<>'' then
    ShowMessage('Erro ao baixar XML da nota fiscal. '#13+ Msg);
end;
end.
