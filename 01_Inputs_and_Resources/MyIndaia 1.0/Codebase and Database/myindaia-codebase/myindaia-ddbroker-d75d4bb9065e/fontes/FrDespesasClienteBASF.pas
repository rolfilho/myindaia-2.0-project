unit FrDespesasClienteBASF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, KrQuery, ComObj, FMTBcd,
  DBXpress, DB, SqlExpr, Provider, DBClient, DBCtrls;

type
  TfrmDespesasClienteBASF = class(TForm)
    Label1: TLabel;
    mskDataIni: TMaskEdit;
    mskDataFin: TMaskEdit;
    Label2: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SaveDialog: TSaveDialog;
    chbBasfSa: TCheckBox;
    chbBasfPoliuretanos: TCheckBox;
    chbChemetall: TCheckBox;
    SQLConnection: TSQLConnection;
    chbBasfCatalisadores: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Monta(const NomeArquivo: string; DataInicial, DataFinal: TDateTime);
    function GetSQL: string;
    procedure ExportaCSV(const NomeArquivo: string; Query: TLocalSQLQuery);
  public
    sEmpresa : String;
    sGrupo   : String;
  end;

var
  frmDespesasClienteBASF: TfrmDespesasClienteBASF;

implementation

uses
  KrUtil, MaskUtils, KrCSV;


{$R *.dfm}


{ TfrmDespesasClienteBASF }

function TfrmDespesasClienteBASF.GetSQL: string;
var
  Sql : String;
begin
  sgrupo := '';
  if chbBasfSa.checked then
  if sgrupo = '' then
    sgrupo := '''002'''
  else
    sgrupo := sgrupo + ', ' + '''002''';

  if chbBasfPoliuretanos.checked then
  if sgrupo = '' then
    sgrupo := '''013'''
  else
    sgrupo := sgrupo + ', ' + '''013''';

  if chbBasfCatalisadores.checked then
  if sgrupo = '' then
    sgrupo := '''C74'''
  else
    sgrupo := sgrupo + ', ' + '''C74''';


  if SGRUPO = '' then
    SGRUPO := ' ''0'' ';

  Sql :=
  '   SELECT                                                                                                                    '+ slineBreak +
  '   CASE                                                                                                                      '+ slineBreak +
  '   WHEN EN.NM_EMPRESA LIKE ''BASF S%''    THEN ''BASF S.A.''                                                                 '+ slineBreak +
  '   WHEN EN.NM_EMPRESA LIKE ''BASF P%''    THEN ''BASF POLIURETANOS''                                                         '+ slineBreak +
  '   WHEN EN.NM_EMPRESA LIKE ''CHEMETALL%'' THEN ''CHEMETALL''                                                                 '+ slineBreak +
  '   WHEN EN.NM_EMPRESA LIKE ''BASF CATALISADORES%'' THEN ''BASF CATALISADORES''                                                '+ slineBreak +
  '   END                                             AS [CIA],                                                                 '+ slineBreak +
  '   ''3152296''                                     AS [CODDESPACHANTE],                                                      '+ slineBreak +
  '   SUBSTRING(EN.CGC_EMPRESA,1,2)+''.''+                                                                                      '+ slineBreak +
  '   SUBSTRING(EN.CGC_EMPRESA,3,3)+''.''+                                                                                      '+ slineBreak +
  '   SUBSTRING(EN.CGC_EMPRESA,6,3)+''/''+                                                                                      '+ slineBreak +
  '   SUBSTRING(EN.CGC_EMPRESA,9,4)+''-''+                                                                                      '+ slineBreak +
  '   SUBSTRING(EN.CGC_EMPRESA,13,2)                AS [LOCALCNPJ],                                                             '+ slineBreak +
  '   TP.NR_PROCESSO                                AS [PROCESSO],                                                              '+ slineBreak +
  '   SUBSTRING(TP.NR_DI,1,2)+''/''+                                                                                            '+ slineBreak +
  '   SUBSTRING(TP.NR_DI,3,7)+''-''+                                                                                            '+ slineBreak +
  '   SUBSTRING(TP.NR_DI,10,1)                      AS [NDI],                                                                   '+ slineBreak +
  '   CONVERT(VARCHAR(10),EV021.DT_REALIZACAO,103)  AS [DTREGDI],                                                               '+ slineBreak +
  '   REF.REF_CLIENTE                               AS [PEDIDO],                                                                '+ slineBreak +
  '   REF.ITEM_PO                                   AS [ITEM],                                                                  '+ slineBreak +
  '   NF.DANFE                                      AS [NOTAFISCAL],                                                            '+ slineBreak +
  '   NF.CFOP                                       AS [UTILIZMAT],                                                             '+ slineBreak +
  '   ISNULL(ICMS.PRICE,0)                          AS [ICMS],                                                                  '+ slineBreak +
  '   ISNULL(TX.PRICE,0)                            AS [TXSISCOMEX],                                                            '+ slineBreak +
  '   ISNULL(II.PRICE,0)                            AS [II],                                                                    '+ slineBreak +
  '   ISNULL(IPI.PRICE,0)                           AS [IPI],                                                                   '+ slineBreak +
  '   ISNULL(PIS.PRICE,0)                           AS [PIS],                                                                   '+ slineBreak +
  '   ISNULL(COFINS.PRICE,0)                        AS [COFINS],                                                                '+ slineBreak +
  '   ''''                                          AS [PROTOCOLO],                                                             '+ slineBreak +
  '   0                                             AS [ATRIBUICAOICMS],                                                        '+ slineBreak +
  '   0                                             AS [ANTIDUMPING],                                                           '+ slineBreak +
  '   REF_PROTOCOLO.REF                             AS [PROTOCOLO]                                                              '+ slineBreak +
  '   FROM BROKER.DBO.TPROCESSO           TP                                                                                    '+ slineBreak +
  '   JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE CC    ON CC.CUSTOMID       = TP.NR_PROCESSO                                           '+ slineBreak +
  '   JOIN BROKER.DBO.TEMPRESA_NAC        EN    ON EN.CD_EMPRESA     = TP.CD_CLIENTE                                            '+ slineBreak +
  '   JOIN BROKER.DBO.TFOLLOWUP           EV021 ON EV021.NR_PROCESSO = TP.NR_PROCESSO                                           '+ slineBreak +
  '                                            AND EV021.CD_EVENTO   = ''021''                                                  '+ slineBreak +
  '                                            AND EV021.CD_SERVICO  = TP.CD_SERVICO                                            '+ slineBreak +
  '                                                                                                                             '+ slineBreak +
  '   OUTER APPLY (  SELECT TOP 1 LTRIM(RTRIM(R.CD_REFERENCIA)) AS REF_CLIENTE,                                                 '+ slineBreak +
  '                               R.NR_ITEM_PO                  AS ITEM_PO                                                      '+ slineBreak +
  '                    FROM BROKER.DBO.TREF_CLIENTE R (NOLOCK)                                                                  '+ slineBreak +
  '                   WHERE R.TP_REFERENCIA = ''01''                                                                            '+ slineBreak +
  '                     AND R.NR_PROCESSO   = TP.NR_PROCESSO) REF                                                               '+ slineBreak +
  '                                                                                                                             '+ slineBreak +
  '   OUTER APPLY (SELECT CONVERT( VARCHAR(200),                                                                                '+ slineBreak +
  '                       STUFF ((SELECT '','' + LTRIM(RTRIM(R.CD_REFERENCIA))                                                  '+ sLineBreak +
  '                                FROM BROKER.DBO.TREF_CLIENTE R (NOLOCK)                                                      '+ sLineBreak +
  '                               WHERE R.TP_REFERENCIA = ''33''                                                                '+ sLineBreak +
  '                                 AND R.NR_PROCESSO   = TP.NR_PROCESSO                                                        '+ sLineBreak +
  '                      FOR XML PATH('''')), 1, 1, '''')) REF                                                                  '+ sLineBreak +
  '   	    ) REF_PROTOCOLO                                                                                                     '+ sLineBreak +
  '                                                                                                                             '+ slineBreak +
  '   OUTER APPLY (  SELECT TOP 1 PNF.NR_NOTA AS DANFE,                                                                         '+ slineBreak +
  '                               PNF.CD_CFOP AS CFOP                                                                           '+ slineBreak +
  '                    FROM BROKER.DBO.TPROCESSO_NF PNF (NOLOCK)                                                                '+ slineBreak +
  '                   WHERE PNF.NR_PROCESSO = TP.NR_PROCESSO) NF                                                                '+ slineBreak +
  '                                                                                                                             '+ slineBreak +
  '   OUTER APPLY ( SELECT SUM(PRICE) AS PRICE                                                                                  '+ slineBreak +
  '                   FROM MYINDAIAV2.DBO.CASHREQUESTED               CR                                                        '+ slineBreak +
  '               JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUESTED ICR ON ICR.CASHREQUESTED_ID  = CR.ID                      '+ slineBreak +
  '               JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED               IC  ON IC.ID                 = ICR.ITEMS_ID               '+ slineBreak +
  '                                                                                                                             '+ slineBreak +
  '               JOIN MYINDAIAV2.DBO.ITEM                            I   ON I.ID                  = IC.ITEM_ID                 '+ slineBreak +
  '                  WHERE CR.CUSTOMCLEARANCE_ID = CC.ID                                                                        '+ slineBreak +
  '                    AND IC.ITEM_ID = ''122'') ICMS                                                                           '+ slineBreak +
  '   				                                                                                                                  '+ slineBreak +
  '   OUTER APPLY ( SELECT SUM(PRICE) AS PRICE                                                                                  '+ slineBreak +
  '                   FROM MYINDAIAV2.DBO.CASHREQUESTED               CR                                                        '+ slineBreak +
  '               JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUESTED ICR ON ICR.CASHREQUESTED_ID  = CR.ID                      '+ slineBreak +
  '               JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED               IC  ON IC.ID                 = ICR.ITEMS_ID               '+ slineBreak +
  '                                                                                                                             '+ slineBreak +
  '               JOIN MYINDAIAV2.DBO.ITEM                            I   ON I.ID                  = IC.ITEM_ID                 '+ slineBreak +
  '                  WHERE CR.CUSTOMCLEARANCE_ID = CC.ID                                                                        '+ slineBreak +
  '                    AND IC.ITEM_ID = ''217'') TX                                                                             '+ slineBreak +
  '   				                                                                                                                  '+ slineBreak +
  '   OUTER APPLY ( SELECT SUM(PRICE) AS PRICE                                                                                  '+ slineBreak +
  '                   FROM MYINDAIAV2.DBO.CASHREQUESTED               CR                                                        '+ slineBreak +
  '               JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUESTED ICR ON ICR.CASHREQUESTED_ID  = CR.ID                      '+ slineBreak +
  '               JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED               IC  ON IC.ID                 = ICR.ITEMS_ID               '+ slineBreak +
  '                                                                                                                             '+ slineBreak +
  '               JOIN MYINDAIAV2.DBO.ITEM                            I   ON I.ID                  = IC.ITEM_ID                 '+ slineBreak +
  '                  WHERE CR.CUSTOMCLEARANCE_ID = CC.ID                                                                        '+ slineBreak +
  '                    AND IC.ITEM_ID = ''128'') II                                                                             '+ slineBreak +
  '   				                                                                                                                  '+ slineBreak +
  '   OUTER APPLY ( SELECT SUM(PRICE) AS PRICE                                                                                  '+ slineBreak +
  '                   FROM MYINDAIAV2.DBO.CASHREQUESTED               CR                                                        '+ slineBreak +
  '               JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUESTED ICR ON ICR.CASHREQUESTED_ID  = CR.ID                      '+ slineBreak +
  '               JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED               IC  ON IC.ID                 = ICR.ITEMS_ID               '+ slineBreak +
  '                                                                                                                             '+ slineBreak +
  '               JOIN MYINDAIAV2.DBO.ITEM                            I   ON I.ID                  = IC.ITEM_ID                 '+ slineBreak +
  '                  WHERE CR.CUSTOMCLEARANCE_ID = CC.ID                                                                        '+ slineBreak +
  '                    AND IC.ITEM_ID =  ''124'') IPI                                                                           '+ slineBreak +
  '   				                                                                                                                  '+ slineBreak +
  '   OUTER APPLY ( SELECT SUM(PRICE) AS PRICE                                                                                  '+ slineBreak +
  '                   FROM MYINDAIAV2.DBO.CASHREQUESTED               CR                                                        '+ slineBreak +
  '               JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUESTED ICR ON ICR.CASHREQUESTED_ID  = CR.ID                      '+ slineBreak +
  '               JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED               IC  ON IC.ID                 = ICR.ITEMS_ID               '+ slineBreak +
  '                                                                                                                             '+ slineBreak +
  '               JOIN MYINDAIAV2.DBO.ITEM                            I   ON I.ID                  = IC.ITEM_ID                 '+ slineBreak +
  '                  WHERE CR.CUSTOMCLEARANCE_ID = CC.ID                                                                        '+ slineBreak +
  '                    AND IC.ITEM_ID = ''167'') PIS                                                                            '+ slineBreak +
  '   				                                                                                                                  '+ slineBreak +
  '   OUTER APPLY ( SELECT SUM(PRICE) AS PRICE                                                                                  '+ slineBreak +
  '                   FROM MYINDAIAV2.DBO.CASHREQUESTED               CR                                                        '+ slineBreak +
  '               JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUESTED ICR ON ICR.CASHREQUESTED_ID  = CR.ID                      '+ slineBreak +
  '               JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED               IC  ON IC.ID                 = ICR.ITEMS_ID               '+ slineBreak +
  '                                                                                                                             '+ slineBreak +
  '               JOIN MYINDAIAV2.DBO.ITEM                            I   ON I.ID                  = IC.ITEM_ID                 '+ slineBreak +
  '                  WHERE CR.CUSTOMCLEARANCE_ID = CC.ID                                                                        '+ slineBreak +
  '                    AND IC.ITEM_ID = ''41'') COFINS                                                                          '+ slineBreak +
  '                                                                                                                             '+ slineBreak +
  '   WHERE TP.CD_PRODUTO = ''01''                                                                                              '+ slineBreak +
  '    AND (TP.CD_GRUPO IN ('+SGRUPO+'))                                                                                        '+ sLineBreak +
  '    AND (EV021.DT_REALIZACAO >= :DATAINICIAL) AND (EV021.DT_REALIZACAO <= :DATAFINAL)                                        '+ sLineBreak +
  '                                                                                                                             '+ slineBreak ;
  if chbChemetall.checked then
    sql := sql +
  '  UNION ALL                                                                                                                  '+ slineBreak +
  '                                                                                                                             '+ slineBreak +
  '   SELECT                                                                                                                    '+ slineBreak +
  '   CASE                                                                                                                      '+ slineBreak +
  '   WHEN EN.NM_EMPRESA LIKE ''BASF S%''    THEN ''BASF S.A.''                                                                 '+ slineBreak +
  '   WHEN EN.NM_EMPRESA LIKE ''BASF P%''    THEN ''BASF POLIURETANOS''                                                         '+ slineBreak +
  '   WHEN EN.NM_EMPRESA LIKE ''CHEMETALL%'' THEN ''CHEMETALL''                                                                 '+ slineBreak +
  '   WHEN EN.NM_EMPRESA LIKE ''BASF CATALISADORES%'' THEN ''BASF CATALISADORES''                                               '+ slineBreak +
  '   END                                             AS [CIA],                                                                 '+ slineBreak +
  '   ''3152296''                                     AS [CODDESPACHANTE],                                                      '+ slineBreak +
  '   SUBSTRING(EN.CGC_EMPRESA,1,2)+''.''+                                                                                      '+ slineBreak +
  '   SUBSTRING(EN.CGC_EMPRESA,3,3)+''.''+                                                                                      '+ slineBreak +
  '   SUBSTRING(EN.CGC_EMPRESA,6,3)+''/''+                                                                                      '+ slineBreak +
  '   SUBSTRING(EN.CGC_EMPRESA,9,4)+''-''+                                                                                      '+ slineBreak +
  '   SUBSTRING(EN.CGC_EMPRESA,13,2)                AS [LOCALCNPJ],                                                             '+ slineBreak +
  '   TP.NR_PROCESSO                                AS [PROCESSO],                                                              '+ slineBreak +
  '   SUBSTRING(TP.NR_DI,1,2)+''/''+                                                                                            '+ slineBreak +
  '   SUBSTRING(TP.NR_DI,3,7)+''-''+                                                                                            '+ slineBreak +
  '   SUBSTRING(TP.NR_DI,10,1)                      AS [NDI],                                                                   '+ slineBreak +
  '   CONVERT(VARCHAR(10),EV021.DT_REALIZACAO,103)  AS [DTREGDI],                                                               '+ slineBreak +
  '   REF.REF_CLIENTE                               AS [PEDIDO],                                                                '+ slineBreak +
  '   REF.ITEM_PO                                   AS [ITEM],                                                                  '+ slineBreak +
  '   NF.DANFE                                      AS [NOTAFISCAL],                                                            '+ slineBreak +
  '   NF.CFOP                                       AS [UTILIZMAT],                                                             '+ slineBreak +
  '   ISNULL(ICMS.PRICE,0)                          AS [ICMS],                                                                  '+ slineBreak +
  '   ISNULL(TX.PRICE,0)                            AS [TXSISCOMEX],                                                            '+ slineBreak +
  '   ISNULL(II.PRICE,0)                            AS [II],                                                                    '+ slineBreak +
  '   ISNULL(IPI.PRICE,0)                           AS [IPI],                                                                   '+ slineBreak +
  '   ISNULL(PIS.PRICE,0)                           AS [PIS],                                                                   '+ slineBreak +
  '   ISNULL(COFINS.PRICE,0)                        AS [COFINS],                                                                '+ slineBreak +
  '   ''''                                          AS [PROTOCOLO],                                                             '+ slineBreak +
  '   0                                             AS [ATRIBUICAOICMS],                                                        '+ slineBreak +
  '   0                                             AS [ANTIDUMPING],                                                           '+ slineBreak +
  '   REF_PROTOCOLO.REF                             AS [PROTOCOLO]                                                              '+ slineBreak +
  '   FROM BROKER.DBO.TPROCESSO           TP                                                                                    '+ slineBreak +
  '   JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE CC    ON CC.CUSTOMID       = TP.NR_PROCESSO                                           '+ slineBreak +
  '   JOIN BROKER.DBO.TEMPRESA_NAC        EN    ON EN.CD_EMPRESA     = TP.CD_CLIENTE                                            '+ slineBreak +
  '   JOIN BROKER.DBO.TFOLLOWUP           EV021 ON EV021.NR_PROCESSO = TP.NR_PROCESSO                                           '+ slineBreak +
  '                                            AND EV021.CD_EVENTO   = ''021''                                                  '+ slineBreak +
  '                                            AND EV021.CD_SERVICO  = TP.CD_SERVICO                                            '+ slineBreak +
  '                                                                                                                             '+ slineBreak +
  '   OUTER APPLY (  SELECT TOP 1 LTRIM(RTRIM(R.CD_REFERENCIA)) AS REF_CLIENTE,                                                 '+ slineBreak +
  '                               R.NR_ITEM_PO                  AS ITEM_PO                                                      '+ slineBreak +
  '                    FROM BROKER.DBO.TREF_CLIENTE R (NOLOCK)                                                                  '+ slineBreak +
  '                   WHERE R.TP_REFERENCIA = ''01''                                                                            '+ slineBreak +
  '                     AND R.NR_PROCESSO   = TP.NR_PROCESSO) REF                                                               '+ slineBreak +
  '                                                                                                                             '+ slineBreak +
  '   OUTER APPLY (SELECT CONVERT( VARCHAR(200),                                                                                '+ slineBreak +
  '                       STUFF ((SELECT '','' + LTRIM(RTRIM(R.CD_REFERENCIA))                                                  '+ sLineBreak +
  '                                FROM BROKER.DBO.TREF_CLIENTE R (NOLOCK)                                                      '+ sLineBreak +
  '                               WHERE R.TP_REFERENCIA = ''33''                                                                '+ sLineBreak +
  '                                 AND R.NR_PROCESSO   = TP.NR_PROCESSO                                                        '+ sLineBreak +
  '                      FOR XML PATH('''')), 1, 1, '''')) REF                                                                  '+ sLineBreak +
  '   	    ) REF_PROTOCOLO                                                                                                     '+ sLineBreak +
  '                                                                                                                             '+ slineBreak +
  '   OUTER APPLY (  SELECT TOP 1 PNF.NR_NOTA AS DANFE,                                                                         '+ slineBreak +
  '                               PNF.CD_CFOP AS CFOP                                                                           '+ slineBreak +
  '                    FROM BROKER.DBO.TPROCESSO_NF PNF (NOLOCK)                                                                '+ slineBreak +
  '                   WHERE PNF.NR_PROCESSO = TP.NR_PROCESSO) NF                                                                '+ slineBreak +
  '                                                                                                                             '+ slineBreak +
  '  OUTER APPLY ( SELECT IPR.PRICE                                                                                             '+ slineBreak +
  '                  FROM MYINDAIAV2.DBO.PAYMENTREQUESTED                      PR                                               '+ slineBreak +
  '                  JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYMENTREQUESTED PRIPR ON PRIPR.PAYMENTREQUESTED_ID=PR.ID         '+ slineBreak +
  '                  JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED                  IPR   ON IPR.ID=PRIPR.ITEMS_ID                   '+ slineBreak +
  '                  JOIN MYINDAIAV2.DBO.ITEM                                  I     ON I.ID=IPR.ITEM_ID                        '+ slineBreak +
  '                 WHERE PR.STATUS=''APPROVED''                                                                                '+ slineBreak +
  '                   AND PR.CUSTOMCLEARANCE_ID=CC.ID                                                                           '+ slineBreak +
  '                   AND I.ID=''122'') ICMS                                                                                    '+ slineBreak +
  '                                                                                                                             '+ slineBreak +
  '  OUTER APPLY ( SELECT IPR.PRICE                                                                                             '+ slineBreak +
  '                  FROM MYINDAIAV2.DBO.PAYMENTREQUESTED                      PR                                               '+ slineBreak +
  '                  JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYMENTREQUESTED PRIPR ON PRIPR.PAYMENTREQUESTED_ID=PR.ID         '+ slineBreak +
  '                  JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED                  IPR   ON IPR.ID=PRIPR.ITEMS_ID                   '+ slineBreak +
  '                  JOIN MYINDAIAV2.DBO.ITEM                                  I     ON I.ID=IPR.ITEM_ID                        '+ slineBreak +
  '                 WHERE PR.STATUS=''APPROVED''                                                                                '+ slineBreak +
  '                   AND PR.CUSTOMCLEARANCE_ID=CC.ID                                                                           '+ slineBreak +
  '                   AND I.ID=''217'') TX                                                                                      '+ slineBreak +
  '                                                                                                                             '+ slineBreak +
  '  OUTER APPLY ( SELECT IPR.PRICE                                                                                             '+ slineBreak +
  '                  FROM MYINDAIAV2.DBO.PAYMENTREQUESTED                      PR                                               '+ slineBreak +
  '                  JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYMENTREQUESTED PRIPR ON PRIPR.PAYMENTREQUESTED_ID=PR.ID         '+ slineBreak +
  '                  JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED                  IPR   ON IPR.ID=PRIPR.ITEMS_ID                   '+ slineBreak +
  '                  JOIN MYINDAIAV2.DBO.ITEM                                  I     ON I.ID=IPR.ITEM_ID                        '+ slineBreak +
  '                 WHERE PR.STATUS=''APPROVED''                                                                                '+ slineBreak +
  '                   AND PR.CUSTOMCLEARANCE_ID=CC.ID                                                                           '+ slineBreak +
  '                   AND I.ID=''128'') II                                                                                      '+ slineBreak +
  '                                                                                                                             '+ slineBreak +
  '  OUTER APPLY ( SELECT IPR.PRICE                                                                                             '+ slineBreak +
  '                  FROM MYINDAIAV2.DBO.PAYMENTREQUESTED                      PR                                               '+ slineBreak +
  '                  JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYMENTREQUESTED PRIPR ON PRIPR.PAYMENTREQUESTED_ID=PR.ID         '+ slineBreak +
  '                  JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED                  IPR   ON IPR.ID=PRIPR.ITEMS_ID                   '+ slineBreak +
  '                  JOIN MYINDAIAV2.DBO.ITEM                                  I     ON I.ID=IPR.ITEM_ID                        '+ slineBreak +
  '                 WHERE PR.STATUS=''APPROVED''                                                                                '+ slineBreak +
  '                   AND PR.CUSTOMCLEARANCE_ID=CC.ID                                                                           '+ slineBreak +
  '                   AND I.ID=''124'') IPI                                                                                     '+ slineBreak +
  '                                                                                                                             '+ slineBreak +
  '  OUTER APPLY ( SELECT IPR.PRICE                                                                                             '+ slineBreak +
  '                  FROM MYINDAIAV2.DBO.PAYMENTREQUESTED                      PR                                               '+ slineBreak +
  '                  JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYMENTREQUESTED PRIPR ON PRIPR.PAYMENTREQUESTED_ID=PR.ID         '+ slineBreak +
  '                  JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED                  IPR   ON IPR.ID=PRIPR.ITEMS_ID                   '+ slineBreak +
  '                  JOIN MYINDAIAV2.DBO.ITEM                                  I     ON I.ID=IPR.ITEM_ID                        '+ slineBreak +
  '                 WHERE PR.STATUS=''APPROVED''                                                                                '+ slineBreak +
  '                   AND PR.CUSTOMCLEARANCE_ID=CC.ID                                                                           '+ slineBreak +
  '                   AND I.ID=''167'') PIS                                                                                     '+ slineBreak +
  '                                                                                                                             '+ slineBreak +
  '  OUTER APPLY ( SELECT IPR.PRICE                                                                                             '+ slineBreak +
  '                  FROM MYINDAIAV2.DBO.PAYMENTREQUESTED                      PR                                               '+ slineBreak +
  '                  JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYMENTREQUESTED PRIPR ON PRIPR.PAYMENTREQUESTED_ID=PR.ID         '+ slineBreak +
  '                  JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED                  IPR   ON IPR.ID=PRIPR.ITEMS_ID                   '+ slineBreak +
  '                  JOIN MYINDAIAV2.DBO.ITEM                                  I     ON I.ID=IPR.ITEM_ID                        '+ slineBreak +
  '                 WHERE PR.STATUS=''APPROVED''                                                                                '+ slineBreak +
  '                   AND PR.CUSTOMCLEARANCE_ID=CC.ID                                                                           '+ slineBreak +
  '                   AND I.ID=''41'') COFINS                                                                                   '+ slineBreak +
  '                                                                                                                             '+ slineBreak +
  '   WHERE TP.CD_PRODUTO = ''01''                                                                                              '+ slineBreak +
  '     AND (TP.CD_GRUPO IN (''559''))                                                                                          '+ slineBreak +
  '     AND (EV021.DT_REALIZACAO >= :DATAINICIAL1) AND (EV021.DT_REALIZACAO <= :DATAFINAL1)                                     '+ sLineBreak +
  '                                                                                                                             '+ slineBreak ;

  sql := sql +
  '  ORDER BY [DTREGDI]                                                                                                         '+ slineBreak ;

  result := sql;
end;

procedure TfrmDespesasClienteBASF.Monta(const NomeArquivo: string; DataInicial, DataFinal: TDateTime);
var
  Query: TLocalSQLQuery;
  Inicio: TDateTime;
  Fim: TDateTime;
begin
  Inicio := Now;

  Query := AutoQuery.DBXQuery(GetSQL);
  Query.ParamByName('DATAINICIAL').AsDateTime := DataInicial;
  Query.ParamByName('DATAFINAL').AsDateTime   := DataFinal + 1;
  if chbChemetall.checked then
  begin
    Query.ParamByName('DATAINICIAL1').AsDateTime := DataInicial;
    Query.ParamByName('DATAFINAL1').AsDateTime   := DataFinal + 1;
  end;
  Query.Open;

  ExportaCSV(NomeArquivo, Query);
  Fim := Now;
end;


procedure TfrmDespesasClienteBASF.BitBtn1Click(Sender: TObject);
var
  DataInicial: TDateTime;
  DataFinal: TDateTime;
begin

  if (not chbBasfSa.checked) and (not chbBasfPoliuretanos.checked) and (not chbChemetall.checked) and (not chbBasfCatalisadores.checked) then
  begin
    ShowMessage('Selecione um grupo!');
    exit;
  end;

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

procedure TfrmDespesasClienteBASF.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmDespesasClienteBASF.ExportaCSV(const NomeArquivo: string;
  Query: TLocalSQLQuery);
var
  csv: TCSV;
begin
  csv := TCSV.Create;
  try
      csv.Cabecalho.Text := '"Cia";'                +
                            '"Cod.Despachante";'    +
                            '"Local/CNPJ";'         +
                            '"Processo";'           +
                            '"NºDI";'               +
                            '"Dt. Reg. DI";'        +
                            '"Pedido";'             +
                            '"Item";'               +
                            '"Nota Fiscal";'        +
                            '"UtilizMat";'          +
                            '"ICMS R$";'            +
                            '"Tx.Siscomex R$";'     +
                            '"II R$";'              +
                            '"IPI R$";'             +
                            '"PIS R$";'             +
                            '"COFINS R$";'          +
                            '"Protocolo";'          +
                            '"Atribuição(ICMS)";'   +
                            '"Antidumping";'        +
                            '"Protocolo"' ;

    csv.ConvertCSV(Query, NomeArquivo, False);
  finally
    csv.Free;
  end;
end;

procedure TfrmDespesasClienteBASF.FormShow(Sender: TObject);
begin
  Self.Caption := 'Impostos ' + sEmpresa;
end;

end.



