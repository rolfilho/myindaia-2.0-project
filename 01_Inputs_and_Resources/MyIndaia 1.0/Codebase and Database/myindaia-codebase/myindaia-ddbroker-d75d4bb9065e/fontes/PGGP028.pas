unit PGGP028;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppProd, ppReport, ppEndUsr,
  ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppDBBDE, Db, DBTables,
  ppModule, daDatMod, ppStrtch, ppSubRpt, TeEngine, Series, ExtCtrls,
  TeeProcs, Chart, DBChart, ppChrt, ppMemo, ppRegion, ppParameter;

type
  Tdatm_sel_unid_prod_emb = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_param_: TQuery;
    qry_param_CD_ITEM_COMISSAO: TStringField;
    qry_param_CD_ITEM_EXPED: TStringField;
    qry_embarcacao_: TQuery;
    qry_embarcacao_CD_EMBARCACAO: TStringField;
    qry_embarcacao_NM_EMBARCACAO: TStringField;
    sp_rel_followup_navio: TStoredProc;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_grupo_DT_INCLUSAO: TDateTimeField;
    qry_grupo_IN_ATIVO: TStringField;
    qry_apaga_dados: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    qry_area_: TQuery;
    qry_area_CD_AREA: TStringField;
    qry_area_NM_AREA: TStringField;
    qry_usuario_: TQuery;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_NM_USUARIO: TStringField;
    sp_rel_desp_pagto: TStoredProc;
    qry_rel_dem_ger_: TQuery;
    ds_rel_dem_ger: TDataSource;
    ppBDERelDemGer: TppBDEPipeline;
    ppDesigner: TppDesigner;
    ppSelUnidProdEmb: TppReport;
    sp_rel_dem_gerencial: TStoredProc;
    sp_rel_lead_time: TStoredProc;
    qry_rel_lead_time_: TQuery;
    ds_rel_lead_time: TDataSource;
    ppBDERelLeadTime: TppBDEPipeline;
    sp_rel_nao_desemb_di: TStoredProc;
    qry_celula: TQuery;
    qry_celulaCD_CELULA: TStringField;
    qry_celulaNM_CELULA: TStringField;
    qry_servico_: TQuery;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_tp_lead_time_: TQuery;
    qry_tp_lead_time_TP_LEAD_TIME: TStringField;
    qry_tp_lead_time_NM_TP_LEAD_TIME: TStringField;
    sp_rel_desvios: TStoredProc;
    qry_desvios_: TQuery;
    ppBDERelDesvios: TppBDEPipeline;
    ds_desvios: TDataSource;
    qry_count_desvios_: TQuery;
    qry_desvios_NR_IDENTIFICADOR: TSmallintField;
    qry_desvios_CD_GRUPO: TStringField;
    qry_desvios_CD_SERVICO: TStringField;
    qry_desvios_QT_TOT_PROC: TSmallintField;
    qry_desvios_NR_META: TSmallintField;
    qry_desvios_QT_ABAIXO_META: TSmallintField;
    qry_desvios_NR_DIAS_ABAIXO_META: TSmallintField;
    qry_desvios_MEDIA_ABAIXO_META: TSmallintField;
    qry_desvios_QT_ACIMA_META: TSmallintField;
    qry_desvios_NR_DIAS_ACIMA_META: TSmallintField;
    qry_desvios_MEDIA_ACIMA_META: TSmallintField;
    qry_desvios_MEDIA_GRUPO: TFloatField;
    qry_desvios_NR_IDENTIFICADOR_1: TSmallintField;
    qry_desvios_NR_PROCESSO: TStringField;
    qry_desvios_CD_SERVICO_1: TStringField;
    qry_desvios_MERCADORIA: TStringField;
    qry_desvios_AP_EMPRESA: TStringField;
    qry_desvios_REFERENCIA: TStringField;
    qry_desvios_EVENTOS: TStringField;
    qry_desvios_PRESTADORES: TStringField;
    qry_desvios_LEAD_TIME: TStringField;
    qry_desvios_CANAL: TStringField;
    qry_desvios_NM_GRUPO: TStringField;
    qry_desvios_NM_SERVICO: TStringField;
    qry_count_desvios_QT_TOT_PROC: TIntegerField;
    qry_count_total_: TQuery;
    ppBDECountTotal: TppBDEPipeline;
    ds_count_total_: TDataSource;
    qry_trel_desvios_graf_: TQuery;
    ds_trel_desvios_graf_: TDataSource;
    ppBDETRel_Desvios_Graf: TppBDEPipeline;
    qry_trel_desvios_graf_NR_PROCESSO: TIntegerField;
    qry_trel_desvios_ap_evento_: TQuery;
    ds_trel_desvios_ap_evento_: TDataSource;
    ppBDETRelDesviosApEvento: TppBDEPipeline;
    qry_trel_desvios_ap_evento_TOTAL_EVENTO_PORCENTAGEM: TFloatField;
    qry_trel_desvios_ap_evento_TOTAL_EVENTO: TIntegerField;
    qry_trel_desvios_ap_evento_AP_EVENTO: TStringField;
    qry_trel_desvios_ap_evento_TOTAL_PROCESSO: TIntegerField;
    qry_trel_desv_media_dias_evento_: TQuery;
    ds_trel_desv_media_dias_evento: TDataSource;
    ppBDETRelDesvMediaDiasEvento: TppBDEPipeline;
    qry_trel_desv_media_dias_evento_AP_EVENTO: TStringField;
    qry_trel_desv_media_dias_evento_MEDIA_DIAS_EVENTO: TIntegerField;
    ds_trel_followup_navio: TDataSource;
    qry_trel_followup_navio_: TQuery;
    qry_trel_followup_navio_NM_EMBARCACAO: TStringField;
    qry_trel_followup_navio_DT_ESPERA_NAVIO: TDateTimeField;
    qry_trel_followup_navio_DT_ENT: TDateTimeField;
    qry_trel_followup_navio_NR_IDENTIFICADOR: TIntegerField;
    qry_trel_followup_navio_CD_UNID_NEG: TStringField;
    qry_trel_followup_navio_CD_PRODUTO: TStringField;
    qry_trel_followup_navio_NR_PROCESSO: TStringField;
    qry_trel_followup_navio_CD_REFERENCIA: TStringField;
    qry_trel_followup_navio_NM_URGENCIA: TStringField;
    qry_trel_followup_navio_NM_EMPRESA: TStringField;
    qry_trel_followup_navio_NM_AGENTE: TStringField;
    qry_trel_followup_navio_ARM_ATRAC: TStringField;
    qry_trel_followup_navio_ARM_DESC: TStringField;
    qry_trel_followup_navio_DT_DESOVA: TDateTimeField;
    qry_trel_followup_navio_DT_LIB_BL: TDateTimeField;
    qry_trel_followup_navio_DT_REC_DOC: TDateTimeField;
    qry_trel_followup_navio_DT_DOC_OK: TDateTimeField;
    qry_trel_followup_navio_DT_DESEMB: TDateTimeField;
    qry_trel_followup_navio_DT_CAMBIO: TDateTimeField;
    qry_trel_followup_navio_DT_REG_DI: TDateTimeField;
    qry_trel_followup_navio_DT_ENT_MERC: TDateTimeField;
    qry_trel_followup_navio_DT_CI: TDateTimeField;
    qry_trel_followup_navio_DT_PRES_CARGA: TDateTimeField;
    qry_trel_followup_navio_TX_OBS: TMemoField;
    qry_trel_followup_navio_NR_VIAGEM: TStringField;
    qry_trel_followup_navio_NM_AREA: TStringField;
    qry_trel_followup_navio_DT_NF_TRANSP: TDateTimeField;
    qry_trel_followup_navio_DT_PREV_FABRICA: TDateTimeField;
    qry_trel_followup_navio_TX_MERC: TMemoField;
    qry_trel_followup_navio_AP_PRODUTO: TStringField;
    qry_trel_followup_navio_NM_CANAL: TStringField;
    qry_trel_followup_navio_AP_UNID_NEG: TStringField;
    qry_trel_followup_navio_NM_SERVICO: TStringField;
    qry_trel_followup_navio_CalcNrProcesso: TStringField;
    BDETrelFollowupNavio: TppBDEPipeline;
    qry_trel_followup_navio_CalcArm_Desc: TStringField;
    qry_trel_followup_navio_CalcDt_Desova: TStringField;
    qry_trel_followup_navio_CalcDt_Lib_Bl: TStringField;
    qry_trel_followup_navio_CalcNm_Agente: TStringField;
    qry_trel_followup_navio_CalcDt_Pres_carga: TStringField;
    qry_rel_lead_time_area_: TQuery;
    ppBDERelLeadTimeArea: TppBDEPipeline;
    ds_rel_lead_time_area: TDataSource;
    ds_tp_canal_: TDataSource;
    qry_tp_canal_: TQuery;
    qry_tp_canal_CD_CANAL: TStringField;
    qry_tp_canal_NM_CANAL: TStringField;
    qry_agente_: TQuery;
    qry_pais_: TQuery;
    qry_pais_CD_PAIS: TStringField;
    qry_pais_NM_PAIS: TStringField;
    qry_transp_: TQuery;                                             
    qry_transp_CD_TRANSP_ROD: TStringField;
    qry_transp_NM_TRANSP_ROD: TStringField;
    qry_amz_: TQuery;
    qry_amz_CD_ARMAZEM: TStringField;
    qry_amz_NM_ARMAZEM: TStringField;
    qry_rel_dem_ger2_: TQuery;
    sp_rel_dem_gerencial2: TStoredProc;
    ppBDERelDemGer2: TppBDEPipeline;
    ds_rel_dem_ger2: TDataSource;
    qry_rel_dem_ger2_NR_IDENTIFICADOR: TIntegerField;
    qry_rel_dem_ger2_NR_PROCESSO: TStringField;
    qry_rel_dem_ger2_NR_CNTR: TStringField;
    qry_rel_dem_ger2_CD_UNID_NEG: TStringField;
    qry_rel_dem_ger2_CD_PRODUTO: TStringField;
    qry_rel_dem_ger2_CD_CLIENTE: TStringField;
    qry_rel_dem_ger2_CD_AREA: TStringField;
    qry_rel_dem_ger2_CD_ARMAZEM_DESCARGA: TStringField;
    qry_rel_dem_ger2_NR_FREE_TIME: TIntegerField;
    qry_rel_dem_ger2_DT_ENT: TDateTimeField;
    qry_rel_dem_ger2_NR_DIAS_CORRIDOS: TIntegerField;
    qry_rel_dem_ger2_NR_DIAS_A_PAGAR: TIntegerField;
    qry_rel_dem_ger2_DT_DEVOLUCAO_CNTR: TDateTimeField;
    qry_rel_dem_ger2_CD_TRANSP_NAC_DOC: TStringField;
    qry_rel_dem_ger2_CD_PAIS_ORIGEM: TStringField;
    qry_rel_dem_ger2_VL_PAGAR_NA_MOEDA: TFloatField;
    qry_rel_dem_ger2_CD_MOEDA: TStringField;
    qry_rel_dem_ger2_VL_PAGAR_REAIS: TFloatField;
    qry_rel_dem_ger2_DESCONTO: TFloatField;
    qry_rel_dem_ger2_VL_PAGO: TFloatField;
    qry_rel_dem_ger2_DT_PAGTO: TDateTimeField;
    qry_rel_dem_ger2_TX_CAMBIO: TFloatField;
    qry_rel_dem_ger2_CalcCntr: TStringField;
    qry_rel_dem_ger2_NM_UNID_NEG: TStringField;
    qry_rel_dem_ger2_NM_PRODUTO: TStringField;
    qry_rel_dem_ger2_NM_CLIENTE: TStringField;
    qry_rel_dem_ger2_CalcProcesso: TStringField;
    qry_rel_dem_ger2_TX_MERCADORIA: TMemoField;
    qry_rel_dem_ger2_NM_CABEC: TStringField;
    qry_rel_dem_ger2_NM_AREA: TStringField;
    qry_rel_dem_ger2_TP_CNTR: TStringField;
    qry_rel_dem_ger2_VL_DIARIA: TFloatField;
    qry_rel_dem_ger2_DESCONTO_MOEDA: TFloatField;
    qry_rel_dem_ger2_AP_MOEDA: TStringField;
    qry_rel_dem_ger2_IN_PARCIAL: TStringField;
    qry_trel_followup_navio_NM_AREA_SUB: TStringField;
    qry_rel_requerimento_: TQuery;
    ppBDE_rel_requerimento: TppBDEPipeline;
    sp_rel_requerimento: TStoredProc;
    ds_requerimento: TDataSource;
    qry_rel_requerimento_NR_IDENTIFICADOR: TIntegerField;
    qry_rel_requerimento_NR_PROCESSO: TStringField;
    qry_rel_requerimento_NR_REQUERIMENTO: TStringField;
    qry_rel_requerimento_DT_VENCIMENTO: TDateTimeField;
    qry_rel_requerimento_NR_LI: TStringField;
    qry_rel_requerimento_DT_EMISSAO_LI: TDateTimeField;
    qry_rel_requerimento_QT_FISICA_LI: TFloatField;
    qry_rel_requerimento_QT_ACUMULADA: TFloatField;
    qry_rel_requerimento_DT_DESPACHO: TDateTimeField;
    qry_rel_requerimento_IN_DEFERIDO: TStringField;
    qry_rel_requerimento_IN_INDEFERIDO: TStringField;
    qry_rel_requerimento_DT_REQUERIMENTO: TDateTimeField;
    qry_rel_requerimento_CalcNr_Processo: TStringField;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    ppTitulo: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine6: TppLine;
    ppVarRodapeDir: TppVariable;
    ppTotPag: TppSystemVariable;
    ppNumPag: TppSystemVariable;
    pplblCliente: TppLabel;
    pplblProduto: TppLabel;
    pplblUnidade: TppLabel;
    pplblArea: TppLabel;
    ppVarRodapeEsq: TppVariable;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppLabel4: TppLabel;
    ppLine5: TppLine;
    ppDBText3: TppDBText;
    ppLine3: TppLine;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel5: TppLabel;
    ppDBText6: TppDBText;
    ppLabel28: TppLabel;
    ppDBText29: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel6: TppLabel;
    ppDBText7: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppDBText23: TppDBText;
    ppLabel25: TppLabel;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppRegion1: TppRegion;
    ppdbobs: TppDBMemo;
    ppobs: TppLabel;
    ppRegion2: TppRegion;
    ppLabel10: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppLabel26: TppLabel;
    ppDBText24: TppDBText;
    ppLabel27: TppLabel;
    ppDBText28: TppDBText;
    ppLabel1: TppLabel;
    ppDBText11: TppDBText;
    ppLabel11: TppLabel;
    ppDBText12: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    procedure ppTitleBand1BeforePrint(Sender: TObject);
    procedure ppVarRodapeEsqCalc(Sender: TObject; var Value: Variant);
    procedure ppVarRodapeDirCalc(Sender: TObject; var Value: Variant);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure qry_trel_followup_navio_CalcFields(DataSet: TDataSet);
    procedure ppobsPrint(Sender: TObject);
    procedure qry_rel_requerimento_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sel_unid_prod_emb: Tdatm_sel_unid_prod_emb;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP027;

procedure Tdatm_sel_unid_prod_emb.ppTitleBand1BeforePrint(Sender: TObject);
var nm_canal, nm_navio, nm_agente, nm_armazem, nm_transp, nm_pais, strEnter : string;

begin

  strEnter :=#13#10;

  with frm_sel_unid_prod_emb do
  begin

  if (Trim( cbo_tp_canal.Text ) <> '')  then
     nm_canal := ' Canal: ' + cbo_tp_canal.Text;

  if (Trim ( msk_cd_embarcacao.Text ) <> '') then
      nm_navio :=  strEnter + 'Navio: ' + edt_nm_embarcacao.Text;

  if (Trim ( msk_cd_agente.Text ) <> '') then
      nm_agente := strEnter + 'Agente: ' + edt_nm_agente.Text;

  if (Trim ( msk_cd_armazem.Text ) <> '') then
      nm_armazem := strEnter + 'Armazem: ' + edt_nm_armazem.Text ;

  if (Trim ( msk_cd_transp.Text ) <> '') then
      nm_transp := strEnter + 'Transportadora: ' + edt_nm_transp.Text;

  if (Trim ( msk_cd_pais.Text ) <> '') then
      nm_pais := strEnter + 'País: ' + edt_nm_pais.Text;

    case tp_rel of
       1 :     if msk_dt_inicio.Date = msk_dt_fim.Date Then
                 ppTitulo.Caption := 'Follow-Up de Navios [ ' + FormatDateTime( FData, msk_dt_inicio.Date ) + ' ]'
               else
                 ppTitulo.Caption := 'Follow-Up de Navios [ ' + FormatDateTime( FData, msk_dt_inicio.Date ) + ' a ' + FormatDateTime( FData, msk_dt_fim.Date ) + ' ]';

       3 :     ppTitulo.Caption := 'Relatório Gerencial de Demurrage - Período: ' +
                        FormatDateTime( FData, msk_dt_inicio.Date ) +
                        ' a ' + FormatDateTime( FData, msk_dt_fim.Date );
       4 :     ppTitulo.Caption := 'Relatório Lead Time - Período: ' +
                        FormatDateTime( FData, msk_dt_inicio.Date ) +
                        ' a ' + FormatDateTime( FData, msk_dt_fim.Date ) + nm_canal;
       6 :     ppTitulo.Caption := 'Relatório Desvios - Período: ' +
                        FormatDateTime( FData, msk_dt_inicio.Date ) +
                        ' a ' + FormatDateTime( FData, msk_dt_fim.Date );
       7:       ppTitulo.Caption := 'Relatório Gerencial de Demurrage Mod. 2 - Período: ' +
                        FormatDateTime( FData, msk_dt_inicio.Date ) +
                        ' a ' + FormatDateTime( FData, msk_dt_fim.Date )+ nm_navio + nm_agente +
                        nm_armazem + nm_transp + nm_pais;
       8 : begin
             if msk_dt_inicio.Date = msk_dt_fim.Date Then
               ppTitulo.Caption := 'Controle de Requerimento [ ' + FormatDateTime( FData, msk_dt_inicio.Date ) + ' ]'
             else
               ppTitulo.Caption := 'Controle de Requerimento [ ' + FormatDateTime( FData, msk_dt_inicio.Date ) + ' a ' + FormatDateTime( FData, msk_dt_fim.Date ) + ' ]';

{             if Trim(edt_nm_unid_neg.Text) <> '' then
               pplblunidneg.Caption := 'Unidade: ' + edt_nm_unid_neg.Text;

             if Trim( edt_nm_produto.Text) <> '' then
               pplblproduto.Caption := 'Produto: ' + edt_nm_produto.Text;

             if Trim( edt_nm_grupo.Text) <> '' then
             begin
               ppTitulo.Caption := ppTitulo.Caption + strEnter + 'Grupo:' + edt_nm_grupo.Text;
             end
             else
             begin
               ppTitulo.Caption := ppTitulo.Caption + strEnter + 'Cliente:' + edt_nm_cliente.Text;
             end; }
           end;
    end;
  end;
end;

procedure Tdatm_sel_unid_prod_emb.ppVarRodapeEsqCalc(Sender: TObject;
  var Value: Variant);
begin
  case frm_sel_unid_prod_emb.tp_rel of
     1 : ppVarRodapeEsq.AsString := 'RBPO006' + Space(5) + 'Emitido em ' + FormatDateTime( 'dd/mm/yyyy', dt_server ) + '  às  ' + FormatDateTime( 'hh:mm:ss', hr_server );
     3 : ppVarRodapeEsq.AsString := 'RBDEM001' + Space(5) + 'Emitido em ' + FormatDateTime( 'dd/mm/yyyy', dt_server ) + '  às  ' + FormatDateTime( 'hh:mm:ss', hr_server );
     4 : ppVarRodapeEsq.AsString := 'RBIMP003' + Space(5) + 'Emitido em ' + FormatDateTime( 'dd/mm/yyyy', dt_server ) + '  às  ' + FormatDateTime( 'hh:mm:ss', hr_server );
     6 : ppVarRodapeEsq.AsString := 'RBEST004' + Space(5) + 'Emitido em ' + FormatDateTime( 'dd/mm/yyyy', dt_server ) + '  às  ' + FormatDateTime( 'hh:mm:ss', hr_server );
     7 : ppVarRodapeEsq.AsString := 'RBDEM003' + Space(5) + 'Emitido em ' + FormatDateTime( 'dd/mm/yyyy', dt_server ) + '  às  ' + FormatDateTime( 'hh:mm:ss', hr_server );
     8 : ppVarRodapeEsq.AsString := 'RBPO009' + Space(5) + 'Emitido em ' + FormatDateTime( 'dd/mm/yyyy', dt_server ) + '  às  ' + FormatDateTime( 'hh:mm:ss', hr_server );
  end;
end;

procedure Tdatm_sel_unid_prod_emb.ppVarRodapeDirCalc(Sender: TObject;
  var Value: Variant);
begin
  ppVarRodapeDir.AsString := 'Folha ' + ppNumPag.Text + ' / ' + ppTotPag.Text;
end;

procedure Tdatm_sel_unid_prod_emb.ppHeaderBand1BeforePrint(Sender: TObject);
begin
  with frm_sel_unid_prod_emb do
  begin
    pplblUnidade.Caption := 'Unidade: ' + Trim( edt_nm_unid_neg.Text );
    pplblProduto.Caption := 'Produto: ' + Trim( edt_nm_produto.Text );
    if ( Trim( edt_nm_grupo.Text ) <> '' ) and ( Trim( edt_nm_grupo.Text ) <> 'Todos' ) then
      pplblCliente.Caption := 'Cliente: ' + Trim( edt_nm_grupo.Text )
    else
      pplblCliente.Caption := 'Cliente: ' + Trim( edt_nm_cliente.Text );
    if Not chk_area.Checked then
      pplblArea.Caption    := 'Área: '    + Trim( edt_nm_area.Text );

    if frm_sel_unid_prod_emb.tp_rel = 8 then
      if Trim( msk_cd_area.Text ) <> '' then
        pplblArea.Caption    := 'Área: '    + Trim( edt_nm_area.Text );

  end;
end;

procedure Tdatm_sel_unid_prod_emb.qry_trel_followup_navio_CalcFields(DataSet: TDataSet);
var
  Dt_Desova, Dt_Lib_Bl, Dt_Pres_Carga, tipo_processo:string;
begin
  qry_trel_followup_navio_CalcNrProcesso.Text := Copy( qry_trel_followup_navio_NR_PROCESSO.Text, 5, 14 );

  tipo_processo := Copy( qry_trel_followup_navio_NR_PROCESSO.text, 5, 2);

  if qry_trel_followup_navio_Dt_Desova.Value = NULL then
   Dt_Desova := ''
  else
    Dt_Desova := qry_trel_followup_navio_Dt_Desova.AsString;

  if qry_trel_followup_navio_Dt_Lib_Bl.Value = NULL then
    Dt_Lib_Bl := ''
  else
    Dt_Lib_Bl := qry_trel_followup_navio_Dt_Lib_Bl.AsString;

  if qry_trel_followup_navio_Dt_Pres_Carga.Value = NULL then
    Dt_Pres_Carga := ''
  else
    Dt_Pres_Carga := qry_trel_followup_navio_Dt_Pres_Carga.AsString;

  if (tipo_processo = 'IN') or (tipo_processo = 'IT') or (tipo_processo = 'FT') then
    begin
      qry_trel_followup_navio_CalcArm_Desc.Text      := '*******';
      qry_trel_followup_navio_CalcDt_Desova.Text     := '*******';
      qry_trel_followup_navio_CalcDt_Lib_Bl.Text     := '*******';
      qry_trel_followup_navio_CalcNm_Agente.Text     := '*******';
      qry_trel_followup_navio_Calcdt_Pres_Carga.Text := '*******';
    end
  else
    begin
      qry_trel_followup_navio_CalcArm_Desc.Text      := qry_trel_followup_navio_Arm_Desc.Value;
      qry_trel_followup_navio_CalcDt_Desova.Text     := Dt_Desova;
      qry_trel_followup_navio_CalcDt_Lib_Bl.Text     := Dt_Lib_Bl;
      qry_trel_followup_navio_CalcNm_Agente.Text     := qry_trel_followup_navio_Nm_Agente.Value;
      qry_trel_followup_navio_Calcdt_Pres_Carga.Text := Dt_Pres_Carga;
    end;
end;

procedure Tdatm_sel_unid_prod_emb.ppobsPrint(Sender: TObject);
begin
  if not frm_sel_unid_prod_emb.chk_obs.Checked then
  begin
    ppobs.Visible   := False;
    ppdbobs.Visible := False;
  end
  else
  begin
    ppobs.Visible   := True;
    ppdbobs.Visible := True;
  end;
end;










procedure Tdatm_sel_unid_prod_emb.qry_rel_requerimento_CalcFields(
  DataSet: TDataSet);
begin
  qry_rel_requerimento_CalcNr_Processo.Text := Copy(qry_rel_requerimento_NR_PROCESSO.AsString , 5, 14 );
end;

end.
