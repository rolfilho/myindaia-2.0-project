unit dIntFORDExp;

interface

uses
  SysUtils, Classes, ppParameter, ppMemo, ppBands, ppClass, ppReport,
  ppStrtch, ppSubRpt, jpeg, ppCtrls, ppPrnabl, ppCache, ppProd, ppDB, DB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, DBTables, ppVar, ppRichTx, ppModule,
  raCodMod;

type
  TdatmFordExp = class(TDataModule)
    qryExpCOCapa: TQuery;
    qryExpCOCapaNR_FATURA: TStringField;
    qryExpCOCapaEXPORTADOR_NOME: TStringField;
    qryExpCOCapaEXPORTADOR_ENDERECO_NUM: TStringField;
    qryExpCOCapaEXPORTADOR_END_CIDADE_UF_CEP: TStringField;
    qryExpCOCapaIMPORTADOR_NOME: TStringField;
    qryExpCOCapaIMPORTADOR_ENDERECO_NUM: TStringField;
    qryExpCOCapaIMPORTADOR_CIDADE_PAIS: TStringField;
    qryExpCOCapaCONSIGNATARIO_NOME: TStringField;
    qryExpCOCapaCONSIGNATARIO_NM_PAIS: TStringField;
    qryExpCOCapaPORTO_DESCRICAO: TStringField;
    qryExpCOCapaNM_VIA_TRANSPORTE: TStringField;
    qryExpCOCapaNM_PAIS_DESTINO: TStringField;
    qryExpCOCapaDT_FATURA: TDateTimeField;
    dsExpCOCapa: TDataSource;
    ppBDEExpCOCapa: TppBDEPipeline;
    qryExpCOItens: TQuery;
    qryExpCOItensNR_FATURA: TStringField;
    qryExpCOItensNR_NCM_MERCADORIA: TStringField;
    qryExpCOItensTX_MERCADORIA: TMemoField;
    qryExpCOItensPL_MERCADORIA: TFloatField;
    qryExpCOItensVL_MERCADORIA: TFloatField;
    dsExpCOItens: TDataSource;
    ppBDExpCOItens: TppBDEPipeline;
    qryExpCONCM: TQuery;
    qryExpCONCMNR_ORDEM: TFloatField;
    qryExpCONCMNR_NCM_MERCADORIA: TStringField;
    dsExpCONCM: TDataSource;
    ppRpExpCO: TppReport;
    ppParameterList1: TppParameterList;
    qryExpCONCMTX_NCM: TMemoField;
    qryExpCONCMNR_NCM_MERCADORIA_MSK: TStringField;
    ppBDEExpCONCM: TppBDEPipeline;
    qryExpCOCapaTX_NORMA_ORIGEM: TMemoField;
    qryExpCOCapaTX_OBS: TMemoField;
    qryExpCONCMNR_NALADI_MERCADORIA_MSK: TStringField;
    qryExpCOCapaTX_OBS_1: TMemoField;
    qryExpCOCapaTX_OBS_2: TMemoField;
    qryExpCOCapaDATA_ORIGEM: TStringField;
    ace18_header: TppHeaderBand;
    ppImage1: TppImage;
    ppMemo1: TppMemo;
    ppMemo3: TppMemo;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText10: TppDBText;
    ace18_detail2: TppDetailBand;
    SRExpCONCM: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDetailBand1: TppDetailBand;
    SRExpCOItens: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppDBText5: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    raCodeModule1: TraCodeModule;
    ppFooterBand2: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppGroupFooterBand1: TppGroupFooterBand;
    raCodeModule2: TraCodeModule;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppPageStyle1: TppPageStyle;
    ppLine15: TppLine;
    ppLine21: TppLine;
    ppLine8: TppLine;
    ppLine10: TppLine;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine9: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine7: TppLine;
    ppLabel13: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppMemo4: TppMemo;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppMemo5: TppMemo;
    ppDBText4: TppDBText;
    ppDBText3: TppDBText;
    ppLabel7: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel6: TppLabel;
    ppLabel16: TppLabel;
    ppLine18: TppLine;
    ppDBText6: TppDBText;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppDBText7: TppDBText;
    raCodeModule3: TraCodeModule;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datmFordExp: TdatmFordExp;

implementation

{$R *.dfm}

end.
