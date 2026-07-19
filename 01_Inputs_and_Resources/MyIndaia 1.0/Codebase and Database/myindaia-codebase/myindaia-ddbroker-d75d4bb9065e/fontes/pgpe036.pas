unit PGPE036;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppClass, ppProd, ppReport, ppEndUsr, ppDB, ppComm, ppRelatv,
  ppCache, ppDBPipe, ppDBBDE, Db, DBTables, ppModule, daDatMod, ppStrtch,
  ppMemo, ppCtrls, ppPrnabl, ppVar, ppSubRpt;

type
  Tdatm_exp_impr_cert_seg = class(TDataModule)
    ppDesigner: TppDesigner;
    ppReport: TppReport;
    Tunid: TQuery;
    Dts_Unid: TDataSource;
    Tncm: TQuery;
    Dts_Ncm: TDataSource;
    ppBDE_Ncm: TppBDEPipeline;
    TAgenteSeg: TQuery;
    Dts_AgenteSeg: TDataSource;
    ppBDE_AgenteSeg: TppBDEPipeline;
    TProc: TQuery;
    Dts_Proc: TDataSource;
    ppBDE_Proc: TppBDEPipeline;
    Tprocesso: TQuery;
    Dts_Processo: TDataSource;
    ppBDE_Processo: TppBDEPipeline;
    Tunidcd_unid_neg: TStringField;
    Tunidnm_unid_neg: TStringField;
    TParametros: TQuery;
    TCartaCred: TQuery;
    Dts_CartaCred: TDataSource;
    ppBDE_CartaCred: TppBDEPipeline;
    TCartaCredNR_PROCESSO: TStringField;
    TCartaCredTX_EXPORTADOR: TMemoField;
    TCartaCredNM_PAIS_ORIGEM: TStringField;
    TCartaCredNM_PAIS_DESTINO: TStringField;
    TCartaCredNM_LOCAL_PAIS_ORIGEM: TStringField;
    TCartaCredNM_LOCAL_DESTINO: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppDBText4: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText11: TppDBText;
    ppDBText14: TppDBText;
    ppSystemVariable2: TppSystemVariable;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText17: TppDBText;
    ppDBText3: TppDBText;
    ppLabel6: TppLabel;
    ppDBMemo5: TppDBMemo;
    ppLabel7: TppLabel;
    ppDBText15: TppDBText;
    ppDBMemo4: TppDBMemo;
    ppDBMemo3: TppDBMemo;
    ppDBText9: TppDBText;
    ppDBText16: TppDBText;
    ppDBMemo6: TppDBMemo;
    ppDBText18: TppDBText;
    ppDBMemo7: TppDBMemo;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
  private
    { Private declarations }        
  public
    { Public declarations }
  end;

var
  datm_exp_impr_cert_seg: Tdatm_exp_impr_cert_seg;

implementation

{$R *.DFM}

uses pgpe035;









end.
