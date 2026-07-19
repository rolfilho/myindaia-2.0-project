unit FrmCargilFaturadoImportacaoCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFormCargilFaturadosImportacaoCtx = class(TForm)
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
    DataInicial: TDateTime;
    DataFinal: TDateTime;
    function GetSQL: string;
    function GetWhere: string;
    function GetOrderBy: string;

  public
    { Public declarations }
  end;

var
  FormCargilFaturadosImportacaoCtx: TFormCargilFaturadosImportacaoCtx;

implementation

{$R *.dfm}

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

procedure TFormCargilFaturadosImportacaoCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormCargilFaturadosImportacaoCtx.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  Filtros: string;
begin
  Form := TfmConsulta.Create(nil);
  try
    DataInicial := StrToDateTimeDef(mskDataregistroIni.Text, 0);
    DataFinal   := StrToDateTimeDef(mskDataregistroFin.Text, 0);
    Filtros     := GetWhere;

    Form.TituloRelatorio := 'Cargil - Faturados Importação';

    if (DataInicial > 0) and (DataFinal > 0) then
    begin
      if DataInicial > DataFinal then
      begin
        MessageDlg('Data inicial de Solicitação maior que a data final.', mtWarning, [mbOK], 0);
        Exit;
      end;
      CatSQLAnd(Filtros, ' B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1));
    end;

    Form.qryMain.SQL.Text := GetSQL + Filtros + GetOrderBy;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

function TFormCargilFaturadosImportacaoCtx.GetSQL: string;
begin
  Result := '  SELECT TP.nr_processo                                           AS [Ref. Indaiá],                                                '+
            '         A.nm_area                                                AS [Área],                                                       '+
            '         EN.nm_empresa                                            AS [Cliente] ,                                                   '+
            '         Substring(EN.cgc_empresa, 1, 2)   + ''.''                                                                                 '+
            '         + Substring(EN.cgc_empresa, 3, 3) + ''.''                                                                                 '+
            '         + Substring(EN.cgc_empresa, 6, 3) + ''/''                                                                                 '+
            '         + Substring(EN.cgc_empresa, 9, 4) + ''-''                                                                                 '+
            '         + Substring(EN.cgc_empresa, 13, 2)                       AS [CNPJ],                                                       '+
            '         EV162.dt_realizacao                                      AS [Data de Descarga],                                           '+
            '         VT.nm_via_transp                                         AS [Modal],                                                      '+
            '         URF.descricao                                            AS [Aduana],                                                     '+
            '         EV088.dt_realizacao                                      AS [Data Desembaraço DI],                                        '+
            '         EV092.dt_realizacao                                      AS [Data Envio Prest. Contas],                                   '+
            '         ( CASE WHEN B.seniorkey IS NOT NULL                                                                                       '+
            '                THEN CAST(B.seniorkey as INT)                                                                                      '+
            '                ELSE CAST(B.id as INT)                                                                                             '+
            '           END )                                                  AS [NFS-e],                                                      '+
            '         (B.valortibutavel)                                       AS [Valor Honorário],                                            '+
            '         B.created                                                AS [Data Envio SDA],                                             '+
            '         IR.price                                                 AS [Valor SDA],                                                  '+
            '         Datediff(day, EV088.dt_realizacao, EV092.dt_realizacao)  AS [Meta Prestação de Contas],                                   '+
            '         SUM(B.valortibutavel) + IR.price                         AS [Valor Total],                                                '+
            '         BROKER.DBO.FN_CONCATENA_REFRENCIA(TP.NR_PROCESSO)        AS [Referências]                                                 '+
            '  FROM   myindaiav2.dbo.billing                                         B     (NOLOCK)                                             '+
            '         LEFT JOIN myindaiav2.dbo.billing_iteminvoiced                  BII   (NOLOCK)  ON BII.billing_id = B.id                   '+
            '         LEFT JOIN myindaiav2.dbo.iteminvoiced                          II    (NOLOCK)  ON II.id = BII.itensinvoiced_id            '+
            '         LEFT JOIN myindaiav2.dbo.customclearance                       CC    (NOLOCK)  ON CC.id = II.customclearance_id           '+
            '         LEFT JOIN myindaiav2.dbo.billing_paymentrequested              BPR   (NOLOCK)  ON BPR.billing_id = B.id                   '+
            '         LEFT JOIN myindaiav2.dbo.paymentrequested                      PR    (NOLOCK)  ON PR.id = BPR.payments_id                 '+
            '         LEFT JOIN myindaiav2.dbo.paymentrequested_itempaymentrequested PIPR  (NOLOCK)  ON PIPR.paymentrequested_id = PR.id        '+
            '         LEFT JOIN myindaiav2.dbo.itempaymentrequested                  IR    (NOLOCK)  ON IR.id  = PIPR.items_id                  '+
            '                                                                                       AND IR.item_id  = 188                       '+
            '         LEFT JOIN broker.dbo.tprocesso                                 TP    (NOLOCK)  ON TP.nr_processo = CC.customid            '+
            '         LEFT JOIN broker.dbo.tempresa_nac                              EN    (NOLOCK)  ON EN.cd_empresa  = TP.cd_cliente          '+
            '         LEFT JOIN broker.dbo.tref_cliente                              RC    (NOLOCK)  ON RC.nr_processo  = TP.nr_processo        '+
            '                                                                                       AND RC.tp_referencia = ''01''               '+
            '         LEFT JOIN broker.dbo.tarea                                     A     (NOLOCK)  ON A.cd_area = TP.cd_area                  '+
            '         LEFT JOIN broker.dbo.tfollowup                                 EV162 (NOLOCK)  ON EV162.nr_processo = TP.nr_processo      '+
            '                                                                                       AND EV162.cd_evento = ''162''               '+
            '         LEFT JOIN broker.dbo.tfollowup                                 EV088 (NOLOCK)  ON EV088.nr_processo = TP.nr_processo      '+
            '                                                                                       AND EV088.cd_evento = ''088''               '+
            '         LEFT JOIN broker.dbo.tfollowup                                 EV092 (NOLOCK)  ON EV092.nr_processo = TP.nr_processo      '+
            '                                                                                       AND EV092.cd_evento = ''092''               '+
            '         LEFT JOIN broker.dbo.tservico_novo                             SN    (NOLOCK)  ON SN.cd_servico = TP.cd_servico           '+
            '         LEFT JOIN broker.dbo.tvia_transp_broker                        VT    (NOLOCK)  ON VT.cd_via_transp = SN.cd_via_transporte '+
            '         LEFT JOIN broker.dbo.tdeclaracao_importacao                    DI    (NOLOCK)  ON DI.nr_processo = TP.nr_processo         '+
            '         LEFT JOIN broker.dbo.turf                                      URF   (NOLOCK)  ON URF.codigo = DI.cd_urf_despacho         ';
end;

function TFormCargilFaturadosImportacaoCtx.GetOrderBy: string;
begin
  Result :=   ' GROUP BY TP.nr_processo, '+
              '          A.nm_area, '+
              '          EN.nm_empresa, '+
              '          EN.cgc_empresa, '+
              '          EV162.dt_realizacao, '+
              '          VT.nm_via_transp, '+
              '          URF.descricao, '+
              '          EV088.dt_realizacao, '+
              '          EV092.dt_realizacao, '+
              '          B.seniorkey, '+
              '          B.id, '+
              '          B.valorTibutavel, '+
              '          B.created, '+
              '          IR.price ';
end;

function TFormCargilFaturadosImportacaoCtx.GetWhere: string;
begin
  Result := ' WHERE  B.status = ''INVOICED'' '+
            '   AND (B.TYPE =''TAX_INVOICE'' OR (B.TYPE=''TAX_RECEIPT'' AND IR.ITEM_ID=188)) '+
            '   AND TP.cd_grupo   = ''B58'' '+
            '   AND TP.cd_produto = ''01'' ';
end;

end.
