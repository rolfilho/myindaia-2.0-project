unit URelBorderoNestlePOR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, RLFilters, RLPDFFilter;

type
  TfrmRelBorderoNestlePOR = class(TForm)
    RLReport1: TRLReport;
    RLGroup1: TRLGroup;
    RL1Header: TRLBand;
    RLPanel2: TRLPanel;
    RLLabel2: TRLLabel;
    RLLabel1: TRLLabel;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    rlLogo: TRLImage;
    RL2Detail: TRLBand;
    RLPanel8: TRLPanel;
    RLPanel9: TRLPanel;
    rlSaqueOriginal: TRLLabel;
    rlSaqueCopia: TRLLabel;
    rlFaturaComercialCopia: TRLLabel;
    rlFaturaComercialOriginal: TRLLabel;
    rlCertificadoOrigemCopia: TRLLabel;
    rlCertificadoOrigemOriginal: TRLLabel;
    rlCertificadoSeguroCopia: TRLLabel;
    rlCertificadoSeguroOriginal: TRLLabel;
    rlConhecimentoEmbarqueCopia: TRLLabel;
    rlConhecimentoEmbarqueOriginal: TRLLabel;
    rlPackingListCopia: TRLLabel;
    rlPackingListOriginal: TRLLabel;
    rlCertificadoInspecaoCopia: TRLLabel;
    rlCertificadoInspecaoOriginal: TRLLabel;
    rlCertificadoQualidadeCopia: TRLLabel;
    rlCertificadoQualidadeOriginal: TRLLabel;
    rlCartaCreditoCopia: TRLLabel;
    rlCartaCreditoOriginal: TRLLabel;
    rlEmendaLCCopia: TRLLabel;
    rlEmendaLCOriginal: TRLLabel;
    rlCartaClienteCopia: TRLLabel;
    rlCartaClienteOriginal: TRLLabel;
    rlExtra1Copia: TRLLabel;
    rlExtra1Original: TRLLabel;
    rlExtra2Copia: TRLLabel;
    rlExtra2Original: TRLLabel;
    rlExtra3Copia: TRLLabel;
    rlExtra3Original: TRLLabel;
    RLPanel10: TRLPanel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLDraw19: TRLDraw;
    RLDraw20: TRLDraw;
    RLDraw21: TRLDraw;
    RLDraw22: TRLDraw;
    RLDraw23: TRLDraw;
    RLDraw24: TRLDraw;
    RLDraw25: TRLDraw;
    RLDraw26: TRLDraw;
    RLDraw27: TRLDraw;
    RLDraw28: TRLDraw;
    RLDraw29: TRLDraw;
    RLDraw30: TRLDraw;
    RLDraw31: TRLDraw;
    RLDraw32: TRLDraw;
    rlTextoExtra3: TRLLabel;
    rlTextoExtra2: TRLLabel;
    rlTextoExtra1: TRLLabel;
    rlSaque: TRLLabel;
    rlFaturaComercial: TRLLabel;
    rlCertificadoOrigem: TRLLabel;
    rlCertificadoSeguro: TRLLabel;
    rlConhecimento: TRLLabel;
    rlPackingList: TRLLabel;
    rlCertificadoInspecao: TRLLabel;
    rlCertificadoQualidade: TRLLabel;
    rlCartaCredito: TRLLabel;
    rlEmendaLC: TRLLabel;
    rlCartaCliente: TRLLabel;
    rlExtra1: TRLLabel;
    rlExtra3: TRLLabel;
    rlExtra2: TRLLabel;
    RLPanel11: TRLPanel;
    RLPanel12: TRLPanel;
    RLLabel90: TRLLabel;
    RLLabel91: TRLLabel;
    RLLabel92: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel41: TRLLabel;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    RLDraw4: TRLDraw;
    RLDraw5: TRLDraw;
    rlTelegrama: TRLLabel;
    rlViaAerea: TRLLabel;
    rlFaltaAceitePagamento: TRLLabel;
    rlPagamentoEfetuado: TRLLabel;
    rlRemessaFundos: TRLLabel;
    RLPanel13: TRLPanel;
    RLLabel49: TRLLabel;
    RLLabel50: TRLLabel;
    RLLabel51: TRLLabel;
    RLLabel52: TRLLabel;
    RLLabel53: TRLLabel;
    RLLabel54: TRLLabel;
    RLLabel55: TRLLabel;
    RLLabel56: TRLLabel;
    RLLabel57: TRLLabel;
    RLLabel58: TRLLabel;
    RLLabel59: TRLLabel;
    RLDraw8: TRLDraw;
    rlEntregarDocPagamento: TRLDraw;
    RLDraw10: TRLDraw;
    RLDraw11: TRLDraw;
    RLDraw12: TRLDraw;
    RLDraw13: TRLDraw;
    RLDraw14: TRLDraw;
    RLDraw15: TRLDraw;
    RLDraw16: TRLDraw;
    RLDraw17: TRLDraw;
    RLDraw18: TRLDraw;
    rlEnviarDocBancoExterior: TRLLabel;
    rlEntregarDocumentosContaPgmto: TRLLabel;
    rlEntregarDocumentosContraAceite: TRLLabel;
    rlNaoProtestar: TRLLabel;
    rlProtestarFaltaAceite: TRLLabel;
    rlProtestarFaltaPgmto: TRLLabel;
    rlCobrarJuros: TRLLabel;
    rlDespesasCorrespondenteSacado: TRLLabel;
    rlDespesasSacado: TRLLabel;
    rlDespesasNossaConta: TRLLabel;
    rlTodasDespesasNossaConta: TRLLabel;
    RLLabel22: TRLLabel;
    RLPanel14: TRLPanel;
    RLLabel60: TRLLabel;
    RLPanel15: TRLPanel;
    RLLabel43: TRLLabel;
    RLLabel44: TRLLabel;
    RLDraw6: TRLDraw;
    rlEncaminharDocCarteira: TRLLabel;
    RLPanel16: TRLPanel;
    RLDraw7: TRLDraw;
    rlEnviadoExteriorCourier: TRLLabel;
    RLPanel17: TRLPanel;
    RLLabel46: TRLLabel;
    RLLabel47: TRLLabel;
    RLPanel5: TRLPanel;
    RLPanel7: TRLPanel;
    RLLabel14: TRLLabel;
    RLPanel6: TRLPanel;
    RLLabel15: TRLLabel;
    RLPanel50: TRLPanel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLPanel51: TRLPanel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    RLLabel35: TRLLabel;
    RLLabel36: TRLLabel;
    RLLabel37: TRLLabel;
    RLLabel38: TRLLabel;
    RLLabel39: TRLLabel;
    RLLabel40: TRLLabel;
    RLPanel52: TRLPanel;
    RLLabel27: TRLLabel;
    RLPanel3: TRLPanel;
    RLPanel53: TRLPanel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel29: TRLLabel;
    RLDBText16: TRLDBText;
    RLLabel28: TRLLabel;
    RLPanel54: TRLPanel;
    RLLabel42: TRLLabel;
    RLPanel1: TRLPanel;
    RLPanel4: TRLPanel;
    RLLabel61: TRLLabel;
    RLDBText7: TRLDBText;
    RLLabel18: TRLLabel;
    RLDBText12: TRLDBText;
    RLPDFFilter1: TRLPDFFilter;
    rlUsuarioImpressao: TRLLabel;
    rlmmObservacoes: TRLMemo;
    RLDBMemo1: TRLDBMemo;
    RLDBText8: TRLDBText;
    RLLabel19: TRLLabel;
    RLDBText15: TRLDBText;
    RLDBText5: TRLDBText;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    ImprimirUsuario : boolean;
    function PrepararRelatorio(nrProcesso : String): Boolean;
  end;

var
  frmRelBorderoNestlePOR: TfrmRelBorderoNestlePOR;

implementation

uses datm_RelatoriosNestle, PGGP001, ConsOnLineEx, PGGP017;

{$R *.dfm}

function tfrmRelBorderoNestlePOR.PrepararRelatorio(nrProcesso : String) :Boolean;
begin
  datm_RelatorioNestle.cdsBordero.Close;
  datm_RelatorioNestle.qryBordero.SQL.Text := datm_RelatorioNestle.GetSqlBordero(NrProcesso);
  datm_RelatorioNestle.cdsBordero.open;

  if datm_RelatorioNestle.cdsBordero.recordCount > 0 then
    result := true
  else
    result := false;
end;

procedure TfrmRelBorderoNestlePOR.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
 try
 if datm_RelatorioNestle.cdsBordero.FieldByName('PATH_LOGO').AsString <> '' then
    rlLogo.Picture.LoadFromFile( cDir_Rpt + '\' + Trim(datm_RelatorioNestle.cdsBordero.FieldByName('PATH_LOGO').AsString));
 except on e : Exception do
 end;

  rlUsuarioImpressao.Caption := ConsultaLookUPSQL('SELECT NM_USUARIO FROM TUSUARIO (NOLOCK) WHERE CD_USUARIO = "' + str_cd_usuario + '" ',
                                                  'NM_USUARIO');

  rlUsuarioImpressao.visible :=  ImprimirUsuario;
end;

end.
