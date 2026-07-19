unit FrmFaturadosSaldoFaturaCtxAprovComissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, ExtCtrls;

type
  TFormFaturadosSaldoFaturaCtxAprovComissao = class(TForm)
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    edt_nm_produto: TEdit;
    msk_cd_produto: TMaskEdit;
    mskDataregistroIni: TMaskEdit;
    mskDataregistroFin: TMaskEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lblGrupo: TLabel;
    btn_co_grupo: TSpeedButton;
    msk_cd_grupo: TMaskEdit;
    edt_nm_grupo: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
  private
    DataInicial: TDateTime;
    DataFinal: TDateTime;
    function GetSQL: string;
    function GetOrderBy: string;
  public
    { Public declarations }
  end;

var
  FormFaturadosSaldoFaturaCtxAprovComissao: TFormFaturadosSaldoFaturaCtxAprovComissao;

implementation

{$R *.dfm}

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{ TForm3 }

function TFormFaturadosSaldoFaturaCtxAprovComissao.GetSQL: string;
begin
  Result :=
  '     SELECT                                                                                                                  ' + sLineBreak +
  '      TP.NR_PROCESSO                                AS [Ref. Indaiá],                                                        ' + sLineBreak +
  '      EN.NM_EMPRESA                                 AS [Cliente],                                                            ' + sLineBreak +
  '      SUBSTRING(EN.CGC_EMPRESA,1,2)+''.''+                                                                                   ' + sLineBreak +
  '      SUBSTRING(EN.CGC_EMPRESA,3,3)+''.''+                                                                                   ' + sLineBreak +
  '      SUBSTRING(EN.CGC_EMPRESA,6,3)+''/''+                                                                                   ' + sLineBreak +
  '      SUBSTRING(EN.CGC_EMPRESA,9,4)+''-''+                                                                                   ' + sLineBreak +
  '      SUBSTRING(EN.CGC_EMPRESA,13,2)                AS [CNPJ CLIENTE],                                                       ' + sLineBreak +
  '      (CASE WHEN B.SENIORKEY IS NOT NULL                                                                                     ' + sLineBreak +
  '            THEN B.SENIORKEY                                                                                                 ' + sLineBreak +
  '            ELSE CAST(B.ID AS INT)                                                                                           ' + sLineBreak +
  '      END)                                          AS [Nr. Nota de Despesa],                                                ' + sLineBreak +
  '      CONVERT(VARCHAR(10),B.CREATED,103)            AS [Data Faturamento],                                                   ' + sLineBreak +
  '      CONVERT(VARCHAR(10),B.DUEDATE,103)            AS [Data Vencimento],                                                    ' + sLineBreak +
  '      (B.TOTAL * -1) - (SELECT TOP 1 ISNULL(BI.TOTAL,0) - (ISNULL(BI.COFINS,0) + ISNULL(BI.IR,0) + ISNULL(BI.ISS,0))         ' + sLineBreak +
  '                        FROM MYINDAIAV2.DBO.BILLING BI                                                                                      ' + sLineBreak +
  '                        LEFT JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED BIII ON BIII.BILLING_ID=BI.ID                                         ' + sLineBreak +
  '                        LEFT JOIN MYINDAIAV2.DBO.ITEMINVOICED II ON II.ID=BIII.ITENSINVOICED_ID                                             ' + sLineBreak +
  '                        WHERE BI.TYPE=''TAX_INVOICE'' AND BI.STATUS=''INVOICED''                                             ' + sLineBreak +
  '                        AND CC.ID=II.CUSTOMCLEARANCE_ID                                                                      ' + sLineBreak +
  '                        GROUP BY BI.COFINS,BI.IR,BI.ISS, BI.TOTAL)   AS [Saldo Fatura],                                      ' + sLineBreak +
  '      REF.REFERENCIA                                AS [Ref. Cliente],                                                       ' + sLineBreak +
  '      REFO.REFERENCIA                               AS [Ref. Outros],                                                        ' + sLineBreak +
  '      CR.NR_PSR                                     AS [Nr. PSR] ,                                                           ' + sLineBreak +
  '      PR.NR_CRP_CPP                                 AS [Nr.CRP/CPP],                                                         ' + sLineBreak +
  '     (SELECT DISTINCT bI1.seniorkey  FROM MYINDAIAV2.DBO.BILLING BI1                                                         ' + sLineBreak +
  '                       LEFT JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED BIII1 ON BIII1.BILLING_ID = BI1.ID                      ' + sLineBreak +
  '                       LEFT JOIN MYINDAIAV2.DBO.ITEMINVOICED II1 ON II1.ID = BIII1.ITENSINVOICED_ID                          ' + sLineBreak +
	'           					  LEFT JOIN MYINDAIAV2.DBO.CustomClearance CC1 ON CC1.id = II1.customClearance_id                       ' + sLineBreak +
  '       WHERE BI1.TYPE=''TAX_INVOICE'' AND BI1.STATUS=''INVOICED'' AND CC1.customID =  TP.NR_PROCESSO)  AS [RPS],             ' + sLineBreak +
  '      ( SELECT CONVERT(VARCHAR(10),MIN(CR1.RECEIVEDDATE),103) FROM MYINDAIAV2.DBO.CASHREQUESTED CR1 (NOLOCK)                 ' + sLineBreak +
	'	      LEFT JOIN MYINDAIAV2.DBO.BILLING_CASHREQUESTED BC1 (NOLOCK) ON CR1.ID = BC1.CASHREQUESTS_ID                           ' + sLineBreak +
	'	      WHERE BC1.BILLING_ID = B.ID )      AS [Rec. 1o. Numerário]                                                            ' + sLineBreak +
  '                                                                                                                             ' + sLineBreak +
  '       FROM MYINDAIAV2.DBO.BILLING                B   (NOLOCK)                                                               ' + sLineBreak +
  '    OUTER APPLY ( SELECT DISTINCT IV.CUSTOMCLEARANCE_ID , biv.Billing_id                                                     ' + sLineBreak +
  '                   FROM MYINDAIAV2.DBO.BILLING_ITEMINVOICED  BIV  (NOLOCK)                                                   ' + sLineBreak +
  '             INNER JOIN MYINDAIAV2.DBO.ITEMINVOICED          IV   (NOLOCK) ON IV.ID = BIV.ITENSINVOICED_ID                   ' + sLineBreak +
  '                  WHERE BIV.BILLING_ID       = B.ID                                                                          ' + sLineBreak +
  '             ) AS B_PR                                                                                                       ' + sLineBreak +
  '                                                                                                                             ' + sLineBreak +
  '                                                                                                                             ' + sLineBreak +
  '    OUTER APPLY(  SELECT CAR.CUSTOMCLEARANCE_ID ,MASTER.DBO.ROWCONCAT(DISTINCT RTRIM(CAR.SENIORKEY)+'', '') AS NR_PSR        ' + sLineBreak +
  '                   FROM MYINDAIAV2.DBO.BILLING_CASHREQUESTED BC   (NOLOCK)                                                   ' + sLineBreak +
  '             INNER JOIN MYINDAIAV2.DBO.CASHREQUESTED         CAR  (NOLOCK) ON CAR.ID      = BC.CASHREQUESTS_ID               ' + sLineBreak +
  '                  WHERE BC.BILLING_ID         = B.ID                                                                         ' + sLineBreak +
  '           GROUP BY  CAR.CUSTOMCLEARANCE_ID                                                                                  ' + sLineBreak +
  '             ) AS CR                                                                                                         ' + sLineBreak + 
  '                                                                                                                             ' + sLineBreak + 
  '    INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE  CC (NOLOCK) ON CC.ID  = ISNULL(B_PR.CUSTOMCLEARANCE_ID, CR.CUSTOMCLEARANCE_ID)' + sLineBreak +
  '                                                                                                                             ' + sLineBreak +
  '    OUTER APPLY ( SELECT MASTER.DBO.ROWCONCAT(DISTINCT RTRIM(PAYR.SENIORKEY)+'', '') AS NR_CRP_CPP                           ' + sLineBreak +
  '                    FROM MYINDAIAV2.DBO.PAYMENTREQUESTED PAYR (NOLOCK)                                                       ' + sLineBreak +
  '                   WHERE PAYR.BILLING_ID = B_PR.BILLING_ID                                                                   ' + sLineBreak +
  '                     AND PAYR.CUSTOMCLEARANCE_ID = CC.ID ) PR                                                                ' + sLineBreak +
  '                                                                                                                             ' + sLineBreak +
  '    JOIN BROKER.DBO.TPROCESSO                  TP  (NOLOCK)ON TP.NR_PROCESSO   = CC.CUSTOMID                                 ' + sLineBreak +
  '    JOIN BROKER.DBO.TEMPRESA_NAC               EN  (NOLOCK)ON EN.CD_EMPRESA    = TP.CD_CLIENTE                               ' + sLineBreak +
  '    JOIN BROKER.DBO.TGRUPO                     G   (NOLOCK)ON G.CD_GRUPO       = TP.CD_GRUPO                                 ' + sLineBreak +
  '                                                                                                                             ' + sLineBreak +
  '    OUTER APPLY (  SELECT CONVERT(VARCHAR(500),STUFF                                                                         ' + sLineBreak +
  '                      ((SELECT DISTINCT                                                                                      ' + sLineBreak +
  '                               '', '' + LTRIM(RTRIM(RC.CD_REFERENCIA))  + LTRIM(RTRIM(isnull(''/''+RC.NR_ITEM_PO, '''')))    ' + sLineBreak +
  '                          FROM BROKER.DBO.TREF_CLIENTE RC (NOLOCK)                                                           ' + sLineBreak +
  '                         WHERE RC.NR_PROCESSO   = TP.NR_PROCESSO                                                             ' + sLineBreak +
  '                           AND RC.TP_REFERENCIA = (CASE WHEN TP.CD_PRODUTO=''01''                                            ' + sLineBreak +
  '                                                        THEN G.TP_PEDIDO_BUSCA_IMP                                           ' + sLineBreak +
  '                                                        ELSE CASE WHEN TP.CD_PRODUTO = ''02''                                ' + sLineBreak +
  '                                                                  THEN G.TP_PEDIDO_BUSCA                                     ' + sLineBreak +
  '                                                             END                                                             ' + sLineBreak +
  '                                                    END)                                                                     ' + sLineBreak +
  '                       FOR XML PATH('''')), 1,2, '''')) AS REFERENCIA                                                        ' + sLineBreak +
  '              ) REF                                                                                                          ' + sLineBreak +
  '    OUTER APPLY (  SELECT CONVERT(VARCHAR(500),STUFF                                                                         ' + sLineBreak +
  '                      ((SELECT DISTINCT                                                                                      ' + sLineBreak +
  '                               '', '' + LTRIM(RTRIM(RC.CD_REFERENCIA))                                                       ' + sLineBreak +
  '                          FROM BROKER.DBO.TREF_CLIENTE RC (NOLOCK)                                                           ' + sLineBreak +
  '                         WHERE RC.NR_PROCESSO   = TP.NR_PROCESSO                                                             ' + sLineBreak +
  '                           AND RC.TP_REFERENCIA = ''04''                                                                     ' + sLineBreak +
  '                       FOR XML PATH('''')), 1,2, '''')) AS REFERENCIA                                                        ' + sLineBreak +
  '              ) REFO                                                                                                         ' + sLineBreak +
  ' WHERE                                                                                                                       ' + sLineBreak ;
end;

function TFormFaturadosSaldoFaturaCtxAprovComissao.GetOrderBy: string;
begin
  Result := ' ORDER BY G.CD_GRUPO, B.CREATED, TP.NR_PROCESSO, B.ID';
end;

procedure TFormFaturadosSaldoFaturaCtxAprovComissao.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormFaturadosSaldoFaturaCtxAprovComissao.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  Filtros: string;
begin
  Form := TfmConsulta.Create(nil);
  try
    DataInicial := StrToDateTimeDef(mskDataregistroIni.Text, 0);
    DataFinal   := StrToDateTimeDef(mskDataregistroFin.Text, 0);
    Filtros     := ' B.STATUS = ' + QuotedStr('INVOICED') + ' AND B.type = ' + QuotedStr('TAX_RECEIPT');

    Form.TituloRelatorio := 'Processos Faturados (Saldo de Fatura)';

    if (msk_cd_produto.Text <> '') then
      CatSQLAnd(Filtros, ' TP.CD_PRODUTO = ' + QuotedStr(msk_cd_produto.Text));

    if (msk_cd_grupo.Text<>'') then
      CatSQLAnd(Filtros, ' TP.CD_GRUPO = ' + QuotedStr(msk_cd_grupo.Text));

    if (DataInicial > 0) and (DataFinal > 0) then
    begin
      if DataInicial > DataFinal then
      begin
        MessageDlg('Data inicial de Solicitação maior que a data final.', mtWarning, [mbOK], 0);
        Exit;
      end;

      CatSQLAnd(Filtros, ' B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1));
    end;

    Form.qryMain.SQL.Text := GetSQL + Filtros + GetOrderBy;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

procedure TFormFaturadosSaldoFaturaCtxAprovComissao.btn_co_produtoClick(
  Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto);
    msk_cd_produtoExit(nil);
  end
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure TFormFaturadosSaldoFaturaCtxAprovComissao.msk_cd_produtoExit(Sender: TObject);
begin
  btn_co_produtoClick(msk_cd_produto);
  ValCodEdt( msk_cd_produto );
end;

procedure TFormFaturadosSaldoFaturaCtxAprovComissao.btn_co_grupoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_grupo.Text := ConsultaOnLineEx('TGRUPO','Grupo',['CD_GRUPO','NM_GRUPO'],['Código','Nome'],'CD_GRUPO')
  else
    edt_nm_Grupo.Text := ConsultaLookUP('TGRUPO','CD_GRUPO', msk_cd_grupo.Text,'NM_GRUPO');
end;

end.
