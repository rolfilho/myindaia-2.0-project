unit URelPackingListNestleESP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, RLFilters, RLPDFFilter;

type
  TfrmRelPackingListNestleESP = class(TForm)
    RLReport1: TRLReport;
    RLGroup1: TRLGroup;
    rlCabecalho: TRLBand;
    RLDBText1: TRLDBText;
    rlTitulo: TRLLabel;
    RLDBText2: TRLDBText;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel11: TRLLabel;
    rlPagina1: TRLLabel;
    rlLogo: TRLImage;
    RLBand3: TRLBand;
    RLPanel3: TRLPanel;
    rlConsignatario: TRLLabel;
    RLPanel25: TRLPanel;
    rlComprador: TRLLabel;
    RLPanel26: TRLPanel;
    RLSystemInfo3: TRLSystemInfo;
    rlPedido: TRLLabel;
    rlDataSaida: TRLLabel;
    rlNrPagina: TRLLabel;
    rlExporter: TRLLabel;
    rlDataTitulo: TRLLabel;
    rlDonos: TRLLabel;
    rlNumeroBl: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText7: TRLDBText;
    RLPDFFilter: TRLPDFFilter;
    rlVersaoFatura: TRLLabel;
    RLSubDetail1: TRLSubDetail;
    RLBand5: TRLBand;
    RLPanel4: TRLPanel;
    rlQuantidade: TRLLabel;
    pnlValidade1: TRLPanel;
    rlDataValidade: TRLLabel;
    pnlFabricacao1: TRLPanel;
    rlData: TRLLabel;
    rlFabricacao: TRLLabel;
    RLPanel7: TRLPanel;
    rlProduto: TRLLabel;
    pnlPesoNeto1: TRLPanel;
    rlPesoNeto: TRLLabel;
    RLLabel15: TRLLabel;
    pnlPesoBruto1: TRLPanel;
    rlPesoBruto: TRLLabel;
    RLLabel17: TRLLabel;
    pnlLote1: TRLPanel;
    rlBatch: TRLLabel;
    RLBand7: TRLBand;
    pnlPesoNeto4: TRLPanel;
    rlTotalPesoLiq: TRLLabel;
    pnlPesoBruto4: TRLPanel;
    rlTotalPesoBruto: TRLLabel;
    pnlLote4: TRLPanel;
    pnlFabricacao4: TRLPanel;
    pnlValidade4: TRLPanel;
    RLPanel24: TRLPanel;
    rlQuantidadeTotal: TRLLabel;
    RLPanel32: TRLPanel;
    RLBand8: TRLBand;
    RLPanel1: TRLPanel;
    rlMarcas: TRLLabel;
    RLPanel2: TRLPanel;
    rlComentarios: TRLLabel;
    RLDBText15: TRLDBText;
    RLLabel26: TRLLabel;
    RLDraw1: TRLDraw;
    rlUsuarioImpressao: TRLLabel;
    RLGroup2: TRLGroup;
    RLBand2: TRLBand;
    RLPanel11: TRLPanel;
    RLDBMemo1: TRLDBMemo;
    pnlPesoBruto2: TRLPanel;
    pnlLote2: TRLPanel;
    pnlFabricacao2: TRLPanel;
    pnlValidade2: TRLPanel;
    RLPanel31: TRLPanel;
    RLBand6: TRLBand;
    pnlPesoNeto3: TRLPanel;
    RLDBText23: TRLDBText;
    pnlPesoBruto3: TRLPanel;
    RLDBText24: TRLDBText;
    pnlLote3: TRLPanel;
    RLDBText25: TRLDBText;
    pnlFabricacao3: TRLPanel;
    RLDBText26: TRLDBText;
    pnlValidade3: TRLPanel;
    RLDBText27: TRLDBText;
    rldbTxMercadoriaEsp: TRLDBMemo;
    pnlPesoNeto2: TRLPanel;
    RLDBTX_MARCACAO_ING: TRLDBMemo;
    rldbTxMercadoriaIng: TRLDBMemo;
    RLDBMemo2: TRLDBMemo;
    RLDBMemo3: TRLDBMemo;
    RLDBMemo4: TRLDBMemo;
    RLCubagemTotal: TRLLabel;
    RLDBTX_MARCACAO_ESP: TRLDBMemo;
    RLDBMemo5: TRLDBMemo;
    RLDBText8: TRLDBText;
    RLDBMemo6: TRLDBMemo;
    RLDBMemo7: TRLDBMemo;
    rldbMedidaIng: TRLDBMemo;
    rldbMedidaEsp: TRLDBMemo;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLSubDetail1BeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure RLBand6BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    ImprimirLote : Boolean;
    Idioma : String;
    ImprimirUsuario : Boolean;
    TipoAgrupamento_, NrContainer_ : String;
  function PrepararRelatorio(nrProcesso, TipoAgrupamento, NrContainer : String) :Boolean;
  end;

var
  frmRelPackingListNestleESP: TfrmRelPackingListNestleESP;

implementation

uses datm_RelatoriosNestle, PGGP001, ConsOnLineEx, PGGP017;

{$R *.dfm}

function TfrmRelPackingListNestleESP.PrepararRelatorio(nrProcesso, TipoAgrupamento, NrContainer : String) :Boolean;
begin
  TipoAgrupamento_ := TipoAgrupamento;
  NrContainer_     := NrContainer;
  datm_RelatorioNestle.cdsPackingList.Close;
  datm_RelatorioNestle.qryPackingList.SQL.Text := datm_RelatorioNestle.GetSqlPackingList(nrProcesso, TipoAgrupamento, NrContainer);
  datm_RelatorioNestle.cdsPackingList.open;

  if datm_RelatorioNestle.cdsPackingList.recordCount > 0 then
    result := true
  else
    result := false;
end;

procedure TfrmRelPackingListNestleESP.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  try
  if datm_RelatorioNestle.cdsPackingList.FieldByName('PATH_LOGO').AsString <> '' then
    rlLogo.Picture.LoadFromFile( cDir_Rpt + '\' + Trim(datm_RelatorioNestle.cdsPackingList.FieldByName('PATH_LOGO').AsString));
  except on e : Exception do
  end;

  rlUsuarioImpressao.Caption := ConsultaLookUPSQL('SELECT NM_USUARIO FROM TUSUARIO (NOLOCK) WHERE CD_USUARIO = "' + str_cd_usuario + '" ',
                                                  'NM_USUARIO');

  if not ImprimirLote then
  begin
    pnlLote1.visible       := false;
    pnlLote2.visible       := false;
    pnlLote3.visible       := false;
    pnlLote4.visible       := false;
    pnlFabricacao1.visible := false;
    pnlFabricacao2.visible := false;
    pnlFabricacao3.visible := false;
    pnlFabricacao4.visible := false;
    pnlValidade1.visible   := false;
    pnlValidade2.visible   := false;
    pnlValidade3.visible   := false;
    pnlValidade4.visible   := false;
  end;

  rlUsuarioImpressao.visible := ImprimirUsuario;

  if Idioma = 'Ingles' then
  begin
    rlTitulo.caption               :=  rlTitulo.caption; //é definido na tela de seleção.
    rlPagina1.caption              :=  'Page';
    rlExporter.caption             :=  'Exporter:';
    rlNrPagina.caption             :=  'Page No.......:';
    rlDataSaida.caption            :=  'Date..........:';
    rlPedido.caption               :=  'Your Order....:';
    rlDataTitulo.caption           :=  'Date..........:';
    rlComprador.caption            :=  'Buyer:';
    if trim(datm_RelatorioNestle.cdsPackingListCD_SERVICO.asstring) = '21' then
      rlConsignatario.caption       := 'Delivery To'
    else
      rlConsignatario.caption       := 'Consignee';
    rlDonos.caption                :=  'Owners:';
    rlNumeroBl.caption             :=  'Bl No.:';
    rlComentarios.caption          :=  'Comments';
    rlMarcas.caption               :=  'Marks';
    rlProduto.caption              :=  'Product / Package';
    rlPesoNeto.caption             :=  'Net Weight';
    rlPesoBruto.caption            :=  'Gross Weight';
    rlBatch.caption                :=  'Batch';
    rlData.caption                 :=  'Manufacture';
    rlFabricacao.caption           :=  'Date';
    rlDataValidade.caption         :=  'Expiry Date';
    rlQuantidade.caption           :=  'Quantity';
    rldbMedidaIng.visible          :=  true;
    rldbTxMercadoriaIng.visible    :=  true;
    RLDBTX_MARCACAO_ING.visible    :=  true;
    RLDBTX_MARCACAO_ESP.visible    :=  false;
    rldbTxMercadoriaEsp.visible    :=  false;
    rldbMedidaEsp.visible          :=  false;
  end
  else
    if Idioma = 'Espanhol' then
    begin
      rlTitulo.caption             :=  'Lista Empaque No.:';
      rlPagina1.caption            :=  'Hoja';
      rlExporter.caption           :=  'Exportador:';
      rlNrPagina.caption           :=  'Hoja No.......:';
      rlDataSaida.caption          :=  'Fecha.........:';
      rlPedido.caption             :=  'Su Pedido....:';
      rlDataTitulo.caption         :=  'Fecha.........:';
      rlComprador.caption          :=  'Importador:';
      if trim(datm_RelatorioNestle.cdsPackingListCD_SERVICO.asstring) = '21' then
        rlConsignatario.caption       := 'Entrega para'
      else
        rlConsignatario.caption       := 'Consignatario';  
      rlDonos.caption              :=  'Transportista:';
      rlNumeroBl.caption           :=  'BL/CRT No.:';
      rlComentarios.caption        :=  'Observaciones';
      rlMarcas.caption             :=  'Marcación';
      rlProduto.caption            :=  'Producto';
      rlPesoNeto.caption           :=  'Peso Neto';
      rlPesoBruto.caption          :=  'Peso Bruto';
      rlBatch.caption              :=  'Lotes';
      rlData.caption               :=  'Fecha';
      rlFabricacao.caption         :=  'Fabricacion';
      rlDataValidade.caption       :=  'Fecha de Validat';
      rlQuantidade.caption         :=  'Cantidade';
      rldbMedidaIng.visible        :=  false;
      rldbTxMercadoriaIng.visible  :=  false;
      RLDBTX_MARCACAO_ING.visible  :=  false;
      RLDBTX_MARCACAO_ESP.visible  :=  true;
      rldbTxMercadoriaEsp.visible  :=  true;
      rldbMedidaEsp.visible        :=  true
    end;
end;

procedure TfrmRelPackingListNestleESP.RLSubDetail1BeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  datm_RelatorioNestle.cdsPackingListItem.Close;
  datm_RelatorioNestle.qryPackingListItem.Sql.Text := datm_RelatorioNestle.GetSqlPackingListItem(datm_RelatorioNestle.cdsPackingList.FieldByName('NR_PROCESSO').asString, TipoAgrupamento_, NrContainer_, ImprimirLote);
  datm_RelatorioNestle.cdsPackingListItem.open;
end;

procedure TfrmRelPackingListNestleESP.RLBand6BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  rlTotalPesoLiq.caption    := formatfloat('0.000',datm_RelatorioNestle.cdsPackingListItemTOTAL_VL_TOT_PESO_LIQ.asFloat);
  rlTotalPesoBruto.caption  := formatfloat('0.000',datm_RelatorioNestle.cdsPackingListItemTOTAL_VL_TOT_PESO_BRUTO.asFloat);
  rlQuantidadeTotal.caption := IntToStr(datm_RelatorioNestle.cdsPackingListItemTOTAL_QT_MERCADORIA.asInteger);
  RLCubagemTotal.caption    := formatfloat('0.000',datm_RelatorioNestle.cdsPackingListItemVL_CUBAGEM_TOTAL.asFloat);
end;

end.
