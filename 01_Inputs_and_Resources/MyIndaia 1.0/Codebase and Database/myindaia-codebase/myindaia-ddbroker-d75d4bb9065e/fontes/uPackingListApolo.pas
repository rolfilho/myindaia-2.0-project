unit uPackingListApolo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, RLFilters, RLPDFFilter, dxGDIPlusClasses;

type
  TfrmPackingListApolo = class(TForm)
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
    RLPanel43: TRLPanel;
    RLPanel44: TRLPanel;
    RLPanel45: TRLPanel;
    RLPanel48: TRLPanel;
    RLPanel49: TRLPanel;
    rldbValorUnitario: TRLDBText;
    rldbVlTotItem: TRLDBText;
    rldbMercadoria: TRLDBMemo;
    rldbEmbalagem: TRLDBText;
    rldbCodigoMercadoria: TRLDBText;
    RLBand4: TRLBand;
    rlgrupoFatura: TRLGroup;
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
    RLPanel3: TRLPanel;
    rlEmbalagens: TRLLabel;
    RLDBMemo1: TRLDBMemo;
    RLPanel5: TRLPanel;
    rldbNmViaTransp: TRLDBText;
    lblModal: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel6: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel5: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText3: TRLDBText;
    rldbNumFat: TRLDBText;
    rlFaturaComercial: TRLLabel;
    RLDBText2: TRLDBText;
    RLLabel3: TRLLabel;
    rldbPortoDestino: TRLDBText;
    lblLocalDesembarque: TRLLabel;
    rldbPortoOrigem: TRLDBText;
    lblLocalEmbarque: TRLLabel;
    RLPanel6: TRLPanel;
    RLLabel1: TRLLabel;
    RLDBText4: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLPanel7: TRLPanel;
    RLDBText9: TRLDBText;
    RLPanel8: TRLPanel;
    RLLabel7: TRLLabel;
    RLPanel9: TRLPanel;
    RLDBText10: TRLDBText;
    RLPanel10: TRLPanel;
    RLLabel8: TRLLabel;
    rldbPesoLiquido: TRLDBText;
    rldbPesoBruto: TRLDBText;
    lblPesoLiquido: TRLLabel;
    lblPesoBruto: TRLLabel;
    RLDraw1: TRLDraw;
    RLLabel2: TRLLabel;
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
  frmPackingListApolo: TfrmPackingListApolo;

implementation

uses
  udatm_DocumentosExportacao , PGGP001, PGGP017;

{$R *.dfm}


function TfrmPackingListApolo.PrepararRelatorio(nrProcesso : string; idiomaRelatorio : integer) :Boolean;
begin
  idioma := idiomaRelatorio;
  datm_DocumentosExportacao.qryPackingList.Close;
  datm_DocumentosExportacao.cdsPackingList.Close;
  datm_DocumentosExportacao.qryPackingList.SQL.Text := datm_DocumentosExportacao.GetSQLPackingList(nrProcesso);
  datm_DocumentosExportacao.cdsPackingList.open;

  result := datm_DocumentosExportacao.cdsPackingList.recordCount > 0;
end;

procedure TfrmPackingListApolo.AbrirQueryItens;
begin
  datm_DocumentosExportacao.qryPackingListItem.Close;
  datm_DocumentosExportacao.cdsPackingListItem.Close;
  datm_DocumentosExportacao.qryPackingListItem.Sql.Text :=
   datm_DocumentosExportacao.GetSQLPackingListItens(datm_DocumentosExportacao.cdsPackingList.FieldByName('NR_PROCESSO').asString,
                                                        datm_DocumentosExportacao.cdsPackingList.FieldByName('NR_FATURA').asString);
  datm_DocumentosExportacao.cdsPackingListItem.open;
end;

procedure TfrmPackingListApolo.rlSubDetailFaturaBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
   AbrirQueryItens;
end;

procedure TfrmPackingListApolo.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  try
  //if datm_DocumentosExportacao.cdsPackingList.FieldByName('PATH_LOGO').AsString <> '' then
//    rlLogo.Picture.LoadFromFile( cDir_Rpt + '\' + Trim(datm_DocumentosExportacao.cdsPackingList.FieldByName('PATH_LOGO').AsString));
    rlLogo.Picture.LoadFromFile('C:\Apolo.png');
  except on e : Exception do
  end;

  if idioma = ID_ESPANHOL then
  begin
//    rlNumeroFatura.caption            := 'Numero';
    rlPackingList.caption             := 'Lista de Empaque';
    rlFaturaComercial.caption         := 'Factura Comercial';
    lblLocalEmbarque.caption          := 'Local de Embarque';
    lblLocalDesembarque.caption       := 'Local de Desembarque';
    rlExportador.caption              := 'Exportador:';
    rlImportador.caption              := 'Importador:';
//    rlQuantidade.caption              := 'Cantidad';
    rlEmabalagem.caption              := 'Embalaje';
    rlCodigo.caption                  := 'Codigo';
    rlDescricaoMercadoria.caption     := 'Descripcion de la Mercancia';
    rlEmbalagens.caption              := 'Marcacion:';
    lblPesoLiquido.caption            := 'PESO NETO:';
    lblPesoBruto.caption              := 'PESO BRUTO:';


    rldbImportadorPais.DataField      := 'IMPORT_PAIS_ESP';
    rldbPortoDestino.DataField        := 'DS_PORTO_DESTINO_ESP';
    rldbMercadoria.DataField          := 'MERCADORIA_ESP';
    rldbEmbalagem.DataField           := 'UNIDADE_MEDIDA_ESP';
  end
  else
  if idioma = ID_INGLES then
  begin
//    rlNumeroFatura.caption            := 'Number';
    rlPackingList.caption             := 'Packing List';
    rlFaturaComercial.caption         := 'Proforma Invoice';
    lblLocalEmbarque.caption          := 'Place of Shipping';
    lblLocalDesembarque.caption       := 'Place of Destiny';
    rlExportador.caption              := 'Exporter:';
    rlImportador.caption              := 'Importer:';
//    rlQuantidade.caption              := 'Quantity';
    rlEmabalagem.caption              := 'Packing';
    rlCodigo.caption                  := 'Code';
    rlDescricaoMercadoria.caption     := 'Description';
    rlEmbalagens.caption              := 'Volume:';
    lblPesoLiquido.caption            := 'Net Weight:';
    lblPesoBruto.caption              := 'Gross Weight:';

    rldbImportadorPais.DataField      := 'IMPORT_PAIS_ING';
    rldbPortoDestino.DataField        := 'DS_PORTO_DESTINO_ING';
    rldbMercadoria.DataField          := 'MERCADORIA_ING';
    rldbEmbalagem.DataField           := 'UNIDADE_MEDIDA_ING';
  end
  else
  if idioma = ID_PORTUGUES Then
  begin
//    rlNumeroFatura.caption            := 'Número';
    rlPackingList.caption             := 'Packing List';
    rlFaturaComercial.caption         := 'Fatura Comercial';
    lblLocalEmbarque.caption          := 'Local de Embarque';
    lblLocalDesembarque.caption       := 'Local de Desembarque';
    rlExportador.caption              := 'Exportador:';
    rlImportador.caption              := 'Importador:';
//    rlQuantidade.caption              := 'Quantidade';
    rlEmabalagem.caption              := 'Embalagem';
    rlCodigo.caption                  := 'Código';
    rlDescricaoMercadoria.caption     := 'Descrição';
    rlEmbalagens.caption              := 'Embalagem:';
    lblPesoLiquido.caption            := 'Peso Liquido:';
    lblPesoBruto.caption              := 'Peso Bruto:';

    rldbImportadorPais.DataField      := 'IMPORT_PAIS_POR';
    rldbPortoDestino.DataField        := 'DS_PORTO_DESTINO_POR';
    rldbMercadoria.DataField          := 'MERCADORIA_POR';
    rldbEmbalagem.DataField           := 'UNIDADE_MEDIDA_POR';    
  end;
end;

end.
