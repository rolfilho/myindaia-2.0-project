unit FrmRlFaturadosCEBRACECtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFormRlFaturadosCEBRACECtx = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    edt_nm_produto: TEdit;
    msk_cd_produto: TMaskEdit;
    Label1: TLabel;
    btn_co_unid_neg: TSpeedButton;
    edt_nm_unid_neg: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    mskDataregistroIni: TMaskEdit;
    mskDataregistroFin: TMaskEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
  private
    DataInicial: TDateTime;
    DataFinal: TDateTime;
    function GetSQL: string;
    function GetGroupBy: string;
  public
    { Public declarations }
  end;

var
  FormRlFaturadosCEBRACECtx: TFormRlFaturadosCEBRACECtx;

implementation

{$R *.dfm}

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{ TFormRlFaturadosCEBRACECtx }

function TFormRlFaturadosCEBRACECtx.GetGroupBy: string;
begin
  Result := ' GROUP BY TP.NR_PROCESSO,  '+
            '          B.ID,            '+
            '          B.seniorKey,     '+
            '          IR.price,        '+
            '          FT.seniorKey,    '+
            '          RPS.seniorKey,   '+
            '          I.NAME,          '+
            '          IIV.price,       '+
            '          IIVV.name,       '+
            '          B.created ,      '+
            '          EN.NM_EMPRESA,   '+
            '          EN.CGC_EMPRESA   ';
end;

function TFormRlFaturadosCEBRACECtx.GetSQL: string;
begin
  Result :=
  ' SELECT	DISTINCT                                                                                                                   ' +sLineBreak +
  '         EN.NM_EMPRESA                                       AS [Cliente],                                                          ' +sLineBreak +
  '         EN.CGC_EMPRESA                                      AS [CNPJ],                                                             ' +sLineBreak +
  '         TP.NR_PROCESSO                                      AS [Ref. Indaiá],                                                      ' +sLineBreak +
  '        (SELECT RTRIM(BK.CD_REFERENCIA) + '', '' AS ''data()''                                                                      ' +sLineBreak +
  ' 	      FROM BROKER.DBO.TREF_CLIENTE BK                                                                                            ' +sLineBreak +
  '          WHERE BK.NR_PROCESSO   = TP.NR_PROCESSO                                                                                   ' +sLineBreak +
  ' 		   AND BK.TP_REFERENCIA = ''01''                                                                                               ' +sLineBreak +
  ' 		   FOR XML PATH(''''))                                  AS [Nr. Pedido],                                                       ' +sLineBreak +
  '        (SELECT RTRIM(RC.CD_REFERENCIA) + '', '' AS ''data()''                                                                      ' +sLineBreak +
  ' 	      FROM BROKER.DBO.TREF_CLIENTE RC                                                                                            ' +sLineBreak +
  '          WHERE RC.NR_PROCESSO   = TP.NR_PROCESSO                                                                                   ' +sLineBreak +
  ' 		   AND RC.TP_REFERENCIA = ''05''                                                                                               ' +sLineBreak +
  ' 		   FOR XML PATH(''''))                                  AS [Nr. Booking],                                                      ' +sLineBreak +
  '        (SELECT RTRIM(ORD.CD_REFERENCIA) + '', '' AS ''data()''                                                                     ' +sLineBreak +
  ' 	      FROM BROKER.DBO.TREF_CLIENTE ORD                                                                                           ' +sLineBreak +
  '          WHERE ORD.NR_PROCESSO   = TP.NR_PROCESSO                                                                                  ' +sLineBreak +
  ' 		   AND ORD.TP_REFERENCIA = ''02''                                                                                              ' +sLineBreak +
  ' 		   FOR XML PATH(''''))                                  AS [Nr. Ordem],                                                        ' +sLineBreak +
  '        (SELECT RTRIM(CO.CD_REFERENCIA) + '', '' AS ''data()''                                                                      ' +sLineBreak +
  ' 	      FROM BROKER.DBO.TREF_CLIENTE CO                                                                                            ' +sLineBreak +
  '          WHERE CO.NR_PROCESSO   = TP.NR_PROCESSO                                                                                   ' +sLineBreak +
  ' 		   AND CO.TP_REFERENCIA = ''09''                                                                                               ' +sLineBreak +
  ' 		   FOR XML PATH(''''))                                  AS [Nr. Courrier],                                                     ' +sLineBreak +
  '         FT.SENIORKEY                                        AS [FT],                                                               ' +sLineBreak +
  '         RPS.SENIORKEY                                       AS [RPS],                                                              ' +sLineBreak +
  '         IIVV.NAME                                           AS [Item],                                                             ' +sLineBreak +
  '         IIV.PRICE                                           AS [Valor],                                                            ' +sLineBreak +
  '         B.CREATED                                           AS [Data Faturamento]                                                  ' +sLineBreak +
  ' FROM MYINDAIAV2.DBO.BILLING                                     B     (NOLOCK)                                                     ' +sLineBreak +
  ' LEFT JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED                   BII   (NOLOCK) ON BII.BILLING_ID          = B.ID                   ' +sLineBreak +
  ' LEFT JOIN MYINDAIAV2.DBO.ITEMINVOICED                           II    (NOLOCK) ON II.ID                   = BII.ITENSINVOICED_ID   ' +sLineBreak +
  ' LEFT JOIN MYINDAIAV2.DBO.BILLING_PAYMENTREQUESTED               BPR   (NOLOCK) ON BPR.BILLING_ID          = B.ID                   ' +sLineBreak +
  ' LEFT JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED                       PR    (NOLOCK) ON PR.ID                   = BPR.PAYMENTS_ID        ' +sLineBreak +
  ' LEFT JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYMENTREQUESTED  PIPR  (NOLOCK) ON PIPR.PAYMENTREQUESTED_ID= PR.ID                  ' +sLineBreak +
  ' LEFT JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED                   IR    (NOLOCK) ON IR.ID                   = PIPR.ITEMS_ID          ' +sLineBreak +
  ' LEFT JOIN MYINDAIAV2.DBO.ITEM                                   I     (NOLOCK) ON I.ID                    = IR.ITEM_ID             ' +sLineBreak +
  ' LEFT JOIN MYINDAIAV2.DBO.BILLING                                FT    (NOLOCK) ON FT.SENIORKEY            = B.SENIORKEY            ' +sLineBreak +
  '                                                                               AND B.TYPE                  = ''TAX_RECEIPT''        ' +sLineBreak +
  ' LEFT JOIN MYINDAIAV2.DBO.BILLING                                RPS   (NOLOCK) ON RPS.SENIORKEY           = B.SENIORKEY            ' +sLineBreak +
  '                                                                               AND B.TYPE                  = ''TAX_INVOICE''        ' +sLineBreak +
  ' LEFT JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED                   IV    (NOLOCK) ON IV.BILLING_ID           = B.ID                   ' +sLineBreak +
  ' LEFT JOIN MYINDAIAV2.DBO.ITEMINVOICED                           IIV   (NOLOCK) ON IIV.ID                  = IV.ITENSINVOICED_ID    ' +sLineBreak +
  ' LEFT JOIN MYINDAIAV2.DBO.ITEM                                   IIVV  (NOLOCK) ON IIVV.ID                 = IIV.ITEM_ID            ' +sLineBreak +
  ' LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE                        CC    (NOLOCK) ON CC.ID                   = IIV.CUSTOMCLEARANCE_ID ' +sLineBreak +
  ' LEFT JOIN BROKER.DBO.TPROCESSO                                  TP    (NOLOCK) ON TP.NR_PROCESSO          = CC.CUSTOMID            ' +sLineBreak +
  ' LEFT JOIN BROKER.DBO.TEMPRESA_NAC                               EN    (NOLOCK) ON EN.CD_EMPRESA           = TP.CD_CLIENTE          ' +sLineBreak ;
end;

procedure TFormRlFaturadosCEBRACECtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormRlFaturadosCEBRACECtx.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  Filtros: string;
begin
  Form := TfmConsulta.Create(nil);
  try
    DataInicial           := StrToDateTimeDef(mskDataregistroIni.Text, 0);
    DataFinal             := StrToDateTimeDef(mskDataregistroFin.Text, 0);
    Filtros               := 'WHERE B.STATUS = ''INVOICED'' AND TP.CD_GRUPO = ''241'' ';
    Form.TituloRelatorio  := 'Faturados CEBRACE';

    if (msk_cd_produto.Text <> '') then
      CatSQLAnd(Filtros, ' TP.CD_PRODUTO = ' + QuotedStr(msk_cd_produto.Text));
    if (msk_cd_unid_neg.Text <> '') then
      CatSQLAnd(Filtros, ' TP.CD_UNID_NEG = ' + QuotedStr(msk_cd_unid_neg.Text));

    if (DataInicial > 0) and (DataFinal > 0) then
    begin
      if DataInicial > DataFinal then
      begin
        MessageDlg('Data inicial maior que a data final.', mtWarning, [mbOK], 0);
        Exit;
      end;
      CatSQLAnd(Filtros, ' B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1));
    end;

    Form.qryMain.SQL.Text := GetSQL + Filtros + GetGroupBy;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

procedure TFormRlFaturadosCEBRACECtx.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto);
    msk_cd_produtoExit(nil);
  end
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure TFormRlFaturadosCEBRACECtx.msk_cd_produtoExit(Sender: TObject);
begin
  btn_co_produtoClick(msk_cd_produto);
  ValCodEdt( msk_cd_produto );
end;

procedure TFormRlFaturadosCEBRACECtx.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG', 'AP_UNID_NEG', 'NM_UNID_NEG'],['Código','Apelido', 'Nome'],'CD_UNID_NEG',frm_main.mi_tabela_produto);
    msk_cd_unid_negExit(nil);
  end
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'NM_UNID_NEG');
end;

procedure TFormRlFaturadosCEBRACECtx.msk_cd_unid_negExit(Sender: TObject);
begin
  btn_co_unid_negClick(msk_cd_unid_neg);
  ValCodEdt(msk_cd_unid_neg);
end;

end.
