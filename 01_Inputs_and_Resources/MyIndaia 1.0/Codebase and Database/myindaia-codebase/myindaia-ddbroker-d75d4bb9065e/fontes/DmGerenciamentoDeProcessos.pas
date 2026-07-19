unit DmGerenciamentoDeProcessos;

interface

uses
  SysUtils, Classes, PGGP017, FMTBcd, DB, SqlExpr, DBTables;

type
  TFiltroProcesso = (fpNumeroProcesso, fpReferenciaCliente, fpNFSe, fpNotaSenior, fpNotaWallet, fpNumeroConhecimento, fpPagamentos, fpNumerarios);
  TFiltrosProcesso = set of TFiltroProcesso;

  TdmdGerenciamentoProcessos = class(TDataModule)
    qryBroker: TSQLQuery;
    qryListaProcessos: TQuery;
    qryListaProcessosNR_PROCESSO: TStringField;
    qryListaProcessosCD_CLIENTE: TStringField;
    qryListaProcessosDT_ABERTURA: TDateTimeField;
    qryListaProcessosNR_CONHECIMENTO: TStringField;
    qryListaProcessosNM_EMPRESA: TStringField;
    qryListaProcessosCGC_EMPRESA: TStringField;
    qryListaProcessosNM_USUARIO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FListaProcessos: TStrings;
    FFiltros: TFiltrosProcesso;
    procedure ConsultaNumero(const Valor: string);
    procedure ConsultaNumeroConhecimento(const Valor: string);
    procedure ConsultaNumeroNotaWallet(const Valor: string);
    procedure ConsultaReferencia(const Valor: string);
    procedure ConsultaNotaSenior(const Valor: string);
    procedure ConsultaNFSe(const Valor: string);
    procedure MontaListaProcessos;
    procedure ConsultaInterna(const SQL, Campo: string);
    procedure ConsultaPagamentos(const Valor: string);
    procedure ConsultaNumerarios(const Valor: string);
  public
    { Public declarations }
    property Filtros: TFiltrosProcesso read FFiltros write FFiltros;
    property ListaProcessos: TStrings read FListaProcessos write FListaProcessos;
    procedure Executa(const Valor: string);
  end;

implementation

{$R *.dfm}

{ TdmdConsultaProcesso }

procedure TdmdGerenciamentoProcessos.Executa(const Valor: string);
begin
//  fpNumeroProcesso, fpReferenciaCliente, fpNFSe, fpNotaSenior, fpNotaWallet, fpNumeroConhecimento;
  FListaProcessos.Clear;
  if fpNumeroProcesso in Filtros then
    ConsultaNumero(Valor);

  if fpReferenciaCliente in Filtros then
    ConsultaReferencia(Valor);

  if fpNFSe in Filtros then
    ConsultaNFSe(Valor);

  if fpNotaSenior in Filtros then
    ConsultaNotaSenior(Valor);

  if fpNotaWallet in Filtros then
    ConsultaNumeroNotaWallet(Valor);

  if fpNumeroConhecimento in Filtros then
    ConsultaNumeroConhecimento(Valor);

  if fpPagamentos in Filtros then
    ConsultaPagamentos(Valor);

  if fpNumerarios in Filtros then
    ConsultaNumerarios(Valor);

  MontaListaProcessos;
end;

procedure TdmdGerenciamentoProcessos.DataModuleCreate(Sender: TObject);
begin
  FListaProcessos := TStringList.Create;
end;

procedure TdmdGerenciamentoProcessos.DataModuleDestroy(Sender: TObject);
begin
  FListaProcessos.Free;
end;

procedure TdmdGerenciamentoProcessos.MontaListaProcessos;
begin
  qryListaProcessos.Close;
  qryListaProcessos.SQL.Text :=
    ' SELECT '+
    '       RTRIM(TP.NR_PROCESSO)     AS NR_PROCESSO, '+
    '       RTRIM(TP.CD_CLIENTE)      AS CD_CLIENTE, '+
    '       TP.DT_ABERTURA            AS DT_ABERTURA, '+
    '       RTRIM(TP.NR_CONHECIMENTO) AS NR_CONHECIMENTO, '+
    '       RTRIM(EN.NM_EMPRESA)      AS NM_EMPRESA, '+
    '       RTRIM(EN.CGC_EMPRESA)     AS CGC_EMPRESA, '+
    '       RTRIM(USU.NM_USUARIO)     AS NM_USUARIO '+
    ' FROM TPROCESSO                    TP  (NOLOCK) '+
    ' LEFT JOIN BROKER.DBO.TEMPRESA_NAC EN  (NOLOCK) ON EN.CD_EMPRESA  = TP.CD_CLIENTE '+
    ' LEFT JOIN BROKER.DBO.TUSUARIO     USU (NOLOCK) ON USU.CD_USUARIO = TP.CD_USUARIO '+
    ' WHERE NR_PROCESSO IN (' + FListaProcessos.CommaText + ')';

  if FListaProcessos.Count > 0 then
    qryListaProcessos.Open;
end;

procedure TdmdGerenciamentoProcessos.ConsultaInterna(const SQL, Campo: string);
begin
  qryBroker.Close;
  qryBroker.SQL.Text := SQL;
  qryBroker.Open;
  while not qryBroker.Eof do
  begin
    FListaProcessos.Add(QuotedStr(TrimRight(qryBroker.FieldByName(Campo).AsString)));
    qryBroker.Next;
  end;
end;

procedure TdmdGerenciamentoProcessos.ConsultaNumero(
  const Valor: string);
var
  SQL: string;
begin
  SQL := 'SELECT NR_PROCESSO FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO LIKE '+ QuotedStr('%'+Valor);
  ConsultaInterna(SQL, 'NR_PROCESSO');
end;

procedure TdmdGerenciamentoProcessos.ConsultaNumeroConhecimento(
  const Valor: string);
var
  SQL: string;
begin
  SQL := 'SELECT NR_PROCESSO FROM TPROCESSO (NOLOCK) WHERE NR_CONHECIMENTO = '+ QuotedStr(Valor);
  ConsultaInterna(SQL, 'NR_PROCESSO');
end;

procedure TdmdGerenciamentoProcessos.ConsultaNumeroNotaWallet(const Valor: string);
var
  SQL: string;
begin
  SQL :=
    '   SELECT DISTINCT CC.CUSTOMID '+
    '     FROM MYINDAIAV2.DBO.BILLING_ITEMINVOICED BII (NOLOCK) '+
    'LEFT JOIN MYINDAIAV2.DBO.ITEMINVOICED         II  (NOLOCK) ON II.ID=BII.ITENSINVOICED_ID '+
    'LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE      CC  (NOLOCK) ON CC.ID=II.CUSTOMCLEARANCE_ID '+
    'WHERE BII.BILLING_ID = '+ Valor;
  ConsultaInterna(SQL, 'CUSTOMID');
end;

procedure TdmdGerenciamentoProcessos.ConsultaReferencia(
  const Valor: string);
var
  SQL: string;
begin
  SQL := 'SELECT DISTINCT NR_PROCESSO FROM TREF_CLIENTE (NOLOCK) WHERE CD_REFERENCIA = '+ QuotedStr(Valor);
  ConsultaInterna(SQL, 'NR_PROCESSO');
end;

procedure TdmdGerenciamentoProcessos.ConsultaNotaSenior(
  const Valor: string);
var
  SQL: string;
begin
  SQL :=
    '    SELECT DISTINCT CC.CUSTOMID '+
    '      FROM MYINDAIAV2.DBO.BILLING_ITEMINVOICED BII (NOLOCK) '+
    ' LEFT JOIN MYINDAIAV2.DBO.ITEMINVOICED         II  (NOLOCK)ON II.ID=BII.ITENSINVOICED_ID '+
    ' LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE      CC  (NOLOCK)ON CC.ID=II.CUSTOMCLEARANCE_ID '+
    ' LEFT JOIN MYINDAIAV2.DBO.BILLING              B   (NOLOCK)ON B.ID=BII.BILLING_ID '+
    'WHERE B.SENIORKEY = '+ QuotedStr(Valor);
  ConsultaInterna(SQL, 'CUSTOMID');
end;

procedure TdmdGerenciamentoProcessos.ConsultaNFSe(const Valor: string);
var
  SQL: string;
begin
  SQL := '    SELECT DISTINCT CC.CUSTOMID '+
         '      FROM MYINDAIAV2.DBO.BILLING_ITEMINVOICED BII (NOLOCK) '+
         'INNER JOIN MYINDAIAV2.DBO.BILLING              B   (NOLOCK)ON B.ID=BII.BILLING_ID '+
         'INNER JOIN SENIOR.SAPIENS.DBO.E140IDE      N   (NOLOCK)ON N.CODEMP=1 AND N.CODFIL= B.BRANCH_ID AND N.NUMNFV=B.SENIORKEY '+
         'LEFT JOIN MYINDAIAV2.DBO.ITEMINVOICED          II  (NOLOCK)ON II.ID=BII.ITENSINVOICED_ID '+
         'LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE       CC  (NOLOCK)ON CC.ID=II.CUSTOMCLEARANCE_ID '+
         'WHERE N.NUMDFS = '+ QuotedStr(Valor);
  ConsultaInterna(SQL, 'CUSTOMID');
end;

procedure TdmdGerenciamentoProcessos.ConsultaNumerarios(const Valor: string);
var
  SQL: string;
begin
   SQL := ' SELECT DISTINCT CC.CUSTOMID '+
          '   FROM MYINDAIAV2.DBO.CASHREQUESTED   CR (NOLOCK)'+
          '   JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE CC (NOLOCK) ON CC.ID=CR.CUSTOMCLEARANCE_ID '+
          '  WHERE cr.seniorKey = '+ QuotedStr(Valor);
    ConsultaInterna(SQL, 'CUSTOMID');
end;


procedure TdmdGerenciamentoProcessos.ConsultaPagamentos(const Valor: string);
var
  SQL: string;
begin
   SQL := ' SELECT DISTINCT CC.CUSTOMID '+
          '   FROM MYINDAIAV2.DBO.PAYMENTREQUESTED PR (NOLOCK)'+
          '   JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE  CC (NOLOCK) ON CC.ID=PR.CUSTOMCLEARANCE_ID '+
          '  WHERE PR.seniorKey = '+ QuotedStr(Valor);
    ConsultaInterna(SQL, 'CUSTOMID');
end;

end.
