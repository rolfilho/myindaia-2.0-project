unit PGSM251;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppClass, ppDB, ppPrnabl, ppCtrls, ppProd, ppReport, ppEndUsr,
  Db, DBTables, ppComm, ppRelatv, ppCache, ppDBPipe, ExtCtrls, ppStrtch,
  ppSubRpt;

type
  Tdatm_lembrete_po = class(TDataModule)
    ppBDEAviso: TppDBPipeline;
    ds_aviso: TDataSource;
    qry_aviso_: TQuery;
    ppDesigner1: TppDesigner;
    ppRepLembrete_po: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText3: TppDBText;
    tmr_lembrete_po: TTimer;
    ppBDEpo_merc: TppDBPipeline;
    ds_po_merc: TDataSource;
    qry_po_merc_: TQuery;
    ppSubMerc: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBText4: TppDBText;
    qry_aviso_NR_PROCESSO: TStringField;
    qry_aviso_CD_EVENTO: TStringField;
    qry_aviso_NM_EVENTO: TStringField;
    qry_aviso_DT_LIMITE: TDateTimeField;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    qry_po_merc_NR_PROCESSO: TStringField;
    qry_po_merc_CD_MERCADORIA: TStringField;
    qry_po_merc_AP_MERCADORIA: TStringField;
    qry_po_merc_QT_INICIAL: TFloatField;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    ppTitleBand2: TppTitleBand;
    ppImage1: TppImage;
    qry_aviso_NM_EMPRESA: TStringField;
    ppDBText8: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel8: TppLabel;
    procedure tmr_lembrete_poTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_lembrete_po: Tdatm_lembrete_po;

implementation

{$R *.DFM}

uses PGSM250;

procedure Tdatm_lembrete_po.tmr_lembrete_poTimer(Sender: TObject);
begin
  frm_lembrete_po.Show;
  tmr_lembrete_po.Enabled := False;
end;


end.
