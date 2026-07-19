unit dDIPreCalculo;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  Tdatm_DI_PreCalculo = class(TDataModule)
    qryMoedas: TQuery;
    qryMoedasCD_MOEDA: TStringField;
    qryMoedasNM_MOEDA: TStringField;
    qryMoedasAP_MOEDA: TStringField;
    qryPreCalculoCapa: TQuery;
    qryPreCalculoAdicao: TQuery;
    dsPreCalculoCapa: TDataSource;
    dsPreCalculoAdicao: TDataSource;
    dsMoedas: TDataSource;
    updPreCalculoCapa: TUpdateSQL;
    updPreCalculoAdicao: TUpdateSQL;
    SP_PRE_CALCULO: TStoredProc;
    qryTotais: TQuery;
    qryTotaisVL_II_REAIS: TFloatField;
    qryTotaisVL_IPI_REAIS: TFloatField;
    qryTotaisVL_BASE_PIS_COFINS: TFloatField;
    qryTotaisVL_PIS_REAIS: TFloatField;
    qryTotaisVL_COFINS_REAIS: TFloatField;
    qryTotaisVL_BASE_ICMS: TFloatField;
    qryTotaisVL_ICMS_REAIS: TFloatField;
    qryTotaisVL_OUTRAS_DESP_REAIS: TFloatField;
    qryTotaisVL_TOTAL: TFloatField;
    qryPreCalculoCapaNR_PROCESSO: TStringField;
    qryPreCalculoCapaCD_INCOTERM: TStringField;
    qryPreCalculoCapaCD_MOEDA_FOB: TStringField;
    qryPreCalculoCapaVL_FOB_MOEDA: TFloatField;
    qryPreCalculoCapaTX_FOB: TFloatField;
    qryPreCalculoCapaCD_MOEDA_FRETE: TStringField;
    qryPreCalculoCapaVL_FRETE_MOEDA: TFloatField;
    qryPreCalculoCapaTX_FRETE: TFloatField;
    qryPreCalculoCapaCD_MOEDA_SEGURO: TStringField;
    qryPreCalculoCapaVL_SEGURO_MOEDA: TFloatField;
    qryPreCalculoCapaTX_SEGURO: TFloatField;
    qryPreCalculoCapaVL_CIF_DOLAR: TFloatField;
    qryPreCalculoCapaTX_DOLAR: TFloatField;
    qryPreCalculoAdicaoNR_PROCESSO: TStringField;
    qryPreCalculoAdicaoNR_ADICAO: TIntegerField;
    qryPreCalculoAdicaoVL_CIF_REAIS: TFloatField;
    qryPreCalculoAdicaoPC_ALIQUOTA_II: TFloatField;
    qryPreCalculoAdicaoVL_II_REAIS: TFloatField;
    qryPreCalculoAdicaoPC_ALIQUOTA_IPI: TFloatField;
    qryPreCalculoAdicaoVL_IPI_REAIS: TFloatField;
    qryPreCalculoAdicaoPC_ALIQUOTA_PIS: TFloatField;
    qryPreCalculoAdicaoVL_PIS_REAIS: TFloatField;
    qryPreCalculoAdicaoPC_ALIQUOTA_COFINS: TFloatField;
    qryPreCalculoAdicaoVL_COFINS_REAIS: TFloatField;
    qryPreCalculoAdicaoPC_ALIQUOTA_ICMS: TFloatField;
    qryPreCalculoAdicaoVL_ICMS_REAIS: TFloatField;
    qryPreCalculoAdicaoVL_OUTRAS_DESP_REAIS: TFloatField;
    qryPreCalculoAdicaoVL_DESP_ADUAN_REAIS: TFloatField;
    qryPreCalculoAdicaoVL_BASE_PIS_COFINS: TFloatField;
    qryPreCalculoAdicaoVL_BASE_ICMS: TFloatField;
    qryPreCalculoCapaNR_PROCESSO_SIMPLES: TStringField;
    qryPreCalculoCapaVL_ACRESCIMOS_REAIS: TFloatField;
    qryPreCalculoCapaVL_DEDUCOES_REAIS: TFloatField;
    dsTotais: TDataSource;
    qryPreCalculoCapaVL_MLE_MOEDA: TFloatField;
    qryPreCalculoCapaCD_MOEDA_MLE: TStringField;
    qryPreCalculoCapaTX_MLE: TFloatField;
    qryPreCalculoAdicaoVL_ALIQUOTA_ESPECIFICA_PIS: TFloatField;
    qryPreCalculoAdicaoVL_ALIQUOTA_ESPECIFICA_COFINS: TFloatField;
    qryPreCalculoAdicaoQTD_UNID_ESPECIFICA_PIS: TFloatField;
    qryPreCalculoAdicaoQTD_UNID_ESPECIFICA_COFINS: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure qryPreCalculoCapaCD_MOEDA_FOBChange(Sender: TField);
    procedure qryPreCalculoCapaCD_MOEDA_FRETEChange(Sender: TField);
    procedure qryPreCalculoCapaCD_MOEDA_SEGUROChange(Sender: TField);
    procedure qryPreCalculoCapaAfterPost(DataSet: TDataSet);
    procedure qryPreCalculoAdicaoBeforePost(DataSet: TDataSet);
    procedure qryPreCalculoAdicaoAfterPost(DataSet: TDataSet);
    procedure dsPreCalculoCapaStateChange(Sender: TObject);
    procedure qryTotaisAfterOpen(DataSet: TDataSet);
    procedure qryPreCalculoAdicaoAfterScroll(DataSet: TDataSet);
    procedure qryPreCalculoAdicaoAfterOpen(DataSet: TDataSet);
    procedure qryPreCalculoCapaCD_MOEDA_MLEChange(Sender: TField);
    procedure qryPreCalculoAdicaoPC_ALIQUOTA_PISChange(Sender: TField);
    procedure qryPreCalculoAdicaoPC_ALIQUOTA_COFINSChange(Sender: TField);
    procedure qryPreCalculoAdicaoVL_ALIQUOTA_ESPECIFICA_PISChange(Sender: TField);
    procedure qryPreCalculoAdicaoVL_ALIQUOTA_ESPECIFICA_COFINSChange(Sender: TField);
  private
    { Private declarations }
  public
    procedure AutocompletaTaxas;
    function GetTaxa(AMoeda: String): Double;
  end;

var
  datm_DI_PreCalculo: Tdatm_DI_PreCalculo;

implementation

uses ConsOnlineEx, uDIPreCalculo, PGGP017;

{$R *.dfm}

procedure Tdatm_DI_PreCalculo.AutocompletaTaxas;
begin
  // Preenchimento da Taxa do FOB
  if qryPreCalculoCapaTX_MLE.AsFloat = 0 then
  begin
    if (qryPreCalculoCapaCD_MOEDA_MLE.AsString = '220') and (qryPreCalculoCapaTX_DOLAR.AsFloat > 0) then
      qryPreCalculoCapaTX_MLE.AsFloat := qryPreCalculoCapaTX_DOLAR.AsFloat
    else if (qryPreCalculoCapaCD_MOEDA_MLE.AsString = qryPreCalculoCapaCD_MOEDA_FRETE.AsString) and (qryPreCalculoCapaTX_FRETE.AsFloat > 0) then
      qryPreCalculoCapaTX_MLE.AsFloat := qryPreCalculoCapaTX_FRETE.AsFloat
    else if (qryPreCalculoCapaCD_MOEDA_MLE.AsString = qryPreCalculoCapaCD_MOEDA_SEGURO.AsString) and (qryPreCalculoCapaTX_SEGURO.AsFloat > 0) then
      qryPreCalculoCapaTX_MLE.AsFloat := qryPreCalculoCapaTX_SEGURO.AsFloat
    else if Length(qryPreCalculoCapaCD_MOEDA_MLE.AsString) = 3 then
      qryPreCalculoCapaTX_MLE.AsFloat := GetTaxa(qryPreCalculoCapaCD_MOEDA_MLE.AsString);
  end;
  // Preenchimento da Taxa do Frete
  if qryPreCalculoCapaTX_FRETE.AsFloat = 0 then
  begin
    if (qryPreCalculoCapaCD_MOEDA_FRETE.AsString = '220') and (qryPreCalculoCapaTX_DOLAR.AsFloat > 0) then
      qryPreCalculoCapaTX_FRETE.AsFloat := qryPreCalculoCapaTX_DOLAR.AsFloat
    else if (qryPreCalculoCapaCD_MOEDA_FRETE.AsString = qryPreCalculoCapaCD_MOEDA_MLE.AsString) and (qryPreCalculoCapaTX_MLE.AsFloat > 0) then
      qryPreCalculoCapaTX_FRETE.AsFloat := qryPreCalculoCapaTX_MLE.AsFloat
    else if (qryPreCalculoCapaCD_MOEDA_FRETE.AsString = qryPreCalculoCapaCD_MOEDA_SEGURO.AsString) and (qryPreCalculoCapaTX_SEGURO.AsFloat > 0) then
      qryPreCalculoCapaTX_FRETE.AsFloat := qryPreCalculoCapaTX_SEGURO.AsFloat
    else if Length(qryPreCalculoCapaCD_MOEDA_FRETE.AsString) = 3 then
      qryPreCalculoCapaTX_FRETE.AsFloat := GetTaxa(qryPreCalculoCapaCD_MOEDA_FRETE.AsString);
  end;
  // Preenchimento da Taxa do Seguro
  if qryPreCalculoCapaTX_SEGURO.AsFloat = 0 then
  begin
    if (qryPreCalculoCapaCD_MOEDA_SEGURO.AsString = '220') and (qryPreCalculoCapaTX_DOLAR.AsFloat > 0) then
      qryPreCalculoCapaTX_SEGURO.AsFloat := qryPreCalculoCapaTX_DOLAR.AsFloat
    else if (qryPreCalculoCapaCD_MOEDA_SEGURO.AsString = qryPreCalculoCapaCD_MOEDA_MLE.AsString) and (qryPreCalculoCapaTX_MLE.AsFloat > 0) then
      qryPreCalculoCapaTX_SEGURO.AsFloat := qryPreCalculoCapaTX_MLE.AsFloat
    else if (qryPreCalculoCapaCD_MOEDA_SEGURO.AsString = qryPreCalculoCapaCD_MOEDA_FRETE.AsString) and (qryPreCalculoCapaTX_FRETE.AsFloat > 0) then
      qryPreCalculoCapaTX_SEGURO.AsFloat := qryPreCalculoCapaTX_FRETE.AsFloat
    else if Length(qryPreCalculoCapaCD_MOEDA_SEGURO.AsString) = 3 then
      qryPreCalculoCapaTX_SEGURO.AsFloat := GetTaxa(qryPreCalculoCapaCD_MOEDA_SEGURO.AsString);
  end;
end;

procedure Tdatm_DI_PreCalculo.DataModuleCreate(Sender: TObject);
begin
  qryMoedas.Open;
end;

procedure Tdatm_DI_PreCalculo.DataModuleDestroy(Sender: TObject);
begin
  qryTotais.Close;
  qryPreCalculoAdicao.Close;
  qryPreCalculoCapa.Close;
  qryMoedas.Close;
end;

procedure Tdatm_DI_PreCalculo.qryPreCalculoCapaCD_MOEDA_FOBChange(Sender: TField);
begin
  if (qryPreCalculoCapaCD_MOEDA_FOB.AsString = '220') and (qryPreCalculoCapaTX_DOLAR.AsFloat > 0) and (qryPreCalculoCapaTX_FOB.AsFloat = 0) then
    qryPreCalculoCapaTX_FOB.AsFloat := qryPreCalculoCapaTX_DOLAR.AsFloat
  else
    AutocompletaTaxas;
end;

procedure Tdatm_DI_PreCalculo.qryPreCalculoCapaCD_MOEDA_FRETEChange(Sender: TField);
begin
  if (qryPreCalculoCapaCD_MOEDA_FRETE.AsString = '220') and (qryPreCalculoCapaTX_DOLAR.AsFloat > 0) and (qryPreCalculoCapaTX_FRETE.AsFloat = 0) then
    qryPreCalculoCapaTX_FRETE.AsFloat := qryPreCalculoCapaTX_DOLAR.AsFloat
  else
    AutocompletaTaxas;
end;

procedure Tdatm_DI_PreCalculo.qryPreCalculoCapaCD_MOEDA_SEGUROChange(Sender: TField);
begin
  if (qryPreCalculoCapaCD_MOEDA_SEGURO.AsString = '220') and (qryPreCalculoCapaTX_DOLAR.AsFloat > 0) and (qryPreCalculoCapaTX_SEGURO.AsFloat = 0) then
    qryPreCalculoCapaTX_SEGURO.AsFloat := qryPreCalculoCapaTX_DOLAR.AsFloat
  else
    AutocompletaTaxas;
end;

procedure Tdatm_DI_PreCalculo.qryPreCalculoCapaAfterPost(DataSet: TDataSet);
begin
  qryPreCalculoCapa.ApplyUpdates;
  qryTotais.Close;
  qryPreCalculoAdicao.Close;
  qryPreCalculoCapa.Close;
  qryPreCalculoCapa.Open;
  qryPreCalculoAdicao.Open;
  qryTotais.Open;

  {by Carlos - ocultar o botão de calcular e calcular automaticamente sempre que salvar}
  frm_DI_PreCalculo.btnCalcular.Click;

end;

procedure Tdatm_DI_PreCalculo.qryPreCalculoAdicaoBeforePost(DataSet: TDataSet);
begin
  if qryPreCalculoAdicao.State = dsInsert then
  begin
    qryPreCalculoAdicaoNR_PROCESSO.AsString := qryPreCalculoCapaNR_PROCESSO.AsString;
    qryPreCalculoAdicaoNR_ADICAO.AsString := ConsultaLookUPSQL(' SELECT ISNULL(MAX(NR_ADICAO), 0) + 1 AS QTD' +
                                                               ' FROM TPRE_CALCULO_ADICAO ' +
                                                               ' WHERE NR_PROCESSO = ' + QuotedStr(qryPreCalculoAdicaoNR_PROCESSO.AsString), 'QTD');
  end;


end;

procedure Tdatm_DI_PreCalculo.qryPreCalculoAdicaoAfterPost(DataSet: TDataSet);
begin
  qryPreCalculoAdicao.ApplyUpdates;
  qryPreCalculoAdicaoAfterOpen(qryPreCalculoAdicao);
  if qryTotais.Active then
    qryTotais.Close;



  {by Carlos - acionar a trigger para atualizar os valores da capa }
  qryPreCalculoCapa.Edit;
  qryPreCalculoCapa.Post;
  {by Carlos - ocultar o botão de calcular e calcular automaticamente sempre que salvar}
  frm_DI_PreCalculo.btnCalcular.Click;

end;

procedure Tdatm_DI_PreCalculo.dsPreCalculoCapaStateChange(Sender: TObject);
begin
  frm_DI_PreCalculo.AtualizaStatusBotoes;
end;

procedure Tdatm_DI_PreCalculo.qryTotaisAfterOpen(DataSet: TDataSet);
begin
  frm_DI_PreCalculo.dbtxtVL_II.Width                 := frm_DI_PreCalculo.dbtxt_VL_TOTAL.Width;
  frm_DI_PreCalculo.dbtxtVL_IPI.Width                := frm_DI_PreCalculo.dbtxt_VL_TOTAL.Width;
  frm_DI_PreCalculo.dbedt_VL_BASE_PIS_COFINS.Width   := frm_DI_PreCalculo.dbtxt_VL_TOTAL.Width;
  frm_DI_PreCalculo.dbtxt_VL_PIS.Width               := frm_DI_PreCalculo.dbtxt_VL_TOTAL.Width;
  frm_DI_PreCalculo.dbtxt_VL_COFINS.Width            := frm_DI_PreCalculo.dbtxt_VL_TOTAL.Width;
  frm_DI_PreCalculo.dbtxt_VL_BASE_ICMS.Width         := frm_DI_PreCalculo.dbtxt_VL_TOTAL.Width;
  frm_DI_PreCalculo.dbtxt_VL_ICMS.Width              := frm_DI_PreCalculo.dbtxt_VL_TOTAL.Width;
  frm_DI_PreCalculo.dbtxt_VL_OUTRAS_DESP_REAIS.Width := frm_DI_PreCalculo.dbtxt_VL_TOTAL.Width;
end;

procedure Tdatm_DI_PreCalculo.qryPreCalculoAdicaoAfterScroll(DataSet: TDataSet);
begin
  frm_DI_PreCalculo.edtAdicaoAtual.Text := qryPreCalculoAdicaoNR_ADICAO.AsString;
end;

procedure Tdatm_DI_PreCalculo.qryPreCalculoAdicaoAfterOpen(DataSet: TDataSet);
begin
  frm_DI_PreCalculo.edtAdicaoTotal.Text := IntToStr(qryPreCalculoAdicao.RecordCount);
  qryPreCalculoAdicao.EnableControls;
end;

procedure Tdatm_DI_PreCalculo.qryPreCalculoCapaCD_MOEDA_MLEChange(Sender: TField);
begin
  if (qryPreCalculoCapaCD_MOEDA_MLE.AsString = '220') and (qryPreCalculoCapaTX_DOLAR.AsFloat > 0) and (qryPreCalculoCapaTX_MLE.AsFloat = 0) then
    qryPreCalculoCapaTX_MLE.AsFloat := qryPreCalculoCapaTX_DOLAR.AsFloat
  else
    AutocompletaTaxas;
end;

procedure Tdatm_DI_PreCalculo.qryPreCalculoAdicaoPC_ALIQUOTA_PISChange(Sender: TField);
begin
  if qryPreCalculoAdicaoPC_ALIQUOTA_PIS.AsFloat > 0 then
  begin
    qryPreCalculoAdicaoVL_ALIQUOTA_ESPECIFICA_PIS.Clear;
    qryPreCalculoAdicaoQTD_UNID_ESPECIFICA_PIS.Clear;
  end;
end;

procedure Tdatm_DI_PreCalculo.qryPreCalculoAdicaoPC_ALIQUOTA_COFINSChange(Sender: TField);
begin
  if qryPreCalculoAdicaoPC_ALIQUOTA_COFINS.AsFloat > 0 then
  begin
    qryPreCalculoAdicaoVL_ALIQUOTA_ESPECIFICA_COFINS.Clear;
    qryPreCalculoAdicaoQTD_UNID_ESPECIFICA_COFINS.Clear;
  end;
end;

procedure Tdatm_DI_PreCalculo.qryPreCalculoAdicaoVL_ALIQUOTA_ESPECIFICA_PISChange(Sender: TField);
begin
  if Sender.AsFloat > 0 then
    qryPreCalculoAdicaoPC_ALIQUOTA_PIS.Clear;
end;

procedure Tdatm_DI_PreCalculo.qryPreCalculoAdicaoVL_ALIQUOTA_ESPECIFICA_COFINSChange(Sender: TField);
begin
  if Sender.AsFloat > 0 then
    qryPreCalculoAdicaoPC_ALIQUOTA_COFINS.Clear;
end;

function Tdatm_DI_PreCalculo.GetTaxa(AMoeda: String): Double;
begin
  Result := StrToFloat(ConsultaLookUPSQL(' SELECT TX_CAMBIO ' +
                                         ' FROM TTAXA_CAMBIO ' +
                                         ' WHERE CD_MOEDA = ''' + AMoeda + ''' ' +
                                         '   AND CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103) BETWEEN DT_INICIO_VIGENCIA AND DT_TERMINO_VIGENCIA', 'TX_CAMBIO'));
end;

end.
