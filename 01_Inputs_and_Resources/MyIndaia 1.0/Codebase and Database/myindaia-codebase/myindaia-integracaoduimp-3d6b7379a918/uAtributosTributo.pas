//INDAIA10 PreencheAtributosTributarios 0101IM-004763-25 001
unit uAtributosTributo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, System.JSON, uJsonAtributosAdicionaisTributos, Vcl.Grids, Math,
  System.Types, dmDuimp, MyDialog, uIntegracaoAPIs;

type

  TAtributoParaSalvar = record
    NrProcesso: string;
    NrAdicao: string;
    TributoCodigo: string;
    TributoNome: string;
    RegimeCodigo: string;
    RegimeNome: string;
    FundamentoCodigo: string;
    FundamentoNome: string;
    FundamentoTipo: string;
    AtributoCodigo: string;
    AtributoDescricaoCodigo: string;
    AtributoDescricaoValor: string;
    AtributoTipoCodigo: string;
    AtributoValor: string;
  end;

  TfrmAtributosTributo = class(TForm)
    panel2: TPanel;
    pnlmenu: TPanel;
    Panel3: TPanel;
    idHttp: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    qryNcmItensProcesso: TFDQuery;
    qryNcmItensProcessoNR_PROCESSO: TStringField;
    qryNcmItensProcessoNR_ADICAO: TStringField;
    qryNcmItensProcessoNR_ITEM: TStringField;
    qryNcmItensProcessoCD_NCM_SH: TStringField;
    btnPIS: TBitBtn;
    memoPIS: TMemo;
    memoCOFINS: TMemo;
    btnCOFINS: TBitBtn;
    memoII: TMemo;
    btnII: TBitBtn;
    btnPIS_Detalhes: TBitBtn;
    memoPIS_Detalhes: TMemo;
    memoCOFINS_Detalhes: TMemo;
    btnCOFINS_Detalhes: TBitBtn;
    btnSalvar: TPanel;
    btnCancelar: TPanel;
    lblPis: TLabel;
    lblCofins: TLabel;
    lblII: TLabel;
    lblPIS_Detalhes: TLabel;
    lblCOFINS_Detalhes: TLabel;
    Panel1: TPanel;
    lblAdicao: TLabel;
    lblProcesso: TLabel;
    lblNCM: TLabel;
    lblFundamento: TLabel;
    lblRegime: TLabel;
    qryAtributosFundamentoItem: TFDQuery;
    qryAtributosFundamentoItemNR_ITEM: TStringField;
    qryAtributosFundamentoItemCD_MERCADORIA: TStringField;
    qryAtributosFundamentoItemTX_DESC_DET_MERC: TStringField;
    dsAtributosFundamentoItem: TDataSource;
    lblIPI: TLabel;
    memoIPI: TMemo;
    btnIPI: TBitBtn;
    pnlConexaoAntiga: TPanel;
    btnConsultar: TPanel;
    chkConexaoAntiga: TCheckBox;
    procedure btnNcmClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPISClick(Sender: TObject);
    procedure pnlmenuMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCOFINSClick(Sender: TObject);
    procedure btnIIClick(Sender: TObject);
    procedure btnPIS_DetalhesClick(Sender: TObject);
    procedure btnCOFINS_DetalhesClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnIPIClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
  private

    // PIS
    FPIS_ListaParaSalvar: TArray<TAtributoParaSalvar>;
    FPIS_Detalhes_ListaParaSalvar: TArray<TAtributoParaSalvar>;
    AtributoSelecionadoPIS: TAtributoParaSalvar;
    AtributoSelecionadoPIS_Detalhe: TAtributoParaSalvar;

    // COFINS
    FCOFINS_ListaParaSalvar: TArray<TAtributoParaSalvar>;
    FCOFINS_Detalhes_ListaParaSalvar: TArray<TAtributoParaSalvar>;
    AtributoSelecionadoCOFINS: TAtributoParaSalvar;
    AtributoSelecionadoCOFINS_Detalhe: TAtributoParaSalvar;

    // II
    FII_ListaParaSalvar: TArray<TAtributoParaSalvar>;
    AtributoSelecionadoII: TAtributoParaSalvar;

    // IPI
    FIPI_ListaParaSalvar: TArray<TAtributoParaSalvar>;
    AtributoSelecionadoIPI: TAtributoParaSalvar;

    gridPIS: TStringGrid;
    gridPIS_Detalhes: TStringGrid;
    gridCOFINS: TStringGrid;
    gridCOFINS_Detalhes: TStringGrid;
    gridII: TStringGrid;
    gridIPI: TStringGrid;
    FPIS_Atributos: TArray<TAtributo>;
    FPIS_Detalhes_Atributos: TArray<TAtributo>;
    FCOFINS_Atributos: TArray<TAtributo>;
    FCOFINS_Detalhes_Atributos: TArray<TAtributo>;
    FII_Atributos: TArray<TAtributo>;
    FIPI_Atributos: TArray<TAtributo>;

    function GerarJSON(pNCM, pPais, pFundamentoLegal, pRegime: String): string;
    function PostApi(uri, JsonText: String; var ResultText: String): Boolean;
    function GetAtributosTribruto : String;
    function Conectar(var vMensagem: String): Boolean;
    procedure MostrarComboSimulado(MemoDestino: TMemo; Grid: TStringGrid; Lista: TArray<string>) overload;
    procedure MostrarComboSimulado(MemoDestino: TMemo; Grid: TStringGrid; Lista: TArray<string>; PosLeft, PosTop: Integer) overload;
    procedure sgCustomClick(Sender: TObject);
    function DeveMostrarDetalhesPara(const Info: TAtributoParaSalvar): Boolean;
    procedure sgCustomDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SalvarAtributoNoBanco(const Info: TAtributoParaSalvar; NrItem: String);
    procedure SalvarTodosSelecionados;
    function ValidarCamposPreenchidos: Boolean;
    procedure GerarListaParaSalvar(
      Objeto: TAtributoTributo;
      TributoCodigo: string;
      out ListaFinal: TArray<TAtributoParaSalvar>;
      out ListaTexto: TArray<string>;
      Detalhes: Boolean = False);
    procedure ExcluirAtributosTributarios;
    procedure Fechar;
//    procedure GravaJsonStrteste(vstr: String);
    { Private declarations }

  public
    Token: String;
    CSRF: String;
    NrProcesso: String;
    NrAdicao: String;
    procedure ConsultarAtributosTributariosNCM;

    { Public declarations }
  end;

var
  frmAtributosTributo: TfrmAtributosTributo;
  FUltimoObjeto: TAtributoTributo;


implementation

uses
  System.Generics.Collections;

{$R *.dfm}

function GetLocalPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

procedure GravaJsonTeste(json: String);
var
  vstring:  TStringList;
begin
  vString := TStringList.Create;
  try
    vString.text := json;
    vString.SaveToFile(GetLocalPath + 'TesteAttTrib_'+formatDatetime('ddmmyy.hhnnssmmm', now)+'.json');
  finally
    vString.Free;
  end;
end;

procedure TfrmAtributosTributo.Fechar;
var
  ParentForm: TCustomForm;
begin
  Self.Close;

  ParentForm := GetParentForm(Self);
  if ParentForm <> nil then
    ParentForm.Close;
end;

procedure TfrmAtributosTributo.sgCustomDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Grid: TStringGrid;
  Texto: string;
  TextoRect: TRect;
  Flags: UINT;
  AlturaRequerida: Integer;
begin
  Grid := TStringGrid(Sender);
  Texto := Grid.Cells[ACol, ARow];

  // Configura cores de fundo e texto
  if gdSelected in State then
  begin
    Grid.Canvas.Brush.Color := clHighlight;
    Grid.Canvas.Font.Color := clHighlightText;
  end
  else
  begin
    Grid.Canvas.Brush.Color := clWhite;
    Grid.Canvas.Font.Color := clBlack;
  end;

  Grid.Canvas.FillRect(Rect);

  // Prepara o retângulo do texto com margem interna
  TextoRect := Rect;
  InflateRect(TextoRect, -6, -4);

  Flags := DT_LEFT or DT_NOPREFIX or DT_WORDBREAK or DT_TOP;

  // Calcula altura necessária
  DrawText(Grid.Canvas.Handle, PChar(Texto), -1, TextoRect,
           Flags or DT_CALCRECT);

  AlturaRequerida := TextoRect.Bottom - TextoRect.Top + 6;

  // Ajusta a altura da linha (se ainda não estiver adequada)
  if Grid.RowHeights[ARow] <> AlturaRequerida then
    Grid.RowHeights[ARow] := AlturaRequerida;

  // Redesenha com o texto real
  TextoRect := Rect;
  InflateRect(TextoRect, -6, -4);

  DrawText(Grid.Canvas.Handle, PChar(Texto), -1, TextoRect, Flags);
end;

function TfrmAtributosTributo.DeveMostrarDetalhesPara(const Info: TAtributoParaSalvar): Boolean;
var
  i, j: Integer;
  TT: TTratamentoTributario;
  Mercadoria: TMercadoria;
begin
  Result := False;

  if not Assigned(FUltimoObjeto) then
    Exit;

  for i := 0 to High(FUltimoObjeto.TratamentosTributarios) do
  begin
    TT := FUltimoObjeto.TratamentosTributarios[i];

    // Confirma que é o tributo atual
    if TT.Tributo.Codigo <> Info.TributoCodigo then
      Continue;

    for j := 0 to High(TT.Mercadorias) do
    begin
      Mercadoria := TT.Mercadorias[j];

      // Verifica se o primeiro atributo é o selecionado
      if (Length(Mercadoria.Atributos) > 1) and
         (Mercadoria.Atributos[0].Valor = Info.AtributoValor) then
      begin
        Result := True;
        Exit;
      end;
    end;
  end;
end;


procedure TfrmAtributosTributo.sgCustomClick(Sender: TObject);
var
  Grid: TStringGrid;
  Row: Integer;
begin
  Grid := Sender as TStringGrid;
  Row := Grid.Row;
  if Row < 0 then Exit;

  if Grid = gridPIS then
  begin
    memoPIS.Lines.Text := Grid.Cells[0, Row];
    AtributoSelecionadoPIS := FPIS_ListaParaSalvar[Row];

    if DeveMostrarDetalhesPara(AtributoSelecionadoPIS) then
    begin
      memoPIS_Detalhes.Visible := True;
      btnPIS_Detalhes.Visible := True;
      lblPIS_Detalhes.Visible := True;
    end
    else
    begin
      memoPIS_Detalhes.Visible := False;
      btnPIS_Detalhes.Visible := False;
      lblPIS_Detalhes.Visible := False;
    end;
  end
  else if Grid = gridPIS_Detalhes then
  begin
    memoPIS_Detalhes.Lines.Text := Grid.Cells[0, Row];
    AtributoSelecionadoPIS_Detalhe := FPIS_Detalhes_ListaParaSalvar[Row];
  end
  else if Grid = gridCOFINS then
  begin
    memoCOFINS.Lines.Text := Grid.Cells[0, Row];
    AtributoSelecionadoCOFINS := FCOFINS_ListaParaSalvar[Row];

    if DeveMostrarDetalhesPara(AtributoSelecionadoCOFINS) then
    begin
      memoCOFINS_Detalhes.Visible := True;
      btnCOFINS_Detalhes.Visible := True;
      lblCOFINS_Detalhes.Visible := True;
    end
    else
    begin
      memoCOFINS_Detalhes.Visible := False;
      btnCOFINS_Detalhes.Visible := False;
      lblCOFINS_Detalhes.Visible := False;
    end;
  end
  else if Grid = gridCOFINS_Detalhes then
  begin
    memoCOFINS_Detalhes.Lines.Text := Grid.Cells[0, Row];
    AtributoSelecionadoCOFINS_Detalhe := FCOFINS_Detalhes_ListaParaSalvar[Row];
  end
  else if Grid = gridII then
  begin
    memoII.Lines.Text := Grid.Cells[0, Row];
    AtributoSelecionadoII := FII_ListaParaSalvar[Row];
  end
  else if Grid = gridIPI then
  begin
    memoIPI.Lines.Text := Grid.Cells[0, Row];
    AtributoSelecionadoIPI := FIPI_ListaParaSalvar[Row];
  end;

  Grid.Visible := False;
end;


procedure TfrmAtributosTributo.btnPISClick(Sender: TObject);
var
  ListaTexto: TArray<string>;
begin
  GerarListaParaSalvar(FUltimoObjeto, '6', FPIS_ListaParaSalvar, ListaTexto, False);
  MostrarComboSimulado(memoPIS, gridPIS, ListaTexto);

end;

function TfrmAtributosTributo.Conectar(var vMensagem: String): Boolean;
var
  URL: String;
  StringList: TStringList;
  vPastaCertificados: string;
begin
  inherited;

  if CSRF <> '' then
    exit(true);

  URL := 'https://portalunico.siscomex.gov.br/portal/api/autenticar';

  StringList := TStringList.Create;
  try
    vPastaCertificados := 'C:\DDBROKER\Certificados\';
    idHttp.Request.Clear;
    idHttp.Request.ContentType := 'application/xml';
    idHttp.Request.AcceptCharSet := 'UTF-8';
    idHttp.Request.BasicAuthentication := False;
    idHttp.Response.ResponseText := 'UTF-8';
    idHttp.BoundPortMax := 5000;
    idHttp.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.CertFile     :=  vPastaCertificados + 'Edgar.pem';
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.RootCertFile :=  vPastaCertificados + 'Edgar.pem';
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.KeyFile      :=  vPastaCertificados + 'Edgar.key';
//    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.CertFile     :=  vPastaCertificados + NomeDespachante + '.pem';
//    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.RootCertFile :=  vPastaCertificados + NomeDespachante + '.pem';
//    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.KeyFile      :=  vPastaCertificados + NomeDespachante + '.key';
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method       := sslvSSLv23;
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Mode         := sslmClient;
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.SSLVersions  := [sslvSSLv2,sslvSSLv3,sslvTLSv1,sslvTLSv1_1,sslvTLSv1_2];
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.VerifyDepth  := 2;
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.VerifyMode   := [];
    idHttp.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';

    idHttp.Request.Referer := URL;
    idHttp.Request.CustomHeaders.Values['Role-Type']:= 'IMPEXP';

    try
      idHttp.Post(URL, StringList);
    except
      on E:EIdHTTPProtocolException do
      begin
        result := false;
        vMensagem := e.ErrorMessage;
      end;
    end;

    if idHttp.Response.ResponseCode = 200 then
    begin
      result :=  true;
      vMensagem := 'Conectado';
      Token := idHttp.Response.RawHeaders.Values['Set-Token'];
      CSRF := idHttp.Response.RawHeaders.Values['X-CSRF-Token'];
    end
    else
    begin
      result := false;
      vMensagem := idHttp.ResponseText;
    end;

  finally
    FreeAndNil(StringList);
  end;
end;

procedure TfrmAtributosTributo.FormCreate(Sender: TObject);

  function CriarGrid: TStringGrid;
  begin
    Result := TStringGrid.Create(Self);
    Result.Parent := Self;
    Result.Visible := False;
    Result.ColCount := 1;
    Result.RowCount := 0;
    Result.DefaultRowHeight := 40;
    Result.DefaultColWidth := 500;
    Result.DefaultDrawing := False;
    Result.Options := Result.Options - [goEditing];
    Result.OnDrawCell := sgCustomDrawCell;
    Result.OnClick := sgCustomClick;
  end;

begin
  gridPIS := CriarGrid;
  gridPIS_Detalhes := CriarGrid;
  gridCOFINS := CriarGrid;
  gridCOFINS_Detalhes := CriarGrid;
  gridII := CriarGrid;
  gridIPI := CriarGrid;
end;

procedure TfrmAtributosTributo.FormDestroy(Sender: TObject);
begin
  if Assigned(FUltimoObjeto) then
    FreeAndNil(FUltimoObjeto);
end;

function TfrmAtributosTributo.GerarJSON(pNCM, pPais, pFundamentoLegal, pRegime: String): string;
var
  JSONObject, Tributo, Regime, FundamentoLegal, Atributo, Mercadoria, TratamentoTributario, FundamentoOpcional: TJSONObject;
  TratamentosArray, FundamentosArray, MercadoriasArray, AtributosArray: TJSONArray;
  aQuery: TFDQuery;
begin
  Result := '';

  aQuery := TFDQuery.create(nil);
  aQuery.ConnectionName := 'ConnectionAntuerpia';
  JSONObject := TJSONObject.Create;
  try
    JSONObject.AddPair('ncm', pNCM); //aQuery.FieldByName('ncm').AsString);
    JSONObject.AddPair('codigoPais', pPais );// TJSONNumber.Create(aQuery.FieldByName('codigoPais').AsInteger));
//    JSONObject.AddPair('dataFatoGerador', aQuery.FieldByName('dataFatoGerador').AsString);
    JSONObject.AddPair('tipoOperacao', 'I'); //aQuery.FieldByName('tipoOperacao').AsString);

    // Fundamentos Opcionais
(*
    FundamentosArray := TJSONArray.Create;
    FundamentoOpcional := TJSONObject.Create;
    FundamentoOpcional.AddPair('codigoTributo', '1');//TJSONNumber.Create(aQuery.FieldByName('codigoTributo').AsInteger));
    FundamentoOpcional.AddPair('codigoRegime', '1'); //TJSONNumber.Create(aQuery.FieldByName('codigoRegime').AsInteger));
    FundamentoOpcional.AddPair('codigoFundamentoLegal', pFundamentoLegal);//TJSONNumber.Create(aQuery.FieldByName('codigoFundamentoLegal').AsInteger)); //0034
//      FundamentoOpcional.AddPair('codigoNomenclaturaAlternativa', aQuery.FieldByName('codigoNomenclaturaAlternativa').AsString);

    FundamentosArray.AddElement(FundamentoOpcional);
    JSONObject.AddPair('fundamentosOpcionais', FundamentosArray);
*)

    Result := JSONObject.ToJSON;
  finally
    JSONObject.Free;
    aQuery.Free;
  end;
end;

function TfrmAtributosTributo.PostApi(uri, JsonText: String; var ResultText: String): Boolean;
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

function TfrmAtributosTributo.GetAtributosTribruto: String;
var
  vMensagem: String;
  vResultText: String;
  uri: String;
  urlIndaia: String;
  vJsonTributos: String;
  vNCM, vPais, vFundamentoLegal, vRegime: String;

  function TemFundamentoLegal: Boolean;
  var
    vQuery: TFDQuery;
  begin
    vQuery := TFDQuery.Create(nil);
    try
      vQuery.Connection := dtmDuimp.FDConnection1;
      vQuery.SQL.Text := 'SELECT AD.CD_MERCADORIA_NCM, PBO.PAIS, CD_FUND_LEGAL_II_DUIMP, CD_FUND_LEGAL_IPI_DUIMP, AD.CD_REGIME_TRIBUTAR, '+
                         'CASE WHEN AD.CD_PAIS_ORIG_MERC IS NOT NULL THEN AD.CD_PAIS_ORIG_MERC ELSE AD.CD_PAIS_AQUIS_MERC END AS CD_PAIS '+
                         'FROM TADICAO_DE_IMPORTACAO AD '+
                         'OUTER APPLY (SELECT CD_SCX_EXP AS PAIS FROM TPAIS_BROKER_OFICIAL WHERE CD_PAIS = (CASE WHEN AD.CD_PAIS_ORIG_MERC IS NOT NULL '+
                         '																	 THEN AD.CD_PAIS_ORIG_MERC ELSE AD.CD_PAIS_AQUIS_MERC END)) AS PBO '+
                         'WHERE AD.NR_PROCESSO = :NrProcesso AND AD.NR_ADICAO = :NrAdicao ';
      vQuery.ParamByName('NrProcesso').AsString := NrProcesso;
      vQuery.ParamByName('NrAdicao').AsString := NrAdicao;
      vQuery.Open;

      vNCM := vQuery.FieldByName('CD_MERCADORIA_NCM').AsString;
      vPais := vQuery.FieldByName('CD_PAIS').AsString;
      vRegime := vQuery.FieldByName('CD_REGIME_TRIBUTAR').AsString;
      vFundamentoLegal := vQuery.FieldByName('CD_FUND_LEGAL_II_DUIMP').AsString; //'0034';

//      result := vFundamentoLegal <> '';
      result := true;

    finally
      vQuery.Free;
    end;
  end;

begin

  if not TemFundamentoLegal then
    raise Exception.Create('Não existe Fundamento Legal de II');

  lblProcesso.Caption := 'Processo: ' + NrProcesso;
  lblAdicao.Caption := 'Adição: ' + NrAdicao;
  lblNCM.Caption := 'Ncm: ' + vNCM;
  lblFundamento.Caption := 'Fundamento: ' + vFundamentoLegal;
  lblRegime.Caption := 'Regime: ' + vRegime;

  vJsonTributos := GerarJson(vNCM, vPais, vFundamentoLegal, vRegime);
//  vJsonTributos :=

//'{ ' +
//'  "ncm": "95045000", ' +
//'  "codigoPais": 23, ' +
//'  "dataFatoGerador": "2020-12-20", ' +
//'  "tipoOperacao": "I" ' +
//'  "fundamentosOpcionais": [ ' +
//'        {"codigoTributo": 1, "codigoRegime": 10, "codigoFundamentoLegal": 1037}, ' +
//'        {"codigoTributo": 2, "codigoRegime": 10, "codigoFundamentoLegal": 1037}, ' +
//'        {"codigoTributo": 6, "codigoRegime": 10, "codigoFundamentoLegal": 1037}, ' +
//'        {"codigoTributo": 7, "codigoRegime": 10, "codigoFundamentoLegal": 1037}, ' +
//'        {"codigoTributo": 1, "codigoRegime": 3, "codigoFundamentoLegal": 1005} ' +
//'    ] ' +
//'} ';





//'  { '+
//'  "ncm": "30031012", '+
//'  "codigoPais": "023", '+
//'  "tipoOperacao": "I" '+
//'} ';

//'{ ' +
//'    "codigoPais": "063",' +
//'    "fundamentosOpcionais": [' +
//'        {' +
//'            "codigoFundamentoLegal": "0002",' +
//'            "codigoRegime": "1",' +
//'            "codigoTributo": "1"' +
//'        },' +
//'        {' +
//'            "codigoFundamentoLegal": "6999",' +
//'            "codigoRegime": "1",' +
//'            "codigoTributo": "2"' +
//'        }' +
//'    ],' +
//'    "ncm": "39014000",' +
//'    "tipoOperacao": "I"' +
//'}';

  GravaJsonTeste(vJsonTributos);

  uri := 'https://portalunico.siscomex.gov.br/ttce/api/ext/tratamentos-tributarios/importacao/';

  if not chkConexaoAntiga.Checked then
  begin
//    if system.DebugHook = 1 then
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

  result := vResultText;

//  result := JSONToRecordAtributosDaDuimp(vResultText);

end;

//procedure TfrmAtributosTributo.GravaJsonStrteste(vstr: String);
//var
//  str: TStringlist;
//begin
//  str := TStringlist.Create();
//  try
//    str.Text := vstr;
//    str.SaveToFile('D:\Indaiá\Temp\texte'+FormatDateTime('yy-mm-dd-hhnnss', now)+'.txt');
//  finally
//    str.Free;
//  end;
//end;

procedure TfrmAtributosTributo.btnCancelarClick(Sender: TObject);
begin
  Fechar;
end;

procedure TfrmAtributosTributo.btnCOFINSClick(Sender: TObject);
var
  ListaTexto: TArray<string>;
begin
  GerarListaParaSalvar(FUltimoObjeto, '7', FCOFINS_ListaParaSalvar, ListaTexto, False);
  MostrarComboSimulado(memoCOFINS, gridCOFINS, ListaTexto);
end;

procedure TfrmAtributosTributo.btnCOFINS_DetalhesClick(Sender: TObject);
var
  ListaTexto: TArray<string>;
begin
  GerarListaParaSalvar(FUltimoObjeto, '7', FCOFINS_Detalhes_ListaParaSalvar, ListaTexto, True);
  MostrarComboSimulado(memoCOFINS_Detalhes, gridCOFINS_Detalhes, ListaTexto);
end;

procedure TfrmAtributosTributo.btnConsultarClick(Sender: TObject);
begin
  ConsultarAtributosTributariosNCM;
end;

procedure TfrmAtributosTributo.btnIIClick(Sender: TObject);
var
  ListaTexto: TArray<string>;
begin
  GerarListaParaSalvar(FUltimoObjeto, '1', FII_ListaParaSalvar, ListaTexto, False);

  MostrarComboSimulado(memoII, gridII, ListaTexto);
  gridII.Width := memoII.Width + 200;
  gridII.DefaultColWidth := memoII.Width + 200;
end;

procedure TfrmAtributosTributo.btnIPIClick(Sender: TObject);
var
  ListaTexto: TArray<string>;
begin
  GerarListaParaSalvar(FUltimoObjeto, '2', FIPI_ListaParaSalvar, ListaTexto, False);

  MostrarComboSimulado(memoIPI, gridIPI, ListaTexto);
  gridIPI.Width := memoIPI.Width + 200;
  gridIPI.DefaultColWidth := memoIPI.Width + 200;
end;

procedure TfrmAtributosTributo.btnPIS_DetalhesClick(Sender: TObject);
var
  ListaTexto: TArray<string>;
begin
  GerarListaParaSalvar(FUltimoObjeto, '6', FPIS_Detalhes_ListaParaSalvar, ListaTexto, True);
  MostrarComboSimulado(memoPIS_Detalhes, gridPIS_Detalhes, ListaTexto);
end;

procedure TfrmAtributosTributo.btnSalvarClick(Sender: TObject);
begin
  SalvarTodosSelecionados;
  Fechar;
end;

procedure TfrmAtributosTributo.btnNcmClick(Sender: TObject);
var
  JsonString: String;
begin
  JsonString := GetAtributosTribruto;
  JsonString := Utf8ToString(JsonString);
  try
    FUltimoObjeto := TAtributoTributo.FromJSON(JsonString);

//    if Assigned(FUltimoObjeto) then
//    begin
//      txtResposta.Text := JsonString;
//      txtResposta.Lines.Add('Código do País: ' + IntToStr(FUltimoObjeto.CodigoPais));
//      txtResposta.Lines.Add('Data Fato Gerador: ' + FUltimoObjeto.DataFatoGerador);
//    end;
  except
    on E: Exception do
//      txtResposta.Lines.Add('Erro inesperado: ' + E.Message);
  end;
end;


procedure TfrmAtributosTributo.ConsultarAtributosTributariosNCM;
var
  JsonString: String;
begin
  JsonString := GetAtributosTribruto;
  JsonString := Utf8ToString(JsonString);
  GravaJsonTeste(JsonString);
  try
    FUltimoObjeto := TAtributoTributo.FromJSON(JsonString);
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TfrmAtributosTributo.GerarListaParaSalvar(
  Objeto: TAtributoTributo;
  TributoCodigo: string;
  out ListaFinal: TArray<TAtributoParaSalvar>;
  out ListaTexto: TArray<string>;
  Detalhes: Boolean = False);
var
  i, j, k: Integer;
  TT: TTratamentoTributario;
  Mercadoria: TMercadoria;
  Atributo: TAtributo;
  Texto: string;
  Lista: TList<TAtributoParaSalvar>;
  ListaStr: TList<string>;
  Registro: TAtributoParaSalvar;
begin
  Lista := TList<TAtributoParaSalvar>.Create;
  ListaStr := TList<string>.Create;
  try
    for i := 0 to High(Objeto.TratamentosTributarios) do
    begin
      TT := Objeto.TratamentosTributarios[i];

      if TT.Tributo.Codigo <> TributoCodigo then
        Continue;

      for j := 0 to High(TT.Mercadorias) do
      begin
        Mercadoria := TT.Mercadorias[j];

        if Detalhes then
        begin
          if Length(Mercadoria.Atributos) > 1 then
          begin
            for k := 1 to High(Mercadoria.Atributos) do
            begin
              Atributo := Mercadoria.Atributos[k];
              Texto := Atributo.Valor + ' - ' + Atributo.DescricaoValor;

              if ListaStr.IndexOf(Texto) = -1 then
              begin
                Registro.NrProcesso := NrProcesso;
                Registro.NrAdicao := NrAdicao;
                Registro.TributoCodigo := TT.Tributo.Codigo;
                Registro.TributoNome := TT.Tributo.Nome;
                Registro.RegimeCodigo := TT.Regime.Codigo;
                Registro.RegimeNome := TT.Regime.Nome;
                Registro.FundamentoCodigo := TT.FundamentoLegal.Codigo;
                Registro.FundamentoNome := TT.FundamentoLegal.Nome;
                Registro.FundamentoTipo := TT.FundamentoLegal.Tipo;
                Registro.AtributoCodigo := Atributo.Codigo;
                Registro.AtributoDescricaoCodigo := Atributo.DescricaoCodigo;
                Registro.AtributoDescricaoValor := Atributo.DescricaoValor;
                Registro.AtributoTipoCodigo := Atributo.TipoCodigo;
                Registro.AtributoValor := Atributo.Valor;

                Lista.Add(Registro);
                ListaStr.Add(Texto);
              end;
            end;
          end;
        end
        else
        begin
          if Length(Mercadoria.Atributos) > 0 then
          begin
            Atributo := Mercadoria.Atributos[0];
            Texto := Atributo.Valor + ' - ' + Atributo.DescricaoValor;

            if ListaStr.IndexOf(Texto) = -1 then
            begin
              Registro.NrProcesso := NrProcesso;
              Registro.NrAdicao := NrAdicao;
              Registro.TributoCodigo := TT.Tributo.Codigo;
              Registro.TributoNome := TT.Tributo.Nome;
              Registro.RegimeCodigo := TT.Regime.Codigo;
              Registro.RegimeNome := TT.Regime.Nome;
              Registro.FundamentoCodigo := TT.FundamentoLegal.Codigo;
              Registro.FundamentoNome := TT.FundamentoLegal.Nome;
              Registro.FundamentoTipo := TT.FundamentoLegal.Tipo;
              Registro.AtributoCodigo := Atributo.Codigo;
              Registro.AtributoDescricaoCodigo := Atributo.DescricaoCodigo;
              Registro.AtributoDescricaoValor := Atributo.DescricaoValor;
              Registro.AtributoTipoCodigo := Atributo.TipoCodigo;
              Registro.AtributoValor := Atributo.Valor;

              Lista.Add(Registro);
              ListaStr.Add(Texto);
            end;
          end;
        end;
      end;
    end;

    ListaFinal := Lista.ToArray;
    ListaTexto := ListaStr.ToArray;
  finally
    Lista.Free;
    ListaStr.Free;
  end;
end;

procedure TfrmAtributosTributo.MostrarComboSimulado(MemoDestino: TMemo; Grid: TStringGrid; Lista: TArray<string>; PosLeft, PosTop: Integer) overload;
var
  i: Integer;
begin
  Grid.RowCount := Length(Lista);
  for i := 0 to High(Lista) do
    Grid.Cells[0, i] := Lista[i];

  Grid.Left := PosLeft;
  Grid.Top := PosTop;
  Grid.Width := MemoDestino.Width + 30;
  Grid.Height := Min(200, Length(Lista) * Grid.DefaultRowHeight);
  Grid.BringToFront;
  Grid.Visible := True;
end;

procedure TfrmAtributosTributo.MostrarComboSimulado(
  MemoDestino: TMemo;
  Grid: TStringGrid;
  Lista: TArray<string>) overload;
begin
  MostrarComboSimulado(
    MemoDestino,
    Grid,
    Lista,
    MemoDestino.Left,
    MemoDestino.Top + MemoDestino.Height + 2
  );
end;

procedure TfrmAtributosTributo.pnlmenuMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  gridPIS.Visible := false;
  gridPIS_Detalhes.Visible := false;
  gridCOFINS.Visible := false;
  gridCOFINS_Detalhes.Visible := false;
  gridII.Visible := false;
  gridIPI.Visible := false;
end;

procedure TfrmAtributosTributo.SalvarTodosSelecionados;
var
  qrySel: TFDQuery;
  nrItem: String;
begin


//  if not ValidarCamposPreenchidos then
//  begin
//    Reject('Não é possível salvar. Preencha todas as informações do formulário.');
//    Exit;
//  end;

  qrySel := TFDQuery.Create(nil);
  try
    qrySel.Connection := dtmDuimp.FDConnection1;
    qrySel.SQL.Text := 'SELECT * ' +
                       'FROM TDETALHE_MERCADORIA DM ' +
                       'WHERE DM.NR_PROCESSO = :NR_PROCESSO AND DM.NR_ADICAO   = :NR_ADICAO ' +
                       'AND NOT EXISTS ( SELECT 1 FROM TDuimpAtributosTributarios AF ' +
                                        'WHERE AF.NrProcesso = DM.NR_PROCESSO ' +
                                        'AND AF.NrAdicao   = DM.NR_ADICAO ' +
                                        'AND AF.NrItem     = DM.NR_ITEM)';
    qrySel.paramByName('NR_PROCESSO').AsString := nrProcesso;
    qrySel.paramByName('NR_ADICAO').AsString := nrAdicao;
    qrySel.Open;

    ExcluirAtributosTributarios;

    While not qrySel.Eof do
    begin

      nrItem := qrySel.FieldByName('NR_ITEM').AsString;

      if AtributoSelecionadoPIS.NrProcesso <> '' then
        SalvarAtributoNoBanco(AtributoSelecionadoPIS, nrItem);

      if AtributoSelecionadoPIS_Detalhe.NrProcesso <> '' then
        SalvarAtributoNoBanco(AtributoSelecionadoPIS_Detalhe, nrItem);

      if AtributoSelecionadoCOFINS.NrProcesso <> '' then
        SalvarAtributoNoBanco(AtributoSelecionadoCOFINS, nrItem);

      if AtributoSelecionadoCOFINS_Detalhe.NrProcesso <> '' then
        SalvarAtributoNoBanco(AtributoSelecionadoCOFINS_Detalhe, nrItem);

      if AtributoSelecionadoII.NrProcesso <> '' then
        SalvarAtributoNoBanco(AtributoSelecionadoII, nrItem);
      qrySel.Next;
    end;
  finally
    FreeAndNil(qrySel);
  end;

  Information('Dados salvos com sucesso! Favor atualizar o grid de Atributos Tributários.');
end;

procedure TfrmAtributosTributo.ExcluirAtributosTributarios;
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := dtmDuimp.FDConnection1;

    Qry.SQL.Text := 'DELETE FROM TDuimpAtributosTributarios WHERE NrProcesso = :NrProcesso AND NrAdicao = :NrAdicao';
    Qry.ParamByName('NrProcesso').AsString := NrProcesso;
    Qry.ParamByName('NrAdicao').AsString := NrAdicao;

    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TfrmAtributosTributo.SalvarAtributoNoBanco(const Info: TAtributoParaSalvar; NrItem: String);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := dtmDuimp.FDConnection1;

    Qry.SQL.Text :=
      'INSERT INTO TDuimpAtributosTributarios (' +
      'NrProcesso, NrAdicao, NrItem, TributoCodigo, TributoNome, ' +
      'RegimeCodigo, RegimeNome, FundamentoCodigo, FundamentoNome, FundamentoTipo, ' +
      'AtributoCodigo, AtributoDescricaoCodigo, AtributoDescricaoValor, AtributoTipoCodigo, AtributoValor) ' +
      'VALUES (' +
      ':NrProcesso, :NrAdicao, :NrItem, :TributoCodigo, :TributoNome, ' +
      ':RegimeCodigo, :RegimeNome, :FundamentoCodigo, :FundamentoNome, :FundamentoTipo, ' +
      ':AtributoCodigo, :AtributoDescricaoCodigo, :AtributoDescricaoValor, :AtributoTipoCodigo, :AtributoValor)';

    Qry.ParamByName('NrProcesso').AsString := Info.NrProcesso;
    Qry.ParamByName('NrAdicao').AsString := Info.NrAdicao;
    Qry.ParamByName('NrItem').AsString := NrItem;
    Qry.ParamByName('TributoCodigo').AsString := Info.TributoCodigo;
    Qry.ParamByName('TributoNome').AsString := Info.TributoNome;
    Qry.ParamByName('RegimeCodigo').AsString := Info.RegimeCodigo;
    Qry.ParamByName('RegimeNome').AsString := Info.RegimeNome;
    Qry.ParamByName('FundamentoCodigo').AsString := Info.FundamentoCodigo;
    Qry.ParamByName('FundamentoNome').AsString := Info.FundamentoNome;
    Qry.ParamByName('FundamentoTipo').AsString := Info.FundamentoTipo;
    Qry.ParamByName('AtributoCodigo').AsString := Info.AtributoCodigo;
    Qry.ParamByName('AtributoDescricaoCodigo').AsString := Info.AtributoDescricaoCodigo;
    Qry.ParamByName('AtributoDescricaoValor').AsString := Info.AtributoDescricaoValor;
    Qry.ParamByName('AtributoTipoCodigo').AsString := Info.AtributoTipoCodigo;
    Qry.ParamByName('AtributoValor').AsString := Info.AtributoValor;

    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

function TfrmAtributosTributo.ValidarCamposPreenchidos: Boolean;
begin
  Result := True;

  // PIS principal
  if AtributoSelecionadoPIS.AtributoValor = '' then
    Exit(False);

  // PIS detalhe (se visível, é obrigatório)
  if memoPIS_Detalhes.Visible and (AtributoSelecionadoPIS_Detalhe.AtributoValor = '') then
    Exit(False);

  // COFINS principal
  if AtributoSelecionadoCOFINS.AtributoValor = '' then
    Exit(False);

  // COFINS detalhe (se visível, é obrigatório)
  if memoCOFINS_Detalhes.Visible and (AtributoSelecionadoCOFINS_Detalhe.AtributoValor = '') then
    Exit(False);

  // II
  if AtributoSelecionadoII.AtributoValor = '' then
    Exit(False);
end;


end.
