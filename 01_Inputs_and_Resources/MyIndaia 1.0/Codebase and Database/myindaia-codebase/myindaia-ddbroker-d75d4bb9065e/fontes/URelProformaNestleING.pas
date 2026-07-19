unit URelProformaNestleING;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, RLFilters, RLPDFFilter;

type
  TfrmRelProformaNestleING = class(TForm)
    RLReport1: TRLReport;
    GrupoProcesso: TRLGroup;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    rlTipoFatura: TRLLabel;
    rlCNPJ: TRLLabel;
    rlLogo: TRLImage;
    RLBand2: TRLBand;
    RLPanel47: TRLPanel;
    rlRUC: TRLLabel;
    rlBL: TRLLabel;
    rlDataBL: TRLLabel;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLPanel2: TRLPanel;
    rlDono: TRLLabel;
    rlTipoTransporte: TRLLabel;
    rlReferenciaCliente: TRLLabel;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLPanel48: TRLPanel;
    rlPara: TRLLabel;
    rlConsignatario: TRLLabel;
    RLDBText5: TRLDBText;
    RLDBText7: TRLDBText;
    RLLabel40: TRLLabel;
    rlPagina: TRLLabel;
    RLPDFFilter1: TRLPDFFilter;
    RLSubDetail1: TRLSubDetail;
    RLBand5: TRLBand;
    RLPanel6: TRLPanel;
    rlQuantidade: TRLLabel;
    RLPanel7: TRLPanel;
    rlCodigoMercadoria: TRLLabel;
    RLPanel10: TRLPanel;
    rlPrecoUnitario: TRLLabel;
    RLPanel12: TRLPanel;
    rlTotal: TRLLabel;
    GrupoNCM: TRLGroup;
    RLBand3: TRLBand;
    GrupoUniMedida: TRLGroup;
    RLBand4: TRLBand;
    rlDetail: TRLBand;
    rldbQT_MERCADORIA: TRLDBText;
    rldbCD_MERCADORIA: TRLDBText;
    rldbVL_UNITARIO: TRLDBText;
    rldbVL_TOT_ITEM: TRLDBText;
    RLPanel5: TRLPanel;
    RLPanel8: TRLPanel;
    RLPanel14: TRLPanel;
    RLPanel15: TRLPanel;
    RLPanel51: TRLPanel;
    RLPanel52: TRLPanel;
    RLPanel54: TRLPanel;
    RLPanel55: TRLPanel;
    RLPanel56: TRLPanel;
    RLPanel58: TRLPanel;
    RLPanel59: TRLPanel;
    RLPanel49: TRLPanel;
    rlProduto: TRLLabel;
    RLPanel11: TRLPanel;
    rlValorDolar: TRLLabel;
    RLBand7: TRLBand;
    RLPanel60: TRLPanel;
    RLPanel61: TRLPanel;
    RLPanel63: TRLPanel;
    RLPanel64: TRLPanel;
    rlVersaoFatura: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText20: TRLDBText;
    RLLabel1: TRLLabel;
    RLDBText43: TRLDBText;
    RLBand6: TRLBand;
    RLPanel65: TRLPanel;
    RLPanel66: TRLPanel;
    RLPanel68: TRLPanel;
    RLPanel69: TRLPanel;
    RLBand8: TRLBand;
    RLPanel16: TRLPanel;
    rlPacking: TRLLabel;
    RLPanel1: TRLPanel;
    rldbResumoEmbalagemIng: TRLDBMemo;
    rldbResumoEmbalagemEsp: TRLDBMemo;
    rlPesoNeto: TRLLabel;
    rlPesoBruto: TRLLabel;
    rlDimensao: TRLLabel;
    RLDBText15: TRLDBText;
    RLDBText21: TRLDBText;
    RLDBText22: TRLDBText;
    RLPanel3: TRLPanel;
    rlPaisOrigem: TRLLabel;
    RLDBText23: TRLDBText;
    RLPanel17: TRLPanel;
    rlOrigem: TRLLabel;
    RLPanel18: TRLPanel;
    RLPanel4: TRLPanel;
    rlMarcas: TRLLabel;
    RLPanel19: TRLPanel;
    rlSubTotal: TRLLabel;
    RLPanel31: TRLPanel;
    RLDBText26: TRLDBText;
    RLPanel29: TRLPanel;
    RLDBText16: TRLDBText;
    rlUsuarioImpressao: TRLLabel;
    RLPanel26: TRLPanel;
    rldbTermoPagto: TRLDBText;
    rlTermoPagamento: TRLLabel;
    rlTermoPgmtoEsp: TRLDBText;
    RLDBMemo4: TRLDBMemo;
    RLPanel20: TRLPanel;
    RLPanel41: TRLPanel;
    rlViaTransporte2: TRLLabel;
    RLDBText33: TRLDBText;
    RLPanel42: TRLPanel;
    rlDestino: TRLLabel;
    RLDBTX_MARCACAO_ING: TRLDBMemo;
    RLDBText17: TRLDBText;
    RLPanel23: TRLPanel;
    RLPanel24: TRLPanel;
    RLPanel25: TRLPanel;
    RLPanel27: TRLPanel;
    rlValorDesconto: TRLLabel;
    RLPanel32: TRLPanel;
    relSeguro: TRLLabel;
    RLPanel33: TRLPanel;
    rlOutros: TRLLabel;
    RLPanel34: TRLPanel;
    RLDBText18: TRLDBText;
    RLPanel36: TRLPanel;
    RLPanel37: TRLPanel;
    RLPanel38: TRLPanel;
    RLPanel39: TRLPanel;
    RLPanel40: TRLPanel;
    RLDBText28: TRLDBText;
    RLPanel43: TRLPanel;
    RLDBText29: TRLDBText;
    RLPanel44: TRLPanel;
    RLDBText31: TRLDBText;
    RLPanel45: TRLPanel;
    RLDBText30: TRLDBText;
    RLPanel46: TRLPanel;
    rlFrete: TRLLabel;
    RLDBMemo1: TRLDBMemo;
    RLDBMemo2: TRLDBMemo;
    RLDBMemo6: TRLDBMemo;
    rldbtCD_NCM_SH: TRLDBText;
    rlDescricaoMercadoria: TRLLabel;
    rldbtNRCNTR: TRLDBText;
    rldbTxMercadoriaESP: TRLDBMemo;
    rldbTxMercadoriaIng: TRLDBMemo;
    RLDBTX_MARCACAO_ESP: TRLDBMemo;
    rlCidadeDataEsp: TRLDBMemo;
    rlCidadeDataIng: TRLDBMemo;
    RLDBMemo5: TRLDBMemo;
    RLBand9: TRLBand;
    RLPanel9: TRLPanel;
    RLPanel13: TRLPanel;
    RLPanel21: TRLPanel;
    RLPanel22: TRLPanel;
    RLDBMemo7: TRLDBMemo;
    RLDBMemo8: TRLDBMemo;
    RLDBMemo3: TRLDBMemo;
    rlSysPaginaAtual: TRLSystemInfo;
    rlSysQtPaginas: TRLSystemInfo;
    RLDBText6: TRLDBText;
    rldbUnidadeMedEsp: TRLDBMemo;
    rldbUnidadeMedIng: TRLDBMemo;
    procedure RLSubDetail1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlDetailBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Idioma : String;
    ImprimirUsuario : Boolean;
    FatPorContainer : Boolean;
    FatPorMercadoria : Boolean;
    Proforma5       : Boolean;
    nrContainer : String;
    nrMercadoria : String;    
    AgrupaPorNCM : Integer;
    IsentoRegistro : Boolean;
    
  function PrepararRelatorio(nrProcesso : String; ImprimirNCM : integer; FaturaPorContainer, FaturaPorMercadoria, TipoProforma5, ImprimirPedido: Boolean; nr_Container, cd_Mercadoria : String) :Boolean;
  end;

var
  frmRelProformaNestleING: TfrmRelProformaNestleING;

implementation

uses datm_RelatoriosNestle, PGGP001, PGGP017, ConsOnLineEx;

{$R *.dfm}

function TfrmRelProformaNestleING.PrepararRelatorio(nrProcesso : String; ImprimirNCM : integer; FaturaPorContainer, FaturaPorMercadoria, TipoProforma5, ImprimirPedido: Boolean; nr_Container, cd_Mercadoria : String) :Boolean;
begin
  datm_RelatorioNestle.cdsFaturaComercial.Close;
  datm_RelatorioNestle.qryFaturaComercial.SQL.Text := datm_RelatorioNestle.GetSqlFaturaComercial(nrProcesso, FaturaPorContainer , FaturaPorMercadoria, TipoProforma5, ImprimirPedido, nr_Container, cd_Mercadoria);
  datm_RelatorioNestle.cdsFaturaComercial.open;

  FatPorContainer := FaturaPorContainer;
  FatPorMercadoria := FaturaPorMercadoria;
  nrContainer     := nr_Container;
  nrMercadoria     := cd_Mercadoria;
  AgrupaPorNCM    := ImprimirNCM;
  Proforma5       := TipoProforma5;


  if datm_RelatorioNestle.cdsFaturaComercial.recordCount > 0 then
    result := true
  else
    result := false;
end;

procedure TfrmRelProformaNestleING.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  try
  if datm_RelatorioNestle.cdsFaturaComercial.FieldByName('PATH_LOGO').AsString <> '' then
    rlLogo.Picture.LoadFromFile( cDir_Rpt + '\' + Trim(datm_RelatorioNestle.cdsFaturaComercial.FieldByName('PATH_LOGO').AsString));
  except on e : Exception do
  end;

  rlUsuarioImpressao.Caption := ConsultaLookUPSQL('SELECT NM_USUARIO FROM TUSUARIO (NOLOCK) WHERE CD_USUARIO = "' + str_cd_usuario + '" ',
                                                  'NM_USUARIO');

  rlUsuarioImpressao.visible :=  ImprimirUsuario;

  if fatPorContainer then
    rldbtNRCNTR.visible := true
  else
    rldbtNRCNTR.visible := false;
      
  if idioma = 'Ingles' then
  begin
    rlTipoFatura.caption          := rlTipoFatura.caption; //Definido na tela de selecao
    rlPagina.caption              := 'Page';
    rlCNPJ.caption                := 'CNPJ:';
    rlPara.caption                := 'TO:';
    if trim(datm_RelatorioNestle.cdsFaturaComercialCD_SERVICO.asstring) = '21' then
      rlConsignatario.caption       := 'DELIVERY TO'
    else
      rlConsignatario.caption       := 'CONSIGNEE';
    rlRUC.caption                 := 'RUC:';
    rlBL.caption                  := 'BL/CRT/AWB:';
    rlDataBL.caption              := 'DATE:';
    rlDono.caption                := 'OWNERS:';
    rlTipoTransporte.caption      := 'VESSEL/FLIGHT:';
    rlReferenciaCliente.caption   := 'YOUR REFERENCE:';
    rlProduto.caption             := 'PRODUCT';
    rlValorDolar.caption          := 'VALUES IN';
    rlQuantidade.caption          := 'QTY';
    rlCodigoMercadoria.caption    := 'CODE';
    rlDescricaoMercadoria.caption := 'DESCRIPTION';
    rlPrecoUnitario.caption       := 'UNIT PRICE';
    rlTotal.caption               := 'TOTAL';
    rlPacking.caption             := 'PACKING';
    rlMarcas.caption              := 'MARKS';
    rlSubTotal.caption            := 'Sub-Total';
    rlPesoNeto.caption            := 'Net Weight (KG):';
    rlPesoBruto.caption           := 'Gross Weight (KG):';
    rlDimensao.caption            := 'Dimension (M3):';
    rlPaisOrigem.caption          := 'Country of Origin:';
    rlOrigem.caption              := 'Place of Origin';
    rlDestino.caption             := 'Place of Destination';
    rlTermoPagamento.caption      := 'Payment Terms:';
//    rlILNo.caption                := 'I/L No.:';
    rlViaTransporte2.caption      := 'Way:';
//    rlLCNo.caption                := 'L/C No.:';
    rlValorDesconto.caption       := 'Value of Discount';
    rlFrete.caption               := 'Freight';
    relSeguro.caption             := 'Insurance';
    rlOutros.caption              := 'Others';
    rlTermoPgmtoEsp.visible       := false;
    rlCidadeDataEsp.visible       := false;
    rldbResumoEmbalagemEsp.visible:= false;
    rldbUnidadeMedEsp.visible     := false;
    rldbTxMercadoriaesp.Visible   := false;
    RLDBTX_MARCACAO_ESP.visible   := false;
    RLDBTX_MARCACAO_ING.visible   := true;
    rldbTxMercadoriaIng.visible   := true;    
    rldbUnidadeMedIng.visible     := true;
    rldbResumoEmbalagemIng.visible:= true;
    rlCidadeDataIng.visible       := true;
    rldbTermoPagto.visible        := true;
  end
  else
  if idioma = 'Espanhol' then
  begin
    rlTipoFatura.caption          := rlTipoFatura.caption; //Definido na tela de selecao  
    rlPagina.caption              := 'Hoja';
    rlCNPJ.caption                := 'CNPJ:';
    rlPara.caption                := 'A:';
    if trim(datm_RelatorioNestle.cdsFaturaComercialCD_SERVICO.asstring) = '21' then
      rlConsignatario.caption       := 'ENTREGA PARA'
    else
      rlConsignatario.caption       := 'CONSIGNATARIO';
    rlRUC.caption                 := 'RUC:';
    rlBL.caption                  := 'BL/CRT/AWB:';
    rlDataBL.caption              := 'FECHA:';
    rlDono.caption                := 'TRANSPORTISTA:';
    rlTipoTransporte.caption      := 'EMBARCACION/VUELO:';
    rlReferenciaCliente.caption   := 'SU REFERENCE:';
    rlProduto.caption             := 'PRODUCTO';
    rlValorDolar.caption          := 'VALOR EN';
    rlQuantidade.caption          := 'CTD';
    rlCodigoMercadoria.caption    := 'CODIGO';
    rlDescricaoMercadoria.caption := 'DESCRIPCIÓN';
    rlPrecoUnitario.caption       := 'PRECO UNIT';
    rlTotal.caption               := 'TOTAL';
    rlPacking.caption             := 'EMPAQUE';
    rlMarcas.caption              := 'MARCAS';
    rlSubTotal.caption            := 'Sub-Total';
    rlPesoNeto.caption            := 'Peso Neto (KG):';
    rlPesoBruto.caption           := 'Peso Bruto (KG):';
    rlDimensao.caption            := 'Volume (M3):';
    rlPaisOrigem.caption          := 'Pais Origen:';
    rlOrigem.caption              := 'Local Embarque';
    rlDestino.caption             := 'Local Destino';
    rlTermoPagamento.caption      := 'Cond de Pago:';
//    rlILNo.caption                := 'I/L No.:';
    rlViaTransporte2.caption      := 'Via:';
//    rlLCNo.caption                := 'L/C No.:';
    rlValorDesconto.caption       := 'Valor de Descuento';
    rlFrete.caption               := 'Flete';
    relSeguro.caption             := 'Seguro';
    rlOutros.caption              := 'Otros';
    rlTermoPgmtoEsp.visible       := true;
    rlCidadeDataEsp.visible       := true;
    rldbResumoEmbalagemEsp.visible:= true;
    rldbUnidadeMedEsp.visible     := true;
    rldbTxMercadoriaesp.Visible   := true;
    RLDBTX_MARCACAO_ESP.visible   := true;
    RLDBTX_MARCACAO_ING.visible   := false;
    rldbTxMercadoriaIng.visible   := false;
    rldbUnidadeMedIng.visible     := false;
    rldbResumoEmbalagemIng.visible:= false;
    rlCidadeDataIng.visible       := false;
    rldbTermoPagto.visible        := false;
  end;
end;

procedure TfrmRelProformaNestleING.RLSubDetail1BeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  datm_RelatorioNestle.cdsFaturaComercialItem.Close;
  datm_RelatorioNestle.qryFaturaComercialItem.Sql.Text := datm_RelatorioNestle.GetSqlFaturaComercialItem(datm_RelatorioNestle.cdsFaturaComercial.FieldByName('NR_PROCESSO').asString,
                                                                                                         AgrupaPorNCM, FatPorContainer, FatPorMercadoria, Proforma5, nrContainer , nrMercadoria, IsentoRegistro);
  datm_RelatorioNestle.cdsFaturaComercialItem.open;
end;

procedure TfrmRelProformaNestleING.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if datm_RelatorioNestle.cdsFaturaComercialItemCD_NCM_SH.asstring = '0' then
    rldbtCD_NCM_SH.visible := false
  else
    rldbtCD_NCM_SH.visible := true;
end;

procedure TfrmRelProformaNestleING.rlDetailBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if datm_RelatorioNestle.cdsFaturaComercialItemTIPO.asstring = 'INFO' then
  begin
    rldbQT_MERCADORIA.visible := false;
    rldbCD_MERCADORIA.visible := false;
    rldbVL_UNITARIO.visible   := false;
    rldbVL_TOT_ITEM.visible   := false;
  end
  else
  begin
    rldbQT_MERCADORIA.visible := true;
    rldbCD_MERCADORIA.visible := true;
    rldbVL_UNITARIO.visible   := true;
    rldbVL_TOT_ITEM.visible   := true;
  end;
end;

end.
