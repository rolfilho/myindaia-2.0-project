unit URelatoriosNestle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, ComCtrls, Grids, DBGrids,
  Mask, ComObj, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxGroupBox;


  type TdadosEmail = Record
     Remetente : string;
     Destinatario : String;
     Assunto : String;
     Corpo : TStringList;
     Anexos : TStringList;
     PdfWord : String;
  end;

  type TtipoRelatorio = Record
       Tipo : Integer;
       DadosEmail : TdadosEmail
  end;

type
  TfrmRelatoriosNestle = class(TForm)
    pnlFundo: TPanel;
    pnlGerarRelatorio: TPanel;
    pnlTitulo: TPanel;
    SpeedButton1: TSpeedButton;
    btnVisualizar: TSpeedButton;
    lblNomeRelatorio: TLabel;
    pgFiltros: TPageControl;
    tbProgramacaoRodoviaria: TTabSheet;
    tbBordero: TTabSheet;
    tbPackingList: TTabSheet;
    tbFaturaComercial: TTabSheet;
    mmObservacoesProgRodoviaria: TMemo;
    lblObservacoesProgRodoviaria: TLabel;
    gbAvisoPor: TGroupBox;
    chbTelegrama: TCheckBox;
    chbViaAerea: TCheckBox;
    gbObseracao1: TGroupBox;
    chbFaltaAceitePagamento: TCheckBox;
    chbPagamentoEfetuado: TCheckBox;
    chbRemessaFundos: TCheckBox;
    GroupBox1: TGroupBox;
    chbEnviarDocBancoExterior: TCheckBox;
    chbEntregarDocumentosContaPgmto: TCheckBox;
    chbEntregarDocumentosContraAceite: TCheckBox;
    chbNaoProtestar: TCheckBox;
    chbProtestarFaltaAceite: TCheckBox;
    chbProtestarFaltaPgmto: TCheckBox;
    chbCobrarJuros: TCheckBox;
    chbDespesasCorrespondenteSacado: TCheckBox;
    chbDespesasSacado: TCheckBox;
    chbTodasDespesasNossaConta: TCheckBox;
    chbDespesasNossaConta: TCheckBox;
    GroupBox2: TGroupBox;
    chbSaque: TCheckBox;
    chbFaturaComercial: TCheckBox;
    chbCertificadoOrigem: TCheckBox;
    chbCertificadoSeguro: TCheckBox;
    chbConhecimento: TCheckBox;
    chbPackingList: TCheckBox;
    chbCertificadoInspecao: TCheckBox;
    chbCertificadoQualidade: TCheckBox;
    chbCartaCredito: TCheckBox;
    chbCartaCliente: TCheckBox;
    chbEmendaLC: TCheckBox;
    chbExtra3: TCheckBox;
    chbExtra2: TCheckBox;
    chbExtra1: TCheckBox;
    edtExtra1: TEdit;
    edtExtra2: TEdit;
    edtExtra3: TEdit;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edtCertificadoOrigemOriginal: TEdit;
    edtCertificadoOrigemCopia: TEdit;
    edtCertificadoSeguroOriginal: TEdit;
    edtCertificadoSeguroCopia: TEdit;
    edtConhecimentoEmbarqueOriginal: TEdit;
    edtConhecimentoEmbarqueCopia: TEdit;
    edtPackingListOriginal: TEdit;
    edtPackingListCopia: TEdit;
    edtCertificadoInspecaoOriginal: TEdit;
    edtCertificadoInspecaoCopia: TEdit;
    edtCertificadoQualidadeOriginal: TEdit;
    edtCertificadoQualidadeCopia: TEdit;
    edtCartaCreditoOriginal: TEdit;
    edtCartaCreditoCopia: TEdit;
    edtEmendaLCOriginal: TEdit;
    edtEmendaLCCopia: TEdit;
    edtCartaClienteOriginal: TEdit;
    edtCartaClienteCopia: TEdit;
    edtExtra1Original: TEdit;
    edtExtra1Copia: TEdit;
    edtExtra2Original: TEdit;
    edtExtra2Copia: TEdit;
    edtExtra3Original: TEdit;
    edtExtra3Copia: TEdit;
    edtFaturaComercialOriginal: TEdit;
    edtFaturaComercialCopia: TEdit;
    edtSaqueOriginal: TEdit;
    edtSaqueCopia: TEdit;
    GroupBox4: TGroupBox;
    chbEncaminharDocCarteira: TCheckBox;
    chbEnviadoExteriorCourier: TCheckBox;
    rgLotePackingList: TRadioGroup;
    rgIdiomaPackingList: TRadioGroup;
    rgIdioma: TRadioGroup;
    rgTipo: TRadioGroup;
    rgTitulo: TRadioGroup;
    tbShippingInstructions: TTabSheet;
    edtShipOwners: TEdit;
    lblShipOwners: TLabel;
    SpeedButton3: TSpeedButton;
    pgPrincipal: TPageControl;
    tbProcesso: TTabSheet;
    tbInstrucao: TTabSheet;
    lblNrProcesso: TLabel;
    lblUnidadeNeg: TLabel;
    Label2: TLabel;
    edtNrProcesso: TEdit;
    edUnidade: TEdit;
    cbUnidade: TDBLookupComboBox;
    edtProduto: TEdit;
    cbProduto: TDBLookupComboBox;
    Label1: TLabel;
    edtNumeroFornecimento: TEdit;
    tbInstrucaoEmbarque: TTabSheet;
    dbgDisponiveis: TDBGrid;
    btnSeleciona: TBitBtn;
    btnVoltaTodos: TBitBtn;
    btnSelecionaTodos: TBitBtn;
    btnVolta: TBitBtn;
    btnPesquisar: TBitBtn;
    cbStatus: TComboBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DataInclusaoInicial: TMaskEdit;
    DataInclusaoFinal: TMaskEdit;
    edtQtRegistros: TEdit;
    Label14: TLabel;
    dbgSelecionadas: TDBGrid;
    Label15: TLabel;
    Label16: TLabel;
    rgVersao: TRadioGroup;
    rgVersaoPackingList: TRadioGroup;
    tsCaricom: TTabSheet;
    rgVersaoCaricom: TRadioGroup;
    edtCoordenador: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    edtCpfCaricom: TEdit;
    chbImprimirUsuarioPackingList: TCheckBox;
    chbImprimirUsuarioFaturaComercial: TCheckBox;
    chbImprimirUsuarioBordero: TCheckBox;
    mmObservacaoBordero: TMemo;
    Label19: TLabel;
    rgTipoAgrupamento: TRadioGroup;
    dblkContainers: TDBLookupComboBox;
    rgImprimirNCM: TRadioGroup;
    rgIsentoRegistro: TRadioGroup;
    tbsVigilanciaSanitaria: TTabSheet;
    rgIdiomaCertificadoVigilanciaSanitaria: TRadioGroup;
    tbsSaque: TTabSheet;
    TabSheet1: TTabSheet;
    lblMensagens: TLabel;
    rgControle: TRadioGroup;
    cxGroupBox1: TcxGroupBox;
    dblkMercadoriasFatura: TDBLookupComboBox;
    dblkContainersFatura: TDBLookupComboBox;
    rgIFaturaPorCntrOuMerc: TRadioGroup;
    procedure btnVisualizarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edUnidadeExit(Sender: TObject);
    procedure edtProdutoExit(Sender: TObject);
    procedure edUnidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbUnidadeCloseUp(Sender: TObject);
    procedure cbProdutoCloseUp(Sender: TObject);
    procedure cbUnidadeExit(Sender: TObject);
    procedure cbProdutoExit(Sender: TObject);
    procedure cbProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbUnidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSelecionaClick(Sender: TObject);
    procedure btnVoltaClick(Sender: TObject);
    procedure btnSelecionaTodosClick(Sender: TObject);
    procedure btnVoltaTodosClick(Sender: TObject);
    procedure dbgDisponiveisDblClick(Sender: TObject);
    procedure dbgSelecionadasDblClick(Sender: TObject);
    procedure rgTipoAgrupamentoClick(Sender: TObject);
    procedure edtNrProcessoChange(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
    procedure rgIFaturaPorCntrOuMercClick(Sender: TObject);

  private
    { Private declarations }
    procedure BuscarCodigoProduto;
    procedure BuscarCodigoUnidadeNeg;
    procedure PreencherCodigoProduto;
    procedure PreencherCodigoUnidadeNeg;
    procedure PreencherIdioma;

    procedure GeraRelProgramacaoRodoviaria(nr_processo : String; tipoRelatorio : TtipoRelatorio);
    procedure GeraRelSaque(nr_processo :String; tipoRelatorio : TtipoRelatorio);
    procedure GeraRelInternalExportDocument(nr_processo: String; tipoRelatorio : TtipoRelatorio);
    procedure GeraRelBordero(nr_processo :string; tipoRelatorio : TtipoRelatorio);
    procedure GeraRelCaricom(nr_processo :string; tipoRelatorio : TtipoRelatorio);
    procedure GeraRelInstrucaoEmbarque(tipoRelatorio : TtipoRelatorio);
    procedure GeraPackingList(nr_processo :string; tipoRelatorio : TtipoRelatorio);
    procedure GeraFaturaComercial(nr_processo :string; tipoRelatorio : TtipoRelatorio);
    procedure GeraShippingInstructions(nr_fornecimento :string; tipoRelatorio : TtipoRelatorio);
    procedure GeraCertificadoVigilanciaSanitaria(nr_processo :string; tipoRelatorio : TtipoRelatorio);
    procedure GerarRelatorio(tipoRelatorio : TtipoRelatorio);
    function EnviarEmail(Arquivo : String; dadosEmail : TDadosEmail) : boolean;

    procedure ValidaNrProcesso;
    function LocalizarPagina(tagPagina : Integer) : integer;
  public
    { Public declarations }
    TipoRelatorio : Integer;
    atualizarSeqProgRodoviaria : Boolean;
  private
    path : String;
    DadosImpressao : TTipoRelatorio;
    eMailUsuario : string;
  end;
  const
   TELA  = 0;
   EMAIL = 1;

var
  frmRelatoriosNestle: TfrmRelatoriosNestle;

implementation

uses URelProgramacaoRodoviariaNestlePOR, datm_RelatoriosNestle,
     URelSaqueNestleING, URelInternalExportDocumentNestleESP,
     URelBorderoNestlePOR, URelCaricomNestleING,
     URelOrdemLiberacaoProcessoNestlePOR, URelPackingListNestleESP,
     URelProformaNestleING, URelShippingInstructionsNestle,
     uRelCertificadoVigilanciaSanitariaNestle,
     PGGP017, GSMLIB, uRelatoriosNestleConfigEmail, ConsOnLineEx;

{$R *.dfm}

procedure TfrmRelatoriosNestle.btnVisualizarClick(Sender: TObject);
begin
  lblMensagens.visible := false;

  DadosImpressao.tipo  := TELA;
  GerarRelatorio(DadosImpressao);
end;

procedure TfrmRelatoriosNestle.SpeedButton3Click(Sender: TObject);
begin
  try
    lblMensagens.visible := false;

    frmRelatoriosNestleConfigEmail := tfrmRelatoriosNestleConfigEmail.create(Application);
    frmRelatoriosNestleConfigEmail.edtRemetente.text := eMailUsuario;
    frmRelatoriosNestleConfigEmail.edtDestino.text := eMailUsuario + ';';    
    if frmRelatoriosNestleConfigEmail.ShowModal = mrOk then
    begin
      DadosImpressao.tipo := EMAIL;
      DadosImpressao.DadosEmail := frmRelatoriosNestleConfigEmail.dadosEmail;
      GerarRelatorio(DadosImpressao);
    end;
  finally
    frmRelatoriosNestleConfigEmail.free;
  end
end;

procedure TfrmRelatoriosNestle.GerarRelatorio(tipoRelatorio : TtipoRelatorio);
var
  nr_processo : string;
begin
  if pgFiltros.ActivePage.Tag <> 5 then
  begin
    ValidaNrProcesso;
    nr_processo :=  cbUnidade.KeyValue + cbProduto.KeyValue +  trim(edtNrProcesso.text);
  end;

  case pgFiltros.ActivePage.Tag of
    0 :
      GeraRelProgramacaoRodoviaria(nr_processo, tipoRelatorio);
    1 :
      GeraRelSaque(nr_processo, tipoRelatorio);
    2 :
      GeraRelInternalExportDocument(nr_processo, tipoRelatorio);
    3 :
      GeraRelBordero(nr_processo, tipoRelatorio);
    4:
      GeraRelCaricom(nr_processo, tipoRelatorio);
    5:
      GeraRelInstrucaoEmbarque(tipoRelatorio);
    6:
      GeraPackingList(nr_processo, tipoRelatorio);
    7:
      GeraFaturaComercial(nr_processo, tipoRelatorio);
    8:
      GeraShippingInstructions(nr_processo, tipoRelatorio);
    9:
      GeraCertificadoVigilanciaSanitaria(nr_processo, tipoRelatorio);
  end;
end;

procedure TfrmRelatoriosNestle.GeraShippingInstructions(nr_fornecimento :string; tipoRelatorio : TtipoRelatorio);
var
  NomeArquivo : string;
begin
  try
    frmRelShippingInstructionsNestle := tfrmRelShippingInstructionsNestle.Create(nil);

    if frmRelShippingInstructionsNestle.PrepararRelatorio(nr_fornecimento, edtShipOwners.text) then
    begin
      if tipoRelatorio.tipo = TELA then
        frmRelShippingInstructionsNestle.RLReport1.PreviewModal
      else
      if tipoRelatorio.tipo = EMAIL then
      begin
        NomeArquivo := path + 'SI_' + FormatDateTime('ddmmyyyhhmm', now) + '.pdf';
        frmRelShippingInstructionsNestle.RLPDFFilter1.FileName := NomeArquivo;
        frmRelShippingInstructionsNestle.RLReport1.SaveToFile(NomeArquivo);
        EnviarEmail(NomeArquivo, tipoRelatorio.dadosEmail);
      end;
    end
    else
      lblMensagens.visible := true;
  finally
    FreeAndNil(frmRelShippingInstructionsNestle);
  end;
end;

procedure TfrmRelatoriosNestle.GeraPackingList(nr_processo :string; tipoRelatorio : TtipoRelatorio);
var
  NomeArquivo, nrContainer : string;
  frmRelCopia : TfrmRelPackingListNestleESP;
begin
                                                   
  datm_RelatorioNestle.qryValidacaoContainerM.Close;
  datm_RelatorioNestle.qryValidacaoContainerM.SQL.Text := datm_RelatorioNestle.GetSqlValidaContainerMaritimo(nr_processo);
  datm_RelatorioNestle.qryValidacaoContainerM.Open;

  if datm_RelatorioNestle.qryValidacaoContainerMCOUNT_CNTR.AsInteger > 0 then
  begin
    ShowMessage('Para a emissão deste Packing List é obrigatório que exista container vinculado ao processo.');
    Exit;
  end;

  try
    frmRelPackingListNestleESP := TfrmRelPackingListNestleESP.Create(nil);
    frmRelCopia := TfrmRelPackingListNestleESP.Create(nil);

    if rgIdiomaPackingList.ItemIndex = 0 then //ingles
      if rgTitulo.ItemIndex = 0 then
      begin
        frmRelPackingListNestleESP.rlTitulo.caption := 'Packing List';
        frmRelCopia.rlTitulo.caption := 'Packing List';
      end
      else
       if rgTitulo.ItemIndex = 1 then
       begin
         frmRelPackingListNestleESP.rlTitulo.caption := 'Bath Mark List';
         frmRelCopia.rlTitulo.caption := 'Bath Mark List';
       end;

    if rgLotePackingList.itemIndex = 0 then
    begin
      frmRelPackingListNestleESP.ImprimirLote := true;
      frmRelCopia.ImprimirLote := true;
    end
    else
    begin
      frmRelPackingListNestleESP.ImprimirLote := false;
      frmRelCopia.ImprimirLote := false;
    end;

    if rgIdiomaPackingList.ItemIndex = 0 then
    begin
      frmRelPackingListNestleESP.Idioma := 'Ingles';
      frmRelCopia.Idioma := 'Ingles';
    end
    else
      if rgIdiomaPackingList.ItemIndex = 1 then
      begin
        frmRelPackingListNestleESP.Idioma := 'Espanhol';
        frmRelCopia.Idioma := 'Espanhol';
      end;

    if rgVersaoPackingList.ItemIndex = 0 then
    begin
      frmRelPackingListNestleESP.rlVersaoFatura.caption := 'ORIGINAL';
      if rgIdiomaPackingList.ItemIndex = 0 then
        frmRelCopia.rlVersaoFatura.caption := 'COPY'
      else
      if rgIdiomaPackingList.ItemIndex = 1 then
        frmRelCopia.rlVersaoFatura.caption := 'COPIA';
    end;
    if rgVersaoPackingList.ItemIndex = 1 then
    begin
      frmRelPackingListNestleESP.rlVersaoFatura.caption := 'ORIGINAL';
    end;
    if rgVersaoPackingList.ItemIndex = 2 then
    begin
      if rgIdiomaPackingList.ItemIndex = 0 then
        frmRelPackingListNestleESP.rlVersaoFatura.caption := 'COPY'
      else
      if rgIdiomaPackingList.ItemIndex = 1 then
        frmRelPackingListNestleESP.rlVersaoFatura.caption := 'COPIA';
    end;

    if chbImprimirUsuarioPackingList.checked then
    begin
      frmRelPackingListNestleESP.ImprimirUsuario := true;
      frmRelCopia.ImprimirUsuario := true
    end
    else
    begin
      frmRelPackingListNestleESP.ImprimirUsuario := false;
      frmRelCopia.ImprimirUsuario := false;
    end;

    if rgTipoAgrupamento.ItemIndex = 2 then
      if (dblkContainers.keyValue = '') or (dblkContainers.keyValue = null) then
      begin
        ShowMessage('Selecione o container.');
        abort;
      end
      else
        nrContainer := dblkContainers.keyValue
    else
       nrContainer := '';

    if frmRelPackingListNestleESP.PrepararRelatorio(nr_processo, inttostr(rgTipoAgrupamento.itemindex), nrContainer) then
    begin
      if rgVersaoPackingList.ItemIndex = 0 then
      begin
        frmRelCopia.PrepararRelatorio(nr_processo, inttostr(rgTipoAgrupamento.itemindex), nrContainer);
        frmRelPackingListNestleESP.RLReport1.NextReport := frmRelCopia.RLReport1;
      end;  

      if tipoRelatorio.tipo = TELA then
        frmRelPackingListNestleESP.RLReport1.PreviewModal
      else
      if tipoRelatorio.tipo = EMAIL then
      begin
        NomeArquivo := path + 'PL_' + FormatDateTime('ddmmyyyhhmm', now) + '.pdf';
        frmRelPackingListNestleESP.RLPDFFilter.FileName := NomeArquivo;
        frmRelPackingListNestleESP.RLReport1.SaveToFile(NomeArquivo);
        EnviarEmail(NomeArquivo, tipoRelatorio.dadosEmail);
      end;
    end
    else
      lblMensagens.visible := true;
  finally
    FreeAndNil(frmRelPackingListNestleESP);
  end;
end;

procedure TfrmRelatoriosNestle.GeraFaturaComercial(nr_processo :string; tipoRelatorio : TtipoRelatorio);
var
  NomeArquivo, nrContainer, nrMercadoria : string;
  frmRelCopia :TfrmRelProformaNestleING;
begin
  try
    frmRelProformaNestleING := TfrmRelProformaNestleING.Create(nil);
    frmRelCopia := TfrmRelProformaNestleING.Create(nil);

    if rgTipo.itemIndex = 0 then
    begin
      frmRelProformaNestleING.rlTipoFatura.caption := 'PROFORMA INVOICE';
      frmRelCopia.rlTipoFatura.caption             := 'PROFORMA INVOICE';
    end
    else
    if rgTipo.itemIndex = 1 then
    begin
      if rgIdioma.ItemIndex = 0 then
      begin
        frmRelProformaNestleING.rlTipoFatura.caption := 'COMMERCIAL INVOICE';
        frmRelCopia.rlTipoFatura.caption             := 'COMMERCIAL INVOICE'
      end
      else
      begin
        frmRelProformaNestleING.rlTipoFatura.caption := 'FACTURA COMERCIAL';
        frmRelCopia.rlTipoFatura.caption             := 'FACTURA COMERCIAL';
      end
    end
    else
    if rgTipo.itemIndex = 2 then
    begin
      if rgIdioma.ItemIndex = 0 then
      begin
        frmRelProformaNestleING.rlTipoFatura.caption := 'INVOICE';
        frmRelCopia.rlTipoFatura.caption             := 'INVOICE'
      end
      else
      begin
        frmRelProformaNestleING.rlTipoFatura.caption := 'FACTURA';
        frmRelCopia.rlTipoFatura.caption             := 'FACTURA';
      end
    end
    else
    if rgTipo.itemIndex = 3 then
    begin
      frmRelProformaNestleING.rlTipoFatura.caption := 'PROFORMA INVOICE';
      frmRelCopia.rlTipoFatura.caption             := 'PROFORMA INVOICE';
    end;

    if rgIdioma.ItemIndex = 0 then
    begin
      frmRelProformaNestleING.Idioma := 'Ingles';
      frmRelCopia.Idioma             := 'Ingles';
    end
    else
      if rgIdioma.ItemIndex = 1 then
      begin
        frmRelProformaNestleING.Idioma := 'Espanhol';
        frmRelCopia.Idioma             := 'Espanhol';
      end;


    if rgTipo.ItemIndex in [1,2] then {Só imprimir a versão da Fatura quando o tipo for Fatura Comercial(1) ou Fatura(2)}
    begin
      if rgVersao.ItemIndex = 0 then
      begin
        frmRelProformaNestleING.rlVersaoFatura.caption := 'ORIGINAL';
        if rgIdioma.ItemIndex = 0 then
          frmRelCopia.rlVersaoFatura.caption := 'COPY'
        else
        if rgIdioma.ItemIndex = 1 then
          frmRelCopia.rlVersaoFatura.caption := 'COPIA'
      end;

      if rgVersao.ItemIndex = 1 then
      begin
        frmRelProformaNestleING.rlVersaoFatura.caption := 'ORIGINAL';
      end;

      if rgVersao.ItemIndex = 2then
      begin
        if rgIdioma.ItemIndex = 0 then
          frmRelProformaNestleING.rlVersaoFatura.caption := 'COPY'
        else
        if rgIdioma.ItemIndex = 1 then
          frmRelProformaNestleING.rlVersaoFatura.caption := 'COPIA'
      end;
    end
    else
    begin
      frmRelProformaNestleING.rlVersaoFatura.caption := '';
      frmRelCopia.rlVersaoFatura.caption := ''
    end;


    if rgIsentoRegistro.ItemIndex = 0 then
    begin
      frmRelProformaNestleING.IsentoRegistro := false;
      frmRelCopia.IsentoRegistro := false;
    end
    else
      if rgIsentoRegistro.ItemIndex = 1 then
      begin
        frmRelProformaNestleING.IsentoRegistro := true;
        frmRelCopia.IsentoRegistro := true;
      end;

    if chbImprimirUsuarioFaturaComercial.checked then
    begin
      frmRelProformaNestleING.ImprimirUsuario := true;
      frmRelCopia.ImprimirUsuario := true;
    end
    else
    begin
      frmRelProformaNestleING.ImprimirUsuario := false;
      frmRelCopia.ImprimirUsuario := false;
    end;

    nrContainer := '';
    nrMercadoria := '';
    if rgIFaturaPorCntrOuMerc.ItemIndex = 1 then
    begin
      if (dblkContainersFatura.keyValue = '') or (dblkContainersFatura.keyValue = null) then
      begin
        ShowMessage('Selecione o container.');
        abort;
      end
      else
        nrContainer := dblkContainersFatura.keyValue
    end
    else if rgIFaturaPorCntrOuMerc.ItemIndex = 2 then
    begin
      if (dblkMercadoriasFatura.keyValue = '') or (dblkMercadoriasFatura.keyValue = null) then
      begin
        ShowMessage('Selecione uma mercadoria.');
        abort;
      end
      else
        nrMercadoria := dblkMercadoriasFatura.keyValue
    end;

    if frmRelProformaNestleING.PrepararRelatorio(nr_processo, rgImprimirNCM.itemIndex,
                                                 rgIFaturaPorCntrOuMerc.ItemIndex = 1, rgIFaturaPorCntrOuMerc.ItemIndex = 2, rgTipo.itemIndex = 3, rgControle.itemIndex = 1, nrContainer, nrMercadoria) then
    begin
      if rgVersao.ItemIndex = 0 then
      begin
        frmRelCopia.PrepararRelatorio(nr_processo, rgImprimirNCM.itemIndex, rgIFaturaPorCntrOuMerc.ItemIndex = 1, rgIFaturaPorCntrOuMerc.ItemIndex = 2, rgTipo.itemIndex = 3, rgControle.itemIndex = 1, nrContainer, nrMercadoria);
        frmRelProformaNestleING.RLReport1.NextReport := frmRelCopia.RLReport1;
      end;

      if tipoRelatorio.tipo = TELA then
      begin
        frmRelProformaNestleING.RLReport1.PreviewModal;
      end
      else
      if tipoRelatorio.tipo = EMAIL then
      begin
        NomeArquivo := path + 'FT_' + FormatDateTime('ddmmyyyhhmm', now) + '.pdf';
        frmRelProformaNestleING.RLPDFFilter1.FileName := NomeArquivo;
        frmRelProformaNestleING.RLReport1.SaveToFile(NomeArquivo);
        EnviarEmail(NomeArquivo, tipoRelatorio.dadosEmail);
      end;
    end
    else
      lblMensagens.visible := true;
  finally
    FreeAndNil(frmRelProformaNestleING);
    FreeAndNil(frmRelCopia);
  end;
end;

procedure TfrmRelatoriosNestle.GeraCertificadoVigilanciaSanitaria(nr_processo :string; tipoRelatorio : TtipoRelatorio);
var
  NomeArquivo, NomeArquivoWord: string;
  WinWord, Docs, Doc: Variant;
begin
  try
    frmRelCertificadoVigilanciaSanitariaNestle := TfrmRelCertificadoVigilanciaSanitariaNestle.Create(nil);

    if frmRelCertificadoVigilanciaSanitariaNestle.PrepararRelatorio(nr_processo, rgIdiomaCertificadoVigilanciaSanitaria.itemIndex) then
    begin
      if tipoRelatorio.tipo = TELA then
        frmRelCertificadoVigilanciaSanitariaNestle.RLReport1.PreviewModal
      else
      if tipoRelatorio.tipo = EMAIL then
      begin
        NomeArquivo := path + 'CVS_' + FormatDateTime('ddmmyyyhhmm', now);
        if uppercase(tipoRelatorio.DadosEmail.PdfWord) = 'P' then
        begin
          NomeArquivo := NomeArquivo + '.pdf';
          frmRelCertificadoVigilanciaSanitariaNestle.RLPDFFilter1.FileName := NomeArquivo;
          frmRelCertificadoVigilanciaSanitariaNestle.RLReport1.SaveToFile(NomeArquivo);
        end
        else
        begin
          NomeArquivo := NomeArquivo + '.rtf';
          frmRelCertificadoVigilanciaSanitariaNestle.RLRichFilter1.FileName := NomeArquivo;
          frmRelCertificadoVigilanciaSanitariaNestle.RLReport1.SaveToFile(NomeArquivo);
          WinWord := CreateOleObject('Word.Application');
          Doc:= WinWord.Documents.Open(NomeArquivo);
          NomeArquivoWord := StringReplace(NomeArquivo, 'rtf', 'doc', [rfReplaceAll]);
          Doc.SaveAs(NomeArquivoWord);
          WinWord.Quit;
          deletefile(NomeArquivo);
          NomeArquivo := NomeArquivoWord;
        end;
        EnviarEmail(NomeArquivo, tipoRelatorio.dadosEmail);
      end;
    end
    else
      lblMensagens.visible := true;
  finally
    FreeAndNil(frmRelCertificadoVigilanciaSanitariaNestle);
  end;
end;

procedure TfrmRelatoriosNestle.GeraRelInstrucaoEmbarque(tipoRelatorio : TtipoRelatorio);
var
  NomeArquivo, nr_fornecimento : string;
  i :integer;
begin
  try
    frmRelOrdemLiberacaoProcessoNestlePOR := tfrmRelOrdemLiberacaoProcessoNestlePOR.Create(nil);

    if datm_RelatorioNestle.cdsRapsSelecionadas.isempty then
    begin
      showMessage('Selecione um fornecimento.');
      exit;
    end;

    nr_fornecimento := '';
    datm_RelatorioNestle.cdsRapsSelecionadas.first;
    for i := 0 to datm_RelatorioNestle.cdsRapsSelecionadas.recordCount -1 do
    begin
      if i = 0 then
        nr_fornecimento:= '''' + datm_RelatorioNestle.cdsRapsSelecionadas.fieldByName('NR_FORNECIMENTO').asString +''''
      else
        nr_fornecimento:= nr_fornecimento + ',''' + datm_RelatorioNestle.cdsRapsSelecionadas.fieldByName('NR_FORNECIMENTO').asString +'''' ;

      datm_RelatorioNestle.cdsRapsSelecionadas.next;
    end;

    if frmRelOrdemLiberacaoProcessoNestlePOR.PrepararRelatorio(nr_fornecimento) then
    begin
      if tipoRelatorio.tipo = TELA then
        frmRelOrdemLiberacaoProcessoNestlePOR.RLReport1.PreviewModal
      else
      if tipoRelatorio.tipo = EMAIL then
      begin
        NomeArquivo := path + 'OL_' + FormatDateTime('ddmmyyyhhmm', now) + '.pdf';
        frmRelOrdemLiberacaoProcessoNestlePOR.RLPDFFilter1.FileName := NomeArquivo;
        frmRelOrdemLiberacaoProcessoNestlePOR.RLReport1.SaveToFile(NomeArquivo);
        EnviarEmail(NomeArquivo, tipoRelatorio.dadosEmail);
      end;
    end
    else
      lblMensagens.visible := true;
  finally
    FreeAndNil(frmRelOrdemLiberacaoProcessoNestlePOR);
  end;
end;

procedure TfrmRelatoriosNestle.GeraRelCaricom(nr_processo :string; tipoRelatorio : TtipoRelatorio);
var
  NomeArquivo : string;
begin
  try
    frmRelCaricomNestleING := TfrmRelCaricomNestleING.Create(nil);

    if rgVersaoCaricom.ItemIndex = 0 then
      frmRelCaricomNestleING.rlVersaoFatura.caption := 'ORIGINAL'
    else
      frmRelCaricomNestleING.rlVersaoFatura.caption := 'COPY';

    frmRelCaricomNestleING.rlExportCoordinator.caption    := edtCoordenador.text + ' - Export Coordinator';
    frmRelCaricomNestleING.rlCpfExportCoordinator.caption := ' CPF: ' + edtCpfCaricom.text;

    if frmRelCaricomNestleING.PrepararRelatorio(nr_processo) then
    begin
      if tipoRelatorio.tipo = TELA then
        frmRelCaricomNestleING.RLReport1.PreviewModal
      else
      if tipoRelatorio.tipo = EMAIL then
      begin
        NomeArquivo := path + 'C_' + FormatDateTime('ddmmyyyhhmm', now) + '.pdf';
        frmRelCaricomNestleING.RLPDFFilter1.FileName := NomeArquivo;
        frmRelCaricomNestleING.RLReport1.SaveToFile(NomeArquivo);
        EnviarEmail(NomeArquivo, tipoRelatorio.dadosEmail);
      end;
    end
    else
      lblMensagens.visible := true;
  finally
    FreeAndNil(frmRelCaricomNestleING);
  end;
end;

procedure TfrmRelatoriosNestle.GeraRelBordero(nr_processo :string; tipoRelatorio : TtipoRelatorio);
var
  NomeArquivo : string;
begin
  try
    frmRelBorderoNestlePOR := TfrmRelBorderoNestlePOR.Create(nil);

    if chbTelegrama.checked                      then frmRelBorderoNestlePOR.rlTelegrama.caption                      := 'X' else frmRelBorderoNestlePOR.rlTelegrama.caption                      := '';
    if chbViaAerea.checked                       then frmRelBorderoNestlePOR.rlViaAerea.caption                       := 'X' else frmRelBorderoNestlePOR.rlViaAerea.caption                       := '';
    if chbFaltaAceitePagamento.checked           then frmRelBorderoNestlePOR.rlFaltaAceitePagamento.caption           := 'X' else frmRelBorderoNestlePOR.rlFaltaAceitePagamento.caption           := '';
    if chbPagamentoEfetuado.checked              then frmRelBorderoNestlePOR.rlPagamentoEfetuado.caption              := 'X' else frmRelBorderoNestlePOR.rlPagamentoEfetuado.caption              := '';
    if chbRemessaFundos.checked                  then frmRelBorderoNestlePOR.rlRemessaFundos.caption                  := 'X' else frmRelBorderoNestlePOR.rlRemessaFundos.caption                  := '';
    if chbEnviarDocBancoExterior.checked         then frmRelBorderoNestlePOR.rlEnviarDocBancoExterior.caption         := 'X' else frmRelBorderoNestlePOR.rlEnviarDocBancoExterior.caption         := '';
    if chbEntregarDocumentosContaPgmto.checked   then frmRelBorderoNestlePOR.rlEntregarDocumentosContaPgmto.caption   := 'X' else frmRelBorderoNestlePOR.rlEntregarDocumentosContaPgmto.caption   := '';
    if chbEntregarDocumentosContraAceite.checked then frmRelBorderoNestlePOR.rlEntregarDocumentosContraAceite.caption := 'X' else frmRelBorderoNestlePOR.rlEntregarDocumentosContraAceite.caption := '';
    if chbNaoProtestar.checked                   then frmRelBorderoNestlePOR.rlNaoProtestar.caption                   := 'X' else frmRelBorderoNestlePOR.rlNaoProtestar.caption                   := '';
    if chbProtestarFaltaAceite.checked           then frmRelBorderoNestlePOR.rlProtestarFaltaAceite.caption           := 'X' else frmRelBorderoNestlePOR.rlProtestarFaltaAceite.caption           := '';
    if chbProtestarFaltaPgmto.checked            then frmRelBorderoNestlePOR.rlProtestarFaltaPgmto.caption            := 'X' else frmRelBorderoNestlePOR.rlProtestarFaltaPgmto.caption            := '';
    if chbCobrarJuros.checked                    then frmRelBorderoNestlePOR.rlCobrarJuros.caption                    := 'X' else frmRelBorderoNestlePOR.rlCobrarJuros.caption                    := '';
    if chbDespesasCorrespondenteSacado.checked   then frmRelBorderoNestlePOR.rlDespesasCorrespondenteSacado.caption   := 'X' else frmRelBorderoNestlePOR.rlDespesasCorrespondenteSacado.caption   := '';
    if chbDespesasSacado.checked                 then frmRelBorderoNestlePOR.rlDespesasSacado.caption                 := 'X' else frmRelBorderoNestlePOR.rlDespesasSacado.caption                 := '';
    if chbDespesasNossaConta.checked             then frmRelBorderoNestlePOR.rlDespesasNossaConta.caption             := 'X' else frmRelBorderoNestlePOR.rlDespesasNossaConta.caption             := '';
    if chbTodasDespesasNossaConta.checked        then frmRelBorderoNestlePOR.rlTodasDespesasNossaConta.caption        := 'X' else frmRelBorderoNestlePOR.rlTodasDespesasNossaConta.caption        := '';
    if chbEncaminharDocCarteira.checked          then frmRelBorderoNestlePOR.rlEncaminharDocCarteira.caption          := 'X' else frmRelBorderoNestlePOR.rlEncaminharDocCarteira.caption          := '';
    if chbEnviadoExteriorCourier.checked         then frmRelBorderoNestlePOR.rlEnviadoExteriorCourier.caption         := 'X' else frmRelBorderoNestlePOR.rlEnviadoExteriorCourier.caption         := '';

    if chbSaque.checked                          then frmRelBorderoNestlePOR.rlSaque.caption                          := 'X' else frmRelBorderoNestlePOR.rlSaque.caption                          := '';
    if chbFaturaComercial.checked                then frmRelBorderoNestlePOR.rlFaturaComercial.caption                := 'X' else frmRelBorderoNestlePOR.rlFaturaComercial.caption                := '';
    if chbCertificadoOrigem.checked              then frmRelBorderoNestlePOR.rlCertificadoOrigem.caption              := 'X' else frmRelBorderoNestlePOR.rlCertificadoOrigem.caption              := '';
    if chbCertificadoSeguro.checked              then frmRelBorderoNestlePOR.rlCertificadoSeguro.caption              := 'X' else frmRelBorderoNestlePOR.rlCertificadoSeguro.caption              := '';
    if chbConhecimento.checked                   then frmRelBorderoNestlePOR.rlConhecimento.caption                   := 'X' else frmRelBorderoNestlePOR.rlConhecimento.caption                   := '';
    if chbPackingList.checked                    then frmRelBorderoNestlePOR.rlPackingList.caption                    := 'X' else frmRelBorderoNestlePOR.rlPackingList.caption                    := '';
    if chbCertificadoInspecao.checked            then frmRelBorderoNestlePOR.rlCertificadoInspecao.caption            := 'X' else frmRelBorderoNestlePOR.rlCertificadoInspecao.caption            := '';
    if chbCertificadoQualidade.checked           then frmRelBorderoNestlePOR.rlCertificadoQualidade.caption           := 'X' else frmRelBorderoNestlePOR.rlCertificadoQualidade.caption           := '';
    if chbCartaCredito.checked                   then frmRelBorderoNestlePOR.rlCartaCredito.caption                   := 'X' else frmRelBorderoNestlePOR.rlCartaCredito.caption                   := '';
    if chbEmendaLC.checked                       then frmRelBorderoNestlePOR.rlEmendaLC.caption                       := 'X' else frmRelBorderoNestlePOR.rlEmendaLC.caption                       := '';
    if chbCartaCliente.checked                   then frmRelBorderoNestlePOR.rlCartaCliente.caption                   := 'X' else frmRelBorderoNestlePOR.rlCartaCliente.caption                   := '';
    if chbExtra1.checked                         then frmRelBorderoNestlePOR.rlExtra1.caption                         := 'X' else frmRelBorderoNestlePOR.rlExtra1.caption                         := '';
    if chbExtra2.checked                         then frmRelBorderoNestlePOR.rlExtra2.caption                         := 'X' else frmRelBorderoNestlePOR.rlExtra2.caption                         := '';
    if chbExtra3.checked                         then frmRelBorderoNestlePOR.rlExtra3.caption                         := 'X' else frmRelBorderoNestlePOR.rlExtra3.caption                         := '';


   	frmRelBorderoNestlePOR.rlSaqueOriginal.caption                 := edtSaqueOriginal.Text;
    frmRelBorderoNestlePOR.rlSaqueCopia.caption                    := edtSaqueCopia.text;
                                                                      
    frmRelBorderoNestlePOR.rlFaturaComercialOriginal.caption       := edtFaturaComercialOriginal.text;    
    frmRelBorderoNestlePOR.rlFaturaComercialCopia.caption          := edtFaturaComercialCopia.text;
                                                                                      
    frmRelBorderoNestlePOR.rlCertificadoOrigemOriginal.caption     := edtCertificadoOrigemOriginal.text;
    frmRelBorderoNestlePOR.rlCertificadoOrigemCopia.caption        := edtCertificadoOrigemCopia.text;     
                                                                      
    frmRelBorderoNestlePOR.rlCertificadoSeguroOriginal.caption     := edtCertificadoSeguroOriginal.text;  
    frmRelBorderoNestlePOR.rlCertificadoSeguroCopia.caption        := edtCertificadoSeguroCopia.text;

    frmRelBorderoNestlePOR.rlConhecimentoEmbarqueOriginal.caption  := edtConhecimentoEmbarqueOriginal.text;
    frmRelBorderoNestlePOR.rlConhecimentoEmbarqueCopia.caption     := edtConhecimentoEmbarqueCopia.text;   
                                                                      
    frmRelBorderoNestlePOR.rlPackingListOriginal.caption           := edtPackingListOriginal.text;        
    frmRelBorderoNestlePOR.rlPackingListCopia.caption              := edtPackingListCopia.text;

    frmRelBorderoNestlePOR.rlCertificadoInspecaoOriginal.caption   := edtCertificadoInspecaoOriginal.text;
    frmRelBorderoNestlePOR.rlCertificadoInspecaoCopia.caption      := edtCertificadoInspecaoCopia.text;   
                                                                      
    frmRelBorderoNestlePOR.rlCertificadoQualidadeOriginal.caption  := edtCertificadoQualidadeOriginal.text;
    frmRelBorderoNestlePOR.rlCertificadoQualidadeCopia.caption     := edtCertificadoQualidadeCopia.text;
                                                                                      
    frmRelBorderoNestlePOR.rlCartaCreditoOriginal.caption          := edtCartaCreditoOriginal.text;
    frmRelBorderoNestlePOR.rlCartaCreditoCopia.caption             := edtCartaCreditoCopia.text;          
                                                                      
    frmRelBorderoNestlePOR.rlEmendaLCOriginal.caption              := edtEmendaLCOriginal.text;
    frmRelBorderoNestlePOR.rlEmendaLCCopia.caption                 := edtEmendaLCCopia.text;
                                                                                      
    frmRelBorderoNestlePOR.rlCartaClienteOriginal.caption          := edtCartaClienteOriginal.text;
    frmRelBorderoNestlePOR.rlCartaClienteCopia.caption             := edtCartaClienteCopia.text;          

    frmRelBorderoNestlePOR.rlTextoExtra1.caption                   := edtExtra1.text;
    frmRelBorderoNestlePOR.rlExtra1Original.caption                := edtExtra1Original.text;
    frmRelBorderoNestlePOR.rlExtra1Copia.caption                   := edtExtra1Copia.text;

    frmRelBorderoNestlePOR.rlTextoExtra2.caption                   := edtExtra2.text;
    frmRelBorderoNestlePOR.rlExtra2Original.caption                := edtExtra2Original.text;
    frmRelBorderoNestlePOR.rlExtra2Copia.caption                   := edtExtra2Copia.text;

    frmRelBorderoNestlePOR.rlTextoExtra3.caption                   := edtExtra3.text;
    frmRelBorderoNestlePOR.rlExtra3Original.caption                := edtExtra3Original.text;
    frmRelBorderoNestlePOR.rlExtra3Copia.caption                   := edtExtra3Copia.text;

    if chbImprimirUsuarioBordero.checked then
      frmRelBorderoNestlePOR.ImprimirUsuario := true
    else
      frmRelBorderoNestlePOR.ImprimirUsuario := false;

    frmRelBorderoNestlePOR.rlmmObservacoes.Lines := mmObservacaoBordero.Lines;

    if frmRelBorderoNestlePOR.PrepararRelatorio(nr_processo) then
    begin
      if tipoRelatorio.tipo = TELA then
        frmRelBorderoNestlePOR.RLReport1.PreviewModal
      else
      if tipoRelatorio.tipo = EMAIL then
      begin
        NomeArquivo := path + 'B_' + FormatDateTime('ddmmyyyhhmm', now) + '.pdf';
        frmRelBorderoNestlePOR.RLPDFFilter1.FileName := NomeArquivo;
        frmRelBorderoNestlePOR.RLReport1.SaveToFile(NomeArquivo);
        EnviarEmail(NomeArquivo, tipoRelatorio.dadosEmail);
      end;
    end
    else
      lblMensagens.visible := true;
      
  finally
    FreeAndNil(frmRelBorderoNestlePOR);
  end;
end;

procedure TfrmRelatoriosNestle.GeraRelInternalExportDocument(nr_processo : String; tipoRelatorio : TtipoRelatorio);
var
  NomeArquivo : string;
begin
  try
    frmRelInternalExportDocumentNestleESP := TfrmRelInternalExportDocumentNestleESP.Create(nil);

    if frmRelInternalExportDocumentNestleESP.PrepararRelatorio(nr_processo) then
    begin
      if tipoRelatorio.tipo = TELA then
        frmRelInternalExportDocumentNestleESP.RLReport1.PreviewModal
      else
      if tipoRelatorio.tipo = EMAIL then
      begin
        NomeArquivo := path + 'IED_' + FormatDateTime('ddmmyyyhhmm', now) + '.pdf';
        frmRelInternalExportDocumentNestleESP.RLPDFFilter1.FileName := NomeArquivo;
        frmRelInternalExportDocumentNestleESP.RLReport1.SaveToFile(NomeArquivo);
        EnviarEmail(NomeArquivo, tipoRelatorio.dadosEmail);
      end;
    end
    else
      lblMensagens.visible := true;
  finally
    FreeAndNil(frmRelInternalExportDocumentNestleESP);
  end;
end;

procedure TfrmRelatoriosNestle.GeraRelProgramacaoRodoviaria(nr_processo : String; tipoRelatorio : TtipoRelatorio);
var
  NomeArquivo : string;
begin
  try
    frmRelProgramacaoRodoviariaNestlePOR := TfrmRelProgramacaoRodoviariaNestlePOR.Create(nil);

    if frmRelProgramacaoRodoviariaNestlePOR.PrepararRelatorio(nr_processo, mmObservacoesProgRodoviaria.Text) then
    begin
      if tipoRelatorio.tipo = TELA then
        frmRelProgramacaoRodoviariaNestlePOR.RLReport1.PreviewModal
      else
      if tipoRelatorio.tipo = EMAIL then
      begin
        NomeArquivo := path + 'PR_' + FormatDateTime('ddmmyyyhhmm', now) + '.pdf';
        frmRelProgramacaoRodoviariaNestlePOR.RLPDFFilter1.FileName := NomeArquivo;
        frmRelProgramacaoRodoviariaNestlePOR.RLReport1.SaveToFile(NomeArquivo);

        if EnviarEmail(NomeArquivo, tipoRelatorio.dadosEmail) then
          if atualizarSeqProgRodoviaria then
          begin
            datm_RelatorioNestle.qryAtualizaSeqProgRodoviaria.close;
            datm_RelatorioNestle.qryAtualizaSeqProgRodoviaria.sql.Text := datm_RelatorioNestle.GetSqlAtualizaSeqProgRodoviaria( cbUnidade.KeyValue +
                                                                                                                                cbProduto.KeyValue +
                                                                                                                                trim(edtNrProcesso.text));
            datm_RelatorioNestle.qryAtualizaSeqProgRodoviaria.execSql;
          end;
      end;
    end
    else
      lblMensagens.visible := true;
  finally
    FreeAndNil(frmRelProgramacaoRodoviariaNestlePOR);
  end;
end;

procedure TfrmRelatoriosNestle.GeraRelSaque(nr_processo :String; tipoRelatorio : TtipoRelatorio);
var
  NomeArquivo : string;
begin
  try
    frmRelSaqueNestleING := tfrmRelSaqueNestleING.Create(nil);

    if frmRelSaqueNestleING.PrepararRelatorio(nr_processo) then
    begin
      if tipoRelatorio.tipo = TELA then
        frmRelSaqueNestleING.RLReport1.PreviewModal
      else
      if tipoRelatorio.tipo = EMAIL then
      begin
        NomeArquivo := path + 'S_' + FormatDateTime('ddmmyyyhhmm', now) + '.pdf';
        frmRelSaqueNestleING.RLPDFFilter1.FileName := NomeArquivo;
        frmRelSaqueNestleING.RLReport1.SaveToFile(NomeArquivo);
        EnviarEmail(NomeArquivo, tipoRelatorio.dadosEmail);
      end;
    end
    else
      lblMensagens.visible := true;
  finally
    FreeAndNil(frmRelSaqueNestleING);
  end;
end;

procedure TfrmRelatoriosNestle.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelatoriosNestle.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_RelatorioNestle, datm_RelatorioNestle );

  datm_RelatorioNestle.cdsUnidadeNeg.close;
  datm_RelatorioNestle.cdsUnidadeNeg.open;
  datm_RelatorioNestle.cdsProduto.close;
  datm_RelatorioNestle.cdsProduto.open;

  mmObservacoesProgRodoviaria.Text := '';

  path := ExtractFilePath(Application.ExeName);
  if not DirectoryExists(path + 'TEMP\') then
    CreateDir(path + 'TEMP\');
end;

procedure TfrmRelatoriosNestle.edUnidadeExit(Sender: TObject);
begin
  BuscarCodigoUnidadeNeg
end;

procedure TfrmRelatoriosNestle.edtProdutoExit(Sender: TObject);
begin
  BuscarCodigoProduto
end;

procedure TfrmRelatoriosNestle.edUnidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN  then
    BuscarCodigoUnidadeNeg;
end;

procedure TfrmRelatoriosNestle.BuscarCodigoProduto;
begin
  if datm_RelatorioNestle.cdsProduto.Locate('CD_PRODUTO', edtProduto.Text, []) then
     cbProduto.KeyValue := datm_RelatorioNestle.cdsProduto.fieldbyName('CD_PRODUTO').AsString
  else
    cbProduto.KeyValue := '';
end;


procedure TfrmRelatoriosNestle.BuscarCodigoUnidadeNeg;
begin
  if datm_RelatorioNestle.cdsUnidadeNeg.Locate('CD_UNID_NEG', edUnidade.Text, []) then
     cbUnidade.KeyValue := datm_RelatorioNestle.cdsUnidadeNeg.fieldbyName('CD_UNID_NEG').AsString
  else
    cbUnidade.KeyValue := '';
end;

procedure TfrmRelatoriosNestle.edtProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN  then
    BuscarCodigoProduto;
end;

procedure TfrmRelatoriosNestle.cbUnidadeCloseUp(Sender: TObject);
begin
  PreencherCodigoUnidadeNeg;
end;

procedure TfrmRelatoriosNestle.PreencherCodigoUnidadeNeg;
begin
  if not ((cbUnidade.KeyValue = '') or (cbUnidade.KeyValue = null)) then
    edUnidade.Text := datm_RelatorioNestle.cdsUnidadeNeg.fieldbyName('CD_UNID_NEG').AsString
  else
    edUnidade.Text := '';
end;

procedure TfrmRelatoriosNestle.cbProdutoCloseUp(Sender: TObject);
begin
  PreencherCodigoProduto;
end;

procedure TfrmRelatoriosNestle.PreencherCodigoProduto;
begin
 if not ((cbProduto.KeyValue = '') or (cbProduto.KeyValue = null)) then
    edtProduto.Text := datm_RelatorioNestle.cdsProduto.fieldbyName('CD_PRODUTO').AsString
  else
    edtProduto.Text := '';
end;

procedure TfrmRelatoriosNestle.cbUnidadeExit(Sender: TObject);
begin
  PreencherCodigoUnidadeNeg;
end;

procedure TfrmRelatoriosNestle.cbProdutoExit(Sender: TObject);
begin
  PreencherCodigoProduto;
end;

procedure TfrmRelatoriosNestle.cbProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    cbProduto.KeyValue := '';
end;

procedure TfrmRelatoriosNestle.cbUnidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    cbUnidade.KeyValue := '';
end;

procedure TfrmRelatoriosNestle.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(datm_RelatorioNestle);
end;

function TfrmRelatoriosNestle.EnviarEmail(Arquivo : String; dadosEmail : TDadosEmail) : boolean;
begin
  result := false;

  dadosEmail.Anexos.Add(Trim(Arquivo));
  try
    if EnviaEmailHtmlDe(dadosEmail.Assunto, dadosEmail.Corpo.Text, dadosEmail.Destinatario, dadosEmail.Remetente, StringsToArray(dadosEmail.Anexos)) then
    begin
      result := true;
      ShowMessage('Email enviado com sucesso!');
    end
    else
      ShowMessage('Erro ao enviar e-mail.')
  except on e:exception do
    ShowMessage('Erro ao enviar e-mail. '+ e.Message);
  end;

  deletefile(Arquivo);
end;

procedure TfrmRelatoriosNestle.btnPesquisarClick(Sender: TObject);
var
  sSql : String;
begin
  try
    datm_RelatorioNestle.cdsRapsImpressao.DisableControls;
    datm_RelatorioNestle.cdsRapsSelecionadas.DisableControls;

    if datm_RelatorioNestle.cdsRapsImpressao.recordcount >0 then
      datm_RelatorioNestle.cdsRapsImpressao.EmptyDataSet;


    datm_RelatorioNestle.cdsRapsImpressao.close;

    sSql := datm_RelatorioNestle.GetSqlRapImpressao(edtQtRegistros.Text);

    if not ((DataInclusaoInicial.text = '  /  /    ') or (DataInclusaoInicial.text = '')) then
      sSql :=  sSql + ' AND (DT_INSERCAO >=' +QuotedStr(FormatDateTime('yyyy/mm/dd',
                                                                StrtoDate(DataInclusaoInicial.text)) + ' 00:00')+')  '+ sLineBreak;

    if not ((DataInclusaoFinal.text = '  /  /    ') or (DataInclusaoFinal.text = '')) then
      sSql :=  sSql + ' AND (DT_INSERCAO <= '+QuotedStr(FormatDateTime('yyyy/mm/dd',
                                                                  StrtoDate(DataInclusaoFinal.text)) + ' 23:59')+')  '+ sLineBreak;

    if cbStatus.itemindex = 0 then
      sSql :=  sSql + ' AND  CD_STATUS = 1'
    else
    if cbStatus.itemindex = 0 then
      sSql :=  sSql + ' AND  CD_STATUS = 2'
    else
    if cbStatus.itemindex = 0 then
      sSql :=  sSql + ' AND  CD_STATUS = 3';

    if trim(edtNumeroFornecimento.text) <> '' then
      sSql :=  sSql + ' AND  NR_FORNECIMENTO = ' + QuotedStr(edtNumeroFornecimento.text);

    datm_RelatorioNestle.qryRapsImpressao.sql.text := sSql;
    datm_RelatorioNestle.cdsRapsImpressao.open;   
  finally
    datm_RelatorioNestle.cdsRapsImpressao.EnableControls;
    datm_RelatorioNestle.cdsRapsSelecionadas.EnableControls;
  end;
end;

procedure TfrmRelatoriosNestle.btnSelecionaClick(Sender: TObject);
begin
  if not datm_RelatorioNestle.cdsRapsImpressao.isEmpty then
  begin
    try
      datm_RelatorioNestle.cdsRapsSelecionadas.DisableControls;
      datm_RelatorioNestle.cdsRapsImpressao.DisableControls;

      if not datm_RelatorioNestle.cdsRapsSelecionadas.Locate('NR_FORNECIMENTO',datm_RelatorioNestle.cdsRapsImpressao.fieldByName('NR_FORNECIMENTO').asString, []) then
      begin
        datm_RelatorioNestle.cdsRapsSelecionadas.Append;
        datm_RelatorioNestle.cdsRapsSelecionadas.fieldByName('CD_RAP').asString           := datm_RelatorioNestle.cdsRapsImpressao.fieldByName('CD_RAP').asString;
        datm_RelatorioNestle.cdsRapsSelecionadas.fieldByName('CD_RAP_ANO').asString       := datm_RelatorioNestle.cdsRapsImpressao.fieldByName('CD_RAP_ANO').asString;
        datm_RelatorioNestle.cdsRapsSelecionadas.fieldByName('DT_INSERCAO').asDateTime    := datm_RelatorioNestle.cdsRapsImpressao.fieldByName('DT_INSERCAO').asDateTime;
        datm_RelatorioNestle.cdsRapsSelecionadas.fieldByName('NR_FORNECIMENTO').asString  := datm_RelatorioNestle.cdsRapsImpressao.fieldByName('NR_FORNECIMENTO').asString;
        datm_RelatorioNestle.cdsRapsSelecionadas.Post;
      end;

      datm_RelatorioNestle.cdsRapsImpressao.delete;
    finally
      datm_RelatorioNestle.cdsRapsSelecionadas.EnableControls;
      datm_RelatorioNestle.cdsRapsImpressao.EnableControls;
    end;
  end;
end;

procedure TfrmRelatoriosNestle.btnVoltaClick(Sender: TObject);
begin
  if not datm_RelatorioNestle.cdsRapsSelecionadas.isEmpty then
  begin
    try
      datm_RelatorioNestle.cdsRapsImpressao.DisableControls;
      datm_RelatorioNestle.cdsRapsSelecionadas.DisableControls;

      if not datm_RelatorioNestle.cdsRapsImpressao.Locate('NR_FORNECIMENTO',datm_RelatorioNestle.cdsRapsSelecionadas.fieldByName('NR_FORNECIMENTO').asString, []) then
      begin
        datm_RelatorioNestle.cdsRapsImpressao.Append;
        datm_RelatorioNestle.cdsRapsImpressao.fieldByName('CD_RAP').asString           := datm_RelatorioNestle.cdsRapsSelecionadas.fieldByName('CD_RAP').asString;
        datm_RelatorioNestle.cdsRapsImpressao.fieldByName('CD_RAP_ANO').asString       := datm_RelatorioNestle.cdsRapsSelecionadas.fieldByName('CD_RAP_ANO').asString;
        datm_RelatorioNestle.cdsRapsImpressao.fieldByName('DT_INSERCAO').asDateTime    := datm_RelatorioNestle.cdsRapsSelecionadas.fieldByName('DT_INSERCAO').asDateTime;
        datm_RelatorioNestle.cdsRapsImpressao.fieldByName('NR_FORNECIMENTO').asString  := datm_RelatorioNestle.cdsRapsSelecionadas.fieldByName('NR_FORNECIMENTO').asString;
        datm_RelatorioNestle.cdsRapsImpressao.Post;
      end;

      datm_RelatorioNestle.cdsRapsSelecionadas.delete;
    finally
      datm_RelatorioNestle.cdsRapsSelecionadas.EnableControls;
      datm_RelatorioNestle.cdsRapsImpressao.EnableControls;
    end;
  end;
end;

procedure TfrmRelatoriosNestle.btnSelecionaTodosClick(Sender: TObject);
begin
  try
    datm_RelatorioNestle.cdsRapsSelecionadas.DisableControls;
    datm_RelatorioNestle.cdsRapsImpressao.DisableControls;

    datm_RelatorioNestle.cdsRapsImpressao.first;
    datm_RelatorioNestle.cdsRapsSelecionadas.first;

    while not datm_RelatorioNestle.cdsRapsImpressao.eof do
    begin
      if not datm_RelatorioNestle.cdsRapsSelecionadas.Locate('NR_FORNECIMENTO',datm_RelatorioNestle.cdsRapsImpressao.fieldByName('NR_FORNECIMENTO').asString, []) then
      begin
        datm_RelatorioNestle.cdsRapsSelecionadas.Append;
        datm_RelatorioNestle.cdsRapsSelecionadas.fieldByName('CD_RAP').asString           := datm_RelatorioNestle.cdsRapsImpressao.fieldByName('CD_RAP').asString;
        datm_RelatorioNestle.cdsRapsSelecionadas.fieldByName('CD_RAP_ANO').asString       := datm_RelatorioNestle.cdsRapsImpressao.fieldByName('CD_RAP_ANO').asString;
        datm_RelatorioNestle.cdsRapsSelecionadas.fieldByName('DT_INSERCAO').asDateTime    := datm_RelatorioNestle.cdsRapsImpressao.fieldByName('DT_INSERCAO').asDateTime;
        datm_RelatorioNestle.cdsRapsSelecionadas.fieldByName('NR_FORNECIMENTO').asString  := datm_RelatorioNestle.cdsRapsImpressao.fieldByName('NR_FORNECIMENTO').asString;
        datm_RelatorioNestle.cdsRapsSelecionadas.Post;
      end;

      datm_RelatorioNestle.cdsRapsImpressao.delete;
    end;
  finally
    datm_RelatorioNestle.cdsRapsSelecionadas.EnableControls;
    datm_RelatorioNestle.cdsRapsImpressao.EnableControls;
  end;
end;

procedure TfrmRelatoriosNestle.btnVoltaTodosClick(Sender: TObject);
begin
  try
    datm_RelatorioNestle.cdsRapsSelecionadas.DisableControls;
    datm_RelatorioNestle.cdsRapsImpressao.DisableControls;

    datm_RelatorioNestle.cdsRapsImpressao.first;
    datm_RelatorioNestle.cdsRapsSelecionadas.first;

    while not datm_RelatorioNestle.cdsRapsSelecionadas.eof do
    begin
      if not datm_RelatorioNestle.cdsRapsImpressao.Locate('NR_FORNECIMENTO',datm_RelatorioNestle.cdsRapsSelecionadas.fieldByName('NR_FORNECIMENTO').asString, []) then
      begin
        datm_RelatorioNestle.cdsRapsImpressao.Append;
        datm_RelatorioNestle.cdsRapsImpressao.fieldByName('CD_RAP').asString           := datm_RelatorioNestle.cdsRapsSelecionadas.fieldByName('CD_RAP').asString;
        datm_RelatorioNestle.cdsRapsImpressao.fieldByName('CD_RAP_ANO').asString       := datm_RelatorioNestle.cdsRapsSelecionadas.fieldByName('CD_RAP_ANO').asString;
        datm_RelatorioNestle.cdsRapsImpressao.fieldByName('DT_INSERCAO').asDateTime    := datm_RelatorioNestle.cdsRapsSelecionadas.fieldByName('DT_INSERCAO').asDateTime;
        datm_RelatorioNestle.cdsRapsImpressao.fieldByName('NR_FORNECIMENTO').asString  := datm_RelatorioNestle.cdsRapsSelecionadas.fieldByName('NR_FORNECIMENTO').asString;
        datm_RelatorioNestle.cdsRapsImpressao.Post;
      end;

      datm_RelatorioNestle.cdsRapsSelecionadas.delete;
    end;
  finally
    datm_RelatorioNestle.cdsRapsSelecionadas.EnableControls;
    datm_RelatorioNestle.cdsRapsImpressao.EnableControls;
  end;
end;

procedure TfrmRelatoriosNestle.dbgDisponiveisDblClick(Sender: TObject);
begin
  btnSeleciona.click;
end;

procedure TfrmRelatoriosNestle.dbgSelecionadasDblClick(Sender: TObject);
begin
  btnVolta.click;
end;

procedure TfrmRelatoriosNestle.FormShow(Sender: TObject);
var
  i :integer;
begin
  eMailUsuario := Trim(ConsultaLookUp('TUSUARIO','CD_USUARIO',str_cd_usuario,'NM_EMAIL'));
  for i := 0 to pgFiltros.PageCount -1 do
  begin
    pgFiltros.pages[i].TabVisible := false;
  end;

  frmRelatoriosNestle.Height      := 300;
  frmRelatoriosNestle.Width       := 620;
  pgFiltros.visible               := false;
  pgPrincipal.Pages[0].TabVisible := true;
  pgPrincipal.Pages[1].TabVisible := false;

  pgFiltros.ActivePageIndex := LocalizarPagina(TipoRelatorio);

  if TipoRelatorio = 0 then // GeraRelProgramacaoRodoviaria
    pgFiltros.visible             := true
  else
  if TipoRelatorio = 3 then // GeraRelBordero
  begin
    pgFiltros.visible           := true;
    frmRelatoriosNestle.Height  := 725;
    frmRelatoriosNestle.Width   := 712;
  end
  else
  if TipoRelatorio = 4 then // GeraCaricom
  begin
    frmRelatoriosNestle.Height  := 310;
    frmRelatoriosNestle.Width   := 620;
    pgFiltros.visible           := true;
  end
  else
  if TipoRelatorio = 5 then // GeraRelInstrucaoEmbarque
  begin
    pgPrincipal.Pages[0].TabVisible := false;
    pgPrincipal.Pages[1].TabVisible := true;
    pgFiltros.visible               := true;
    frmRelatoriosNestle.Height      := 368;
    frmRelatoriosNestle.Width       := 710;
    datm_RelatorioNestle.cdsRapsSelecionadas.CreateDataSet;
    datm_RelatorioNestle.cdsRapsImpressao.CreateDataSet;
  end
  else
  if TipoRelatorio = 6 then // GeraPackingList
  begin
    pgFiltros.visible           := true;
    frmRelatoriosNestle.Height  := 300;
    frmRelatoriosNestle.Width   := 712;
    PreencherIdioma;
  end
  else
  if TipoRelatorio = 7 then // GeraFaturaComercial
  begin
    pgFiltros.visible           := true;
    frmRelatoriosNestle.Height  := 350;
    frmRelatoriosNestle.Width   := 850;
    PreencherIdioma;
  end
  else
  if TipoRelatorio = 8 then  // GeraShippingInstructions
    pgFiltros.visible           := true
  else
  if TipoRelatorio = 9 then
  begin
    pgFiltros.visible           := true;
    frmRelatoriosNestle.Height  := 315;
    frmRelatoriosNestle.Width   := 712;
  end;
end;

procedure TfrmRelatoriosNestle.rgTipoAgrupamentoClick(Sender: TObject);
var
  nr_processo : string;
begin
  if rgTipoAgrupamento.ItemIndex = 2 then
  begin
    ValidaNrProcesso;
    nr_processo :=  cbUnidade.KeyValue + cbProduto.KeyValue +  trim(edtNrProcesso.text);
    datm_RelatorioNestle.cdsContainers.close;
    datm_RelatorioNestle.qryContainers.SQL.Text := datm_RelatorioNestle.GetSqlContainersProcesso(nr_processo);
    datm_RelatorioNestle.cdsContainers.open;
    dblkContainers.enabled := true;
  end
  else
    dblkContainers.enabled := false;
end;

procedure TfrmRelatoriosNestle.ValidaNrProcesso;
begin
  if (trim(edtNrProcesso.text) = '') or
     ((cbUnidade.KeyValue = '') or (cbUnidade.KeyValue = null)) or
     ((cbProduto.KeyValue = '') or (cbProduto.KeyValue = null))
  then
  begin
    ShowMessage('Preencha os filtros corretamente.');
    abort;
  end;
end;

function TfrmRelatoriosNestle.LocalizarPagina(tagPagina : Integer) : integer;
var i : integer;
begin
  result := 0;
  for i := 0 to pgFiltros.PageCount -1 do
  begin
    if pgFiltros.pages[i].Tag = tagPagina then
    begin
      result := i;
      break;
    end;
  end;
end;

procedure TfrmRelatoriosNestle.edtNrProcessoChange(Sender: TObject);
begin
  lblMensagens.visible := false;
  PreencherIdioma;
end;

procedure TfrmRelatoriosNestle.rgTipoClick(Sender: TObject);
begin
  rgControle.Visible := rgTipo.ItemIndex = 0;
  rgControle.ItemIndex := 0;
end;

procedure TfrmRelatoriosNestle.PreencherIdioma;
var
  nr_processo: string;
begin

  if (cbUnidade.KeyValue = Null) or (cbProduto.KeyValue = Null) or (length(edtNrProcesso.text) < 12) then
    exit;

  nr_processo :=  cbUnidade.KeyValue + cbProduto.KeyValue +  trim(edtNrProcesso.text);
  datm_RelatorioNestle.qryIdiomaPedido.close;
  datm_RelatorioNestle.qryIdiomaPedido.SQL.Text := 'SELECT CD_LINGUA_PEDIDO FROM TPROCESSO_EXP (NOLOCK) WHERE NR_PROCESSO = ' + QuotedStr(nr_processo);
  datm_RelatorioNestle.qryIdiomaPedido.open;


  if TipoRelatorio = 6 then // GeraPackingList
  begin
    case StrToIntDef(datm_RelatorioNestle.qryIdiomaPedido.FieldByName('CD_LINGUA_PEDIDO').AsString, 0) of
      1: frmRelatoriosNestle.rgIdiomaPackingList.ItemIndex := 0;
      2: frmRelatoriosNestle.rgIdiomaPackingList.ItemIndex := 1;
    end;
  end
  else
  if TipoRelatorio = 7 then // GeraFaturaComercial
  begin
    case StrToIntDef(datm_RelatorioNestle.qryIdiomaPedido.FieldByName('CD_LINGUA_PEDIDO').AsString, 0) of
      1: frmRelatoriosNestle.rgIdioma.ItemIndex := 0;
      2: frmRelatoriosNestle.rgIdioma.ItemIndex := 1;
    end;
  end;


end;

procedure TfrmRelatoriosNestle.rgIFaturaPorCntrOuMercClick(
  Sender: TObject);
var
  nr_processo : string;  
begin
  if rgIFaturaPorCntrOuMerc.ItemIndex = 0 then
  begin
    datm_RelatorioNestle.cdsContainers.close;
    datm_RelatorioNestle.cdsMercadorias.close;    
  end
  else if rgIFaturaPorCntrOuMerc.ItemIndex = 1 then
  begin
    dblkMercadoriasFatura.enabled := false;

    ValidaNrProcesso;
    nr_processo :=  cbUnidade.KeyValue + cbProduto.KeyValue +  trim(edtNrProcesso.text);
    datm_RelatorioNestle.cdsContainers.close;
    datm_RelatorioNestle.qryContainers.SQL.Text := datm_RelatorioNestle.GetSqlContainersProcesso(nr_processo);
    datm_RelatorioNestle.cdsContainers.open;
    dblkContainersFatura.enabled := true;
    dblkContainersFatura.Visible := true;
    dblkMercadoriasFatura.Visible := false;

  end
  else if rgIFaturaPorCntrOuMerc.ItemIndex = 2 then
  begin
    dblkMercadoriasFatura.Left := 7;
    dblkContainersFatura.enabled := false;

    ValidaNrProcesso;
    nr_processo :=  cbUnidade.KeyValue + cbProduto.KeyValue +  trim(edtNrProcesso.text);
    datm_RelatorioNestle.cdsMercadorias.close;
    datm_RelatorioNestle.qryMercadorias.SQL.Text := datm_RelatorioNestle.GetSqlMercadoriasProcesso(nr_processo);
    datm_RelatorioNestle.cdsMercadorias.open;
    dblkMercadoriasFatura.enabled := true;
    dblkContainersFatura.Visible := false;
    dblkMercadoriasFatura.Visible := true;

  end;

end;

end.
