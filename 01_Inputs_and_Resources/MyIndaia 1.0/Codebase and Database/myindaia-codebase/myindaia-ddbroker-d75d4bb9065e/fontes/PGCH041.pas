unit PGCH041;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppVar, ppBands, ppStrtch,
  ppMemo, ppPrnabl, ppClass, ppCache, ppRelatv, ppProd, ppReport, ppComm,
  ppEndUsr;                

type
  Tdatm_sel_data_proc = class(TDataModule)
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_VL_CIF_MN: TFloatField;
    ds_processo: TDataSource;
    ppDesigner: TppDesigner;
    ppReport: TppReport;
    pplbl_titulo: TppLabel;
    ppImage1: TppImage;
    ppHeaderBand1: TppHeaderBand;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel9: TppLabel;
    ppLabel13: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBText1: TppDBText;
    tx_siscomex: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppVarRodapeEsq: TppVariable;
    ppVarRodapeDir: TppVariable;
    ppNumPag: TppSystemVariable;
    ppTotPag: TppSystemVariable;
    ppLine17: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel1: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppBDE_rel_imp_sap: TppBDEPipeline;
    ds_rel_imp_sap: TDataSource;
    qry_rel_imp_sap_: TQuery;
    ppLabel4: TppLabel;
    qry_rel_imp_sap_NR_PROCESSO: TStringField;
    qry_rel_imp_sap_NR_DI: TStringField;
    qry_rel_imp_sap_NR_SAP: TStringField;
    qry_rel_imp_sap_VL_II_ITEM: TFloatField;
    qry_rel_imp_sap_VL_IPI_ITEM: TFloatField;
    qry_rel_imp_sap_VL_ICMS_ITEM: TFloatField;
    qry_rel_imp_sap_VL_TX_SCX: TFloatField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    qry_rel_imp_sap_PL_MERCADORIA: TFloatField;
    ppLabel5: TppLabel;
    ppDBText2: TppDBText;
    ppDBCalc5: TppDBCalc;
    ppLine1: TppLine;
    qry_rel_imp_sap_CD_CLIENTE: TStringField;
    qry_rel_imp_sap_NM_EMPRESA: TStringField;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel6: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppLine2: TppLine;
    ppDBText3: TppDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sel_data_proc: Tdatm_sel_data_proc;

implementation

{$R *.DFM}




end.
