unit FrmRlPirelliFaturadosHonorariosCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFormRlPirelliFaturadosHonorariosCtx = class(TForm)
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
    function GetWhere: string;
  public
    { Public declarations }
  end;

var
  FormRlPirelliFaturadosHonorariosCtx: TFormRlPirelliFaturadosHonorariosCtx;

implementation

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{$R *.dfm}

procedure TFormRlPirelliFaturadosHonorariosCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormRlPirelliFaturadosHonorariosCtx.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  Filtros: string;
begin
  Form := TfmConsulta.Create(nil);
  try
    DataInicial := StrToDateTimeDef(mskDataregistroIni.Text, 0);
    DataFinal   := StrToDateTimeDef(mskDataregistroFin.Text, 0);
    
    if (DataInicial <= 0) or (DataFinal <= 0) then
    begin
      MessageDlg('Todos os campos são obrigatórios.', mtWarning, [mbOK], 0);
      Exit;
    end;

    if (DataInicial > 0) and (DataFinal > 0) then
    begin
      if DataInicial > DataFinal then
      begin
        MessageDlg('Data inicial maior que a data final.', mtWarning, [mbOK], 0);
        Exit;
      end;
    end;

    Form.TituloRelatorio := 'Pirelli Faturados (Honorários)';

    Filtros     := GetWhere;
    CatSQLAnd(Filtros, ' B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1));

    Form.qryMain.SQL.Text := GetSelect + Filtros;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

function TFormRlPirelliFaturadosHonorariosCtx.GetSelect: string;
begin
  Result := 'SELECT DISTINCT ' +
            ' TP.NR_PROCESSO AS [Processo], ' +
            ' Cast(ISNULL(STUFF((SELECT DISTINCT '','' + LTRIM(RTRIM(R.CD_REFERENCIA)) FROM BROKER.DBO.TREF_CLIENTE R WITH (NOLOCK) ' +
            ' WHERE R.NR_PROCESSO = TP.NR_PROCESSO AND R.TP_REFERENCIA = (CASE WHEN TP.CD_PRODUTO=''02'' THEN ''21'' WHEN TP.CD_PRODUTO = ''01'' THEN ''01'' END) ' +
            ' FOR XML PATH('''')), 1, 1, ''''), '''') as Varchar(300)) AS [Ref. Prometeon / FATURA], ' +
            ' RPS.seniorKey AS [RPS], ' +
            ' CONVERT(VARCHAR(MAX),B.nr_nota) AS [NFE], ' +
            ' CASE WHEN B.type = ''TAX_RECEIPT'' THEN NULL ELSE ' +
            ' CONVERT(FLOAT(2), ((IIV.PRICE) - ((IIV.PRICE * 4.65) / 100) - ((IIV.PRICE * 1.5) / 100) ) ) END AS [Valor Comissão], ' +
            ' FT.seniorKey AS [Fatura de Despesa], ' +
            ' CASE WHEN B.type=''TAX_INVOICE'' THEN NULL ELSE REPLACE(IIV.price,''.'','','') END AS [Valor da Despesa], ' +
            ' IIVV.name AS [Item], ' +
            ' CONVERT(VARCHAR(10),B.created,103) AS [Data de Faturamento], ' +
            ' CONVERT(VARCHAR(10),B.dueDate,103) AS [Data de Vencimento], ' +
            ' TP.CD_DUE AS [DUE]                                          '+
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

function TFormRlPirelliFaturadosHonorariosCtx.GetWhere: string;
begin
  Result := 'WHERE B.STATUS=''INVOICED'' ' +
            'AND TP.CD_GRUPO=''C22'' ';
end;


end.
