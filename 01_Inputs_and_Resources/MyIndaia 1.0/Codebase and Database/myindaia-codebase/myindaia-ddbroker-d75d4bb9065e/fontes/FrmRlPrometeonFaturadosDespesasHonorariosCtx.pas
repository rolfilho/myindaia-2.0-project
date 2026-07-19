unit FrmRlPrometeonFaturadosDespesasHonorariosCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFormRlPrometeonFaturadosDespesasHonorariosCtx = class(TForm)
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
  FormRlPrometeonFaturadosDespesasHonorariosCtx: TFormRlPrometeonFaturadosDespesasHonorariosCtx;

implementation

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{$R *.dfm}

procedure TFormRlPrometeonFaturadosDespesasHonorariosCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormRlPrometeonFaturadosDespesasHonorariosCtx.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  Filtros: string;
  CodigoProduto : String;
begin

  Form := TfmConsulta.Create(nil);
  try
    DataInicial := StrToDateTimeDef(mskDataregistroIni.Text, 0);
    DataFinal   := StrToDateTimeDef(mskDataregistroFin.Text, 0);
    CodigoProduto := msk_cd_produto.Text;

    if (CodigoProduto = '') or (DataInicial <= 0) or (DataFinal <= 0) then
    begin
      MessageDlg('Todos os campos são obrigatórios.', mtWarning, [mbOK], 0);
      Exit;
    end;

    if DataInicial > DataFinal then
    begin
      MessageDlg('Data inicial maior que a data final.', mtWarning, [mbOK], 0);
      Exit;
    end;

    Filtros     := GetWhere;
    Form.TituloRelatorio := 'Prometeon Faturados (Despesas + Honorários)';

    CatSQLAnd(Filtros, ' TP.CD_PRODUTO = ' + QuotedStr(CodigoProduto));
    CatSQLAnd(Filtros, ' B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1));

    Form.qryMain.SQL.Text := GetSelect + Filtros;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

procedure TFormRlPrometeonFaturadosDespesasHonorariosCtx.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto);
    msk_cd_produtoExit(nil);
  end
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure TFormRlPrometeonFaturadosDespesasHonorariosCtx.msk_cd_produtoExit(Sender: TObject);
begin
  btn_co_produtoClick(msk_cd_produto);
  ValCodEdt( msk_cd_produto );
end;

function TFormRlPrometeonFaturadosDespesasHonorariosCtx.GetSelect: string;
begin
  Result := 'SELECT DISTINCT ' +
            ' TP.NR_PROCESSO AS [Processo], ' +
            ' Cast(ISNULL(STUFF((SELECT DISTINCT '','' + LTRIM(RTRIM(R.CD_REFERENCIA)) FROM BROKER.DBO.TREF_CLIENTE R WITH (NOLOCK) ' +
            ' WHERE R.NR_PROCESSO = TP.NR_PROCESSO AND R.TP_REFERENCIA = (CASE WHEN TP.CD_PRODUTO=''02'' THEN ''21'' WHEN TP.CD_PRODUTO = ''01'' THEN ''01'' END) ' +
            ' FOR XML PATH('''')), 1, 1, ''''), '''') as Varchar(300)) AS [Ref. Prometeon / FATURA], ' +
            ' RPS.seniorKey AS [RPS], ' +
            ' CASE WHEN B.type = ''TAX_RECEIPT'' THEN NULL ELSE ' +
            ' REPLACE((ISNULL(B.valorTibutavel,0)) -(ISNULL(B.ir,0)) -(ISNULL(B.cofins,0))-(ISNULL(B.iss,0)),''.'','','') END AS [Valor Comissão], ' +
            ' FT.seniorKey AS [Despesa], ' +
            ' REPLACE(IIV.price,''.'','','') AS [Valor da despesa], ' +
            ' CASE WHEN B.type=''TAX_INVOICE'' THEN NULL ELSE IIVV.name END AS [Item], ' +
            ' CONVERT(VARCHAR(10),B.created,103) AS [Data de Faturamento], ' +
            ' CONVERT(VARCHAR(10),B.dueDate,103) AS [Data de Vencimento] ' +
            'FROM MYINDAIAV2.DBO.Billing B ' +
            'LEFT JOIN MYINDAIAV2.DBO.Billing_ItemInvoiced BII ON BII.Billing_id=B.id ' +
            'LEFT JOIN MYINDAIAV2.DBO.ItemInvoiced II ON II.id=BII.itensInvoiced_id ' +
            'LEFT JOIN MYINDAIAV2.DBO.Billing_PaymentRequested BPR ON BPR.Billing_id=B.id ' +
            'LEFT JOIN MYINDAIAV2.DBO.PaymentRequested PR ON PR.ID=BPR.PAYMENTS_ID ' +
            'LEFT JOIN MYINDAIAV2.DBO.PaymentRequested_ItemPaymentRequested PIPR ON PIPR.PAYMENTREQUESTED_ID=PR.ID ' +
            'LEFT JOIN MYINDAIAV2.DBO.ItemPaymentRequested IR ON IR.ID=PIPR.items_id ' +
            'LEFT JOIN MYINDAIAV2.DBO.Item I ON I.ID=IR.item_id ' +
            'LEFT JOIN MYINDAIAV2.DBO.Billing FT ON FT.seniorKey=B.seniorKey AND B.type=''TAX_RECEIPT'' ' +
            'LEFT JOIN MYINDAIAV2.DBO.Billing RPS ON RPS.seniorKey=B.seniorKey AND B.type=''TAX_INVOICE'' ' +
            'LEFT JOIN MYINDAIAV2.DBO.Billing_ItemInvoiced IV ON IV.Billing_id=B.id ' +
            'LEFT JOIN MYINDAIAV2.DBO.ItemInvoiced IIV ON IIV.id=IV.itensInvoiced_id ' +
            'LEFT JOIN MYINDAIAV2.DBO.ITEM IIVV ON IIVV.id=IIV.item_id ' +
            'LEFT JOIN MYINDAIAV2.DBO.CustomClearance CC ON CC.ID=IIV.customClearance_id ' +
            'LEFT JOIN BROKER.DBO.TPROCESSO TP ON TP.NR_PROCESSO=CC.customID ';
end;

function TFormRlPrometeonFaturadosDespesasHonorariosCtx.GetWhere: string;
begin
  Result := 'WHERE B.STATUS=''INVOICED'' ' +
            'AND TP.CD_GRUPO=''C11'' ';
end;

end.
