unit FrmRlWhirlpoolFaturadosComissoesExpCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFormRlWhirlpoolFaturadosComissoesExpCtx = class(TForm)
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
  FormRlWhirlpoolFaturadosComissoesExpCtx: TFormRlWhirlpoolFaturadosComissoesExpCtx;

implementation

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{$R *.dfm}

procedure TFormRlWhirlpoolFaturadosComissoesExpCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormRlWhirlpoolFaturadosComissoesExpCtx.BitBtn1Click(Sender: TObject);
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

function TFormRlWhirlpoolFaturadosComissoesExpCtx.GetSelect: string;
begin
  Result :=
    ' WITH PROCESSOS_WHIRLPOOL AS( ' + sLineBreak +
    ' SELECT ' + sLineBreak +
    ' TP.NR_PROCESSO							AS NR_PROCESSO ' + sLineBreak +
    ' ,0                                      AS VALOR ' + sLineBreak +
    ' ,II.PRICE                               AS HONORARIOS ' + sLineBreak +
    ' ,B.NR_NOTA                              AS NR_NFE ' + sLineBreak +
    ' ,CONVERT(VARCHAR(10),B.CREATED,103)     AS EMISSAO ' + sLineBreak +
    ' ,CONVERT(VARCHAR(10),B.DUEDATE,103)     AS VENCIMENTO ' + sLineBreak +
    ' ' + sLineBreak +
    ' FROM MYINDAIAV2.DBO.BILLING                  B	    (NOLOCK) ' + sLineBreak +
    ' LEFT JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED     BII   (NOLOCK) ON BII.BILLING_ID    = B.ID ' + sLineBreak +
    ' LEFT JOIN MYINDAIAV2.DBO.ITEMINVOICED             II    (NOLOCK) ON II.ID             = BII.ITENSINVOICED_ID ' + sLineBreak +
    ' LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE          CC    (NOLOCK) ON CC.ID             = II.CUSTOMCLEARANCE_ID ' + sLineBreak +
    ' LEFT JOIN MYINDAIAV2.DBO.BILLING_PAYMENTREQUESTED BPR   (NOLOCK) ON BPR.BILLING_ID    = B.ID ' + sLineBreak +
    ' LEFT JOIN BROKER.DBO.TPROCESSO                    TP    (NOLOCK) ON TP.NR_PROCESSO    = CC.CUSTOMID ' + sLineBreak +
    ' ' + sLineBreak +
    ' WHERE B.STATUS       = ''INVOICED'' ' + sLineBreak +
    ' AND B.TYPE         = ''TAX_INVOICE'' ' + sLineBreak +
    ' AND II.ITEM_ID     = 257 ' + sLineBreak +
    ' AND TP.CD_GRUPO    = ''A77'' ' + sLineBreak +
    ' AND TP.CD_PRODUTO  = ''02'' ' + sLineBreak +
    ' AND B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1)  + sLineBreak +
    ' ' + sLineBreak +
    ' UNION ALL ' + sLineBreak +
    ' ' + sLineBreak +
    ' SELECT ' + sLineBreak +
    ' TP.NR_PROCESSO                      AS NR_PROCESSO ' + sLineBreak +
    ' ,II.PRICE                           AS VALOR ' + sLineBreak +
    ' ,0                                  AS HONORARIOS ' + sLineBreak +
    ' ,B.NR_NOTA                          AS NR_NFE ' + sLineBreak +
    ' ,CONVERT(VARCHAR(10),B.CREATED,103) AS EMISSAO ' + sLineBreak +
    ' ,CONVERT(VARCHAR(10),B.DUEDATE,103) AS VENCIMENTO ' + sLineBreak +
    ' ' + sLineBreak +
    ' FROM MYINDAIAV2.DBO.BILLING                  B	    (NOLOCK) ' + sLineBreak +
    ' LEFT JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED     BII   (NOLOCK) ON BII.BILLING_ID    = B.ID ' + sLineBreak +
    ' LEFT JOIN MYINDAIAV2.DBO.ITEMINVOICED             II    (NOLOCK) ON II.ID             = BII.ITENSINVOICED_ID ' + sLineBreak +
    ' LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE          CC    (NOLOCK) ON CC.ID             = II.CUSTOMCLEARANCE_ID ' + sLineBreak +
    ' LEFT JOIN MYINDAIAV2.DBO.BILLING_PAYMENTREQUESTED BPR   (NOLOCK) ON BPR.BILLING_ID    = B.ID ' + sLineBreak +
    ' LEFT JOIN BROKER.DBO.TPROCESSO                    TP    (NOLOCK) ON TP.NR_PROCESSO    = CC.CUSTOMID ' + sLineBreak +
    ' ' + sLineBreak +
    ' WHERE B.STATUS       = ''INVOICED'' ' + sLineBreak +
    ' AND B.TYPE         = ''TAX_INVOICE'' ' + sLineBreak +
    ' AND II.ITEM_ID     = 270 ' + sLineBreak +
    ' AND TP.CD_GRUPO    = ''A77'' ' + sLineBreak +
    ' AND TP.CD_PRODUTO  = ''02'' ' + sLineBreak +
    ' AND B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1) +
    ' ' + sLineBreak +
    '      ) ' + sLineBreak +
    ' ' + sLineBreak +
    ' ' + sLineBreak +
    ' SELECT ' + sLineBreak +
    ' PA.NR_PROCESSO									AS [Ref.Indaia] ' + sLineBreak +
    ' ,EN.NM_EMPRESA									AS [Cliente] ' + sLineBreak +
    ' ,SUBSTRING(EN.CGC_EMPRESA,1,2)+''.''+ ' + sLineBreak +
    ' SUBSTRING(EN.CGC_EMPRESA,3,3)+''.''+ ' + sLineBreak +
    ' SUBSTRING(EN.CGC_EMPRESA,6,3)+''/''+ ' + sLineBreak +
    ' SUBSTRING(EN.CGC_EMPRESA,9,4)+''-''+ ' + sLineBreak +
    ' SUBSTRING(EN.CGC_EMPRESA,13,2)					AS [CNPJ] ' + sLineBreak +
    ' ,LE.DESCRICAO									AS [Porto / Aeroporto de Origem] ' + sLineBreak +
    ' ,CAST(STUFF((SELECT DISTINCT '', '' + LTRIM(RTRIM(RC.CD_REFERENCIA)) ' + sLineBreak +
    '              FROM BROKER.DBO.TREF_CLIENTE RC WITH (NOLOCK) ' + sLineBreak +
    '              WHERE RC.NR_PROCESSO    = TP.NR_PROCESSO ' + sLineBreak +
    '              AND RC.TP_REFERENCIA     =  CASE WHEN TP.CD_PRODUTO = ''01'' ' + sLineBreak +
    '             	                            THEN G.TP_PEDIDO_BUSCA_IMP ' + sLineBreak +
    '             	                            ELSE G.TP_PEDIDO_BUSCA ' + sLineBreak +
    '             	                            END ' + sLineBreak +
    ' FOR XML PATH('''')), 1, 1, '''') AS VARCHAR(200))			AS [Nr. Pedido] ' + sLineBreak +
    ' ,CONVERT(VARCHAR(10),EV088.DT_REALIZACAO,103)   AS [Desembaraço] ' + sLineBreak +
    ' ,TP.QNTD_ACORDO									AS [Qtde CO] ' + sLineBreak +
    ' ,PA.VALOR                                       AS [Valor CO] ' + sLineBreak +
    ' ,PA.HONORARIOS                                  AS [Honorários] ' + sLineBreak +
    ' ,TP.CD_INCOTERM									AS [Incoterm] ' + sLineBreak +
    ' ,CAST(PA.NR_NFE AS VARCHAR(50))                 AS [NFSe] ' + sLineBreak +
    ' ,PA.EMISSAO                                     AS [Data de Emissão] ' + sLineBreak +
    ' ,PA.VENCIMENTO                                  AS [Data de Vencimento] ' + sLineBreak +
    ' ' + sLineBreak +
    ' FROM(  SELECT NR_PROCESSO, ' + sLineBreak +
    '        SUM(VALOR) AS VALOR, ' + sLineBreak +
    '        SUM(HONORARIOS) AS HONORARIOS, ' + sLineBreak +
    '        NR_NFE, ' + sLineBreak +
    '        EMISSAO, ' + sLineBreak +
    '        VENCIMENTO ' + sLineBreak +
    '        FROM PROCESSOS_WHIRLPOOL ' + sLineBreak +
    '        GROUP BY NR_PROCESSO, NR_NFE, EMISSAO, VENCIMENTO)      PA ' + sLineBreak +
    ' ' + sLineBreak +
    ' JOIN BROKER.DBO.TPROCESSO                    TP    (NOLOCK) ON TP.NR_PROCESSO    = PA.NR_PROCESSO ' + sLineBreak +
    ' JOIN BROKER.DBO.TGRUPO                       G     (NOLOCK) ON G.CD_GRUPO        = TP.CD_GRUPO ' + sLineBreak +
    ' LEFT JOIN BROKER.DBO.TEMPRESA_NAC            EN    (NOLOCK) ON EN.CD_EMPRESA     = TP.CD_CLIENTE ' + sLineBreak +
    ' LEFT JOIN BROKER.DBO.TLOCAL_EMBARQUE         LE    (NOLOCK) ON LE.CODIGO         = TP.CD_LOCAL_EMBARQUE ' + sLineBreak +
    ' LEFT JOIN BROKER.DBO.TAREA                   A     (NOLOCK) ON A.CD_AREA         = TP.CD_AREA ' + sLineBreak +
    ' LEFT JOIN BROKER.DBO.TDECLARACAO_IMPORTACAO  DI    (NOLOCK) ON DI.NR_PROCESSO    = TP.NR_PROCESSO ' + sLineBreak +
    ' LEFT JOIN BROKER.DBO.TURF                    URF   (NOLOCK) ON URF.CODIGO        = DI.CD_URF_DESPACHO ' + sLineBreak +
    ' LEFT JOIN BROKER.DBO.TFOLLOWUP               EV088 (NOLOCK) ON EV088.NR_PROCESSO = TP.NR_PROCESSO AND EV088.CD_EVENTO   = ''088'' ' ;
end;



end.
