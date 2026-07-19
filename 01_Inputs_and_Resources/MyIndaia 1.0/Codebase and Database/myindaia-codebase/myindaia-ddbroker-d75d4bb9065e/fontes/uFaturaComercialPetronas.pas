unit uFaturaComercialPetronas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, RLFilters, RLPDFFilter, dxGDIPlusClasses;

type
  TfrmFaturaComercialPetronas = class(TForm)
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
    rlExportador: TRLLabel;
    rldbExportadorNome: TRLDBText;
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
    RLPanel39: TRLPanel;
    rlNaladi: TRLLabel;
    RLPanel40: TRLPanel;
    rlPrecoUnitario: TRLLabel;
    RLPanel41: TRLPanel;
    rlSubtotalMercadoria: TRLLabel;
    rldbMoedaPrecoUnitario: TRLDBText;
    rldbMoedaPrecoTotal: TRLDBText;
    rlData: TRLDBText;
    rldbExportadoEndereco: TRLDBText;
    rldbExportadorCep: TRLDBText;
    rldbExportadorCNPJ: TRLDBText;
    rldbExportadorTelefone: TRLDBText;
    rlImportador: TRLLabel;
    rldbImportadorNome: TRLDBText;
    rldbImportadorPais: TRLDBText;
    RLPanel42: TRLPanel;
    RLPanel43: TRLPanel;
    RLPanel44: TRLPanel;
    RLPanel45: TRLPanel;
    RLPanel46: TRLPanel;
    RLPanel47: TRLPanel;
    RLPanel48: TRLPanel;
    RLPanel49: TRLPanel;
    rldbQtMercadoria: TRLDBText;
    rldbNCM: TRLDBText;
    rldbNALADI: TRLDBText;
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
    RLPanel20: TRLPanel;
    rldbTXEmbalagem: TRLDBMemo;
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
    RLPanel4: TRLPanel;
    RLPanel14: TRLPanel;
    rlConsignatario: TRLLabel;
    rldbConsigPais: TRLDBText;
    rldbConsigEndereco: TRLDBMemo;
    RLPanel15: TRLPanel;
    rlNotificado: TRLLabel;
    rldbNotiryPais: TRLDBText;
    rldbNotifyEndereco: TRLDBMemo;
    RLPanel16: TRLPanel;
    rlDadosBancarios: TRLLabel;
    rldbDadosBancarios: TRLDBMemo;
    RLPanel5: TRLPanel;
    RLPanel6: TRLPanel;
    rlTotFaturaComercial: TRLLabel;
    rlTotSubTotal: TRLLabel;
    rlTotDespesas: TRLLabel;
    rlTotDesconto: TRLLabel;
    rlTotTotalMLE: TRLLabel;
    rlTotFrete: TRLLabel;
    rlTotSeguro: TRLLabel;
    rlTotTotalMVC: TRLLabel;
    rlTotPesoLiquido: TRLLabel;
    rlTotPesoBruto: TRLLabel;
    rldbVLTotDespesa: TRLDBText;
    rldbVLDesconto: TRLDBText;
    rldbVLTotMLE: TRLDBText;
    rldbVLFreteTot: TRLDBText;
    rldbVLSeguroTot: TRLDBText;
    rldbVLSeg: TRLDBText;
    rldbVLPESOLiq: TRLDBText;
    rldbVLPesoBruto: TRLDBText;
    rldbVLTotFob: TRLDBText;
    rldbMoedaDespesas: TRLDBText;
    rldbMoedaDesconto: TRLDBText;
    rldbTotalMLE: TRLDBText;
    rldbTotalFrete: TRLDBText;
    rldbTotalSeguro: TRLDBText;
    rldbTotSeguro: TRLDBText;
    rldbMoedaSubTotal: TRLDBText;
    rldbCidadeOrigem: TRLDBText;
    rldbDescricaoFrete: TRLDBText;
    rldbIncoterm: TRLDBText;
    RLPanel7: TRLPanel;
    rldbExportNome2: TRLDBText;
    RLDraw2: TRLDraw;
    rlFirma: TRLLabel;
    RLBand6: TRLBand;
    RLPanel50: TRLPanel;
    RLPanel51: TRLPanel;
    RLPanel52: TRLPanel;
    RLPanel53: TRLPanel;
    RLPanel54: TRLPanel;
    RLPanel55: TRLPanel;
    RLPanel56: TRLPanel;
    RLPanel57: TRLPanel;
    rlgrupoFatura: TRLGroup;
    rldbNrFatura: TRLDBText;
    rldbConsigNome: TRLDBMemo;
    rldbNotifyEmpresa: TRLDBMemo;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    rldbPortoDestino: TRLDBMemo;
    RLDBMemo1: TRLDBMemo;
    RLLabel1: TRLLabel;
    RLDBText4: TRLDBText;
    RLDBMemo2: TRLDBMemo;
    RLReport2: TRLReport;
    RLImage1: TRLImage;
    RLReport3: TRLReport;
    RLImage2: TRLImage;
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
  frmFaturaComercialPetronas: TfrmFaturaComercialPetronas;

implementation

uses
  udatm_DocumentosExportacao , PGGP001, PGGP017;

{$R *.dfm}


function TfrmFaturaComercialPetronas.PrepararRelatorio(nrProcesso : string; idiomaRelatorio, tpFatura : integer) :Boolean;
begin
  idioma := idiomaRelatorio;
  tipoFatura := tpFatura;
  datm_DocumentosExportacao.qryFaturaComercial.Close;
  datm_DocumentosExportacao.cdsFaturaComercial.Close;
  datm_DocumentosExportacao.qryFaturaComercial.SQL.Text := datm_DocumentosExportacao.GetSQLFaturaComercial(nrProcesso, idioma, tcPetronas);
  datm_DocumentosExportacao.cdsFaturaComercial.open;

  result := datm_DocumentosExportacao.cdsFaturaComercial.recordCount > 0;
end;

procedure TfrmFaturaComercialPetronas.AbrirQueryItens;
begin
  datm_DocumentosExportacao.qryFaturaComercialItem.Close;
  datm_DocumentosExportacao.cdsFaturaComercialItem.Close;
  datm_DocumentosExportacao.qryFaturaComercialItem.Sql.Text :=
   datm_DocumentosExportacao.GetSQLFaturaComercialItens(datm_DocumentosExportacao.cdsFaturaComercial.FieldByName('NR_PROCESSO').asString,
                                                        datm_DocumentosExportacao.cdsFaturaComercial.FieldByName('NR_FATURA').asString);
  datm_DocumentosExportacao.cdsFaturaComercialItem.open;
end;

procedure TfrmFaturaComercialPetronas.rlSubDetailFaturaBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
   AbrirQueryItens;
end;

procedure TfrmFaturaComercialPetronas.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  try
  if datm_DocumentosExportacao.cdsFaturaComercial.FieldByName('PATH_LOGO').AsString <> '' then
    rlLogo.Picture.LoadFromFile( cDir_Rpt + '\' + Trim(datm_DocumentosExportacao.cdsFaturaComercial.FieldByName('PATH_LOGO').AsString));
  except on e : Exception do
  end;

  RLImage1.Left := 5;
  RLImage1.Top := 10;
  RLImage2.Left := 5;
  RLImage2.Top := 10;

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
    rlNaladi.caption                  := 'NALADI';
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
    rlDadosBancarios.caption          := 'DADOS BANCÁRIOS:';
    rlConsignatario.caption           := 'CONSIGNATARIO:';
    rlNotificado.caption              := 'NOTIFICADO:';
    lblFormaPagamento.caption         := 'FORMA DE PAGO:';
    rlRef.caption                     := 'L/C REF.NR.';
    lblVia.caption                    := 'VIA:';
    lblPaisDestino.caption            := 'PAÍS DE DESTINO:';
    lblPaisOrigem.caption             := 'PAÍS DE ORIGEN:';
    lblLocalDesembarque.caption       := 'LOCAL DE DESEMBARQUE / DESTINO:';
    lblLocalEmbarque.caption          := 'LOCAL DE EMBARQUE / ORIGEN: ';
    rlTotFaturaComercial.caption      := 'FACTURA PROFORMA :';
    rlTotSubTotal.caption             := 'SUB-TOTAL';
    rlTotDespesas.caption             := 'DESPESAS';
    rlTotDesconto.caption             := 'DESCUENTO';
    rlTotTotalMLE.caption             := 'TOTAL MLE';
    rlTotFrete.caption                := 'FLETE';
    rlTotSeguro.caption               := 'SEGURO';
    rlTotTotalMVC.caption             := 'TOTAL MCV';
    rlTotPesoLiquido.caption          := 'PESO NETO (KGS)';
    rlTotPesoBruto.caption            := 'PESO BRUTO ( KGS )';
    rlFirma.caption                   := 'FIRMA';

    rlData.DataField                  := 'CIDADE_DATA_ESPANHOL';
    rldbNotiryPais.DataField          := 'NOTIFY_PAIS_ESP';
    rldbConsigPais.DataField          := 'CONSIG_PAIS_ESP';
    rldbImportadorPais.DataField      := 'IMPORT_PAIS_ESP';
    rldbPaisDestino.DataField         := 'PAIS_DESTINO_ESP';
    rldbNmViaTransp.DataField         := 'NM_VIA_TRANSPORTE_ESP';
    rldbPortoDestino.DataField        := 'DS_PORTO_DESTINO_ESP';
    rldbMercadoria.DataField          := 'MERCADORIA_ESP';
    rldbEmbalagem.DataField           := 'UNIDADE_MEDIDA_ESP';

    RLImage1.Picture.LoadFromFile('Fat_petronas_esp1.jpg');
    RLImage2.Picture.LoadFromFile('Fat_petronas_esp2.jpg');

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
    rlNaladi.caption                  := 'NALADI';
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
    rlDadosBancarios.caption          := 'BANK DATA:';
    rlConsignatario.caption           := 'CONSIGNEE:';
    rlNotificado.caption              := 'NOTIFY:';
    lblFormaPagamento.caption         := 'PAYMENT FORM:';
    rlRef.caption                     := 'L/C REF.NR.';
    lblVia.caption                    := 'BY:';
    lblPaisDestino.caption            := 'COUNTRY OF DESTINY:';
    lblPaisOrigem.caption             := 'COUNTRY OF ORIGIN:';
    lblLocalDesembarque.caption       := 'PLACE OF DESTINY:';
    lblLocalEmbarque.caption          := 'PLACE OF SHIPPING: ';
    rlTotFaturaComercial.caption      := 'PROFORMA INVOICE:';
    rlTotSubTotal.caption             := 'SUB-TOTAL';
    rlTotDespesas.caption             := 'INCREASE';
    rlTotDesconto.caption             := 'DISCOUNT';
    rlTotTotalMLE.caption             := 'TOTAL MLE';
    rlTotFrete.caption                := 'FREIGHT';
    rlTotSeguro.caption               := 'INSURANCE';
    rlTotTotalMVC.caption             := 'TOTAL MCV';
    rlTotPesoLiquido.caption          := 'NET WEIGHT (KGS)';
    rlTotPesoBruto.caption            := 'GROSS WEIGHT ( KGS )';
    rlFirma.caption                   := 'SIGNATURE';


    rlData.DataField                  := 'CIDADE_DATA_INGLES';
    rldbNotiryPais.DataField          := 'NOTIFY_PAIS_ING';
    rldbConsigPais.DataField          := 'CONSIG_PAIS_ING';
    rldbImportadorPais.DataField      := 'IMPORT_PAIS_ING';
    rldbPaisDestino.DataField         := 'PAIS_DESTINO_ING';
    rldbNmViaTransp.DataField         := 'NM_VIA_TRANSPORTE_ING';
    rldbPortoDestino.DataField        := 'DS_PORTO_DESTINO_ING';
    rldbMercadoria.DataField          := 'MERCADORIA_ING';
    rldbEmbalagem.DataField           := 'UNIDADE_MEDIDA_ING';

    RLImage1.Picture.LoadFromFile('Fat_petronas_ing1.jpg');
    RLImage2.Picture.LoadFromFile('Fat_petronas_ing2.jpg');
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
    rlNaladi.caption                  := 'NALADI';
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
    rlDadosBancarios.caption          := 'DADOS BANCARIOS:';
    rlConsignatario.caption           := 'CONSIGNATARIO:';
    rlNotificado.caption              := 'NOTIFICADOR:';
    lblFormaPagamento.caption         := 'FORMA DE PAGAMENTO:';
    rlRef.caption                     := 'L/C REF.NR.';
    lblVia.caption                    := 'VIA:';
    lblPaisDestino.caption            := 'PAIS DE DESTINO:';
    lblPaisOrigem.caption             := 'PAIS DE ORIGEM:';
    lblLocalDesembarque.caption       := 'LOCAL DE DESEMBARQUE:';
    lblLocalEmbarque.caption          := 'LOCAL DE EMBARQUE: ';
    rlTotFaturaComercial.caption      := 'FATURA PROFORMA:';
    rlTotSubTotal.caption             := 'SUB-TOTAL';
    rlTotDespesas.caption             := 'ACRESCIMO';
    rlTotDesconto.caption             := 'DESCONTO';
    rlTotTotalMLE.caption             := 'TOTAL MLE';
    rlTotFrete.caption                := 'FRETE';
    rlTotSeguro.caption               := 'SEGURO';
    rlTotTotalMVC.caption             := 'TOTAL MCV';
    rlTotPesoLiquido.caption          := 'PESO LIQUIDO (KGS)';
    rlTotPesoBruto.caption            := 'PESO BRUTO ( KGS )';
    rlFirma.caption                   := 'ASSINATURA';


    rlData.DataField                  := 'CIDADE_DATA_PORTUGUES';
    rldbNotiryPais.DataField          := 'NOTIFY_PAIS_POR';
    rldbConsigPais.DataField          := 'CONSIG_PAIS_POR';
    rldbImportadorPais.DataField      := 'IMPORT_PAIS_POR';
    rldbPaisDestino.DataField         := 'PAIS_DESTINO_POR';
    rldbNmViaTransp.DataField         := 'NM_VIA_TRANSPORTE_POR';
    rldbPortoDestino.DataField        := 'DS_PORTO_DESTINO_POR';
    rldbMercadoria.DataField          := 'MERCADORIA_POR';
    rldbEmbalagem.DataField           := 'UNIDADE_MEDIDA_POR';    
  end;
end;

end.

