unit FrDespesasBASF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, KrQuery, ComObj, FMTBcd,
  DBXpress, DB, SqlExpr, Provider, DBClient, DBCtrls;

type
  TfrmDespesasBASF = class(TForm)
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
    Label3: TLabel;
    edtProduto: TEdit;
    cbProduto: TDBLookupComboBox;
    dsProduto: TDataSource;
    cdsProduto: TClientDataSet;
    cdsProdutoCD_PRODUTO: TStringField;
    cdsProdutoNM_PRODUTO: TStringField;
    dspProduto: TDataSetProvider;
    qryProduto: TSQLQuery;
    qryProdutoCD_PRODUTO: TStringField;
    qryProdutoNM_PRODUTO: TStringField;
    SQLConnection: TSQLConnection;
    chbSuvinil: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbProdutoExit(Sender: TObject);
    procedure cbProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtProdutoExit(Sender: TObject);
    procedure cbProdutoCloseUp(Sender: TObject);
  private
    { Private declarations }
    procedure Monta(const NomeArquivo: string; DataInicial, DataFinal: TDateTime);
    function GetSQL: string;
//    procedure PreenchePlanilha(const NomeArquivo: string; Query: TLocalSQLQuery);
    procedure PreencherCodigoProduto;
    procedure BuscarCodigoProduto;
    procedure ExportaCSV(const NomeArquivo: string; Query: TLocalSQLQuery);
  public
    sEmpresa : String;
    sGrupo   : String;
  end;

var
  frmDespesasBASF: TfrmDespesasBASF;

implementation

uses
  KrUtil, MaskUtils, KrCSV;


{$R *.dfm}


{ TfrmDespesasBASF }

function TfrmDespesasBASF.GetSQL: string;
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

  if chbChemetall.checked then
  if sgrupo = '' then
    sgrupo := '''559'''
  else
    sgrupo := sgrupo + ', ' + '''559''';

  if chbSuvinil.checked then
  if sgrupo = '' then
    sgrupo := '''D28'''
  else
    sgrupo := sgrupo + ', ' + '''D28''';

  Sql :=
    '   WITH PAGAMENTOS_APROVADOS AS (                                                                                                                 '+ sLineBreak +
    '    SELECT                                                                                                                                        '+ sLineBreak +
    '    TP.NR_PROCESSO                              AS NR_PROCESSO,                                                                                   '+ sLineBreak +
    '    TP.CD_SERVICO                               AS CD_SERVICO,                                                                                    '+ sLineBreak +
    '    TP.CD_PRODUTO                               AS CD_PRODUTO,                                                                                    '+ sLineBreak +
    '    TP.CD_AREA                                  AS CD_AREA,                                                                                       '+ sLineBreak +
    '    TP.CD_EMP_EST                               AS CD_EMP_EST,                                                                                    '+ sLineBreak +
    '    TP.CD_CLIENTE                               AS CD_CLIENTE,                                                                                    '+ sLineBreak +
    '    TP.CD_CANAL                                 AS CD_CANAL,                                                                                      '+ sLineBreak +
    '    TP.TP_FRETE                                 AS TP_FRETE,                                                                                      '+ sLineBreak +
    '    TP.CD_ARMAZEM_ATRACACAO                     AS CD_ARMAZEM_ATRACACAO,                                                                          '+ sLineBreak +
    '    TP.CD_LOCAL_DESEMBARQUE                     AS CD_LOCAL_DESEMBARQUE,                                                                          '+ sLineBreak +
    '    TP.CD_LOCAL_EMBARQUE                        AS CD_LOCAL_EMBARQUE,                                                                             '+ sLineBreak +
    '    TP.CD_PAIS_ORIGEM                           AS CD_PAIS_ORIGEM,                                                                                '+ sLineBreak +
    '    TP.CD_CONTATO                               AS CD_CONTATO,                                                                                    '+ sLineBreak +
    '    TP.CD_UNID_NEG                              AS CD_UNID_NEG,                                                                                   '+ sLineBreak +
    '    TP.VL_PESO_LIQUIDO                          AS VL_PESO_LIQUIDO,                                                                               '+ sLineBreak +
    '    TP.VL_PESO_BRUTO                            AS VL_PESO_BRUTO,                                                                                 '+ sLineBreak +
    '    TP.TP_ESTUFAGEM                             AS TP_ESTUFAGEM,                                                                                  '+ sLineBreak +
    '                                                                                                                                                  '+ sLineBreak +
    '    PR.RECEIVEDDATE  							             AS DATAPAGAMENTO,                                                                                 '+ sLineBreak +
    '    I.NAME           							             AS DESCRICAODESPESA,                                                                              '+ sLineBreak +
    '    F.NAME           							             AS FAVORECIDO,                                                                                    '+ sLineBreak +
    '    F.TAXID                                     AS FAVORECIDO_CNPJ,                                                                               '+ sLineBreak +
    '    IPR.PRICE        							             AS MONTANTEPAGO,                                                                                  '+ sLineBreak +
    '    CC.CUSTOMID      							             AS REFDESPACHANTE,                                                                                '+ sLineBreak +
    '    (CASE WHEN B.SENIORKEY IS NOT NULL                                                                                                            '+ sLineBreak +
    '          THEN B.SENIORKEY                                                                                                                        '+ sLineBreak +
    '          ELSE B.ID                                                                                                                               '+ sLineBreak +
    '     END)                                       AS NRFATURADESPESA,                                                                               '+ sLineBreak +
    '    B.CREATED                                   AS DATAFATURAMENTO,                                                                               '+ sLineBreak +
    '    TP.NR_DI          							             AS NRDI,                                                                                          '+ sLineBreak +
    '    TP.CD_INCOTERM    							             AS INCOTERM,                                                                                      '+ sLineBreak +
    '    REPLACE(REPLACE(CONVERT(VARCHAR(2000),TP.TX_MERCADORIA), CHAR(10), ''  ''), CHAR(13), ''  '') AS TX_MERCADORIA                                        '+ sLineBreak +
    '    FROM MYINDAIAV2.DBO.PAYMENTREQUESTED                             PR    WITH(NOLOCK)                                                           '+ sLineBreak +
    '     INNER JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYMENTREQUESTED  PRIPR WITH(NOLOCK) ON  PRIPR.PAYMENTREQUESTED_ID  = PR.ID                    '+ sLineBreak +
    '     INNER JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED                   IPR 	WITH(NOLOCK) ON  IPR.ID                     = PRIPR.ITEMS_ID           '+ sLineBreak +
    '     INNER JOIN MYINDAIAV2.DBO.ITEM               		                I   	WITH(NOLOCK) ON  I.ID                       = IPR.ITEM_ID              '+ sLineBreak +
    '     INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE    		                CC  	WITH(NOLOCK) ON  CC.ID                      = PR.CUSTOMCLEARANCE_ID    '+ sLineBreak +
    '     INNER JOIN MYINDAIAV2.DBO.BENEFICIARY        		                F   	WITH(NOLOCK) ON  F.ID                       = PR.BENEFICIARY_ID        '+ sLineBreak +
    '     LEFT JOIN MYINDAIAV2.DBO.BILLING  							                B   	WITH(NOLOCK) ON  B.ID            		        = PR.BILLING_ID            '+ sLineBreak +
    '                                                                                                                                                  '+ sLineBreak +
    '     INNER JOIN BROKER.DBO.TPROCESSO 								                TP  	WITH(NOLOCK) ON  TP.NR_PROCESSO             = CC.CUSTOMID              '+ sLineBreak +
    '     INNER JOIN BROKER.DBO.TGRUPO    								                G 	  WITH(NOLOCK) ON  G.CD_GRUPO                 = TP.CD_GRUPO              '+ sLineBreak +
    '    WHERE PR.STATUS = ''APPROVED''                                                                                                                '+ sLineBreak +
    '     AND (G.CD_GRUPO IN ('+SGRUPO+'))                                                                                                             '+ sLineBreak +
    '     AND  (PR.RECEIVEDDATE >= :DATAINICIAL AND PR.RECEIVEDDATE < :DATAFINAL)                                                                      '+ sLineBreak +
    '     AND TP.CD_PRODUTO = '+QuotedStr(cbProduto.keyvalue)+'                                                                                        '+ sLineBreak +
    '   )                                                                                                                                              '+ sLineBreak +
    '                                                                                                                                                  '+ sLineBreak +
    '                                                                                                                                                  '+ sLineBreak +
    '    SELECT                                                                                                                                        '+ sLineBreak +
    '    DATAPAGAMENTO                                                     AS DATAPAGAMENTO,                                                           '+ sLineBreak +
    '    DESCRICAODESPESA                                                  AS DESCRICAODESPESA,                                                        '+ sLineBreak +
    '    VT.NM_VIA_TRANSP 											                           AS MODAL,                                                                   '+ sLineBreak +
    '    P.NM_PRODUTO     											                           AS IMPOEXPO,                                                                '+ sLineBreak +
    '    FAVORECIDO                                                        AS FAVORECIDO,                                                              '+ sLineBreak +
    '    SUBSTRING(FAVORECIDO_CNPJ,1,2)+ ''.'' +                                                                                                        '+ sLineBreak +
    '    SUBSTRING(FAVORECIDO_CNPJ,3,3)+ ''.'' +                                                                                                        '+ sLineBreak +
    '    SUBSTRING(FAVORECIDO_CNPJ,6,3)+ ''/'' +                                                                                                        '+ sLineBreak +
    '    SUBSTRING(FAVORECIDO_CNPJ,9,4)+ ''-'' +                                                                                                        '+ sLineBreak +
    '    SUBSTRING(FAVORECIDO_CNPJ,13,2)                                   AS FAVORECIDO_CNPJ,                                                                    '+ sLineBreak +
    '    MONTANTEPAGO                                                      AS MONTANTEPAGO,                                                            '+ sLineBreak +
    '    A.NM_AREA        											                           AS AREANEGOCIO,                                                             '+ sLineBreak +
    '    REFDESPACHANTE,                                                                                                                               '+ sLineBreak +
    '    STUFF((SELECT DISTINCT '', '' + LTRIM(RTRIM(R.CD_REFERENCIA))                                                                                  '+ sLineBreak +
    '             FROM TREF_CLIENTE R WITH (NOLOCK)                                                                                                    '+ sLineBreak +
    '            WHERE R.NR_PROCESSO   = TP.NR_PROCESSO                                                                                                '+ sLineBreak +
    '              AND R.TP_REFERENCIA = ''01''                                                                                                        '+ sLineBreak +
    '          FOR XML PATH('''')), 1, 2, '''')                            AS REF,                                                                     '+ sLineBreak +
    '    SUBSTRING(EN.CGC_EMPRESA,1,2)+ ''.'' +                                                                                                        '+ sLineBreak +
    '    SUBSTRING(EN.CGC_EMPRESA,3,3)+ ''.'' +                                                                                                        '+ sLineBreak +
    '    SUBSTRING(EN.CGC_EMPRESA,6,3)+ ''/'' +                                                                                                        '+ sLineBreak +
    '    SUBSTRING(EN.CGC_EMPRESA,9,4)+ ''-'' +                                                                                                        '+ sLineBreak +
    '    SUBSTRING(EN.CGC_EMPRESA,13,2)                                    AS CNPJ,                                                                    '+ sLineBreak +
    '    NRFATURADESPESA                                                   AS NRFATURADESPESA,                                                         '+ sLineBreak +
    '    DATAFATURAMENTO                                                   AS DATAFATURAMENTO,                                                         '+ sLineBreak +
    '    FUP.DT_REALIZACAO 											                           AS DATADESEMBARAC,                                                          '+ sLineBreak +
    '    NRDI                                                              AS NRDI,                                                                    '+ sLineBreak +
    '    INCOTERM,                                                                                                                                     '+ sLineBreak +
    '    (CASE WHEN EE.NM_EMPRESA IS NOT NULL                                                                                                          '+ sLineBreak +
    '          THEN EE.NM_EMPRESA                                                                                                                      '+ sLineBreak +
    '          ELSE EN.NM_EMPRESA                                                                                                                      '+ sLineBreak +
    '      END)                                                            AS EXPORTADOR                                                               '+ sLineBreak +
    '                                                                                                                                                  '+ sLineBreak ;

    if cbProduto.keyvalue = '01' then  //campos apenas para importação
      sql := sql +
    '    ,EN.NM_EMPRESA                                                    AS IMPORTADOR,                                                              '+ sLineBreak +
    '     CONT.NM_CONTATO                                                  AS CONTATO,                                                                 '+ sLineBreak +
    '     TLE.DESCRICAO                                                    AS PORTO_AEROPORTO_ORIGEM,                                                  '+ sLineBreak +
    '     TPO.DESCRICAO                                                    AS PAIS_ORIGEM,                                                             '+ sLineBreak +
    '     TLD.DESCRICAO                                                    AS PORTO_AEROPORTO_DESTINO,                                                 '+ sLineBreak +
    '                                                                                                                                                  '+ sLineBreak +
    '    CONVERT(VARCHAR(999),STUFF((SELECT DISTINCT '', '' + LTRIM(RTRIM(DI.CD_MERCADORIA))                                                           '+ sLineBreak +
    '             FROM TDETALHE_MERCADORIA DI WITH (NOLOCK)                                                                                            '+ sLineBreak +
    '            WHERE DI.NR_PROCESSO = TP.NR_PROCESSO                                                                                                 '+ sLineBreak +
    '          FOR XML PATH('''')), 1, 2, ''''))                            AS [COD_MERCADORIA],                                                       '+ sLineBreak +
    '                                                                                                                                                  '+ sLineBreak +

  {  '    CONVERT(VARCHAR(1000), STUFF((SELECT DISTINCT '', '' + LTRIM(RTRIM(MERC.AP_MERCADORIA))                                                      '+ sLineBreak +
    '             FROM TDETALHE_MERCADORIA DI   WITH(NOLOCK)                                                                                           '+ sLineBreak +
    '             JOIN TMERCADORIA         MERC WITH(NOLOCK) ON MERC.CD_MERCADORIA = DI.CD_MERCADORIA                                                  '+ sLineBreak +
    '            WHERE DI.NR_PROCESSO = TP.NR_PROCESSO                                                                                                 '+ sLineBreak +
    '          FOR XML PATH('''')), 1, 2, ''''))                            AS [MERCADORIA],                                                           '+ sLineBreak +}

    '    TP.TX_MERCADORIA                                                  AS [MERCADORIA],                                                                             '+ sLineBreak +
    '    CONVERT(VARCHAR(999), STUFF((SELECT DISTINCT '', '' + LTRIM(RTRIM(DI.CD_NCM_SH))                                                             '+ sLineBreak +
    '             FROM TDETALHE_MERCADORIA DI WITH (NOLOCK)                                                                                            '+ sLineBreak +
    '            WHERE DI.NR_PROCESSO = TP.NR_PROCESSO                                                                                                 '+ sLineBreak +
    '          FOR XML PATH('''')), 1, 2, ''''))                           AS [NCM_SH],                                                                '+ sLineBreak +
    '                                                                                                                                                  '+ sLineBreak +
    '     TP.VL_PESO_LIQUIDO                                               AS [PESO_LIQUIDO],                                                          '+ sLineBreak +
    '     TP.VL_PESO_BRUTO                                                 AS [PESO_BRUTO],                                                            '+ sLineBreak +
    '     TAA.NM_ARMAZEM                                                   AS [ARMAZEM_ATRACACAO],                                                     '+ sLineBreak +
    '     TC.NM_CANAL                                                      AS [CANAL_LIBERACAO],                                                       '+ sLineBreak +
    '     TF.DESCRICAO                                                     AS [TIPO_FRETE],                                                            '+ sLineBreak +
    '                                                                                                                                                  '+ sLineBreak +
    '     CASE                                                                                                                                         '+ sLineBreak +
    '     WHEN TP.TP_ESTUFAGEM=''0'' THEN ''SEM CONTAINER''                                                                                            '+ sLineBreak +
    '     WHEN TP.TP_ESTUFAGEM=''1'' THEN  STUFF((SELECT DISTINCT '','' + LTRIM(RTRIM(CT.NR_CNTR))                                                     '+ sLineBreak +
    '   										  FROM TPROCESSO_CNTR CT WITH (NOLOCK)                                                                                     '+ sLineBreak +
    '   										 WHERE CT.NR_PROCESSO = TP.NR_PROCESSO                                                                                     '+ sLineBreak +
    '   									   FOR XML PATH('''')), 1, 1, '''')                                                                                          '+ sLineBreak +
    '     WHEN TP.TP_ESTUFAGEM=''2'' THEN ''SEM CONTAINER''                                                                                            '+ sLineBreak +
    '     END                                                              AS [NR_CONTAINER],                                                          '+ sLineBreak +
    '                                                                                                                                                  '+ sLineBreak +
    '     CASE                                                                                                                                         '+ sLineBreak +
    '     WHEN TP.TP_ESTUFAGEM=''0'' THEN ''LCL''                                                                                                      '+ sLineBreak +
    '     WHEN TP.TP_ESTUFAGEM=''1'' THEN ''FCL''                                                                                                      '+ sLineBreak +
    '     WHEN TP.TP_ESTUFAGEM=''2'' THEN ''CARGA SOLTA''                                                                                              '+ sLineBreak +
    '     END                                                              AS [ESTUFAGEM],                                                             '+ sLineBreak +
    '                                                                                                                                                  '+ sLineBreak +
    '     CONVERT(VARCHAR(10),EV162.DT_REALIZACAO,103)                     AS [CHEGADA_NAVIO],                                                         '+ sLineBreak +
    '     CONVERT(VARCHAR(10),EV021.DT_REALIZACAO,103)                     AS [REGISTRO_DI_SISCO],                                                     '+ sLineBreak +
    '     CONVERT(VARCHAR(10),EV041.DT_REALIZACAO,103)                     AS [LIBERACAO_TRANSP]                                                       '+ sLineBreak ;


    sql := sql +
    '     FROM PAGAMENTOS_APROVADOS TP                                                                                                                 '+ sLineBreak +
    '    INNER JOIN BROKER.DBO.TEMPRESA_NAC 	   	  EN  	  WITH(NOLOCK) ON EN.CD_EMPRESA   		  = TP.CD_CLIENTE                                      '+ sLineBreak +
    '    INNER JOIN BROKER.DBO.TSERVICO_NOVO 	   	  SN  	  WITH(NOLOCK) ON SN.CD_SERVICO         = TP.CD_SERVICO                                      '+ sLineBreak +
    '    INNER JOIN BROKER.DBO.TVIA_TRANSP_BROKER   VT  	  WITH(NOLOCK) ON VT.CD_VIA_TRANSP      = SN.CD_VIA_TRANSPORTE                               '+ sLineBreak +
    '    INNER JOIN BROKER.DBO.TPRODUTO     	   	  P   	  WITH(NOLOCK) ON P.CD_PRODUTO    		  = TP.CD_PRODUTO                                      '+ sLineBreak +
    '    INNER JOIN BROKER.DBO.TAREA        		    A   	  WITH(NOLOCK) ON A.CD_AREA       		  = TP.CD_AREA                                         '+ sLineBreak +
    '     LEFT JOIN BROKER.DBO.TEMPRESA_EST 		    EE      WITH(NOLOCK) ON EE.CD_EMPRESA   		  = TP.CD_EMP_EST                                      '+ sLineBreak +
    '     LEFT JOIN BROKER.DBO.TFOLLOWUP    		    FUP 	  WITH(NOLOCK) ON FUP.NR_PROCESSO 		  = TP.NR_PROCESSO                                     '+ sLineBreak +
    '                                                     			        AND FUP.CD_SERVICO        = TP.CD_SERVICO                                      '+ sLineBreak +
    '                                                     			        AND FUP.CD_EVENTO         = ''088''                                            '+ sLineBreak ;

    if cbProduto.keyvalue = '01' then  //importação
      sql := sql +
    '     LEFT JOIN BROKER.DBO.TFOLLOWUP            EV021   WITH(NOLOCK) ON EV021.NR_PROCESSO     = TP.NR_PROCESSO                                     '+ sLineBreak +
    '                                                                   AND EV021.CD_EVENTO       = ''021''                                            '+ sLineBreak +
    '    														                                    AND EV021.CD_SERVICO      = TP.CD_SERVICO                                      '+ sLineBreak +
    '     LEFT JOIN BROKER.DBO.TFOLLOWUP            EV041   WITH(NOLOCK) ON EV041.NR_PROCESSO     = TP.NR_PROCESSO                                     '+ sLineBreak +
    '                                                                   AND EV041.CD_EVENTO       = ''041''                                            '+ sLineBreak +
    '    														                                    AND EV041.CD_SERVICO      = TP.CD_SERVICO                                      '+ sLineBreak +
    '     LEFT JOIN BROKER.DBO.TFOLLOWUP            EV162   WITH(NOLOCK) ON EV162.NR_PROCESSO     = TP.NR_PROCESSO                                     '+ sLineBreak +
    '                                                                   AND EV162.CD_EVENTO       = ''162''                                            '+ sLineBreak +
    '    														                                    AND EV162.CD_SERVICO      = TP.CD_SERVICO                                      '+ sLineBreak +
    '     LEFT JOIN BROKER.DBO.TTP_CANAL            TC      WITH(NOLOCK) ON TC.CD_CANAL           = TP.CD_CANAL                                        '+ sLineBreak +
    '     LEFT JOIN BROKER.DBO.TTP_FRETE            TF      WITH(NOLOCK) ON TF.CODIGO             = TP.TP_FRETE                                        '+ sLineBreak +
    '     LEFT JOIN BROKER.DBO.TARMAZEM             TAA     WITH(NOLOCK) ON TAA.CD_ARMAZEM        = TP.CD_ARMAZEM_ATRACACAO                            '+ sLineBreak +
    '     LEFT JOIN BROKER.DBO.TLOCAL_EMBARQUE      TLD     WITH(NOLOCK) ON TLD.CODIGO            = TP.CD_LOCAL_DESEMBARQUE                            '+ sLineBreak +
    '     LEFT JOIN BROKER.DBO.TLOCAL_EMBARQUE      TLE     WITH(NOLOCK) ON TLE.CODIGO            = TP.CD_LOCAL_EMBARQUE                               '+ sLineBreak +
    '     LEFT JOIN BROKER.DBO.TPAIS                TPO     WITH(NOLOCK) ON TPO.CODIGO            = TP.CD_PAIS_ORIGEM                                  '+ sLineBreak +
    '     LEFT JOIN BROKER.DBO.TCLIENTE_CONTATO     CONT    WITH(NOLOCK) ON CONT.CD_CONTATO       = TP.CD_CONTATO                                      '+ sLineBreak +
    '                                                                   AND TP.CD_CLIENTE         = CONT.CD_CLIENTE                                    '+ sLineBreak +
    '                                                                   AND TP.CD_UNID_NEG        = CONT.CD_UNID_NEG                                   '+ sLineBreak +
    '                                                                   AND TP.CD_PRODUTO         = CONT.CD_PRODUTO                                    '+ sLineBreak ;
    result := sql;
end;

procedure TfrmDespesasBASF.Monta(const NomeArquivo: string; DataInicial, DataFinal: TDateTime);
var
  Query: TLocalSQLQuery;
  Inicio: TDateTime;
  Fim: TDateTime;
begin
  Inicio := Now;

  Query  := AutoQuery.DBXQuery(GetSQL);
  Query.ParamByName('DATAINICIAL').AsDateTime := DataInicial;
  Query.ParamByName('DATAFINAL').AsDateTime   := DataFinal + 1;
  Query.Open;

  ExportaCSV(NomeArquivo, Query);
  Fim := Now;
end;


procedure TfrmDespesasBASF.BitBtn1Click(Sender: TObject);
var
  DataInicial: TDateTime;
  DataFinal: TDateTime;
begin

  if (not chbBasfSa.checked) and (not chbBasfPoliuretanos.checked) and (not chbChemetall.checked) and (not chbSuvinil.checked) then
  begin
    ShowMessage('Selecione um grupo!');
    exit;
  end;

  if (cbProduto.keyvalue = null) or (cbProduto.keyvalue = '') then
  begin
    ShowMessage('Selecione o produto!');
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

procedure TfrmDespesasBASF.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmDespesasBASF.ExportaCSV(const NomeArquivo: string;
  Query: TLocalSQLQuery);
var
  csv: TCSV;
begin
  csv := TCSV.Create;
  try
    if cbProduto.keyvalue = '01' then  //importação
    begin
      csv.Cabecalho.Text := '"Data do Pagamento";'+
                            '"Descrição da Despesa";'+
                            '"Modal";'+
                            '"Impo/Expo";'+
                            '"Favorecido";'+
                            '"CNPJ Favorecido";'+
                            '"Montante Pago em R$";'+
                            '"Área de negócio '+sEmpresa+'";'+
                            '"Ref. Despachante";'+
                            '"Ref. '+sEmpresa+'";'+
                            '"CNPJ '+sEmpresa+'";'+
                            '"Nr. Fatura de Despesa";'+
                            '"Data do Faturamento";'+
                            '"Data do Desembaraço";'+
                            '"Nr. DI";'+
                            '"Incoterm";'+
                            '"Exportador";'+
                            '"Importador";'+
                            '"Contato";'+
                            '"Porto / Aeroporto de Origem";'+
                            '"País de Origem";'+
                            '"Porto / Aeroporto de Destino";'+
                            '"Cód. Mercadoria";'+
                            '"Mercadoria (Item da DI)";'+
                            '"NCM / SH (DI)";'+
                            '"Peso Líquido (DI)";'+
                            '"Peso Bruto";'+
                            '"Armazém Atracação";'+
                            '"Canal de Liberação";'+
                            '"Tipo Frete";'+
                            '"Nr. Contâiner";'+
                            '"Estufagem";'+
                            '"Chegada do Navio / Avião / Caminhão";'+
                            '"Registro DI/DA SISCOMEX";'+
                            '"Liberação do processo para a Transportadora"';
    end
    else
    begin
      csv.Cabecalho.Text := '"Data do Pagamento";'+
                            '"Descrição da Despesa";'+
                            '"Modal";'+
                            '"Impo/Expo";'+
                            '"Favorecido";'+
                            '"CNPJ Favorecido";'+
                            '"Montante Pago em R$";'+
                            '"Área de negócio '+sEmpresa+'";'+
                            '"Ref. Despachante";'+
                            '"Ref. '+sEmpresa+'";'+
                            '"CNPJ '+sEmpresa+'";'+
                            '"Nr. Fatura de Despesa";'+
                            '"Data do Faturamento";'+
                            '"Data do Desembaraço";'+
                            '"Nr. DI";'+
                            '"Incoterm";'+
                            '"Exportador"';
    end;

    csv.ConvertCSV(Query, NomeArquivo, False);
  finally
    csv.Free;
  end;
end;

procedure TfrmDespesasBASF.FormShow(Sender: TObject);
begin
  Self.Caption := 'Despesas ' + sEmpresa;
end;

procedure TfrmDespesasBASF.FormCreate(Sender: TObject);
begin
  qryProduto.close;
  cdsProduto.close;
  qryProduto.open;
  cdsProduto.open;
end;

procedure TfrmDespesasBASF.cbProdutoExit(Sender: TObject);
begin
  PreencherCodigoProduto;
end;

procedure TfrmDespesasBASF.cbProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    cbProduto.KeyValue := '';
end;

procedure TfrmDespesasBASF.edtProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN  then
  begin
    BuscarCodigoProduto;
  end;
end;

procedure TfrmDespesasBASF.edtProdutoExit(Sender: TObject);
begin
  BuscarCodigoProduto;
end;

procedure TfrmDespesasBASF.cbProdutoCloseUp(Sender: TObject);
begin
  PreencherCodigoProduto;
end;

procedure TfrmDespesasBASF.BuscarCodigoProduto;
begin
  if cdsProduto.Locate('CD_PRODUTO', edtProduto.Text, []) then
     cbProduto.KeyValue := cdsProduto.fieldbyName('CD_PRODUTO').AsString
  else
    cbProduto.KeyValue := '';
end;

procedure TfrmDespesasBASF.PreencherCodigoProduto;
begin
 if not ((cbProduto.KeyValue = '') or (cbProduto.KeyValue = null)) then
    edtProduto.Text := cdsProduto.fieldbyName('CD_PRODUTO').AsString
 else
    edtProduto.Text := '';
end;

end.



