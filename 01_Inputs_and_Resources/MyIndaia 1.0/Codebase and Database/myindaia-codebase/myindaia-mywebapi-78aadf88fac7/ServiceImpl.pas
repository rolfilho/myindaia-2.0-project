unit ServiceImpl;

interface

uses
  XData.Server.Module,
  XData.Service.Common,
  System.SysUtils,
  Sparkle.HttpSys.Server,
  System.Generics.Collections,
  Aurelius.Drivers.Interfaces,DB,
  System.StrUtils,
  System.Variants,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  System.JSON.Builders,
  ServiceIntf,
  DmBroker,
  Aurelius.Engine.ObjectManager;

type
  IUser = interface
  
  end;

  TUser = class(TInterfacedObject, IUser)
  private
    FCodigo: string;
    FName: string;
    FInternal: Boolean;
    FIdioma: Integer;
    FExternoImportador: Boolean;
    FSupervisorSistema: Boolean;
    FExibeLogo155: Boolean;
  published
    property Codigo: string read FCodigo write FCodigo;
    property Name: string read FName write FName;
    property Internal: Boolean read FInternal write FInternal;
    property Idioma: Integer read FIdioma write FIdioma;
    property ExternoImportador: Boolean read FExternoImportador write FExternoImportador;
    property SupervisorSistema: Boolean read FSupervisorSistema write FSupervisorSistema;
    property ExibeLogo155: Boolean read FExibeLogo155 write FExibeLogo155;
  end;

  [ServiceImplementation]
  TService = class(TInterfacedObject, IService)
  private
    function GetUser: TUser;
  public
    function Info: TInfo;
    function Login(const UserName, Password: string): TLogin;
    function ProcessosExpo(const [XDefault('')]Numero, [XDefault('')]Pedido, [XDefault('')]Container, [XDefault('')]DDeDUe, [XDefault('')]Mercadoria, [XDefault('')]Exportador, [XDefault('')]BL, [XDefault('')]Cliente, [XDefault('')]StatusAtual, [XDefault('')]QtdResultAtual: string): TList<TExpoProcesso>;
    function ProcessosImpo(const [XDefault('')]Numero, [XDefault('')]Pedido, [XDefault('')]Container, [XDefault('')]DiDUImp, [XDefault('')]Mercadoria, [XDefault('')]Exportador, [XDefault('')]BL, [XDefault('')]Cliente, [XDefault('')]StatusAtual, [XDefault('')]QtdResultAtual: string): TList<TImpoProcesso>;
    function ProcessosPorStatus: TList<TProcessosPorStatus>;
    function ProcessosEmAndamentoExpo: TList<TProcessosEmAndamentoExpo>;
    function ProcessosEmAndamentoImpo: TList<TProcessosEmAndamentoImpo>;
    procedure Notificacao(const Processo: string; const Evento: string; Ativa: Boolean);
    procedure SetDevice(const [XDefault('')]Token: string; const [XDefault('')]Fingerprint: string;
      const [XDefault('')]UserAgent: string; const [XDefault('')]Browser: string;
      const [XDefault('')]BrowserVersion: string; const [XDefault('')]BrowserMajorVersion: string;
      const [XDefault('')]Engine: string; const [XDefault('')]EngineVersion: string; const [XDefault('')]OS: string;
      const [XDefault('')]OSVersion: string; const [XDefault('')]Device: string; const [XDefault('')]DeviceType: string;
      const [XDefault('')]DeviceVendor: string; const [XDefault('')]CPU: string; const [XDefault('')]ColorDepth: string;
      const [XDefault('')]CurrentResolution: string; const [XDefault('')]AvailableResolution: string;
      const [XDefault('')]DeviceXDPI: string; const [XDefault('')]DeviceYDPI: string;
      const [XDefault('')]LocalStorage: string; const [XDefault('')]SessionStorage: string;
      const [XDefault('')]Cookie: string; const [XDefault('')]TimeZone: string; const [XDefault('')]Language: string;
      const [XDefault('')]SystemLanguage: string);
  end;

const
  JWT_SECRET = '2d013705c915';

implementation

uses
  System.IOUtils, XData.Sys.Exceptions,
  Bcl.Jose.Core.JWT, Bcl.Jose.Core.Builder, Sparkle.Middleware.Jwt, Security,
  Entities, Aurelius.Criteria.Base, Aurelius.Criteria.Linq;

function TService.GetUser: TUser;
var
  User: IUserIdentity;
begin
  Result := TUser.Create;
  User := TXDataOperationContext.Current.Request.User;
  if User = nil then
    raise EXDataHttpUnauthorized.Create('Usuário não autenticado');
  if not User.Claims.Exists('username') then
    raise EXDataHttpForbidden.Create('Não há privilégios suficientes. Informações de autenticação inválidas');
  Result.Name := User.Claims['username'].AsString;
  if Result.Name = '' then
    raise EXDataHttpForbidden.Create('Não há privilégios suficientes. Nome não informado.');
  Result.Codigo := User.Claims['usercode'].AsString;
  Result.Internal := User.Claims['internaluser'].AsBoolean;
  Result.Idioma := User.Claims['idioma'].AsInt64;
  Result.ExternoImportador := User.Claims['ExternoImportador'].AsBoolean;
  Result.SupervisorSistema := User.Claims['SupervisorSistema'].AsBoolean;
  Result.ExibeLogo155 := User.Claims['ExibeLogo155'].AsBoolean;

end;

function TService.Info: TInfo;
var
  Info: TInfo;
begin
  ///ValidaLogin;
  Info := TInfo.Create;
  Info.AppName := 'MyIndaia Web Api';
  Info.Version := '1.0.0';
  Result := Info;
end;

function TService.Login(const UserName, Password: string): TLogin;
var
  JWT: TJWT;
  stUser: IDBStatement;
  rsUser: IDBResultSet;
  prUser: TObjectList<TDBParam>;
  SQL: string;
  InternalUser: Boolean;
  Idioma: Integer;
  Nome: string;
  Codigo: string;
  ExternoImportador: Boolean;
  SupervisorSistema: Boolean;
  ExibeLogo155: Boolean;
begin
  { check if UserName and Password are valid, retrieve User data from database,
   add relevant claims to JWT and return it. In this example, we will accept any
   user as long the password is the same }
  {if UserName <> Password then
    raise EXDataHttpUnauthorized.Create('Invalid password');
   }
  // Generate the token
  if TDataModuleBroker.ValidaLogin(UserName, Password) then
  begin
    prUser := TObjectList<TDBParam>.Create;
    try

      SQL := ' SELECT U.CD_USUARIO, C.IN_INTERNO, ISNULL(U.CD_IDIOMA, 0) AS CD_IDIOMA , ' +
             ' U.NM_USUARIO, U.CD_CARGO, ISNULL(EEG155.CD_GRUPO, ''0'') CONFIRMACAO_EEG155, ' +
             ' ISNULL(PG155.CD_GRUPO, ''0'') as CONFIRMACAO_PG155 ' +
             ' FROM TUSUARIO U ' +
             ' INNER JOIN TCARGO C ON C.CD_CARGO=U.CD_CARGO ' +
             ' LEFT JOIN TPERMISSAO_EMPRESA_EST PEE ON PEE.CD_USUARIO = U.CD_USUARIO ' +
             ' LEFT JOIN TEMPRESA_EST EE ON EE.CD_EMPRESA = PEE.CD_EMPRESA ' +
             ' LEFT JOIN TEMPRESA_EST_GRUPO EEG155 ON EEG155.CD_EMPRESA = EE.CD_EMPRESA AND EEG155.CD_GRUPO=''155'' ' +
             ' LEFT JOIN BROKER.DBO.TPERMISSAO_GRUPO PG155 ON PG155.CD_USUARIO = U.CD_USUARIO AND PG155.CD_GRUPO = ''155'' AND PG155.IN_ATIVO = 1 ' +
             ' WHERE U.IN_ATIVO = 1 ' +
             ' AND AP_USUARIO = :AP_USUARIO ';

      prUser.Add(TDBParam.Create('AP_USUARIO', ftString, UserName));
      stUser := FireDacMSSQL.CreateConnection.CreateStatement;
      stUser.SetSQLCommand(SQL);
      stUser.SetParams(prUser);
      rsUser := stUser.ExecuteQuery;
    finally
      prUser.Free;
    end;
    while rsUser.Next do
    begin
      Codigo := rsUser.GetFieldValue('CD_USUARIO');
      InternalUser := rsUser.GetFieldValue('IN_INTERNO') = 1;
      Idioma := rsUser.GetFieldValue('CD_IDIOMA');
      Nome := rsUser.GetFieldValue('NM_USUARIO');
      ExternoImportador := rsUser.GetFieldValue('CD_CARGO') = '088';
      ExibeLogo155 := ((rsUser.GetFieldValue('CD_CARGO') = '040') and (rsUser.GetFieldValue('CONFIRMACAO_PG155') = '155')) or  //Se for funcionário da Nestle
                      (rsUser.GetFieldValue('CONFIRMACAO_EEG155') = '155'); //Ou se for Cliente da Nestle
      SupervisorSistema := rsUser.GetFieldValue('CD_CARGO') = '001';

    end;

    JWT := TJWT.Create(TJWTClaims);
    try
      JWT.Claims.SetClaimOfType<string>('username', UserName);
      JWT.Claims.SetClaimOfType<string>('usercode', Codigo);
      JWT.Claims.SetClaimOfType<Boolean>('internaluser', InternalUser);
      JWT.Claims.SetClaimOfType<Integer>('idioma', Idioma);
      JWT.Claims.SetClaimOfType<Boolean>('ExternoImportador', ExternoImportador);
      JWT.Claims.SetClaimOfType<Boolean>('SupervisorSistema', SupervisorSistema);
      JWT.Claims.SetClaimOfType<Boolean>('ExibeLogo155', ExibeLogo155);
      JWT.Claims.Issuer := 'XData Server';
      Result := TLogin.Create;
      Result.Nome := Nome;
      Result.Token := TJOSE.SHA256CompactToken(JWT_SECRET, JWT);
      Result.Interno := InternalUser;
      Result.Idioma := Idioma;
      Result.Grupo155 := ExibeLogo155;
//      Result.Codigo := Codigo;
    finally
      JWT.Free;
    end;
  end;
end;

procedure TService.Notificacao(const Processo, Evento: string; Ativa: Boolean);
var
  stDevice: IDBStatement;
  rsDevice: IDBResultSet;
  prDevice: TObjectList<TDBParam>;
  SQL: string;
  User: TUser;
  Manager: TObjectManager;
  DeviceUser: TDeviceUser;
begin
  Manager := FireDacMSSQL.ObjectManager;
  User := GetUser;
  if Ativa then
    SQL := 'INSERT INTO DEVICE_NOTIFICATION (CD_USUARIO, NR_PROCESSO, CD_EVENTO) '+
           'VALUES(:CD_USUARIO, :NR_PROCESSO, :CD_EVENTO)'
  else
    SQL := 'DELETE FROM DEVICE_NOTIFICATION WHERE CD_USUARIO = :CD_USUARIO AND '+
           'NR_PROCESSO = :NR_PROCESSO AND CD_EVENTO = :CD_EVENTO';
  prDevice := TObjectList<TDBParam>.Create;
  try
    prDevice.Add(TDBParam.Create('CD_USUARIO', ftString, User.Codigo));
    prDevice.Add(TDBParam.Create('NR_PROCESSO', ftString, Processo));
    prDevice.Add(TDBParam.Create('CD_EVENTO', ftString, Evento));
    stDevice := FireDacMSSQL.CreateConnection.CreateStatement;
    stDevice.SetSQLCommand(SQL);
    stDevice.SetParams(prDevice);
    stDevice.Execute;
  finally
    prDevice.Free;
  end;
end;

{CONSULTAS}

function GetSQLEventos: string;
begin
  Result := 'SELECT '+
    'FUP.CD_EVENTO, '+
    'EV.NM_EVENTO, '+
    'EV.NM_INGLES, '+
    'EV.NM_ESPANHOL, '+
    'CONVERT(VARCHAR, FUP.DT_PREVISTA, 107) + '' ''+ CONVERT(VARCHAR, FUP.DT_PREVISTA, 8) + '' GMT-03:00'' AS DT_PREVISTA, ' +
    'CONVERT(VARCHAR, FUP.DT_REALIZACAO, 107) + '' ''+ CONVERT(VARCHAR, FUP.DT_REALIZACAO, 8) + '' GMT-03:00'' AS DT_REALIZACAO, ' +

    'CASE WHEN N.NR_PROCESSO IS NOT NULL THEN 1 ELSE 0 END AS NOTIFY '+
    'FROM TFOLLOWUP FUP '+
    'LEFT JOIN BROKER.DBO.TEVENTO EV ON EV.CD_EVENTO=FUP.CD_EVENTO '+
    'LEFT JOIN DEVICE_NOTIFICATION N ON N.NR_PROCESSO = FUP.NR_PROCESSO AND N.CD_EVENTO=FUP.CD_EVENTO AND N.CD_USUARIO = :CD_USUARIO '+
    'WHERE FUP.NR_PROCESSO = :NR_PROCESSO '+
    'ORDER BY FUP.NR_ORDEM';
end;

function GetSQLEventosFixos: string;
begin
  Result :=
    'SELECT TP.NR_PROCESSO, ' +
    'EVENTOS_AEREO.OrdemEvento, ' +
    'EVENTOS_AEREO.CD_EVENTO AS Codigo, ' +
    'EVENTOS_AEREO.NomeEvento AS Nome, ' +
    'EV.NM_EVENTO, ' +
    'CONVERT(VARCHAR, EVENTOS.DT_PREVISTA  , 107) + '' ''+ CONVERT(VARCHAR, EVENTOS.DT_PREVISTA  , 8) + '' GMT-03:00'' AS Previsto, ' +
    'CONVERT(VARCHAR, EVENTOS.DT_REALIZACAO, 107) + '' ''+ CONVERT(VARCHAR, EVENTOS.DT_REALIZACAO, 8) + '' GMT-03:00'' AS Realizado ' +
    'FROM BROKER.DBO.TPROCESSO TP ' +
    'CROSS APPLY (SELECT ''297'' AS CD_EVENTO, 1 AS OrdemEvento, ''ETD'' AS NomeEvento UNION ' +
    '			 SELECT ''551'', 2, ''Embarque'' UNION ' +
    '			 SELECT ''162'', 3, ''Chegada'' UNION ' +
    '			 SELECT ''012'', 4, ''Presenca'' UNION ' +
    '			 SELECT ''021'', 5, ''Registro'' UNION ' +
    '			 SELECT ''088'', 6, ''Desembaraco'' UNION ' +
    '			 SELECT ''041'', 7, ''Liberacao'' UNION ' +
    '			 SELECT ''164'', 8, ''MercadoriaFabrica'') AS EVENTOS_AEREO ' +
    'LEFT JOIN BROKER.DBO.TFOLLOWUP EVENTOS ON EVENTOS.NR_PROCESSO = TP.NR_PROCESSO AND EVENTOS_AEREO.CD_EVENTO = EVENTOS.CD_EVENTO ' +
    'LEFT JOIN BROKER.DBO.TEVENTO EV ON EV.CD_EVENTO = EVENTOS_AEREO.CD_EVENTO ' +
    'WHERE TP.NR_PROCESSO = :NR_PROCESSO ' +
    'ORDER BY OrdemEvento ';
end;

function GetSQLDocumentos: string;
begin
  Result := 'SELECT DISTINCT '+
    'TD.NM_TIPO_DOCTO AS TipoDocumento, '+
    'PD.NM_DESCRICAO AS Descricao, '+
    'CONVERT(VARCHAR, PD.DT_CRIACAO, 107) + '' ''+ CONVERT(VARCHAR, PD.DT_CRIACAO, 8) + '' GMT-03:00'' AS DataCriacao, ' +
    'PD.NM_ARQUIVO AS NomeArquivo '+
    'FROM TPROCESSO_DOCTOS PD '+
    'LEFT JOIN BROKER.DBO.TTP_DOCTO_DIGITALIZADO TD ON '+
    'TD.CD_TIPO_DOCTO=PD.CD_TIPO_DOCTO AND PD.ID_TABELA = TD.ID_TABELA '+
    'WHERE PD.IN_ATIVO = 1 AND PD.NR_PROCESSO = :NR_PROCESSO ';
end;

{CONSULTAS EXPORTAÇÃO}

function GetSQLExpoEventosFixos: string;
begin
  Result := 'SELECT '+
    ' CONVERT(VARCHAR, EV113.DT_REALIZACAO, 107) + '' ''+ CONVERT(VARCHAR, EV113.DT_REALIZACAO, 8) + '' GMT-03:00'' AS Liberacao, ' +
    ' CONVERT(VARCHAR, EV113.DT_PREVISTA,   107) + '' ''+ CONVERT(VARCHAR, EV113.DT_PREVISTA,   8) + '' GMT-03:00'' AS LiberacaoPrevisto, ' +
    ' CONVERT(VARCHAR, EV314.DT_REALIZACAO, 107) + '' ''+ CONVERT(VARCHAR, EV314.DT_REALIZACAO, 8) + '' GMT-03:00'' AS Carregamento, ' +
    ' CONVERT(VARCHAR, EV314.DT_PREVISTA,   107) + '' ''+ CONVERT(VARCHAR, EV314.DT_PREVISTA,   8) + '' GMT-03:00'' AS CarregamentoPrevisto, ' +
    ' CONVERT(VARCHAR, EV398.DT_REALIZACAO, 107) + '' ''+ CONVERT(VARCHAR, EV398.DT_REALIZACAO, 8) + '' GMT-03:00'' AS ChegadaFronteira, ' +
    ' CONVERT(VARCHAR, EV398.DT_PREVISTA,   107) + '' ''+ CONVERT(VARCHAR, EV398.DT_PREVISTA,   8) + '' GMT-03:00'' AS ChegadaFronteiraPrevisto, ' +
    ' CONVERT(VARCHAR, EV088.DT_REALIZACAO, 107) + '' ''+ CONVERT(VARCHAR, EV088.DT_REALIZACAO, 8) + '' GMT-03:00'' AS Desembaraco, ' +
    ' CONVERT(VARCHAR, EV088.DT_PREVISTA,   107) + '' ''+ CONVERT(VARCHAR, EV088.DT_PREVISTA,   8) + '' GMT-03:00'' AS DesembaracoPrevisto, ' +
    ' CONVERT(VARCHAR, EV132.DT_REALIZACAO, 107) + '' ''+ CONVERT(VARCHAR, EV132.DT_REALIZACAO, 8) + '' GMT-03:00'' AS Saida, ' +
    ' CONVERT(VARCHAR, EV132.DT_PREVISTA,   107) + '' ''+ CONVERT(VARCHAR, EV132.DT_PREVISTA,   8) + '' GMT-03:00'' AS SaidaPrevisto, ' +
    ' CONVERT(VARCHAR, EV149.DT_REALIZACAO, 107) + '' ''+ CONVERT(VARCHAR, EV149.DT_REALIZACAO, 8) + '' GMT-03:00'' AS Cruze, ' +
    ' CONVERT(VARCHAR, EV149.DT_PREVISTA,   107) + '' ''+ CONVERT(VARCHAR, EV149.DT_PREVISTA,   8) + '' GMT-03:00'' AS CruzePrevisto ' +
    ' FROM BROKER.DBO.TPROCESSO TP '+
    ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV113 ON EV113.NR_PROCESSO=TP.NR_PROCESSO AND EV113.CD_EVENTO=''113'' AND EV113.IN_APLICAVEL=''1'' '+
    ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV314 ON EV314.NR_PROCESSO=TP.NR_PROCESSO AND EV314.CD_EVENTO=''314'' AND EV314.IN_APLICAVEL=''1'' '+
    ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV088 ON EV088.NR_PROCESSO=TP.NR_PROCESSO AND EV088.CD_EVENTO=''088'' AND EV088.IN_APLICAVEL=''1'' '+
    ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV149 ON EV149.NR_PROCESSO=TP.NR_PROCESSO AND EV149.CD_EVENTO=''149'' AND EV149.IN_APLICAVEL=''1'' '+
    ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV132 ON EV132.NR_PROCESSO=TP.NR_PROCESSO AND EV132.CD_EVENTO=''132'' AND EV132.IN_APLICAVEL=''1'' '+
    ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV398 ON EV398.NR_PROCESSO=TP.NR_PROCESSO AND EV398.CD_EVENTO=''398'' AND EV398.IN_APLICAVEL=''1'' ' +
    ' WHERE TP.NR_PROCESSO = :NR_PROCESSO';
end;

function GetSQLExpoProcessos: string;
begin
  Result :=
    'SELECT @COUNT_TOP@ FROM ( ' +
    ' SELECT ' +
    ' ROW_NUMBER() OVER(ORDER BY TP.NR_PROCESSO) AS NR_LINHA, ' +
    ' TP.NR_PROCESSO, '+
    ' EN.NM_EMPRESA, '+
//    ' DBO.FN_CONCATENA_REFRENCIA_TIPO(TP.NR_PROCESSO, G.TP_PEDIDO_BUSCA) AS RefCliente, '+

    ' Cast(ISNULL(STUFF((SELECT DISTINCT '', '' + LTRIM(RTRIM(R.CD_REFERENCIA))  +  RTRIM(LTRIM(ISNULL(''/'' + R.NR_ITEM_PO, '''')))'+
    '                        FROM TREF_CLIENTE R WITH (NOLOCK) '+
    '                        WHERE R.NR_PROCESSO   = TP.NR_PROCESSO '+
    '                FOR XML PATH('''')), 1, 1, ''''), '''') as Varchar(300)) AS RefCliente, '+
    ' RPC.CD_REFERENCIA AS RefPadraoCliente, '+
    ' PD.DESCRICAO AS PaisDestino, '+
    ' CA.NM_CANAL AS Canal, '+
    ' TP.TX_MERCADORIA AS Mercadoria, '+
    ' TP.VL_PESO_BRUTO AS PesoBruto, '+
    ' TP.VL_PESO_LIQUIDO AS PesoLiquido, '+
    ' (SELECT COUNT(CNT.NR_CNTR) FROM TPROCESSO_CNTR CNT WHERE CNT.NR_PROCESSO=TP.NR_PROCESSO) AS QtdConteiners, '+
    ' CONVERT(VARCHAR, EV113.DT_REALIZACAO, 107) + '' ''+ CONVERT(VARCHAR, EV113.DT_REALIZACAO, 8) + '' GMT-03:00'' AS LiberacaoProcesso, ' +
    ' CONVERT(VARCHAR, EV314.DT_REALIZACAO, 107) + '' ''+ CONVERT(VARCHAR, EV314.DT_REALIZACAO, 8) + '' GMT-03:00'' AS CarregamentoFabrica, ' +
    ' CONVERT(VARCHAR, EV088.DT_REALIZACAO, 107) + '' ''+ CONVERT(VARCHAR, EV088.DT_REALIZACAO, 8) + '' GMT-03:00'' AS Desembaraco, ' +
    ' CONVERT(VARCHAR, ISNULL(EV149.DT_REALIZACAO,EV132.DT_REALIZACAO), 107) + '' ''+ CONVERT(VARCHAR, ISNULL(EV149.DT_REALIZACAO,EV132.DT_REALIZACAO), 8) + '' GMT-03:00'' AS SaidaVeiculo, ' +
    ' VT.CD_VIA_TRANSP AS CdViaTransporte ' +
    ' FROM TPROCESSO TP '+
    ' INNER JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA=TP.CD_CLIENTE '+
    ' INNER JOIN BROKER.DBO.TGRUPO G ON G.CD_GRUPO=EN.CD_GRUPO '+
    ' OUTER APPLY (SELECT TOP 1 RC.CD_REFERENCIA ' +
    '              FROM BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ' +
    '              WHERE RC.NR_PROCESSO = TP.NR_PROCESSO AND RC.TP_REFERENCIA = G.TP_PEDIDO_BUSCA) AS RPC ' +
    ' @JOINUSER@ '+
    ' LEFT JOIN BROKER.DBO.TTP_CANAL CA ON CA.CD_CANAL=TP.CD_CANAL '+
    ' LEFT JOIN BROKER.DBO.TPAIS PD ON PD.CODIGO=TP.CD_PAIS_DESTINO '+
    ' LEFT JOIN BROKER.DBO.TSERVICO_NOVO SN (NOLOCK) ON SN.CD_SERVICO = TP.CD_SERVICO ' +
    ' LEFT JOIN BROKER.DBO.TVIA_TRANSP_BROKER VT (NOLOCK) ON VT.CD_VIA_TRANSP = SN.CD_VIA_TRANSPORTE ' +
    ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV113 ON EV113.NR_PROCESSO=TP.NR_PROCESSO AND EV113.CD_EVENTO=''113'' AND EV113.IN_APLICAVEL=''1'' '+
    ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV314 ON EV314.NR_PROCESSO=TP.NR_PROCESSO AND EV314.CD_EVENTO=''314'' AND EV314.IN_APLICAVEL=''1'' '+
    ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV088 ON EV088.NR_PROCESSO=TP.NR_PROCESSO AND EV088.CD_EVENTO=''088'' AND EV088.IN_APLICAVEL=''1'' '+
    ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV149 ON EV149.NR_PROCESSO=TP.NR_PROCESSO AND EV149.CD_EVENTO=''149'' AND EV149.IN_APLICAVEL=''1'' '+
    ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV132 ON EV132.NR_PROCESSO=TP.NR_PROCESSO AND EV132.CD_EVENTO=''132'' AND EV132.IN_APLICAVEL=''1'' '+
    '  @JOIN@ '+
    ' WHERE TP.CD_PRODUTO=''02'' AND TP.IN_CANCELADO = 0 ' +
    '  @WHERE@ ' +
    ') SUBSELECT ' +
    '@WHERE2@'
end;

{CONSULTAS IMPORTAÇÃO}

function GetSQLImpoProcessos: string;
begin
  Result :=
    'SELECT @COUNT_TOP@ FROM ( ' +
    ' SELECT ' +
    ' ROW_NUMBER() OVER(ORDER BY TP.NR_PROCESSO) AS NR_LINHA, ' +
    ' TP.NR_PROCESSO, ' +
    ' EN.NM_EMPRESA, ' +
//    ' DBO.FN_CONCATENA_REFRENCIA_TIPO(TP.NR_PROCESSO, G.TP_PEDIDO_BUSCA_IMP) AS RefCliente, ' +

    ' Cast(ISNULL(STUFF((SELECT DISTINCT '', '' + LTRIM(RTRIM(R.CD_REFERENCIA)) +  RTRIM(LTRIM(ISNULL(''/'' + R.NR_ITEM_PO, ''''))) '+
    '                        FROM TREF_CLIENTE R WITH (NOLOCK) '+
    '                        WHERE R.NR_PROCESSO   = TP.NR_PROCESSO '+
    '                FOR XML PATH('''')), 1, 1, ''''), '''') as Varchar(300)) AS RefCliente, '+
    ' RPC.CD_REFERENCIA AS RefPadraoCliente, '+

		' Cast(ISNULL(STUFF((SELECT DISTINCT '', '' + LTRIM(RTRIM(OA.CD_ORGAO_ANUENTE)) '+
		'				   FROM BROKER.DBO.TPROCESSO_LI_ORGAO_ANUENTE OA WITH (NOLOCK) '+
		'				   WHERE OA.NR_PROCESSO   = TP.NR_PROCESSO '+
		'				   FOR XML PATH('''')), 1, 1, ''''), '''') as Varchar(300)) AS Anuencias, '+

    ' CA.NM_CANAL AS Canal, ' +
    ' TP.TX_MERCADORIA AS Mercadoria, ' +
    ' ISNULL(TP.QT_MERC_UN_COMERC, 0) AS Quantidade, ' +
    ' TP.VL_PESO_LIQUIDO AS PesoLiquido, ' +
//    ' EV233.DT_REALIZACAO AS DeliveryDateRevisada, ' +
    ' CONVERT(VARCHAR, EV233.DT_REALIZACAO, 107) + '' ''+ CONVERT(VARCHAR, EV233.DT_REALIZACAO, 8) + '' GMT-03:00'' AS DeliveryDateRevisada, '+
    ' E.NM_ETAPA AS StatusAtual_br , ' +
    ' E.NM_INGLES AS StatusAtual_en, ' +
    ' E.NM_ESPANHOL AS StatusAtual_es, ' +
		' EE.NM_EMPRESA AS Exportador ' +
    ' FROM TPROCESSO TP ' +
    ' INNER JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = TP.CD_CLIENTE ' +
    ' INNER JOIN BROKER.DBO.TGRUPO G ON G.CD_GRUPO = EN.CD_GRUPO ' +
    ' OUTER APPLY (SELECT TOP 1 RC.CD_REFERENCIA ' +
    '              FROM BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ' +
    '              WHERE RC.NR_PROCESSO = TP.NR_PROCESSO AND RC.TP_REFERENCIA = G.TP_PEDIDO_BUSCA_IMP) AS RPC ' +
    ' @JOINUSER@ '+
    ' LEFT JOIN BROKER.DBO.TTP_CANAL CA ON CA.CD_CANAL = TP.CD_CANAL ' +
    ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV233 ON EV233.NR_PROCESSO  = TP.NR_PROCESSO AND EV233.CD_EVENTO = ''233'' AND EV233.IN_APLICAVEL = ''1'' ' +
    ' LEFT JOIN BROKER.DBO.TFOLLOWUP_ETAPA FE ON FE.NR_PROCESSO  = TP.NR_PROCESSO AND ' +
    '                        FE.DT_ALTERACAO = (SELECT MAX(FE1.DT_ALTERACAO) ' +
    '                                           FROM BROKER.DBO.TFOLLOWUP_ETAPA FE1 ' +
    '                                           WHERE FE1.NR_PROCESSO = FE.NR_PROCESSO ' +
    '                                           ) ' +
    ' LEFT JOIN BROKER.DBO.TETAPA E ON E.CD_ETAPA=FE.CD_ETAPA ' +
    ' LEFT JOIN BROKER.DBO.TEXPORTADOR_DI EDI (NOLOCK) ON EDI.NR_PROCESSO = TP.NR_PROCESSO ' +
  	' LEFT JOIN BROKER.DBO.TEMPRESA_EST EE (NOLOCK) ON EE.CD_EMPRESA = EDI.CD_EXPORTADOR ' +
    '  @JOIN@ ' +
    ' WHERE TP.CD_PRODUTO=''01'' AND TP.IN_CANCELADO = 0 ' +
    '  @WHERE@ ' +
    ') SUBSELECT ' +
    '@WHERE2@'
    ;
end;

function GetSQLImpoEventosFixos: string;
begin
  Result := 'SELECT '+
    ' CONVERT(VARCHAR, EV297.DT_REALIZACAO, 107) + '' ''+ CONVERT(VARCHAR, EV297.DT_REALIZACAO, 8) + '' GMT-03:00'' AS [ETD], '+
    ' CONVERT(VARCHAR, EV297.DT_PREVISTA  , 107) + '' ''+ CONVERT(VARCHAR, EV297.DT_PREVISTA  , 8) + '' GMT-03:00'' AS [ETDPrevisto], '+
    ' CONVERT(VARCHAR, EV551.DT_REALIZACAO, 107) + '' ''+ CONVERT(VARCHAR, EV551.DT_REALIZACAO, 8) + '' GMT-03:00'' AS [Embarque], '+
    ' CONVERT(VARCHAR, EV551.DT_PREVISTA  , 107) + '' ''+ CONVERT(VARCHAR, EV551.DT_PREVISTA  , 8) + '' GMT-03:00'' AS [EmbarquePrevisto], '+
    ' CONVERT(VARCHAR, EV162.DT_REALIZACAO, 107) + '' ''+ CONVERT(VARCHAR, EV162.DT_REALIZACAO, 8) + '' GMT-03:00'' AS [Chegada],'+
    ' CONVERT(VARCHAR, EV162.DT_PREVISTA  , 107) + '' ''+ CONVERT(VARCHAR, EV162.DT_PREVISTA  , 8) + '' GMT-03:00'' AS [ChegadaPrevisto], '+
    ' CONVERT(VARCHAR, EV012.DT_REALIZACAO, 107) + '' ''+ CONVERT(VARCHAR, EV012.DT_REALIZACAO, 8) + '' GMT-03:00'' AS [Presenca], '+
    ' CONVERT(VARCHAR, EV012.DT_PREVISTA  , 107) + '' ''+ CONVERT(VARCHAR, EV012.DT_PREVISTA  , 8) + '' GMT-03:00'' AS [PresencaPrevisto], '+
    ' CONVERT(VARCHAR, EV021.DT_REALIZACAO, 107) + '' ''+ CONVERT(VARCHAR, EV021.DT_REALIZACAO, 8) + '' GMT-03:00'' AS [Registro], '+
    ' CONVERT(VARCHAR, EV021.DT_PREVISTA  , 107) + '' ''+ CONVERT(VARCHAR, EV021.DT_PREVISTA  , 8) + '' GMT-03:00'' AS [RegistroPrevisto], '+
    ' CONVERT(VARCHAR, EV088.DT_REALIZACAO, 107) + '' ''+ CONVERT(VARCHAR, EV088.DT_REALIZACAO, 8) + '' GMT-03:00'' AS [Desembaraco], '+
    ' CONVERT(VARCHAR, EV088.DT_PREVISTA  , 107) + '' ''+ CONVERT(VARCHAR, EV088.DT_PREVISTA  , 8) + '' GMT-03:00'' AS [DesembaracoPrevisto], '+
    ' CONVERT(VARCHAR, EV041.DT_REALIZACAO, 107) + '' ''+ CONVERT(VARCHAR, EV041.DT_REALIZACAO, 8) + '' GMT-03:00'' AS [Liberacao], '+
    ' CONVERT(VARCHAR, EV041.DT_PREVISTA  , 107) + '' ''+ CONVERT(VARCHAR, EV041.DT_PREVISTA  , 8) + '' GMT-03:00'' AS [LiberacaoPrevisto], '+
    ' CONVERT(VARCHAR, EV164.DT_REALIZACAO, 107) + '' ''+ CONVERT(VARCHAR, EV164.DT_REALIZACAO, 8) + '' GMT-03:00'' AS [MercadoriaFabrica], '+
    ' CONVERT(VARCHAR, EV164.DT_PREVISTA  , 107) + '' ''+ CONVERT(VARCHAR, EV164.DT_PREVISTA  , 8) + '' GMT-03:00'' AS [MercadoriaFabricaPrevisto] '+
    'FROM BROKER.DBO.TPROCESSO TP '+
    'LEFT JOIN BROKER.DBO.TFOLLOWUP EV297 ON EV297.NR_PROCESSO=TP.NR_PROCESSO AND '+
    'EV297.CD_EVENTO=''297'' AND EV297.IN_APLICAVEL=''1'' '+
    'LEFT JOIN BROKER.DBO.TFOLLOWUP EV551 ON EV551.NR_PROCESSO=TP.NR_PROCESSO AND '+
    'EV551.CD_EVENTO=''551'' AND EV551.IN_APLICAVEL=''1'' '+
    'LEFT JOIN BROKER.DBO.TFOLLOWUP EV162 ON EV162.NR_PROCESSO=TP.NR_PROCESSO AND '+
    'EV162.CD_EVENTO=''162'' AND EV162.IN_APLICAVEL=''1'' '+
    'LEFT JOIN BROKER.DBO.TFOLLOWUP EV012 ON EV012.NR_PROCESSO=TP.NR_PROCESSO AND '+
    'EV012.CD_EVENTO=''012'' AND EV012.IN_APLICAVEL=''1'' '+
    'LEFT JOIN BROKER.DBO.TFOLLOWUP EV021 ON EV021.NR_PROCESSO=TP.NR_PROCESSO AND '+
    'EV021.CD_EVENTO=''021'' AND EV021.IN_APLICAVEL=''1'' '+
    'LEFT JOIN BROKER.DBO.TFOLLOWUP EV088 ON EV088.NR_PROCESSO=TP.NR_PROCESSO AND '+
    'EV088.CD_EVENTO=''088'' AND EV088.IN_APLICAVEL=''1'' '+
    'LEFT JOIN BROKER.DBO.TFOLLOWUP EV041 ON EV041.NR_PROCESSO=TP.NR_PROCESSO AND '+
    'EV041.CD_EVENTO=''041'' AND EV041.IN_APLICAVEL=''1'' '+
    'LEFT JOIN BROKER.DBO.TFOLLOWUP EV164 ON EV164.NR_PROCESSO=TP.NR_PROCESSO AND '+
    'EV164.CD_EVENTO=''164'' AND EV164.IN_APLICAVEL=''1'' '+
    'WHERE TP.NR_PROCESSO= :NR_PROCESSO';
end;

function GetSQLProcessosPorStatus: string;
begin
  Result := 'SELECT ' +
            ' (SELECT COUNT(P.NR_PROCESSO) FROM TPROCESSO P ' +
            '  INNER JOIN TFOLLOWUP EV314 ON EV314.NR_PROCESSO=P.NR_PROCESSO AND EV314.CD_EVENTO=''314'' AND EV314.IN_APLICAVEL=''1'' AND EV314.DT_REALIZACAO IS NULL ' +
            '  INNER JOIN TFOLLOWUP EV489 ON EV489.NR_PROCESSO=P.NR_PROCESSO AND EV489.CD_EVENTO=''489'' AND EV489.IN_APLICAVEL=''1'' AND EV489.DT_REALIZACAO IS NOT NULL ' +
            '  @JOINUSER@ ' +
            '  WHERE P.CD_PRODUTO=''02'' AND P.IN_CANCELADO=''0'' @WHERE@ ' +
            ' ) EXPO_AguardandoCarregamento, ' +
            ' (SELECT COUNT(P.NR_PROCESSO) FROM TPROCESSO P ' +
            '  INNER JOIN TFOLLOWUP EV314 ON EV314.NR_PROCESSO=P.NR_PROCESSO AND EV314.CD_EVENTO=''314'' AND EV314.IN_APLICAVEL=''1'' AND EV314.DT_REALIZACAO IS NOT NULL ' +
            '  INNER JOIN TFOLLOWUP EV194 ON EV194.NR_PROCESSO=P.NR_PROCESSO AND EV194.CD_EVENTO=''194'' AND EV194.IN_APLICAVEL=''1'' AND EV194.DT_REALIZACAO IS NULL ' +
            '  @JOINUSER@ ' +
            '  WHERE P.CD_PRODUTO=''02'' AND P.IN_CANCELADO=''0'' @WHERE@ ' +
            ' ) EXPO_AguardandoEnvioInvoice, ' +
            ' (SELECT COUNT(P.NR_PROCESSO) FROM TPROCESSO P ' +
            '  INNER JOIN TFOLLOWUP EV314 ON EV314.NR_PROCESSO=P.NR_PROCESSO AND EV314.CD_EVENTO=''314'' AND EV314.IN_APLICAVEL=''1'' AND EV314.DT_REALIZACAO IS NOT NULL ' +
            '  INNER JOIN TFOLLOWUP EV132 ON EV132.NR_PROCESSO=P.NR_PROCESSO AND EV132.CD_EVENTO=''132'' AND EV132.IN_APLICAVEL=''1'' AND EV132.DT_REALIZACAO IS NULL ' +
            '  @JOINUSER@ ' +
            '  WHERE P.CD_PRODUTO=''02'' AND P.IN_CANCELADO=''0'' @WHERE@ ' +
            ' ) EXPO_AguardandoEmbarque, ' +
            ' (SELECT COUNT(P.NR_PROCESSO) FROM TPROCESSO P ' +
            '  INNER JOIN TFOLLOWUP EV139 ON EV139.NR_PROCESSO=P.NR_PROCESSO AND EV139.CD_EVENTO=''139'' AND EV139.IN_APLICAVEL=''1'' AND EV139.DT_REALIZACAO IS NULL ' +
            '  INNER JOIN TFOLLOWUP EV132 ON EV132.NR_PROCESSO=P.NR_PROCESSO AND EV132.CD_EVENTO=''132'' AND EV132.IN_APLICAVEL=''1'' AND EV132.DT_REALIZACAO IS NOT NULL ' +
            '  @JOINUSER@ ' +
            '  WHERE P.CD_PRODUTO=''02'' AND P.IN_CANCELADO=''0'' @WHERE@ ' +
            ' ) EXPO_AguardandoEnvioDocsOriginais, ' +
            ' (SELECT COUNT(P.NR_PROCESSO) FROM TPROCESSO P ' +
            '  INNER JOIN TFOLLOWUP EV261 ON EV261.NR_PROCESSO=P.NR_PROCESSO AND EV261.CD_EVENTO=''261'' AND EV261.IN_APLICAVEL=''1'' AND EV261.DT_REALIZACAO IS NULL ' +
            '  INNER JOIN TFOLLOWUP EV132 ON EV132.NR_PROCESSO=P.NR_PROCESSO AND EV132.CD_EVENTO=''132'' AND EV132.IN_APLICAVEL=''1'' AND EV132.DT_REALIZACAO IS NOT NULL ' +
            '  @JOINUSER@ ' +
            '  WHERE P.CD_PRODUTO=''02'' AND P.IN_CANCELADO=''0'' @WHERE@ ' +
            ' ) EXPO_AguardandoChegadaDestino, ' +
            ' (SELECT COUNT(P.NR_PROCESSO) FROM TPROCESSO P ' +
            '  INNER JOIN TFOLLOWUP EV551 ON EV551.NR_PROCESSO=P.NR_PROCESSO AND EV551.CD_EVENTO=''551'' AND EV551.IN_APLICAVEL=''1'' AND EV551.DT_REALIZACAO IS NULL ' +
            '  INNER JOIN TFOLLOWUP EV092 ON EV092.NR_PROCESSO=P.NR_PROCESSO AND EV092.CD_EVENTO=''092'' AND EV092.IN_APLICAVEL=''1'' AND EV092.DT_REALIZACAO IS NULL ' +
            '  @JOINUSER@ ' +
            '  WHERE P.CD_PRODUTO=''01'' AND P.IN_CANCELADO=''0'' @WHERE@ ' +
            ' ) IMPO_AguardandoEmbarque, ' +
            ' (SELECT COUNT(P.NR_PROCESSO) FROM TPROCESSO P ' +
            '  INNER JOIN TFOLLOWUP EV551 ON EV551.NR_PROCESSO=P.NR_PROCESSO AND EV551.CD_EVENTO=''551'' AND EV551.IN_APLICAVEL=''1'' AND EV551.DT_REALIZACAO IS NOT NULL ' +
            '  INNER JOIN TFOLLOWUP EV162 ON EV162.NR_PROCESSO=P.NR_PROCESSO AND EV162.CD_EVENTO=''162'' AND EV162.IN_APLICAVEL=''1'' AND EV162.DT_REALIZACAO IS NULL ' +
            '  INNER JOIN TFOLLOWUP EV092 ON EV092.NR_PROCESSO=P.NR_PROCESSO AND EV092.CD_EVENTO=''092'' AND EV092.IN_APLICAVEL=''1'' AND EV092.DT_REALIZACAO IS NULL ' +
            '  @JOINUSER@ ' +
            '  WHERE P.CD_PRODUTO=''01'' AND P.IN_CANCELADO=''0'' @WHERE@ ' +
            ' ) IMPO_EmbarcadoAguardandoChegada, ' +
            ' (SELECT COUNT(P.NR_PROCESSO) FROM TPROCESSO P ' +
            '  INNER JOIN TFOLLOWUP EV088 ON EV088.NR_PROCESSO=P.NR_PROCESSO AND EV088.CD_EVENTO=''088'' AND EV088.IN_APLICAVEL=''1'' AND EV088.DT_REALIZACAO IS NULL ' +
            '  INNER JOIN TFOLLOWUP EV162 ON EV162.NR_PROCESSO=P.NR_PROCESSO AND EV162.CD_EVENTO=''162'' AND EV162.IN_APLICAVEL=''1'' AND EV162.DT_REALIZACAO IS NOT NULL ' +
            '  @JOINUSER@ ' +
            '  WHERE P.CD_PRODUTO=''01'' AND P.IN_CANCELADO=''0'' @WHERE@ ' +
            ' ) IMPO_EmDesembaraco, ' +
            ' (SELECT COUNT(P.NR_PROCESSO) FROM TPROCESSO P ' +
            '  INNER JOIN TFOLLOWUP EV088 ON EV088.NR_PROCESSO=P.NR_PROCESSO AND EV088.CD_EVENTO=''088'' AND EV088.IN_APLICAVEL=''1'' AND EV088.DT_REALIZACAO IS NOT NULL ' +
            '  INNER JOIN TFOLLOWUP EV838 ON EV838.NR_PROCESSO=P.NR_PROCESSO AND EV838.CD_EVENTO=''838'' AND EV838.IN_APLICAVEL=''1'' AND EV838.DT_REALIZACAO IS NULL ' +
            '  @JOINUSER@ ' +
            '  WHERE P.CD_PRODUTO=''01'' AND P.IN_CANCELADO=''0'' @WHERE@ ' +
            ' ) IMPO_DesembaracadoAguardandoProgramacaoEntrega, ' +
            ' (SELECT COUNT(P.NR_PROCESSO) FROM TPROCESSO P ' +
            '  INNER JOIN TFOLLOWUP EV164 ON EV164.NR_PROCESSO=P.NR_PROCESSO AND EV164.CD_EVENTO=''164'' AND EV164.IN_APLICAVEL=''1'' AND EV164.DT_REALIZACAO IS NULL ' +
            '  INNER JOIN TFOLLOWUP EV838 ON EV838.NR_PROCESSO=P.NR_PROCESSO AND EV838.CD_EVENTO=''838'' AND EV838.IN_APLICAVEL=''1'' AND EV838.DT_REALIZACAO IS NOT NULL ' +
            '  @JOINUSER@ ' +
            '  WHERE P.CD_PRODUTO=''01'' AND P.IN_CANCELADO=''0'' @WHERE@ ' +
            ' ) IMPO_ProgramadoAguardandoEntregaFabrica ';
end;

function GetSQLProcessosEmAndamentoExpo: string;
begin
  Result :=
            ' SELECT ' +
//            ' @TOP@ ' +
            ' SUBSTRING(TP.NR_PROCESSO,5,12) AS NumeroProcesso, ' +
            ' Cast(ISNULL(STUFF((SELECT '','' + LTRIM(RTRIM(R.CD_REFERENCIA)) FROM BROKER.DBO.TREF_CLIENTE R WITH (NOLOCK) ' +
            ' WHERE R.NR_PROCESSO = TP.NR_PROCESSO AND R.TP_REFERENCIA = ''08'' ' +
            ' FOR XML PATH('''')), 1, 1, ''''), '''') as Varchar(300)) AS RefEmbarque, ' +
            ' EN.AP_EMPRESA AS NomeCliente, ' +
            ' TP.TX_MERCADORIA AS Mercadoria, ' +
            ' CONVERT(VARCHAR, EV314.DT_REALIZACAO, 107) + '' '' + CONVERT(VARCHAR, EV314.DT_REALIZACAO, 8) + '' GMT-03:00'' AS DataCarregamentoFabrica, ' +
            ' CONVERT(VARCHAR, EV314.DT_PREVISTA, 107) + '' '' + CONVERT(VARCHAR, EV314.DT_PREVISTA, 8) + '' GMT-03:00'' AS DataCarregamentoFabricaPrevisao, ' +
            ' CONVERT(VARCHAR, EV314.IN_APLICAVEL, 107) + '' '' + CONVERT(VARCHAR, EV314.IN_APLICAVEL, 8) + '' GMT-03:00'' AS DataCarregamentoFabricaAplicacao, ' +
            ' CONVERT(VARCHAR, EV315.DT_REALIZACAO, 107) + '' '' + CONVERT(VARCHAR, EV315.DT_REALIZACAO, 8) + '' GMT-03:00'' AS DataEntregaCargaTermEmbarque, ' +
            ' CONVERT(VARCHAR, EV315.DT_PREVISTA, 107) + '' '' + CONVERT(VARCHAR, EV315.DT_PREVISTA, 8) + '' GMT-03:00'' AS DataEntregaCargaTermEmbarquePrevisao, ' +
            ' CONVERT(VARCHAR, EV315.IN_APLICAVEL, 107) + '' '' + CONVERT(VARCHAR, EV315.IN_APLICAVEL, 8) + '' GMT-03:00'' AS DataEntregaCargaTermEmbarqueAplicacao, ' +
            ' CONVERT(VARCHAR, EV088.DT_REALIZACAO, 107) + '' '' + CONVERT(VARCHAR, EV088.DT_REALIZACAO, 8) + '' GMT-03:00'' AS DataDesembaraco, ' +
            ' CONVERT(VARCHAR, EV088.DT_PREVISTA, 107) + '' '' + CONVERT(VARCHAR, EV088.DT_PREVISTA, 8) + '' GMT-03:00'' AS DataDesembaracoPrevisao, ' +
            ' CONVERT(VARCHAR, EV088.IN_APLICAVEL, 107) + '' '' + CONVERT(VARCHAR, EV088.IN_APLICAVEL, 8) + '' GMT-03:00'' AS DataDesembaracoAplicacao, ' +
            ' CONVERT(VARCHAR, EV132.DT_REALIZACAO, 107) + '' '' + CONVERT(VARCHAR, EV132.DT_REALIZACAO, 8) + '' GMT-03:00'' AS DataSaida, ' +
            ' CONVERT(VARCHAR, EV132.DT_PREVISTA, 107) + '' '' + CONVERT(VARCHAR, EV132.DT_PREVISTA, 8) + '' GMT-03:00'' AS DataSaidaPrevisao, ' +
            ' CONVERT(VARCHAR, EV132.IN_APLICAVEL, 107) + '' '' + CONVERT(VARCHAR, EV132.IN_APLICAVEL, 8) + '' GMT-03:00'' AS DataSaidaAplicacao, ' +
            ' CONVERT(VARCHAR, EV139.DT_REALIZACAO, 107) + '' '' + CONVERT(VARCHAR, EV139.DT_REALIZACAO, 8) + '' GMT-03:00'' AS DataEnvioDocumentos, ' +
            ' CONVERT(VARCHAR, EV139.DT_PREVISTA, 107) + '' '' + CONVERT(VARCHAR, EV139.DT_PREVISTA, 8) + '' GMT-03:00'' AS DataEnvioDocumentosPrevisao, ' +
            ' CONVERT(VARCHAR, EV139.IN_APLICAVEL, 107) + '' '' + CONVERT(VARCHAR, EV139.IN_APLICAVEL, 8) + '' GMT-03:00'' AS DataEnvioDocumentosAplicacao, ' +
            ' CONVERT(VARCHAR, EV261.DT_REALIZACAO, 107) + '' '' + CONVERT(VARCHAR, EV261.DT_REALIZACAO, 8) + '' GMT-03:00'' AS DataChegadaDestino, ' +
            ' CONVERT(VARCHAR, EV261.DT_PREVISTA, 107) + '' '' + CONVERT(VARCHAR, EV261.DT_PREVISTA, 8) + '' GMT-03:00'' AS DataChegadaDestinoPrevisao, ' +
            ' CONVERT(VARCHAR, EV261.IN_APLICAVEL, 107) + '' '' + CONVERT(VARCHAR, EV261.IN_APLICAVEL, 8) + '' GMT-03:00'' AS DataChegadaDestinoAplicacao ' +
            ' FROM BROKER.DBO.TPROCESSO TP (NOLOCK) ' +
            ' INNER JOIN BROKER.DBO.TEMPRESA_NAC EN (NOLOCK) ON EN.CD_EMPRESA = TP.CD_CLIENTE ' +
            ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV088 (NOLOCK) ON EV088.NR_PROCESSO = TP.NR_PROCESSO AND EV088.CD_EVENTO=''088'' ' +
            ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV132 (NOLOCK) ON EV132.NR_PROCESSO = TP.NR_PROCESSO AND EV132.CD_EVENTO=''132'' ' +
            ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV139 (NOLOCK) ON EV139.NR_PROCESSO = TP.NR_PROCESSO AND EV139.CD_EVENTO=''139'' ' +
            ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV147 (NOLOCK) ON EV147.NR_PROCESSO = TP.NR_PROCESSO AND EV147.CD_EVENTO=''147'' ' +
            ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV261 (NOLOCK) ON EV261.NR_PROCESSO = TP.NR_PROCESSO AND EV261.CD_EVENTO=''261'' ' +
            ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV314 (NOLOCK) ON EV314.NR_PROCESSO = TP.NR_PROCESSO AND EV314.CD_EVENTO=''314'' ' +
            ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV315 (NOLOCK) ON EV315.NR_PROCESSO = TP.NR_PROCESSO AND EV315.CD_EVENTO=''315'' ' +
            ' @JOINUSER@ ' +
            ' WHERE TP.CD_GRUPO = ''155'' ' +
            ' AND TP.CD_PRODUTO = ''02'' ' +
            ' AND TP.IN_CANCELADO = ''0'' ' +
            ' AND (EV147.DT_REALIZACAO IS NOT NULL AND EV147.IN_APLICAVEL = ''1'' ' +
            ' AND (EV261.IN_APLICAVEL=''1'') ' +
            ' AND (EV261.DT_REALIZACAO IS NULL OR EV261.DT_REALIZACAO >= GETDATE()-2)) '+
            ' @WHEREUSER@ ';
end;

function GetSQLProcessosEmAndamentoImpo: string;
begin
  Result :=
            ' SELECT ' +
//            ' @TOP@ ' +
            ' SUBSTRING(TP.NR_PROCESSO,5,12) AS [RefIndaia], ' +
            ' Cast(ISNULL(STUFF((SELECT DISTINCT '', '' + LTRIM(RTRIM(R.CD_REFERENCIA)) ' +
            ' FROM BROKER.DBO.TREF_CLIENTE R WITH (NOLOCK) ' +
            ' WHERE R.NR_PROCESSO = TP.NR_PROCESSO ' +
            ' AND R.TP_REFERENCIA = ''01'' ' +
            ' FOR XML PATH('''')), 1, 1, ''''), '''') as Varchar(300)) AS [NrPO], ' +
            ' EN.AP_EMPRESA AS [ClienteImportador], ' +
            ' RIGHT(CONVERT(VARCHAR(MAX),TP.TX_MERCADORIA),100) AS [Mercadoria], ' +
            ' EE.AP_EMPRESA AS [Exportador], ' +
            ' CONVERT(VARCHAR, EV233.DT_REALIZACAO, 107) + '' '' + CONVERT(VARCHAR, EV233.DT_REALIZACAO, 8) + '' GMT-03:00'' AS DeliveryDateRevisadaRealizado, ' +
            ' CONVERT(VARCHAR, EV233.DT_PREVISTA, 107) + '' '' + CONVERT(VARCHAR, EV233.DT_PREVISTA, 8) + '' GMT-03:00'' AS DeliveryDateRevisadaPrevisto, ' +
            ' CONVERT(VARCHAR, EV551.DT_REALIZACAO, 107) + '' '' + CONVERT(VARCHAR, EV551.DT_REALIZACAO, 8) + '' GMT-03:00'' AS EmbarqueRealizado, ' +
            ' CONVERT(VARCHAR, EV551.DT_PREVISTA, 107) + '' '' + CONVERT(VARCHAR, EV551.DT_PREVISTA, 8) + '' GMT-03:00'' AS EmbarquePrevisto, ' +
            ' CONVERT(VARCHAR, EV162.DT_REALIZACAO, 107) + '' '' + CONVERT(VARCHAR, EV162.DT_REALIZACAO, 8) + '' GMT-03:00'' AS ChegadaRealizado, ' +
            ' CONVERT(VARCHAR, EV162.DT_PREVISTA, 107) + '' '' + CONVERT(VARCHAR, EV162.DT_PREVISTA, 8) + '' GMT-03:00'' AS ChegadaPrevisto, ' +
            ' CONVERT(VARCHAR, EV021.DT_REALIZACAO, 107) + '' '' + CONVERT(VARCHAR, EV021.DT_REALIZACAO, 8) + '' GMT-03:00'' AS RegistroDIRealizado, ' +
            ' CONVERT(VARCHAR, EV021.DT_PREVISTA, 107) + '' '' + CONVERT(VARCHAR, EV021.DT_PREVISTA, 8) + '' GMT-03:00'' AS RegistroDIPrevisto, ' +
            ' CONVERT(VARCHAR, EV088.DT_REALIZACAO, 107) + '' '' + CONVERT(VARCHAR, EV088.DT_REALIZACAO, 8) + '' GMT-03:00'' AS DesembaracoRealizado, ' +
            ' CONVERT(VARCHAR, EV088.DT_PREVISTA, 107) + '' '' + CONVERT(VARCHAR, EV088.DT_PREVISTA, 8) + '' GMT-03:00'' AS DesembaracoPrevisto, ' +
            ' CONVERT(VARCHAR, EV838.DT_REALIZACAO, 107) + '' '' + CONVERT(VARCHAR, EV838.DT_REALIZACAO, 8) + '' GMT-03:00'' AS EntregaProgramadaRealizado, ' +
            ' CONVERT(VARCHAR, EV838.DT_PREVISTA, 107) + '' '' + CONVERT(VARCHAR, EV838.DT_PREVISTA, 8) + '' GMT-03:00'' AS EntregaProgramadaPrevisto, ' +
            ' CONVERT(VARCHAR, EV574.DT_REALIZACAO, 107) + '' '' + CONVERT(VARCHAR, EV574.DT_REALIZACAO, 8) + '' GMT-03:00'' AS EntregaFabricaRealizado, ' +
            ' CONVERT(VARCHAR, EV574.DT_PREVISTA, 107) + '' '' + CONVERT(VARCHAR, EV574.DT_PREVISTA, 8) + '' GMT-03:00'' AS EntregaFabricaPrevisto ' +
            ' FROM BROKER.DBO.TPROCESSO TP (NOLOCK) ' +
            ' INNER JOIN BROKER.DBO.TEMPRESA_NAC EN (NOLOCK) ON EN.CD_EMPRESA = TP.CD_CLIENTE ' +
            ' LEFT JOIN BROKER.DBO.TEXPORTADOR_DI EXPO (NOLOCK) ON EXPO.NR_PROCESSO = TP.NR_PROCESSO ' +
            ' LEFT JOIN BROKER.DBO.TEMPRESA_EST EE (NOLOCK) ON EE.CD_EMPRESA = EXPO.CD_EXPORTADOR ' +
            ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV021 (NOLOCK) ON EV021.NR_PROCESSO = TP.NR_PROCESSO AND EV021.CD_EVENTO=''021'' ' +
            ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV088 (NOLOCK) ON EV088.NR_PROCESSO = TP.NR_PROCESSO AND EV088.CD_EVENTO=''088'' ' +
            ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV162 (NOLOCK) ON EV162.NR_PROCESSO = TP.NR_PROCESSO AND EV162.CD_EVENTO=''162'' ' +
            ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV233 (NOLOCK) ON EV233.NR_PROCESSO = TP.NR_PROCESSO AND EV233.CD_EVENTO=''233'' ' +
            ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV551 (NOLOCK) ON EV551.NR_PROCESSO = TP.NR_PROCESSO AND EV551.CD_EVENTO=''551'' ' +
            ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV574 (NOLOCK) ON EV574.NR_PROCESSO = TP.NR_PROCESSO AND EV574.CD_EVENTO=''574'' ' +
            ' LEFT JOIN BROKER.DBO.TFOLLOWUP EV838 (NOLOCK) ON EV838.NR_PROCESSO = TP.NR_PROCESSO AND EV838.CD_EVENTO=''838'' ' +
            ' @JOINUSER@ ' +
            ' WHERE TP.CD_GRUPO = ''155'' ' +
            ' AND EV233.DT_REALIZACAO is not null ' +
            ' AND TP.CD_PRODUTO = ''01'' ' +
            ' AND TP.IN_CANCELADO = ''0'' ' +
            ' AND ' +
            ' (EV574.DT_REALIZACAO IS NULL AND EV574.IN_APLICAVEL=''1'' ' +
            ' OR ' +
            ' (EV574.DT_REALIZACAO >= GETDATE()-2)) ' +
            ' @WHEREUSER@ ' +
            ' ORDER BY EV233.DT_REALIZACAO ';
end;

function TService.ProcessosExpo(const Numero, Pedido, Container, DDeDUe, Mercadoria, Exportador, BL, Cliente, StatusAtual, QtdResultAtual: string): TList<TExpoProcesso>;
var
  stProcessos: IDBStatement;
  rsProcessos: IDBResultSet;
  prProcessos: TObjectList<TDBParam>;
  stProcessosCount: IDBStatement;
  rsProcessosCount: IDBResultSet;
  stEventosFixos: IDBStatement;
  rsEventosFixos: IDBResultSet;
  prEventosFixos: TObjectList<TDBParam>;
  stEventos: IDBStatement;
  rsEventos: IDBResultSet;
  prEventos: TObjectList<TDBParam>;
  stDocumentos: IDBStatement;
  rsDocumentos: IDBResultSet;
  prDocumentos: TObjectList<TDBParam>;
  IndexProcessos: Integer;
  IndexEventos: Integer;
  IndexDocumentos: Integer;
  SQL: string;
  TempValue: Variant;
  NR_Processo: string;
  Where: string;
  Where2: string;
  Join: string;
  Temp: string;
  User: TUser;
  JoinUser: string;
  vCount: Integer;
begin
  User := GetUser;
  vCount := 0;
  Where := '';
  Where2 := '';
  Join := '';
  JoinUser := '	INNER JOIN BROKER.DBO.TUSUARIO U ON U.IN_ATIVO = 1 AND U.AP_USUARIO = :AP_USUARIO '+
	'INNER JOIN BROKER.DBO.TPERMISSAO_GRUPO PG ON PG.CD_USUARIO = U.CD_USUARIO AND PG.CD_GRUPO = G.CD_GRUPO AND PG.IN_ATIVO = 1 '+
 	'LEFT JOIN BROKER.DBO.TPERMISSAO PER ON PER.CD_CLIENTE = EN.CD_EMPRESA AND PER.CD_USUARIO = U.CD_USUARIO AND PER.IN_ATIVO = 1 '+
 	'LEFT JOIN BROKER.DBO.TPERMISSAO_AREA PA ON PA.CD_AREA = TP.CD_AREA AND PA.CD_USUARIO = U.CD_USUARIO AND PA.IN_ATIVO = 1 ';

  prProcessos := TObjectList<TDBParam>.Create;
  try
    SQL := GetSQLExpoProcessos;
    if not User.Internal then
    begin
      if User.ExternoImportador then
      begin
        SQL := StringReplace(SQL, '@JOINUSER@', '', [rfReplaceAll]);
         Join := Join +
        ' INNER JOIN BROKER.DBO.TPERMISSAO_EMPRESA_EST PES ON PES.CD_EMPRESA = TP.CD_IMPORTADOR AND ' +
                                                            ' PES.CD_USUARIO = :CD_USUARIO_PES AND PES.IN_ATIVO = ''1'' ';
        prProcessos.Add(TDBParam.Create('CD_USUARIO_PES', ftString, User.Codigo));
      end
      else
      begin
        SQL := StringReplace(SQL, '@JOINUSER@', JoinUser, [rfReplaceAll]);
        prProcessos.Add(TDBParam.Create('AP_USUARIO', ftString, User.Name));
        Where := Where +
                  ' AND ' +
                  ' ( ((SELECT COUNT(CD_CLIENTE) AS COUNT_PER_EN FROM TPERMISSAO WHERE CD_USUARIO = U.CD_USUARIO) = 0) ' +
                  '    OR PER.CD_USUARIO IS NOT NULL ' +
                  '  ) ' +
                  ' AND ' +
                  ' ( ((SELECT COUNT(CD_AREA) AS COUNT_PER_AREA FROM TPERMISSAO_AREA WHERE CD_USUARIO = U.CD_USUARIO) = 0) ' +
                  '    OR PA.CD_USUARIO IS NOT NULL ' +
                  '  ) ';
      end;
    end
    else
      SQL := StringReplace(SQL, '@JOINUSER@', '', [rfReplaceAll]);


    if not Pedido.IsEmpty  then
    begin
       Join := Join +
        ' CROSS APPLY ' +
        ' (SELECT DISTINCT RC.NR_PROCESSO ' +
        '  FROM TREF_CLIENTE RC ' +
        '  WHERE RC.NR_PROCESSO = TP.NR_PROCESSO AND RC.CD_REFERENCIA = :CD_REFERENCIA ' +
        ' ) REF ';
       prProcessos.Add(TDBParam.Create('CD_REFERENCIA', ftString, Pedido));
    end;
    if not Numero.IsEmpty  then
    begin
      if Numero.StartsWith('0102') or Numero.StartsWith('0202') then
      begin
        Where := Where + ' AND TP.NR_PROCESSO LIKE :NR_PROCESSO ';
        prProcessos.Add(TDBParam.Create('NR_PROCESSO', ftString, Numero.Trim));
      end
      else
      begin
        Where := Where + ' AND TP.NR_PROCESSO IN (:NR_PROCESSO1, :NR_PROCESSO2) ';
        prProcessos.Add(TDBParam.Create('NR_PROCESSO1', ftString, '0102'+Numero.Trim));
        prProcessos.Add(TDBParam.Create('NR_PROCESSO2', ftString, '0202'+Numero.Trim));
      end;
    end;
    if not Container.IsEmpty  then
    begin
      Join := Join + ' INNER JOIN TPROCESSO_CNTR CNT on CNT.NR_PROCESSO = TP.NR_PROCESSO and ' +
                                                      ' CNT.NR_CNTR IN (:NR_CNTR, :NR_CNTR2)';
      prProcessos.Add(TDBParam.Create('NR_CNTR', ftString, Container));
      prProcessos.Add(TDBParam.Create('NR_CNTR2', ftString, StringReplace(Container, '-', '', [rfReplaceAll])));
    end;
    if not DDeDUe.IsEmpty  then
    begin
        Where := Where + ' AND (TP.NR_DDE = :DDEDUE OR  TP.CD_DUE = :DDEDUE ) ';
      prProcessos.Add(TDBParam.Create('DDEDUE', ftString, DDeDUe));
    end;
    if not Mercadoria.IsEmpty  then
    begin
      Where := Where + ' AND TP.TX_MERCADORIA LIKE :TX_MERCADORIA ';
      prProcessos.Add(TDBParam.Create('TX_MERCADORIA', ftString, '%'+Mercadoria+'%'));
    end;
    if not Exportador.IsEmpty  then
    begin
      Where := ' AND EN.NM_EMPRESA LIKE :NM_EMPRESA ';
      prProcessos.Add(TDBParam.Create('NM_EMPRESA', ftString, '%'+Exportador+'%'));
    end;
    if not BL.IsEmpty  then
    begin
      Where := Where + ' AND TP.NR_CONHECIMENTO = :NR_CONHECIMENTO ';
      prProcessos.Add(TDBParam.Create('NR_CONHECIMENTO', ftString, BL));
    end;
    if not Cliente.IsEmpty  then
    begin
      Join := Join +' INNER JOIN BROKER.DBO.TEMPRESA_EST EE ON EE.CD_EMPRESA=TP.CD_IMPORTADOR ';
      if Where2.IsEmpty then
        Where := ' WHERE EE.NM_EMPRESA LIKE :NM_EMPRESA_EST '
      else
        Where := ' AND EE.NM_EMPRESA LIKE :NM_EMPRESA_EST ';
      prProcessos.Add(TDBParam.Create('NM_EMPRESA_EST', ftString, '%'+Cliente+'%'));
    end;
    if not StatusAtual.IsEmpty  then
    begin
      {Status Aguardando carregamento}
      if StatusAtual = 'SAC' then
        Join := Join + ' INNER JOIN BROKER.DBO.TFOLLOWUP EV_489 ON EV_489.NR_PROCESSO  = TP.NR_PROCESSO AND EV_489.CD_EVENTO = ''489'' AND ' +
                                                                ' EV_489.IN_APLICAVEL = ''1'' AND EV_489.DT_REALIZACAO IS NOT NULL ' +
                       ' INNER JOIN BROKER.DBO.TFOLLOWUP EV_314 ON EV_314.NR_PROCESSO  = TP.NR_PROCESSO AND EV_314.CD_EVENTO = ''314'' AND ' +
                                                                ' EV_314.IN_APLICAVEL = ''1'' AND ISNULL(EV_314.DT_REALIZACAO, '''') = '''' '
      {Status Aguardando envio Invoice}
      else if StatusAtual = 'SAEI' then
        Join := Join + ' INNER JOIN BROKER.DBO.TFOLLOWUP EV_314 ON EV_314.NR_PROCESSO  = TP.NR_PROCESSO AND EV_314.CD_EVENTO = ''314'' AND ' +
                                                                ' EV_314.IN_APLICAVEL = ''1'' AND EV_314.DT_REALIZACAO IS NOT NULL ' +
                       ' INNER JOIN BROKER.DBO.TFOLLOWUP EV_194 ON EV_194.NR_PROCESSO  = TP.NR_PROCESSO AND EV_194.CD_EVENTO = ''194'' AND ' +
                                                                ' EV_194.IN_APLICAVEL = ''1'' AND ISNULL(EV_194.DT_REALIZACAO, '''') = '''' '
      {Status Aguardando embarque}
      else if StatusAtual = 'SAE' then
        Join := Join + ' INNER JOIN BROKER.DBO.TFOLLOWUP EV_314 ON EV_314.NR_PROCESSO  = TP.NR_PROCESSO AND EV_314.CD_EVENTO = ''314'' AND ' +
                                                                ' EV_314.IN_APLICAVEL = ''1'' AND EV_314.DT_REALIZACAO IS NOT NULL ' +
                       ' INNER JOIN BROKER.DBO.TFOLLOWUP EV_132 ON EV_132.NR_PROCESSO  = TP.NR_PROCESSO AND EV_132.CD_EVENTO = ''132'' AND ' +
                                                                ' EV_132.IN_APLICAVEL = ''1'' AND ISNULL(EV_132.DT_REALIZACAO, '''') = '''' '
      {Status Aguardando Envio de docs originais}
      else if StatusAtual = 'SAEDO' then
        Join := Join + ' INNER JOIN BROKER.DBO.TFOLLOWUP EV_132 ON EV_132.NR_PROCESSO  = TP.NR_PROCESSO AND EV_132.CD_EVENTO = ''132'' AND ' +
                                                                ' EV_132.IN_APLICAVEL = ''1'' AND EV_132.DT_REALIZACAO IS NOT NULL ' +
                       ' INNER JOIN BROKER.DBO.TFOLLOWUP EV_139 ON EV_139.NR_PROCESSO  = TP.NR_PROCESSO AND EV_139.CD_EVENTO = ''139'' AND ' +
                                                                ' EV_139.IN_APLICAVEL = ''1'' AND ISNULL(EV_139.DT_REALIZACAO, '''') = '''' '
      {Status Aguardando chegada no destino}
      else if StatusAtual = 'SACD' then
        Join := Join + ' INNER JOIN BROKER.DBO.TFOLLOWUP EV_132 ON EV_132.NR_PROCESSO  = TP.NR_PROCESSO AND EV_132.CD_EVENTO = ''132'' AND ' +
                                                                ' EV_132.IN_APLICAVEL = ''1'' AND EV_132.DT_REALIZACAO IS NOT NULL ' +
                       ' INNER JOIN BROKER.DBO.TFOLLOWUP EV_261 ON EV_261.NR_PROCESSO  = TP.NR_PROCESSO AND EV_261.CD_EVENTO = ''261'' AND ' +
                                                                ' EV_261.IN_APLICAVEL = ''1'' AND ISNULL(EV_261.DT_REALIZACAO, '''') = '''' '
      {Status Chegada no destino}
      else if StatusAtual = 'SCD' then
        Join := Join + ' INNER JOIN BROKER.DBO.TFOLLOWUP EV_261 ON EV_261.NR_PROCESSO  = TP.NR_PROCESSO AND EV_261.CD_EVENTO = ''261'' AND ' +
                                                                ' EV_261.IN_APLICAVEL = ''1'' AND EV_261.DT_REALIZACAO IS NOT NULL ';
    end;
    if not QtdResultAtual.IsEmpty  then
    begin
      Where2 := 'Where NR_LINHA > ' + QtdResultAtual;
    end;

    //
    if (DebugHook<>0) and Where.IsEmpty and Where2.IsEmpty and Join.IsEmpty then
      Where := ' WHERE TP.NR_PROCESSO IN (''0102EA-000001-18'',''0102EA-000002-18'',''0102EA-000003-18'',''0102EA-000004-18'') ';

    if Where.IsEmpty and Where2.IsEmpty  and Join.IsEmpty then
      Exit;

    SQL := StringReplace(SQL, '@COUNT_TOP@', 'COUNT(*) AS COUNT', [rfReplaceAll]);
    SQL := StringReplace(SQL, '@WHERE@', Where, [rfReplaceAll]);
    SQL := StringReplace(SQL, '@WHERE2@', Where2, [rfReplaceAll]);
    SQL := StringReplace(SQL, '@JOIN@', Join, [rfReplaceAll]);

    if StrToIntDef(QtdResultAtual, 0) = 0 then
    begin
      stProcessosCount := FireDacMSSQL.CreateConnection.CreateStatement;
      stProcessosCount.SetSQLCommand(SQL);
      stProcessosCount.SetParams(prProcessos);
      rsProcessosCount := stProcessosCount.ExecuteQuery;
    end;

    SQL := StringReplace(SQL, 'COUNT(*) AS COUNT', 'TOP 30 *', [rfReplaceAll]);

    stProcessos := FireDacMSSQL.CreateConnection.CreateStatement;
    stProcessos.SetSQLCommand(SQL);
    stProcessos.SetParams(prProcessos);
    rsProcessos := stProcessos.ExecuteQuery;
  finally
    prProcessos.Free;
  end;
  Result := TList<TExpoProcesso>.Create;
  while rsProcessos.Next do
  begin
    IndexProcessos := Result.Add(TExpoProcesso.Create);

    if (StrToIntDef(QtdResultAtual, 0) = 0) and (vCount = 0) then
    begin
      vCount := rsProcessosCount.GetFieldValue('COUNT');
      TempValue := vCount;
      Result[IndexProcessos].QtdProcessos := TempValue;
    end;

    TempValue := rsProcessos.GetFieldValue('NR_PROCESSO');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].Numero := TempValue;
    NR_Processo := Trim(Result[IndexProcessos].Numero);
    TempValue := rsProcessos.GetFieldValue('NM_EMPRESA');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].NomeCliente := TempValue;
    TempValue := rsProcessos.GetFieldValue('RefCliente');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].RefCliente := TempValue;
    TempValue := rsProcessos.GetFieldValue('RefPadraoCliente');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].RefPadraoCliente := TempValue;
    TempValue := rsProcessos.GetFieldValue('PaisDestino');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].PaisDestino := TempValue;
    TempValue := rsProcessos.GetFieldValue('Canal');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].Canal := TempValue;
    TempValue := rsProcessos.GetFieldValue('Mercadoria');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].Mercadoria := TempValue;
    TempValue := rsProcessos.GetFieldValue('PesoBruto');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].PesoBruto := TempValue;
    TempValue := rsProcessos.GetFieldValue('PesoLiquido');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].PesoLiquido := TempValue;
    TempValue := rsProcessos.GetFieldValue('QtdConteiners');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].QtdConteiners := TempValue;
    TempValue := rsProcessos.GetFieldValue('LiberacaoProcesso');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].LiberacaoProcesso := TempValue;
    TempValue := rsProcessos.GetFieldValue('CarregamentoFabrica');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].CarregamentoFabrica := TempValue;
    TempValue := rsProcessos.GetFieldValue('Desembaraco');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].Desembaraco := TempValue;
    TempValue := rsProcessos.GetFieldValue('SaidaVeiculo');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].SaidaVeiculo := TempValue;
    TempValue := rsProcessos.GetFieldValue('CdViaTransporte');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].cdViaTransporte := TempValue;

  //Eventos Fixos
    prEventosFixos := TObjectList<TDBParam>.Create;
    try
      prEventosFixos.Add(TDBParam.Create('NR_PROCESSO', ftString, NR_Processo));
      stEventosFixos := FireDacMSSQL.CreateConnection.CreateStatement;
      stEventosFixos.SetSQLCommand(GetSQLExpoEventosFixos);
      stEventosFixos.SetParams(prEventosFixos);
      rsEventosFixos := stEventosFixos.ExecuteQuery;
    finally
      prEventosFixos.Free;
    end;
    while rsEventosFixos.Next do
    begin
      TempValue := rsEventosFixos.GetFieldValue('Liberacao');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.Liberacao := TempValue;
      TempValue := rsEventosFixos.GetFieldValue('LiberacaoPrevisto');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.LiberacaoPrevisto := TempValue;
      TempValue := rsEventosFixos.GetFieldValue('Carregamento');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.Carregamento := TempValue;
      TempValue := rsEventosFixos.GetFieldValue('CarregamentoPrevisto');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.CarregamentoPrevisto := TempValue;
      TempValue := rsEventosFixos.GetFieldValue('ChegadaFronteira');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.ChegadaFronteira := TempValue;
      TempValue := rsEventosFixos.GetFieldValue('ChegadaFronteiraPrevisto');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.ChegadaFronteiraPrevisto := TempValue;
      TempValue := rsEventosFixos.GetFieldValue('Desembaraco');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.Desembaraco := TempValue;
      TempValue := rsEventosFixos.GetFieldValue('DesembaracoPrevisto');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.DesembaracoPrevisto := TempValue;
      TempValue := rsEventosFixos.GetFieldValue('Saida');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.Saida := TempValue;
      TempValue := rsEventosFixos.GetFieldValue('SaidaPrevisto');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.SaidaPrevisto := TempValue;
      TempValue := rsEventosFixos.GetFieldValue('Cruze');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.Cruze := TempValue;
      TempValue := rsEventosFixos.GetFieldValue('CruzePrevisto');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.CruzePrevisto := TempValue;
    end;
  //Todos os eventos
    prEventos := TObjectList<TDBParam>.Create;
    try
      prEventos.Add(TDBParam.Create('NR_PROCESSO', ftString, NR_Processo));
      prEventos.Add(TDBParam.Create('CD_USUARIO', ftString, User.Codigo));
      stEventos := FireDacMSSQL.CreateConnection.CreateStatement;
      stEventos.SetSQLCommand(GetSQLEventos);
      stEventos.SetParams(prEventos);
      rsEventos := stEventos.ExecuteQuery;
    finally
      prEventos.Free;
    end;
    while rsEventos.Next do
    begin
      IndexEventos := Result[IndexProcessos].Eventos.Add(TEventos.Create);
      TempValue := rsEventos.GetFieldValue('CD_EVENTO');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].Eventos[IndexEventos].Codigo := TempValue;
      case User.Idioma of
        0: TempValue := rsEventos.GetFieldValue('NM_EVENTO');
        1: TempValue := rsEventos.GetFieldValue('NM_INGLES');
        2: TempValue := rsEventos.GetFieldValue('NM_ESPANHOL');
      else
        TempValue := rsEventos.GetFieldValue('NM_EVENTO');
      end;
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].Eventos[IndexEventos].Nome := TempValue;
      TempValue := rsEventos.GetFieldValue('DT_PREVISTA');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].Eventos[IndexEventos].Previsto := TempValue;
      TempValue := rsEventos.GetFieldValue('DT_REALIZACAO');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].Eventos[IndexEventos].Realizado := TempValue;
      Result[IndexProcessos].Eventos[IndexEventos].Notifica := rsEventos.GetFieldValue('NOTIFY') = 1;
    end;

    prDocumentos := TObjectList<TDBParam>.Create;
    try
      prDocumentos.Add(TDBParam.Create('NR_PROCESSO', ftString, NR_Processo));
      stDocumentos := FireDacMSSQL.CreateConnection.CreateStatement;
      stDocumentos.SetSQLCommand(GetSQLDocumentos);
      stDocumentos.SetParams(prDocumentos);
      rsDocumentos := stDocumentos.ExecuteQuery;
    finally
      prDocumentos.Free;
    end;
    while rsDocumentos.Next do
    begin
      IndexDocumentos := Result[IndexProcessos].Documentos.Add(TDocumentos.Create);
      TempValue := rsDocumentos.GetFieldValue('TipoDocumento');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].Documentos[IndexDocumentos].Tipodocumento := TempValue;
      TempValue := rsDocumentos.GetFieldValue('Descricao');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].Documentos[IndexDocumentos].Descricao := TempValue;
      TempValue := rsDocumentos.GetFieldValue('DataCriacao');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].Documentos[IndexDocumentos].DataCriacao := TempValue;
      TempValue := rsDocumentos.GetFieldValue('NomeArquivo');
      if not VarIsNull(TempValue) then
      begin
        Result[IndexProcessos].Documentos[IndexDocumentos].NomeArquivo := TempValue;
        Result[IndexProcessos].Documentos[IndexDocumentos].Path := Crypt(caCrypt,NR_Processo)+'/'+TempValue;//Crypt(caCrypt,TempValue);
      end;
    end;
  end;
end;

function TService.ProcessosImpo(const Numero, Pedido, Container, DiDUImp, Mercadoria, Exportador, BL, Cliente, StatusAtual, QtdResultAtual: string): TList<TImpoProcesso>;
var
  stProcessos: IDBStatement;
  rsProcessos: IDBResultSet;
  prProcessos: TObjectList<TDBParam>;
  stProcessosCount: IDBStatement;
  rsProcessosCount: IDBResultSet;
  stEventosFixos: IDBStatement;
  rsEventosFixos: IDBResultSet;
  prEventosFixos: TObjectList<TDBParam>;
  stEventos: IDBStatement;
  rsEventos: IDBResultSet;
  prEventos: TObjectList<TDBParam>;
  stDocumentos: IDBStatement;
  rsDocumentos: IDBResultSet;
  prDocumentos: TObjectList<TDBParam>;
  IndexProcessos: Integer;
  IndexEventos: Integer;
  IndexDocumentos: Integer;
  SQL: string;
  TempValue: Variant;
  NR_Processo: string;
  Where, Where2: string;
  Join: string;
  Temp: string;
  Idioma: integer;
  User: TUser;
  JoinUser: string;
  vCount: Integer;
begin
  {Body da requisição webservice}
  {"Numero":"","Pedido":"","DiDUImp":"","Mercadoiria":"","Exportador":"","BL":"","Cliente":""}
  User := GetUser;
  vCount := 0;
  Where := '';
  Where2 := '';
  Join := '';
  JoinUser := '	INNER JOIN BROKER.DBO.TUSUARIO U ON U.IN_ATIVO = 1 AND U.AP_USUARIO = :AP_USUARIO '+
	'INNER JOIN BROKER.DBO.TPERMISSAO_GRUPO PG ON PG.CD_USUARIO = U.CD_USUARIO AND PG.CD_GRUPO = G.CD_GRUPO AND PG.IN_ATIVO = 1 '+
 	'LEFT JOIN BROKER.DBO.TPERMISSAO PER ON PER.CD_CLIENTE = EN.CD_EMPRESA AND PER.CD_USUARIO = U.CD_USUARIO AND PER.IN_ATIVO = 1 '+
 	'LEFT JOIN BROKER.DBO.TPERMISSAO_AREA PA ON PA.CD_AREA = TP.CD_AREA AND PA.CD_USUARIO = U.CD_USUARIO AND PA.IN_ATIVO = 1 ';

  prProcessos := TObjectList<TDBParam>.Create;
  try
    SQL := GetSQLImpoProcessos;
    if not User.Internal then
    begin
      SQL := StringReplace(SQL, '@JOINUSER@', JoinUser, [rfReplaceAll]);
      prProcessos.Add(TDBParam.Create('AP_USUARIO', ftString, User.Name));
      Where := Where +
                  ' AND ' +
                  ' ( ((SELECT COUNT(CD_CLIENTE) AS COUNT_PER_EN FROM TPERMISSAO WHERE CD_USUARIO = U.CD_USUARIO) = 0) ' +
                  '    OR PER.CD_USUARIO IS NOT NULL ' +
                  '  ) ' +
                  ' AND ' +
                  ' ( ((SELECT COUNT(CD_AREA) AS COUNT_PER_AREA FROM TPERMISSAO_AREA WHERE CD_USUARIO = U.CD_USUARIO) = 0) ' +
                  '    OR PA.CD_USUARIO IS NOT NULL ' +
                  '  ) ';
    end
    else
      SQL := StringReplace(SQL, '@JOINUSER@', '', [rfReplaceAll]);
    if not Pedido.IsEmpty  then
    begin
       Join := Join +
        ' CROSS APPLY ' +
        ' (SELECT DISTINCT RC.NR_PROCESSO ' +
        '  FROM TREF_CLIENTE RC ' +
        '  WHERE RC.NR_PROCESSO = TP.NR_PROCESSO AND RC.CD_REFERENCIA = :CD_REFERENCIA ' +
        ' ) REF ';
       prProcessos.Add(TDBParam.Create('CD_REFERENCIA', ftString, Pedido));
    end;
    if not Numero.IsEmpty  then
    begin
      if Numero.StartsWith('0101') or Numero.StartsWith('0201') then
      begin
        Where := Where + ' AND TP.NR_PROCESSO LIKE :NR_PROCESSO ';
        prProcessos.Add(TDBParam.Create('NR_PROCESSO', ftString, Numero.Trim));
      end
      else
      begin
        Where := Where + ' AND TP.NR_PROCESSO IN (:NR_PROCESSO1, :NR_PROCESSO2) ';
        prProcessos.Add(TDBParam.Create('NR_PROCESSO1', ftString, '0101'+Numero.Trim));
        prProcessos.Add(TDBParam.Create('NR_PROCESSO2', ftString, '0201'+Numero.Trim));
      end;
    end;
    if not Container.IsEmpty  then
    begin
      Join := Join + ' INNER JOIN TPROCESSO_CNTR CNT on CNT.NR_PROCESSO = TP.NR_PROCESSO and ' +
                                                      ' CNT.NR_CNTR IN (:NR_CNTR, :NR_CNTR2)';
      prProcessos.Add(TDBParam.Create('NR_CNTR', ftString, Container));
      prProcessos.Add(TDBParam.Create('NR_CNTR2', ftString, StringReplace(Container, '-', '', [rfReplaceAll])));
    end;
    if not DiDUImp.IsEmpty  then
    begin
      Where := Where + ' AND (TP.NR_DI = :DIDUIMP OR  TP.CD_DUIMP = :DIDUIMP ) ';
      prProcessos.Add(TDBParam.Create('DIDUIMP', ftString, DiDUImp));
    end;
    if not Mercadoria.IsEmpty  then
    begin
      Where := Where + ' AND TP.TX_MERCADORIA LIKE :TX_MERCADORIA ';
      prProcessos.Add(TDBParam.Create('TX_MERCADORIA', ftString, '%'+Mercadoria+'%'));
    end;
    if not Cliente.IsEmpty  then
    begin
      Where := ' AND EN.NM_EMPRESA LIKE :NM_EMPRESA ';
      prProcessos.Add(TDBParam.Create('NM_EMPRESA', ftString, '%'+Cliente+'%'));
    end;
    if not BL.IsEmpty  then
    begin
      Where := Where + ' AND TP.NR_CONHECIMENTO = :NR_CONHECIMENTO ';
      prProcessos.Add(TDBParam.Create('NR_CONHECIMENTO', ftString, BL));
    end;
    if not Exportador.IsEmpty  then
    begin
      Join := Join + ' INNER JOIN BROKER.DBO.TEXPORTADOR_DI EDI ON EDI.NR_PROCESSO = TP.NR_PROCESSO ' +
                     ' INNER JOIN BROKER.DBO.TEMPRESA_EST EE ON EE.CD_EMPRESA = EDI.CD_EXPORTADOR ';
      Where:= ' AND EE.NM_EMPRESA LIKE :NM_EMPRESA_EST ';
      prProcessos.Add(TDBParam.Create('NM_EMPRESA_EST', ftString, '%'+Exportador+'%'));
    end;
    if not StatusAtual.IsEmpty  then
    begin
      {Status Aguardando embarque}
      if StatusAtual = 'SAE' then
        Join := Join + ' INNER JOIN BROKER.DBO.TFOLLOWUP EV551 ON EV551.NR_PROCESSO  = TP.NR_PROCESSO AND EV551.CD_EVENTO = ''551'' AND ' +
                                                               ' EV551.IN_APLICAVEL = ''1'' AND ISNULL(EV551.DT_REALIZACAO, '''') = '''' '
      {Status Embarcado, Aguardando chegada}
      else if StatusAtual = 'SEAC' then
        Join := Join + ' INNER JOIN BROKER.DBO.TFOLLOWUP EV551 ON EV551.NR_PROCESSO  = TP.NR_PROCESSO AND EV551.CD_EVENTO = ''551'' AND ' +
                                                               ' EV551.IN_APLICAVEL = ''1'' AND EV551.DT_REALIZACAO IS NOT NULL ' +
                       ' INNER JOIN BROKER.DBO.TFOLLOWUP EV162 ON EV162.NR_PROCESSO  = TP.NR_PROCESSO AND EV162.CD_EVENTO = ''162'' AND ' +
                                                               ' EV162.IN_APLICAVEL = ''1'' AND ISNULL(EV162.DT_REALIZACAO, '''') = '''' '


      {Status Em desembaraço}
      else if StatusAtual = 'SED' then
        Join := Join + ' INNER JOIN BROKER.DBO.TFOLLOWUP EV162 ON EV162.NR_PROCESSO  = TP.NR_PROCESSO AND EV162.CD_EVENTO = ''162'' AND ' +
                                                               ' EV162.IN_APLICAVEL = ''1'' AND EV162.DT_REALIZACAO IS NOT NULL ' +
                       ' INNER JOIN BROKER.DBO.TFOLLOWUP EV088 ON EV088.NR_PROCESSO  = TP.NR_PROCESSO AND EV088.CD_EVENTO = ''088'' AND ' +
                                                               ' EV088.IN_APLICAVEL = ''1'' AND ISNULL(EV088.DT_REALIZACAO, '''') = '''' '


      {Status Desembaraçado, aguardando programação de entrega}
      else if StatusAtual = 'SDAPE' then
        Join := Join + ' INNER JOIN BROKER.DBO.TFOLLOWUP EV088 ON EV088.NR_PROCESSO  = TP.NR_PROCESSO AND EV088.CD_EVENTO = ''088'' AND ' +
                                                               ' EV088.IN_APLICAVEL = ''1'' AND EV088.DT_REALIZACAO IS NOT NULL ' +
                       ' INNER JOIN BROKER.DBO.TFOLLOWUP EV838 ON EV838.NR_PROCESSO  = TP.NR_PROCESSO AND EV838.CD_EVENTO = ''838'' AND ' +
                                                               ' EV838.IN_APLICAVEL = ''1'' AND ISNULL(EV838.DT_REALIZACAO, '''') = '''' '


      {Status Programado, aguardando entrega na fabrica}
      else if StatusAtual = 'SPAEF' then
        Join := Join + ' INNER JOIN BROKER.DBO.TFOLLOWUP EV838 ON EV838.NR_PROCESSO  = TP.NR_PROCESSO AND EV838.CD_EVENTO = ''838'' AND ' +
                                                               ' EV838.IN_APLICAVEL = ''1'' AND EV838.DT_REALIZACAO IS NOT NULL ' +
                       ' INNER JOIN BROKER.DBO.TFOLLOWUP EV164 ON EV164.NR_PROCESSO  = TP.NR_PROCESSO AND EV164.CD_EVENTO = ''164'' AND ' +
                                                               ' EV164.IN_APLICAVEL = ''1'' AND ISNULL(EV164.DT_REALIZACAO, '''') = '''' '


      {Status Carga entregue}
      else if StatusAtual = 'SCE' then
        Join := Join + ' INNER JOIN BROKER.DBO.TFOLLOWUP EV164 ON EV164.NR_PROCESSO  = TP.NR_PROCESSO AND EV164.CD_EVENTO = ''164'' AND ' +
                                                               ' EV164.IN_APLICAVEL = ''1'' AND EV164.DT_REALIZACAO IS NOT NULL ';
    end;
    if not QtdResultAtual.IsEmpty  then
    begin
      Where2 := 'Where NR_LINHA > ' + QtdResultAtual;
    end;


    //
    if (DebugHook<>0) and Where.IsEmpty and Join.IsEmpty then
      Where := ' WHERE TP.NR_PROCESSO IN (''0101IM-000001-18'',''0101IM-000002-18'') ';

    if Where.IsEmpty and Join.IsEmpty then
      Exit;


    SQL := StringReplace(SQL, '@COUNT_TOP@', 'COUNT(*) AS COUNT', [rfReplaceAll]);
    SQL := StringReplace(SQL, '@WHERE@', Where, [rfReplaceAll]);
    SQL := StringReplace(SQL, '@WHERE2@', Where2, [rfReplaceAll]);
    SQL := StringReplace(SQL, '@JOIN@', Join, [rfReplaceAll]);

    if StrToIntDef(QtdResultAtual, 0) = 0 then
    begin
      stProcessosCount := FireDacMSSQL.CreateConnection.CreateStatement;
      stProcessosCount.SetSQLCommand(SQL);
      stProcessosCount.SetParams(prProcessos);
      rsProcessosCount := stProcessosCount.ExecuteQuery;
    end;

    SQL := StringReplace(SQL, 'COUNT(*) AS COUNT', 'TOP 30 *', [rfReplaceAll]);

    stProcessos := FireDacMSSQL.CreateConnection.CreateStatement;
    stProcessos.SetSQLCommand(SQL);
    stProcessos.SetParams(prProcessos);
    rsProcessos := stProcessos.ExecuteQuery;
  finally
    prProcessos.Free;
  end;
  Result := TList<TImpoProcesso>.Create;
  while rsProcessos.Next do
  begin
    IndexProcessos := Result.Add(TImpoProcesso.Create);

    if (StrToIntDef(QtdResultAtual, 0) = 0) and (vCount = 0) then
    begin
      vCount := rsProcessosCount.GetFieldValue('COUNT');
      TempValue := vCount;
      Result[IndexProcessos].QtdProcessos := TempValue;
    end;

    TempValue := rsProcessos.GetFieldValue('NR_PROCESSO');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].Numero := TempValue;
    NR_Processo := Trim(Result[IndexProcessos].Numero);
    TempValue := rsProcessos.GetFieldValue('NM_EMPRESA');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].NomeCliente := TempValue;
    TempValue := rsProcessos.GetFieldValue('RefCliente');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].RefCliente := TempValue;
    TempValue := rsProcessos.GetFieldValue('RefPadraoCliente');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].RefPadraoCliente := TempValue;
    TempValue := rsProcessos.GetFieldValue('Anuencias');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].Anuencias := TempValue;
    TempValue := rsProcessos.GetFieldValue('Canal');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].Canal := TempValue;
    TempValue := rsProcessos.GetFieldValue('Mercadoria');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].Mercadoria := TempValue;
    TempValue := rsProcessos.GetFieldValue('Quantidade');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].Quantidade := TempValue;
    TempValue := rsProcessos.GetFieldValue('PesoLiquido');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].PesoLiquido := TempValue;
    TempValue := rsProcessos.GetFieldValue('DeliveryDateRevisada');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].DeliveryDateRevisada := TempValue;
    case Idioma of
      0: TempValue := rsProcessos.GetFieldValue('StatusAtual_br');
      1: TempValue := rsProcessos.GetFieldValue('StatusAtual_en');
      2: TempValue := rsProcessos.GetFieldValue('StatusAtual_es');
    else
      TempValue := rsProcessos.GetFieldValue('StatusAtual_br');
    end;
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].StatusAtual := TempValue;
    TempValue := rsProcessos.GetFieldValue('Exportador');
    if not VarIsNull(TempValue) then
      Result[IndexProcessos].Exportador := TempValue;

  //Eventos Fixos
    prEventosFixos := TObjectList<TDBParam>.Create;
    try
      prEventosFixos.Add(TDBParam.Create('NR_PROCESSO', ftString, NR_Processo));
      stEventosFixos := FireDacMSSQL.CreateConnection.CreateStatement;
      stEventosFixos.SetSQLCommand(GetSQLImpoEventosFixos);
      stEventosFixos.SetParams(prEventosFixos);
      rsEventosFixos := stEventosFixos.ExecuteQuery;
    finally
      prEventosFixos.Free;
    end;
    while rsEventosFixos.Next do
    begin

      TempValue := rsEventosFixos.GetFieldValue('ETD');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.ETD := TempValue;
      TempValue := rsEventosFixos.GetFieldValue('ETDPrevisto');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.ETDPrevisto := TempValue;

      TempValue := rsEventosFixos.GetFieldValue('Embarque');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.Embarque := TempValue;
      TempValue := rsEventosFixos.GetFieldValue('EmbarquePrevisto');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.EmbarquePrevisto := TempValue;

      TempValue := rsEventosFixos.GetFieldValue('Chegada');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.Chegada := TempValue;
      TempValue := rsEventosFixos.GetFieldValue('ChegadaPrevisto');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.ChegadaPrevisto := TempValue;

      TempValue := rsEventosFixos.GetFieldValue('Presenca');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.Presenca := TempValue;
      TempValue := rsEventosFixos.GetFieldValue('PresencaPrevisto');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.PresencaPrevisto := TempValue;

      TempValue := rsEventosFixos.GetFieldValue('Registro');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.Registro := TempValue;
      TempValue := rsEventosFixos.GetFieldValue('RegistroPrevisto');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.RegistroPrevisto := TempValue;

      TempValue := rsEventosFixos.GetFieldValue('Desembaraco');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.Desembaraco := TempValue;
      TempValue := rsEventosFixos.GetFieldValue('DesembaracoPrevisto');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.DesembaracoPrevisto := TempValue;

      TempValue := rsEventosFixos.GetFieldValue('Liberacao');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.Liberacao := TempValue;
      TempValue := rsEventosFixos.GetFieldValue('LiberacaoPrevisto');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.LiberacaoPrevisto := TempValue;

      TempValue := rsEventosFixos.GetFieldValue('MercadoriaFabrica');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.MercadoriaFabrica := TempValue;
      TempValue := rsEventosFixos.GetFieldValue('MercadoriaFabricaPrevisto');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].EventosFixos.MercadoriaFabricaPrevisto := TempValue;
    end;

    //Todos os eventos
    prEventos := TObjectList<TDBParam>.Create;
    try
      prEventos.Add(TDBParam.Create('NR_PROCESSO', ftString, NR_Processo));
      prEventos.Add(TDBParam.Create('CD_USUARIO', ftString, User.Codigo));
      stEventos := FireDacMSSQL.CreateConnection.CreateStatement;
      stEventos.SetSQLCommand(GetSQLEventos);
      stEventos.SetParams(prEventos);
      rsEventos := stEventos.ExecuteQuery;
    finally
      prEventos.Free;
    end;
    while rsEventos.Next do
    begin
      IndexEventos := Result[IndexProcessos].Eventos.Add(TEventos.Create);
      TempValue := rsEventos.GetFieldValue('CD_EVENTO');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].Eventos[IndexEventos].Codigo := TempValue;
      case Idioma of
        0: TempValue := rsEventos.GetFieldValue('NM_EVENTO');
        1: TempValue := rsEventos.GetFieldValue('NM_INGLES');
        2: TempValue := rsEventos.GetFieldValue('NM_ESPANHOL');
      else
        TempValue := rsEventos.GetFieldValue('NM_EVENTO');
      end;
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].Eventos[IndexEventos].Nome := TempValue;
      TempValue := rsEventos.GetFieldValue('DT_PREVISTA');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].Eventos[IndexEventos].Previsto := TempValue;
      TempValue := rsEventos.GetFieldValue('DT_REALIZACAO');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].Eventos[IndexEventos].Realizado := TempValue;
      Result[IndexProcessos].Eventos[IndexEventos].Notifica := rsEventos.GetFieldValue('NOTIFY') = 1;
    end;

    prDocumentos := TObjectList<TDBParam>.Create;
    try
      prDocumentos.Add(TDBParam.Create('NR_PROCESSO', ftString, NR_Processo));
      stDocumentos := FireDacMSSQL.CreateConnection.CreateStatement;
      stDocumentos.SetSQLCommand(GetSQLDocumentos);
      stDocumentos.SetParams(prDocumentos);
      rsDocumentos := stDocumentos.ExecuteQuery;
    finally
      prDocumentos.Free;
    end;
    while rsDocumentos.Next do
    begin
      IndexDocumentos := Result[IndexProcessos].Documentos.Add(TDocumentos.Create);
      TempValue := rsDocumentos.GetFieldValue('TipoDocumento');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].Documentos[IndexDocumentos].Tipodocumento := TempValue;
      TempValue := rsDocumentos.GetFieldValue('Descricao');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].Documentos[IndexDocumentos].Descricao := TempValue;
      TempValue := rsDocumentos.GetFieldValue('DataCriacao');
      if not VarIsNull(TempValue) then
        Result[IndexProcessos].Documentos[IndexDocumentos].DataCriacao := TempValue;
      TempValue := rsDocumentos.GetFieldValue('NomeArquivo');
      if not VarIsNull(TempValue) then
      begin
        Result[IndexProcessos].Documentos[IndexDocumentos].NomeArquivo := TempValue;
        Result[IndexProcessos].Documentos[IndexDocumentos].Path := Crypt(caCrypt,NR_Processo)+'/'+TempValue;
      end;
    end;
  end;
end;

procedure TService.SetDevice(const Token, Fingerprint, UserAgent, Browser,
  BrowserVersion, BrowserMajorVersion, Engine, EngineVersion, OS, OSVersion,
  Device, DeviceType, DeviceVendor, CPU, ColorDepth, CurrentResolution,
  AvailableResolution, DeviceXDPI, DeviceYDPI, LocalStorage, SessionStorage,
  Cookie, TimeZone, Language, SystemLanguage: string);
var
  stDevice: IDBStatement;
  rsDevice: IDBResultSet;
  prDevice: TObjectList<TDBParam>;
  SQL: string;
  UserName: string;
  TempValue: Variant;
  Manager: TObjectManager;
  DeviceUser: TDeviceUser;

  procedure SetValues;
  begin
    DeviceUser.Token := Token;
    DeviceUser.Device.Fingerprint := Fingerprint;
    DeviceUser.Device.UserAgent := UserAgent;
    DeviceUser.Device.Browser := Browser;
    DeviceUser.Device.BrowserVersion := BrowserVersion;
    DeviceUser.Device.Engine := Engine;
    DeviceUser.Device.EngineVersion := EngineVersion;
    DeviceUser.Device.OS := OS;
    DeviceUser.Device.OSVersion := OSVersion;
    DeviceUser.Device.Device := Device;
    DeviceUser.Device.DeviceType := DeviceType;
    DeviceUser.Device.DeviceVendor := DeviceVendor;
    DeviceUser.Device.CPU := CPU;
    DeviceUser.Device.ColorDepth := StrToIntDef(ColorDepth, 0);
    DeviceUser.Device.CurrentResolution := CurrentResolution;
    DeviceUser.Device.AvailableResolution := AvailableResolution;
    DeviceUser.Device.DeviceXDPI := DeviceXDPI;
    DeviceUser.Device.DeviceYDPI := DeviceYDPI;
    DeviceUser.Device.LocalStorage :=  StrToBool(LocalStorage);
    DeviceUser.Device.SessionStorage := StrToBool(SessionStorage);
    DeviceUser.Device.Cookie := StrToBool(Cookie);
    DeviceUser.Device.TimeZone := TimeZone;
    DeviceUser.Device.Language := Language;
    DeviceUser.Device.SystemLanguage := SystemLanguage;
    DeviceUser.Device.Ativo := True;
  end;

  procedure Adicionar;
  begin
    DeviceUser := TDeviceUser.Create;
    DeviceUser.Usuario := Manager.Find<TUsuario>.Where(Linq['Login'] = UserName).UniqueResult;
    DeviceUser.Device := TDevice.Create;
    SetValues;
    Manager.SaveOrUpdate(DeviceUser);
    Manager.Flush;
  end;

  procedure Atualizar;
  begin
    SetValues;
    Manager.SaveOrUpdate(DeviceUser);
    Manager.Flush;
  end;

begin
  Manager := FireDacMSSQL.ObjectManager;
  UserName := GetUser.Name;
  prDevice := TObjectList<TDBParam>.Create;
  try
    SQL := 'SELECT DU.ID AS DEVICE_USER_ID, D.ID AS DEVICE_ID, DU.CD_USUARIO FROM TUSUARIO U '+
      'LEFT JOIN DEVICE_USER DU ON DU.CD_USUARIO = U.CD_USUARIO '+
      'LEFT JOIN DEVICE D ON D.ID = DU.DEVICE_ID '+
      'WHERE U.AP_USUARIO =  :AP_USUARIO ';
    prDevice.Add(TDBParam.Create('AP_USUARIO', ftString, UserName));
    stDevice := FireDacMSSQL.CreateConnection.CreateStatement;
    stDevice.SetSQLCommand(SQL);
    stDevice.SetParams(prDevice);
    rsDevice := stDevice.ExecuteQuery;
    DeviceUser := Manager.Find<TDeviceUser>
      .CreateAlias('Usuario', 'u', TFetchMode.Eager)
        .Where(Linq['u.Login'] = UserName)
      .CreateAlias('Device', 'd', TFetchMode.Eager)
        .Where(Linq['d.Fingerprint'] = Fingerprint)
      .UniqueResult;
    if not Assigned(DeviceUser) then
      Adicionar
    else
      Atualizar;
  finally
    prDevice.Free;
  end;
end;

function TService.ProcessosPorStatus: TList<TProcessosPorStatus>;
var
  stProcessosPorStatus: IDBStatement;
  rsProcessosPorStatus: IDBResultSet;
  prProcessosPorStatus: TObjectList<TDBParam>;
  SQL: string;
  Index: Integer;
  TempValue: Variant;
  UserName: string;
  JoinUser: string;
  InternalUser: Boolean;
  where: string;
begin
  UserName := GetUser.Name;
  InternalUser := GetUser.Internal;
  Where := '';

  JoinUser := ' INNER JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = P.CD_CLIENTE ' +
              ' INNER JOIN BROKER.DBO.TGRUPO G ON G.CD_GRUPO = EN.CD_GRUPO ' +
              '	INNER JOIN BROKER.DBO.TUSUARIO U ON U.IN_ATIVO = 1 AND U.AP_USUARIO = :AP_USUARIO ' +
              ' LEFT JOIN BROKER.DBO.TPERMISSAO_GRUPO PG ON PG.CD_USUARIO = U.CD_USUARIO AND PG.CD_GRUPO = G.CD_GRUPO AND PG.IN_ATIVO = 1 ' +
              ' LEFT JOIN BROKER.DBO.TPERMISSAO PER ON PER.CD_CLIENTE = EN.CD_EMPRESA AND PER.CD_USUARIO = U.CD_USUARIO AND PER.IN_ATIVO = 1 ';

  prProcessosPorStatus := TObjectList<TDBParam>.Create;
  try
    SQL := GetSQLProcessosPorStatus;
    if not InternalUser then
    begin
      SQL := StringReplace(SQL, '@JOINUSER@', JoinUser, [rfReplaceAll]);
      prProcessosPorStatus.Add(TDBParam.Create('AP_USUARIO', ftString, UserName));
      Where := ' AND (PG.CD_USUARIO IS NOT NULL OR PER.CD_USUARIO IS NOT NULL) ';
      SQL := StringReplace(SQL, '@WHERE@', Where, [rfReplaceAll]);
    end
    else
    begin
      SQL := StringReplace(SQL, '@JOINUSER@', '', [rfReplaceAll]);
      SQL := StringReplace(SQL, '@WHERE@', '', [rfReplaceAll]);
    end;

    stProcessosPorStatus := FireDacMSSQL.CreateConnection.CreateStatement;
    stProcessosPorStatus.SetSQLCommand(SQL);
    stProcessosPorStatus.SetParams(prProcessosPorStatus);
    rsProcessosPorStatus := stProcessosPorStatus.ExecuteQuery;
  finally
    prProcessosPorStatus.Free;
  end;

  Result := TList<TProcessosPorStatus>.Create;
  while rsProcessosPorStatus.Next do
  begin
    Index := Result.Add(TProcessosPorStatus.Create);

    TempValue := rsProcessosPorStatus.GetFieldValue('EXPO_AguardandoCarregamento');
    if not VarIsNull(TempValue) then
      Result[Index].Expo_AguardandoCarregamento := TempValue;
    TempValue := rsProcessosPorStatus.GetFieldValue('EXPO_AguardandoEnvioInvoice');
    if not VarIsNull(TempValue) then
      Result[Index].Expo_AguardandoEnvioInvoice := TempValue;
    TempValue := rsProcessosPorStatus.GetFieldValue('EXPO_AguardandoEmbarque');
    if not VarIsNull(TempValue) then
      Result[Index].Expo_AguardandoEmbarque := TempValue;
    TempValue := rsProcessosPorStatus.GetFieldValue('EXPO_AguardandoEnvioDocsOriginais');
    if not VarIsNull(TempValue) then
      Result[Index].Expo_AguardandoEnvioDocsOriginais := TempValue;
    TempValue := rsProcessosPorStatus.GetFieldValue('EXPO_AguardandoChegadaDestino');
    if not VarIsNull(TempValue) then
      Result[Index].Expo_AguardandoChegadaDestino := TempValue;
    TempValue := rsProcessosPorStatus.GetFieldValue('IMPO_AguardandoEmbarque');
    if not VarIsNull(TempValue) then
      Result[Index].Impo_AguardandoEmbarque := TempValue;
    TempValue := rsProcessosPorStatus.GetFieldValue('IMPO_EmbarcadoAguardandoChegada');
    if not VarIsNull(TempValue) then
      Result[Index].Impo_EmbarcadoAguardandoChegada := TempValue;
    TempValue := rsProcessosPorStatus.GetFieldValue('IMPO_EmDesembaraco');
    if not VarIsNull(TempValue) then
      Result[Index].Impo_EmDesembaraco := TempValue;
    TempValue := rsProcessosPorStatus.GetFieldValue('IMPO_DesembaracadoAguardandoProgramacaoEntrega');
    if not VarIsNull(TempValue) then
      Result[Index].Impo_DesembaracadoAguardandoProgramacaoEntrega := TempValue;
    TempValue := rsProcessosPorStatus.GetFieldValue('IMPO_ProgramadoAguardandoEntregaFabrica');
    if not VarIsNull(TempValue) then
      Result[Index].Impo_ProgramadoAguardandoEntregaFabrica := TempValue;

  end;
end;

function TService.ProcessosEmAndamentoExpo: TList<TProcessosEmAndamentoExpo>;
var
  stProcessosEmAndamento: IDBStatement;
  rsProcessosEmAndamento: IDBResultSet;
  prProcessosEmAndamento: TObjectList<TDBParam>;
  SQL: string;
  Index: Integer;
  TempValue: Variant;
  UserName: string;
  JoinUser: string;
  WhereUser: string;
  where: string;
  User: TUser;
begin
  User := GetUser;
  Where := '';
  JoinUser := '	INNER JOIN BROKER.DBO.TUSUARIO U ON U.IN_ATIVO = 1 AND U.AP_USUARIO = :AP_USUARIO '+
	'INNER JOIN BROKER.DBO.TPERMISSAO_GRUPO PG ON PG.CD_USUARIO = U.CD_USUARIO AND PG.CD_GRUPO = TP.CD_GRUPO AND PG.IN_ATIVO = 1 '+
 	'LEFT JOIN BROKER.DBO.TPERMISSAO PER ON PER.CD_CLIENTE = EN.CD_EMPRESA AND PER.CD_USUARIO = U.CD_USUARIO AND PER.IN_ATIVO = 1 '+
 	'LEFT JOIN BROKER.DBO.TPERMISSAO_AREA PA ON PA.CD_AREA = TP.CD_AREA AND PA.CD_USUARIO = U.CD_USUARIO AND PA.IN_ATIVO = 1 ';
  WhereUser :=    ' AND ' +
                  ' ( ((SELECT COUNT(CD_CLIENTE) AS COUNT_PER_EN FROM TPERMISSAO WHERE CD_USUARIO = U.CD_USUARIO) = 0) ' +
                  '    OR PER.CD_USUARIO IS NOT NULL ' +
                  '  ) ' +
                  ' AND ' +
                  ' ( ((SELECT COUNT(CD_AREA) AS COUNT_PER_AREA FROM TPERMISSAO_AREA WHERE CD_USUARIO = U.CD_USUARIO) = 0) ' +
                  '    OR PA.CD_USUARIO IS NOT NULL ' +
                  '  ) ';

  prProcessosEmAndamento := TObjectList<TDBParam>.Create;
  try
    SQL := GetSQLProcessosEmAndamentoExpo;

    if (not User.SupervisorSistema) then
    begin
      if User.ExternoImportador then
      begin
        SQL := StringReplace(SQL, '@TOP@', 'TOP 500', [rfReplaceAll]);

        SQL := StringReplace(SQL, '@JOINUSER@',
                             ' INNER JOIN BROKER.DBO.TPERMISSAO_EMPRESA_EST PEE ON PEE.CD_EMPRESA = TP.CD_IMPORTADOR AND ' +
                                                                                 ' PEE.CD_USUARIO = :CD_USUARIO AND ' +
                                                                                 ' PEE.IN_ATIVO = ''1'' ',
                             [rfReplaceAll]);
        prProcessosEmAndamento.Add(TDBParam.Create('CD_USUARIO', ftString, User.Codigo));
      end
      else
      begin
        SQL := StringReplace(SQL, '@TOP@', 'TOP 500', [rfReplaceAll]);
        SQL := StringReplace(SQL, '@JOINUSER@', JoinUser, [rfReplaceAll]);
        SQL := StringReplace(SQL, '@WHEREUSER@', WhereUser, [rfReplaceAll]);
        prProcessosEmAndamento.Add(TDBParam.Create('AP_USUARIO', ftString, User.Name));

      end;
    end
    else
    begin
      SQL := StringReplace(SQL, '@TOP@', 'TOP 50', [rfReplaceAll]);
      SQL := StringReplace(SQL, '@JOINUSER@', '', [rfReplaceAll]);
    end;

    stProcessosEmAndamento := FireDacMSSQL.CreateConnection.CreateStatement;
    stProcessosEmAndamento.SetSQLCommand(SQL);
    stProcessosEmAndamento.SetParams(prProcessosEmAndamento);
    rsProcessosEmAndamento := stProcessosEmAndamento.ExecuteQuery;
  finally
    prProcessosEmAndamento.Free;
  end;

  Result := TList<TProcessosEmAndamentoExpo>.Create;
  while rsProcessosEmAndamento.Next do
  begin
    Index := Result.Add(TProcessosEmAndamentoExpo.Create);

    TempValue := rsProcessosEmAndamento.GetFieldValue('NumeroProcesso');
    if not VarIsNull(TempValue) then
      Result[Index].NumeroProcesso := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('RefEmbarque');
    if not VarIsNull(TempValue) then
      Result[Index].RefEmbarque := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('NomeCliente');
    if not VarIsNull(TempValue) then
      Result[Index].NomeCliente := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('Mercadoria');
    if not VarIsNull(TempValue) then
      Result[Index].Mercadoria := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('DataCarregamentoFabrica');
    if not VarIsNull(TempValue) then
      Result[Index].DataCarregamentoFabrica := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('DataCarregamentoFabricaPrevisao');
    if not VarIsNull(TempValue) then
      Result[Index].DataCarregamentoFabricaPrevisao := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('DataCarregamentoFabricaAplicacao');
    if not VarIsNull(TempValue) then
      Result[Index].DataCarregamentoFabricaAplicacao := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('DataEntregaCargaTermEmbarque');
    if not VarIsNull(TempValue) then
      Result[Index].DataEntregaCargaTermEmbarque := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('DataEntregaCargaTermEmbarquePrevisao');
    if not VarIsNull(TempValue) then
      Result[Index].DataEntregaCargaTermEmbarquePrevisao := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('DataEntregaCargaTermEmbarqueAplicacao');
    if not VarIsNull(TempValue) then
      Result[Index].DataEntregaCargaTermEmbarqueAplicacao := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('DataDesembaraco');
    if not VarIsNull(TempValue) then
      Result[Index].DataDesembaraco := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('DataDesembaracoPrevisao');
    if not VarIsNull(TempValue) then
      Result[Index].DataDesembaracoPrevisao := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('DataDesembaracoAplicacao');
    if not VarIsNull(TempValue) then
      Result[Index].DataDesembaracoAplicacao := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('DataSaida');
    if not VarIsNull(TempValue) then
      Result[Index].DataSaida := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('DataSaidaPrevisao');
    if not VarIsNull(TempValue) then
      Result[Index].DataSaidaPrevisao := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('DataSaidaAplicacao');
    if not VarIsNull(TempValue) then
      Result[Index].DataSaidaAplicacao := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('DataEnvioDocumentos');
    if not VarIsNull(TempValue) then
      Result[Index].DataEnvioDocumentos := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('DataEnvioDocumentosPrevisao');
    if not VarIsNull(TempValue) then
      Result[Index].DataEnvioDocumentosPrevisao := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('DataEnvioDocumentosAplicacao');
    if not VarIsNull(TempValue) then
      Result[Index].DataEnvioDocumentosAplicacao := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('DataChegadaDestino');
    if not VarIsNull(TempValue) then
      Result[Index].DataChegadaDestino := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('DataChegadaDestinoPrevisao');
    if not VarIsNull(TempValue) then
      Result[Index].DataChegadaDestinoPrevisao := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('DataChegadaDestinoAplicacao');
    if not VarIsNull(TempValue) then
      Result[Index].DataChegadaDestinoAplicacao := TempValue;

  end;
end;

function TService.ProcessosEmAndamentoImpo: TList<TProcessosEmAndamentoImpo>;
var
  stProcessosEmAndamento: IDBStatement;
  rsProcessosEmAndamento: IDBResultSet;
  prProcessosEmAndamento: TObjectList<TDBParam>;
  SQL: string;
  Index: Integer;
  TempValue: Variant;
  UserName: string;
  JoinUser: string;
  WhereUser: string;
  where: string;
  User: TUser;
begin
  User := GetUser;
  Where := '';
  JoinUser := '	INNER JOIN BROKER.DBO.TUSUARIO U ON U.IN_ATIVO = 1 AND U.AP_USUARIO = :AP_USUARIO '+
	'INNER JOIN BROKER.DBO.TPERMISSAO_GRUPO PG ON PG.CD_USUARIO = U.CD_USUARIO AND PG.CD_GRUPO = TP.CD_GRUPO AND PG.IN_ATIVO = 1 '+
 	'LEFT JOIN BROKER.DBO.TPERMISSAO PER ON PER.CD_CLIENTE = EN.CD_EMPRESA AND PER.CD_USUARIO = U.CD_USUARIO AND PER.IN_ATIVO = 1 '+
 	'LEFT JOIN BROKER.DBO.TPERMISSAO_AREA PA ON PA.CD_AREA = TP.CD_AREA AND PA.CD_USUARIO = U.CD_USUARIO AND PA.IN_ATIVO = 1 ';
  WhereUser := ' AND ' +
                  ' ( ((SELECT COUNT(CD_CLIENTE) AS COUNT_PER_EN FROM TPERMISSAO WHERE CD_USUARIO = U.CD_USUARIO) = 0) ' +
                  '    OR PER.CD_USUARIO IS NOT NULL ' +
                  '  ) ' +
                  ' AND ' +
                  ' ( ((SELECT COUNT(CD_AREA) AS COUNT_PER_AREA FROM TPERMISSAO_AREA WHERE CD_USUARIO = U.CD_USUARIO) = 0) ' +
                  '    OR PA.CD_USUARIO IS NOT NULL ' +
                  '  ) ';

  prProcessosEmAndamento := TObjectList<TDBParam>.Create;
  try
    SQL := GetSQLProcessosEmAndamentoImpo;

    if (not User.SupervisorSistema) then
    begin
      if User.ExternoImportador then
      begin
        SQL := StringReplace(SQL, '@TOP@', 'TOP 500', [rfReplaceAll]);

        SQL := StringReplace(SQL, '@JOINUSER@',
                             ' INNER JOIN BROKER.DBO.TPERMISSAO_EMPRESA_EST PEE ON PEE.CD_EMPRESA = TP.CD_IMPORTADOR AND ' +
                                                                                 ' PEE.CD_USUARIO = :CD_USUARIO AND ' +
                                                                                 ' PEE.IN_ATIVO = ''1'' ',
                             [rfReplaceAll]);
        prProcessosEmAndamento.Add(TDBParam.Create('CD_USUARIO', ftString, User.Codigo));
      end
      else
      begin
        SQL := StringReplace(SQL, '@TOP@', 'TOP 500', [rfReplaceAll]);
        SQL := StringReplace(SQL, '@JOINUSER@', JoinUser, [rfReplaceAll]);
        SQL := StringReplace(SQL, '@WHEREUSER@', WhereUser, [rfReplaceAll]);
        prProcessosEmAndamento.Add(TDBParam.Create('AP_USUARIO', ftString, User.Name));
      end;
    end
    else
    begin
      SQL := StringReplace(SQL, '@TOP@', 'TOP 50', [rfReplaceAll]);
      SQL := StringReplace(SQL, '@JOINUSER@', '', [rfReplaceAll]);
    end;

    stProcessosEmAndamento := FireDacMSSQL.CreateConnection.CreateStatement;
    stProcessosEmAndamento.SetSQLCommand(SQL);
    stProcessosEmAndamento.SetParams(prProcessosEmAndamento);
    rsProcessosEmAndamento := stProcessosEmAndamento.ExecuteQuery;
  finally
    prProcessosEmAndamento.Free;
  end;

  Result := TList<TProcessosEmAndamentoImpo>.Create;
  while rsProcessosEmAndamento.Next do
  begin
    Index := Result.Add(TProcessosEmAndamentoImpo.Create);

    TempValue := rsProcessosEmAndamento.GetFieldValue('RefIndaia');
    if not VarIsNull(TempValue) then
      Result[Index].RefIndaia := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('NrPO');
    if not VarIsNull(TempValue) then
      Result[Index].NrPO := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('ClienteImportador');
    if not VarIsNull(TempValue) then
      Result[Index].ClienteImportador := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('Mercadoria');
    if not VarIsNull(TempValue) then
      Result[Index].Mercadoria := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('Exportador');
    if not VarIsNull(TempValue) then
      Result[Index].Exportador := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('DeliveryDateRevisadaRealizado');
    if not VarIsNull(TempValue) then
      Result[Index].DeliveryDateRevisadaRealizado := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('DeliveryDateRevisadaPrevisto');
    if not VarIsNull(TempValue) then
      Result[Index].DeliveryDateRevisadaPrevisto := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('EmbarqueRealizado');
    if not VarIsNull(TempValue) then
      Result[Index].EmbarqueRealizado := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('EmbarquePrevisto');
    if not VarIsNull(TempValue) then
      Result[Index].EmbarquePrevisto := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('ChegadaRealizado');
    if not VarIsNull(TempValue) then
      Result[Index].ChegadaRealizado := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('ChegadaPrevisto');
    if not VarIsNull(TempValue) then
      Result[Index].ChegadaPrevisto := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('RegistroDIRealizado');
    if not VarIsNull(TempValue) then
      Result[Index].RegistroDIRealizado := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('RegistroDIPrevisto');
    if not VarIsNull(TempValue) then
      Result[Index].RegistroDIPrevisto := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('DesembaracoRealizado');
    if not VarIsNull(TempValue) then
      Result[Index].DesembaracoRealizado := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('DesembaracoPrevisto');
    if not VarIsNull(TempValue) then
      Result[Index].DesembaracoPrevisto := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('EntregaProgramadaRealizado');
    if not VarIsNull(TempValue) then
      Result[Index].EntregaProgramadaRealizado := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('EntregaProgramadaPrevisto');
    if not VarIsNull(TempValue) then
      Result[Index].EntregaProgramadaPrevisto := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('EntregaFabricaRealizado');
    if not VarIsNull(TempValue) then
      Result[Index].EntregaFabricaRealizado := TempValue;
    TempValue := rsProcessosEmAndamento.GetFieldValue('EntregaFabricaPrevisto');
    if not VarIsNull(TempValue) then
      Result[Index].EntregaFabricaPrevisto := TempValue;

  end;
end;

initialization
  RegisterServiceType(TService);

finalization

end.
