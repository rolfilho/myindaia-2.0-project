unit PGPO017;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ppDB, ppDBPipe, ppDBBDE, ppBands, ppClass, ppCtrls,
  ppStrtch, ppMemo, ppVar, ppPrnabl, ppCache, ppRelatv, ppProd, ppReport,
  ppComm, ppEndUsr, ppModule, daDatMod;

type
  Tdatm_po_impressao = class(TDataModule)
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_IMPORTADOR: TStringField;
    ppDesigner: TppDesigner;
    ppReport: TppReport;
    qry_po_: TQuery;
    Dts_PO: TDataSource;
    ppBDE_PO: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppdbtxt_nm_empresa: TppDBText;
    ppdbtxt_end_empresa: TppDBText;
    ppdbtxt_cep_empresa: TppDBText;
    ppdbtxt_cid_empresa: TppDBText;
    ppLabel1: TppLabel;
    ppMemo1: TppMemo;
    ppdbtxt_ap_moeda: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppdbtxt_nr_proc: TppDBText;
    ppdbtxt_local_desembarque: TppDBText;
    ppdbtxt_nr_articulo: TppDBText;
    ppdbtxt_nr_articulo2: TppDBText;
    ppdbtxt_cd_material: TppDBText;
    ppDBText1: TppDBText;
    ppdbtxt_nr_processo: TppDBText;
    pplbl_cabecalho: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppDBText2: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppDBMemo3: TppDBMemo;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppdbtxt_vl_frete: TppDBText;
    ppDBText11: TppDBText;
    ppLabel5: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    procedure ppGroupHeaderBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_po_impressao: Tdatm_po_impressao;

implementation

{$R *.DFM}






procedure Tdatm_po_impressao.ppGroupHeaderBand1BeforePrint(
  Sender: TObject);
begin
  ppdbtxt_vl_frete.Visible := ( qry_po_.FieldByName('VL_FRETE').AsFloat > 0 );
end;

end.
