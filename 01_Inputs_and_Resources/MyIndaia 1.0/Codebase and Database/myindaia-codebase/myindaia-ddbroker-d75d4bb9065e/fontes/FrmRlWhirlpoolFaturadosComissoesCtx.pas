unit FrmRlWhirlpoolFaturadosComissoesCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFormRlWhirlpoolFaturadosComissoesCtx = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    mskDataregistroIni: TMaskEdit;
    mskDataregistroFin: TMaskEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    DataInicial: TDateTime;
    DataFinal: TDateTime;
    function GetSelect: string;
  public
    { Public declarations }
  end;

var
  FormRlWhirlpoolFaturadosComissoesCtx: TFormRlWhirlpoolFaturadosComissoesCtx;

implementation

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{$R *.dfm}

procedure TFormRlWhirlpoolFaturadosComissoesCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormRlWhirlpoolFaturadosComissoesCtx.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  Filtros: string;
begin
  Form := TfmConsulta.Create(nil);
  try
    DataInicial := StrToDateTimeDef(mskDataregistroIni.Text, 0);
    DataFinal   := StrToDateTimeDef(mskDataregistroFin.Text, 0);
    
    Form.TituloRelatorio := 'Faturados Whirlpool (Comissões) - Importação';

    if (DataInicial > 0) and (DataFinal > 0) then
    begin
      if DataInicial > DataFinal then
      begin
        MessageDlg('Data inicial maior que a data final.', mtWarning, [mbOK], 0);
        Exit;
      end;
    end;

    Form.qryMain.SQL.Text := GetSelect;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

function TFormRlWhirlpoolFaturadosComissoesCtx.GetSelect: string;
begin
  Result :=
   '    WITH PROCESSOS_WHIRLPOOL AS(                                                                                            ' + sLineBreak +
   '    SELECT	 TP.NR_PROCESSO                      AS NR_PROCESSO                                                             ' + sLineBreak +
   '    		,0                                       AS VALOR                                                                   ' + sLineBreak +
   '    		,II.PRICE                                AS HONORARIOS                                                              ' + sLineBreak +
   '    		,0                                       AS DTA                                                                     ' + sLineBreak +
   '    		,B.NR_NOTA                               AS NR_NFE                                                                  ' + sLineBreak +
   '    		,CONVERT(VARCHAR(10),B.CREATED,103)      AS EMISSAO                                                                 ' + sLineBreak +
   '    		,CONVERT(VARCHAR(10),B.DUEDATE,103)      AS VENCIMENTO	                                                            ' + sLineBreak +
   '        ,0			                  							 AS VALOR_LI                                                                ' + sLineBreak +
   '         FROM MYINDAIAV2.DBO.BILLING                  B	    (NOLOCK)                                                        ' + sLineBreak +
   '    LEFT JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED     BII   (NOLOCK) ON BII.BILLING_ID    = B.ID                            ' + sLineBreak +
   '    LEFT JOIN MYINDAIAV2.DBO.ITEMINVOICED             II    (NOLOCK) ON II.ID             = BII.ITENSINVOICED_ID            ' + sLineBreak +
   '    LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE          CC    (NOLOCK) ON CC.ID             = II.CUSTOMCLEARANCE_ID           ' + sLineBreak +
   '    LEFT JOIN MYINDAIAV2.DBO.BILLING_PAYMENTREQUESTED BPR   (NOLOCK) ON BPR.BILLING_ID    = B.ID			                      ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TPROCESSO                    TP    (NOLOCK) ON TP.NR_PROCESSO    = CC.CUSTOMID                     ' + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '    WHERE B.STATUS       = ''INVOICED''                                                                                     ' + sLineBreak +
   '      AND B.TYPE         = ''TAX_INVOICE''                                                                                  ' + sLineBreak +
   '      AND II.ITEM_ID     = 257                                                                                              ' + sLineBreak +
   '      AND TP.CD_GRUPO    = ''A77''                                                                                          ' + sLineBreak +
   '      AND TP.CD_PRODUTO  = ''01''                                                                                           ' + sLineBreak +
    '     AND B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1)                            + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '    UNION ALL                                                                                                               ' + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '    SELECT	 TP.NR_PROCESSO                      AS NR_PROCESSO                                                             ' + sLineBreak +
   '    		,II.PRICE                                AS VALOR                                                                   ' + sLineBreak +
   '    		,0                                       AS HONORARIOS                                                              ' + sLineBreak +
   '    		,0                                       AS DTA                                                                     ' + sLineBreak +
   '    		,B.NR_NOTA                               AS NR_NFE                                                                  ' + sLineBreak +
   '    		,CONVERT(VARCHAR(10),B.CREATED,103)      AS EMISSAO                                                                 ' + sLineBreak +
   '    		,CONVERT(VARCHAR(10),B.DUEDATE,103)      AS VENCIMENTO	                                                            ' + sLineBreak +
   '        ,0			                  							 AS VALOR_LI                                                                ' + sLineBreak +
   '         FROM MYINDAIAV2.DBO.BILLING                  B	    (NOLOCK)                                                        ' + sLineBreak +
   '    LEFT JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED     BII   (NOLOCK) ON BII.BILLING_ID    = B.ID                            ' + sLineBreak +
   '    LEFT JOIN MYINDAIAV2.DBO.ITEMINVOICED             II    (NOLOCK) ON II.ID             = BII.ITENSINVOICED_ID            ' + sLineBreak +
   '    LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE          CC    (NOLOCK) ON CC.ID             = II.CUSTOMCLEARANCE_ID           ' + sLineBreak +
   '    LEFT JOIN MYINDAIAV2.DBO.BILLING_PAYMENTREQUESTED BPR   (NOLOCK) ON BPR.BILLING_ID    = B.ID			                      ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TPROCESSO                    TP    (NOLOCK) ON TP.NR_PROCESSO    = CC.CUSTOMID                     ' + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '    WHERE B.STATUS       = ''INVOICED''                                                                                     ' + sLineBreak +
   '      AND B.TYPE         = ''TAX_INVOICE''                                                                                  ' + sLineBreak +
   '      AND II.ITEM_ID     = 269                                                                                              ' + sLineBreak +
   '      AND TP.CD_GRUPO    = ''A77''                                                                                          ' + sLineBreak +
   '      AND TP.CD_PRODUTO  = ''01''                                                                                           ' + sLineBreak +
    '     AND B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1)                            + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '    UNION ALL                                                                                                               ' + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '    SELECT	 TP.NR_PROCESSO                      AS NR_PROCESSO                                                             ' + sLineBreak +
   '    		,0                                       AS VALOR                                                                   ' + sLineBreak +
   '    		,0                                       AS HONORARIOS                                                              ' + sLineBreak +
   '    		,0                                       AS DTA                                                                     ' + sLineBreak +
   '    		,B.NR_NOTA                               AS NR_NFE                                                                  ' + sLineBreak +
   '    		,CONVERT(VARCHAR(10),B.CREATED,103)      AS EMISSAO                                                                 ' + sLineBreak +
   '    		,CONVERT(VARCHAR(10),B.DUEDATE,103)      AS VENCIMENTO	                                                            ' + sLineBreak +
   '        ,II.PRICE                  							 AS VALOR_LI                                                                ' + sLineBreak +
   '         FROM MYINDAIAV2.DBO.BILLING                  B	    (NOLOCK)                                                        ' + sLineBreak +
   '    LEFT JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED     BII   (NOLOCK) ON BII.BILLING_ID    = B.ID                            ' + sLineBreak +
   '    LEFT JOIN MYINDAIAV2.DBO.ITEMINVOICED             II    (NOLOCK) ON II.ID             = BII.ITENSINVOICED_ID            ' + sLineBreak +
   '    LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE          CC    (NOLOCK) ON CC.ID             = II.CUSTOMCLEARANCE_ID           ' + sLineBreak +
   '    LEFT JOIN MYINDAIAV2.DBO.BILLING_PAYMENTREQUESTED BPR   (NOLOCK) ON BPR.BILLING_ID    = B.ID			                      ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TPROCESSO                    TP    (NOLOCK) ON TP.NR_PROCESSO    = CC.CUSTOMID                     ' + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '    WHERE B.STATUS       = ''INVOICED''                                                                                     ' + sLineBreak +
   '      AND B.TYPE         = ''TAX_INVOICE''                                                                                  ' + sLineBreak +
   '      AND II.ITEM_ID     = 261                                                                                              ' + sLineBreak +
   '      AND TP.CD_GRUPO    = ''A77''                                                                                          ' + sLineBreak +
   '      AND TP.CD_PRODUTO  = ''01''                                                                                           ' + sLineBreak +
    '     AND B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1)                            + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '    UNION ALL                                                                                                               ' + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '    SELECT	 TP.NR_PROCESSO                      AS NR_PROCESSO                                                             ' + sLineBreak +
   '    		,0                                       AS VALOR                                                                   ' + sLineBreak +
   '    		,0                                       AS HONORARIOS                                                              ' + sLineBreak +
   '    		,II.PRICE                                AS DTA                                                                     ' + sLineBreak +
   '    		,B.NR_NOTA                               AS NR_NFE                                                                  ' + sLineBreak +
   '    		,CONVERT(VARCHAR(10),B.CREATED,103)      AS EMISSAO                                                                 ' + sLineBreak +
   '    		,CONVERT(VARCHAR(10),B.DUEDATE,103)      AS VENCIMENTO	                                                            ' + sLineBreak +
   '        ,II.PRICE                  							 AS VALOR_LI                                                                ' + sLineBreak +
   '         FROM MYINDAIAV2.DBO.BILLING                  B	    (NOLOCK)                                                        ' + sLineBreak +
   '    LEFT JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED     BII   (NOLOCK) ON BII.BILLING_ID    = B.ID                            ' + sLineBreak +
   '    LEFT JOIN MYINDAIAV2.DBO.ITEMINVOICED             II    (NOLOCK) ON II.ID             = BII.ITENSINVOICED_ID            ' + sLineBreak +
   '    LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE          CC    (NOLOCK) ON CC.ID             = II.CUSTOMCLEARANCE_ID           ' + sLineBreak +
   '    LEFT JOIN MYINDAIAV2.DBO.BILLING_PAYMENTREQUESTED BPR   (NOLOCK) ON BPR.BILLING_ID    = B.ID			                      ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TPROCESSO                    TP    (NOLOCK) ON TP.NR_PROCESSO    = CC.CUSTOMID                     ' + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '    WHERE B.STATUS       = ''INVOICED''                                                                                     ' + sLineBreak +
   '      AND B.TYPE         = ''TAX_INVOICE''                                                                                  ' + sLineBreak +
   '      AND II.ITEM_ID     = 243                                                                                              ' + sLineBreak +
   '      AND TP.CD_GRUPO    = ''A77''                                                                                          ' + sLineBreak +
   '      AND TP.CD_PRODUTO  = ''01''                                                                                           ' + sLineBreak +
    '     AND B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1)                            + sLineBreak +




   '                                                                                                                            ' + sLineBreak +
   '      )                                                                                                                     ' + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '        SELECT                                                                                                              ' + sLineBreak +
   '    		 PA.NR_PROCESSO                                                                  AS [Ref.Indaia]                    ' + sLineBreak +
   ' 	     	,STUFF((SELECT DISTINCT '', '' + LTRIM(RTRIM(RC.CD_REFERENCIA))                                                     ' + sLineBreak +
   '                  FROM BROKER.DBO.TREF_CLIENTE RC WITH (NOLOCK)                                                             ' + sLineBreak +
   '                 WHERE RC.NR_PROCESSO    = TP.NR_PROCESSO                                                                   ' + sLineBreak +
   '                   AND TP_REFERENCIA     =  CASE WHEN tP.CD_PRODUTO = 1                                                     ' + sLineBreak +
   '         	                                       THEN G.TP_PEDIDO_BUSCA_IMP                                                 ' + sLineBreak +
   '         	                                       ELSE G.TP_PEDIDO_BUSCA                                                     ' + sLineBreak +
   '         	                                  END                                                                             ' + sLineBreak +
   '         FOR XML PATH('''')), 1, 2, '''') 		                                           AS [Nr. Pedido]                    ' + sLineBreak +
   '    		,EN.NM_EMPRESA                                                                   AS [Cliente]                       ' + sLineBreak +
   '    		,SUBSTRING(EN.CGC_EMPRESA,1,2)+''.''+                                                                               ' + sLineBreak +
   '    		 SUBSTRING(EN.CGC_EMPRESA,3,3)+''.''+                                                                               ' + sLineBreak +
   '    		 SUBSTRING(EN.CGC_EMPRESA,6,3)+''/''+                                                                               ' + sLineBreak +
   '    		 SUBSTRING(EN.CGC_EMPRESA,9,4)+''-''+                                                                               ' + sLineBreak +
   '    		 SUBSTRING(EN.CGC_EMPRESA,13,2)                                                  AS [CNPJ]                          ' + sLineBreak +
   '    		,CONVERT(VARCHAR(10),EV088.DT_REALIZACAO,103)                                    AS [Desembaraço]                   ' + sLineBreak +
   '    		,CONVERT(VARCHAR(10),EV041.DT_REALIZACAO,103)                                    AS [Lib. Processo para Transporte] ' + sLineBreak +
   '    		,CONVERT(VARCHAR(10),EV003.DT_REALIZACAO,103)                                    AS [Abertura do Registro]          ' + sLineBreak +
   '    		,TP.NR_DI                                                                        AS [Nr. DI]                        ' + sLineBreak +
   '    		,CONVERT(VARCHAR(10),EV021.DT_REALIZACAO,103)                                    AS [Reg. DI/DA Siscomex]           ' + sLineBreak +
   '    		,LE.DESCRICAO                                                                    AS [Porto / Aeroporto de Destino]  ' + sLineBreak +
   '    		,A.NM_AREA                                                                       AS [Área]                          ' + sLineBreak +
   '    		,URF.DESCRICAO                                                                   AS [Aduana]		                    ' + sLineBreak +
   '    		,STUFF ((SELECT DISTINCT '', '' + RTRIM(TNF.NR_NOTA)                                                                ' + sLineBreak +
   '                       FROM BROKER.DBO.TPROCESSO_NF TNF WITH (NOLOCK)                                                       ' + sLineBreak +
   '                      WHERE TNF.NR_PROCESSO   = TP.NR_PROCESSO                                                              ' + sLineBreak +
   '                    FOR XML PATH('''')), 1, 2, '''') 		                                 AS [DANFE - Número]	              ' + sLineBreak +
   '                                                                                                                            ' + sLineBreak +
   '    		,STUFF ((SELECT DISTINCT '', '' +  RTRIM(CONVERT(VARCHAR(10),TNF.DT_NOTA,103))                                      ' + sLineBreak +
   '                       FROM BROKER.DBO.TPROCESSO_NF TNF WITH (NOLOCK)                                                       ' + sLineBreak +
   '                      WHERE TNF.NR_PROCESSO   = TP.NR_PROCESSO                                                              ' + sLineBreak +
   '                    FOR XML PATH('''')), 1, 2, '''') 		                                 AS [Dt. Emissão]	                  ' + sLineBreak +
   '                    	                                                                                                      ' + sLineBreak +
   '    		,PA.VALOR                                                                        AS [Valor (R$)]                    ' + sLineBreak +
   '    		,PA.HONORARIOS                                                                   AS [Honorários]                    ' + sLineBreak +
   '    		,PA.DTA                                                                          AS [DTA]                           ' + sLineBreak +
   '   			,PA.VALOR_LI						                                    								  	 AS [Valor Emissão de LI]           ' + sLineBreak +
	 '    		,STUFF((SELECT DISTINCT '', '' + LTRIM(RTRIM(TPLI.NR_LI))                                                           ' + sLineBreak +
   '                  FROM BROKER.DBO.TPROCESSO_LI TPLI WITH (NOLOCK)                                                           ' + sLineBreak +
   '                 WHERE TPLI.NR_PROCESSO    = TP.NR_PROCESSO                                                                 ' + sLineBreak +
   '                   FOR XML PATH('''')), 1, 2, '''') 		                                 AS [Nr. da LI]                     ' + sLineBreak +
   '    		,CAST(PA.NR_NFE AS VARCHAR(50))                                                  AS [Nr. NFE]                       ' + sLineBreak +
   '    		,PA.EMISSAO                                                                      AS [Emissão]                       ' + sLineBreak +
   '    		,PA.VENCIMENTO                                                                   AS [Vencimento]                    ' + sLineBreak +
   '          FROM(  SELECT NR_PROCESSO,                                                                                        ' + sLineBreak +
   '    		 SUM(VALOR) AS VALOR,                                                                                               ' + sLineBreak +
   '    		 SUM(HONORARIOS) AS HONORARIOS,                                                                                     ' + sLineBreak +
   '    		 SUM(DTA) AS DTA,                                                                                                   ' + sLineBreak +
   '         SUM(VALOR_LI) AS VALOR_LI,                                                                                         ' + sLineBreak +
   '    		 NR_NFE,                                                                                                            ' + sLineBreak +
   '    		 EMISSAO,                                                                                                           ' + sLineBreak +
   '    		 VENCIMENTO                                                                                                         ' + sLineBreak +
   '        FROM PROCESSOS_WHIRLPOOL                                                                                            ' + sLineBreak +
   '        GROUP BY NR_PROCESSO,                                                                                               ' + sLineBreak +
   '                 NR_NFE,                                                                                                    ' + sLineBreak +
   '                 EMISSAO,                                                                                                   ' + sLineBreak +
   '                 VENCIMENTO   )      PA                                                                                     ' + sLineBreak +
   '         JOIN BROKER.DBO.TPROCESSO                    TP    (NOLOCK) ON TP.NR_PROCESSO    = PA.NR_PROCESSO                  ' + sLineBreak +
   '         JOIN BROKER.DBO.TGRUPO                       G     (NOLOCK) ON G.CD_GRUPO        = TP.CD_GRUPO                     ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TEMPRESA_NAC                 EN    (NOLOCK) ON EN.CD_EMPRESA     = TP.CD_CLIENTE                   ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TLOCAL_EMBARQUE              LE    (NOLOCK) ON LE.CODIGO         = TP.CD_LOCAL_DESEMBARQUE         ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TAREA                        A     (NOLOCK) ON A.CD_AREA         = TP.CD_AREA                      ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TDECLARACAO_IMPORTACAO       DI    (NOLOCK) ON DI.NR_PROCESSO    = TP.NR_PROCESSO                  ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TURF                         URF   (NOLOCK) ON URF.CODIGO        = DI.CD_URF_DESPACHO              ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TFOLLOWUP                    EV088 (NOLOCK) ON EV088.NR_PROCESSO = TP.NR_PROCESSO                  ' + sLineBreak +
   '                                                                    AND EV088.CD_EVENTO   = ''088''                         ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TFOLLOWUP                    EV041 (NOLOCK) ON EV041.NR_PROCESSO = TP.NR_PROCESSO                  ' + sLineBreak +
   '                                                                    AND EV041.CD_EVENTO   = ''041''                         ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TFOLLOWUP                    EV003 (NOLOCK) ON EV003.NR_PROCESSO = TP.NR_PROCESSO                  ' + sLineBreak +
   '                                                                    AND EV003.CD_EVENTO   = ''003''                         ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TFOLLOWUP                    EV021 (NOLOCK) ON EV021.NR_PROCESSO = TP.NR_PROCESSO                  ' + sLineBreak +
   '                                                                    AND EV021.CD_EVENTO   = ''021''                         ' + sLineBreak ;
end;



end.
