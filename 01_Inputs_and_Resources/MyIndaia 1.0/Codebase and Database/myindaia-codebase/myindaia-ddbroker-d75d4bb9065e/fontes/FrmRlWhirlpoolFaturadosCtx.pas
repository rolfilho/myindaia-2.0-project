unit FrmRlWhirlpoolFaturadosCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFormRlWhirlpooFaturadoslCtx = class(TForm)
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    edt_nm_produto: TEdit;
    msk_cd_produto: TMaskEdit;
    mskDataregistroIni: TMaskEdit;
    mskDataregistroFin: TMaskEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
  private
    DataInicial: TDateTime;
    DataFinal: TDateTime;
    function GetSelect: string;
    function GetWhere: string;
  public
    { Public declarations }
  end;

var
  FormRlWhirlpooFaturadoslCtx: TFormRlWhirlpooFaturadoslCtx;

implementation

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{$R *.dfm}

procedure TFormRlWhirlpooFaturadoslCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormRlWhirlpooFaturadoslCtx.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  Filtros: string;
begin
  Form := TfmConsulta.Create(nil);
  try
    DataInicial := StrToDateTimeDef(mskDataregistroIni.Text, 0);
    DataFinal   := StrToDateTimeDef(mskDataregistroFin.Text, 0);
    Filtros     := GetWhere;
    Form.TituloRelatorio := 'Faturados Whirlpool';

    if (msk_cd_produto.Text <> '') then
      CatSQLAnd(Filtros, ' TP.CD_PRODUTO = ' + QuotedStr(msk_cd_produto.Text));

    if (DataInicial > 0) and (DataFinal > 0) then
    begin
      if DataInicial > DataFinal then
      begin
        MessageDlg('Data inicial maior que a data final.', mtWarning, [mbOK], 0);
        Exit;
      end;
      CatSQLAnd(Filtros, ' B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1));
    end;

    Form.qryMain.SQL.Text := GetSelect + Filtros + 'GROUP BY TP.NR_PROCESSO, EN.NM_EMPRESA, EN.CGC_EMPRESA, R.CD_REFERENCIA, B.SENIORKEY,IIVV.NAME, IIV.PRICE, B.CREATED, B.DUEDATE,IIV.ID ' ;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

procedure TFormRlWhirlpooFaturadoslCtx.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto);
    msk_cd_produtoExit(nil);
  end
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure TFormRlWhirlpooFaturadoslCtx.msk_cd_produtoExit(Sender: TObject);
begin
  btn_co_produtoClick(msk_cd_produto);
  ValCodEdt( msk_cd_produto );
end;

function TFormRlWhirlpooFaturadoslCtx.GetSelect: string;
begin
  Result := '  SELECT	DISTINCT                                                                                                   '+
            '         TP.NR_PROCESSO                                               AS [Ref. Indaiá],                             '+
            '         EN.NM_EMPRESA                                                AS [Cliente],                                 '+
            '         SUBSTRING(EN.CGC_EMPRESA,1,2)+''.''+                                                                       '+
            '         SUBSTRING(EN.CGC_EMPRESA,3,3)+''.''+                                                                       '+
            '         SUBSTRING(EN.CGC_EMPRESA,6,3)+''/''+                                                                       '+
            '         SUBSTRING(EN.CGC_EMPRESA,9,4)+''-''+                                                                       '+
            '         SUBSTRING(EN.CGC_EMPRESA,13,2)                               AS [CNPJ],                                    '+
            '         R.CD_REFERENCIA                                              AS [Nr. Pedido],                              '+
            '         B.seniorKey                                                  AS [FT],                                      '+
            '         IIVV.name                                                    AS [Item],                                    '+
            '         IIV.price / CASE WHEN (SELECT DISTINCT COUNT(RC.CD_REFERENCIA)                                        '+
            '                 FROM BROKER.DBO.TREF_CLIENTE RC (NOLOCK)                                                           '+
            '                WHERE RC.NR_PROCESSO=TP.NR_PROCESSO                                                                 '+
            '                  AND RC.TP_REFERENCIA = ''01'') = 0 THEN 1 ELSE                                                     '+
            '          (SELECT DISTINCT COUNT(RC1.CD_REFERENCIA)                                                                  '+
            '                 FROM BROKER.DBO.TREF_CLIENTE RC1 (NOLOCK)                                                           '+
            '                WHERE RC1.NR_PROCESSO=TP.NR_PROCESSO                                                                 '+
            '                  AND RC1.TP_REFERENCIA = ''01'')  END                AS [Valor],                                    '+
            '         B.created                                                    AS [Data Faturamento],                        '+
            '         B.dueDate                                                    AS [Data Vencimento]                          '+
            '  FROM MYINDAIAV2.DBO.Billing                                     B    (NOLOCK)                                     '+
            '  INNER JOIN MYINDAIAV2.DBO.Billing_ItemInvoiced                   IV   (NOLOCK) ON IV.Billing_id=B.id               '+
            '  INNER JOIN MYINDAIAV2.DBO.ItemInvoiced                           IIV  (NOLOCK) ON IIV.id=IV.itensInvoiced_id       '+
            '  INNER JOIN MYINDAIAV2.DBO.ITEM                                   IIVV (NOLOCK) ON IIVV.id=IIV.item_id              '+
            '  INNER JOIN MYINDAIAV2.DBO.CustomClearance                        CC   (NOLOCK) ON CC.ID=IIV.customClearance_id     '+
            '  INNER JOIN MYINDAIAV2.DBO.Billing_PaymentRequested               BPR  (NOLOCK) ON BPR.Billing_id=B.id              '+
            '  INNER JOIN MYINDAIAV2.DBO.PaymentRequested                       PR   (NOLOCK) ON PR.ID=BPR.PAYMENTS_ID AND PR.CUSTOMCLEARANCE_ID=CC.ID      '+
            '  INNER JOIN MYINDAIAV2.DBO.PaymentRequested_ItemPaymentRequested  PIPR (NOLOCK) ON PIPR.PAYMENTREQUESTED_ID=PR.ID   '+
            '  INNER JOIN MYINDAIAV2.DBO.ItemPaymentRequested                   IR   (NOLOCK) ON IR.ID=PIPR.items_id              '+
            '  INNER JOIN MYINDAIAV2.DBO.Item                                   I    (NOLOCK) ON I.ID=IR.item_id                  '+
            '  INNER JOIN BROKER.DBO.TPROCESSO                                  TP   (NOLOCK) ON TP.NR_PROCESSO=CC.customID       '+
            '  INNER JOIN BROKER.DBO.TEMPRESA_NAC                               EN   (NOLOCK) ON EN.CD_EMPRESA=TP.CD_CLIENTE      '+
            '  LEFT JOIN BROKER.dbo.TREF_CLIENTE R (NOLOCK) ON R.NR_PROCESSO = TP.NR_PROCESSO AND R.TP_REFERENCIA = ''01''       ';
end;

function TFormRlWhirlpooFaturadoslCtx.GetWhere: string;
begin
  Result := ' WHERE B.STATUS=''INVOICED'' '+
            ' AND B.type=''TAX_RECEIPT'' '+
            '   AND TP.CD_GRUPO=''A77'' '


end;

end.
