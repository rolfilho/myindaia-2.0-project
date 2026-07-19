(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGGP060.PAS - datm_ajuste_impressao_nf_serv
AUTOR: Leandro Stipanich
DATA: 31/01/2002
Manutenção:
Data: 10/05/2005
*************************************************************************************************)

unit PGGP060;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ppDB, ppBands, ppClass, ppProd, ppReport, ppComm, ppRelatv,
  ppCache, ppVar, ppStrtch, ppSubRpt, ppCtrls, ppPrnabl, ppDBPipe,
  ppDBBDE, ppMemo, ppRegion, ppModule, daDatMod, ppEndUsr;

type
  Tdatm_sel_padrao_agente = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_grupo_DT_INCLUSAO: TDateTimeField;
    qry_grupo_IN_ATIVO: TStringField;
    sp_rel_cntr_origem: TStoredProc;
    qry_agente_: TQuery;
    qry_agente_CD_AGENTE: TStringField;
    qry_agente_NM_AGENTE: TStringField;
    sp_rel_est_volumes: TStoredProc;
    qry_rel_est_vol_: TQuery;
    qry_servico_: TQuery;
    ds_servico_: TDataSource;
    sp_rel_est_volumes_mod2: TStoredProc;
    qry_rel_est_vol_mod2_: TQuery;
    ppBDETRel_Volumes_Mod2: TppBDEPipeline;
    ppSelPadraoAgente: TppReport;
    ds_trel_est_vol_mod2_: TDataSource;
    ds_trel_est_vol_mod2_sub_: TDataSource;
    qry_rel_est_vol_mod2_sub_: TQuery;
    qry_rel_est_vol_mod2_NR_IDENTIFICADOR: TIntegerField;
    qry_rel_est_vol_mod2_NR_PROCESSO: TStringField;
    qry_rel_est_vol_mod2_CD_UNID_NEG: TStringField;
    qry_rel_est_vol_mod2_NM_UNID_NEG: TStringField;
    qry_rel_est_vol_mod2_CD_PRODUTO: TStringField;
    qry_rel_est_vol_mod2_NM_PRODUTO: TStringField;
    qry_rel_est_vol_mod2_NR_ADICAO: TStringField;
    qry_rel_est_vol_mod2_CD_CLIENTE: TStringField;
    qry_rel_est_vol_mod2_NM_CLIENTE: TStringField;
    qry_rel_est_vol_mod2_CD_AGENTE: TStringField;
    qry_rel_est_vol_mod2_NM_AGENTE: TStringField;
    qry_rel_est_vol_mod2_VL_QTDE: TFloatField;
    qry_rel_est_vol_mod2_NM_VOLUME: TStringField;
    qry_rel_est_vol_mod2_NM_ARMAZEM_DESCARGA: TStringField;
    qry_rel_est_vol_mod2_NM_ARMAZEM_ATRACACAO: TStringField;
    qry_rel_est_vol_mod2_VL_AFRMM: TFloatField;
    qry_rel_est_vol_mod2_VL_LIB_BL: TFloatField;
    qry_rel_est_vol_mod2_VL_TX_DESC: TFloatField;
    qry_rel_est_vol_mod2_VL_HANDLING: TFloatField;
    qry_rel_est_vol_mod2_VL_CAPATAZIA: TFloatField;
    qry_rel_est_vol_mod2_VL_THC_TERMINAL: TFloatField;
    qry_rel_est_vol_mod2_VL_MOV_CARREGAMENTO: TFloatField;
    qry_rel_est_vol_mod2_VL_ARMAZENAGEM: TFloatField;
    qry_rel_est_vol_mod2_NM_CANAL: TStringField;
    qry_rel_est_vol_mod2_CD_REFERENCIA: TStringField;
    qry_rel_est_vol_mod2_VL_CIF_DOLAR: TFloatField;
    qry_rel_est_vol_mod2_VL_CIF_MN: TFloatField;
    qry_rel_est_vol_mod2_NM_TP_FRETE: TStringField;
    qry_rel_est_vol_mod2_DT_DESEMB: TDateTimeField;
    qry_rel_est_vol_mod2_DT_ENVIO_NF_TRANSP: TDateTimeField;
    qry_rel_est_vol_mod2_VL_PESO_BRUTO: TFloatField;
    qry_rel_est_vol_mod2_VL_FRETE_MNEG: TFloatField;
    qry_rel_est_vol_mod2_VL_FRETE_MN: TFloatField;
    qry_rel_est_vol_mod2_NM_AREA: TStringField;
    qry_rel_est_vol_mod2_VL_IPI_MN: TFloatField;
    qry_rel_est_vol_mod2_DT_REGISTRO: TDateTimeField;
    qry_rel_est_vol_mod2_DT_LIB_NF_TRANSP: TDateTimeField;
    qry_rel_est_vol_mod2_CD_SERVICO: TStringField;
    qry_rel_est_vol_mod2_DS_SERVICO: TStringField;
    qry_rel_est_vol_mod2_DT_CHEGADA_NAVIO: TDateTimeField;
    qry_rel_est_vol_mod2_AP_MOEDA: TStringField;
    qry_rel_est_vol_mod2_VL_II_MN: TFloatField;
    qry_rel_est_vol_mod2_VL_ALIQUOTA_IPI: TStringField;
    qry_rel_est_vol_mod2_VL_ALIQUOTA_II: TStringField;
    qry_rel_est_vol_mod2_CD_REGIME_TRIBUTAR: TStringField;
    qry_rel_est_vol_mod2_REGIME_II: TStringField;
    qry_rel_est_vol_mod2_REGIME_IPI: TStringField;
    ppBDETRel_Volumes_Mod2_Sub: TppBDEPipeline;
    qry_rel_est_vol_mod2_sub_NR_IDENTIFICADOR: TIntegerField;
    qry_rel_est_vol_mod2_sub_NR_PROCESSO: TStringField;
    qry_rel_est_vol_mod2_sub_CD_UNID_NEG: TStringField;
    qry_rel_est_vol_mod2_sub_CD_PRODUTO: TStringField;
    qry_rel_est_vol_mod2_sub_NR_ADICAO: TStringField;
    qry_rel_est_vol_mod2_sub_CD_CLIENTE: TStringField;
    qry_rel_est_vol_mod2_sub_NM_VOLUME: TStringField;
    qry_rel_est_vol_mod2_sub_NR_SEQUENCIA: TStringField;
    qry_rel_est_vol_mod2_sub_CD_REFERENCIA: TStringField;
    qry_rel_est_vol_mod2_sub_VL_II_MN: TFloatField;
    qry_rel_est_vol_mod2_sub_VL_IPI_MN: TFloatField;
    qry_rel_est_vol_mod2_sub_VL_ALIQUOTA_IPI: TStringField;
    qry_rel_est_vol_mod2_sub_VL_ALIQUOTA_II: TStringField;
    qry_rel_est_vol_mod2_sub_REGIME_II: TStringField;
    qry_rel_est_vol_mod2_sub_REGIME_IPI: TStringField;
    sp_mostra_servico_rel_est_vol_mod2_tmp: TStoredProc;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    ppTitulo: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppProcesso: TppLabel;
    ppLabel1: TppLabel;
    ppReferencia: TppDBText;
    lblArea: TppLabel;
    ppDBText2: TppDBText;
    Qtde: TppLabel;
    ppDBText3: TppDBText;
    ppLabel2: TppLabel;
    ppDBText4: TppDBText;
    ppLabel3: TppLabel;
    ppDBText9: TppDBText;
    ppLabel4: TppLabel;
    ppDBText10: TppDBText;
    ppLabel5: TppLabel;
    ppDBText11: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLabel10: TppLabel;
    ppDBText16: TppDBText;
    ppLabel11: TppLabel;
    ppDBText17: TppDBText;
    ppLabel12: TppLabel;
    ppDBText18: TppDBText;
    ppLabel13: TppLabel;
    ppDBText19: TppDBText;
    ppLabel14: TppLabel;
    ppDBText20: TppDBText;
    ppLabel15: TppLabel;
    ppDBText21: TppDBText;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDBText23: TppDBText;
    ppLabel18: TppLabel;
    ppDBText22: TppDBText;
    ppDBText25: TppDBText;
    ppLabel21: TppLabel;
    ppDBText27: TppDBText;
    ppLabel22: TppLabel;
    ppDBText28: TppDBText;
    ppLabel23: TppLabel;
    ppDBText29: TppDBText;
    ppLabel24: TppLabel;
    ppDBText30: TppDBText;
    ppLabel25: TppLabel;
    ppDBText31: TppDBText;
    ppLine1: TppLine;
    ppLabel28: TppLabel;
    ppDBText34: TppDBText;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppLabel29: TppLabel;
    ppDBText35: TppDBText;
    ppLabel30: TppLabel;
    ppDBText36: TppDBText;
    ppLabel31: TppLabel;
    ppDBText37: TppDBText;
    ppLabel32: TppLabel;
    ppDBText38: TppDBText;
    ppLabel33: TppLabel;
    ppDBText39: TppDBText;
    ppLabel34: TppLabel;
    ppDBText40: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppFooterBand1: TppFooterBand;
    ppLine6: TppLine;
    ppTotPag: TppSystemVariable;
    ppNumPag: TppSystemVariable;
    ppVarRodapeDir: TppVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLine2: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    qry_rel_est_vol_mod2_NM_GRUPO: TStringField;
    qry_rel_est_vol_mod2_DT_PRES_CARGA: TDateTimeField;
    sp_rel_est_armz_carga: TStoredProc;
    qry_armazem_: TQuery;
    qry_armazem_CD_ARMAZEM: TStringField;
    qry_armazem_NM_ARMAZEM: TStringField;
    qry_area_: TQuery;
    qry_area_CD_AREA: TStringField;
    qry_area_NM_AREA: TStringField;
    ds_rel_armz_carga: TDataSource;
    qry_rel_armz_carga_: TQuery;
    qry_rel_armz_carga_NM_ARMAZEM: TStringField;
    qry_rel_armz_carga_NR_MES: TStringField;
    qry_rel_armz_carga_NR_ANO: TStringField;
    qry_rel_armz_carga_QTDE: TFloatField;
    qry_rel_armz_carga_ARMA: TFloatField;
    qry_cabec_: TQuery;
    qry_cabec_MES: TStringField;
    qry_cabec_ANO: TStringField;
    qry_transportadora_: TQuery;
    qry_transportadora_CD_TRANSP_ROD: TStringField;
    qry_transportadora_AP_TRANSP_ROD: TStringField;
    sp_rel_armaz_rem: TStoredProc;
    qry_rel_armaz_rem_: TQuery;
    qry_rel_armaz_rem_NR_IDENTIFICADOR: TIntegerField;
    qry_rel_armaz_rem_NR_PROCESSO: TStringField;
    qry_rel_armaz_rem_NM_EMPRESA: TStringField;
    qry_rel_armaz_rem_NM_ARM_DESCARGA: TStringField;
    qry_rel_armaz_rem_VL_ARMAZENAGEM: TFloatField;
    qry_rel_armaz_rem_NM_AGENTE: TStringField;
    qry_rel_armaz_rem_NR_CONHECIMENTO: TStringField;
    qry_rel_armaz_rem_VL_FUMIGACAO: TFloatField;
    qry_rel_armaz_rem_NM_ARM_ATRACACAO: TStringField;
    qry_rel_armaz_rem_AP_TRANSP_ROD: TStringField;
    qry_rel_armaz_rem_NM_VOLUME: TStringField;
    qry_rel_armaz_rem_NM_EMBALAGEM: TStringField;
    qry_rel_armaz_rem_VL_QTDE: TFloatField;
    qry_rel_armaz_rem_NM_EMP_FUMIGACAO: TStringField;
    qry_via_transp_broker_: TQuery;
    qry_via_transp_broker_CD_VIA_TRANSP: TStringField;
    qry_via_transp_broker_NM_VIA_TRANSP: TStringField;
    qry_via_transp_broker_CD_VIA_TRANSP_SISCOMEX: TStringField;
    qry_via_transp_broker_IN_ATIVO: TStringField;
    ds_via_transp_broker: TDataSource;
    sp_rel_fup_dia: TStoredProc;
    qry_fup_dia_: TQuery;
    qry_fup_dia_NR_IDENTIFICADOR: TIntegerField;
    qry_fup_dia_NR_PROCESSO: TStringField;
    qry_fup_dia_NR_PO: TStringField;
    qry_fup_dia_NR_FATURA: TStringField;
    qry_fup_dia_NR_CONHECIMENTO: TStringField;
    qry_fup_dia_NR_CERTIFICADO: TStringField;
    qry_fup_dia_TX_MERCADORIA: TStringField;
    qry_fup_dia_VL_QTDE: TFloatField;
    qry_fup_dia_NM_VOLUME: TStringField;
    qry_fup_dia_NR_FREE: TIntegerField;
    qry_fup_dia_NM_ARM_DESCARGA: TStringField;
    qry_fup_dia_NR_VOO: TStringField;
    qry_fup_dia_DT_VOO: TDateTimeField;
    qry_fup_dia_NM_EMBARCACAO: TStringField;
    qry_fup_dia_DT_CHEGADA_NAVIO: TDateTimeField;
    qry_fup_dia_DT_PRES_CARGA: TDateTimeField;
    qry_fup_dia_DT_SOLIC_NUM: TDateTimeField;
    qry_fup_dia_DT_REC_NUM: TDateTimeField;
    qry_fup_dia_NR_DI: TStringField;
    qry_fup_dia_DT_DI: TDateTimeField;
    qry_fup_dia_CANAL: TStringField;
    qry_fup_dia_DT_DESEMB: TDateTimeField;
    qry_fup_dia_DT_ENT_TRANSP: TDateTimeField;
    qry_fup_dia_DT_TRANSP: TDateTimeField;
    qry_fup_dia_OBS: TMemoField;
    qry_fup_proc_: TQuery;
    qry_fup_proc_NR_PROCESSO: TStringField;
    qry_fup_proc_CD_REFERENCIA: TStringField;
    qry_fup_proc_DT_REC_PO: TDateTimeField;
    qry_fup_proc_PRODUTO: TStringField;
    qry_fup_proc_NR_VOO: TStringField;
    qry_fup_proc_DT_VOO: TDateTimeField;
    qry_fup_proc_NAVIO: TStringField;
    qry_fup_proc_NR_VIAGEM: TStringField;
    qry_fup_proc_DT_NAVIO: TDateTimeField;
    qry_fup_proc_DT_CAMBIO: TDateTimeField;
    qry_fup_proc_DT_NUM: TDateTimeField;
    qry_fup_proc_DT_NUM_IMP: TDateTimeField;
    qry_fup_proc_DT_ORIG: TDateTimeField;
    qry_fup_proc_DT_REG: TDateTimeField;
    qry_fup_proc_NM_CANAL: TStringField;
    qry_fup_proc_DT_SOL_NF: TDateTimeField;
    qry_fup_proc_DT_CI: TDateTimeField;
    qry_fup_proc_TX_OBS: TMemoField;
    qry_fup_proc_po_: TQuery;
    qry_fup_proc_po_NR_PROCESSO: TStringField;
    qry_fup_proc_po_CD_REFERENCIA: TStringField;
    qry_fup_proc_po_DT_REC_PO: TDateTimeField;
    qry_fup_proc_po_PRODUTO: TStringField;
    qry_fup_proc_po_NR_VOO: TStringField;
    qry_fup_proc_po_DT_VOO: TDateTimeField;
    qry_fup_proc_po_NAVIO: TStringField;
    qry_fup_proc_po_NR_VIAGEM: TStringField;
    qry_fup_proc_po_DT_NAVIO: TDateTimeField;
    qry_fup_proc_po_DT_CAMBIO: TDateTimeField;
    qry_fup_proc_po_DT_NUM: TDateTimeField;
    qry_fup_proc_po_DT_NUM_IMP: TDateTimeField;
    qry_fup_proc_po_DT_ORIG: TDateTimeField;
    qry_fup_proc_po_DT_REG: TDateTimeField;
    qry_fup_proc_po_NM_CANAL: TStringField;
    qry_fup_proc_po_DT_SOL_NF: TDateTimeField;
    qry_fup_proc_po_DT_CI: TDateTimeField;
    qry_fup_proc_po_TX_OBS: TMemoField;
    qry_fup_proc_fim_: TQuery;
    qry_fup_proc_fim_NR_PROCESSO: TStringField;
    qry_fup_proc_fim_CD_REFERENCIA: TStringField;
    qry_fup_proc_fim_DT_REC_PO: TDateTimeField;
    qry_fup_proc_fim_PRODUTO: TStringField;
    qry_fup_proc_fim_NR_VOO: TStringField;
    qry_fup_proc_fim_DT_VOO: TDateTimeField;
    qry_fup_proc_fim_NAVIO: TStringField;
    qry_fup_proc_fim_NR_VIAGEM: TStringField;
    qry_fup_proc_fim_DT_NAVIO: TDateTimeField;
    qry_fup_proc_fim_DT_CAMBIO: TDateTimeField;
    qry_fup_proc_fim_DT_NUM: TDateTimeField;
    qry_fup_proc_fim_DT_NUM_IMP: TDateTimeField;
    qry_fup_proc_fim_DT_ORIG: TDateTimeField;
    qry_fup_proc_fim_DT_REG: TDateTimeField;
    qry_fup_proc_fim_NM_CANAL: TStringField;
    qry_fup_proc_fim_DT_SOL_NF: TDateTimeField;
    qry_fup_proc_fim_DT_CI: TDateTimeField;
    qry_fup_proc_fim_TX_OBS: TMemoField;
    ppTitulo1: TppLabel;
    ppTitulo2: TppLabel;
    procedure ppTitleBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sel_padrao_agente: Tdatm_sel_padrao_agente;

implementation

uses PGGP059, PGGP001, GSMLIB;

procedure Tdatm_sel_padrao_agente.ppTitleBand1BeforePrint(Sender: TObject);
var strEnter, nm_grupo, nm_cliente, nm_agente: string;

begin
  ppTitulo.Caption :=  'Relação de Volumes Mod.2 ';

  if frm_sel_padrao_agente.msk_dt_inicio.Date = frm_sel_padrao_agente.msk_dt_fim.Date then
    ppTitulo.Caption := ppTitulo.Caption  + ' - ' + FormatDateTime( 'dd/mm/yyyy', frm_sel_padrao_agente.msk_dt_inicio.Date )
  else
    ppTitulo.Caption := ppTitulo.Caption + ' - ' + FormatDateTime( 'dd/mm/yyyy', frm_sel_padrao_agente.msk_dt_inicio.Date ) + ' a ' + FormatDateTime( 'dd/mm/yyyy', frm_sel_padrao_agente.msk_dt_fim.Date );

  if frm_sel_padrao_agente.msk_cd_grupo.Text <> '' then
  begin
    ppTitulo1.Caption := frm_sel_padrao_agente.edt_nm_grupo.Text;
  end
  else
  begin
    ppTitulo1.Caption := frm_sel_padrao_agente.edt_nm_cliente.Text;
  end;

  if frm_sel_padrao_agente.msk_cd_agente.Text <> '' then
  begin
    ppTitulo2.Caption := frm_sel_padrao_agente.edt_nm_agente.Text;
  end;
end;

{$R *.DFM}


end.
