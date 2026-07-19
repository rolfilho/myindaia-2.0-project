unit uPackingListPetronas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, RLFilters, RLPDFFilter, dxGDIPlusClasses;

type
  TfrmPackingListPetronas = class(TForm)
    RLReport1: TRLReport;
    rlHeader: TRLBand;
    rlLogo: TRLImage;
    RLPDFFilter1: TRLPDFFilter;
    rlPackingList: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    rlGrupoProcesso: TRLGroup;
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
    RLPanel40: TRLPanel;
    rlPrecoUnitario: TRLLabel;
    RLPanel41: TRLPanel;
    rlSubtotalMercadoria: TRLLabel;
    RLPanel42: TRLPanel;
    RLPanel43: TRLPanel;
    RLPanel44: TRLPanel;
    RLPanel45: TRLPanel;
    RLPanel48: TRLPanel;
    RLPanel49: TRLPanel;
    rldbQtMercadoria: TRLDBText;
    rldbValorUnitario: TRLDBText;
    rldbVlTotItem: TRLDBText;
    rldbMercadoria: TRLDBMemo;
    rldbEmbalagem: TRLDBText;
    rldbCodigoMercadoria: TRLDBText;
    RLBand4: TRLBand;
    RLPanel1: TRLPanel;
    rlgrupoFatura: TRLGroup;
    RLPanel58: TRLPanel;
    rldbNrFatura: TRLDBText;
    rlNumeroFatura: TRLLabel;
    RLPanel59: TRLPanel;
    RLPanel60: TRLPanel;
    rlImportador: TRLLabel;
    rldbImportadorNome: TRLDBText;
    rldbImportadorEndereco: TRLDBText;
    rldbImportadorPais: TRLDBText;
    RLPanel61: TRLPanel;
    rlExportador: TRLLabel;
    rldbExportadorNome: TRLDBText;
    rldbExportadoEndereco: TRLDBText;
    rldbExportadorCep: TRLDBText;
    rldbExportadorCNPJ: TRLDBText;
    rldbExportadorTelefone: TRLDBText;
    RLPanel62: TRLPanel;
    RLPanel63: TRLPanel;
    RLPanel64: TRLPanel;
    RLPanel65: TRLPanel;
    RLPanel66: TRLPanel;
    rlFaturaComercial: TRLLabel;
    lblVia: TRLLabel;
    lblLocalEmbarque: TRLLabel;
    lblLocalDesembarque: TRLLabel;
    rldbNumFat: TRLDBText;
    rldbNmViaTransp: TRLDBText;
    rldbPortoDestino: TRLDBText;
    rldbPortoOrigem: TRLDBText;
    RLPanel2: TRLPanel;
    lblData: TRLLabel;
    rlData: TRLDBText;
    RLPanel3: TRLPanel;
    rlEmbalagens: TRLLabel;
    RLDBMemo1: TRLDBMemo;
    lblPesoLiquido: TRLLabel;
    rldbPesoLiquido: TRLDBText;
    lblPesoBruto: TRLLabel;
    rldbPesoBruto: TRLDBText;
    RLPanel4: TRLPanel;
    rlFirma: TRLLabel;
    RLLabel2: TRLLabel;
    RLDBText1: TRLDBText;
    RLLabel1: TRLLabel;
    RLDBText4: TRLDBText;
    procedure rlSubDetailFaturaBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    idioma : integer;
  procedure AbrirQueryItens;    
  public
    { Public declarations }
  function PrepararRelatorio(nrProcesso : string; idiomaRelatorio : integer) :Boolean;
  end;

var
  frmPackingListPetronas: TfrmPackingListPetronas;

implementation

uses
  udatm_DocumentosExportacao , PGGP001, PGGP017;

{$R *.dfm}


function TfrmPackingListPetronas.PrepararRelatorio(nrProcesso : string; idiomaRelatorio : integer) :Boolean;
begin
  idioma := idiomaRelatorio;
  datm_DocumentosExportacao.qryPackingList.Close;
  datm_DocumentosExportacao.cdsPackingList.Close;
  datm_DocumentosExportacao.qryPackingList.SQL.Text := datm_DocumentosExportacao.GetSQLPackingList(nrProcesso);
  datm_DocumentosExportacao.cdsPackingList.open;

  result := datm_DocumentosExportacao.cdsPackingList.recordCount > 0;
end;

procedure TfrmPackingListPetronas.AbrirQueryItens;
begin
  datm_DocumentosExportacao.qryPackingListItem.Close;
  datm_DocumentosExportacao.cdsPackingListItem.Close;
  datm_DocumentosExportacao.qryPackingListItem.Sql.Text :=
   datm_DocumentosExportacao.GetSQLPackingListItens(datm_DocumentosExportacao.cdsPackingList.FieldByName('NR_PROCESSO').asString,
                                                        datm_DocumentosExportacao.cdsPackingList.FieldByName('NR_FATURA').asString);
  datm_DocumentosExportacao.cdsPackingListItem.open;
end;

procedure TfrmPackingListPetronas.rlSubDetailFaturaBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
   AbrirQueryItens;
end;

procedure TfrmPackingListPetronas.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  try
  if datm_DocumentosExportacao.cdsPackingList.FieldByName('PATH_LOGO').AsString <> '' then
    rlLogo.Picture.LoadFromFile( cDir_Rpt + '\' + Trim(datm_DocumentosExportacao.cdsPackingList.FieldByName('PATH_LOGO').AsString));
  except on e : Exception do
  end;

  if idioma = ID_ESPANHOL then
  begin
    rlNumeroFatura.caption            := 'Numero';
    rlPackingList.caption             := 'Lista de Empaque';
    rlFaturaComercial.caption         := 'Factura Comercial';
    lblVia.caption                    := 'Medio de Transporte';
    lblLocalEmbarque.caption          := 'Local de Embarque';
    lblLocalDesembarque.caption       := 'Local de Desembarque';
    rlExportador.caption              := 'Exportador:';
    rlImportador.caption              := 'Importador:';
    rlQuantidade.caption              := 'Cantidad';
    rlEmabalagem.caption              := 'Embalaje';
    rlCodigo.caption                  := 'Codigo';
    rlDescricaoMercadoria.caption     := 'Descripcion de la Mercancia';
    rlEmbalagens.caption              := 'Marcacion:';
    lblData.caption                   := 'Fecha:';
    lblPesoLiquido.caption            := 'PESO NETO (KG):';
    lblPesoBruto.caption              := 'PESO BRUTO (KG):';
    rlFirma.caption                   := 'FIRMA';


    rlData.DataField                  := 'CIDADE_DATA_ESPANHOL';
    rldbImportadorPais.DataField      := 'IMPORT_PAIS_ESP';
    rldbNmViaTransp.DataField         := 'NM_VIA_TRANSPORTE_ESP';
    rldbPortoDestino.DataField        := 'DS_PORTO_DESTINO_ESP';
    rldbMercadoria.DataField          := 'MERCADORIA_ESP';
    rldbEmbalagem.DataField           := 'UNIDADE_MEDIDA_ESP';
  end
  else
  if idioma = ID_INGLES then
  begin
    rlNumeroFatura.caption            := 'Number';
    rlPackingList.caption             := 'Packing List';
    rlFaturaComercial.caption         := 'Proforma Invoice';
    lblVia.caption                    := 'By';
    lblLocalEmbarque.caption          := 'Place of Shipping';
    lblLocalDesembarque.caption       := 'Place of Destiny';
    rlExportador.caption              := 'Exporter:';
    rlImportador.caption              := 'Importer:';
    rlQuantidade.caption              := 'Quantity';
    rlEmabalagem.caption              := 'Packing';
    rlCodigo.caption                  := 'Code';
    rlDescricaoMercadoria.caption     := 'Description';
    rlEmbalagens.caption              := 'Volume:';
    lblData.caption                   := 'Date:';
    lblPesoLiquido.caption            := 'Net Weight (KG):';
    lblPesoBruto.caption              := 'Gross Weight (KG):';
    rlFirma.caption                   := 'Signature';

    rlData.DataField                  := 'CIDADE_DATA_INGLES';
    rldbImportadorPais.DataField      := 'IMPORT_PAIS_ING';
    rldbNmViaTransp.DataField         := 'NM_VIA_TRANSPORTE_ING';
    rldbPortoDestino.DataField        := 'DS_PORTO_DESTINO_ING';
    rldbMercadoria.DataField          := 'MERCADORIA_ING';
    rldbEmbalagem.DataField           := 'UNIDADE_MEDIDA_ING';
  end
  else
  if idioma = ID_PORTUGUES Then
  begin
    rlNumeroFatura.caption            := 'Número';
    rlPackingList.caption             := 'Packing List';
    rlFaturaComercial.caption         := 'Fatura Comercial';
    lblVia.caption                    := 'Meio de Transporte';
    lblLocalEmbarque.caption          := 'Local de Embarque';
    lblLocalDesembarque.caption       := 'Local de Desembarque';
    rlExportador.caption              := 'Exportador:';
    rlImportador.caption              := 'Importador:';
    rlQuantidade.caption              := 'Quantidade';
    rlEmabalagem.caption              := 'Embalagem';
    rlCodigo.caption                  := 'Código';
    rlDescricaoMercadoria.caption     := 'Descrição';
    rlEmbalagens.caption              := 'Embalagem:';
    lblData.caption                   := 'Data:';
    lblPesoLiquido.caption            := 'Peso Liquido (KG):';
    lblPesoBruto.caption              := 'Peso Bruto (KG):';
    rlFirma.caption                   := 'Assinatura';

    rlData.DataField                  := 'CIDADE_DATA_PORTUGUES';
    rldbImportadorPais.DataField      := 'IMPORT_PAIS_POR';
    rldbNmViaTransp.DataField         := 'NM_VIA_TRANSPORTE_POR';
    rldbPortoDestino.DataField        := 'DS_PORTO_DESTINO_POR';
    rldbMercadoria.DataField          := 'MERCADORIA_POR';
    rldbEmbalagem.DataField           := 'UNIDADE_MEDIDA_POR';    
  end;
end;

end.
