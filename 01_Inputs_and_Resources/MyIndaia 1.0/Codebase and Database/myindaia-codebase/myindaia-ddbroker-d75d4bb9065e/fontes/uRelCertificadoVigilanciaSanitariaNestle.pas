unit uRelCertificadoVigilanciaSanitariaNestle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, dxGDIPlusClasses, RLFilters, RLPDFFilter, RLRichFilter;

type
  TfrmRelCertificadoVigilanciaSanitariaNestle = class(TForm)
    RLReport1: TRLReport;
    rlHeader: TRLBand;
    RLImage1: TRLImage;
    RLLabel1: TRLLabel;
    rldetail: TRLBand;
    RLPanel1: TRLPanel;
    rlCertificadoDeVenda: TRLLabel;
    RLPanel2: TRLPanel;
    RLPanel3: TRLPanel;
    RLPanel4: TRLPanel;
    RLPanel5: TRLPanel;
    RLPanel6: TRLPanel;
    RLPanel7: TRLPanel;
    RLPanel8: TRLPanel;
    RLPanel11: TRLPanel;
    RLPanel12: TRLPanel;
    RLPanel13: TRLPanel;
    RLPanel9: TRLPanel;
    RLPanel10: TRLPanel;
    rlConsignatario: TRLLabel;
    RLPanel14: TRLPanel;
    RLPanel15: TRLPanel;
    RLPanel16: TRLPanel;
    RLPanel17: TRLPanel;
    RLPanel18: TRLPanel;
    RLPanel19: TRLPanel;
    RLPanel20: TRLPanel;
    RLPanel21: TRLPanel;
    rlImportador: TRLLabel;
    rlPaisOrigem: TRLLabel;
    rlPaisDestino: TRLLabel;
    rlLocalDesembarque: TRLLabel;
    rlLocaldeEmbarque: TRLLabel;
    rlViaTransporte: TRLLabel;
    rlArmazenagem: TRLLabel;
    rlIdentificacao: TRLLabel;
    rlInfoFabricante: TRLLabel;
    rlFabricanteNome: TRLLabel;
    rlFabricanteEndereco: TRLLabel;
    rlFabricanteLicenca: TRLLabel;
    rlFabricanteCNPJ: TRLLabel;
    rlIdProdutos: TRLLabel;
    rldbExportador: TRLDBText;
    rldbImportador: TRLDBText;
    rldbPaisOrigem: TRLDBText;
    rldbDestinoFinal: TRLDBText;
    rldbPortoEmbarque: TRLDBText;
    rldbPortoDesembarque: TRLDBText;
    rldbViaTransporte: TRLDBText;
    rldbLicencaSanitaria: TRLDBText;
    rldbFabricanteCNPJ: TRLDBText;
    DetailInglesEspanhol: TRLSubDetail;
    RLPDFFilter1: TRLPDFFilter;
    GrupoProcesso: TRLGroup;
    titulosInglesEspanhol: TRLBand;
    RLPanel22: TRLPanel;
    RLPanel23: TRLPanel;
    rlDescricaoProdutos: TRLLabel;
    RLPanel24: TRLPanel;
    RLPanel25: TRLPanel;
    RLPanel26: TRLPanel;
    rlLote: TRLLabel;
    RLPanel27: TRLPanel;
    rlQuantidade: TRLLabel;
    itensInglesEspanhol: TRLBand;
    RLPanel28: TRLPanel;
    rldbMercadoria: TRLDBMemo;
    RLPanel50: TRLPanel;
    RLPanel51: TRLPanel;
    RLPanel31: TRLPanel;
    RLPanel32: TRLPanel;
    rldbCertificacao: TRLDBMemo;
    rldbEmbalagem: TRLDBMemo;
    rldbLote: TRLDBMemo;
    rldbQtMercadoria: TRLDBMemo;
    rldbImportadorEnderenco: TRLDBMemo;
    rlRodape: TRLBand;
    RLImage2: TRLImage;
    rlFooter: TRLBand;
    RLPanel33: TRLPanel;
    rlDeclaracao: TRLLabel;
    RLPanel34: TRLPanel;
    RLPanel35: TRLPanel;
    rlName: TRLLabel;
    RLPanel41: TRLPanel;
    rlCargo: TRLLabel;
    RLPanel36: TRLPanel;
    RLPanel38: TRLPanel;
    rlDataEmissao: TRLLabel;
    RLPanel39: TRLPanel;
    rlDataVencimento: TRLLabel;
    RLPanel40: TRLPanel;
    rlAutoridadeCompetente: TRLLabel;
    RLPanel37: TRLPanel;
    rlAnexos: TRLLabel;
    rldbCondicaoTransporte: TRLDBMemo;
    rldbIdentificacao: TRLDBMemo;
    DetailColombia: TRLSubDetail;
    ItensColombia: TRLBand;
    titulosColombia: TRLBand;
    RLPanel42: TRLPanel;
    RLPanel43: TRLPanel;
    rlDescricaoMercColombia: TRLMemo;
    RLPanel44: TRLPanel;
    rlCertificadoParaColombia: TRLMemo;
    RLPanel45: TRLPanel;
    rlEmbalagemColombia: TRLMemo;
    RLPanel46: TRLPanel;
    rlFabricacaoColombia: TRLMemo;
    RLPanel47: TRLPanel;
    rlVencimentoColombia: TRLMemo;
    RLPanel53: TRLPanel;
    rlLoteColombia: TRLMemo;
    RLPanel54: TRLPanel;
    rlQuantidadeColombia: TRLMemo;
    RLPanel48: TRLPanel;
    rldbMercadoriaColombia: TRLDBMemo;
    RLPanel29: TRLPanel;
    rldbCertificacaoColombia: TRLDBMemo;
    RLPanel30: TRLPanel;
    rldbEmbalagemColombia: TRLDBMemo;
    RLPanel49: TRLPanel;
    rldbFabricante: TRLDBMemo;
    rldbFabricanteEndereco: TRLDBMemo;
    RLPanel52: TRLPanel;
    RLPanel55: TRLPanel;
    RLPanel56: TRLPanel;
    rldbLoteColombia: TRLDBMemo;
    rldbDataFabricacaoColombia: TRLDBMemo;
    rldbDataVencimentoColombia: TRLDBMemo;
    rldbQuantidadeColombia: TRLDBMemo;
    RLRichFilter1: TRLRichFilter;
    rlCertificacaoPara: TRLMemo;
    rldbMarcas: TRLDBMemo;
    rldbMarcasColombia: TRLDBMemo;
    RLPanel57: TRLPanel;
    rlMarcacaoVolume: TRLMemo;
    RLPanel58: TRLPanel;
    rldbMarcacaoVolume: TRLDBMemo;
    rlTipoEmbalagem: TRLMemo;
    rldbExportadorEndereco: TRLDBMemo;
    procedure DetailInglesEspanholBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure DetailColombiaBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure rldbMercadoriaColombiaBeforePrint(Sender: TObject; var AText: String;
      var PrintIt: Boolean);
    procedure rldbMercadoriaBeforePrint(Sender: TObject; var AText: String;
      var PrintIt: Boolean);
    procedure rldbMercadoriaColombiaAfterPrint(Sender: TObject);
    procedure rldbMercadoriaAfterPrint(Sender: TObject);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    idioma : integer;
  procedure AbrirQueryItens;
  procedure CalcularTamanhoDetail;
  procedure CalcularTamanhoDetailColombia;
  public
    { Public declarations }
  function PrepararRelatorio(nrProcesso : string; idiomaRelatorio : integer) :Boolean;
  end;

  const
  I_INGLES = 0;
  I_ESPANHOL = 1;
  I_ESP_COLOMBIA = 2;

var
  frmRelCertificadoVigilanciaSanitariaNestle: TfrmRelCertificadoVigilanciaSanitariaNestle;

implementation

uses
  datm_RelatoriosNestle;

{$R *.dfm}

function TfrmRelCertificadoVigilanciaSanitariaNestle.PrepararRelatorio(nrProcesso : string; idiomaRelatorio : integer) :Boolean;
begin
  idioma := idiomaRelatorio;
  datm_RelatorioNestle.cdsCertificadoVigilanciaS.Close;
  datm_RelatorioNestle.qryCertificadoVigilanciaS.SQL.Text := datm_RelatorioNestle.GetSqlCertificadoLicencaSanitaria(nrProcesso);
  datm_RelatorioNestle.cdsCertificadoVigilanciaS.open;

  result := datm_RelatorioNestle.cdsCertificadoVigilanciaS.recordCount > 0;
end;

procedure TfrmRelCertificadoVigilanciaSanitariaNestle.DetailInglesEspanholBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  if idioma = I_ESP_COLOMBIA then
    PrintIt := false
  else
    AbrirQueryItens;
end;

procedure TfrmRelCertificadoVigilanciaSanitariaNestle.AbrirQueryItens;
begin
    datm_RelatorioNestle.cdsCertificadoVigilanciaSItem.Close;
    datm_RelatorioNestle.qryCertificadoVigilanciaSItem.Sql.Text := datm_RelatorioNestle.GetSqlCertificadoLicencaSanitariaItem(datm_RelatorioNestle.cdsCertificadoVigilanciaS.FieldByName('NR_PROCESSO').asString);
    datm_RelatorioNestle.cdsCertificadoVigilanciaSItem.open;
end;

procedure TfrmRelCertificadoVigilanciaSanitariaNestle.DetailColombiaBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  if idioma <> I_ESP_COLOMBIA then
    PrintIt := false
  else
    AbrirQueryItens;
end;

procedure TfrmRelCertificadoVigilanciaSanitariaNestle.rldbMercadoriaColombiaBeforePrint(
  Sender: TObject; var AText: String; var PrintIt: Boolean);
begin
  AText := datm_RelatorioNestle.IncluirEspaco(AText,17);
end;

procedure TfrmRelCertificadoVigilanciaSanitariaNestle.rldbMercadoriaBeforePrint(
  Sender: TObject; var AText: String; var PrintIt: Boolean);
begin
  AText := datm_RelatorioNestle.IncluirEspaco(AText,17);
end;

procedure TfrmRelCertificadoVigilanciaSanitariaNestle.rldbMercadoriaColombiaAfterPrint(
  Sender: TObject);
begin
  CalcularTamanhoDetailColombia;
end;

procedure TfrmRelCertificadoVigilanciaSanitariaNestle.CalcularTamanhoDetail;
  var maxHeight : integer;
begin
  maxHeight := 0;

  if maxHeight < rldbMercadoria.Height + rldbMarcas.Height then
    maxHeight := rldbMercadoria.Height + rldbMarcas.Height;

  if maxHeight < rldbCertificacao.Height then
    maxHeight := rldbCertificacao.Height;

  if maxHeight < rldbEmbalagem.Height then
    maxHeight := rldbEmbalagem.Height;

  if maxHeight < rldbLote.Height then
    maxHeight := rldbLote.Height;

  if maxHeight < rldbQtMercadoria.Height then
    maxHeight := rldbQtMercadoria.Height;

  if maxHeight < rldbMarcacaoVolume.Height then
    maxHeight := rldbMarcacaoVolume.Height;

  itensInglesEspanhol.Height :=  maxHeight + 2;
  rldbMarcas.top := rldbMercadoria.top + rldbMercadoria.Height + 2;
end;

procedure TfrmRelCertificadoVigilanciaSanitariaNestle.CalcularTamanhoDetailColombia;
  var maxHeight : integer;
begin
  maxHeight := 0;

  if maxHeight < rldbMercadoriaColombia.Height + rldbMarcasColombia.Height then
    maxHeight := rldbMercadoriaColombia.Height + rldbMarcasColombia.Height;

  if maxHeight < rldbCertificacaoColombia.Height then
    maxHeight := rldbCertificacaoColombia.Height;

  if maxHeight < rldbEmbalagemColombia.Height then
    maxHeight := rldbEmbalagemColombia.Height;

  if maxHeight < rldbDataFabricacaoColombia.Height then
    maxHeight := rldbDataFabricacaoColombia.Height;

  if maxHeight < rldbDataVencimentoColombia.Height then
    maxHeight := rldbDataVencimentoColombia.Height;

  if maxHeight < rldbLoteColombia.Height then
    maxHeight := rldbLoteColombia.Height;

  if maxHeight < rldbQuantidadeColombia.Height then
    maxHeight := rldbQuantidadeColombia.Height;

  ItensColombia.Height :=  maxHeight + 2;

  rldbMarcasColombia.top := rldbMercadoriaColombia.top + rldbMercadoriaColombia.Height + 2;
end;
procedure TfrmRelCertificadoVigilanciaSanitariaNestle.rldbMercadoriaAfterPrint(
  Sender: TObject);
begin
  CalcularTamanhoDetail;
end;

procedure TfrmRelCertificadoVigilanciaSanitariaNestle.RLReport1BeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  if idioma = I_INGLES then
  begin
    rldbDestinoFinal.DataField         := 'DESTINO_FINAL_ING';
    rldbViaTransporte.DataField        := 'NM_VIA_TRANSPORTE_ING';
    rldbCondicaoTransporte.DataField   := 'CONDICAO_TRANSPORTE_ING';
    rldbMercadoria.DataField           := 'MERCADORIA_ING';
    rldbMarcas.DataField               := 'MARCA_ING';
    rldbCertificacao.DataField         := 'CERTIFICADO_PARA_ING';
    rldbMarcacaoVolume.DataField       := 'TX_MARCACAO_VOLUME';
    rldbEmbalagem.DataField            := 'UNIDADE_MEDIDA_ING';
    rldbMercadoriaColombia.DataField   := 'MERCADORIA_ESP';
    rldbEmbalagemColombia.DataField    := 'UNIDADE_MEDIDA_ESP';
    rldbCertificacaoColombia.DataField := 'CERTIFICADO_PARA_ESP';
    rldbMarcasColombia.DataField       := 'MARCA_ESP';

    rlCertificadoDeVenda.caption    := 'FREE SALES CERTIFICATE FOR FOOD EXPORTS (CVLEA) - Nº:';
    rlConsignatario.caption         := 'Consignor/Exporter:';
    rlImportador.caption            := 'Consignee/Importer (name and address):';
    rlPaisOrigem.caption            := 'Country of origin:';
    rlPaisDestino.caption           := 'Country of destination:';
    rlLocaldeEmbarque.caption       := 'Place of loading from the country of origin:';
    rlLocalDesembarque.caption      := 'Point of entry of destination country:';
    rlViaTransporte.caption         := 'Means of transport:';
    rlArmazenagem.caption           := 'Conditions for transport/storage: ';
    rlIdentificacao.caption         := 'Identification of the commodities:';
    rlInfoFabricante.caption        := 'Manufacturer''s identification';
    rlFabricanteNome.caption        := 'Corporate name:';
    rlFabricanteLicenca.caption     := 'Operating License:';
    rlFabricanteEndereco.caption    := 'Address:';
    rlFabricanteCNPJ.caption        := 'Tax id number (CNPJ):';
    rlIdProdutos.caption            := 'Identification of the products:';
    rlDescricaoProdutos.caption     := 'Description of products:';
    rlCertificacaoPara.caption      := 'Products certified for:';
    rlMarcacaoVolume.caption        := 'Marks:';
    rlTipoEmbalagem.caption         := 'Type of packaging:';
    rlLote.caption                  := 'Batch Number:';
    rlQuantidade.caption            := 'Quantity:';
    rlDeclaracao.caption            := 'Declaration';
    rlName.caption                  := 'Name';
    rlCargo.caption                 := 'Qualification and title:';
    rlDataEmissao.caption           := 'Issue Date';
    rlDataVencimento.caption        := 'Expiration date:';
    rlAutoridadeCompetente.caption  := 'Competent authority:';
    rlAnexos.caption                := 'Attachments:';
  end
  else
  begin
    rldbDestinoFinal.DataField         := 'DESTINO_FINAL_ESP';
    rldbViaTransporte.DataField        := 'NM_VIA_TRANSPORTE_ESP';
    rldbCondicaoTransporte.DataField   := 'CONDICAO_TRANSPORTE_ESP';
    rldbMercadoria.DataField           := 'MERCADORIA_ESP';
    rldbMarcas.DataField               := 'MARCA_ESP';
    rldbCertificacao.DataField         := 'CERTIFICADO_PARA_ESP';
    rldbMarcacaoVolume.DataField       := 'TX_MARCACAO_VOLUME';
    rldbEmbalagem.DataField            := 'UNIDADE_MEDIDA_ESP';
    rldbMercadoriaColombia.DataField   := 'MERCADORIA_ESP';
    rldbEmbalagemColombia.DataField    := 'UNIDADE_MEDIDA_ESP';
    rldbCertificacaoColombia.DataField := 'CERTIFICADO_PARA_ESP';
    rldbMarcasColombia.DataField       := 'MARCA_ESP';

    rlCertificadoDeVenda.caption    := 'CERTIFICADO DE VENTA LIBRE PARA EXPORTACIÓN DE ALIMENTOS (CVLEA) - Nº:';
    rlConsignatario.caption         := 'Expedidor:';
    rlImportador.caption            := 'Importador (nombre y dirección):';
    rlPaisOrigem.caption            := 'País de Origen:';
    rlPaisDestino.caption           := 'País de Destino:';
    rlLocaldeEmbarque.caption       := 'Punto de salida do país de origen:';
    rlLocalDesembarque.caption      := 'Punto de entrada en país de destino: ';
    rlViaTransporte.caption         := 'Medios de transpuerte:';
    rlArmazenagem.caption           := 'Condiciones de transporte/acondicionamento: ';
    rlIdentificacao.caption         := 'Identificación de la mercancia:';
    rlInfoFabricante.caption        := 'Identificacióndel fabricante';
    rlFabricanteNome.caption        := 'RazónSocial:';
    rlFabricanteLicenca.caption     := 'Licencia Sanitaria:';
    rlFabricanteEndereco.caption    := 'Dirección:';
    rlFabricanteCNPJ.caption        := 'Registro Nacional de Persona Jurídica (CNPJ):';
    rlIdProdutos.caption            := 'Identificación de los productos';
    rlDescricaoProdutos.caption     := 'Nombre del lo producto:';
    rlCertificacaoPara.caption      := 'Producto certificado para:';
    rlMarcacaoVolume.caption        := 'Marks:';
    rlTipoEmbalagem.caption         := 'Tipo de embalaje:';
    rlLote.caption                  := 'Lote:';
    rlQuantidade.caption            := 'Cantidad:';
    rlDeclaracao.caption            := 'Declaraciones';
    rlName.caption                  := 'Nombre:';
    rlCargo.caption                 := 'Cualificación y cargo:';
    rlDataEmissao.caption           := 'Fecha de emisión:';
    rlDataVencimento.caption        := 'Fecha de validez:';
    rlAutoridadeCompetente.caption  := 'Autoridad competente:';
    rlAnexos.caption                := 'Adjuntos:';
  end;
end;

end.
