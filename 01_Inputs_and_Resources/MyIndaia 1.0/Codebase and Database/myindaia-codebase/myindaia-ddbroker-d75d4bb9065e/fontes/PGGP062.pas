unit PGGP062;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Db, DBTables,
  ppBands, ppCtrls, ppRegion, ppStrtch, ppMemo, ppVar, ppPrnabl, ppClass, ppCache,
  ppDB, ppDBPipe, ppDBBDE, ppRelatv, ppProd, ppReport, ppComm, ppEndUsr,
  ppModule, daDatMod, ppSubRpt, TXtraDev;

type
  Tdatm_sel_unid_cont = class(TDataModule)
    qry_agente_: TQuery;
    qry_agente_CD_AGENTE: TStringField;
    qry_agente_NM_AGENTE: TStringField;
    qry_transp_: TQuery;
    qry_transp_CD_TRANSP_ROD: TStringField;
    qry_transp_NM_TRANSP_ROD: TStringField;
    qry_transp_AP_TRANSP_ROD: TStringField;
    sp_rel_cntr_nao_dev: TStoredProc;
    ppDesigner: TppDesigner;
    ppRetCntr: TppReport;
    ppBDE_Cntr: TppBDEPipeline;
    DTS_Cntr: TDataSource;
    qry_cntr_nao_dev_: TQuery;
    qry_cntr_nao_dev_CD_UNID_NEG: TStringField;
    qry_cntr_nao_dev_AP_UNID_NEG: TStringField;
    qry_cntr_nao_dev_CD_PRODUTO: TStringField;
    qry_cntr_nao_dev_NM_PRODUTO: TStringField;
    qry_cntr_nao_dev_CD_EMPRESA: TStringField;
    qry_cntr_nao_dev_CD_AGENTE: TStringField;
    qry_cntr_nao_dev_NM_AGENTE: TStringField;
    qry_cntr_nao_dev_CD_TRANSP_ROD: TStringField;
    qry_cntr_nao_dev_AP_TRANSP_ROD: TStringField;
    qry_cntr_nao_dev_NR_PROCESSO: TStringField;
    qry_cntr_nao_dev_NR_CNTR: TStringField;
    qry_cntr_nao_dev_DT_ENT: TDateTimeField;
    qry_cntr_nao_dev_CalcProcesso: TStringField;
    qry_cntr_nao_dev_NM_EMPRESA: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    pplbl_titulo: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppNumPag: TppSystemVariable;
    ppTotPag: TppSystemVariable;
    ppVarRodapeEsq: TppVariable;
    ppVarRodapeDir: TppVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppDBText3: TppDBText;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText4: TppDBText;
    ppLine1: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    qry_cntr_nao_dev_DT_NF_TRANSP: TDateTimeField;
    ppLabel5: TppLabel;
    ppDBText9: TppDBText;
    procedure ppVarRodapeDirCalc(Sender: TObject; var Value: Variant);
    procedure ppVarRodapeEsqCalc(Sender: TObject; var Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sel_unid_cont: Tdatm_sel_unid_cont;

implementation

uses PGGP061, GSMLIB, PGGP001;

{$R *.DFM}

procedure Tdatm_sel_unid_cont.ppVarRodapeDirCalc(Sender: TObject;
  var Value: Variant);
begin
  ppVarRodapeDir.AsString := 'Folha ' + ppNumPag.Text + ' / ' + ppTotPag.Text;
end;

procedure Tdatm_sel_unid_cont.ppVarRodapeEsqCalc(Sender: TObject;
  var Value: Variant);
begin
  ppVarRodapeEsq.AsString := 'RBEST001' + Space(5) + 'Emitido em ' + FormatDateTime( 'dd/mm/yyyy', dt_server ) + '  às  ' + FormatDateTime( 'hh:mm:ss', hr_server );
end;

end.
