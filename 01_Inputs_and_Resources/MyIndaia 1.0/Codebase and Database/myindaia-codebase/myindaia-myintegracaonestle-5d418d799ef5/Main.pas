unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, IdFTPList,
  xmldom, XMLIntf, msxmldom, XMLDoc, IOUtils, System.Types, DateUtils, Data.DB,
  StrUtils, FireDAC.Stan.Param, IdIOHandler , System.Masks,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IWSystem ;

  {$REGION 'EXPO'}
  {$region 'TRAP'}
type
  TRap = record

    CD_RAP                  : String;
    CD_RAP_ANO              : String;
    CD_EXPORTADOR           : String;
    CD_FABRICANTE           : String;
    CD_CLIENTE              : String;
    CD_PAIS                 : String;
    DS_PAIS_DESTINO         : String;
    CD_TERMO_PAGTO          : String;
    CD_INCOTERM             : String;
    CD_MOEDA_MLE            : String;
    CD_VIA_TRANSPORTE       : String;
    CD_LOCAL_ORIGEM         : String;
    CD_LOCAL_DESTINO        : String;
    CD_CONSIGNATARIO        : String;
    CD_NOTIFY               : String;
    NR_FORNECIMENTO         : String;
    NR_PEDIDO               : String;
    DT_PREV_SAIDA           : String;
    VL_MLE                  : String;
    VL_SEGURO               : String;
    VL_FRETE_INT            : String;
    VL_PESO_BRUTO           : String;
    VL_PESO_LIQ             : String;
    VL_CUBAGEM              : String;
    TX_EMBALAGEM            : String;
    TX_MARCACAO             : String;
    TX_INST_EMB             : String;
    CD_GRUPO                : String;
    DT_PREV_EMBARQUE        : String;
    DT_FECHAMENTO           : String;
    DT_FINALIZADO_PEDIDO    : String;
    TX_OBS                  : String;
    SIMPORTADOR             : String;
    SIMPORTADOR_DESC        : String;
    SIMPORTADOR_END         : String;
    SIMPORTADOR_COMP_END    : String;
    SIMPORTADOR_PAIS        : String;
    SCONSIGNATARIO          : String;
    SCONSIGNATARIO_DESC     : String;
    SCONSIGNATARIO_END      : String;
    SCONSIGNATARIO_COMP_END : String;
    SCONSIGNATARIO_PAIS     : String;
    SNOTIFY                 : String;
    SNOTIFY_DESC            : String;
    SNOTIFY_END             : String;
    SNOTIFY_COMP_END        : String;
    SNOTIFY_PAIS            : String;
    SEMISSAO                : String;
    SEXPORTADOR             : String;
    SEXPORTADOR_DESC        : String;
    SEXPORTADOR_END         : String;
    SEXPORTADOR_COMP        : String;
    SEXPORTADOR_PAIS        : String;
    SIMPORTADOR_CNPJ        : String;
    SEMBARQUE_PAIS          : String;
    SEMBARQUE_COLETA        : String;
    STIPO_FRETE             : String;
    sCD_BANCO               : String;
  end;
  {$Endregion}

  {$Region 'TFORNECIMENTO'}
  type
  TFornecimento = record
    CD_RAP                 : String;
    CD_RAP_ANO             : String;
    CD_FORNECIMENTO        : String;
    CD_ITEM                : String;
    CD_MERCADORIA          : String;
    VL_QTDE                : String;
    VL_PESO_LIQ_UN         : String;
    TX_UNID_MEDIDA         : String;
    SG_UNID_MEDIDA         : String;
    VL_PRECO_UNIT          : String;
    VL_PRECO_TOT           : String;
    CD_INCOTERM            : String;
    CD_REFERENCIA          : String;
    DT_PEDIDO              : String;
    NR_PO                  : String;
    CD_PAIS_DESTINO        : String;
    CD_NCM                 : String;
    TX_MARCACAO            : String;
    CD_GRUPO               : String;
    VL_PESO_BRUTO_UN       : String;
    CD_TIPO_CONTAINER      : String;
    CHAVE_NOTA             : String;
    TX_DESC                : String;
    TX_DESC_ING            : String;
    TX_DESC_ESP            : String;
    sFABRICANTE            : String;
    sFABRICANTE_DESC       : String;
    sFABRICANTE_END        : String;
    sFABRICANTE_COMP       : String;
    sFABRICANTE_PAIS       : String;
    sFabricante_CNPJ       : String;
    TX_EMBALAGEM           : String;
    VL_CUBAGEM             : String;
  end;
  {$endregion}

  {$region 'TLOTE'}
  type
  TLote = record
   CD_FORNECIMENTO  : String;
   CHAVE_NOTA       : String;
   CD_DELIVERY      : String;
   CD_LOTE          : String;
   CD_SKU           : String;
   DT_FABRICACAO    : String;
   DT_VENCIMENTO    : String;
   QT_MERCADORIA    : String;
   QT_PESO_LIQ      : String;
   QT_PESO_BRUTO    : String;
  end;
  {$Endregion}

  type TChave_Rap = Record
    CD_RAP                  : String;
    CD_RAP_ANO              : String;
  End;

  type TResultadoIntegracaoTRAP = Record
       ChaveTRap : TChave_Rap;
       Integrou  : Boolean;
  End;

  type TResultadoIntegracaoTRAPLOTE = Record
       Mensagem  : String;
       Integrou  : Boolean;
  End;

  type  Lista_TRap_Fornecimento      = array of TFornecimento;
  type  Lista_TRap_Fornecimento_Lote = array of TLote;
  {$endregion}

  {$region 'IMPO'}

  type TPedido_Impo =  record
      NR_ORDEM                : String;
      DT_EMISSAO              : String;
      DT_DELIVERY             : String;
      NR_PEDIDO               : String;
      CD_EXPORTADOR           : String; //codigo no broker
      EXPORTADOR_CODIGO       : String; //codigo do cliente
      EXPORTADOR_DESC         : String;
      EXPORTADOR_END          : String;
      EXPORTADOR_COMP         : String;
      EXPORTADOR_PAIS         : String;
      EXPORTADOR_CNPJ         : String;
      CD_IMPORTADOR           : String;
      IMPORTADOR_CODIGO       : String;
      IMPORTADOR_DESC         : String;
      IMPORTADOR_END          : String;
      IMPORTADOR_COMP         : String;
      IMPORTADOR_PAIS         : String;
      IMPORTADOR_CNPJ         : String;
      CD_CONSIGNATARIO        : String;
      CONSIGNATARIO_CODIGO    : String;
      CONSIGNATARIO_DESC      : String;
      CONSIGNATARIO_END       : String;
      CONSIGNATARIO_COMP      : String;
      CONSIGNATARIO_PAIS      : String;
      CD_NOTIFY               : String;
      NOTIFY_CODIGO           : String;
      NOTIFY_DESC             : String;
      NOTIFY_END              : String;
      NOTIFY_COMP             : String;
      NOTIFY_PAIS             : String;
      PRECO_TOTAL             : String;
      TIPO_TRANSPORTE         : String;
      PESO_LIQUIDO            : String;
      PESO_BRUTO              : String;
      CUBAGEM                 : String;
      CD_VIA_TRANSPORTE       : String;
      VIA_TRANSPORTE          : String;
      CD_EMBARQUE_CIDADE      : String;
      EMBARQUE_CIDADE         : String;
      CD_EMBARQUE_PAIS        : String;
      EMBARQUE_PAIS           : String;
      EMBARQUE_COLETA         : String;
      DESTINO_CIDADE          : String;
      CD_PAIS_DESTINO         : String;
      CD_CIDADE_DESTINO       : String;
      DESTINO_PAIS            : String;
      DT_EMBARQUE_PREVISAO    : String;
      DT_PRONTIDAO_CARGA      : String;
      CONDICAO_PAGAMENTO      : String;
      CONDICAO_PAGAMENTO_DESC : String;
      CD_TIPO_FRETE           : String;
      TIPO_FRETE              : String;
      VALOR_FRETE             : String;
      VALOR_SEGURO            : String;
      INCOTERM                : String;
      CD_MOEDA                : String;
      MOEDA                   : String;
      DADOS_BANCARIOS         : String;
      MARCACAO                : String;
      CD_AREA                 : String;
  end;

  type TPedido_Item_Impo = record
    NR_ITEM_PO           : String;
    CD_EXPORTADOR        : String;
    ORDEM                : String;
    CD_MOEDA             : String;
    SKU                  : String;
    PRODUTO_PORTUGUES    : String;
    PRODUTO_INGLES       : String;
    PRODUTO_ESPANHOL     : String;
    PESO_BRUTO_UNI       : String;
    PESO_LIQUIDO_UNI     : String;
    CUBAGEM_UNI          : String;
    QUANTIDADE           : String;
    PRECO_UNI            : String;
    PRECO_SKU            : String;
    NCM                  : String;
    CD_FABRICANTE        : String; //codigo do broker
    FABRICANTE_COD       : String; //codigo do cliente
    FABRICANTE_DESC      : String;
    FABRICANTE_END       : String;
    FABRICANTE_COMP      : String;
    FABRICANTE_PAIS      : String;
    FABRICANTE_CNPJ      : String;
    CD_FABRICANTE_PAIS   : String;
    UNIDADE_MEDIDA       : String;
    UNIDADE_MEDIDA_DESC  : String;
    INCOTERM             : String;
    PESO_LIQ             : String;
    CD_IMPORTADOR        : String;
    DS_CONDICAO_PGMTO    : String;
    CD_UNIDADE_MEDIDA    : String;
    NR_PLANTA            : String;
  end;

  type  Lista_TPedido_Item_Impo  = array of TPedido_Item_Impo;

  type TResultadoIntegracaoInstrucaoDesemb = Record
       ChaveInst_Dembaraco : String;
       Integrou  : Boolean;
  End;

  {$endregion}

  type TResultadoProcessamento = Record
       Texto :string;
       Tipo : String;
       Titulo :String;
  End;


type
  TfrmMain = class(TForm)
    StatusBar: TStatusBar;
    Memo: TMemo;
    Panel1: TPanel;
    btnSettings: TButton;
    btnFechar: TButton;
    cbxValidar: TCheckBox;
    btnIntegracao: TButton;
    tmrIntegracao: TTimer;
    IdFTP1: TIdFTP;
    chbIntegracao: TCheckBox;
    btnRetornoExpo: TButton;
    chbRetornoExpo: TCheckBox;
    btnRetornoImpo: TButton;
    chbRetornoImpo: TCheckBox;
    chbMoverArquivosErroImpo: TCheckBox;
    chbMoverArquivosErroExpo: TCheckBox;

    procedure btnSettingsClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure tmrIntegracaoTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnIntegracaoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MemoChange(Sender: TObject);
    procedure btnRetornoImpoClick(Sender: TObject);
    procedure btnRetornoExpoClick(Sender: TObject);
  private
    { Private declarations }
    FTempoRestante: TLargeInteger;
    FInicioIntegracao : String;
    FFimIntegracao    : String;

    Pasta_Integracao_Download: String;
    Pasta_Integracao_Processado: String;

    Pasta_Retorno_Expo : String;
    Pasta_Retorno_Impo : String;
    Pasta_Retorno_Enviados_Expo : String;
    Pasta_Retorno_Enviados_Impo : String;

    PastaErro_IMPO : String;
    PastaErro_EXPO : String;

    Email_Atendente : String;
    Email_Nestle_Analistas : String;

    lResultadoProcessamento : Array of TResultadoProcessamento;

    procedure EnviarEmail(Assunto, Mensagem, Email : String);
    function  FormatarData(data : String) : String;
    procedure CarregaConfig;
    procedure CriaPastasIntegracao;
    function TrimLeadingZeros(const S: string): string;
//    procedure ConfigurarConexaoPreferencia;
    function  BuscaEmailAtendente(CNPJ , Produto: String) :String;

    function CarregaCodEmpresa(ordem, pais, campo, CNPJ : String; enviaEmail : boolean = false) : String;
    function CarregarCodViaTransporte(Descricao : String) : String;
    function CarregarCodLocalEmbarque(Descricao : String) : String;
    function CarregaCodigoPais(Nm_Pais, Ordem, Campo : String; enviaEmail : Boolean = true) : String;
    function CarregaCodigoMoeda(Nm_Moeda : String) : String;
    function CarregaCodigoUnidadeMedida(Descricao : String) : String;
    function CarregaCodigoArea(CodMercadoria : String) : String;

    function  InsereCarregaCodEmpresa(Codigo, Nome, Endereco, Comp_Endereco, Pais, CNPJ, NrOrdem, CampoOrigem : String) : String;

    procedure Processar;
    function  ListaArquivos(Diretorio : String) : TStringList;
    procedure DownloadArquivo;
    function LerXML(AArquivo : String; var TipoArquivo : String) : Boolean;
    procedure EnviarEmailResultado(NrOrdem : String);
    function AddZeros(const S: string): string;


    //Integração Expo
    function GetSQLTRap(Tipo : String) : String;
    function GetSQLTRapFornecimento : String;
    function GetSqlTRap_Fornecimento_Lote : String;

    function IntegraTRAP(DadosRap: TRap) : TResultadoIntegracaoTRAP;
    function IntegraTRAP_FORNECIMENTO(Chave :TChave_Rap ;Lista: Lista_TRap_Fornecimento) : Boolean;
    function IntegraTRAP_FORNECIMENTO_LOTE(Lista: Lista_TRap_Fornecimento_Lote) : TResultadoIntegracaoTRAPLOTE;

    function InsereCarregaCodigoTermoPgmto(CodExportador, Termo : String) : String;
    function InsereCarregaCodMercadoriaEXPO(Codigo, Descricao_Por, Descricao_Esp,
                                            Descricao_Ing, NCM, UnidadeMedida, ordem: String) : Boolean;

    function BuscaChaveRap : String;
    function BuscaChaveRapFornecimento(Ordem, Produto : String) : TChave_Rap;
    function BuscaRapJaCadastrada(Ordem : String) : TChave_Rap;

    procedure DeleteRapFornecimento(Ordem : String; chave: TChave_Rap);
    procedure DeleteRapFornecimentoLote(Ordem : String);

    function BuscaEmailAtendenteFornecimento(Fornecimento : String) :String;
    function BuscaPaisDestinoLote(NR_FORNECIMENTO:string) : String;

    procedure LimpaLog(Path, TipoArquivo: String; tipoDataAnoNaFrente : boolean; qt_dias :Integer);

    //Integração Impo
    function GetSQLTPO(Tipo : String) : String;
    function GetSQLTPO_ITEM : String;
    function GetSQLTINSTRUCAO_DESEMBARACO(Tipo : String) : String;
    function GetSQLTINSTRUCAO_DESEMBARACO_PEDIDO: String;

    function IntegraTINSTRUCAO_DESEMBARACO(DadosPedido :TPedido_Impo) : TResultadoIntegracaoInstrucaoDesemb;
    function IntegraTINSTRUCAO_DESEMBARACO_PEDIDO(Lista : Lista_TPedido_Item_Impo; chaveInstrucaoDesemb : String) : Boolean;
    function IntegraTPO(DadosPedido :TPedido_Impo)  : Boolean;
    function IntegraTPO_ITEM(Lista : Lista_TPedido_Item_Impo; CodInstrucao : String) : Boolean;
    function InsereTProcesso(DadosPedido :TPedido_Impo) : Boolean;

    function InsereCarregaCodMercadoriaIMPO(Codigo, Descricao_Por, Descricao_Esp, Descricao_Ing, NCM, UnidadeMedida, Ordem: String) : Boolean;
    function BuscaNovaChaveTINSTRUCAO_DESEMBARACO : String;
    function BuscaTINSTRUCAO_DESEMBARACOCadastrada(CodCliente, PedidoCliente :string) : String;
    function BuscaTPOCadastrada(sOrdem, sImportador,sEmpresa, sExportador :string) : boolean;
    procedure DeletaTPO_ITEMCadastrada(sOrdem, sEmpresa : String );
    procedure DeletaItemTINSTRUCAO_DESEMBARACO_PEDIDO(Chave, Cod_Ordem :String);

    //Retorno
    function GetSqlRetornoExpo : String;
    function GetSqlRetornoExpoOrdem(NrProcesso : String) : String;

    function GetSqlRetornoImpoProcesso : String;
    function GetSqlRetornoImpoOrdens(Nr_Processo: String) : String;
    function GetSQLRetornoImpoAdicoes(Nr_Processo, sOrdem: String) : String;

    function GetSqlAtualizaRetornoProcesso(Nr_Processo, CodEvento : String) : String;
    function GetSqlAtualizaRetornoEventoExpo(Nr_Processo : String) : String;

    procedure ProcessarRetorno(Tipo :String);
    procedure GerarArquivoRetornoExpo;
    procedure GerarArquivoRetornoImpo;
    procedure EnviarXMLRetorno(Tipo : String);
    procedure AtualizarStatusEnvioRetorno(Arquivo :String);

    procedure ProcessaRecebimentoLotes(NrOrdem, Delivery : string);
    procedure AtualizaDataLoteProcesso(nr_Processo :string);
    procedure AtualizaDataLoteRap(cd_rap, cd_rap_ano, NrOrdem, GrupoNestle :string);
    function VerificaLotes(NrOrdem, nr_processo : string) : Boolean;
    function InsereProcessoImportacao(DadosPedido: TPedido_Impo; Lista : Lista_TPedido_Item_Impo): Boolean ;

    const
      GrupoNestle = '155';
      Email_Enviar = true;
      Email_NAO_Enviar = false;

    aMeses: Array[0..12] of String = (
            '', 'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
            'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro');

  public
    { Public declarations }
   procedure Logar;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses uPreferencias, Settings, Utils, DmBroker;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  tmrIntegracao.Enabled := false;

  Log('Iniciando.', Logar);

  CarregaConfig;

  CriaPastasIntegracao;
  tmrIntegracao.Enabled := true;
end;

procedure TfrmMain.CriaPastasIntegracao;
var
  sAno, sMes, sDia : String;
begin
  sAno := IntToStr(Yearof(Now));
  sMes := aMeses[MonthOf(Now)];
  sDia := IntToStr(DayOf(Now));

  //Pastas Integração
  Pasta_Integracao_Download   := ExtractFilePath(Application.ExeName) + 'Integracao\Download\';
  Pasta_Integracao_Processado := ExtractFilePath(Application.ExeName) + 'Integracao\Processado\'+sAno+'\'+sMes+'\'+sDia+'\';

  //Pastas Retorno
  Pasta_Retorno_Expo          := ExtractFilePath(Application.ExeName) + 'Retorno\Expo\';
  Pasta_Retorno_Impo          := ExtractFilePath(Application.ExeName) + 'Retorno\Impo\';
  Pasta_Retorno_Enviados_Expo := ExtractFilePath(Application.ExeName) + 'Retorno\Enviados\Expo\';
  Pasta_Retorno_Enviados_Impo := ExtractFilePath(Application.ExeName) + 'Retorno\Enviados\Impo\';

  //Arquivos com erro
  PastaErro_IMPO := ExtractFilePath(Application.ExeName) + 'Integracao\Download\Erro\IMPO\';
  PastaErro_EXPO := ExtractFilePath(Application.ExeName) + 'Integracao\Download\Erro\EXPO\';

  ForceDirectories(Pasta_Integracao_Download);
  ForceDirectories(Pasta_Integracao_Processado);
  ForceDirectories(Pasta_Retorno_Expo);
  ForceDirectories(Pasta_Retorno_Impo);
  ForceDirectories(Pasta_Retorno_Enviados_Expo);
  ForceDirectories(Pasta_Retorno_Enviados_Impo);
  ForceDirectories(PastaErro_IMPO);
  ForceDirectories(PastaErro_EXPO);
end;

procedure TfrmMain.CarregaConfig;
Begin
  FTempoRestante           := LocalSettings.Intervalo *  60000;
  chbIntegracao.checked    := LocalSettings.Integracao;
  chbMoverArquivosErroImpo.checked  := LocalSettings.MoverArquivosErroImpo;
  chbMoverArquivosErroExpo.checked  := LocalSettings.MoverArquivosErroExpo;
  chbRetornoExpo.checked   := LocalSettings.RetornoExpo;
  chbRetornoImpo.checked   := LocalSettings.RetornoImpo;
  FInicioIntegracao        := LocalSettings.InicioIntegracao;
  FFimIntegracao           := LocalSettings.FimIntegracao;
  if (FInicioIntegracao = '  :  ') or (FInicioIntegracao = '') then
    FInicioIntegracao := '08:00';

  if (FFimIntegracao = '  :  ') or (FFimIntegracao = '') then
    FFimIntegracao := '18:00';
End;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  Log('Finalizado.', Logar);
end;

procedure TfrmMain.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.btnIntegracaoClick(Sender: TObject);
begin
//  DownloadArquivo;
  Processar;
end;

procedure TfrmMain.btnRetornoExpoClick(Sender: TObject);
begin
  ProcessarRetorno('EXPO');
end;

procedure TfrmMain.btnRetornoImpoClick(Sender: TObject);
begin
  ProcessarRetorno('IMPO');
end;

procedure TfrmMain.btnSettingsClick(Sender: TObject);
var
  Form: TfrmPreferencia;
begin
  tmrIntegracao.Enabled := false;
  Form := TfrmPreferencia.Create(nil);
  try
    Form.ShowModal;
    CarregaConfig;
  finally
    Form.Free;
    tmrIntegracao.Enabled := true;
  end;
end;

procedure TfrmMain.DownloadArquivo;
var
  I: Integer;
  ListaArquivos : TStrings;
  ArquivoDestino : String;
  lista: TIdFTPListItems;
  PodeDeletar :Boolean;
begin
  Log('Inicia Acesso ao FTP.', Logar);
  Application.ProcessMessages;
  try
    if LocalSettings.FTPEndereco <> '' then
    begin
      try
        with IdFTP1 do
        begin
          try
            Disconnect;
          except on e:exception do
            Log('Erro ao desconectar. ' + e.message, Logar);
          end;


          if LocalSettings.FTPPorta <> '' then
            Port      := StrToInt(LocalSettings.FTPPorta);

          Host        := LocalSettings.FTPEndereco;
          ReadTimeout := 0;
          Username    := LocalSettings.FTPUsuario;
          Password    := LocalSettings.FTPSenha;
          Passive     := true;

          try
           Disconnect;
           Disconnect;
           Connect;
          except on e:exception do
          begin
            Log('Erro ao conectar no FTP. ' + e.message, Logar);
            Disconnect;
            Disconnect;
            EnviarEmail('Robo Nestle - Erro FTP', 'Erro FTP - ' + E.Message, 'ti@myindaia.com.br');
          end;
          end;

          if Connected = True then
          begin
            if LocalSettings.FTPPastaDownload <> '' then
            begin
              try
                ChangeDir(LocalSettings.FTPPastaDownload);
              except on e:exception do
              begin
                Log('Erro ao mudar de diretorio. ' + e.message, Logar);
                Disconnect;
              end;
              end;
            end;
            RetrieveCurrentDir;
            ListaArquivos := TStringList.Create;
            try
              List(ListaArquivos, '*.XML', false);
            except on e:exception do
            begin
              Log('Erro ao listar os arquivos. ' +e.message, Logar);
              Disconnect;
            end;
            end;

            //baixa
            PodeDeletar := true;
            For I := 0 to ListaArquivos.Count-1 do
            begin
              ArquivoDestino := ChangeFilePath(ListaArquivos.Strings[I], Pasta_Integracao_Download);
              if FileExists(ArquivoDestino) then
                DeleteFile(ArquivoDestino);

              try
                Get(ListaArquivos.Strings[I], ArquivoDestino);
              except on e:exception do
              begin
                PodeDeletar := false;
                Log('Erro ao baixar o arquivo.' + e.message, Logar);
                Disconnect;
              end;
              end;
            end;

            //deleta do ftp
            if PodeDeletar then
            For I := 0 to ListaArquivos.Count-1 do
            begin
              try
                delete(ListaArquivos.Strings[I]);
              except on e:exception do
                Log('Erro ao deletar o arquivo do ftp.' + e.message, Logar);
              end;
            end;

          end;
        end;
      finally
      begin
        try
          IdFTP1.Disconnect;
        except on e:exception do
          Log('Erro ao desconectar. ' + e.message, Logar);
        end;

        Application.ProcessMessages;
      end;
      end;
    end
    else
    begin
      Log('Configuração FTP inválida.', Logar);
    end;
  except on e:exception do
  begin
    Log('Erro FTP. ' + e.message, Logar);
    IdFTP1.Disconnect;
  end;
  end;
end;

function TfrmMain.ListaArquivos(Diretorio : String) : TStringList;
var
  aFiles: TStringDynArray;
  ListaArquivos: TStringList;
  i: integer;
begin
  ListaArquivos := TStringList.Create;

  aFiles := TDirectory.GetFiles(Diretorio, '*.xml');

  for I := 0 to Length(aFiles)-1 do
  begin
    ListaArquivos.Add(aFiles[i]);
  end;

  result := ListaArquivos;
end;

procedure TfrmMain.Processar;
var
  Arquivos: TStringList;
  i: integer;
   TipoArquivo :String;

  procedure MoveArquivo(PastaDestino, Arquivo : String);
  var ArquivoDestino :String;
  begin
    ArquivoDestino := PastaDestino + formatDateTime('ddmmyyyyhhmm', now) + '_'+ Arquivo;
    MoveFile(PChar(Arquivos[i]), PChar(ArquivoDestino));
    Application.ProcessMessages;
  end;
begin
  try
    LimpaLog(gsAppPath,'log', true,5);
    LimpaLog(Pasta_Retorno_Enviados_Expo, 'xml', false,60);
    LimpaLog(Pasta_Retorno_Enviados_Impo, 'xml', false,60);
    Log('Inicio Integração',  Logar);
    Application.ProcessMessages;

    try
      dmdBroker.dbBroker.Connected := false;
      dmdBroker.dbBroker.Connected := true;
    except on e:exception do
       Log('Erro ao conectar com o banco de dados.',  Logar);
    end;

    if dmdBroker.dbBroker.Connected then
    begin
      Arquivos := ListaArquivos(Pasta_Integracao_Download);

      for i:= Arquivos.Count-1 downto 0 do
      begin
        if LerXML(Arquivos[i], TipoArquivo) then
        begin
          Log('Arquivo Integrado: ' + Arquivos[i], Logar);
          MoveArquivo(Pasta_Integracao_Processado, ExtractFileName(Arquivos[i]));
        end
        else
        begin
          if TipoArquivo = 'IMPO' then
          begin
            Log('Arquivo com erro: ' + Arquivos[i], Logar);
            if chbMoverArquivosErroImpo.Checked then
              MoveArquivo(PastaErro_IMPO, ExtractFileName(Arquivos[i]));
          end
          else
          begin
            Log('Arquivo com erro: ' + Arquivos[i], Logar);
            if chbMoverArquivosErroExpo.Checked then
              MoveArquivo(PastaErro_EXPO, ExtractFileName(Arquivos[i]));
          end;
        end;
      end;
    end;
  finally
    Log('Fim Integração',  Logar);
  end;
end;


function TfrmMain.LerXML(AArquivo : String; var TipoArquivo : String) : Boolean;
var
  XMLDoc : IXMLDocument;
  j, qtItens : Integer;
  EnvioNode, ItemNode , ComplementoNode: IXmlNode;

  DadosRap : TRap;
  ListaFornecimento : Lista_TRap_Fornecimento;
  ListaFornecimentoLote : Lista_TRap_Fornecimento_Lote;
  ResultadoIntegracaoTRAP : TResultadoIntegracaoTRAP;

  PedidoImpo : TPedido_Impo;
  ListaPedidoImpo : Lista_TPedido_Item_Impo;
  ResultadoIntegracaoTINSTRUCAO_DESEMBARACO : TResultadoIntegracaoInstrucaoDesemb;

  Fornecimento, ChaveNota, NrOrdem, TxEmbalagem,
  NrPedido, DestinoPais, CdIncoterm, TxMarcacao,
  CodExportador, CodMoeda, PesoLiq, CodImportador,
  Ds_Condicao_Pagmto, paisDestinoNome, CodMercadoria : String;
  ResultaLote : TResultadoIntegracaoTRAPLOTE;
  IntegrouLote : Boolean;
  Delivery: string;
begin
  Log('Lendo Arquivo: ' + ExtractFileName(AArquivo), Logar);

  Result := true;
  IntegrouLote := false;
  //limpa a variavel -- será utilizada para guardar as informações do processamento para enviar para o usuario.
  SetLength(lResultadoProcessamento, 0);

  XMLDoc := TXMLDocument.Create(nil);
  try
    try
      XMLDoc.Active := False;
      XMLDoc.LoadFromFile(AArquivo);
      XMLDoc.Active := True;

      if UpperCase(XMLDoc.DocumentElement.NodeName) = UpperCase('Envio') then //Primeiro arquivo -> Envio
      begin
        {Se for apenas validação, começo a transação aqui.
         Porque o codigo faz insert em outras tabelas.
         Mas, se for processamento normal, é melhor começar a transação apenas para as tabelas de RAP
         Porque pode acabar demorando e vai ficar muito tempo com transação aberta.
         E, não tem problema se inserir as mercadorias, importadores, etc.}
//        if cbxValidar.Checked then
//          dmdBroker.dbBroker.StartTransaction;

        EnvioNode := XMLDoc.DocumentElement;

        {$region 'Leitura e Integração - Arquivo Envio Exportação'}
        if (UpperCase(EnvioNode.ChildNodes['Ordem_Tipo'].text) = UpperCase('E')) then //Exportação
        begin
          if LocalSettings.IntegracaoExpo then
          begin
            TipoArquivo := 'EXPO';
            // Email_Atendente := BuscaEmailAtendente(EnvioNode.ChildNodes['Exportador_CNPJ'].text, '02'); //carrega o e-mail na variavel Email_Atendente

             Email_Atendente := 'integraordemnestle@myindaia.com.br';
             Email_Nestle_Analistas :='Karina.Santos1@br.nestle.com;rafael.araujo@myindaia.com.br;Matheus.Menezes3@br.nestle.com;Lucas.Nunes@nespresso.com;Victor.Silva5@br.nestle.com';


            //*esses valores também serão utilizados para o preenchimento da tabela de fornecimento*//
            NrOrdem                            :=  trim(EnvioNode.ChildNodes['Ordem'].text);
            NrPedido                           :=  trim(EnvioNode.ChildNodes['Pedido'].text);
            paisDestinoNome                    :=  trim(EnvioNode.ChildNodes['Destino_Pais'].text);
            DestinoPais                        :=  CarregaCodigoPais(trim(EnvioNode.ChildNodes['Destino_Pais'].text),NrOrdem, 'Pais de Destino');
            if destinoPais = 'NÃO ENCONTRADO' then
              raise Exception.Create('Pais não encontrado ou em branco.' + slinebreak +
                                     'Pais Destino : ' + trim(EnvioNode.ChildNodes['Destino_Pais'].text));

            CdIncoterm                         :=  trim(EnvioNode.ChildNodes['Incoterm'].text);
            TxMarcacao                         :=  trim(EnvioNode.ChildNodes['Marcacao'].text);

            DadosRap.NR_FORNECIMENTO            :=  NrOrdem;
            DadosRap.SEMISSAO                   :=  trim(EnvioNode.ChildNodes['Emissao'].text);  //*formatar data*//
            DadosRap.DT_FINALIZADO_PEDIDO       :=  trim(EnvioNode.ChildNodes['Delivery'].text); //*formatar data*//
            DadosRap.NR_PEDIDO                  :=  NrPedido;
            DadosRap.SEXPORTADOR                :=  trim(EnvioNode.ChildNodes['Exportador'].text);
            DadosRap.SEXPORTADOR_DESC           :=  trim(EnvioNode.ChildNodes['Exportador_Desc'].text);
            DadosRap.SEXPORTADOR_END            :=  trim(EnvioNode.ChildNodes['Exportador_End'].text);
            DadosRap.SEXPORTADOR_COMP           :=  trim(EnvioNode.ChildNodes['Exportador_Comp'].text);
            DadosRap.SEXPORTADOR_PAIS           :=  trim(EnvioNode.ChildNodes['Exportador_Pais'].text);
            DadosRap.CD_EXPORTADOR              :=  trim(EnvioNode.ChildNodes['Exportador_CNPJ'].text);

            DadosRap.SIMPORTADOR                :=  trim(EnvioNode.ChildNodes['Importador'].text);
            DadosRap.SIMPORTADOR_DESC           :=  trim(EnvioNode.ChildNodes['Importador_Desc'].text);
            DadosRap.SIMPORTADOR_END            :=  trim(EnvioNode.ChildNodes['Importador_End'].text);
            DadosRap.SIMPORTADOR_COMP_END       :=  trim(EnvioNode.ChildNodes['Importador_Comp'].text);
            DadosRap.SIMPORTADOR_PAIS           :=  trim(EnvioNode.ChildNodes['Importador_Pais'].text);
            DadosRap.SIMPORTADOR_CNPJ           :=  trim(EnvioNode.ChildNodes['Importador_CNPJ'].text);

            DadosRap.SCONSIGNATARIO             :=  trim(EnvioNode.ChildNodes['Consignee'].text);
            DadosRap.SCONSIGNATARIO_DESC        :=  trim(EnvioNode.ChildNodes['Consignee_Desc'].text);
            DadosRap.SCONSIGNATARIO_END         :=  trim(EnvioNode.ChildNodes['Consignee_End'].text);
            DadosRap.SCONSIGNATARIO_COMP_END    :=  trim(EnvioNode.ChildNodes['Consignee_Comp'].text);
            DadosRap.SCONSIGNATARIO_PAIS        :=  trim(EnvioNode.ChildNodes['Consignee_Pais'].text);

            DadosRap.SNOTIFY                    :=  trim(EnvioNode.ChildNodes['Notify'].text);
            DadosRap.SNOTIFY_DESC               :=  trim(EnvioNode.ChildNodes['Notify_Desc'].text);
            DadosRap.SNOTIFY_END                :=  trim(EnvioNode.ChildNodes['Notify_End'].text);
            DadosRap.SNOTIFY_COMP_END           :=  trim(EnvioNode.ChildNodes['Notify_Comp'].text);
            DadosRap.SNOTIFY_PAIS               :=  trim(EnvioNode.ChildNodes['Notify_Pais'].text);

            DadosRap.VL_MLE                     :=  trim(EnvioNode.ChildNodes['Preco_Total'].text);
            DadosRap.TX_OBS                     :=  trim(EnvioNode.ChildNodes['Tipo'].text);
            DadosRap.VL_PESO_LIQ                :=  trim(EnvioNode.ChildNodes['Peso_Liquido'].text);
            DadosRap.VL_PESO_BRUTO              :=  trim(EnvioNode.ChildNodes['Peso_Bruto'].text);
            DadosRap.VL_CUBAGEM                 :=  trim(EnvioNode.ChildNodes['Cubagem'].text);
            DadosRap.CD_VIA_TRANSPORTE          :=  trim(EnvioNode.ChildNodes['Via_Transporte'].text);
            DadosRap.CD_LOCAL_ORIGEM            :=  trim(EnvioNode.ChildNodes['Embarque_Cidade'].text);
            DadosRap.SEMBARQUE_PAIS             :=  trim(EnvioNode.ChildNodes['Embarque_Pais'].text);
            DadosRap.SEMBARQUE_COLETA           :=  trim(EnvioNode.ChildNodes['Embarque_Coleta'].text);
            DadosRap.CD_LOCAL_DESTINO           :=  trim(EnvioNode.ChildNodes['Destino_Cidade'].text);
            DadosRap.DS_PAIS_DESTINO            :=  trim(EnvioNode.ChildNodes['Destino_Pais'].text);
            DadosRap.CD_PAIS                    :=  DestinoPais;
            DadosRap.DT_PREV_EMBARQUE           :=  trim(EnvioNode.ChildNodes['Embarque_Previsao'].text);
            DadosRap.DT_FECHAMENTO              :=  trim(EnvioNode.ChildNodes['Prontidao_Carga'].text);  //formatar data
            DadosRap.CD_TERMO_PAGTO             :=  trim(EnvioNode.ChildNodes['Condicao_Pagamento_Desc'].text);
            DadosRap.STIPO_FRETE                :=  trim(EnvioNode.ChildNodes['Tipo_Frete'].text);
            DadosRap.VL_FRETE_INT               :=  trim(EnvioNode.ChildNodes['Valor_Frete'].text);
            DadosRap.VL_SEGURO                  :=  trim(EnvioNode.ChildNodes['Valor_Seguro'].text);
            DadosRap.CD_INCOTERM                :=  CdIncoterm;
            DadosRap.CD_MOEDA_MLE               :=  trim(EnvioNode.ChildNodes['Moeda'].text);
            DadosRap.TX_INST_EMB                :=  trim(EnvioNode.ChildNodes['Dados_Bancarios'].text);
            DadosRap.TX_MARCACAO                :=  TxMarcacao;
            DadosRap.CD_GRUPO                   :=  GrupoNestle;

            {$region 'Tag Produto'}
            qtItens := EnvioNode.ChildNodes['Produto'].ChildNodes.Count;
            SetLength(ListaFornecimento, qtItens);
            for j := 0 to qtItens -1 do
            begin
              ItemNode := EnvioNode.ChildNodes['Produto'].ChildNodes[j];

              TxEmbalagem                               := trim(ItemNode.ChildNodes['Unidade_Medida_Desc'].text);
              ListaFornecimento[j].CD_FORNECIMENTO      := NrOrdem;
              ListaFornecimento[j].CD_ITEM              := IntToStr(j+1);
              ListaFornecimento[j].CD_REFERENCIA        := NrOrdem;
              ListaFornecimento[j].NR_PO                := NrPedido;
              ListaFornecimento[j].CD_PAIS_DESTINO      := DestinoPais;
              ListaFornecimento[j].CD_INCOTERM          := CdIncoterm;
              ListaFornecimento[j].TX_MARCACAO          := TxMarcacao;
              ListaFornecimento[j].CD_MERCADORIA        := RightStr(Trim(ItemNode.ChildNodes['SKU'].text),16);
              ListaFornecimento[j].CD_MERCADORIA        := AddZeros(ListaFornecimento[j].CD_MERCADORIA);
              ListaFornecimento[j].TX_DESC              := trim(ItemNode.ChildNodes['Produto_Portugues'].text);
              ListaFornecimento[j].TX_DESC_ING          := trim(ItemNode.ChildNodes['Produto_Ingles'].text);
              ListaFornecimento[j].TX_DESC_ESP          := trim(ItemNode.ChildNodes['Produto_Espanhol'].text);
              ListaFornecimento[j].VL_PESO_BRUTO_UN     := trim(ItemNode.ChildNodes['Peso_Bruto_Uni'].text);
              ListaFornecimento[j].VL_PESO_LIQ_UN       := trim(ItemNode.ChildNodes['Peso_Liquido_Uni'].text);
              ListaFornecimento[j].VL_CUBAGEM           := trim(ItemNode.ChildNodes['Cubagem_Uni'].text);
              ListaFornecimento[j].VL_QTDE              := trim(ItemNode.ChildNodes['Quantidade'].text);
              ListaFornecimento[j].VL_PRECO_UNIT        := trim(ItemNode.ChildNodes['Preco_Uni'].text);
              ListaFornecimento[j].VL_PRECO_TOT         := trim(ItemNode.ChildNodes['Preco_SKU'].text);
              ListaFornecimento[j].CD_NCM               := StringReplace(trim(ItemNode.ChildNodes['NCM'].text), '.', '',
                                                           [rfReplaceAll]);
              ListaFornecimento[j].sFABRICANTE          := trim(ItemNode.ChildNodes['Fabricante'].text);
              ListaFornecimento[j].sFABRICANTE_DESC     := trim(ItemNode.ChildNodes['Fabricante_Desc'].text);
              ListaFornecimento[j].sFABRICANTE_END      := trim(ItemNode.ChildNodes['Fabricante_End'].text);
              ListaFornecimento[j].sFABRICANTE_COMP     := trim(ItemNode.ChildNodes['Fabricante_Comp'].text);
              ListaFornecimento[j].sFABRICANTE_PAIS     := trim(ItemNode.ChildNodes['Fabricante_Pais'].text);
              ListaFornecimento[j].sFabricante_CNPJ     := trim(ItemNode.ChildNodes['Fabricante_CNPJ'].text);

              ListaFornecimento[j].sFABRICANTE          := CarregaCodEmpresa(NrOrdem,
                                                                            paisDestinoNome,
                                                                            'Fabricante',
                                                                            ListaFornecimento[j].sFabricante_CNPJ,
                                                                            Email_Enviar);

              ListaFornecimento[j].TX_UNID_MEDIDA       := trim(ItemNode.ChildNodes['Unidade_Medida_Desc'].text);
              ListaFornecimento[j].SG_UNID_MEDIDA       := trim(ItemNode.ChildNodes['Unidade_Medida'].text);
              ListaFornecimento[j].TX_EMBALAGEM         := TxEmbalagem;
              ListaFornecimento[j].CD_GRUPO             := GrupoNestle;


              //Insere a mercadoria. Se o codigo continua o mesmo. Se já existir, mas tiver outro NCM, não continua.
              if not InsereCarregaCodMercadoriaEXPO(ListaFornecimento[j].CD_MERCADORIA,
                                                    ListaFornecimento[j].TX_DESC,
                                                    ListaFornecimento[j].TX_DESC_ESP,
                                                    ListaFornecimento[j].TX_DESC_ING,
                                                    ListaFornecimento[j].CD_NCM,
                                                    ListaFornecimento[j].TX_UNID_MEDIDA,
                                                    NrOrdem) then
                raise Exception.Create('Erro ao cadastrar mercadoria');
            end;

            {$endregion}

            {$region 'preenchimento de codigos' }
            DadosRap.CD_FABRICANTE    := ListaFornecimento[0].sFABRICANTE;
            DadosRap.TX_EMBALAGEM     := TxEmbalagem;

            DadosRap.CD_EXPORTADOR    := CarregaCodEmpresa(NrOrdem,
                                                           paisDestinoNome,
                                                           'Exportador',
                                                           DadosRap.CD_EXPORTADOR,
                                                           Email_NAO_Enviar);

            DadosRap.CD_CLIENTE       := InsereCarregaCodEmpresa(DadosRap.SIMPORTADOR,
                                                                 DadosRap.SIMPORTADOR_DESC,
                                                                 DadosRap.SIMPORTADOR_END,
                                                                 DadosRap.SIMPORTADOR_COMP_END,
                                                                 DadosRap.SIMPORTADOR_PAIS,
                                                                 DadosRap.SIMPORTADOR_CNPJ,
                                                                 NrOrdem,
                                                                 'Cliente');

            DadosRap.CD_CONSIGNATARIO := InsereCarregaCodEmpresa(DadosRap.SCONSIGNATARIO,
                                                                 DadosRap.SCONSIGNATARIO_DESC,
                                                                 DadosRap.SCONSIGNATARIO_END,
                                                                 DadosRap.SCONSIGNATARIO_COMP_END,
                                                                 DadosRap.SCONSIGNATARIO_PAIS,
                                                                 '',
                                                                 NrOrdem,
                                                                 'Consignatário');

            DadosRap.CD_NOTIFY        := InsereCarregaCodEmpresa(DadosRap.SNOTIFY,
                                                                 DadosRap.SNOTIFY_DESC,
                                                                 DadosRap.SNOTIFY_END,
                                                                 DadosRap.SNOTIFY_COMP_END,
                                                                 DadosRap.SNOTIFY_PAIS,
                                                                 '',
                                                                 NrOrdem,
                                                                 'Notify');

            DadosRap.CD_VIA_TRANSPORTE := CarregarCodViaTransporte(DadosRap.CD_VIA_TRANSPORTE);
            DadosRap.CD_LOCAL_ORIGEM   := CarregarCodLocalEmbarque(DadosRap.CD_LOCAL_ORIGEM);
            DadosRap.CD_LOCAL_DESTINO  := CarregarCodLocalEmbarque(DadosRap.CD_LOCAL_DESTINO);
            DadosRap.CD_MOEDA_MLE      := CarregaCodigoMoeda(DadosRap.CD_MOEDA_MLE);
            //não mudar a ordem dessa linha. Precisa ter o codigo do exportador!!!
            DadosRap.CD_TERMO_PAGTO    := InsereCarregaCodigoTermoPgmto(DadosRap.CD_EXPORTADOR,
                                                                        DadosRap.CD_TERMO_PAGTO);
            {$endregion}

            {$region 'Integração'}
          if not cbxValidar.Checked then
            dmdBroker.dbBroker.StartTransaction;

          ResultadoIntegracaoTRAP := IntegraTRAP(DadosRap);
          if not ResultadoIntegracaoTRAP.Integrou then
            raise Exception.Create('Erro ao inserir na tabela TRAP.')
          else
            if not IntegraTRAP_FORNECIMENTO(ResultadoIntegracaoTRAP.ChaveTRAP, ListaFornecimento) then
              raise Exception.Create('Erro ao inserir na tabela TRAP_FORNECIMENTO.');

          {$endregion }
          end
          else
          begin
            Log('Integração EXPO desabilitada', Logar);
            Result :=False;
          end;
        end
        {$endregion}

        {$region 'Leitura e Integração - Arquivo Envio Importação'}
        else
        if (EnvioNode.ChildNodes['Versao'].text = '1') then
        begin
          if LocalSettings.IntegracaoImpo then
          begin
            TipoArquivo := 'IMPO';
            //algumas tags não são usadas. mas preferi deixar a leitura pronta.

            Email_Atendente := 'atendimento-nestle@myindaia.com.br'; //'marjorie.kiyotani@myindaia.com.br';//

            //*esses valores também serão utilizados para o preenchimento da tabela de item*//
            NrOrdem                            :=  trim(EnvioNode.ChildNodes['Ordem'].text);
            CdIncoterm                         :=  trim(EnvioNode.ChildNodes['Incoterm'].text);
            PesoLiq                            :=  trim(EnvioNode.ChildNodes['Peso_Liquido'].text);
            Ds_Condicao_Pagmto                 :=  trim(EnvioNode.ChildNodes['Condicao_Pagamento_Desc'].text);

            PedidoImpo.NR_ORDEM                :=  NrOrdem;
            PedidoImpo.DT_EMISSAO              :=  trim(EnvioNode.ChildNodes['Emissao'].text);
            PedidoImpo.DT_DELIVERY             :=  trim(EnvioNode.ChildNodes['Delivery'].text);
            PedidoImpo.NR_PEDIDO               :=  trim(EnvioNode.ChildNodes['Pedido'].text);

            PedidoImpo.EXPORTADOR_CODIGO       :=  trim(EnvioNode.ChildNodes['Exportador'].text);
            PedidoImpo.EXPORTADOR_DESC         :=  trim(EnvioNode.ChildNodes['Exportador_Desc'].text);
            PedidoImpo.EXPORTADOR_END          :=  trim(EnvioNode.ChildNodes['Exportador_End'].text);
            PedidoImpo.EXPORTADOR_COMP         :=  trim(EnvioNode.ChildNodes['Exportador_Comp'].text);
            PedidoImpo.EXPORTADOR_PAIS         :=  trim(EnvioNode.ChildNodes['Exportador_Pais'].text);
            PedidoImpo.EXPORTADOR_CNPJ         :=  trim(EnvioNode.ChildNodes['Exportador_CNPJ'].text);

            PedidoImpo.IMPORTADOR_CODIGO       :=  trim(EnvioNode.ChildNodes['Importador'].text);
            PedidoImpo.IMPORTADOR_DESC         :=  trim(EnvioNode.ChildNodes['Importador_Desc'].text);
            PedidoImpo.IMPORTADOR_END          :=  trim(EnvioNode.ChildNodes['Importador_End'].text);
            PedidoImpo.IMPORTADOR_COMP         :=  trim(EnvioNode.ChildNodes['Importador_Comp'].text);
            PedidoImpo.IMPORTADOR_PAIS         :=  trim(EnvioNode.ChildNodes['Importador_Pais'].text);
            PedidoImpo.IMPORTADOR_CNPJ         :=  trim(EnvioNode.ChildNodes['Importador_CNPJ'].text);

            PedidoImpo.CONSIGNATARIO_CODIGO    :=  trim(EnvioNode.ChildNodes['Consignee'].text);
            PedidoImpo.CONSIGNATARIO_DESC      :=  trim(EnvioNode.ChildNodes['Consignee_Desc'].text);
            PedidoImpo.CONSIGNATARIO_END       :=  trim(EnvioNode.ChildNodes['Consignee_End'].text);
            PedidoImpo.CONSIGNATARIO_COMP      :=  trim(EnvioNode.ChildNodes['Consignee_Comp'].text);
            PedidoImpo.CONSIGNATARIO_PAIS      :=  trim(EnvioNode.ChildNodes['Consignee_Pais'].text);

            PedidoImpo.NOTIFY_CODIGO           :=  trim(EnvioNode.ChildNodes['Notify'].text);
            PedidoImpo.NOTIFY_DESC             :=  trim(EnvioNode.ChildNodes['Notify_Desc'].text);
            PedidoImpo.NOTIFY_END              :=  trim(EnvioNode.ChildNodes['Notify_End'].text);
            PedidoImpo.NOTIFY_COMP             :=  trim(EnvioNode.ChildNodes['Notify_Comp'].text);
            PedidoImpo.NOTIFY_PAIS             :=  trim(EnvioNode.ChildNodes['Notify_Pais'].text);

            PedidoImpo.PRECO_TOTAL             :=  trim(EnvioNode.ChildNodes['Preco_Total'].text);
            PedidoImpo.TIPO_TRANSPORTE         :=  trim(EnvioNode.ChildNodes['Tipo'].text);
            PedidoImpo.PESO_LIQUIDO            :=  PesoLiq;
            PedidoImpo.PESO_BRUTO              :=  trim(EnvioNode.ChildNodes['Peso_Bruto'].text);
            PedidoImpo.CUBAGEM                 :=  trim(EnvioNode.ChildNodes['Cubagem'].text);
            PedidoImpo.VIA_TRANSPORTE          :=  trim(EnvioNode.ChildNodes['Via_Transporte'].text);

            PedidoImpo.EMBARQUE_CIDADE         :=  trim(EnvioNode.ChildNodes['Embarque_Cidade'].text);
            PedidoImpo.EMBARQUE_PAIS           :=  trim(EnvioNode.ChildNodes['Embarque_Pais'].text);
            PedidoImpo.EMBARQUE_COLETA         :=  trim(EnvioNode.ChildNodes['Embarque_Coleta'].text);

            PedidoImpo.DESTINO_CIDADE          :=  trim(EnvioNode.ChildNodes['Destino_Cidade'].text);
            PedidoImpo.DESTINO_PAIS            :=  trim(EnvioNode.ChildNodes['Destino_Pais'].text);

            PedidoImpo.DT_EMBARQUE_PREVISAO    :=  trim(EnvioNode.ChildNodes['Embarque_Previsao'].text);
            PedidoImpo.DT_PRONTIDAO_CARGA      :=  trim(EnvioNode.ChildNodes['Prontidao_Carga'].text);
            PedidoImpo.CONDICAO_PAGAMENTO      :=  trim(EnvioNode.ChildNodes['Condicao_Pagamento'].text);
            PedidoImpo.CONDICAO_PAGAMENTO_DESC :=  Ds_Condicao_Pagmto;
            PedidoImpo.TIPO_FRETE              :=  trim(EnvioNode.ChildNodes['Tipo_Frete'].text);
            PedidoImpo.VALOR_FRETE             :=  trim(EnvioNode.ChildNodes['Valor_Frete'].text);
            PedidoImpo.VALOR_SEGURO            :=  trim(EnvioNode.ChildNodes['Valor_Seguro'].text);
            PedidoImpo.INCOTERM                :=  CdIncoterm;
            PedidoImpo.MOEDA                   :=  trim(EnvioNode.ChildNodes['Moeda'].text);
            PedidoImpo.DADOS_BANCARIOS         :=  trim(EnvioNode.ChildNodes['Dados_Bancarios'].text);
            PedidoImpo.MARCACAO                :=  trim(EnvioNode.ChildNodes['Marcacao'].text);

            CodExportador := InsereCarregaCodEmpresa(PedidoImpo.EXPORTADOR_CODIGO,
                                                     PedidoImpo.EXPORTADOR_DESC,
                                                     PedidoImpo.EXPORTADOR_END,
                                                     PedidoImpo.EXPORTADOR_COMP,
                                                     PedidoImpo.EXPORTADOR_PAIS,
                                                     PedidoImpo.EXPORTADOR_CNPJ,
                                                     NrOrdem,
                                                     'Exportador');

            CodImportador  := CarregaCodEmpresa(NrOrdem,
                                                '',
                                                'Importador',
                                                PedidoImpo.IMPORTADOR_CNPJ, Email_NAO_Enviar);

            if trim(CodImportador) = ''  then
               raise Exception.Create('Importador não encontrado. CNPJ: ' + PedidoImpo.IMPORTADOR_CNPJ + ' Nome: '+  PedidoImpo.IMPORTADOR_DESC);

            CodMoeda       := CarregaCodigoMoeda(PedidoImpo.MOEDA);

            {$region 'Tag Produto'}
            qtItens := EnvioNode.ChildNodes['Produto'].ChildNodes.Count;
            SetLength(ListaPedidoImpo, qtItens);
            for j := 0 to qtItens -1 do
            begin
              ItemNode := EnvioNode.ChildNodes['Produto'].ChildNodes[j];

              ListaPedidoImpo[j].NR_ITEM_PO           :=  inttostr(j+1);
              ListaPedidoImpo[j].ORDEM                :=  NrOrdem;
              ListaPedidoImpo[j].INCOTERM             :=  CdIncoterm;
              ListaPedidoImpo[j].CD_EXPORTADOR        :=  CodExportador;
              ListaPedidoImpo[j].CD_MOEDA             :=  CodMoeda;
              ListaPedidoImpo[j].PESO_LIQ             :=  PesoLiq;
              ListaPedidoImpo[j].CD_IMPORTADOR        :=  CodImportador;
              ListaPedidoImpo[j].DS_CONDICAO_PGMTO    :=  Ds_Condicao_Pagmto;
              ListaPedidoImpo[j].SKU                  :=  RightStr(Trim(ItemNode.ChildNodes['SKU'].text),16);
              ListaPedidoImpo[j].SKU                  :=  AddZeros(ListaPedidoImpo[j].SKU);
              ListaPedidoImpo[j].PRODUTO_PORTUGUES    :=  trim(ItemNode.ChildNodes['Produto_Portugues'].text);
              ListaPedidoImpo[j].PRODUTO_INGLES       :=  trim(ItemNode.ChildNodes['Produto_Ingles'].text);
              ListaPedidoImpo[j].PRODUTO_ESPANHOL     :=  trim(ItemNode.ChildNodes['Produto_Espanhol'].text);
              ListaPedidoImpo[j].PESO_BRUTO_UNI       :=  trim(ItemNode.ChildNodes['Peso_Bruto_Uni'].text);
              ListaPedidoImpo[j].PESO_LIQUIDO_UNI     :=  trim(ItemNode.ChildNodes['Peso_Liquido_Uni'].text);
              ListaPedidoImpo[j].CUBAGEM_UNI          :=  trim(ItemNode.ChildNodes['Cubagem_Uni'].text);
              ListaPedidoImpo[j].QUANTIDADE           :=  trim(ItemNode.ChildNodes['Quantidade'].text);
              ListaPedidoImpo[j].PRECO_UNI            :=  trim(ItemNode.ChildNodes['Preco_Uni'].text);
              ListaPedidoImpo[j].PRECO_SKU            :=  trim(ItemNode.ChildNodes['Preco_SKU'].text);
              ListaPedidoImpo[j].NCM                  :=  StringReplace(trim(ItemNode.ChildNodes['NCM'].text), '.','', [rfReplaceAll]);

              ListaPedidoImpo[j].FABRICANTE_COD       :=  trim(ItemNode.ChildNodes['Fabricante'].text);
              ListaPedidoImpo[j].FABRICANTE_DESC      :=  trim(ItemNode.ChildNodes['Fabricante_Desc'].text);
              ListaPedidoImpo[j].FABRICANTE_END       :=  trim(ItemNode.ChildNodes['Fabricante_End'].text);
              ListaPedidoImpo[j].FABRICANTE_COMP      :=  trim(ItemNode.ChildNodes['Fabricante_Comp'].text);
              ListaPedidoImpo[j].FABRICANTE_PAIS      :=  trim(ItemNode.ChildNodes['Fabricante_Pais'].text);
              ListaPedidoImpo[j].FABRICANTE_CNPJ      :=  trim(ItemNode.ChildNodes['Fabricante_CNPJ'].text);

              ListaPedidoImpo[j].UNIDADE_MEDIDA       :=  trim(ItemNode.ChildNodes['Unidade_Medida'].text);
              ListaPedidoImpo[j].UNIDADE_MEDIDA_DESC  :=  trim(ItemNode.ChildNodes['Unidade_Medida_Desc'].text);

              ListaPedidoImpo[j].CD_UNIDADE_MEDIDA    := CarregaCodigoUnidadeMedida(ListaPedidoImpo[j].UNIDADE_MEDIDA_DESC);

              ListaPedidoImpo[j].CD_FABRICANTE_PAIS   := CarregaCodigoPais(ListaPedidoImpo[j].FABRICANTE_PAIS,NrOrdem, 'Pais do Fabricante');
              if ListaPedidoImpo[j].CD_FABRICANTE_PAIS = 'NÃO ENCONTRADO' then
                 ListaPedidoImpo[j].CD_FABRICANTE_PAIS := '';
            //    raise Exception.Create('Pais não encontrado. Necessario efetuar o cadastro.');

              ListaPedidoImpo[j].CD_FABRICANTE        := InsereCarregaCodEmpresa( ListaPedidoImpo[j].FABRICANTE_DESC,
                                                                                  ListaPedidoImpo[j].FABRICANTE_COD,
                                                                                  ListaPedidoImpo[j].FABRICANTE_END,
                                                                                  ListaPedidoImpo[j].FABRICANTE_COMP,
                                                                                  ListaPedidoImpo[j].FABRICANTE_PAIS,
                                                                                  ListaPedidoImpo[j].FABRICANTE_CNPJ,
                                                                                  NrOrdem,
                                                                                  'Fabricante');
              ListaPedidoImpo[j].NR_PLANTA            :=  PedidoImpo.IMPORTADOR_CODIGO;

              if CodMercadoria = '' then
                CodMercadoria := ListaPedidoImpo[j].SKU;

              //Insere a mercadoria. Se o codigo continua o mesmo. Se já existir, mas tiver outro NCM, não continua.
              if not InsereCarregaCodMercadoriaIMPO(ListaPedidoImpo[j].SKU,
                                                    ListaPedidoImpo[j].PRODUTO_PORTUGUES,
                                                    ListaPedidoImpo[j].PRODUTO_ESPANHOL,
                                                    ListaPedidoImpo[j].PRODUTO_INGLES,
                                                    ListaPedidoImpo[j].NCM,
                                                    ListaPedidoImpo[j].UNIDADE_MEDIDA,
                                                    NrOrdem) then
                raise Exception.Create('Erro ao cadastrar mercadoria');
            end;
            {$endregion}

            {$Region 'preenchimento de codigos'}
            PedidoImpo.CD_MOEDA            := CodMoeda;
            PedidoImpo.CD_EXPORTADOR       := CodExportador;
            PedidoImpo.CD_IMPORTADOR       := CodImportador;
            PedidoImpo.CD_VIA_TRANSPORTE   := CarregarCodViaTransporte(PedidoImpo.VIA_TRANSPORTE);

            PedidoImpo.CD_EMBARQUE_PAIS    := CarregaCodigoPais(PedidoImpo.EMBARQUE_PAIS, NrOrdem, 'Pais de Embarque');
            if PedidoImpo.CD_EMBARQUE_PAIS = 'NÃO ENCONTRADO' then
              PedidoImpo.CD_EMBARQUE_PAIS    := '';
              // raise Exception.Create('Pais não encontrado. Necessario efetuar o cadastro.');

            PedidoImpo.CD_PAIS_DESTINO     := CarregaCodigoPais(PedidoImpo.DESTINO_PAIS ,NrOrdem, 'Pais de Destino');
            if PedidoImpo.CD_PAIS_DESTINO = 'NÃO ENCONTRADO' then
              PedidoImpo.CD_PAIS_DESTINO   := '';

            PedidoImpo.CD_EMBARQUE_CIDADE  := CarregarCodLocalEmbarque(PedidoImpo.EMBARQUE_CIDADE);
            PedidoImpo.CD_TIPO_FRETE       := IIf(UpperCase(PedidoImpo.TIPO_FRETE) = 'PREPAID', '1', '0');  //  Collect=0  Prepaid=1
            PedidoImpo.CD_CIDADE_DESTINO   := CarregarCodLocalEmbarque(PedidoImpo.DESTINO_CIDADE);
            PedidoImpo.CD_AREA             :=  CarregaCodigoArea(CodMercadoria);

            {$endregion}

            {$region 'Integracao'}
            if not cbxValidar.Checked then
              dmdBroker.dbBroker.StartTransaction;

            if not InsereTProcesso(PedidoImpo) or not InsereProcessoImportacao(PedidoImpo, ListaPedidoImpo) then
              raise Exception.Create('Erro ao inserir na tabela TPROCESSO.')
            else
            begin
              ResultadoIntegracaoTINSTRUCAO_DESEMBARACO := IntegraTINSTRUCAO_DESEMBARACO(PedidoImpo);
              if not ResultadoIntegracaoTINSTRUCAO_DESEMBARACO.Integrou then
                raise Exception.Create('Erro ao inserir na tabela TINSTRUCAO_DESEMBARACO.')
              else
                if not IntegraTINSTRUCAO_DESEMBARACO_PEDIDO(ListaPedidoImpo, ResultadoIntegracaoTINSTRUCAO_DESEMBARACO.ChaveInst_Dembaraco) then
                  raise Exception.Create('Erro ao inserir na tabela TINSTRUCAO_DESEMBARACO_PEDIDO.')
                else
                  if not IntegraTPO(PedidoImpo) then
                    raise Exception.Create('Erro ao inserir na tabela TPO.')
                  else
                    if not IntegraTPO_ITEM(ListaPedidoImpo,ResultadoIntegracaoTINSTRUCAO_DESEMBARACO.ChaveInst_Dembaraco ) then
                      raise Exception.Create('Erro ao inserir na tabela TPO_ITEM.');
            end;


           {$endregion}
          end
          else
          begin
            Log('Integração IMPO desabilitada', Logar);
            Result := False;
          end;
        end
        else
        begin
          Log('Não integrado, versão maior que 1.', Logar);
          result := true;
        end;

        {$endregion}
      end
      else
        {$region 'Leitura e Integração - Arquivo Complemento'}
      if (UpperCase(XMLDoc.DocumentElement.NodeName) = UpperCase('Complemento')) then //Segundo Arquivo -> Complemento
      begin
      if LocalSettings.IntegracaoExpo then
      begin
        TipoArquivo := 'EXPO';
        ComplementoNode := XMLDoc.DocumentElement;

       // Email_Atendente := BuscaEmailAtendenteFornecimento(trim(ComplementoNode.ChildNodes['Ordem'].text)); //carrega o e-mail na variavel Email_Atendente
        Email_Atendente := 'integralotenestle@myindaia.com.br';
        NrOrdem       := trim(ComplementoNode.ChildNodes['Ordem'].text);
        ChaveNota     := trim(ComplementoNode.ChildNodes['Chave_NF'].text);
        Delivery      := trim(ComplementoNode.ChildNodes['Delivery'].text);

        {$region 'Tag Lotes'}
        qtItens := ComplementoNode.ChildNodes['Lotes'].ChildNodes.Count;
        SetLength(ListaFornecimentoLote, qtItens);
        for j := 0 to qtItens -1 do
        begin
          ItemNode := ComplementoNode.ChildNodes['Lotes'].ChildNodes[j];

          ListaFornecimentoLote[j].CD_FORNECIMENTO      := NrOrdem;
          ListaFornecimentoLote[j].CHAVE_NOTA           := ChaveNota;
          ListaFornecimentoLote[j].CD_DELIVERY          := Delivery;
	  	    ListaFornecimentoLote[j].CD_LOTE              := trim(ItemNode.ChildNodes['Codigo'].text);
	  	    ListaFornecimentoLote[j].CD_SKU               := RightStr(Trim(ItemNode.ChildNodes['SKU'].text),16);
          ListaFornecimentoLote[j].CD_SKU               := AddZeros(ListaFornecimentoLote[j].CD_SKU);
	  	    ListaFornecimentoLote[j].DT_FABRICACAO        := trim(ItemNode.ChildNodes['Fabricacao'].text);
	  	    ListaFornecimentoLote[j].DT_VENCIMENTO        := trim(ItemNode.ChildNodes['Validade'].text);
	  	    ListaFornecimentoLote[j].QT_MERCADORIA        := trim(ItemNode.ChildNodes['Quantidade'].text);
	  	    ListaFornecimentoLote[j].QT_PESO_LIQ          := trim(ItemNode.ChildNodes['Peso_Liquido'].text);
	  	    ListaFornecimentoLote[j].QT_PESO_BRUTO        := trim(ItemNode.ChildNodes['Peso_Bruto'].text);
        end;
        {$Endregion}

        {$region 'Integração'}
        if not cbxValidar.Checked then
          dmdBroker.dbBroker.StartTransaction;

        ResultaLote := IntegraTRAP_FORNECIMENTO_LOTE(ListaFornecimentoLote);
        if not ResultaLote.Integrou then
          raise Exception.Create('Erro ao inserir na tabela TRAP_FORNECIMENTO_LOTE:' +#13#10  + ResultaLote.Mensagem)
        else
          IntegrouLote := true;
        {$endregion}

      end
      else
      begin
        Log('Integração EXPO desabilitada', Logar);
        Result := False;
      end;
      end;
      {$endregion}

    except on E: Exception do
    begin
      Result := false;
      Log('Erro ao ler o XML!' + #13#10 + E.Message, Logar);

      if dmdBroker.dbBroker.InTransaction then
        dmdBroker.dbBroker.Rollback;

      SetLength(lResultadoProcessamento,Length(lResultadoProcessamento)+1);
      lResultadoProcessamento[Length(lResultadoProcessamento)-1].Tipo  := 'E';
      lResultadoProcessamento[Length(lResultadoProcessamento)-1].Texto := 'Erro ao ler o XML! <BR><BR>' + E.Message;

      Application.ProcessMessages;
    end;
    end;

  finally
    if cbxValidar.Checked then
    begin
      if dmdBroker.dbBroker.InTransaction then
        dmdBroker.dbBroker.Rollback;
    end
    else
    begin
     if dmdBroker.dbBroker.InTransaction then
      dmdBroker.dbBroker.commit;
    end;

    EnviarEmailResultado(nrOrdem);
    if IntegrouLote then
      ProcessaRecebimentoLotes(nrordem, Delivery);
  end;
end;

procedure TfrmMain.ProcessaRecebimentoLotes(NrOrdem, Delivery : string);
var lotes_ordem_ok , lotes_processo_ok :boolean; nr_Processo, cd_rap, cd_rap_ano : string;
   achouRap :boolean;
  vNumeroSequencial: integer;
  cd_exportador: string;
begin
  {Atenção! Essa validação é feita na integração da RAP no Broker.}
  Log('Atualiza status lotes.', Logar);
  achouRap       := false;
  nr_Processo    := '';
  cd_rap         := '';
  cd_rap_ano     := '';

  lotes_ordem_ok := VerificaLotes(NrOrdem ,'');
  if lotes_ordem_ok then
  begin
    {Verifica se a atualização será feita só na RAP ou na Rap e no Processo.}
    dmdBroker.qryTemp.sql.Text := ' SELECT NR_PROCESSO, CD_RAP, CD_RAP_ANO, CD_EXPORTADOR  '+
                                  '   FROM MYINDAIA.DBO.TRAP A (NOLOCK)     '+
                                  '  WHERE CD_GRUPO        = '+QuotedStr(GrupoNestle)+
                                  '    AND NR_FORNECIMENTO = '+QuotedStr(NrOrdem);
    dmdBroker.qryTemp.open;
    if not dmdBroker.qryTemp.eof then
    begin
      nr_Processo := dmdBroker.qryTemp.fieldbyname('NR_PROCESSO').asString;
      cd_rap      := dmdBroker.qryTemp.fieldbyname('CD_RAP').asString;
      cd_rap_ano  := dmdBroker.qryTemp.fieldbyname('CD_RAP_ANO').asString;
      cd_exportador := dmdBroker.qryTemp.fieldbyname('CD_EXPORTADOR').asString;
      achouRap    := true;
    end;
    dmdBroker.qryTemp.close;


    if achouRap then
    begin
      if nr_Processo = '' then
      begin
        AtualizaDataLoteRap(cd_rap, cd_rap_ano, NrOrdem, GrupoNestle);
      end
      else
      begin
        AtualizaDataLoteRap(cd_rap, cd_rap_ano, NrOrdem, GrupoNestle);

        lotes_processo_ok := VerificaLotes('' ,nr_Processo);
        if lotes_processo_ok then
          AtualizaDataLoteProcesso(nr_Processo);

        if Delivery <> '' then
        begin
          dmdBroker.qryTemp.close;
          dmdBroker.qryTemp.sql.Text := ' SELECT RIGHT(''00000'' + RTRIM(NR_SEQUENCIA), 5) AS SEQUENCIA_COM_ZEROS, * ' +
                                        ' FROM TREF_CLIENTE (NOLOCK) WHERE NR_PROCESSO = :NR_PROCESSO ' +
                                        ' ORDER BY RIGHT(''00000'' + RTRIM(NR_SEQUENCIA), 5) ';


          dmdBroker.qryTemp.parambyname('NR_PROCESSO').asstring :=  nr_Processo;
          dmdBroker.qryTemp.open;

          if not dmdBroker.qryTemp.locate('TP_REFERENCIA; CD_REFERENCIA', VarArrayOf(['48',Delivery]), []) then
          begin
            dmdBroker.qryTemp.last;
            vNumeroSequencial := StrToInt(dmdBroker.qryTemp.fieldbyname('NR_SEQUENCIA').asString);
            inc(vNumeroSequencial);

            dmdBroker.qryTemp.close;
            dmdBroker.qryTemp.sql.Text := ' INSERT INTO TREF_CLIENTE (NR_PROCESSO, NR_SEQUENCIA, CD_REFERENCIA, DT_REFERENCIA, TP_REFERENCIA, CD_EMPRESA, CD_AREA) ' +
                                          ' VALUES(:NR_PROCESSO, :NR_SEQUENCIA, :CD_REFERENCIA, :DT_REFERENCIA, :TP_REFERENCIA, :CD_EMPRESA, :CD_AREA) ';

            dmdBroker.qryTemp.parambyname('NR_PROCESSO').asstring :=  nr_Processo;
            dmdBroker.qryTemp.parambyname('NR_SEQUENCIA').asstring := FormatFloat('00000',vNumeroSequencial);
            dmdBroker.qryTemp.parambyname('CD_REFERENCIA').asstring :=  Delivery;
            dmdBroker.qryTemp.parambyname('DT_REFERENCIA').AsDateTime := Now;
            dmdBroker.qryTemp.parambyname('TP_REFERENCIA').asstring :=  '48';
            dmdBroker.qryTemp.parambyname('CD_EMPRESA').asstring := cd_exportador;

            dmdBroker.qryTemp2.Open('SELECT CD_AREA FROM TPROCESSO WHERE NR_PROCESSO = ' + QuotedStr(nr_Processo));
            dmdbroker.qryTemp.ParamByName('CD_AREA').AsString := DMDBROKER.qryTemp2.FieldByName('CD_AREA').AsString;
            dmdbroker.qryTemp2.Close;

            dmdBroker.qryTemp.execSql;
            dmdBroker.qryTemp.close;
          end;
        end;
      end;
    end;
  end
  else
    Log('Lotes não estão completos.', Logar);
end;

procedure TfrmMain.AtualizaDataLoteRap(cd_rap, cd_rap_ano, NrOrdem, GrupoNestle :string);
begin
    Log('Atualiza status lotes TRAP.', Logar);
    dmdBroker.qryTemp.close;
    dmdBroker.qryTemp.sql.Text := ' UPDATE MYINDAIA.DBO.TRAP                         '+
                                  '    SET DT_RECEBIMENTO_LOTES = GETDATE()          '+
                                  '   FROM MYINDAIA.DBO.TRAP A (NOLOCK)              '+
                                  '  WHERE CD_RAP          = '+QuotedStr(cd_rap)     +
                                  '    AND CD_RAP_ANO      = '+QuotedStr(cd_rap_ano) +
                                  '    AND CD_GRUPO        = '+QuotedStr(GrupoNestle)+
                                  '    AND NR_FORNECIMENTO = '+QuotedStr(NrOrdem) ;
    dmdBroker.qryTemp.execSql;
    dmdBroker.qryTemp.close;
end;

procedure TfrmMain.AtualizaDataLoteProcesso(nr_Processo :string);
begin
    Log('Atualiza status lotes TFOLLOWUP.', Logar);
  {  dmdBroker.qryTemp.close;
    dmdBroker.qryTemp.sql.Text := ' UPDATE BROKER.DBO.TFOLLOWUP                   '+
                                  '    SET DT_REALIZACAO = GETDATE()              '+
                                  '      , CD_RESP_REALIZACAO = ''0707''          '+
                                  '   FROM BROKER.DBO.TFOLLOWUP A (NOLOCK)        '+
                                  '  WHERE NR_PROCESSO = '+QuotedStr(nr_Processo)  +
                                  '    AND CD_EVENTO   = ''314''                  ';
    dmdBroker.qryTemp.execSql;
     }
    dmdBroker.qryTemp.close;
    dmdBroker.qryTemp.sql.Text := ' UPDATE BROKER.DBO.TFOLLOWUP                   '+
                                  '    SET DT_REALIZACAO = GETDATE()              '+
                                  '      , CD_RESP_REALIZACAO = ''0707''          '+
                                  '   FROM BROKER.DBO.TFOLLOWUP A (NOLOCK)        '+
                                  '  WHERE NR_PROCESSO = '+QuotedStr(nr_Processo)  +
                                  '    AND CD_EVENTO   = ''671''                  ';
    dmdBroker.qryTemp.execSql;
end;

function TfrmMain.VerificaLotes(NrOrdem, nr_processo : string) : Boolean;
begin
  result := false;

  if NrOrdem <> '' then
  begin
    dmdBroker.qryTemp.Close;
    dmdBroker.qryTemp.sql.Text := 'SELECT * FROM BROKER.DBO.FN_DIVERGENCIAS_LOTES_RAP('+QuotedStr(GrupoNestle)+','''', '+QuotedStr(NrOrdem)+' )';
    dmdBroker.qryTemp.open;
    while not dmdBroker.qryTemp.eof do
    begin
      if dmdBroker.qryTemp.fieldbyname('STATUS_ANALISE').asInteger = 3 then   //Nenhuma divergência encontrada
      begin
        result := true;
        break;
      end;
      dmdBroker.qryTemp.next;
    end;
    dmdBroker.qryTemp.close;
  end
  else
  begin
    dmdBroker.qryTemp.Close;
    dmdBroker.qryTemp.sql.Text := 'SELECT * FROM BROKER.DBO.FN_DIVERGENCIAS_LOTES_RAP('+QuotedStr(GrupoNestle)+', '+QuotedStr(nr_processo)+', '''' )';
    dmdBroker.qryTemp.open;
    while not dmdBroker.qryTemp.eof do
    begin
      if dmdBroker.qryTemp.fieldbyname('STATUS_ANALISE').asInteger = 3 then   //Nenhuma divergência encontrada
      begin
        result := true;
        break;
      end;
      dmdBroker.qryTemp.next;
    end;
    dmdBroker.qryTemp.close;
  end;
end;

function TfrmMain.IntegraTRAP(DadosRap: TRap) : TResultadoIntegracaoTRAP;
var
  DataAux : string;
  Resultado : TResultadoIntegracaoTRAP;
  chaveRap : TChave_Rap;
begin
  Log('Integra TRAP ', Logar);
  Application.ProcessMessages;

  try
    dmdBroker.qryTRAP.close;

    {$region 'Define Chave e tipo de query'}
    chaveRap := BuscaRapJaCadastrada(DadosRap.NR_FORNECIMENTO);
    if (chaveRap.CD_RAP <> '') and (chaveRap.CD_RAP_ANO <> '') then
    begin
     SetLength(lResultadoProcessamento,Length(lResultadoProcessamento)+1);
     lResultadoProcessamento[Length(lResultadoProcessamento)-1].Tipo   := 'A';
     lResultadoProcessamento[Length(lResultadoProcessamento)-1].Texto  := DadosRap.NR_FORNECIMENTO;
     lResultadoProcessamento[Length(lResultadoProcessamento)-1].Titulo := 'Estorno - Ajuste de informações na Ordem - País de destino: ' +
                                                                           DadosRap.DS_PAIS_DESTINO +
                                                                          ' Ordem: ' + DadosRap.NR_FORNECIMENTO +
                                                                          ' - ' + DadosRap.SEXPORTADOR_DESC + ' ( ' + DadosRap.CD_EXPORTADOR + ' )';

      DadosRap.CD_RAP     := chaveRap.CD_RAP;
      DadosRap.CD_RAP_ANO := chaveRap.CD_RAP_ANO;

      dmdBroker.qryTRAP.Sql.Text := GetSQLTRap('U');
    end
    else
    begin
     SetLength(lResultadoProcessamento,Length(lResultadoProcessamento)+1);
     lResultadoProcessamento[Length(lResultadoProcessamento)-1].Tipo   := 'I';
     lResultadoProcessamento[Length(lResultadoProcessamento)-1].Texto  := DadosRap.NR_FORNECIMENTO;
     lResultadoProcessamento[Length(lResultadoProcessamento)-1].Titulo := 'Liberação de ordem - País de destino: ' +
                                                                           DadosRap.DS_PAIS_DESTINO +
                                                                           ' Ordem: ' + DadosRap.NR_FORNECIMENTO +
                                                                           ' - ' + DadosRap.SEXPORTADOR_DESC + ' ( ' + DadosRap.CD_EXPORTADOR + ' )';

     DadosRap.CD_RAP     := BuscaChaveRap;
     DadosRap.CD_RAP_ANO := Copy(IntToStr(YearOf(now)),3,2);

      dmdBroker.qryTRAP.Sql.Text := GetSQLTRap('I');
    end;

    Resultado.ChaveTRap.CD_RAP     :=  DadosRap.CD_RAP;
    Resultado.ChaveTRap.CD_RAP_ANO :=  DadosRap.CD_RAP_ANO;
    {$endregion}

    dmdBroker.qryTRAP.ParamByName('CD_RAP').Value                 := DadosRap.CD_RAP;
    dmdBroker.qryTRAP.ParamByName('CD_RAP_ANO').Value             := DadosRap.CD_RAP_ANO;
    dmdBroker.qryTRAP.ParamByName('CD_STATUS').Value              := 1; //Se for UPDATE, vai mater o status. OLHA O SCRIPT
    dmdBroker.qryTRAP.ParamByName('IN_RAP_VALIDA').Value          := 1;
    dmdBroker.qryTRAP.ParamByName('IN_FORN_VALIDA').Value         := 1;
    dmdBroker.qryTRAP.ParamByName('IN_PACK_VALIDA').Value         := 1;
    dmdBroker.qryTRAP.ParamByName('TX_VALIDACAO').Value           := 'Todos os fornecimentos são válidos, por favor integre o Packing List para autorizar o embarque.';
    dmdBroker.qryTRAP.ParamByName('CD_USUARIO_CRIADOR').Value     := '0707';
    dmdBroker.qryTRAP.ParamByName('DT_INSERCAO').Value            := now;
    dmdBroker.qryTRAP.ParamByName('CD_EXPORTADOR').Value          := DadosRap.CD_EXPORTADOR;
    dmdBroker.qryTRAP.ParamByName('CD_FABRICANTE').Value          := DadosRap.CD_FABRICANTE;
    dmdBroker.qryTRAP.ParamByName('CD_CLIENTE').Value             := DadosRap.CD_CLIENTE;
    dmdBroker.qryTRAP.ParamByName('CD_PAIS').Value                := DadosRap.CD_PAIS;
    dmdBroker.qryTRAP.ParamByName('CD_TERMO_PAGTO').Value         := DadosRap.CD_TERMO_PAGTO;
    dmdBroker.qryTRAP.ParamByName('CD_INCOTERM').Value            := DadosRap.CD_INCOTERM;
    dmdBroker.qryTRAP.ParamByName('CD_MOEDA_MLE').Value           := DadosRap.CD_MOEDA_MLE;
    dmdBroker.qryTRAP.ParamByName('CD_VIA_TRANSPORTE').Value      := DadosRap.CD_VIA_TRANSPORTE;
    dmdBroker.qryTRAP.ParamByName('CD_LOCAL_ORIGEM').Value        := DadosRap.CD_LOCAL_ORIGEM;
    dmdBroker.qryTRAP.ParamByName('CD_LOCAL_DESTINO').Value       := DadosRap.CD_LOCAL_DESTINO;
    dmdBroker.qryTRAP.ParamByName('CD_CONSIGNATARIO').Value       := DadosRap.CD_CONSIGNATARIO;
    dmdBroker.qryTRAP.ParamByName('CD_NOTIFY').Value              := DadosRap.CD_NOTIFY;
    dmdBroker.qryTRAP.ParamByName('CD_BANCO').Value               := DadosRap.sCD_BANCO; //*verificar*//
    dmdBroker.qryTRAP.ParamByName('NR_FORNECIMENTO').Value        := DadosRap.NR_FORNECIMENTO;
    dmdBroker.qryTRAP.ParamByName('NR_PEDIDO').Value              := DadosRap.NR_PEDIDO;

    DataAux := FormatarData(DadosRap.DT_PREV_SAIDA);
    if DataAux = '' then
      dmdBroker.qryTRAP.ParamByName('DT_PREV_SAIDA').Value        := null
    else
      dmdBroker.qryTRAP.ParamByName('DT_PREV_SAIDA').Value        := DataAux;

   // EXPO-389
   // if upperCase(Copy(DadosRap.CD_INCOTERM,1,1)) = 'C'  then
   // dmdBroker.qryTRAP.ParamByName('VL_MLE').Value                 := StrToFloat(StringReplace(StringReplace(DadosRap.VL_MLE,
   //                                                                        ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]))
   //                                                                - StrToFloat(StringReplace(StringReplace(DadosRap.VL_FRETE_INT,
   //                                                                        ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]))
   // else
       dmdBroker.qryTRAP.ParamByName('VL_MLE').Value                 := StrToFloat(StringReplace(StringReplace(DadosRap.VL_MLE,
                                                                            ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]))
                                                                      -( StrToFloat(StringReplace(StringReplace(DadosRap.VL_FRETE_INT,
                                                                           ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]))
                                                                       + StrToFloat(StringReplace(StringReplace(DadosRap.VL_SEGURO,
                                                                            ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll])));

    //EXPO-389
    dmdBroker.qryTRAP.ParamByName('VL_SEGURO').Value              := 0; //StrToFloat(StringReplace(StringReplace(DadosRap.VL_SEGURO,
                                                                        //   ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));
    //EXPO-389
    dmdBroker.qryTRAP.ParamByName('VL_FRETE_INT').Value           := 0;//StrToFloat(StringReplace(StringReplace(DadosRap.VL_FRETE_INT,
                                                                      //     ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));

    dmdBroker.qryTRAP.ParamByName('VL_PESO_BRUTO').Value          := StrToFloat(StringReplace(StringReplace(DadosRap.VL_PESO_BRUTO,
                                                                           ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));
    dmdBroker.qryTRAP.ParamByName('VL_PESO_LIQ').Value            := StrToFloat(StringReplace(StringReplace(DadosRap.VL_PESO_LIQ,
                                                                           ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));
    dmdBroker.qryTRAP.ParamByName('VL_CUBAGEM').Value             := StrToFloat(StringReplace(StringReplace(DadosRap.VL_CUBAGEM,
                                                                           ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));

    dmdBroker.qryTRAP.ParamByName('TX_EMBALAGEM').Value           := DadosRap.TX_EMBALAGEM;
    dmdBroker.qryTRAP.ParamByName('TX_MARCACAO').Value            := DadosRap.TX_MARCACAO;
    dmdBroker.qryTRAP.ParamByName('TX_INST_EMB').Value            := DadosRap.TX_INST_EMB;
    dmdBroker.qryTRAP.ParamByName('CD_GRUPO').Value               := DadosRap.CD_GRUPO;

    DataAux := FormatarData(DadosRap.DT_PREV_EMBARQUE);
    if DataAux  = '' then
      dmdBroker.qryTRAP.ParamByName('DT_PREV_EMBARQUE').Value     := null
    else
      dmdBroker.qryTRAP.ParamByName('DT_PREV_EMBARQUE').Value     := DataAux;

    DataAux := FormatarData(DadosRap.DT_FECHAMENTO);
    if DataAux = '' then
      dmdBroker.qryTRAP.ParamByName('DT_FECHAMENTO').Value        := null
    else
      dmdBroker.qryTRAP.ParamByName('DT_FECHAMENTO').Value        := DataAux;

    DataAux := FormatarData(DadosRap.DT_FINALIZADO_PEDIDO);
    if DataAux = '' then
      dmdBroker.qryTRAP.ParamByName('DT_FINALIZADO_PEDIDO').Value := null
    else
      dmdBroker.qryTRAP.ParamByName('DT_FINALIZADO_PEDIDO').Value := DataAux;

    dmdBroker.qryTRAP.ParamByName('TX_OBS').Value                 := DadosRap.TX_OBS;

    dmdBroker.qryTRAP.ParamByName('CD_STATUS_DOCTO').Value        := 1;
    dmdBroker.qryTRAP.ParamByName('IN_RAP_VALIDA_DOCTO').Value    := 1;
    dmdBroker.qryTRAP.ParamByName('IN_FABR_EXPO').Value           := 0;
    dmdBroker.qryTRAP.ParamByName('IN_INSPECAO').Value            := 0;
    dmdBroker.qryTRAP.ParamByName('IN_PERMISSO').Value            := 0;
    dmdBroker.qryTRAP.ParamByName('IN_EXPURGO').Value             := 0;
    dmdBroker.qryTRAP.ParamByName('IN_PALLET_EXPURGO').Value      := 0;
    dmdBroker.qryTRAP.ParamByName('IN_DECL_EMBALAGEM').Value      := 0;
    dmdBroker.qryTRAP.ParamByName('IN_CONSULADO').Value           := 0;
    dmdBroker.qryTRAP.ParamByName('IN_TRIANGULACAO').Value        := 0;
    dmdBroker.qryTRAP.ParamByName('IN_CARTA_CREDITO').Value       := 0;
    dmdBroker.qryTRAP.ParamByName('IN_CADIVI').Value              := 0;
    dmdBroker.qryTRAP.ParamByName('IN_AMOSTRA').Value             := 0;
    dmdBroker.qryTRAP.ParamByName('IN_ANTECIPADO').Value          := 0;
    dmdBroker.qryTRAP.ParamByName('IN_EMAIL_ERRO').Value          := 0;
    dmdBroker.qryTRAP.ParamByName('TP_DRAWBACK').Value            := '0';
    dmdBroker.qryTRAP.ParamByName('TP_NOTIFY').Value              := '0';
    dmdBroker.qryTRAP.ParamByName('TP_CONSIGNEE').Value           := 0;
    dmdBroker.qryTRAP.ParamByName('VL_ACRESCIMO').Value           := 0;
    dmdBroker.qryTRAP.ParamByName('VL_DESCONTO').Value            := 0;
    dmdBroker.qryTRAP.ParamByName('IN_PEDIDO_VALIDA').Value       := 0;
    dmdBroker.qryTRAP.ParamByName('IN_COURRIER').Value            := 0;
    dmdBroker.qryTRAP.ParamByName('IN_MODELO').Value              := 0;
    dmdBroker.qryTRAP.ParamByName('IN_SEM_PACK_LIST').Value       := 0;

    dmdBroker.qryTRAP.ExecSQL;

    if dmdBroker.qryTRAP.RowsAffected > 0 then
      Resultado.Integrou   := True
    else
    begin
      Resultado.Integrou  := False;
      Log('Não integrou TRAP: '+  DadosRap.CD_RAP +' ' + DadosRap.CD_RAP_ANO,  Logar);
    end;

    result := Resultado;

  except on e:Exception do
    begin
       Resultado.Integrou := false;
       result             := Resultado;

       Log('Erro ao inserir: TRAP' + #13#10 + E.Message, Logar);
    end;
  end;
end;

function TfrmMain.IntegraTRAP_FORNECIMENTO(Chave :TChave_Rap ;Lista: Lista_TRap_Fornecimento) : Boolean;
var
  i : Integer;
  DataAux : string;
begin
  Log('Integra TRAPFORNECIMENTO ', Logar);
  Application.ProcessMessages;

  try
    result    := true;

    DeleteRapFornecimento(Lista[0].CD_FORNECIMENTO, Chave);

    for I := 0 to Length(Lista)-1 do
    begin
     SetLength(lResultadoProcessamento,Length(lResultadoProcessamento)+1);
     lResultadoProcessamento[Length(lResultadoProcessamento)-1].Tipo  := 'IM';
     lResultadoProcessamento[Length(lResultadoProcessamento)-1].Texto :=  Lista[i].CD_MERCADORIA + ' '
                                                                        + Lista[i].TX_DESC;
      dmdBroker.qryTRAP_FORNECIMENTO.close;
      dmdBroker.qryTRAP_FORNECIMENTO.Sql.Text := GetSQLTRapFornecimento;

      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('CD_RAP').Value                := Chave.CD_RAP;                                                      //Puxar da RAP (integração)
      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('CD_RAP_ANO').Value            := Chave.CD_RAP_ANO;                                                   //Puxar da RAP (integração)
      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('CD_GRUPO').Value              := Lista[i].CD_GRUPO;                                                 //Grupo - Nestle
      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('CD_FORNECIMENTO').Value       := Lista[i].CD_FORNECIMENTO;                                          //Numero da Ordem (pedido de exportação)
      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('CD_ITEM').Value               := Lista[i].CD_ITEM;                                                  //Sequencial
      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('CD_MERCADORIA').Value         := Lista[i].CD_MERCADORIA;                                             //Produto
      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('VL_QTDE').Value               := StrToFloat(StringReplace(StringReplace(Lista[i].VL_QTDE,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));        //Quantidade por item (SKU)
      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('QT_CAIXAS').Value             := StrToFloat(StringReplace(StringReplace(Lista[i].VL_QTDE,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));        //Quantidade por item (SKU)
      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('VL_PESO_LIQ_UN').Value        := StrToFloat(StringReplace(StringReplace(Lista[i].VL_PESO_LIQ_UN,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));        //Peso líquido por item (SKU)
      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('TX_UNID_MEDIDA').Value        := Lista[i].TX_UNID_MEDIDA;                                           //Unidade de medida
      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('VL_PRECO_UNIT').Value         := StrToFloat(StringReplace(StringReplace(Lista[i].VL_PRECO_UNIT,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));        //Preço unitário por item (SKU)
//      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('VL_PRECO_TOT').Value          := StrToFloat(StringReplace(StringReplace(Lista[i].VL_PRECO_TOT,
//                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));        //Preço total por item (SKU)

      //EXPO-389
      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('VL_PRECO_TOT').Value          := StrToFloat(StringReplace(StringReplace(Lista[i].VL_QTDE,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]))
                                                                                 * StrToFloat(StringReplace(StringReplace(Lista[i].VL_PRECO_UNIT,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));


      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('CD_INCOTERM').Value           := Lista[i].CD_INCOTERM;                                              //Incoterm
      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('CD_REFERENCIA').Value         := Lista[i].CD_REFERENCIA;                                            //Numero da ordem

      DataAux := FormatarData(Lista[i].DT_PEDIDO);
      if DataAux  = '' then
        dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('DT_PEDIDO').Value           := null
      else
        dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('DT_PEDIDO').Value           := DataAux;                                                           //Data de emissão/Integração da ordem

      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('NR_PO').Value                 := Lista[i].NR_PO;                                                    //Pedido do cliente (Importador)
      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('CD_PAIS_DESTINO').Value       := Lista[i].CD_PAIS_DESTINO;                                          //Local de Destino (Pais)
      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('CD_NCM').Value                := Lista[i].CD_NCM;                                                   //NCM por item (SKU)
      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('TX_MARCACAO').Value           := Copy(trim(Lista[i].TX_MARCACAO), 1, 30);                           //Marcação
      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('VL_PESO_BRUTO_UN').Value      := StrToFloat(StringReplace(StringReplace(Lista[i].VL_PESO_BRUTO_UN,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));       //Peso bruto por unidade (SKU)
      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('CD_TIPO_CONTAINER').Value     := Lista[i].CD_TIPO_CONTAINER;                                       //Tipo de cntr e/ou carreta
      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('CHAVE_NOTA').Value            := Lista[i].CHAVE_NOTA;                                              //Numero da nota fiscal (chave)
      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('TX_DESC').Value               := Copy(trim(Lista[i].TX_DESC), 1, 200);
      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('TX_DESC_ING').Value           := Copy(trim(Lista[i].TX_DESC_ING), 1, 200);
      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('TX_DESC_ESP').Value           := Copy(trim(Lista[i].TX_DESC_ESP), 1, 200);
      dmdBroker.qryTRAP_FORNECIMENTO.ParamByName('VL_CUBAGEM').Value            := StrToFloat(StringReplace(StringReplace(Lista[I].VL_CUBAGEM,
                                                                                           ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));

      dmdBroker.qryTRAP_FORNECIMENTO.ExecSql;

      if (dmdBroker.qryTRAP_FORNECIMENTO.RowsAffected > 0) and result then
        result := True
      else
        result := False;
    end;

  except on e:Exception do
    begin
       result := false;
       Log('Erro ao inserir: TRAP_FORNECIMENTO' + #13#10 + E.Message, Logar);
    end;
  end;
end;

function TfrmMain.IntegraTRAP_FORNECIMENTO_LOTE(Lista: Lista_TRap_Fornecimento_Lote) : TResultadoIntegracaoTRAPLOTE;
var
  i : Integer;
  DataAux : String;
  Chave: TChave_Rap;
  Resultado : TResultadoIntegracaoTRAPLOTE;
  PaisDestino :String;
begin
  Log('Integra TRAP_FORNECIMENTO_LOTE. ', Logar);
  Application.ProcessMessages;

  Resultado.Integrou := true;
  Resultado.Mensagem := '';
  try
    DeleteRapFornecimentoLote(Lista[0].CD_FORNECIMENTO);
    PaisDestino := BuscaPaisDestinoLote(Lista[0].CD_FORNECIMENTO);
    //só vou colocar a mensagem 1x.
    if Length(Lista) > 0 then
    begin
      SetLength(lResultadoProcessamento,Length(lResultadoProcessamento)+1);
      lResultadoProcessamento[Length(lResultadoProcessamento)-1].Tipo  := 'IL';
      lResultadoProcessamento[Length(lResultadoProcessamento)-1].Texto := Lista[0].CD_FORNECIMENTO;
      lResultadoProcessamento[Length(lResultadoProcessamento)-1].Titulo := 'Inclusão de Lote -  País de destino: ' +
                                                                            PaisDestino +
                                                                            ' Ordem: ' + Lista[0].CD_FORNECIMENTO;
    end;

    for I := 0 to Length(Lista)-1 do
    begin
      dmdBroker.qryTRAP_FORNECIMENTO_LOTE.close;
      dmdBroker.qryTRAP_FORNECIMENTO_LOTE.SQL.Text := GetSqlTRAP_FORNECIMENTO_LOTE;

      Chave := BuscaChaveRapFornecimento(Lista[i].CD_FORNECIMENTO,Lista[i].CD_SKU);
      if Chave.CD_RAP = '' then
        raise Exception.Create('RAP com ordem '+Lista[i].CD_FORNECIMENTO+' e SKU '+Lista[i].CD_SKU+' não encontrada.');

      dmdBroker.qryTRAP_FORNECIMENTO_LOTE.ParamByName('CD_RAP').Value          := Chave.CD_RAP;
      dmdBroker.qryTRAP_FORNECIMENTO_LOTE.ParamByName('CD_RAP_ANO').Value	     := Chave.CD_RAP_ANO;
      dmdBroker.qryTRAP_FORNECIMENTO_LOTE.ParamByName('CD_GRUPO').Value	       := GrupoNestle;
      dmdBroker.qryTRAP_FORNECIMENTO_LOTE.ParamByName('CD_FORNECIMENTO').Value := Lista[i].CD_FORNECIMENTO;
      dmdBroker.qryTRAP_FORNECIMENTO_LOTE.ParamByName('CHAVE_NOTA').Value	     := Lista[i].CHAVE_NOTA;
      dmdBroker.qryTRAP_FORNECIMENTO_LOTE.ParamByName('CD_DELIVERY').Value	   := Lista[i].CD_DELIVERY;
      dmdBroker.qryTRAP_FORNECIMENTO_LOTE.ParamByName('CD_LOTE').Value	       := Lista[i].CD_LOTE;
      dmdBroker.qryTRAP_FORNECIMENTO_LOTE.ParamByName('CD_SKU').Value	         := Lista[i].CD_SKU;

      DataAux := FormatarData(Lista[i].DT_FABRICACAO);
      if DataAux  = '' then
        dmdBroker.qryTRAP_FORNECIMENTO_LOTE.ParamByName('DT_FABRICACAO').Value := null
      else
        dmdBroker.qryTRAP_FORNECIMENTO_LOTE.ParamByName('DT_FABRICACAO').Value := DataAux;

      DataAux := FormatarData(Lista[i].DT_VENCIMENTO);
      if DataAux  = '' then
        dmdBroker.qryTRAP_FORNECIMENTO_LOTE.ParamByName('DT_VENCIMENTO').Value := null
      else
        dmdBroker.qryTRAP_FORNECIMENTO_LOTE.ParamByName('DT_VENCIMENTO').Value := DataAux;

      dmdBroker.qryTRAP_FORNECIMENTO_LOTE.ParamByName('QT_MERCADORIA').Value	 := StrToFloat(StringReplace(StringReplace(Lista[i].QT_MERCADORIA,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));

      dmdBroker.qryTRAP_FORNECIMENTO_LOTE.ParamByName('QT_PESO_LIQ').Value     := StrToFloat(StringReplace(StringReplace(Lista[i].QT_PESO_LIQ,
                                                                                        ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));

      dmdBroker.qryTRAP_FORNECIMENTO_LOTE.ParamByName('QT_PESO_BRUTO').Value   := StrToFloat(StringReplace(StringReplace(Lista[i].QT_PESO_BRUTO,
                                                                                        ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));

      dmdBroker.qryTRAP_FORNECIMENTO_LOTE.ExecSql;

      if (dmdBroker.qryTRAP_FORNECIMENTO_LOTE.RowsAffected > 0) and Resultado.Integrou then
        Resultado.Integrou := True
      else
        Resultado.Integrou := False;
    end;

    result := Resultado;

    except on e:Exception do
    begin
       Resultado.Integrou := False;
       Resultado.Mensagem := E.Message;
       Log('Erro ao inserir: TRAP_FORNECIMENTO_LOTE' + #13#10 + E.Message, Logar);
       result := Resultado;
    end;
  end;
end;

function TfrmMain.BuscaChaveRap : String;
var
  CD_RAP : String;
begin
  CD_RAP := '';

  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Text :=
       ' SELECT  REPLICATE(''0'',6 - LEN(CONVERT(VARCHAR(6),(ISNULL(MAX(CD_RAP),0) + 1)))) +    ' + sLineBreak +
       '          CONVERT(VARCHAR(6),(ISNULL(MAX(CD_RAP),0) + 1))    AS CD_RAP                  ' + sLineBreak +
       '   FROM MYINDAIA..TRAP (NOLOCK)                                                         ' + sLineBreak +
       '  WHERE CD_GRUPO   = '+QuotedStr(GrupoNestle)+'                                         ' + sLineBreak +
       '    AND CD_RAP_ANO = RIGHT(YEAR(GETDATE()),2)                                           ' + sLineBreak ;
  dmdBroker.qryBroker.open;

  if not dmdBroker.qryBroker.isEmpty then
  begin
    CD_RAP     := dmdBroker.qryBroker.FieldByName('CD_RAP').AsString;
  end;

  result := CD_RAP;
end;

function TfrmMain.BuscaRapJaCadastrada(Ordem : String) : TChave_Rap;
var
  chave : TChave_Rap;
begin
  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Text :=
       ' SELECT CD_RAP, CD_RAP_ANO                           ' + sLineBreak +
       '   FROM MYINDAIA..TRAP (NOLOCK)                      ' + sLineBreak +
       '  WHERE CD_GRUPO        = '+QuotedStr(GrupoNestle)     + sLineBreak +
       '    AND NR_FORNECIMENTO = '+QuotedStr(Trim(Ordem))     + sLineBreak ;
  dmdBroker.qryBroker.open;

  if not dmdBroker.qryBroker.isEmpty then
  begin
    chave.CD_RAP     := dmdBroker.qryBroker.FieldByName('CD_RAP').AsString;
    chave.CD_RAP_ANO := dmdBroker.qryBroker.FieldByName('CD_RAP_ANO').AsString;
  end
  else
  begin
    chave.CD_RAP     := '';
    chave.CD_RAP_ANO := '';
  end;

  result := chave;
end;
function TfrmMain.BuscaChaveRapFornecimento(Ordem, Produto : String) : TChave_Rap;
var
  chave : TChave_Rap;
begin
  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Text :=
       ' SELECT CD_RAP, CD_RAP_ANO                                    ' + sLineBreak +
       '   FROM MYINDAIA..TRAP_FORNECIMENTO (NOLOCK)                  ' + sLineBreak +
       '  WHERE CD_GRUPO        = '+QuotedStr(GrupoNestle)              + sLineBreak +
       '    AND CD_FORNECIMENTO = '+QuotedStr(Trim(Ordem))              + sLineBreak +
       '    AND CD_MERCADORIA   = '+QuotedStr(Trim(Produto))            + sLineBreak ;

  dmdBroker.qryBroker.open;

  if not dmdBroker.qryBroker.isEmpty then
  begin
    chave.CD_RAP     := dmdBroker.qryBroker.FieldByName('CD_RAP').AsString;
    chave.CD_RAP_ANO := dmdBroker.qryBroker.FieldByName('CD_RAP_ANO').AsString;
  end;

  result := chave;
end;

procedure TfrmMain.DeleteRapFornecimento(Ordem : String; chave:TChave_Rap);
begin
  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Text :=
       ' DELETE MYINDAIA..TRAP_FORNECIMENTO                           ' + sLineBreak +
       '   FROM MYINDAIA..TRAP_FORNECIMENTO (NOLOCK)                  ' + sLineBreak +
       '  WHERE CD_GRUPO        = '+QuotedStr(GrupoNestle)              + sLineBreak +
       '    AND CD_FORNECIMENTO = '+QuotedStr(Trim(Ordem))              + sLineBreak +
       '    AND CD_RAP          = '+QuotedStr(Trim(chave.CD_RAP))       + sLineBreak +
       '    AND CD_RAP_ANO      = '+QuotedStr(Trim(chave.CD_RAP_ANO))   + sLineBreak ;
  dmdBroker.qryBroker.ExecSql;
end;

procedure TfrmMain.DeleteRapFornecimentoLote(Ordem : String);
begin
  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Text :=
       ' DELETE TRAP_FORNECIMENTO_LOTE             ' + sLineBreak +
       '   FROM TRAP_FORNECIMENTO_LOTE (NOLOCK)    ' + sLineBreak +
       '  WHERE CD_GRUPO        = '+QuotedStr(GrupoNestle)     + sLineBreak +
       '    AND CD_FORNECIMENTO = '+QuotedStr(Trim(Ordem))     + sLineBreak ;
  dmdBroker.qryBroker.ExecSql;
end;

function TfrmMain.CarregaCodEmpresa(ordem, pais, campo, CNPJ : String; enviaEmail : boolean) : String;
var
  CD_EMPRESA : String;
begin
  CD_EMPRESA := '';
  if not (trim(CNPJ) = '') then
  begin
    dmdBroker.qryBroker.close;
    dmdBroker.qryBroker.SQL.Text :=  ' SELECT CD_EMPRESA                          ' + sLineBreak +
                                     '   FROM TEMPRESA_NAC (NOLOCK)               ' + sLineBreak +
                                     '  WHERE IN_ATIVO = ''1''                    ' + sLineBreak +
                                     '    AND CGC_EMPRESA = '+QuotedStr(CNPJ)       + sLineBreak ;
    dmdBroker.qryBroker.open;
    if not dmdBroker.qryBroker.isEmpty then
    begin
      CD_EMPRESA := dmdBroker.qryBroker.FieldByName('CD_EMPRESA').AsString;
    end;
  end
  else
  begin
    if enviaEmail then
    if Email_Atendente <> '' then
      EnviarEmail('Integração Nestle - '+campo+' Não Informado: ' + pais ,
                  'O fabricante não foi informado na ordem '+ ordem + '.'+ '<br>'
                  ,Email_Atendente);

    Log('Fabricante não informado' , Logar);
  end;

  result := CD_EMPRESA;
end;

function TfrmMain.InsereCarregaCodEmpresa(Codigo, Nome, Endereco, Comp_Endereco, Pais, CNPJ, NrOrdem, CampoOrigem : String) : String;
var
  Codigo_Cliente, CodigoPais : String;
  function CarregaCodigoCliente(CodCliente : String) : String;
  var
    cod : String;
  begin
    cod := '';

    dmdBroker.qryBroker.close;
    dmdBroker.qryBroker.SQL.Text := ' SELECT EE.CD_EMPRESA                                                      ' + sLineBreak +
                                    '   FROM TEMPRESA_EST       EE  (NOLOCK)                                    ' + sLineBreak +
                                    '   JOIN TEMPRESA_EST_GRUPO EEG (NOLOCK) ON EEG.CD_EMPRESA = EE.CD_EMPRESA  ' + sLineBreak +
                                    '  WHERE IN_ATIVO = ''1''                                                   ' + sLineBreak +
                                    '    AND EEG.CD_GRUPO = '+QuotedStr(GrupoNestle)                              + sLineBreak +
                                    '    AND ISNULL(EE.CD_EMPRESA, '''') <> ''''                                ' + sLineBreak +
                                    '    AND EE.NR_CLIENTE= '+QuotedStr(CodCliente)+'                           ' + sLineBreak ;
    dmdBroker.qryBroker.open;
    if not dmdBroker.qryBroker.isEmpty then
    begin
      cod  := dmdBroker.qryBroker.FieldByName('CD_EMPRESA').AsString;
    end;

    result := cod;
 end;
begin
  Codigo_Cliente := '';

  if not (Codigo = '') then
  begin
    Codigo_Cliente := CarregaCodigoCliente(Codigo);

    if Codigo_Cliente = '' then
    begin
      CodigoPais := '';
      if Pais <> '' then
        CodigoPais := CarregaCodigoPais(Pais, NrOrdem, 'Pais - ' + CampoOrigem );

      if CodigoPais = 'NÃO ENCONTRADO' then
        raise Exception.Create('Pais não encontrado. Necessario efetuar o cadastro. ' + slinebreak +
                               'Pais - ' + CampoOrigem + ' :'  + Pais )
      else
      begin
        dmdBroker.qryBroker.close;
        dmdBroker.qryBroker.SQL.Text := 'DECLARE @ULTIMO_CODIGO INTEGER                                         ' + sLineBreak +
                                        '    SET @ULTIMO_CODIGO = (SELECT ISNULL(MAX(EE.CD_EMPRESA),0)+1 ULTIMO ' + sLineBreak +
                                        '                            FROM  TEMPRESA_EST EE (NOLOCK))            ' + sLineBreak +
                                        '    INSERT INTO  TEMPRESA_EST  (CD_EMPRESA,                            ' + sLineBreak +
                                        '                                NM_EMPRESA,                            ' + sLineBreak +
                                        '                                AP_EMPRESA,                            ' + sLineBreak +
                                        '                                END_EMPRESA,                           ' + sLineBreak +
                                        '                                END_COMPL,                             ' + sLineBreak +
                                        '                                CD_PAIS,                               ' + sLineBreak +
                                        '                                DT_INCLUSAO,                           ' + sLineBreak +
                                        '                                IN_ATIVO,                              ' + sLineBreak +
                                        '                                IN_AGENTE,                             ' + sLineBreak +
                                        '                                IN_BANCO,                              ' + sLineBreak +
                                        '                                IN_IMPORTADOR,                         ' + sLineBreak +
                                        '                                IN_SEGURADORA,                         ' + sLineBreak +
                                        '                                IN_EXPORTADOR,                         ' + sLineBreak +
                                        '                                NR_CLIENTE,                            ' + sLineBreak +
                                        '                                CGC_EMPRESA,                           ' + sLineBreak +
                                        '                                IN_PO_TRANS,                           ' + sLineBreak +
                                        '                                IN_DECLARACAO_DETENTOR)                ' + sLineBreak +
                                        '    VALUES                                                             ' + sLineBreak +
                                        '    ( @ULTIMO_CODIGO                                                   ' + sLineBreak +
                                        '     ,'+QuotedStr(Nome)+'                                              ' + sLineBreak +
                                        '     ,SUBSTRING('+QuotedStr(Nome)+',1,10)                              ' + sLineBreak +
                                        '     ,'+QuotedStr(Endereco)+'                                          ' + sLineBreak +
                                        '     ,'+QuotedStr(COPY(Comp_Endereco,1,41))+'                          ' + sLineBreak +
                                        '     ,'+QuotedStr(CodigoPais)+'                                        ' + sLineBreak +
                                        '     ,GETDATE()                                                        ' + sLineBreak +
                                        '     ,''1''                                                            ' + sLineBreak +
                                        '     ,''0''                                                            ' + sLineBreak +
                                        '     ,''0''                                                            ' + sLineBreak +
                                        '     ,''1''                                                            ' + sLineBreak +
                                        '     ,''0''                                                            ' + sLineBreak +
                                        '     ,''1''                                                            ' + sLineBreak +
                                        '     ,'+QuotedStr(Codigo)+'                                            ' + sLineBreak +
                                        '     ,'+QuotedStr(CNPJ)+'                                              ' + sLineBreak +
                                        '     ,''0''                                                            ' + sLineBreak +
                                        '     ,''0'')                                                           ' + sLineBreak +
                                        '                                                                       ' + sLineBreak +
                                        '  INSERT INTO TEMPRESA_EST_GRUPO (CD_EMPRESA , CD_GRUPO)               ' + sLineBreak +
                                        '  VALUES (@ULTIMO_CODIGO,  '+ QuotedStr(GrupoNestle) +')               ' + sLineBreak ;

        dmdBroker.qryBroker.ExecSql;
        if dmdBroker.qryBroker.RowsAffected > 0  then
          Codigo_Cliente := CarregaCodigoCliente(Codigo);
      end;

      result := Codigo_Cliente;
    end
    else
      result := Codigo_Cliente;
  end;

end;

function TfrmMain.CarregarCodViaTransporte(Descricao : String) : String;
var
  CD_VIA_TRANSPORTE : String;
begin
  CD_VIA_TRANSPORTE := '';

  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Text :=  ' SELECT CD_VIA_TRANSP                                           ' + sLineBreak +
                                   '   FROM TVIA_TRANSP_BROKER (NOLOCK)                             ' + sLineBreak +
                                   '  WHERE UPPER(NM_VIA_TRANSP) = UPPER('+QuotedStr(Descricao)+ ') ' + sLineBreak ;
  dmdBroker.qryBroker.open;

  if not dmdBroker.qryBroker.isEmpty then
  begin
    CD_VIA_TRANSPORTE     := dmdBroker.qryBroker.FieldByName('CD_VIA_TRANSP').AsString;
  end;

  result := CD_VIA_TRANSPORTE;
end;

function TfrmMain.CarregarCodLocalEmbarque(Descricao : String) : String;
var
  CD_LOCAL_EMBARQUE : String;
begin
  CD_LOCAL_EMBARQUE := '';

  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Text :=  ' SELECT CODIGO                                              ' + sLineBreak +
                                   '   FROM TLOCAL_EMBARQUE (NOLOCK)                            ' + sLineBreak +
                                   '  WHERE UPPER(DESCRICAO) = UPPER('+QuotedStr(Descricao)+ ') ' + sLineBreak ;
  dmdBroker.qryBroker.open;

  if not dmdBroker.qryBroker.isEmpty then
  begin
    CD_LOCAL_EMBARQUE     := dmdBroker.qryBroker.FieldByName('CODIGO').AsString;
  end;

  result := CD_LOCAL_EMBARQUE;
end;

function TfrmMain.CarregaCodigoPais(Nm_Pais ,Ordem, Campo : String; enviaEmail : Boolean = true) : String;
var
  cod : String;
begin
  if trim(Nm_Pais) = '' then
    cod := 'NÃO ENCONTRADO'
  else
  begin
    cod := cod;
    dmdBroker.qryBroker.close;
    dmdBroker.qryBroker.SQL.Text := ' SELECT CD_PAIS                                            '+sLineBreak+
                                    '   FROM TPAIS_BROKER (NOLOCK)                              '+sLineBreak+
                                    '  WHERE UPPER(NM_PAIS)      = UPPER('+QuotedStr(Nm_Pais)+') '+sLineBreak+
                                    '     OR UPPER(NM_PAIS_PORT) = UPPER('+QuotedStr(Nm_Pais)+') '+sLineBreak+
                                    '     OR UPPER(NM_PAIS_ING)  = UPPER('+QuotedStr(Nm_Pais)+') ';
    dmdBroker.qryBroker.open;
    if not dmdBroker.qryBroker.isEmpty then
    begin
      cod  := dmdBroker.qryBroker.FieldByName('CD_PAIS').AsString;
    end
    else
    begin
      if enviaEmail then
      if Email_Atendente <> '' then
        EnviarEmail('Integração Nestle - País Não Encontrado: ' + Nm_Pais ,
                    'O país '+ Nm_Pais + ' não foi encontrado no MyIndaia.'+ '<br>'+
                    'Faça o cadastro em Cadastros > País.'  + '<br>'+  '<br>'+
                    'Ordem : ' + Ordem + '<br>'+
                    'Campo : ' + Campo + '<br>'
                    ,Email_Atendente);

      Log('País Não Encontrado: '+ Nm_Pais , Logar);
    end;
  end;

  result := cod;
end;

function TfrmMain.CarregaCodigoUnidadeMedida(Descricao : String) : String;
var
  cod : String;
begin
  cod := '';
  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Text := ' SELECT CD_UNID_MEDIDA                                    '+sLineBreak+
                                  '   FROM TUNID_MEDIDA_BROKER (NOLOCK)                      '+sLineBreak+
                                  '  WHERE UPPER(NM_UNID_MEDIDA) = UPPER('+QuotedStr(Descricao)+')';
  dmdBroker.qryBroker.open;
  if not dmdBroker.qryBroker.isEmpty then
  begin
    cod  := dmdBroker.qryBroker.FieldByName('CD_UNID_MEDIDA').AsString;
  end;

  result := cod;
end;

function TfrmMain.CarregaCodigoArea(CodMercadoria: String): String;
var
  cod : String;
begin
  cod := '';
  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Text :=
    'SELECT ISNULL(M.CD_AREA,''58'') AS CD_AREA '+sLineBreak+
    'FROM BROKER.DBO.TMERCADORIA M (NOLOCK) '+sLineBreak+
    'WHERE CD_GRUPO = ''155'' AND CD_MERCADORIA = :SKU ';
  dmdBroker.qryBroker.paramByName('SKU').AsString := CodMercadoria;
  dmdBroker.qryBroker.open;
  if not dmdBroker.qryBroker.isEmpty then
  begin
    cod  := dmdBroker.qryBroker.FieldByName('CD_AREA').AsString;
  end;
  dmdBroker.qryBroker.close;
  result := cod;
end;

function TfrmMain.CarregaCodigoMoeda(Nm_Moeda : String) : String;
var
  cod : String;
begin
  cod := '';
  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Text := ' SELECT CD_MOEDA                                        '+sLineBreak+
                                  '   FROM TMOEDA_BROKER (NOLOCK)                          '+sLineBreak+
                                  '  WHERE UPPER(AP_MOEDA) = UPPER('+QuotedStr(Nm_Moeda)+')';
  dmdBroker.qryBroker.open;
  if not dmdBroker.qryBroker.isEmpty then
  begin
    cod  := dmdBroker.qryBroker.FieldByName('CD_MOEDA').AsString;
  end;

  result := cod;
end;

function TfrmMain.InsereCarregaCodigoTermoPgmto(CodExportador, Termo : String) : String;
var
  codigoTermoPagamento : String;
  function CarregaCodigoPgmto(Cod_Exp, Tx_Termo : String) :String;
  var
    cod : String;
  begin
    cod := '';
    dmdBroker.qryBroker.close;
    dmdBroker.qryBroker.SQL.Text :=
     ' SELECT CD_TERMO_PAGTO                                                      ' + sLineBreak +
     '   FROM TTERMO_PAGTO (NOLOCK)                                               ' + sLineBreak +
     '  WHERE CD_EXPORTADOR = '+QuotedStr(Cod_Exp)                                  + sLineBreak +
     '    AND UPPER(LTRIM(RTRIM(CONVERT(VARCHAR(50),TX_TERMO_PORT )))) =          ' + sLineBreak +
     '        UPPER(LTRIM(RTRIM(CONVERT(VARCHAR(50),' + QuotedStr(Tx_Termo)+ '))))' + sLineBreak ;

    dmdBroker.qryBroker.open;
    if not dmdBroker.qryBroker.isEmpty then
    begin
      cod  := dmdBroker.qryBroker.FieldByName('CD_TERMO_PAGTO').AsString;
    end;

    result := cod;
 end;
begin
  codigoTermoPagamento := CarregaCodigoPgmto(CodExportador, Termo);

  if codigoTermoPagamento = '' then
  begin

    dmdBroker.qryBroker.close;
    dmdBroker.qryBroker.SQL.Text :=
    'DECLARE @ULTIMO_CODIGO VARCHAR(6)                                                                    ' + sLineBreak +
    '    SET @ULTIMO_CODIGO = (SELECT REPLICATE(''0'', 6 - LEN(ISNULL(MAX(TP.CD_TERMO_PAGTO),0)+1))+      ' + sLineBreak +
    '                                 CAST(ISNULL(MAX(TP.CD_TERMO_PAGTO),0)+1 AS VARCHAR(6))  AS ULTIMO   ' + sLineBreak +
    '                            FROM TTERMO_PAGTO TP (NOLOCK))                                           ' + sLineBreak +
    '  INSERT INTO TTERMO_PAGTO(                                                                          ' + sLineBreak +
    '              CD_TERMO_PAGTO,                                                                        ' + sLineBreak +
    '              NM_TERMO_PAGTO,                                                                        ' + sLineBreak +
    '              CD_EXPORTADOR,                                                                         ' + sLineBreak +
    '              TX_TERMO_PORT,                                                                         ' + sLineBreak +
    '              IN_ATIVO)                                                                              ' + sLineBreak +
    '        VALUES                                                                                       ' + sLineBreak +
    '        ( @ULTIMO_CODIGO                                                                             ' + sLineBreak +
    '        , SUBSTRING('+QuotedStr(Termo)+' ,1,50)                                                      ' + sLineBreak +
    '        ,'+QuotedStr(CodExportador)                                                                    + sLineBreak +
    '        ,'+QuotedStr(Termo)                                                                            + sLineBreak +
    '        ,''1'' )                                                                                     ' + sLineBreak +
    '                                                                                                     ' + sLineBreak +
    '  INSERT INTO MYINDAIA..TTERMO_PAGTO(                                                                ' + sLineBreak +
    '              CD_TERMO_PAGTO,                                                                        ' + sLineBreak +
    '              NM_TERMO_PAGTO,                                                                        ' + sLineBreak +
    '              CD_EXPORTADOR)                                                                         ' + sLineBreak +
    '        VALUES                                                                                       ' + sLineBreak +
    '        ( @ULTIMO_CODIGO                                                                             ' + sLineBreak +
    '        , SUBSTRING('+QuotedStr(Termo)+' ,1,50)                                                      ' + sLineBreak +
    '        ,'+QuotedStr(CodExportador) +' )                                                             ' + sLineBreak ;

    dmdBroker.qryBroker.ExecSql;
    if dmdBroker.qryBroker.RowsAffected > 0  then
      codigoTermoPagamento := CarregaCodigoPgmto(CodExportador, Termo);

    result := codigoTermoPagamento;
  end
  else
    result := codigoTermoPagamento;
end;

function TfrmMain.InsereCarregaCodMercadoriaEXPO(Codigo, Descricao_Por,Descricao_Esp,
     Descricao_Ing, NCM, UnidadeMedida, ordem : String) : Boolean;
Var
  NCM_Gravado,COD_UNIDADE_MEDIDA : String;
begin
  NCM_Gravado := '';
  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Text :=
           ' SELECT CD_MERCADORIA,                                                       ' + sLineBreak +
           '        CD_NCM_SH                                                            ' + sLineBreak +
           '   FROM TMERCADORIA_EXP (NOLOCK)                                             ' + sLineBreak +
           '  WHERE LTRIM(RTRIM(CD_MERCADORIA)) = LTRIM(RTRIM('+QuotedStr(Codigo)+'))    ' + sLineBreak +
           '    AND CD_GRUPO = ' + QuotedStr(GrupoNestle)                                  + sLineBreak ;

  dmdBroker.qryBroker.open;

  if not dmdBroker.qryBroker.isEmpty then  //existe!
  begin
    NCM_Gravado  := dmdBroker.qryBroker.FieldByName('CD_NCM_SH').AsString;

    if NCM_Gravado <> NCM then
    begin
      if Email_Atendente <> '' then
        EnviarEmail('Integração Nestle - Erro ao cadastrar mercadoria',
                    'A Mercadoria '+ Codigo + ' ' + Descricao_Por + ' já existe com NCM diferente.' +'<br>'+
                    'NCM Atual : ' + NCM_Gravado +'<br>'+
                    'NCM Novo  : ' + NCM + '<br>' + '<br>'+
                    'Ordem : ' + Ordem + '<br>'
                    ,Email_Atendente);

      Log('Mercadoria '+ Codigo + ' ja existe com NCM diferente.', Logar);
      result := false;
    end
    else //se for igual, continua
      result := true;
  end
  else
  begin // se não existir, insere
    COD_UNIDADE_MEDIDA := CarregaCodigoUnidadeMedida(UnidadeMedida);
    dmdBroker.qryBroker.close;
    dmdBroker.qryBroker.SQL.Text := '    INSERT INTO  TMERCADORIA_EXP ( CD_MERCADORIA,                                     ' + sLineBreak +
                                    '                                   AP_MERCADORIA,                                     ' + sLineBreak +
                                    '                                   NM_MERCADORIA,                                     ' + sLineBreak +
                                    '                                   TX_DESC_INGLES,                                    ' + sLineBreak +
                                    '                                   TX_DESC_ESP,                                       ' + sLineBreak +
                                    '                                   CD_NCM_SH,                                         ' + sLineBreak +
                                    '                                   CD_UN_MED_COMERC,                                  ' + sLineBreak +
                                    '                                   CD_GRUPO                                           ' + sLineBreak +
                                    '                                 )                                                    ' + sLineBreak +
                                    '                      VALUES      ('+QuotedStr(Codigo)                             +',' + sLineBreak +
                                    '                                   SUBSTRING('+QuotedStr(Descricao_Por)+',1,40),'  +      sLineBreak +
                                    '                                   '+QuotedStr(Descricao_Por)                      +',' + sLineBreak +
                                    '                                   '+QuotedStr(Descricao_Ing)                      +',' + sLineBreak +
                                    '                                   '+QuotedStr(Descricao_Esp)                      +',' + sLineBreak +
                                    '                                   '+QuotedStr(NCM)                                +',' + sLineBreak +
                                    '                                   '+QuotedStr(COD_UNIDADE_MEDIDA)                      +',' + sLineBreak +
                                    '                                   '+QuotedStr(GrupoNestle)+ ')'                        + sLineBreak ;

    dmdBroker.qryBroker.ExecSql;
    if dmdBroker.qryBroker.RowsAffected > 0  then
    begin
    //---> Enviar email para o usuario informando que inseriu.
      if Email_Atendente <> '' then
        EnviarEmail('Integração Nestle - Mercadoria Cadastrada',
                    'A Mercadoria '+ Codigo + ' ' + Descricao_Por + ' foi cadastrada.' +'<br>' + '<br>'+
                    'NCM : ' + NCM + '<br>'+
                    'Ordem : ' + Ordem + '<br>'
                    ,Email_Atendente + ';' + Email_Nestle_Analistas);

      Log('Mercadoria '+ Codigo + ' incluida.', Logar);
      result := true;
    end
    else
    begin
      //---> erro!
      Log('Erro ao incluir mercadoria '+ Codigo + '.', Logar);
      result := false;
    end;
  end;
end;

function TfrmMain.FormatarData(data : String) : String;
var
  dataFinal : String;
begin
  result := '';
  if trim(data) <> '' then
  begin
    dataFinal := Copy(data, 9, 2) + '/' + Copy(data, 6, 2) + '/' + Copy(data, 1, 4);
    result    := dataFinal;
  end;
end;

function TfrmMain.BuscaEmailAtendente(CNPJ, Produto : String) :String;
begin
  result := '';
  if trim(CNPJ) <> '' then
  begin
    dmdBroker.qryBroker.close;
    dmdBroker.qryBroker.Sql.Text :=
    'SELECT I.NM_EMAIL                                                             ' + sLineBreak +
    '  FROM TEMPRESA_NAC         A WITH(NOLOCK)                                    ' + sLineBreak +
    '  JOIN TCLIENTE_HABILITACAO B WITH(NOLOCK) ON B.CD_CLIENTE   = A.CD_EMPRESA   ' + sLineBreak +
    '  JOIN TUSUARIO             I WITH(NOLOCK) ON I.CD_USUARIO   = B.CD_ATENDENTE ' + sLineBreak +
    ' WHERE B.CD_PRODUTO  = ' + QuotedStr(Produto)                                   + sLineBreak +
    '   AND A.CGC_EMPRESA = ' + QuotedStr(CNPJ)                                      + sLineBreak ;
    dmdBroker.qryBroker.open;

    if not dmdBroker.qryBroker.IsEmpty then
    begin
      result := dmdBroker.qryBroker.fieldByName('NM_EMAIL').asString;
    end;
  end;
end;

function TfrmMain.BuscaEmailAtendenteFornecimento(Fornecimento : String) :String;
begin
  result := '';
  if not (trim(fornecimento) = '') then
  begin
    dmdBroker.qryBroker.close;
    dmdBroker.qryBroker.Sql.Text :=
    'SELECT TOP 1 I.NM_EMAIL                                                          ' + sLineBreak +
    '  FROM MYINDAIA..TRAP       R WITH(NOLOCK)                                       ' + sLineBreak +
    '  JOIN TEMPRESA_NAC         A WITH(NOLOCK) ON A.CD_EMPRESA   = R.CD_EXPORTADOR   ' + sLineBreak +
    '  JOIN TCLIENTE_HABILITACAO B WITH(NOLOCK) ON B.CD_CLIENTE   = A.CD_EMPRESA      ' + sLineBreak +
    '                                          AND B.CD_PRODUTO  = ''02''             ' + sLineBreak +
    '  JOIN TUSUARIO             I WITH(NOLOCK) ON I.CD_USUARIO   = B.CD_ATENDENTE    ' + sLineBreak +
    ' WHERE R.NR_FORNECIMENTO = ' + QuotedStr(Fornecimento)                             + sLineBreak ;

    dmdBroker.qryBroker.open;

    if not dmdBroker.qryBroker.IsEmpty then
    begin
      result := dmdBroker.qryBroker.fieldByName('NM_EMAIL').asString;
    end;
  end;
end;

function TFrmMain.GetSQLTRap(Tipo : String) : String;
var
  Sql: String;
begin
  if Tipo = 'I' then
    Sql :=  '  INSERT INTO MYINDAIA..TRAP (              ' + sLineBreak +
            '        CD_RAP                              ' + sLineBreak +
            '       ,CD_RAP_ANO                          ' + sLineBreak +
            '       ,CD_STATUS                           ' + sLineBreak +
            '       ,IN_RAP_VALIDA                       ' + sLineBreak +
            '       ,IN_FORN_VALIDA                      ' + sLineBreak +
            '       ,IN_PACK_VALIDA                      ' + sLineBreak +
            '       ,TX_VALIDACAO                        ' + sLineBreak +
            '       ,CD_USUARIO_CRIADOR                  ' + sLineBreak +
            '       ,DT_INSERCAO                         ' + sLineBreak +
            '       ,CD_EXPORTADOR                       ' + sLineBreak +
            '       ,CD_FABRICANTE                       ' + sLineBreak +
            '       ,CD_CLIENTE                          ' + sLineBreak +
            '       ,CD_PAIS                             ' + sLineBreak +
            '       ,CD_TERMO_PAGTO                      ' + sLineBreak +
            '       ,CD_INCOTERM                         ' + sLineBreak +
            '       ,CD_MOEDA_MLE                        ' + sLineBreak +
            '       ,CD_VIA_TRANSPORTE                   ' + sLineBreak +
            '       ,CD_LOCAL_ORIGEM                     ' + sLineBreak +
            '       ,CD_LOCAL_DESTINO                    ' + sLineBreak +
            '       ,CD_CONSIGNATARIO                    ' + sLineBreak +
            '       ,CD_NOTIFY                           ' + sLineBreak +
            '       ,CD_BANCO                            ' + sLineBreak +
            '       ,NR_FORNECIMENTO                     ' + sLineBreak +
            '       ,NR_PEDIDO                           ' + sLineBreak +
            '       ,DT_PREV_SAIDA                       ' + sLineBreak +
            '       ,VL_MLE                              ' + sLineBreak +
            '       ,VL_SEGURO                           ' + sLineBreak +
            '       ,VL_FRETE_INT                        ' + sLineBreak +
            '       ,VL_PESO_BRUTO                       ' + sLineBreak +
            '       ,VL_PESO_LIQ                         ' + sLineBreak +
            '       ,VL_CUBAGEM                          ' + sLineBreak +
            '       ,TX_EMBALAGEM                        ' + sLineBreak +
            '       ,TX_MARCACAO                         ' + sLineBreak +
            '       ,TX_INST_EMB                         ' + sLineBreak +
            '       ,CD_GRUPO                            ' + sLineBreak +
            '       ,DT_PREV_EMBARQUE                    ' + sLineBreak +
            '       ,CD_STATUS_DOCTO                     ' + sLineBreak +
            '       ,IN_RAP_VALIDA_DOCTO                 ' + sLineBreak +
            '       ,IN_FABR_EXPO                        ' + sLineBreak +
            '       ,IN_INSPECAO                         ' + sLineBreak +
            '       ,IN_PERMISSO                         ' + sLineBreak +
            '       ,IN_EXPURGO                          ' + sLineBreak +
            '       ,IN_PALLET_EXPURGO                   ' + sLineBreak +
            '       ,IN_DECL_EMBALAGEM                   ' + sLineBreak +
            '       ,IN_CONSULADO                        ' + sLineBreak +
            '       ,IN_TRIANGULACAO                     ' + sLineBreak +
            '       ,IN_CARTA_CREDITO                    ' + sLineBreak +
            '       ,IN_CADIVI                           ' + sLineBreak +
            '       ,IN_AMOSTRA                          ' + sLineBreak +
            '       ,IN_ANTECIPADO                       ' + sLineBreak +
            '       ,IN_EMAIL_ERRO                       ' + sLineBreak +
            '       ,TP_DRAWBACK                         ' + sLineBreak +
            '       ,TP_NOTIFY                           ' + sLineBreak +
            '       ,TP_CONSIGNEE                        ' + sLineBreak +
            '       ,VL_ACRESCIMO                        ' + sLineBreak +
            '       ,VL_DESCONTO                         ' + sLineBreak +
            '       ,IN_PEDIDO_VALIDA                    ' + sLineBreak +
            '       ,IN_COURRIER                         ' + sLineBreak +
            '       ,IN_MODELO                           ' + sLineBreak +
            '       ,IN_SEM_PACK_LIST                    ' + sLineBreak +
            '       ,DT_FECHAMENTO                       ' + sLineBreak +
            '       ,DT_FINALIZADO_PEDIDO                ' + sLineBreak +
            '       ,TX_OBS                              ' + sLineBreak +
            ' )                                          ' + sLineBreak +
            ' VALUES (                                   ' + sLineBreak +
            '         :CD_RAP                    	       ' + sLineBreak +
            '       , :CD_RAP_ANO                        ' + sLineBreak +
            '       , :CD_STATUS                         ' + sLineBreak +
            '       , :IN_RAP_VALIDA                     ' + sLineBreak +
            '       , :IN_FORN_VALIDA                    ' + sLineBreak +
            '       , :IN_PACK_VALIDA                    ' + sLineBreak +
            '       , :TX_VALIDACAO                      ' + sLineBreak +
            '       , :CD_USUARIO_CRIADOR                ' + sLineBreak +
            '       , :DT_INSERCAO                       ' + sLineBreak +
            '       , :CD_EXPORTADOR                     ' + sLineBreak +
            '       , :CD_FABRICANTE                     ' + sLineBreak +
            '       , :CD_CLIENTE                        ' + sLineBreak +
            '       , :CD_PAIS                           ' + sLineBreak +
            '       , :CD_TERMO_PAGTO                    ' + sLineBreak +
            '       , :CD_INCOTERM                       ' + sLineBreak +
            '       , :CD_MOEDA_MLE                      ' + sLineBreak +
            '       , :CD_VIA_TRANSPORTE                 ' + sLineBreak +
            '       , :CD_LOCAL_ORIGEM                   ' + sLineBreak +
            '       , :CD_LOCAL_DESTINO                  ' + sLineBreak +
            '       , :CD_CONSIGNATARIO                  ' + sLineBreak +
            '       , :CD_NOTIFY                         ' + sLineBreak +
            '       , :CD_BANCO                          ' + sLineBreak +
            '       , :NR_FORNECIMENTO                   ' + sLineBreak +
            '       , :NR_PEDIDO                         ' + sLineBreak +
            '       , :DT_PREV_SAIDA                     ' + sLineBreak +
            '       , :VL_MLE                            ' + sLineBreak +
            '       , :VL_SEGURO                         ' + sLineBreak +
            '       , :VL_FRETE_INT                      ' + sLineBreak +
            '       , :VL_PESO_BRUTO                     ' + sLineBreak +
            '       , :VL_PESO_LIQ                       ' + sLineBreak +
            '       , :VL_CUBAGEM                        ' + sLineBreak +
            '       , :TX_EMBALAGEM                      ' + sLineBreak +
            '       , :TX_MARCACAO                       ' + sLineBreak +
            '       , :TX_INST_EMB                       ' + sLineBreak +
            '       , :CD_GRUPO                          ' + sLineBreak +
            '       , :DT_PREV_EMBARQUE                  ' + sLineBreak +
            '       , :CD_STATUS_DOCTO                   ' + sLineBreak +
            '       , :IN_RAP_VALIDA_DOCTO               ' + sLineBreak +
            '       , :IN_FABR_EXPO                      ' + sLineBreak +
            '       , :IN_INSPECAO                       ' + sLineBreak +
            '       , :IN_PERMISSO                       ' + sLineBreak +
            '       , :IN_EXPURGO                        ' + sLineBreak +
            '       , :IN_PALLET_EXPURGO                 ' + sLineBreak +
            '       , :IN_DECL_EMBALAGEM                 ' + sLineBreak +
            '       , :IN_CONSULADO                      ' + sLineBreak +
            '       , :IN_TRIANGULACAO                   ' + sLineBreak +
            '       , :IN_CARTA_CREDITO                  ' + sLineBreak +
            '       , :IN_CADIVI                         ' + sLineBreak +
            '       , :IN_AMOSTRA                        ' + sLineBreak +
            '       , :IN_ANTECIPADO                     ' + sLineBreak +
            '       , :IN_EMAIL_ERRO                     ' + sLineBreak +
            '       , :TP_DRAWBACK                       ' + sLineBreak +
            '       , :TP_NOTIFY                         ' + sLineBreak +
            '       , :TP_CONSIGNEE                      ' + sLineBreak +
            '       , :VL_ACRESCIMO                      ' + sLineBreak +
            '       , :VL_DESCONTO                       ' + sLineBreak +
            '       , :IN_PEDIDO_VALIDA                  ' + sLineBreak +
            '       , :IN_COURRIER                       ' + sLineBreak +
            '       , :IN_MODELO                         ' + sLineBreak +
            '       , :IN_SEM_PACK_LIST                  ' + sLineBreak +
            '       , :DT_FECHAMENTO                     ' + sLineBreak +
            '       , :DT_FINALIZADO_PEDIDO              ' + sLineBreak +
            '       , :TX_OBS                            ' + sLineBreak +
            '   )                                        ' + sLineBreak
  else
    Sql :=
     ' UPDATE MYINDAIA..TRAP                                            ' + sLineBreak +
     '    SET  CD_STATUS              = ISNULL(CD_STATUS, :CD_STATUS )  ' + sLineBreak +
     '        ,IN_RAP_VALIDA          = :IN_RAP_VALIDA                  ' + sLineBreak +
     '        ,IN_FORN_VALIDA         = :IN_FORN_VALIDA                 ' + sLineBreak +
     '        ,IN_PACK_VALIDA         = :IN_PACK_VALIDA                 ' + sLineBreak +
     '        ,TX_VALIDACAO           = :TX_VALIDACAO                   ' + sLineBreak +
     '        ,CD_USUARIO_CRIADOR     = :CD_USUARIO_CRIADOR             ' + sLineBreak +
     '        ,DT_INSERCAO            = :DT_INSERCAO                    ' + sLineBreak +
     '        ,CD_EXPORTADOR          = :CD_EXPORTADOR                  ' + sLineBreak +
     '        ,CD_FABRICANTE          = :CD_FABRICANTE                  ' + sLineBreak +
     '        ,CD_CLIENTE             = :CD_CLIENTE                     ' + sLineBreak +
     '        ,CD_PAIS                = :CD_PAIS                        ' + sLineBreak +
     '        ,CD_TERMO_PAGTO         = :CD_TERMO_PAGTO                 ' + sLineBreak +
     '        ,CD_INCOTERM            = :CD_INCOTERM                    ' + sLineBreak +
     '        ,CD_MOEDA_MLE           = :CD_MOEDA_MLE                   ' + sLineBreak +
     '        ,CD_VIA_TRANSPORTE      = :CD_VIA_TRANSPORTE              ' + sLineBreak +
     '        ,CD_LOCAL_ORIGEM        = :CD_LOCAL_ORIGEM                ' + sLineBreak +
     '        ,CD_LOCAL_DESTINO       = :CD_LOCAL_DESTINO               ' + sLineBreak +
     '        ,CD_CONSIGNATARIO       = :CD_CONSIGNATARIO               ' + sLineBreak +
     '        ,CD_NOTIFY              = :CD_NOTIFY                      ' + sLineBreak +
     '        ,CD_BANCO               = :CD_BANCO                       ' + sLineBreak +
     '        ,NR_FORNECIMENTO        = :NR_FORNECIMENTO                ' + sLineBreak +
     '        ,NR_PEDIDO              = :NR_PEDIDO                      ' + sLineBreak +
     '        ,DT_PREV_SAIDA          = :DT_PREV_SAIDA                  ' + sLineBreak +
     '        ,VL_MLE                 = :VL_MLE                         ' + sLineBreak +
     '        ,VL_SEGURO              = :VL_SEGURO                      ' + sLineBreak +
     '        ,VL_FRETE_INT           = :VL_FRETE_INT                   ' + sLineBreak +
     '        ,VL_PESO_BRUTO          = :VL_PESO_BRUTO                  ' + sLineBreak +
     '        ,VL_PESO_LIQ            = :VL_PESO_LIQ                    ' + sLineBreak +
     '        ,VL_CUBAGEM             = :VL_CUBAGEM                     ' + sLineBreak +
     '        ,TX_EMBALAGEM           = :TX_EMBALAGEM                   ' + sLineBreak +
     '        ,TX_MARCACAO            = :TX_MARCACAO                    ' + sLineBreak +
     '        ,TX_INST_EMB            = :TX_INST_EMB                    ' + sLineBreak +
     '        ,DT_PREV_EMBARQUE       = :DT_PREV_EMBARQUE               ' + sLineBreak +
     '        ,CD_STATUS_DOCTO        = :CD_STATUS_DOCTO                ' + sLineBreak +
     '        ,IN_RAP_VALIDA_DOCTO    = :IN_RAP_VALIDA_DOCTO            ' + sLineBreak +
     '        ,IN_FABR_EXPO           = :IN_FABR_EXPO                   ' + sLineBreak +
     '        ,IN_INSPECAO            = :IN_INSPECAO                    ' + sLineBreak +
     '        ,IN_PERMISSO            = :IN_PERMISSO                    ' + sLineBreak +
     '        ,IN_EXPURGO             = :IN_EXPURGO                     ' + sLineBreak +
     '        ,IN_PALLET_EXPURGO      = :IN_PALLET_EXPURGO              ' + sLineBreak +
     '        ,IN_DECL_EMBALAGEM      = :IN_DECL_EMBALAGEM              ' + sLineBreak +
     '        ,IN_CONSULADO           = :IN_CONSULADO                   ' + sLineBreak +
     '        ,IN_TRIANGULACAO        = :IN_TRIANGULACAO                ' + sLineBreak +
     '        ,IN_CARTA_CREDITO       = :IN_CARTA_CREDITO               ' + sLineBreak +
     '        ,IN_CADIVI              = :IN_CADIVI                      ' + sLineBreak +
     '        ,IN_AMOSTRA             = :IN_AMOSTRA                     ' + sLineBreak +
     '        ,IN_ANTECIPADO          = :IN_ANTECIPADO                  ' + sLineBreak +
     '        ,IN_EMAIL_ERRO          = :IN_EMAIL_ERRO                  ' + sLineBreak +
     '        ,TP_DRAWBACK            = :TP_DRAWBACK                    ' + sLineBreak +
     '        ,TP_NOTIFY              = :TP_NOTIFY                      ' + sLineBreak +
     '        ,TP_CONSIGNEE           = :TP_CONSIGNEE                   ' + sLineBreak +
     '        ,VL_ACRESCIMO           = :VL_ACRESCIMO                   ' + sLineBreak +
     '        ,VL_DESCONTO            = :VL_DESCONTO                    ' + sLineBreak +
     '        ,IN_PEDIDO_VALIDA       = :IN_PEDIDO_VALIDA               ' + sLineBreak +
     '        ,IN_COURRIER            = :IN_COURRIER                    ' + sLineBreak +
     '        ,IN_MODELO              = :IN_MODELO                      ' + sLineBreak +
     '        ,IN_SEM_PACK_LIST       = :IN_SEM_PACK_LIST               ' + sLineBreak +
     '        ,DT_FECHAMENTO          = :DT_FECHAMENTO                  ' + sLineBreak +
     '        ,DT_FINALIZADO_PEDIDO   = :DT_FINALIZADO_PEDIDO           ' + sLineBreak +
     '        ,TX_OBS                 = :TX_OBS                         ' + sLineBreak +
     ' WHERE CD_GRUPO    = :CD_GRUPO                                    ' + sLineBreak +
     '    AND CD_RAP     = :CD_RAP                                      ' + sLineBreak +
     '    AND CD_RAP_ANO = :CD_RAP_ANO                                  ' + sLineBreak ;

  Result := Sql;
end;

function TFrmMain.GetSQLTRapFornecimento : String;
begin
  result :=
    '   INSERT INTO MYINDAIA..TRAP_FORNECIMENTO ( ' + sLineBreak +
    '         CD_RAP                              ' + sLineBreak +
    '       , CD_RAP_ANO                          ' + sLineBreak +
    '       , CD_FORNECIMENTO                     ' + sLineBreak +
    '       , CD_ITEM                             ' + sLineBreak +
    '       , CD_MERCADORIA                       ' + sLineBreak +
    '       , VL_QTDE                             ' + sLineBreak +
    '       , VL_PESO_LIQ_UN                      ' + sLineBreak +
    '       , TX_UNID_MEDIDA                      ' + sLineBreak +
    '       , VL_PRECO_UNIT                       ' + sLineBreak +
    '       , VL_PRECO_TOT                        ' + sLineBreak +
    '       , CD_INCOTERM                         ' + sLineBreak +
    '       , CD_REFERENCIA                       ' + sLineBreak +
    '       , DT_PEDIDO                           ' + sLineBreak +
    '       , NR_PO                               ' + sLineBreak +
    '       , CD_PAIS_DESTINO                     ' + sLineBreak +
    '       , CD_NCM                              ' + sLineBreak +
    '       , TX_MARCACAO                         ' + sLineBreak +
    '       , CD_GRUPO                            ' + sLineBreak +
    '       , VL_PESO_BRUTO_UN                    ' + sLineBreak +
    '       , CD_TIPO_CONTAINER                   ' + sLineBreak +
    '       , CHAVE_NOTA                          ' + sLineBreak +
    '       , TX_DESC                             ' + sLineBreak +
    '       , TX_DESC_ING                         ' + sLineBreak +
    '       , TX_DESC_ESP                         ' + sLineBreak +
    '       , QT_CAIXAS                           ' + sLineBreak +
    '       , VL_CUBAGEM                          ' + sLineBreak +
    '      )                                      ' + sLineBreak +
    '       VALUES (                              ' + sLineBreak +
    '         :CD_RAP                             ' + sLineBreak +
    '       , :CD_RAP_ANO                         ' + sLineBreak +
    '       , :CD_FORNECIMENTO                    ' + sLineBreak +
    '       , :CD_ITEM                            ' + sLineBreak +
    '       , :CD_MERCADORIA                      ' + sLineBreak +
    '       , :VL_QTDE                            ' + sLineBreak +
    '       , :VL_PESO_LIQ_UN                     ' + sLineBreak +
    '       , :TX_UNID_MEDIDA                     ' + sLineBreak +
    '       , :VL_PRECO_UNIT                      ' + sLineBreak +
    '       , :VL_PRECO_TOT                       ' + sLineBreak +
    '       , :CD_INCOTERM                        ' + sLineBreak +
    '       , :CD_REFERENCIA                      ' + sLineBreak +
    '       , :DT_PEDIDO                          ' + sLineBreak +
    '       , :NR_PO                              ' + sLineBreak +
    '       , :CD_PAIS_DESTINO                    ' + sLineBreak +
    '       , :CD_NCM                             ' + sLineBreak +
    '       , :TX_MARCACAO                        ' + sLineBreak +
    '       , :CD_GRUPO                           ' + sLineBreak +
    '       , :VL_PESO_BRUTO_UN                   ' + sLineBreak +
    '       , :CD_TIPO_CONTAINER                  ' + sLineBreak +
    '       , :CHAVE_NOTA                         ' + sLineBreak +
    '       , :TX_DESC                            ' + sLineBreak +
    '       , :TX_DESC_ING                        ' + sLineBreak +
    '       , :TX_DESC_ESP                        ' + sLineBreak +
    '       , :QT_CAIXAS                          ' + sLineBreak +
    '       , :VL_CUBAGEM                         ' + sLineBreak +
    '   	)                                       ' + sLineBreak;
end;

function TFrmMain.GetSqlTRap_Fornecimento_Lote : String;
begin
  result :=
    ' INSERT INTO TRAP_FORNECIMENTO_LOTE ( ' + sLineBreak +
    '       CD_RAP                                   ' + sLineBreak +
    '      ,CD_RAP_ANO                               ' + sLineBreak +
    '      ,CD_FORNECIMENTO                          ' + sLineBreak +
    '      ,CD_GRUPO                                 ' + sLineBreak +
    '      ,CHAVE_NOTA                               ' + sLineBreak +
    '      ,CD_DELIVERY                              ' + sLineBreak +
    '      ,CD_LOTE                                  ' + sLineBreak +
    '      ,CD_SKU                                   ' + sLineBreak +
    '      ,DT_FABRICACAO                            ' + sLineBreak +
    '      ,DT_VENCIMENTO                            ' + sLineBreak +
    '      ,QT_MERCADORIA                            ' + sLineBreak +
    '      ,QT_PESO_LIQ                              ' + sLineBreak +
    '      ,QT_PESO_BRUTO                            ' + sLineBreak +
    ' )                                              ' + sLineBreak +
    ' 	VALUES (                                     ' + sLineBreak +
    '       :CD_RAP                                  ' + sLineBreak +
    '      ,:CD_RAP_ANO                              ' + sLineBreak +
    '      ,:CD_FORNECIMENTO                         ' + sLineBreak +
    '      ,:CD_GRUPO                                ' + sLineBreak +
    '      ,:CHAVE_NOTA      	                       ' + sLineBreak +
    '      ,:CD_DELIVERY     	                       ' + sLineBreak +
    '      ,:CD_LOTE         	                       ' + sLineBreak +
    '      ,:CD_SKU          	                       ' + sLineBreak +
    '      ,:DT_FABRICACAO   	                       ' + sLineBreak +
    '      ,:DT_VENCIMENTO   	                       ' + sLineBreak +
    '      ,:QT_MERCADORIA   	                       ' + sLineBreak +
    '      ,:QT_PESO_LIQ                             ' + sLineBreak +
    '      ,:QT_PESO_BRUTO                           ' + sLineBreak +
    ' )                                              ' + sLineBreak;
end;

function TFrmMain.GetSqlRetornoExpo : String;
begin
  result :=
'  SELECT TOP 15                                                                                         ' + sLineBreak +
'   CASE WHEN ISNULL(P.NR_DDE, '''') <> ''''                                                             ' + sLineBreak +
'        THEN P.NR_DDE                                                                                   ' + sLineBreak +
'        ELSE P.CD_DUE                                                                                   ' + sLineBreak +
'   END             		                        AS [NR_DUE]                                              ' + sLineBreak +
'  ,P.CD_RUC         		                        AS [RUC]                                                 ' + sLineBreak +
'  ,CONVERT(VARCHAR(10),EV124.DT_REALIZACAO,103)  AS [DATA_REGISTRO]                                     ' + sLineBreak +
'  ,CONVERT(VARCHAR(10),EV132.DT_REALIZACAO,103)  AS [DATA_EMBARQUE]                                     ' + sLineBreak +
'  ,CONVERT(VARCHAR(10),EV141.DT_REALIZACAO,103)  AS [DATA_AVERBACAO]                                    ' + sLineBreak +
'  ,CASE WHEN EV141.DT_REALIZACAO IS NULL                                                                ' + sLineBreak +
'        THEN ''REGISTRADO''                                                                             ' + sLineBreak +
'        ELSE ''AVERBADO''                                                                               ' + sLineBreak +
'   END                                           AS [SITUACAO]                                          ' + sLineBreak +
'  ,P.NR_PROCESSO                                 AS [NR_PROCESSO]                                       ' + sLineBreak +
'  ,PE.NR_FATURA                                  AS [NR_FATURA]                                         ' + sLineBreak +
'  ,P.NR_CONHECIMENTO                             AS [NR_CONHECIMENTO]                                   ' + sLineBreak +
'  ,CONVERT(VARCHAR(10),P.DT_CONHECIMENTO,103)    AS [DATA_CONHECIMENTO]                                 ' + sLineBreak +
'   FROM TPROCESSO     P    (NOLOCK)                                                                     ' + sLineBreak +
'   JOIN TPROCESSO_EXP PE   (NOLOCK) ON PE.NR_PROCESSO = P.NR_PROCESSO                                   ' + sLineBreak +
'                                                                                                        ' + sLineBreak +
'   JOIN TFOLLOWUP 	EV132 (NOLOCK) ON EV132.NR_PROCESSO	= P.NR_PROCESSO                                  ' + sLineBreak +
'                                   AND EV132.CD_SERVICO  = P.CD_SERVICO                                 ' + sLineBreak +
'                                   AND EV132.CD_EVENTO   = ''132''                                      ' + sLineBreak +
'                                                                                                        ' + sLineBreak +
'   JOIN TFOLLOWUP 	EV124 (NOLOCK) ON EV124.NR_PROCESSO	= P.NR_PROCESSO                                  ' + sLineBreak +
'                                   AND EV124.CD_SERVICO  = P.CD_SERVICO                                 ' + sLineBreak +
'                                   AND EV124.CD_EVENTO   = ''124''                                      ' + sLineBreak +
'                                                                                                        ' + sLineBreak +
'   JOIN TFOLLOWUP 	EV141 (NOLOCK) ON EV141.NR_PROCESSO	= P.NR_PROCESSO                                  ' + sLineBreak +
'                                   AND EV141.CD_SERVICO  = P.CD_SERVICO                                 ' + sLineBreak +
'                                   AND EV141.CD_EVENTO   = ''141''                                      ' + sLineBreak +
'                                                                                                        ' + sLineBreak +
'   CROSS APPLY ( SELECT TOP 1 E.NR_PEDIDO                                                               ' + sLineBreak +
'                   FROM TPROCESSO_EXP_ITEM E (NOLOCK)                                                   ' + sLineBreak +
'                  WHERE E.NR_PROCESSO = P.NR_PROCESSO ) EI                                              ' + sLineBreak +
'                                                                                                        ' + sLineBreak +
'  WHERE P.CD_GRUPO  = '+QuotedStr(GrupoNestle)+'                                                        ' + sLineBreak +
'            /* EVENTO 124 REALIZADO NOS ULTIMOS DIAS, SEM EDI ENVIADO, MAS EVENTO 141 NÃO REALIZADO. */ ' + sLineBreak +
'    AND (   (   EV124.DT_REALIZACAO > ''2018/05/01''                                                    ' + sLineBreak +
'            AND ISNULL(EV124.IN_EDI_ENVIADO, ''0'') = ''0''                                             ' + sLineBreak +
'            AND EV141.DT_REALIZACAO IS NULL                                                             ' + sLineBreak +
'            )                                                                                           ' + sLineBreak +
'            /*EVENTO 141 REALIZADO, SEM EDI ENVIADO*/                                                   ' + sLineBreak +
'         OR (   EV141.DT_REALIZACAO > ''2018/05/01''                                                    ' + sLineBreak +
'            AND ISNULL(EV141.IN_EDI_ENVIADO, ''0'') = ''0''                                             ' + sLineBreak +
'         )                                                                                              ' + sLineBreak +
'        )                                                                                               ' + sLineBreak ;

end;

function TfrmMain.GetSqlRetornoExpoOrdem(NrProcesso : String) : String;
begin
    Result :=
     ' SELECT DISTINCT                                                                                       ' + sLineBreak +
     '        EI.NR_PEDIDO AS NR_FORNECIMENTO                                                                ' + sLineBreak +
     ' FROM TPROCESSO             P     (NOLOCK)                                                             ' + sLineBreak +
     ' JOIN TPROCESSO_EXP_ITEM    EI    (NOLOCK) ON EI.NR_PROCESSO    = P.NR_PROCESSO                        ' + sLineBreak +
     ' JOIN TFOLLOWUP 			      EV124 (NOLOCK) ON EV124.NR_PROCESSO	= P.NR_PROCESSO                  ' + sLineBreak +
     '                		                      AND EV124.CD_SERVICO  = P.CD_SERVICO                       ' + sLineBreak +
     '                		                      AND EV124.CD_EVENTO   = ''124''                            ' + sLineBreak +
     '                		                                                                                 ' + sLineBreak +
     ' JOIN TFOLLOWUP 		      	EV132 (NOLOCK) ON EV132.NR_PROCESSO	= P.NR_PROCESSO                      ' + sLineBreak +
     '                		                      AND EV132.CD_SERVICO  = P.CD_SERVICO                       ' + sLineBreak +
     '                		                      AND EV132.CD_EVENTO   = ''132''                            ' + sLineBreak +
     '                		                                                                                 ' + sLineBreak +
     ' JOIN TFOLLOWUP 		      	EV141 (NOLOCK) ON EV141.NR_PROCESSO	= P.NR_PROCESSO                      ' + sLineBreak +
     '                                          AND EV141.CD_SERVICO  = P.CD_SERVICO                         ' + sLineBreak +
     '                                          AND EV141.CD_EVENTO   = ''141''                              ' + sLineBreak +
     ' WHERE P.CD_GRUPO  = '+QuotedStr(GrupoNestle)+'                                   ' + sLineBreak +
     '           /* EVENTO 124 REALIZADO NOS ULTIMOS DIAS, SEM EDI ENVIADO, MAS EVENTO 141 NÃO REALIZADO. */ ' + sLineBreak +
     '   AND (   (   EV124.DT_REALIZACAO > ''2018/05/01''                                                    ' + sLineBreak +
     '           AND ISNULL(EV124.IN_EDI_ENVIADO, ''0'') = ''0''                                             ' + sLineBreak +
     '           AND EV141.DT_REALIZACAO IS NULL                                                             ' + sLineBreak +
     '           )                                                                                           ' + sLineBreak +
     '           /*EVENTO 141 REALIZADO, SEM EDI ENVIADO*/                                                   ' + sLineBreak +
     '        OR (   EV141.DT_REALIZACAO > ''2018/05/01''                                                    ' + sLineBreak +
     '           AND ISNULL(EV141.IN_EDI_ENVIADO, ''0'') = ''0''                                             ' + sLineBreak +
     '        )                                                                                              ' + sLineBreak +
     '       )                                                                                               ' + sLineBreak +
     '    AND P.NR_PROCESSO = '+QuotedStr(NrProcesso);
end;

procedure TfrmMain.tmrIntegracaoTimer(Sender: TObject);
var
  Horas: Integer;
  Minutos: Integer;
  Segundos: Integer;
  InicioHora : TTime;
  FimHora : TTime;
  HoraAtual : TTime;
begin
  Dec(FTempoRestante, 1000);
  Horas := (FTempoRestante div 60000) div 60;

  if Horas > 0 then
    Minutos := (FTempoRestante div 60000) - (Horas * 60)
  else
    Minutos := (FTempoRestante div 60000);

  Segundos := (FTempoRestante div 1000) mod 60;


  StatusBar.Panels.Items[1].Text := FormatFloat('00', Horas) + ':' +
                                    FormatFloat('00', Minutos ) + ':' +
                                    FormatFloat('00', Segundos);
  if FTempoRestante <= 0 then
  begin
    tmrIntegracao.Enabled := False;

    try
      HoraAtual  := TimeOf(Now);
      InicioHora := StrToTime(FInicioIntegracao);
      FimHora    := StrToTime(FFimIntegracao);
      if ( HoraAtual  >= InicioHora) and
         ( HoraAtual  <= FimHora)   then
      begin
        CriaPastasIntegracao;
        Application.ProcessMessages;

        if chbIntegracao.Checked then
          btnIntegracao.Click;

        if chbRetornoExpo.Checked then
          btnRetornoExpo.Click;

        if chbRetornoImpo.Checked then
          btnRetornoImpo.Click;
      end;

    finally
      FTempoRestante := LocalSettings.Intervalo *  60000;
      tmrIntegracao.Enabled := True;
    end;
  end;
end;

procedure TfrmMain.EnviarEmail(Assunto, Mensagem, Email : String);
begin
  try
    if cbxValidar.checked then
    begin
      if not (LocalSettings.EmailValidacao = '') then
        Email := LocalSettings.EmailValidacao
      else
        Email := 'robonestle@myindaia.com.br';
    end;

    if not (email = 'ti@myindaia.com.br') then
      Email := Email +  ';robonestle@myindaia.com.br';

    dmdBroker.EnviaEmail('ti@myindaia.com.br',
                         [Email],
                         [], [],
                          Assunto,
                          Mensagem + '<br> <br>',
                         []);
  except on E:Exception do
    Log('Erro ao enviar email - ' + E.Message, Logar);
  end;
end;

procedure TfrmMain.Logar;
begin
  Memo.Lines.LoadFromFile(NomeArquivoLog);
end;

procedure TfrmMain.MemoChange(Sender: TObject);
begin
  SendMessage(Memo.Handle, EM_LINESCROLL, 0,Memo.Lines.Count);
end;


procedure TfrmMain.ProcessarRetorno(Tipo :String);
var Arquivo, NomeArquivo: string;
begin
  if tipo = 'EXPO' then
  begin
    GerarArquivoRetornoExpo;  //Gera o arquivo e salva na pasta
    EnviarXMLRetorno('EXPO'); //Envia o arquivo para o FTP
  end
  else
  begin
    GerarArquivoRetornoImpo;
    EnviarXMLRetorno('IMPO');
  end;
end;

procedure TfrmMain.GerarArquivoRetornoExpo;
var
  XML : IXMLDOCUMENT;
  Raiz, Filho_Raiz, Raiz_Ordem, Filho_Ordem : IXMLNODE;
begin
  dmdBroker.qryRetorno.close;
  dmdBroker.qryRetorno.SQL.Text := GetSqlRetornoExpo;
  dmdBroker.qryRetorno.Open;

  if not dmdBroker.qryRetorno.IsEmpty then
  begin
    dmdBroker.qryRetorno.First;
    while not dmdBroker.qryRetorno.eof do
    begin
      XML          := NewXMLDocument;

      XML.Options  := [doNodeAutoIndent];

      Raiz       := XML.AddChild('RETORNO');

      Filho_Raiz      := Raiz.AddChild('TIPO_RETORNO');
      Filho_Raiz.Text := 'E';

      Filho_Raiz      := Raiz.AddChild('NUM_NES');
      Filho_Raiz.Text := trim(dmdBroker.qryRetorno.fieldByName('NR_FATURA').AsString);

      Filho_Raiz      := Raiz.AddChild('NUM_DUE');
      Filho_Raiz.Text := trim(dmdBroker.qryRetorno.fieldByName('NR_DUE').AsString);

      Filho_Raiz      := Raiz.AddChild('COD_RUC');
      Filho_Raiz.Text := trim(dmdBroker.qryRetorno.fieldByName('RUC').AsString);

      Filho_Raiz      := Raiz.AddChild('DATA_REGISTRO');
      Filho_Raiz.Text := trim(dmdBroker.qryRetorno.fieldByName('DATA_REGISTRO').AsString);

      Filho_Raiz      := Raiz.AddChild('NUM_CONHECIMENTO');
      Filho_Raiz.Text := trim(dmdBroker.qryRetorno.fieldByName('NR_CONHECIMENTO').AsString);

      Filho_Raiz      := Raiz.AddChild('DATA_CONHECIMENTO');
      Filho_Raiz.Text := trim(dmdBroker.qryRetorno.fieldByName('DATA_CONHECIMENTO').AsString);

      Filho_Raiz      := Raiz.AddChild('DATA_EMBARQUE');
      Filho_Raiz.Text := trim(dmdBroker.qryRetorno.fieldByName('DATA_EMBARQUE').AsString);

      Filho_Raiz      := Raiz.AddChild('DATA_AVERBACAO');
      Filho_Raiz.Text := trim(dmdBroker.qryRetorno.fieldByName('DATA_AVERBACAO').AsString);

      Filho_Raiz      := Raiz.AddChild('SITUACAO');
      Filho_Raiz.Text := trim(dmdBroker.qryRetorno.fieldByName('SITUACAO').AsString);

      Raiz_Ordem     := Raiz.AddChild('ORDENS');

      dmdBroker.qryRetornoOrdem.close;
      dmdBroker.qryRetornoOrdem.SQL.Text := GetSqlRetornoExpoOrdem(dmdBroker.qryRetorno.FieldByName('NR_PROCESSO').AsString);
      dmdBroker.qryRetornoOrdem.Open;
      while not dmdBroker.qryRetornoOrdem.Eof do
      begin
        Filho_Ordem      := Raiz_Ordem.AddChild('NUM_ORDEM');
        Filho_Ordem.Text := trim(dmdBroker.qryRetornoOrdem.fieldByName('NR_FORNECIMENTO').AsString);

        dmdBroker.qryRetornoOrdem.next;
      end;

      XML.SaveToFile(Pasta_Retorno_Expo + 'E' +
                     StringReplace(dmdBroker.qryRetorno.FieldByName('NR_PROCESSO').AsString, '-', '', [rfReplaceAll]) + '.xml');

      dmdBroker.qryRetorno.next;
    end;
  end;
end;

procedure TfrmMain.GerarArquivoRetornoImpo;
var
  XML : IXMLDOCUMENT;
  Raiz, Filho_Raiz,
  Raiz_AdicaoLista,
  Raiz_Adicao, Filho_Adicao,
  Raiz_Ordem, Filho_Ordem : IXMLNODE;
begin
  dmdBroker.qryRetorno.close;
  dmdBroker.qryRetorno.SQL.Text := GetSqlRetornoImpoProcesso;
  dmdBroker.qryRetorno.Open;

  if not dmdBroker.qryRetorno.IsEmpty then
  begin
    dmdBroker.qryRetorno.First;
    while not dmdBroker.qryRetorno.eof do
    begin
      XML          := NewXMLDocument;

      XML.Options  := [doNodeAutoIndent];

      Raiz         := XML.AddChild('RETORNO');

      Filho_Raiz      := Raiz.AddChild('TIPO_RETORNO');
      Filho_Raiz.Text := 'I';

      Filho_Raiz      := Raiz.AddChild('DESPACHANTE');
      Filho_Raiz.Text := trim(dmdBroker.qryRetorno.fieldByName('DESPACHANTE').AsString);

      Filho_Raiz      := Raiz.AddChild('REF');
      Filho_Raiz.Text := trim(dmdBroker.qryRetorno.fieldByName('NR_PROCESSO').AsString);

      Filho_Raiz      := Raiz.AddChild('DECLARACAO');
      Filho_Raiz.Text := trim(dmdBroker.qryRetorno.fieldByName('DECLARACAO').AsString);

      Filho_Raiz      := Raiz.AddChild('DATA_REGISTRO');
      Filho_Raiz.Text := trim(dmdBroker.qryRetorno.fieldByName('DATA_REGISTRO').AsString);

      Filho_Raiz      := Raiz.AddChild('NUM_CONHECIMENTO');
      Filho_Raiz.Text := trim(dmdBroker.qryRetorno.fieldByName('CONHECIMENTO').AsString);

      Filho_Raiz      := Raiz.AddChild('TIPO_MANIFESTO');
      Filho_Raiz.Text := trim(dmdBroker.qryRetorno.fieldByName('TIPO_MANIFESTO').AsString);

      Filho_Raiz      := Raiz.AddChild('NUM_MANIFESTO');
      Filho_Raiz.Text := trim(dmdBroker.qryRetorno.fieldByName('NR_MANIFESTO').AsString);

      Filho_Raiz      := Raiz.AddChild('RECINTO_ADUANEIRO');
      Filho_Raiz.Text := trim(dmdBroker.qryRetorno.fieldByName('RECINTO_ADUANEIRO').AsString);

      Filho_Raiz      := Raiz.AddChild('ARMAZEM');
      Filho_Raiz.Text := trim(dmdBroker.qryRetorno.fieldByName('ARMAZEM').AsString);

      Filho_Raiz      := Raiz.AddChild('FAMILIA_PRODUTO');
      Filho_Raiz.Text := trim(dmdBroker.qryRetorno.fieldByName('FAMILIA_PRODUTO').AsString);

      //LISTA ADICOES
      Raiz_Ordem     := Raiz.AddChild('ORDENS');

      dmdBroker.qryRetornoOrdem.close;
      dmdBroker.qryRetornoOrdem.SQL.Text := GetSqlRetornoImpoOrdens(dmdBroker.qryRetorno.FieldByName('NR_PROCESSO').AsString);
      dmdBroker.qryRetornoOrdem.Open;
      while not dmdBroker.qryRetornoOrdem.Eof do
      begin

        Filho_Ordem      := Raiz_Ordem.AddChild('ORDEM');
        Filho_Ordem.Text := trim(dmdBroker.qryRetornoOrdem.fieldByName('ORDEM').AsString);

        //LISTA ORDENS
        Raiz_Adicao      := Raiz_Ordem.AddChild('ADICOES');

        dmdBroker.qryRetornoAdicao.close;
        dmdBroker.qryRetornoAdicao.SQL.Text := GetSQLRetornoImpoAdicoes(dmdBroker.qryRetornoOrdem.FieldByName('NR_PROCESSO').AsString,
                                                                        dmdBroker.qryRetornoOrdem.fieldByName('ORDEM').AsString);
        dmdBroker.qryRetornoAdicao.Open;

        while not dmdBroker.qryRetornoAdicao.Eof do
        begin
          Raiz_AdicaoLista  := Raiz_Adicao.AddChild('ADICAO');

          Filho_Adicao      := Raiz_AdicaoLista.AddChild('NUM_ADICAO');
          Filho_Adicao.Text := trim(dmdBroker.qryRetornoAdicao.fieldByName('ADICAO').AsString);

          Filho_Adicao      := Raiz_AdicaoLista.AddChild('NUM_LI');
          Filho_Adicao.Text := trim(dmdBroker.qryRetornoAdicao.fieldByName('NR_LI').AsString);

          Filho_Adicao      := Raiz_AdicaoLista.AddChild('VL_IMPOSTO_IMPORT');
          Filho_Adicao.Text := trim(dmdBroker.qryRetornoAdicao.fieldByName('VL_IMPOSTO_IMPO_ITEM').AsString);

          Filho_Adicao      := Raiz_AdicaoLista.AddChild('VL_IPI');
          Filho_Adicao.Text := trim(dmdBroker.qryRetornoAdicao.fieldByName('VL_IPI_ITEM').AsString);

          Filho_Adicao      := Raiz_AdicaoLista.AddChild('VL_SISCOMEX');
          Filho_Adicao.Text := trim(dmdBroker.qryRetornoAdicao.fieldByName('VL_TAXA_SISCOMEX_ITEM').AsString);

          Filho_Adicao      := Raiz_AdicaoLista.AddChild('VL_BASE_ICMS');
          Filho_Adicao.Text := trim(dmdBroker.qryRetornoAdicao.fieldByName('VL_BASE_ICMS_ITEM').AsString);

          Filho_Adicao      := Raiz_AdicaoLista.AddChild('VL_ICMS');
          Filho_Adicao.Text := trim(dmdBroker.qryRetornoAdicao.fieldByName('VL_VALOR_ICMS_ITEM').AsString);

          Filho_Adicao      := Raiz_AdicaoLista.AddChild('VL_ICMS_CALCULADO');
          Filho_Adicao.Text := trim(dmdBroker.qryRetornoAdicao.fieldByName('VL_ICMS_CALCULADO_ITEM').AsString);

          Filho_Adicao      := Raiz_AdicaoLista.AddChild('VL_AFRMM');
          Filho_Adicao.Text := trim(dmdBroker.qryRetornoAdicao.fieldByName('VL_AFRMM_ITEM').AsString);

          Filho_Adicao      := Raiz_AdicaoLista.AddChild('VL_BASE_PIS_COFINS');
          Filho_Adicao.Text := trim(dmdBroker.qryRetornoAdicao.fieldByName('VL_BASE_PIS_COFINS_ITEM').AsString);

          Filho_Adicao      := Raiz_AdicaoLista.AddChild('VL_BASE_PIS_PASEP');
          Filho_Adicao.Text := trim(dmdBroker.qryRetornoAdicao.fieldByName('VL_PIS_PASEP_ITEM').AsString);

          Filho_Adicao      := Raiz_AdicaoLista.AddChild('VL_COFINS');
          Filho_Adicao.Text := trim(dmdBroker.qryRetornoAdicao.fieldByName('COFINS_ITEM').AsString);

          dmdBroker.qryRetornoAdicao.next;
        end;
        dmdBroker.qryRetornoOrdem.next;
      end;

      XML.SaveToFile(Pasta_Retorno_Impo + 'I' +
                     StringReplace(dmdBroker.qryRetorno.FieldByName('NR_PROCESSO').AsString, '-', '', [rfReplaceAll]) + '.xml');

      dmdBroker.qryRetorno.next;
    end;
  end;
end;

procedure TfrmMain.EnviarXMLRetorno(Tipo : String);
var
  Arquivo: string;
  NomeArquivo : String;
begin
  try
    if LocalSettings.FTPEndereco <> '' then
    begin
      if ((Tipo = 'EXPO') and (Length(TDirectory.GetFiles(Pasta_Retorno_Expo, '*.xml')) > 0)) or
         ((Tipo = 'IMPO') and (Length(TDirectory.GetFiles(Pasta_Retorno_Impo, '*.xml')) > 0))then
      begin
        try
          with IdFTP1 do
          begin
            try
             Disconnect;
            except on e:exception do
              Log('Erro ao desconectar FTP. ' + e.message, Logar);
            end;

            if LocalSettings.FTPPorta <> '' then
              Port      := StrToInt(LocalSettings.FTPPorta);

            Host        := LocalSettings.FTPEndereco;
            ReadTimeout := 0;
            Username    := LocalSettings.FTPUsuario;
            Password    := LocalSettings.FTPSenha;
            Passive     := true;

            try
             Connect;
            except on e:exception do
              Log('Erro ao conectar no FTP. ' + e.message, Logar);
            end;


            if LocalSettings.FTPPastaUpload <> '' then
              ChangeDir(LocalSettings.FTPPastaUpload);

            if Tipo = 'EXPO' then
            begin
              for Arquivo in TDirectory.GetFiles(Pasta_Retorno_Expo, '*.xml') do
              begin
                NomeArquivo := ExtractFileName(Arquivo);
                Log('Enviar retorno. Arquivo:' + NomeArquivo, Logar);

                Put(Arquivo);     //envia para o servidor ftp
                AtualizarStatusEnvioRetorno(NomeArquivo);        //update processo
                MoveFile(PChar(Pasta_Retorno_Expo + NomeArquivo), PChar(Pasta_Retorno_Enviados_Expo +
                                                                        formatDateTime('ddmmyyyyhhmm', now)+ '_' +
                                                                        NomeArquivo)); //mover arquivo enviado
              end
            end
            else
            begin
              for Arquivo in TDirectory.GetFiles(Pasta_Retorno_Impo, '*.xml') do
              begin
                NomeArquivo := ExtractFileName(Arquivo);
                Log('Enviar retorno. Arquivo:' + NomeArquivo, Logar);

                Put(Arquivo);     //envia para o servidor ftp
                AtualizarStatusEnvioRetorno(NomeArquivo);        //update processo
                MoveFile(PChar(Pasta_Retorno_Impo + NomeArquivo), PChar(Pasta_Retorno_Enviados_Impo +
                                                                        formatDateTime('ddmmyyyyhhmm', now)+ '_' +
                                                                        NomeArquivo)); //mover arquivo enviado
              end;
            end;
          end;
        finally
          try
           IdFTP1.Disconnect;
          except on e:exception do
            Log('Erro ao desconectar no FTP. ' + e.message, Logar);
          end;
        end;
      end;
    end
    else
    begin
      Log('Configuração FTP inválida.', Logar);
    end;
  except on e:exception do
    Log('Erro FTP. ' + e.message, Logar);
  end;
end;

procedure TfrmMain.AtualizarStatusEnvioRetorno(Arquivo :String);
var
  Nr_Processo : String;
  nm_arquivo :string;
  EventoExpo :String;
begin
  try
    //E0102EM00080518
    Nr_Processo := Copy(Arquivo, 2,6) + '-' +  Copy(Arquivo, 8,6) + '-' + Copy(Arquivo, 14,2);

    if Copy(Arquivo, 1,1)  = 'E' then
    begin
      dmdBroker.qryTemp.Close;
      dmdBroker.qryTemp.Sql.text := GetSqlAtualizaRetornoEventoExpo(Nr_Processo); //Averbação
      dmdBroker.qryTemp.open;
      if not dmdBroker.qryTemp.isEmpty then
        EventoExpo := dmdBroker.qryTemp.FieldByName('CD_EVENTO').asString
      else
        EventoExpo := '141';

      dmdBroker.qryTemp.Close;
      dmdBroker.qryTemp.Sql.text := GetSqlAtualizaRetornoProcesso(Nr_Processo, EventoExpo); //Averbação
      dmdBroker.qryTemp.ExecSql;

      Log('Atualiza envio retorno. Processo:' + Nr_Processo, Logar);
    end
    else
    if Copy(Arquivo, 1,1)  = 'I' then
    begin
      dmdBroker.qryTemp.Close;
      dmdBroker.qryTemp.Sql.text := GetSqlAtualizaRetornoProcesso(Nr_Processo,  '041');  //Liberação do processo para a Transportadora
      dmdBroker.qryTemp.ExecSql;

      Log('Atualiza envio retorno. Processo:' + Nr_Processo, Logar);
    end;
    except on E:Exception do
    begin
      Log('Erro - Atualiza envio retorno. Processo:' + Nr_Processo + ' ' + e.Message , Logar);
    end;
  end;
end;

function TfrmMain.GetSqlAtualizaRetornoProcesso(Nr_Processo, CodEvento : String) : String;
begin
  Result := ' set nocount on                                ' + sLineBreak +
            ' UPDATE TFOLLOWUP                              ' + sLineBreak +
            '    SET IN_EDI_ENVIADO = ''1''                 ' + sLineBreak +
            '   FROM TFOLLOWUP (NOLOCK)                     ' + sLineBreak +
            '  WHERE CD_EVENTO   = '+QuotedStr(CodEvento)     + sLineBreak +
            '    AND NR_PROCESSO = '+QuotedStr(Nr_Processo)   + sLineBreak ;
end;


function TfrmMain.GetSqlAtualizaRetornoEventoExpo(Nr_Processo : String) : String;
begin
  Result :=   ' SELECT CASE WHEN EV141.DT_REALIZACAO IS NOT NULL                                                        ' + sLineBreak +
              '             THEN ''141''                                                                                ' + sLineBreak +
              '             ELSE ''124''                                                                                ' + sLineBreak +
              '        END CD_EVENTO                                                                                    ' + sLineBreak +
              ' FROM  TPROCESSO     P     (NOLOCK)                                                                      ' + sLineBreak +
              '   JOIN TFOLLOWUP 	EV124 (NOLOCK) ON EV124.NR_PROCESSO	= P.NR_PROCESSO                                   ' + sLineBreak +
              '                                   AND EV124.CD_SERVICO  = P.CD_SERVICO                                  ' + sLineBreak +
              '                                   AND EV124.CD_EVENTO   = ''124''                                       ' + sLineBreak +
              '                                                                                                         ' + sLineBreak +
              '   JOIN TFOLLOWUP 	EV141 (NOLOCK) ON EV141.NR_PROCESSO	= P.NR_PROCESSO                                   ' + sLineBreak +
              '                                   AND EV141.CD_SERVICO  = P.CD_SERVICO                                  ' + sLineBreak +
              '                                   AND EV141.CD_EVENTO   = ''141''                                       ' + sLineBreak +
              '  WHERE P.CD_GRUPO    ='+QuotedStr(GrupoNestle)+'                                                        ' + sLineBreak +
              '    AND P.NR_PROCESSO ='+QuotedStr(Nr_Processo)+'                                                        ' + sLineBreak +
              '            /* EVENTO 124 REALIZADO NOS ULTIMOS DIAS, SEM EDI ENVIADO, MAS EVENTO 141 NÃO REALIZADO. */  ' + sLineBreak +
              '    AND (   (   EV124.DT_REALIZACAO > ''2018/05/01''                                                     ' + sLineBreak +
              '            AND ISNULL(EV124.IN_EDI_ENVIADO, ''0'') = ''0''                                              ' + sLineBreak +
              '            AND EV141.DT_REALIZACAO IS NULL                                                              ' + sLineBreak +
              '            )                                                                                            ' + sLineBreak +
              '            /*EVENTO 141 REALIZADO, SEM EDI ENVIADO*/                                                    ' + sLineBreak +
              '         OR (   EV141.DT_REALIZACAO > ''2018/05/01''                                                     ' + sLineBreak +
              '            AND ISNULL(EV141.IN_EDI_ENVIADO, ''0'') = ''0''                                              ' + sLineBreak +
              '         )                                                                                               ' + sLineBreak +
              '        )                                                                                                ' + sLineBreak ;
end;

function TfrmMain.GetSQLRetornoImpoAdicoes(Nr_Processo, sOrdem: String) : String;
begin
  Result := ' SELECT * ' +sLineBreak +
            '   FROM FN_ITENS_ARQUIVO_RETORNO_IMPO_NESTLE('+QuotedStr(Nr_Processo)+') ' + sLineBreak +
            '  WHERE ORDEM = ' + QuotedStr(sOrdem);
end;

function TFrmMain.GetSqlRetornoImpoOrdens(Nr_Processo: String) : String;
begin
  Result :=
   '    SELECT  DISTINCT                                                                          '+ sLineBreak +
   '            DM.NR_PROC_PO AS [ORDEM]                                                          '+ sLineBreak +
 //  '           ,A.NR_ADICAO   AS [NR_ADICAO]                                                      '+ sLineBreak +
   '           ,P.NR_PROCESSO AS [NR_PROCESSO]                                                    '+ sLineBreak +
   '    FROM  TPROCESSO                   P (NOLOCK)                                              '+ sLineBreak +
   '    INNER JOIN TADICAO_DE_IMPORTACAO  A (NOLOCK) ON P.NR_PROCESSO         = A.NR_PROCESSO     '+ sLineBreak +
  // '                                                AND ISNULL(A.NR_OPER_TRAT_PREV,'''') <> ''''  '+ sLineBreak +
   '    INNER JOIN TEMPRESA_EST 		      EE(NOLOCK) ON EE.CD_EMPRESA         = A.CD_FORNECEDOR   '+ sLineBreak +
   '    INNER JOIN TDETALHE_MERCADORIA    DM(NOLOCK) ON DM.NR_PROCESSO        = A.NR_PROCESSO     '+ sLineBreak +
   '                                                AND DM.NR_ADICAO          = A.NR_ADICAO       '+ sLineBreak +
   '    WHERE P.CD_GRUPO    = '+QuotedStr(GrupoNestle)+'                                          '+ sLineBreak +
   '      AND P.NR_PROCESSO = '+QuotedStr(Nr_Processo)                                             + sLineBreak ;
end;

function TFrmMain.GetSqlRetornoImpoProcesso : String;
begin
  Result :=
   '  SELECT  TOP 15                                                                                          ' + sLineBreak +
   '   ''IND - INDAIA LOGISTICA INTERNACIONAL LTDA''          AS [DESPACHANTE]                                ' + sLineBreak +
   '  ,P.NR_PROCESSO 								     	                    AS [NR_PROCESSO]                                ' + sLineBreak +
   '  ,DI.NR_DECLARACAO_IMP 							                    AS [DECLARACAO]                                 ' + sLineBreak +
   '  ,CASE WHEN LEN(ISNULL(DI.DT_REGISTRO_DI, '''')) > 1                                                     ' + sLineBreak +
   '        THEN SUBSTRING(DI.DT_REGISTRO_DI, 1,2) + ''/'' +                                                  ' + sLineBreak +
   '             SUBSTRING(DI.DT_REGISTRO_DI, 3,2) + ''/'' +                                                  ' + sLineBreak +
   '             SUBSTRING(DI.DT_REGISTRO_DI, 5,4)                                                            ' + sLineBreak +
   '        ELSE ''''                                                                                         ' + sLineBreak +
   '   END                 						        	              AS [DATA_REGISTRO]                              ' + sLineBreak +
   '  ,CASE WHEN LEN(ISNULL(DI.DT_EMBARQUE, '''')) > 1                                                        ' + sLineBreak +
   '        THEN SUBSTRING(DI.DT_EMBARQUE, 1,2) + ''/'' +                                                     ' + sLineBreak +
   '             SUBSTRING(DI.DT_EMBARQUE, 3,2) + ''/'' +                                                     ' + sLineBreak +
   '             SUBSTRING(DI.DT_EMBARQUE, 5,4)                                                               ' + sLineBreak +
   '        ELSE ''''                                                                                         ' + sLineBreak +
   '   END                 						                        AS [CONHECIMENTO]                               ' + sLineBreak +
   '  ,''MANIFESTO DE CARGA'' 				                        AS [TIPO_MANIFESTO]                             ' + sLineBreak +
   '  ,DI.NR_MANIFESTO      					                        AS [NR_MANIFESTO]                               ' + sLineBreak +
   '  ,RA.DESCRICAO         					                        AS [RECINTO_ADUANEIRO]                          ' + sLineBreak +
   '  ,R.NOME               					                        AS [ARMAZEM]                                    ' + sLineBreak +
   '  ,AREA.NM_AREA  									                        AS [FAMILIA_PRODUTO]                            ' + sLineBreak +
   '  FROM  TPROCESSO                          P    (NOLOCK)                                                  ' + sLineBreak +
   '  CROSS APPLY(SELECT TOP 1 NR_PROCESSO                                                                    ' + sLineBreak +
   '                FROM TADICAO_DE_IMPORTACAO A    (NOLOCK)                                                  ' + sLineBreak +
   '                WHERE A.NR_PROCESSO = P.NR_PROCESSO                                                       ' + sLineBreak +
   '                 /* AND ISNULL(A.NR_OPER_TRAT_PREV,'''') <> '''' */) AD                                   ' + sLineBreak +
   '                                                                                                          ' + sLineBreak +
   '  INNER JOIN TFOLLOWUP                     F041 (NOLOCK) ON F041.NR_PROCESSO      = P.NR_PROCESSO         ' + sLineBreak +
   '                                                        AND F041.CD_SERVICO       = P.CD_SERVICO          ' + sLineBreak +
   '                                                        AND F041.CD_EVENTO        = ''041''               ' + sLineBreak +
   '  INNER JOIN TDECLARACAO_IMPORTACAO    	   DI   (NOLOCK) ON DI.NR_PROCESSO        = P.NR_PROCESSO         ' + sLineBreak +
   '  LEFT  JOIN TREC_ALFANDEGADO          	   RA   (NOLOCK) ON DI.CD_RECINTO_ALFAND  = RA.CODIGO             ' + sLineBreak +
   '  LEFT  JOIN TRECINTO_SETORES_IMPORTACAO   R    (NOLOCK) ON R.RECINTO             = DI.CD_RECINTO_ALFAND  ' + sLineBreak +
   '                                                        AND DI.CD_SETOR_ARMAZENAM = R.SETOR               ' + sLineBreak +
   '  LEFT  JOIN TAREA                         AREA (NOLOCK) ON AREA.CD_AREA          = P.CD_AREA             ' + sLineBreak +
   '  WHERE P.CD_GRUPO    = '+QuotedStr(GrupoNestle)+'                                                        ' + sLineBreak +
   '    AND F041.DT_REALIZACAO IS NOT NULL                                                                    ' + sLineBreak +
   '    AND F041.DT_REALIZACAO > ''2018/08/01''                                                               ' + sLineBreak +
   '    AND ISNULL(F041.IN_EDI_ENVIADO ,0) = 0                                                                ' + sLineBreak ;
end;

function TFrmMain.GetSQLTINSTRUCAO_DESEMBARACO(Tipo : String) : String;
var
  Sql : String;
begin
  if Tipo = 'I' then
    Sql :=
    '   INSERT INTO TINSTRUCAO_DESEMBARACO (   ' + sLineBreak +
    '     ID_CODIGO	                           ' + sLineBreak +   //- NUMERO SEQUENCIAL
    '   , CD_USUARIO	                         ' + sLineBreak +   //- FIXAR: 0707 (TI)
    '   , DT_CRIACAO	                         ' + sLineBreak +   //- DATA ATUAL
    '   , IN_AUTORIZADO                        ' + sLineBreak +   //- FIXAR: 0
    '   , CD_CLIENTE	                         ' + sLineBreak +   //- IMPORTADOR CNPJ
    '   , CD_RESPONSAVEL	                     ' + sLineBreak +   //- FIXAR: 0707 (TI)
    '   , TX_OBSERVACOES	                     ' + sLineBreak +   //- CONDIÇÃO DE PAGAMENTO DESCRIÇÃO
    '   , CD_MODAL	                           ' + sLineBreak +   //- VIA DE TRANSPORTE
    '   , CD_PAIS_PROCEDENCIA	                 ' + sLineBreak +   //- LOCAL DE EMBARQUE (PAÍS)
    '   , CD_MOEDA_FRETE	                     ' + sLineBreak +   //- MOEDA DA NEGOCIAÇÃO (PADRÃO NESTLÉ ATUAL DE DÓLAR)
    '   , VL_FRETE_PREPAID_MNEG	               ' + sLineBreak +   //- VALOR DO FRETE
    '   , VL_FRETE_COLLECT_MNEG	               ' + sLineBreak +   //- VALOR DO FRETE
    '   , VL_SEGURO_MNEG	                     ' + sLineBreak +   //- VALOR SEGURO
    '   , CD_LOCAL_EMBARQUE	                   ' + sLineBreak +   //- LOCAL DE EMBARQUE (CIDADE)
    '   , CD_INCOTERM	                         ' + sLineBreak +   //- INCOTERM
    '   , CD_TIPO_FRETE	                       ' + sLineBreak +   //- TIPO DE FRETE (PREPAID/COLLECT)
    '   , ID_CLIENTE	                         ' + sLineBreak +   //- NÚMERO DA ORDEM (PEDIDO DE EXPORTAÇÃO)
    '   )                                      ' + sLineBreak +
    '                                          ' + sLineBreak +
    '   VALUES                                 ' + sLineBreak +
    '   (  :ID_CODIGO	                         ' + sLineBreak +
    '    , :CD_USUARIO	                       ' + sLineBreak +
    '    , :DT_CRIACAO	                       ' + sLineBreak +
    '    , :IN_AUTORIZADO                      ' + sLineBreak +
    '    , :CD_CLIENTE	                       ' + sLineBreak +
    '    , :CD_RESPONSAVEL	                   ' + sLineBreak +
    '    , :TX_OBSERVACOES	                   ' + sLineBreak +
    '    , :CD_MODAL	                         ' + sLineBreak +
    '    , :CD_PAIS_PROCEDENCIA	               ' + sLineBreak +
    '    , :CD_MOEDA_FRETE	                   ' + sLineBreak +
    '    , :VL_FRETE_PREPAID_MNEG	             ' + sLineBreak +
    '    , :VL_FRETE_COLLECT_MNEG	             ' + sLineBreak +
    '    , :VL_SEGURO_MNEG	                   ' + sLineBreak +
    '    , :CD_LOCAL_EMBARQUE	                 ' + sLineBreak +
    '    , :CD_INCOTERM	                       ' + sLineBreak +
    '    , :CD_TIPO_FRETE	                     ' + sLineBreak +
    '    , :ID_CLIENTE	                       ' + sLineBreak +
    '   )                                      ' + sLineBreak
  else
  begin
    Sql :=
   '    UPDATE TINSTRUCAO_DESEMBARACO                        ' + sLineBreak +
   '    SET  ID_CODIGO	            = :ID_CODIGO	           ' + sLineBreak +
   '       , CD_USUARIO	            = :CD_USUARIO	           ' + sLineBreak +
   '       , DT_CRIACAO	            = :DT_CRIACAO	           ' + sLineBreak +
   '       , IN_AUTORIZADO          = :IN_AUTORIZADO         ' + sLineBreak +
   '       , CD_RESPONSAVEL	        = :CD_RESPONSAVEL	       ' + sLineBreak +
   '       , TX_OBSERVACOES	        = :TX_OBSERVACOES	       ' + sLineBreak +
   '       , CD_MODAL	              = :CD_MODAL	             ' + sLineBreak +
   '       , CD_PAIS_PROCEDENCIA	  = :CD_PAIS_PROCEDENCIA	 ' + sLineBreak +
   '       , CD_MOEDA_FRETE	        = :CD_MOEDA_FRETE	       ' + sLineBreak +
   '       , VL_FRETE_PREPAID_MNEG  = :VL_FRETE_PREPAID_MNEG ' + sLineBreak +
   '       , VL_FRETE_COLLECT_MNEG  = :VL_FRETE_COLLECT_MNEG ' + sLineBreak +
   '       , VL_SEGURO_MNEG	        = :VL_SEGURO_MNEG	       ' + sLineBreak +
   '       , CD_LOCAL_EMBARQUE	    = :CD_LOCAL_EMBARQUE	   ' + sLineBreak +
   '       , CD_INCOTERM	          = :CD_INCOTERM	         ' + sLineBreak +
   '       , CD_TIPO_FRETE	        = :CD_TIPO_FRETE	       ' + sLineBreak +
   '     FROM TINSTRUCAO_DESEMBARACO (NOLOCK)                ' + sLineBreak +
   '     WHERE CD_CLIENTE = :CD_CLIENTE	                     ' + sLineBreak +
   '       and ID_CLIENTE = :ID_CLIENTE	                     ' + sLineBreak ;
  end;

  Result := Sql;
end;

function TFrmMain.GetSQLTINSTRUCAO_DESEMBARACO_PEDIDO : String;
begin
    result :=
      ' INSERT INTO TINSTRUCAO_DESEMBARACO_PEDIDO( ' + sLineBreak +
      '   ID_CODIGO	                               ' + sLineBreak +   // "NUMERO SEQUENCIAL O MESMO NUMERO INSERIDO EM TINSTRUCAO_DESEMBARACO"
      ' , NR_REFERENCIA	                           ' + sLineBreak +   // NÚMERO DA ORDEM (PEDIDO DE EXPORTAÇÃO)
      ' , NR_ITEM_PO	                             ' + sLineBreak +   // QUANTIDADE DE PRODUTOS (SEQUENCIAL)
      ' , NR_PARCIAL	                             ' + sLineBreak +   // FIXO: 1
      ' , DT_INCLUSAO	                             ' + sLineBreak +   // DATA DE CRIAÇÃO
      ' )                                          ' + sLineBreak +
      ' VALUES                                     ' + sLineBreak +
      ' ( :ID_CODIGO	                             ' + sLineBreak +
      ' , :NR_REFERENCIA	                         ' + sLineBreak +
      ' , :NR_ITEM_PO	                             ' + sLineBreak +
      ' , :NR_PARCIAL	                             ' + sLineBreak +
      ' , :DT_INCLUSAO	                           ' + sLineBreak +
      ' )                                          ' + sLineBreak;
end;

function TFrmMain.GetSQLTPO(Tipo : String) : String;
var
  Sql : String;
begin
  if Tipo = 'I' then
    Sql :=
        '  INSERT INTO TPO(                        ' + sLineBreak +
        '      NR_PROCESSO	                       ' + sLineBreak + // NÚMERO DA ORDEM (PEDIDO DE EXPORTAÇÃO)
        '     ,CD_IMPORTADOR	                     ' + sLineBreak + // IMPORTADOR CNPJ
        '     ,CD_EXPORTADOR	                     ' + sLineBreak + // EXPORTADOR (UNIDADE EXPORTADORA)
        '     ,CD_VIA_TRANSP	                     ' + sLineBreak + // VIA DE TRANSPORTE
        '     ,CD_PAIS_PROCEDENCIA	               ' + sLineBreak + // LOCAL DE EMBARQUE (PAÍS)
        '     ,CD_MOEDA_NEG	                       ' + sLineBreak + // MOEDA DA NEGOCIAÇÃO (PADRÃO NESTLÉ ATUAL DE DÓLAR)
        '     ,CD_INCOTERM      	                 ' + sLineBreak + // INCOTERM
        '     ,CD_LOCAL_EMBARQUE	                 ' + sLineBreak + // LOCAL DE EMBARQUE (CIDADE)
        '     ,CD_MOEDA_FRETE	                     ' + sLineBreak + // MOEDA DA NEGOCIAÇÃO (PADRÃO NESTLÉ ATUAL DE DÓLAR)
        '     ,CD_MOEDA_SEGURO	                   ' + sLineBreak + // MOEDA DA NEGOCIAÇÃO (PADRÃO NESTLÉ ATUAL DE DÓLAR)
        '     ,CD_MOEDA_CARGA	                     ' + sLineBreak + // MOEDA DA NEGOCIAÇÃO (PADRÃO NESTLÉ ATUAL DE DÓLAR)
        '     ,DT_ABERTURA                         ' + sLineBreak + // DATA ATUAL DA INTEGRAÇÃO
        '     ,PL_PO	                             ' + sLineBreak + // PESO LÍQUIDO TOTAL DO EMBARQUE (ORDEM/CNTR)
        '     ,PB_PO	                             ' + sLineBreak + // PESO BRUTO TOTAL DO EMBARQUE (ORDEM/CNTR)
        '     ,TX_OBSERVACAO	                     ' + sLineBreak + // CONDIÇÃO DE PAGAMENTO DESCRIÇÃO
        '     ,VL_FRETE_PREPAID	                   ' + sLineBreak + // VALOR DO FRETE
        '     ,VL_FRETE_COLLECT	                   ' + sLineBreak + // VALOR DO FRETE
        '     ,VL_SEGURO	                         ' + sLineBreak + // VALOR SEGURO
        '     ,VL_TOTAL	                           ' + sLineBreak + // PREÇO TOTAL DO EMBARQUE (ORDEM/CNTR) (VALOR FOB)
        '     ,DT_NECESSIDADE	                     ' + sLineBreak + // DATA DA DELIVERY
        '     ,CD_TIPO_FRETE	                     ' + sLineBreak + // TIPO DE FRETE (PREPAID/COLLECT)
        '     ,CD_LOCAL_DESEMBARQUE	               ' + sLineBreak + // LOCAL DE DESTINO (CIDADE)
        '     ,CD_EMPRESA	                         ' + sLineBreak + // IMPORTADOR CNPJ
        '     ,CD_USUARIO	                         ' + sLineBreak + // FIXAR: 0707 (TI)
        '     ,CD_AREA      	                     ' + sLineBreak + // FIXO: 58
        '     ,CD_SERVICO	                         ' + sLineBreak + // FIXO: 475
        '     ,IN_WEB	                             ' + sLineBreak + // FIXO: 1
        '     ,IN_COMISSAO	                       ' + sLineBreak + // FIXO: 0
        '     ,IN_DESCONTO	                       ' + sLineBreak + // FIXO: 0
        '     ,IN_INDICADOR_CONSIG_IMPORT          ' + sLineBreak + // FIXO: 0
        '     ,IN_INDIC_MULTMODAL	                 ' + sLineBreak + // FIXO: 0
        '     ,IN_FUNDAP	                         ' + sLineBreak + // FIXO: 0
        '     ,IN_INDIC_TX_JUROS	                 ' + sLineBreak + // FIXO: 0
        '     ,IN_SEGURO	                         ' + sLineBreak + // FIXO: 0
        '     ,PC_COMISSAO	                       ' + sLineBreak + // FIXO: 0
        '     ,PC_DESCONTO	                       ' + sLineBreak + // FIXO: 0
        '     ,PC_SEGURO	                         ' + sLineBreak + // FIXO: 0
        '     ,PC_COMISSAO_AGENTE	                 ' + sLineBreak + // FIXO: 0
        '     ,QT_TOTAL_PESO	                     ' + sLineBreak + // FIXO: 0
        '     ,QT_PORC_ICMS	                       ' + sLineBreak + // FIXO: 0
        '     ,QT_TOTAL_ITENS	                     ' + sLineBreak + // FIXO: 0
        '     ,QT_PORC_RED_ICMS	                   ' + sLineBreak + // FIXO: 0
        '     ,TP_CAMBIO	                         ' + sLineBreak + // FIXO: 0
        '     ,TX_JUROS	                           ' + sLineBreak + // FIXO: 0
        '     ,VL_COMISSAO	                       ' + sLineBreak + // FIXO: 0
        '     ,VL_CARGA	                           ' + sLineBreak + // FIXO: 0
        '     ,VL_CAMBIO	                         ' + sLineBreak + // FIXO: 0
        '     ,VL_DESCONTO	                       ' + sLineBreak + // FIXO: 0
        '     ,VL_FRETE_TERRIT_NAC	               ' + sLineBreak + // FIXO: 0
        '     ,VL_TOTAL_PARCELA	                   ' + sLineBreak + // FIXO: 0
        '     ,VL_PAGTO_ANTECIPADO	               ' + sLineBreak + // FIXO: 0
        '     ,VL_PAGTO_VISTA	                     ' + sLineBreak + // FIXO: 0
        '     ,VL_PERIODIC_MENSAL	                 ' + sLineBreak + // FIXO: 0
        '     ,VL_DESPESAS	                       ' + sLineBreak + // FIXO: 0
        '     ,VL_DESCONTOS	                       ' + sLineBreak + // FIXO: 0
        '     ,IN_SELECIONADO	                     ' + sLineBreak + // FIXO: 0
        '     ,IN_MONTADO	                         ' + sLineBreak + // FIXO: 0
        '     ,IN_IND_COND_MERC	                   ' + sLineBreak + // FIXO: 0
        '     ,IN_IND_CAMBIO_ITENS	               ' + sLineBreak + // FIXO: 0
        '     ,QT_TOTAL_DISPONIVEL	               ' + sLineBreak + // FIXO: 0
        '     ,IN_ENTREPOSTO	                     ' + sLineBreak + // FIXO: 0
        '     ,IN_FATURADO	                       ' + sLineBreak + // FIXO: 0
        '     ,IN_IMEDIATO	                       ' + sLineBreak + // FIXO: 0
        '     ,VL_FRETE_INTERNO	                   ' + sLineBreak + // FIXO: 0
        '     ,VL_EMBALAGEM	                       ' + sLineBreak + // FIXO: 0
        '     ,VL_PB_EMBALAGEM	                   ' + sLineBreak + // FIXO: 0
        '     ,VL_PL_EMBALAGEM	                   ' + sLineBreak + // FIXO: 0
        '     ,IN_CARGA_PERIGOSA	                 ' + sLineBreak + // FIXO: 0
        '     ,VL_M3	                             ' + sLineBreak + // FIXO: 0
        '  )                                       ' + sLineBreak +
        '  VALUES                                  ' + sLineBreak +
        '  (  :NR_PROCESSO	                       ' + sLineBreak +
        '    ,:CD_IMPORTADOR	                     ' + sLineBreak +
        '    ,:CD_EXPORTADOR	                     ' + sLineBreak +
        '    ,:CD_VIA_TRANSP	                     ' + sLineBreak +
        '    ,:CD_PAIS_PROCEDENCIA	               ' + sLineBreak +
        '    ,:CD_MOEDA_NEG	                       ' + sLineBreak +
        '    ,:CD_INCOTERM      	                 ' + sLineBreak +
        '    ,:CD_LOCAL_EMBARQUE	                 ' + sLineBreak +
        '    ,:CD_MOEDA_FRETE	                     ' + sLineBreak +
        '    ,:CD_MOEDA_SEGURO	                   ' + sLineBreak +
        '    ,:CD_MOEDA_CARGA	                     ' + sLineBreak +
        '    ,:DT_ABERTURA                         ' + sLineBreak +
        '    ,:PL_PO	                             ' + sLineBreak +
        '    ,:PB_PO	                             ' + sLineBreak +
        '    ,:TX_OBSERVACAO	                     ' + sLineBreak +
        '    ,:VL_FRETE_PREPAID	                   ' + sLineBreak +
        '    ,:VL_FRETE_COLLECT	                   ' + sLineBreak +
        '    ,:VL_SEGURO	                         ' + sLineBreak +
        '    ,:VL_TOTAL	                           ' + sLineBreak +
        '    ,:DT_NECESSIDADE	                     ' + sLineBreak +
        '    ,:CD_TIPO_FRETE	                     ' + sLineBreak +
        '    ,:CD_LOCAL_DESEMBARQUE	               ' + sLineBreak +
        '    ,:CD_EMPRESA	                         ' + sLineBreak +
        '    ,:CD_USUARIO	                         ' + sLineBreak +
        '    ,:CD_AREA      	                     ' + sLineBreak +
        '    ,:CD_SERVICO	                         ' + sLineBreak +
        '    ,:IN_WEB	                             ' + sLineBreak +
        '    ,:IN_COMISSAO	                       ' + sLineBreak +
        '    ,:IN_DESCONTO	                       ' + sLineBreak +
        '    ,:IN_INDICADOR_CONSIG_IMPORT          ' + sLineBreak +
        '    ,:IN_INDIC_MULTMODAL	                 ' + sLineBreak +
        '    ,:IN_FUNDAP	                         ' + sLineBreak +
        '    ,:IN_INDIC_TX_JUROS	                 ' + sLineBreak +
        '    ,:IN_SEGURO	                         ' + sLineBreak +
        '    ,:PC_COMISSAO	                       ' + sLineBreak +
        '    ,:PC_DESCONTO	                       ' + sLineBreak +
        '    ,:PC_SEGURO	                         ' + sLineBreak +
        '    ,:PC_COMISSAO_AGENTE	                 ' + sLineBreak +
        '    ,:QT_TOTAL_PESO	                     ' + sLineBreak +
        '    ,:QT_PORC_ICMS	                       ' + sLineBreak +
        '    ,:QT_TOTAL_ITENS	                     ' + sLineBreak +
        '    ,:QT_PORC_RED_ICMS	                   ' + sLineBreak +
        '    ,:TP_CAMBIO	                         ' + sLineBreak +
        '    ,:TX_JUROS	                           ' + sLineBreak +
        '    ,:VL_COMISSAO	                       ' + sLineBreak +
        '    ,:VL_CARGA	                           ' + sLineBreak +
        '    ,:VL_CAMBIO	                         ' + sLineBreak +
        '    ,:VL_DESCONTO	                       ' + sLineBreak +
        '    ,:VL_FRETE_TERRIT_NAC	               ' + sLineBreak +
        '    ,:VL_TOTAL_PARCELA	                   ' + sLineBreak +
        '    ,:VL_PAGTO_ANTECIPADO	               ' + sLineBreak +
        '    ,:VL_PAGTO_VISTA	                     ' + sLineBreak +
        '    ,:VL_PERIODIC_MENSAL	                 ' + sLineBreak +
        '    ,:VL_DESPESAS	                       ' + sLineBreak +
        '    ,:VL_DESCONTOS	                       ' + sLineBreak +
        '    ,:IN_SELECIONADO	                     ' + sLineBreak +
        '    ,:IN_MONTADO	                         ' + sLineBreak +
        '    ,:IN_IND_COND_MERC	                   ' + sLineBreak +
        '    ,:IN_IND_CAMBIO_ITENS	               ' + sLineBreak +
        '    ,:QT_TOTAL_DISPONIVEL	               ' + sLineBreak +
        '    ,:IN_ENTREPOSTO	                     ' + sLineBreak +
        '    ,:IN_FATURADO	                       ' + sLineBreak +
        '    ,:IN_IMEDIATO	                       ' + sLineBreak +
        '    ,:VL_FRETE_INTERNO	                   ' + sLineBreak +
        '    ,:VL_EMBALAGEM	                       ' + sLineBreak +
        '    ,:VL_PB_EMBALAGEM	                   ' + sLineBreak +
        '    ,:VL_PL_EMBALAGEM	                   ' + sLineBreak +
        '    ,:IN_CARGA_PERIGOSA	                 ' + sLineBreak +
        '    ,:VL_M3                               ' + sLineBreak +
        '  )                                       ' + sLineBreak
  else
    Sql :=
       '    UPDATE TPO                                                         ' + sLineBreak +
       '       SET  CD_VIA_TRANSP	             =  :CD_VIA_TRANSP	             ' + sLineBreak +
       '           ,CD_PAIS_PROCEDENCIA	       =  :CD_PAIS_PROCEDENCIA	       ' + sLineBreak +
       '           ,CD_MOEDA_NEG	             =  :CD_MOEDA_NEG	               ' + sLineBreak +
       '           ,CD_INCOTERM      	         =  :CD_INCOTERM      	         ' + sLineBreak +
       '           ,CD_LOCAL_EMBARQUE	         =  :CD_LOCAL_EMBARQUE	         ' + sLineBreak +
       '           ,CD_MOEDA_FRETE	           =  :CD_MOEDA_FRETE	             ' + sLineBreak +
       '           ,CD_MOEDA_SEGURO	           =  :CD_MOEDA_SEGURO	           ' + sLineBreak +
       '           ,CD_MOEDA_CARGA	           =  :CD_MOEDA_CARGA	             ' + sLineBreak +
       '           ,DT_ABERTURA                =  :DT_ABERTURA                 ' + sLineBreak +
       '           ,PL_PO	                     =  :PL_PO	                     ' + sLineBreak +
       '           ,PB_PO	                     =  :PB_PO	                     ' + sLineBreak +
       '           ,TX_OBSERVACAO	             =  :TX_OBSERVACAO	             ' + sLineBreak +
       '           ,VL_FRETE_PREPAID	         =  :VL_FRETE_PREPAID	           ' + sLineBreak +
       '           ,VL_FRETE_COLLECT	         =  :VL_FRETE_COLLECT	           ' + sLineBreak +
       '           ,VL_SEGURO	                 =  :VL_SEGURO	                 ' + sLineBreak +
       '           ,VL_TOTAL	                 =  :VL_TOTAL	                   ' + sLineBreak +
       '           ,DT_NECESSIDADE	           =  :DT_NECESSIDADE	             ' + sLineBreak +
       '           ,CD_TIPO_FRETE	             =  :CD_TIPO_FRETE	             ' + sLineBreak +
       '           ,CD_LOCAL_DESEMBARQUE	     =  :CD_LOCAL_DESEMBARQUE	       ' + sLineBreak +
       '           ,CD_USUARIO	               =  :CD_USUARIO	                 ' + sLineBreak +
       '           ,CD_AREA      	             =  :CD_AREA      	             ' + sLineBreak +
       '           ,CD_SERVICO	               =  :CD_SERVICO	                 ' + sLineBreak +
       '           ,IN_WEB	                   =  :IN_WEB	                     ' + sLineBreak +
       '           ,IN_COMISSAO	               =  :IN_COMISSAO	               ' + sLineBreak +
       '           ,IN_DESCONTO	               =  :IN_DESCONTO	               ' + sLineBreak +
       '           ,IN_INDICADOR_CONSIG_IMPORT =  :IN_INDICADOR_CONSIG_IMPORT  ' + sLineBreak +
       '           ,IN_INDIC_MULTMODAL	       =  :IN_INDIC_MULTMODAL	         ' + sLineBreak +
       '           ,IN_FUNDAP	                 =  :IN_FUNDAP	                 ' + sLineBreak +
       '           ,IN_INDIC_TX_JUROS	         =  :IN_INDIC_TX_JUROS	         ' + sLineBreak +
       '           ,IN_SEGURO	                 =  :IN_SEGURO	                 ' + sLineBreak +
       '           ,PC_COMISSAO	               =  :PC_COMISSAO	               ' + sLineBreak +
       '           ,PC_DESCONTO	               =  :PC_DESCONTO	               ' + sLineBreak +
       '           ,PC_SEGURO	                 =  :PC_SEGURO	                 ' + sLineBreak +
       '           ,PC_COMISSAO_AGENTE	       =  :PC_COMISSAO_AGENTE	         ' + sLineBreak +
       '           ,QT_TOTAL_PESO	             =  :QT_TOTAL_PESO	             ' + sLineBreak +
       '           ,QT_PORC_ICMS	             =  :QT_PORC_ICMS	               ' + sLineBreak +
       '           ,QT_TOTAL_ITENS	           =  :QT_TOTAL_ITENS	             ' + sLineBreak +
       '           ,QT_PORC_RED_ICMS	         =  :QT_PORC_RED_ICMS	           ' + sLineBreak +
       '           ,TP_CAMBIO	                 =  :TP_CAMBIO	                 ' + sLineBreak +
       '           ,TX_JUROS	                 =  :TX_JUROS	                   ' + sLineBreak +
       '           ,VL_COMISSAO	               =  :VL_COMISSAO	               ' + sLineBreak +
       '           ,VL_CARGA	                 =  :VL_CARGA	                   ' + sLineBreak +
       '           ,VL_CAMBIO	                 =  :VL_CAMBIO	                 ' + sLineBreak +
       '           ,VL_DESCONTO	               =  :VL_DESCONTO	               ' + sLineBreak +
       '           ,VL_FRETE_TERRIT_NAC	       =  :VL_FRETE_TERRIT_NAC	       ' + sLineBreak +
       '           ,VL_TOTAL_PARCELA	         =  :VL_TOTAL_PARCELA	           ' + sLineBreak +
       '           ,VL_PAGTO_ANTECIPADO	       =  :VL_PAGTO_ANTECIPADO	       ' + sLineBreak +
       '           ,VL_PAGTO_VISTA	           =  :VL_PAGTO_VISTA	             ' + sLineBreak +
       '           ,VL_PERIODIC_MENSAL	       =  :VL_PERIODIC_MENSAL	         ' + sLineBreak +
       '           ,VL_DESPESAS	               =  :VL_DESPESAS	               ' + sLineBreak +
       '           ,VL_DESCONTOS	             =  :VL_DESCONTOS	               ' + sLineBreak +
       '           ,IN_SELECIONADO	           =  :IN_SELECIONADO	             ' + sLineBreak +
       '           ,IN_MONTADO	               =  :IN_MONTADO	                 ' + sLineBreak +
       '           ,IN_IND_COND_MERC	         =  :IN_IND_COND_MERC	           ' + sLineBreak +
       '           ,IN_IND_CAMBIO_ITENS	       =  :IN_IND_CAMBIO_ITENS	       ' + sLineBreak +
       '           ,QT_TOTAL_DISPONIVEL	       =  :QT_TOTAL_DISPONIVEL	       ' + sLineBreak +
       '           ,IN_ENTREPOSTO	             =  :IN_ENTREPOSTO	             ' + sLineBreak +
       '           ,IN_FATURADO	               =  :IN_FATURADO	               ' + sLineBreak +
       '           ,IN_IMEDIATO	               =  :IN_IMEDIATO	               ' + sLineBreak +
       '           ,VL_FRETE_INTERNO	         =  :VL_FRETE_INTERNO	           ' + sLineBreak +
       '           ,VL_EMBALAGEM	             =  :VL_EMBALAGEM	               ' + sLineBreak +
       '           ,VL_PB_EMBALAGEM	           =  :VL_PB_EMBALAGEM	           ' + sLineBreak +
       '           ,VL_PL_EMBALAGEM	           =  :VL_PL_EMBALAGEM	           ' + sLineBreak +
       '           ,IN_CARGA_PERIGOSA	         =  :IN_CARGA_PERIGOSA	         ' + sLineBreak +
       '           ,VL_M3	                     =  :VL_M3                       ' + sLineBreak +
       '           ,CD_IMPORTADOR	             =  :CD_IMPORTADOR	             ' + sLineBreak +
       '           ,CD_EXPORTADOR	             =  :CD_EXPORTADOR	             ' + sLineBreak +
       '    FROM TPO                                                           ' + sLineBreak +
       '    WHERE NR_PROCESSO	    =  :NR_PROCESSO	                             ' + sLineBreak +
       '      AND CD_EMPRESA      =  :CD_EMPRESA	                             ' + sLineBreak;

  Result := Sql;
end;

function TFrmMain.GetSQLTPO_ITEM : String;
begin
   result :=
        '   INSERT INTO TPO_ITEM (                ' + sLineBreak +
        '       NR_PROCESSO   	                  ' + sLineBreak + //  NÚMERO DA ORDEM (PEDIDO DE EXPORTAÇÃO)
        '      ,NR_ITEM	                          ' + sLineBreak + //  SEQUENCIAL
        '      ,CD_EXPORTADOR	                    ' + sLineBreak + //  EXPORTADOR (UNIDADE EXPORTADORA)
        '      ,CD_MERCADORIA	                    ' + sLineBreak + //  CÓDIGO
        '      ,CD_FABRICANTE	                    ' + sLineBreak + //  FABRICANTE
        '      ,CD_PAIS_ORIGEM	                  ' + sLineBreak + //  COD PAIS FABRICANTE
        '      ,CD_NCM_SH	                        ' + sLineBreak + //  NCM POR ITEM (SKU)
        '      ,CD_MOEDA_NEGOCIADA	              ' + sLineBreak + //  MOEDA DA NEGOCIAÇÃO (PADRÃO NESTLÉ ATUAL DE DÓLAR)
        '      ,CD_INCOTERM   	                  ' + sLineBreak + //  INCOTERM
        '      ,CD_UNID_MEDIDA	                  ' + sLineBreak + //  UNIDADE DE MEDIDA DESCRIÇÃO
        '      ,PL_ITEM	                          ' + sLineBreak + //  PESO LÍQUIDO TOTAL DO EMBARQUE (ORDEM/CNTR)
        '      ,QT_INICIAL	                      ' + sLineBreak + //  QUANTIDADE POR ITEM (SKU)
        '      ,TX_MERCADORIA	                    ' + sLineBreak + //  PRODUTO DESCRIÇÃO PORTUGUÊS
        '      ,VL_UNITARIO	                      ' + sLineBreak + //  PREÇO UNITÁRIO POR ITEM (SKU)
        '      ,VL_TOTAL	                        ' + sLineBreak + //  PREÇO TOTAL POR ITEM (SKU)
        '      ,QT_DISPONIVEL	                    ' + sLineBreak + //  IGUAL A QT_INICIAL
        '      ,QT_INICIAL_EST	                  ' + sLineBreak + //  QUANTIDADE POR ITEM (SKU)
        '      ,NR_ITEM_CLIENTE	                  ' + sLineBreak + //  SEGUIR A SEQUENCIA DO NR_ITEM
        '      ,TX_OBSERVACAO	                    ' + sLineBreak + //  CONDIÇÃO DE PAGAMENTO DESCRIÇÃO
        '      ,IN_UTILIZADO_INSTR_DESEMB	        ' + sLineBreak + //  "PRIMEIRA LINHA=0 SEGUNDA LINHA=1 ***SEGUIR ANALISE DA PRIMEIRA COLUNA (DUAS LINHAS POR PEDIDO)"
        '      ,ID_CODIGO_INSTR_DESEMB	          ' + sLineBreak + //  "PRIMEIRA LINHA=NULL SEGUNDA LINHA=UTILIZAR A ID CRIADA ***SEGUIR ANALISE DA PRIMEIRA COLUNA (DUAS LINHAS POR PEDIDO)"
        '      ,NR_PARCIAL	                      ' + sLineBreak + //  "PRIMEIRA LINHA=0 SEGUNDA LINHA=1 ***SEGUIR ANALISE DA PRIMEIRA COLUNA (DUAS LINHAS POR PEDIDO)"
        '      ,CD_EMPRESA	                      ' + sLineBreak + //  IMPORTADOR CNPJ
        '      ,NR_PLANTA	                        ' + sLineBreak + //  CÓDIGO IMPORTADOR XML(NR_PLANTA)
        '      ,QT_BAIXADA_DI	                    ' + sLineBreak + //  FIXO: 0
        '      ,QT_BAIXADA_LI	                    ' + sLineBreak + //  FIXO: 0
        '      ,QT_ESPEC_II	                      ' + sLineBreak + //  FIXO: 0
        '      ,QT_ESPEC_IPI	                    ' + sLineBreak + //  FIXO: 0
        '      ,QT_AD	                            ' + sLineBreak + //  FIXO: 0
        '      ,QT_MED_ESTATISTICA	              ' + sLineBreak + //  FIXO: 0
        '      ,TP_IND_TX_JUROS	                  ' + sLineBreak + //  FIXO: 0
        '      ,TX_JUROS_CAMBIO	                  ' + sLineBreak + //  FIXO: 0
        '      ,VL_DESPESA_MOEDA	                ' + sLineBreak + //  FIXO: 0
        '      ,VL_DESCONTO_MOEDA	                ' + sLineBreak + //  FIXO: 0
        '      ,VL_DESCONTO	                      ' + sLineBreak + //  FIXO: 0
        '      ,VL_COMISSAO	                      ' + sLineBreak + //  FIXO: 0
        '      ,VL_ESPEC_II	                      ' + sLineBreak + //  FIXO: 0
        '      ,VL_ESPEC_IPI	                    ' + sLineBreak + //  FIXO: 0
        '      ,VL_ESPEC_AD	                      ' + sLineBreak + //  FIXO: 0
        '      ,VL_TOTAL_PARCELAS	                ' + sLineBreak + //  FIXO: 0
        '      ,VL_COBERT_ACIMA_360	              ' + sLineBreak + //  FIXO: 0
        '      ,VL_PAGTO_ANTECIPADO	              ' + sLineBreak + //  FIXO: 0
        '      ,VL_PAGTO_AVISTA	                  ' + sLineBreak + //  FIXO: 0
        '      ,VL_FRETE_NAC_MOEDA	              ' + sLineBreak + //  FIXO: 0
        '      ,VL_SEGURO_MOEDA                   ' + sLineBreak + //  FIXO: 0
        '      ,VL_ACRESC_MOEDA                   ' + sLineBreak + //  FIXO: 0
        '      ,VL_DEDUC_MOEDA	                  ' + sLineBreak + //  FIXO: 0
        '      ,VL_FRETE_PREPAID_MOEDA	          ' + sLineBreak + //  FIXO: 0
        '      ,VL_FRETE_COLLECT	                ' + sLineBreak + //  FIXO: 0
        '      ,IN_SELECIONADO       	            ' + sLineBreak + //  FIXO: 0
        '      ,QT_BAIXAR	                        ' + sLineBreak + //  FIXO: 0
        '      ,IN_MONTADO	                      ' + sLineBreak + //  FIXO: 0
        '      ,IN_FABR_EXP_PROD	                ' + sLineBreak + //  FIXO: 0
        '      ,IN_IND_COND_MERC	                ' + sLineBreak + //  FIXO: 0
        '      ,IN_IND_PERIODICIDADE	            ' + sLineBreak + //  FIXO: 0
        '      ,IN_REG_TRIB_IPI	                  ' + sLineBreak + //  FIXO: 0
        '      ,CD_MODALIDADE	                    ' + sLineBreak + //  FIXO: 0
        '      ,IN_AVISO_DB    	                  ' + sLineBreak + //  FIXO: 0
        '      ,TP_STATUS_CRODA 	                ' + sLineBreak + //  FIXO: 0
        '   )                                     ' + sLineBreak +
        '   VALUES (                              ' + sLineBreak +
        '     :NR_PROCESSO   	                    ' + sLineBreak +
        '    ,:NR_ITEM	                          ' + sLineBreak +
        '    ,:CD_EXPORTADOR	                    ' + sLineBreak +
        '    ,:CD_MERCADORIA	                    ' + sLineBreak +
        '    ,:CD_FABRICANTE	                    ' + sLineBreak +
        '    ,:CD_PAIS_ORIGEM	                    ' + sLineBreak +
        '    ,:CD_NCM_SH	                        ' + sLineBreak +
        '    ,:CD_MOEDA_NEGOCIADA	                ' + sLineBreak +
        '    ,:CD_INCOTERM   	                    ' + sLineBreak +
        '    ,:CD_UNID_MEDIDA	                    ' + sLineBreak +
        '    ,:PL_ITEM	                          ' + sLineBreak +
        '    ,:QT_INICIAL	                        ' + sLineBreak +
        '    ,:TX_MERCADORIA	                    ' + sLineBreak +
        '    ,:VL_UNITARIO	                      ' + sLineBreak +
        '    ,:VL_TOTAL	                          ' + sLineBreak +
        '    ,:QT_DISPONIVEL	                    ' + sLineBreak +
        '    ,:QT_INICIAL_EST	                    ' + sLineBreak +
        '    ,:NR_ITEM_CLIENTE	                  ' + sLineBreak +
        '    ,:TX_OBSERVACAO	                    ' + sLineBreak +
        '    ,:IN_UTILIZADO_INSTR_DESEMB	        ' + sLineBreak +
        '    ,:ID_CODIGO_INSTR_DESEMB	            ' + sLineBreak +
        '    ,:NR_PARCIAL	                        ' + sLineBreak +
        '    ,:CD_EMPRESA	                        ' + sLineBreak +
        '    ,:NR_PLANTA	                        ' + sLineBreak +
        '    ,:QT_BAIXADA_DI	                    ' + sLineBreak +
        '    ,:QT_BAIXADA_LI	                    ' + sLineBreak +
        '    ,:QT_ESPEC_II	                      ' + sLineBreak +
        '    ,:QT_ESPEC_IPI	                      ' + sLineBreak +
        '    ,:QT_AD	                            ' + sLineBreak +
        '    ,:QT_MED_ESTATISTICA	                ' + sLineBreak +
        '    ,:TP_IND_TX_JUROS	                  ' + sLineBreak +
        '    ,:TX_JUROS_CAMBIO	                  ' + sLineBreak +
        '    ,:VL_DESPESA_MOEDA	                  ' + sLineBreak +
        '    ,:VL_DESCONTO_MOEDA	                ' + sLineBreak +
        '    ,:VL_DESCONTO	                      ' + sLineBreak +
        '    ,:VL_COMISSAO	                      ' + sLineBreak +
        '    ,:VL_ESPEC_II	                      ' + sLineBreak +
        '    ,:VL_ESPEC_IPI	                      ' + sLineBreak +
        '    ,:VL_ESPEC_AD	                      ' + sLineBreak +
        '    ,:VL_TOTAL_PARCELAS	                ' + sLineBreak +
        '    ,:VL_COBERT_ACIMA_360	              ' + sLineBreak +
        '    ,:VL_PAGTO_ANTECIPADO	              ' + sLineBreak +
        '    ,:VL_PAGTO_AVISTA	                  ' + sLineBreak +
        '    ,:VL_FRETE_NAC_MOEDA	                ' + sLineBreak +
        '    ,:VL_SEGURO_MOEDA                    ' + sLineBreak +
        '    ,:VL_ACRESC_MOEDA                    ' + sLineBreak +
        '    ,:VL_DEDUC_MOEDA	                    ' + sLineBreak +
        '    ,:VL_FRETE_PREPAID_MOEDA	            ' + sLineBreak +
        '    ,:VL_FRETE_COLLECT	                  ' + sLineBreak +
        '    ,:IN_SELECIONADO       	            ' + sLineBreak +
        '    ,:QT_BAIXAR	                        ' + sLineBreak +
        '    ,:IN_MONTADO	                        ' + sLineBreak +
        '    ,:IN_FABR_EXP_PROD	                  ' + sLineBreak +
        '    ,:IN_IND_COND_MERC	                  ' + sLineBreak +
        '    ,:IN_IND_PERIODICIDADE	              ' + sLineBreak +
        '    ,:IN_REG_TRIB_IPI	                  ' + sLineBreak +
        '    ,:CD_MODALIDADE	                    ' + sLineBreak +
        '    ,:IN_AVISO_DB    	                  ' + sLineBreak +
        '    ,:TP_STATUS_CRODA 	                  ' + sLineBreak +
        '    )                                    ' + sLineBreak;
end;

function TFrmMain.IntegraTINSTRUCAO_DESEMBARACO(DadosPedido :TPedido_Impo) : TResultadoIntegracaoInstrucaoDesemb;
var
  ResultadoInstrucaoDesemb : TResultadoIntegracaoInstrucaoDesemb;
begin
  Log('Integra TINSTRUCAO_DESEMBARACO ', Logar);
  try
    dmdBroker.qryTINSTRUCAO_DESEMBARACO.close;

    {$region 'Define Chave e tipo de query'}
    ResultadoInstrucaoDesemb.ChaveInst_Dembaraco := BuscaTINSTRUCAO_DESEMBARACOCadastrada(DadosPedido.CD_IMPORTADOR,  DadosPedido.NR_ORDEM);
    if ResultadoInstrucaoDesemb.ChaveInst_Dembaraco <> '' then
    begin
      SetLength(lResultadoProcessamento,Length(lResultadoProcessamento)+1);
      lResultadoProcessamento[Length(lResultadoProcessamento)-1].Tipo  := 'A';
      lResultadoProcessamento[Length(lResultadoProcessamento)-1].Texto := DadosPedido.NR_ORDEM;

      dmdBroker.qryTINSTRUCAO_DESEMBARACO.SQL.Text := GetSQLTINSTRUCAO_DESEMBARACO('U');
    end
    else
    begin
      SetLength(lResultadoProcessamento,Length(lResultadoProcessamento)+1);
      lResultadoProcessamento[Length(lResultadoProcessamento)-1].Tipo  := 'I';
      lResultadoProcessamento[Length(lResultadoProcessamento)-1].Texto := DadosPedido.NR_ORDEM;

      ResultadoInstrucaoDesemb.ChaveInst_Dembaraco := BuscaNovaChaveTINSTRUCAO_DESEMBARACO;

      dmdBroker.qryTINSTRUCAO_DESEMBARACO.SQL.Text := GetSQLTINSTRUCAO_DESEMBARACO('I');
    end;
    {$endregion}

    dmdBroker.qryTINSTRUCAO_DESEMBARACO.ParamByName('ID_CODIGO').Value                := ResultadoInstrucaoDesemb.ChaveInst_Dembaraco;
    dmdBroker.qryTINSTRUCAO_DESEMBARACO.ParamByName('CD_CLIENTE').Value               := DadosPedido.CD_IMPORTADOR;
    dmdBroker.qryTINSTRUCAO_DESEMBARACO.ParamByName('ID_CLIENTE').Value               := DadosPedido.NR_ORDEM;
    dmdBroker.qryTINSTRUCAO_DESEMBARACO.ParamByName('DT_CRIACAO').Value               := now;
    dmdBroker.qryTINSTRUCAO_DESEMBARACO.ParamByName('CD_USUARIO').Value               := '0707';
    dmdBroker.qryTINSTRUCAO_DESEMBARACO.ParamByName('IN_AUTORIZADO').Value            := 0;
    dmdBroker.qryTINSTRUCAO_DESEMBARACO.ParamByName('CD_RESPONSAVEL').Value           := '0707';
    dmdBroker.qryTINSTRUCAO_DESEMBARACO.ParamByName('TX_OBSERVACOES').Value           := DadosPedido.CONDICAO_PAGAMENTO_DESC;
    dmdBroker.qryTINSTRUCAO_DESEMBARACO.ParamByName('CD_MODAL').Value                 := DadosPedido.CD_VIA_TRANSPORTE;
    dmdBroker.qryTINSTRUCAO_DESEMBARACO.ParamByName('CD_PAIS_PROCEDENCIA').Value      := DadosPedido.CD_EMBARQUE_PAIS;
    dmdBroker.qryTINSTRUCAO_DESEMBARACO.ParamByName('CD_MOEDA_FRETE').Value           := DadosPedido.CD_MOEDA;
    dmdBroker.qryTINSTRUCAO_DESEMBARACO.ParamByName('CD_LOCAL_EMBARQUE').Value        := DadosPedido.CD_EMBARQUE_CIDADE;
    dmdBroker.qryTINSTRUCAO_DESEMBARACO.ParamByName('CD_INCOTERM').Value              := DadosPedido.INCOTERM;
    dmdBroker.qryTINSTRUCAO_DESEMBARACO.ParamByName('CD_TIPO_FRETE').Value            := DadosPedido.CD_TIPO_FRETE;
    dmdBroker.qryTINSTRUCAO_DESEMBARACO.ParamByName('VL_SEGURO_MNEG').Value           := StrToFloat(StringReplace(StringReplace(DadosPedido.VALOR_SEGURO,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));
    if uppercase(DadosPedido.TIPO_FRETE) = 'PREPAID' then
    begin
      dmdBroker.qryTINSTRUCAO_DESEMBARACO.ParamByName('VL_FRETE_PREPAID_MNEG').Value  := StrToFloat(StringReplace(StringReplace(DadosPedido.VALOR_FRETE,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));
      dmdBroker.qryTINSTRUCAO_DESEMBARACO.ParamByName('VL_FRETE_COLLECT_MNEG').Value  := 0;
    end
    else
    begin
      dmdBroker.qryTINSTRUCAO_DESEMBARACO.ParamByName('VL_FRETE_PREPAID_MNEG').Value  := 0;
      dmdBroker.qryTINSTRUCAO_DESEMBARACO.ParamByName('VL_FRETE_COLLECT_MNEG').Value  := StrToFloat(StringReplace(StringReplace(DadosPedido.VALOR_FRETE,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));
    end;
    dmdBroker.qryTINSTRUCAO_DESEMBARACO.ExecSQL;

    if dmdBroker.qryTINSTRUCAO_DESEMBARACO.RowsAffected > 0 then
      ResultadoInstrucaoDesemb.Integrou  := True
    else
      ResultadoInstrucaoDesemb.Integrou := False;

    result := ResultadoInstrucaoDesemb;
  except on e:Exception do
    begin
       ResultadoInstrucaoDesemb.Integrou := false;
       result := ResultadoInstrucaoDesemb;
       Log('Erro ao inserir: TINSTRUCAO_DESEMBARACO' + #13#10 + E.Message, Logar);
    end;
  end;
end;

function TFrmMain.IntegraTINSTRUCAO_DESEMBARACO_PEDIDO(Lista : Lista_TPedido_Item_Impo; chaveInstrucaoDesemb : String) : Boolean;
var
  i : Integer;
  DataAtual : TDateTime;
begin
  Log('Integra TINSTRUCAO_DESEMBARACO_PEDIDO ', Logar);
  try
    DataAtual := now;
    result    := true;

    //Limpa os itens antes de inserir (caso o arquivo tenha sido enviado mais de uma vez.
    DeletaItemTINSTRUCAO_DESEMBARACO_PEDIDO(chaveInstrucaoDesemb, Lista[0].ORDEM);
    for I := 0 to Length(Lista)-1 do
    begin
      dmdBroker.qryTINSTRUCAO_DESEMBARACO_PEDIDO.close;
      dmdBroker.qryTINSTRUCAO_DESEMBARACO_PEDIDO.SQL.Text := GetSQLTINSTRUCAO_DESEMBARACO_PEDIDO;

      dmdBroker.qryTINSTRUCAO_DESEMBARACO_PEDIDO.ParamByName('ID_CODIGO').value      := chaveInstrucaoDesemb;
      dmdBroker.qryTINSTRUCAO_DESEMBARACO_PEDIDO.ParamByName('NR_REFERENCIA').value  := Lista[i].ORDEM;
      dmdBroker.qryTINSTRUCAO_DESEMBARACO_PEDIDO.ParamByName('NR_ITEM_PO').value     := FormatFloat('0000',StrtoInt(Lista[i].NR_ITEM_PO));
      dmdBroker.qryTINSTRUCAO_DESEMBARACO_PEDIDO.ParamByName('NR_PARCIAL').value     := 1;
      dmdBroker.qryTINSTRUCAO_DESEMBARACO_PEDIDO.ParamByName('DT_INCLUSAO').value    := DataAtual;

      dmdBroker.qryTINSTRUCAO_DESEMBARACO_PEDIDO.ExecSql;

      if (dmdBroker.qryTINSTRUCAO_DESEMBARACO_PEDIDO.RowsAffected > 0) and result then
        result := True
      else
        result := False;
    end;
  except on e:Exception do
    begin
       result := false;
       Log('Erro ao inserir: TINSTRUCAO_DESEMBARACO_PEDIDO' + #13#10 + E.Message, Logar);
    end;
  end;
end;

function TFrmMain.InsereTProcesso(DadosPedido :TPedido_Impo) : Boolean;
const
  _PREFIXO = 'NE';
var
  Processo: String;
begin
  Result := true;

  try
    {verificar se o processo ja existe!}
    dmdBroker.qryBroker.close;
    dmdBroker.qryBroker.Open(' SELECT NR_PROCESSO AS NR_PROCESSO              ' +
                             '   FROM TPROCESSO (NOLOCK)                      ' +
                             '  WHERE CD_UNID_NEG   = :CD_UNID_NEG            ' +
                             '    AND CD_PRODUTO    = :CD_PRODUTO             ' +
                             '    AND SUBSTRING(NR_PROCESSO, 5, 2) = :PREFIXO ' +
                             '    AND NR_REFERENCIA = :NR_REFERENCIA          ' +
                             '    AND CD_GRUPO      = :CD_GRUPO               ',
                             ['01', '06', _PREFIXO, DadosPedido.NR_ORDEM, GrupoNestle]);

    if not dmdBroker.qryBroker.IsEmpty then
    begin
      {existe ---> faz update}
      Processo := dmdBroker.qryBroker.FieldByName('NR_PROCESSO').AsString;

      dmdBroker.qryBroker.close;
      dmdBroker.qryBroker.SQL.Clear;
      dmdBroker.qryBroker.SQL.Text := ' UPDATE TPROCESSO                           '+
                                      '    SET CD_CLIENTE      = :CD_CLIENTE       '+
                                      '       ,CD_INCOTERM     = :CD_INCOTERM      '+
                                      '       ,CD_IMPORTADOR   = :CD_IMPORTADOR    '+
                                      '       ,VL_PESO_LIQUIDO = :VL_PESO_LIQUIDO  '+
                                      '       ,VL_PESO_BRUTO   = :VL_PESO_BRUTO    '+
                                      '       ,VL_M3           = :VL_M3            '+
                                      '   FROM TPROCESSO (NOLOCK)                  '+
                                      '  WHERE NR_PROCESSO = :NR_PROCESSO          ';

      dmdBroker.qryBroker.Params.ParamByName('NR_PROCESSO').AsString     := Processo;
      dmdBroker.qryBroker.Params.ParamByName('CD_CLIENTE').AsString      := DadosPedido.CD_IMPORTADOR;
      dmdBroker.qryBroker.Params.ParamByName('CD_INCOTERM').AsString     := DadosPedido.INCOTERM;
      dmdBroker.qryBroker.Params.ParamByName('CD_IMPORTADOR').AsString   := DadosPedido.CD_IMPORTADOR;
      dmdBroker.qryBroker.Params.ParamByName('VL_PESO_LIQUIDO').AsString := DadosPedido.PESO_LIQUIDO;
      dmdBroker.qryBroker.Params.ParamByName('VL_PESO_BRUTO').AsString   := DadosPedido.PESO_BRUTO;
      dmdBroker.qryBroker.Params.ParamByName('VL_M3').AsString           := DadosPedido.CUBAGEM;

      dmdBroker.qryBroker.ExecSQL;
    end
    else
    begin
      {não existe ---> pega a nova chave e faz insert}
      dmdBroker.qryBroker.close;
      dmdBroker.qryBroker.Open(' SELECT ISNULL(MAX(ISNULL(CONVERT(INT, SUBSTRING(NR_PROCESSO, 8, CHARINDEX(''-'', NR_PROCESSO, CHARINDEX(''-'', NR_PROCESSO)) - 1)), 0)), 0) AS PROCESSO' +
                               ' FROM TPROCESSO (NOLOCK) ' +
                               '  WHERE CD_UNID_NEG = :CD_UNID_NEG ' +
                               '    AND CD_PRODUTO  = :CD_PRODUTO ' +
                               '    AND DATEPART(YYYY, DT_ABERTURA) = DATEPART(YYYY, GETDATE()) ' +
                               '    AND SUBSTRING(NR_PROCESSO, 5, 2) = :PREFIXO',
                               ['01', '06', _PREFIXO]);

      Processo := dmdBroker.qryBroker.FieldByName('PROCESSO').AsString;
      Processo := Format('%s%s-%s-%s', ['0706', _PREFIXO, FormatFloat('000000', StrToFloat(Processo) + 1), FormatDateTime('YY', Now)]);


      dmdBroker.qryBroker.close;
      dmdBroker.qryBroker.SQL.Clear;
      dmdBroker.qryBroker.SQL.Text := ' INSERT INTO TPROCESSO                                '+ sLinebreak+
                                      ' ( NR_PROCESSO        ,CD_UNID_NEG                    '+ sLinebreak+
                                      '  ,CD_PRODUTO         ,NR_REFERENCIA                  '+ sLinebreak+
                                      '  ,CD_CLIENTE         ,IN_LIBERADO                    '+ sLinebreak+
                                      '  ,IN_CANCELADO       ,DT_ABERTURA                    '+ sLinebreak+
                                      '  ,HR_ABERTURA        ,IN_DADOS_IGUAIS_ITENS          '+ sLinebreak+
                                      '  ,CD_INCOTERM        ,CD_USUARIO                     '+ sLinebreak+
                                      '  ,CD_IMPORTADOR      ,CD_SERVICO                     '+ sLinebreak+
                                      '  ,CD_EXPORTADOR      ,CD_AREA                        '+ sLinebreak+
                                      '  ,VL_PESO_LIQUIDO    ,VL_PESO_BRUTO                  '+ sLinebreak+
                                      '  ,VL_M3                                              '+ sLinebreak+
                                      ' )                                                    '+ sLinebreak+
                                      ' VALUES                                               '+ sLinebreak+
                                      ' ( :NR_PROCESSO       ,:CD_UNID_NEG                   '+ sLinebreak+
                                      '  ,:CD_PRODUTO       ,:NR_REFERENCIA                  '+ sLinebreak+
                                      '  ,:CD_CLIENTE       ,:IN_LIBERADO                    '+ sLinebreak+
                                      '  ,:IN_CANCELADO     ,CONVERT(DATE, GETDATE(), 103)   '+ sLinebreak+
                                      '  ,GETDATE()         ,:IN_DADOS_IGUAIS_ITENS          '+ sLinebreak+
                                      '  ,:CD_INCOTERM      ,:CD_USUARIO                     '+ sLinebreak+
                                      '  ,:CD_IMPORTADOR    ,:CD_SERVICO                     '+ sLinebreak+
                                      '  ,:CD_EXPORTADOR    ,:CD_AREA                        '+ sLinebreak+
                                      '  ,:VL_PESO_LIQUIDO  ,:VL_PESO_BRUTO                  '+ sLinebreak+
                                      '  ,:VL_M3                                             '+ sLinebreak+
                                      ' )                                                    ';

      dmdBroker.qryBroker.Params.ParamByName('NR_PROCESSO').AsString           := Processo;
      dmdBroker.qryBroker.Params.ParamByName('CD_UNID_NEG').AsString           := '01';
      dmdBroker.qryBroker.Params.ParamByName('CD_PRODUTO').AsString            := '06';
      dmdBroker.qryBroker.Params.ParamByName('NR_REFERENCIA').AsString         := DadosPedido.NR_ORDEM;
      dmdBroker.qryBroker.Params.ParamByName('CD_CLIENTE').AsString            := DadosPedido.CD_IMPORTADOR;
      dmdBroker.qryBroker.Params.ParamByName('IN_LIBERADO').AsString           := '1';
      dmdBroker.qryBroker.Params.ParamByName('IN_CANCELADO').AsString          := '0';
      dmdBroker.qryBroker.Params.ParamByName('IN_DADOS_IGUAIS_ITENS').AsString := '1';
      dmdBroker.qryBroker.Params.ParamByName('CD_INCOTERM').AsString           := DadosPedido.INCOTERM;
      dmdBroker.qryBroker.Params.ParamByName('CD_USUARIO').AsString            := '0707';
      dmdBroker.qryBroker.Params.ParamByName('CD_IMPORTADOR').AsString         := DadosPedido.CD_IMPORTADOR;
      dmdBroker.qryBroker.Params.ParamByName('CD_SERVICO').AsString            := '475';
      dmdBroker.qryBroker.Params.ParamByName('CD_EXPORTADOR').AsString         := '';
      dmdBroker.qryBroker.Params.ParamByName('CD_AREA').AsString               := '';
      dmdBroker.qryBroker.Params.ParamByName('VL_PESO_LIQUIDO').AsString       := DadosPedido.PESO_LIQUIDO;
      dmdBroker.qryBroker.Params.ParamByName('VL_PESO_BRUTO').AsString         := DadosPedido.PESO_BRUTO;
      dmdBroker.qryBroker.Params.ParamByName('VL_M3').AsString                 := DadosPedido.CUBAGEM;

      dmdBroker.qryBroker.ExecSQL;

     { Atualizar grupo do processo - não funcionou no insert.}
      dmdBroker.qryBroker.close;
      dmdBroker.qryBroker.SQL.Clear;
      dmdBroker.qryBroker.SQL.Text := ' UPDATE TPROCESSO                   '+
                                      '    SET CD_GRUPO   = :CD_GRUPO      '+
                                      '   FROM TPROCESSO (NOLOCK)          '+
                                      '  WHERE NR_PROCESSO = :NR_PROCESSO  ';

      dmdBroker.qryBroker.Params.ParamByName('NR_PROCESSO').AsString  := Processo;
      dmdBroker.qryBroker.Params.ParamByName('CD_GRUPO').AsString     := GrupoNestle;
      dmdBroker.qryBroker.ExecSQL;
    end;
  except on e:Exception do
    begin
       result := false;
       Log('Erro ao inserir: TPROCESSO' + #13#10 + E.Message, Logar);
    end;
  end;
end;

function TFrmMain.InsereProcessoImportacao(DadosPedido :TPedido_Impo; Lista : Lista_TPedido_Item_Impo): Boolean;
var
  NrProcesso: String;
  CdServico: Integer;
  CdPrefixo: String;
  txtServicoNaoEncontrado: String;
  DataAux: String;
begin
  txtServicoNaoEncontrado := '';
  result := true;
  try
    dmdBroker.qryProcesso.close;
    dmdBroker.qryProcesso.SQL.Text := 'SELECT TP.NR_PROCESSO FROM BROKER.DBO.TPROCESSO TP (NOLOCK) ' +
                                      'LEFT JOIN BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO = TP.NR_PROCESSO ' +
                                      'WHERE TP.CD_GRUPO = ''155'' ' +
                                      'AND TP.CD_PRODUTO = ''01'' ' +
                                      'AND RC.TP_REFERENCIA = ''01'' ' +
                                      'AND RC.CD_REFERENCIA = :NR_PEDIDO';
    dmdBroker.qryProcesso.ParamByName('NR_PEDIDO').AsString := DadosPedido.NR_PEDIDO;
    dmdBroker.qryProcesso.open;

    if dmdBroker.qryProcesso.RecordCount > 0 then
      exit;


    dmdBroker.qryProcesso.close;
    dmdBroker.qryProcesso.Open(' SELECT CD_SERVICO FROM TREGRA_SERVICO_NESTLE WHERE CD_CLIENTE = :CD_CLIENTE AND CD_EXPORTADOR = :EXPORTADOR',
                             [DadosPedido.CD_IMPORTADOR, DadosPedido.CD_EXPORTADOR]);

    if dmdBroker.qryProcesso.FieldByName('CD_SERVICO').AsInteger > 0 then
      CdServico := dmdBroker.qryProcesso.FieldByName('CD_SERVICO').AsInteger
    else
    begin
      txtServicoNaoEncontrado := '<b>O serviço não foi encontrado e deverá ser analisado.</b><BR>';
      CdServico := 1;
    end;

    Case CdServico of
      1: CdPrefixo := 'IM';
      3: CdPrefixo := 'IA';
      5: CdPrefixo := 'IR';
    End;

    dmdBroker.qryProcesso.close;
    dmdBroker.qryProcesso.Open(' SELECT ISNULL(MAX(ISNULL(CONVERT(INT, SUBSTRING(NR_PROCESSO, 8, CHARINDEX(''-'', NR_PROCESSO, CHARINDEX(''-'', NR_PROCESSO)) - 1)), 0)), 0) AS PROCESSO' +
                             ' FROM TPROCESSO (NOLOCK) ' +
                             '  WHERE CD_UNID_NEG = :CD_UNID_NEG ' +
                             '    AND CD_PRODUTO  = :CD_PRODUTO ' +
                             '    AND DATEPART(YYYY, DT_ABERTURA) = DATEPART(YYYY, GETDATE()) ' +
                             '    AND SUBSTRING(NR_PROCESSO, 5, 2) = :PREFIXO',
                             ['01', '01', CdPrefixo]);

    NrProcesso := dmdBroker.qryProcesso.FieldByName('PROCESSO').AsString;
    NrProcesso := Format('%s%s-%s-%s', ['0101', CdPrefixo, FormatFloat('000000', StrToFloat(NrProcesso) + 1), FormatDateTime('YY', Now)]);


    dmdBroker.qryProcesso.close;
    dmdBroker.qryProcesso.SQL.Clear;
    dmdBroker.qryProcesso.SQL.Text :=
            ' INSERT INTO TPROCESSO '+ sLinebreak+
            ' ( NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, IN_CANCELADO, CD_RESTRICAO, DT_ABERTURA, HR_ABERTURA, CD_USUARIO, CD_CLIENTE, '+ sLinebreak+
            '   CD_SERVICO, CD_AREA, CD_CELULA, CD_LOCAL_DESEMBARQUE, CD_REPRESENTANTE, TP_ESTUFAGEM, VL_MLE_MNEG  ,VL_PESO_LIQUIDO, '+ sLinebreak+
            '   VL_PESO_BRUTO, VL_M3, CD_INCOTERM, CD_MOEDA_MLE, CD_MOEDA_FRETE, CD_LOCAL_ENTREGA, CD_EXPORTADOR, CD_GRUPO, TX_MERCADORIA, '+ sLinebreak+
            '   CD_UNID_MEDIDA, TP_FRETE) '+ sLinebreak+
            ' VALUES '+ sLinebreak+
            ' (:NR_PROCESSO,:CD_UNID_NEG,:CD_PRODUTO,:IN_CANCELADO, :CD_RESTRICAO,CONVERT(DATE, GETDATE(), 103),GETDATE(),  :CD_USUARIO,:CD_CLIENTE, '+ sLinebreak+
            '  :CD_SERVICO,:CD_AREA,:CD_CELULA,:CD_LOCAL_DESEMBARQUE,:CD_REPRESENTANTE,:TP_ESTUFAGEM,:VL_MLE_MNEG ,:VL_PESO_LIQUIDO, '+ sLinebreak+
            '  :VL_PESO_BRUTO,:VL_M3,:CD_INCOTERM,:CD_MOEDA_MLE,:CD_MOEDA_FRETE,:CD_LOCAL_ENTREGA,:CD_EXPORTADOR,:CD_GRUPO,:TX_MERCADORIA, '+ sLinebreak+
            '  :CD_UNID_MEDIDA,:TP_FRETE)';

    dmdBroker.qryProcesso.Params.ParamByName('NR_PROCESSO').AsString           := NrProcesso;
    dmdBroker.qryProcesso.Params.ParamByName('CD_UNID_NEG').AsString           := '01';
    dmdBroker.qryProcesso.Params.ParamByName('CD_PRODUTO').AsString            := '01';
    dmdBroker.qryProcesso.Params.ParamByName('IN_CANCELADO').AsString          := '0';
    dmdBroker.qryProcesso.Params.ParamByName('CD_RESTRICAO').AsString          := '0';
    dmdBroker.qryProcesso.Params.ParamByName('CD_USUARIO').AsString            := '0707';
    dmdBroker.qryProcesso.Params.ParamByName('CD_CLIENTE').AsString            := DadosPedido.CD_IMPORTADOR;
    dmdBroker.qryProcesso.Params.ParamByName('CD_SERVICO').AsString            := IntToStr(CdServico);
    dmdBroker.qryProcesso.Params.ParamByName('CD_AREA').AsString               := DadosPedido.CD_AREA;
    dmdBroker.qryProcesso.Params.ParamByName('CD_CELULA').AsString             := '89';
    dmdBroker.qryProcesso.Params.ParamByName('CD_LOCAL_DESEMBARQUE').AsString  := DadosPedido.CD_CIDADE_DESTINO;
    if dmdBroker.qryProcesso.Params.ParamByName('CD_SERVICO').AsString = '4' then
      dmdBroker.qryProcesso.Params.ParamByName('CD_REPRESENTANTE').AsString    := '02453'
    else
      dmdBroker.qryProcesso.Params.ParamByName('CD_REPRESENTANTE').AsString    := '00271';
    if dmdBroker.qryProcesso.Params.ParamByName('CD_SERVICO').AsString = '1' then
      dmdBroker.qryProcesso.Params.ParamByName('TP_ESTUFAGEM').AsString    := '1'
    else
      dmdBroker.qryProcesso.Params.ParamByName('TP_ESTUFAGEM').AsString    := '2';
    dmdBroker.qryProcesso.Params.ParamByName('VL_MLE_MNEG').Value := DadosPedido.PRECO_TOTAL;
    dmdBroker.qryProcesso.Params.ParamByName('VL_PESO_LIQUIDO').Value := DadosPedido.PESO_LIQUIDO;
    dmdBroker.qryProcesso.Params.ParamByName('VL_PESO_BRUTO').Value := DadosPedido.PESO_BRUTO;
    dmdBroker.qryProcesso.Params.ParamByName('VL_M3').Value := DadosPedido.CUBAGEM;
    dmdBroker.qryProcesso.Params.ParamByName('CD_INCOTERM').Value := DadosPedido.INCOTERM;
    dmdBroker.qryProcesso.Params.ParamByName('CD_MOEDA_MLE').Value := DadosPedido.CD_MOEDA;
    dmdBroker.qryProcesso.Params.ParamByName('CD_MOEDA_FRETE').Value := DadosPedido.CD_MOEDA;
    dmdBroker.qryProcesso.Params.ParamByName('CD_LOCAL_ENTREGA').Value := DadosPedido.CD_CIDADE_DESTINO;
    dmdBroker.qryProcesso.Params.ParamByName('CD_EXPORTADOR').Value := DadosPedido.CD_EXPORTADOR;
    dmdBroker.qryProcesso.Params.ParamByName('CD_GRUPO').Value := GrupoNestle;
    dmdBroker.qryProcesso.Params.ParamByName('CD_UNID_MEDIDA').Value := Lista[0].CD_UNIDADE_MEDIDA;
    if uppercase(DadosPedido.TIPO_FRETE) = 'COLLECT' then
      dmdBroker.qryProcesso.Params.ParamByName('TP_FRETE').AsString    := '0'
    else
      dmdBroker.qryProcesso.Params.ParamByName('TP_FRETE').AsString    := '1';

    try
      dmdBroker.qryProcesso.Params.ParamByName('TX_MERCADORIA').Value := IntToStr(StrToInt(Lista[0].SKU)) + ' ' + Lista[0].PRODUTO_PORTUGUES;
    except
      dmdBroker.qryProcesso.Params.ParamByName('TX_MERCADORIA').Value := Lista[0].SKU + ' ' + Lista[0].PRODUTO_PORTUGUES;
    end;

    dmdBroker.qryProcesso.ExecSQL;

    dmdBroker.qryProcesso.Close;
    dmdBroker.qryProcesso.SQL.Text := 'INSERT INTO TREF_CLIENTE (NR_PROCESSO, NR_SEQUENCIA,'+
      'CD_REFERENCIA, DT_REFERENCIA, TP_REFERENCIA, CD_AREA, NR_ITEM_PO, NR_PARCIAL,'+
      'IN_FLAG_LI, CD_EMPRESA) '+
      'VALUES(:NR_PROCESSO, :NR_SEQUENCIA, :CD_REFERENCIA, GETDATE(), :TP_REFERENCIA,'+
      ' :CD_AREA, :NR_ITEM_PO, :NR_PARCIAL, :IN_FLAG_LI, :CD_EMPRESA)';
    dmdBroker.qryProcesso.ParamByName('NR_PROCESSO').AsString := NrProcesso;
    dmdBroker.qryProcesso.ParamByName('NR_SEQUENCIA').AsString := '00001';
    dmdBroker.qryProcesso.ParamByName('CD_REFERENCIA').AsString := DadosPedido.NR_PEDIDO;
    dmdBroker.qryProcesso.ParamByName('TP_REFERENCIA').AsString := '01';
    dmdBroker.qryProcesso.ParamByName('CD_AREA').AsString := DadosPedido.CD_AREA;
    dmdBroker.qryProcesso.ParamByName('NR_ITEM_PO').AsString := '0000';
    dmdBroker.qryProcesso.ParamByName('NR_PARCIAL').AsInteger := 1;
    dmdBroker.qryProcesso.ParamByName('IN_FLAG_LI').AsInteger := 0;
    dmdBroker.qryProcesso.ParamByName('CD_EMPRESA').AsString := DadosPedido.CD_IMPORTADOR;
    dmdBroker.qryProcesso.ExecSQL;

    dmdBroker.qryProcesso.Close;
    dmdBroker.qryProcesso.SQL.Text := 'UPDATE BROKER.dbo.TFOLLOWUP SET DT_REALIZACAO = GETDATE() WHERE NR_PROCESSO = :NR_PROCESSO AND CD_EVENTO = ''003''';
    dmdBroker.qryProcesso.ParamByName('NR_PROCESSO').AsString := NrProcesso;
    dmdBroker.qryProcesso.ExecSQL;

    dmdBroker.qryProcesso.Close;
    dmdBroker.qryProcesso.SQL.Text := 'UPDATE BROKER.dbo.TFOLLOWUP SET DT_REALIZACAO = :DATA WHERE NR_PROCESSO = :NR_PROCESSO AND CD_EVENTO = ''798''';
    DataAux := FormatarData(DadosPedido.DT_DELIVERY);
    if DataAux = '' then
      dmdBroker.qryProcesso.ParamByName('DATA').AsDateTime        := null
    else
      dmdBroker.qryProcesso.ParamByName('DATA').AsDateTime        := StrToDateTime(DataAux);
    dmdBroker.qryProcesso.ParamByName('NR_PROCESSO').AsString := NrProcesso;
    dmdBroker.qryProcesso.ExecSQL;

    dmdBroker.qryProcesso.Close;
    dmdBroker.qryProcesso.SQL.Text := 'UPDATE BROKER.dbo.TFOLLOWUP SET DT_REALIZACAO = :DATA WHERE NR_PROCESSO = :NR_PROCESSO AND CD_EVENTO = ''233''';
    DataAux := FormatarData(DadosPedido.DT_DELIVERY);
    if DataAux = '' then
      dmdBroker.qryProcesso.ParamByName('DATA').AsDateTime        := null
    else
      dmdBroker.qryProcesso.ParamByName('DATA').AsDateTime        := StrToDateTime(DataAux);
    dmdBroker.qryProcesso.ParamByName('NR_PROCESSO').AsString := NrProcesso;
    dmdBroker.qryProcesso.ExecSQL;

    dmdBroker.qryProcesso.Close;
    dmdBroker.qryProcesso.SQL.Text := 'UPDATE BROKER.dbo.TFOLLOWUP SET DT_REALIZACAO = :DATA WHERE NR_PROCESSO = :NR_PROCESSO AND CD_EVENTO = ''168''';
    DataAux := FormatarData(DadosPedido.DT_EMISSAO);
    if DataAux = '' then
      dmdBroker.qryProcesso.ParamByName('DATA').AsDateTime        := null
    else
      dmdBroker.qryProcesso.ParamByName('DATA').AsDateTime        := StrToDateTime(DataAux);
    dmdBroker.qryProcesso.ParamByName('NR_PROCESSO').AsString := NrProcesso;
    dmdBroker.qryProcesso.ExecSQL;

    dmdBroker.qryProcesso.Close;
    dmdBroker.qryProcesso.SQL.Text :='INSERT INTO [dbo].[TEXPORTADOR_DI] ([NR_PROCESSO],[CD_EXPORTADOR]) VALUES (:NR_PROCESSO, :Exportador)';
    dmdBroker.qryProcesso.ParamByName('NR_PROCESSO').AsString := NrProcesso;
    dmdBroker.qryProcesso.ParamByName('Exportador').AsString := DadosPedido.CD_EXPORTADOR;
    dmdBroker.qryProcesso.ExecSQL;

    dmdBroker.qryProcesso.Close;
    dmdBroker.qryProcesso.SQL.Text :='INSERT INTO [dbo].[TFABRICANTE_DI] ([NR_PROCESSO],[CD_FABRICANTE]) VALUES (:NR_PROCESSO, :Fabricante)';
    dmdBroker.qryProcesso.ParamByName('NR_PROCESSO').AsString := NrProcesso;
    dmdBroker.qryProcesso.ParamByName('Fabricante').AsString := Lista[0].CD_FABRICANTE;
    dmdBroker.qryProcesso.ExecSQL;

    SetLength(lResultadoProcessamento,Length(lResultadoProcessamento)+1);
    lResultadoProcessamento[Length(lResultadoProcessamento)-1].Tipo  := 'IC';
    lResultadoProcessamento[Length(lResultadoProcessamento)-1].Texto := 'Processo aberto: ' + NrProcesso + ' <BR>' + txtServicoNaoEncontrado;

    Log('Processo aberto: ' + NrProcesso, Logar);
  except on e:Exception do
    begin
       result := false;
       Log('Erro ao inserir: PROCESSO de IMPROTAÇÃO' + #13#10 + E.Message, Logar);
    end;
  end;
end;

function TFrmMain.IntegraTPO(DadosPedido :TPedido_Impo) : Boolean;
var
  DataAux : String;
begin
  Log('Integra TPO ', Logar);
  Application.ProcessMessages;

  try
    dmdBroker.qryTPO.close;

    //verificar se ja existe e mudar a query
    if BuscaTPOCadastrada(DadosPedido.NR_ORDEM,
                          DadosPedido.CD_IMPORTADOR,
                          DadosPedido.CD_IMPORTADOR,
                          DadosPedido.CD_EXPORTADOR)   then
      dmdBroker.qryTPO.SQL.Text := GetSQLTPO('U')
    else
      dmdBroker.qryTPO.SQL.Text := GetSQLTPO('I');

    dmdBroker.qryTPO.paramByName('NR_PROCESSO').value                 := DadosPedido.NR_ORDEM;
    dmdBroker.qryTPO.paramByName('CD_IMPORTADOR').value               := DadosPedido.CD_IMPORTADOR;
    dmdBroker.qryTPO.paramByName('CD_EXPORTADOR').value               := DadosPedido.CD_EXPORTADOR;
    dmdBroker.qryTPO.paramByName('CD_EMPRESA').value                  := DadosPedido.CD_IMPORTADOR;
    dmdBroker.qryTPO.paramByName('CD_VIA_TRANSP').value               := DadosPedido.CD_VIA_TRANSPORTE;
    dmdBroker.qryTPO.paramByName('CD_PAIS_PROCEDENCIA').value         := DadosPedido.CD_EMBARQUE_PAIS;
    dmdBroker.qryTPO.paramByName('CD_MOEDA_NEG').value                := DadosPedido.CD_MOEDA;
    dmdBroker.qryTPO.paramByName('CD_INCOTERM').value                 := DadosPedido.INCOTERM;
    dmdBroker.qryTPO.paramByName('CD_LOCAL_EMBARQUE').value           := DadosPedido.CD_EMBARQUE_CIDADE;
    dmdBroker.qryTPO.paramByName('CD_MOEDA_FRETE').value              := DadosPedido.CD_MOEDA;
    dmdBroker.qryTPO.paramByName('CD_MOEDA_SEGURO').value             := DadosPedido.CD_MOEDA;
    dmdBroker.qryTPO.paramByName('CD_MOEDA_CARGA').value              := DadosPedido.CD_MOEDA;
    dmdBroker.qryTPO.paramByName('DT_ABERTURA').value                 := now;
    dmdBroker.qryTPO.paramByName('PL_PO').value                       := StrToFloat(StringReplace(StringReplace(DadosPedido.PESO_LIQUIDO,
                                                                                                 ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));

    dmdBroker.qryTPO.paramByName('PB_PO').value                       := StrToFloat(StringReplace(StringReplace(DadosPedido.PESO_BRUTO,
                                                                                                 ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));
    dmdBroker.qryTPO.paramByName('TX_OBSERVACAO').value               := DadosPedido.CONDICAO_PAGAMENTO_DESC;
    if uppercase(DadosPedido.TIPO_FRETE) = 'PREPAID' then
    begin
      dmdBroker.qryTPO.ParamByName('VL_FRETE_PREPAID').Value          := StrToFloat(StringReplace(StringReplace(DadosPedido.VALOR_FRETE,
                                                                                                 ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));
      dmdBroker.qryTPO.ParamByName('VL_FRETE_COLLECT').Value          := 0;
    end
    else
    begin
      dmdBroker.qryTPO.ParamByName('VL_FRETE_PREPAID').Value          := 0;
      dmdBroker.qryTPO.ParamByName('VL_FRETE_COLLECT').Value          := StrToFloat(StringReplace(StringReplace(DadosPedido.VALOR_FRETE,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));
    end;

    dmdBroker.qryTPO.paramByName('VL_SEGURO').value                   := StrToFloat(StringReplace(StringReplace(DadosPedido.VALOR_SEGURO,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));

    dmdBroker.qryTPO.paramByName('VL_TOTAL').value                    := StrToFloat(StringReplace(StringReplace(DadosPedido.PRECO_TOTAL,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));
    DataAux := FormatarData(DadosPedido.DT_DELIVERY);
    if DataAux = '' then
      dmdBroker.qryTPO.paramByName('DT_NECESSIDADE').value            := null
    else
      dmdBroker.qryTPO.paramByName('DT_NECESSIDADE').value            := DataAux;

    dmdBroker.qryTPO.paramByName('CD_TIPO_FRETE').value               := DadosPedido.CD_TIPO_FRETE;
    dmdBroker.qryTPO.paramByName('CD_LOCAL_DESEMBARQUE').value        := DadosPedido.CD_CIDADE_DESTINO;
    dmdBroker.qryTPO.paramByName('CD_USUARIO').value                  :=  '0707';
    dmdBroker.qryTPO.paramByName('CD_AREA').value                     :=  DadosPedido.CD_AREA;
    dmdBroker.qryTPO.paramByName('CD_SERVICO').value                  :=  '475';
    dmdBroker.qryTPO.paramByName('IN_WEB').value                      :=  1;
    dmdBroker.qryTPO.paramByName('IN_COMISSAO').value                 :=  0;
    dmdBroker.qryTPO.paramByName('IN_DESCONTO').value                 :=  0;
    dmdBroker.qryTPO.paramByName('IN_INDICADOR_CONSIG_IMPORT').value  :=  0;
    dmdBroker.qryTPO.paramByName('IN_INDIC_MULTMODAL').value          :=  0;
    dmdBroker.qryTPO.paramByName('IN_FUNDAP').value                   :=  0;
    dmdBroker.qryTPO.paramByName('IN_INDIC_TX_JUROS').value           :=  0;
    dmdBroker.qryTPO.paramByName('IN_SEGURO').value                   :=  0;
    dmdBroker.qryTPO.paramByName('PC_COMISSAO').value                 :=  0;
    dmdBroker.qryTPO.paramByName('PC_DESCONTO').value                 :=  0;
    dmdBroker.qryTPO.paramByName('PC_SEGURO').value                   :=  0;
    dmdBroker.qryTPO.paramByName('PC_COMISSAO_AGENTE').value          :=  0;
    dmdBroker.qryTPO.paramByName('QT_TOTAL_PESO').value               :=  0;
    dmdBroker.qryTPO.paramByName('QT_PORC_ICMS').value                :=  0;
    dmdBroker.qryTPO.paramByName('QT_TOTAL_ITENS').value              :=  0;
    dmdBroker.qryTPO.paramByName('QT_PORC_RED_ICMS').value            :=  0;
    dmdBroker.qryTPO.paramByName('TP_CAMBIO').value                   :=  0;
    dmdBroker.qryTPO.paramByName('TX_JUROS').value                    :=  0;
    dmdBroker.qryTPO.paramByName('VL_COMISSAO').value                 :=  0;
    dmdBroker.qryTPO.paramByName('VL_CARGA').value                    :=  0;
    dmdBroker.qryTPO.paramByName('VL_CAMBIO').value                   :=  0;
    dmdBroker.qryTPO.paramByName('VL_DESCONTO').value                 :=  0;
    dmdBroker.qryTPO.paramByName('VL_FRETE_TERRIT_NAC').value         :=  0;
    dmdBroker.qryTPO.paramByName('VL_TOTAL_PARCELA').value            :=  0;
    dmdBroker.qryTPO.paramByName('VL_PAGTO_ANTECIPADO').value         :=  0;
    dmdBroker.qryTPO.paramByName('VL_PAGTO_VISTA').value              :=  0;
    dmdBroker.qryTPO.paramByName('VL_PERIODIC_MENSAL').value          :=  0;
    dmdBroker.qryTPO.paramByName('VL_DESPESAS').value                 :=  0;
    dmdBroker.qryTPO.paramByName('VL_DESCONTOS').value                :=  0;
    dmdBroker.qryTPO.paramByName('IN_SELECIONADO').value              :=  0;
    dmdBroker.qryTPO.paramByName('IN_MONTADO').value                  :=  0;
    dmdBroker.qryTPO.paramByName('IN_IND_COND_MERC').value            :=  0;
    dmdBroker.qryTPO.paramByName('IN_IND_CAMBIO_ITENS').value         :=  0;
    dmdBroker.qryTPO.paramByName('QT_TOTAL_DISPONIVEL').value         :=  0;
    dmdBroker.qryTPO.paramByName('IN_ENTREPOSTO').value               :=  0;
    dmdBroker.qryTPO.paramByName('IN_FATURADO').value                 :=  0;
    dmdBroker.qryTPO.paramByName('IN_IMEDIATO').value                 :=  0;
    dmdBroker.qryTPO.paramByName('VL_FRETE_INTERNO').value            :=  0;
    dmdBroker.qryTPO.paramByName('VL_EMBALAGEM').value                :=  0;
    dmdBroker.qryTPO.paramByName('VL_PB_EMBALAGEM').value             :=  0;
    dmdBroker.qryTPO.paramByName('VL_PL_EMBALAGEM').value             :=  0;
    dmdBroker.qryTPO.paramByName('IN_CARGA_PERIGOSA').value           :=  0;
    dmdBroker.qryTPO.paramByName('VL_M3').value                       :=  0;

    dmdBroker.qryTPO.ExecSQL;

    if dmdBroker.qryTPO.RowsAffected > 0 then
      result  := True
    else
      result := False;

  except on e:Exception do
    begin
       result := false;
       Log('Erro ao inserir: TPO' + #13#10 + E.Message, Logar);
    end;
  end;
end;

function TFrmMain.IntegraTPO_ITEM(Lista : Lista_TPedido_Item_Impo; CodInstrucao : String) : Boolean;
var
  i : Integer;
  DataAtual : TDateTime;
  DataAux : string;
  NrItem : string;
begin
  result := true;
  Log('Integra TPO_ITEM ', Logar);
  Application.ProcessMessages;

  try
    DataAtual := now;

    DeletaTPO_ITEMCadastrada(Lista[0].ORDEM,
                             Lista[0].CD_IMPORTADOR);

    for I := 0 to Length(Lista)-1 do
    begin
      // os itens são inseridos 2X nessa tabela
      // 1x com instrucao de desembaraço e 1x sem.
      {$region 'Sem Instrucao' }
      dmdBroker.qryTPO_ITEM.Close;
      dmdBroker.qryTPO_ITEM.SQL.Text := GetSQLTPO_ITEM;

      dmdBroker.qryTPO_ITEM.ParamByName('NR_PROCESSO').value                := Lista[i].ORDEM;
      dmdBroker.qryTPO_ITEM.ParamByName('NR_ITEM_CLIENTE').value            := FormatFloat('0000',StrtoInt(Lista[i].NR_ITEM_PO));
      dmdBroker.qryTPO_ITEM.ParamByName('CD_EMPRESA').value                 := Lista[i].CD_IMPORTADOR;
      dmdBroker.qryTPO_ITEM.ParamByName('NR_ITEM').value                    := FormatFloat('000',StrtoInt(Lista[i].NR_ITEM_PO));;
      dmdBroker.qryTPO_ITEM.ParamByName('CD_EXPORTADOR').value              := Lista[i].CD_EXPORTADOR;
      dmdBroker.qryTPO_ITEM.ParamByName('CD_MERCADORIA').value              := Lista[i].SKU;
      dmdBroker.qryTPO_ITEM.ParamByName('CD_FABRICANTE').value              := Lista[i].CD_FABRICANTE;
      dmdBroker.qryTPO_ITEM.ParamByName('CD_PAIS_ORIGEM').value             := Lista[i].CD_FABRICANTE_PAIS;
      dmdBroker.qryTPO_ITEM.ParamByName('CD_NCM_SH').value                  := Lista[i].NCM;
      dmdBroker.qryTPO_ITEM.ParamByName('CD_MOEDA_NEGOCIADA').value         := Lista[i].CD_MOEDA;
      dmdBroker.qryTPO_ITEM.ParamByName('CD_INCOTERM').value                := Lista[i].INCOTERM;
      dmdBroker.qryTPO_ITEM.ParamByName('CD_UNID_MEDIDA').value             := Lista[i].CD_UNIDADE_MEDIDA;
      dmdBroker.qryTPO_ITEM.ParamByName('TX_MERCADORIA').value              := trim(Lista[i].PRODUTO_PORTUGUES);
      dmdBroker.qryTPO_ITEM.ParamByName('NR_PLANTA').value                  := trim(Lista[i].NR_PLANTA);

      dmdBroker.qryTPO_ITEM.ParamByName('PL_ITEM').value                    := StrToFloat(StringReplace(StringReplace(Lista[i].PESO_LIQ,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));
      dmdBroker.qryTPO_ITEM.ParamByName('QT_INICIAL').value                 := StrToFloat(StringReplace(StringReplace(Lista[i].QUANTIDADE,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));

      dmdBroker.qryTPO_ITEM.ParamByName('VL_UNITARIO').value                := StrToFloat(StringReplace(StringReplace(Lista[i].PRECO_UNI,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));

      dmdBroker.qryTPO_ITEM.ParamByName('VL_TOTAL').value                   := StrToFloat(StringReplace(StringReplace(Lista[i].PRECO_SKU,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));

      dmdBroker.qryTPO_ITEM.ParamByName('QT_DISPONIVEL').value              := StrToFloat(StringReplace(StringReplace(Lista[i].QUANTIDADE,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));

      dmdBroker.qryTPO_ITEM.ParamByName('QT_INICIAL_EST').value             := StrToFloat(StringReplace(StringReplace(Lista[i].QUANTIDADE,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));

      dmdBroker.qryTPO_ITEM.ParamByName('TX_OBSERVACAO').value              := Trim(Lista[i].DS_CONDICAO_PGMTO);
      dmdBroker.qryTPO_ITEM.ParamByName('IN_UTILIZADO_INSTR_DESEMB').value  := 0;   //**
      dmdBroker.qryTPO_ITEM.ParamByName('ID_CODIGO_INSTR_DESEMB').value     := '';  //**
      dmdBroker.qryTPO_ITEM.ParamByName('NR_PARCIAL').value                 := 0;   //**
      dmdBroker.qryTPO_ITEM.ParamByName('QT_BAIXADA_DI').value              := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('QT_BAIXADA_LI').value              := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('QT_ESPEC_II').value                := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('QT_ESPEC_IPI').value               := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('QT_AD').value                      := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('QT_MED_ESTATISTICA').value         := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('TP_IND_TX_JUROS').value            := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('TX_JUROS_CAMBIO').value            := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_DESPESA_MOEDA').value           := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_DESCONTO_MOEDA').value          := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_DESCONTO').value                := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_COMISSAO').value                := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_ESPEC_II').value                := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_ESPEC_IPI').value               := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_ESPEC_AD').value                := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_TOTAL_PARCELAS').value          := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_COBERT_ACIMA_360').value        := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_PAGTO_ANTECIPADO').value        := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_PAGTO_AVISTA').value            := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_FRETE_NAC_MOEDA').value         := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_SEGURO_MOEDA').value            := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_ACRESC_MOEDA').value            := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_DEDUC_MOEDA').value             := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_FRETE_PREPAID_MOEDA').value     := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_FRETE_COLLECT').value           := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('IN_SELECIONADO').value             := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('QT_BAIXAR').value                  := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('IN_MONTADO').value                 := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('IN_FABR_EXP_PROD').value           := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('IN_IND_COND_MERC').value           := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('IN_IND_PERIODICIDADE').value       := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('IN_REG_TRIB_IPI').value            := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('CD_MODALIDADE').value              := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('IN_AVISO_DB').value                := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('TP_STATUS_CRODA').value            := 0;

      dmdBroker.qryTPO_ITEM.ExecSql;

      if (dmdBroker.qryTPO_ITEM.RowsAffected > 0) and result then
        result := True
      else
        result := False;
      {$endregion}

      {$region 'Com instrucao'}
      dmdBroker.qryTPO_ITEM.Close;
      dmdBroker.qryTPO_ITEM.SQL.Text := GetSQLTPO_ITEM;

      dmdBroker.qryTPO_ITEM.ParamByName('NR_PROCESSO').value                := Lista[i].ORDEM;
      dmdBroker.qryTPO_ITEM.ParamByName('NR_ITEM_CLIENTE').value            := FormatFloat('0000', StrToInt(Lista[i].NR_ITEM_PO));
      dmdBroker.qryTPO_ITEM.ParamByName('CD_EMPRESA').value                 := Lista[i].CD_IMPORTADOR;
      dmdBroker.qryTPO_ITEM.ParamByName('NR_ITEM').value                    := FormatFloat('000',Length(Lista) + StrToInt(Lista[i].NR_ITEM_PO));
      dmdBroker.qryTPO_ITEM.ParamByName('CD_EXPORTADOR').value              := Lista[i].CD_EXPORTADOR;
      dmdBroker.qryTPO_ITEM.ParamByName('CD_MERCADORIA').value              := Lista[i].SKU;
      dmdBroker.qryTPO_ITEM.ParamByName('CD_FABRICANTE').value              := Lista[i].CD_FABRICANTE;
      dmdBroker.qryTPO_ITEM.ParamByName('CD_PAIS_ORIGEM').value             := Lista[i].CD_FABRICANTE_PAIS;
      dmdBroker.qryTPO_ITEM.ParamByName('CD_NCM_SH').value                  := Lista[i].NCM;
      dmdBroker.qryTPO_ITEM.ParamByName('CD_MOEDA_NEGOCIADA').value         := Lista[i].CD_MOEDA;
      dmdBroker.qryTPO_ITEM.ParamByName('CD_INCOTERM').value                := Lista[i].INCOTERM;
      dmdBroker.qryTPO_ITEM.ParamByName('CD_UNID_MEDIDA').value             := Lista[i].CD_UNIDADE_MEDIDA;
      dmdBroker.qryTPO_ITEM.ParamByName('PL_ITEM').value                    := StrToFloat(StringReplace(StringReplace(Lista[i].PESO_LIQ,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));
      dmdBroker.qryTPO_ITEM.ParamByName('QT_INICIAL').value                 := StrToFloat(StringReplace(StringReplace(Lista[i].QUANTIDADE,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));

      dmdBroker.qryTPO_ITEM.ParamByName('TX_MERCADORIA').value              := trim(Lista[i].PRODUTO_PORTUGUES);

      dmdBroker.qryTPO_ITEM.ParamByName('NR_PLANTA').value                  := trim(Lista[i].NR_PLANTA);

      dmdBroker.qryTPO_ITEM.ParamByName('VL_UNITARIO').value                := StrToFloat(StringReplace(StringReplace(Lista[i].PRECO_UNI,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));

      dmdBroker.qryTPO_ITEM.ParamByName('VL_TOTAL').value                   := StrToFloat(StringReplace(StringReplace(Lista[i].PRECO_SKU,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));

      dmdBroker.qryTPO_ITEM.ParamByName('QT_DISPONIVEL').value              := StrToFloat(StringReplace(StringReplace(Lista[i].QUANTIDADE,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));

      dmdBroker.qryTPO_ITEM.ParamByName('QT_INICIAL_EST').value             := StrToFloat(StringReplace(StringReplace(Lista[i].QUANTIDADE,
                                                                                         ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));
      dmdBroker.qryTPO_ITEM.ParamByName('TX_OBSERVACAO').value              := Trim(Lista[i].DS_CONDICAO_PGMTO);
      dmdBroker.qryTPO_ITEM.ParamByName('IN_UTILIZADO_INSTR_DESEMB').value  := 0;   //**
      dmdBroker.qryTPO_ITEM.ParamByName('ID_CODIGO_INSTR_DESEMB').value     := CodInstrucao;  //**
      dmdBroker.qryTPO_ITEM.ParamByName('NR_PARCIAL').value                 := 1;   //**
      dmdBroker.qryTPO_ITEM.ParamByName('QT_BAIXADA_DI').value              := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('QT_BAIXADA_LI').value              := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('QT_ESPEC_II').value                := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('QT_ESPEC_IPI').value               := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('QT_AD').value                      := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('QT_MED_ESTATISTICA').value         := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('TP_IND_TX_JUROS').value            := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('TX_JUROS_CAMBIO').value            := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_DESPESA_MOEDA').value           := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_DESCONTO_MOEDA').value          := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_DESCONTO').value                := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_COMISSAO').value                := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_ESPEC_II').value                := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_ESPEC_IPI').value               := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_ESPEC_AD').value                := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_TOTAL_PARCELAS').value          := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_COBERT_ACIMA_360').value        := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_PAGTO_ANTECIPADO').value        := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_PAGTO_AVISTA').value            := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_FRETE_NAC_MOEDA').value         := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_SEGURO_MOEDA').value            := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_ACRESC_MOEDA').value            := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_DEDUC_MOEDA').value             := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_FRETE_PREPAID_MOEDA').value     := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('VL_FRETE_COLLECT').value           := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('IN_SELECIONADO').value             := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('QT_BAIXAR').value                  := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('IN_MONTADO').value                 := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('IN_FABR_EXP_PROD').value           := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('IN_IND_COND_MERC').value           := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('IN_IND_PERIODICIDADE').value       := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('IN_REG_TRIB_IPI').value            := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('CD_MODALIDADE').value              := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('IN_AVISO_DB').value                := 0;
      dmdBroker.qryTPO_ITEM.ParamByName('TP_STATUS_CRODA').value            := 0;

      dmdBroker.qryTPO_ITEM.ExecSql;

      if (dmdBroker.qryTPO_ITEM.RowsAffected > 0) and result then
        result := True
      else
        result := False;

      {$endregion}
    end;

  except on e:Exception do
    begin
       result := false;
       Log('Erro ao inserir: TPO_ITEM' + #13#10 + E.Message, Logar);
    end;
  end;
end;

function TfrmMain.BuscaNovaChaveTINSTRUCAO_DESEMBARACO : String;
var
  chave : string;
begin
  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Text :=
    ' SELECT ''ID'' +                                                                                    ' + sLineBreak +
    '        CASE WHEN (RIGHT(''00000000'' + CONVERT(VARCHAR, ISNULL(MAX(                                ' + sLineBreak +
    '                         SUBSTRING(ISNULL(ID_CODIGO, ''0''), 3, 8)) +1, ''1'')), 8)) = ''00000000'' ' + sLineBreak +
    '             THEN ''00000001''                                                                      ' + sLineBreak +
    '             ELSE (RIGHT(''00000000'' + CONVERT(VARCHAR, ISNULL(MAX(                                ' + sLineBreak +
    '                         SUBSTRING(ISNULL(ID_CODIGO, ''0''), 3, 8)) +1, ''1'')), 8))                ' + sLineBreak +
    '        END + ''-'' +                                                                               ' + sLineBreak +
    '        RIGHT(CONVERT(VARCHAR, YEAR(GETDATE())), 2) CHAVE                                           ' + sLineBreak +
    ' FROM TINSTRUCAO_DESEMBARACO (NOLOCK)                                                               ' + sLineBreak +
    ' WHERE RIGHT(RTRIM(ID_CODIGO), 2) = RIGHT(CONVERT(VARCHAR, YEAR(GETDATE())), 2)                     ' + sLineBreak ;

  dmdBroker.qryBroker.open;

  if not dmdBroker.qryBroker.isEmpty then
  begin
    chave := dmdBroker.qryBroker.FieldByName('CHAVE').AsString;
  end;

  result := chave;
end;

function TfrmMain.BuscaTINSTRUCAO_DESEMBARACOCadastrada(CodCliente, PedidoCliente:string) : String;
var
  chave : string;
begin
  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Text :=
                    ' SELECT ID_CODIGO                              ' +sLineBreak +
                    '   FROM TINSTRUCAO_DESEMBARACO (NOLOCK)        ' +sLineBreak +
                    '  WHERE CD_CLIENTE ='+QuotedStr(CodCliente)      +sLineBreak +
                    '    AND ID_CLIENTE ='+QuotedStr(PedidoCliente)   +sLineBreak ;
  dmdBroker.qryBroker.open;

  if not dmdBroker.qryBroker.isEmpty then
  begin
    chave := dmdBroker.qryBroker.FieldByName('ID_CODIGO').AsString;
  end;

  result := chave;
end;

procedure TfrmMain.DeletaItemTINSTRUCAO_DESEMBARACO_PEDIDO(Chave, Cod_Ordem :String);
begin
  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Text :=
   '  DELETE TINSTRUCAO_DESEMBARACO_PEDIDO            ' + sLineBreak +
   '    FROM TINSTRUCAO_DESEMBARACO_PEDIDO A          ' + sLineBreak +
   '   WHERE A.NR_REFERENCIA ='+QuotedStr(Cod_Ordem)    + sLineBreak +
   '     AND A.ID_CODIGO     ='+QuotedStr(Chave)    + sLineBreak ;
  dmdBroker.qryBroker.ExecSql;
end;

function TfrmMain.BuscaTPOCadastrada(sOrdem, sImportador,sEmpresa, sExportador :string) : boolean;
begin
  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Text :=
  ' SELECT NR_PROCESSO                               '+ sLineBreak +
  '   FROM TPO(NOLOCK)                               '+ sLineBreak +
  '  WHERE NR_PROCESSO   = '+QuotedStr(sOrdem)        + sLineBreak +
  //'    AND CD_IMPORTADOR = '+QuotedStr(sImportador)   + sLineBreak +
  '    AND CD_EMPRESA    = '+QuotedStr(sEmpresa)      + sLineBreak ;
//  '    AND CD_EXPORTADOR = '+QuotedStr(sExportador)   + sLineBreak ;

  dmdBroker.qryBroker.open;
  if dmdBroker.qryBroker.isEmpty then
    result := false
  else
    result := true;
end;

procedure TfrmMain.DeletaTPO_ITEMCadastrada(sOrdem, sEmpresa : String );
begin
  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Text :=
   ' DELETE TPO_ITEM                               ' + sLineBreak                  +
   '   FROM TPO_ITEM(NOLOCK)                       ' + sLineBreak                  +
   '  WHERE NR_PROCESSO                          = ' + QuotedStr(Trim(sOrdem))           +
   '    AND CD_EMPRESA                           = ' + QuotedStr(sEmpresa)         ;
  dmdBroker.qryBroker.ExecSql;
end;

function TfrmMain.BuscaPaisDestinoLote(NR_FORNECIMENTO:string) : String;
var
  Nome_Pais : string;
begin
  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Text :=
       ' SELECT NM_PAIS                                                 '+ sLineBreak+
       ' FROM MYINDAIA.DBO.TRAP A (NOLOCK)                              '+ sLineBreak+
       ' JOIN TPAIS_BROKER      B (NOLOCK) ON B.CD_PAIS = A.CD_PAIS     '+ sLineBreak+
       ' WHERE A.CD_GRUPO =  '+QuotedStr(GrupoNestle)+'                 '+ sLineBreak+
       '   AND A.NR_FORNECIMENTO = '+QuotedStr(Nr_Fornecimento)+'       '+ sLineBreak;
  dmdBroker.qryBroker.open;

  if not dmdBroker.qryBroker.isEmpty then
  begin
    Nome_Pais := dmdBroker.qryBroker.FieldByName('NM_PAIS').AsString;
  end;

  result := Nome_Pais;
end;

function TfrmMain.InsereCarregaCodMercadoriaIMPO(Codigo, Descricao_Por,Descricao_Esp,
     Descricao_Ing, NCM, UnidadeMedida, Ordem : String) : Boolean;
Var
  NCM_Gravado : String;
begin
  NCM_Gravado := '';
  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Text :=
           ' SELECT CD_MERCADORIA,                                                       ' + sLineBreak +
           '        CD_NCM_SH                                                            ' + sLineBreak +
           '   FROM TMERCADORIA (NOLOCK)                                                 ' + sLineBreak +
           '  WHERE LTRIM(RTRIM(CD_MERCADORIA)) = LTRIM(RTRIM('+QuotedStr(Codigo)+'))    ' + sLineBreak +
           '    AND CD_GRUPO = ' + QuotedStr(GrupoNestle)                                  + sLineBreak ;

  dmdBroker.qryBroker.open;

  if not dmdBroker.qryBroker.isEmpty then  //existe!
  begin
    NCM_Gravado  := dmdBroker.qryBroker.FieldByName('CD_NCM_SH').AsString;

   { if NCM_Gravado <> NCM then
    begin
      if Email_Atendente <> '' then
        EnviarEmail('Integração Nestle - Erro ao cadastrar mercadoria',
                    'A Mercadoria '+ Codigo + ' ' + Descricao_Por + ' já existe com NCM diferente.' +'<br>'+
                    'NCM Atual : ' + NCM_Gravado +'<br>'+
                    'NCM Novo  : ' + NCM + '<br>'
                    ,Email_Atendente);

      Log('Mercadoria '+ Codigo + ' ja existe com NCM diferente.', Logar);
      result := false;
    end
    else //se for igual, continua     }
      result := true;
  end
  else
  begin // se não existir, insere
    dmdBroker.qryBroker.close;
    dmdBroker.qryBroker.SQL.Text := '    INSERT INTO  TMERCADORIA     ( CD_MERCADORIA,                                     ' + sLineBreak +
                                    '                                   AP_MERCADORIA,                                     ' + sLineBreak +
                                    '                                   NM_MERCADORIA,                                     ' + sLineBreak +
                                    '                                   TX_DESC_INGLES,                                    ' + sLineBreak +
                                    '                                   TX_DESC_ESP,                                       ' + sLineBreak +
                                    '                                   CD_NCM_SH,                                         ' + sLineBreak +
                                    '                                   CD_UN_MED_COMERC,                                  ' + sLineBreak +
                                    '                                   CD_GRUPO                                           ' + sLineBreak +
                                    '                                 )                                                    ' + sLineBreak +
                                    '                      VALUES      ('+QuotedStr(Codigo)                             +',' + sLineBreak +
                                    '                                   SUBSTRING('+QuotedStr(Descricao_Por)+',1,40),'  +      sLineBreak +
                                    '                                   '+QuotedStr(Descricao_Por)                      +',' + sLineBreak +
                                    '                                   '+QuotedStr(Descricao_Ing)                      +',' + sLineBreak +
                                    '                                   '+QuotedStr(Descricao_Esp)                      +',' + sLineBreak +
                                    '                                   '+QuotedStr(NCM)                                +',' + sLineBreak +
                                    '                                   '+QuotedStr(UnidadeMedida)                      +',' + sLineBreak +
                                    '                                   '+QuotedStr(GrupoNestle)+ ')'                        + sLineBreak ;

    dmdBroker.qryBroker.ExecSql;
    if dmdBroker.qryBroker.RowsAffected > 0  then
    begin
    //---> Enviar email para o usuario informando que inseriu.
      if Email_Atendente <> '' then
        EnviarEmail('Integração Nestle - Mercadoria Cadastrada',
                    'A Mercadoria '+ Codigo + ' ' + Descricao_Por + ' foi cadastrada.' +'<br>' + '<br>'+
                    'Ordem : ' + Ordem + '<br>'
                    ,Email_Atendente);

      Log('Mercadoria '+ Codigo + ' incluida.', Logar);
      result := true;
    end
    else
    begin
      //---> erro!
      Log('Erro ao incluir mercadoria '+ Codigo + '.', Logar);
      result := false;
    end;
  end;
end;

procedure TfrmMain.EnviarEmailResultado(NrOrdem : String);
var
  sResultadoProcessamento : String;
  i : Integer;
  sInclusaoLote, sInclusaoComplemento, sInclusaoMercadoria, sAlteracao, sInclusao, sErro : String;
  temErro : Boolean;
  sTitulo : String;
begin
  sTitulo              := '';
  sInclusaoLote        := '';
  sInclusaoMercadoria  := '';
  sAlteracao           := '';
  sInclusao            := '';
  sInclusaoComplemento := '';
  sErro                := '';
  temErro              := false;

  for I := 0 to Length(lResultadoProcessamento)-1 do
  begin
    if lResultadoProcessamento[i].Tipo = 'I' then
    begin
      sInclusao           := sInclusao + lResultadoProcessamento[i].Texto;
      sTitulo             := lResultadoProcessamento[i].Titulo;
    end;
    if lResultadoProcessamento[i].Tipo = 'IC' then
    begin
      sInclusaoComplemento:= sInclusaoComplemento + lResultadoProcessamento[i].Texto;
      sTitulo             := lResultadoProcessamento[i].Titulo;
    end;
    if lResultadoProcessamento[i].Tipo = 'A' then
    begin
      sAlteracao          := sAlteracao + lResultadoProcessamento[i].Texto;
      sTitulo             := lResultadoProcessamento[i].Titulo;
    end;
    if lResultadoProcessamento[i].Tipo = 'IL' then
    begin
    if lResultadoProcessamento[i].Tipo = 'IL' then
      sInclusaoLote       := sInclusaoLote + lResultadoProcessamento[i].Texto+ '<br>';
      sTitulo             := lResultadoProcessamento[i].Titulo;
    end;
    if lResultadoProcessamento[i].Tipo = 'IM' then
      sInclusaoMercadoria := sInclusaoMercadoria + lResultadoProcessamento[i].Texto+ '<br>';
    if lResultadoProcessamento[i].Tipo = 'E' then
      sErro               := sErro + lResultadoProcessamento[i].Texto +'<br>';
  end;

  if trim(sInclusao)           <> '' then
  begin
     sInclusao           := '<br> Liberada na web a ordem '+ sInclusao + ' para integração.' + '<br>';
     sInclusao           := sInclusao + sInclusaoComplemento;
  end;
  if trim(sAlteracao)          <> '' then
     sAlteracao          := '<br> Ordem com informações ajustadas. Estorne o processo e relance a ordem ' +  sAlteracao + ' para integração.'+ '<br>';
  if trim(sInclusaoLote)       <> '' then
     sInclusaoLote       := '<br> Inclusão de lote(s) na ordem ' + sInclusaoLote;
  if trim(sInclusaoMercadoria) <> '' then
     sInclusaoMercadoria := '<br> Inclusão de Mercadoria(s)' + '<br>' + sInclusaoMercadoria + '<br>';

  if trim(sErro) <> '' then
  begin
     sErro   := '<br> Erros:' + '<br>' + sErro + '<br>';
     temErro := true;
  end;

  if not temErro then
    sResultadoProcessamento := sInclusao +  sAlteracao  +  sInclusaoLote + sInclusaoMercadoria
  else
    sResultadoProcessamento := sErro;

    if trim(sTitulo) = '' then
      sTitulo := 'Integração Nestle - Resultado Processamento - Ordem: '+ NrOrdem;

  if ((Email_Atendente <> '') or ((LocalSettings.EmailValidacao <> '') and (cbxValidar.Checked)))
    and (trim(sResultadoProcessamento) <> '') then
         EnviarEmail(sTitulo, sResultadoProcessamento, Email_Atendente);
end;


function TfrmMain.TrimLeadingZeros(const S: string): string;
var
  I, L: Integer;
begin
  L:= Length(S);
  I:= 1;
  while (I < L) and (S[I] = '0') do Inc(I);
  Result:= Copy(S, I);
end;

function TfrmMain.AddZeros(const S: string): string;
begin
  result := rightstr((StringOfChar('0',16) + trim(s)),16);
end;

//gsAppPath
procedure TfrmMain.LimpaLog(Path, TipoArquivo: String; tipoDataAnoNaFrente : boolean; qt_dias :Integer);
var
  NomeArquivo , sDataArquivo, SDataLimite : String;
  i:integer;
  ListaArquivosAntigos : TStringList;
  pesquisa: TSearchRec;

  const
  MASK_DATA_COM_TRACO = '[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]';  {  2    0    1    8    0    7     1    8  _ }
  MASK_DATA_SEM_TRACO = '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]';   {  2    0    1    8    0    7     1    8  _ }
begin
  ListaArquivosAntigos := tStringList.Create;
  try
    if FindFirst(IncludeTrailingPathDelimiter(Path)+ '*.' + TipoArquivo, faAnyFile-faDirectory, pesquisa) = 0 then
    begin
      repeat
        if (pesquisa.Attr <> faDirectory) then
        begin
          if tipoDataAnoNaFrente then
          begin
            NomeArquivo := Copy(pesquisa.Name, 1,10);
            if MatchesMask(NomeArquivo, MASK_DATA_COM_TRACO) then
              ListaArquivosAntigos.Add(pesquisa.Name);
          end
          else
          begin
            NomeArquivo := Copy(pesquisa.Name, 1,8);
            if MatchesMask(NomeArquivo, MASK_DATA_SEM_TRACO) then
              ListaArquivosAntigos.Add(pesquisa.Name);
          end;
        end;
      until FindNext(pesquisa) <> 0;

      FindClose(pesquisa);
    end;

    for I := 0 to ListaArquivosAntigos.count-1 do
    begin
      if tipoDataAnoNaFrente then
      begin
        sDataArquivo := Copy(ListaArquivosAntigos[i], 1, 4) + '/' +
                        Copy(ListaArquivosAntigos[i], 6, 2) + '/' +
                        Copy(ListaArquivosAntigos[i], 9, 2);
      end
      else
      begin
        sDataArquivo := Copy(ListaArquivosAntigos[i], 5, 4) + '/' +
                        Copy(ListaArquivosAntigos[i], 3, 2) + '/' +
                        Copy(ListaArquivosAntigos[i], 1, 2);
      end;
        sDataLimite  := formatdatetime('yyyy/mm/dd', IncDay(now,-qt_dias ));
      //se for mais antigo que 3 dias, exclui
      if sDataArquivo < sDataLimite then
      begin
        Deletefile(IncludeTrailingPathDelimiter(Path)+  ListaArquivosAntigos[i]);
      end;
    end;
  finally
    ListaArquivosAntigos.free;
  end;
end;

end.

