unit FrmRlFerreroFaturadosCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFormRlFerreroFaturadosCtx = class(TForm)
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
  FormRlFerreroFaturadosCtx: TFormRlFerreroFaturadosCtx;

implementation

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{$R *.dfm}

procedure TFormRlFerreroFaturadosCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormRlFerreroFaturadosCtx.BitBtn1Click(Sender: TObject);
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

procedure TFormRlFerreroFaturadosCtx.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto);
    msk_cd_produtoExit(nil);
  end
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure TFormRlFerreroFaturadosCtx.msk_cd_produtoExit(Sender: TObject);
begin
  btn_co_produtoClick(msk_cd_produto);
  ValCodEdt( msk_cd_produto );
end;

function TFormRlFerreroFaturadosCtx.GetSelect: string;
begin
  Result :=
    ' SELECT	DISTINCT ' + #13#10 +
    ' CAST(STUFF(( SELECT DISTINCT '', '' + LTRIM(RTRIM(RC.CD_REFERENCIA)) ' + #13#10 +
    '                      FROM BROKER.DBO.TREF_CLIENTE RC WITH (NOLOCK) ' + #13#10 +
    '                     WHERE RC.NR_PROCESSO      = TP.NR_PROCESSO ' + #13#10 +
    '                       AND RC.TP_REFERENCIA    = ''01'' ' + #13#10 +
    '             FOR XML PATH('''') ), 1, 1, '''') AS VARCHAR(200)) AS [EASY], ' + #13#10 +
    ' ''Indaia'' AS [FORNECEDOR], ' + #13#10 +
    ' B.seniorKey AS [FATURA], ' + #13#10 +
    ' CONVERT(VARCHAR(MAX),CASE WHEN B.seniorKey IS NULL THEN B.id ELSE NULL END) AS [FT], ' + #13#10 +
    ' B.nr_nota AS [NF / CTE], ' + #13#10 +
    ' IIVV.name AS [TIPO], ' + #13#10 +
    ' REPLACE(IIV.price,''.'','','') AS [VALOR], ' + #13#10 +
    ' CONVERT(VARCHAR(10),B.created,103) AS [DATA FATURA], ' + #13#10 +
    ' CONVERT(VARCHAR(10),B.dueDate,103) AS [VCTO FATURA] ' + #13#10 +
    ' FROM MYINDAIAV2.DBO.Billing B (NOLOCK) ' + #13#10 +
    ' LEFT JOIN MYINDAIAV2.DBO.Billing_ItemInvoiced IV (NOLOCK) ON IV.Billing_id=B.id ' + #13#10 +
    ' LEFT JOIN MYINDAIAV2.DBO.ItemInvoiced IIV (NOLOCK) ON IIV.id=IV.itensInvoiced_id ' + #13#10 +
    ' LEFT JOIN MYINDAIAV2.DBO.ITEM IIVV (NOLOCK) ON IIVV.id=IIV.item_id ' + #13#10 +
    ' LEFT JOIN MYINDAIAV2.DBO.CustomClearance CC (NOLOCK) ON CC.ID=IIV.customClearance_id ' + #13#10 +
    ' LEFT JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO=CC.customID ';

end;

function TFormRlFerreroFaturadosCtx.GetWhere: string;
begin
  Result := 'WHERE B.STATUS = ''INVOICED'' ' +
            '		AND TP.CD_GRUPO = ''644'' ';
end;

end.
