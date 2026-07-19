unit URlPhilipsFaturadosCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFrmRlPhilipsFaturadosCtx = class(TForm)
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
  FrmRlPhilipsFaturadosCtx: TFrmRlPhilipsFaturadosCtx;

implementation

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{$R *.dfm}

procedure TFrmRlPhilipsFaturadosCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmRlPhilipsFaturadosCtx.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  Filtros: string;
begin
  Form := TfmConsulta.Create(nil);
  try
    DataInicial           := StrToDateTimeDef(mskDataregistroIni.Text, 0);
    DataFinal             := StrToDateTimeDef(mskDataregistroFin.Text, 0);
    Filtros               := GetWhere;
    Form.TituloRelatorio  := 'Faturados Philips';

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

    Form.qryMain.SQL.Text := GetSelect + Filtros;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

procedure TFrmRlPhilipsFaturadosCtx.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto);
    msk_cd_produtoExit(nil);
  end
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure TFrmRlPhilipsFaturadosCtx.msk_cd_produtoExit(Sender: TObject);
begin
  btn_co_produtoClick(msk_cd_produto);
  ValCodEdt( msk_cd_produto );
end;

function TFrmRlPhilipsFaturadosCtx.GetSelect: string;
begin
  Result :=
      '   SELECT	DISTINCT                                                                                                                       ' + sLineBreak +
      '       TP.NR_PROCESSO                                          AS [Nr. Processo],                                                         ' + sLineBreak +
      '   		SUBSTRING(EN.CGC_EMPRESA,1,2)+''.''+                                                                                               ' + sLineBreak +
      '   		SUBSTRING(EN.CGC_EMPRESA,3,3)+''.''+                                                                                               ' + sLineBreak +
      '   		SUBSTRING(EN.CGC_EMPRESA,6,3)+''/''+				                                                                                       ' + sLineBreak +
      '   		SUBSTRING(EN.CGC_EMPRESA,9,4)+''-''+				                                                                                       ' + sLineBreak +
      '   		SUBSTRING(EN.CGC_EMPRESA,13,2)						              AS [CNPJ Cliente],                                                         ' + sLineBreak +
      '       EN.NM_EMPRESA                                           AS [Cliente],		                                                           ' + sLineBreak +
      '   		RPS.SENIORKEY                 						              AS [Número Fatura],                                                        ' + sLineBreak +
      '   		EV593.DT_REALIZACAO           						              AS [Data Envio Fatura],                                                    ' + sLineBreak +
      '   		CONVERT(VARCHAR(10),B.CREATED,103)				             	AS [Data Emissão],                                                         ' + sLineBreak +
      '   		CONVERT(VARCHAR(10),B.DUEDATE,103)				             	AS [Data Vencimento],                                                      ' + sLineBreak +
      '   		REPLACE(B.VALORTIBUTAVEL,''.'','','') 		             	AS [Valor Bruto],                                                          ' + sLineBreak +
      '   		REPLACE(B.COFINS + B.IR +                                                                                                          ' + sLineBreak +
      '   		CASE WHEN B.ISS IS NULL                                                                                                            ' + sLineBreak +
      '   		     THEN 0                                                                                                                        ' + sLineBreak +
      '   		     ELSE B.ISS                                                                                                                    ' + sLineBreak +
      '   		END,''.'','','')                      		             	AS [Impostos],                                                             ' + sLineBreak +
      '       CAST(N.NUMDFS	AS VARCHAR(20))                           AS [NF],				                                                           ' + sLineBreak +
      '   		IIVV.NAME                            			             	AS [Tipo Serviço],                                                         ' + sLineBreak +
      '   		SUBSTRING(FILIAL.TAXID,1,2)+''.''+                                                                                                 ' + sLineBreak +
      '   		SUBSTRING(FILIAL.TAXID,3,3)+''.''+                                                                                                 ' + sLineBreak +
      '   		SUBSTRING(FILIAL.TAXID,6,3)+''/''+				                                                                                         ' + sLineBreak +
      '   		SUBSTRING(FILIAL.TAXID,9,4)+''-''+				                                                                                         ' + sLineBreak +
      '   		SUBSTRING(FILIAL.TAXID,13,2)						                AS [CNPJ Fornecedor],                                                      ' + sLineBreak +
      '   		''''                                                    AS [Observações],                                                          ' + sLineBreak +
      '       CAST(STUFF(( SELECT '', '' + LTRIM(RTRIM(RC.CD_REFERENCIA))                                                                        ' + sLineBreak +
      '                     FROM TREF_CLIENTE RC WITH (NOLOCK)                                                                                   ' + sLineBreak +
      '                    WHERE RC.NR_PROCESSO      = TP.NR_PROCESSO                                                                            ' + sLineBreak +
      '                      AND RC.TP_REFERENCIA    = ''04''                                                                                    ' + sLineBreak +
      '            FOR XML PATH('''') ), 1, 1, '''') AS VARCHAR(200)) AS [IMPEX]                                                                 ' + sLineBreak +
      '   FROM MYINDAIAV2.DBO.BILLING                   				          B      (NOLOCK)                                                        ' + sLineBreak +
      '   LEFT JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED					          IV     (NOLOCK)  ON IV.BILLING_ID            = B.ID                    ' + sLineBreak +
      '   LEFT JOIN MYINDAIAV2.DBO.ITEMINVOICED        					          IIV    (NOLOCK)  ON IIV.ID                   = IV.ITENSINVOICED_ID     ' + sLineBreak +
      '   LEFT JOIN MYINDAIAV2.DBO.ITEM                					          IIVV   (NOLOCK)  ON IIVV.ID                  = IIV.ITEM_ID             ' + sLineBreak +
      '   LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE                        CC     (NOLOCK)  ON CC.ID                    = IIV.CUSTOMCLEARANCE_ID  ' + sLineBreak +
      '        JOIN BROKER.DBO.TPROCESSO                                  TP     (NOLOCK)  ON TP.NR_PROCESSO           = CC.CUSTOMID             ' + sLineBreak +
      '        JOIN BROKER.DBO.TEMPRESA_NAC                               EN     (NOLOCK)  ON EN.CD_EMPRESA            = TP.CD_CLIENTE           ' + sLineBreak +
      '   LEFT JOIN BROKER.DBO.TFOLLOWUP                                  EV593  (NOLOCK)  ON EV593.NR_PROCESSO        = TP.NR_PROCESSO          ' + sLineBreak +
      '                                                                                   AND EV593.CD_EVENTO          = ''593''                 ' + sLineBreak +
      '   LEFT JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED 				          BII    (NOLOCK)  ON BII.BILLING_ID           = B.ID                    ' + sLineBreak +
      '   LEFT JOIN MYINDAIAV2.DBO.ITEMINVOICED         				          II     (NOLOCK)  ON II.ID                    = BII.ITENSINVOICED_ID    ' + sLineBreak +
      '   LEFT JOIN MYINDAIAV2.DBO.BILLING_PAYMENTREQUESTED   	          BPR    (NOLOCK)  ON BPR.BILLING_ID           = B.ID                    ' + sLineBreak +
      '   LEFT JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED           	          PR     (NOLOCK)  ON PR.ID                    = BPR.PAYMENTS_ID         ' + sLineBreak +
      '   LEFT JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYMENTREQUESTED  PIPR   (NOLOCK)  ON PIPR.PAYMENTREQUESTED_ID = PR.ID                   ' + sLineBreak +
      '   LEFT JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED                   IR     (NOLOCK)  ON IR.ID                    = PIPR.ITEMS_ID           ' + sLineBreak +
      '   LEFT JOIN MYINDAIAV2.DBO.ITEM                                   I      (NOLOCK)  ON I.ID                     = IR.ITEM_ID              ' + sLineBreak +
      '   LEFT JOIN MYINDAIAV2.DBO.BILLING             				            RPS    (NOLOCK)  ON RPS.SENIORKEY            = B.SENIORKEY             ' + sLineBreak +
      '                                                                                   AND B.TYPE                   = ''TAX_RECEIPT''         ' + sLineBreak +
      '   LEFT JOIN MYINDAIAV2.DBO.BRANCH                                 FILIAL (NOLOCK)  ON FILIAL.ID                = B.BRANCH_ID             ' + sLineBreak +
      '   LEFT JOIN SENIOR.SAPIENS.DBO.E140IDE                        N      (NOLOCK)  ON N.CODEMP                 = 1                       ' + sLineBreak +
      '                                                                                   AND N.CODFIL                 = B.BRANCH_ID             ' + sLineBreak +
      '                                                                                   AND N.NUMNFV                 = B.SENIORKEY             ' + sLineBreak ;
end;

function TFrmRlPhilipsFaturadosCtx.GetWhere: string;
begin
  Result := 'WHERE B.STATUS=''INVOICED'' '+
            '  AND TP.CD_GRUPO=''B94'' '
end;

end.
