unit PGGA024;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ppParameter, ppCtrls, ppBands, ppMemo, ppClass, ppVar,
  ppPrnabl, ppStrtch, ppCache, ppComm, ppRelatv, ppProd, ppReport, ppDB,
  ppDBPipe, ppDBBDE, Funcoes, ppModule, raCodMod, TypInfo;

type
  Tdatm_sel_unid_prod_via = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_via_transp_broker_: TQuery;
    qry_via_transp_broker_CD_VIA_TRANSP: TStringField;
    qry_via_transp_broker_NM_VIA_TRANSP: TStringField;
    qry_via_transp_broker_CD_VIA_TRANSP_SISCOMEX: TStringField;
    qry_via_transp_broker_IN_ATIVO: TStringField;
    ds_via_transp_broker: TDataSource;
    ppRelatorio: TppReport;                                  
    BDE_detalhe: TppBDEPipeline;
    BDE_detalheppMasterFieldLink1: TppMasterFieldLink;
    ds_detalhe: TDataSource;
    qry_detalhe: TQuery;
    dts_detalhe_Deadline: TDataSource;
    qry_detalhe_Deadline: TQuery;
    BDE_detalhe_Deadline: TppBDEPipeline;
    ppParameterList1: TppParameterList;
    BDE_viagens_imp: TppBDEPipeline;
    ppMasterFieldLink1: TppMasterFieldLink;
    ds_viagens_imp: TDataSource;
    qry_viagens_imp: TQuery;
    ds_viagens_detalhe_imp: TDataSource;
    qry_viagens_detalhe_imp: TQuery;
    BDE_viagens_detalhe_imp: TppBDEPipeline;
    rptViagens_Imp: TppReport;
    ppParameterList2: TppParameterList;
    ppTitleBand5: TppTitleBand;
    ppHeaderBand4: TppHeaderBand;
    ppTitle: TppLabel;
    ppImage4: TppImage;
    ppLine9: TppLine;
    ppDetailBand7: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText5: TppDBText;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
    ppDBText10: TppDBText;
    ppDBText8: TppDBText;
    ppDBText13: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLine1: TppLine;
    ppLabel16: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppShape3: TppShape;
    ppDBText14: TppDBText;
    ppDBText29: TppDBText;
    ppLabel1: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppLine8: TppLine;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppShape4: TppShape;
    ppLabel2: TppLabel;
    ppDBText32: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel3: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel23: TppLabel;
    ppDBText33: TppDBText;
    ppLabel24: TppLabel;
    ppDBText34: TppDBText;
    ppLabel28: TppLabel;
    ppDBText35: TppDBText;
    ppGroupFooterBand6: TppGroupFooterBand;
    qry_viagens_impNM_EMBARCACAO: TStringField;
    qry_viagens_impNR_VIAGEM: TStringField;
    qry_viagens_impDT_PREVISTA: TDateTimeField;
    qry_viagens_impDT_CHEGADA: TDateTimeField;
    qry_viagens_impNM_ARMAZEM: TStringField;
    qry_viagens_impNM_LOCAL_DESEMBARQUE: TStringField;
    qry_viagens_detalhe_impNR_PROCESSO_SIMPLES: TStringField;
    qry_viagens_detalhe_impNR_PROCESSO: TStringField;
    qry_viagens_detalhe_impCD_PRODUTO: TStringField;
    qry_viagens_detalhe_impNM_UNID_NEG: TStringField;
    qry_viagens_detalhe_impCD_UNID_NEG: TStringField;
    qry_viagens_detalhe_impCD_EMBARCACAO: TStringField;
    qry_viagens_detalhe_impNM_EMBARCACAO: TStringField;
    qry_viagens_detalhe_impNR_VIAGEM: TStringField;
    qry_viagens_detalhe_impNR_VIAGEM_ARMADOR: TStringField;
    qry_viagens_detalhe_impDT_PREVISTA: TDateTimeField;
    qry_viagens_detalhe_impDT_CHEGADA: TDateTimeField;
    qry_viagens_detalhe_impNR_MANIFESTO: TStringField;
    qry_viagens_detalhe_impAP_EMPRESA: TStringField;
    qry_viagens_detalhe_impNM_ARMAZEM: TStringField;
    qry_viagens_detalhe_impNM_LOCAL_DESEMBARQUE: TStringField;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppLabel10: TppLabel;
    ppImage1: TppImage;
    ppLine2: TppLine;
    ppdbProcesso: TppDetailBand;
    ppdbtxtAP_EMPRESA: TppDBText;
    ppdbtxtNM_ARMAZEM: TppDBText;
    ppdbtxtNR_PROCESSO: TppDBText;
    ppdbtxtNM_LOCAL_EMBARQUE: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLine3: TppLine;
    ppLabel11: TppLabel;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppdbtxtCD_UNID_NEG: TppDBText;
    ppdbtxtNM_UNID_NEG: TppDBText;
    pplUnidade: TppLabel;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLine4: TppLine;
    ppLine10: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppdbtxtCD_EMBARCACAO: TppDBText;
    ppdbtxtNM_EMBARCACAO: TppDBText;
    ppLine5: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppshpEmbarcacao: TppShape;
    pplViagem: TppLabel;
    ppdbtxtNR_VIAGEM: TppDBText;
    pplDataPrevista: TppLabel;
    ppdbtxtDT_PREVISTA: TppDBText;
    pplDataChegada: TppLabel;
    ppdbtxtDT_CHEGADA: TppDBText;
    pplViagemArmador: TppLabel;
    ppdbtxtNR_VIAGEM_ARMADOR: TppDBText;
    pplManifesto: TppLabel;
    ppdbtxtNR_MANIFESTO: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup7: TppGroup;
    ppghbProcesso: TppGroupHeaderBand;
    pplProcesso: TppLabel;
    pplCliente: TppLabel;
    pplArmazemAtracacao: TppLabel;
    pplPortoDesembarque: TppLabel;
    ppgfbProcesso: TppGroupFooterBand;
    raCodeModule1: TraCodeModule;
    procedure qry_detalheAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure pBeforePrint(Sender: TObject);
    procedure pBeforePrintImp(Sender: TObject);
  end;

var
  datm_sel_unid_prod_via: Tdatm_sel_unid_prod_via;

implementation

uses PGSM990, PGGA023;

{$R *.DFM}

procedure Tdatm_sel_unid_prod_via.qry_detalheAfterOpen(DataSet: TDataSet);
begin
  if frm_sel_unid_prod_via.rbDetalhado.Checked then
    qry_detalhe_Deadline.Open;
end;

procedure Tdatm_sel_unid_prod_via.pBeforePrint(Sender: TObject);
begin
  if ExtractFileName(Frm_impressao.ppReport1.Template.FileName) <> 'RelListaViagens.rtm' then
    Exit;

  TppDetailBand(Frm_impressao.FindComponent('ppDetailBand7')).Visible  := frm_sel_unid_prod_via.chk_proc.Checked;

  TppLabel(Frm_impressao.FindComponent('ppLabel3')).Visible  := Frm_sel_unid_prod_via.Chk_proc.Checked;
  TppLabel(Frm_impressao.FindComponent('ppLabel4')).Visible  := Frm_sel_unid_prod_via.Chk_proc.Checked;
  TppLabel(Frm_impressao.FindComponent('ppLabel5')).Visible  := Frm_sel_unid_prod_via.Chk_proc.Checked;
  TppLabel(Frm_impressao.FindComponent('ppLabel6')).Visible  := Frm_sel_unid_prod_via.Chk_proc.Checked;
  TppLabel(Frm_impressao.FindComponent('ppLabel7')).Visible  := Frm_sel_unid_prod_via.Chk_proc.Checked;
  TppLabel(Frm_impressao.FindComponent('ppLabel8')).Visible  := Frm_sel_unid_prod_via.Chk_proc.Checked;
  TppLabel(Frm_impressao.FindComponent('ppLabel9')).Visible  := Frm_sel_unid_prod_via.Chk_proc.Checked;
  TppLabel(Frm_impressao.FindComponent('ppLabel10')).Visible := Frm_sel_unid_prod_via.Chk_proc.Checked;
  TppLabel(Frm_impressao.FindComponent('ppLabel11')).Visible := Frm_sel_unid_prod_via.Chk_proc.Checked;
  TppLabel(Frm_impressao.FindComponent('ppLabel12')).Visible := Frm_sel_unid_prod_via.Chk_proc.Checked;

  TppShape(Frm_impressao.FindComponent('ppShape2')).Visible  := Frm_sel_unid_prod_via.Chk_proc.Checked;
  TppGroupHeaderBand(Frm_impressao.FindComponent('ppGroupHeaderBand2')).Height := IIF(Frm_sel_unid_prod_via.Chk_proc.Checked,188,100);
  TppDetailBand(Frm_impressao.FindComponent('ppDetailBand7')).Height := IIF(Frm_sel_unid_prod_via.Chk_proc.Checked,56,1);

  if Frm_sel_unid_prod_via.Chk_proc.Checked then
  begin
    TppLabel(Frm_impressao.FindComponent('ppLabel2')).Font.Style    := [fsBold];
    TppDBText(Frm_impressao.FindComponent('ppDBText2')).Font.Style  := [fsBold];
    TppLabel(Frm_impressao.FindComponent('ppLabel14')).Font.Style   := [fsBold];
    TppLabel(Frm_impressao.FindComponent('ppLabel15')).Font.Style   := [fsBold];
    TppDBText(Frm_impressao.FindComponent('ppDBText14')).Font.Style := [fsBold];
    TppLabel(Frm_impressao.FindComponent('ppLabel13')).Font.Style   := [fsBold];
    TppDBText(Frm_impressao.FindComponent('ppDBText22')).Font.Style := [fsBold];
  end
  else
  begin
    TppLabel(Frm_impressao.FindComponent('ppLabel2')).Font.Style    := [];
    TppDBText(Frm_impressao.FindComponent('ppDBText2')).Font.Style  := [];
    TppLabel(Frm_impressao.FindComponent('ppLabel14')).Font.Style   := [];
    TppLabel(Frm_impressao.FindComponent('ppLabel15')).Font.Style   := [];
    TppDBText(Frm_impressao.FindComponent('ppDBText14')).Font.Style := [];
    TppLabel(Frm_impressao.FindComponent('ppLabel13')).Font.Style   := [];
    TppDBText(Frm_impressao.FindComponent('ppDBText22')).Font.Style := [];
  end;
end;


procedure Tdatm_sel_unid_prod_via.pBeforePrintImp(Sender: TObject);
begin
  if ExtractFileName(Frm_impressao.ppReport1.Template.FileName) <> 'RelListaViagens_imp.rtm' then
    Exit;

  TppShape(Frm_impressao.FindComponent('ppshpEmbarcacao')).Visible           := Frm_sel_unid_prod_via.Chk_proc.Checked;
  TppLabel(Frm_impressao.FindComponent('pplProcesso')).Visible               := Frm_sel_unid_prod_via.Chk_proc.Checked;
  TppLabel(Frm_impressao.FindComponent('pplCliente')).Visible                := Frm_sel_unid_prod_via.Chk_proc.Checked;
  TppLabel(Frm_impressao.FindComponent('pplArmazemAtracacao')).Visible       := Frm_sel_unid_prod_via.Chk_proc.Checked;
  TppLabel(Frm_impressao.FindComponent('pplPortoDesembarque')).Visible       := Frm_sel_unid_prod_via.Chk_proc.Checked;
  TppDBText(Frm_impressao.FindComponent('ppdbtxtNR_PROCESSO')).Visible       := Frm_sel_unid_prod_via.Chk_proc.Checked;
  TppDBText(Frm_impressao.FindComponent('ppdbtxtAP_EMPRESA')).Visible        := Frm_sel_unid_prod_via.Chk_proc.Checked;
  TppDBText(Frm_impressao.FindComponent('ppdbtxtNM_ARMAZEM')).Visible        := Frm_sel_unid_prod_via.Chk_proc.Checked;
  TppDBText(Frm_impressao.FindComponent('ppdbtxtNM_LOCAL_EMBARQUE')).Visible := Frm_sel_unid_prod_via.Chk_proc.Checked;

  TppDetailBand(Frm_impressao.FindComponent('ppdbProcesso')).Visible       := Frm_sel_unid_prod_via.Chk_proc.Checked;
  TppGroupHeaderBand(Frm_impressao.FindComponent('ppghbProcesso')).Visible := Frm_sel_unid_prod_via.Chk_proc.Checked;
  TppGroupFooterBand(Frm_impressao.FindComponent('ppgfbProcesso')).Visible := Frm_sel_unid_prod_via.Chk_proc.Checked;

  if Frm_sel_unid_prod_via.Chk_proc.Checked then
  begin
    TppLabel(Frm_impressao.FindComponent('pplViagem')).Font.Style                 := [fsBold];
    TppDBText(Frm_impressao.FindComponent('ppdbtxtNR_VIAGEM')).Font.Style         := [fsBold];
    TppLabel(Frm_impressao.FindComponent('pplViagemArmador')).Font.Style          := [fsBold];
    TppDBText(Frm_impressao.FindComponent('ppdbtxtNR_VIAGEM_ARMADOR')).Font.Style := [fsBold];
    TppLabel(Frm_impressao.FindComponent('pplDataPrevista')).Font.Style           := [fsBold];
    TppDBText(Frm_impressao.FindComponent('ppdbtxtDT_PREVISTA')).Font.Style       := [fsBold];
    TppLabel(Frm_impressao.FindComponent('pplDataChegada')).Font.Style            := [fsBold];
    TppDBText(Frm_impressao.FindComponent('ppdbtxtDT_CHEGADA')).Font.Style        := [fsBold];
    TppLabel(Frm_impressao.FindComponent('pplManifesto')).Font.Style              := [fsBold];
    TppDBText(Frm_impressao.FindComponent('ppdbtxtNR_MANIFESTO')).Font.Style      := [fsBold];
  end
  else
  begin
    TppLabel(Frm_impressao.FindComponent('pplViagem')).Font.Style                 := [];
    TppDBText(Frm_impressao.FindComponent('ppdbtxtNR_VIAGEM')).Font.Style         := [];
    TppLabel(Frm_impressao.FindComponent('pplViagemArmador')).Font.Style          := [];
    TppDBText(Frm_impressao.FindComponent('ppdbtxtNR_VIAGEM_ARMADOR')).Font.Style := [];
    TppLabel(Frm_impressao.FindComponent('pplDataPrevista')).Font.Style           := [];
    TppDBText(Frm_impressao.FindComponent('ppdbtxtDT_PREVISTA')).Font.Style       := [];
    TppLabel(Frm_impressao.FindComponent('pplDataChegada')).Font.Style            := [];
    TppDBText(Frm_impressao.FindComponent('ppdbtxtDT_CHEGADA')).Font.Style        := [];
    TppLabel(Frm_impressao.FindComponent('pplManifesto')).Font.Style              := [];
    TppDBText(Frm_impressao.FindComponent('ppdbtxtNR_MANIFESTO')).Font.Style      := [];
  end;
end;

end.
