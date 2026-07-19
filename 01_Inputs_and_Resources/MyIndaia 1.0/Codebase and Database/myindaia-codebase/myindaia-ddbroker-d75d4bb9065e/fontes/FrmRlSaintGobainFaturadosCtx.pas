unit FrmRlSaintGobainFaturadosCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFormRlSaintGobainFaturadosCtx = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    mskDataregistroIni: TMaskEdit;
    mskDataregistroFin: TMaskEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    DataInicial: TDateTime;
    DataFinal: TDateTime;
    function GetSelect: string;
  public
    Produto: String;  
    { Public declarations }
  end;

var
  FormRlSaintGobainFaturadosCtx: TFormRlSaintGobainFaturadosCtx;

implementation

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{$R *.dfm}

procedure TFormRlSaintGobainFaturadosCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormRlSaintGobainFaturadosCtx.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  Filtros: string;
begin
  Form := TfmConsulta.Create(nil);
  try
    DataInicial := StrToDateTimeDef(mskDataregistroIni.Text, 0);
    DataFinal   := StrToDateTimeDef(mskDataregistroFin.Text, 0);

    if Produto = '01' then
      Form.TituloRelatorio := 'Faturados Saint Gobain - Importação'
    else if Produto = '02' then
      Form.TituloRelatorio := 'Faturados Saint Gobain - Exportação';
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

function TFormRlSaintGobainFaturadosCtx.GetSelect: string;
begin
  Result :=
    'WITH DADOS_BILLING AS ( ' + sLineBreak +
    '  SELECT ' + sLineBreak +
    '    CONVERT(VARCHAR(10),B.CREATED,103) AS DT_EMISSAO ' + sLineBreak +
    '    ,TP.NR_PROCESSO AS NR_PROCESSO ' + sLineBreak +
    '    ,CONVERT(VARCHAR(30),B.NR_NOTA,103) AS NR_NFE ' + sLineBreak +
    '    ,'''' AS PRESTACAO ' + sLineBreak +
    '    ,TP.CD_CLIENTE ' + sLineBreak +
    '    ,B.dueDate AS VENCIMENTO ' + sLineBreak +
    '    ,ISNULL(B.total,0) VALOR_TOTAL ' + sLineBreak +
    '    ,ISNULL(B.ir,0) AS VALOR_IR ' + sLineBreak +
    '    ,ISNULL(B.cofins,0) AS VALOR_COFINS ' + sLineBreak +
    '    ,ISNULL(B.iss,0) AS VALOR_RPS ' + sLineBreak +
    '    ,B.seniorKey AS NR_RPS ' + sLineBreak +
    '    ,0 AS VALOR_FT ' + sLineBreak +
    '    ,0 AS DEV_NUM ' + sLineBreak +
    '  FROM MYINDAIAV2.DBO.BILLING B (NOLOCK) ' + sLineBreak +
    '  JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED BII (NOLOCK) ON BII.BILLING_ID = B.ID ' + sLineBreak +
    '  JOIN MYINDAIAV2.DBO.ITEMINVOICED II (NOLOCK) ON II.ID = BII.ITENSINVOICED_ID ' + sLineBreak +
    '  JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE CC (NOLOCK) ON CC.ID = II.CUSTOMCLEARANCE_ID ' + sLineBreak +
    '  JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = CC.CUSTOMID ' + sLineBreak +
    '  WHERE TP.CD_GRUPO = ''028'' ' + sLineBreak +
    '    AND B.TYPE = ''TAX_INVOICE'' ' + sLineBreak +
    '    AND B.STATUS = ''INVOICED'' ' + sLineBreak +
    '    AND B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1) +
    '    AND TP.CD_PRODUTO = ' + QuotedStr(Produto) + sLineBreak +

    '  UNION ALL ' + sLineBreak +

    '  SELECT ' + sLineBreak +
    '    CONVERT(VARCHAR(10),B.CREATED,103) AS DT_EMISSAO ' + sLineBreak +
    '    ,TP.NR_PROCESSO AS NR_PROCESSO ' + sLineBreak +
    '    ,'''' AS NR_NFE ' + sLineBreak +
    '    ,ISNULL(B.seniorKey,B.ID) AS PRESTACAO ' + sLineBreak +
    '    ,TP.CD_CLIENTE ' + sLineBreak +
    '    ,'''' AS VENCIMENTO ' + sLineBreak +
    '    ,0 AS VALOR_TOTAL ' + sLineBreak +
    '    ,0 AS VALOR_IR ' + sLineBreak +
    '    ,0 AS VALOR_COFINS ' + sLineBreak +
    '    ,0 AS VALOR_RPS ' + sLineBreak +
    '    ,'''' AS NR_RPS ' + sLineBreak +
    '    ,sum(II.price) AS VALOR_FT ' + sLineBreak +
    '    ,ISNULL(B.total * -1,0) AS DEV_NUM ' + sLineBreak +
    '  FROM MYINDAIAV2.DBO.BILLING B (NOLOCK) ' + sLineBreak +
    '  JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED BII (NOLOCK) ON BII.BILLING_ID = B.ID ' + sLineBreak +
    '  JOIN MYINDAIAV2.DBO.ITEMINVOICED II (NOLOCK) ON II.ID = BII.ITENSINVOICED_ID ' + sLineBreak +
    '  JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE CC (NOLOCK) ON CC.ID = II.CUSTOMCLEARANCE_ID ' + sLineBreak +
    '  JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = CC.CUSTOMID ' + sLineBreak +
    '  WHERE TP.CD_GRUPO = ''028'' ' + sLineBreak +
    '    AND B.TYPE = ''TAX_RECEIPT'' ' + sLineBreak +
    '    AND B.STATUS = ''INVOICED'' ' + sLineBreak +
    '    AND B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1) +
    '    AND TP.CD_PRODUTO = ' + QuotedStr(Produto) + sLineBreak +
    '  GROUP BY B.CREATED, TP.NR_PROCESSO, B.SENIORKEY, B.ID, TP.CD_CLIENTE, B.TOTAL ' + sLineBreak +
    ') ' + sLineBreak +

    'SELECT ' + sLineBreak +
    '  NR_PROCESSO AS [NR. PROCESSO] ' + sLineBreak +
    '  ,(SELECT ' + sLineBreak +
    '  SUBSTRING(EN.CGC_EMPRESA,1,2)+''.''+ ' + sLineBreak +
    '  SUBSTRING(EN.CGC_EMPRESA,3,3)+''.''+ ' + sLineBreak +
    '  SUBSTRING(EN.CGC_EMPRESA,6,3)+''/''+ ' + sLineBreak +
    '  SUBSTRING(EN.CGC_EMPRESA,9,4)+''-''+ ' + sLineBreak +
    '  +SUBSTRING(EN.CGC_EMPRESA,13,2) ' + sLineBreak +
    '  FROM BROKER.DBO.TEMPRESA_NAC EN ' + sLineBreak +
    '  WHERE EN.CD_EMPRESA = A.CD_CLIENTE) AS [CNPJ CLIENTE] ' + sLineBreak +
    '  ,Cast(ISNULL(STUFF((SELECT DISTINCT '','' + LTRIM(RTRIM(R.CD_REFERENCIA)) ' + sLineBreak +
    '  FROM BROKER.DBO.TREF_CLIENTE R WITH (NOLOCK) ' + sLineBreak +
    '  WHERE R.NR_PROCESSO = A.NR_PROCESSO ' + sLineBreak +
    '  AND R.TP_REFERENCIA = ''01'' ' + sLineBreak +
    '  FOR XML PATH('''')), 1, 1, ''''), '''') ' + sLineBreak +
    '  as Varchar(300)) AS [REF. CLIENTE] ' + sLineBreak +
    '  ,DT_EMISSAO AS [DATA EMISSÃO] ' + sLineBreak +
    '  ,CONVERT(VARCHAR(10),MAX(VENCIMENTO),103) AS [DATA VENCIMENTO] ' + sLineBreak +
    '  ,MAX(NR_RPS) AS [RPS (HONORÁRIOS)] ' + sLineBreak +
    '  ,MAX(VALOR_RPS) AS [VALOR RPS] ' + sLineBreak +
    '  ,MAX(PRESTACAO) AS [FT (DESPESAS)] ' + sLineBreak +
    '  ,MAX(VALOR_FT) AS [VALOR FT] ' + sLineBreak +
    '  ,MAX(NR_NFE) AS [NOTA FISCAL] ' + sLineBreak +
    '  ,'''' AS [OBSERVAÇÕES] ' + sLineBreak +
    '  ,MAX(DEV_NUM) AS [DEVOLUÇÃO DE NUMERÁRIO] ' + sLineBreak +
    'FROM DADOS_BILLING A (NOLOCK) ' + sLineBreak +
    'GROUP BY NR_PROCESSO, DT_EMISSAO, A.CD_CLIENTE ' + sLineBreak +
    'ORDER BY NR_PROCESSO ';


end;



procedure TFormRlSaintGobainFaturadosCtx.FormActivate(Sender: TObject);
begin
  if Produto = '01' then
    Self.Caption := 'Saint Gobain - Faturados - Importação'
  else if Produto = '02' then
    Self.Caption := 'Saint Gobain - Faturados - Exportação';

end;

end.
