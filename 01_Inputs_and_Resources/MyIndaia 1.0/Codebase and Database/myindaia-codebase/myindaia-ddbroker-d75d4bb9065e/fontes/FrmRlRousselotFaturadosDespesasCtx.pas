unit FrmRlRousselotFaturadosDespesasCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFormRlRousselotFaturadosDespesasCtx = class(TForm)
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
  FormRlRousselotFaturadosDespesasCtx: TFormRlRousselotFaturadosDespesasCtx;

implementation

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{$R *.dfm}

procedure TFormRlRousselotFaturadosDespesasCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormRlRousselotFaturadosDespesasCtx.BitBtn1Click(Sender: TObject);
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
    Form.TituloRelatorio := 'Rousselot Despesas';

    CatSQLAnd(Filtros, ' TP.CD_PRODUTO = ' + QuotedStr(CodigoProduto));
    CatSQLAnd(Filtros, ' B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1));

    Form.qryMain.SQL.Text := GetSelect + Filtros + ' GROUP BY B.SENIORKEY, B.CREATED, EN.NM_EMPRESA, TP.NR_PROCESSO, I.NAME';
    Form.Executa;
  finally
    Form.Free;
  end;
end;

procedure TFormRlRousselotFaturadosDespesasCtx.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto);
    msk_cd_produtoExit(nil);
  end
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure TFormRlRousselotFaturadosDespesasCtx.msk_cd_produtoExit(Sender: TObject);
begin
  btn_co_produtoClick(msk_cd_produto);
  ValCodEdt( msk_cd_produto );
end;

function TFormRlRousselotFaturadosDespesasCtx.GetSelect: string;
begin
  Result :=
    ' SELECT DISTINCT ' + #13#10 +
    ' B.SENIORKEY AS [Nota Fiscal], ' + #13#10 +
    ' CONVERT(VARCHAR(10),B.CREATED,103) AS [Emissão], ' + #13#10 +
    ' EN.NM_EMPRESA AS [Cliente], ' + #13#10 +
    '   TP.NR_PROCESSO AS [Processo], ' + #13#10 +
    '    CAST(STUFF(( SELECT DISTINCT '', '' + LTRIM(RTRIM(RC.CD_REFERENCIA)) ' + #13#10 +
    '    FROM BROKER.DBO.TREF_CLIENTE RC WITH (NOLOCK) ' + #13#10 +
    '    WHERE RC.NR_PROCESSO      = TP.NR_PROCESSO ' + #13#10 +
    '    AND RC.TP_REFERENCIA    = ''01'' ' + #13#10 +
    '    FOR XML PATH('''') ), 1, 1, '''') AS VARCHAR(200)) AS [Ref. Prometeon], ' + #13#10 +
    ' I.name AS [Descrição Serviço], ' + #13#10 +
    ' SUM(IR.price) AS [Valor] ' + #13#10 +

    ' FROM MYINDAIAV2.DBO.Billing B (NOLOCK) ' + #13#10 +

    '	LEFT JOIN MYINDAIAV2.DBO.Billing_PaymentRequested BPR (NOLOCK) ON BPR.Billing_id = B.id ' + #13#10 +
    ' LEFT JOIN MYINDAIAV2.DBO.PaymentRequested_ItemPaymentRequested PIPR (NOLOCK) ON PIPR.PAYMENTREQUESTED_ID = BPR.payments_id ' + #13#10 +
    ' LEFT JOIN MYINDAIAV2.DBO.ItemPaymentRequested IR (NOLOCK) ON IR.ID = PIPR.items_id ' + #13#10 +
    ' LEFT JOIN MYINDAIAV2.DBO.Item I (NOLOCK) ON I.ID = IR.item_id  ' + #13#10 +
	  ' LEFT JOIN MYINDAIAV2.DBO.PaymentRequested PR (NOLOCK) ON PR.ID = PIPR.PaymentRequested_id  ' + #13#10 +
    ' LEFT JOIN MYINDAIAV2.DBO.CustomClearance CC (NOLOCK) ON CC.ID = pr.customClearance_id   ' + #13#10 +
    ' LEFT JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = CC.customID    ' + #13#10 +
    ' INNER JOIN BROKER.DBO.TEMPRESA_NAC EN (NOLOCK) ON EN.CD_EMPRESA = TP.CD_CLIENTE   ' ;


end;

function TFormRlRousselotFaturadosDespesasCtx.GetWhere: string;
begin
  Result := 'WHERE B.STATUS = ''INVOICED''' +
            '  AND b.type = ''TAX_RECEIPT''' +
            '  AND TP.CD_GRUPO = ''C09'' ';
end;

end.
