(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGPO022.PAS - datm_po_imp

AUTOR: Leandro Stipanich

DATA: dd/mm/yyyy

Manutenção: Leandro Stipanich

Data: 08/01/2002

*************************************************************************************************)
unit PGPO022;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB,
  ppDBPipe, ppDBBDE, ppCtrls, ppPrnabl, ppBands, ppVar, ppModule, daDatMod,
  ppStrtch, ppSubRpt, ppRegion, ppMemo;

type
  Tdatm_po_imp = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_cliente_: TQuery;
    qry_evento_: TQuery;
    sp_po_rel_flp: TStoredProc;
    qry_area_: TQuery;
    qry_grupo_: TQuery;
    qry_status_flp_: TQuery;
    qry_servico_: TQuery;
    ppReport: TppReport;
    qry_trel_po_flp_item_: TQuery;
    ds_trel_po_flp_item: TDataSource;
    qry_trel_po_flp_: TQuery;
    ds_trel_po_flp: TDataSource;
    ppBDE_trel_po_flp_item: TppBDEPipeline;
    ppBDE_trel_po_flp: TppBDEPipeline;
    qry_trel_po_flp_item_NR_IDENTIFICADOR: TIntegerField;
    qry_trel_po_flp_item_NR_PROCESSO: TStringField;
    qry_trel_po_flp_item_NR_ITEM: TStringField;
    qry_trel_po_flp_item_CD_MERCADORIA: TStringField;
    qry_trel_po_flp_item_QT_INICIAL: TFloatField;
    qry_trel_po_flp_NR_IDENTIFICADOR: TIntegerField;
    qry_trel_po_flp_NR_PROCESSO: TStringField;
    qry_trel_po_flp_CD_IMPORTADOR: TStringField;
    qry_trel_po_flp_CD_SERVICO: TStringField;
    qry_trel_po_flp_CD_AREA: TStringField;
    qry_trel_po_flp_NR_ORDEM: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppImage4: TppImage;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    qry_trel_po_flp_NmImportador: TStringField;
    qry_trel_po_flp_NmServico: TStringField;
    qry_trel_po_flp_NmArea: TStringField;
    qry_evento_CD_EVENTO: TStringField;
    qry_evento_NM_EVENTO: TStringField;
    ds_evento_: TDataSource;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel4: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel5: TppLabel;
    ppDBText7: TppDBText;
    qry_trel_po_flp_item_NmMercadoria: TStringField;
    ppLabel9: TppLabel;
    ppDBText9: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppVarRodapeEsq: TppVariable;
    ppNumPag: TppSystemVariable;
    ppTotPag: TppSystemVariable;
    ppLine9: TppLine;
    ppVarRodapeDir: TppVariable;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppTitle: TppLabel;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel6: TppLabel;
    ppDBText8: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    qry_trel_po_flp_ev_: TQuery;
    ds_trel_po_flp_ev: TDataSource;
    qry_trel_po_flp_ev_NR_IDENTIFICADOR: TIntegerField;
    qry_trel_po_flp_ev_NR_PROCESSO: TStringField;
    qry_trel_po_flp_ev_CD_EVENTO: TStringField;
    qry_trel_po_flp_ev_DT_REALIZACAO: TDateTimeField;
    qry_trel_po_flp_ev_DT_PREVISTA: TDateTimeField;
    qry_trel_po_flp_ev_DT_LIMITE: TDateTimeField;
    qry_trel_po_flp_ev_CD_RESPONSAVEL: TStringField;
    qry_trel_po_flp_ev_CD_STATUS: TStringField;
    qry_trel_po_flp_ev_NR_LEAD_TIME: TIntegerField;
    qry_trel_po_flp_ev_NR_ORDEM: TFloatField;
    qry_trel_po_flp_ev_TX_OBS: TMemoField;
    qry_trel_po_flp_ev_IN_OBS: TStringField;
    ppBDE_trel_po_flp_ev: TppBDEPipeline;
    qry_trel_po_flp_ev_NM_EVENTO: TStringField;
    qry_trel_po_flp_ev_NM_STATUS_FLP: TStringField;
    qry_trel_po_flp_ev_NM_RESPONSAVEL: TStringField;
    ppRegion1: TppRegion;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppRegion2: TppRegion;
    ppLine5: TppLine;
    ppLabel16: TppLabel;
    ppDBMemo1: TppDBMemo;
    qry_trel_ev_tx_obs_: TQuery;
    ds_trel_ev_tx_obs_: TDataSource;
    qry_trel_ev_tx_obs_TX_OBS: TMemoField;
    ppBDE_trel_ev_tx_obs: TppBDEPipeline;
    procedure qry_trel_po_flp_CalcFields(DataSet: TDataSet);
    procedure qry_trel_po_flp_item_CalcFields(DataSet: TDataSet);
    procedure ppVarRodapeEsqCalc(Sender: TObject; var Value: Variant);
    procedure ppVarRodapeDirCalc(Sender: TObject; var Value: Variant);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure qry_trel_po_flp_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_po_imp: Tdatm_po_imp;

implementation

uses GSMLIB, PGPO021, PGGP001, PGGP017;

{$R *.DFM}

procedure Tdatm_po_imp.qry_trel_po_flp_CalcFields(DataSet: TDataSet);
begin
  qry_trel_po_flp_NmImportador.AsString := FastLookup( 'TEMPRESA_NAC', qry_trel_po_flp_CD_IMPORTADOR, 'CD_EMPRESA', 'NM_EMPRESA', '' );
  qry_trel_po_flp_NmServico.AsString    := FastLookup( 'TSERVICO', qry_trel_po_flp_CD_SERVICO, 'CD_SERVICO', 'NM_SERVICO', '' );
  qry_trel_po_flp_NmArea.AsString       := FastLookup( 'TAREA', qry_trel_po_flp_CD_AREA, 'CD_AREA', 'NM_AREA', '' );
end;

procedure Tdatm_po_imp.qry_trel_po_flp_item_CalcFields(DataSet: TDataSet);
begin
  qry_trel_po_flp_item_NmMercadoria.AsString := FastLookup( 'TMERCADORIA', qry_trel_po_flp_item_CD_MERCADORIA, 'CD_MERCADORIA', 'AP_MERCADORIA', '' );
end;

procedure Tdatm_po_imp.ppVarRodapeEsqCalc(Sender: TObject;
  var Value: Variant);
begin
  ppVarRodapeEsq.AsString := 'RBPO005'  + Space(5) + 'Emitido em ' + FormatDateTime( 'dd/mm/yyyy', dt_server ) + '  às  ' + FormatDateTime( 'hh:mm:ss', hr_server );
end;

procedure Tdatm_po_imp.ppVarRodapeDirCalc(Sender: TObject;
  var Value: Variant);
begin
  ppVarRodapeDir.AsString := 'Folha ' + ppNumPag.Text + ' / ' + ppTotPag.Text;
end;

procedure Tdatm_po_imp.ppHeaderBand1BeforePrint(Sender: TObject);
begin
  if FormatDateTime( 'dd/mm/yyyy', strtodate(frm_po_imp.msk_dt_inicio.Text)) = formatdatetime( 'dd/mm/yyyy', strtodate(frm_po_imp.msk_dt_fim.Text)) then
    ppTitle.Caption := 'Período: ' + FormatDateTime( 'dd/mm/yyyy', StrToDate( frm_po_imp.msk_dt_inicio.Text ) )
  else
    ppTitle.Caption := 'Período: ' + FormatDateTime( 'dd/mm/yyyy', StrToDate( frm_po_imp.msk_dt_inicio.Text ) ) +
                       ' a ' + FormatDateTime( 'dd/mm/yyyy', StrToDate( frm_po_imp.msk_dt_fim.Text ) );
end;

procedure Tdatm_po_imp.qry_trel_po_flp_AfterScroll(DataSet: TDataSet);
begin
  qry_trel_po_flp_item_.Close;
  qry_trel_po_flp_item_.ParamByName('NR_IDENTIFICADOR').AsInteger := qry_trel_po_flp_NR_IDENTIFICADOR.AsInteger;
  qry_trel_po_flp_item_.ParamByName('NR_PROCESSO').AsString       := qry_trel_po_flp_NR_PROCESSO.AsString;
  qry_trel_po_flp_item_.Prepare;
  qry_trel_po_flp_item_.Open;

  qry_trel_po_flp_ev_.Close;
  qry_trel_po_flp_ev_.ParamByName('NR_IDENTIFICADOR').AsInteger := qry_trel_po_flp_NR_IDENTIFICADOR.AsInteger;
  qry_trel_po_flp_ev_.ParamByName('NR_PROCESSO').AsString       := qry_trel_po_flp_NR_PROCESSO.AsString;
  qry_trel_po_flp_ev_.Prepare;
  qry_trel_po_flp_ev_.Open;

  qry_trel_ev_tx_obs_.Close;
  qry_trel_ev_tx_obs_.ParamByName('NR_IDENTIFICADOR').AsInteger := qry_trel_po_flp_NR_IDENTIFICADOR.AsInteger;
  qry_trel_ev_tx_obs_.ParamByName('NR_PROCESSO').AsString       := qry_trel_po_flp_NR_PROCESSO.AsString;
  qry_trel_ev_tx_obs_.Prepare;
  qry_trel_ev_tx_obs_.Open;
end;

end.
