(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGFT050.PAS - Data Module - Impressão de Nota Fiscal de Serviço/Indaiá
DATA: 29/01/2002
Manutenção:
*************************************************************************************************)

unit PGFT050;

interface                      


uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, RAWPrinter, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe, ppDBBDE, ppBands, ppPrnabl, ppCtrls, ppStrtch,
  ppMemo, ppVar, ppModule, daDatMod, RxGIF, jpeg, ppRegion, ppSubRpt,
  ppParameter;

type
  Tdatm_nf_serv = class(TDataModule)
    ds_unid_neg: TDataSource;
    qry_unid_neg_: TQuery;
    ds_produto: TDataSource;
    qry_produto_: TQuery;
    ds_grd_sol: TDataSource;
    qry_fat_sol_: TQuery;
    ds_fat_proc: TDataSource;
    qry_ult_nf_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_fat_sol_CD_UNID_NEG: TStringField;
    qry_fat_sol_CD_PRODUTO: TStringField;
    qry_fat_sol_NR_SOLICITACAO: TStringField;
    qry_fat_sol_IN_IMPRESSO: TStringField;
    qry_fat_sol_DT_IMPRESSAO: TDateTimeField;
    qry_fat_sol_TP_TIPO_FAT: TStringField;
    qry_fat_sol_NR_NOTA_FATURA: TStringField;
    qry_fat_sol_TX_OBSERVACOES: TMemoField;
    qry_fat_sol_DT_FATURA: TDateTimeField;
    qry_grd_sol_: TQuery;
    qry_grd_sol_CD_UNID_NEG: TStringField;
    qry_grd_sol_CD_PRODUTO: TStringField;
    qry_grd_sol_NR_SOLICITACAO: TStringField;
    qry_grd_sol_TX_YESNO: TStringField;
    qry_grd_sol_NR_NOTA_FATURA: TStringField;
    qry_grd_sol_CalcNrSolicitacao: TStringField;
    ds_grd_adm: TDataSource;
    qry_grd_adm_: TQuery;
    qry_grd_sol_NR_NF_SERV: TStringField;
    qry_grd_adm_TX_YESNO: TStringField;
    qry_grd_adm_NR_DOCTO: TStringField;
    qry_grd_adm_NR_NF_SERV: TStringField;
    qry_grd_adm_NM_FAVORECIDO: TStringField;
    qry_fav_adm_: TQuery;
    qry_grd_adm_VL_NOTA: TFloatField;
    qry_grd_adm_CD_FAVORECIDO: TStringField;
    qry_fat_sol_NR_NF_SERV: TStringField;
    qry_fat_sol_IN_IMP_NF_SERV: TStringField;
    qry_fat_sol_DT_NF_SERV: TDateTimeField;
    qry_atz_adm_: TQuery;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField1: TFloatField;
    qry_fav_adm_NM_FAVORECIDO: TStringField;
    qry_fav_adm_END_FAVORECIDO: TStringField;
    qry_fav_adm_END_CIDADE: TStringField;
    qry_fav_adm_END_UF: TStringField;
    qry_fav_adm_CGC_EMPRESA: TStringField;
    qry_fav_adm_IE_EMPRESA: TStringField;
    qry_tot_comissao_fat_: TQuery;
    qry_tot_comissao_fat_VL_COMISSAO: TFloatField;
    qry_fat_sol_CD_USUARIO_IMP: TStringField;
    qry_fat_sol_IN_SELECIONADO: TStringField;
    sp_atz_evento: TStoredProc;
    qry_atz_dados_: TQuery;
    qry_grd_sol_CalcStatus: TStringField;
    qry_grd_sol_IN_CANCELADO: TStringField;
    qry_grd_sol_IN_LIQUIDADO: TStringField;
    qry_fat_proc_: TQuery;
    qry_fat_proc_CalcNrProcesso: TStringField;
    qry_fat_proc_NR_PROCESSO: TStringField;
    qry_fat_proc_CD_CLIENTE: TStringField;
    qry_fat_proc_AP_EMPRESA: TStringField;
    qry_fat_proc_NM_EMPRESA: TStringField;
    qry_fat_proc_END_EMPRESA: TStringField;
    qry_fat_proc_END_CIDADE: TStringField;
    qry_fat_proc_END_UF: TStringField;
    qry_fat_proc_CGC_EMPRESA: TStringField;
    qry_fat_proc_IE_EMPRESA: TStringField;
    qry_fat_proc_CD_REPRESENTANTE: TStringField;
    qry_fat_proc_CD_UNID_NEG: TStringField;
    qry_fat_proc_CD_PRODUTO: TStringField;
    qry_fat_proc_CD_SERVICO: TStringField;
    qry_fat_proc_NR_CONHECIMENTO: TStringField;
    qry_fat_proc_END_CEP: TStringField;
    qry_fat_sol_DT_VENCTO_FATURA: TDateTimeField;
    qry_fat_sol_CD_UNID_NEG_FAT: TStringField;
    qry_obs_adm_: TQuery;
    qry_grd_adm_CD_UNID_NEG: TStringField;
    qry_grd_adm_DT_PAGTO: TDateTimeField;
    qry_grd_adm_IN_IMP_NF_SERV: TStringField;
    qry_obs_adm_TX_OBS: TMemoField;
    sp_nf_serv_adm: TStoredProc;
    sp_nf_serv_op: TStoredProc;
    qry_ult_nf_NR_ULT_NF_SERV: TStringField;
    qry_ajuste_impressao_: TQuery;
    qry_ajuste_impressao_CD_UNID_NEG: TStringField;
    qry_ajuste_impressao_L_EMISSAO: TStringField;
    qry_ajuste_impressao_C_EMISSAO: TStringField;
    qry_ajuste_impressao_C_VENCIMENTO: TStringField;
    qry_ajuste_impressao_L_N_REFERENCIA: TStringField;
    qry_ajuste_impressao_C_N_REFERENCIA: TStringField;
    qry_ajuste_impressao_L_RAZAO_SOCIAL: TStringField;
    qry_ajuste_impressao_C_RAZAO_SOCIAL: TStringField;
    qry_ajuste_impressao_C_CODIGO: TStringField;
    qry_ajuste_impressao_L_ENDERECO: TStringField;
    qry_ajuste_impressao_C_ENDERECO: TStringField;
    qry_ajuste_impressao_L_MUNICIPIO: TStringField;
    qry_ajuste_impressao_C_MUNICIPIO: TStringField;
    qry_ajuste_impressao_C_BAIRRO: TStringField;
    qry_ajuste_impressao_C_UF: TStringField;
    qry_ajuste_impressao_C_CEP: TStringField;
    qry_ajuste_impressao_L_CNPJ: TStringField;
    qry_ajuste_impressao_C_CNPJ: TStringField;
    qry_ajuste_impressao_C_IE: TStringField;
    qry_ajuste_impressao_L_AREA: TStringField;
    qry_ajuste_impressao_C_AREA: TStringField;
    qry_ajuste_impressao_C_ANALISTA: TStringField;
    qry_ajuste_impressao_L_S_REFERENCIA: TStringField;
    qry_ajuste_impressao_C_S_REFERENCIA: TStringField;
    qry_ajuste_impressao_L_NAT_DESPACHO: TStringField;
    qry_ajuste_impressao_C_NAT_DESPACHO: TStringField;
    qry_ajuste_impressao_C_MODAL: TStringField;
    qry_ajuste_impressao_L_VEICULO: TStringField;
    qry_ajuste_impressao_C_VEICULO: TStringField;
    qry_ajuste_impressao_C_ORIGEM: TStringField;
    qry_ajuste_impressao_C_DESTINO: TStringField;
    qry_ajuste_impressao_L_VOLUMES: TStringField;
    qry_ajuste_impressao_C_VOLUMES: TStringField;
    qry_ajuste_impressao_C_PESO_BRUTO: TStringField;
    qry_ajuste_impressao_C_PESO_LIQUIDO: TStringField;
    qry_ajuste_impressao_L_VALOR_FOB: TStringField;
    qry_ajuste_impressao_C_VALOR_FOB: TStringField;
    qry_ajuste_impressao_C_VALOR_CIF: TStringField;
    qry_ajuste_impressao_L_DI: TStringField;
    qry_ajuste_impressao_C_DI: TStringField;
    qry_ajuste_impressao_NR_LINHAS: TIntegerField;
    qry_ajuste_impressao_L_DESCRICAO: TStringField;
    qry_ajuste_impressao_C_DESCRICAO: TStringField;
    qry_ajuste_impressao_C_CLIENTE: TStringField;
    qry_ajuste_impressao_C_INDAIA: TStringField;
    qry_ajuste_impressao_C_SERVICOS: TStringField;
    qry_ajuste_impressao_L_OBS: TStringField;
    qry_ajuste_impressao_C_OBS: TStringField;
    qry_ajuste_impressao_L_NAO_TRIBUTAVEL: TStringField;
    qry_ajuste_impressao_C_NAO_TRIBUTAVEL: TStringField;
    qry_ajuste_impressao_C_SUB_TOTAL_TRIBUTAVEL: TStringField;
    qry_ajuste_impressao_L_COMISSAO: TStringField;
    qry_ajuste_impressao_C_COMISSAO: TStringField;
    qry_ajuste_impressao_L_TOTAL_GERAL: TStringField;
    qry_ajuste_impressao_C_TOTAL_GERAL: TStringField;
    qry_ajuste_impressao_L_TOTAL_TRIBUTAVEL: TStringField;
    qry_ajuste_impressao_C_TOTAL_TRIBUTAVEL: TStringField;
    qry_ajuste_impressao_L_ISS: TStringField;
    qry_ajuste_impressao_C_ISS: TStringField;
    qry_ajuste_impressao_L_IRRF: TStringField;
    qry_ajuste_impressao_C_IRRF: TStringField;
    rp_nf: TRAWPrinter;
    qry_nf_serv_op_: TQuery;
    qry_nf_serv_op_CD_UNID_NEG: TStringField;
    qry_nf_serv_op_CD_PRODUTO: TStringField;
    qry_nf_serv_op_NR_SOLICITACAO: TStringField;
    qry_nf_serv_op_NR_PROCESSO: TStringField;
    qry_nf_serv_op_DT_EMISSAO: TDateTimeField;
    qry_nf_serv_op_DT_VENCIMENTO: TDateTimeField;
    qry_nf_serv_op_NR_RELATORIO: TStringField;
    qry_nf_serv_op_NR_ANO: TStringField;
    qry_nf_serv_op_CD_CLIENTE: TStringField;
    qry_nf_serv_op_CD_AREA: TStringField;
    qry_nf_serv_op_CD_ANALISTA: TStringField;
    qry_nf_serv_op_NM_REFERENCIA: TStringField;
    qry_nf_serv_op_NM_NAT_DESPACHO: TStringField;
    qry_nf_serv_op_CD_VIA_TRANSP: TStringField;
    qry_nf_serv_op_NM_VEICULO: TStringField;
    qry_nf_serv_op_CD_LOCAL_ORIGEM: TStringField;
    qry_nf_serv_op_CD_LOCAL_DESTINO: TStringField;
    qry_nf_serv_op_QT_EMBALAGEM: TIntegerField;
    qry_nf_serv_op_CD_EMBALAGEM: TStringField;
    qry_nf_serv_op_VL_PESO_BRUTO: TFloatField;
    qry_nf_serv_op_VL_PESO_LIQUIDO: TFloatField;
    qry_nf_serv_op_VL_FOB: TFloatField;
    qry_nf_serv_op_VL_CIF: TFloatField;
    qry_nf_serv_op_NR_DI: TStringField;
    qry_nf_serv_op_VL_TOT_NUM: TFloatField;
    qry_nf_serv_op_VL_TOT_NAO_TRIBUTAVEL: TFloatField;
    qry_nf_serv_op_VL_SUB_TOT_TRIBUTAVEL: TFloatField;
    qry_nf_serv_op_VL_COMISSAO: TFloatField;
    qry_nf_serv_op_VL_TOT_GERAL: TFloatField;
    qry_nf_serv_op_VL_TOT_TRIBUTAVEL: TFloatField;
    qry_nf_serv_op_NM_IR: TStringField;
    qry_nf_serv_op_VL_IR: TFloatField;
    qry_nf_serv_op_VL_ISS: TFloatField;
    qry_nf_serv_op_NM_SALDO: TStringField;             
    qry_nf_serv_op_VL_SALDO: TFloatField;
    qry_nf_serv_op_CD_EMISSOR: TStringField;
    qry_nf_serv_op_IN_QUADRO_TOTAL: TStringField;
    qry_nf_serv_op_item_: TQuery;
    ds_nf_serv_op: TDataSource;
    qry_nf_serv_op_item_CD_UNID_NEG: TStringField;
    qry_nf_serv_op_item_CD_PRODUTO: TStringField;
    qry_nf_serv_op_item_NR_SOLICITACAO: TStringField;
    qry_nf_serv_op_item_CD_ITEM: TStringField;
    qry_nf_serv_op_item_NM_ITEM: TStringField;
    qry_nf_serv_op_item_VL_ITEM: TFloatField;
    qry_nf_serv_op_item_IN_COLUNA: TStringField;
    qry_nf_serv_op_item_NR_ORDEM_FAT: TIntegerField;
    qry_nf_serv_op_num_: TQuery;
    qry_nf_serv_op_num_CD_UNID_NEG: TStringField;
    qry_nf_serv_op_num_CD_PRODUTO: TStringField;
    qry_nf_serv_op_num_NR_SOLICITACAO: TStringField;
    qry_nf_serv_op_num_DT_NUM: TDateTimeField;
    qry_nf_serv_op_num_VL_NUM: TFloatField;
    qry_nf_serv_op_num_NR_FP: TStringField;
    qry_nf_serv_adm_: TQuery;
    qry_nf_serv_adm_item_: TQuery;
    ds_nf_serv_adm: TDataSource;
    qry_nf_serv_adm_CD_UNID_NEG: TStringField;
    qry_nf_serv_adm_NR_DOCTO: TStringField;
    qry_nf_serv_adm_DT_EMISSAO: TDateTimeField;
    qry_nf_serv_adm_DT_VENCIMENTO: TDateTimeField;
    qry_nf_serv_adm_NR_RELATORIO: TStringField;
    qry_nf_serv_adm_NR_ANO: TStringField;
    qry_nf_serv_adm_CD_FAVORECIDO: TStringField;
    qry_nf_serv_adm_TX_OBS: TMemoField;
    qry_nf_serv_adm_VL_TOT_NAO_TRIBUTAVEL: TFloatField;
    qry_nf_serv_adm_VL_TOT_GERAL: TFloatField;
    qry_nf_serv_adm_VL_TOT_TRIBUTAVEL: TFloatField;
    qry_nf_serv_adm_VL_ISS: TFloatField;
    qry_nf_serv_adm_VL_IR: TFloatField;
    qry_nf_serv_adm_CD_EMISSOR: TStringField;
    qry_nf_serv_adm_item_CD_UNID_NEG: TStringField;
    qry_nf_serv_adm_item_NR_DOCTO: TStringField;
    qry_nf_serv_adm_item_CD_CT_CONTABIL: TStringField;
    qry_nf_serv_adm_item_TX_HISTORICO: TMemoField;
    qry_nf_serv_adm_item_VL_ITEM: TFloatField;
    qry_nf_serv_adm_item_IN_COLUNA: TStringField;
    qry_nf_serv_op_NM_EMPRESA: TStringField;
    qry_nf_serv_op_END_EMPRESA: TStringField;
    qry_nf_serv_op_END_NUMERO: TStringField;
    qry_nf_serv_op_END_CIDADE: TStringField;
    qry_nf_serv_op_END_BAIRRO: TStringField;
    qry_nf_serv_op_END_UF: TStringField;
    qry_nf_serv_op_END_CEP: TStringField;
    qry_nf_serv_op_CGC_EMPRESA: TStringField;
    qry_nf_serv_op_IE_EMPRESA: TStringField;
    qry_nf_serv_op_NM_VIA_TRANSP: TStringField;
    qry_nf_serv_op_NM_EMBALAGEM: TStringField;
    qry_nf_serv_op_NM_ANALISTA: TStringField;
    qry_nf_serv_adm_NM_FAVORECIDO: TStringField;
    qry_nf_serv_adm_END_FAVORECIDO: TStringField;
    qry_nf_serv_adm_END_NUMERO: TStringField;
    qry_nf_serv_adm_END_CIDADE: TStringField;
    qry_nf_serv_adm_END_BAIRRO: TStringField;
    qry_nf_serv_adm_END_UF: TStringField;
    qry_nf_serv_adm_END_CEP: TStringField;
    qry_nf_serv_adm_CGC_EMPRESA: TStringField;
    qry_nf_serv_adm_IE_EMPRESA: TStringField;
    qry_grd_sol_DT_FATURA: TDateTimeField;
    qry_nf_serv_op_TX_HISTORICO: TMemoField;
    qry_ajuste_impressao_NR_ULT_NF_SERV: TStringField;
    qry_nf_serv_op_NM_ESPECIE: TStringField;
    qry_obs_ts_fatura_: TQuery;
    qry_obs_ts_fatura_TX_OBS: TMemoField;
    qry_nf_serv_op_TX_OBS: TMemoField;
    qry_nf_serv_op_NM_AREA: TStringField;
    qry_nf_serv_op_NM_LOCAL_ORIGEM: TStringField;
    qry_nf_serv_op_NM_LOCAL_DESTINO: TStringField;
    qry_fat_calculo_rateio_despesas_: TQuery;
    ds_fat_calculo_rateio_despesas_: TDataSource;
    ppBDERelFatCalculoRateioDesp: TppBDEPipeline;
    ppRelFatCalculoRateioDesp: TppReport;
    qry_area_: TQuery;
    qry_area_CD_AREA: TStringField;
    qry_area_NM_AREA: TStringField;
    qry_sum_fat_calc_rat_desp_: TQuery;
    ds_sum_fat_calc_rat_desp_: TDataSource;
    qry_sum_fat_calc_rat_desp_TOTAL_VL_ITEM_AREA: TFloatField;
    qry_fat_calculo_rateio_despesas_CalcNrProcesso: TStringField;
    ppBDESumRelFatCalcRatDesp: TppBDEPipeline;
    qry_item_: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    sp_fat_atz_rateio_imp: TStoredProc;
    qry_fat_calculo_rateio_despesas_CD_UNID_NEG: TStringField;
    qry_fat_calculo_rateio_despesas_CD_PRODUTO: TStringField;
    qry_fat_calculo_rateio_despesas_NR_SOLICITACAO: TStringField;
    qry_fat_calculo_rateio_despesas_VL_ITEM_AREA: TFloatField;
    qry_fat_calculo_rateio_despesas_NR_PROCESSO: TStringField;
    qry_fat_calculo_rateio_despesas_CD_AREA: TStringField;
    qry_fat_calculo_rateio_despesas_CD_ITEM: TStringField;
    qry_fat_calculo_rateio_despesas_LooKNmArea: TStringField;
    qry_fat_calculo_rateio_despesas_LookNmItem: TStringField;
    qry_fat_calculo_rateio_despesas_CD_USUARIO: TStringField;
    qry_fat_calculo_rateio_despesas_CD_REFERENCIA: TStringField;
    qry_fat_calculo_rateio_despesas_NR_NOTA_FATURA: TStringField;
    sp_fat_atz_rateio_exp: TStoredProc;
    qry_ajuste_impressao_L_DESTAQUE: TStringField;
    qry_ajuste_impressao_C_DESTAQUE: TStringField;
    qry_ajuste_impressao_L_RETENCAO: TStringField;
    qry_ajuste_impressao_C_RETENCAO: TStringField;
    qry_nf_serv_op_CD_EMP_EST: TStringField;
    qry_nf_serv_op_VL_RETENCAO: TFloatField;
    qry_nf_serv_op_NM_RETENCAO: TStringField;
    qry_ajuste_impressao_C_COFINS: TStringField;
    qry_ajuste_impressao_L_COFINS: TStringField;
    qry_nota_retencao_: TQuery;
    qry_nota_retencao_NR_NOTA: TStringField;
    qry_nota_retencao_acum_: TQuery;
    qry_nota_retencao_acum_NR_NOTA_ACUMULADA: TStringField;
    ppParameterList1: TppParameterList;
    qry_grd_sol_IN_PREVIEW: TStringField;
    sp_fat_canc: TStoredProc;
    qry_tot_tributavel_: TQuery;
    qry_comissao_: TQuery;
    qry_comissao_proc: TQuery;
    ppHeaderBand1: TppHeaderBand;
    ppTitle: TppLabel;
    ppLine2: TppLine;
    ppLabel6: TppLabel;
    ppDBText7: TppDBText;
    ppImage1: TppImage;
    ppDetailBand1: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel17: TppLabel;
    ppVarRodapeEsq: TppVariable;
    ppVarRodapeDir: TppVariable;
    ppLine3: TppLine;
    ppNumPag: TppSystemVariable;
    ppTotPag: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel4: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLine4: TppLine;
    ppLine1: TppLine;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBText3: TppDBText;
    ppLabel3: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel7: TppLabel;
    ppDBText8: TppDBText;
    ppLabel8: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    procedure qry_grd_sol_CalcFields(DataSet: TDataSet);
    procedure qry_grd_sol_AfterScroll(DataSet: TDataSet);
    procedure qry_fat_proc_CalcFields(DataSet: TDataSet);
    procedure ppVarRodapeEsqCalc(Sender: TObject; var Value: Variant);
    procedure ppVarRodapeDirCalc(Sender: TObject; var Value: Variant);
    procedure qry_fat_calculo_rateio_despesas_CalcFields(
      DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_nf_serv: Tdatm_nf_serv;

implementation

uses PGFT049, GSMLIB;

{$R *.DFM}

procedure Tdatm_nf_serv.qry_grd_sol_CalcFields(DataSet: TDataSet);
begin
  if Not ( qry_grd_sol_NR_SOLICITACAO.IsNull ) then
  begin
    qry_grd_sol_CalcNrSolicitacao.AsString := Copy( qry_grd_sol_NR_SOLICITACAO.AsString, 1, 2 ) + '/' +
                                              Copy( qry_grd_sol_NR_SOLICITACAO.AsString, 3, 4 );
  end;
  //Status
  if qry_grd_sol_IN_CANCELADO.AsString = '1' then
    qry_grd_sol_CalcStatus.AsString := 'Cancelado'
  else
  begin
    if qry_grd_sol_IN_LIQUIDADO.AsString = '1' then
       qry_grd_sol_CalcStatus.AsString := 'Liquidado'
    else
    begin
      if Trim( qry_grd_sol_NR_NF_SERV.AsString ) = '' then
         qry_grd_sol_CalcStatus.AsString := 'Em aberto'
      else
         qry_grd_sol_CalcStatus.AsString := 'Faturado';
    end;
  end;
end;

procedure Tdatm_nf_serv.qry_grd_sol_AfterScroll(DataSet: TDataSet);
begin
  qry_fat_proc_.Close;
  qry_fat_proc_.ParamByName('CD_UNID_NEG').AsString    := qry_grd_sol_CD_UNID_NEG.AsString;
  qry_fat_proc_.ParamByName('CD_PRODUTO').AsString     := qry_grd_sol_CD_PRODUTO.AsString;
  qry_fat_proc_.ParamByName('NR_SOLICITACAO').AsString := qry_grd_sol_NR_SOLICITACAO.AsString;
  qry_fat_proc_.Prepare;
  qry_fat_proc_.Open;
  frm_nf_serv.btnImp.Enabled := qry_grd_sol_NR_NF_SERV.AsString = '';
end;

procedure Tdatm_nf_serv.qry_fat_proc_CalcFields(DataSet: TDataSet);
begin
  if Not qry_fat_proc_NR_PROCESSO.IsNull then
  begin
    qry_fat_proc_CalcNrProcesso.AsString := Copy(qry_fat_proc_NR_PROCESSO.AsString,5,14);
  end;
end; 

procedure Tdatm_nf_serv.ppVarRodapeEsqCalc(Sender: TObject;
  var Value: Variant);
begin
  ppVarRodapeEsq.AsString := '' + Space(5) + 'Emitido em ' + FormatDateTime( 'dd/mm/yyyy', DATE ) + '  às  ' + FormatDateTime( 'hh:mm:ss', TIME );
end;

procedure Tdatm_nf_serv.ppVarRodapeDirCalc(Sender: TObject;
  var Value: Variant);
begin
  ppVarRodapeDir.AsString := 'Folha ' + ppNumPag.Text + ' / ' + ppTotPag.Text;
end;

procedure Tdatm_nf_serv.qry_fat_calculo_rateio_despesas_CalcFields(
  DataSet: TDataSet);
begin
  if Not qry_fat_calculo_rateio_despesas_NR_PROCESSO.IsNull then
  begin
    qry_fat_calculo_rateio_despesas_CalcNrProcesso.AsString := Copy( qry_fat_calculo_rateio_despesas_NR_PROCESSO.AsString, 5, 14 );
  end;     
end;

end.
