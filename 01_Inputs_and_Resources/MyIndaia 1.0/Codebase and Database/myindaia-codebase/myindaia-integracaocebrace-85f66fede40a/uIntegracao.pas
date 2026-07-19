unit uIntegracao;

interface

uses
  RootUnit, System.Generics.Collections, DataModule, Vcl.ExtCtrls, System.SysUtils,
  REST.Client, REST.Types, System.JSON;

const

  cfgCebrace_HeaderValor = 'Cebrace_HeaderValor';
  cfgCebrace_HorariosExecucao = 'Cebrace_HorariosExecucao';
  cfgCebrace_UltimoProcesso = 'Cebrace_UltimoProcesso';

type

  TIntegracao = Class
  private
    FHorariosExecucao: string;
    FUltimoProcesso: string;
    FHeaderValor: string;
    procedure SetHeaderValor(const Value: string);
    procedure SetHorariosExecucao(const Value: string);
    procedure SetUltimoProcesso(const Value: string);

  public
    token: String;
    function Conecta: Boolean;
    function GetJson: String;
    function Envia(textoJson: String): String;
    procedure CarregaInformacoes;
    procedure PersistirConfiguracoes;
//    function Conectar: Boolean;
//    function Disconectar: Boolean;
//    function ImportarArquivos: TStringList;
//    function EnviarArquivo(CaminhoArquivoNome, DirEnvioSFTP, ArquivoEnvioNome: WideString; var Mensagem: String): Boolean;
  published
   property HeaderValor: string read FHeaderValor write SetHeaderValor;
   property HorariosExecucao: string read FHorariosExecucao write SetHorariosExecucao;
   property UltimoProcesso: string read FUltimoProcesso write SetUltimoProcesso;


  end;

var
  Integracao: TIntegracao;

implementation

{ TIntegracao }

procedure TIntegracao.SetHeaderValor(const Value: string);
begin
  FHeaderValor := Value;
end;

procedure TIntegracao.SetHorariosExecucao(const Value: string);
begin
  FHorariosExecucao := Value;
end;

procedure TIntegracao.SetUltimoProcesso(const Value: string);
begin
  FUltimoProcesso := Value;
end;

procedure TIntegracao.CarregaInformacoes;
begin
  Integracao.HeaderValor := DataModule1.LerConfiguracao(cfgCebrace_HeaderValor);
  Integracao.HorariosExecucao := DataModule1.LerConfiguracao(cfgCebrace_HorariosExecucao);
  Integracao.UltimoProcesso := DataModule1.LerConfiguracao(cfgCebrace_UltimoProcesso);
end;

procedure TIntegracao.PersistirConfiguracoes;
begin
    DataModule1.EscreveConfiguracao(cfgCebrace_HeaderValor, HeaderValor);
    DataModule1.EscreveConfiguracao(cfgCebrace_HorariosExecucao, HorariosExecucao);
    DataModule1.EscreveConfiguracao(cfgCebrace_UltimoProcesso, UltimoProcesso);
end;

function TIntegracao.Conecta: Boolean;
var
  Objeto : TJSONObject;
  vRestClient : TRestClient;
  vRestRequest : TRestRequest;
  vRestResponse : TRestResponse;
begin
//  vRestClient := TRestClient.Create('https://cebraceisq.apimanagement.br10.hana.ondemand.com/v2/autenticacao/login');
  vRestClient := TRestClient.Create('https://cebraceisp.apimanagement.br10.hana.ondemand.com:443/v2/autenticacao/login');
  vRestRequest := TRestRequest.Create(nil);
  vRestResponse := TRestResponse.Create(nil);
  try

    vRestClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8';
    vRestClient.AcceptCharset := 'UTF-8, *;q=0.8';

    vRestRequest.Client := vRestClient;
    vRestRequest.Response := vRestResponse;
    vRestRequest.Method := rmPOST;
    vRestRequest.Params.AddHeader('x-api-key', HeaderValor);//'FGKaeyXD7DBpwWihOAqSmWeTGe5AV7Rw');
    vRestRequest.Execute;

    Objeto := vRestResponse.JSONValue as TJSONObject;
    token :=  Objeto.GetValue('token').Value;

    if vRestResponse.StatusCode = 200 then
      result := true;

  finally
    vRestClient.Free;
    vRestRequest.Free;
    vRestResponse.Free;
  end;
end;

function TIntegracao.GetJson: String;
var
  Root : TRoot;
  item : Integer;
  itens_01D : TObjectList<Titem_01D>;
  itens_04D : TObjectList<Titem_04D>;
  itens_33D : TObjectList<Titem_33D>;
  itens_34D : TObjectList<Titem_34D>;

  function ConvertData(value: TDateTime): String;
  begin
    if value < now - 1000 then
      result := ''
    else
      result := FormatDateTime('yyyymmdd', value);
  end;

begin
  item := 0;
  Root := TRoot.Create;

  Root.ZAPSEXP02.TB_EXP0001D.Item.Add(TItem_01D.Create);
  Root.ZAPSEXP02.TB_EXP0001D.Item[item].PROCESSNUMBERId := DataModule1.QueryConsultaPROCESSNUMBERID.AsString;
  Root.ZAPSEXP02.TB_EXP0001D.Item[item].PROCESSBROKERID := DataModule1.QueryConsultaPROCESSBROKERID.AsString;
  Root.ZAPSEXP02.TB_EXP0001D.Item[item].VESSEL := DataModule1.QueryConsultaVESSEL.AsString;
  Root.ZAPSEXP02.TB_EXP0001D.Item[item].RESERVE := DataModule1.QueryConsultaRESERVE.AsString;
  Root.ZAPSEXP02.TB_EXP0001D.Item[item].PLANNEDDATESHIP := ConvertData(DataModule1.QueryConsultaPLANNEDDATESHIP.AsDateTime);
  Root.ZAPSEXP02.TB_EXP0001D.Item[item].SHIPDATE := ConvertData(DataModule1.QueryConsultaSHIPDATE.AsDateTime);
  Root.ZAPSEXP02.TB_EXP0001D.Item[item].TRANSITTIME := StrToIntDef(DataModule1.QueryConsultaTRANSITTIME.AsString, 0);
  Root.ZAPSEXP02.TB_EXP0001D.Item[item].DDE := DataModule1.QueryConsultaDDE.AsString;
  Root.ZAPSEXP02.TB_EXP0001D.Item[item].DDECHANNEL := DataModule1.QueryConsultaDDECHANNEL.AsString;
  Root.ZAPSEXP02.TB_EXP0001D.Item[item].DDEDATE := ConvertData(DataModule1.QueryConsultaDDEDATE.AsDateTime);
  Root.ZAPSEXP02.TB_EXP0001D.Item[item].AVERBACAODATE := ConvertData(DataModule1.QueryConsultaAVERBACAODATE.AsDateTime);
  Root.ZAPSEXP02.TB_EXP0001D.Item[item].DUENUMBER := DataModule1.QueryConsultaDUENUMBER.AsString;
  Root.ZAPSEXP02.TB_EXP0001D.Item[item].DUEDATE := ConvertData(DataModule1.QueryConsultaDUEDATE.AsDateTime);
  Root.ZAPSEXP02.TB_EXP0001D.Item[item].RUCNUMBER := DataModule1.QueryConsultaRUCNUMBER.AsString;
  Root.ZAPSEXP02.TB_EXP0001D.Item[item].RUCDATE := ConvertData(DataModule1.QueryConsultaRUCDATE.AsDateTime);
  Root.ZAPSEXP02.TB_EXP0001D.Item[item].ACCESSKEY := DataModule1.QueryConsultaACCESSKEY.AsString;
  Root.ZAPSEXP02.TB_EXP0001D.Item[item].URFCLEARENCE := DataModule1.QueryConsultaURFCLEARENCE.AsString;
  Root.ZAPSEXP02.TB_EXP0001D.Item[item].CARRIER := DataModule1.QueryConsultaCARRIER.AsString;
  Root.ZAPSEXP02.TB_EXP0001D.Item[item].PLANNEDDATELOAD := ConvertData(DataModule1.QueryConsultaPLANNEDDATELOAD.AsDateTime);

  //4D
  Root.ZAPSEXP02.TB_EXP0004D.Item.Add(TItem_04D.Create);
  Root.ZAPSEXP02.TB_EXP0004D.Item[item].PROCESSNUMBERId := DataModule1.QueryConsultaPROCESSNUMBERId.AsString;
  Root.ZAPSEXP02.TB_EXP0004D.Item[item].MASTER := DataModule1.QueryConsultaMASTER.AsString;
  Root.ZAPSEXP02.TB_EXP0004D.Item[item].HOUSE := DataModule1.QueryConsultaHOUSE.AsString;
  Root.ZAPSEXP02.TB_EXP0004D.Item[item].ISSUEDATE := ConvertData(DataModule1.QueryConsultaISSUEDATE.AsDateTime);
  Root.ZAPSEXP02.TB_EXP0004D.Item[item].RELEASEDATE := ConvertData(DataModule1.QueryConsultaRELEASEDATE.AsDateTime);

  //33D
  Root.ZAPSEXP02.TB_EXP0033D.Item.Add(TItem_33D.Create);
  Root.ZAPSEXP02.TB_EXP0033D.Item[item].PROCESSNUMBERId := DataModule1.QueryConsultaPROCESSNUMBERId.AsString;
  Root.ZAPSEXP02.TB_EXP0033D.Item[item].SONUMBER := DataModule1.QueryConsultaSONUMBER.AsString;
  Root.ZAPSEXP02.TB_EXP0033D.Item[item].VSART := DataModule1.QueryConsultaVSART.AsString;

  //34D

  if DataModule1.QueryConsultaKUNDE_D.AsString <> '' then
  begin
    Root.ZAPSEXP02.TB_EXP0034D.Item.Add(TItem_34D.Create);
    Root.ZAPSEXP02.TB_EXP0034D.Item[item].PROCESSNUMBERId := DataModule1.QueryConsultaPROCESSNUMBERId.AsString;
    Root.ZAPSEXP02.TB_EXP0034D.Item[item].PARVW := DataModule1.QueryConsultaPARVW.AsString;
    Root.ZAPSEXP02.TB_EXP0034D.Item[item].PARTNER := DataModule1.QueryConsultaKUNDE_D.AsString;
    Root.ZAPSEXP02.TB_EXP0034D.Item[item].SONUMBER := DataModule1.QueryConsultaSONUMBER.AsString;
    inc(item);
  end;

  if DataModule1.QueryConsultaKUNDE_D_1.AsString <> '' then
  begin
    Root.ZAPSEXP02.TB_EXP0034D.Item.Add(TItem_34D.Create);
    Root.ZAPSEXP02.TB_EXP0034D.Item[item].PROCESSNUMBERId := DataModule1.QueryConsultaPROCESSNUMBERId.AsString;
    Root.ZAPSEXP02.TB_EXP0034D.Item[item].PARVW := DataModule1.QueryConsultaPARVW_1.AsString;
    Root.ZAPSEXP02.TB_EXP0034D.Item[item].PARTNER := DataModule1.QueryConsultaKUNDE_D_1.AsString;
    Root.ZAPSEXP02.TB_EXP0034D.Item[item].SONUMBER := DataModule1.QueryConsultaSONUMBER.AsString;
  end;

//  result := UPPERCASE(Root.AsJson);

  result := Root.PrettyPrintJSON(StringReplace(UPPERCASE(Root.AsJson), 'ITEM', 'item', [rfReplaceAll]));

end;

function TIntegracao.Envia(textoJson: String): String;
var
  Objeto : TJSONObject;
  vRestClient : TRestClient;
  vRestRequest : TRestRequest;
  vRestResponse : TRestResponse;
begin
  if token = '' then
  begin
    result := 'Não conectado';
    exit;
  end;

  if textoJson = '' then
  begin
    result := 'Json não gerado';
    exit;
  end;

//  vRestClient := TRestClient.Create('https://cebraceisq.apimanagement.br10.hana.ondemand.com:443/v1/indaia/apsexport');
  vRestClient := TRestClient.Create('https://cebraceisp.apimanagement.br10.hana.ondemand.com:443/v1/indaia/apsexport');
  vRestRequest := TRestRequest.Create(nil);
  vRestResponse := TRestResponse.Create(nil);
  try
    vRestClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8';
    vRestClient.AcceptCharset := 'UTF-8, *;q=0.8';

    vRestRequest.Client := vRestClient;
    vRestRequest.Response := vRestResponse;
    vRestRequest.Method := rmPOST;
    vRestRequest.Params.AddHeader('x-api-key', HeaderValor);//'FGKaeyXD7DBpwWihOAqSmWeTGe5AV7Rw');
    vRestRequest.Params.addHeader('token', token);
    vRestRequest.body.Add(textoJson , ctAPPLICATION_JSON);
    vRestRequest.Execute;

    result := vRestResponse.Content;
  finally
    vRestClient.Free;
    vRestRequest.Free;
    vRestResponse.Free;
  end;

end;

end.
