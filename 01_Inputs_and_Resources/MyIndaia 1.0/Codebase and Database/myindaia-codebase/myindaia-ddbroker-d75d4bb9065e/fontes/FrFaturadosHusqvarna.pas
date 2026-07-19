unit FrFaturadosHusqvarna;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, KrQuery, ComObj, FMTBcd,
  DBXpress, DB, SqlExpr, Provider, DBClient, DBCtrls;

type
  TfrmFaturadosHusqvarna = class(TForm)
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
  frmFaturadosHusqvarna: TfrmFaturadosHusqvarna;

implementation

uses
  KrUtil, MaskUtils, KrCSV;


{$R *.dfm}


{ TfrmFaturadosMattel }

function TfrmFaturadosHusqvarna.GetSQL: string;
var
  Sql : String;
begin
  Sql :=
   ' DECLARE @DADOS_PROCESSO TABLE (  ' + sLineBreak +
	 ' NR_PROCESSO CHAR(18) ' + sLineBreak +
	' ,NR_NFE      VARCHAR(30) ' + sLineBreak +
	' ,DT_EMISSAO_NOTA  VARCHAR(10) ' + sLineBreak +
	' ,ValorNF NUMERIC(19,2) ' + sLineBreak +
	' ,VL_ADIANTAMENTOS NUMERIC(19,2) ' + sLineBreak +
	' ,CD_RPS  VARCHAR(30) ' + sLineBreak +
	' ,FATURA  VARCHAR(30) ' + sLineBreak +
	' ,DT_FATURA   VARCHAR(10) ' + sLineBreak +
    ' ,VL_DESPESAS NUMERIC(19,2) ' + sLineBreak +
   ' ) ' + sLineBreak +
    ' INSERT INTO @DADOS_PROCESSO ' + sLineBreak +
    ' SELECT ' + sLineBreak +
     ' TP.NR_PROCESSO                     AS NR_PROCESSO ' + sLineBreak +
    ' ,CONVERT(VARCHAR(30),B.NR_NOTA,103) AS NR_NFE ' + sLineBreak +
    ' ,CONVERT(VARCHAR(10),B.CREATED,103) AS DT_EMISSAO_NOTA ' + sLineBreak +
	' ,B.TOTAL                            AS ValorNF ' + sLineBreak +
    ' ,0                                  AS VL_ADIANTAMENTOS ' + sLineBreak +
    ' ,B.seniorKey                        AS CD_RPS ' + sLineBreak +
	' ,''''                                 AS FATURA ' + sLineBreak +
    ' ,''''                                 AS DT_FATURA ' + sLineBreak +
	' ,0                                  AS VL_DESPESAS ' + sLineBreak +
     ' FROM MYINDAIAV2.DBO.BILLING                  B	   (NOLOCK) ' + sLineBreak +
     ' JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED     BII  (NOLOCK)ON BII.BILLING_ID  = B.ID ' + sLineBreak +
     ' JOIN MYINDAIAV2.DBO.ITEMINVOICED             II   (NOLOCK)ON II.ID           = BII.ITENSINVOICED_ID ' + sLineBreak +
     ' JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE          CC   (NOLOCK)ON CC.ID           = II.CUSTOMCLEARANCE_ID ' + sLineBreak +
     ' JOIN BROKER.DBO.TPROCESSO                    TP   (NOLOCK)ON TP.NR_PROCESSO  = CC.CUSTOMID ' + sLineBreak +
    ' WHERE TP.CD_GRUPO = ''C79'' ' + sLineBreak +
    ' AND B.TYPE        = ''TAX_INVOICE'' ' + sLineBreak +
    ' AND B.STATUS      = ''INVOICED'' ' + sLineBreak +
  '      AND B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1)                       +sLineBreak +
//      ' AND TP.NR_PROCESSO = ''0101IA-004918-23'' ' + sLineBreak +
    ' UNION ALL ' + sLineBreak +

    ' SELECT ' + sLineBreak +
     ' TP.NR_PROCESSO                     AS NR_PROCESSO ' + sLineBreak +
    ' ,''''                                 AS NR_NFE ' + sLineBreak +
    ' ,''''                                 AS DT_EMISSAO_NOTA ' + sLineBreak +
	' ,0                                  AS ValorNF ' + sLineBreak +
    ' ,0                                  AS VL_ADIANTAMENTOS ' + sLineBreak +
    ' ,''''                                 AS CD_RPS ' + sLineBreak +
	' ,B.ID                               AS FATURA ' + sLineBreak +
    ' ,CONVERT(VARCHAR(10),B.CREATED,103) AS DT_FATURA ' + sLineBreak +
	' ,II.PRICE                           AS VL_DESPESAS ' + sLineBreak +
	' FROM MYINDAIAV2.DBO.BILLING               B	(NOLOCK) ' + sLineBreak +
     ' JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED  BII  (NOLOCK)ON BII.BILLING_ID  = B.ID ' + sLineBreak +
     ' JOIN MYINDAIAV2.DBO.ITEMINVOICED          II   (NOLOCK)ON II.ID           = BII.ITENSINVOICED_ID ' + sLineBreak +
     ' JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE       CC   (NOLOCK)ON CC.ID           = II.CUSTOMCLEARANCE_ID ' + sLineBreak +
     ' JOIN BROKER.DBO.TPROCESSO                 TP   (NOLOCK)ON TP.NR_PROCESSO  = CC.CUSTOMID ' + sLineBreak +
    ' WHERE TP.CD_GRUPO = ''C79'' ' + sLineBreak +
      ' AND B.TYPE      = ''TAX_RECEIPT'' ' + sLineBreak +
      ' AND B.STATUS    = ''INVOICED'' ' + sLineBreak +
  '      AND B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1)                       +sLineBreak +
//	  ' AND TP.NR_PROCESSO = ''0101IA-004918-23'' ' + sLineBreak +

    ' UNION ALL ' + sLineBreak +

    ' SELECT ' + sLineBreak +
     ' TP.NR_PROCESSO                     AS NR_PROCESSO ' + sLineBreak +
    ' ,''''                                 AS NR_NFE ' + sLineBreak +
    ' ,''''                                 AS DT_EMISSAO_NOTA ' + sLineBreak +
	' ,0                                  AS ValorNF ' + sLineBreak +
    ' ,ICR.PRICE                          AS VL_ADIANTAMENTOS ' + sLineBreak +
    ' ,''''                                 AS CD_RPS ' + sLineBreak +
	' ,''''                                 AS FATURA ' + sLineBreak +
	' ,''''                                 AS DT_FATURA ' + sLineBreak +
    ' ,0                                  AS VL_DESPESAS ' + sLineBreak +
     ' FROM MYINDAIAV2.DBO.BILLING                         B	  (NOLOCK) ' + sLineBreak +
     ' JOIN MYINDAIAV2.DBO.BILLING_CASHREQUESTED           BCR  (NOLOCK)ON BCR.BILLING_ID        = B.ID ' + sLineBreak +
     ' JOIN MYINDAIAV2.DBO.CASHREQUESTED                   CR   (NOLOCK)ON CR.ID                 = BCR.CASHREQUESTS_ID ' + sLineBreak +
     ' JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUESTED CRIR (NOLOCK)ON CRIR.CASHREQUESTED_ID = CR.ID ' + sLineBreak +
     ' JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED               ICR  (NOLOCK)ON ICR.ID                = CRIR.ITEMS_ID ' + sLineBreak +
                                                                     ' AND ICR.DESTINO           = 1 /*CONTA INDAIA*/ ' + sLineBreak +
     ' JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE                 CC   (NOLOCK)ON CC.ID                 = CR.CUSTOMCLEARANCE_ID ' + sLineBreak +
     ' JOIN BROKER.DBO.TPROCESSO                           TP   (NOLOCK)ON TP.NR_PROCESSO        = CC.CUSTOMID ' + sLineBreak +
    ' WHERE TP.CD_GRUPO = ''C79'' ' + sLineBreak +
      ' AND B.TYPE        = ''TAX_RECEIPT'' ' + sLineBreak +
      ' AND B.STATUS      = ''INVOICED'' ' + sLineBreak +
  '      AND B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1)                       +sLineBreak +
//	  ' AND TP.NR_PROCESSO = ''0101IA-004918-23'' ' + sLineBreak +

    ' SELECT DISTINCT NR_PROCESSO                                               AS NR_PROCESSO ' + sLineBreak +
          ' ,Cast(ISNULL(STUFF((SELECT '','' + LTRIM(RTRIM(R.CD_REFERENCIA)) ' + sLineBreak +
                    ' FROM BROKER.DBO.TREF_CLIENTE R WITH (NOLOCK) ' + sLineBreak +
                   ' WHERE R.NR_PROCESSO   = A.NR_PROCESSO ' + sLineBreak +
                     ' AND R.TP_REFERENCIA = ''01'' ' + sLineBreak +
           ' FOR XML PATH('''')), 1, 1, ''''), '''') as Varchar(300))                 AS REF_CLIENTE ' + sLineBreak +
          ' ,MAX(NR_NFE)		                                                  AS NR_NFE ' + sLineBreak +
          ' ,MAX(DT_EMISSAO_NOTA)		                                              AS DT_EMISSAO_NOTA ' + sLineBreak +
		  ' ,SUM(ValorNF)                                                       AS ValorNf ' + sLineBreak +
		  ' ,MAX(FATURA)                                                             AS FATURA ' + sLineBreak +
		  ' ,MAX(DT_FATURA)                                                          AS DT_FATURA ' + sLineBreak +
		  ' ,SUM(VL_DESPESAS)                                                   AS VL_DESPESAS ' + sLineBreak +
          ' ,SUM(VL_ADIANTAMENTOS)                                              AS VL_ADIANTAMENTOS ' + sLineBreak +
          ' ,CAST(STUFF((SELECT DISTINCT '', '' + CD_RPS ' + sLineBreak +
                    ' FROM @DADOS_PROCESSO D ' + sLineBreak +
                   ' WHERE D.NR_PROCESSO = A.NR_PROCESSO ' + sLineBreak +
                     ' AND CD_RPS IS NOT NULL ' + sLineBreak +
                  ' FOR XML PATH('''')), 1, 3,'''') AS VARCHAR(300))                 AS CD_RPS ' + sLineBreak +
      ' FROM @DADOS_PROCESSO A ' + sLineBreak +
    ' GROUP BY NR_PROCESSO ' + sLineBreak +
    ' ORDER BY NR_PROCESSO ';

  result := sql;
end;

procedure TfrmFaturadosHusqvarna.Monta(const NomeArquivo: string; DataInicial, DataFinal: TDateTime);
var
  Query: TLocalSQLQuery;

begin
  Query  := AutoQuery.DBXQuery(GetSQL);
  Query.Open;

  ExportaCSV(NomeArquivo, Query);
end;


procedure TfrmFaturadosHusqvarna.BitBtn1Click(Sender: TObject);
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

procedure TfrmFaturadosHusqvarna.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmFaturadosHusqvarna.ExportaCSV(const NomeArquivo: string;
  Query: TLocalSQLQuery);
var
  csv: TCSV;
begin
  csv := TCSV.Create;
  try
    csv.Cabecalho.Text := '"Ref. Indaiá";'+
                          '"REF Husqvarna";'+
                          '"Nota Fiscal";'+
                          '"Data NF";'+
                          '"Valor NF";'+
                          '"Fatura";'+
                          '"Data Fatura";'+
                          '"Valor Fatura";'+
                          '"Valor Adiantamento";'+
                          '"RPS"';

    csv.ConvertCSV(Query, NomeArquivo, False);
  finally
    csv.Free;
  end;
end;

end.



