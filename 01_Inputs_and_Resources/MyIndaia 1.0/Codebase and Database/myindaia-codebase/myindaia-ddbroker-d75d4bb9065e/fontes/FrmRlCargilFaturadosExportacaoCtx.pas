unit FrmRlCargilFaturadosExportacaoCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFormRlCargilFaturadosExportacao = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    mskDataregistroIni: TMaskEdit;
    mskDataregistroFin: TMaskEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    DataInicial: TDateTime;
    DataFinal: TDateTime;
    function GetSQL: string;
    function GetWhere: string;
    function GetGroupBy: string;
  public
    { Public declarations }
  end;

var
  FormRlCargilFaturadosExportacao: TFormRlCargilFaturadosExportacao;

implementation

{$R *.dfm}

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

procedure TFormRlCargilFaturadosExportacao.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

function TFormRlCargilFaturadosExportacao.GetSQL: string;
begin
  Result := 'SELECT TP.NR_PROCESSO                                         AS [Ref. Indaiá],                                          '+
            '		    A.NM_AREA                                              AS [Área],                                                 '+
            '		    EN.NM_EMPRESA                                          AS [Cliente],                                              '+
            '		    SUBSTRING(EN.CGC_EMPRESA,1,2)+''.''                                                                               '+
            '		    +SUBSTRING(EN.CGC_EMPRESA,3,3)+''.''                                                                              '+
            '		    +SUBSTRING(EN.CGC_EMPRESA,6,3)+''/''                                                                              '+
            '		    +SUBSTRING(EN.CGC_EMPRESA,9,4)+''-''                                                                              '+
            '		    +SUBSTRING(EN.CGC_EMPRESA,13,2)                        AS [CNPJ],                                                 '+
            '		    EV132.DT_REALIZACAO                                    AS [Data de Embarque],                                     '+
            '		    TP.NR_DDE                                              AS [Nr. DDE],                                              '+
            '		    LE.DESCRICAO                                           AS [Aduana],                                               '+
            '		    TP.DT_REG_DDE                                          AS [Data DDE],                                             '+
            '		    (B.valorTibutavel)                                     AS [Valor Honorário],                                      '+
            '		    B.created                                              AS [Data Envio SDA],                                       '+
            '		    IR.price                                               AS [Valor SDA],                                            '+
            '		    DATEDIFF(day,EV088.DT_REALIZACAO,EV092.DT_REALIZACAO)  AS [Meta Prestação de Contas],                             '+
            '		    SUM(B.valorTibutavel) + IR.price                       AS [Valor Total],                                          '+
            '		    EV088.DT_REALIZACAO                                    AS [Data Desembaraço DI],                                  '+
            '		    EV092.DT_REALIZACAO                                    AS [Dt. Envio Prest. Contas],                              '+
            '		    (CASE WHEN B.SENIORKEY IS NOT NULL                                                                                '+
            '             THEN CAST(B.SENIORKEY AS INT)                                                                               '+
            '             ELSE CAST(B.ID AS INT)                                                                                      '+
            '        END)                                                  AS [NFS-e],                                                '+
            '        BROKER.DBO.FN_CONCATENA_REFRENCIA(TP.NR_PROCESSO)     AS [Ref. Cliente]                                          '+
            '       FROM MYINDAIAV2.DBO.Billing                               B     (NOLOCK)                                          '+
            '  LEFT JOIN MYINDAIAV2.DBO.Billing_ItemInvoiced                  BII   (NOLOCK)ON BII.Billing_id=B.id                    '+
            '  LEFT JOIN MYINDAIAV2.DBO.ItemInvoiced                          II    (NOLOCK)ON II.id=BII.itensInvoiced_id             '+
            '  LEFT JOIN MYINDAIAV2.DBO.CustomClearance                       CC    (NOLOCK)ON CC.ID=II.customClearance_id            '+
            '  LEFT JOIN MYINDAIAV2.DBO.Billing_PaymentRequested              BPR   (NOLOCK)ON BPR.Billing_id=B.id                    '+
            '  LEFT JOIN MYINDAIAV2.DBO.PaymentRequested                      PR    (NOLOCK)ON PR.ID=BPR.PAYMENTS_ID                  '+
            '  LEFT JOIN MYINDAIAV2.DBO.PaymentRequested_ItemPaymentRequested PIPR  (NOLOCK)ON PIPR.PAYMENTREQUESTED_ID=PR.ID         '+
            '  LEFT JOIN MYINDAIAV2.DBO.ItemPaymentRequested                  IR    (NOLOCK)ON IR.ID=PIPR.items_id AND IR.ITEM_ID=188 '+
            '  LEFT JOIN BROKER.DBO.TPROCESSO                                 TP    (NOLOCK)ON TP.NR_PROCESSO=CC.customID             '+
            '  LEFT JOIN BROKER.DBO.TEMPRESA_NAC                              EN    (NOLOCK)ON EN.CD_EMPRESA=TP.CD_CLIENTE            '+
            '  LEFT JOIN BROKER.DBO.TREF_CLIENTE                              RC    (NOLOCK)ON RC.NR_PROCESSO=TP.NR_PROCESSO          '+
            '                                                                              AND RC.TP_REFERENCIA=''01''                '+
            '  LEFT JOIN BROKER.DBO.TAREA                                     A     (NOLOCK)ON A.CD_AREA=TP.CD_AREA                   '+
            '  LEFT JOIN BROKER.DBO.TFOLLOWUP                                 EV132 (NOLOCK)ON EV132.NR_PROCESSO=TP.NR_PROCESSO       '+
            '                                                                              AND EV132.CD_EVENTO=''132''                '+
            '  LEFT JOIN BROKER.DBO.TFOLLOWUP                                 EV088 (NOLOCK)ON EV088.NR_PROCESSO=TP.NR_PROCESSO       '+
            '                                                                              AND EV088.CD_EVENTO=''088''                '+
            '  LEFT JOIN BROKER.DBO.TFOLLOWUP                                 EV092 (NOLOCK)ON EV092.NR_PROCESSO=TP.NR_PROCESSO       '+
            '                                                                              AND EV092.CD_EVENTO=''092''                '+
            '  LEFT JOIN BROKER.DBO.TSERVICO_NOVO                             SN    (NOLOCK)ON SN.CD_SERVICO=TP.CD_SERVICO            '+
            '  LEFT JOIN BROKER.DBO.TVIA_TRANSP_BROKER                        VT    (NOLOCK)ON VT.CD_VIA_TRANSP=SN.CD_VIA_TRANSPORTE  '+
            '  LEFT JOIN BROKER.DBO.TLOCAL_EMBARQUE                           LE    (NOLOCK)ON LE.CODIGO=TP.CD_LOCAL_EMBARQUE         '+
            '';
end;

function TFormRlCargilFaturadosExportacao.GetWhere: string;
begin
  Result := ' WHERE                                                                         '+
            '	      B.STATUS=''INVOICED''                                                   '+
            '   AND (B.TYPE=''TAX_INVOICE'' OR (B.TYPE=''TAX_RECEIPT'' AND IR.ITEM_ID=188)) '+
            '	  AND TP.CD_GRUPO=''B58''                                                     '+
            '	  AND TP.CD_PRODUTO=''02''                                                    ';
end;

procedure TFormRlCargilFaturadosExportacao.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  Filtros: string;
begin
  Form := TfmConsulta.Create(nil);
  try
    DataInicial := StrToDateTimeDef(mskDataregistroIni.Text, 0);
    DataFinal := StrToDateTimeDef(mskDataregistroFin.Text, 0);
    Filtros := GetWhere;
    Form.TituloRelatorio := 'Cargil - Faturados Exportação';
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

function TFormRlCargilFaturadosExportacao.GetGroupBy: string;
begin
  Result := 'GROUP BY	TP.NR_PROCESSO, '+
            '			A.NM_AREA, '+
            '			EN.NM_EMPRESA, '+
            '			EN.CGC_EMPRESA, '+
            '			EV132.DT_REALIZACAO, '+
            '			VT.NM_VIA_TRANSP, '+
            '			EV088.DT_REALIZACAO, '+
            '			EV092.DT_REALIZACAO, '+
            '			B.seniorKey, '+
            '			B.id, '+
            '     B.valorTibutavel, '+
            '			B.created, '+
            '			IR.price, '+
            '			TP.NR_DDE, '+
            '			LE.DESCRICAO, '+
            '			TP.DT_REG_DDE ';
end;

end.

