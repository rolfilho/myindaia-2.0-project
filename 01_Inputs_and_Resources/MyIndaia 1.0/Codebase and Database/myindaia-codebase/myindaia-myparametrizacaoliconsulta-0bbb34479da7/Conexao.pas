unit Conexao;

interface

uses
  SysUtils, Classes, Variants, DBXMSSQL, DB, SqlExpr, DBXCommon, DBClient,
  FMTBcd, Provider, MaskUtils, IdMessage, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, IdAttachmentFile, IdText, StrUtils, IniFiles, Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Comp.DataSet;

const
  ID_TABELA = 1652005462;

type
  TSQLClientDataSet = class(TClientDataSet)
  private
    function GetSQL: TStrings;
    procedure SetSQL(const Value: TStrings);
  public
    constructor Create(AOwner: TComponent); override;
    procedure Open(AParamValues: array of Variant); reintroduce;
    procedure ReOpen;
    property SQL: TStrings read GetSQL write SetSQL;
  end;

type
  TdtmmyParametrizacaoLIConsulta = class(TDataModule)
    Connection: TSQLConnection;
    qryConsulta: TSQLQuery;
    qryTipoDocumento: TSQLQuery;
    dspTipoDocumento: TDataSetProvider;
    cdsTipoDocumento: TClientDataSet;
    qryTipoDocumentoCODIGO: TStringField;
    qryTipoDocumentoDESCRICAO: TStringField;
    qryTipoDocumentoTX_DECL_ADIC: TStringField;
    cdsTipoDocumentoCODIGO: TStringField;
    cdsTipoDocumentoDESCRICAO: TStringField;
    cdsTipoDocumentoTX_DECL_ADIC: TStringField;
    qryDigitalizacao: TSQLQuery;
    qryDigitalizacaoNR_PROCESSO: TStringField;
    qryDigitalizacaoCD_TIPO_DOCTO: TIntegerField;
    qryDigitalizacaoNM_DESCRICAO: TStringField;
    qryDigitalizacaoNM_ARQUIVO: TStringField;
    qryDigitalizacaoCD_USUARIO_CRIACAO: TStringField;
    qryDigitalizacaoDT_CRIACAO: TSQLTimeStampField;
    qryDigitalizacaoCD_USUARIO_ALT: TStringField;
    qryDigitalizacaoDT_ALT: TSQLTimeStampField;
    qryDigitalizacaoIN_ATIVO: TStringField;
    qryDigitalizacaoNM_ARQUIVO_PAI: TStringField;
    qryDigitalizacaoNM_MOTIVO_ALTERACAO: TStringField;
    qryDigitalizacaoID_TABELA: TIntegerField;
    dspDigitalizacao: TDataSetProvider;
    cdsDigitalizacao: TClientDataSet;
    cdsDigitalizacaoNR_PROCESSO: TStringField;
    cdsDigitalizacaoCD_TIPO_DOCTO: TIntegerField;
    cdsDigitalizacaoNM_DESCRICAO: TStringField;
    cdsDigitalizacaoNM_ARQUIVO: TStringField;
    cdsDigitalizacaoCD_USUARIO_CRIACAO: TStringField;
    cdsDigitalizacaoDT_CRIACAO: TSQLTimeStampField;
    cdsDigitalizacaoCD_USUARIO_ALT: TStringField;
    cdsDigitalizacaoDT_ALT: TSQLTimeStampField;
    cdsDigitalizacaoIN_ATIVO: TStringField;
    cdsDigitalizacaoNM_ARQUIVO_PAI: TStringField;
    cdsDigitalizacaoNM_MOTIVO_ALTERACAO: TStringField;
    cdsDigitalizacaoID_TABELA: TIntegerField;
    dspConsulta: TDataSetProvider;
    qryMail: TSQLQuery;
    qryMailNM_HOST: TStringField;
    qryMailNR_PORTA: TIntegerField;
    qryMailNM_LOGIN: TStringField;
    qryMailNM_SENHA: TStringField;
    qryMailNM_HOST_WEB: TStringField;
    qryMailNR_PORTA_WEB: TIntegerField;
    qryMailNM_LOGIN_WEB: TStringField;
    qryMailNM_SENHA_WEB: TStringField;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    qryParametrizacao: TSQLQuery;
    dspParametrizacao: TDataSetProvider;
    cdsParametrizacao: TClientDataSet;
    cdsConsulta: TClientDataSet;
    qryParametrizacaoNR_PROCESSO: TStringField;
    qryParametrizacaoNR_LI: TStringField;
    qryParametrizacaoDT_REGISTRO: TSQLTimeStampField;
    qryParametrizacaoDT_DEFERIMENTO: TSQLTimeStampField;
    qryParametrizacaoDT_VENCTO: TSQLTimeStampField;
    qryParametrizacaoIN_SUBSTITUIDA: TStringField;
    qryParametrizacaoNR_SUBSTITUIDA: TStringField;
    qryParametrizacaoIN_CANCELADO: TStringField;
    qryParametrizacaoTX_OBS_CANC: TMemoField;
    qryParametrizacaoIN_UTILIZADO: TStringField;
    qryParametrizacaoIN_SEM_REPRESENTACAO: TStringField;
    qryParametrizacaoIN_LI_PRE_JA_EMBARCADO: TStringField;
    qryParametrizacaoDT_CONSULTA_SCX: TSQLTimeStampField;
    qryParametrizacaoIN_FILA_RECUPERAR: TStringField;
    cdsParametrizacaoNR_PROCESSO: TStringField;
    cdsParametrizacaoNR_LI: TStringField;
    cdsParametrizacaoDT_REGISTRO: TSQLTimeStampField;
    cdsParametrizacaoDT_DEFERIMENTO: TSQLTimeStampField;
    cdsParametrizacaoDT_VENCTO: TSQLTimeStampField;
    cdsParametrizacaoIN_SUBSTITUIDA: TStringField;
    cdsParametrizacaoNR_SUBSTITUIDA: TStringField;
    cdsParametrizacaoIN_CANCELADO: TStringField;
    cdsParametrizacaoTX_OBS_CANC: TMemoField;
    cdsParametrizacaoIN_UTILIZADO: TStringField;
    cdsParametrizacaoIN_SEM_REPRESENTACAO: TStringField;
    cdsParametrizacaoIN_LI_PRE_JA_EMBARCADO: TStringField;
    cdsParametrizacaoDT_CONSULTA_SCX: TSQLTimeStampField;
    cdsParametrizacaoIN_FILA_RECUPERAR: TStringField;
    qryParametrizacaoCD_UNID_NEG: TStringField;
    cdsParametrizacaoCD_UNID_NEG: TStringField;
    qryParametrizacaoLI_FORMATADA: TStringField;
    cdsParametrizacaoLI_FORMATADA: TStringField;
    qryListaOrdem: TSQLQuery;
    qryEmail: TSQLQuery;
    qryEmailemail: TMemoField;
    qryParametrizacaoNM_EMAIL: TStringField;
    cdsParametrizacaoNM_EMAIL: TStringField;
    qryParametrizacaoNM_EMPRESA: TStringField;
    cdsParametrizacaoNM_EMPRESA: TStringField;
    qryParametrizacaoNM_EMAIL_CONSULTA_LI: TStringField;
    cdsParametrizacaoNM_EMAIL_CONSULTA_LI: TStringField;
    qryUpdateEmailEnviado: TSQLQuery;
    qryParametrizacaoDT_CONSULTA_SCX_1: TSQLTimeStampField;
    qryParametrizacaoDT_ULT_MUDANCA_STATUS_1: TSQLTimeStampField;
    cdsParametrizacaoDT_CONSULTA_SCX_1: TSQLTimeStampField;
    cdsParametrizacaoDT_ULT_MUDANCA_STATUS_1: TSQLTimeStampField;
    FDQueryDigitalizacao: TFDQuery;
    FDConnection1: TFDConnection;
    procedure cdsExtratoLICalcFields(DataSet: TDataSet);
    procedure cdsDigitalizacaoAfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FTransaction: TDBXTransaction;
    FConfig: TIniFile;
  public
    function GetNomeArquivo(AProcesso, APathDig, APrefixo: String): String;
    function DigitalizaDocumento(AProcesso, ADocumento, ATipoDocumento, ADescricao: String): Boolean;
    function TemDocumento(AProcesso, ATipoDocumento: String; AIncluirInativos: Boolean = False): Boolean;
    // Consultas
    function VerificaConexao: Boolean;
    function ConsultaLookup(ATabela, ACampoRetorno: String; AValorSeNulo: Variant; ACamposFiltro: array of String; AValoresFiltro: array of Variant): Variant;
    function ConsultaSQL(ASQL: String; AValorSeNulo: Variant; AValoresFiltro: array of Variant): Variant;
    function ExecSQL(ASQL: String; AValoresFiltro: array of Variant): Integer;
    function AtualizaFollowup(AProcesso, AEvento: String; AData: TDateTime; AUsuario: String = '0707'): Boolean;
    function AbreConsulta(ASQL: String; AValoresFiltros: array of Variant): TSQLQuery;
    function AbreDataSet(ASQL: String; AValoresFiltros: array of Variant): TSQLClientDataSet;
    // Transação
    procedure BeginTransaction;
    procedure Commit;
    procedure Rollback;
    function InTransaction: Boolean;
    // Email
    function EnviaEmail(ARemetente: String; APara, ACopia, ACopiaOculta: array of String; AAssunto, ACorpo: String; AAnexos: array of String): Boolean;
    property Config: TIniFile read FConfig;
  end;

  procedure SetParametros(AQuery: TSQLQuery; AValores: array of Variant); overload;
  procedure SetParametros(ADataSet: TClientDataSet; AValores: array of Variant); overload;

  function MySendMail(ARemetente, APara, ACopia, ACopiaOculta, AAssunto, ACorpo, AAnexos: PWideChar): Boolean; stdcall;
var
  dtmmyParametrizacaoLIConsulta: TdtmmyParametrizacaoLIConsulta;

implementation

uses
  Funcoes, Principal;

{$R *.dfm}
function MySendMail(ARemetente, APara, ACopia, ACopiaOculta, AAssunto, ACorpo, AAnexos: PWideChar): Boolean; external 'MYEMAIL.DLL';

procedure SetParametros(AQuery: TSQLQuery; AValores: array of Variant);
var
  I: Integer;
begin
  if High(AValores) <> (AQuery.Params.Count -1) then
    raise Exception.Create('Quantidade de parâmetros incorreta para a consulta.');
  for I := 0 to High(AValores) do
    case VarType(AValores[I]) of
      varEmpty,
      varNull: AQuery.Params[I].Clear;

      varDispatch,
      varError,
      varAny,
      varVariant,
      varUnknown,
      varTypeMask,
      varArray,
      varByRef: ;

      varSmallint,
      varInteger,
      varSingle,
      varShortInt,
      varByte,
      varWord,
      varLongWord,
      varInt64: AQuery.Params[I].AsInteger := AValores[I];

      varDouble,
      varCurrency: AQuery.Params[I].AsFloat := AValores[I];

      varDate: AQuery.Params[I].AsDateTime := AValores[I];

      varOleStr, varString, varUString: AQuery.Params[I].AsString := AValores[I];

      varBoolean: AQuery.Params[I].AsBoolean := AValores[I];
    end;
end;

procedure SetParametros(ADataSet: TClientDataSet; AValores: array of Variant);
var
  I: Integer;
begin
  if High(AValores) <> (ADataSet.Params.Count -1) then
    raise Exception.Create('Quantidade de parâmetros incorreta para a consulta.');
  for I := 0 to High(AValores) do
    case VarType(AValores[I]) of
      varEmpty,
      varNull: ADataSet.Params[I].Clear;

      varDispatch,
      varError,
      varAny,
      varVariant,
      varUnknown,
      varTypeMask,
      varArray,
      varByRef: ;

      varSmallint,
      varInteger,
      varSingle,
      varShortInt,
      varByte,
      varWord,
      varLongWord,
      varInt64: ADataSet.Params[I].AsInteger := AValores[I];

      varDouble,
      varCurrency: ADataSet.Params[I].AsFloat := AValores[I];

      varDate: ADataSet.Params[I].AsDateTime := AValores[I];

      varOleStr, varString, varUString: ADataSet.Params[I].AsString := AValores[I];

      varBoolean: ADataSet.Params[I].AsBoolean := AValores[I];
    end;
end;

{ TSQLClientDataSet }

constructor TSQLClientDataSet.Create(AOwner: TComponent);
begin
  inherited;
  FetchOnDemand := False;
end;

function TSQLClientDataSet.GetSQL: TStrings;
var
  Provider: TComponent;
begin
  Result := nil;
  if (ProviderName <> '') then
  begin
    Provider := Owner.FindComponent(ProviderName);
    if Assigned(Provider)
    and (Provider is TDataSetProvider)
    and Assigned(TDataSetProvider(Provider).DataSet)
    and (TDataSetProvider(Provider).DataSet is TSQLQuery) then
      Result := TSQLQuery(TDataSetProvider(Provider).DataSet).SQL;
  end;
end;

procedure TSQLClientDataSet.Open(AParamValues: array of Variant);
begin
  FetchParams;
  SetParametros(Self, AParamValues);
  inherited Open;
end;

procedure TSQLClientDataSet.ReOpen;
begin
  if Active then
    Close;
  inherited Open;
end;

procedure TSQLClientDataSet.SetSQL(const Value: TStrings);
var
  Provider: TComponent;
begin
  if (ProviderName <> '') then
  begin
    Provider := Owner.FindComponent(ProviderName);
    if Assigned(Provider)
    and (Provider is TDataSetProvider)
    and Assigned(TDataSetProvider(Provider).DataSet)
    and (TDataSetProvider(Provider).DataSet is TSQLQuery) then
      TSQLQuery(TDataSetProvider(Provider).DataSet).SQL := Value;
  end;
end;

{ TdtmmyParametrizacaoLIConsulta }

function TdtmmyParametrizacaoLIConsulta.AbreConsulta(ASQL: String; AValoresFiltros: array of Variant): TSQLQuery;
begin
  Result := TSQLQuery.Create(Self);
  Result.SQLConnection := Self.Connection;
  Result.SQL.Text := StringReplace(ASQL, '"', '''', [rfReplaceAll]);
  SetParametros(Result, AValoresFiltros);
  Result.Open;
end;

function TdtmmyParametrizacaoLIConsulta.AbreDataSet(ASQL: String; AValoresFiltros: array of Variant): TSQLClientDataSet;
begin
  if qryConsulta.Active then
    qryConsulta.Close;
  qryConsulta.SQL.Text := ASQL;

  Result := TSQLClientDataSet.Create(Self);
  Result.ProviderName := 'dspConsulta';
  Result.Open(AValoresFiltros);
  Result.First;
end;

function TdtmmyParametrizacaoLIConsulta.AtualizaFollowup(AProcesso, AEvento: String; AData: TDateTime; AUsuario: String = '0707'): Boolean;
begin
  ExecSQL('UPDATE TFOLLOWUP ' +
          '   SET CD_RESP_REALIZACAO = :CD_RESP_REALIZACAO, ' +
          '       DT_REALIZACAO      = :DT_REALIZACAO ' +
          ' FROM TFOLLOWUP (NOLOCK) '+
          'WHERE NR_PROCESSO = :NR_PROCESSO ' +
          '  AND CD_EVENTO   = :CD_EVENTO', [AUsuario, AData, AProcesso, AEvento]);

  Result := ConsultaSQL('SELECT COUNT(*) ' +
                        '  FROM TFOLLOWUP (NOLOCK)' +
                        ' WHERE NR_PROCESSO = :NR_PROCESSO ' +
                        '   AND CD_EVENTO   = :CD_EVENTO ' +
                        '   AND DT_REALIZACAO IS NOT NULL', '0', [AProcesso, AEvento]) = '0';
end;

procedure TdtmmyParametrizacaoLIConsulta.BeginTransaction;
begin
  FTransaction := Connection.BeginTransaction;
end;

procedure TdtmmyParametrizacaoLIConsulta.cdsDigitalizacaoAfterPost(DataSet: TDataSet);
begin
//  TClientDataSet(DataSet).ApplyUpdates(-1);
end;

procedure TdtmmyParametrizacaoLIConsulta.cdsExtratoLICalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('NR_DI_FORMATADA').AsString := FormatMaskText('00/0000000-0;0;_', Trim(DataSet.FieldByName('NR_DI').AsString));
end;

procedure TdtmmyParametrizacaoLIConsulta.Commit;
begin
  Connection.CommitFreeAndNil(FTransaction);
end;

function TdtmmyParametrizacaoLIConsulta.ConsultaLookup(ATabela, ACampoRetorno: String;  AValorSeNulo: Variant; ACamposFiltro: array of String;
  AValoresFiltro: array of Variant): Variant;
var
  SQL: String;
  I: Integer;
begin
  SQL := ' SELECT ' + ACampoRetorno +
         '   FROM ' + ATabela;
  if High(ACamposFiltro) >= 0 then
  begin
    SQL := SQL + ' WHERE ' + ACamposFiltro[0] + ' = :P0';
    for I := 1 to High(ACamposFiltro) do
      SQL := SQL + ' AND ' + ACamposFiltro[I] + ' = :P' + IntToStr(I);
  end;
  Result := ConsultaSQL(SQL, AValorSeNulo, AValoresFiltro);
end;

function TdtmmyParametrizacaoLIConsulta.ConsultaSQL(ASQL: String; AValorSeNulo: Variant; AValoresFiltro: array of Variant): Variant;
begin
  if cdsConsulta.Active then
    cdsConsulta.Close;

  qryConsulta.SQL.Text := ASQL;
  cdsConsulta.FetchParams;
  SetParametros(cdsConsulta, AValoresFiltro);

  cdsConsulta.Open;

  if VarIsNull(cdsConsulta.Fields[0].Value) or VarIsEmpty(cdsConsulta.Fields[0].Value) then
    Result := AValorSeNulo
  else
    Result := cdsConsulta.Fields[0].Value;

  cdsConsulta.Close;
end;

procedure TdtmmyParametrizacaoLIConsulta.DataModuleCreate(Sender: TObject);
begin
  FConfig := TIniFile.Create(DataPath + 'Config.ini');
end;

procedure TdtmmyParametrizacaoLIConsulta.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(FConfig);
end;

function TdtmmyParametrizacaoLIConsulta.DigitalizaDocumento(AProcesso, ADocumento, ATipoDocumento, ADescricao: String): Boolean;
var
  APath, Prefixo, AArquivoDestino, DocumentoJaExistente, NmArquivo: String;
  ConexaoJaAberta: Boolean;
begin
  result := true;

  AProcesso := Trim(AProcesso);
  APath     := Trim(ConsultaSQL('SELECT DBO.FN_PATH_DIGITALIZACAO(:NR_PROCESSO, :IN_LOCAL)', '', [AProcesso, '1']));

  if Copy(APath, Length(APath), 1) <> '\' then
    APath := APath + '\';

  Result := DirectoryExists(APath);

  if Result then
  begin
    APath := APath + 'TPROCESSO\' + AProcesso + '\';

//    if cdsDigitalizacao.Active then
//      cdsDigitalizacao.Close;

//    cdsDigitalizacao.Params.ParamByName('NR_PROCESSO').Value := AProcesso;
//    cdsDigitalizacao.Open;

    Prefixo := Trim(ConsultaSQL('SELECT NM_PREFIXO_ARQ                  '+
                                '  FROM TTP_DOCTO_DIGITALIZADO (NOLOCK) '+
                                ' WHERE ID_TABELA     = :ID_TABELA      '+
                                '   AND CD_TIPO_DOCTO = :CD_TIPO_DOCTO  '
                                , ''
                                , [ID_TABELA, ATipoDocumento]));

    if Prefixo = '' then
      Prefixo := 'CE';

    if Pos('\', ADocumento) = 0 then
      ADocumento := DownloadPath + ADocumento;

    Result := FileExists(ADocumento);

  ConexaoJaAberta := FDConnection1.Connected;

  // Tenta conectar se a conexão NÃO estiver aberta
  if not ConexaoJaAberta then
  begin
    try
      FDConnection1.Connected := True;
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao conectar ao banco para fazer o insert do documento: ' + E.Message);
        Exit;
      end;
    end;
  end;

  try
    if Result then
    begin
      FDQueryDigitalizacao.Close;
      FDQueryDigitalizacao.Connection := FDConnection1;

      FDQueryDigitalizacao.SQL.Text :=
        'INSERT INTO TPROCESSO_DOCTOS (NR_PROCESSO, CD_TIPO_DOCTO, NM_DESCRICAO, NM_ARQUIVO, CD_USUARIO_CRIACAO, ID_TABELA) ' +
        'VALUES (:NR_PROCESSO, :CD_TIPO_DOCTO, :NM_DESCRICAO, :NM_ARQUIVO, :CD_USUARIO_CRIACAO, :ID_TABELA)';

      NmArquivo := GetNomeArquivo(AProcesso, APath, Prefixo);
      FDQueryDigitalizacao.ParamByName('NR_PROCESSO').AsString        := AProcesso;
      FDQueryDigitalizacao.ParamByName('CD_TIPO_DOCTO').AsString      := ATipoDocumento;
      FDQueryDigitalizacao.ParamByName('NM_DESCRICAO').AsString       := ADescricao;
      FDQueryDigitalizacao.ParamByName('NM_ARQUIVO').AsString         := NmArquivo;
      FDQueryDigitalizacao.ParamByName('CD_USUARIO_CRIACAO').AsString := '0707';
      FDQueryDigitalizacao.ParamByName('ID_TABELA').AsInteger         := ID_TABELA;

      AArquivoDestino := APath + Trim(NmArquivo);
      if Funcoes.MoveFile(ADocumento, AArquivoDestino) then
      begin
        FDQueryDigitalizacao.ExecSQL;
        Result := True;
      end
      else
      begin
//        cdsDigitalizacao.Cancel;
        Result := False;
      end;
    end;

  finally
    // Só fecha a conexão se ela NÃO estava aberta antes
    if not ConexaoJaAberta then
      FDConnection1.Connected := False;
  end;

end;











end;

function TdtmmyParametrizacaoLIConsulta.EnviaEmail(ARemetente: String; APara, ACopia, ACopiaOculta: array of String; AAssunto, ACorpo: String; AAnexos: array of String): Boolean;
var
  NewText1 : TIdText;
  I: Integer;
  strAnexos: String;
  pwAssunto, pwHtml, pwDestinatarios, pwRemetente, pwAnexos, pwCopia, pwCopiaOculta: PWideChar;
begin
  Result := VerificaConexao;
  if Result then
  begin
    if qryMail.Active then
      qryMail.Close;
    qryMail.Open;

    IdSMTP1.Host     := qryMailNM_HOST.AsString;
    IdSMTP1.Port     := qryMailNR_PORTA.AsInteger;
    IdSMTP1.Username := qryMailNM_LOGIN.AsString;
    IdSMTP1.Password := qryMailNM_SENHA.AsString;

    IdMessage1.Clear;

    NewText1 := TIdText.Create(IdMessage1.MessageParts);

    try
      with NewText1 do
      begin
        ContentType:='text/html';
        CharSet := 'UTF-8';
        for I := 0 to High(AAnexos) do
          if FileExists(AAnexos[I]) then
            TIdAttachmentFile.Create(IdMessage1.MessageParts, AAnexos[I]);

        Body.Add('<html>');
        Body.Add('<body>');
        Body.Add(ACorpo);
        Body.Add('<br>');
        Body.Add('<br>');
        Body.Add('</body>');
        Body.Add('</html>');
        pwHtml := PWideChar(WideString(Body.Text));
      end;

      with IdMessage1 do
      begin
        From.Text := ARemetente;

        // Eliminar Destitário inserido mais de uma vez
        for I := 0 to High(APara) do
          if (APara[I] <> '') and (AnsiIndexText(APara[I], APara) = I) then
            Recipients.Add.Text := APara[I];

        // Eliminar Cópia inserido mais de uma vez ou inserido em ADestinatarios
        for I := 0 to High(ACopia) do
          if (ACopia[I] <> '') and (AnsiIndexText(ACopia[I], ACopia) = I)
             and (AnsiIndexText(ACopia[I], APara) < 0) then
            CCList.Add.Text := ACopia[I];

        // Eliminar Cópia Oculta inserido mais de uma vez ou inserido em ADestinatarios ou inserido em ACopia
        for I := 0 to High(ACopiaOculta) do
          if (ACopiaOculta[I] <> '') and (AnsiIndexText(ACopiaOculta[I], ACopiaOculta) = I)
             and (AnsiIndexText(ACopiaOculta[I], APara) < 0) and (AnsiIndexText(ACopiaOculta[I], ACopia) < 0) then
            BccList.Add.Text := ACopiaOculta[I];

        Subject := Trim(AAssunto);
      end;
      strAnexos := '';
      for I := 0 to High(AAnexos) do
        strAnexos := strAnexos + AAnexos[I] + ';';

      pwRemetente     := PWideChar(WideString(IdMessage1.From.Text));
      pwDestinatarios := PWideChar(WideString(IdMessage1.Recipients.EMailAddresses));
      pwAssunto       := PWideChar(WideString(IdMessage1.Subject));
      pwAnexos        := PWideChar(WideString(strAnexos));
      pwCopia         := PWideChar(WideString(IdMessage1.CCList.EMailAddresses));
      pwCopiaOculta   := PWideChar(WideString(IdMessage1.BCCList.EMailAddresses));

      Result := MySendMail(pwRemetente, pwDestinatarios, pwCopia, pwCopiaOculta, pwAssunto, pwHtml, pwAnexos);
    finally
      FreeAndNil(NewText1);
      IdSMTP1.Disconnect;
      IdMessage1.Clear;
    end;
  end;
end;

function TdtmmyParametrizacaoLIConsulta.ExecSQL(ASQL: String; AValoresFiltro: array of Variant): Integer;
begin
  if qryConsulta.Active then
    qryConsulta.Close;

  qryConsulta.SQL.Text := ASQL;
  SetParametros(qryConsulta, AValoresFiltro);
  Result := qryConsulta.ExecSQL;
end;

function TdtmmyParametrizacaoLIConsulta.GetNomeArquivo(AProcesso, APathDig, APrefixo: String): String;
var
  A: Integer;
  S, N: String;
begin
  // Pegar o índice para o nome do arquivo
  with AbreDataSet(' SELECT ISNULL(MAX(DBO.FN_DOCTO_NUMERO(NM_ARQUIVO, :NM_PREFIXO )), 0) +1' +
                    '  FROM TPROCESSO_DOCTOS (NOLOCK) ' +
                    ' WHERE NR_PROCESSO = :NR_PROCESSO' +
                    '   AND ID_TABELA   = :ID_TABELA' +
                    '   AND NM_ARQUIVO LIKE :NM_PREFIXO', [APrefixo, AProcesso, ID_TABELA, APrefixo + '%']) do
  begin
    try
      First;
      if Eof then
        A := 0
      else
      begin
        S := Fields[0].AsString;
        N := S;
        A := StrToInt(N);
      end;
      Close;
    finally
      Free;
    end;
  end;

  repeat
    Inc(A);
    Result := APrefixo + FormatFloat('00', A);
  until not FileExists(APathDig + Result + '.pdf');

  Result := AnsiUpperCase(Result + '.pdf');
end;

function TdtmmyParametrizacaoLIConsulta.InTransaction: Boolean;
begin
  Result := Connection.InTransaction;
end;

procedure TdtmmyParametrizacaoLIConsulta.Rollback;
begin
  Connection.RollbackFreeAndNil(FTransaction);
end;

function TdtmmyParametrizacaoLIConsulta.TemDocumento(AProcesso, ATipoDocumento: String; AIncluirInativos: Boolean = False): Boolean;
begin
  if AIncluirInativos then
    Result := ConsultaSQL('SELECT COUNT(*) ' +
                          '  FROM TPROCESSO_DOCTOS (NOLOCK) ' +
                          ' WHERE NR_PROCESSO   = :NR_PROCESSO ' +
                          '   AND CD_TIPO_DOCTO = :CD_TIPO_DOCTO',
                          '0',
                          [AProcesso, ATipoDocumento]) > 0
  else
    Result := ConsultaSQL('SELECT COUNT(*)                     ' +
                          '  FROM TPROCESSO_DOCTOS (NOLOCK)    ' +
                          ' WHERE NR_PROCESSO   = :NR_PROCESSO ' +
                          '   AND CD_TIPO_DOCTO = :CD_TIPO_DOCTO ' +
                          '   AND IN_ATIVO      = :IN_ATIVO',
                           '0',
                            [AProcesso, ATipoDocumento, '1']) > 0;
end;

function TdtmmyParametrizacaoLIConsulta.VerificaConexao: Boolean;
begin
  Result := Connection.Connected;
  if Result then
    try
      if qryConsulta.Active then
        qryConsulta.Close;

      qryConsulta.SQL.Text := 'SELECT 1';
      qryConsulta.Open;
    except
      Result := False;
      Connection.Close;
    end;
  if not Connection.Connected then
    try
      Connection.Open;
      Result := True;
    except
      Result := False;
    end;
end;

end.
