unit DadosEnvioERP;

interface

uses
  SysUtils, Classes, DB, DBClient, ADODB, StrUtils, Math, Provider,dialogs,Controls,
  InvokeRegistry, Rio, SOAPHTTPClient, SOAPHTTPTrans, Windows, wininet;

const
  _BaseCofins = 215.27;  // COFINS começa a reter a partir de 215,27 no mesmo dia para o mesmo cliente
  _ERP_RPS=  'RPS';
  _ERP_NFS = 'NSE';
  _ERP_NFD = 'DEB';

type
  TdtmEnvioERP = class(TDataModule)
    qryFatura: TADOQuery;
    qryFaturaakey: TWideStringField;
    qryFaturacreated: TDateTimeField;
    qryFaturadueDate: TDateTimeField;
    qryFaturainvoiceReceiverType: TStringField;
    qryFaturair: TBCDField;
    qryFaturaseniorDateNFE: TDateTimeField;
    qryFaturaseniorKey: TWideStringField;
    qryFaturastatus: TWideStringField;
    qryFaturatotal: TBCDField;
    qryFaturatype: TWideStringField;
    qryFaturavalorTibutavel: TBCDField;
    qryFaturacustomID: TWideStringField;
    qryFaturaCD_CLIENTE: TWideStringField;
    qryItensFatura: TADOQuery;
    qryItensFaturaTipo: TStringField;
    qryItensFaturaprice: TBCDField;
    qryItensFaturaaKey: TWideStringField;
    qryItensFaturaname: TWideStringField;
    qryItensFaturaseniorKey: TWideStringField;
    qryItensFaturatype: TStringField;
    cdsFaturaPagamentos: TClientDataSet;
    cdsFaturaPagamentosTipo: TStringField;
    cdsFaturaPagamentosdestino: TWideStringField;
    cdsFaturaPagamentosprice: TBCDField;
    cdsFaturaPagamentosaKey: TWideStringField;
    cdsFaturaPagamentosname: TWideStringField;
    cdsFaturaPagamentosseniorKey: TWideStringField;
    cdsFaturaPagamentostype: TStringField;
    cdsFaturaReceitas: TClientDataSet;
    cdsFaturaReceitasTipo: TStringField;
    cdsFaturaReceitasdestino: TWideStringField;
    cdsFaturaReceitasprice: TBCDField;
    cdsFaturaReceitasaKey: TWideStringField;
    cdsFaturaReceitasname: TWideStringField;
    cdsFaturaReceitasseniorKey: TWideStringField;
    cdsFaturaReceitastype: TStringField;
    cdsItensFatura: TClientDataSet;
    cdsItensFaturaTipo: TStringField;
    cdsItensFaturadestino: TWideStringField;
    cdsItensFaturaprice: TBCDField;
    cdsItensFaturaaKey: TWideStringField;
    cdsItensFaturaname: TWideStringField;
    cdsItensFaturaseniorKey: TWideStringField;
    cdsItensFaturatype: TStringField;
    qryClienteV2: TADOQuery;
    qryClienteV2aKey: TWideStringField;
    qryClienteV2city: TWideStringField;
    qryClienteV2number: TWideStringField;
    qryClienteV2state: TWideStringField;
    qryClienteV2street: TWideStringField;
    qryClienteV2zipCode: TWideStringField;
    qryClienteV2name: TWideStringField;
    qryClienteV2taxID: TWideStringField;
    qryClienteV2Country_id: TLargeintField;
    qryClienteV2neighborhood: TWideStringField;
    qryClienteV2fax: TWideStringField;
    qryClienteV2fone: TWideStringField;
    qryClienteV2inscEstadual: TWideStringField;
    qryClienteV2inscMunicipal: TWideStringField;
    qryClienteV2type: TWideStringField;
    qryClienteV2seniorKey: TWideStringField;
    qryClienteLocal: TADOQuery;
    qryClienteLocalCD_EMPRESA: TStringField;
    qryClienteLocalNM_EMPRESA: TStringField;
    qryClienteLocalAP_EMPRESA: TStringField;
    qryClienteLocalCGC_EMPRESA: TStringField;
    qryClienteLocalCPF_EMPRESA: TStringField;
    qryClienteLocalEND_UF: TStringField;
    qryClienteLocalEND_CIDADE: TStringField;
    qryClienteLocalIN_ORGAO_PUBLICO: TStringField;
    qryUnidade: TADOQuery;
    qryUnidadeCD_UNID_NEG: TStringField;
    qryUnidadeNM_UNID_NEG: TStringField;
    qryUnidadeAP_UNID_NEG: TStringField;
    qryUnidadeCGC_UNID_NEG: TStringField;
    qryUnidadeEND_UNID_NEG: TStringField;
    qryUnidadeEND_NUMERO: TStringField;
    qryUnidadeEND_COMPL: TStringField;
    qryUnidadeEND_BAIRRO: TStringField;
    qryUnidadeEND_CIDADE: TStringField;
    qryUnidadeEND_UF: TStringField;
    qryUnidadeseniorKey: TWideStringField;
    qryCustomerProfile: TADOQuery;
    qryCustomerProfiledescricao: TWideStringField;
    qryCustomerProfilesendToBank: TBooleanField;
    qryCustomerProfilewithCashRequest: TBooleanField;
    qryCustomerProfilecostCenter: TStringField;
    qryCustomerProfileconsolidatedBilling: TBooleanField;
    qryCustomerProfileconsolidatedInvoice: TBooleanField;
    qryCustomerProfileloadDITax: TBooleanField;
    qryFaturasHoje: TADOQuery;
    qryFaturasHojeakey: TWideStringField;
    qryFaturasHojecreated: TDateTimeField;
    qryFaturasHojedueDate: TDateTimeField;
    qryFaturasHojeinvoiceReceiverType: TStringField;
    qryFaturasHojeir: TBCDField;
    qryFaturasHojeseniorDateNFE: TDateTimeField;
    qryFaturasHojeseniorKey: TWideStringField;
    qryFaturasHojestatus: TWideStringField;
    qryFaturasHojetotal: TBCDField;
    qryFaturasHojetype: TWideStringField;
    qryFaturasHojevalorTibutavel: TBCDField;
    DataSetProvider1: TDataSetProvider;
    qryItensFaturaContaFinanceiraExp: TWideStringField;
    qryCustomerProfilelimitValue: TBCDField;
    cdsFaturaReceitasContaFinanceiraImp: TWideStringField;
    cdsFaturaReceitasContaFinanceiraExp: TWideStringField;
    cdsFaturaPagamentosContaFinanceiraImp: TWideStringField;
    cdsFaturaPagamentosContaFinanceiraExp: TWideStringField;
    cdsItensFaturaContaFinanceiraImp: TWideStringField;
    cdsItensFaturaContaFinanceiraExp: TWideStringField;
    cdsFaturaNumerarios: TClientDataSet;
    cdsFaturaNumerariosTipo: TStringField;
    cdsFaturaNumerariosdestino: TWideStringField;
    cdsFaturaNumerariosprice: TBCDField;
    cdsFaturaNumerariosaKey: TWideStringField;
    cdsFaturaNumerariosname: TWideStringField;
    cdsFaturaNumerariosseniorKey: TWideStringField;
    cdsFaturaNumerariostype: TStringField;
    cdsFaturaNumerariosContaFinanceiraImp: TWideStringField;
    cdsFaturaNumerariosContaFinanceiraExp: TWideStringField;
    qryFaturacofins: TBCDField;
    qryFaturasHojecofins: TBCDField;
    qryItensFaturadestino: TIntegerField;
    qryNumerario: TADOQuery;
    qryNumerarioTipo: TStringField;
    qryNumerarioprice: TFMTBCDField;
    qryClienteV2ID: TLargeintField;
    qryClienteV2CP_ID: TLargeintField;
    qryUnidadeid: TLargeintField;
    qryCustomerProfilecps_id: TLargeintField;
    qryCustomerProfileid: TLargeintField;
    qryCustomerProfileproduct_id: TLargeintField;
    qryFaturaid: TLargeintField;
    qryFaturabranch_id: TLargeintField;
    qryFaturauser_id: TLargeintField;
    qryFaturacustomClearance_id: TLargeintField;
    qryFaturasHojeid: TLargeintField;
    qryFaturasHojebranch_id: TLargeintField;
    qryFaturasHojeuser_id: TLargeintField;
    qryFaturasHojecustomClearance_id: TLargeintField;
    qryItensFaturaBilling_id: TLargeintField;
    qryItensFaturaContaFinanceiraImp: TWideStringField;
    cdsFaturaNumerariosid: TBCDField;
    cdsFaturaNumerariositem_id: TBCDField;
    cdsFaturaNumerariosBilling_id: TBCDField;
    cdsFaturaPagamentosBilling_id: TBCDField;
    cdsFaturaPagamentosid: TBCDField;
    cdsFaturaPagamentositem_id: TBCDField;
    cdsFaturaReceitasBilling_id: TBCDField;
    cdsFaturaReceitasid: TBCDField;
    cdsFaturaReceitasitem_id: TBCDField;
    cdsItensFaturaBilling_id: TBCDField;
    cdsItensFaturaid: TBCDField;
    cdsItensFaturaitem_id: TBCDField;
    qryFaturacustomer_id: TLargeintField;
    qryCustomerProfileCustomerGroup_id: TLargeintField;
    qryClienteV2UF: TStringField;
    qryAtualizarTitulosProcessos: TADOQuery;
    qryAtualizarTitulosProcessosBilling_id: TLargeintField;
    qryAtualizarTitulosProcessosTipo: TStringField;
    qryAtualizarTitulosProcessospaymentTotal: TBCDField;
    qryAtualizarTitulosProcessosseniorKeyPayment: TWideStringField;
    qryAtualizarTitulosProcessoscustomClearance_id: TLargeintField;
    qryAtualizarTitulosProcessosSeniorKeyInvoice: TWideStringField;
    qryReferencia: TADOQuery;
    qryReferenciaNM_REFERENCIA: TWideStringField;
    qryFaturasHojecustomer_id: TLargeintField;
    qryFaturasHojeirRetained: TBooleanField;
    qryFaturasHojeirtotaldia: TFMTBCDField;
    qryFaturaiss: TBCDField;
    qryCalculaIR: TADOQuery;
    HTTPRIO1: THTTPRIO;
    qryNumerarioBaixarPSR: TADOQuery;
    qryNumerarioBaixarPSRSeniorKey: TWideStringField;
    qryUnidadeProcesso: TADOQuery;
    qryUnidadeProcessoCD_UNID_NEG: TStringField;
    qryUnidadeProcessoNM_UNID_NEG: TStringField;
    qryUnidadeProcessoAP_UNID_NEG: TStringField;
    qryUnidadeProcessoCGC_UNID_NEG: TStringField;
    qryUnidadeProcessoEND_UNID_NEG: TStringField;
    qryUnidadeProcessoEND_NUMERO: TStringField;
    qryUnidadeProcessoEND_COMPL: TStringField;
    qryUnidadeProcessoEND_BAIRRO: TStringField;
    qryUnidadeProcessoEND_CIDADE: TStringField;
    qryUnidadeProcessoEND_UF: TStringField;
    qryUnidadeProcessoID: TLargeintField;
    qryUnidadeProcessoSENIORKEY: TWideStringField;
    procedure qryItensFaturaAfterOpen(DataSet: TDataSet);
    procedure HTTPRIO1HTTPWebNode1BeforePost(const HTTPReqResp: THTTPReqResp;
      Data: Pointer);
    procedure HTTPRIO1BeforeExecute(const MethodName: string;
      SOAPRequest: TStream);
  private
    FMensagemErro: String;
    function EnviarDadosNota(AUsuario, ASenha: String; ANota, ASistema, ATipoEnvio: Integer; Grupo: string): String;
  public
    ValorIR,ValorCofins,ValorTotalcofins,ValorTotalIR: Double;
    function ValidaSistema(ASistema: Integer): Boolean;
    function ValidaTipo(ATipo: Integer): Boolean;
    function EnviarNota(AUsuario, ASenha: string; ANota, ASistema: Integer; Grupo: string): string;
    function CancelarNota(AUsuario, ASenha: string; ANota, ASistema: Integer; Grupo: string): string;
    function AtualizarTitulosProcessos(CodCli, CodEmp, CodFil, Sistema,ANota: Integer;AUsuario, ASenha:string): string;
    function BaixaPsrCrp(CodCli, CodEmp, CodFil, Sistema, ANota: Integer; AUsuario, ASenha: string): string;
    property MensagemErro: string read FMensagemErro;
  end;

var
  dtmEnvioERP: TdtmEnvioERP;

implementation

{$R *.dfm}

uses
  DadosFaturamentoERP, Funcoes, Sapiens_NotaFiscal, Global;

{ TdtmEnvioERP }


function TdtmEnvioERP.AtualizarTitulosProcessos(CodCli, CodEmp, CodFil, Sistema,ANota: Integer;AUsuario, ASenha:string): string;
var
  XML: TStringList;
  NotaOut: notafiscalAtualizarTitulosProcessosOut;
  Retorno: notafiscalAtualizarTitulosProcessosOutRetornosTitulos;
  NotaIn: notafiscalAtualizarTitulosProcessosIn;
  ListaTitulos:Array_Of_notafiscalAtualizarTitulosProcessosInTitulosCP;
  Titulos:notafiscalAtualizarTitulosProcessosInTitulosCP;
  //Titulos: Array_Of_notafiscalAtualizarTitulosProcessosInTitulosCP;
  I,NumNfv:integer;
  codSnf:string;
  Conexao : sapiens_Synccom_senior_g5_co_mcm_ven_notafiscal;
begin
  NotaIn := notafiscalAtualizarTitulosProcessosIn.Create;
  try
   if qryAtualizarTitulosProcessos.Active then
      qryAtualizarTitulosProcessos.Close;

    qryAtualizarTitulosProcessos.Parameters.ParamValues['idFatura'] := ANota;
    qryAtualizarTitulosProcessos.Open;


    if qryAtualizarTitulosProcessosSeniorKeyInvoice.AsString=''  then
    begin
     NumNfv:=qryAtualizarTitulosProcessosBilling_id.AsInteger;
     codSnf:='PRV';
    end
    else
    Begin
     NumNfv:=qryAtualizarTitulosProcessosSeniorKeyInvoice.AsInteger;
     codSnf:='FT';
    End;


    NotaIn.tipPro := 1; // 1-Marcação, 2-Desmarcação
    NotaIn.codEmp := codEmp;
    NotaIn.codFil := codFil;
    NotaIn.codSnf := codSnf;
    NotaIn.numNfv := numNfv;
    NotaIn.codCli := CodCli;

    SetLength(ListaTitulos, qryAtualizarTitulosProcessos.RecordCount);
    //ListaTitulos[0]:=Titulos;
    //Servicos.rateio := ListaRateios;
    I := 0;
    while not qryAtualizarTitulosProcessos.Eof do
    begin
      Titulos := notafiscalAtualizarTitulosProcessosInTitulosCP.Create;
      Titulos.codTpt := 'CPP';
      Titulos.numTit := qryAtualizarTitulosProcessosseniorKeyPayment.AsString;
      ListaTitulos [I] := Titulos;
      qryAtualizarTitulosProcessos.Next;
      Inc(I);
    end;

    NotaIn.titulosCP := ListaTitulos;

    XML := TStringList.Create;
    XML.Add('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ser="http://services.senior.com.br">');
    XML.Add(' <soapenv:Body>');
    XML.Add('      <ser:AtualizarTitulosProcessos>');
    XML.Add('           <user> '+ AUsuario + '</user>');
    XML.Add('           <password>' + ASenha + '</password>');
    XML.Add('           <encryption>0</encryption>');
    XML.Add('           <parameters>');
    XML.Add('                <tipPro>'+ inttostr(NotaIn.tipPro) +'</tipPro>');
    XML.Add('                <codEmp>'+ inttostr(NotaIn.codEmp) +'</codEmp>');
    XML.Add('                <codFil>'+ inttostr(NotaIn.codFil) +'</codFil>');
    XML.Add('                <codSnf>'+ NotaIn.codSnf +'</codSnf>');
    XML.Add('                <numNfv>'+ inttostr(NotaIn.numNfv) +'</numNfv>');
    XML.Add('                <codCli>'+ inttostr(NotaIn.codCli) +'</codCli>');
    for I := 0 to High(ListaTitulos) do
    begin
      XML.Add('                <titulosCP>');
      XML.Add('                     <numTit>'+ ListaTitulos[i].numTit +'</numTit>');
      XML.Add('                     <codTpt>'+ ListaTitulos[i].codTpt +'</codTpt>');
      XML.Add('                </titulosCP>');
    end;
    XML.Add('            </parameters>');
    XML.Add('       </ser:AtualizarTitulosProcessos>');
    XML.Add(' </soapenv:Body>');
    XML.Add('</soapenv:Envelope> ');
    if not DirectoryExists(Path + 'XML\') then
      ForceDirectories(Path + 'XML\');
    XML.SaveToFile(Path + 'XML\AtualizarTitulosProcessos' + '_' + Global.Parametros.Processo + '.xml');
    //me mostra o erro ocorrendo
    if Sistema = _Homologacao then
      NotaOut := Getsapiens_Synccom_senior_g5_co_mcm_ven_notafiscalHomo.AtualizarTitulosProcessos('UserWS', 'UserWsIndaia', 0, NotaIn)
    else
    begin
      Conexao := Getsapiens_Synccom_senior_g5_co_mcm_ven_notafiscalProd(false, '', HTTPRIO1);
      NotaOut := Conexao.AtualizarTitulosProcessos('UserWS', 'UserWsIndaia', 0, NotaIn);
    end;

    if dtmFaturamentoERP.qryFaturas.State <> dsEdit then
      dtmFaturamentoERP.qryFaturas.Edit;

    dtmFaturamentoERP.qryFaturasstatus.AsString := _NotaFiscal_Faturada;

    dtmFaturamentoERP.qryFaturas.Post;

  finally
    FreeAndNil(XML);
    FreeAndNil(NotaIn);
  end;
end;


function TdtmEnvioERP.BaixaPsrCrp(CodCli, CodEmp, CodFil, Sistema, ANota: Integer;AUsuario, ASenha:string): string;
var
  XML: TStringList;
  BaixaPsrCrpOut: notafiscalBaixaPsrCrpOut;
  Retorno: notafiscalBaixaPsrCrpOutRetorno;
  BaixaPsrCrpIn: notafiscalBaixaPsrCrpIn;
  CRPS: Array_Of_notafiscalBaixaPsrCrpInCRP;
  CRP:notafiscalBaixaPsrCrpInCRP;
  PSRS: Array_Of_notafiscalBaixaPsrCrpInPSR;
  PSR: notafiscalBaixaPsrCrpInPSR;
  I, C, NumNfv:integer;
  codSnf:string;
  Conexao : sapiens_Synccom_senior_g5_co_mcm_ven_notafiscal;
begin
  BaixaPsrCrpIn := notafiscalBaixaPsrCrpIn.Create;
  try
   if qryAtualizarTitulosProcessos.Active then
      qryAtualizarTitulosProcessos.Close;
   if qryNumerarioBaixarPSR.Active then
      qryNumerarioBaixarPSR.Close;

    qryAtualizarTitulosProcessos.Parameters.ParamValues['idFatura'] := ANota;
    qryAtualizarTitulosProcessos.Open;

    if qryAtualizarTitulosProcessos.RecordCount = 0  then
      exit;

    qryNumerarioBaixarPSR.Parameters.ParamValues['idFatura'] := ANota;
    qryNumerarioBaixarPSR.Open;

    SetLength(CRPS, qryAtualizarTitulosProcessos.RecordCount);

    I := 0;
    while not qryAtualizarTitulosProcessos.Eof do
    begin
      CRP := notafiscalBaixaPsrCrpInCRP.Create;
      CRP.codEmp := codEmp;
      CRP.codFil := codFil;
      CRP.numTit := qryAtualizarTitulosProcessosseniorKeyPayment.AsString;
      CRP.codTpt := 'CRP';
      CRPS[I] := CRP;
      qryAtualizarTitulosProcessos.Next;
      Inc(I);
    end;

    SetLength(PSRS, qryNumerarioBaixarPSR.RecordCount);
    C := 0;
    while not qryNumerarioBaixarPSR.Eof do
    begin
      PSR := notafiscalBaixaPsrCrpInPSR.Create;
      PSR.codEmp := codEmp;
      PSR.codFil := codFil;
      PSR.numTit := qryNumerarioBaixarPSRSeniorKey.AsString;
      PSR.codTpt := 'PSR';
      PSRS[C] := PSR;
      qryNumerarioBaixarPSR.Next;
      Inc(C);
    end;

    BaixaPsrCrpIn.CRP := CRPS;
    BaixaPsrCrpIn.PSR := PSRS;

    try
      XML := TStringList.Create;
      XML.Add('        <?xml version="1.0" encoding="ISO-8859-1"?>');
      XML.Add('        <request port="BaixaPsrCrp" service="com.senior.g5.co.mcm.ven.notafiscal" encrypted="0" password="UserWsIndaia" user="UserWS" id="">');
      XML.Add('           <params>');
      XML.Add('              <prCallMode>1</prCallMode>');
      XML.Add('              <FlowName/>');
      XML.Add('              <FlowInstanceID/>');
      XML.Add('              <CRP>');
        for I := 0 to High(CRPS) do
        begin
          XML.Add('                <line>');
          XML.Add('                     <codEmp>'+ inttostr(CRPS[i].codEmp) +'</codEmp>');
          XML.Add('                     <codFil>'+ inttostr(CRPS[i].codFil) +'</codFil>');
          XML.Add('                     <numTit>'+ CRPS[i].numTit +'</numTit>');
          XML.Add('                     <codTpt>'+ CRPS[i].codTpt +'</codTpt>');
          XML.Add('                     <numPrc isnull="'+ CRPS[i].numPrc +'"/>');
          XML.Add('                </line>');
        end;
      XML.Add('              </CRP>');
      XML.Add('              <PSR>');
        for C := 0 to High(PSRS) do
        begin
          XML.Add('                <line>');
          XML.Add('                     <codEmp>'+ inttostr(PSRS[C].codEmp) +'</codEmp>');
          XML.Add('                     <codFil>'+ inttostr(PSRS[C].codFil) +'</codFil>');
          XML.Add('                     <numTit>'+ PSRS[C].numTit +'</numTit>');
          XML.Add('                     <codTpt>'+ PSRS[C].codTpt +'</codTpt>');
          XML.Add('                     <numPrc isnull="'+ PSRS[C].numPrc +'"/>');
          XML.Add('                </line>');
        end;
      XML.Add('              </PSR>');

      XML.Add('            </params>');
      XML.Add('       </request>');

      if not DirectoryExists(Path + 'XML\') then
        ForceDirectories(Path + 'XML\');
      XML.SaveToFile(Path + 'XML\BaixaPsrCrp' + '_' + Global.Parametros.Processo + '.xml');

      if Sistema = _Homologacao then
      begin
        Conexao := Getsapiens_Synccom_senior_g5_co_mcm_ven_notafiscalHomo(false, '', HTTPRIO1);
        BaixaPsrCrpOut := Conexao.BaixaPsrCrp('UserWS', 'UserWsIndaia', 0, BaixaPsrCrpIn);
      end
      else
      begin
        Conexao := Getsapiens_Synccom_senior_g5_co_mcm_ven_notafiscalProd(false, '', HTTPRIO1);
        BaixaPsrCrpOut := Conexao.BaixaPsrCrp('UserWS', 'UserWsIndaia', 0, BaixaPsrCrpIn);
      end;

      if BaixaPsrCrpOut.erroExecucao <> '' then
        result := 'Ocorreu um erro na integração para a Baixa de PsrCrp: ' + BaixaPsrCrpOut.erroExecucao
      else
        result := 'Retorno Baixa de PsrCrp: ' + BaixaPsrCrpOut.retorno[0].mensagem;

      //      begin
//        for I := 0 to High(BaixaPsrCrpOut.retorno) do
//        begin
//          Retorno := BaixaPsrCrpOut.retorno[I];
//          ShowMessage(Retorno.mensagem + ' - Tipo: ' +
//                      IntToStr(Retorno.tipo) );
//        end;
//      end;

    finally
      FreeAndNil(XML);
    end;

  finally
    FreeAndNil(BaixaPsrCrpIn);
  end;
end;

function TdtmEnvioERP.EnviarDadosNota(AUsuario, ASenha: String; ANota, ASistema, ATipoEnvio: Integer; Grupo: string): String;
var
  NotaIn: notafiscalGravarNotasFiscaisSaida2In;
  ListaDadosGerais: Array_Of_notafiscalGravarNotasFiscaisSaida2InDadosGerais;
  DadosGerais: notafiscalGravarNotasFiscaisSaida2InDadosGerais;
  ListaCamposUsuario: Array_Of_notafiscalGravarNotasFiscaisSaida2InDadosGeraisCamposUsuario;
  CamposUsuario: notafiscalGravarNotasFiscaisSaida2InDadosGeraisCamposUsuario;
  ListaParcelas: Array_Of_notafiscalGravarNotasFiscaisSaida2InDadosGeraisParcelas;
  Parcelas: notafiscalGravarNotasFiscaisSaida2InDadosGeraisParcelas;
  ListaServicos: Array_Of_notafiscalGravarNotasFiscaisSaida2InDadosGeraisServicos;
  Servicos: notafiscalGravarNotasFiscaisSaida2InDadosGeraisServicos;
  ListaRateios: Array_Of_notafiscalGravarNotasFiscaisSaida2InDadosGeraisServicosRateio;
  Rateio: notafiscalGravarNotasFiscaisSaida2InDadosGeraisServicosRateio;
  NotaOut: notafiscalGravarNotasFiscaisSaida2Out;
  Processo, TipoNota, TipoOperacao,Cliente,Incoterm,IncotermSalvo,FaturaContra: String;
  OrgaoPublico: Boolean;
  Sequencial: Integer;
  ValorNotasAnterires, ValorParcela, ValorRateio, Crt, Csl, Ins, Iss, Pit, CrtTotal, CslTotal, InsTotal, IrfTotal, IssTotal, PitTotal: Currency;
  perCrt, perCsl, perIns, perIrf, perIss, perPit,BaseCalculoIR,vlrBir,vlrIrf,VlrNumerario,ValorIrDia: Double;
  Decimal: Char;
  IRRetido: Boolean;

  Conexao : sapiens_Synccom_senior_g5_co_mcm_ven_notafiscal;

  function GrupoSeb: Boolean;
  begin
    Result := (Grupo = 'C27');
  end;

  function GrupoCj: Boolean;
  begin
    Result := (Grupo = 'C81');
  end;

  function GrupoCjBr: Boolean;
  begin
    Result := (Grupo = 'C93');
  end;

  function GrupoBasf: Boolean;
  begin
    Result := (Grupo = '002') or (Grupo = '013') or (Grupo = 'D28');
  end;

  function GrupoAvlisHaws: Boolean;
  begin
    Result := grupo = 'B45';
  end;

  function GrupoINB: Boolean;
  begin
    Result := grupo = '154';
  end;

  function GrupoTATE: Boolean;
  begin
    Result := grupo = 'C10';
  end;

  function GrupoAAK: Boolean;
  begin
    Result := grupo = 'D12';
  end;

  function GrupoEmbraco: Boolean;
  begin
    Result := grupo = 'A88';
  end;

  function GrupoFesto: Boolean;
  begin
    Result := (Grupo = 'B35');
  end;

  function GrupoPirelli: Boolean;
  begin
    Result := (Grupo = 'C22');
  end;

  function GrupoFoseco: Boolean;
  begin
    Result := (Grupo = '653');
  end;

  function GrupoAirProducts: Boolean;
  begin
    Result := (Grupo = '895');
  end;

  function GrupoChemetall: Boolean;
  begin
    Result := (Grupo = '559');
  end;

  function GrupoSaintGobainAbrasivos: Boolean;
  begin
    Result := (Grupo = '028');
  end;

  function GrupoMetalfrio: Boolean;
  begin
    Result := (Grupo = '069');
  end;

  function GrupoFigwall: Boolean;
  begin
    Result := (Grupo = '479');
  end;

  function GrupoFirmenich: Boolean;
  begin
    Result := (Grupo = '118');
  end;

  function GrupoPrometeon: Boolean;
  begin
    Result := (Grupo = 'C11');
  end;

  function GrupoYara: Boolean;
  begin
    Result := (Grupo = 'C05');
  end;

  function GrupoStyropek: Boolean;
  begin
    Result := (Grupo = 'C63');
  end;

  function GrupoGarret: Boolean;
  begin
    Result := (Grupo = 'C29');
  end;

  function GrupoValgroupBA: Boolean;
  begin
    Result := (Grupo = 'C82');
  end;

  function GrupoValgroupMG: Boolean;
  begin
    Result := (Grupo = 'C83');
  end;

  function GrupoMBS: Boolean;
  begin
    Result := (Grupo = 'C33');
  end;


  function GrupoCaldic: Boolean;
  begin
    Result := (Grupo = 'D03');
  end;

  function ArredondaPorDecimal(valor:Real;casasDecimais:integer):Real;
  var
  Fator, Fracao: Extended;
  begin
   Fator:= IntPower(10, casasDecimais);
   valor:= StrToFloat(FloatToStr(valor* Fator));
   Result := Int(valor);
   Fracao:= Frac(valor);
   if Fracao >= 0.05 then
     Result := Result + 1
   else if Fracao <= -0.05 then
     Result := Result - 1;
   Result := Result / Fator;
  end;

  function RoundOf(const Value: Extended; Decimal: Byte = 2): Double;
  var
    s: string;
    e: Integer;
  begin
    Str(Value:18:Decimal, s);
    try
      Val(s, Result, e);
    except
      Result := 0;
    end;
  end;

  function ValorLiquido(AValor: Double): Double;
  var
    Ir: Currency;
  begin
    Result := cdsItensFaturaprice.AsFloat;

    //perCrt := StrToFloat(Servicos.perCrt);
    //perCsl := StrToFloat(Servicos.perCsl);
    //perIns := StrToFloat(Servicos.perIns);
    //perIrf := StrToFloat(Servicos.perIrf);
    //perIss := StrToFloat(Servicos.perIss);
    //perPit := StrToFloat(Servicos.perPit);

    perCrt := 0.00;
    perCsl := 0.00;
    perIns := 0.00;
    perIrf := 0.00;
    perIss := 0.00;
    perPit := 0.00;

    if SameText(TipoNota, _ERP_NFS) and (qryClienteV2type.AsString = 'JURIDICA') then
    begin
      // COFINS                : 4,65%
      // IR - ORGÃO PUBLICO    : 4,80%
      //    - ORGÃO NÃO PUBLICO: 1,50%
        perIrf := IfThen(OrgaoPublico, 4.80, 1.50);

      {if qryFaturatotal.AsFloat >= _BaseCofins then
      begin
        perCrt := 3.00;
        perPit := 0.65;
      end;
      }
      perCrt := 3.00;
      perPit := 0.65;
      perCsl := 1.00;
      perIns := 0.00;
      perIss := dtmFaturamentoERP.qryFaturasPercISS.AsFloat;
      //perIss := 3.00; //Varia de acordo com o serviço e com o municípior que está sendo pestado o servidço (2 a 5)
    end;

    Servicos.perIrf := FormatFloat('0.00', perIrf);   // Percential do IRRF do Serviço da Nota Fiscal de Saída, não informar para nota de débito
    Servicos.perCrt := FormatFloat('0.00', perCrt);   // Percentual de Cofins Retido, não informar para nota de débito
    Servicos.perPit := FormatFloat('0.00', perPit);   // Percentual do PIS retido, não informar para nota de débito
    Servicos.perCsl := FormatFloat('0.00', perCsl);   // Percentual de CSLL Retido, não informar para nota de débito
    Servicos.perIns := FormatFloat('0.00', perIns);   // Percentual do INSS, não informar para nota de débito
    Servicos.perIss := FormatFloat('0.00', perIss);   // Percentual do ISS do Serviço da Nota Fiscal de Saída, não informar para nota de débito
    Servicos.perOur := '';                            // Percentual de outros impostos - Sempre em branco

    Crt := 0;
    Csl := 0;
    Ins := 0;
    Iss := 0;
    Pit := 0;
    Ir  := 0;


    if SameText(TipoNota, _ERP_NFS) and (qryClienteV2type.AsString = 'JURIDICA') then
    begin
       BaseCalculoIR := qryFaturatotal.AsFloat;
     //  ValorIR       := BaseCalculoIR * (perIrf / 100);
     //   ValorIR       := RoundTo(ValorIR, -2);
     //   ValorIR := RoundTo(BaseCalculoIR * (perIrf / 100),-2);

      //arredondando no banco, porque o arredondamento do delphi é diferente do arredondamento do SQL.
      qryCalculaIR.Close;
      qryCalculaIR.Parameters.ParamByName('VALOR_IR').Value :=qryFaturatotal.AsFloat;
      qryCalculaIR.Open;

      ValorIR := qryCalculaIR.FieldByName('VL_IR').AsFloat;
      qryCalculaIR.Close;

      if GrupoBasf or
         GrupoINB or
         GrupoTATE or
         GrupoAAK or
         GrupoAvlisHaws or
         GrupoEmbraco or
         GrupoFesto or
         GrupoFoseco or
         GrupoAirProducts or
         GrupoPirelli or
         GrupoChemetall or
         GrupoSaintGobainAbrasivos or
         GrupoMetalfrio or
         GrupoFigwall or
         GrupoFirmenich or
         GrupoPrometeon or
         GrupoYara or
         GrupoStyropek or
         GrupoGarret or
         GrupoValgroupBA or
         GrupoValgroupMG or
         GrupoMBS or
         GrupoCaldic or
         GrupoSeb or
         GrupoCj   or
         GrupoCjBr
         then
        IRRetido := True
      else
      begin
        if ValorIR >= 10.00 then
          IRRetido := True
        else
        begin
          ValorIR  := 0;
          IRRetido := False;
        end;
      end;

      Ir := cdsItensFaturaprice.AsFloat * (perIrf / 100);
      Ir := RoundOf(Ir);

      if Copy(TipoOperacao, 5, 1) = 'R' then
      begin
        Iss := cdsItensFaturaprice.AsFloat * (perIss / 100);
        Iss := RoundOf(Iss);
      end;

      Crt := (cdsItensFaturaprice.AsFloat * (perCrt / 100)); // COFINS
      Crt := RoundOf(Crt);

      Pit := (cdsItensFaturaprice.AsFloat * (perPit / 100)); // PIS
      Pit := RoundOf(Pit);

      Csl := (cdsItensFaturaprice.AsFloat * (perCsl / 100));
      Csl := RoundOf(Csl);

      Ins := (cdsItensFaturaprice.AsFloat * (perIns / 100));
      Ins := RoundOf(Ins);
    end;

    ValorCofins := Crt + Csl + Ins +  Iss + Pit;
    Servicos.vlrIrf := '0.00';

    Result := Result - Crt - Csl - Ins - Ir - Iss - Pit;

    CrtTotal := CrtTotal + Crt;
    CslTotal := CslTotal + Csl;
    InsTotal := InsTotal + Ins;

    if ValorIR > 0 then
      IrfTotal :=  ValorIR;

    IssTotal := IssTotal + Iss;
    PitTotal := PitTotal + Pit;
  end;

  procedure SalvaXML;
  var
    XML: TStringList;
    I: Integer;
  begin
    XML := TStringList.Create;
    try
      XML.Add('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ser="http://services.senior.com.br">');
      XML.Add('  <soapenv:Header/>');
      XML.Add('  <soapenv:Body>');
      XML.Add('    <ser:GravarNotasFiscaisSaida_2>');
      XML.Add('      <user>' + AUsuario + '</user>');
      XML.Add('      <password>' + ASenha + '</password>');
      XML.Add('      <encryption>0</encryption>');
      XML.Add('      <parameters>');
      XML.Add('        <dadosGerais>');
      XML.Add('          <camposUsuario>');
      XML.Add('            <cmpUsu>' + CamposUsuario.cmpUsu + '</cmpUsu>');
      XML.Add('            <vlrUsu>' + CamposUsuario.vlrUsu + '</vlrUsu>');
      XML.Add('          </camposUsuario>');
      XML.Add('          <numNfv>' + DadosGerais.numNfv + '</numNfv>');
      XML.Add('          <codCli>' + DadosGerais.codCli + '</codCli>');
      XML.Add('          <codCpg>' + DadosGerais.codCpg + '</codCpg>');
      XML.Add('          <codEdc>' + DadosGerais.codEdc + '</codEdc>');
      XML.Add('          <codEmp>' + IntToStr(DadosGerais.codEmp) + '</codEmp>');
      XML.Add('          <codFil>' + IntToStr(DadosGerais.codFil) + '</codFil>');
      XML.Add('          <codSnf>' + DadosGerais.codSnf + '</codSnf>');
      XML.Add('          <datEmi>' + DadosGerais.datEmi + '</datEmi>');
      XML.Add('          <datSai>' + DadosGerais.datSai + '</datSai>');
      XML.Add('          <obsNfv>' + DadosGerais.obsNfv + '</obsNfv>');
      //XML.Add('          <vlrBir>'  + DadosGerais.vlrBir +  '</vlrBir>');
      XML.Add('          <parcelas>');
      XML.Add('            <numPar>' + IntToStr(Parcelas.numPar) + '</numPar>');
      XML.Add('            <vctPar>' + Parcelas.vctPar + '</vctPar>');
      XML.Add('            <vlrPar>' + Parcelas.vlrPar + '</vlrPar>');
      XML.Add('          </parcelas>');
      //XML.Add('          <vlrFin>' + DadosGerais.vlrFin + '</vlrFin>');
      //XML.Add('          <vlrliq>' + DadosGerais.vlrliq + '</vlrliq>');

      for I := 0 to High(DadosGerais.servicos) do
      begin
        XML.Add('          <servicos>');
        XML.Add('            <codSer>' + DadosGerais.servicos[I].codSer + '</codSer>');
        XML.Add('            <obsIsv>' + DadosGerais.servicos[I].obsIsv+'</obsIsv>');
        XML.Add('            <perCrt>' + DadosGerais.servicos[I].perCrt + '</perCrt>');
        XML.Add('            <perCsl>' + DadosGerais.servicos[I].perCsl + '</perCsl>');
        XML.Add('            <perIns>' + DadosGerais.servicos[I].perIns + '</perIns>');
        XML.Add('            <perIrf>' + DadosGerais.servicos[I].perIrf + '</perIrf>');
        XML.Add('            <vlrIrf>' + DadosGerais.servicos[I].vlrIrf + '</vlrIrf>');
        XML.Add('            <perIss>' + DadosGerais.servicos[I].perIss + '</perIss>');
        XML.Add('            <perPit>' + DadosGerais.servicos[I].perPit + '</perPit>');
        XML.Add('            <perOur>' + DadosGerais.servicos[I].perOur + '</perOur>');
        XML.Add('            <preUni>' + DadosGerais.servicos[I].preUni + '</preUni>');
        XML.Add('            <qtdFat>' + DadosGerais.servicos[I].qtdFat + '</qtdFat>');
        XML.Add('            <rateio>');
        XML.Add('              <perCta>' + DadosGerais.servicos[I].rateio[0].perCta + '</perCta>');
        XML.Add('              <codCcu>' + DadosGerais.servicos[I].rateio[0].codCcu + '</codCcu>');
        XML.Add('              <ctaFin>' + IntToStr(DadosGerais.servicos[I].rateio[0].ctaFin) + '</ctaFin>');
        XML.Add('              <vlrCta>' + DadosGerais.servicos[I].rateio[0].vlrCta + '</vlrCta>');
        XML.Add('              <perRat>' + DadosGerais.servicos[I].rateio[0].perRat + '</perRat>');
        XML.Add('              <vlrRat>' + DadosGerais.servicos[I].rateio[0].vlrRat + '</vlrRat>');
        XML.Add('            </rateio>');
        XML.Add('            <seqIsv>' + IntToStr(DadosGerais.servicos[I].seqIsv) + '</seqIsv>');
        XML.Add('            <tnsSer>' + DadosGerais.servicos[I].tnsSer + '</tnsSer>');
        XML.Add('          </servicos>');
      end;
      XML.Add('          <tipNfs>' + IntToStr(DadosGerais.tipNfs) + '</tipNfs>');
      XML.Add('          <tnsSer>' + DadosGerais.tnsSer + '</tnsSer>');
      XML.Add('        </dadosGerais>');
      XML.Add('        <fecNot>' + NotaIn.fecNot + '</fecNot>');
      XML.Add('        <gerPar>' + IntToStr(NotaIn.gerPar) + '</gerPar>');
      XML.Add('        <gerarDocumentoEletronico>' + NotaIn.gerarDocumentoEletronico + '</gerarDocumentoEletronico>');
      XML.Add('        <prcNfv>' + NotaIn.prcNfv + '</prcNfv>');
      XML.Add('        <tipCal>' + IntToStr(NotaIn.tipCal) + '</tipCal>');
      XML.Add('        <tipoProcessamento>' + IntToStr(NotaIn.tipoProcessamento) + '</tipoProcessamento>');
      XML.Add('      </parameters>');
      XML.Add('    </ser:GravarNotasFiscaisSaida_2>');
      XML.Add('  </soapenv:Body>');
      XML.Add('</soapenv:Envelope>');
      if not DirectoryExists(Path + 'XML\') then
        ForceDirectories(Path + 'XML\');
      //XML.SaveToFile(Path + 'XML\' + Processo + '_' + IntToStr(ANota) + '.xml');
      if ATipoEnvio = _Cancelar then
        XML.SaveToFile(Path + 'XML\' + 'FaturaCancelada_' + IntToStr(ANota) + '.xml')
      else
        XML.SaveToFile(Path + 'XML\' + 'Fatura_' + IntToStr(ANota) + '.xml');
      finally
      FreeAndNil(XML);
    end;
  end;
begin
  Result := '';
  ValorTotalIR:=0;
  if not (ValidaSistema(ASistema) and ValidaTipo(ATipoEnvio)) then
    Exit;

  try
    if qryFatura.Active then
      qryFatura.Close;
    qryFatura.Parameters.ParamValues['idFatura'] := ANota;
    qryFatura.Open;

    if qryReferencia.Active then
          qryReferencia.Close;
    qryReferencia.Parameters.ParamValues['idFatura']:= ANota;//Parametros.Processoid;
    qryReferencia.Open;

    VlrNumerario := 0;
      if qryNumerario.Active then
      qryNumerario.Close;
    qryNumerario.Parameters.ParamValues['idFatura'] := ANota;
    qryNumerario.Open;

    VlrNumerario := qryNumerarioprice.AsFloat;

    while not qryFatura.eof do
    begin
      if Processo='' then
        Processo := Trim(qryFaturacustomID.AsString)
      else
        Processo := Processo +','+Trim(qryFaturacustomID.AsString);
      qryFatura.next;
    end;
    qryFatura.First;

    if Processo = '' then
    begin
      FMensagemErro := 'Processo ou Fatura não encontrado.';
      Exit;
    end;

    if ATipoEnvio <> _Cancelar then
    begin
      if qryItensFatura.Active then
        qryItensFatura.Close;
      qryItensFatura.Parameters.ParamValues['idFatura'] := ANota;
      qryItensFatura.Open;
    end;

    Decimal := FormatSettings.DecimalSeparator;
    if FormatSettings.DecimalSeparator <> ',' then
      FormatSettings.DecimalSeparator := ',';

    NotaIn := notafiscalGravarNotasFiscaisSaida2In.Create;
    try
      // Informar DEB (Nota de Débito) ou NSE (Nota Fiscal de Serviço Eletrônica)
      if SameText(Trim(qryFaturatype.AsString), _NotaFiscal_Servico) then
        TipoNota := _ERP_NFS
      else
        TipoNota := _ERP_NFD;

      DadosGerais := notafiscalGravarNotasFiscaisSaida2InDadosGerais.Create;
      SetLength(ListaDadosGerais, 1);
      ListaDadosGerais[0] := DadosGerais;
      NotaIn.dadosGerais := ListaDadosGerais;

      if qryFaturatype.AsString='TAX_INVOICE' then
      begin
        if ((formatdatetime('dd',strtodatetime(qryFaturacreated.AsString)) =  formatdatetime('dd',strtodatetime(DateToStr(now)))) and
           (formatdatetime('mm',strtodatetime(qryFaturacreated.AsString)) =  formatdatetime('mm',strtodatetime(DateToStr(now)))) and
           (formatdatetime('yy',strtodatetime(qryFaturacreated.AsString)) =  formatdatetime('yy',strtodatetime(DateToStr(now))))) or
           (strtodatetime(qryFaturacreated.AsString) > strtodatetime('01/03/2016')) then
          DadosGerais.codSnf := 'RPS'
        else
          DadosGerais.codSnf := 'NSE';
      end
      else
      begin
         if ((formatdatetime('dd',strtodatetime(qryFaturacreated.AsString)) =  formatdatetime('dd',strtodatetime(DateToStr(now)))) and
           (formatdatetime('mm',strtodatetime(qryFaturacreated.AsString)) =  formatdatetime('mm',strtodatetime(DateToStr(now)))) and
           (formatdatetime('yy',strtodatetime(qryFaturacreated.AsString)) =  formatdatetime('yy',strtodatetime(DateToStr(now)))))or
           (strtodatetime(qryFaturacreated.AsString) > strtodatetime('29/02/2016')) then
          DadosGerais.codSnf := 'FT'
        else
          DadosGerais.codSnf := 'DEB';
      end;                                                                                   // Informar DEB (Nota de Débito) ou NSE (Nota Fiscal de Serviço Eletrônica)

      DadosGerais.ideExt := '';
      DadosGerais.numNfv := qryFaturaseniorKey.AsString;
      CamposUsuario := notafiscalGravarNotasFiscaisSaida2InDadosGeraisCamposUsuario.Create;
      SetLength(ListaCamposUsuario, 1);
      ListaCamposUsuario[0] := CamposUsuario;
      DadosGerais.camposUsuario := ListaCamposUsuario;
      CamposUsuario.cmpUsu := 'USU_NUMPRC';
      CamposUsuario.vlrUsu := qryFaturacustomID.AsString;//Processo;


      SetLength(ListaParcelas, 0);
      DadosGerais.parcelas := ListaParcelas;
      SetLength(ListaServicos, 0);
      DadosGerais.servicos := ListaServicos;

      //if ATipoEnvio = _Incluir then
      begin
        if qryClienteLocal.Active then
          qryClienteLocal.Close;
        qryClienteLocal.Parameters.ParamValues['CD_CLIENTE'] := qryFaturaCD_CLIENTE.AsString;
        qryClienteLocal.Open;

        if qryUnidade.Active then
          qryUnidade.Close;
        qryUnidade.Parameters.ParamValues['ID_UNIDADE'] := qryFaturabranch_id.AsInteger;
        qryUnidade.Open;

        Incoterm := dtmFaturamentoERP.ConsultaSQL('select ISNULL(P.CD_INCOTERM,ISNULL(PE.CD_INCOTERM,'''')) CD_INCOTERM '+
                                                  '  FROM BROKER.DBO.TPROCESSO          P  (NOLOCK) ' +
                                                  '  LEFT JOIN BROKER.DBO.TPROCESSO_EXP PE (NOLOCK) ON PE.NR_PROCESSO = P.NR_PROCESSO '+
                                                  ' WHERE P.NR_PROCESSO = :CNPJAgente ', [Parametros.ProcessoCompleto], '');

        IncotermSalvo := dtmFaturamentoERP.ConsultaSQL(' select InvoiceReceiverType '+
                                                       '   from billing (nolock) '+
                                                       '  where id=:Nota', [dtmFaturamentoERP.qryFaturasid.AsInteger], '');


        if ATipoEnvio = _Incluir  then
        begin
           if (Incoterm = 'EXW') and (Parametros.Produto='02')  then
            begin
              if MessageDlg('Deseja Emitir Fatura contra o Agente?!', mtConfirmation, [mbYes, mbNo, mbCancel], 0, mbNo) = mrYes then
              begin
                FaturaContra:='AGENT';
                dtmFaturamentoERP.ExecSQL('update billing  set InvoiceReceiverType =''AGENT'' where id=:Nota',[dtmFaturamentoERP.qryFaturasid.AsInteger]);
              end
              else
              begin
                FaturaContra:='CUSTOMER';
                dtmFaturamentoERP.ExecSQL('update billing  set InvoiceReceiverType =''CUSTOMER'' where id=:Nota',[dtmFaturamentoERP.qryFaturasid.AsInteger]);
              end;
            end;

          //if MessageDlg('Deseja Emitir Fatura contra o Agente?!', mtConfirmation, [mbYes, mbNo, mbCancel], 0, mbNo) = mrYes then
          if FaturaContra='AGENT' then
          begin
            dtmFaturamentoERP.ExecSQL('update billing  set InvoiceReceiverType =''AGENT'' where id=:Nota',[dtmFaturamentoERP.qryFaturasid.AsInteger]);
             Cliente := dtmFaturamentoERP.ConsultaSQL('SELECT id               ' +
                                                      'FROM Customer (nolock)  ' +
                                                      'WHERE taxID = :CNPJAgente', [Parametros.CNPJAgente], '');
          if Cliente='' then
           raise Exception.Create('Agente não encontrado no Cadastro!');

            if qryClienteV2.Active then
              qryClienteV2.Close;
            qryClienteV2.Parameters.ParamValues['CD_CLIENTE'] := Cliente;
            qryClienteV2.Open;

          end
          else
          begin
            dtmFaturamentoERP.ExecSQL('update billing  set InvoiceReceiverType =''CUSTOMER'' where id=:Nota',[dtmFaturamentoERP.qryFaturasid.AsInteger]);
            Cliente := dtmFaturamentoERP.ConsultaSQL('SELECT id              ' +
                                                     'FROM Customer (nolock) ' +
                                                     'WHERE akey = :akey', [qryFaturaCD_CLIENTE.AsString], '');

            if qryClienteV2.Active then
              qryClienteV2.Close;
            qryClienteV2.Parameters.ParamValues['CD_CLIENTE'] := Cliente;
            qryClienteV2.Open;
          end;
        end
        else
        begin
          Cliente := dtmFaturamentoERP.ConsultaSQL('SELECT id                ' +
                                                   'FROM Customer (nolock) ' +
                                                   'WHERE akey = :akey', [qryFaturaCD_CLIENTE.AsString], '');

          if qryClienteV2.Active then
            qryClienteV2.Close;
          qryClienteV2.Parameters.ParamValues['CD_CLIENTE'] := Cliente;
          qryClienteV2.Open;
        end;

         //ANDRESSA
        //if qryClienteV2cp_id.IsNull then
          //raise Exception.Create('Customer Profile não cadastro para o Cliente.');


        if qryCustomerProfile.Active then
          qryCustomerProfile.Close;
        qryCustomerProfile.Parameters.ParamValues['CP_ID'] := qryClienteV2cp_id.AsInteger;
        qryCustomerProfile.Parameters.ParamValues['product_id'] := Parametros.Produto;
        qryCustomerProfile.Open;


        if qryCustomerProfile.Eof then
          raise Exception.Create('Customer Profile ' + qryCustomerProfileid.AsString + ' não encontrado.');

        if Trim(qryCustomerProfilecostCenter.AsString) = '' then
          raise Exception.Create('Centro de Custo não informado para o Customer Profile ' + qryCustomerProfileid.AsString + '.');

        // Para verificar se atingiu o valor para reter o IR e o COFINS
        ValorNotasAnterires := 0;
        if qryFaturasHoje.Active then
          qryFaturasHoje.Close;

        qryFaturasHoje.Parameters.ParamValues['customer_id'] := qryClienteV2id.AsString;
        qryFaturasHoje.Parameters.ParamValues['DataFatura'] := dtmFaturamentoERP.qryFaturascreated.AsString;
        qryFaturasHoje.Open;

        qryFaturasHoje.First;
        while not qryFaturasHoje.Eof do
        begin
          ValorNotasAnterires := ValorNotasAnterires + qryFaturasHojevalorTibutavel.AsFloat;
          qryFaturasHoje.Next;
        end;
        ValorIrDia:= qryFaturasHojeirtotaldia.AsFloat;
        qryFaturasHoje.Close;
        //
        ValorNotasAnterires := 0;
        if qryFaturasHoje.Active then
          qryFaturasHoje.Close;

        qryFaturasHoje.Parameters.ParamValues['customer_id'] := qryClienteV2id.AsString;
        qryFaturasHoje.Parameters.ParamValues['DataFatura'] := dtmFaturamentoERP.qryFaturascreated.AsString;
        qryFaturasHoje.Open;

        qryFaturasHoje.First;
        while not qryFaturasHoje.Eof do
        begin
          ValorNotasAnterires := ValorNotasAnterires + qryFaturasHojevalorTibutavel.AsFloat;
          qryFaturasHoje.Next;
        end;
        ValorIrDia:= qryFaturasHojeirtotaldia.AsFloat;
        qryFaturasHoje.Close;
        //Informar 5949D/6949D (Operações com destaque de ISS), sendo 5949D vendas dentro do estado e 6949D para fora do estado
        //Informar 5949R/6949R (Operações com retenção de ISS), sendo 5949R vendas dentro do estado e 6949R para fora do estado
        // Retenção
        if dtmFaturamentoERP.qryFaturastype.AsString='TAX_RECEIPT' then
        begin
          if SameText(Trim(qryClienteV2city.AsString), Trim(qryUnidadeEND_CIDADE.AsString)) and
             not (SameText(UpperCase(Trim(qryClienteV2city.AsString)), UpperCase('Rio de Janeiro')) or
                  SameText(UpperCase(Trim(qryClienteV2city.AsString)), UpperCase('Uruguaiana')) or
                  SameText(UpperCase(Trim(qryClienteV2city.AsString)), UpperCase('GUARULHOS'))) then
          begin
            // Venda dentro do Estado
            if SameText(Trim(qryClienteV2UF.AsString), Trim(qryUnidadeEND_UF.AsString)) then
              TipoOperacao := '594ND'
            else // Venda fora do Estado
              TipoOperacao := '694ND';
          end
          else // Destaque
          begin
            // Venda dentro do Estado
            if SameText(Trim(qryClienteV2UF.AsString), Trim(qryUnidadeEND_UF.AsString)) then
              TipoOperacao := '594ND'
            else // Venda fora do Estado
              TipoOperacao := '694ND';
          end;
        end
        else
        begin
          if SameText(Trim(qryClienteV2city.AsString), Trim(qryUnidadeEND_CIDADE.AsString)) and
             not (SameText(UpperCase(Trim(qryClienteV2city.AsString)), UpperCase('Rio de Janeiro')) or
                  SameText(UpperCase(Trim(qryClienteV2city.AsString)), UpperCase('Uruguaiana')) or
                  SameText(UpperCase(Trim(qryClienteV2city.AsString)), UpperCase('GUARULHOS'))) then
          begin
            // Venda dentro do Estado
            if SameText(Trim(qryClienteV2UF.AsString), Trim(qryUnidadeEND_UF.AsString)) then
            begin
              if GrupoBasf or
                 GrupoINB or
                 GrupoTATE or
                 GrupoAAK or
                 GrupoAvlisHaws or
                 GrupoEmbraco or
                 GrupoFesto or
                 GrupoFoseco or
                 GrupoAirProducts or
                 GrupoPirelli or
                 GrupoChemetall or
                 GrupoSaintGobainAbrasivos or
                 GrupoMetalfrio or
                 GrupoFigwall or
                 GrupoFirmenich or
                 GrupoPrometeon or
                 GrupoYara or
                 GrupoStyropek or
                 GrupoGarret or
                 GrupoValgroupBA or
                 GrupoValgroupMG or
                 GrupoMBS or
                 GrupoCaldic or
                 GrupoSeb or
                 GrupoCj or
                 GrupoCjBr
                 then
                TipoOperacao := '594R'
              else
                TipoOperacao := '5949R';
            end
            else // Venda fora do Estado
            begin
              TipoOperacao := '6949R';
            end;
          end
          else // Destaque
          begin
            // Venda dentro do Estado
            if SameText(Trim(qryClienteV2UF.AsString), Trim(qryUnidadeEND_UF.AsString)) then
            begin
              if GrupoBasf or
                 GrupoINB or
                 GrupoTATE or
                 GrupoAAK or
                 GrupoAvlisHaws or
                 GrupoEmbraco or
                 GrupoFesto or
                 GrupoFoseco or
                 GrupoAirProducts or
                 GrupoPirelli or
                 GrupoChemetall or
                 GrupoSaintGobainAbrasivos or
                 GrupoMetalfrio or
                 GrupoFigwall or
                 GrupoFirmenich or
                 GrupoPrometeon or
                 GrupoYara or
                 GrupoStyropek or
                 GrupoGarret or
                 GrupoValgroupBA or
                 GrupoValgroupMG or
                 GrupoMBS or
                 GrupoCaldic or
                 GrupoSeb or
                 GrupoCj or
                 GrupoCjBr
                 then
                TipoOperacao := '5949'
              else
                TipoOperacao := '5949D';
            end
            else // Venda fora do Estado
            begin
              if GrupoBasf or
                 GrupoINB or
                 GrupoTATE or
                 GrupoAAK or
                 GrupoAvlisHaws or
                 GrupoEmbraco or
                 GrupoFesto or
                 GrupoFoseco or
                 GrupoAirProducts or
                 GrupoPirelli or
                 GrupoChemetall or
                 GrupoSaintGobainAbrasivos or
                 GrupoMetalfrio or
                 GrupoFigwall or
                 GrupoFirmenich or
                 GrupoPrometeon or
                 GrupoYara or
                 GrupoStyropek or
                 GrupoGarret or
                 GrupoValgroupBA or
                 GrupoValgroupMG or
                 GrupoMBS or
                 GrupoCaldic or
                 GrupoSeb or
                 GrupoCj or
                 GrupoCjBr
                 then
                TipoOperacao := '6949'
              else
                TipoOperacao := '6949D';
            end;
          end;
        end;


        if qryClienteLocal.Active then
         qryClienteLocal.Close;
        qryClienteLocal.Parameters.ParamByName('CD_CLIENTE').Value := qryFaturaCD_CLIENTE.AsString;

        qryClienteLocal.Open;
        OrgaoPublico := qryClienteLocalIN_ORGAO_PUBLICO.AsString = '1';
        qryClienteLocal.Close;

        {-------------------- Início Dados Gerais --------------------}
        DadosGerais.codCli := qryClienteV2seniorKey.AsString;                                                           // Código do cliente
        DadosGerais.codCpg := '1';                                                                                      // Condição de Pagamento
        DadosGerais.codEdc := '90';                                                                                     // Código da Espécie de Documento, enviar fixo 90
        DadosGerais.codEmp := 1;                                                                                        // Código da Empresa
        DadosGerais.codFil := qryUnidadeseniorKey.AsInteger;                                                            // Código da Filial
        DadosGerais.datEmi := FormatDateTime('dd/mm/yyyy', qryFaturacreated.Asdatetime);//DadosGerais.datEmi;//FormatDateTime('dd/mm/yyyy', Now);                                                        // Data de Emissão
        DadosGerais.datSai := DadosGerais.datEmi;                                                                       // Data de Saída
        DadosGerais.obsNfv := copy(Processo,1,250);                                                                                       // Observações da Nota Fiscal
        //DadosGerais.vlrFin := FormatFloat('0.00', qryFaturatotal.AsFloat);

        {---------------------- Início Parcelas ----------------------}
        Parcelas := notafiscalGravarNotasFiscaisSaida2InDadosGeraisParcelas.Create;
        SetLength(ListaParcelas, 1);
        ListaParcelas[0] := Parcelas;
        DadosGerais.parcelas := ListaParcelas;
        Parcelas.numPar := 1;                                                                                           // Número da parcela
        Parcelas.vctPar := FormatDateTime('dd/mm/yyyy', qryFaturadueDate.AsDateTime);                                   // Vencimento da parcela
        Parcelas.vlrPar := '0,00';                                                                                      // Valor da parcela
        {----------------------- Fim Parcelas ------------------------}

        // Loop nos Itens/Serviços-ERP
        cdsItensFatura.First;
        Sequencial := 1;
        ValorParcela := 0;
        CrtTotal := 0;
        CslTotal := 0;
        InsTotal := 0;
        IrfTotal := 0;
        IssTotal := 0;
        PitTotal := 0;

          //ADD para descontar numerario na fatura de despesa - Andressa 30/12/2015
        while (not cdsItensFatura.Eof) and (VlrNumerario <>0)   do
        begin
          if VlrNumerario > 0 then
          begin
            cdsItensFatura.Edit;
            if cdsItensFaturaprice.AsFloat > VlrNumerario then
            begin
              cdsItensFaturaprice.AsFloat := cdsItensFaturaprice.AsFloat - VlrNumerario;
              VlrNumerario := 0;
              cdsItensFatura.post;
            end
            else
            begin
              VlrNumerario := VlrNumerario -  cdsItensFaturaprice.AsFloat;
              cdsItensFaturaprice.AsFloat := 0;
              cdsItensFatura.post;
            end;
          end;
          cdsItensFatura.Next;
        end;
        cdsItensFatura.First;

        while not cdsItensFatura.Eof do
        begin
          if cdsItensFaturaprice.AsFloat=0 then
          begin
            cdsItensFatura.next;
          end
          else
          begin
            Servicos := notafiscalGravarNotasFiscaisSaida2InDadosGeraisServicos.Create;
            SetLength(ListaServicos, High(ListaServicos) +2);
            ListaServicos[High(ListaServicos)] := Servicos;
            {--------------------- Início Serviços ---------------------}
            Servicos.codSer := cdsItensFaturaseniorKey.AsString;                                                            // Código do serviço
            if Trim(Servicos.codSer) = '' then
              raise Exception.Create('Não cadastrado o código de serviço para o item ' + cdsItensFaturaitem_id.AsString + '.');
            qryReferencia.First;
            while not qryReferencia.Eof do
            begin
              if Servicos.obsIsv = '' then
                Servicos.obsIsv := qryReferenciaNM_REFERENCIA.AsString                                                                                         // Observações do item, campo opcional
              else
                Servicos.obsIsv := Servicos.obsIsv + ', ' +qryReferenciaNM_REFERENCIA.AsString;                                                                                          // Observações do item, campo opcional
              qryReferencia.Next;
            end;
            Servicos.obsIsv := Copy(Servicos.obsIsv, 1, 1025);
            Servicos.preUni := FormatFloat('0.00', cdsItensFaturaprice.AsFloat);                                            // Preço unitário
            Servicos.qtdFat := '1';                                                                                         // Quantidade do item de serviço

            {---------------------- Início Rateios ---------------------}
            ValorRateio := RoundTo(ValorLiquido(cdsItensFaturaprice.AsFloat),-2);

            ValorTotalIR := ValorIR ;
            ValorTotalcofins := ValorTotalcofins + Valorcofins ;

            if ValorIR <> 0 then
              DadosGerais.vlrBir:= FormatFloat(',0.00', BaseCalculoIR);

            Rateio := notafiscalGravarNotasFiscaisSaida2InDadosGeraisServicosRateio.Create;
            SetLength(ListaRateios, 1);
            ListaRateios[0] := Rateio;
            Servicos.rateio := ListaRateios;
            Rateio.codCcu := qryCustomerProfilecostCenter.AsString; // Centro de Custos
            Rateio.perRat := '100.0000';
            Rateio.perCta := '100.0000';


            if cdsItensFaturatype.AsString = 'R' then
            begin
              if qryCustomerProfileproduct_id.AsInteger = 1  then
              begin
                if not cdsItensFaturaContaFinanceiraImp.IsNull then
                  Rateio.ctaFin :=  cdsItensFaturaContaFinanceiraImp.AsInteger;
              end
              else
              begin
                if not cdsItensFaturaContaFinanceiraExp.IsNull then
                  Rateio.ctaFin := cdsItensFaturaContaFinanceiraExp.AsInteger;
              end;

            end
            else
              Rateio.ctaFin := cdsItensFaturaseniorKey.AsInteger;


            //ANDRESSA 27/11/2015 -add pois arredondamento estava dando problema
            Rateio.vlrRat :=floattostr(SimpleRoundTo(ValorRateio,-2));
            //if copy(FloatToStr(Frac(ValorRateio)),5,1) = '5' then
            if copy(floattostr(valorrateio),length(floattostr(valorrateio)),1) = '5' then
            begin
              //ValorRateio := ValorRateio * 100;
              //ValorRateio := trunc(ValorRateio);
              //ValorRateio := ValorRateio / 100;
              //Rateio.vlrCta := FormatFloat(',0.000000', ArredondaPorDecimal(ValorRateio, 2));//FormatFloat('#0.00', ValorRateio);
              Rateio.vlrCta := FormatFloat(',0.000000', ArredondaPorDecimal(ValorRateio, 2));
              Rateio.vlrCta := StringReplace(Rateio.vlrCta, '.', '',[rfReplaceAll, rfIgnoreCase]);
            end
            else
            begin
             Rateio.vlrCta := FormatFloat('#0.00',  ArredondaPorDecimal(ValorRateio, 2));
            end;
            // Valor rateado para a conta
            Rateio.vlrRat := Rateio.vlrCta;                                                                                 // Valor rateado para o centro de custos
            {---------------------- Fim Rateios ------------------------}

            ValorParcela := ValorParcela + RoundTo(StrToFloat(Rateio.vlrCta),-2);

            Servicos.seqIsv := Sequencial;                                                                                  // Incremental iniciado em 1
            Servicos.tnsSer := TipoOperacao;                                                                                // Informar 5949D/6949D (Operações com destaque de ISS), sendo 5949D vendas dentro do estado e 6949D para fora do estado
                                                                                                                            // Informar 5949R/6949R (Operações com retenção de ISS), sendo 5949R vendas dentro do estado e 6949R para fora do estado
            Inc(Sequencial);
            {---------------------- Fim Serviços -----------------------}

            cdsItensFatura.Next;
          end;
        end;

        DadosGerais.servicos := ListaServicos;
        Parcelas.vlrPar := FormatFloat('0.00', RoundTo(ValorParcela,-2));
        DadosGerais.tipNfs := 1;                                                                                          // Tipo da nota fiscal de saída informar fixo 1
        DadosGerais.tnsSer := TipoOperacao;                                                                               // Informar 5949D/6949D (Operações com destaque de ISS), sendo 5949D vendas dentro do estado e 6949D para fora do estado
                                                                                                                          // Informar 5949R/6949R (Operações com retenção de ISS), sendo 5949R vendas dentro do estado e 6949R para fora do estado
        {--------------------- Fim Dados Gerais ----------------------}
      end;
      NotaIn.fecNot := '2';                                                                                               // Indica se as notas devem ser fechadas - Lista: 1 = Sim, 2 = Não
      NotaIn.gerPar := 0;                                                                                                 // Indica se o Sapiens deve gerar as parcelas ou se deve considerar as parcelas enviadas no Web Service - Lista: 0 = Não, 1 = Sim
      NotaIn.gerarDocumentoEletronico := '0';                                                                             // Gerar Documento Eletrônico - Lista: 0 = Não, 1 = Sim.
      NotaIn.prcNfv := '1';                                                                                               // Procedência da Nota Fiscal de Saída - Enviar fixo 1 = Normal
      NotaIn.tipCal := 0;                                                                                                 // Indica se os Valores da nota devem ser recalculados pelo Sapiens - Lista: 0 = Sim, 1 = Não
      NotaIn.tipoProcessamento := ATipoEnvio;                                                                         // Tipo de Processamento - Lista: 1 = Inclusão, 2 = Alteração, 3 = Cancelamento
      //if ATipoEnvio <> _Cancelar then
      SalvaXML;

      {if IRRetido  then
      begin
        if qryFaturasHoje.Active then
          qryFaturasHoje.Close;
        qryFaturasHoje.Parameters.ParamValues['customer_id'] := qryClienteV2id.AsString;
        qryFaturasHoje.Open;
        qryFaturasHoje.First;
        while not qryFaturasHoje.eof do
        begin
          qryFaturasHoje.Edit;
          qryFaturasHojeirRetained.AsInteger := 1;
          qryFaturasHoje.Post;
          qryFaturasHoje.Next;
        end;
      end; }

      if ASistema = _Homologacao then
        NotaOut := Getsapiens_Synccom_senior_g5_co_mcm_ven_notafiscalHomo.GravarNotasFiscaisSaida_2(AUsuario, ASenha, 0, NotaIn)
      else
      begin
        Conexao := Getsapiens_Synccom_senior_g5_co_mcm_ven_notafiscalProd(false, '', HTTPRIO1);
        NotaOut := Conexao.GravarNotasFiscaisSaida_2(AUsuario, ASenha, 0, NotaIn);
      end;

      if (NotaOut.erroExecucao = '') and (AnsiIndexText(NotaOut.retornosNotasSaida[0].retorno, ['Ok']) >= 0) or
         (AnsiIndexText(NotaOut.mensagemRetorno, ['Ok']) >= 0) then
        Result := NotaOut.retornosNotasSaida[0].numNfv
      else
        FMensagemErro := NotaOut.retornosNotasSaida[0].retorno;

    finally
      FormatSettings.DecimalSeparator := Decimal;
      FreeAndNil(NotaIn);
    end;
  except
    on E: Exception do
    begin
      FMensagemErro := E.Message;
      Result := '';
    end;
  end;
end;

function TdtmEnvioERP.EnviarNota(AUsuario, ASenha: string; ANota, ASistema: Integer; Grupo: string): string;
begin
  Result := EnviarDadosNota(AUsuario, ASenha, ANota, ASistema, _Incluir, Grupo);
end;

procedure TdtmEnvioERP.HTTPRIO1BeforeExecute(const MethodName: string;
  SOAPRequest: TStream);
var
  texto : TStringList;
  arquivo : String;
begin
 { texto := TStringList.Create;
  SOAPRequest.Position := 0;
  texto.LoadFromStream(SOAPRequest);
  arquivo := 'c:\' +  formatdatetime('yyyy-mm-dd_hhmm', now) +  '.xml';
  texto.SaveToFile(arquivo);
  SOAPRequest.Position := 0; }
end;

procedure TdtmEnvioERP.HTTPRIO1HTTPWebNode1BeforePost(
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

function TdtmEnvioERP.CancelarNota(AUsuario, ASenha: String; ANota, ASistema: Integer; Grupo: string): String;
begin
  Result := EnviarDadosNota(AUsuario, ASenha, ANota, ASistema, _Cancelar, Grupo);
end;


procedure TdtmEnvioERP.qryItensFaturaAfterOpen(DataSet: TDataSet);
var
  Cds: TClientDataSet;
  item_id: Integer;
begin
  if not cdsFaturaNumerarios.Active then
    cdsFaturaNumerarios.Open;
  cdsFaturaNumerarios.EmptyDataSet;

  if not cdsFaturaPagamentos.Active then
    cdsFaturaPagamentos.Open;
  cdsFaturaPagamentos.EmptyDataSet;

  if not cdsFaturaReceitas.Active then
    cdsFaturaReceitas.Open;
  cdsFaturaReceitas.EmptyDataSet;

  qryItensFatura.First;
  while not qryItensFatura.Eof do
  begin
    if CharInSet(qryItensFaturaTipo.AsString[1], ['n', 'N']) then
      Cds := cdsFaturaNumerarios
    else if CharInSet(qryItensFaturaTipo.AsString[1], ['p', 'P']) then
      Cds := cdsFaturaPagamentos
    else if CharInSet(qryItensFaturaTipo.AsString[1], ['r', 'R']) then
      Cds := cdsFaturaReceitas
    else
      Cds := nil;

    if Cds <> nil then
    begin
      Cds.Append;
      Cds.FieldByName('Billing_id').AsInteger := qryItensFaturaBilling_id.AsInteger;
      Cds.FieldByName('Tipo').AsString        := qryItensFaturaTipo.AsString;
      //Cds.FieldByName('id').AsInteger         := qryItensFaturaid.AsInteger;
      Cds.FieldByName('destino').AsString     := qryItensFaturadestino.AsString;
      Cds.FieldByName('price').AsFloat        := qryItensFaturaprice.AsFloat;
      //Cds.FieldByName('item_id').AsInteger    := qryItensFaturaitem_id.AsInteger;
      Cds.FieldByName('aKey').AsString        := qryItensFaturaaKey.AsString;
      Cds.FieldByName('name').AsString        := qryItensFaturaname.AsString;
      Cds.FieldByName('seniorKey').AsString   := qryItensFaturaseniorKey.AsString;
      Cds.FieldByName('type').AsString                := qryItensFaturatype.AsString;
      Cds.FieldByName('ContaFinanceiraImp').AsString  :=qryItensFaturaContaFinanceiraImp.AsString;
      Cds.FieldByName('ContaFinanceiraExp').AsString  :=qryItensFaturaContaFinanceiraExp.AsString;
      Cds.Post;
    end;

    qryItensFatura.Next;
  end;

  // Saldo de Numerários X Pagamentos
  if (cdsFaturaNumerarios.RecordCount > 0) and (cdsFaturaPagamentos.RecordCount > 0) then
  begin
    // Procurar Pagamentos nos Numerários
    cdsFaturaPagamentos.First;
    while not cdsFaturaPagamentos.Eof do
    begin
      item_id := cdsFaturaPagamentositem_id.AsInteger;
      cdsFaturaNumerarios.First;
      if cdsFaturaNumerarios.Locate('item_id', item_id, []) then
      begin
        if cdsFaturaNumerariosprice.AsFloat = cdsFaturaPagamentosprice.AsFloat then
        begin
          cdsFaturaNumerarios.Delete;
          cdsFaturaPagamentos.Delete;
          Continue;
        end
        else if cdsFaturaNumerariosprice.AsFloat > cdsFaturaPagamentosprice.AsFloat then
        begin
          cdsFaturaNumerarios.Edit;
          cdsFaturaNumerariosprice.AsFloat := 0;//cdsFaturaNumerariosprice.AsFloat - cdsFaturaPagamentosprice.AsFloat;
          cdsFaturaNumerarios.Post;
          cdsFaturaPagamentos.Delete;
          Continue;
        end
        else
        begin
          cdsFaturaPagamentos.Edit;
          cdsFaturaPagamentosprice.AsFloat := cdsFaturaPagamentosprice.AsFloat - cdsFaturaNumerariosprice.AsFloat;
          cdsFaturaPagamentos.Post;
          cdsFaturaNumerarios.Delete;
        end;
      end;
      cdsFaturaPagamentos.Next;
    end;

    // Se sobrou é porque tem item no Numerário que não está no Pagamento, e vice-versa... Ou, porque juntaram tudo num único item de numerário
    // Então, começa a subtrair todos os itens dos Pagamentos de todos os itens dos Numerários
    while (cdsFaturaNumerarios.RecordCount > 0) and (cdsFaturaPagamentos.RecordCount > 0) do
    begin
      cdsFaturaPagamentos.First;
      while (not cdsFaturaPagamentos.Eof) and (cdsFaturaNumerarios.RecordCount > 0) do
      begin
        cdsFaturaNumerarios.First;
        if cdsFaturaNumerariosprice.AsFloat = cdsFaturaPagamentosprice.AsFloat then
        begin
          cdsFaturaNumerarios.Delete;
          cdsFaturaPagamentos.Delete;
          Continue;
        end
        else if cdsFaturaNumerariosprice.AsFloat > cdsFaturaPagamentosprice.AsFloat then
        begin
          cdsFaturaNumerarios.Edit;
          cdsFaturaNumerariosprice.AsFloat := cdsFaturaNumerariosprice.AsFloat - cdsFaturaPagamentosprice.AsFloat;
          cdsFaturaNumerarios.Post;
          cdsFaturaPagamentos.Delete;
          Continue;
        end
        else
        begin
          cdsFaturaPagamentos.Edit;
          cdsFaturaPagamentosprice.AsFloat := cdsFaturaPagamentosprice.AsFloat - cdsFaturaNumerariosprice.AsFloat;
          cdsFaturaPagamentos.Post;
          cdsFaturaNumerarios.Delete;
          cdsFaturaPagamentos.Next;
        end;
      end;
    end;
  end;

  if not cdsItensFatura.Active then
    cdsItensFatura.Open;
  cdsItensFatura.EmptyDataSet;

  cdsFaturaReceitas.First;
  while not cdsFaturaReceitas.Eof do
  begin
    cdsItensFatura.Append;
    cdsItensFaturaBilling_id.AsInteger := cdsFaturaReceitasBilling_id.AsInteger;
    cdsItensFaturaTipo.AsString        := cdsFaturaReceitasTipo.AsString;
    //cdsItensFaturaid.AsInteger         := cdsFaturaReceitasid.AsInteger;
    cdsItensFaturadestino.AsString     := cdsFaturaReceitasdestino.AsString;
    cdsItensFaturaprice.AsFloat        := cdsFaturaReceitasprice.AsFloat;
    cdsItensFaturaitem_id.AsInteger    := cdsFaturaReceitasitem_id.AsInteger;
    cdsItensFaturaaKey.AsString        := cdsFaturaReceitasaKey.AsString;
    cdsItensFaturaname.AsString        := cdsFaturaReceitasname.AsString;
    cdsItensFaturaseniorKey.AsString   := cdsFaturaReceitasseniorKey.AsString;
    cdsItensFaturatype.AsString        := cdsFaturaReceitastype.AsString;
    cdsItensFaturaContaFinanceiraImp.AsString   :=cdsFaturaReceitasContaFinanceiraImp.AsString;
    cdsItensFaturaContaFinanceiraExp.AsString   :=cdsFaturaReceitasContaFinanceiraExp.AsString;
    cdsItensFatura.Post;

    cdsFaturaReceitas.Next;
  end;

  cdsFaturaPagamentos.First;
  while not cdsFaturaPagamentos.Eof do
  begin
    cdsItensFatura.Append;
    cdsItensFaturaBilling_id.AsInteger := cdsFaturaPagamentosBilling_id.AsInteger;
    cdsItensFaturaTipo.AsString        := cdsFaturaPagamentosTipo.AsString;
    //cdsItensFaturaid.AsInteger         := cdsFaturaPagamentosid.AsInteger;
    cdsItensFaturadestino.AsString     := cdsFaturaPagamentosdestino.AsString;
    cdsItensFaturaprice.AsFloat        := cdsFaturaPagamentosprice.AsFloat;
    cdsItensFaturaitem_id.AsInteger    := cdsFaturaPagamentositem_id.AsInteger;
    cdsItensFaturaaKey.AsString        := cdsFaturaPagamentosaKey.AsString;
    cdsItensFaturaname.AsString        := cdsFaturaPagamentosname.AsString;
    cdsItensFaturaseniorKey.AsString   := cdsFaturaPagamentosseniorKey.AsString;
    cdsItensFaturatype.AsString        := cdsFaturaPagamentostype.AsString;
    cdsItensFaturaContaFinanceiraImp.AsString   :=cdsFaturaPagamentosContaFinanceiraImp.AsString;
    cdsItensFaturaContaFinanceiraExp.AsString   :=cdsFaturaPagamentosContaFinanceiraExp.AsString;
    cdsItensFatura.Post;

    cdsFaturaPagamentos.Next;
  end;

  cdsFaturaNumerarios.First;
  while not cdsFaturaPagamentos.Eof do
  begin
    cdsItensFatura.Append;
    cdsItensFaturaBilling_id.AsInteger := cdsFaturaNumerariosBilling_id.AsInteger;
    cdsItensFaturaTipo.AsString        := cdsFaturaNumerariosTipo.AsString;
    //cdsItensFaturaid.AsInteger         := cdsFaturaNumerariosid.AsInteger;
    cdsItensFaturadestino.AsString     := cdsFaturaNumerariosdestino.AsString;
    cdsItensFaturaprice.AsFloat        := cdsFaturaNumerariosprice.AsFloat;
    cdsItensFaturaitem_id.AsInteger    := cdsFaturaNumerariositem_id.AsInteger;
    cdsItensFaturaaKey.AsString        := cdsFaturaNumerariosaKey.AsString;
    cdsItensFaturaname.AsString        := cdsFaturaNumerariosname.AsString;
    cdsItensFaturaseniorKey.AsString   := cdsFaturaNumerariosseniorKey.AsString;
    cdsItensFaturatype.AsString        := cdsFaturaNumerariostype.AsString;
    cdsItensFaturaContaFinanceiraImp.AsString   :=cdsFaturaNumerariosContaFinanceiraImp.AsString;
    cdsItensFaturaContaFinanceiraExp.AsString   :=cdsFaturaNumerariosContaFinanceiraExp.AsString;
    cdsItensFatura.Post;

    cdsFaturaNumerarios.Next;
  end;
end;

function TdtmEnvioERP.ValidaSistema(ASistema: Integer): Boolean;
begin
  Result := ASistema in [_Homologacao, _Producao];
  if not Result then
    FMensagemErro := 'Sistema inválido.'#13#10'Utilize:'#13#10'0 - Homologação'#13#10'1 - Produção';
end;

function TdtmEnvioERP.ValidaTipo(ATipo: Integer): Boolean;
begin
  Result := ATipo in [_Incluir, _Alterar, _Cancelar];
  if not Result then
    FMensagemErro := 'Tipo inválido.'#13#10'Utilize:'#13#10'1 - Incluir'#13#10'2 - Alterar'#13#10'3 - Cancelar';
end;

end.

