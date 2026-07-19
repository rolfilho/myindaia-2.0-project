unit dCONovoEx;

interface

uses
  SysUtils, Classes, DB, DBTables, Dialogs, ppParameter, ppCtrls, ppBands,
  ppRichTx, ppVar, ppMemo, ppClass, ppReport, ppSubRpt, jpeg, ppStrtch,
  ppPrnabl, ppCache, ppProd, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE;

type
  Tdatm_co_novoex = class(TDataModule)
    dsREsNovoEx: TDataSource;
    qryREsNovoEx: TQuery;
    qryREsNovoExNR_RE: TStringField;
    qryREsNovoExIN_RE_CO: TBooleanField;
    qryREsNovoExNR_NCM: TStringField;
    qryREsNovoExTX_ENQUADRAMENTO: TMemoField;
    qryREsNovoExVL_COND_VENDA: TFloatField;
    qryREsNovoExVL_LOCAL_EMB: TFloatField;
    qryREsNovoExQT_UNID_COMERC: TFloatField;
    qryREsNovoExTX_UNID_COMERC: TMemoField;
    qryREsNovoExQT_UNID_ESTAT: TFloatField;
    qryREsNovoExTX_UNID_ESTAT: TMemoField;
    qryREsNovoExQT_PESO_LIQ: TFloatField;
    qryREsNovoExNM_EMPRESA: TStringField;
    qryREsNovoExCGC_EMPRESA: TStringField;
    updREsNovoEx: TUpdateSQL;
    qryREsNovoExCD_USUARIO_CO: TStringField;
    qryREsCOCapa: TQuery;
    dsREsCOCapa: TDataSource;
    qryREsCOItens: TQuery;
    dsREsCOItens: TDataSource;
    qryREsCONCM: TQuery;
    dsREsCONCM: TDataSource;
    ppRpREsCO: TppReport;
    ppParameterList1: TppParameterList;
    qryREsCOCapaEXP1: TStringField;
    qryREsCOCapaEXP2: TStringField;
    qryREsCOCapaEXP3: TStringField;
    qryREsCOCapaIMP1: TStringField;
    qryREsCOCapaIMP2: TStringField;
    qryREsCOCapaIMP3: TStringField;
    qryREsCOCapaCONS1: TStringField;
    qryREsCOCapaCONS2: TStringField;
    qryREsCOCapaCONS3: TStringField;
    qryREsCOCapaPORTO: TStringField;
    qryREsCOCapaMODAL: TStringField;
    qryREsCOCapaDESTINO: TStringField;
    qryREsCOCapaFATURA: TStringField;
    qryREsCOCapaDTFATURA: TStringField;
    qryREsCOItensNR_RE: TStringField;
    qryREsCOItensNCM_MERCADORIA: TStringField;
    qryREsCOItensTX_MERCADORIA: TMemoField;
    qryREsCOItensPL_MERCADORIA: TFloatField;
    qryREsCOItensTX_UNID_COMERC: TMemoField;
    qryREsCOItensPESO_LIQ: TFloatField;
    qryREsCOItensVL_MERCADORIA: TFloatField;
    qryREsCONCMNR_ORDEM: TFloatField;
    qryREsCONCMNR_NCM_MERCADORIA_MSK: TStringField;
    qryREsCONCMNR_NALADI_MERCADORIA_MSK: TStringField;
    qryREsCONCMNR_NCM_MERCADORIA: TStringField;
    qryREsCONCMTX_NCM: TMemoField;
    ppBDEREsCOCapa: TppBDEPipeline;
    ppBDEREsCOItens: TppBDEPipeline;
    ppBDEREsCONCM: TppBDEPipeline;
    qryREsNovoExNM_EMPRESA2: TStringField;
    ace18_header: TppHeaderBand;
    ace18_dbt1: TppDBText;
    ace18_dbt2: TppDBText;
    ace18_dbt3: TppDBText;
    ace18_dbt4: TppDBText;
    ace18_dbt6: TppDBText;
    ace18_dbt8: TppDBText;
    ace18_dbt9: TppDBText;
    ace18_dbt10: TppDBText;
    ace18_dbt11: TppDBText;
    ace18_dbt12: TppDBText;
    ace18_dbt5: TppDBText;
    ace18_dbt7: TppDBText;
    ppDBText34: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppMemo1: TppMemo;
    ppLabel1: TppLabel;
    ppImage1: TppImage;
    ppMemo3: TppMemo;
    ace18_detail2: TppDetailBand;
    SRExpCONCM: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDetailBand1: TppDetailBand;
    SRExpCOItens: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText4: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppFooterBand2: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppFooterBand1: TppFooterBand;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppMemo2: TppMemo;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel28: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel30: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppRichText1: TppRichText;
    ppLabel27: TppLabel;
    ppDBText3: TppDBText;
    ppLabel20: TppLabel;
    ppLabel19: TppLabel;
    ppLabel18: TppLabel;
    ppPageStyle1: TppPageStyle;
    ppShape1: TppShape;
    ppShape19: TppShape;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine5: TppLine;
    ppLine4: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppShape2: TppShape;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine6: TppLine;
    procedure qryREsNovoExAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_co_novoex: Tdatm_co_novoex;

implementation

{$R *.dfm}
uses
  PGGP017, Funcoes, Variants;

procedure Tdatm_co_novoex.qryREsNovoExAfterPost(DataSet: TDataSet);
begin
  qryREsNovoEx.ApplyUpdates;
  if qryREsNovoExIN_RE_CO.AsBoolean Then
    FastExecSQL(' UPDATE TPROCESSO_RE_ITENS_NOVOEX ' +
                ' SET IN_RE_CO = :IN_RE_CO, ' +
                '     CD_USUARIO_CO = :CD_USUARIO_CO ' +
                ' WHERE NR_RE = :NR_RE ', [qryREsNovoExIN_RE_CO.AsBoolean, str_cd_usuario, qryREsNovoExNR_RE.AsString])
  Else
    FastExecSQL(' UPDATE TPROCESSO_RE_ITENS_NOVOEX ' +
                ' SET IN_RE_CO = :IN_RE_CO, ' +
                '     CD_USUARIO_CO = NULL ' +
                ' WHERE NR_RE = :NR_RE ', [qryREsNovoExIN_RE_CO.AsBoolean, qryREsNovoExNR_RE.AsString]);
end;

end.
