unit PGPE034;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppClass, ppProd, ppReport, ppEndUsr, ppDB, ppComm, ppRelatv,
  ppCache, ppDBPipe, ppDBBDE, Db, DBTables, ppModule, daDatMod, ppStrtch,
  ppMemo, ppCtrls, ppPrnabl, ppVar, ppRegion, ppSubRpt, TXtraDev,
  ppParameter, raCodMod;

type
  Tdatm_exp_impr_packing = class(TDataModule)
    ppDesigner: TppDesigner;
    ppRepPackList: TppReport;
    Tunid: TQuery;
    Dts_Unid: TDataSource;
    Texp: TQuery;
    Dts_Exp: TDataSource;
    TImp: TQuery;
    Dts_Imp: TDataSource;
    Tconsig: TQuery;
    Dts_consig: TDataSource;
    ppBDE_Exp: TppBDEPipeline;
    ppBDE_Imp: TppBDEPipeline;
    ppBDE_Consig: TppBDEPipeline;
    TViaTr: TQuery;
    Dts_ViaTr: TDataSource;
    ppBDE_ViaTr: TppBDEPipeline;
    TLocal1: TQuery;
    Dts_Local1: TDataSource;
    ppBDE_Local1: TppBDEPipeline;
    TLocal2: TQuery;
    Dts_Local2: TDataSource;
    ppBDE_Local2: TppBDEPipeline;
    TProc: TQuery;
    Dts_Proc: TDataSource;
    TProcI: TQuery;
    Dts_ProcI: TDataSource;
    ppBDE_Proc: TppBDEPipeline;
    ppBDE_ProcI: TppBDEPipeline;
    Tprocesso: TQuery;
    Dts_Processo: TDataSource;
    ppBDE_Processo: TppBDEPipeline;
    Tunidcd_unid_neg: TStringField;
    Tunidnm_unid_neg: TStringField;
    Tpais1: TQuery;
    Dts_Pais1: TDataSource;
    ppBDE_Pais1: TppBDEPipeline;
    TPais2: TQuery;
    Dts_Pais2: TDataSource;
    ppBDE_Pais2: TppBDEPipeline;
    TProcRE: TQuery;
    Dts_ProcRE: TDataSource;
    ppBDE_PROCRE: TppBDEPipeline;
    TProcRENR_RE: TStringField;
    TCartaCred: TQuery;
    TCartaCredNR_PROCESSO: TStringField;
    TCartaCredTX_IMPORTADOR: TMemoField;
    TCartaCredTX_EXPORTADOR: TMemoField;
    TCartaCredTX_CONSIGNATARIO: TMemoField;
    TCartaCredTX_NOTIFY1: TMemoField;
    TCartaCredTX_NOTIFY2: TMemoField;
    TCartaCredTX_DOCTO: TMemoField;
    TCartaCredTX_COPIA: TMemoField;
    TCartaCredTX_SAQUE: TMemoField;
    TCartaCredNM_UNID_MED_PL: TStringField;
    TCartaCredNM_UNID_MED_PB: TStringField;
    TCartaCredNM_LOCAL_DESTINO: TStringField;
    TCartaCredNM_LOCAL_ORIGEM: TStringField;
    TCartaCredNM_PAIS_DESTINO: TStringField;
    TCartaCredNM_PAIS_ORIGEM: TStringField;
    TCartaCredTX_TERMO_PAGTO: TMemoField;
    Dts_CartaCred: TDataSource;
    ppBDE_CartaCred: TppBDEPipeline;
    ppBDE_ProcIppField18: TppField;
    ppParameterList1: TppParameterList;
    ppBDE_ProcIppField19: TppField;
    ppHeaderBand1: TppHeaderBand;
    ppimg_logo_PackList: TppImage;
    ppShape10: TppShape;
    ppShape9: TppShape;
    ppShape2: TppShape;
    ppShape7: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape1: TppShape;
    ppShape18: TppShape;
    ppShape8: TppShape;
    ppShape17: TppShape;
    ppDBText10: TppDBText;
    ppPackingList: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppImp: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppConsig: TppLabel;
    ppDBText13: TppDBText;
    ppDBText15: TppDBText;
    ppCod: TppLabel;
    ppQtde: TppLabel;
    ppDesc: TppLabel;
    ppCubagem: TppLabel;
    ppPesoLiq: TppLabel;
    ppPesoBruto: TppLabel;
    ppData: TppLabel;
    ppMarcas: TppLabel;
    ppLocalOrigem: TppLabel;
    ppLocalDestino: TppLabel;
    ppFatura: TppLabel;
    ppPesoLiqTotal: TppLabel;
    ppPesoBrutoTotal: TppLabel;
    ppCubagemTotal: TppLabel;
    ppDBText16: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppLine4: TppLine;
    ppDtFatura: TppLabel;
    ppDBText21: TppDBText;
    ppDBText29: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBText11: TppDBText;
    ppPaisOrigem: TppLabel;
    ppPaisDestino: TppLabel;
    ppDBText12: TppDBText;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppLine5: TppLine;
    ppPageTotal: TppSystemVariable;
    ppTipo: TppLabel;
    ppProcesso: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText30: TppDBText;
    ppDBText32: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppRegMercadoria: TppRegion;
    ppDBMemo2: TppDBMemo;
    ppQtd: TppDBText;
    ppRegEmb: TppRegion;
    ppDBText23: TppDBText;
    ppDBText22: TppDBText;
    ppRegEmbSup: TppRegion;
    ppQtdSup: TppDBText;
    ppDBText18: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppShape5: TppShape;
    ppDBText38: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppRegion1: TppRegion;
    ppdbm_embalagem: TppDBMemo;
    ppLabel3: TppLabel;
    ppEmbalagem: TppLabel;
    ppDBMDeclAdic: TppDBMemo;
    ppPageStyle1: TppPageStyle;
    ppLine2: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    procedure ppSummaryBand1BeforePrint(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_exp_impr_packing: Tdatm_exp_impr_packing;

implementation

{$R *.DFM}

uses pgpe033;

procedure Tdatm_exp_impr_packing.ppSummaryBand1BeforePrint(Sender: TObject);
begin
  ppDBMDeclAdic.Visible := ( TProc.FieldByName('IN_DECL_AD_PACKING_LIST').AsString = '1' );
end;

procedure Tdatm_exp_impr_packing.ppDetailBand1BeforePrint(Sender: TObject);
begin
  ppRegEmbSup.Visible := ( Trim( TProcI.FieldByName( 'QT_EMB_SUP' ).AsString ) <> '' );
  ppRegEmb.Visible    := ( TProcI.FieldByName( 'QT_EMBALAGEM' ).AsFloat <> 0 );
end;

procedure Tdatm_exp_impr_packing.ppHeaderBand1BeforePrint(Sender: TObject);
begin
    if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '0' then    // Português
  begin
    ppPackingList.Caption    := 'LISTA DE EMBALAGENS';
    ppProcesso.Caption       := 'EMBARQUE Nº:';
    ppData.Caption           := 'DATA:';
    ppImp.Caption            := 'IMPORTADOR';
    ppConsig.Caption         := 'CONSIGNATÁRIO';
    ppMarcas.Caption         := 'MARCAS';
    ppLocalOrigem.Caption    := 'PORTO DE EMBARQUE';
    ppPaisOrigem.Caption     := 'PAÍS';
    ppLocalDestino.Caption   := 'PORTO DE DESTINO';
    ppPaisDestino.Caption    := 'PAÍS';
    ppPesoLiqTotal.Caption   := 'PESO LÍQUIDO';
    ppPesoBrutoTotal.Caption := 'PESO BRUTO';
    ppCubagemTotal.Caption   := 'CUBAGEM';
    ppFatura.Caption         := 'FATURA Nº';
    ppDtFatura.Caption       := 'DATA';
    ppQtde.Caption           := 'QTD';
    ppCod.Caption            := 'PRODUTO';
    ppDesc.Caption           := 'DESCRIÇÃO';
    ppCubagem.Caption        := 'CUBAGEM';
    ppPesoLiq.Caption        := 'PESO LÍQUIDO';
    ppPesoBruto.Caption      := 'PESO BRUTO';
    if Tproc.FieldByName('CD_GRUPO').AsString =  'C16' THEN
      ppEmbalagem.Caption      := 'EMBALAGEM'
    else
      ppEmbalagem.Caption      := 'EMBALAGEM:';
  end;
  if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then    // Inglês
  begin
    ppPackingList.Caption    := 'PACKING LIST';
    ppProcesso.Caption       := 'SHIPMENT NR:';
    ppData.Caption           := 'DATE:';
    ppImp.Caption            := 'BUYER';
    ppConsig.Caption         := 'CONSIGNEE';
    ppMarcas.Caption         := 'MARKS';
    ppLocalOrigem.Caption    := 'PORT OF LOADING';
    ppPaisOrigem.Caption     := 'COUNTRY';
    ppLocalDestino.Caption   := 'PORT OF UNLOADING';
    ppPaisDestino.Caption    := 'COUNTRY';
    ppPesoLiqTotal.Caption   := 'NET WEIGHT';
    ppPesoBrutoTotal.Caption := 'GROSS WEIGHT';
    ppCubagemTotal.Caption   := 'MEASUREMENT';
    ppFatura.Caption         := 'INVOICE NR';
    ppDtFatura.Caption       := 'DATE';
    ppQtde.Caption           := 'NUMBERS';
    ppCod.Caption            := 'PRODUCT';
    ppDesc.Caption           := 'CONTENTS';
    ppCubagem.Caption        := 'MEASUREMENT';
    ppPesoLiq.Caption        := 'NET WEIGHT';
    ppPesoBruto.Caption      := 'GROSS WEIGHT';
    if Tproc.FieldByName('CD_GRUPO').AsString =  'C16' THEN
      ppEmbalagem.Caption      := 'PACKAGE'
    else
      ppEmbalagem.Caption      := 'PACKING:'
  end;
  if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then    // Espanhol
  begin
    ppPackingList.Caption    := 'LISTA DE EMPAQUE';
    ppProcesso.Caption       := 'EMPAQUE Nº:';
    ppData.Caption           := 'FECHA:';
    ppImp.Caption            := 'IMPORTADOR';
    ppConsig.Caption         := 'CONSIGNATARIO';
    ppMarcas.Caption         := 'MARCAS';
    ppLocalOrigem.Caption    := 'PUERTO DE EMBARQUE';
    ppPaisOrigem.Caption     := 'PAÍS';
    ppLocalDestino.Caption   := 'PUERTO DE DESTINO';
    ppPaisDestino.Caption    := 'PAÍS';
    ppPesoLiqTotal.Caption   := 'PESO NETO';
    ppPesoBrutoTotal.Caption := 'PESO BRUTO';
    ppCubagemTotal.Caption   := 'CUBAJE';
    ppFatura.Caption         := 'FACTURA Nº';
    ppDtFatura.Caption       := 'FECHA';
    ppQtde.Caption           := 'CTD';
    ppCod.Caption            := 'PRODUCTO';
    ppDesc.Caption           := 'DESCRIPCIÓN';
    ppCubagem.Caption        := 'CUBAJE';
    ppPesoLiq.Caption        := 'PESO NETO';
    ppPesoBruto.Caption      := 'PESO BRUTO';
    if Tproc.FieldByName('CD_GRUPO').AsString =  'C16' THEN
      ppEmbalagem.Caption      := 'EMBALAJE'
    else
      ppEmbalagem.Caption      := 'EMPAQUE';
  end;
  
  case frm_exp_impr_packing.cbo_tipo.ItemIndex of
    0 : begin
          ppTipo.Caption := 'ORIGINAL';
        end;
    1 : begin
        if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then    // Inglês
          ppTipo.Caption := 'COPY';
        if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '0' then    // Português
          ppTipo.Caption := 'CÓPIA';
        if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then    // Espanhol
          ppTipo.Caption := 'COPIA';
        end;
    2 : ppTipo.Caption := '';
  end;

end;


end.
