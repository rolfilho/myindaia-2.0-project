unit FrmPagamentosNaoFaturadosCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFormPagamentosNaoFaturadosCtx = class(TForm)
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    lblGrupo: TLabel;
    btn_co_grupo: TSpeedButton;
    edt_nm_produto: TEdit;
    msk_cd_produto: TMaskEdit;
    mskDataregistroIni: TMaskEdit;
    mskDataregistroFin: TMaskEdit;
    msk_cd_grupo: TMaskEdit;
    edt_nm_grupo: TEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
  private
    DataInicial: TDateTime;
    DataFinal: TDateTime;
    function GetSQL: string;
  public
    { Public declarations }
  end;

var
  FormPagamentosNaoFaturadosCtx: TFormPagamentosNaoFaturadosCtx;

implementation

{$R *.dfm}

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

procedure TFormPagamentosNaoFaturadosCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

function TFormPagamentosNaoFaturadosCtx.GetSQL: string;
begin
  Result :=
    '        SELECT CC.customid                                AS [Ref. Indaiá],                                                                   '+
    '               PR.SENIORKEY                               AS [Nr. Título],                                                                    '+    
    '               CONVERT(VARCHAR(10),PR.receiveddate,103)   AS [Data do Pagamento],                                                             '+
    '               I.NAME                                     AS [Item],                                                                          '+
    '               IPR.price                                  AS [Valor],                                                                         '+
    '               F.NAME                                     AS [Favorecido],                                                                    '+
    '               G.NM_GRUPO                                 AS [Grupo],                                                                         '+
    '               EN.nm_empresa                              AS [Cliente],                                                                       '+
    '               Substring(EN.cgc_empresa, 1, 2) + ''.''                                                                                        '+
    '               + Substring(EN.cgc_empresa, 3, 3) + ''.''                                                                                      '+
    '               + Substring(EN.cgc_empresa, 6, 3) + ''/''                                                                                      '+
    '               + Substring(EN.cgc_empresa, 9, 4) + ''-''                                                                                      '+
    '               + Substring(EN.cgc_empresa, 13, 2)         AS [CNPJ],                                                                          '+
    '               CONVERT(VARCHAR(10),FUP041.DT_REALIZACAO,103)   AS [Data Liberação para transporte],                                           '+
    '               CONVERT(VARCHAR(10),FUP114.DT_REALIZACAO,103)   AS [Data envio ao faturamento],                                                '+
    '               CONVERT(VARCHAR(10),FUP092.DT_REALIZACAO,103)   AS [Data Faturamento],                                                         '+
    ' CAST(STUFF(( SELECT DISTINCT '', '' + LTRIM(RTRIM(RC.CD_REFERENCIA)) '+
    ' FROM BROKER.DBO.TREF_CLIENTE RC WITH (NOLOCK) '+
    ' WHERE RC.NR_PROCESSO = TP.NR_PROCESSO '+
    ' AND RC.TP_REFERENCIA = ''08'' '+
    ' FOR XML PATH('''') ), 1, 1, '''') AS VARCHAR(max)) AS [Nr. Ref. Embarque] '+
    '      FROM myindaiav2.dbo.paymentrequested                      PR     (NOLOCK)                                                               '+
    ' LEFT JOIN myindaiav2.dbo.paymentrequested_itempaymentrequested PRIPR  (NOLOCK) ON PRIPR.paymentrequested_id = PR.id                          '+
    ' LEFT JOIN myindaiav2.dbo.itempaymentrequested                  IPR    (NOLOCK) ON IPR.id                    = PRIPR.items_id                 '+
    ' LEFT JOIN myindaiav2.dbo.item                                  I      (NOLOCK) ON I.id                      = IPR.item_id                    '+
    ' LEFT JOIN myindaiav2.dbo.customclearance                       CC     (NOLOCK) ON CC.id                     = PR.customclearance_id          '+
    ' LEFT JOIN broker.dbo.tprocesso                                 TP     (NOLOCK) ON TP.nr_processo            = CAST(CC.CUSTOMID AS CHAR(18))  '+
    ' LEFT JOIN broker.dbo.tgrupo                                    G      (NOLOCK) ON G.cd_grupo                = TP.cd_grupo                    '+
    ' LEFT JOIN myindaiav2.dbo.beneficiary                           F      (NOLOCK) ON F.id                      = PR.beneficiary_id              '+
    ' LEFT JOIN broker.dbo.tempresa_nac                              EN     (NOLOCK) ON EN.cd_empresa             = TP.cd_cliente                  '+
    ' LEFT JOIN BROKER.DBO.TFOLLOWUP                                 FUP041 (NOLOCK) ON FUP041.NR_PROCESSO        = TP.NR_PROCESSO                 '+
    '                                                                               AND FUP041.CD_EVENTO=''041''                                   '+
    ' LEFT JOIN BROKER.DBO.TFOLLOWUP                                 FUP114 (NOLOCK) ON FUP114.NR_PROCESSO        = TP.NR_PROCESSO                 '+
    '                                                                               AND FUP114.CD_EVENTO=''114''                                   '+
    ' LEFT JOIN BROKER.DBO.TFOLLOWUP                                 FUP092 (NOLOCK) ON FUP092.NR_PROCESSO        = TP.NR_PROCESSO                 '+
    '                                                                               AND FUP092.CD_EVENTO=''092''                                   ';
end;

procedure TFormPagamentosNaoFaturadosCtx.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  Filtros: string;
begin
  Form := TfmConsulta.Create(nil);
  try
    DataInicial := StrToDateTimeDef(mskDataregistroIni.Text, 0);
    DataFinal   := StrToDateTimeDef(mskDataregistroFin.Text, 0);
    Filtros     := ' WHERE  PR.status = ''APPROVED'' AND PR.billing_id IS NULL ';

    Form.TituloRelatorio := 'Pagamentos não Faturados';

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

      CatSQLAnd(Filtros, ' PR.receiveddate >= ' + DateToSQL(DataInicial) + ' AND PR.receiveddate < ' + DateToSQL(DataFinal + 1));
    end;

    Form.qryMain.SQL.Text := GetSQL + Filtros;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

procedure TFormPagamentosNaoFaturadosCtx.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto);
    msk_cd_produtoExit(nil);
  end
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure TFormPagamentosNaoFaturadosCtx.msk_cd_produtoExit(Sender: TObject);
begin
  btn_co_produtoClick(msk_cd_produto);
  ValCodEdt( msk_cd_produto );
end;

procedure TFormPagamentosNaoFaturadosCtx.btn_co_grupoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_grupo.Text := ConsultaOnLineEx('TGRUPO','Grupo',['CD_GRUPO','NM_GRUPO'],['Código','Nome'],'CD_GRUPO')
  else
    edt_nm_Grupo.Text := ConsultaLookUP('TGRUPO','CD_GRUPO', msk_cd_grupo.Text,'NM_GRUPO');
end;

end.
