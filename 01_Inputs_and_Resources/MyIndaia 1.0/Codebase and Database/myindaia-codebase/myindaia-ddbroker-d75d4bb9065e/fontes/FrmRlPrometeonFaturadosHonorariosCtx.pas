unit FrmRlPrometeonFaturadosHonorariosCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFormRlPrometeonFaturadosHonorariosCtx = class(TForm)
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
  FormRlPrometeonFaturadosHonorariosCtx: TFormRlPrometeonFaturadosHonorariosCtx;

implementation

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{$R *.dfm}

procedure TFormRlPrometeonFaturadosHonorariosCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormRlPrometeonFaturadosHonorariosCtx.BitBtn1Click(Sender: TObject);
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

    Form.TituloRelatorio := 'Prometeon Faturados (Honorários)';

    Filtros     := GetWhere;
    CatSQLAnd(Filtros, ' B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1));

    Form.qryMain.SQL.Text := GetSelect + Filtros;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

function TFormRlPrometeonFaturadosHonorariosCtx.GetSelect: string;
begin
  Result := 'SELECT DISTINCT ' + sLineBreak +
            ' TP.NR_PROCESSO AS [Processo], ' + sLineBreak +
            ' Cast(ISNULL(STUFF((SELECT '','' + LTRIM(RTRIM(R.CD_REFERENCIA)) FROM BROKER.DBO.TREF_CLIENTE R WITH (NOLOCK) ' + sLineBreak +
            '                    WHERE R.NR_PROCESSO = TP.NR_PROCESSO AND R.TP_REFERENCIA = (CASE WHEN TP.CD_PRODUTO=''02'' THEN ''21'' WHEN TP.CD_PRODUTO=''01'' THEN ''01'' END) ' + sLineBreak +
            '             FOR XML PATH('''')), 1, 1, ''''), '''') as Varchar(300)) AS [Ref. Prometeon / FATURA], ' + sLineBreak +
            ' B.seniorKey AS [RPS], ' + sLineBreak +
            ' REPLACE((ISNULL(B.valorTibutavel,0))-(ISNULL(B.ir,0))-(ISNULL(B.cofins,0))-(ISNULL(B.iss,0)),''.'','','') AS [Valor], ' + sLineBreak +
            ' CONVERT(VARCHAR(10),B.created,103) AS [Data de Faturamento], ' + sLineBreak +
            ' CONVERT(VARCHAR(10),B.dueDate,103) AS [Data de Vencimento] ' + sLineBreak +
            'FROM MYINDAIAV2.DBO.Billing B ' + sLineBreak +
            'LEFT JOIN MYINDAIAV2.DBO.Billing_ItemInvoiced BII ON BII.Billing_id=B.id ' + sLineBreak +
            'LEFT JOIN MYINDAIAV2.DBO.ItemInvoiced II ON II.id=BII.itensInvoiced_id ' + sLineBreak +
            'LEFT JOIN MYINDAIAV2.DBO.ITEM I ON I.id=II.item_id ' + sLineBreak +
            'LEFT JOIN MYINDAIAV2.DBO.CustomClearance CC ON CC.ID=II.customClearance_id ' + sLineBreak +
            'LEFT JOIN BROKER.DBO.TPROCESSO TP ON TP.NR_PROCESSO=CC.customID ' + sLineBreak;
end;

function TFormRlPrometeonFaturadosHonorariosCtx.GetWhere: string;
begin
  Result := 'WHERE B.STATUS=''INVOICED'' ' +
            'AND B.type=''TAX_INVOICE'' ' +
            'AND TP.CD_GRUPO=''C11'' ';
end;


end.
