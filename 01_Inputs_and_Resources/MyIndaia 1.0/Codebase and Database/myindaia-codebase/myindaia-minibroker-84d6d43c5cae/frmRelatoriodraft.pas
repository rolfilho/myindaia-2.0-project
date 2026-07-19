unit frmRelatoriodraft;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DmGerarArquivosDraft, RLReport,
  dxGDIPlusClasses;

type
  TformRelatorioDraft = class(TForm)
    RLReport1: TRLReport;
    rlbndDadosIndaia: TRLBand;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel30: TRLLabel;
    rlbndCliente_2: TRLBand;
    RLPanel2: TRLPanel;
    RLPanel4: TRLPanel;
    RLLabel2: TRLLabel;
    RLMemo1: TRLMemo;
    RLMemo10: TRLMemo;
    RLPanel9: TRLPanel;
    RLPanel6: TRLPanel;
    RLPanel5: TRLPanel;
    RLLabel3: TRLLabel;
    RLDBMemo3: TRLDBMemo;
    RLPanel17: TRLPanel;
    RLPanel8: TRLPanel;
    RLLabel5: TRLLabel;
    RLPanel7: TRLPanel;
    rlbndConsig_1: TRLBand;
    RLPanel10: TRLPanel;
    RLPanel11: TRLPanel;
    RLPanel12: TRLPanel;
    RLPanel13: TRLPanel;
    RLLabel62: TRLLabel;
    rlbndContactParty: TRLBand;
    RLPanel19: TRLPanel;
    RLLabel11: TRLLabel;
    RLPanel20: TRLPanel;
    RLLabel12: TRLLabel;
    RLPanel21: TRLPanel;
    RLLabel14: TRLLabel;
    RLPanel22: TRLPanel;
    RLLabel13: TRLLabel;
    rlbndConsolidatorStuffer: TRLBand;
    RLPanel31: TRLPanel;
    RLLabel15: TRLLabel;
    RLPanel32: TRLPanel;
    RLLabel16: TRLLabel;
    RLPanel33: TRLPanel;
    RLPanel34: TRLPanel;
    rlbndOriginOfGoods: TRLBand;
    RLPanel27: TRLPanel;
    RLPanel28: TRLPanel;
    RLLabel18: TRLLabel;
    RLDBMemo15: TRLDBMemo;
    RLPanel29: TRLPanel;
    RLDBMemo14: TRLDBMemo;
    RLLabel63: TRLLabel;
    RLPanel30: TRLPanel;
    RLLabel19: TRLLabel;
    rlbndLocalEmbarque: TRLBand;
    RLPanel23: TRLPanel;
    RLLabel21: TRLLabel;
    RLPanel24: TRLPanel;
    RLLabel22: TRLLabel;
    RLPanel25: TRLPanel;
    RLLabel24: TRLLabel;
    RLPanel26: TRLPanel;
    RLLabel23: TRLLabel;
    rlbndParticulars: TRLBand;
    RLLabel31: TRLLabel;
    rlbndTitulos: TRLBand;
    RLPanel46: TRLPanel;
    RLLabel32: TRLLabel;
    RLPanel47: TRLPanel;
    RLMemo4: TRLMemo;
    RLPanel48: TRLPanel;
    RLLabel33: TRLLabel;
    RLPanel49: TRLPanel;
    RLMemo5: TRLMemo;
    RLPanel50: TRLPanel;
    RLMemo6: TRLMemo;
    RLPanel51: TRLPanel;
    RLMemo7: TRLMemo;
    RLPanel52: TRLPanel;
    RLMemo8: TRLMemo;
    RLSubDetail1: TRLSubDetail;
    rlbndDetail: TRLBand;
    RLPanel39: TRLPanel;
    rldbNrContainer: TRLDBText;
    RLPanel40: TRLPanel;
    RLPanel41: TRLPanel;
    RLPanel42: TRLPanel;
    RLPanel43: TRLPanel;
    RLPanel44: TRLPanel;
    RLPanel45: TRLPanel;
    rlbndHouseBillDetails: TRLBand;
    RLPanel1: TRLPanel;
    RLPanel69: TRLPanel;
    RLLabel70: TRLLabel;
    RLPanel70: TRLPanel;
    RLPanel3: TRLPanel;
    RLPanel14: TRLPanel;
    RLPanel15: TRLPanel;
    RLPanel71: TRLPanel;
    RLPanel18: TRLPanel;
    RLPanel73: TRLPanel;
    RLPanel74: TRLPanel;
    RLPanel72: TRLPanel;
    RLPanel64: TRLPanel;
    RLPanel65: TRLPanel;
    RLLabel65: TRLLabel;
    RLPanel66: TRLPanel;
    RLLabel66: TRLLabel;
    RLPanel67: TRLPanel;
    RLLabel67: TRLLabel;
    RLPanel68: TRLPanel;
    RLLabel69: TRLLabel;
    RLPanel16: TRLPanel;
    RLLabel60: TRLLabel;
    rlbndShipperDeclaredValue: TRLBand;
    rlpnlShipperDeclaredValue: TRLPanel;
    RLPanel55: TRLPanel;
    RLLabel39: TRLLabel;
    RLPanel56: TRLPanel;
    RLLabel40: TRLLabel;
    RLLabel42: TRLLabel;
    RLLabel51: TRLLabel;
    RLLabel52: TRLLabel;
    RLPanel57: TRLPanel;
    RLLabel41: TRLLabel;
    RLPanel58: TRLPanel;
    RLMemo9: TRLMemo;
    rlbndChargeType: TRLBand;
    rlpnlChargeType_1: TRLPanel;
    RLPanel36: TRLPanel;
    RLLabel50: TRLLabel;
    RLPanel37: TRLPanel;
    RLLabel53: TRLLabel;
    RLPanel38: TRLPanel;
    RLLabel54: TRLLabel;
    RLPanel53: TRLPanel;
    RLLabel55: TRLLabel;
    rlpnlChangeType_2: TRLPanel;
    RLPanel59: TRLPanel;
    RLPanel60: TRLPanel;
    RLPanel61: TRLPanel;
    RLPanel62: TRLPanel;
    rlbndClauses: TRLBand;
    rlpnlClauses: TRLPanel;
    RLLabel43: TRLLabel;
    RLLabel44: TRLLabel;
    RLLabel45: TRLLabel;
    RLLabel46: TRLLabel;
    RLLabel47: TRLLabel;
    RLMemo2: TRLMemo;
    RLMemo3: TRLMemo;
    rlbndControltotals_: TRLBand;
    rlpnlControlTotal: TRLPanel;
    RLLabel34: TRLLabel;
    RLLabel35: TRLLabel;
    RLLabel36: TRLLabel;
    RLLabel37: TRLLabel;
    RLLabel38: TRLLabel;
    RLGroup1: TRLGroup;
    RLPanel35: TRLPanel;
    RLDBMemo1: TRLDBMemo;
    RLPanel54: TRLPanel;
    RLLabel1: TRLLabel;
    RLDBMemo2: TRLDBMemo;
    RLMemo11: TRLMemo;
    RLPanel63: TRLPanel;
    RLLabel6: TRLLabel;
    RLLabel10: TRLLabel;
    RLDBMemo5: TRLDBMemo;
    RLPanel75: TRLPanel;
    RLLabel28: TRLLabel;
    RLDBMemo7: TRLDBMemo;
    RLPanel76: TRLPanel;
    RLDBMemo6: TRLDBMemo;
    RLLabel27: TRLLabel;
    RLMemo12: TRLMemo;
    RLDBMemo18: TRLDBMemo;
    RLPanel77: TRLPanel;
    RLDBMemo11: TRLDBMemo;
    RLPanel78: TRLPanel;
    RLDBMemo8: TRLDBMemo;
    RLLabel7: TRLLabel;
    RLPanel79: TRLPanel;
    RLDBMemo12: TRLDBMemo;
    RLPanel80: TRLPanel;
    RLDBMemo9: TRLDBMemo;
    RLLabel8: TRLLabel;
    RLPanel81: TRLPanel;
    RLDBMemo13: TRLDBMemo;
    RLPanel82: TRLPanel;
    RLDBMemo10: TRLDBMemo;
    RLLabel9: TRLLabel;
    RLDBText1: TRLDBText;
    RLLabel4: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel29: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBMemo19: TRLDBMemo;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText15: TRLDBText;
    RLLabel48: TRLLabel;
    RLLabel49: TRLLabel;
    RLLabel56: TRLLabel;
    lblLocalLiberacaoBlNome: TRLLabel;
    lblLocalLiberacaoBlPais: TRLLabel;
    lblLocalLiberacaoBlID: TRLLabel;
    lblTotalContainer: TRLLabel;
    lblTotalEmbalagem: TRLLabel;
    lblTotalPesoBruto: TRLLabel;
    lblTotalVolume: TRLLabel;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLLabel64: TRLLabel;
    lblContainerIso: TRLLabel;
    lblContainerDescIndaia: TRLLabel;
    lblContainerSeal: TRLLabel;
    lblContainerTemp: TRLLabel;
    RLLabel74: TRLLabel;
    RLLabel71: TRLLabel;
    RLLabel72: TRLLabel;
    lblContainerPesoBruto: TRLLabel;
    lblContainerTara: TRLLabel;
    lblContainerVolume: TRLLabel;
    lblContainerSupplier: TRLLabel;
    lblContainerComments: TRLLabel;
    lblContainerWood: TRLLabel;
    lblContainerReferences: TRLLabel;
    lblPackingLevel: TRLLabel;
    memPesoBruto: TRLMemo;
    memVolume: TRLMemo;
    memMarks: TRLMemo;
    lblPagamentoTaxa: TRLLabel;
    lblTipoFrete: TRLLabel;
    memClauses: TRLMemo;
    memComment: TRLMemo;
    lblHouseBillFiledBy: TRLLabel;
    lblFilingCountry: TRLLabel;
    RLDBMemo4: TRLDBMemo;
    RLDBMemo16: TRLDBMemo;
    RLDBMemo17: TRLDBMemo;
    RLImage1: TRLImage;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLSubDetail1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlbndDetailBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    processo: String;
    amend: Integer;
    { Public declarations }
  end;

var
  formRelatorioDraft: TformRelatorioDraft;

implementation

{$R *.dfm}

procedure TformRelatorioDraft.rlbndDetailBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin

  lblContainerIso.Caption := dtmGerarArquivosDraft.qryContainerNM_TIPO_CONTAINER.AsString + ' (' + dtmGerarArquivosDraft.qryContainerCD_ISO.AsString +')' ;
  lblContainerDescIndaia.Caption := dtmGerarArquivosDraft.qryContainerNM_TP_CNTR.AsString;
  lblContainerReferences.Caption := 'Container References: ';
  lblContainerSeal.Caption := dtmGerarArquivosDraft.qryContainerNR_LACRE.AsString + ' ('+dtmGerarArquivosDraft.qryDraftSealingParty.AsString{Carrier}+')';
  lblContainerTemp.Caption := StringReplace(dtmGerarArquivosDraft.qryContainerDS_TEMPERATURA.AsString, '+', '', [rfReplaceAll]) + 'Centigrade';
  lblContainerPesoBruto.Caption := //'Weight: '+
                                   StringReplace(FormatFloat('##0.000', dtmGerarArquivosDraft.qryContainerQT_PESO_BRUTO.AsFloat), ',', '.', [rfReplaceAll]) +
                                   ' Kilograms';
  lblContainerTara.Caption := //'Weight: '+
                              StringReplace(FormatFloat('##0.000', dtmGerarArquivosDraft.qryContainerTARA_CNTR.AsInteger), ',', '.', [rfReplaceAll]) +
                              ' Kilograms';
  lblContainerVolume.Caption := //'Volume: '+
                                StringReplace(FormatFloat('##0.000', dtmGerarArquivosDraft.qryContainerVL_CUBAGEM.AsFloat), ',', '.', [rfReplaceAll]) +
                                ' Cubic Meter';
  lblContainerSupplier.Caption := 'Container Supplier: '+ dtmGerarArquivosDraft.qryDraftEquipmentSupplier.AsString;//Carrier;
  lblContainerComments.Caption := 'Container Comments: ';
  lblContainerWood.Caption := 'Wood Declaration: ';

  lblPackingLevel.Caption := '(' + dtmGerarArquivosDraft.qryContainerNR_LINHA.AsString + ') OUTER';
  memPesoBruto.Lines.Text := 'Per Container: ' +
                             StringReplace(FormatFloat('##0.000', dtmGerarArquivosDraft.qryContainerQT_PESO_BRUTO.AsFloat), ',', '.', [rfReplaceAll]) +
                             ' Kilograms';

  memVolume.Lines.Text := 'Per Container: ' +
                          StringReplace(FormatFloat('##0.000', dtmGerarArquivosDraft.qryContainerVL_CUBAGEM.AsFloat), ',', '.', [rfReplaceAll]) +
                          ' Cubic Meter';
  memMarks.Lines.Text := dtmGerarArquivosDraft.qryDraftMARCACAO_VOLUMES.AsString;
end;

procedure TformRelatorioDraft.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin

  dtmGerarArquivosDraft.AbrirQueryImpressaoDraftBL(processo, amend);
  lblLocalLiberacaoBlNome.Caption := dtmGerarArquivosDraft.qryDraftLOCAL_LIBERACAO_BL_NOME.AsString;
  lblLocalLiberacaoBlPais.Caption := dtmGerarArquivosDraft.qryDraftLOCAL_LIBERACAO_BL_PAIS.AsString;
  lblLocalLiberacaoBlID.Caption := dtmGerarArquivosDraft.qryDraftLOCAL_LIBERACAO_BL_ID.AsString;
  lblPagamentoTaxa.Caption := AnsiUpperCase(dtmGerarArquivosDraft.qryDraftPGTO_TAXA_DESCRICAO.AsString);
  lblTipoFrete.Caption := dtmGerarArquivosDraft.qryDraftTIPO_FRETE_DESCRICAO.AsString;
  lblHouseBillFiledBy.Caption := dtmGerarArquivosDraft.qryDraftManifestFilerStatus.AsString;
  lblFilingCountry.Caption := dtmGerarArquivosDraft.qryDraftManifestFilingCountry.AsString;

  dtmGerarArquivosDraft.AbrirQueryImpressaoDraftBLComentarios(processo, amend);

  dtmGerarArquivosDraft.qryComentarios.first;
  while not dtmGerarArquivosDraft.qryComentarios.Eof do
  begin
    if dtmGerarArquivosDraft.qryComentariosCD_TP_COMENTARIO.AsString <> '' then
    begin
      memClauses.Lines.Add(dtmGerarArquivosDraft.qryComentariosTP_DESCRICAO.AsString +': ' + Copy(dtmGerarArquivosDraft.qryComentariosDS_COMENTARIO.AsString, 0, 34));
    end
    else
    begin
      memComment.Lines.Add(dtmGerarArquivosDraft.qryComentariosDS_COMENTARIO.AsString);
    end;
    dtmGerarArquivosDraft.qryComentarios.Next;
  end;

end;

procedure TformRelatorioDraft.RLSubDetail1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  vQtEmbalagem: Integer;
  vQtPesoBruto: Double;
  vVlCubagem: Double;
begin
  dtmGerarArquivosDraft.AbrirQueryImpressaoDraftBLItens(processo, amend);


  vQtEmbalagem :=0;
  vQtPesoBruto := 0;
  vVlCubagem := 0;
  dtmGerarArquivosDraft.qryContainer.first;
  While not dtmGerarArquivosDraft.qryContainer.Eof do
  begin
    vQtEmbalagem := vQtEmbalagem + dtmGerarArquivosDraft.qryContainerQT_EMBALAGEM.AsInteger;
    vQtPesoBruto := vQtPesoBruto + dtmGerarArquivosDraft.qryContainerQT_PESO_BRUTO.AsFloat;
    vVlCubagem := vVlCubagem + dtmGerarArquivosDraft.qryContainerVL_CUBAGEM.AsFloat;
    dtmGerarArquivosDraft.qryContainer.Next;
  end;

  lblTotalContainer.Caption := IntToStr(dtmGerarArquivosDraft.qryContainer.RecordCount);
  lblTotalEmbalagem.Caption := IntToStr(vQtEmbalagem);
  lblTotalPesoBruto.Caption := StringReplace(FormatFloat('##0.000', vQtPesoBruto), ',', '.', [rfReplaceAll]) + ' Kilograms';
  lblTotalVolume.Caption    := StringReplace(FormatFloat('##0.000', vVlCubagem), ',', '.', [rfReplaceAll]) + ' Cubic Meter';
end;

end.
