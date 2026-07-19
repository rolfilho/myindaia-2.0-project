unit uArquivoCroda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, IBCustomDataSet, IBQuery, IBDatabase, StdCtrls,
  ExtCtrls, Buttons, Menus, ShellAPI, Grids, DBGrids, Gauges, ComCtrls;

type
  TRegistro = record
    STR_CODIGOPRODUTO          : String;
    STR_NUMEROFATURADDIMPORT   : String;
    STR_NRNOTA                 : String;
    STR_SERIENOTA              : String;
    STR_DATANOTA               : String;
    STR_SIGLAUNIDADEMOEDA_ITEM : String;
    STR_NUMEROPO               : String;
    STR_NRPEDIDO_ITEM          : String;
    STR_CFOP                   : String;
    STR_CODIGOMOEDANEG         : String;
    STR_CODIGOMOEDAFRETE       : String;
    STR_CD_REFERENCIA          : array of String; // Alterado de String para um Array porque estava agrupando em alguns processos e trazendo o valor do despachante para apenas um item e não todos - Michel - 28/12/2011
    LI_SEQUENCIACONTINUACAO    : Integer;
    LI_SEQUENCIAITEM           : Integer;
    LI_SEQUENCIANFENTRADA      : Integer;
    LI_ITEMPO                  : Integer;
    LI_SEQUENCIADI             : Integer;
    DBL_QTDEMEDIDAESTAT        : Double;
    DBL_VALORORIGEMMOEDA       : Double;
    DBL_VALORFRETEMOEDAPREPAID : Double;
    DBL_VALORFRETEMOEDACOLLECT : Double;
    DBL_VALOR_FRETE            : Double;
    DBL_VALORSEGUROMOEDA       : Double;
    DBL_TAXAMERCADORIA         : Double;
    DBL_TAXASISCOMEX           : Double;
    DBL_TAXASEGURO             : Double;
    DBL_ACRESCIMOSREAIS        : Double;
    DBL_VALORIIRECOLHER        : Double;
    DBL_VALORICMS              : Double;
    DBL_ICMS_COMPLEMENTAR      : Double;
    DBL_VALORIPIRECOLHER       : Double;
    DBL_VALORPISPASEPARECOLHER : Double;
    DBL_VALORCOFINSARECOLHER   : Double;
    DBL_PESOBRUTO              : Double;
    DBL_PESOLIQUIDO            : Double;
    DBL_CIFREAISTOTAL_ITEM     : Double;
    DBL_CIFREAISUNIT_ITEM      : Double;
    DBL_QTDITENS_ITEM          : Double;
    DBL_ALIQUOTAICMS_ITEM      : Double;
    DBL_ALIQUOTAIPI_ITEM       : Double;
    DBL_VALORIPI_ITEM          : Double;
    DBL_VALORBASEICMS_ITEM     : Double;
    DBL_VALORICMS_ITEM         : Double;
    DBL_VALORII_ITEM           : Double;
    DBL_PESOBRUTO_ITEM         : Double;
    DBL_PESOLIQUIDO_ITEM       : Double;
    DBL_QTDITENSNOTA           : Double;
    DBL_VALOR_ACRESCIMO        : Double;
  end;

type
  TfrmArquivoCroda = class(TForm)
    pnlArquivos: TPanel;
    Label4: TLabel;
    lbArquivos: TListBox;
    pnlPrincipal: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btn_co_unid_neg: TSpeedButton;
    btnEnviar: TSpeedButton;
    btnGeraComNF: TSpeedButton;
    btnAbrir: TSpeedButton;
    edt_nm_unid_neg: TEdit;
    edt_cd_unid_neg: TEdit;
    edt_cd_sap: TEdit;
    IBNF: TIBDatabase;
    IBTransaction: TIBTransaction;
    qryDDAbreProcesso: TIBQuery;
    qryDDAbreProcessoSTR_CODIGOTIPOUNIDADEOPER: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOUNIDADEOPER: TIBStringField;
    qryDDAbreProcessoLI_SEQUENCIAPROCESSO: TIntegerField;
    qryDDAbreProcessoSTR_CODIGOPROCESSO: TIBStringField;
    qryDDAbreProcessoSTR_TIPOPROCESSO: TIBStringField;
    qryDDAbreProcessoDT_ABERTURAPROCESSO: TDateTimeField;
    qryDDAbreProcessoSTR_REFERENCIA: TIBStringField;
    qryDDAbreProcessoSTR_VIATRANSPORTE: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOTIPOEXPORTADOR: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOEXPORTADOR: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOPAISAQUIS: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOTIPOTRANSP: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOTRANSP: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOTIPOIMPORTADOR: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOIMPORTADOR: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOTIPOARMADOR: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOARMADOR: TIBStringField;
    qryDDAbreProcessoSTR_MERCADORIA: TIBStringField;
    qryDDAbreProcessoSTR_REGISTRODI: TIBStringField;
    qryDDAbreProcessoDT_REGISTRODI: TDateTimeField;
    qryDDAbreProcessoSTR_NUMERODTA: TIBStringField;
    qryDDAbreProcessoDT_DTA: TDateTimeField;
    qryDDAbreProcessoDT_RECEBIMENTO: TDateTimeField;
    qryDDAbreProcessoDT_PREVISAOCHEGADA: TDateTimeField;
    qryDDAbreProcessoDT_DATACHEGADA: TDateTimeField;
    qryDDAbreProcessoDT_SOLICITACAONUMERARIO: TDateTimeField;
    qryDDAbreProcessoDT_RECEBIMENTONUMERARIO: TDateTimeField;
    qryDDAbreProcessoDT_PREVISAOENTREGA: TDateTimeField;
    qryDDAbreProcessoDT_REALENTREGA: TDateTimeField;
    qryDDAbreProcessoSTR_CODIGOTIPOCOMPANHIA: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOCOMPANHIA: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOTIPODESPACHANTE: TIBStringField;
    qryDDAbreProcessoSTR_CODIGODESPACHANTE: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOTIPOAGENTE: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOAGENTE: TIBStringField;
    qryDDAbreProcessoSTR_VEICULO: TIBStringField;
    qryDDAbreProcessoSTR_TIPODOCTOCARGA: TIBStringField;
    qryDDAbreProcessoDT_RECEBTODOCTOCARGA: TDateTimeField;
    qryDDAbreProcessoSTR_MASTER: TIBStringField;
    qryDDAbreProcessoSTR_HOUSE: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOPAISORIGEM: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOCIDADEORIGEM: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOTERMCARGAORIGEM: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOPAISDESTIN: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOCIDADEDESTIN: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOTERMCARGADESTIN: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOTRANSPNAC: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOTIPOTRANSPNAC: TIBStringField;
    qryDDAbreProcessoSTR_NUMEROCONHECIMENTO: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOTIPOAGENTECAMBIO: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOAGENTECAMBIO: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOURFENTRADA: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOURFDESPACHO: TIBStringField;
    qryDDAbreProcessoDT_CONHECIMENTONAC: TDateTimeField;
    qryDDAbreProcessoSTR_CODIGOPAISPROCED: TIBStringField;
    qryDDAbreProcessoDT_DATAREMOCAO: TDateTimeField;
    qryDDAbreProcessoSTR_TIPOMANIFESTO: TIBStringField;
    qryDDAbreProcessoSTR_NUMEROMANIFESTO: TIBStringField;
    qryDDAbreProcessoDT_TRANSMISSAO: TDateTimeField;
    qryDDAbreProcessoMEM_OBSERVACOESFOLLOWUP: TMemoField;
    qryDDAbreProcessoSTR_ORIGEM: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOGRUPOPROCESSO: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOFILIALTRAFFIC: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOMASTERTRAFFIC: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOHOUSETRAFFIC: TIBStringField;
    qryDDAbreProcessoSTR_AREAGRUPOIMPORTADOR: TIBStringField;
    qryDDAbreProcessoSTR_TIPOPESSOA: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOTIPODEPARTAMENTO: TIBStringField;
    qryDDAbreProcessoSTR_CODIGODEPARTAMENTO: TIBStringField;
    qryDDAbreProcessoMEM_COMENTARIOSFOLLOWUP: TMemoField;
    qryDDAbreProcessoLI_SEQPROCDOORTODOOR: TIntegerField;
    qryDDAbreProcessoLI_SEQUENCIAEXPORTACAODI: TIntegerField;
    qryDDAbreProcessoDT_ENVIOFATURAMENTO: TDateField;
    qryDDAbreProcessoTM_ENVIOFATURAMENTO: TDateTimeField;
    qryDDAbreProcessoSTR_MERCADORIACOMPLEMENTAR: TIBStringField;
    qryDDAbreProcessoMEM_MERCADORIACOMPLEMENTAR: TBlobField;
    qryDDAbreProcessoDT_FATURAMENTO: TDateTimeField;
    qryDDAbreProcessoSTR_CODIGOPROCESSOSISCOMEX: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOCIDADE: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOPAIS: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOMOEDANEG: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOMOEDAFRETE: TIBStringField;
    qryDDAbreProcessoSTR_CODIGOMOEDASEG: TIBStringField;
    qryDDAbreProcessoDT_PREVISAOREGISTRODI: TDateTimeField;
    dsDDAbreProcesso: TDataSource;
    qryDDAux: TIBQuery;
    qryBrokerAux: TQuery;
    qryDDItens: TIBQuery;
    qryDDItensDBL_QTDEMEDIDAESTAT: TFloatField;
    qryDDItensDBL_VALORORIGEMMOEDA: TFloatField;
    qryDDItensDBL_VALORFRETEMOEDAPREPAID: TFloatField;
    qryDDItensDBL_VALORFRETEMOEDACOLLECT: TFloatField;
    qryDDItensDBL_VALORSEGUROMOEDA: TFloatField;
    qryDDItensDBL_TAXAMERCADORIA: TFloatField;
    qryDDItensDBL_TAXASISCOMEX: TFloatField;
    qryDDItensDBL_TAXASEGURO: TFloatField;
    qryDDItensDBL_ACRESCIMOSREAIS: TFloatField;
    qryDDItensDBL_VALORSEGUROMOEDA1: TFloatField;
    qryDDItensDBL_VALORIIRECOLHER: TFloatField;
    qryDDItensDBL_VALORICMS: TFloatField;
    qryDDItensDBL_VALORIPIRECOLHER: TFloatField;
    qryDDItensDBL_VALORPISPASEPARECOLHER: TFloatField;
    qryDDItensDBL_VALORCOFINSARECOLHER: TFloatField;
    qryDDItensCALC_STR_NRNOTA: TStringField;
    qryDDItensCALC_DBL_PESOBRUTO: TFloatField;
    qryDDItensCALC_DBL_PESOLIQUIDO: TFloatField;
    qryDDItensCALC_STR_SERIENOTA: TStringField;
    qryDDItensCALC_STR_DATANOTA: TStringField;
    qryDDItensCALC_STR_SIGLAUNIDADEMOEDA_ITEM: TStringField;
    qryDDItensCALC_DBL_CIFREAISTOTAL_ITEM: TFloatField;
    qryDDItensCALC_DBL_CIFREAISUNIT_ITEM: TFloatField;
    qryDDItensCALC_DBL_QTDITENS_ITEM: TFloatField;
    qryDDItensCALC_DBL_ALIQUOTAICMS_ITEM: TFloatField;
    qryDDItensCALC_DBL_ALIQUOTAIPI_ITEM: TFloatField;
    qryDDItensCALC_DBL_VALORIPI_ITEM: TFloatField;
    qryDDItensCALC_DBL_VALORBASEICMS_ITEM: TFloatField;
    qryDDItensCALC_DBL_VALORICMS_ITEM: TFloatField;
    qryDDItensCALC_DBL_VALORII_ITEM: TFloatField;
    qryDDItensCALC_IN_ATIVO: TBooleanField;
    qryDDItensCALC_STR_NRPEDIDO_ITEM: TStringField;
    qryDDItensCALC_STR_CFOP: TStringField;
    qryDDItensCALC_DBL_QTDITENSNOTA: TFloatField;
    qryDDItensLI_SEQUENCIACONTINUACAO: TIntegerField;
    qryDDItensLI_SEQUENCIAITEM: TIntegerField;
    qryDDItensLI_SEQUENCIANFENTRADA: TIntegerField;
    qryDDItensLI_ITEMPO: TIntegerField;
    qryDDItensLI_SEQUENCIADI: TIntegerField;
    qryDDItensMEM_DADOS_NF_ENTRADA: TBlobField;
    qryDDItensMEM_DADOS_NF_ITEM: TBlobField;
    qryDDItensSTR_CODIGOPRODUTO: TIBStringField;
    qryDDItensSTR_NUMEROFATURADDIMPORT: TIBStringField;
    qryDDItensSTR_NUMEROPO: TIBStringField;
    qryDDItensSTR_CODIGOMOEDANEG: TIBStringField;
    qryDDItensSTR_CODIGOMOEDAFRETE: TIBStringField;
    dsDDItens: TDataSource;
    qryBrokerFrete: TQuery;
    qryBrokerFreteVL_FRETE: TFloatField;
    qryBrokerFreteMOEDA_FRETE: TStringField;
    qryBrokerFreteTX_FRETE: TFloatField;
    qryBrokerItens: TQuery;
    qryBrokerItensSTR_CODIGOPRODUTO: TStringField;
    qryBrokerItensSTR_NUMEROFATURADDIMPORT: TStringField;
    qryBrokerItensSTR_CODIGOMOEDAFRETE: TStringField;
    qryBrokerItensSTR_CODIGOMOEDANEG: TStringField;
    qryBrokerItensSTR_NUMEROPO: TStringField;
    btnGeraSemNF: TSpeedButton;
    qryBrokerItensCALC_STR_NRNOTA: TStringField;
    qryBrokerItensCALC_DBL_PESOBRUTO: TFloatField;
    qryBrokerItensCALC_DBL_PESOLIQUIDO: TFloatField;
    qryBrokerItensCALC_STR_SERIENOTA: TStringField;
    qryBrokerItensCALC_STR_DATANOTA: TStringField;
    qryBrokerItensCALC_STR_SIGLAUNIDADEMOEDA_ITEM: TStringField;
    qryBrokerItensCALC_DBL_CIFREAISTOTAL_ITEM: TFloatField;
    qryBrokerItensCALC_DBL_CIFREAISUNIT_ITEM: TFloatField;
    qryBrokerItensCALC_DBL_QTDITENS_ITEM: TFloatField;
    qryBrokerItensCALC_DBL_ALIQUOTAICMS_ITEM: TFloatField;
    qryBrokerItensCALC_DBL_ALIQUOTAIPI_ITEM: TFloatField;
    qryBrokerItensCALC_DBL_VALORIPI_ITEM: TFloatField;
    qryBrokerItensCALC_DBL_VALORBASEICMS_ITEM: TFloatField;
    qryBrokerItensCALC_DBL_VALORICMS_ITEM: TFloatField;
    qryBrokerItensCALC_DBL_VALORII_ITEM: TFloatField;
    qryBrokerItensCALC_IN_ATIVO: TBooleanField;
    qryBrokerItensCALC_STR_NRPEDIDO_ITEM: TStringField;
    qryBrokerItensCALC_STR_CFOP: TStringField;
    qryBrokerItensCALC_DBL_QTDITENSNOTA: TFloatField;
    qryBrokerItensSTR_REGISTRODI: TStringField;
    qryBrokerItensSTR_NRPEDIDO: TStringField;
    dsBrokerItens: TDataSource;
    qryBrokerItensDBL_QTDEMEDIDAESTAT: TFloatField;
    qryBrokerItensDBL_VALORORIGEMMOEDA: TFloatField;
    qryBrokerItensDBL_VALORFRETEMOEDAPREPAID: TFloatField;
    qryBrokerItensDBL_VALORFRETEMOEDACOLLECT: TFloatField;
    qryBrokerItensDBL_VALORSEGUROMOEDA: TFloatField;
    qryBrokerItensDBL_TAXAMERCADORIA: TIntegerField;
    qryBrokerItensDBL_TAXASISCOMEX: TFloatField;
    qryBrokerItensDBL_ACRESCIMOSREAIS: TFloatField;
    qryBrokerItensDBL_TAXASEGURO: TFloatField;
    qryBrokerItensDBL_VALORIIRECOLHER: TFloatField;
    qryBrokerItensDBL_VALORICMS: TFloatField;
    qryBrokerItensDBL_VALORIPIRECOLHER: TFloatField;
    qryBrokerItensDBL_VALORPISPASEPARECOLHER: TFloatField;
    qryBrokerItensDBL_VALORCOFINSARECOLHER: TFloatField;
    qryBrokerItensDBL_PESOBRUTO: TFloatField;
    qryBrokerItensDBL_PESOLIQUIDO: TFloatField;
    qryBrokerItensDBL_CIF: TFloatField;
    qryBrokerItensDBL_ALIQUOTA_ICMS: TFloatField;
    qryBrokerItensDBL_ALIQUOTA_IPI: TFloatField;
    qryBrokerItensDBL_VALOR_IPI: TFloatField;
    qryBrokerItensDBL_VALORBASEICMS: TFloatField;
    qryBrokerItensDBL_ICMS: TFloatField;
    qryBrokerItensDBL_VALOR_II: TFloatField;
    qryBrokerItensLI_ITEMPO: TIntegerField;
    qryBrokerItensLI_CFOP: TIntegerField;
    qryBrokerItensLI_SEQUENCIACONTINUACAO: TIntegerField;
    qryBrokerItensLI_SEQUENCIAITEM: TIntegerField;
    qryBrokerItensLI_SEQUENCIANFENTRADA: TIntegerField;
    qryBrokerItensLI_SEQUENCIADI: TIntegerField;
    qryDDItensDBL_PESOLIQUIDO: TFloatField;
    qryDDItensCALC_DBL_PESOLIQUIDO_ITEM: TFloatField;
    qryDDItensCALC_DBL_PESOBRUTO_ITEM: TFloatField;
    qryBrokerItensCALC_DBL_PESOLIQUIDO_ITEM: TFloatField;
    qryBrokerItensCALC_DBL_PESOBRUTO_ITEM: TFloatField;
    qryDDItensDBL_PESOBRUTO: TFloatField;
    qryBrokerItensNR_PARCIAL: TIntegerField;
    qryBrokerItensCALC_STR_CD_REFERENCIA: TStringField;
    qryDDItensCALC_STR_CD_REFERENCIA: TStringField;
    Splitter1: TSplitter;
    memProcessos: TMemo;
    pnlProgressoArquivo: TPanel;
    pbProgressoArquivo: TGauge;
    pnlMensagens: TPanel;
    reMensagens: TRichEdit;
    pnlMensagensCaption: TPanel;
    Splitter2: TSplitter;
    pnlProgressoGeral: TPanel;
    pbProgressoGeral: TGauge;
    Label5: TLabel;
    Label6: TLabel;
    btnMensagens: TSpeedButton;
    Label7: TLabel;
    lblStatus: TLabel;
    qryBrokerItensNR_DANFE: TStringField;
    rgTipoNota: TRadioGroup;
    qryAcrescimo: TQuery;
    qryAcrescimoVL_ACRESCIMO_MN: TFloatField;
    qryBrokerItensDBL_ICMS_COMPLEMENTAR: TFloatField;
    qryBrokerItensDBL_PESOLIQUIDOTOTAL: TFloatField;
    qryBrokerItensSTR_NR_TRANSM: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGeraComNFClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_cd_unid_negExit(Sender: TObject);
    procedure edt_cd_sapExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbArquivosClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnAbrirClick(Sender: TObject);
    procedure qryDDItensCalcFields(DataSet: TDataSet);
    procedure lbArquivosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGeraSemNFClick(Sender: TObject);
    procedure qryBrokerItensCalcFields(DataSet: TDataSet);
    procedure btnMensagensClick(Sender: TObject);
  private
    Registros: array of TRegistro;
    QTDItensTotal, TotalDespachante: Double;
    PesoBrutoNotas, PesoLiquidoNotas, QtdTotalItensNota: array of Double;
    vNrProcesso: String[18];
    QtdProcessosComErro, QtdProcessosComSucesso: Integer;
    CdCliente: String;
    FIsBroker, FIsMoney: Boolean;
    function FStrSpace(Str: String; i: Integer): String;
    function FStrZero(s: String; i: Integer): String;
    function Space(i: Integer): String;
    procedure RateiaNotas(DataSet: TDataSet);
    function Consiste(Processo: String): Boolean;
    procedure LimparMensagens;
    procedure AdicionarMensagem(AMsg: String; MsgErro: Boolean = False);
  public
    procedure GerarArquivo(Processo: String; ComDadosNF: Boolean = True);
  end;

var
  frmArquivoCroda: TfrmArquivoCroda;

implementation

uses
  PGGP017, ConsOnlineEx, Funcoes, PGSM990, StrUtils, Math, DateUtils;

{$R *.dfm}

var
  vValorFrete, vValorFreteItem, vValorFreteSubItem, vValorDeduzido,
  vTaxaFrete, vTaxaSeguro, vTaxaMLE, vTaxaDolar: Double;

procedure ApagaArquivos(ADiretorio: String);
var
  SR: TSearchRec;
begin
  if ADiretorio[Length(ADiretorio)] <> '\' then
    ADiretorio := ADiretorio + '\';
  FindFirst(ADiretorio + '*.*', faAnyFile, SR);
  repeat
    if SR.Attr and faDirectory <> faDirectory then
      DeleteFile(ADiretorio + SR.Name);
  until FindNext(SR) <> 0;
end;

procedure TfrmArquivoCroda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TfrmArquivoCroda.FStrSpace(Str: String; i: Integer): String;
var
  nr_posicoes : integer;
begin
  nr_posicoes := Length( str );
  if nr_posicoes < i then
  begin
    FStrSpace := str + Space( i - nr_posicoes );  { Completa com espacos }
  end
  else if nr_posicoes > i then
  begin
    FStrSpace := copy( str, 1, i );   {Trunca a string}
  end
  else
    FStrSpace := Str;
end;

function TfrmArquivoCroda.FStrZero(s: String; i: Integer): String;
begin
  while Length( s ) < i do
    s := '0' + s;
  FStrZero := s
end;

function TfrmArquivoCroda.Space(I: Integer): String;
var
  S: string;
begin
  S := '';
  while Length(S) < I do
    S := S + ' ';
  Space := S;
end;


procedure TfrmArquivoCroda.btnGeraComNFClick(Sender: TObject);
var
  I: Integer;
begin
  LimparMensagens;
  memProcessos.SetFocus;
  btnEnviar.Enabled := False;
  btnAbrir.Enabled  := False;
  pbProgressoGeral.MaxValue := memProcessos.Lines.Count;
  pbProgressoGeral.Progress := 0;
  for I := 0 to memProcessos.Lines.Count - 1 do
  begin
    if Trim(memProcessos.Lines[I]) = '' then
      AdicionarMensagem('Linha vazia ' + IntToStr(I))
    else
      GerarArquivo(Trim(memProcessos.Lines[I]), True);
    pbProgressoGeral.Progress := I + 1;
  end;

  lbArquivosClick(lbArquivos);
  AdicionarMensagem('');
  AdicionarMensagem('-----------------------------------------------------------');
  AdicionarMensagem('');
  AdicionarMensagem(IntToStr(QtdProcessosComSucesso) + ' processos gerados com sucesso');
  AdicionarMensagem(IntToStr(QtdProcessosComErro) + ' processos gerados com erro', True);
  AdicionarMensagem(IntToStr(lbArquivos.Count) + ' arquivos gerados no total');
  pbProgressoGeral.Progress := 0;
end;

procedure TfrmArquivoCroda.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
     edt_cd_unid_neg.Text := ConsultaOnLineExSQL('SELECT CD_UNID_NEG, NM_UNID_NEG ' +
                                                 '  FROM TUNID_NEG (NOLOCK) ' +
                                                 ' WHERE CGC_UNID_NEG IS NOT NULL'
                                                 ,'Unidades',
                                                 ['CD_UNID_NEG','NM_UNID_NEG'],
                                                 ['Código','Unidade'],
                                                 'CD_UNID_NEG');

    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', edt_cd_unid_neg.Text, 'NM_UNID_NEG');
  end
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', edt_cd_unid_neg.Text, 'NM_UNID_NEG');
end;

procedure TfrmArquivoCroda.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE: Close;
    VK_RETURN: if (Shift = [ssCtrl]) or (not memProcessos.Focused) then
                 btnGeraSemNFClick(btnGeraSemNF);
  end;
end;

procedure TfrmArquivoCroda.edt_cd_unid_negExit(Sender: TObject);
begin
  edt_cd_unid_neg.Text := FStrZero(Trim(edt_cd_unid_neg.Text), 2);
  btn_co_unid_negClick(Sender);
end;

procedure TfrmArquivoCroda.edt_cd_sapExit(Sender: TObject);
begin
  TEdit(Sender).Text := Trim(TEdit(Sender).Text);
end;

procedure TfrmArquivoCroda.FormCreate(Sender: TObject);
begin
  edt_cd_unid_neg.Text := '01';
  edt_cd_unid_negExit(edt_cd_unid_neg);
  btnMensagens.Click;
end;

procedure TfrmArquivoCroda.lbArquivosClick(Sender: TObject);
begin
  btnEnviar.Enabled := lbArquivos.SelCount > 0;
  btnAbrir.Enabled  := lbArquivos.SelCount > 0;
end;

procedure TfrmArquivoCroda.btnEnviarClick(Sender: TObject);
var
  I: Integer;
begin
  //Abertura do form de impressão
  Application.CreateForm(TFrm_impressao, Frm_impressao );
  frm_impressao.vApenas_email := true;

  // Adiciona os arquivos selecionados a lista de anexos
  for I := 0 to lbArquivos.Count - 1 do
    if lbArquivos.Selected[I] then // Adiciona se estiver selecionado
      frm_impressao.LstFiles.Items.Add(lbArquivos.Items[I]);

  frm_impressao.ShowModal;
  frm_impressao.Release;
  FreeAndNil(frm_impressao);

  // Apagar arquivos depois de enviados
  if Application.MessageBox('Deseja excluir os arquivos já enviados?', 'Exclusão de Arquivos', MB_YESNO  + MB_ICONWARNING) = mrYes then
  begin
    for I:= 0 to lbArquivos.Count -1 do
      if lbArquivos.Selected[I] then // Exclui se estiver selecionado
        DeleteFile(lbArquivos.Items[I]);
    lbArquivos.DeleteSelected;
    lbArquivosClick(lbArquivos);
  end;
end;

procedure TfrmArquivoCroda.btnAbrirClick(Sender: TObject);
var
  I: Integer;
begin
  // Abre os arquivos selecionados
  for I := 0 to lbArquivos.Count - 1 do
    if lbArquivos.Selected[I] then // Abre se estiver selecionado
      ShellExecute(Self.Handle, nil, PAnsiChar(lbArquivos.Items[I]), nil, PAnsiChar(ExtractFilePath(lbArquivos.Items[I])), SW_SHOW);
end;

procedure TfrmArquivoCroda.qryDDItensCalcFields(DataSet: TDataSet);
var
  Mem: TStrings;
  I: Integer;
  S: String;

  function ExtraiValor(Linha, ID: String): String;
  begin
    Result := Trim(Copy(Linha, Length(ID) +1, Length(Linha) - Length(ID)));
  end;
begin
  Mem := TStringList.Create();
  // Pega os valores da Nota fiscal de entrada
  // e procura nele: nr. Nota (00002), CFOP (000003), Dt Nota (000022), Total (parametrizado, padrão 000099)
  Mem.Clear;
  Mem.Assign(qryDDItensMEM_DADOS_NF_ENTRADA);
  for I := 0 to Mem.Count- 1 do begin
    if Pos('000002', Copy(Mem.Strings[i], 1, 6)) > 0 then
      qryDDItensCALC_STR_NRNOTA.AsString := ExtraiValor(Mem[I], '000002')
    else if Pos('000034', Copy(Mem.Strings[i], 1, 6)) > 0 then
      qryDDItensCALC_DBL_PESOBRUTO.AsFloat := StrToFloat(StringReplace(ExtraiValor(Mem[I], '000034'), ',', '.', [rfReplaceAll]))
    else if Pos('000035', Copy(Mem.Strings[i], 1, 6)) > 0 then
      qryDDItensCALC_DBL_PESOLIQUIDO.AsFloat := StrToFloat(StringReplace(ExtraiValor(Mem[I], '000035'), ',', '.', [rfReplaceAll]))
    else if Pos('000020', Copy(Mem.Strings[i], 1, 6)) > 0 then
      qryDDItensCALC_STR_SERIENOTA.AsString := ExtraiValor(Mem[I], '000020')
    else if Pos('000022', Copy(Mem.Strings[i], 1, 6)) > 0 then
    begin
      S := StringReplace(ExtraiValor(Mem[I], '000022'), '/', '', [rfReplaceAll]);
      if Trim(Copy(S, 7, 2)) = '' then
        qryDDItensCALC_STR_DATANOTA.AsString := Copy(S, 1, 4) + '20' + Copy(S, 5, 2)
      else
        qryDDItensCALC_STR_DATANOTA.AsString := S
    end
    else if Pos('000003', Copy(Mem.Strings[i], 1, 6)) > 0 then begin
      S := StringReplace(ExtraiValor(Mem[I], '000003'), '.', '', [rfReplaceAll]);
      // Adicionado por ocorrência com virgula e não ponto - Michel - 18/12/2008
      qryDDItensCALC_STR_CFOP.AsString := StringReplace(S, ',', '', [rfReplaceAll]);
    end;
  end;

  // Pega os valores da Nota fiscal de entrada
  Mem.Clear;
  Mem.Assign(qryDDItensMEM_DADOS_NF_ITEM);
  // Foram invertidos os número 27 e 28, pois estavam trazendo os valores invertidos - Michel - 22/12/2008
  for i := 0 to Mem.Count- 1 do
  begin
    if Pos('000006', Copy(Mem.Strings[i], 1, 6)) > 0 then
      qryDDItensCALC_STR_SIGLAUNIDADEMOEDA_ITEM.AsString := ExtraiValor(Mem[I], '000006')
    else if Pos('000024', Copy(Mem.Strings[i], 1, 6)) > 0 then
      qryDDItensCALC_DBL_CIFREAISTOTAL_ITEM.AsFloat := StrToFloat(StringReplace(ExtraiValor(Mem[I], '000024'), ',', '.', [rfReplaceAll]))
    else if Pos('000027', Copy(Mem.Strings[i], 1, 6)) > 0 then
      qryDDItensCALC_DBL_QTDITENS_ITEM.AsFloat := StrToFloat(StringReplace(ExtraiValor(Mem[I], '000027'), ',', '.', [rfReplaceAll]))
    else if Pos('000028', Copy(Mem.Strings[i], 1, 6)) > 0 then
      qryDDItensCALC_DBL_CIFREAISUNIT_ITEM.AsFloat := StrToFloat(StringReplace(ExtraiValor(Mem[I], '000028'), ',', '.', [rfReplaceAll]))
    else if Pos('000029', Copy(Mem.Strings[i], 1, 6)) > 0 then
      qryDDItensCALC_DBL_ALIQUOTAICMS_ITEM.AsFloat := StrToFloat(StringReplace(ExtraiValor(Mem[I], '000029'), ',', '.', [rfReplaceAll]))
    else if Pos('000078', Copy(Mem.Strings[i], 1, 6)) > 0 then
      qryDDItensCALC_DBL_ALIQUOTAIPI_ITEM.AsFloat := StrToFloat(StringReplace(ExtraiValor(Mem[I], '000078'), ',', '.', [rfReplaceAll]))
    else if Pos('000026', Copy(Mem.Strings[i], 1, 6)) > 0 then
      qryDDItensCALC_DBL_VALORIPI_ITEM.AsFloat := StrToFloat(StringReplace(ExtraiValor(Mem[I], '000026'), ',', '.', [rfReplaceAll]))
    else if Pos('000051', Copy(Mem.Strings[i], 1, 6)) > 0 then
      qryDDItensCALC_DBL_VALORBASEICMS_ITEM.AsFloat := StrToFloat(StringReplace(ExtraiValor(Mem[I], '000051'), ',', '.', [rfReplaceAll]))
    else if Pos('000045', Copy(Mem.Strings[i], 1, 6)) > 0 then
      qryDDItensCALC_DBL_VALORICMS_ITEM.AsFloat := StrToFloat(StringReplace(ExtraiValor(Mem[I], '000045'), ',', '.', [rfReplaceAll]))
    else if Pos('000041', Copy(Mem.Strings[i], 1, 6)) > 0 then
      qryDDItensCALC_DBL_VALORII_ITEM.AsFloat := StrToFloat(StringReplace(ExtraiValor(Mem[I], '000041'), ',', '.', [rfReplaceAll]))
    else if Pos('000109', Copy(Mem.Strings[i], 1, 6)) > 0 then
      qryDDItensCALC_STR_NRPEDIDO_ITEM.AsString := ExtraiValor(Mem[I], '000110')
    else if Pos('000043', Copy(Mem.Strings[i], 1, 6)) > 0 then
      qryDDItensCALC_DBL_PESOLIQUIDO_ITEM.AsFloat := StrToFloat(StringReplace(ExtraiValor(Mem[I], '000043'), ',', '.', [rfReplaceAll]))
    else if Pos('000044', Copy(Mem.Strings[i], 1, 6)) > 0 then
      qryDDItensCALC_DBL_PESOBRUTO_ITEM.AsFloat := StrToFloat(StringReplace(ExtraiValor(Mem[I], '000044'), ',', '.', [rfReplaceAll]));
  end;
  qryDDItensCALC_STR_CD_REFERENCIA.AsString := qryDDItensSTR_NUMEROPO.AsString + '/' +
     RightStr('0000' + qryDDItensLI_ITEMPO.AsString, 4);
  // Ao percorrer os ítens, utilizar apenas os que estiverem com a flag CALC_IN_ATIVO = True - Michel - 28/03/2009
  qryDDItensCALC_IN_ATIVO.AsBoolean := (qryDDItensSTR_NUMEROPO.AsString = qryDDItensCALC_STR_NRPEDIDO_ITEM.AsString);
  Mem.Free;
end;

procedure TfrmArquivoCroda.RateiaNotas(DataSet: TDataSet);
var
  PBTotal, PLTotal, PBParcial, PLParcial, PBUtilizado, PLUtilizado: Real;
  QTDItensNota, QtdeMedidaEstatTotal, vlFreteTotal, vlFreteSobra, vlFreteItem, ValorOrigem: Real;
  vlAcrescimoTotal, vlAcrescimoSobra, vlAcrescimoItem: Double;
  QTDNotas, NotasRateadas: Integer;
  vInvoice, vNrPO: String;
  vItemPO: Integer;
  I: Integer;
begin
  // Listar os registros
  SetLength(Registros, 0);
  DataSet.First;
  vInvoice := '';
  vNrPO    := '';
  vItemPO  := -1;
  while not DataSet.Eof do
  begin
    if DataSet.FieldByName('CALC_IN_ATIVO').AsBoolean then
    begin
      if (vInvoice = DataSet.FieldByName('STR_NUMEROFATURADDIMPORT').AsString) and
         (vNrPO = DataSet.FieldByName('STR_NUMEROPO').AsString) and (vItemPO = DataSet.FieldByName('LI_ITEMPO').AsInteger) then
      begin
        // A linha abaixo foi comentada a quantidade estatisca e substituida pelo peso liquido a pedido da croda - Michel - 28/04/2011
        Registros[High(Registros)].DBL_QTDEMEDIDAESTAT        := DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat;//Registros[High(Registros)].DBL_QTDEMEDIDAESTAT + DataSet.FieldByName('DBL_QTDEMEDIDAESTAT').AsFloat;
        Registros[High(Registros)].DBL_VALORFRETEMOEDAPREPAID := Registros[High(Registros)].DBL_VALORFRETEMOEDAPREPAID + (DataSet.FieldByName('DBL_VALORFRETEMOEDAPREPAID').AsFloat / DataSet.FieldByName('CALC_DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_VALORFRETEMOEDACOLLECT := Registros[High(Registros)].DBL_VALORFRETEMOEDACOLLECT + (DataSet.FieldByName('DBL_VALORFRETEMOEDACOLLECT').AsFloat / DataSet.FieldByName('CALC_DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_VALORORIGEMMOEDA       := Registros[High(Registros)].DBL_VALORORIGEMMOEDA + (DataSet.FieldByName('DBL_VALORORIGEMMOEDA').AsFloat / DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_VALORSEGUROMOEDA       := Registros[High(Registros)].DBL_VALORSEGUROMOEDA + ((((DataSet.FieldByName('DBL_VALORSEGUROMOEDA').AsFloat / DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat) * vTaxaSeguro) / vTaxaMLE);
        Registros[High(Registros)].DBL_TAXASISCOMEX           := Registros[High(Registros)].DBL_TAXASISCOMEX + (DataSet.FieldByName('DBL_TAXASISCOMEX').AsFloat / DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_ACRESCIMOSREAIS        := Registros[High(Registros)].DBL_ACRESCIMOSREAIS + (DataSet.FieldByName('DBL_ACRESCIMOSREAIS').AsFloat / DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_VALORIIRECOLHER        := Registros[High(Registros)].DBL_VALORIIRECOLHER + (DataSet.FieldByName('DBL_VALORIIRECOLHER').AsFloat / DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_VALORICMS              := Registros[High(Registros)].DBL_VALORICMS + (DataSet.FieldByName('DBL_VALORICMS').AsFloat / DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_ICMS_COMPLEMENTAR      := Registros[High(Registros)].DBL_ICMS_COMPLEMENTAR + (DataSet.FieldByName('DBL_ICMS_COMPLEMENTAR').AsFloat / DataSet.FieldByName('DBL_PESOLIQUIDOTOTAL').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_VALORIPIRECOLHER       := Registros[High(Registros)].DBL_VALORIPIRECOLHER + (DataSet.FieldByName('DBL_VALORIPIRECOLHER').AsFloat / DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_VALORPISPASEPARECOLHER := Registros[High(Registros)].DBL_VALORPISPASEPARECOLHER + (DataSet.FieldByName('DBL_VALORPISPASEPARECOLHER').AsFloat / DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_VALORCOFINSARECOLHER   := Registros[High(Registros)].DBL_VALORCOFINSARECOLHER + (DataSet.FieldByName('DBL_VALORCOFINSARECOLHER').AsFloat / DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_PESOBRUTO              := Registros[High(Registros)].DBL_PESOBRUTO + DataSet.FieldByName('DBL_PESOBRUTO').AsFloat;
        Registros[High(Registros)].DBL_PESOLIQUIDO            := Registros[High(Registros)].DBL_PESOLIQUIDO + DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat;
        Registros[High(Registros)].DBL_CIFREAISTOTAL_ITEM     := Registros[High(Registros)].DBL_CIFREAISTOTAL_ITEM + DataSet.FieldByName('CALC_DBL_CIFREAISTOTAL_ITEM').AsFloat;
        Registros[High(Registros)].DBL_CIFREAISUNIT_ITEM      := Registros[High(Registros)].DBL_CIFREAISUNIT_ITEM + DataSet.FieldByName('CALC_DBL_CIFREAISUNIT_ITEM').AsFloat;
        Registros[High(Registros)].DBL_QTDITENS_ITEM          := Registros[High(Registros)].DBL_QTDITENS_ITEM + DataSet.FieldByName('CALC_DBL_QTDITENS_ITEM').AsFloat;
        Registros[High(Registros)].DBL_VALORBASEICMS_ITEM     := Registros[High(Registros)].DBL_VALORBASEICMS_ITEM + DataSet.FieldByName('CALC_DBL_VALORBASEICMS_ITEM').AsFloat;
        Registros[High(Registros)].DBL_VALORICMS_ITEM         := Registros[High(Registros)].DBL_VALORICMS_ITEM + DataSet.FieldByName('CALC_DBL_VALORICMS_ITEM').AsFloat;
        Registros[High(Registros)].DBL_VALORII_ITEM           := Registros[High(Registros)].DBL_VALORII_ITEM + DataSet.FieldByName('CALC_DBL_VALORII_ITEM').AsFloat;
        Registros[High(Registros)].DBL_PESOBRUTO_ITEM         := Registros[High(Registros)].DBL_PESOBRUTO_ITEM + DataSet.FieldByName('CALC_DBL_PESOBRUTO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_PESOLIQUIDO_ITEM       := Registros[High(Registros)].DBL_PESOLIQUIDO_ITEM + DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_QTDITENSNOTA           := Registros[High(Registros)].DBL_QTDITENSNOTA + DataSet.FieldByName('CALC_DBL_QTDITENSNOTA').AsFloat;
        // Incluído abaixo para incremetar 1 no array da referência - Michel - 28/12/2011
        SetLength(Registros[High(Registros)].STR_CD_REFERENCIA, High(Registros[High(Registros)].STR_CD_REFERENCIA) + 2);
        // Estava comentado abaixo. Alterado por Michel para guardar todas as referências - 28/12/2011
        Registros[High(Registros)].STR_CD_REFERENCIA[High(Registros[High(Registros)].STR_CD_REFERENCIA)] := DataSet.FieldByName('CALC_STR_CD_REFERENCIA').AsString;
      end
      else
      begin
        SetLength(Registros, High(Registros) +2);
        // Incluído abaixo para guardar a referência atual - 28/12/2011
        SetLength(Registros[High(Registros)].STR_CD_REFERENCIA, 1);
        Registros[High(Registros)].STR_CODIGOPRODUTO          := AnsiUpperCase(DataSet.FieldByName('STR_CODIGOPRODUTO').AsString);
        Registros[High(Registros)].STR_NUMEROFATURADDIMPORT   := DataSet.FieldByName('STR_NUMEROFATURADDIMPORT').AsString;
        Registros[High(Registros)].STR_NUMEROPO               := DataSet.FieldByName('STR_NUMEROPO').AsString;
        Registros[High(Registros)].STR_CODIGOMOEDANEG         := DataSet.FieldByName('STR_CODIGOMOEDANEG').AsString;
        Registros[High(Registros)].STR_CODIGOMOEDAFRETE       := DataSet.FieldByName('STR_CODIGOMOEDAFRETE').AsString;
        Registros[High(Registros)].LI_SEQUENCIACONTINUACAO    := DataSet.FieldByName('LI_SEQUENCIACONTINUACAO').AsInteger;
        Registros[High(Registros)].LI_SEQUENCIAITEM           := DataSet.FieldByName('LI_SEQUENCIAITEM').AsInteger;
        Registros[High(Registros)].LI_SEQUENCIANFENTRADA      := DataSet.FieldByName('LI_SEQUENCIANFENTRADA').AsInteger;
        Registros[High(Registros)].LI_ITEMPO                  := DataSet.FieldByName('LI_ITEMPO').AsInteger;
        Registros[High(Registros)].LI_SEQUENCIADI             := DataSet.FieldByName('LI_SEQUENCIADI').AsInteger;
        // A linha abaixo foi comentada a quantidade estatisca e substituida pelo peso liquido a pedido da croda - Michel - 28/04/2011
        Registros[High(Registros)].DBL_QTDEMEDIDAESTAT        := DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat;//DataSet.FieldByName('DBL_QTDEMEDIDAESTAT').AsFloat;
        Registros[High(Registros)].DBL_VALORFRETEMOEDAPREPAID := (DataSet.FieldByName('DBL_VALORFRETEMOEDAPREPAID').AsFloat / DataSet.FieldByName('CALC_DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_VALORFRETEMOEDACOLLECT := (DataSet.FieldByName('DBL_VALORFRETEMOEDACOLLECT').AsFloat / DataSet.FieldByName('CALC_DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;

        Registros[High(Registros)].DBL_VALORORIGEMMOEDA       := (DataSet.FieldByName('DBL_VALORORIGEMMOEDA').AsFloat / DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_VALORSEGUROMOEDA       := (((DataSet.FieldByName('DBL_VALORSEGUROMOEDA').AsFloat / DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat) * vTaxaSeguro) / vTaxaMLE;
        Registros[High(Registros)].DBL_TAXAMERCADORIA         := (DataSet.FieldByName('DBL_TAXAMERCADORIA').AsFloat / DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_TAXASISCOMEX           := (DataSet.FieldByName('DBL_TAXASISCOMEX').AsFloat / DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_TAXASEGURO             := (DataSet.FieldByName('DBL_TAXASEGURO').AsFloat / DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_ACRESCIMOSREAIS        := (DataSet.FieldByName('DBL_ACRESCIMOSREAIS').AsFloat / DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_VALORIIRECOLHER        := (DataSet.FieldByName('DBL_VALORIIRECOLHER').AsFloat / DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_VALORICMS              := (DataSet.FieldByName('DBL_VALORICMS').AsFloat / DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_ICMS_COMPLEMENTAR      := (DataSet.FieldByName('DBL_ICMS_COMPLEMENTAR').AsFloat / DataSet.FieldByName('DBL_PESOLIQUIDOTOTAL').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_VALORIPIRECOLHER       := (DataSet.FieldByName('DBL_VALORIPIRECOLHER').AsFloat / DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_VALORPISPASEPARECOLHER := (DataSet.FieldByName('DBL_VALORPISPASEPARECOLHER').AsFloat / DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_VALORCOFINSARECOLHER   := (DataSet.FieldByName('DBL_VALORCOFINSARECOLHER').AsFloat / DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat) * DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        // Campos Calculados
        Registros[High(Registros)].STR_NRNOTA                 := DataSet.FieldByName('CALC_STR_NRNOTA').AsString;
        Registros[High(Registros)].STR_SERIENOTA              := DataSet.FieldByName('CALC_STR_SERIENOTA').AsString;
        Registros[High(Registros)].STR_DATANOTA               := DataSet.FieldByName('CALC_STR_DATANOTA').AsString;
        Registros[High(Registros)].STR_SIGLAUNIDADEMOEDA_ITEM := DataSet.FieldByName('CALC_STR_SIGLAUNIDADEMOEDA_ITEM').AsString;
        Registros[High(Registros)].STR_NRPEDIDO_ITEM          := DataSet.FieldByName('CALC_STR_NRPEDIDO_ITEM').AsString;
        Registros[High(Registros)].STR_CFOP                   := DataSet.FieldByName('CALC_STR_CFOP').AsString;
        Registros[High(Registros)].DBL_PESOBRUTO              := DataSet.FieldByName('DBL_PESOBRUTO').AsFloat;
        Registros[High(Registros)].DBL_PESOLIQUIDO            := DataSet.FieldByName('DBL_PESOLIQUIDO').AsFloat;
        Registros[High(Registros)].DBL_CIFREAISTOTAL_ITEM     := DataSet.FieldByName('CALC_DBL_CIFREAISTOTAL_ITEM').AsFloat;
        Registros[High(Registros)].DBL_CIFREAISUNIT_ITEM      := DataSet.FieldByName('CALC_DBL_CIFREAISUNIT_ITEM').AsFloat;
        Registros[High(Registros)].DBL_QTDITENS_ITEM          := DataSet.FieldByName('CALC_DBL_QTDITENS_ITEM').AsFloat;
        Registros[High(Registros)].DBL_ALIQUOTAICMS_ITEM      := DataSet.FieldByName('CALC_DBL_ALIQUOTAICMS_ITEM').AsFloat;
        Registros[High(Registros)].DBL_ALIQUOTAIPI_ITEM       := DataSet.FieldByName('CALC_DBL_ALIQUOTAIPI_ITEM').AsFloat;
        Registros[High(Registros)].DBL_VALORIPI_ITEM          := DataSet.FieldByName('CALC_DBL_VALORIPI_ITEM').AsFloat;
        Registros[High(Registros)].DBL_VALORBASEICMS_ITEM     := DataSet.FieldByName('CALC_DBL_VALORBASEICMS_ITEM').AsFloat;
        Registros[High(Registros)].DBL_VALORICMS_ITEM         := DataSet.FieldByName('CALC_DBL_VALORICMS_ITEM').AsFloat;
        Registros[High(Registros)].DBL_VALORII_ITEM           := DataSet.FieldByName('CALC_DBL_VALORII_ITEM').AsFloat;
        Registros[High(Registros)].DBL_PESOBRUTO_ITEM         := DataSet.FieldByName('CALC_DBL_PESOBRUTO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_PESOLIQUIDO_ITEM       := DataSet.FieldByName('CALC_DBL_PESOLIQUIDO_ITEM').AsFloat;
        Registros[High(Registros)].DBL_QTDITENSNOTA           := DataSet.FieldByName('CALC_DBL_QTDITENSNOTA').AsFloat;
        // Incluído abaixo o índice de referência do array - Michel - 28/12/2011
        Registros[High(Registros)].STR_CD_REFERENCIA[0]       := DataSet.FieldByName('CALC_STR_CD_REFERENCIA').AsString;
      end;
      vInvoice := DataSet.FieldByName('STR_NUMEROFATURADDIMPORT').AsString;
      vNrPO    := DataSet.FieldByName('STR_NUMEROPO').AsString;
      vItemPO  := DataSet.FieldByName('LI_ITEMPO').AsInteger;
    end;
    DataSet.Next;
  end;

  // Efetuar o rateio do Peso Bruto e do Peso Líquido nas notas
  PBTotal       := 0;
  PLTotal       := 0;
  QTDItensTotal := 0;

  // Pega os valores totais para efetuar o rateio nas notas
  QTDNotas := 0;
  QtdeMedidaEstatTotal := 0;
  ValorOrigem := 0;
  for I := 0 to High(Registros) do
  begin
    QTDNotas := Registros[I].LI_SEQUENCIACONTINUACAO;
    QTDItensTotal := QTDItensTotal + Registros[I].DBL_QTDITENS_ITEM;
    PBTotal := PBTotal + Registros[I].DBL_PESOBRUTO;
    PLTotal := PLTotal + Registros[I].DBL_PESOLIQUIDO;
    QtdeMedidaEstatTotal := QtdeMedidaEstatTotal + Registros[I].DBL_QTDEMEDIDAESTAT;
    ValorOrigem := ValorOrigem + Registros[I].DBL_VALORORIGEMMOEDA;
  end;

  SetLength(PesoBrutoNotas, QTDNotas);
  SetLength(PesoLiquidoNotas, QTDNotas);
  SetLength(QtdTotalItensNota, QTDNotas);
  for NotasRateadas := 1 to QTDNotas do
  begin
    PesoBrutoNotas[NotasRateadas -1]    := 0;
    PesoLiquidoNotas[NotasRateadas -1]  := 0;
    QtdTotalItensNota[NotasRateadas -1] := 0;
  end;

  // Pega os valores totais para efetuar o rateio nas notas
  PBUtilizado   := 0;
  PLUtilizado   := 0;
  NotasRateadas := 0;
  while NotasRateadas < QTDNotas do
  begin
    Inc(NotasRateadas);
    QTDItensNota := 0;
    for I := 0 to High(Registros) do
      if (Registros[I].LI_SEQUENCIACONTINUACAO = NotasRateadas) then
        //QTDItensNota := QTDItensNota + Registros[I].DBL_QTDEMEDIDAESTAT;
        QTDItensNota := QTDItensNota + Registros[I].DBL_QTDITENS_ITEM;

    // Efetua o rateio
    for I := 0 to High(Registros) do
    begin
      if (Registros[I].LI_SEQUENCIACONTINUACAO = NotasRateadas) then
      begin
        QTDTotalItensNota[NotasRateadas -1] := QTDItensNota;
        PBParcial := StrToFloat(FormatFloat('###0.00', (PBTotal * QTDItensNota) / QTDItensTotal));
        PLParcial := StrToFloat(FormatFloat('###0.00', (PLTotal * QTDItensNota) / QTDItensTotal));
        if NotasRateadas = QTDNotas then
        begin
          PesoBrutoNotas[NotasRateadas -1]   := PBTotal - PBUtilizado;
          PesoLiquidoNotas[NotasRateadas -1] := PLTotal - PLUtilizado;
        end
        else
        begin
          PesoBrutoNotas[NotasRateadas -1]   := PBParcial;
          PesoLiquidoNotas[NotasRateadas -1] := PLParcial;
        end;
        PBUtilizado := PBUtilizado + PBParcial;
        PLUtilizado := PLUtilizado + PLParcial;
        Break;
      end;
    end;
  end;
  vlFreteTotal := qryBrokerFreteVL_FRETE.AsFloat;
  vlFreteSobra := vlFreteTotal;
  if qryAcrescimo.Active then
    qryAcrescimo.Close;
  qryAcrescimo.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
  qryAcrescimo.Open;
  vlAcrescimoTotal := qryAcrescimoVL_ACRESCIMO_MN.AsFloat;
  vlAcrescimoSobra := vlAcrescimoTotal;
  qryAcrescimo.Close;

  
  for I := 0 to High(Registros) do
  begin
    // Define os pesos e quantidades para os ítens
    Registros[I].DBL_QTDITENSNOTA := QTDTotalItensNota[Registros[I].LI_SEQUENCIACONTINUACAO -1];
    if I = High(Registros) then
    begin
      Registros[I].DBL_VALOR_FRETE := vlFreteSobra;
      Registros[I].DBL_VALOR_ACRESCIMO := vlAcrescimoSobra;
    end
    else
    begin
      vlFreteItem  := StrToFloat(FormatFloat('###0.00', (vlFreteTotal * Registros[I].DBL_QTDITENS_ITEM) / IfThen(QTDItensTotal = 0, 1, QTDItensTotal)));
      vlFreteSobra := vlFreteSobra - vlFreteItem;
      Registros[I].DBL_VALOR_FRETE  := vlFreteItem;

      vlAcrescimoItem  := StrToFloat(FormatFloat('###0.00', (vlAcrescimoTotal * Registros[I].DBL_QTDITENS_ITEM) / IfThen(QTDItensTotal = 0, 1, QTDItensTotal)));
      vlAcrescimoSobra := vlAcrescimoSobra - vlAcrescimoItem;
      Registros[I].DBL_VALOR_ACRESCIMO := vlAcrescimoItem;
    end;
  end;
end;

function TfrmArquivoCroda.Consiste(Processo: String): Boolean;
begin
  Result := True;
{ VALIDAR O PREENCHIMENTO DOS CAMPOS } // Michel - 03/12/2008
  // Valida preenchimento da unidade
  if edt_nm_unid_neg.Text = '' then
  begin
    AdicionarMensagem('Unidade inválida.'#13'Verifique o campo e tente novamente.', True);
    edt_cd_unid_neg.SetFocus;
    Result := False;
    Exit;
  end;
  // Valida o preenchimento do processo
  if memProcessos.Lines.Count = 0 then
  begin
    AdicionarMensagem('Processo não preenchido.'#13'Preencha o campo e tente novamente.', True);
    memProcessos.SetFocus;
    Result := False;
    Exit;
  end;
  // Valida o preenchimento do campo SAP
  if edt_cd_sap.Text = '' then
  begin
    AdicionarMensagem('Código SAP não informado.'#13'Verifique o campo e tente novamente.', True);
    edt_cd_unid_neg.SetFocus;
    Result := False;
    Exit;
  end;

{ VALIDAR O CONTEÚDO DOS CAMPOS }
  // Valida processo
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Add('  SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.IN_CANCELADO,                                 ');
    SQL.Add('         (SELECT CD_GRUPO FROM TEMPRESA_NAC EN  (NOLOCK) WHERE CD_EMPRESA = CD_CLIENTE) AS CD_GRUPO   ');
    SQL.Add('  FROM TPROCESSO PR (NOLOCK)                                                                          ');
    SQL.Add('  WHERE NR_PROCESSO = :NR_PROCESSO                                                                    ');
    ParamByName('NR_PROCESSO').AsString := edt_cd_unid_neg.Text + '01' + Processo;
    Open;

    // Verifica se o processo existe
    if RecordCount = 0 then
    begin
      AdicionarMensagem('O processo não foi encontrado.'#13'Verifique processo e tente novamente.', True);
      Result := False;
    end;
    // Valida Grupo
//    if Result and (FieldByName('CD_GRUPO').AsString <> '083') then
    if Result and ((FieldByName('CD_GRUPO').AsString <> '083') and (FieldByName('CD_GRUPO').AsString <> 'C66') and (FieldByName('CD_GRUPO').AsString <> 'C71') ) then
    begin
      AdicionarMensagem('O processo não é do grupo Croda.'#13'Verifique processo e tente novamente.', True);
      Result := False;
    end;
    // Valida Processo Cancelado
    if Result and (FieldByName('IN_CANCELADO').AsString <> '0') then
    begin
      AdicionarMensagem('O processo está cancelado.'#13'Verifique processo e tente novamente.', True);
      Result := False;
    end;
    Close;
    Free;
  end;

  if rgTipoNota.ItemIndex = 1 then
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Add('SELECT COUNT(*) AS QT_NF FROM TPROCESSO_NF (NOLOCK)WHERE NR_PROCESSO = :NR_PROCESSO ');
      ParamByName('NR_PROCESSO').AsString := edt_cd_unid_neg.Text + '01' + Processo;
      Open;

      // Verifica se a quantidade de notas é 0
      if FieldByName('QT_NF').AsInteger = 0 then
      begin
        AdicionarMensagem('Processo sem notas fiscais cadastradas.', True);
        Result := False;
      end;

      Close;
      Free;
    end;
  end;

  vNrProcesso := UpperCase(edt_cd_unid_neg.Text + '01' + Processo);
end;

procedure TfrmArquivoCroda.lbArquivosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (lbArquivos.SelCount > 0) and
     (MessageDlg('Para reinserir os arquivos novamente será necessário gerá-los novamente.'#13 +
     'Deseja continuar com a exclusão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    lbArquivos.DeleteSelected;
end;

procedure TfrmArquivoCroda.GerarArquivo(Processo: String; ComDadosNF: Boolean);
var
  vSeq, vQtdeItem, vQtdeLinhas, N,FaturamentoNovo: Integer;
  vIN_EMBUT_FRT_ITENS, vIN_EMBUT_SEG_ITENS : Boolean;
  vSolicitacao, vRegistroDI, vDtNota, vDtNotaInv, vSiglaMoeda,
  vCodigoSAP, vDataFatura, vNumeroFatura, vItemPO,
  vNomeArquivo, vMoedaFrete, vCodFornecedor , vNrNfIndaia, vDataNfIndaia: String;
  vValorNFIndaia : double;
  FreteIndaia: Boolean;
  vErros, vArquivo: TStrings;
  vNotas: array of string;
  vNrEmissao, vAnoEmissao: Integer;
  Nr_NF_Indaia, Dt_NF_Indaia: String;

  procedure ListaNotas(DataSet: TDataSet);
    function NotaExiste: Boolean;
    var
      I: Integer;
    begin
      for I := 0 to High(vNotas) do
        if DataSet.FieldByName('CALC_STR_NRNOTA').AsString = vNotas[I] then
          Break;
      Result := (High(vNotas) >= 0) and (I <= High(vNotas));
    end;
  begin
    SetLength(vNotas, 0);
    DataSet.First;
    while not DataSet.Eof do
    begin
      if DataSet.FieldByName('CALC_IN_ATIVO').AsBoolean and (not NotaExiste) then
      begin
        SetLength(vNotas, High(vNotas) +2);
        vNotas[High(vNotas)] := DataSet.FieldByName('CALC_STR_NRNOTA').AsString;
      end;
      DataSet.Next;
    end;
  end;

  function InicioNota(NR_NOTA: String): Integer;
  begin
    Result := 0;
    while (Result <= High(Registros)) and (Registros[Result].STR_NRNOTA <> NR_NOTA) do
      Inc(Result);
  end;

  procedure Escreve_NF(NR_NOTA: String);
  var
    INota: Integer;
    I: Integer;
  begin
    INota := InicioNota(NR_NOTA);
    // Buscando a quantidade de itens
    vQtdeItem := 0;
    I := INota;
    vDtNota := Registros[I].STR_DATANOTA;
    while (I <= High(Registros)) and (Registros[I].STR_NRNOTA = NR_NOTA) do
    begin
      if (Registros[I].STR_NRNOTA = NR_NOTA) then
        Inc(vQtdeItem);
      Inc(I);
    end;

    vQtdeLinhas := vQtdeLinhas + 1;
    I := INota;
    // Sempre 10
    vArquivo.Add('10'                                                                            +
                 FStrSpace(vRegistroDI + FStrSpace(NR_NOTA, 6), 22)                        +
                 FStrZero(NR_NOTA, 6)                                                            +
                 FStrSpace(StringReplace(Registros[I].STR_DATANOTA, '/', '', [rfReplaceAll]), 8) +
                 FStrSpace(Registros[I].STR_SERIENOTA, 3)                                        +
                 FStrSpace(vCodigoSAP, 10)                                                       +
                //FStrZero(vCodFornecedor, 10)                                                    +
                 FStrZero(IntToStr(vQtdeItem), 5)                                                +
                 FStrSpace(FormatFloat('0.00', Registros[I].DBL_PESOBRUTO), 19)                  +
                 FStrSpace(FormatFloat('0.00', Registros[I].DBL_PESOLIQUIDO), 19)                +
                 FStrSpace('KG', 3));

    // Percorre os itens até chegar na fatura passada como parâmetro
    I := INota;
    vSeq := 1;
    while (I <= High(Registros)) and (Registros[I].STR_NRNOTA = NR_NOTA) do
    begin
      vQtdeLinhas := vQtdeLinhas + 1;
      //SEMPRE 11
      vArquivo.Add('11'                                                                                                    +
         FStrSpace(vRegistroDI + FStrSpace(NR_NOTA, 6), 22)                                                          +
         FStrZero(NR_NOTA, 6)                                                                                              +
         FStrSpace(Registros[I].STR_CODIGOPRODUTO, 18)                                                                     +
         FStrZero(IntToStr(vSeq), 6)                                                                                       +
         FStrSpace(FormatFloat('0.000', Registros[I].DBL_QTDITENS_ITEM), 17)                                               +
         FStrSpace(Registros[I].STR_SIGLAUNIDADEMOEDA_ITEM, 3)                                                             +
         FStrSpace(FormatFloat('0.00', Registros[I].DBL_CIFREAISUNIT_ITEM), 23)                                            +
         FStrSpace(FormatFloat('0.00', Registros[I].DBL_CIFREAISTOTAL_ITEM), 18)                                           +
         FStrZero(IfThen(Registros[I].STR_CFOP = '3949', '00', FormatFloat('00', Registros[I].DBL_ALIQUOTAICMS_ITEM)), 2)  +
         FStrZero(IfThen(Registros[I].STR_CFOP = '3949', '00', FormatFloat('00', Registros[I].DBL_ALIQUOTAIPI_ITEM)), 2)   +
         FStrSpace(Registros[I].STR_CFOP, 10)                                                                              +
         FStrSpace(IfThen(Registros[I].STR_CFOP = '3949', '00', FormatFloat('0.00', Registros[I].DBL_VALORICMS_ITEM)), 16) +
         FStrSpace(IfThen(Registros[I].STR_CFOP = '3949', '  ', FormatFloat('0.00', Registros[I].DBL_VALORIPI_ITEM)), 16)  +
         FStrSpace(IfThen(Registros[I].STR_CFOP = '3949', '  ', FormatFloat('0.00', Registros[I].DBL_VALORBASEICMS_ITEM)), 16));

      vSeq := vSeq + 1;
      Inc(I);
    end;
  end;

  procedure Escreve_FreteInternacional(NR_NOTA: String);
  var
    INota: Integer;
    I, I2: Integer;
    NumeroFatura, Linha: String;
    QtdItensNota: Double;
  begin
    INota := InicioNota(NR_NOTA);

    qryBrokerAux.SQL.Clear;
    qryBrokerAux.SQL.Add('SELECT COUNT(*) FROM TFAT_CALCULO_RATEIO_DESP_MONEY');
    qryBrokerAux.SQL.Add(' WHERE NR_PROCESSO = ''' + vNrProcesso + '''');
    qryBrokerAux.SQL.Add('   AND CD_ITEM IN (''001'',''029'',''421'',''475'',''524'',''549'',''646'')');
    qryBrokerAux.Open;

    // Pegar os pesos de frete para a média - Michel - 29/12/2008
    QtdItensNota := 0;
    I := INota;
    while (I <= High(Registros)) and (Registros[I].STR_NRNOTA = NR_NOTA) do
    begin
      //QtdItensNota := QtdItensNota + Registros[I].DBL_QTDEMEDIDAESTAT;
      QtdItensNota := QtdItensNota + Registros[I].DBL_QTDITENS_ITEM;
      Inc(I);
    end;

    I := INota;
    while (I <= High(Registros)) and (Registros[I].STR_NRNOTA = NR_NOTA) do
    begin
      vQtdeLinhas := vQtdeLinhas + 1;
      vValorDeduzido := 0;

      // Incluido para não ser emitido sem número de fatura - Michel - 10/12/2008 - Ocorrência 06871/08
      if Trim(Registros[I].STR_NUMEROFATURADDIMPORT) = '' then
        if vErros.IndexOf('> Não consta número da fatura na NF.') < 0 then
          vErros.Add('> Não consta número da fatura na NF.');

      // Pegar o valor total rateado do frete para o item 20 - Michel - 30/03/2009
      I2 := I;
      if FreteIndaia then
      begin
        NumeroFatura := Nr_NF_Indaia;
        vDtNota      := Dt_NF_Indaia;
      end
      else
      begin
        NumeroFatura := Registros[I2].STR_NUMEROFATURADDIMPORT;
        //if vDtNota <> '' then
        vDtNota := Registros[I].STR_DATANOTA;
      end;
      vValorFreteItem := 0;
      while (I2 <= High(Registros)) and (Registros[I2].STR_NRNOTA = NR_NOTA) and
         ((NumeroFatura = Registros[I2].STR_NUMEROFATURADDIMPORT) or FreteIndaia) do
      begin
        vValorFreteItem := vValorFreteItem + Registros[I2].DBL_VALOR_FRETE;
        Inc(I2);
      end;

      if vMoedaFrete <> 'BRL' then
      begin
        // Pega a data da Invoice
        vDtNotaInv  := ConsultaLookUPSQL(' SELECT ISNULL(CONVERT(VARCHAR, DT_FATURA, 103), '''') AS DT_FATURA ' +
                                         ' FROM TDOCUMENTO_INSTRUCAO (NOLOCK)                                 ' +
                                         ' WHERE NR_PROCESSO        = ''' + vNrProcesso + '''                 ' +
                                         '   AND CD_TIPO_DCTO_INSTR = ''01''                                  ' +
                                         '   AND NR_DCTO_INSTRUCAO  = ''' + Registros[I].STR_NUMEROFATURADDIMPORT + '''', 'DT_FATURA');
        vDtNotaInv  := StringReplace(vDtNotaInv, '/', '', [rfReplaceAll]);

        if vDtNotaInv = '' then
          if vErros.IndexOf('> Data da Invoice não preenchida.') < 0 then
            vErros.Add('> Data da Invoice não preenchida.');
      end;

      // Sempre 20
      Linha := '20'                                                                                    +
         FStrSpace(vRegistroDI + FStrSpace(NR_NOTA, 6) + '-' + FStrSpace(qryBrokerItensSTR_NR_TRANSM.AsString,12) , 34)  +
         FStrSpace(NumeroFatura, 10)                                                                   +
         //FStrZero(vCodFornecedor, 10) +
        IfThen(qryBrokerAux.Fields[0].AsInteger > 0, FStrZero('131407', 10), FStrSpace(IfThen(vMoedaFrete = 'BRL', '0000131407', vCodigoSAP), 10)) +
        IfThen(vMoedaFrete = 'BRL', FStrSpace(vDtNota, 8), FStrSpace(vDtNotaInv, 8))                  +
         FStrSpace(FormatFloat('0.00', vValorFreteItem), 16)                                           +
         // Utilizando as duas linhas de baixo ao inves das duas linhas de cima - Michel - 23/12/2008
         FStrSpace(vMoedaFrete, 5)                                                                     +
         FStrSpace(FormatFloat('0.00000', vTaxaFrete), 15);

      vArquivo.Add(Linha);

      while (I <= High(Registros)) and (Registros[I].STR_NRNOTA = NR_NOTA) and
         ((NumeroFatura = Registros[I].STR_NUMEROFATURADDIMPORT) or FreteIndaia) do
      begin
        vQtdeLinhas := vQtdeLinhas + 1;

        // Loop incluido para tirar CRODA ou qualquer outro texto do inicio do nome do item - Michel - 10/12/2008 - Ocorrência 06871/08
        vItemPO := Registros[I].STR_NUMEROPO;
        while (vItemPO <> '') and not(vItemPO[1] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) do
          Delete(vItemPO, 1, 1);

        //Sempre 21
        Linha := '21' +
                 FStrSpace(vRegistroDI + FStrSpace(NR_NOTA, 6) + '-' + FStrSpace(qryBrokerItensSTR_NR_TRANSM.AsString,12) , 34)  +
                 FStrSpace(vItemPO, 10) +
                 FStrSpace(IntToStr(Registros[I].LI_ITEMPO), 6) +
                 FStrSpace(NumeroFatura, 10) +
                 FStrSpace(FormatFloat('0.00', Registros[I].DBL_QTDITENS_ITEM), 17);

        vValorFreteSubItem := Registros[I].DBL_VALOR_FRETE;
        vValorFreteSubItem := StrToFloat(FormatFloat('#0.00', vValorFreteSubItem));

        Linha := Linha + FStrSpace(FormatFloat('0.00', vValorFreteSubItem), 28) +
                 FStrSpace(' ',16) +
                 FStrSpace(' ',16) +
                 FStrSpace(' ',16) +
                 FStrSpace(' ',16) +
                 FStrSpace(' ',16) +
                 FStrSpace(' ',16);
        vArquivo.Add(Linha);
        Inc(I);
      end;
    end;
  end;

  procedure Escreve_Fornecedor(NR_NOTA: String);
  var
    I, I2: Integer;
    NumeroFatura: String;
    ValorFornecedor: Double;
    QtdItensNota, QtdItensfatura: Double;
    ValorFatura: Double;
    Linha: String;
  begin
    I := InicioNota(NR_NOTA);

    // Pegar os pesos de frete para a média - Michel - 29/12/2008
    QtdItensNota := 0;
    I2 := I;
    while (I2 <= High(Registros)) and (Registros[I2].STR_NRNOTA = NR_NOTA) do
    begin
      QtdItensNota := QtdItensNota + Registros[I2].DBL_QTDITENS_ITEM;
      Inc(I2);
    end;

    while (I <= High(Registros)) and (Registros[I].STR_NRNOTA = NR_NOTA) do
    begin
      NumeroFatura := Registros[I].STR_NUMEROFATURADDIMPORT;
      ValorFatura    := 0;
      QtdItensfatura := 0;
      I2 := I;
      while (I2 <= High(Registros)) and (Registros[I2].STR_NRNOTA = NR_NOTA) and
         (NumeroFatura = Registros[I2].STR_NUMEROFATURADDIMPORT) do
      begin
        QtdItensfatura := QtdItensfatura + Registros[I2].DBL_QTDITENS_ITEM;
        ValorFatura    := ValorFatura + Registros[I2].DBL_VALORORIGEMMOEDA;

        if vIN_EMBUT_FRT_ITENS then
          if ValorFatura > Registros[I2].DBL_VALOR_FRETE then
            ValorFatura := ValorFatura - Registros[I2].DBL_VALOR_FRETE
          else
            ValorFatura := ValorFatura - Registros[I2].DBL_VALOR_FRETE + Registros[I2].DBL_VALOR_ACRESCIMO;

        if vIN_EMBUT_SEG_ITENS then
          ValorFatura := ValorFatura - Registros[I2].DBL_VALORSEGUROMOEDA;
        Inc(I2);
      end;

      //SEMPRE 30
      vQtdeLinhas := vQtdeLinhas + 1;
      Linha := '30' +
         FStrSpace(vRegistroDI + FStrSpace(NR_NOTA, 6) + '-' + FStrSpace(qryBrokerItensSTR_NR_TRANSM.AsString,12) , 34)  ;

      // Incluido para não ser emitido sem número de fatura - Michel - 10/12/2008 - Ocorrência 06871/08
      if Trim(Registros[I].STR_NUMEROFATURADDIMPORT) = '' then
      begin
        if vErros.IndexOf('> Não consta número da fatura na NF.') < 0 then
          vErros.Add('> Não consta número da fatura na NF.');
      end;

      Linha := Linha + FStrSpace(Registros[I].STR_NUMEROFATURADDIMPORT, 10) +
                       FStrSpace(vCodigoSAP, 10);
                     //  FStrZero(vCodFornecedor, 10);

      // Solicitada pela CRODA que seja exibida a data da invoice ao inves da data da fatura neste ítem - Michel - 09/03/2009
      // Pega a data da Invoice
      vDtNotaInv  := ConsultaLookUPSQL(' SELECT ISNULL(CONVERT(VARCHAR, DT_FATURA, 103), '''') AS DT_FATURA ' +
                                       ' FROM TDOCUMENTO_INSTRUCAO (NOLOCK)                                 ' +
                                       ' WHERE NR_PROCESSO        = ''' + vNrProcesso + '''                 ' +
                                       '   AND CD_TIPO_DCTO_INSTR = ''01''                                  ' +
                                       '   AND NR_DCTO_INSTRUCAO  = ''' + Registros[I].STR_NUMEROFATURADDIMPORT + '''', 'DT_FATURA');
      vDtNotaInv  := StringReplace(vDtNotaInv, '/', '', [rfReplaceAll]);
      if vDtNotaInv = '' then
        if vErros.IndexOf('> Data da Invoice não preenchida.') < 0 then
          vErros.Add('> Data da Invoice não preenchida.');

      Linha := Linha + FStrSpace(vDtNotaInv, 8) +
                       FStrSpace(FormatFloat('0.00', ValorFatura), 16) +
                       FStrSpace(vSiglaMoeda, 5) +
                       //FStrSpace(FormatFloat('0.00000', Registros[I].DBL_TAXAMERCADORIA), 15);
                       FStrSpace(FormatFloat('0.00000', vTaxaMLE), 15);

      vArquivo.Add(Linha);

      //Itens
      while (I <= High(Registros)) and (Registros[I].STR_NRNOTA = NR_NOTA) and
         (NumeroFatura = Registros[I].STR_NUMEROFATURADDIMPORT) do
      begin
        vQtdeLinhas := vQtdeLinhas + 1;
        // Sempre 31
        Linha := '31' +
           FStrSpace(vRegistroDI + FStrSpace(NR_NOTA, 6) + '-' + FStrSpace(qryBrokerItensSTR_NR_TRANSM.AsString,12) , 34)  ;

        // Loop incluido para tirar CRODA ou qualquer outro texto do inicio do nome do item - Michel - 10/12/2008 - Ocorrência 06871/08
        vItemPO := Registros[I].STR_NUMEROPO;
        while (vItemPO <> '') and not(vItemPO[1] in ['0','1','2','3','4','5','6','7','8','9']) do
          Delete(vItemPO, 1, 1);

        Linha := Linha + FStrSpace(vItemPO, 10) +
           FStrSpace(IntToStr(Registros[I].LI_ITEMPO), 6);

        // Incluido para não ser emitido sem número de fatura - Michel - 10/12/2008 - Ocorrência 06871/08
        if Trim(Registros[I].STR_NUMEROFATURADDIMPORT) = '' then
        begin
          if vErros.IndexOf('> Não consta número da fatura na NF.') < 0 then
            vErros.Add('> Não consta número da fatura na NF.');
        end;

        Linha := Linha + FStrSpace(Registros[I].STR_NUMEROFATURADDIMPORT, 10) +
                 FStrSpace(FormatFloat('0.00', Registros[I].DBL_QTDITENS_ITEM), 17);

        ValorFornecedor := Registros[I].DBL_VALORORIGEMMOEDA;
        if vIN_EMBUT_FRT_ITENS then
          if ValorFornecedor > Registros[I].DBL_VALOR_FRETE then
            ValorFornecedor := ValorFornecedor - Registros[I].DBL_VALOR_FRETE // + ((Registros[I2].DBL_VALORFRETEMOEDACOLLECT * vTaxaFrete) / vTaxaMLE);
          else
            ValorFornecedor := ValorFornecedor - Registros[I].DBL_VALOR_FRETE + Registros[I].DBL_VALOR_ACRESCIMO; // + ((Registros[I2].DBL_VALORFRETEMOEDACOLLECT * vTaxaFrete) / vTaxaMLE);

        if vIN_EMBUT_SEG_ITENS then
          ValorFornecedor := ValorFornecedor - Registros[I].DBL_VALORSEGUROMOEDA;//((Registros[I].DBL_VALORSEGUROMOEDA * vTaxaSeguro) / vTaxaMLE);

        Linha := Linha + FStrSpace(FormatFloat('0.00', ValorFornecedor), 28) +
                 FStrSpace(' ',16) +
                 FStrSpace(' ',16) +
                 FStrSpace(' ',16) +
                 FStrSpace(' ',16) +
                 FStrSpace(FormatFloat('0.00', Registros[I].DBL_TAXASISCOMEX), 16) +
                 FStrSpace(FormatFloat('0.00', Registros[I].DBL_ACRESCIMOSREAIS), 16);

        vArquivo.Add(Linha);
        Inc(I);
      end;
    end;
  end;

  procedure Escreve_Despachante(NR_NOTA: String);
  var
    I: Integer;
    ValorFatura, ValorItem: Double;
    Linha: String;
    Ref: Integer;
  begin
    I := InicioNota(NR_NOTA);

    while (I <= High(Registros)) and (Registros[I].STR_NRNOTA = NR_NOTA) do
    begin
      // Sempre 40
      Linha := '40' +
         FStrSpace(vRegistroDI + FStrSpace(NR_NOTA, 6) + '-' + FStrSpace(qryBrokerItensSTR_NR_TRANSM.AsString,12) , 34)  ;

      vQtdeLinhas := vQtdeLinhas + 1;

      // Incluido para não ser emitido sem número de fatura - Michel - 10/12/2008 - Ocorrência 06871/08
      if Trim(Registros[I].STR_NUMEROFATURADDIMPORT) = '' then
      begin
        if vErros.IndexOf('> Não consta número da fatura na NF.') < 0 then
          vErros.Add('> Não consta número da fatura na NF.');
      end;

      if TotalDespachante = 0 then
        if vErros.IndexOf('> Processo não faturado.') < 0 then
          vErros.Add('> Processo não faturado.');

      Linha := Linha + FStrSpace(vNumeroFatura, 10)       +
//               FStrZero('131407', 10)                     +
               FStrZero(vCodFornecedor, 10)             +
               FStrSpace(vDataFatura, 8)                  +
               FStrSpace('<_DespacFatura_>', 16)          +
               FStrSpace('BRL', 5)                        +
               FStrSpace(FormatFloat('0.00000', 1), 15);
      vArquivo.Add(Linha);

      //Itens
      ValorFatura := 0;
      while (I <= High(Registros)) and (Registros[I].STR_NRNOTA = NR_NOTA) do
      begin
        ValorItem   := 0;
        // Incluído o FOR abaixo para pegar o valor de todas as referências do item - Michel - 28/12/2011
        for Ref := 0 to High(Registros[I].STR_CD_REFERENCIA) do
        begin
          qryBrokerAux.Close;
          qryBrokerAux.SQL.Clear;
          qryBrokerAux.SQL.Add('SELECT ROUND(SUM(VL_ITEM), 2)');
          qryBrokerAux.SQL.Add('FROM (');

          qryBrokerAux.SQL.Add(' SELECT SUM(VL_ITEM_AREA) AS VL_ITEM                                        ');
          qryBrokerAux.SQL.Add(' FROM TFAT_CALCULO_RATEIO_DESP_MONEY                                        ');
          qryBrokerAux.SQL.Add(' WHERE NR_PROCESSO = ''' + vNrProcesso + '''                                ');
          qryBrokerAux.SQL.Add('   AND CD_REFERENCIA LIKE ''' + Registros[I].STR_CD_REFERENCIA[Ref] + '%''  '); //4500121587/0010/00500/1'
          if rgTipoNota.ItemIndex <> 2 then
            qryBrokerAux.SQL.Add('   AND NR_NOTA_FATURA = ''' + vNumeroFatura + '''                         '); // Tem que ser a mesma fatura Indaiá
          qryBrokerAux.SQL.Add('   AND CD_ITEM NOT IN (1, 25, 26, 29, 27, 75, 421, 578, 599, 600, 879)      ');

          if ConsultaLookUPSQL('SELECT COUNT(*) AS QTD ' +
                               'FROM TFAT_CALCULO_RATEIO_DESP_MONEY ' +
                               'WHERE NR_PROCESSO = :NR_PROCESSO ' +
                               '  AND CD_ITEM IN (32)', 'QTD', [vNrProcesso]) = '0' then
          begin
            qryBrokerAux.SQL.Add('  UNION ALL');
            qryBrokerAux.SQL.Add('  SELECT SUM(ROUND((DI.VL_TOTAL_TX_SCX / DI.PL_CARGA) * DM.PL_MERCADORIA, 2)) AS VL_ITEM');
            qryBrokerAux.SQL.Add('  FROM TDECLARACAO_IMPORTACAO       DI (NOLOCK)  ');
            qryBrokerAux.SQL.Add('     INNER JOIN TDETALHE_MERCADORIA DM (NOLOCK) ON DM.NR_PROCESSO = DI.NR_PROCESSO');
            qryBrokerAux.SQL.Add('  WHERE DI.NR_PROCESSO = ''' + vNrProcesso + '''');
            qryBrokerAux.SQL.Add('    AND RTRIM(DM.NR_PROC_PO) + ''/'' + RTRIM(DM.NR_ITEM_PO) + ''/'' + RTRIM(DM.CD_EMPRESA) + ''/'' + CONVERT(VARCHAR, DM.NR_PARCIAL) LIKE ''' + Registros[I].STR_CD_REFERENCIA[Ref] + '%''');
          end;

          qryBrokerAux.SQL.Add(') AS VW');
          qryBrokerAux.Open;
          vQtdeLinhas := vQtdeLinhas + 1;

          ValorItem   := ValorItem + ((qryBrokerAux.Fields[0].AsFloat / Registros[I].DBL_PESOLIQUIDO) * Registros[I].DBL_PESOLIQUIDO_ITEM);
        end;
        ValorFatura := ValorFatura + ValorItem;

        // Sempre 41
        Linha := '41' +
           FStrSpace(vRegistroDI + FStrSpace(NR_NOTA, 6) + '-' + FStrSpace(qryBrokerItensSTR_NR_TRANSM.AsString,12) , 34)  ;

        // Loop incluido para tirar CRODA ou qualquer outro texto do inicio do nome do item - Michel - 10/12/2008 - Ocorrência 06871/08
        vItemPO := Registros[I].STR_NUMEROPO;
        while (vItemPO <> '') and not(vItemPO[1] in ['0','1','2','3','4','5','6','7','8','9']) do
          Delete(vItemPO, 1, 1);

        Linha := Linha + FStrSpace(vItemPO, 10) +
           FStrSpace(IntToStr(Registros[I].LI_ITEMPO), 6);

        // Incluido para não ser emitido sem número de fatura - Michel - 10/12/2008 - Ocorrência 06871/08
        if ComDadosNF and (Trim(vNumeroFatura) = '') then
        begin
          if vErros.IndexOf('> Não consta número da fatura na NF.') < 0 then
            vErros.Add('> Não consta número da fatura na NF.');
        end;

        Linha := Linha + FStrSpace(vNumeroFatura, 10)                           +
                 FStrSpace(FormatFloat('0.00', Registros[I].DBL_QTDITENS_ITEM), 17) +
                 FStrSpace(FormatFloat('0.00', ValorItem), 28)  +
                 FStrSpace(FormatFloat('0.00', Registros[I].DBL_TAXASISCOMEX), 16) +
                 FStrSpace(' ', 16) +
                 FStrSpace(' ', 16) +
                 FStrSpace(' ', 16) +
                 FStrSpace(' ', 16) +
                 FStrSpace(' ', 16);
        vArquivo.Add(Linha);
        // Atualiza a variável colocada para o valor dos ítens listados acima
        Inc(I);
      end;
      vArquivo.Text := StringReplace(vArquivo.Text, '<_DespacFatura_>', FStrSpace(FormatFloat('0.00', ValorFatura), 16), [rfReplaceAll]);
    end;
  end;

  procedure Escreve_Seguro(NR_NOTA: String);
  var
    I, I2: Integer;
    NumeroFatura: String;
    ValorFatura: Double;         
    Linha: String;
  begin
    I := InicioNota(NR_NOTA);
    while (I <= High(Registros)) and (Registros[I].STR_NRNOTA = NR_NOTA) do
    begin
      NumeroFatura := Registros[I].STR_NUMEROFATURADDIMPORT;
      ValorFatura := 0;
      I2 := I;
      while (I2 <= High(Registros)) and (Registros[I2].STR_NRNOTA = NR_NOTA) and
         (NumeroFatura = Registros[I2].STR_NUMEROFATURADDIMPORT) do
      begin
        ValorFatura := ValorFatura + Registros[I2].DBL_VALORSEGUROMOEDA;
        Inc(I2);
      end;

      vQtdeLinhas := vQtdeLinhas + 1;
      //SEMPRE 50
      Linha := '50' +
         FStrSpace(vRegistroDI + FStrSpace(NR_NOTA, 6) + '-' + FStrSpace(qryBrokerItensSTR_NR_TRANSM.AsString,12) , 34)  ;

      // Incluido para não ser emitido sem número de fatura - Michel - 10/12/2008 - Ocorrência 06871/08
      if Trim(Registros[I].STR_NUMEROFATURADDIMPORT) = '' then
      begin
        if vErros.IndexOf('> Não consta número da fatura na NF.') < 0 then
          vErros.Add('> Não consta número da fatura na NF.');
      end;                                           

      Linha := Linha + FStrSpace(Registros[I].STR_NUMEROFATURADDIMPORT, 10) +
         FStrZero(edt_cd_sap.Text, 10)                                      +
         FStrSpace(vDataFatura, 8)                                          +
         FStrSpace(FormatFloat('0.00', ValorFatura), 16)                    +
         FStrSpace(vSiglaMoeda, 5)                                          +
         FStrSpace(FormatFloat('0.00000', vTaxaMLE), 15);
      vArquivo.Add(Linha);

      while (I <= High(Registros)) and (Registros[I].STR_NRNOTA = NR_NOTA) and
         (NumeroFatura = Registros[I].STR_NUMEROFATURADDIMPORT) do
      begin
        vQtdeLinhas := vQtdeLinhas + 1;
        // Sempre 51
        Linha := '51' +
           FStrSpace(vRegistroDI + FStrSpace(NR_NOTA, 6) + '-' + FStrSpace(qryBrokerItensSTR_NR_TRANSM.AsString,12) , 34)  ;

        // Loop incluido para tirar CRODA ou qualquer outro texto do inicio do nome do item - Michel - 10/12/2008 - Ocorrência 06871/08
        vItemPO := Registros[I].STR_NUMEROPO;
        while (vItemPO <> '') and not(vItemPO[1] in ['0','1','2','3','4','5','6','7','8','9']) do
          Delete(vItemPO, 1, 1);

        Linha := Linha + FStrSpace(vItemPO, 10) +
           FStrSpace(IntTostr(Registros[I].LI_ITEMPO), 6);

        // Incluido para não ser emitido sem número de fatura - Michel - 10/12/2008 - Ocorrência 06871/08
        if Trim(Registros[I].STR_NUMEROFATURADDIMPORT) = '' then
        begin
          if vErros.IndexOf('> Não consta número da fatura na NF.') < 0 then
            vErros.Add('> Não consta número da fatura na NF.');
        end;

        Linha := Linha + FStrSpace(Registros[I].STR_NUMEROFATURADDIMPORT, 10)   +
                 FStrSpace(FormatFloat('0.00', Registros[I].DBL_QTDITENS_ITEM), 17)  +
                 FStrSpace(FormatFloat('0.00', Registros[I].DBL_VALORSEGUROMOEDA), 28) +
                 FStrSpace(' ', 16) +
                 FStrSpace(' ', 16) +
                 FStrSpace(' ', 16) +
                 FStrSpace(' ', 16) +
                 FStrSpace(' ', 16) +
                 FStrSpace(' ', 16);
        vArquivo.Add(Linha);
        Inc(I);
      end;
    end;
  end;

  procedure Escreve_Impostos(NR_NOTA: String);
  var
    I, I2: Integer;
    NumeroFatura: String;
    ValorFatura: Double;
    Linha: String;
  begin
    I := InicioNota(NR_NOTA);
    while (I <= High(Registros)) and (Registros[I].STR_NRNOTA = NR_NOTA) do
    begin
      ValorFatura := 0;
      NumeroFatura := Registros[I].STR_NUMEROFATURADDIMPORT;
      I2 := I;

      while (I2 <= High(Registros)) and (Registros[I2].STR_NRNOTA = NR_NOTA) and
         (NumeroFatura = Registros[I2].STR_NUMEROFATURADDIMPORT) do
      begin
        ValorFatura := ValorFatura +
                       Registros[I2].DBL_VALORIIRECOLHER        +
                       Registros[I2].DBL_VALORICMS              +
                       Registros[I2].DBL_ICMS_COMPLEMENTAR              +
                       Registros[I2].DBL_VALORIPIRECOLHER       +
                       Registros[I2].DBL_VALORPISPASEPARECOLHER +
                       Registros[I2].DBL_VALORCOFINSARECOLHER;
        Inc(I2);
      end;

      vQtdeLinhas := vQtdeLinhas + 1;
      // Sempre 60
      Linha := '60' +
         FStrSpace(vRegistroDI + FStrSpace(NR_NOTA, 6) + '-' + FStrSpace(qryBrokerItensSTR_NR_TRANSM.AsString,12) , 34)  ;

      // Incluido para não ser emitido sem número de fatura - Michel - 10/12/2008 - Ocorrência 06871/08
      if Trim(Registros[I].STR_NUMEROFATURADDIMPORT) = '' then
      begin
        if vErros.IndexOf('> Não consta número da fatura na NF.') < 0 then
          vErros.Add('> Não consta número da fatura na NF.');
      end;

      Linha := Linha + FStrSpace(Registros[I].STR_NUMEROFATURADDIMPORT, 10) +
//         FStrZero('131407', 10)                                             +
         FStrZero(vCodFornecedor, 10)                                       +
         FStrSpace(vDataFatura, 8)                                          +
         FStrSpace(FormatFloat('0.00', ValorFatura),16)                     +
         FStrSpace('BRL', 5)                                                +
         FStrSpace(FormatFloat('0.00000', 1), 15);
      vArquivo.Add(Linha);

      while (I <= High(Registros)) and (Registros[I].STR_NRNOTA = NR_NOTA) and
         (NumeroFatura = Registros[I].STR_NUMEROFATURADDIMPORT) do
      begin
        vQtdeLinhas := vQtdeLinhas + 1;
        // Sempre 61
        Linha := '61' +
           FStrSpace(vRegistroDI + FStrSpace(NR_NOTA, 6) + '-' + FStrSpace(qryBrokerItensSTR_NR_TRANSM.AsString,12) , 34)  ;

        // Loop incluido para tirar CRODA ou qualquer outro texto do inicio do nome do item - Michel - 10/12/2008 - Ocorrência 06871/08
        vItemPO := Registros[I].STR_NUMEROPO;
        while (vItemPO <> '') and not(vItemPO[1] in ['0','1','2','3','4','5','6','7','8','9']) do
          Delete(vItemPO, 1, 1);
        Linha := Linha + FStrSpace(vItemPO, 10) +
           FStrSpace(IntToStr(Registros[I].LI_ITEMPO), 6);

        // Incluido para não ser emitido sem número de fatura - Michel - 10/12/2008 - Ocorrência 06871/08
        if Trim(Registros[I].STR_NUMEROFATURADDIMPORT) = '' then
        begin
          if vErros.IndexOf('> Não consta número da fatura na NF.') < 0 then
            vErros.Add('> Não consta número da fatura na NF.');
        end;

        Linha := Linha + FStrSpace(Registros[I].STR_NUMEROFATURADDIMPORT, 10)                +
                 FStrSpace(FormatFloat('0.00', Registros[I].DBL_QTDITENS_ITEM), 17)          +
                 FStrSpace(FormatFloat('0.00', Registros[I].DBL_VALORIIRECOLHER), 28)        +
                 FStrSpace(FormatFloat('0.00', Registros[I].DBL_VALORICMS + Registros[I].DBL_ICMS_COMPLEMENTAR ), 16)  +
                 FStrSpace(FormatFloat('0.00', Registros[I].DBL_VALORIPIRECOLHER), 16)       +
                 FStrSpace(FormatFloat('0.00', Registros[I].DBL_VALORPISPASEPARECOLHER), 16) +
                 FStrSpace(FormatFloat('0.00', Registros[I].DBL_VALORCOFINSARECOLHER), 16)   +
                 FStrSpace(' ', 16) +
                 FStrSpace(' ', 16);
        vArquivo.Add(Linha);
        Inc(I);
      end;
    end;
  end;

  procedure Escreve_Cabecalho_Comissao(NR_NOTA: String);
  var
    I, I2, Ref: Integer;
    NumeroFatura: String;
    ValorFatura, ValorItem: Double;
    Linha: String;

  begin
    I := InicioNota(NR_NOTA);
    while (I <= High(Registros)) and (Registros[I].STR_NRNOTA = NR_NOTA) do
    begin
      ValorFatura := 0;
      NumeroFatura := Registros[I].STR_NUMEROFATURADDIMPORT;
      I2 := I;

      while (I2 <= High(Registros)) and (Registros[I2].STR_NRNOTA = NR_NOTA) and
         (NumeroFatura = Registros[I2].STR_NUMEROFATURADDIMPORT) do
      begin
        ValorFatura := ValorFatura +
                       Registros[I2].DBL_VALORIIRECOLHER        +
                       Registros[I2].DBL_VALORICMS              +
                       Registros[I2].DBL_ICMS_COMPLEMENTAR              +
                       Registros[I2].DBL_VALORIPIRECOLHER       +
                       Registros[I2].DBL_VALORPISPASEPARECOLHER +
                       Registros[I2].DBL_VALORCOFINSARECOLHER;
        Inc(I2);
      end;

      vQtdeLinhas := vQtdeLinhas + 1;

      Linha := '70' +
               FStrSpace(vRegistroDI + FStrSpace(NR_NOTA, 6) + '-' + FStrSpace(qryBrokerItensSTR_NR_TRANSM.AsString,12) , 34)  ;

      Linha := Linha + FStrSpace(vNrNfIndaia,10)                            +
                       FStrZero(vCodFornecedor, 10)                         +
                       FStrSpace(vDataNfIndaia, 8)                          +
                       FStrSpace(FormatFloat('0.00', vValorNfIndaia),16)    +
                       FStrSpace('BRL', 5)                                  +
                       FStrSpace(FormatFloat('0.00000', 1), 15);
      vArquivo.Add(Linha);


      while (I <= High(Registros)) and (Registros[I].STR_NRNOTA = NR_NOTA) and
         (NumeroFatura = Registros[I].STR_NUMEROFATURADDIMPORT) do
      begin
        vQtdeLinhas := vQtdeLinhas + 1;
        // Sempre 71
        Linha := '71' + FStrSpace(vRegistroDI + FStrSpace(NR_NOTA, 6) + '-' + FStrSpace(qryBrokerItensSTR_NR_TRANSM.AsString,12) , 34) ;

        ValorItem := 0;
        for Ref := 0 to High(Registros[I].STR_CD_REFERENCIA) do
        begin
            qryBrokerAux.Close;
            qryBrokerAux.SQL.Clear;
            qryBrokerAux.SQL.Add('  DECLARE @VL_NF FLOAT SET @VL_NF = :VL_NF');
            qryBrokerAux.SQL.Add('  SELECT SUM(ROUND((@VL_NF / DI.PL_CARGA) * DM.PL_MERCADORIA, 2)) AS VL_ITEM');
            qryBrokerAux.SQL.Add('  FROM TDECLARACAO_IMPORTACAO       DI (NOLOCK)  ');
            qryBrokerAux.SQL.Add('     INNER JOIN TDETALHE_MERCADORIA DM (NOLOCK) ON DM.NR_PROCESSO = DI.NR_PROCESSO');
            qryBrokerAux.SQL.Add('  WHERE DI.NR_PROCESSO = ''' + vNrProcesso + '''');
            qryBrokerAux.SQL.Add('    AND RTRIM(DM.NR_PROC_PO) + ''/'' + RTRIM(DM.NR_ITEM_PO) + ''/'' + RTRIM(DM.CD_EMPRESA) + ''/'' + CONVERT(VARCHAR, DM.NR_PARCIAL) LIKE ''' + Registros[I].STR_CD_REFERENCIA[Ref] + '%''');
            qryBrokerAux.ParamByName('VL_NF').value := vValorNfIndaia;
            qryBrokerAux.Open;
            ValorItem   := ValorItem + ((qryBrokerAux.Fields[0].AsFloat / Registros[I].DBL_PESOLIQUIDO) * Registros[I].DBL_PESOLIQUIDO_ITEM);
        end;

        // Loop incluido para tirar CRODA ou qualquer outro texto do inicio do nome do item - Michel - 10/12/2008 - Ocorrência 06871/08
        vItemPO := Registros[I].STR_NUMEROPO;
        while (vItemPO <> '') and not(vItemPO[1] in ['0','1','2','3','4','5','6','7','8','9']) do
          Delete(vItemPO, 1, 1);

        Linha := Linha + FStrSpace(vItemPO, 10)
                       + FStrSpace(IntToStr(Registros[I].LI_ITEMPO), 6);

        Linha := Linha +  FStrSpace(vNrNfIndaia, 10)       +
                          FStrSpace(FormatFloat('0.00', Registros[I].DBL_QTDITENS_ITEM), 17)  +
                          FStrSpace(FormatFloat('0.00', ValorItem), 28)                       +
                          FStrSpace(FormatFloat('0.00', vValorNfIndaia), 16)                  +
                          FStrSpace(FormatFloat('0.00', vValorNfIndaia), 16)                  +
                          FStrSpace(FormatFloat('0.00', vValorNfIndaia), 16)                  +
                          FStrSpace(FormatFloat('0.00', vValorNfIndaia), 16)                  +
                          FStrSpace(FormatFloat('0.00', 0), 16)                               ;

        vArquivo.Add(Linha);
        Inc(I);
      end;
    end;
  end;
begin
  QtdProcessosComErro    := 0;
  QtdProcessosComSucesso := 0;
  AdicionarMensagem('');
  AdicionarMensagem('Verificando o Processo ''' + Processo + '''...');

  if not Consiste(Processo) then
    Exit;

  try
    { Inicializa Variáveis }

    lblStatus.Caption := 'Inicializando tabelas...';
    Self.Update;

    DecimalSeparator := '.';
    if ComDadosNF then
    begin
      //abre qry e conecta o DDnota
      IBNF.Open;
      IBTransaction.Active := True;
      qryDDAbreProcesso.Close;
      qryDDAbreProcesso.ParamByName('processo').AsString := vNrProcesso;
      qryDDAbreProcesso.Open;
    end;

    if (ComDadosNF and qryDDAbreProcesso.IsEmpty) then
      AdicionarMensagem('Não há notas no sistema DDNota para este processo!', True)
    else
    begin
      lblStatus.Caption := 'Selecionando ítens...';
      Self.Update;

      if ComDadosNF then
      begin
        qryDDAux.Close;
        qryDDAux.SQL.Clear;
        qryDDAux.SQL.Add(' SELECT LI_SEQUENCIANFENTRADA');
        qryDDAux.SQL.Add(' FROM NOTAFISCALENTRADA NFE');
        qryDDAux.SQL.Add(' WHERE NFE.LI_SEQUENCIAPROCESSO = ''' + qryDDAbreProcesso.FieldByName('LI_SEQUENCIAPROCESSO').AsString + '''');
        qryDDAux.SQL.Add(' GROUP BY LI_SEQUENCIANFENTRADA');
        qryDDAux.Open;
        qryDDAux.First;
        qryDDAux.Next;

        qryDDItens.Close;
        if not qryDDAux.Eof then
        begin
          qryDDAux.Close;
          qryDDAux.SQL.Clear;
          qryDDAux.SQL.Add(' SELECT LI_SEQUENCIANFENTRADA');
          qryDDAux.SQL.Add(' FROM NOTAFISCALENTRADA NFE');
          qryDDAux.SQL.Add(' WHERE NFE.LI_SEQUENCIAPROCESSO = ''' + qryDDAbreProcesso.FieldByName('LI_SEQUENCIAPROCESSO').AsString + '''');
          qryDDAux.SQL.Add(' ORDER BY LI_SEQUENCIANFENTRADA');
          qryDDAux.Open;
          qryDDAux.First;

          qryDDItens.ParamByName('LI_SEQUENCIANFENTRADA').AsString := qryDDAux.FieldByName('LI_SEQUENCIANFENTRADA').AsString;
        end
        else
          qryDDItens.ParamByName('LI_SEQUENCIANFENTRADA').AsString := '000000000';
        qryDDAux.Close;
        qryDDItens.Open;

        // Pega o número do registro da DI
        vRegistroDI := Copy(qryDDAbreProcessoSTR_REGISTRODI.AsString,1,2) + '/' +
                       Copy(qryDDAbreProcessoSTR_REGISTRODI.AsString,3,7) + '-' +
                      Copy(qryDDAbreProcessoSTR_REGISTRODI.AsString,10,1);


      end
      else
      begin
        qryBrokerItens.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
        qryBrokerItens.Open;

        //RegistroDI := Copy(qryBrokerItensSTR_REGISTRODI.AsString,1,2) + '/' +
        //              Copy(qryBrokerItensSTR_REGISTRODI.AsString,3,7) + '-' +
        //              Copy(qryBrokerItensSTR_REGISTRODI.AsString,10,1);

        vRegistroDI := qryBrokerItensSTR_REGISTRODI.AsString;
        // vRegistroDI := Copy(qryBrokerItensSTR_REGISTRODI.AsString,1,15);


      end;

      lblStatus.Caption := 'Inicializando valores do Processo...';
      Self.Update;

      FIsMoney  := true;
      FIsBroker := false;
      FaturamentoNovo := strtoint(ConsultaLookupSQL(' SELECT count(customID) FaturamentoNovo ' +
                                                    ' FROM MYINDAIAV2.DBO.CustomClearance (NOLOCK) ' +
                                                    ' WHERE customID = ''' + vNrProcesso + '''','FaturamentoNovo'));

      // Pega Numero da NF Indaiá
      qryBrokerAux.Close;
      qryBrokerAux.SQL.Clear;
      qryBrokerAux.SQL.text :=
      '  SELECT DISTINCT                                                                                ' + sLineBreak +
      '         CASE WHEN ISNULL(B.SENIORKEY,'''')= '''' THEN B.ID ELSE B.SENIORKEY END NR_NOTA         ' + sLineBreak +
      '        ,REPLACE(CONVERT(VARCHAR, B.CREATED, 103), ''/'', '''') AS DT_NOTA                       ' + sLineBreak +
      ' 	     ,CASE WHEN TP.CD_GRUPO = ''C66'' THEN ''70735''                                          ' + sLineBreak +
      '          WHEN B.BRANCH_ID = ''11''                                                              ' + sLineBreak +
      ' 	           THEN ''0000136272'' /*CAMPINAS*/                                                   ' + sLineBreak +
      ' 	           ELSE ''0000131407'' /*SANTOS*/                                                     ' + sLineBreak +
      ' 	      END AS COD_FORNECEDOR                                                                   ' + sLineBreak +
      '        ,B.NR_NOTA                                                                               ' + sLineBreak +
      '        ,REPLACE(CONVERT(VARCHAR(10),B.CREATED,103 ), ''/'', '''') AS DATA_NF                    ' + sLineBreak +
      '        ,B.TOTAL                                                                                 ' + sLineBreak +
      '  FROM MYINDAIAV2.DBO.BILLING                     B   (NOLOCK)                                   ' + sLineBreak +
      '  INNER JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED  BII (NOLOCK) ON BII.BILLING_ID=B.ID            ' + sLineBreak +
      '  INNER JOIN MYINDAIAV2.DBO.ITEMINVOICED          II  (NOLOCK) ON II.ID=BII.ITENSINVOICED_ID     ' + sLineBreak +
      '  INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE       CC  (NOLOCK) ON CC.ID=II.CUSTOMCLEARANCE_ID    ' + sLineBreak +
      '  INNER JOIN BROKER.DBO.TPROCESSO                 TP  (NOLOCK) ON TP.NR_PROCESSO = CC.CUSTOMID   ' + sLineBreak +
      '  WHERE B.STATUS =''INVOICED''                                                                   ' + sLineBreak +
      '  AND CUSTOMID   = :NR_PROCESSO                                                                  ' + sLineBreak +
      '  AND TYPE       =''TAX_INVOICE''                                                                ' + sLineBreak ;

      qryBrokerAux.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
      qryBrokerAux.Open;
      Nr_NF_Indaia   := Trim(qryBrokerAux.FieldByName('NR_NOTA').AsString);
      Dt_NF_Indaia   := Trim(qryBrokerAux.FieldByName('DT_NOTA').AsString);
      vCodFornecedor := qryBrokerAux.Fields[2].AsString;
      vNrNfIndaia    := qryBrokerAux.Fields[3].AsString;
      vDataNfIndaia  := qryBrokerAux.Fields[4].AsString;
      vValorNfIndaia := qryBrokerAux.Fields[5].asFloat;

      // Frete pago por?
      qryBrokerAux.Close;
      qryBrokerAux.SQL.Clear;
      qryBrokerAux.SQL.Add('SELECT SUM(ii.price) VL_FRETE ');
      qryBrokerAux.SQL.Add('FROM MYINDAIAV2.DBO.Billing                     B   (NOLOCK)  ');
      qryBrokerAux.SQL.Add('inner join MYINDAIAV2.DBO.Billing_ItemInvoiced  bii (NOLOCK) on bii.Billing_id=b.id  ');
      qryBrokerAux.SQL.Add('inner join MYINDAIAV2.DBO.ItemInvoiced          ii  (NOLOCK) on ii.id=bii.itensInvoiced_id  ');
      qryBrokerAux.SQL.Add('inner join MYINDAIAV2.DBO.CustomClearance       cc  (NOLOCK) on cc.id=ii.customClearance_id ');
      qryBrokerAux.SQL.Add('inner join MYINDAIAV2.DBO.Item                  i   (NOLOCK) on i.id=ii.item_id ');
      qryBrokerAux.SQL.Add('WHERE B.status=''INVOICED'' ');
      qryBrokerAux.SQL.Add('and customID= :NR_PROCESSO ');
      qryBrokerAux.SQL.Add('AND i.aKey IN (1, 29, 421, 475, 521, 524, 549, 646, 657, 813, 879)');
      qryBrokerAux.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
      qryBrokerAux.Open;
      FreteIndaia := qryBrokerAux.FieldByName('VL_FRETE').AsFloat > 0;

      // Inicializa valores do processo
      qryBrokerAux.Close;
      qryBrokerAux.SQL.Clear;
      qryBrokerAux.SQL.Add('SELECT IN_EMBUT_FRT_ITENS, IN_EMBUT_SEG_ITENS, TX_FRETE, TX_SEGURO, TX_MLE, TX_DOLAR   ');
      qryBrokerAux.SQL.Add('FROM TDECLARACAO_IMPORTACAO (NOLOCK)                                                   ');
      qryBrokerAux.SQL.Add('WHERE NR_PROCESSO = ''' + vNrProcesso + '''                                            ');
      qryBrokerAux.Open;
      vIN_EMBUT_FRT_ITENS := qryBrokerAux.Fields[0].AsBoolean;
      vIN_EMBUT_SEG_ITENS := qryBrokerAux.Fields[1].AsBoolean;
      //vTaxaFrete          := qryBrokerAux.Fields[2].AsFloat;
      vTaxaSeguro         := qryBrokerAux.Fields[3].AsFloat;
      vTaxaMLE            := qryBrokerAux.Fields[4].AsFloat;
      vTaxaDolar          := qryBrokerAux.Fields[5].AsFloat;

      lblStatus.Caption := 'Inicializando valores do Frete Internacional...';
      Self.Update;
      // Inicializando Frete Internacional
      qryBrokerFrete.Close;
      qryBrokerFrete.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
      qryBrokerFrete.Open;
      qryBrokerFrete.First;
      vMoedaFrete := Trim(qryBrokerFreteMOEDA_FRETE.AsString);
      vTaxaFrete  := qryBrokerFreteTX_FRETE.AsFloat;
      vValorFrete := 0;

      while not qryBrokerFrete.Eof do
      begin
        vValorFrete := vValorFrete + qryBrokerFreteVL_FRETE.AsFloat;
        qryBrokerFrete.Next;
      end;

      lblStatus.Caption := 'Buscando Sigla da Moeda...';
      Self.Update;
      // Buscando sigla da moeda
      if ComDadosNF then
      begin
        qryDDAux.SQL.Clear;
        qryDDAux.SQL.Add(' SELECT STR_SIGLA                                                          ');
        qryDDAux.SQL.Add(' FROM MOEDA (NOLOCK)                                                       ');
        qryDDAux.SQL.Add(' WHERE STR_CODIGOMOEDA = ''' + qryDDItensSTR_CODIGOMOEDANEG.AsString + ''' ');
        qryDDAux.Open;
        vSiglaMoeda := qryDDAux.Fields[0].AsString;
        qryDDAux.Close;
      end
      else
      begin
        qryBrokerAux.SQL.Clear;
        qryBrokerAux.SQL.Add('SELECT CD_SIGLA                                                        ');
        qryBrokerAux.SQL.Add('FROM TMOEDAS_ISO (NOLOCK)                                              ');
        qryBrokerAux.SQL.Add('WHERE CD_MOEDA = ''' + qryBrokerItensSTR_CODIGOMOEDANEG.AsString + ''' ');
        qryBrokerAux.Open;
        vSiglaMoeda := qryBrokerAux.Fields[0].AsString;
        qryBrokerAux.Close;
      end;

      lblStatus.Caption := 'Buscando Código do Cliente...';
      Self.Update;
      // Busca Cliente e Codigo SAP do Exportador
      qryBrokerAux.SQL.Clear;
      qryBrokerAux.SQL.Add(' SELECT PR.CD_CLIENTE, EE.NR_CLIENTE                  ');
      qryBrokerAux.SQL.Add(' FROM TPROCESSO PR (NOLOCK), TEMPRESA_EST EE (NOLOCK) ');
      qryBrokerAux.SQL.Add(' WHERE PR.NR_PROCESSO = ''' + vNrProcesso + '''       ');
      qryBrokerAux.SQL.Add('   AND EE.CD_EMPRESA = PR.CD_EXPORTADOR               ');
      qryBrokerAux.Open;
      CdCliente  := Trim(qryBrokerAux.Fields[0].AsString);
      vCodigoSAP := Trim(qryBrokerAux.Fields[1].AsString);
      qryBrokerAux.Close;

      vErros := TStringList.Create;

      if vCodigoSAP = '' then
        vErros.Add('> Código do fornecedor está vazio.'#13'Favor, cadastrar antes de continuar.');

      if Copy(vCodigoSAP, 1, 4) <> 'CROD' then // preenche com zeros
        vCodigoSAP := FStrZero(vCodigoSAP, 10);

      lblStatus.Caption := 'Inicializando valores do Despachante...';
      Self.Update;
      // Inicializa dados para preenchimento do Despachante
      qryBrokerAux.Close;
      qryBrokerAux.SQL.Clear;
      qryBrokerAux.SQL.text :=
                ' SELECT DISTINCT                                                                              ' + sLineBreak +
                ' 	     CONVERT(DATETIME, CONVERT(VARCHAR, B.CREATED, 103), 103) AS DT_EMISSAO,               ' + sLineBreak +
                ' 	     CASE WHEN ISNULL(B.SENIORKEY,'''')= ''''                                              ' + sLineBreak +
                ' 	        THEN B.ID                                                                          ' + sLineBreak +
                ' 	        ELSE B.SENIORKEY                                                                   ' + sLineBreak +
                ' 	     END NR_NOTA,                                                                          ' + sLineBreak +
                ' 	     B.ID                                                                                  ' + sLineBreak +
                ' FROM MYINDAIAV2.DBO.BILLING                     B   (NOLOCK)                                 ' + sLineBreak +
                ' INNER JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED  BII (NOLOCK) ON BII.BILLING_ID=B.ID          ' + sLineBreak +
                ' INNER JOIN MYINDAIAV2.DBO.ITEMINVOICED          II  (NOLOCK) ON II.ID=BII.ITENSINVOICED_ID   ' + sLineBreak +
                ' INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE       CC  (NOLOCK) ON CC.ID=II.CUSTOMCLEARANCE_ID  ' + sLineBreak +
                ' WHERE B.STATUS =''INVOICED''                                                                 ' + sLineBreak +
                '   AND CUSTOMID =' + QuotedStr(vNrProcesso)                                                     + sLineBreak +
                '   AND TYPE     =''TAX_RECEIPT''                                                              ' + sLineBreak ;

      qryBrokerAux.Open;
      if qryBrokerAux.Fields[0].AsDateTime = 0 then
        vDataFatura := ''
      else
      vDataFatura    := FormatDateTime('ddmmyyyy', qryBrokerAux.Fields[0].AsDateTime);
      vNumeroFatura  := qryBrokerAux.Fields[1].AsString;
      vSolicitacao   := qryBrokerAux.Fields[2].AsString;

      qryBrokerAux.Close;
      qryBrokerAux.SQL.Clear;
      qryBrokerAux.SQL.Add('SELECT DISTINCT YEAR(b.created) ANO_EMISSAO,B.id NR_EMISSAO,B.seniorKey NR_NOTA, 0 CD_ROTINA_EMISSAO,b.id   ');
      qryBrokerAux.SQL.Add('FROM MYINDAIAV2.DBO.Billing                     B   (NOLOCK)                                                ');
      qryBrokerAux.SQL.Add('inner join MYINDAIAV2.DBO.Billing_ItemInvoiced  bii (NOLOCK) on bii.Billing_id=b.id                         ');
      qryBrokerAux.SQL.Add('inner join MYINDAIAV2.DBO.ItemInvoiced          ii  (NOLOCK) on ii.id=bii.itensInvoiced_id                  ');
      qryBrokerAux.SQL.Add('inner join MYINDAIAV2.DBO.CustomClearance       cc  (NOLOCK) on cc.id=ii.customClearance_id                 ');
      qryBrokerAux.SQL.Add('WHERE B.status=''INVOICED'' and                                                                             ');
      qryBrokerAux.SQL.Add('customID= :NR_PROCESSO                                                                                      ');

      case rgTipoNota.ItemIndex of
        // Nota Fiscal de Serviço
        0: begin
             qryBrokerAux.SQL.Add('  and type=''TAX_INVOICE'' -- Faturamento-NF Serviços');
           end;
        // Nota de Débito
        1: begin
             qryBrokerAux.SQL.Add('  and type=''TAX_RECEIPT'' -- Faturamento-Despesas');
           end;
        // Todas as Notas
        2: begin
             qryBrokerAux.SQL.Add('  and type in (''TAX_RECEIPT'',''TAX_INVOICE'') ');
           end;
      end;

      qryBrokerAux.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
      qryBrokerAux.Open;
      qryBrokerAux.First;

      vNumeroFatura := '';

      FastExecSQL('DELETE TFAT_CALCULO_RATEIO_DESP_MONEY WHERE NR_PROCESSO = ' + QuotedStr(vNrProcesso));

      while not qryBrokerAux.Eof do
      begin
        vNrEmissao    := qryBrokerAux.FieldByName('NR_EMISSAO').AsInteger;
        vAnoEmissao   := qryBrokerAux.FieldByName('ANO_EMISSAO').AsInteger;

        if (qryBrokerAux.FieldByName('CD_ROTINA_EMISSAO').AsInteger = 603) or (vNumeroFatura = '') then
          if (FaturamentoNovo > 0) and (Trim(qryBrokerAux.FieldByName('NR_NOTA').AsString) = '') then
           vNumeroFatura := Trim(qryBrokerAux.FieldByName('id').AsString)
          else
            vNumeroFatura := Trim(qryBrokerAux.FieldByName('NR_NOTA').AsString);

        FastExecSQL(' DECLARE @I INT; ' +
                    ' EXEC SP_FAT_CONSISTE_RATEIO_MONEY ' + IntToStr(vNrEmissao) + ', ' + IntToStr(vAnoEmissao) + ', ' + IntToStr(FaturamentoNovo) + ', @I OUTPUT;');

        qryBrokerAux.Next;
      end;

      TotalDespachante := qryBrokerAux.FieldS[0].AsFloat;
      qryBrokerAux.Close;

      lblStatus.Caption := 'Efetuando rateio nos ítens das notas...';
      Self.Update;
      if ComDadosNF then
        RateiaNotas(qryDDItens)
      else
        RateiaNotas(qryBrokerItens);

      // Loop nas Notas Fiscais - Michel - 25/03/2009
      ForceDirectories('C:\CRODA\' + vNrProcesso);
      ApagaArquivos('C:\CRODA\' + vNrProcesso);

      if ComDadosNF then
        ListaNotas(qryDDItens)
      else
        ListaNotas(qryBrokerItens);

      if High(vNotas) < 0 then
        vErros.Add('> Sem notas no DDNota')
      else
      begin
        pbProgressoArquivo.MaxValue := 7 * (High(vNotas) + 1);
        for N := 0 to High(vNotas) do
        begin
          vQtdeLinhas := 0;
          // cria um arquivo texto para inserir o resultado.
            vNomeArquivo := 'C:\CRODA\' + vNrProcesso + '\croda_' + vNrProcesso;
          //if ComDadosNF then
            vNomeArquivo := vNomeArquivo + '_' + vNotas[N] + '.txt';
          //else
          //  vNomeArquivo := vNomeArquivo + '.txt';
          vArquivo := TStringList.Create;

          // Só escreve as linhas 10 e 11 se for para conter os dados da NF
          if ComDadosNF then
          begin
            // Linha 10
            lblStatus.Caption := 'Gravando detalhes para a nota ' + vNotas[N];
            Escreve_NF(vNotas[N]);
          end;

          pbProgressoArquivo.Progress := pbProgressoArquivo.Progress +1;
          Self.Update;

          // Linha 20
          lblStatus.Caption := 'Gravando Frete Internacional para a nota ' + vNotas[N];
          Escreve_FreteInternacional(vNotas[N]);
          pbProgressoArquivo.Progress := pbProgressoArquivo.Progress +1;
          Self.Update;

          // Linha 30
          lblStatus.Caption := 'Gravando Pagamento do Fornecedor da Mercadoria para a nota ' + vNotas[N];
          Escreve_Fornecedor(vNotas[N]);
          pbProgressoArquivo.Progress := pbProgressoArquivo.Progress +1;
          Self.Update;

          // Linha 40
          lblStatus.Caption := 'Gravando Pagamento de Despesas do Despachante para a nota ' + vNotas[N];
          Escreve_Despachante(vNotas[N]);
          pbProgressoArquivo.Progress := pbProgressoArquivo.Progress +1;
          Self.Update;

          // Linha 50
          lblStatus.Caption := 'Gravando Seguro para a nota ' + vNotas[N];
          Escreve_Seguro(vNotas[N]);
          pbProgressoArquivo.Progress := pbProgressoArquivo.Progress +1;
          Self.Update;

          // Linha 60
          lblStatus.Caption := 'Gravando Impostos para a nota ' + vNotas[N];
          Escreve_Impostos(vNotas[N]);
          pbProgressoArquivo.Progress := pbProgressoArquivo.Progress +1;
          Self.Update;

          // Linha 70
          lblStatus.Caption := 'Gravando Impostos para a nota ' + vNotas[N];
          Escreve_Cabecalho_Comissao(vNotas[N]);
          pbProgressoArquivo.Progress := pbProgressoArquivo.Progress +1;
          Self.Update;

          vArquivo.Add('trailler' + FStrZero(IntToStr(vQtdeLinhas), 3));
          vArquivo.SaveToFile(vNomeArquivo);
          vArquivo.Free;

          // Adiciona o arquivo a lista de arquivos gerados se ele não estiver na lista
          if lbArquivos.Items.IndexOf(vNomeArquivo) < 0 then
            lbArquivos.Items.Add(vNomeArquivo);

          lbArquivos.Selected[lbArquivos.Count -1] := True;
        end;
      end;

      // Verifica se foram encontrados erros nos arquivos
      if vErros.Count > 0 then
      begin
        for N := 0 to High(vNotas) do
          lbArquivos.Items.Delete(lbArquivos.Items.Count -1);

        AdicionarMensagem('Foram encontrados os seguintes erros no processo:' + #13 + vErros.Text, True);
        AdicionarMensagem('*** Favor Checar: AREA - FATURA COMERCIAL e NUMERO DO PEDIDO ***',True); //by Carlos - 21/10/2011

        Inc(QtdProcessosComErro);
      end
      else
        Inc(QtdProcessosComSucesso);
    end;
  finally
    if qryDDAbreProcesso.Active then
      qryDDAbreProcesso.Close;

    IBTransaction.Active := False;

    if IBNF.Connected then
      IBNF.Close;
      
    if qryBrokerItens.Active then
      qryBrokerItens.Close;

    DecimalSeparator := ',';
    pbProgressoArquivo.Progress := 0;
    pbProgressoArquivo.Update;
    AdicionarMensagem(IntToStr(High(vNotas) +1) + ' arquivo(s) criado(s)');
    SetLength(vNotas, 0);
  end;
end;

procedure TfrmArquivoCroda.btnGeraSemNFClick(Sender: TObject);
var
  I: Integer;
begin
  LimparMensagens;
  memProcessos.SetFocus;
  btnEnviar.Enabled := False;
  btnAbrir.Enabled  := False;
  pbProgressoGeral.MaxValue := memProcessos.Lines.Count;
  pbProgressoGeral.Progress := 0;

  for I := 0 to memProcessos.Lines.Count - 1 do
  begin
    if Trim(memProcessos.Lines[I]) = '' then
      AdicionarMensagem('Linha vazia ' + IntToStr(I))
    else
      GerarArquivo(Trim(memProcessos.Lines[I]), False);
    pbProgressoGeral.Progress := I + 1;
  end;

  lbArquivosClick(lbArquivos);
  AdicionarMensagem('');
  AdicionarMensagem('-----------------------------------------------------------');
  AdicionarMensagem('');
  AdicionarMensagem(IntToStr(QtdProcessosComSucesso) + ' processos gerados com sucesso');
  AdicionarMensagem(IntToStr(QtdProcessosComErro) + ' processos gerados com erro', True);
  AdicionarMensagem(IntToStr(lbArquivos.Count) + ' arquivos gerados no total');
  pbProgressoGeral.Progress := 0;  
end;

procedure TfrmArquivoCroda.qryBrokerItensCalcFields(DataSet: TDataSet);
begin
  qryBrokerItensCALC_STR_NRNOTA.AsString                 := qryBrokerItensNR_DANFE.AsString; //by carlos - 01/09/2011
  qryBrokerItensCALC_DBL_PESOBRUTO.AsFloat               := qryBrokerItensDBL_PESOBRUTO.AsFloat;
  qryBrokerItensCALC_DBL_PESOLIQUIDO.AsFloat             := qryBrokerItensDBL_PESOLIQUIDO.AsFloat;
  qryBrokerItensCALC_STR_SERIENOTA.AsString              := ' ';
  //qryBrokerItensCALC_STR_DATANOTA.AsString               := '          ';
  qryBrokerItensCALC_STR_DATANOTA.AsString               :=
     ConsultaLookUPSQL(' SELECT REPLACE(ISNULL(CONVERT(VARCHAR, DT_FATURA, 103), ''''), ''/'', '''')  AS DT_FATURA ' +
                       ' FROM TDOCUMENTO_INSTRUCAO (NOLOCK)                                                        ' +
                       ' WHERE NR_PROCESSO        = ''' + vNrProcesso + '''                                        ' +
                       '   AND CD_TIPO_DCTO_INSTR = ''01''                                                         ' +
                       '   AND NR_DCTO_INSTRUCAO  = ''' + DataSet.FieldByName('STR_NUMEROFATURADDIMPORT').AsString + '''', 'DT_FATURA');
  qryBrokerItensCALC_STR_CFOP.AsString                   := qryBrokerItensLI_CFOP.AsString;

  qryBrokerItensCALC_STR_SIGLAUNIDADEMOEDA_ITEM.AsString := qryBrokerItensSTR_CODIGOMOEDANEG.AsString;
  qryBrokerItensCALC_DBL_CIFREAISTOTAL_ITEM.AsFloat      := qryBrokerItensDBL_CIF.AsFloat;
  qryBrokerItensCALC_DBL_QTDITENS_ITEM.AsFloat           := qryBrokerItensDBL_PESOLIQUIDO.AsFloat;
  qryBrokerItensCALC_DBL_CIFREAISUNIT_ITEM.AsFloat       := qryBrokerItensDBL_CIF.AsFloat;
  qryBrokerItensCALC_DBL_ALIQUOTAICMS_ITEM.AsFloat       := qryBrokerItensDBL_ALIQUOTA_ICMS.AsFloat;
  qryBrokerItensCALC_DBL_ALIQUOTAIPI_ITEM.AsFloat        := qryBrokerItensDBL_ALIQUOTA_IPI.AsFloat;
  qryBrokerItensCALC_DBL_VALORIPI_ITEM.AsFloat           := qryBrokerItensDBL_VALOR_IPI.AsFloat;
  qryBrokerItensCALC_DBL_VALORBASEICMS_ITEM.AsFloat      := qryBrokerItensDBL_VALORBASEICMS.AsFloat;
  qryBrokerItensCALC_DBL_VALORICMS_ITEM.AsFloat          := qryBrokerItensDBL_VALORICMS.AsFloat;
  qryBrokerItensCALC_DBL_VALORII_ITEM.AsFloat            := qryBrokerItensDBL_VALOR_II.AsFloat;
  qryBrokerItensCALC_STR_NRPEDIDO_ITEM.AsString          := qryBrokerItensSTR_NRPEDIDO.AsString;
  qryBrokerItensCALC_DBL_PESOBRUTO_ITEM.AsFloat          := qryBrokerItensDBL_PESOBRUTO.AsFloat;
  qryBrokerItensCALC_DBL_PESOLIQUIDO_ITEM.AsFloat        := qryBrokerItensDBL_PESOLIQUIDO.AsFloat;

  qryBrokerItensCALC_STR_CD_REFERENCIA.AsString          := qryBrokerItensSTR_NUMEROPO.AsString + '/' +
     RightStr('0000' + qryBrokerItensLI_ITEMPO.AsString, 4) + '/' + CdCliente + '/' + qryBrokerItensNR_PARCIAL.AsString;

  qryBrokerItensCALC_IN_ATIVO.AsBoolean := True;
end;

procedure TfrmArquivoCroda.AdicionarMensagem(AMsg: String; MsgErro: Boolean);
begin
  reMensagens.SelStart := Length(reMensagens.Text);
  if MsgErro then
    reMensagens.SelAttributes.Color := clRed
  else
    reMensagens.SelAttributes.Color := clBlack;
  reMensagens.Lines.Add(AMsg);
  reMensagens.SelStart := Length(reMensagens.Text);       
  if btnMensagens.Caption = 'p' then
    btnMensagens.Click;
  reMensagens.Update;
  Application.ProcessMessages;
end;

procedure TfrmArquivoCroda.LimparMensagens;
begin
  reMensagens.Clear;
  if btnMensagens.Caption = 'q' then
    btnMensagens.Click;
  reMensagens.Update;
  Application.ProcessMessages;
end;

procedure TfrmArquivoCroda.btnMensagensClick(Sender: TObject);
begin
  if btnMensagens.Caption = 'q' then
  begin
    btnMensagens.Caption := 'p';
    pnlMensagens.Tag     := pnlMensagens.Height;
    pnlMensagens.Height  := pnlMensagensCaption.Height + 2;
  end
  else
  begin
    btnMensagens.Caption := 'q';
    pnlMensagens.Height  := pnlMensagens.Tag;
  end;
end;

end.

