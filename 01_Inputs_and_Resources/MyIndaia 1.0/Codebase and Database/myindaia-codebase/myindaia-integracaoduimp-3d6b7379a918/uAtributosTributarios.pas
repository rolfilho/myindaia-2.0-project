unit uAtributosTributarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.StrUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.JSON,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, dmDuimp, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Vcl.Grids, Vcl.DBGrids, uIntegracaoAPIs,
  System.Generics.Collections;

type

//  TDepOpcoes        = TStringList; // opções do dependente
//  TDepPorCodigo     = TObjectDictionary<string, TDepOpcoes>;        // DepCodigo -> opções

  // DepCodigo -> opções ("valor | descricao")
  TDepsPorDepCodigo  = TObjectDictionary<string, TStringList>;

  // BaseValor -> (DepCodigo -> opções)
  TDepsPorBaseValor  = TObjectDictionary<string, TDepsPorDepCodigo>;

  // BaseCodigo -> (BaseValor -> ...)
  TDepsPorBaseCodigo = TObjectDictionary<string, TDepsPorBaseValor>;

  // TratKey (Trib|Reg|Fund) -> (BaseCodigo -> ...)
  TDepsPorTrat       = TObjectDictionary<string, TDepsPorBaseCodigo>;

  TTipoConsulta = (cNormal, cOpcional);

  TAtributoPreenchido = record
    Codigo: string;
    Nome: string;
    Valor: string;
    ValorDescricao: string;
  end;

  TfrmAtributosTributarios = class(TForm)
    panel2: TPanel;
    pnlmenu: TPanel;
    Panel1: TPanel;
    lblAdicao: TLabel;
    lblProcesso: TLabel;
    Panel3: TPanel;
    btnSair: TPanel;
    scrCampos: TScrollBox;
    idHttp: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    Panel4: TPanel;
    grdItens: TDBGrid;
    qryAtributosTributariosItem: TFDQuery;
    dsAtributosFundamentoItem: TDataSource;
    qryAtributosTributariosItemNR_ITEM: TStringField;
    qryAtributosTributariosItemCD_MERCADORIA: TStringField;
    qryAtributosTributariosItemTX_DESC_DET_MERC: TStringField;
    btnSalvar: TPanel;
    pnlConexaoAntiga: TPanel;
    btnConsultar: TPanel;
    chkConexaoAntiga: TCheckBox;
    Label1: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure grdItensCellClick(Column: TColumn);
    procedure btnConsultarClick(Sender: TObject);
  private
    FDeps: TDepsPorTrat;
    FBaseCodigoPorTrat: TDictionary<string, string>;
    FAtualizandoDependencias: Boolean;
    FItemAtual: Integer;
    function GetCampoFromHint(const Hint, Campo: string): string;
    function GetTratKeyFromHint(const Hint: string): string;
    function GetComboValor(Cmb: TComboBox): string;
    function GetAtributosTributarios(pTipoConsulta: TTipoConsulta): String;
    procedure CriarCamposDinamicosMult(const JsonNormal, JsonOpcional: string; painel: TScrollBox);
    function ObterAtributosPreenchidos(const JSON: string; painel: TScrollBox): TArray<TAtributoPreenchido>;
    procedure Fechar;
    procedure InserirAtributosNoBanco(const JSON: string);
    procedure SalvarAtributosDigitados;
    procedure CarregarAtributosDoBanco;
    procedure ProcessarUmJSON(const JSON: string; painel: TScrollBox; var yPos: Integer; TipoConsulta: String);
    function PostApi(uri, JsonText: String; var ResultText: String): Boolean;
    procedure AtualizarDependentes(const TratKey, BaseCodigo,
      BaseValor: string);
    procedure BaseComboChange(Sender: TObject);
    function CampoAplicavel(const TratKey, CodigoAttr: string): Boolean;
    { Private declarations }
  public
    { Public declarations }
    Token_old: String;
    CSRF_old: String;
    NrProcesso: String;
    NrAdicao: String;
    vFundamentoLegal: String;
    FJsonNormal: String;
    FJsonOpcional: String;

    // Dependências entre atributos (ex.: ATT_7000 depende do valor de ATT_2982)
    // Key 1: TratKey = Tributo|Regime|Fundamento
    // Key 2: Valor do atributo base (ATT_2982)
    // Value: lista de opções (Display = "valor | descricao") para o atributo dependente (ATT_7000)
    FDepObsAcordo: TObjectDictionary<string, TObjectDictionary<string, TStringList>>;

    procedure NALADIChange(Sender: TObject);
    procedure AtualizarObsAcordo(const TratKey, ValorNALADI: string);
    procedure ConsultarAtributosTributarios;

  end;

var
  frmAtributosTributarios: TfrmAtributosTributarios;

implementation

{$R *.dfm}

{ TfrmAtributosTributarios}


type
  TProcAtributo = reference to procedure(
    const ATratamento, AMercadoria, AAtributo: TJSONObject
  );

function TryGetObj(Obj: TJSONObject; const Name: string; out OutObj: TJSONObject): Boolean;
begin
  Result := Assigned(Obj) and Assigned(Obj.Values[Name]) and (Obj.Values[Name] is TJSONObject);
  if Result then
    OutObj := TJSONObject(Obj.Values[Name])
  else
    OutObj := nil;
end;

function TryGetArr(Obj: TJSONObject; const Name: string; out OutArr: TJSONArray): Boolean;
begin
  Result := Assigned(Obj) and Assigned(Obj.Values[Name]) and (Obj.Values[Name] is TJSONArray);
  if Result then
    OutArr := TJSONArray(Obj.Values[Name])
  else
    OutArr := nil;
end;

/// Percorre tratamentos → mercadorias → atributos e executa o callback
procedure ForEachAtributoDoJsonNovo(const Root: TJSONObject; const ProcAtributo: TProcAtributo);
var
  ArrTrat: TJSONArray;
  ObjTrat: TJSONObject;
  ArrMerc: TJSONArray;
  ObjMerc: TJSONObject;
  ArrAttr: TJSONArray;
  ObjAttr: TJSONObject;
  i, j, k: Integer;
begin
  if not TryGetArr(Root, 'tratamentosTributarios', ArrTrat) then Exit;

  for i := 0 to ArrTrat.Count - 1 do
    if ArrTrat.Items[i] is TJSONObject then
    begin
      ObjTrat := TJSONObject(ArrTrat.Items[i]);

      if TryGetArr(ObjTrat, 'mercadorias', ArrMerc) then
        for j := 0 to ArrMerc.Count - 1 do
          if ArrMerc.Items[j] is TJSONObject then
          begin
            ObjMerc := TJSONObject(ArrMerc.Items[j]);

            if TryGetArr(ObjMerc, 'atributos', ArrAttr) then
              for k := 0 to ArrAttr.Count - 1 do
                if ArrAttr.Items[k] is TJSONObject then
                begin
                  ObjAttr := TJSONObject(ArrAttr.Items[k]);
                  ProcAtributo(ObjTrat, ObjMerc, ObjAttr);
                end;
          end;
    end;
end;

/// Conveniências para pegar campos novos quando existirem
function GetRegimeCodigo(const Trat: TJSONObject): string;
var O: TJSONObject;
begin
  if TryGetObj(Trat, 'regime', O) then
    Result := O.GetValue<string>('codigo', '')
  else
    Result := '';
end;

function GetRegimeNome(const Trat: TJSONObject): string;
var O: TJSONObject;
begin
  if TryGetObj(Trat, 'regime', O) then
    Result := O.GetValue<string>('nome', '')
  else
    Result := '';
end;

function GetTributoCodigo(const Trat: TJSONObject): string;
var O: TJSONObject;
begin
  if TryGetObj(Trat, 'tributo', O) then
    Result := O.GetValue<string>('codigo', '')
  else
    Result := '';
end;

function GetTributoNome(const Trat: TJSONObject): string;
var O: TJSONObject;
begin
  if TryGetObj(Trat, 'tributo', O) then
    Result := O.GetValue<string>('nome', '')
  else
    Result := '';
end;

function GetFundamentoCodigo(const Trat: TJSONObject): string;
var O: TJSONObject;
begin
  if TryGetObj(Trat, 'fundamentoLegal', O) then
    Result := O.GetValue<string>('codigo', '')
  else
    Result := '';
end;

function GetLocalPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

procedure GravaTeste(json, prefixoArquivo, extensao: String);
var
  vstring:  TStringList;
begin
  if system.DebugHook > 0 then
  begin
    vString := TStringList.Create;
    try
      vString.text := json;
      vString.SaveToFile(GetLocalPath + prefixoArquivo +'_'+ formatDatetime('ddmmyy.hhnn', now)+'.'+extensao);
    finally
      vString.Free;
    end;
  end;
end;

procedure TfrmAtributosTributarios.Fechar;
var
  ParentForm: TCustomForm;
begin
  Self.Close;

  ParentForm := GetParentForm(Self);
  if ParentForm <> nil then
    ParentForm.Close;
end;

function TfrmAtributosTributarios.GetAtributosTributarios(pTipoConsulta: TTipoConsulta): String;
var
  vMensagem: String;
  vResultText: String;
  uri: String;
  urlIndaia: String;
  vJsonTributos: String;
  vNCM, vPais, vFundamentoLegal, vRegime: String;


  function GerarJSON: string;
  var
    JSONObject, Tributo, Regime, FundamentoLegal, Atributo, Mercadoria, TratamentoTributario, FundamentoOpcional: TJSONObject;
    TratamentosArray, FundamentosArray, MercadoriasArray, AtributosArray: TJSONArray;
    vQuery: TFDQuery;
  begin
    vQuery := TFDQuery.Create(nil);
    try
      vQuery.Connection := dtmDuimp.FDConnection1;
      vQuery.SQL.Text :=
          'WITH BASE AS ( ' + #13#10 +
          '    SELECT ' + #13#10 +
          '        AD.CD_MERCADORIA_NCM AS NCM, ' + #13#10 +
          '        CASE ' + #13#10 +
          '            WHEN ISNULL(AD.CD_PAIS_ORIG_MERC, '''') <>'''' ' + #13#10 +
          '                THEN AD.CD_PAIS_ORIG_MERC ' + #13#10 +
          '            ELSE AD.CD_PAIS_AQUIS_MERC ' + #13#10 +
          '        END AS PAIS, ' + #13#10 +

          '        1 AS CODIGO_TRIBUTO_II, ' + #13#10 +
          '        AD.CD_REGIME_TRIBUTAR       AS REGIME_II, ' + #13#10 +
          '        CD_FUND_LEGAL_II_DUIMP      AS FUNDAMENTO_II, ' + #13#10 +

          '        2 AS CODIGO_TRIBUTO_IPI, ' + #13#10 +
          '        T.CD_TIPO_BENEF_IPI         AS REGIME_IPI, ' + #13#10 +
          '        CD_FUND_LEGAL_IPI_DUIMP     AS FUNDAMENTO_IPI, ' + #13#10 +

          '        6 AS CODIGO_TRIBUTO_PIS, ' + #13#10 +

          '        CASE ' + #13#10 +
          '          WHEN AD.CD_TIPO_BENEF_PIS_COFINS = 1 THEN ''1'' /*Integral*/ ' + #13#10 +
          '          WHEN AD.CD_TIPO_BENEF_PIS_COFINS = 3 THEN ''4'' /*Redução*/ ' + #13#10 +
          '          WHEN AD.CD_TIPO_BENEF_PIS_COFINS = 2 THEN ''3'' /*Isenção*/ ' + #13#10 +
          '          WHEN AD.CD_TIPO_BENEF_PIS_COFINS = 4 THEN ''5'' /*Suspensão*/ ' + #13#10 +
          '          WHEN AD.CD_TIPO_BENEF_PIS_COFINS = 5 THEN ''6'' /*Não Incidência*/ ' + #13#10 +
          '        END AS REGIME_PIS, ' + #13#10 +

          '        CD_FUND_LEGAL_PISCOFINS_DUIMP AS FUNDAMENTO_PIS, ' + #13#10 +

          '        7 AS CODIGO_TRIBUTO_COFINS, ' + #13#10 +
//          '        CD_TIPO_BENEF_PIS_COFINS    AS REGIME_COFINS, ' + #13#10 +
          '        CASE ' + #13#10 +
          '          WHEN AD.CD_TIPO_BENEF_PIS_COFINS = 1 THEN ''1'' /*Integral*/ ' + #13#10 +
          '          WHEN AD.CD_TIPO_BENEF_PIS_COFINS = 3 THEN ''4'' /*Redução*/ ' + #13#10 +
          '          WHEN AD.CD_TIPO_BENEF_PIS_COFINS = 2 THEN ''3'' /*Isenção*/ ' + #13#10 +
          '          WHEN AD.CD_TIPO_BENEF_PIS_COFINS = 4 THEN ''5'' /*Suspensão*/ ' + #13#10 +
          '          WHEN AD.CD_TIPO_BENEF_PIS_COFINS = 5 THEN ''6'' /*Não Incidência*/ ' + #13#10 +
          '        END AS REGIME_COFINS, ' + #13#10 +
          '        CD_FUND_LEGAL_PISCOFINS_DUIMP AS FUNDAMENTO_COFINS ' + #13#10 +
          '    FROM TADICAO_DE_IMPORTACAO AD ' + #13#10 +
          '    INNER JOIN TRIBUTO T ' + #13#10 +
          '        ON T.NR_PROCESSO = AD.NR_PROCESSO ' + #13#10 +
          '       AND T.NR_ADICAO  = AD.NR_ADICAO ' + #13#10 +
          '       AND T.CD_RECEITA_IMPOSTO = ''0002'' ' + #13#10 +
          '    OUTER APPLY ( ' + #13#10 +
          '        SELECT CD_SCX_EXP AS PAIS ' + #13#10 +
          '        FROM TPAIS_BROKER_OFICIAL ' + #13#10 +
          '        WHERE CD_PAIS = ( ' + #13#10 +
          '            CASE ' + #13#10 +
          '                WHEN AD.CD_PAIS_ORIG_MERC IS NOT NULL ' + #13#10 +
          '                    THEN AD.CD_PAIS_ORIG_MERC ' + #13#10 +
          '                ELSE AD.CD_PAIS_AQUIS_MERC ' + #13#10 +
          '            END ' + #13#10 +
          '        ) ' + #13#10 +
          '    ) AS PBO ' + #13#10 +
          '    WHERE AD.NR_PROCESSO = :NrProcesso ' + #13#10 +
          '      AND AD.NR_ADICAO   = :NrAdicao ' + #13#10 +
          ') ' + #13#10 +
          'SELECT ' + #13#10 +
          '    B.NCM, ' + #13#10 +
          '    B.PAIS, ' + #13#10 +
          '    V.CODIGO_TRIBUTO, ' + #13#10 +
          '    V.REGIME, ' + #13#10 +
          '    V.FUNDAMENTO, ' + #13#10 +
          '    FL.NCM_VIGENTE ' + #13#10 +
          'FROM BASE B ' + #13#10 +
          'CROSS APPLY (VALUES ' + #13#10 +
          '    (CODIGO_TRIBUTO_II,     REGIME_II,          FUNDAMENTO_II), ' + #13#10 +
          '    (CODIGO_TRIBUTO_IPI,    REGIME_IPI,         FUNDAMENTO_IPI), ' + #13#10 +
          '    (CODIGO_TRIBUTO_PIS,    REGIME_PIS,         FUNDAMENTO_PIS), ' + #13#10 +
          '    (CODIGO_TRIBUTO_COFINS, REGIME_COFINS,      FUNDAMENTO_COFINS) ' + #13#10 +
          ') AS V (CODIGO_TRIBUTO, REGIME, FUNDAMENTO) ' + #13#10 +
          'LEFT JOIN TFUNDAMENTO_LEGAL_Pucomex FL ON FL.CODIGO = V.FUNDAMENTO ';
        if pTipoConsulta = cOpcional then
          vQuery.SQL.Text := vQuery.SQL.Text + ' WHERE ISNULL(V.FUNDAMENTO, '''') <> '''' ';

      vQuery.ParamByName('NrProcesso').AsString := NrProcesso;
      vQuery.ParamByName('NrAdicao').AsString := NrAdicao;
//      Gravateste(vQuery.SQL.Text, 'ConsultaAttTrib', 'sql');
      vQuery.Open;

      if vQuery.RecordCount < 1 then
        exit('');

      JSONObject := TJSONObject.Create;
      try
        JSONObject.AddPair('ncm', vQuery.FieldByName('NCM').AsString);
        JSONObject.AddPair('codigoPais', vQuery.FieldByName('PAIS').AsString);
        JSONObject.AddPair('dataFatoGerador', formatdatetime('yyyy-mm-dd',now));
        JSONObject.AddPair('tipoOperacao', 'I');

        // Fundamentos Opcionais
        if pTipoConsulta = cOpcional then
        begin
          FundamentosArray := TJSONArray.Create;
          while not vQuery.eof do
          begin
            FundamentoOpcional := TJSONObject.Create;
            FundamentoOpcional.AddPair('codigoTributo', vQuery.FieldByName('CODIGO_TRIBUTO').AsString);
            FundamentoOpcional.AddPair('codigoRegime', vQuery.FieldByName('REGIME').AsString);
            FundamentoOpcional.AddPair('codigoFundamentoLegal', vQuery.FieldByName('FUNDAMENTO').AsString);

            if vQuery.FieldByName('NCM_VIGENTE').AsString = 'N' then
              FundamentoOpcional.AddPair('codigoNomenclaturaAlternativa', vQuery.FieldByName('NCM').AsString);

            FundamentosArray.AddElement(FundamentoOpcional);
            vQuery.Next;
          end;
          JSONObject.AddPair('fundamentosOpcionais', FundamentosArray);
        end;
        Result := JSONObject.ToJSON;
      finally
        JSONObject.Free;

      end;
    finally
      vQuery.Free;
    end;
  end;

begin

  lblProcesso.Caption := 'Processo: ' + NrProcesso;
  lblAdicao.Caption := 'Adição: ' + NrAdicao;

  vJsonTributos := GerarJson;
//  vJsonTributos :=
//  '{'+
//  '  "codigoPais": "240",'+
//  '  "dataFatoGerador": "2026-01-05",'+
//  '  "fundamentosOpcionais": ['+
//  '      {'+
//  '          "codigoFundamentoLegal": 21,'+
//  '          "codigoRegime": 1,'+
//  '          "codigoTributo": 1'+
//  '      }'+
//  '  ],'+
//  '  "ncm": "39021020",'+
//  '  "tipoOperacao": "I"'+
//'}';

  if vJsonTributos = '' then
    exit('');

//GravaTeste(vJsonTributos, 'ConsAttTribAd2', 'json');

  uri := 'https://portalunico.siscomex.gov.br/ttce/api/ext/tratamentos-tributarios/importacao/';

  if not chkConexaoAntiga.Checked then
  begin
//    if system.DebugHook > 0 then
//      urlIndaia := 'http://localhost:2001/ApiProxyPortalUnico'
//    else
      urlIndaia := 'https://api.myindaia.com.br/ApiProxyPortalUnico';

    if  Api_viaServidor(urlIndaia, 'edgar', post, uri, vResultText, vJsonTributos) then
    begin
      pnlConexaoAntiga.Visible := false;
    end
    else
    begin
      pnlConexaoAntiga.Visible := true;
      raise Exception.Create('Tentativa de conexão pelo proxy interno: ' + vResultText );
    end;
  end
  else
  begin
    if not Conectar(vMensagem) then
    begin
      ShowMessage('Não foi possível conectar ao portal.');
      pnlConexaoAntiga.Visible := true;
      raise Exception.Create('Tentativa de conexão pelo método antigo');
    end;
    PostApi(uri, vJsonTributos, vResultText);
    pnlConexaoAntiga.Visible := false;
  end;

//  GravaJsonTeste(vResultText);
  result := vResultText;


end;

function TfrmAtributosTributarios.PostApi(uri, JsonText: String; var ResultText: String): Boolean;
var
  Response: TStringStream;
  vString: TStringStream;
  URL: String;
  RespostaCod, RespostaMsg: String;
begin

  URL := uri;
  Response := TStringStream.Create('');
  try
    IdHTTP.Request.CustomHeaders.Clear;
    IdHTTP.Request.Clear;
    IdHTTP.Request.ContentType := 'application/json';
    IdHTTP.Request.ContentEncoding := 'raw';
    idHttp.Request.AcceptCharSet := 'UTF-8';
    IdHTTP.Request.Accept := 'application/json';
    IdHTTP.Response.CharSet := 'UTF-8';
    IdHTTP.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';
    IdHTTP.Request.CustomHeaders.Values['Authorization']:= Token;
    IdHTTP.Request.CustomHeaders.Values['X-CSRF-Token']:= CSRF;
    IdHTTP.Request.Referer := URL;

    vString := TStringStream.Create(JsonText);
    try
      try
          idHTTP.post(URL , vString, Response);
      except
      on E:EIdHTTPProtocolException do
        begin
          ResultText := e.ErrorMessage;
          result:= false;
        end;
      end;

      if idHttp.Response.ResponseCode = 201 then
      begin
        ResultText := response.DataString;
        result := true;
      end
      else
      begin
        if idHttp.Response.ResponseCode = 422 then
        begin
          CSRF := idHttp.Response.RawHeaders.Values['X-CSRF-Token'];
        end;

        if ResultText = '' then
          ResultText := response.DataString;
        result := false;
      end;

    finally
      vstring.Free;
    end;

  finally
    FreeAndNil(Response);
  end;
end;

procedure TfrmAtributosTributarios.ConsultarAtributosTributarios;
var
  vjson : TStringlist;
begin

  vjson := tstringlist.Create;
  try
    vPastaCertificados := 'C:\DDBROKER\Certificados\';

    qryAtributosTributariosItem.ParamByName('NrProcesso').AsString := NrProcesso;
    qryAtributosTributariosItem.ParamByName('NrAdicao').AsString := NrAdicao;
    qryAtributosTributariosItem.Open;

    try

//      vjson.LoadFromFile('C:\Projetos\Delphi\integracaoDuimp\bin\AttTrib1_020226.1720.json');
      vjson.Text := GetAtributosTributarios(cNormal);
      FJsonNormal := vjson.Text;
//      GravaTeste(FJsonNormal, 'AttTrib1', 'json');

      vJson.Clear;
//      vjson.LoadFromFile('D:\Indaiá\Projetos\Duimp\Testes AtributosTributários\TesteAttTrib_301025.145300out.json');
      vjson.Text := GetAtributosTributarios(cOpcional);
      if vjson.Text <> '' then
        FJsonOpcional := vjson.Text;

//      GravaTeste(FJsonOpcional, 'AttTrib2', 'json');
      if (FJsonNormal <> '') or (FJsonOpcional <> '') then
      begin
        InserirAtributosNoBanco(FJsonNormal);
        InserirAtributosNoBanco(FJsonOpcional);
        CriarCamposDinamicosMult(FJsonNormal, FJsonOpcional, scrCampos);
        CarregarAtributosDoBanco;
      end;
    except
      on E: Exception do
      begin
        Showmessage(e.Message);
      end;
    end;
  finally
    vjson.Free;
  end;
end;

procedure TfrmAtributosTributarios.CarregarAtributosDoBanco;
var
  qrySel: TFDQuery;
  vItem: Integer;
  vItemStr: string;

  procedure LimparValoresTela;
  var
    i: Integer;
    C: TControl;
  begin
    for i := 0 to scrCampos.ControlCount - 1 do
    begin
      C := scrCampos.Controls[i];

      // se o campo está oculto (não aplicável), não deve ser salvo
      if (not C.Visible) or (not C.Enabled) then
        Continue;


      if C is TEdit then
        TEdit(C).Text := ''
      else if C is TComboBox then
        TComboBox(C).ItemIndex := -1
      else if C is TRadioGroup then
        TRadioGroup(C).ItemIndex := -1;
    end;
  end;

  procedure AplicarLinhaNaTela(
    const Tributo, Regime, Fundamento, CodigoAttr,
          TipoAttr, Valor, DescValor: string);
  var
    i, j: Integer;
    C: TControl;
    TributoC, RegimeC, FundC, CodC: string;
    S, Target: string;
    P: Integer;

    function Extrair(const S, Campo: string): string;
    var
      P2: Integer;
      Tmp: string;
    begin
      Result := '';
      P2 := Pos(Campo + '=', S);
      if P2 > 0 then
      begin
        Tmp := Copy(S, P2 + Length(Campo) + 1, MaxInt);
        P2 := Pos(';', Tmp);
        if P2 > 0 then
          Result := Copy(Tmp, 1, P2 - 1)
        else
          Result := Tmp;
      end;
    end;

  begin
    // percorre todos os controles e acha o que corresponde a essa linha do banco
    for i := 0 to scrCampos.ControlCount - 1 do
    begin
      C := scrCampos.Controls[i];

      if not (C is TEdit) and
         not (C is TComboBox) and
         not (C is TRadioGroup) then
        Continue;

      if C.Hint = '' then
        Continue;

      TributoC := Extrair(C.Hint, 'Tributo');
      RegimeC  := Extrair(C.Hint, 'Regime');
      FundC    := Extrair(C.Hint, 'Fundamento');
      CodC     := Extrair(C.Hint, 'Codigo');

      if (TributoC <> Tributo) or
         (RegimeC  <> Regime)  or
         (FundC    <> Fundamento) or
         (CodC     <> CodigoAttr) then
        Continue;

      // ---- TEdit ----
      if C is TEdit then
      begin
        TEdit(C).Text := Valor;
        Exit;
      end;

      // ---- TComboBox ---- (Domínio dinâmico: itens "0002 | Aeronaves nacionais")
      if C is TComboBox then
      begin
        if TComboBox(C).Items.Count = 0 then
          Exit;

        // monta "0002 | Aeronaves nacionais"
        Target := '';
        if Valor <> '' then
        begin
          Target := Valor;
          if DescValor <> '' then
            Target := Target + ' | ' + DescValor;
        end
        else if DescValor <> '' then
          Target := DescValor;

        // 1ª tentativa: match exato
        if Target <> '' then
        begin
          j := TComboBox(C).Items.IndexOf(Target);
          if j >= 0 then
          begin
            TComboBox(C).ItemIndex := j;
            if SameText(Extrair(C.Hint, 'Codigo'), 'ATT_2982') then
              NALADIChange(C);

            if SameText(Extrair(C.Hint, 'Codigo'), 'ATT_2982') then
              NALADIChange(C);

            Exit;
          end;
        end;

        // 2ª tentativa: procura só pelo código (Valor) no início da string
        if Valor <> '' then
        begin
          for j := 0 to TComboBox(C).Items.Count - 1 do
          begin
            S := TComboBox(C).Items[j];
            P := Pos('|', S);
            if P > 0 then
              S := Trim(Copy(S, 1, P - 1))
            else
              S := Trim(S);

            if SameText(S, Valor) then
            begin
              TComboBox(C).ItemIndex := j;
              Exit;
            end;
          end;
        end;

        Exit;
      end;

      // ---- TRadioGroup ----
      if C is TRadioGroup then
      begin
        TRadioGroup(C).ItemIndex := -1;

        if SameText(Valor, 'S') or SameText(DescValor, 'SIM') then
          TRadioGroup(C).ItemIndex := 0
        else if SameText(Valor, 'N') or SameText(DescValor, 'NAO') or SameText(DescValor, 'NÃO') then
          TRadioGroup(C).ItemIndex := 1;

        Exit;
      end;
    end;
  end;

begin
  // pega o item selecionado no grid
  vItem := qryAtributosTributariosItem.FieldByName('NR_ITEM').AsInteger;
  vItemStr := FormatFloat('000', vItem); // NrItem é char(3)

  qrySel := TFDQuery.Create(nil);
  try
    qrySel.Connection := dtmDuimp.FDConnection1;

    qrySel.SQL.Text :=
      'SELECT TributoCodigo, RegimeCodigo, FundamentoCodigo, ' +
      '       AtributoCodigo, AtributoTipoCodigo, ' +
      '       AtributoValor, AtributoDescricaoValor ' +
      'FROM TDuimpAtributosTributarios ' +
      'WHERE NrProcesso = :NrProcesso ' +
      '  AND NrAdicao   = :NrAdicao ' +
      '  AND NrItem     = :NrItem';

    qrySel.ParamByName('NrProcesso').AsString := NrProcesso;
    qrySel.ParamByName('NrAdicao').AsString   := NrAdicao;
    qrySel.ParamByName('NrItem').AsString     := vItemStr;
    qrySel.Open;

    // 1) limpa tudo antes de aplicar valores do item atual
    LimparValoresTela;

    // 2) aplica os valores do banco nos controles
    while not qrySel.Eof do
    begin
      AplicarLinhaNaTela(
        qrySel.FieldByName('TributoCodigo').AsString,
        qrySel.FieldByName('RegimeCodigo').AsString,
        qrySel.FieldByName('FundamentoCodigo').AsString,
        qrySel.FieldByName('AtributoCodigo').AsString,
        qrySel.FieldByName('AtributoTipoCodigo').AsString,
        qrySel.FieldByName('AtributoValor').AsString,
        qrySel.FieldByName('AtributoDescricaoValor').AsString
      );

      qrySel.Next;
    end;

  finally
    qrySel.Free;
  end;
end;

function TfrmAtributosTributarios.ObterAtributosPreenchidos(
  const JSON: string; painel: TScrollBox): TArray<TAtributoPreenchido>;
var
  LParser, ObjTrat, ObjMerc, ObjAttr: TJSONObject;
  ArrTrat, ArrMerc, ArrAttr: TJSONArray;
  i, j, k: Integer;

  // Mapas por código do atributo
  MapNome: TDictionary<string, string>;   // codigo -> descricaoCodigo (nome)
  MapTipo: TDictionary<string, string>;   // codigo -> tipoCodigo
  MapDom : TDictionary<string, TDictionary<string, string>>;
  // codigo -> (descricaoValor -> valor) para resolver seleção do Combo

  // Controles
  ComboBox: TComboBox;
  RadioGroup: TRadioGroup;
  EditCampo: TEdit;

  // Auxiliares
  Cod, Nome, Tipo, Valor, DescValor: string;
  Atributo: TAtributoPreenchido;
  DescricaoSelecionada: string;

  // Helpers locais
  function TryGetArr(Obj: TJSONObject; const Name: string; out A: TJSONArray): Boolean;
  begin
    Result := Assigned(Obj) and Assigned(Obj.Values[Name]) and (Obj.Values[Name] is TJSONArray);
    if Result then A := TJSONArray(Obj.Values[Name]) else A := nil;
  end;

  function TryGetObj(Obj: TJSONObject; const Name: string; out O: TJSONObject): Boolean;
  begin
    Result := Assigned(Obj) and Assigned(Obj.Values[Name]) and (Obj.Values[Name] is TJSONObject);
    if Result then O := TJSONObject(Obj.Values[Name]) else O := nil;
  end;

  function IsDominioDinamico(const S: string): Boolean;
  begin
    Result := ContainsText(S, 'DOMÍNIO') or ContainsText(S, 'DOMINIO'); // segura acento e variações
  end;

  function IsBooleano(const S: string): Boolean;
  begin
    Result := ContainsText(S, 'BOOLEAN');
  end;

  function IsNumero(const S: string): Boolean;
  begin
    Result := ContainsText(S, 'NÚMERO') or ContainsText(S, 'NUMERO') or ContainsText(S, 'INTEIRO');
  end;

  procedure EnsureDomMapFor(const ACodigo: string);
  begin
    if not MapDom.ContainsKey(ACodigo) then
      MapDom.Add(ACodigo, TDictionary<string, string>.Create);
  end;

var
  Keys: TArray<string>;
  Dom: TDictionary<string, string>;
begin
  SetLength(Result, 0);

  MapNome := TDictionary<string, string>.Create;
  MapTipo := TDictionary<string, string>.Create;
  MapDom  := TDictionary<string, TDictionary<string, string>>.Create;

  LParser := TJSONObject.ParseJSONValue(JSON) as TJSONObject;
  try
    // 1) Varre tratamentos → mercadorias → atributos e constrói os mapas
    if TryGetArr(LParser, 'tratamentosTributarios', ArrTrat) then
    begin
      for i := 0 to ArrTrat.Count - 1 do
        if ArrTrat.Items[i] is TJSONObject then
        begin
          ObjTrat := TJSONObject(ArrTrat.Items[i]);

          if TryGetArr(ObjTrat, 'mercadorias', ArrMerc) then
            for j := 0 to ArrMerc.Count - 1 do
              if ArrMerc.Items[j] is TJSONObject then
              begin
                ObjMerc := TJSONObject(ArrMerc.Items[j]);

                if TryGetArr(ObjMerc, 'atributos', ArrAttr) then
                  for k := 0 to ArrAttr.Count - 1 do
                    if ArrAttr.Items[k] is TJSONObject then
                    begin
                      ObjAttr := TJSONObject(ArrAttr.Items[k]);

                      Cod       := ObjAttr.GetValue<string>('codigo', '');
                      Nome      := ObjAttr.GetValue<string>('descricaoCodigo', '');
                      Tipo      := ObjAttr.GetValue<string>('tipoCodigo', '');
                      Valor     := ObjAttr.GetValue<string>('valor', '');
                      DescValor := ObjAttr.GetValue<string>('descricaoValor', '');

                      if Cod <> '' then
                      begin
                        // Nome do atributo (primeiro que aparecer fica)
                        if (Nome <> '') and (not MapNome.ContainsKey(Cod)) then
                          MapNome.Add(Cod, Nome);

                        // Tipo do atributo (último prevalece, mas em geral é o mesmo)
                        if MapTipo.ContainsKey(Cod) then
                          MapTipo[Cod] := Tipo
                        else
                          MapTipo.Add(Cod, Tipo);

                        // Se for domínio dinâmico, monte (descricao -> valor)
                        if IsDominioDinamico(Tipo) and (DescValor <> '') then
                        begin
                          EnsureDomMapFor(Cod);
                          Dom := MapDom[Cod];
                          if not Dom.ContainsKey(DescValor) then
                            Dom.Add(DescValor, Valor);
                        end;
                      end;
                    end;
              end;
        end;
    end;

    // 2) Agora lê os controles por código e monta o array de retorno
    Keys := MapNome.Keys.ToArray;
    for Cod in Keys do
    begin
      Nome := MapNome[Cod];
      Tipo := MapTipo.TryGetValue(Cod, Tipo).ToString; // só para evitar AV se não existir

      FillChar(Atributo, SizeOf(Atributo), 0);
      Atributo.Codigo := Cod;
      Atributo.Nome   := Nome;
      Atributo.Valor  := '';
      Atributo.ValorDescricao := '';

      if IsDominioDinamico(Tipo) then
      begin
        // ComboBox com itens de domínio dinâmico
        ComboBox := painel.FindChildControl('cmb_' + Cod) as TComboBox;
        if Assigned(ComboBox) and (ComboBox.ItemIndex >= 0) then
        begin
          DescricaoSelecionada := ComboBox.Items[ComboBox.ItemIndex];
          if MapDom.TryGetValue(Cod, Dom) then
          begin
            if Dom.TryGetValue(DescricaoSelecionada, Valor) then
            begin
              Atributo.Valor := Valor;
              Atributo.ValorDescricao := DescricaoSelecionada;
            end
            else
            begin
              // fallback: se não achou a descrição no mapa, salve a descrição ao menos
              Atributo.ValorDescricao := DescricaoSelecionada;
            end;
          end
          else
          begin
            // sem mapa (caso raro) — guarda descrição
            Atributo.ValorDescricao := DescricaoSelecionada;
          end;
        end;
      end
      else if IsBooleano(Tipo) then
      begin
        RadioGroup := painel.FindChildControl('rdg_' + Cod) as TRadioGroup;
        if Assigned(RadioGroup) then
        begin
          if RadioGroup.ItemIndex = 0 then
            Atributo.Valor := 'true'
          else if RadioGroup.ItemIndex = 1 then
            Atributo.Valor := 'false';
        end;
      end
      else if IsNumero(Tipo) then
      begin
        EditCampo := painel.FindChildControl('edt_' + Cod) as TEdit;
        if Assigned(EditCampo) then
          Atributo.Valor := Trim(EditCampo.Text);
      end
      else
      begin
        // TEXTO (ou qualquer outro tipo não mapeado explicitamente)
        EditCampo := painel.FindChildControl('edt_' + Cod) as TEdit;
        if Assigned(EditCampo) then
          Atributo.Valor := EditCampo.Text;
      end;

      // adiciona no array
      SetLength(Result, Length(Result) + 1);
      Result[High(Result)] := Atributo;
    end;

  finally
    // liberar mapas
    for Dom in MapDom.Values do
      Dom.Free;
    MapDom.Free;
    MapTipo.Free;
    MapNome.Free;

    LParser.Free;
  end;
end;

procedure TfrmAtributosTributarios.CriarCamposDinamicosMult(
  const JsonNormal, JsonOpcional: string; painel: TScrollBox);

  procedure ClearPanelControls;
  var
    c: TControl;
    idx: Integer;
  begin
  // (re)cria o mapa de dependências para esta renderização
  if Assigned(FDepObsAcordo) then
    FDepObsAcordo.Free;
  FDepObsAcordo := TObjectDictionary<string, TObjectDictionary<string, TStringList>>.Create([doOwnsValues]);

    for idx := painel.ControlCount - 1 downto 0 do
    begin
      c := painel.Controls[idx];
      c.Free;
    end;
  end;

var
  yPos: Integer;
begin
  // limpa tudo e começa do topo
  ClearPanelControls;
  yPos := 10;

  // JSON do fundamento "Normal"
  if JsonNormal <> '' then
    ProcessarUmJSON(JsonNormal, painel, yPos, 'Obrigatórios');

  // JSON do fundamento "Opcional"
  if JsonOpcional <> '' then
    ProcessarUmJSON(JsonOpcional, painel, yPos, 'Opcionais');

  painel.VertScrollBar.Range := yPos + 20;
end;

function TfrmAtributosTributarios.GetCampoFromHint(const Hint, Campo: string): string;
var
  P2: Integer;
  Tmp: string;
begin
  Result := '';
  P2 := Pos(Campo + '=', Hint);
  if P2 > 0 then
  begin
    Tmp := Copy(Hint, P2 + Length(Campo) + 1, MaxInt);
    P2 := Pos(';', Tmp);
    if P2 > 0 then
      Result := Copy(Tmp, 1, P2 - 1)
    else
      Result := Tmp;
  end;
end;

function TfrmAtributosTributarios.GetTratKeyFromHint(const Hint: string): string;
var
  Trib, Reg, Fund: string;
begin
  Trib := GetCampoFromHint(Hint, 'Tributo');
  Reg  := GetCampoFromHint(Hint, 'Regime');
  Fund := GetCampoFromHint(Hint, 'Fundamento');
  Result := Trib + '|' + Reg + '|' + Fund;
end;

function TfrmAtributosTributarios.GetComboValor(Cmb: TComboBox): string;
var
  S: string;
  P: Integer;
begin
  Result := '';
  if (Cmb = nil) or (Cmb.ItemIndex < 0) then
    Exit;

  S := Cmb.Items[Cmb.ItemIndex];
  P := Pos('|', S);
  if P > 0 then
    Result := Trim(Copy(S, 1, P - 1))
  else
    Result := Trim(S);
end;

procedure TfrmAtributosTributarios.BaseComboChange(Sender: TObject);
var
  Cmb: TComboBox;
  TratKey, BaseCodigo, BaseValor: string;
begin
  if FAtualizandoDependencias then
    Exit;

  if not (Sender is TComboBox) then
    Exit;

  Cmb := TComboBox(Sender);

  TratKey   := GetTratKeyFromHint(Cmb.Hint);
  BaseCodigo:= GetCampoFromHint(Cmb.Hint, 'Codigo');
  BaseValor := GetComboValor(Cmb);

  AtualizarDependentes(TratKey, BaseCodigo, BaseValor);
end;

procedure TfrmAtributosTributarios.AtualizarDependentes(
  const TratKey, BaseCodigo, BaseValor: string);
var
  DepPorBaseCodigo: TDepsPorBaseCodigo;
  DepPorBaseValor : TDepsPorBaseValor;
  DepPorDepCodigo : TDepsPorDepCodigo;

  i: Integer;
  C: TControl;

  ThisTratKey: string;
  Cod: string;

  LblCampo: TLabel;

  IsBase: Boolean;
  IsAplicavel: Boolean;

  // helpers para limpar
  procedure OcultarEClearCombo(Cmb: TComboBox);
  begin
    Cmb.Visible := False;
    Cmb.Enabled := False;
    Cmb.Items.Clear;
    Cmb.ItemIndex := -1;
  end;

  procedure OcultarEClearEdit(E: TEdit);
  begin
    E.Visible := False;
    E.Enabled := False;
    E.Text := '';
  end;

  procedure OcultarEClearRadio(R: TRadioGroup);
  begin
    R.Visible := False;
    R.Enabled := False;
    R.ItemIndex := -1;
  end;

  procedure MostrarControle(ACtrl: TControl);
  begin
    ACtrl.Visible := True;
    ACtrl.Enabled := True;
  end;

begin
  if FAtualizandoDependencias then
    Exit;

  if not Assigned(FDeps) then
    Exit;

  // mapa do tratamento/base
  if not FDeps.TryGetValue(TratKey, DepPorBaseCodigo) then
    Exit;

  if not DepPorBaseCodigo.TryGetValue(BaseCodigo, DepPorBaseValor) then
    Exit;

  // pode não existir dependência para BaseValor (nenhum dependente aplicável)
  if not DepPorBaseValor.TryGetValue(BaseValor, DepPorDepCodigo) then
    DepPorDepCodigo := nil;

  FAtualizandoDependencias := True;
  try
    for i := 0 to scrCampos.ControlCount - 1 do
    begin
      C := scrCampos.Controls[i];

      if not (C is TComboBox) and
         not (C is TEdit) and
         not (C is TRadioGroup) then
        Continue;

      // só mexe nos controles do MESMO tratamento (hint existe em todos)
      ThisTratKey := GetTratKeyFromHint(C.Hint);
      if not SameText(ThisTratKey, TratKey) then
        Continue;

      Cod := GetCampoFromHint(C.Hint, 'Codigo');
      if Cod = '' then
        Continue;

      // label pareado via Tag (vale para combo/edit/radio)
      LblCampo := TLabel(Pointer(C.Tag));

      IsBase := SameText(Cod, BaseCodigo);

      // Base nunca some
      if IsBase then
      begin
        MostrarControle(C);
        if Assigned(LblCampo) then
          LblCampo.Visible := True;
        Continue;
      end;

      // aplicável se existir no mapa para o BaseValor atual
      IsAplicavel := Assigned(DepPorDepCodigo) and DepPorDepCodigo.ContainsKey(Cod);

      if not IsAplicavel then
      begin
        // NÃO aplicável: oculta + limpa
        if C is TComboBox then
          OcultarEClearCombo(TComboBox(C))
        else if C is TEdit then
          OcultarEClearEdit(TEdit(C))
        else if C is TRadioGroup then
          OcultarEClearRadio(TRadioGroup(C));

        if Assigned(LblCampo) then
          LblCampo.Visible := False;

        Continue;
      end;

      // APLICÁVEL: mostra (e se combo, carrega opções)
      if C is TComboBox then
      begin
        TComboBox(C).Items.Clear;

        // Obs: para dependentes não-domínio, a lista pode vir vazia, então só Assign se existir
        if Assigned(DepPorDepCodigo) and DepPorDepCodigo.ContainsKey(Cod) then
          TComboBox(C).Items.Assign(DepPorDepCodigo[Cod]);

        MostrarControle(C);

        // se não tiver itens, mantém itemindex -1 (usuário escolhe)
        if TComboBox(C).Items.Count = 0 then
          TComboBox(C).ItemIndex := -1;
      end
      else
      begin
        // Edit/Radio: só mostrar (valores vêm do banco / usuário digita)
        MostrarControle(C);
      end;

      if Assigned(LblCampo) then
        LblCampo.Visible := True;
    end;

  finally
    FAtualizandoDependencias := False;
  end;
end;

function TfrmAtributosTributarios.CampoAplicavel(
  const TratKey, CodigoAttr: string): Boolean;
var
  BaseCodigo: string;
  DepPorBaseCodigo: TDepsPorBaseCodigo;
  DepPorBaseValor : TDepsPorBaseValor;
  DepPorDepCodigo : TDepsPorDepCodigo;

  Trib, Reg, Fund: string;
  P1, P2: Integer;

  CmbBase: TComboBox;
  BaseValor: string;
begin
  // padrão: aplicável (não bloqueia seu fluxo quando não houver mapa)
  Result := True;

  if (CodigoAttr = '') then
    Exit;

  if not Assigned(FBaseCodigoPorTrat) then
    Exit;

  if not FBaseCodigoPorTrat.TryGetValue(TratKey, BaseCodigo) then
    Exit;

  // o próprio campo base é sempre aplicável
  if SameText(CodigoAttr, BaseCodigo) then
    Exit;

  // localizar valor selecionado do campo base na tela
  P1 := Pos('|', TratKey);
  P2 := PosEx('|', TratKey, P1 + 1);

  if (P1 <= 0) or (P2 <= 0) then
  begin
    Result := False;
    Exit;
  end;

  Trib := Copy(TratKey, 1, P1 - 1);
  Reg  := Copy(TratKey, P1 + 1, P2 - P1 - 1);
  Fund := Copy(TratKey, P2 + 1, MaxInt);

  CmbBase := scrCampos.FindChildControl(
               Format('cmb_%s_%s_%s_%s', [Trib, Reg, Fund, BaseCodigo])
             ) as TComboBox;

  BaseValor := GetComboValor(CmbBase);

  // sem base selecionada: dependentes não se aplicam
  if BaseValor = '' then
  begin
    Result := False;
    Exit;
  end;

  // se não existir mapa, considera não aplicável (evita gravar lixo)
  if (not Assigned(FDeps)) or (not FDeps.TryGetValue(TratKey, DepPorBaseCodigo)) then
  begin
    Result := False;
    Exit;
  end;

  if not DepPorBaseCodigo.TryGetValue(BaseCodigo, DepPorBaseValor) then
  begin
    Result := False;
    Exit;
  end;

  if not DepPorBaseValor.TryGetValue(BaseValor, DepPorDepCodigo) then
  begin
    Result := False;
    Exit;
  end;

  // aplicável se existir no mapa do BaseValor selecionado
  Result := Assigned(DepPorDepCodigo) and DepPorDepCodigo.ContainsKey(CodigoAttr);
end;

procedure TfrmAtributosTributarios.ProcessarUmJSON(
  const JSON: string; painel: TScrollBox; var yPos: Integer; TipoConsulta: String);
var
  LParser, ObjTrat, ObjMerc, ObjAttr: TJSONObject;
  ObjFund, ObjTrib, ObjReg: TJSONObject;
  ArrTrat, ArrMerc, ArrAttr: TJSONArray;
  i, j, k: Integer;

  // UI
  lbl, lblCtx: TLabel;
  Combo: TComboBox;
  Radio: TRadioGroup;
  Edit: TEdit;

  // aux gerais
  TribCod, TribNome: string;
  RegimeCod, RegimeNome: string;
  FundCod, FundNome, FundTipo: string;
  TratKey: string;

  Cod, Nome, Tipo, DescValor, ValorAttr, Display: string;

  // mapas por atributo dentro de CADA tratamento
  MapNome: TDictionary<string, string>;       // codigo -> descricaoCodigo
  MapTipo: TDictionary<string, string>;       // codigo -> tipoCodigo
  MapDom : TDictionary<string, TStringList>;  // codigo -> lista de "valor | descricaoValor"
  SL: TStringList;
  Keys: TStringList;

  // dependência genérica (base = 1º domínio dinâmico por mercadoria)
  BaseCodigoGen, BaseValorGen: string;
  DepPorTrat: TObjectDictionary<string, TObjectDictionary<string, TObjectDictionary<string, TStringList>>>;
  DepPorBase: TObjectDictionary<string, TObjectDictionary<string, TStringList>>;
  DepPorValor: TObjectDictionary<string, TStringList>;
  DepListGen: TStringList;

  // base do tratamento
  BaseCodigoTrat: string;

  // set de dependentes do tratamento (para visibilidade inicial e ordenação)
  DepCodigosTrat: TDictionary<string, Boolean>;
  DepPorBaseTrat: TObjectDictionary<string, TObjectDictionary<string, TStringList>>;
  DepPorDepTrat : TObjectDictionary<string, TStringList>;
  DepCod: string;



  IsBase, IsDep, VisIni: Boolean;

  function TryGetArr(Obj: TJSONObject; const Name: string; out A: TJSONArray): Boolean;
  begin
    Result := Assigned(Obj) and Assigned(Obj.Values[Name]) and (Obj.Values[Name] is TJSONArray);
    if Result then A := TJSONArray(Obj.Values[Name]) else A := nil;
  end;

  function TryGetObj(Obj: TJSONObject; const Name: string; out O: TJSONObject): Boolean;
  begin
    Result := Assigned(Obj) and Assigned(Obj.Values[Name]) and (Obj.Values[Name] is TJSONObject);
    if Result then O := TJSONObject(Obj.Values[Name]) else O := nil;
  end;

  function RemoveAcentos(const S: string): string;
  const
    Acentos  = 'ÁÀÂÃÄáàâãäÉÈÊËéèêëÍÌÎÏíìîïÓÒÔÕÖóòôõöÚÙÛÜúùûüÇç';
    SemAcent = 'AAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUUuuuuCc';
  var
    x, p: Integer;
    C: Char;
    R: string;
  begin
    R := S;
    for x := 1 to Length(R) do
    begin
      C := R[x];
      p := Pos(C, Acentos);
      if p > 0 then
        R[x] := SemAcent[p];
    end;
    Result := R;
  end;

  function IsDominioDinamico(const S: string): Boolean;
  var
    L: string;
  begin
    L := UpperCase(RemoveAcentos(Trim(S)));
    Result := (Pos('DOMINIO', L) > 0) and (Pos('DINAMICO', L) > 0);
  end;

  function IsBooleano(const S: string): Boolean;
  var
    L: string;
  begin
    L := UpperCase(RemoveAcentos(Trim(S)));
    Result := (Pos('BOOLEAN', L) > 0) or (Pos('LOGICO', L) > 0);
  end;

  function IsNumero(const S: string): Boolean;
  var
    L: string;
  begin
    L := UpperCase(RemoveAcentos(Trim(S)));
    Result := (Pos('NUMERO', L) > 0) or (Pos('INTEIRO', L) > 0);
  end;

  procedure EnsureListFor(const ACodigo: string);
  begin
    if not MapDom.ContainsKey(ACodigo) then
      MapDom.Add(ACodigo, TStringList.Create);
  end;

  procedure AddLabelAtributo(
    const ACodigo, ATitulo, ATrib, AReg, AFund: string;
    AVisivelInicial: Boolean);
  begin
    lbl := TLabel.Create(painel);
    lbl.Parent := painel;
    lbl.Caption := ATitulo;
    lbl.Left := 10;
    lbl.Top := yPos;
    lbl.Name := Format('lbl_%s_%s_%s_%s', [ATrib, AReg, AFund, ACodigo]);
    lbl.Visible := AVisivelInicial;
    yPos := yPos + lbl.Height + 2;
  end;

begin
  LParser := TJSONObject.ParseJSONValue(JSON) as TJSONObject;
  try
    if not Assigned(LParser) then
      Exit;

    if not Assigned(FDeps) then
      FDeps := TObjectDictionary<string, TObjectDictionary<string, TObjectDictionary<string, TObjectDictionary<string, TStringList>>>>.Create([doOwnsValues]);
    if not Assigned(FBaseCodigoPorTrat) then
      FBaseCodigoPorTrat := TDictionary<string, string>.Create;

    if TryGetArr(LParser, 'tratamentosTributarios', ArrTrat) then
    begin
      if ArrTrat.Count < 1 then
      begin
        lbl := TLabel.Create(painel);
        lbl.Parent := painel;
        lbl.Left := 10;
        lbl.Top := yPos;
        lbl.Font.Style := [fsBold];
        lbl.Caption := 'Não existe atributos ' + TipoConsulta;
        yPos := yPos + lbl.Height + 6;
        Exit;
      end;

      for i := 0 to ArrTrat.Count - 1 do
        if ArrTrat.Items[i] is TJSONObject then
        begin
          ObjTrat := TJSONObject(ArrTrat.Items[i]);

          TribCod   := '';
          TribNome  := '';
          RegimeCod := '';
          RegimeNome:= '';
          FundCod   := '';
          FundNome  := '';
          FundTipo  := '';

          if TryGetObj(ObjTrat, 'tributo', ObjTrib) then
          begin
            TribCod  := ObjTrib.GetValue<string>('codigo', '');
            TribNome := ObjTrib.GetValue<string>('nome',   '');
          end;

          if TryGetObj(ObjTrat, 'regime', ObjReg) then
          begin
            RegimeCod  := ObjReg.GetValue<string>('codigo', '');
            RegimeNome := ObjReg.GetValue<string>('nome',   '');
          end;

          if TryGetObj(ObjTrat, 'fundamentoLegal', ObjFund) then
          begin
            FundCod  := ObjFund.GetValue<string>('codigo', '');
            FundNome := ObjFund.GetValue<string>('nome',   '');
            FundTipo := ObjFund.GetValue<string>('tipo',   '');
          end;

          TratKey := TribCod + '|' + RegimeCod + '|' + FundCod;

          // ✅ Base é POR TRATAMENTO
          BaseCodigoTrat := '';
          FBaseCodigoPorTrat.TryGetValue(TratKey, BaseCodigoTrat);

          // cabeçalho
          if (TribCod <> '') or (RegimeCod <> '') or (FundCod <> '') then
          begin
            lbl := TLabel.Create(painel);
            lbl.Parent := painel;
            lbl.Left := 10;
            lbl.Top := yPos;
            lbl.Font.Style := [fsBold];
            lbl.Caption :=
              Format('Tributo %s (%s)  |  Regime %s  |  Fundamento %s (%s)',
                     [TribCod, TribNome, RegimeCod, FundCod, FundTipo]);
            yPos := yPos + lbl.Height + 6;
          end;

          MapNome := TDictionary<string, string>.Create;
          MapTipo := TDictionary<string, string>.Create;
          MapDom  := TDictionary<string, TStringList>.Create;
          try
            // mercadorias
            if TryGetArr(ObjTrat, 'mercadorias', ArrMerc) then
            begin
              for j := 0 to ArrMerc.Count - 1 do
                if ArrMerc.Items[j] is TJSONObject then
                begin
                  ObjMerc := TJSONObject(ArrMerc.Items[j]);

                  if not TryGetArr(ObjMerc, 'atributos', ArrAttr) then
                    Continue;

                  // base por mercadoria = 1º domínio dinâmico
                  BaseCodigoGen := '';
                  BaseValorGen  := '';

                  for k := 0 to ArrAttr.Count - 1 do
                    if ArrAttr.Items[k] is TJSONObject then
                    begin
                      ObjAttr := TJSONObject(ArrAttr.Items[k]);
                      Cod  := ObjAttr.GetValue<string>('codigo', '');
                      Tipo := ObjAttr.GetValue<string>('tipoCodigo', '');
                      if (BaseCodigoGen = '') and IsDominioDinamico(Tipo) then
                      begin
                        BaseCodigoGen := Cod;
                        BaseValorGen  := Trim(ObjAttr.GetValue<string>('valor', ''));
                        Break;
                      end;
                    end;

                  // trilha do dicionário
                  if (BaseCodigoGen <> '') then
                  begin
                    if BaseCodigoTrat = '' then
                    begin
                      BaseCodigoTrat := BaseCodigoGen;
                      FBaseCodigoPorTrat.AddOrSetValue(TratKey, BaseCodigoTrat);
                    end;

                    if not FDeps.TryGetValue(TratKey, DepPorTrat) then
                    begin
                      DepPorTrat := TObjectDictionary<string, TObjectDictionary<string, TObjectDictionary<string, TStringList>>>.Create([doOwnsValues]);
                      FDeps.Add(TratKey, DepPorTrat);
                    end;

                    if not DepPorTrat.TryGetValue(BaseCodigoGen, DepPorBase) then
                    begin
                      DepPorBase := TObjectDictionary<string, TObjectDictionary<string, TStringList>>.Create([doOwnsValues]);
                      DepPorTrat.Add(BaseCodigoGen, DepPorBase);
                    end;

                    if not DepPorBase.TryGetValue(BaseValorGen, DepPorValor) then
                    begin
                      DepPorValor := TObjectDictionary<string, TStringList>.Create([doOwnsValues]);
                      DepPorBase.Add(BaseValorGen, DepPorValor);
                    end;
                  end
                  else
                    DepPorValor := nil;

                  // processar atributos
                  for k := 0 to ArrAttr.Count - 1 do
                    if ArrAttr.Items[k] is TJSONObject then
                    begin
                      ObjAttr := TJSONObject(ArrAttr.Items[k]);

                      Cod       := ObjAttr.GetValue<string>('codigo',          '');
                      Nome      := ObjAttr.GetValue<string>('descricaoCodigo', '');
                      Tipo      := ObjAttr.GetValue<string>('tipoCodigo',      '');
                      DescValor := ObjAttr.GetValue<string>('descricaoValor',  '');
                      ValorAttr := ObjAttr.GetValue<string>('valor',           '');

                      if Cod = '' then
                        Continue;

                      // Nome/Tipo
                      if Nome <> '' then
                      begin
                        if MapNome.ContainsKey(Cod) then MapNome[Cod] := Nome else MapNome.Add(Cod, Nome);
                        if MapTipo.ContainsKey(Cod) then MapTipo[Cod] := Tipo else MapTipo.Add(Cod, Tipo);
                      end;

                      // Domínio dinâmico: lista de opções
                      if IsDominioDinamico(Tipo) and (DescValor <> '') then
                      begin
                        EnsureListFor(Cod);
                        SL := MapDom[Cod];

                        Display := Trim(ValorAttr);
                        if Display <> '' then
                          Display := Display + ' | ' + DescValor
                        else
                          Display := DescValor;

                        if SL.IndexOf(Display) < 0 then
                          SL.Add(Display);
                      end;

                      // ✅ Dependência por PRESENÇA (qualquer tipo)
                      if Assigned(DepPorValor) and (BaseCodigoGen <> '') and (BaseValorGen <> '') and
                         (not SameText(Cod, BaseCodigoGen)) then
                      begin
                        if not DepPorValor.ContainsKey(Cod) then
                        begin
                          DepListGen := TStringList.Create; // marcador; pode ficar vazio
                          DepListGen.Sorted := True;
                          DepListGen.Duplicates := dupIgnore;
                          DepPorValor.Add(Cod, DepListGen);
                        end;

                        // se for domínio dinâmico, grava opções também
                        if IsDominioDinamico(Tipo) and (DescValor <> '') then
                        begin
                          DepListGen := DepPorValor[Cod];

                          Display := Trim(ValorAttr);
                          if Display <> '' then
                            Display := Display + ' | ' + DescValor
                          else
                            Display := DescValor;

                          if DepListGen.IndexOf(Display) < 0 then
                            DepListGen.Add(Display);
                        end;
                      end;

                    end;
                end;
            end;

            // criar controles por tratamento
            Keys := TStringList.Create;
            try
              Keys.Sorted := True;
              Keys.Duplicates := dupIgnore;

              for Cod in MapNome.Keys do
                Keys.Add(Cod);

              // ✅ a partir daqui vamos reordenar manualmente
              Keys.Sorted := False;

              if BaseCodigoTrat = '' then
              begin
                for j := 0 to Keys.Count - 1 do
                begin
                  Cod := Keys[j];
                  if MapTipo.TryGetValue(Cod, Tipo) and IsDominioDinamico(Tipo) then
                  begin
                    BaseCodigoTrat := Cod;
                    FBaseCodigoPorTrat.AddOrSetValue(TratKey, BaseCodigoTrat);
                    Break;
                  end;
                end;
              end;

              // ✅ monta set de dependentes deste tratamento/base
              DepCodigosTrat := TDictionary<string, Boolean>.Create;
              try
                if FDeps.TryGetValue(TratKey, DepPorTrat) and DepPorTrat.TryGetValue(BaseCodigoTrat, DepPorBaseTrat) then
                begin
                  for DepPorDepTrat in DepPorBaseTrat.Values do
                    for DepCod in DepPorDepTrat.Keys do
                      DepCodigosTrat.AddOrSetValue(DepCod, True);
                end;

                // ✅ reordena: base primeiro
                j := Keys.IndexOf(BaseCodigoTrat);
                if j >= 0 then
                begin
                  Keys.Delete(j);
                  Keys.Insert(0, BaseCodigoTrat);
                end;

                // ✅ dependentes no fim
                for j := Keys.Count - 1 downto 1 do
                begin
                  Cod := Keys[j];
                  if DepCodigosTrat.ContainsKey(Cod) then
                  begin
                    Keys.Delete(j);
                    Keys.Add(Cod);
                  end;
                end;

                for j := 0 to Keys.Count - 1 do
                begin
                  Cod := Keys[j];

                  if not MapNome.TryGetValue(Cod, Nome) then
                    Continue;
                  MapTipo.TryGetValue(Cod, Tipo);

                  // visibilidade inicial: base sempre; dependentes começam ocultos; demais aparecem
                  // (isso corrige label/field sempre visível/invisível)

                  IsBase := SameText(Cod, BaseCodigoTrat);
                  IsDep  := DepCodigosTrat.ContainsKey(Cod);
                  VisIni := IsBase or (not IsDep);

                  AddLabelAtributo(Cod, Nome, TribCod, RegimeCod, FundCod, VisIni);

                  if IsDominioDinamico(Tipo) then
                  begin
                    Combo := TComboBox.Create(painel);
                    Combo.Parent := painel;
                    Combo.Name := Format('cmb_%s_%s_%s_%s', [TribCod, RegimeCod, FundCod, Cod]);
                    Combo.Left := 10;
                    Combo.Top  := yPos;
                    Combo.Width := 1000;
                    Combo.Style := csDropDownList;
                    Combo.Tag := NativeInt(lbl);

                    Combo.Hint := Format('Tributo=%s;Regime=%s;Fundamento=%s;Codigo=%s',
                                         [TribCod, RegimeCod, FundCod, Cod]);
                    Combo.ShowHint := False;

                    if MapDom.TryGetValue(Cod, SL) then
                      Combo.Items.Assign(SL);

                    Combo.Visible := VisIni;
                    Combo.Enabled := VisIni;

                    if IsBase then
                      Combo.OnChange := BaseComboChange;

                    yPos := yPos + Combo.Height + 12;
                  end
                  else if IsBooleano(Tipo) then
                  begin
                    Radio := TRadioGroup.Create(painel);
                    Radio.Parent := painel;
                    Radio.Name := Format('rdg_%s_%s_%s_%s', [TribCod, RegimeCod, FundCod, Cod]);
                    Radio.Left := 10;
                    Radio.Top  := yPos;
                    Radio.Items.Add('Sim');
                    Radio.Items.Add('Não');
                    Radio.Columns := 2;
                    Radio.Tag := NativeInt(lbl);

                    Radio.Hint := Format('Tributo=%s;Regime=%s;Fundamento=%s;Codigo=%s',
                                         [TribCod, RegimeCod, FundCod, Cod]);
                    Radio.ShowHint := False;

                    Radio.Visible := VisIni;
                    Radio.Enabled := VisIni;

                    yPos := yPos + Radio.Height + 12;
                  end
                  else
                  begin
                    Edit := TEdit.Create(painel);
                    Edit.Parent := painel;
                    Edit.Name := Format('edt_%s_%s_%s_%s', [TribCod, RegimeCod, FundCod, Cod]);
                    Edit.Left := 10;
                    Edit.Top  := yPos;
                    Edit.Width := 300;
                    Edit.Tag  := NativeInt(lbl);

                    Edit.Hint := Format('Tributo=%s;Regime=%s;Fundamento=%s;Codigo=%s',
                                        [TribCod, RegimeCod, FundCod, Cod]);
                    Edit.ShowHint := False;

                    Edit.Visible := VisIni;
                    Edit.Enabled := VisIni;

                    yPos := yPos + Edit.Height + 12;
                  end;
                end;

                yPos := yPos + 8;
              finally
                DepCodigosTrat.Free;
              end;

            finally
              Keys.Free;
            end;

          finally
            for SL in MapDom.Values do
              SL.Free;
            MapDom.Free;
            MapTipo.Free;
            MapNome.Free;
          end;
        end;
    end;

  finally
    LParser.Free;
  end;
end;

procedure TfrmAtributosTributarios.AtualizarObsAcordo(const TratKey, ValorNALADI: string);
var
  DepByBase: TObjectDictionary<string, TStringList>;
  Opts: TStringList;

  TreatTrib, TreatReg, TreatFund: string;
  P: Integer;
  Tmp: string;

  CmbObs: TComboBox;
  LblObs: TLabel;
begin
  // TratKey = Trib|Reg|Fund
  TreatTrib := '';
  TreatReg  := '';
  TreatFund := '';

  Tmp := TratKey;

  P := Pos('|', Tmp);
  if P > 0 then
  begin
    TreatTrib := Copy(Tmp, 1, P - 1);
    System.Delete(Tmp, 1, P); // <-- CORRIGIDO (qualificado)

    P := Pos('|', Tmp);
    if P > 0 then
    begin
      TreatReg  := Copy(Tmp, 1, P - 1);
      TreatFund := Copy(Tmp, P + 1, MaxInt);
    end;
  end;

  CmbObs := scrCampos.FindChildControl(
              Format('cmb_%s_%s_%s_ATT_7000', [TreatTrib, TreatReg, TreatFund])
            ) as TComboBox;

  LblObs := scrCampos.FindChildControl(
              Format('lbl_%s_%s_%s_ATT_7000', [TreatTrib, TreatReg, TreatFund])
            ) as TLabel;

  if not Assigned(CmbObs) then
    Exit;

  // default: ocultar
  CmbObs.Visible := False;
  CmbObs.Enabled := False;
  CmbObs.Items.Clear;
  CmbObs.ItemIndex := -1;
  if Assigned(LblObs) then
    LblObs.Visible := False;

  if not Assigned(FDepObsAcordo) then
    Exit;

  if not FDepObsAcordo.TryGetValue(TratKey, DepByBase) then
    Exit;

  if ValorNALADI = '' then
    Exit;

  if not DepByBase.TryGetValue(ValorNALADI, Opts) then
    Exit;

  // mostrar e carregar opções válidas
  CmbObs.Items.Assign(Opts);
  if CmbObs.Items.Count > 0 then
  begin
    CmbObs.Visible := True;
    CmbObs.Enabled := True;
    if Assigned(LblObs) then
      LblObs.Visible := True;
  end;
end;

procedure TfrmAtributosTributarios.NALADIChange(Sender: TObject);
var
  C: TComboBox;
  TratKey, Trib, Reg, Fund, S: string;
  P: Integer;

  function ExtrairCampo(const HintStr, Campo: string): string;
  var
    P2: Integer;
    Tmp: string;
  begin
    Result := '';
    P2 := Pos(Campo + '=', HintStr);
    if P2 > 0 then
    begin
      Tmp := Copy(HintStr, P2 + Length(Campo) + 1, MaxInt);
      P2 := Pos(';', Tmp);
      if P2 > 0 then
        Result := Copy(Tmp, 1, P2 - 1)
      else
        Result := Tmp;
    end;
  end;

begin
  if not (Sender is TComboBox) then
    Exit;

  C := TComboBox(Sender);

  Trib := ExtrairCampo(C.Hint, 'Tributo');
  Reg  := ExtrairCampo(C.Hint, 'Regime');
  Fund := ExtrairCampo(C.Hint, 'Fundamento');

  TratKey := Trib + '|' + Reg + '|' + Fund;

  S := '';
  if C.ItemIndex >= 0 then
  begin
    S := C.Items[C.ItemIndex];
    P := Pos('|', S);
    if P > 0 then
      S := Trim(Copy(S, 1, P-1))
    else
      S := Trim(S);
  end;

  AtualizarObsAcordo(TratKey, S);
end;

procedure TfrmAtributosTributarios.btnConsultarClick(Sender: TObject);
begin
  ConsultarAtributosTributarios;
end;

procedure TfrmAtributosTributarios.btnSairClick(Sender: TObject);
begin
  Fechar;
end;

procedure TfrmAtributosTributarios.btnSalvarClick(Sender: TObject);
begin
  SalvarAtributosDigitados;
end;

procedure TfrmAtributosTributarios.SalvarAtributosDigitados;
var
  qryUpd: TFDQuery;
  AplicarTodos: Boolean;
  bm: TBookmark;
  vItem: Integer;
  vItemStr: string;

  procedure SalvarParaItem(const ItemStr: string);
  var
    i: Integer;
    C: TControl;
    Valor, DescValor: string;
    Tributo, Regime, Fundamento, CodigoAttr: string;
    TratKey: string;
    S: string;
    P: Integer;

    function Extrair(const S, Campo: string): string;
    var
      P2: Integer;
      Tmp: string;
    begin
      Result := '';
      P2 := Pos(Campo + '=', S);
      if P2 > 0 then
      begin
        Tmp := Copy(S, P2 + Length(Campo) + 1, MaxInt);
        P2 := Pos(';', Tmp);
        if P2 > 0 then
          Result := Copy(Tmp, 1, P2 - 1)
        else
          Result := Tmp;
      end;
    end;

    function CampoVazio: Boolean;
    begin
      Result := Trim(Valor) = '';
    end;

  begin
    // percorre os controles da tela
    for i := 0 to scrCampos.ControlCount - 1 do
    begin
      C := scrCampos.Controls[i];

      if not (C is TEdit) and
         not (C is TComboBox) and
         not (C is TRadioGroup) then
        Continue;

      // extrair chave do Hint
      Tributo    := Extrair(C.Hint, 'Tributo');
      Regime     := Extrair(C.Hint, 'Regime');
      Fundamento := Extrair(C.Hint, 'Fundamento');
      CodigoAttr := Extrair(C.Hint, 'Codigo');

      if (Tributo = '') or (Regime = '') or (Fundamento = '') or (CodigoAttr = '') then
        Continue;

      // ❗ NOVA REGRA GENÉRICA (antes de validar/gravar)
      TratKey := Tributo + '|' + Regime + '|' + Fundamento;

      // preencher valores default
      Valor := '';
      DescValor := '';

      // ---- TEdit ----
      if C is TEdit then
      begin
        Valor := Trim(TEdit(C).Text);
        DescValor := Valor;
      end;

      // ---- TComboBox ----
      if C is TComboBox then
      begin
        if TComboBox(C).ItemIndex >= 0 then
        begin
          S := TComboBox(C).Items[TComboBox(C).ItemIndex];
          P := Pos('|', S);

          if P > 0 then
          begin
            Valor     := Trim(Copy(S, 1, P - 1));          // código ex: "0002"
            DescValor := Trim(Copy(S, P + 1, MaxInt));     // descrição ex: "Aeronaves nacionais"
          end
          else
          begin
            Valor     := Trim(S);
            DescValor := Trim(S);
          end;
        end;
      end;

      // ---- TRadioGroup ----
      if C is TRadioGroup then
      begin
        case TRadioGroup(C).ItemIndex of
          0:
            begin
              Valor := 'S';
              DescValor := 'Sim';
            end;
          1:
            begin
              Valor := 'N';
              DescValor := 'Não';
            end;
        end;
      end;

      // preparar chaves do UPDATE (sempre, pois também vamos limpar quando não aplicável)
      qryUpd.ParamByName('NrProcesso').AsString := NrProcesso;
      qryUpd.ParamByName('NrAdicao').AsString   := NrAdicao;
      qryUpd.ParamByName('NrItem').AsString     := ItemStr;

      qryUpd.ParamByName('TributoCodigo').AsString    := Tributo;
      qryUpd.ParamByName('RegimeCodigo').AsString     := Regime;
      qryUpd.ParamByName('FundamentoCodigo').AsString := Fundamento;
      qryUpd.ParamByName('AtributoCodigo').AsString   := CodigoAttr;

      // ❗ NOVA REGRA GENÉRICA:
      // Se o atributo NÃO é aplicável para o valor atual do campo base do tratamento,
      // não valida nem grava; limpa no banco para remover dados antigos.
      if not CampoAplicavel(TratKey, CodigoAttr) then
      begin
        qryUpd.ParamByName('AtributoValor').Clear;
        qryUpd.ParamByName('AtributoDescricaoValor').Clear;
        qryUpd.ExecSQL;
        Continue;
      end;

      // validação: campo obrigatório (somente quando aplicável)
      if CampoVazio then
        raise Exception.Create(
          Format(
            'O campo do atributo "%s" (Tributo %s, Regime %s, Fundamento %s, Item %s) não foi preenchido.',
            [CodigoAttr, Tributo, Regime, Fundamento, ItemStr]
          ));

      // UPDATE (quando aplicável)
      qryUpd.ParamByName('AtributoValor').AsString          := Valor;
      qryUpd.ParamByName('AtributoDescricaoValor').AsString := DescValor;

      qryUpd.ExecSQL;
    end;
  end;

begin
  AplicarTodos :=
    MessageDlg('Deseja salvar essas informações em todos os itens?',
               mtConfirmation, [mbYes, mbNo], 0) = mrYes;

  qryUpd := TFDQuery.Create(nil);
  try
    qryUpd.Connection := dtmDuimp.FDConnection1;

    qryUpd.SQL.Text :=
      'UPDATE TDuimpAtributosTributarios SET ' +
      '  AtributoValor = :AtributoValor, ' +
      '  AtributoDescricaoValor = :AtributoDescricaoValor ' +
      'WHERE NrProcesso = :NrProcesso ' +
      '  AND NrAdicao   = :NrAdicao ' +
      '  AND NrItem     = :NrItem ' +
      '  AND TributoCodigo    = :TributoCodigo ' +
      '  AND RegimeCodigo     = :RegimeCodigo ' +
      '  AND FundamentoCodigo = :FundamentoCodigo ' +
      '  AND AtributoCodigo   = :AtributoCodigo';

    if AplicarTodos then
    begin
      bm := qryAtributosTributariosItem.GetBookmark;
      try
        qryAtributosTributariosItem.DisableControls;
        qryAtributosTributariosItem.First;

        while not qryAtributosTributariosItem.Eof do
        begin
          vItem := qryAtributosTributariosItem.FieldByName('NR_ITEM').AsInteger;
          vItemStr := FormatFloat('000', vItem);

          SalvarParaItem(vItemStr);

          qryAtributosTributariosItem.Next;
        end;

      finally
        qryAtributosTributariosItem.GotoBookmark(bm);
        qryAtributosTributariosItem.FreeBookmark(bm);
        qryAtributosTributariosItem.EnableControls;
      end;

      ShowMessage('Campos salvos em todos os itens.');

    end
    else
    begin
      vItem := qryAtributosTributariosItem.FieldByName('NR_ITEM').AsInteger;
      vItemStr := FormatFloat('000', vItem);

      SalvarParaItem(vItemStr);

      ShowMessage('Campos salvos no item ' + vItemStr + '.');
    end;

  finally
    qryUpd.Free;
  end;
end;


procedure TfrmAtributosTributarios.grdItensCellClick(Column: TColumn);
begin
  if (FJsonNormal = '') and (FJsonNormal = '') then
    exit;

  if not qryAtributosTributariosItem.IsEmpty then
  begin
    CarregarAtributosDoBanco;
  end;
end;

procedure TfrmAtributosTributarios.InserirAtributosNoBanco(const JSON: string);
type
  // Metadados de um atributo para um tratamento tributário
  TAttrMeta = record
    TributoCodigo     : string;
    TributoNome       : string;
    RegimeCodigo      : string;
    RegimeNome        : string;
    FundamentoCodigo  : string;
    FundamentoNome    : string;
    FundamentoTipo    : string;
    AtributoCodigo          : string;
    AtributoDescricaoCodigo : string;
    AtributoDescricaoValor  : string;
    AtributoTipoCodigo      : string;
    AtributoValor           : string;
  end;

var
  qryIns, qrySel, qryChk: TFDQuery;
  LParser, ObjTrat, ObjMerc, ObjAttr: TJSONObject;
  ObjFund, ObjTrib, ObjReg: TJSONObject;
  ArrTrat, ArrMerc, ArrAttr: TJSONArray;
  i, j, k: Integer;

  ListaAttr: TList<TAttrMeta>;
  Meta: TAttrMeta;

  TribCod, TribNome: string;
  RegCod, RegNome  : string;
  FundCod, FundNome, FundTipo: string;

  // helpers locais

  function TryGetArr(Obj: TJSONObject; const Name: string; out A: TJSONArray): Boolean;
  begin
    Result := Assigned(Obj) and Assigned(Obj.Values[Name]) and (Obj.Values[Name] is TJSONArray);
    if Result then A := TJSONArray(Obj.Values[Name]) else A := nil;
  end;

  function TryGetObj(Obj: TJSONObject; const Name: string; out O: TJSONObject): Boolean;
  begin
    Result := Assigned(Obj) and Assigned(Obj.Values[Name]) and (Obj.Values[Name] is TJSONObject);
    if Result then O := TJSONObject(Obj.Values[Name]) else O := nil;
  end;

  // evita duplicar o mesmo atributo dentro do mesmo tratamento
  // chave: Tributo + Regime + Fundamento + AtributoCodigo
  function ExistsAttr(const A: TAttrMeta): Boolean;
  var
    idx: Integer;
    B: TAttrMeta;
  begin
    Result := False;
    for idx := 0 to ListaAttr.Count - 1 do
    begin
      B := ListaAttr[idx];
      if (B.TributoCodigo    = A.TributoCodigo)    and
         (B.RegimeCodigo     = A.RegimeCodigo)     and
         (B.FundamentoCodigo = A.FundamentoCodigo) and
         (B.AtributoCodigo   = A.AtributoCodigo) then
      begin
        Exit(True);
      end;
    end;
  end;

begin
  qryIns := TFDQuery.Create(nil);
  qrySel := TFDQuery.Create(nil);
  qryChk := TFDQuery.Create(nil);
  ListaAttr := TList<TAttrMeta>.Create;
  LParser := TJSONObject.ParseJSONValue(JSON) as TJSONObject;

  try
    if not Assigned(LParser) then
      Exit;

    // 1) Montar lista de metadados a partir do JSON (Normal ou Opcional)
    if TryGetArr(LParser, 'tratamentosTributarios', ArrTrat) then
    begin
      for i := 0 to ArrTrat.Count - 1 do
        if ArrTrat.Items[i] is TJSONObject then
        begin
          ObjTrat := TJSONObject(ArrTrat.Items[i]);

          TribCod   := '';
          TribNome  := '';
          RegCod    := '';
          RegNome   := '';
          FundCod   := '';
          FundNome  := '';
          FundTipo  := '';

          // tributo
          if TryGetObj(ObjTrat, 'tributo', ObjTrib) then
          begin
            TribCod  := ObjTrib.GetValue<string>('codigo', '');
            TribNome := ObjTrib.GetValue<string>('nome',   '');
          end;

          // regime
          if TryGetObj(ObjTrat, 'regime', ObjReg) then
          begin
            RegCod  := ObjReg.GetValue<string>('codigo', '');
            RegNome := ObjReg.GetValue<string>('nome',   '');
          end;

          // fundamento legal (tipo Normal/Opcional)
          if TryGetObj(ObjTrat, 'fundamentoLegal', ObjFund) then
          begin
            FundCod  := ObjFund.GetValue<string>('codigo', '');
            FundNome := ObjFund.GetValue<string>('nome',   '');
            FundTipo := ObjFund.GetValue<string>('tipo',   '');
          end;

          // mercadorias -> atributos
          if TryGetArr(ObjTrat, 'mercadorias', ArrMerc) then
          begin
            for j := 0 to ArrMerc.Count - 1 do
              if ArrMerc.Items[j] is TJSONObject then
              begin
                ObjMerc := TJSONObject(ArrMerc.Items[j]);

                if TryGetArr(ObjMerc, 'atributos', ArrAttr) then
                  for k := 0 to ArrAttr.Count - 1 do
                    if ArrAttr.Items[k] is TJSONObject then
                    begin
                      ObjAttr := TJSONObject(ArrAttr.Items[k]);

                      Meta.TributoCodigo     := TribCod;
                      Meta.TributoNome       := TribNome;
                      Meta.RegimeCodigo      := RegCod;
                      Meta.RegimeNome        := RegNome;
                      Meta.FundamentoCodigo  := FundCod;
                      Meta.FundamentoNome    := FundNome;
                      Meta.FundamentoTipo    := FundTipo;

                      Meta.AtributoCodigo          := ObjAttr.GetValue<string>('codigo',          '');
                      Meta.AtributoDescricaoCodigo := ObjAttr.GetValue<string>('descricaoCodigo', '');
                      Meta.AtributoDescricaoValor  := ''; // aqui é metadado do campo, não a opção
                      Meta.AtributoTipoCodigo      := ObjAttr.GetValue<string>('tipoCodigo',      '');
                      Meta.AtributoValor           := '';

                      if Meta.AtributoCodigo = '' then
                        Continue;

                      if not ExistsAttr(Meta) then
                        ListaAttr.Add(Meta);
                    end;
              end;
          end;
        end;
    end;

    if ListaAttr.Count = 0 then
    begin
      // Nenhum atributo encontrado nesse JSON
      Exit;
    end;

    // 2) Preparar queries
    qryIns.Connection := dtmDuimp.FDConnection1;
    qrySel.Connection := dtmDuimp.FDConnection1;
    qryChk.Connection := dtmDuimp.FDConnection1;

    qryIns.SQL.Text :=
      'INSERT INTO TDuimpAtributosTributarios ' +
      '(NrProcesso, NrAdicao, NrItem, ' +
      ' TributoCodigo, TributoNome, ' +
      ' RegimeCodigo, RegimeNome, ' +
      ' FundamentoCodigo, FundamentoNome, FundamentoTipo, ' +
      ' AtributoCodigo, AtributoDescricaoCodigo, AtributoDescricaoValor, ' +
      ' AtributoTipoCodigo, AtributoValor) ' +
      'VALUES ' +
      '(:NrProcesso, :NrAdicao, :NrItem, ' +
      ' :TributoCodigo, :TributoNome, ' +
      ' :RegimeCodigo, :RegimeNome, ' +
      ' :FundamentoCodigo, :FundamentoNome, :FundamentoTipo, ' +
      ' :AtributoCodigo, :AtributoDescricaoCodigo, :AtributoDescricaoValor, ' +
      ' :AtributoTipoCodigo, :AtributoValor)';

    // agora buscamos TODOS os itens da adição (não só os que "não existem")
    qrySel.SQL.Text :=
      'SELECT DM.NR_PROCESSO, DM.NR_ADICAO, DM.NR_ITEM ' +
      'FROM TDETALHE_MERCADORIA DM ' +
      'WHERE DM.NR_PROCESSO = :NR_PROCESSO ' +
      '  AND DM.NR_ADICAO   = :NR_ADICAO';

    qryChk.SQL.Text :=
      'SELECT 1 ' +
      'FROM TDuimpAtributosTributarios AT ' +
      'WHERE AT.NrProcesso      = :NrProcesso ' +
      '  AND AT.NrAdicao        = :NrAdicao ' +
      '  AND AT.NrItem          = :NrItem ' +
      '  AND AT.TributoCodigo   = :TributoCodigo ' +
      '  AND AT.RegimeCodigo    = :RegimeCodigo ' +
      '  AND AT.FundamentoCodigo= :FundamentoCodigo ' +
      '  AND AT.AtributoCodigo  = :AtributoCodigo';

    qrySel.ParamByName('NR_PROCESSO').AsString := NrProcesso;
    qrySel.ParamByName('NR_ADICAO').AsString   := NrAdicao;
    qrySel.Open;

    // 3) Inserir para cada item e para cada atributo (evitando duplicar)
    while not qrySel.Eof do
    begin
      // NR_ITEM já vem como char(3) no formato "001", "002", etc.
      // usamos diretamente:
      qryIns.ParamByName('NrProcesso').AsString := qrySel.FieldByName('NR_PROCESSO').AsString;
      qryIns.ParamByName('NrAdicao').AsString   := qrySel.FieldByName('NR_ADICAO').AsString;
      qryIns.ParamByName('NrItem').AsString     := qrySel.FieldByName('NR_ITEM').AsString;

      for i := 0 to ListaAttr.Count - 1 do
      begin
        Meta := ListaAttr[i];

        // verifica se já existe esse atributo para esse item
        qryChk.ParamByName('NrProcesso').AsString      := qryIns.ParamByName('NrProcesso').AsString;
        qryChk.ParamByName('NrAdicao').AsString        := qryIns.ParamByName('NrAdicao').AsString;
        qryChk.ParamByName('NrItem').AsString          := qryIns.ParamByName('NrItem').AsString;
        qryChk.ParamByName('TributoCodigo').AsString   := Meta.TributoCodigo;
        qryChk.ParamByName('RegimeCodigo').AsString    := Meta.RegimeCodigo;
        qryChk.ParamByName('FundamentoCodigo').AsString:= Meta.FundamentoCodigo;
        qryChk.ParamByName('AtributoCodigo').AsString  := Meta.AtributoCodigo;

        qryChk.Open;
        try
          if not qryChk.IsEmpty then
            Continue; // já existe, não insere de novo
        finally
          qryChk.Close;
        end;

        // monta INSERT
        qryIns.ParamByName('TributoCodigo').AsString           := Meta.TributoCodigo;
        qryIns.ParamByName('TributoNome').AsString             := Meta.TributoNome;
        qryIns.ParamByName('RegimeCodigo').AsString            := Meta.RegimeCodigo;
        qryIns.ParamByName('RegimeNome').AsString              := Meta.RegimeNome;
        qryIns.ParamByName('FundamentoCodigo').AsString        := Meta.FundamentoCodigo;
        qryIns.ParamByName('FundamentoNome').AsString          := Meta.FundamentoNome;
        qryIns.ParamByName('FundamentoTipo').AsString          := Meta.FundamentoTipo;
        qryIns.ParamByName('AtributoCodigo').AsString          := Meta.AtributoCodigo;
        qryIns.ParamByName('AtributoDescricaoCodigo').AsString := Meta.AtributoDescricaoCodigo;
        qryIns.ParamByName('AtributoDescricaoValor').AsString  := Meta.AtributoDescricaoValor; // em branco por enquanto
        qryIns.ParamByName('AtributoTipoCodigo').AsString      := Meta.AtributoTipoCodigo;
        qryIns.ParamByName('AtributoValor').AsString           := Meta.AtributoValor; // vazio, será preenchido depois

        qryIns.ExecSQL;
      end;

      qrySel.Next;
    end;

  finally
    ListaAttr.Free;
    qryChk.Free;
    qryIns.Free;
    qrySel.Free;
    LParser.Free;
  end;
end;

end.
