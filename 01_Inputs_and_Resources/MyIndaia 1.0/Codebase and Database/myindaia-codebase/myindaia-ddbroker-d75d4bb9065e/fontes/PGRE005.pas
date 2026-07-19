unit PGRE005;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ppBands, ppClass, ppCtrls, ppVar, ppStrtch, ppMemo,
  ppPrnabl, ppCache, ppRelatv, ppProd, ppReport, ppComm, ppEndUsr, ppDB,
  ppDBPipe, ppDBBDE, ppSubRpt, ppModule, daDatMod, raCodMod, ppParameter;

type
  Tdatm_sel_unid_cli_imp_area = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_param_: TQuery;
    qry_param_CD_ITEM_COMISSAO: TStringField;
    qry_param_CD_ITEM_EXPED: TStringField;
    qry_importador_: TQuery;
    sp_rel_exp_re: TStoredProc;
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
    qry_importador_CD_IMPORTADOR: TStringField;
    qry_importador_NM_IMPORTADOR: TStringField;
    ppDesigner1: TppDesigner;
    ppRepUnidCliImpArea: TppReport;
    qry_rel_exp_re_: TQuery;
    ppBDE_rel_exp_re: TppBDEPipeline;
    ds_rel_exp_re: TDataSource;
    qry_at_basf_transmissao_: TQuery;
    ppBDEAtBASFTransmissao: TppBDEPipeline;
    ds_at_basf_transmissao: TDataSource;
    qry_at_basf_followup_: TQuery;
    qry_at_basf_revisao_fat_: TQuery;
    qry_at_basf_demurrage_: TQuery;
    qry_at_basf_ent_basf_: TQuery;
    qry_at_basf_ent_bsg_: TQuery;
    qry_at_basf_chec_doc_: TQuery;
    ppBDEAtBASFFollowup: TppBDEPipeline;
    ds_at_basf_followup: TDataSource;
    ppBDEAtBASFRevisaoFat: TppBDEPipeline;
    ds_at_basf_revisao_fat: TDataSource;
    ppBDEAtBASFDemurrage: TppBDEPipeline;
    ds_at_basf_demurrage: TDataSource;
    ppBDEAtBASFEntBasf: TppBDEPipeline;
    ds_at_basf_ent_basf: TDataSource;
    ppBDEAtBASFEntBsg: TppBDEPipeline;
    ds_at_basf_ent_bsg: TDataSource;
    ppBDEAtBASFChecDoc: TppBDEPipeline;
    ds_at_basf_chec_doc: TDataSource;
    qry_classif_at_basf_: TQuery;
    ppBDEClassifAtBasf: TppBDEPipeline;
    ds_classif_at_basf: TDataSource;
    qry_grupo_area_: TQuery;
    ppParameterList1: TppParameterList;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    ppLine3: TppLine;
    pplbl_periodo: TppLabel;
    pplbl_titulo: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel14: TppLabel;
    ppVarRodapeEsq: TppVariable;
    ppNumPag: TppSystemVariable;
    ppTotPag: TppSystemVariable;
    ppLine2: TppLine;
    ppVarRodapeDir: TppVariable;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppSubTransmissao: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBandTransmissao: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLabel9: TppLabel;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLabel56: TppLabel;
    ppDBCalc36: TppDBCalc;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBText7: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLine32: TppLine;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppDBCalc22: TppDBCalc;
    ppDBCalc23: TppDBCalc;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText4: TppDBText;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppDBText6: TppDBText;
    ppLabel6: TppLabel;
    ppLabel2: TppLabel;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLabel7: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel8: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLine4: TppLine;
    ppLine31: TppLine;
    ppSubFollowUp: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBandFollowUp: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppDBCalc4: TppDBCalc;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLabel58: TppLabel;
    ppLabel57: TppLabel;
    ppDBCalc37: TppDBCalc;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppLabel3: TppLabel;
    ppLine7: TppLine;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText3: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine34: TppLine;
    ppDBCalc24: TppDBCalc;
    ppDBCalc25: TppDBCalc;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText5: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppDBText10: TppDBText;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLine10: TppLine;
    ppLine33: TppLine;
    ppLabel61: TppLabel;
    ppLabel5: TppLabel;
    ppSubRevisaoFat: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBandRevisaoFat: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppDBCalc7: TppDBCalc;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLabel4: TppLabel;
    ppLabel59: TppLabel;
    ppDBCalc38: TppDBCalc;
    ppGroup10: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppLabel15: TppLabel;
    ppLine13: TppLine;
    ppGroupFooterBand10: TppGroupFooterBand;
    ppGroup11: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppDBText13: TppDBText;
    ppGroupFooterBand11: TppGroupFooterBand;
    ppLine35: TppLine;
    ppDBCalc26: TppDBCalc;
    ppDBCalc27: TppDBCalc;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppGroup12: TppGroup;
    ppGroupHeaderBand12: TppGroupHeaderBand;
    ppDBText14: TppDBText;
    ppGroupFooterBand12: TppGroupFooterBand;
    ppGroup13: TppGroup;
    ppGroupHeaderBand13: TppGroupHeaderBand;
    ppDBText15: TppDBText;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppGroupFooterBand13: TppGroupFooterBand;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppLine14: TppLine;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLine36: TppLine;
    ppSubDemurrage: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBandDemurrage: TppTitleBand;
    ppDetailBand5: TppDetailBand;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppSummaryBand4: TppSummaryBand;
    ppDBCalc10: TppDBCalc;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLabel20: TppLabel;
    ppLabel60: TppLabel;
    ppDBCalc39: TppDBCalc;
    ppGroup14: TppGroup;
    ppGroupHeaderBand14: TppGroupHeaderBand;
    ppLabel21: TppLabel;
    ppLine17: TppLine;
    ppGroupFooterBand14: TppGroupFooterBand;
    ppGroup15: TppGroup;
    ppGroupHeaderBand15: TppGroupHeaderBand;
    ppDBText18: TppDBText;
    ppGroupFooterBand15: TppGroupFooterBand;
    ppLine38: TppLine;
    ppDBCalc28: TppDBCalc;
    ppDBCalc29: TppDBCalc;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppGroup16: TppGroup;
    ppGroupHeaderBand16: TppGroupHeaderBand;
    ppDBText19: TppDBText;
    ppGroupFooterBand16: TppGroupFooterBand;
    ppGroup17: TppGroup;
    ppGroupHeaderBand17: TppGroupHeaderBand;
    ppDBText20: TppDBText;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppGroupFooterBand17: TppGroupFooterBand;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppLine18: TppLine;
    ppLine37: TppLine;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppSubEntBasf: TppSubReport;
    ppChildReport5: TppChildReport;
    ppTitleBandEntBasf: TppTitleBand;
    ppDetailBand6: TppDetailBand;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppSummaryBand5: TppSummaryBand;
    ppDBCalc13: TppDBCalc;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLabel26: TppLabel;
    ppLabel62: TppLabel;
    ppDBCalc40: TppDBCalc;
    ppGroup18: TppGroup;
    ppGroupHeaderBand18: TppGroupHeaderBand;
    ppLabel27: TppLabel;
    ppLine21: TppLine;
    ppGroupFooterBand18: TppGroupFooterBand;
    ppGroup19: TppGroup;
    ppGroupHeaderBand19: TppGroupHeaderBand;
    ppDBText23: TppDBText;
    ppGroupFooterBand19: TppGroupFooterBand;
    ppLine40: TppLine;
    ppDBCalc30: TppDBCalc;
    ppDBCalc31: TppDBCalc;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppGroup20: TppGroup;
    ppGroupHeaderBand20: TppGroupHeaderBand;
    ppDBText24: TppDBText;
    ppGroupFooterBand20: TppGroupFooterBand;
    ppGroup21: TppGroup;
    ppGroupHeaderBand21: TppGroupHeaderBand;
    ppDBText25: TppDBText;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppGroupFooterBand21: TppGroupFooterBand;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppLine22: TppLine;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLine39: TppLine;
    ppSubEntBSG: TppSubReport;
    ppChildReport6: TppChildReport;
    ppTitleBandEntBSG: TppTitleBand;
    ppDetailBand7: TppDetailBand;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppSummaryBand6: TppSummaryBand;
    ppDBCalc16: TppDBCalc;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLabel32: TppLabel;
    ppLabel63: TppLabel;
    ppDBCalc41: TppDBCalc;
    ppGroup22: TppGroup;
    ppGroupHeaderBand22: TppGroupHeaderBand;
    ppLabel33: TppLabel;
    ppLine25: TppLine;
    ppGroupFooterBand22: TppGroupFooterBand;
    ppGroup23: TppGroup;
    ppGroupHeaderBand23: TppGroupHeaderBand;
    ppDBText28: TppDBText;
    ppGroupFooterBand23: TppGroupFooterBand;
    ppLine42: TppLine;
    ppDBCalc32: TppDBCalc;
    ppDBCalc33: TppDBCalc;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppGroup24: TppGroup;
    ppGroupHeaderBand24: TppGroupHeaderBand;
    ppDBText29: TppDBText;
    ppGroupFooterBand24: TppGroupFooterBand;
    ppGroup25: TppGroup;
    ppGroupHeaderBand25: TppGroupHeaderBand;
    ppDBText30: TppDBText;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppGroupFooterBand25: TppGroupFooterBand;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppLine26: TppLine;
    ppLine41: TppLine;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppSubChecDoc: TppSubReport;
    ppChildReport7: TppChildReport;
    ppTitleBandChecDoc: TppTitleBand;
    ppDetailBand8: TppDetailBand;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppSummaryBand7: TppSummaryBand;
    ppDBCalc19: TppDBCalc;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLabel43: TppLabel;
    ppLabel64: TppLabel;
    ppDBCalc42: TppDBCalc;
    ppGroup26: TppGroup;
    ppGroupHeaderBand26: TppGroupHeaderBand;
    ppLabel39: TppLabel;
    ppLine29: TppLine;
    ppGroupFooterBand26: TppGroupFooterBand;
    ppGroup27: TppGroup;
    ppGroupHeaderBand27: TppGroupHeaderBand;
    ppDBText33: TppDBText;
    ppGroupFooterBand27: TppGroupFooterBand;
    ppLine44: TppLine;
    ppDBCalc34: TppDBCalc;
    ppDBCalc35: TppDBCalc;
    ppLabel38: TppLabel;
    ppLabel42: TppLabel;
    ppGroup28: TppGroup;
    ppGroupHeaderBand28: TppGroupHeaderBand;
    ppDBText34: TppDBText;
    ppGroupFooterBand28: TppGroupFooterBand;
    ppGroup29: TppGroup;
    ppGroupHeaderBand29: TppGroupHeaderBand;
    ppDBText35: TppDBText;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppGroupFooterBand29: TppGroupFooterBand;
    ppDBCalc20: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    ppLine30: TppLine;
    ppLine43: TppLine;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppDBCalc43: TppDBCalc;
    raCodeModule1: TraCodeModule;
    raCodeModule2: TraCodeModule;
    procedure ppVarRodapeDirCalc(Sender: TObject; var Value: Variant);
    procedure ppVarRodapeEsqCalc(Sender: TObject; var Value: Variant);
    procedure ppGroupFooterBand9BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sel_unid_cli_imp_area: Tdatm_sel_unid_cli_imp_area;

implementation

uses GSMLIB, PGGP001, PGRE004;

{$R *.DFM}

procedure Tdatm_sel_unid_cli_imp_area.ppVarRodapeDirCalc(Sender: TObject;
  var Value: Variant);
begin
  ppVarRodapeDir.AsString := 'Folha ' + ppNumPag.Text + ' / ' + ppTotPag.Text;
end;

procedure Tdatm_sel_unid_cli_imp_area.ppVarRodapeEsqCalc(Sender: TObject;
  var Value: Variant);
begin
  ppVarRodapeEsq.AsString := Space(2) + 'Emitido em ' + FormatDateTime( 'dd/mm/yyyy', dt_server ) + '  às  ' + FormatDateTime( 'hh:mm:ss', hr_server );
end;

procedure Tdatm_sel_unid_cli_imp_area.ppGroupFooterBand9BeforePrint(Sender: TObject);
begin
  if qry_classif_at_basf_.FieldByName('TP_CLASSIF_AT_BASF').AsString = '0' then
  begin
    ppSubTransmissao.Visible := ( frm_sel_unid_cli_imp_area.CBClassif[0].Checked ) and ( qry_at_basf_transmissao_.RecordCount > 0 );
    ppSubFollowUp.Visible    := False;
    ppSubRevisaoFat.Visible  := False;
    ppSubDemurrage.Visible   := False;
    ppSubEntBasf.Visible     := False;
    ppSubEntBSG.Visible      := False;
    ppSubChecDoc.Visible     := False;
  end;

  if qry_classif_at_basf_.FieldByName('TP_CLASSIF_AT_BASF').AsString = '1' then
  begin
    ppSubTransmissao.Visible := False;
    ppSubFollowUp.Visible    := ( frm_sel_unid_cli_imp_area.CBClassif[1].Checked ) and ( qry_at_basf_followup_.RecordCount > 0 );
    ppSubRevisaoFat.Visible  := False;
    ppSubDemurrage.Visible   := False;
    ppSubEntBasf.Visible     := False;
    ppSubEntBSG.Visible      := False;
    ppSubChecDoc.Visible     := False;
  end;

  if qry_classif_at_basf_.FieldByName('TP_CLASSIF_AT_BASF').AsString = '2' then
  begin
    ppSubTransmissao.Visible := False;
    ppSubFollowUp.Visible    := False;
    ppSubRevisaoFat.Visible  := ( frm_sel_unid_cli_imp_area.CBClassif[2].Checked ) and ( qry_at_basf_revisao_fat_.RecordCount > 0 );
    ppSubDemurrage.Visible   := False;
    ppSubEntBasf.Visible     := False;
    ppSubEntBSG.Visible      := False;
    ppSubChecDoc.Visible     := False;
  end;

  if qry_classif_at_basf_.FieldByName('TP_CLASSIF_AT_BASF').AsString = '3' then
  begin
    ppSubTransmissao.Visible := False;
    ppSubFollowUp.Visible    := False;
    ppSubRevisaoFat.Visible  := False;
    ppSubDemurrage.Visible   := ( frm_sel_unid_cli_imp_area.CBClassif[3].Checked ) and ( qry_at_basf_demurrage_.RecordCount > 0 );
    ppSubEntBasf.Visible     := False;
    ppSubEntBSG.Visible      := False;
    ppSubChecDoc.Visible     := False;
  end;

  if qry_classif_at_basf_.FieldByName('TP_CLASSIF_AT_BASF').AsString = '4' then
  begin
    ppSubTransmissao.Visible := False;
    ppSubFollowUp.Visible    := False;
    ppSubRevisaoFat.Visible  := False;
    ppSubDemurrage.Visible   := False;
    ppSubEntBasf.Visible     := ( frm_sel_unid_cli_imp_area.CBClassif[4].Checked ) and ( qry_at_basf_ent_basf_.RecordCount > 0 );
    ppSubEntBSG.Visible      := False;
    ppSubChecDoc.Visible     := False;
  end;

  if qry_classif_at_basf_.FieldByName('TP_CLASSIF_AT_BASF').AsString = '5' then
  begin
    ppSubTransmissao.Visible := False;
    ppSubFollowUp.Visible    := False;
    ppSubRevisaoFat.Visible  := False;
    ppSubDemurrage.Visible   := False;
    ppSubEntBasf.Visible     := False;
    ppSubEntBSG.Visible      := ( frm_sel_unid_cli_imp_area.CBClassif[5].Checked ) and ( qry_at_basf_ent_bsg_.RecordCount > 0 );
    ppSubChecDoc.Visible     := False;
  end;

  if qry_classif_at_basf_.FieldByName('TP_CLASSIF_AT_BASF').AsString = '6' then
  begin
    ppSubTransmissao.Visible := False;
    ppSubFollowUp.Visible    := False;
    ppSubRevisaoFat.Visible  := False;
    ppSubDemurrage.Visible   := False;
    ppSubEntBasf.Visible     := False;
    ppSubEntBSG.Visible      := False;
    ppSubChecDoc.Visible     := ( frm_sel_unid_cli_imp_area.CBClassif[6].Checked ) and ( qry_at_basf_chec_doc_.RecordCount > 0 );
  end;
end;

end.
