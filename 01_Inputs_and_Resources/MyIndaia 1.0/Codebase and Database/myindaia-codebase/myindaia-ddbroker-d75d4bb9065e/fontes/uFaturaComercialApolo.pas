unit uFaturaComercialApolo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, RLFilters, RLPDFFilter, dxGDIPlusClasses;

type
  TfrmFaturaComercialApolo = class(TForm)
    RLReport1: TRLReport;
    rlHeader: TRLBand;
    rlLogo: TRLImage;
    RLPDFFilter1: TRLPDFFilter;
    RLDraw1: TRLDraw;
    lblFaturaComercial: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    rlGrupoProcesso: TRLGroup;
    lblData: TRLLabel;
    rlHeader2: TRLBand;
    rlSubDetailFatura: TRLSubDetail;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLPanel34: TRLPanel;
    rlQuantidade: TRLLabel;
    RLPanel35: TRLPanel;
    rlEmabalagem: TRLLabel;
    RLPanel36: TRLPanel;
    rlCodigo: TRLLabel;
    RLPanel37: TRLPanel;
    rlDescricaoMercadoria: TRLLabel;
    RLPanel38: TRLPanel;
    rlNCM: TRLLabel;
    RLPanel40: TRLPanel;
    rlPrecoUnitario: TRLLabel;
    RLPanel41: TRLPanel;
    rlSubtotalMercadoria: TRLLabel;
    rldbMoedaPrecoUnitario: TRLDBText;
    rldbMoedaPrecoTotal: TRLDBText;
    rlData: TRLDBText;
    RLPanel42: TRLPanel;
    RLPanel43: TRLPanel;
    RLPanel44: TRLPanel;
    RLPanel45: TRLPanel;
    RLPanel46: TRLPanel;
    RLPanel48: TRLPanel;
    RLPanel49: TRLPanel;
    rldbQtMercadoria: TRLDBText;
    rldbNCM: TRLDBText;
    rldbValorUnitario: TRLDBText;
    rldbVlTotItem: TRLDBText;
    rldbMercadoria: TRLDBMemo;
    rldbEmbalagem: TRLDBText;
    rldbCodigoMercadoria: TRLDBText;
    RLBand4: TRLBand;
    RLPanel1: TRLPanel;
    RLPanel8: TRLPanel;
    RLPanel17: TRLPanel;
    rlEmbalagens: TRLLabel;
    RLPanel19: TRLPanel;
    lblPesoLiquido: TRLLabel;
    lblPesoBruto: TRLLabel;
    rldbPesoLiquido: TRLDBText;
    rldbPesoBruto: TRLDBText;
    RLPanel9: TRLPanel;
    RLPanel18: TRLPanel;
    RLPanel27: TRLPanel;
    rlSubTotal: TRLLabel;
    rldbTotFob: TRLDBText;
    rldbMoedaSubTotalMerc: TRLDBText;
    RLPanel21: TRLPanel;
    RLPanel29: TRLPanel;
    rlDesconto: TRLLabel;
    rldbMoedaDescontoMerc: TRLDBText;
    rldbTotDesc: TRLDBText;
    RLPanel22: TRLPanel;
    RLPanel30: TRLPanel;
    rlTotalMle: TRLLabel;
    rldbMoedaMLEMerc: TRLDBText;
    rldbTotMle: TRLDBText;
    RLPanel23: TRLPanel;
    RLPanel31: TRLPanel;
    rlFrete: TRLLabel;
    rldbMoedaFreteMerc: TRLDBText;
    rldbTotFrete: TRLDBText;
    RLPanel24: TRLPanel;
    RLPanel32: TRLPanel;
    rlSeguro: TRLLabel;
    rldbMoedaSeguroMerc: TRLDBText;
    rldbTotSeg: TRLDBText;
    RLPanel25: TRLPanel;
    RLPanel33: TRLPanel;
    rlTotalMCV: TRLLabel;
    rldbIncotermMerc: TRLDBText;
    rldbMoedaTotMCVMerc: TRLDBText;
    rldbTotlMcv: TRLDBText;
    RLPanel26: TRLPanel;
    RLPanel28: TRLPanel;
    rlDespesa: TRLLabel;
    rldbMoedaGastoMerc: TRLDBText;
    rldbTotAcrescimo: TRLDBText;
    RLPanel2: TRLPanel;
    RLPanel10: TRLPanel;
    lblVia: TRLLabel;
    lblPaisDestino: TRLLabel;
    lblPaisOrigem: TRLLabel;
    rldbNmViaTransp: TRLDBText;
    rldbPaisDestino: TRLDBText;
    rldbPaisOrigem: TRLDBText;
    RLPanel11: TRLPanel;
    lblLocalDesembarque: TRLLabel;
    lblLocalEmbarque: TRLLabel;
    RLPanel3: TRLPanel;
    RLPanel12: TRLPanel;
    lblFormaPagamento: TRLLabel;
    rldbTermoPagmto: TRLDBMemo;
    RLPanel13: TRLPanel;
    rlRef: TRLLabel;
    RLPanel5: TRLPanel;
    RLBand6: TRLBand;
    RLPanel50: TRLPanel;
    RLPanel51: TRLPanel;
    RLPanel52: TRLPanel;
    RLPanel53: TRLPanel;
    RLPanel54: TRLPanel;
    RLPanel56: TRLPanel;
    RLPanel57: TRLPanel;
    rlgrupoFatura: TRLGroup;
    rldbNrFatura: TRLDBText;
    rldbPortoDestino: TRLDBMemo;
    RLDBMemo1: TRLDBMemo;
    RLPanel58: TRLPanel;
    rlExportador: TRLLabel;
    rldbExportadorNome: TRLDBText;
    rldbExportadoEndereco: TRLDBText;
    rldbExportadorCep: TRLDBText;
    rldbExportadorCNPJ: TRLDBText;
    rldbExportadorTelefone: TRLDBText;
    RLPanel59: TRLPanel;
    rlImportador: TRLLabel;
    rldbImportadorNome: TRLDBText;
    rldbImportadorPais: TRLDBText;
    RLDBText1: TRLDBText;
    RLDBMemo2: TRLDBMemo;
    RLPanel60: TRLPanel;
    RLLabel2: TRLLabel;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLPanel61: TRLPanel;
    RLLabel3: TRLLabel;
    rldbTXEmbalagem: TRLDBMemo;
    RLLabel4: TRLLabel;
    RLDBText2: TRLDBText;
    RLPanel6: TRLPanel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText13: TRLDBText;
    RLPanel16: TRLPanel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLMemo1: TRLMemo;
    RLPanel20: TRLPanel;
    RLPanel4: TRLPanel;
    RLPanel7: TRLPanel;
    RLPanel14: TRLPanel;
    RLLabel9: TRLLabel;
    RLPanel15: TRLPanel;
    RLDraw2: TRLDraw;
    RLMemo2: TRLMemo;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBMemo3: TRLDBMemo;
    RLDBText12: TRLDBText;
    procedure rlSubDetailFaturaBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    idioma : integer;
    tipoFatura : integer;
  procedure AbrirQueryItens;    
  public
    { Public declarations }
  function PrepararRelatorio(nrProcesso : string; idiomaRelatorio, tpFatura : integer) :Boolean;
  end;

var
  frmFaturaComercialApolo: TfrmFaturaComercialApolo;

implementation

uses
  udatm_DocumentosExportacao , PGGP001, PGGP017;

{$R *.dfm}


function TfrmFaturaComercialApolo.PrepararRelatorio(nrProcesso : string; idiomaRelatorio, tpFatura : integer) :Boolean;
begin
  idioma := idiomaRelatorio;
  tipoFatura := tpFatura;
  datm_DocumentosExportacao.qryFaturaComercial.Close;
  datm_DocumentosExportacao.cdsFaturaComercial.Close;
  datm_DocumentosExportacao.qryFaturaComercial.SQL.Text := datm_DocumentosExportacao.GetSQLFaturaComercial(nrProcesso, idioma, tcApolo);
  datm_DocumentosExportacao.cdsFaturaComercial.open;

  result := datm_DocumentosExportacao.cdsFaturaComercial.recordCount > 0;
end;

procedure TfrmFaturaComercialApolo.AbrirQueryItens;
begin
  datm_DocumentosExportacao.qryFaturaComercialItem.Close;
  datm_DocumentosExportacao.cdsFaturaComercialItem.Close;
  datm_DocumentosExportacao.qryFaturaComercialItem.Sql.Text :=
   datm_DocumentosExportacao.GetSQLFaturaComercialItens(datm_DocumentosExportacao.cdsFaturaComercial.FieldByName('NR_PROCESSO').asString,
                                                        datm_DocumentosExportacao.cdsFaturaComercial.FieldByName('NR_FATURA').asString);
  datm_DocumentosExportacao.cdsFaturaComercialItem.open;
end;

procedure TfrmFaturaComercialApolo.rlSubDetailFaturaBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
   AbrirQueryItens;
end;

procedure TfrmFaturaComercialApolo.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  try
  if datm_DocumentosExportacao.cdsFaturaComercial.FieldByName('PATH_LOGO').AsString <> '' then
    rlLogo.Picture.LoadFromFile( cDir_Rpt + '\' + Trim(datm_DocumentosExportacao.cdsFaturaComercial.FieldByName('PATH_LOGO').AsString));
  except on e : Exception do
  end;

  if idioma = ID_ESPANHOL then
  begin
    rlExportador.caption              := 'EXPORTADOR:';
    rlImportador.caption              := 'IMPORTADOR:';
    lblData.caption                   := 'Fecha:';

    if tipoFatura = 0 then
      lblFaturaComercial.caption        := 'FACTURA COMERCIAL:'
    else
    if tipoFatura = 1 then
      lblFaturaComercial.caption        := 'FACTURA PROFORMA:';

    rlQuantidade.caption              := 'CTD';
    rlEmabalagem.caption              := 'EMBALAJE';
    rlCodigo.caption                  := 'CODIGO';
    rlDescricaoMercadoria.caption     := 'DESCRIPCION';
    rlNCM.caption                     := 'NCM';
    rlPrecoUnitario.caption           := 'PRECIO UNIT';
    rlSubtotalMercadoria.caption      := 'SUB-TOTAL';
    rlEmbalagens.caption              := 'EMPAQUES:';
    rlSubTotal.caption                := 'SUB-TOTAL';
    rlDespesa.caption                 := 'GASTO';
    rlDesconto.caption                := 'DESCUENTO';
    rlTotalMle.caption                := 'TOTAL MLE';
    rlFrete.caption                   := 'FLETE';
    rlSeguro.caption                  := 'SEGURO';
    rlTotalMCV.caption                := 'TOTAL MCV';
    lblPesoLiquido.caption            := 'PESO NETO (KG):';
    lblPesoBruto.caption              := 'PESO BRUTO (KG):';
    lblFormaPagamento.caption         := 'FORMA DE PAGO:';
    rlRef.caption                     := 'L/C REF.NR.';
    lblVia.caption                    := 'VIA:';
    lblPaisDestino.caption            := 'PAÍS DE DESTINO:';
    lblPaisOrigem.caption             := 'PAÍS DE ORIGEN:';
    lblLocalDesembarque.caption       := 'LOCAL DE DESEMBARQUE / DESTINO:';
    lblLocalEmbarque.caption          := 'LOCAL DE EMBARQUE / ORIGEN: ';
//    rlTotFaturaComercial.caption      := 'FACTURA PROFORMA :';

    rlData.DataField                  := 'CIDADE_DATA_ESPANHOL';
    rldbImportadorPais.DataField      := 'IMPORT_PAIS_ESP';
    rldbPaisDestino.DataField         := 'PAIS_DESTINO_ESP';
    rldbNmViaTransp.DataField         := 'NM_VIA_TRANSPORTE_ESP';
    rldbPortoDestino.DataField        := 'DS_PORTO_DESTINO_ESP';
    rldbMercadoria.DataField          := 'MERCADORIA_ESP';
    rldbEmbalagem.DataField           := 'UNIDADE_MEDIDA_ESP';
  end
  else
  if idioma = ID_INGLES then
  begin
    rlExportador.caption              := 'EXPORTER:';
    rlImportador.caption              := 'IMPORTER:';
    lblData.caption                   := 'DATE:';

    if tipoFatura = 0 then
      lblFaturaComercial.caption        := 'COMMERCIAL INVOICE:'
    else
    if tipoFatura = 1 then
      lblFaturaComercial.caption        := 'PROFORMA INVOICE:';

    rlQuantidade.caption              := 'QTY';
    rlEmabalagem.caption              := 'PACKING';
    rlCodigo.caption                  := 'CODE';
    rlDescricaoMercadoria.caption     := 'DESCRIPTION';
    rlNCM.caption                     := 'NCM';
    rlPrecoUnitario.caption           := 'UNIT VALUE';
    rlSubtotalMercadoria.caption      := 'SUB-TOTAL';
    rlEmbalagens.caption              := 'VOLUME:';
    rlSubTotal.caption                := 'SUB-TOTAL';
    rlDespesa.caption                 := 'INCREASE';
    rlDesconto.caption                := 'DISCOUNT';
    rlTotalMle.caption                := 'TOTAL MLE';
    rlFrete.caption                   := 'FREIGHT';
    rlSeguro.caption                  := 'INSURANCE';
    rlTotalMCV.caption                := 'TOTAL MCV';
    lblPesoLiquido.caption            := 'NET WEIGHT (KG):';
    lblPesoBruto.caption              := 'GROSS WEIGHT (KG):';
    lblFormaPagamento.caption         := 'PAYMENT FORM:';
    rlRef.caption                     := 'L/C REF.NR.';
    lblVia.caption                    := 'BY:';
    lblPaisDestino.caption            := 'COUNTRY OF DESTINY:';
    lblPaisOrigem.caption             := 'COUNTRY OF ORIGIN:';
    lblLocalDesembarque.caption       := 'PLACE OF DESTINY:';
    lblLocalEmbarque.caption          := 'PLACE OF SHIPPING: ';


    rlData.DataField                  := 'CIDADE_DATA_INGLES';
    rldbImportadorPais.DataField      := 'IMPORT_PAIS_ING';
    rldbPaisDestino.DataField         := 'PAIS_DESTINO_ING';
    rldbNmViaTransp.DataField         := 'NM_VIA_TRANSPORTE_ING';
    rldbPortoDestino.DataField        := 'DS_PORTO_DESTINO_ING';
    rldbMercadoria.DataField          := 'MERCADORIA_ING';
    rldbEmbalagem.DataField           := 'UNIDADE_MEDIDA_ING';

  end
  else
  if idioma = ID_PORTUGUES Then
  begin
    rlExportador.caption              := 'EXPORTADOR:';
    rlImportador.caption              := 'IMPORTADOR:';
    lblData.caption                   := 'DATA:';
    if tipoFatura = 0 then
      lblFaturaComercial.caption        := 'FATURA COMERCIAL:'
    else
    if tipoFatura = 1 then
      lblFaturaComercial.caption        := 'FATURA PROFORMA:';

    rlQuantidade.caption              := 'QT';
    rlEmabalagem.caption              := 'EMBALAGEM';
    rlCodigo.caption                  := 'CODIGO';
    rlDescricaoMercadoria.caption     := 'DESCRICAO';
    rlNCM.caption                     := 'NCM';
    rlPrecoUnitario.caption           := 'VALOR UNIT';
    rlSubtotalMercadoria.caption      := 'SUB-TOTAL';
    rlEmbalagens.caption              := 'VOLUME:';
    rlSubTotal.caption                := 'SUB-TOTAL';
    rlDespesa.caption                 := 'ACRESCIMO';
    rlDesconto.caption                := 'DESCONTO';
    rlTotalMle.caption                := 'TOTAL MLE';
    rlFrete.caption                   := 'FRETE';
    rlSeguro.caption                  := 'SEGURO';
    rlTotalMCV.caption                := 'TOTAL MCV';
    lblPesoLiquido.caption            := 'PESO LIQUIDO (KG):';
    lblPesoBruto.caption              := 'PESO BRUTO (KG):';
    lblFormaPagamento.caption         := 'FORMA DE PAGAMENTO:';
    rlRef.caption                     := 'L/C REF.NR.';
    lblVia.caption                    := 'VIA:';
    lblPaisDestino.caption            := 'PAIS DE DESTINO:';
    lblPaisOrigem.caption             := 'PAIS DE ORIGEM:';
    lblLocalDesembarque.caption       := 'LOCAL DE DESEMBARQUE:';
    lblLocalEmbarque.caption          := 'LOCAL DE EMBARQUE: ';

    rlData.DataField                  := 'CIDADE_DATA_PORTUGUES';
    rldbImportadorPais.DataField      := 'IMPORT_PAIS_POR';
    rldbPaisDestino.DataField         := 'PAIS_DESTINO_POR';
    rldbNmViaTransp.DataField         := 'NM_VIA_TRANSPORTE_POR';
    rldbPortoDestino.DataField        := 'DS_PORTO_DESTINO_POR';
    rldbMercadoria.DataField          := 'MERCADORIA_POR';
    rldbEmbalagem.DataField           := 'UNIDADE_MEDIDA_POR';
  end;
end;

end.

