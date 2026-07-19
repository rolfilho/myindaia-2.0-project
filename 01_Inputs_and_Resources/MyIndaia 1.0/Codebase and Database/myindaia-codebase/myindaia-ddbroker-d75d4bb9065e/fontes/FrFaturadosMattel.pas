unit FrFaturadosMattel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, KrQuery, ComObj, FMTBcd,
  DBXpress, DB, SqlExpr, Provider, DBClient, DBCtrls;

type
  TfrmFaturadosMattel = class(TForm)
    Label1: TLabel;
    mskDataIni: TMaskEdit;
    mskDataFin: TMaskEdit;
    Label2: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SaveDialog: TSaveDialog;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    DataInicial: TDateTime;
    DataFinal: TDateTime;
    procedure Monta(const NomeArquivo: string; DataInicial, DataFinal: TDateTime);
    function GetSQL: string;
    procedure ExportaCSV(const NomeArquivo: string; Query: TLocalSQLQuery);
  end;

var
  frmFaturadosMattel: TfrmFaturadosMattel;

implementation

uses
  KrUtil, MaskUtils, KrCSV;


{$R *.dfm}


{ TfrmFaturadosMattel }

function TfrmFaturadosMattel.GetSQL: string;
var
  Sql : String;
begin
  Sql :=
  '   DECLARE @DADOS_PROCESSO TABLE (                                                                                     ' + sLineBreak +
  '	 NR_PROCESSO CHAR(18)                                                                                                 ' + sLineBreak +
  '	,NR_NFE      VARCHAR(30)                                                                                              ' + sLineBreak +
  '	,DT_EMISSAO  VARCHAR(10)                                                                                              ' + sLineBreak +
  '	,IRRF        NUMERIC(19,2)                                                                                            ' + sLineBreak +
  '	,VL_ADIANTAMENTOS NUMERIC(19,2)                                                                                       ' + sLineBreak +
  '	,VL_DESPESAS NUMERIC(19,2)                                                                                            ' + sLineBreak +
  '	,VL_PISCOFINS NUMERIC(19,2)                                                                                           ' + sLineBreak +
  '	,CD_PSR  NVARCHAR(30)                                                                                                 ' + sLineBreak +
  '	,LOCAL_DES  NVARCHAR(30)                                                                                              ' + sLineBreak +
  '	                                                                                                                      ' + sLineBreak +
  '   )                                                                                                                   ' + sLineBreak +
  '    INSERT INTO @DADOS_PROCESSO                                                                                        ' + sLineBreak +
  '    SELECT                                                                                                             ' + sLineBreak +
  '     TP.NR_PROCESSO                     AS NR_PROCESSO                                                                 ' + sLineBreak +
  '    ,CONVERT(VARCHAR(30),B.NR_NOTA,103) AS NR_NFE                                                                      ' + sLineBreak +
  '    ,CONVERT(VARCHAR(10),B.CREATED,103) AS DT_EMISSAO                                                                  ' + sLineBreak +
  '    ,B.IR                               AS IRRF                                                                        ' + sLineBreak +
  '    ,0                                  AS VL_ADIANTAMENTOS                                                            ' + sLineBreak +
  '    ,SUM(II.PRICE)                      AS VL_DESPESAS                                                                 ' + sLineBreak +
  '    ,B.COFINS                           AS VL_PISCOFINS                                                                ' + sLineBreak +
  '    ,NULL                               AS CD_PSR                                                                      ' + sLineBreak +
  '    ,LD.DESCRICAO						           AS LOCAL_DES                                                                   ' + sLineBreak +
  '     FROM MYINDAIAV2.DBO.BILLING                  B	   (NOLOCK)                                                       ' + sLineBreak +
  '     JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED     BII  (NOLOCK)ON BII.BILLING_ID  = B.ID                               ' + sLineBreak +
  '     JOIN MYINDAIAV2.DBO.ITEMINVOICED             II   (NOLOCK)ON II.ID           = BII.ITENSINVOICED_ID               ' + sLineBreak +
  '     JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE          CC   (NOLOCK)ON CC.ID           = II.CUSTOMCLEARANCE_ID              ' + sLineBreak +
  '     JOIN BROKER.DBO.TPROCESSO                    TP   (NOLOCK)ON TP.NR_PROCESSO  = CC.CUSTOMID               	        ' + sLineBreak +
  '     LEFT JOIN BROKER.DBO.TLOCAL_EMBARQUE			   LD	  (NOLOCK)ON LD.CODIGO       = TP.CD_LOCAL_DESEMBARQUE            ' + sLineBreak +
  '    WHERE TP.CD_GRUPO = ''B77''                                                                                        ' + sLineBreak +
  '    AND B.TYPE        = ''TAX_INVOICE''                                                                                ' + sLineBreak +
  '    AND B.STATUS      = ''INVOICED''                                                                                   ' + sLineBreak +
  '      AND B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1)                       +sLineBreak +
  '                                                                                                                       ' + sLineBreak +
  '     GROUP BY TP.NR_PROCESSO, B.NR_NOTA, B.CREATED, B.COFINS, LD.DESCRICAO, B.IR                                       ' + sLineBreak +
  '    UNION ALL                                                                                                          ' + sLineBreak +
  '                                                                                                                       ' + sLineBreak +
  '    SELECT                                                                                                             ' + sLineBreak +
  '     TP.NR_PROCESSO                     AS NR_PROCESSO                                                                 ' + sLineBreak +
  '    ,''''                               AS NR_NFE                                                                      ' + sLineBreak +
  '    ,CONVERT(VARCHAR(10),B.CREATED,103) AS DT_EMISSAO                                                                  ' + sLineBreak +
  '    ,B.IR                               AS IRRF                                                                        ' + sLineBreak +
  '    ,0                                  AS VL_ADIANTAMENTOS                                                            ' + sLineBreak +
  '    ,II.PRICE                           AS VL_DESPESAS                                                                 ' + sLineBreak +
  '    ,B.COFINS                           AS VL_PISCOFINS                                                                ' + sLineBreak +
  '    ,NULL                               AS CD_PSR                                                                      ' + sLineBreak +
  '    ,LD.DESCRICAO						           AS LOCAL_DES                                                                   ' + sLineBreak +
  '     FROM MYINDAIAV2.DBO.BILLING               B	(NOLOCK)                                                              ' + sLineBreak +
  '     JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED  BII  (NOLOCK)ON BII.BILLING_ID  = B.ID                                  ' + sLineBreak +
  '     JOIN MYINDAIAV2.DBO.ITEMINVOICED          II   (NOLOCK)ON II.ID           = BII.ITENSINVOICED_ID                  ' + sLineBreak +
  '     JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE       CC   (NOLOCK)ON CC.ID           = II.CUSTOMCLEARANCE_ID                 ' + sLineBreak +
  '     JOIN BROKER.DBO.TPROCESSO                 TP   (NOLOCK)ON TP.NR_PROCESSO  = CC.CUSTOMID               	          ' + sLineBreak +
  '     LEFT JOIN BROKER.DBO.TLOCAL_EMBARQUE			   LD	  (NOLOCK)ON LD.CODIGO       = TP.CD_LOCAL_DESEMBARQUE            ' + sLineBreak +
  '    WHERE TP.CD_GRUPO = ''B77''                                                                                        ' + sLineBreak +
  '      AND B.TYPE      = ''TAX_RECEIPT''                                                                                ' + sLineBreak +
  '      AND B.STATUS    = ''INVOICED''                                                                                   ' + sLineBreak +
  '      AND B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1)                       +sLineBreak +
  '                                                                                                                       ' + sLineBreak +
  '    UNION ALL                                                                                                          ' + sLineBreak +
  '                                                                                                                       ' + sLineBreak +
  '    SELECT                                                                                                             ' + sLineBreak +
  '     TP.NR_PROCESSO                     AS NR_PROCESSO                                                                 ' + sLineBreak +
  '    ,''''                                 AS NR_NFE                                                                    ' + sLineBreak +
  '    ,CONVERT(VARCHAR(10),B.CREATED,103) AS DT_EMISSAO                                                                  ' + sLineBreak +
  '    ,B.IR                               AS IRRF                                                                        ' + sLineBreak +
  '    ,ICR.PRICE                          AS VL_ADIANTAMENTOS                                                            ' + sLineBreak +
  '    ,0                                  AS VL_DESPESAS                                                                 ' + sLineBreak +
  '    ,B.COFINS                           AS VL_PISCOFINS                                                                ' + sLineBreak +
  '    ,cr.seniorKey                       AS CD_PSR                                                                      ' + sLineBreak +
  '    ,LD.DESCRICAO						           AS LOCAL_DES                                                                   ' + sLineBreak +
  '     FROM MYINDAIAV2.DBO.BILLING                         B	  (NOLOCK)                                                  ' + sLineBreak +
  '     JOIN MYINDAIAV2.DBO.BILLING_CASHREQUESTED           BCR  (NOLOCK)ON BCR.BILLING_ID        = B.ID                  ' + sLineBreak +
  '     JOIN MYINDAIAV2.DBO.CASHREQUESTED                   CR   (NOLOCK)ON CR.ID                 = BCR.CASHREQUESTS_ID   ' + sLineBreak +
  '     JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUESTED CRIR (NOLOCK)ON CRIR.CASHREQUESTED_ID = CR.ID                 ' + sLineBreak +
  '     JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED               ICR  (NOLOCK)ON ICR.ID                = CRIR.ITEMS_ID         ' + sLineBreak +
  '                                                                     AND ICR.DESTINO           = 1 /*CONTA INDAIA*/    ' + sLineBreak +
  '     JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE                 CC   (NOLOCK)ON CC.ID                 = CR.CUSTOMCLEARANCE_ID ' + sLineBreak +
  '     JOIN BROKER.DBO.TPROCESSO                           TP   (NOLOCK)ON TP.NR_PROCESSO        = CC.CUSTOMID           ' + sLineBreak +
  '     LEFT JOIN BROKER.DBO.TLOCAL_EMBARQUE			   LD	  (NOLOCK)ON LD.CODIGO       = TP.CD_LOCAL_DESEMBARQUE            ' + sLineBreak +
  '    WHERE TP.CD_GRUPO = ''B77''                                                                                        ' + sLineBreak +
  '      AND B.TYPE        = ''TAX_RECEIPT''                                                                              ' + sLineBreak +
  '      AND B.STATUS      = ''INVOICED''                                                                                 ' + sLineBreak +
  '      AND B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1)                       +sLineBreak +
  '                                                                                                                       ' + sLineBreak +
  '                                                                                                                       ' + sLineBreak +
  '    SELECT NR_PROCESSO                AS NR_PROCESSO                                                                   ' + sLineBreak +
  '          ,MAX(NR_NFE)		          AS NR_NFE                                                                           ' + sLineBreak +
  '                                                                                                                       ' + sLineBreak +
  '          ,Cast(ISNULL(STUFF((SELECT '','' + LTRIM(RTRIM(R.CD_REFERENCIA))                                             ' + sLineBreak +
  '                    FROM BROKER.DBO.TREF_CLIENTE R WITH (NOLOCK)                                                       ' + sLineBreak +
  '                   WHERE R.NR_PROCESSO   = A.NR_PROCESSO                                                               ' + sLineBreak +
  '                     AND R.TP_REFERENCIA = ''04''                                                                      ' + sLineBreak +
  '           FOR XML PATH('''')), 1, 1, ''''), '''') as Varchar(300)) AS REF_CLIENTE                                     ' + sLineBreak +
  '                                                                                                                       ' + sLineBreak +
  '          ,DT_EMISSAO		              AS DT_EMISSAO                                                                   ' + sLineBreak +
  '          ,SUM(IRRF)			          AS IRRF                                                                             ' + sLineBreak +
  '          ,SUM(VL_ADIANTAMENTOS)          AS VL_ADIANTAMENTOS                                                          ' + sLineBreak +
  '          ,SUM(VL_DESPESAS)		          AS VL_DESPESAS                                                                ' + sLineBreak +
  '          ,SUM(VL_PISCOFINS)	          AS VL_PISCOFINS                                                                 ' + sLineBreak +
  '          ,((SUM(VL_ADIANTAMENTOS) + SUM(VL_PISCOFINS) + SUM(IRRF)) - SUM(VL_DESPESAS)) AS VL_TOTAL                    ' + sLineBreak +
  '          ,CAST(STUFF((SELECT DISTINCT '', '' + CD_PSR                                                                 ' + sLineBreak +
  '                    FROM @DADOS_PROCESSO D                                                                             ' + sLineBreak +
  '                   WHERE D.NR_PROCESSO = A.NR_PROCESSO                                                                 ' + sLineBreak +
  '                     AND CD_PSR IS NOT NULL                                                                            ' + sLineBreak +
  '                  FOR XML PATH('''')), 1,2,'''') AS VARCHAR(300)) AS NR_PSR                                            ' + sLineBreak +
  '          ,LOCAL_DES	 AS LOCAL_DES					                                                                            ' + sLineBreak +
  '      FROM @DADOS_PROCESSO A                                                                                           ' + sLineBreak +
  '    GROUP BY NR_PROCESSO, DT_EMISSAO, LOCAL_DES                                                                        ' + sLineBreak +
  '    ORDER BY NR_PROCESSO                                                                                               ' + sLineBreak ;

  result := sql;
end;

procedure TfrmFaturadosMattel.Monta(const NomeArquivo: string; DataInicial, DataFinal: TDateTime);
var
  Query: TLocalSQLQuery;

begin
  Query  := AutoQuery.DBXQuery(GetSQL);
  Query.Open;

  ExportaCSV(NomeArquivo, Query);
end;


procedure TfrmFaturadosMattel.BitBtn1Click(Sender: TObject);
begin

  DataInicial := StrToDateTimeDef(mskDataIni.Text,0);
  DataFinal   := StrToDateTimeDef(mskDataFin.Text,0);

  if DataInicial = 0 then
  begin
    ShowMessage('Data inicial não informada.');
    Exit;
  end;
  if DataFinal = 0 then
  begin
    ShowMessage('Data final não informada.');
    Exit;
  end;
  if DataInicial > DataInicial then
  begin
    ShowMessage('Data inicial maior que data final.');
    Exit;
  end;

  if SaveDialog.Execute then
  begin
    Monta(SaveDialog.FileName, DataInicial, DataFinal);
    Close;
    ShowMessage('Concluído.');
  end;
end;

procedure TfrmFaturadosMattel.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmFaturadosMattel.ExportaCSV(const NomeArquivo: string;
  Query: TLocalSQLQuery);
var
  csv: TCSV;
begin
  csv := TCSV.Create;
  try
    csv.Cabecalho.Text := '"REG INDAIÁ";'+
                          '"NFE";'+
                          '"REF MATTEL";'+
                          '"DATA";'+
                          '"IRRF";'+
                          '"TOTAL ADIANT/CRÉDITOS";'+
                          '"TOTAL DEPESAS";'+
                          '"VALOR DE PIS/COFINS";'+
                          '"SALDO FINAL";'+
                          '"NR. PSR";'+
                          '"LOCAL DESEMBARQUE"';

    csv.ConvertCSV(Query, NomeArquivo, False);
  finally
    csv.Free;
  end;
end;

end.



