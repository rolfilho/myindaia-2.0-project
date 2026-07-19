unit FrmRlTM_BASFCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, ComCtrls, FMTBcd, DBXpress,
  DB, SqlExpr, DBClient, Provider, DBCtrls;

type
  TFormRlTM_BASFCtx = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pgFiltros: TPageControl;
    tbExpo: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    mskDataregistroIni: TMaskEdit;
    mskDataregistroFin: TMaskEdit;
    tbImpo: TTabSheet;
    edtQtDias: TEdit;
    Label3: TLabel;
    Panel2: TPanel;
    lblNrProcesso: TLabel;
    lblUnidadeNeg: TLabel;
    Label4: TLabel;
    edtNrProcesso: TEdit;
    edUnidade: TEdit;
    cbUnidade: TDBLookupComboBox;
    edtProduto: TEdit;
    cbProduto: TDBLookupComboBox;
    qryProduto: TSQLQuery;
    qryProdutoCD_PRODUTO: TStringField;
    qryProdutoNM_PRODUTO: TStringField;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    cdsProdutoCD_PRODUTO: TStringField;
    cdsProdutoNM_PRODUTO: TStringField;
    dsProduto: TDataSource;
    qryUnidadeNeg: TSQLQuery;
    qryUnidadeNegCD_UNID_NEG: TStringField;
    qryUnidadeNegNM_UNID_NEG: TStringField;
    dspUnidadeNeg: TDataSetProvider;
    cdsUnidadeNeg: TClientDataSet;
    cdsUnidadeNegCD_UNID_NEG: TStringField;
    cdsUnidadeNegNM_UNID_NEG: TStringField;
    dsUnidadeNeg: TDataSource;
    SQLConnection: TSQLConnection;
    Label5: TLabel;
    btnLimpar: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtQtDiasKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edUnidadeExit(Sender: TObject);
    procedure edUnidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbUnidadeCloseUp(Sender: TObject);
    procedure cbUnidadeExit(Sender: TObject);
    procedure cbUnidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtProdutoExit(Sender: TObject);
    procedure edtProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbProdutoCloseUp(Sender: TObject);
    procedure cbProdutoExit(Sender: TObject);
    procedure cbProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLimparClick(Sender: TObject);
  private
  //  DataInicial: TDateTime;
   // DataFinal: TDateTime;
   DataInicial: String;
   DataFinal: String;

    procedure BuscarCodigoProduto;
    procedure BuscarCodigoUnidadeNeg;
    procedure PreencherCodigoProduto;
    procedure PreencherCodigoUnidadeNeg;
  function GetSelect(Tipo :String): string;
  public
    TipoRelatorio : String;
  end;

var
  FormRlTM_BASFCtx: TFormRlTM_BASFCtx;

implementation

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery,  GSMLIB, KrGlobal;

{$R *.dfm}

procedure TFormRlTM_BASFCtx.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
begin
  Form := TfmConsulta.Create(nil);
  try
    if TipoRelatorio <> 'I' then
    begin
      DataInicial := FormatDateTime('yyyy/mm/dd', StrtoDate(mskDataregistroIni.text))+ ' 00:00';
                    // StrToDateTimeDef(mskDataregistroIni.Text, 0);
      DataFinal   :=  FormatDateTime('yyyy/mm/dd', StrtoDate(mskDataregistroFin.text))+ ' 23:59';
                    //StrToDateTimeDef(mskDataregistroFin.Text, 0);
    end;

    Form.TituloRelatorio := 'TM-BASF';

    Form.Titulocoluna.Add('SERVICO=Serviço');
    Form.Titulocoluna.Add('SBU=SBU');
    Form.Titulocoluna.Add('IMPOEXPO=Importador ou Exportador');
    Form.Titulocoluna.Add('PEDIDOIMPORTAO=Pedido de Importação ou Documento Transporte');
    Form.Titulocoluna.Add('DESPACHANTE=Despachante');
    Form.Titulocoluna.Add('REFDESPACHANTE=Ref. Despachante');
    Form.Titulocoluna.Add('PRODUTOS=Produtos');
    Form.Titulocoluna.Add('NRNOTA=Nr da Nota Fiscal');
    Form.Titulocoluna.Add('TIPOCONTAINER=Tipo do Container');
    Form.Titulocoluna.Add('NRCONTAINER=Nr Container ou Carga Solta');
    Form.Titulocoluna.Add('TERMINALCARGA=Terminal de Carga (Coleta ou Entrega)');
    Form.Titulocoluna.Add('TRANSPORTADORA=Tansportadora');
    Form.Titulocoluna.Add('DTCHEGADA=Chegada (Importação) ou Saída (Exportação)');
    Form.Titulocoluna.Add('DTPRESENCA=Data Presença de Carga');
    Form.Titulocoluna.Add('DTDESEMBARACO=Data Desembaraço');
    Form.Titulocoluna.Add('DTLIBERACAO=Data Liberação dos Docts');
    Form.Titulocoluna.Add('DIBOOKING=DI ou Booking');
    form.TituloColuna.Add('DTNECESSIDADE=Data de Necessidade');

    if TipoRelatorio = 'I' then
    begin
      form.TituloColuna.Add('ARMADOR=Armador');
      form.TituloColuna.Add('EXPORTADOR=Exportador');
      form.TituloColuna.Add('INFRETEACORDADO=GLOSUM');
      form.TituloColuna.Add('TCO=TCO');
    end;

    Form.FormatacaoEspecial.Add('DTCHEGADA=dd/mm/yyyy');
    Form.FormatacaoEspecial.Add('DTPRESENCA=dd/mm/yyyy');
    Form.FormatacaoEspecial.Add('DTDESEMBARACO=dd/mm/yyyy');
    Form.FormatacaoEspecial.Add('DTLIBERACAO=dd/mm/yyyy');
    Form.FormatacaoEspecial.Add('DTNECESSIDADE=dd/mm/yyyy');

    if  (((mskDataregistroIni.text <> '  /  /    ') and (mskDataregistroFin.text <> '  /  /    ')) or (TipoRelatorio = 'I')) then
    begin
      if (TipoRelatorio <> 'I') then
      begin
        if (StrtoDate(mskDataregistroIni.text) >  StrtoDate(mskDataregistroFin.text))  then
        begin
          MessageDlg('Data inicial de Solicitação maior que a data final.', mtWarning, [mbOK], 0);
          Exit;
        end;
      end;
    end
    else
    begin
      ShowMessage('Período obrigatório!');
     Exit;
    end;

    if trim(edtNrProcesso.text) <> '' then
    begin
      if length(trim(edUnidade.text)) < 2 then
      begin
          MessageDlg('Selecione a unidade', mtWarning, [mbOK], 0);
          Exit;
      end;
      if length(trim(edtProduto.text)) < 2 then
      begin
          MessageDlg('Selecione a unidade', mtWarning, [mbOK], 0);
          Exit;
      end;
    end;

    Form.qryMain.SQL.Text := GetSelect(TipoRelatorio);
    Form.Executa;
  finally
    Form.Free;
  end;
end;

procedure TFormRlTM_BASFCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

function TFormRlTM_BASFCtx.GetSelect(Tipo :String): string;
var
  Sql,qt_dias, nr_processo: String;
begin
  if trim(edtQtDias.text) = '' then
    qt_dias := '10'
  else
    qt_dias := edtQtDias.text;

  if trim(edtNrProcesso.text) <> '' then
    nr_processo := trim(edUnidade.text) + trim(edtProduto.text) + trim(edtNrProcesso.text)
  else
    nr_processo := '';

  if Tipo = 'I' then
  begin
       Sql :=
    '  SELECT                                                                                                                ' + sLineBreak +
    '  PR.CD_PRODUTO                                                   AS [SERVICO],                                         ' + sLineBreak +
    '  RTRIM(A.NM_AREA)                                                AS [SBU],                                             ' + sLineBreak +
    '  RTRIM(EN.CGC_EMPRESA)                                           AS [IMPOEXPO],                                        ' + sLineBreak +
    '  PED.PEDIDOIMPORTAO                                              AS [PEDIDOIMPORTAO],                                  ' + sLineBreak +
    '  RTRIM(UN.CGC_UNID_NEG)                                          AS [DESPACHANTE],                                     ' + sLineBreak +
    '  RTRIM(PR.NR_PROCESSO)                                           AS [REFDESPACHANTE],                                  ' + sLineBreak +
    '  RTRIM(CAST(PR.TX_MERCADORIA AS NVARCHAR(MAX)))                  AS [PRODUTOS],                                        ' + sLineBreak +
    '  NF.NRNOTA,                                                                                                            ' + sLineBreak +
    '  CASE WHEN PR.TP_ESTUFAGEM <>''1''                                                                                     ' + sLineBreak +
    '      THEN ''01''                                                                                                       ' + sLineBreak +
    '      ELSE CT.TP_CNTR                                                                                                   ' + sLineBreak +
    '  END                                                             AS [TIPOCONTAINER],                                   ' + sLineBreak +
    '  ISNULL(CASE WHEN CT.TP_CNTR      = ''01'' THEN CONVERT(VARCHAR(15),CS.VL_QTDE)+'' ''+(CS.NM_ESPECIE)                  ' + sLineBreak +
    '              WHEN PR.TP_ESTUFAGEM <>''1''  THEN CONVERT(VARCHAR(15),CS.VL_QTDE)+'' ''+(CS.NM_ESPECIE)                  ' + sLineBreak +
    '              ELSE CT.NR_CNTR                                                                                           ' + sLineBreak +
    '         END,''CARGA SOLTA'')                                     AS [NRCONTAINER],                                     ' + sLineBreak +
    '  ISNULL(RTRIM(AD.CD_RECINTO),''0000000'')                        AS [TERMINALCARGA],                                   ' + sLineBreak +
    '  RTRIM(TR.CNPJ_TRANSP_ROD)                                       AS [TRANSPORTADORA],                                  ' + sLineBreak +
    '  F161.DT_REALIZACAO                                              AS [DTCHEGADA],                                       ' + sLineBreak +
    '  F012.DT_REALIZACAO                                              AS [DTPRESENCA],                                      ' + sLineBreak +
    '  F088.DT_REALIZACAO                                              AS [DTDESEMBARACO],                                   ' + sLineBreak +
    '  F041.DT_REALIZACAO                                              AS [DTLIBERACAO],                                     ' + sLineBreak + 
    '  RTRIM(PR.NR_DI)                                                 AS [DIBOOKING],                                       ' + sLineBreak +
    '  F205.DT_REALIZACAO                                              AS [DTNECESSIDADE],                                   ' + sLineBreak +
    '  ARM.DESCRICAO                                                   AS [ARMADOR],                                         ' + sLineBreak +
    '  EXPORTADOR.NM_EMPRESA                                           AS [EXPORTADOR],                                      ' + sLineBreak +
    '  ISNULL(PR.IN_FRETE_ACORDADO, ''0'')                             AS [INFRETEACORDADO],                                 ' + sLineBreak +
    '  TCO.DESCRICAO                                                   AS [TCO]                                              ' + sLineBreak +  
    '  FROM BROKER.DBO.TPROCESSO                  PR   (NOLOCK)                                                              ' + sLineBreak +
    '       JOIN BROKER.DBO.TFOLLOWUP             F041 (NOLOCK) ON F041.NR_PROCESSO  = PR.NR_PROCESSO                        ' + sLineBreak +
    '                                                          AND F041.CD_SERVICO   = PR.CD_SERVICO                         ' + sLineBreak + 
    '                                                          AND F041.CD_EVENTO    = ''041''                               ' + sLineBreak + 
    '                                                          AND F041.IN_APLICAVEL = 1                                     ' + sLineBreak + 
    '       JOIN BROKER.DBO.TFOLLOWUP             F161 (NOLOCK) ON F161.NR_PROCESSO  = PR.NR_PROCESSO                        ' + sLineBreak +
    '                                                          AND F161.CD_SERVICO   = PR.CD_SERVICO                         ' + sLineBreak +
    '                                                          AND F161.CD_EVENTO    = ''161''                               ' + sLineBreak +
    '                                                          AND F161.IN_APLICAVEL = 1                                     ' + sLineBreak + 
    '       JOIN BROKER.DBO.TFOLLOWUP             F082 (NOLOCK) ON F082.NR_PROCESSO  = PR.NR_PROCESSO                        ' + sLineBreak +
    '                                                          AND F082.CD_SERVICO   = PR.CD_SERVICO                         ' + sLineBreak +
    '                                                          AND F082.CD_EVENTO    = ''082''                               ' + sLineBreak +
    '                                                          AND F082.IN_APLICAVEL = 1                                     ' + sLineBreak +
    '  LEFT JOIN BROKER.DBO.TAREA                 A    (NOLOCK) ON A.CD_AREA         = PR.CD_AREA                            ' + sLineBreak + 
    '  LEFT JOIN BROKER.DBO.TEMPRESA_NAC          EN   (NOLOCK) ON EN.CD_EMPRESA     = PR.CD_CLIENTE                         ' + sLineBreak + 
    '  LEFT JOIN BROKER.DBO.TUNID_NEG             UN   (NOLOCK) ON UN.CD_UNID_NEG    = PR.CD_UNID_NEG                        ' + sLineBreak +
    '  LEFT JOIN BROKER.DBO.TPROCESSO_CNTR        CT   (NOLOCK) ON CT.NR_PROCESSO    = PR.NR_PROCESSO                        ' + sLineBreak +
    '  LEFT JOIN BROKER.DBO.TPROCESSO_CARGA_SOLTA CS   (NOLOCK) ON CS.NR_PROCESSO    = PR.NR_PROCESSO                        ' + sLineBreak + 
    '  LEFT JOIN BROKER.DBO.TARMAZEM              AD   (NOLOCK) ON AD.CD_ARMAZEM     = PR.CD_ARMAZEM_DESCARGA                ' + sLineBreak + 
    '  LEFT JOIN BROKER.DBO.TTRANSP_ROD           TR   (NOLOCK) ON TR.CD_TRANSP_ROD  = PR.CD_TRANSP_NAC                      ' + sLineBreak + 
    '  LEFT JOIN BROKER.DBO.TFOLLOWUP             F012 (NOLOCK) ON F012.NR_PROCESSO  = PR.NR_PROCESSO                        ' + sLineBreak +
    '                                                          AND F012.CD_SERVICO   = PR.CD_SERVICO                         ' + sLineBreak + 
    '                                                          AND F012.CD_EVENTO    = ''012''                               ' + sLineBreak + 
    '  LEFT JOIN BROKER.DBO.TFOLLOWUP             F088 (NOLOCK) ON F088.NR_PROCESSO  = PR.NR_PROCESSO                        ' + sLineBreak + 
    '                                                          AND F088.CD_SERVICO   = PR.CD_SERVICO                         ' + sLineBreak +
    '                                                          AND F088.CD_EVENTO    = ''088''                               ' + sLineBreak +
    '  LEFT JOIN BROKER.DBO.TFOLLOWUP             F205 (NOLOCK) ON F205.NR_PROCESSO  = PR.NR_PROCESSO                        ' + sLineBreak + 
    '                                                          AND F205.CD_SERVICO   = PR.CD_SERVICO                         ' + sLineBreak +
    '                                                          AND F205.CD_EVENTO    = ''205''                               ' + sLineBreak +
    '  OUTER APPLY( SELECT STUFF((SELECT DISTINCT '', '' + RTRIM(RCP.CD_REFERENCIA)+''/''+(RCP.NR_ITEM_PO)                   ' + sLineBreak +
    '                               FROM TREF_CLIENTE RCP   (NOLOCK)                                                         ' + sLineBreak +
    '                              WHERE RCP.TP_REFERENCIA  =''01''                                                          ' + sLineBreak +
    '                                AND RCP.NR_PROCESSO    = PR.NR_PROCESSO                                                 ' + sLineBreak +
    '                       FOR XML PATH('''')), 1, 1, '''') AS PEDIDOIMPORTAO  ) PED                                        ' + sLineBreak +
    '  OUTER APPLY( SELECT  STUFF((SELECT DISTINCT '','' + RTRIM(NF.NR_NOTA)                                                 ' + sLineBreak +
    '                                FROM TPROCESSO_NF NF (NOLOCK)                                                           ' + sLineBreak +
    '                                WHERE NF.NR_PROCESSO    = PR.NR_PROCESSO                                                ' + sLineBreak +
    '                             FOR XML PATH('''')), 1, 1, '''') AS [NRNOTA]  ) NF                                         ' + sLineBreak +
    '  LEFT JOIN BROKER.DBO.TTRANSPORTADOR_ITL     ARM  (NOLOCK) ON ARM.CODIGO         = PR.CD_TRANSPORTADOR                 ' + sLineBreak +
    '  LEFT JOIN BROKER.DBO.TTRANSPORTADOR_ITL     TCO  (NOLOCK) ON TCO.CODIGO         = PR.CD_OPERADOR_TANQUE               ' + sLineBreak +
    '   OUTER APPLY (SELECT TOP 1 EXPORT.NM_EMPRESA                                                                          ' + sLineBreak +
    '              FROM TEXPORTADOR_DI EXPDI   (NOLOCK),                                                                     ' + sLineBreak +
    '                   TEMPRESA_EST   EXPORT  (NOLOCK)                                                                      ' + sLineBreak +
    '             WHERE EXPORT.CD_EMPRESA = EXPDI.CD_EXPORTADOR                                                              ' + sLineBreak +
    '               AND EXPDI.NR_PROCESSO = PR.NR_PROCESSO) AS EXPORTADOR                                                    ' + sLineBreak +
    '   WHERE PR.CD_GRUPO IN (''002'',''013'', ''559'')                                                                      ' + sLineBreak +
    '     AND PR.CD_PRODUTO   = ''01''                                                                                       ' + sLineBreak +
    '     AND PR.CD_SERVICO NOT IN (''5'',''17'',''22'')                                                                     ' + sLineBreak +
    '     AND PR.IN_CANCELADO = 0                                                                                            ' + sLineBreak ;

      if nr_processo <> '' then
       sql := sql +
    '     AND PR.NR_PROCESSO = ' + QuotedStr(nr_processo)
      else
       sql := sql +
    '     AND (   (     F041.DT_REALIZACAO IS NULL                                                                           ' + sLineBreak +
    '               AND F161.DT_REALIZACAO IS NOT NULL                                                                       ' + sLineBreak +
    '               AND F082.DT_REALIZACAO IS NOT NULL                                                                       ' + sLineBreak +
    '              ) /* PROCESSOS QUE ESTÃO SEM O EVENTO 041 PREENCHIDO E QUE O EVENTO 161 ESTEJA PREENCHIDO*/               ' + sLineBreak +
    '          OR (                                                                                                          ' + sLineBreak +
    '                     F041.DT_REALIZACAO IS NOT NULL                                                                     ' + sLineBreak +
    '               AND  (F041.DT_REALIZACAO >= DATEADD(DAY, -'+qt_dias+', GETDATE()) )                                      ' + sLineBreak +
    '              )  /*PROCESSOS QUE TIVERAM O EVENTO 041 PREENCHIDO NOS ULTIMOS 10 DIAS.*/                                 ' + sLineBreak +
    '         )                                                                                                              ' + sLineBreak ;

    
  end
  else
  begin
     SQL :=
     '    SELECT                                                                                                             ' + sLineBreak +
     '     P.CD_PRODUTO                                         AS [SERVICO]                                                 ' + sLineBreak +
     '    ,A.NM_AREA                                            AS [SBU]                                                     ' + sLineBreak +
     '    ,EN.CGC_EMPRESA                                       AS [IMPOEXPO]                                                ' + sLineBreak +
     '    ,PED.PEDIDOIMPORTAO                                                                                                ' + sLineBreak +
     '    ,''58156084000137''                                   AS [DESPACHANTE]                                             ' + sLineBreak +
     '    ,P.NR_PROCESSO                                        AS [REFDESPACHANTE]                                          ' + sLineBreak +
     '    ,LTRIM(RTRIM(CAST(P.TX_MERCADORIA AS NVARCHAR(500)))) AS [PRODUTOS]                                                ' + sLineBreak +
     '    ,NF.NRNOTA                                                                                                         ' + sLineBreak +
     '    ,CASE WHEN P.TP_ESTUFAGEM <> ''1''                                                                                 ' + sLineBreak +
     '    	    THEN ''01''                                                                                                  ' + sLineBreak +
     '          ELSE CT.TP_CNTR                                                                                              ' + sLineBreak +
     '     END                                                  AS [TIPOCONTAINER]                                           ' + sLineBreak +
     '                                                                                                                       ' + sLineBreak +
     '    ,CASE WHEN CT.TP_CNTR     = ''01''                                                                                 ' + sLineBreak +
     '               THEN CONVERT(VARCHAR(15),CS.VL_QTDE)+'' ''+(CS.NM_ESPECIE)                                              ' + sLineBreak +
     '          WHEN P.TP_ESTUFAGEM <>''1''                                                                                  ' + sLineBreak +
     '               THEN CONVERT(VARCHAR(15),CS.VL_QTDE)+'' ''+(CS.NM_ESPECIE)                                              ' + sLineBreak +
     '          ELSE TC.NM_TP_CNTR                                                                                           ' + sLineBreak +
     '     END                                                  AS [NRCONTAINER]                                             ' + sLineBreak +
     '                                                                                                                       ' + sLineBreak +
     '    ,CASE S.CD_VIA_TRANSPORTE                                                                                          ' + sLineBreak +
     '          WHEN ''01''--	MARÍTIMA                                                                                       ' + sLineBreak +
     '     	         THEN CASE WHEN S.NM_SERVICO LIKE ''%GRANEL%''                                                           ' + sLineBreak +
     '     	                   THEN ARM_ATRACACAO.NM_ARMAZEM                                                                 ' + sLineBreak +
     '     	                   ELSE ARM_ESTOCAGEM.NM_ARMAZEM                                                                 ' + sLineBreak +
     '     	              END                                                                                                ' + sLineBreak +
     '          WHEN ''04''--	AÉREA                                                                                          ' + sLineBreak +
     '          THEN LOC_EMBARQUE.DESCRICAO                                                                                  ' + sLineBreak +
     '          WHEN ''07''--	RODOVIÁRIA                                                                                     ' + sLineBreak +
     '          THEN LOC_FRONTEIRA.DESCRICAO                                                                                 ' + sLineBreak +
     '          ELSE ARM_ESTOCAGEM.NM_ARMAZEM                                                                                ' + sLineBreak +
     '     END                                                  AS [TERMINALCARGA]                                           ' + sLineBreak +
     '    ,TR.CNPJ_TRANSP_ROD                                   AS [TRANSPORTADORA]                                          ' + sLineBreak +
     '    ,NULL                                                 AS [DTCHEGADA]                                               ' + sLineBreak +
     '    ,NULL                                                 AS [DTPRESENCA]                                              ' + sLineBreak +
     '    ,F088.DT_REALIZACAO                                   AS [DTDESEMBARACO]                                           ' + sLineBreak +
     '    ,EV489.DT_REALIZACAO                                  AS [DTLIBERACAO]                                             ' + sLineBreak +
     '    ,RC.CD_REFERENCIA                                     AS [DIBOOKING]                                               ' + sLineBreak +
     '    ,NULL                                                 AS [DTNECESSIDADE]                                           ' + sLineBreak +
     '    FROM TPROCESSO                  P     (NOLOCK)                                                                     ' + sLineBreak +
     '    LEFT JOIN TEMPRESA_NAC          EN    (NOLOCK)  ON EN.CD_EMPRESA     = P.CD_CLIENTE                                ' + sLineBreak +
     '    LEFT JOIN TSERVICO              S     (NOLOCK)  ON S.CD_SERVICO      = P.CD_SERVICO                                ' + sLineBreak +            
     '    LEFT JOIN TAREA                 A     (NOLOCK)  ON A.CD_AREA         = P.CD_AREA                                   ' + sLineBreak +
     '    LEFT JOIN TPROCESSO_CNTR        CT    (NOLOCK)  ON CT.NR_PROCESSO    = P.NR_PROCESSO                               ' + sLineBreak +
     '    LEFT JOIN TTP_CNTR              TC    (NOLOCK)  ON TC.TP_CNTR        = CT.TP_CNTR                                  ' + sLineBreak +
     '    LEFT JOIN TPROCESSO_CARGA_SOLTA CS    (NOLOCK)  ON CS.NR_PROCESSO    = P.NR_PROCESSO                               ' + sLineBreak +
     '    LEFT JOIN TTRANSP_ROD           TR    (NOLOCK)  ON TR.CD_TRANSP_ROD  = P.CD_TRANSP_NAC                             ' + sLineBreak +
     '    LEFT JOIN TREF_CLIENTE          RC    (NOLOCK)  ON RC.NR_PROCESSO    = P.NR_PROCESSO                               ' + sLineBreak +
     '                                                   AND RC.TP_REFERENCIA  = ''05''                                      ' + sLineBreak +
     '    LEFT JOIN TFOLLOWUP             F308  (NOLOCK)  ON F308.NR_PROCESSO  = P.NR_PROCESSO                               ' + sLineBreak +
     '                                                   AND F308.CD_SERVICO   = P.CD_SERVICO                                ' + sLineBreak +
     '                                                   AND F308.CD_EVENTO    = ''088''                                     ' + sLineBreak +                              
     '    LEFT JOIN TFOLLOWUP             EV489 (NOLOCK)  ON EV489.NR_PROCESSO = P.NR_PROCESSO                               ' + sLineBreak +
     '                                                   AND EV489.CD_SERVICO   = P.CD_SERVICO                               ' + sLineBreak +           
     '                                                   AND EV489.CD_EVENTO   = ''489''                                     ' + sLineBreak +
     '    LEFT JOIN TFOLLOWUP             F088  (NOLOCK)  ON F088.NR_PROCESSO  = P.NR_PROCESSO                               ' + sLineBreak +
     '                                                   AND F088.CD_SERVICO   = P.CD_SERVICO                                ' + sLineBreak +        
     '                                                   AND F088.CD_EVENTO    = ''088''                                     ' + sLineBreak +
     '                                                                                                                       ' + sLineBreak +
     '    LEFT JOIN TARMAZEM              ARM_ATRACACAO    (NOLOCK) ON ARM_ATRACACAO.CD_ARMAZEM     = P.CD_ARMAZEM_ATRACACAO ' + sLineBreak +
     '    LEFT JOIN TARMAZEM              ARM_ESTOCAGEM    (NOLOCK) ON ARM_ESTOCAGEM.CD_ARMAZEM     = P.CD_ARMAZEM_ESTOCAGEM ' + sLineBreak +
     '    LEFT JOIN TLOCAL_EMBARQUE       LOC_EMBARQUE     (NOLOCK) ON LOC_EMBARQUE.CODIGO          = P.CD_LOCAL_EMBARQUE    ' + sLineBreak +
     '    LEFT JOIN TLOCAL_EMBARQUE       LOC_FRONTEIRA    (NOLOCK) ON LOC_FRONTEIRA.CODIGO         = P.CD_FRONTEIRA         ' + sLineBreak +
     '                                                                                                                       ' + sLineBreak +
     '    OUTER APPLY( SELECT  STUFF((SELECT DISTINCT '', '' + RTRIM(RCP.CD_REFERENCIA)+''/0000''                            ' + sLineBreak +
     '                                  FROM TREF_CLIENTE RCP   (NOLOCK)                                                     ' + sLineBreak +
     '                                  WHERE RCP.TP_REFERENCIA  =''01''                                                     ' + sLineBreak +
     '                                    AND RCP.NR_PROCESSO    = P.NR_PROCESSO                                             ' + sLineBreak +
     '                               FOR XML PATH('''')), 1, 1, '''') AS PEDIDOIMPORTAO  ) PED                               ' + sLineBreak +
     '                                                                                                                       ' + sLineBreak +
     '    OUTER APPLY( SELECT  STUFF((SELECT DISTINCT '','' + RTRIM(NF.NR_NF)                                                ' + sLineBreak +
     '                                  FROM TPROCESSO_EXP_NF NF (NOLOCK)                                                    ' + sLineBreak +
     '                                  WHERE NF.NR_PROCESSO    = P.NR_PROCESSO                                              ' + sLineBreak +
     '                               FOR XML PATH('''')), 1, 1, '''') AS [NRNOTA]  ) NF                                      ' + sLineBreak +
     '    WHERE P.CD_GRUPO IN (''002'',''013'',''559'')                                                                      ' + sLineBreak +
     '      AND P.CD_PRODUTO   =''02''                                                                                       ' + sLineBreak +
     '      AND P.IN_CANCELADO = 0                                                                                           ' + sLineBreak ;
      if nr_processo <> '' then
       sql := sql +
    '     AND P.NR_PROCESSO = ' + QuotedStr(nr_processo)
      else
       sql := sql +
     '      AND F308.DT_REALIZACAO >= '+ QuotedStr(DATAINICIAL)                                                                + sLineBreak +
     '      AND F308.DT_REALIZACAO <  '+ QuotedStr(DATAFINAL)                                                                  + sLineBreak ;
  end;


  Result := Sql;
end;

procedure TFormRlTM_BASFCtx.FormShow(Sender: TObject);
begin
  if TipoRelatorio = 'I' then
  begin
    pgFiltros.Pages[0].TabVisible := false;
    pgFiltros.Pages[1].TabVisible := true;
  end
  else
  begin
    pgFiltros.Pages[0].TabVisible := true;
    pgFiltros.Pages[1].TabVisible := false;
  end;

  qryUnidadeNeg.close;
  cdsUnidadeNeg.close;
  cdsUnidadeNeg.open;
  qryUnidadeNeg.close;

  qryProduto.close;
  cdsProduto.close;
  cdsProduto.open;
  qryProduto.close;
end;

procedure TFormRlTM_BASFCtx.edtQtDiasKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in [#8, '0'..'9'])  Then
   key :=#0;
end;

procedure TFormRlTM_BASFCtx.FormCreate(Sender: TObject);
begin
  SQLConnection.connected := false;
  if VersaoTeste then
    SQLConnection.Params.Values['HostName']:= ServidorHomologacao
  else
    SQLConnection.Params.Values['HostName']:= ServidorProducao;
  SQLConnection.connected := true;
end;

procedure TFormRlTM_BASFCtx.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsUnidadeNeg.close;
  cdsProduto.close;
end;

procedure TFormRlTM_BASFCtx.edUnidadeExit(Sender: TObject);
begin
  BuscarCodigoUnidadeNeg
end;

procedure TFormRlTM_BASFCtx.edUnidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN  then
  begin
    BuscarCodigoUnidadeNeg;
  end;
end;

procedure TFormRlTM_BASFCtx.cbUnidadeCloseUp(Sender: TObject);
begin
  PreencherCodigoUnidadeNeg;
end;

procedure TFormRlTM_BASFCtx.cbUnidadeExit(Sender: TObject);
begin
  PreencherCodigoUnidadeNeg;
end;

procedure TFormRlTM_BASFCtx.cbUnidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    cbUnidade.KeyValue := '';
end;

procedure TFormRlTM_BASFCtx.edtProdutoExit(Sender: TObject);
begin
  BuscarCodigoProduto
end;

procedure TFormRlTM_BASFCtx.edtProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN  then
  begin
    BuscarCodigoProduto;
  end;
end;

procedure TFormRlTM_BASFCtx.cbProdutoCloseUp(Sender: TObject);
begin
  PreencherCodigoProduto;
end;

procedure TFormRlTM_BASFCtx.cbProdutoExit(Sender: TObject);
begin
  PreencherCodigoProduto;
end;

procedure TFormRlTM_BASFCtx.cbProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    cbProduto.KeyValue := '';
end;


procedure TFormRlTM_BASFCtx.BuscarCodigoProduto;
begin
  if cdsProduto.Locate('CD_PRODUTO', edtProduto.Text, []) then
     cbProduto.KeyValue := cdsProduto.fieldbyName('CD_PRODUTO').AsString
  else
    cbProduto.KeyValue := '';
end;


procedure TFormRlTM_BASFCtx.BuscarCodigoUnidadeNeg;
begin
  if cdsUnidadeNeg.Locate('CD_UNID_NEG', edUnidade.Text, []) then
     cbUnidade.KeyValue := cdsUnidadeNeg.fieldbyName('CD_UNID_NEG').AsString
  else
    cbUnidade.KeyValue := '';
end;

procedure TFormRlTM_BASFCtx.PreencherCodigoUnidadeNeg;
begin
  if not ((cbUnidade.KeyValue = '') or (cbUnidade.KeyValue = null)) then
    edUnidade.Text := cdsUnidadeNeg.fieldbyName('CD_UNID_NEG').AsString
  else
    edUnidade.Text := '';
end;


procedure TFormRlTM_BASFCtx.PreencherCodigoProduto;
begin
 if not ((cbProduto.KeyValue = '') or (cbProduto.KeyValue = null)) then
    edtProduto.Text := cdsProduto.fieldbyName('CD_PRODUTO').AsString
  else
    edtProduto.Text := '';
end;

procedure TFormRlTM_BASFCtx.btnLimparClick(Sender: TObject);
begin
  edUnidade.Clear;
  edtProduto.Clear;
  edtNrProcesso.Clear;
  cbProduto.KeyValue := '';
  cbUnidade.KeyValue := '';
end;

end.

