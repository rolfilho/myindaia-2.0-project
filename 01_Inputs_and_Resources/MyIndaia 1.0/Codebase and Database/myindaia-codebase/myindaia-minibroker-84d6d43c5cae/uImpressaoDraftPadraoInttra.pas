unit uImpressaoDraftPadraoInttra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyForm, RLReport, dxGDIPlusClasses,
  RLFilters, RLPDFFilter, DmGerarArquivosDraft;

type
  TfrmImpressaoDraftPadraoInttra = class(TformMyForm)
    RLReport1: TRLReport;
    RLPDFFilter1: TRLPDFFilter;
    RLGroup1: TRLGroup;
    rlbndCliente_2: TRLBand;
    RLPanel2: TRLPanel;
    RLDBMemo1: TRLDBMemo;
    RLPanel4: TRLPanel;
    rlbndConsig_1: TRLBand;
    RLPanel10: TRLPanel;
    RLPanel11: TRLPanel;
    RLPanel12: TRLPanel;
    RLPanel13: TRLPanel;
    RLLabel8: TRLLabel;
    RLDBMemo9: TRLDBMemo;
    RLLabel9: TRLLabel;
    RLDBMemo10: TRLDBMemo;
    rlbndContactParty: TRLBand;
    RLPanel19: TRLPanel;
    RLPanel20: TRLPanel;
    RLPanel21: TRLPanel;
    RLPanel22: TRLPanel;
    rlbndLocalEmbarque: TRLBand;
    RLPanel23: TRLPanel;
    RLPanel24: TRLPanel;
    RLPanel25: TRLPanel;
    RLPanel26: TRLPanel;
    rlbndOriginOfGoods: TRLBand;
    RLPanel27: TRLPanel;
    RLPanel28: TRLPanel;
    RLPanel29: TRLPanel;
    RLPanel30: TRLPanel;
    rlbndConsolidatorStuffer: TRLBand;
    RLPanel31: TRLPanel;
    RLPanel32: TRLPanel;
    RLPanel33: TRLPanel;
    RLPanel34: TRLPanel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLDBMemo14: TRLDBMemo;
    RLLabel20: TRLLabel;
    RLDBMemo15: TRLDBMemo;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLDBMemo16: TRLDBMemo;
    RLLabel23: TRLLabel;
    RLDBMemo17: TRLDBMemo;
    RLLabel24: TRLLabel;
    rlbndDadosIndaia: TRLBand;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel30: TRLLabel;
    RLImage1: TRLImage;
    RLDBMemo8: TRLDBMemo;
    RLLabel7: TRLLabel;
    SubDetail: TRLSubDetail;
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
    rlbndControltotals: TRLBand;
    rlbndShipperDeclaredValue: TRLBand;
    rlpnlShipperDeclaredValue: TRLPanel;
    RLPanel55: TRLPanel;
    RLLabel39: TRLLabel;
    RLPanel56: TRLPanel;
    RLLabel40: TRLLabel;
    RLLabel42: TRLLabel;
    RLLabel51: TRLLabel;
    RLLabel52: TRLLabel;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLPanel57: TRLPanel;
    RLLabel41: TRLLabel;
    RLDBText11: TRLDBText;
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
    RLDBText14: TRLDBText;
    RLPanel60: TRLPanel;
    RLDBText13: TRLDBText;
    RLPanel61: TRLPanel;
    RLPanel62: TRLPanel;
    rlbndClauses: TRLBand;
    rlpnlClauses: TRLPanel;
    RLLabel43: TRLLabel;
    RLLabel44: TRLLabel;
    RLLabel45: TRLLabel;
    RLLabel46: TRLLabel;
    rlbndDetail: TRLBand;
    RLPanel39: TRLPanel;
    rldbmContainer: TRLDBMemo;
    RLPanel40: TRLPanel;
    rldbmEmbalagem: TRLDBMemo;
    RLPanel41: TRLPanel;
    rldbmMarcacao: TRLDBMemo;
    RLPanel42: TRLPanel;
    rldbmQuantidade: TRLDBMemo;
    RLPanel43: TRLPanel;
    rldbmMercadoria: TRLDBMemo;
    RLPanel44: TRLPanel;
    rldbPesoBruto: TRLDBText;
    RLPanel45: TRLPanel;
    RLDBText18: TRLDBText;
    rldbNrContainer: TRLDBText;
    RLLabel1: TRLLabel;
    RLDBMemo2: TRLDBMemo;
    RLLabel2: TRLLabel;
    RLMemo1: TRLMemo;
    RLPanel9: TRLPanel;
    RLPanel6: TRLPanel;
    RLLabel6: TRLLabel;
    RLDBMemo5: TRLDBMemo;
    RLDBMemo6: TRLDBMemo;
    RLDBMemo7: TRLDBMemo;
    RLLabel10: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLPanel5: TRLPanel;
    RLLabel3: TRLLabel;
    RLDBMemo3: TRLDBMemo;
    RLPanel17: TRLPanel;
    RLPanel8: TRLPanel;
    RLLabel5: TRLLabel;
    RLDBMemo4: TRLDBMemo;
    RLPanel7: TRLPanel;
    RLLabel4: TRLLabel;
    RLLabel61: TRLLabel;
    RLDBMemo21: TRLDBMemo;
    RLDBMemo13: TRLDBMemo;
    RLLabel62: TRLLabel;
    RLLabel63: TRLLabel;
    RLPanel1: TRLPanel;
    RLPanel69: TRLPanel;
    RLLabel70: TRLLabel;
    RLPanel70: TRLPanel;
    RLPanel3: TRLPanel;
    RLPanel14: TRLPanel;
    RLPanel15: TRLPanel;
    RLPanel64: TRLPanel;
    RLPanel65: TRLPanel;
    RLLabel65: TRLLabel;
    RLPanel66: TRLPanel;
    RLLabel66: TRLLabel;
    RLPanel67: TRLPanel;
    RLLabel67: TRLLabel;
    RLPanel68: TRLPanel;
    RLLabel69: TRLLabel;
    RLPanel71: TRLPanel;
    RLPanel16: TRLPanel;
    RLPanel18: TRLPanel;
    RLPanel72: TRLPanel;
    RLPanel73: TRLPanel;
    RLPanel74: TRLPanel;
    RLLabel60: TRLLabel;
    RLLabel47: TRLLabel;
    RLMemo2: TRLMemo;
    RLMemo3: TRLMemo;
    RLMemo10: TRLMemo;
    rlbndControltotals_: TRLBand;
    rlpnlControlTotal: TRLPanel;
    RLLabel34: TRLLabel;
    RLLabel35: TRLLabel;
    RLLabel36: TRLLabel;
    RLLabel37: TRLLabel;
    RLLabel38: TRLLabel;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBMemo11: TRLDBMemo;
    RLMemo11: TRLMemo;
    procedure SubDetailBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rldbmContainerAfterPrint(Sender: TObject);
    procedure rldbmMercadoriaBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  processo: String;
  amend: integer;
  dmGerarArquivosDraft : TdtmGerarArquivosDraft;
  procedure CalcularTamanhoDetail;
  public
    { Public declarations }
   class procedure Execute(processo :string; amend : integer);overload;
   class procedure Execute(processo :string; amend : integer; nomearquivo : string); overload;
   class procedure Execute(processo :string; amend : integer; nomearquivo , email_para, email_copia, email_assunto, email_corpo : string); overload;
  end;

var
  frmImpressaoDraftPadraoInttra: TfrmImpressaoDraftPadraoInttra;

implementation

uses
  FrMain, ConnectionModule, GravaArquivoDigitalizacao;

{$R *.dfm}

class procedure TfrmImpressaoDraftPadraoInttra.Execute(processo :string; amend : integer);
var
  form: TfrmImpressaoDraftPadraoInttra;
begin
  form := TfrmImpressaoDraftPadraoInttra.Create(nil);
  form.processo := processo;
  form.amend := amend;
  form.dmGerarArquivosDraft := TdtmGerarArquivosDraft.Create(nil);

//  if form.dmGerarArquivosDraft.AbrirQueryImpressaoDraftBL(processo, amend) > 0 then
//    form.dmGerarArquivosDraft.AbrirQueryImpressaoDraftBL(processo, amend);

    form.RLReport1.Previewmodal;

  form.dmGerarArquivosDraft.FecharQueriesImpressaoDraftBL;
  form.dmGerarArquivosDraft.free;
  form.Free;
end;

class procedure TfrmImpressaoDraftPadraoInttra.Execute(processo :string; amend : integer; nomearquivo : string);
var
  resultadoDigitalizacao : string;
  form: TfrmImpressaoDraftPadraoInttra;
begin
//  form := TfrmImpressaoDraftPadraoInttra.Create(nil);
//  form.dmGerarArquivosDraft := TdtmGerarArquivosDraft.Create(nil);
//
//  if form.dmGerarArquivosDraft.AbrirQueryImpressaoDraftBL(processo, amend) > 0 then
//  begin
//    form.RLPDFFilter1.FileName := NomeArquivo;
//    form.RLReport1.SaveToFile(NomeArquivo);
//
//    resultadoDigitalizacao := GravaArquivo(FireDacMSSQL.Connection,
//                                           NomeArquivo,
//                                           processo, 'Draft BL - ' + inttostr(amend),
//                                           58,
//                                           true);
//
//    Application.MessageBox(PWideChar(resultadoDigitalizacao), 'Atenção!', MB_OK);
//  end;
//
//  form.dmGerarArquivosDraft.FecharQueriesImpressaoDraftBL;
//  form.dmGerarArquivosDraft.free;
//  form.Free;
end;

class procedure TfrmImpressaoDraftPadraoInttra.Execute(processo :string; amend : integer;
nomearquivo , email_para, email_copia, email_assunto, email_corpo : string);
var
  form: TfrmImpressaoDraftPadraoInttra;
begin
  form := TfrmImpressaoDraftPadraoInttra.Create(nil);
  form.dmGerarArquivosDraft := TdtmGerarArquivosDraft.Create(nil);

  if form.dmGerarArquivosDraft.AbrirQueryImpressaoDraftBL(processo, amend) > 0 then
  begin
    form.RLPDFFilter1.FileName := NomeArquivo;
    form.RLReport1.SaveToFile(NomeArquivo);
    if FireDacMSSQL.EnviaEmail('ti@myindaia.com.br',
                            [email_para] ,
                            [email_copia],
                            [],
                            email_assunto,
                            email_corpo,
                            [NomeArquivo]) then
      Application.MessageBox(PWideChar('E-mail enviado.'), 'Atenção!', MB_OK)
    else
      Application.MessageBox(PWideChar('Erro enviando e-mail.'), 'Atenção!', MB_OK);
  end;

  form.dmGerarArquivosDraft.FecharQueriesImpressaoDraftBL;
  form.dmGerarArquivosDraft.free;
  form.Free;
end;

procedure TfrmImpressaoDraftPadraoInttra.rldbmContainerAfterPrint(Sender: TObject);
begin
  inherited;
//  CalcularTamanhoDetail;
end;

procedure TfrmImpressaoDraftPadraoInttra.rldbmMercadoriaBeforePrint(
  Sender: TObject; var AText: string; var PrintIt: Boolean);
begin
  inherited;
//  if atext = '' then
//    rlbndDetail.Borders.DrawTop := false
//  else
//    rlbndDetail.Borders.DrawTop := true;
//
//  if dmGerarArquivosDraft.qryContainer.RecNo = dmGerarArquivosDraft.qryContainer.RecordCount then
//    rlbndDetail.Borders.DrawBottom := true;
end;

procedure TfrmImpressaoDraftPadraoInttra.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  dmGerarArquivosDraft.AbrirQueryImpressaoDraftBL(processo, amend);
//  dmGerarArquivosDraft.qryDraft.open;
end;

procedure TfrmImpressaoDraftPadraoInttra.SubDetailBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  dmGerarArquivosDraft.AbrirQueryImpressaoDraftBLItens(dmGerarArquivosDraft.qryDraftNR_PROCESSO.AsString, dmGerarArquivosDraft.qryDraftNR_AMEND.AsInteger);
end;

procedure TfrmImpressaoDraftPadraoInttra.CalcularTamanhoDetail;
  var maxHeight : integer;
begin
//  maxHeight := 0;
//
//  if maxHeight < rldbmContainer.Height + rldbNrContainer.Height then
//    maxHeight := rldbmContainer.Height + rldbNrContainer.Height;
//
//  if maxHeight < rldbmEmbalagem.Height then
//    maxHeight := rldbmEmbalagem.Height;
//
//  if maxHeight < rldbmMarcacao.Height then
//    maxHeight := rldbmMarcacao.Height;
//
//  if maxHeight < rldbmQuantidade.Height then
//    maxHeight := rldbmQuantidade.Height;
//
//  if maxHeight < rldbmMercadoria.Height then
//    maxHeight := rldbmMercadoria.Height;
//
//  rlbndDetail.Height :=  maxHeight + 10;

end;

end.
