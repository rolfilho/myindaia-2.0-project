unit DmMain;

interface

uses
  System.SysUtils, System.Classes, Winapi.Windows, Dialogs, System.Generics.Collections,
  System.DateUtils,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdMessage,
  IdBaseComponent, IdComponent, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdText, IdAttachmentFile, System.StrUtils,
  IdFTP, uArquivoAGC;

type
  TStringArray = array of String;

  TDados = record
    CD_PREFIXO: string;
    CD_SERVICO: string;
  end;

  TProcesso = class
    NR_Processo: string;
    NR_Conhecimento: string;
    NomeAtendente: string;
    EmailAtendente: string;
    ArmazemDescarga: string;
    constructor Create(const ANR_Processo, ANR_Conhecimento, AArmazemDescarga, ANomeAtendente, AEmailAtendente: string);
  end;

  TdmdMain = class(TDataModule)
    dbBroker: TFDConnection;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdMessage1: TIdMessage;
    IdSMTP1: TIdSMTP;
    queryPedido: TFDQuery;
    queryAuxiliar: TFDQuery;
    queryID: TFDQuery;
    queryProcesso: TFDQuery;
    queryPO: TFDQuery;
    queryPOItem: TFDQuery;
    qryBroker: TFDQuery;
    qryServerTime: TFDQuery;
  private
    Dados: TDados;
    function GetDigitalizacaoPath(const AProcesso: string): string;
    procedure IncluirArquivo(const NR_Processo, NomeArquivo,
      DescricaoArquivo: string; TipoDocumento, Tabela: Integer);
    function GetSQLObjectId(const ObjectName: string): Int64;

  public
    function EventosExistem(Header: THeader; Item: TItem): Boolean;
    function GetCodigoExportador(NrCliente: String): String;
    function GetInstrucaoDesembaraco: String;
    procedure InsertInstrucaoDesembaraco(pInstrucaoDesembaraco: String; Header: THeader);
    function GetPOCriada(Header: THeader): Boolean;
    function GetNrProcesso: String;
    procedure InsertProcesso(NrProcesso: String; Header: THeader);
    procedure InsertTPO(Header: THeader);
    procedure UpDateFLP_PO(Header: THeader);
    function DeleteTPOItem(Header: THeader; Item: TItem): String;
    function GetNrItem(Header: THeader; Item: TItem): Integer;
    function GetNrItemNovo(Header: THeader): Integer;
    procedure PreencheCamposMercadoria(Item: TItem);
    procedure InsertTPOItem(NrItem: Integer; InstrucaoDesembaraco: String;
      Header: THeader; Item: TItem);
    procedure UpdateTPOItem(Header: THeader; Item: TItem);
    procedure InsertInstrucaoDesembaracoPedido(InstrucaoDesembaraco: String;
      Header: THeader; Item: TItem);
    procedure UpdateEvento257(Header: THeader; Item: TItem);
    procedure UpdateEvento275(Header: THeader; Item: TItem);
    procedure UpdateEvento798(Header: THeader; Item: TItem);
    procedure UpdateObservacaoEvento022(Header: THeader; Item: TItem);
    procedure UpdateEventosATP(Header: THeader; Item: TItem);

    procedure GravaArquivo(const PathArquivo, NomeArquivo, NR_Processo, Descricao: string);
    procedure ConfiguraConexaoBroker(const Servidor, Banco, Usuario, Senha: string);
    function EnviaEmail(ARemetente: String; APara, ACopia,
      ACopiaOculta: TStringArray; AAssunto, ACorpo: String;
      AAnexos: TStringArray; TrataHTML: Boolean = True): Boolean;
    function ServerDateTime: TDateTime;
  end;

var
  dmdMain: TdmdMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Utils, Settings, System.Variants;

{$R *.dfm}

function CopiaArquivo(AArquivoExistente, ANovoArquivo: String; AFalharSeExiste: Boolean): Boolean;
var
  Stream: TMemoryStream;
begin
  Result := False;
  if not (FileExists(ANovoArquivo) and AFalharSeExiste) then
  begin
    if not DirectoryExists(ExtractFileDir(ANovoArquivo)) then
      ForceDirectories(ExtractFileDir(ANovoArquivo));
    Stream := TMemoryStream.Create;
    try
      Stream.LoadFromFile(AArquivoExistente);
      Stream.Position := 0;
      Stream.SaveToFile(ANovoArquivo);
      Result := True;
      Log('Arquivo copiado para: ' + ANovoArquivo, nil);
    finally
      FreeAndNil(Stream);
    end;
    if Result then
      {$if CompilerVersion >= 22}
      SetFileAttributes(PWideChar(ANovoArquivo), System.SysUtils.faReadOnly);
      {$else}
      SetFileAttributes(PAnsiChar(ANovoArquivo), System.SysUtils.faReadOnly);
      {$ifend}
  end;
end;

function TdmdMain.GetInstrucaoDesembaraco: String;
begin
  queryAuxiliar.Close;
  queryAuxiliar.SQL.Clear;
  queryAuxiliar.SQL.Text :=
    ' SELECT ''ID'' + RIGHT(''00000000'' + CONVERT(VARCHAR, ISNULL(MAX(SUBSTRING(ISNULL(ID_CODIGO, ''0''), 3, 8)) + 1, ''1'')), 8) + ''-'' + RIGHT(YEAR(GETDATE()), 2) AS ID_CODIGO_NOVO' +
    ' FROM TINSTRUCAO_DESEMBARACO (NOLOCK)' +
    ' WHERE RIGHT(RTRIM(ID_CODIGO), 2) = RIGHT(CONVERT(VARCHAR, YEAR(GETDATE())), 2)';
  queryAuxiliar.Open;
  result := queryAuxiliar.FieldByName('ID_CODIGO_NOVO').AsString;
  queryAuxiliar.Close;
end;

procedure TdmdMain.InsertInstrucaoDesembaraco(pInstrucaoDesembaraco: String; Header: THeader);
begin
  queryID.Close;
  queryID.SQL.Clear;
  queryID.SQL.Text :=
    ' INSERT INTO TINSTRUCAO_DESEMBARACO (ID_CODIGO, CD_USUARIO, DT_CRIACAO, DT_AUTORIZACAO, IN_AUTORIZADO, CD_CLIENTE, CD_RESPONSAVEL, CD_EMPRESA, CD_MODAL)' +
    ' VALUES (:ID_CODIGO, :CD_USUARIO, :DT_CRIACAO, :DT_AUTORIZACAO, :IN_AUTORIZADO, :CD_CLIENTE, :CD_RESPONSAVEL, :CD_EMPRESA, :CD_MODAL)';
  queryID.ParamByName('ID_CODIGO').Value              := pInstrucaoDesembaraco;
  queryID.ParamByName('CD_USUARIO').Value             := '0707';
  queryID.ParamByName('DT_CRIACAO').Value             := Date;
  queryID.ParamByName('DT_AUTORIZACAO').Value         := Date;
  queryID.ParamByName('IN_AUTORIZADO').Value          := '1';
  queryID.ParamByName('CD_CLIENTE').Value             := Header.CdEmpresa;
  queryID.ParamByName('CD_RESPONSAVEL').Value         := '0088';
  queryID.ParamByName('CD_EMPRESA').Value             := Header.CdEmpresa;
  queryID.ParamByName('CD_MODAL').Value               := Header.Modal;
  queryID.ExecSQL;
end;

function TdmdMain.GetPOCriada(Header: THeader): Boolean;
begin
  queryPedido.Close;
  queryPedido.SQL.Clear;
  queryPedido.SQL.Text :=
    ' SELECT COUNT(*) AS CONTADOR FROM TPO WHERE NR_PROCESSO = :NR_PROCESSO  AND CD_EMPRESA = :CD_EMPRESA' ;
  queryPedido.ParamByName('NR_PROCESSO').Value := Header.NrPedido;
  queryPedido.ParamByName('CD_EMPRESA').Value := Header.CdEmpresa;
  queryPedido.Open;
  result := queryPedido.FieldByName('CONTADOR').AsInteger > 0;
  queryPedido.Close;
end;

function TdmdMain.GetNrProcesso: String;
begin
  queryAuxiliar.Close;
  queryAuxiliar.SQL.Clear;
  queryAuxiliar.SQL.Text :=
    ' SELECT ISNULL(MAX(ISNULL(CONVERT(INT, SUBSTRING(NR_PROCESSO, 8, CHARINDEX(''-'', NR_PROCESSO, CHARINDEX(''-'', NR_PROCESSO)) - 1)), 0)),0) AS PROCESSO ' +
    ' FROM TPROCESSO ' +
    ' WHERE CD_UNID_NEG = ''01'' ' +
    '   AND CD_PRODUTO  = ''06'' ' +
    '   AND DATEPART(YYYY, DT_ABERTURA) = DATEPART(YYYY, GETDATE()) ' +
    '   AND SUBSTRING(NR_PROCESSO, 5, 2) = ''CR'' ';
  queryAuxiliar.Open;
  result := queryAuxiliar.FieldByName('PROCESSO').AsString;
  queryAuxiliar.Close;
  result := Format('%s%s-%s-%s', ['0106', 'CR', FormatFloat('000000', StrToInt(result) + 1), FormatDateTime('yy', Now)]);
end;

function TdmdMain.GetCodigoExportador(NrCliente: String): String;
begin
  queryAuxiliar.Close;
  queryAuxiliar.SQL.Clear;
  queryAuxiliar.SQL.Text :=
    ' SELECT CD_EMPRESA FROM TEMPRESA_EST WHERE NR_CLIENTE = :NR_CLIENTE AND IN_EXPORTADOR = ''1''';
  queryAuxiliar.ParamByName('NR_CLIENTE').AsString := NrCliente;
  queryAuxiliar.Open;
  result := queryAuxiliar.FieldByName('CD_EMPRESA').AsString;
  queryAuxiliar.Close;
end;

procedure TdmdMain.InsertProcesso(NrProcesso: String; Header: THeader);
begin
  queryProcesso.Close;
  queryProcesso.SQL.Clear;
  queryProcesso.SQL.Text :=
    ' INSERT INTO TPROCESSO(NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_GRUPO, NR_REFERENCIA, CD_CLIENTE, IN_LIBERADO, IN_CANCELADO,' +
    '                      DT_ABERTURA, HR_ABERTURA, IN_DADOS_IGUAIS_ITENS, CD_INCOTERM, CD_USUARIO, ' +
    '                      CD_IMPORTADOR, CD_EXPORTADOR, CD_SERVICO, CD_AREA, IN_WEB, CD_TP_PEDIDO)' +
    '               VALUES(:NR_PROCESSO, :CD_UNID_NEG, :CD_PRODUTO, :CD_GRUPO, :NR_REFERENCIA, :CD_CLIENTE, :IN_LIBERADO, :IN_CANCELADO,' +
    '                      :DT_ABERTURA, :HR_ABERTURA, :IN_DADOS_IGUAIS_ITENS, :CD_INCOTERM, :CD_USUARIO, ' +
    '                      :CD_IMPORTADOR, :CD_EXPORTADOR,  :CD_SERVICO, :CD_AREA, ''1'', :CD_TP_PEDIDO )';
  queryProcesso.ParamByName('NR_PROCESSO').Value           := NrProcesso;
  queryProcesso.ParamByName('CD_UNID_NEG').Value           := '01';
  queryProcesso.ParamByName('CD_PRODUTO').Value            := '06';
  queryProcesso.ParamByName('CD_GRUPO').Value              := 'C65';
  queryProcesso.ParamByName('NR_REFERENCIA').Value         := Header.NrPedido;
  queryProcesso.ParamByName('CD_CLIENTE').Value            := Header.CdEmpresa;
  queryProcesso.ParamByName('IN_LIBERADO').Value           := '1';
  queryProcesso.ParamByName('IN_CANCELADO').Value          := '0';
  queryProcesso.ParamByName('DT_ABERTURA').Value           := Date;
  queryProcesso.ParamByName('HR_ABERTURA').Value           := Now;
  queryProcesso.ParamByName('IN_DADOS_IGUAIS_ITENS').Value := '1';
  queryProcesso.ParamByName('CD_INCOTERM').Value           := Header.CdIncoterm;
  queryProcesso.ParamByName('CD_USUARIO').Value            := '0707';
  queryProcesso.ParamByName('CD_IMPORTADOR').Value         := Header.CdEmpresa;
  queryProcesso.ParamByName('CD_EXPORTADOR').Value         := Header.CdExportador ;
  queryProcesso.ParamByName('CD_SERVICO').Value            := '391';
  queryProcesso.ParamByName('CD_AREA').Value               := '58';
  queryProcesso.ParamByName('CD_TP_PEDIDO').Value          := '11';
  queryProcesso.ExecSQL;
end;

procedure TdmdMain.InsertTPO(Header: THeader);
begin
  queryPO.Close;
  queryPO.SQL.Clear;
  queryPO.SQL.Text :=
    ' INSERT INTO TPO(NR_PROCESSO, CD_IMPORTADOR, CD_EXPORTADOR, CD_MOEDA_NEG, CD_INCOTERM, DT_ABERTURA, '+
                      'VL_TOTAL, CD_AREA, CD_SERVICO, CD_USUARIO, CD_EMPRESA, IN_WEB, CD_VIA_TRANSP)' +
    ' VALUES(:NR_PROCESSO, :CD_IMPORTADOR, :CD_EXPORTADOR, :CD_MOEDA_NEG, :CD_INCOTERM, :DT_ABERTURA, '+
                      ':VL_TOTAL, :CD_AREA, :CD_SERVICO, :CD_USUARIO, :CD_EMPRESA, ''1'', :CD_VIA_TRANSP)';
  queryPO.ParamByName('NR_PROCESSO').Value          := Header.NrPedido;
  queryPO.ParamByName('CD_IMPORTADOR').Value        := Header.CdEmpresa;
  queryPO.ParamByName('CD_EXPORTADOR').Value        := Header.CdExportador;
  queryPO.ParamByName('CD_MOEDA_NEG').Value         := Header.NmMoeda;
  queryPO.ParamByName('CD_INCOTERM').Value          := Header.CdIncoterm;
  queryPO.ParamByName('DT_ABERTURA').Value          := Date;
  queryPO.ParamByName('VL_TOTAL').Value             := Header.VlTotal;
  queryPO.ParamByName('CD_AREA').Value              := '58';
  queryPO.ParamByName('CD_SERVICO').Value           := '391';
  queryPO.ParamByName('CD_USUARIO').Value           := '0707';
  queryPO.ParamByName('CD_EMPRESA').Value           := Header.CdEmpresa;
  queryPO.ParamByName('CD_VIA_TRANSP').Value        := Header.Modal;
  queryPO.ExecSQL;
end;

procedure TdmdMain.UpDateFLP_PO(Header: THeader);
begin
  queryPO.Close;
  queryPO.SQL.Clear;
  queryPO.SQL.Text :=
  ' UPDATE TFLP_PO SET DT_REALIZACAO = CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103), ' +
                      'DT_PREVISTA   = CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103) ' +
  ' WHERE CD_EVENTO  IN (''003'',''022'') AND NR_PROCESSO = :NR_PROCESSO AND CD_EMPRESA  = ' + QuotedStr(Header.CdEmpresa);
  queryPO.ParamByName('NR_PROCESSO').Value := Header.NrPedido;
  queryPO.ExecSQL;

  queryPO.Close;
  queryPO.SQL.Clear;
  queryPO.SQL.Text := ' EXEC sp_atz_ev_flp_po :NR_PROCESSO, ' + QuotedStr(Header.CdEmpresa);
  queryPO.ParamByName('NR_PROCESSO').Value := Header.NrPedido;
  queryPO.ExecSQL;
end;

function TdmdMain.GetNrItem(Header: THeader; Item: TItem): Integer;
begin
  queryPOItem.Close;
  queryPOItem.SQL.Clear;
  queryPOItem.SQL.Text :=
    'SELECT ISNULL(MIN(CONVERT(INT, NR_ITEM)), 0) AS MIN_ITEM' +
    ' FROM TPO_ITEM ' +
    ' WHERE NR_PROCESSO = :NR_PROCESSO ' +
    ' AND NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE ' +
    ' AND CD_EMPRESA  = :CD_EMPRESA ';
  queryPOItem.ParamByName('NR_PROCESSO').Value := Header.NrPedido;
  queryPOItem.ParamByName('NR_ITEM_CLIENTE').Value := FormatFloat('0000', Item.NrItemCliente);
  queryPOItem.ParamByName('CD_EMPRESA').Value  := Header.CdEmpresa;
  queryPOItem.Open;
  result := queryPOItem.FieldByName('MIN_ITEM').AsInteger;
  queryPOItem.Close;
end;

function TdmdMain.DeleteTPOItem(Header: THeader; Item: TItem): String;
begin
  queryPOItem.Close;
  queryPOItem.SQL.Clear;
  queryPOItem.SQL.Text :=
    ' DELETE FROM TPO_ITEM WHERE NR_PROCESSO = :NR_PROCESSO ' +
    '                            AND NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE AND CD_EMPRESA  = :CD_EMPRESA ';
  queryPOItem.ParamByName('NR_PROCESSO').Value := Header.NrPedido;
  queryPOItem.ParamByName('NR_ITEM_CLIENTE').Value := FormatFloat('0000', Item.NrItemCliente);;
  queryPOItem.ParamByName('CD_EMPRESA').Value  := Header.CdEmpresa;
  queryPOItem.ExecSQL;
end;

function TdmdMain.GetNrItemNovo(Header: THeader): Integer;
begin
  queryPOItem.Close;
  queryPOItem.SQL.Clear;
  queryPOItem.SQL.Text :=
    'SELECT ISNULL(MAX(CONVERT(INT, NR_ITEM)), 0) AS MAX_ITEM FROM TPO_ITEM ' +
    ' WHERE NR_PROCESSO = :NR_PROCESSO AND CD_EMPRESA  = :CD_EMPRESA ';
  queryPOItem.ParamByName('NR_PROCESSO').Value := Header.NrPedido;
  queryPOItem.ParamByName('CD_EMPRESA').Value  := Header.CdEmpresa;
  queryPOItem.Open;
  result := queryPOItem.FieldByName('MAX_ITEM').AsInteger;
  queryPOItem.Close;
end;

procedure TdmdMain.PreencheCamposMercadoria(Item: TItem);
begin
  queryAuxiliar.Close;
  queryAuxiliar.SQL.Clear;
  queryAuxiliar.SQL.Text :=
    'SELECT MERC.CD_NCM_SH, MERC.NM_MERCADORIA, ISNULL(FMERC.LEAD_TIME, 0) AS LEAD_TIME ' +
    'FROM TMERCADORIA MERC ' +
    ' LEFT JOIN TFINALIDADE_MERC FMERC ON FMERC.CD_FINALIDADE_MERC = MERC.CD_FINALIDADE_MERC ' +
    ' WHERE CD_MERCADORIA = :CD_MERCADORIA ';
  queryAuxiliar.ParamByName('CD_MERCADORIA').Value := 'AGC01';
  queryAuxiliar.Open;
  if queryAuxiliar.RecordCount > 0 then
  begin
    Item.NCM := queryAuxiliar.FieldByName('CD_NCM_SH').AsString;
    Item.TxMercadoria := queryAuxiliar.FieldByName('NM_MERCADORIA').AsString;
    Item.LeadTime := queryAuxiliar.FieldByName('LEAD_TIME').AsInteger;
  end
  else
    raise Exception.Create('Mercadoria: "' + Item.CdMercadoria + '" não existe no sistema.');

  queryAuxiliar.Close;
end;

procedure TdmdMain.InsertTPOItem(NrItem: Integer; InstrucaoDesembaraco: String; Header: THeader; Item: TItem);
begin
  queryPOItem.Close;
  queryPOItem.SQL.Clear;
  queryPOItem.SQL.Text :=
    ' INSERT INTO TPO_ITEM(NR_PROCESSO, NR_ITEM, CD_EXPORTADOR, CD_MERCADORIA, CD_NCM_SH, CD_MOEDA_NEGOCIADA, CD_INCOTERM, ' +
    '                      PL_ITEM, QT_INICIAL, QT_DISPONIVEL, TP_CALCULO, TX_MERCADORIA, VL_UNITARIO, VL_TOTAL, CD_UNID_MEDIDA, ' +
    '                      NR_ITEM_CLIENTE, NR_PARCIAL, CD_EMPRESA, IN_UTILIZADO_INSTR_DESEMB, ID_CODIGO_INSTR_DESEMB, CD_AREA, CD_MERC_FORNEC, CD_PAIS_ORIGEM, IN_WEB) ' +
    'VALUES(:NR_PROCESSO, :NR_ITEM, :CD_EXPORTADOR, :CD_MERCADORIA, :CD_NCM_SH, :CD_MOEDA_NEGOCIADA, :CD_INCOTERM, ' +
    '       :PL_ITEM, :QT_INICIAL, :QT_DISPONIVEL, :TP_CALCULO, :TX_MERCADORIA, :VL_UNITARIO, :VL_TOTAL, :CD_UNID_MEDIDA, ' +
    '       :NR_ITEM_CLIENTE, :NR_PARCIAL, :CD_EMPRESA, :IN_UTILIZADO_INSTR_DESEMB, :ID_CODIGO_INSTR_DESEMB, :CD_AREA, :CD_MERC_FORNEC, :CD_PAIS_ORIGEM, ''1'')';
  queryPOItem.ParamByName('NR_PROCESSO').Value               := Header.NrPedido;
  queryPOItem.ParamByName('NR_ITEM').Value                   := FormatFloat('000', NrItem + 1);
  queryPOItem.ParamByName('CD_EXPORTADOR').Value             := Header.CdExportador;
  queryPOItem.ParamByName('CD_MERCADORIA').Value             := 'AGC01';
  queryPOItem.ParamByName('CD_NCM_SH').Value                 := Item.NCM;
  queryPOItem.ParamByName('CD_MOEDA_NEGOCIADA').Value        := Header.NmMoeda;
  queryPOItem.ParamByName('CD_INCOTERM').Value               := Header.CdIncoterm;
  queryPOItem.ParamByName('PL_ITEM').Value                   := 0;
  queryPOItem.ParamByName('QT_INICIAL').Value                := Item.QtMercadoria;
  queryPOItem.ParamByName('QT_DISPONIVEL').Value             := 0;
  queryPOItem.ParamByName('TP_CALCULO').Value                := Item.TpCalculoNovo;
  queryPOItem.ParamByName('TX_MERCADORIA').Value             := Item.TxMercadoria;
  queryPOItem.ParamByName('VL_UNITARIO').Value               := Item.VlUnitario;
  queryPOItem.ParamByName('VL_TOTAL').Value                  := Item.VlTotal;
  queryPOItem.ParamByName('CD_UNID_MEDIDA').Value            := Item.NmUnidMedida;
  queryPOItem.ParamByName('NR_ITEM_CLIENTE').Value           := FormatFloat('0000', Item.NrItemCliente);
  queryPOItem.ParamByName('NR_PARCIAL').Value                := 0;
  queryPOItem.ParamByName('CD_EMPRESA').Value                := Header.CdEmpresa;
  queryPOItem.ParamByName('IN_UTILIZADO_INSTR_DESEMB').Value := '0';
  queryPOItem.ParamByName('ID_CODIGO_INSTR_DESEMB').DataType := ftString;
  queryPOItem.ParamByName('ID_CODIGO_INSTR_DESEMB').Value    := NULL;
  queryPOItem.ParamByName('CD_AREA').Value                   := '58';
  queryPOItem.ParamByName('CD_MERC_FORNEC').Value            := Item.DescNmCliente;
  queryPOItem.ParamByName('CD_PAIS_ORIGEM').Value            := Item.CdPais;
  queryPOItem.ExecSQL;

  queryPOItem.ParamByName('NR_ITEM').Value                   := FormatFloat('000', NrItem + 2);
  queryPOItem.ParamByName('QT_INICIAL').Value                := Item.QtMercadoria;
  queryPOItem.ParamByName('QT_DISPONIVEL').Value             := Item.QtMercadoria;
  queryPOItem.ParamByName('NR_PARCIAL').Value                := 1;
  queryPOItem.ParamByName('IN_UTILIZADO_INSTR_DESEMB').Value := '1';
  queryPOItem.ParamByName('ID_CODIGO_INSTR_DESEMB').Value    := InstrucaoDesembaraco;
  queryPOItem.ExecSQL;

end;

procedure TdmdMain.UpdateTPOItem(Header: THeader; Item: TItem);
begin
  queryPOItem.Close;
  queryPOItem.SQL.Clear;
  queryPOItem.SQL.Text :=
    ' UPDATE TPO_ITEM SET' + #13#10 +
    ' CD_EXPORTADOR = :CD_EXPORTADOR,   ' + #13#10 +
    ' CD_MERCADORIA = :CD_MERCADORIA,   ' + #13#10 +
    ' CD_NCM_SH = :CD_NCM_SH,   ' + #13#10 +
    ' CD_MOEDA_NEGOCIADA = :CD_MOEDA_NEGOCIADA,   ' + #13#10 +
    ' CD_INCOTERM = :CD_INCOTERM,   ' + #13#10 +
    ' QT_INICIAL = :QT_INICIAL,   ' + #13#10 +
    ' TP_CALCULO = :TP_CALCULO,   ' + #13#10 +
    ' TX_MERCADORIA = :TX_MERCADORIA,   ' + #13#10 +
    ' VL_UNITARIO = :VL_UNITARIO,   ' + #13#10 +
    ' VL_TOTAL = :VL_TOTAL,   ' + #13#10 +
    ' CD_UNID_MEDIDA = :CD_UNID_MEDIDA,   ' + #13#10 +
    ' CD_EMPRESA = :CD_EMPRESA,   ' + #13#10 +
    ' CD_MERC_FORNEC = :CD_MERC_FORNEC,   ' + #13#10 +
    ' CD_PAIS_ORIGEM = :CD_PAIS_ORIGEM   ' + #13#10 +
    ' WHERE NR_PROCESSO = :NR_PROCESSO ' +
    ' AND NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE '  +
    ' AND CD_EMPRESA  = :CD_EMPRESA ';

  queryPOItem.ParamByName('NR_PROCESSO').Value               := Header.NrPedido;
  queryPOItem.ParamByName('NR_ITEM_CLIENTE').Value           := FormatFloat('0000', Item.NrItemCliente);
  queryPOItem.ParamByName('CD_EMPRESA').Value                := Header.CdEmpresa;
  queryPOItem.ParamByName('CD_EXPORTADOR').Value             := Header.CdExportador;
  queryPOItem.ParamByName('CD_MERCADORIA').Value             := 'AGC01';
  queryPOItem.ParamByName('CD_NCM_SH').Value                 := Item.NCM;
  queryPOItem.ParamByName('CD_MOEDA_NEGOCIADA').Value        := Header.NmMoeda;
  queryPOItem.ParamByName('CD_INCOTERM').Value               := Header.CdIncoterm;
  queryPOItem.ParamByName('QT_INICIAL').Value                := Item.QtMercadoria;
  queryPOItem.ParamByName('TP_CALCULO').Value                := Item.TpCalculoNovo;
  queryPOItem.ParamByName('TX_MERCADORIA').Value             := Item.TxMercadoria;
  queryPOItem.ParamByName('VL_UNITARIO').Value               := Item.VlUnitario;
  queryPOItem.ParamByName('VL_TOTAL').Value                  := Item.VlTotal;
  queryPOItem.ParamByName('CD_UNID_MEDIDA').Value            := Item.NmUnidMedida;
  queryPOItem.ParamByName('CD_MERC_FORNEC').Value            := Item.DescNmCliente;
  queryPOItem.ParamByName('CD_PAIS_ORIGEM').Value            := Item.CdPais;
  queryPOItem.ExecSQL;
end;

function TdmdMain.EventosExistem(Header: THeader; Item: TItem): Boolean;
var
  queryEventosExistem: TFDQuery;
begin
  queryEventosExistem := TFDQuery.Create(nil);
  try
    queryEventosExistem.Connection := dbBroker;
    queryEventosExistem.Close;
    queryEventosExistem.SQL.Clear;
    queryEventosExistem.SQL.Text :=
      ' SELECT COUNT(*) AS QTD_EVENTOS FROM TFLP_PO_ITEM NOLOCK ' +
      ' WHERE CD_EVENTO  IN (''257'', ''798'', ''275'') ' +
      '  AND NR_PROCESSO = ''4501851575'''+//:NR_PROCESSO ' +
      '  AND NR_ITEM_CLIENTE = ''0010'''+//:NR_ITEM_CLIENTE ' +
//      '  AND NR_PROCESSO = :NR_PROCESSO ' +
//      '  AND NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE ' +
      '  AND CD_EMPRESA  = ' + QuotedStr(Header.CdEmpresa);
//    queryEventosExistem.ParamByName('NR_PROCESSO').AsString := '4501851575'; //Header.NrPedido;
//    queryEventosExistem.ParamByName('NR_ITEM_CLIENTE').AsString := '0010';//FormatFloat('0000', Item.NrItemCliente);
    queryEventosExistem.Prepare;
    queryEventosExistem.Open;
    result := queryEventosExistem.FieldByName('QTD_EVENTOS').AsInteger > 0;
    queryEventosExistem.Close;
  finally
    queryEventosExistem.Free;
  end;
end;

procedure TdmdMain.UpdateEvento257(Header: THeader; Item: TItem);
begin
  queryPOItem.Close;
  queryPOItem.SQL.Clear;
  queryPOItem.SQL.Text :=
    ' UPDATE TFLP_PO_ITEM ' +
    ' SET DT_REALIZACAO = CAST(' + QuotedStr(FormatDateTime('yyyy-mm-dd', Header.DtRecebPO)) + ' AS DATE) ' +
    ' WHERE CD_EVENTO  IN (''257'') ' +
    '  AND NR_PROCESSO = ' + QuotedStr(Header.NrPedido) +
    '  AND NR_ITEM_CLIENTE = ' + QuotedStr(FormatFloat('0000', Item.NrItemCliente)) +
    '  AND CD_EMPRESA  = ' + QuotedStr(Header.CdEmpresa);

//    ' UPDATE TFLP_PO_ITEM ' +
//    ' SET DT_REALIZACAO = :DT_REALIZACAO ' +
//    ' WHERE CD_EVENTO  IN (''257'') ' +
//    '  AND NR_PROCESSO = :NR_PROCESSO ' +
//    '  AND NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE ' +
//    '  AND CD_EMPRESA  = '+ Header.CdEmpresa';
//
//  queryPOItem.ParamByName('DT_REALIZACAO').AsDateTime := Header.DtRecebPO;
//  queryPOItem.ParamByName('NR_PROCESSO').AsString   := Header.NrPedido;
//  queryPOItem.ParamByName('NR_ITEM_CLIENTE').AsString   := FormatFloat('0000', Item.NrItemCliente);
  queryPOItem.ExecSQL;
end;

procedure TdmdMain.UpdateEvento798(Header: THeader; Item: TItem);
begin
  queryPOItem.Close;
  queryPOItem.SQL.Clear;
  queryPOItem.SQL.Text :=
    ' UPDATE TFLP_PO_ITEM ' +
    ' SET DT_REALIZACAO = CAST(' + QuotedStr(FormatDateTime('yyyy-mm-dd', IncDay(Header.DtRecebPO, Item.LeadTime))) + ' AS DATE) ' +
    ' WHERE CD_EVENTO  IN (''798'') ' +
    '  AND NR_PROCESSO = ' + QuotedStr(Header.NrPedido) +
    '  AND NR_ITEM_CLIENTE = ' + QuotedStr(FormatFloat('0000', Item.NrItemCliente)) +
    '  AND CD_EMPRESA  = ' + QuotedStr(Header.CdEmpresa);


//    ' UPDATE TFLP_PO_ITEM ' +
//    ' SET DT_REALIZACAO = :DT_REALIZACAO ' +
//    ' WHERE CD_EVENTO  IN (''798'') ' +
//    '  AND NR_PROCESSO = :NR_PROCESSO ' +
//    '  AND NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE ' +
//    '  AND CD_EMPRESA  = ''00500''';
//  queryPOItem.ParamByName('DT_REALIZACAO').Value := IncDay(Header.DtRecebPO, Item.LeadTime);
//  queryPOItem.ParamByName('NR_PROCESSO').Value   := Header.NrPedido;
//  queryPOItem.ParamByName('NR_ITEM_CLIENTE').Value   := FormatFloat('0000', Item.NrItemCliente);
  queryPOItem.ExecSQL;
end;

procedure TdmdMain.UpdateEvento275(Header: THeader; Item: TItem);
begin
  queryPOItem.Close;
  queryPOItem.SQL.Clear;
  queryPOItem.SQL.Text :=
    ' UPDATE TFLP_PO_ITEM ' +
    ' SET DT_REALIZACAO = CAST(' + QuotedStr(FormatDateTime('yyyy-mm-dd', Item.DtDeliv)) + ' AS DATE) ' +
    ' WHERE CD_EVENTO  IN (''275'') ' +
    '  AND NR_PROCESSO = ' + QuotedStr(Header.NrPedido) +
    '  AND NR_ITEM_CLIENTE = ' + QuotedStr(FormatFloat('0000', Item.NrItemCliente)) +
    '  AND CD_EMPRESA  = ' + QuotedStr(Header.CdEmpresa);



  //    ' UPDATE TFLP_PO_ITEM ' +
//    ' SET DT_REALIZACAO = :DT_REALIZACAO ' +
//    ' WHERE CD_EVENTO  IN (''275'') ' +
//    '  AND NR_PROCESSO = :NR_PROCESSO ' +
//    '  AND NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE ' +
//    '  AND CD_EMPRESA  = ''00500''';
//  queryPOItem.ParamByName('DT_REALIZACAO').Value := Item.DtDeliv;
//  queryPOItem.ParamByName('NR_PROCESSO').Value   := Header.NrPedido;
//  queryPOItem.ParamByName('NR_ITEM_CLIENTE').Value   := FormatFloat('0000', Item.NrItemCliente);
  queryPOItem.ExecSQL;
end;

procedure TdmdMain.UpdateEventosATP(Header: THeader; Item: TItem);
var
  vEvento : String;
  vData : String;
begin
  vEvento := '';
  vData := DateTimeToStr(Item.DtATP);
  if vData = '' then
    exit;

  queryPOItem.Close;
  queryPOItem.SQL.Clear;
  queryPOItem.SQL.Text :=

    'SELECT EV879.NR_PROCESSO, EV879.CD_EVENTO, ' + #13#10 +
    'ISNULL(CONVERT(VARCHAR, EV879.DT_REALIZACAO, 103), '''') AS DT879, ' + #13#10 +
    'ISNULL(CONVERT(VARCHAR, EV880.DT_REALIZACAO, 103), '''') AS DT880, ' + #13#10 +
    'ISNULL(CONVERT(VARCHAR, EV881.DT_REALIZACAO, 103), '''') AS DT881, ' + #13#10 +
    'ISNULL(CONVERT(VARCHAR, EV955.DT_REALIZACAO, 103), '''') AS DT955  ' + #13#10 +
    'FROM TFLP_PO_ITEM AS EV879 ' + #13#10 +
    'INNER JOIN TFLP_PO_ITEM AS EV880 ON  EV880.CD_EVENTO = 880 AND EV880.NR_PROCESSO = EV879.NR_PROCESSO ' + #13#10 +
    'AND EV880.NR_ITEM_CLIENTE = EV879.NR_ITEM_CLIENTE AND EV880.NR_PARCIAL = 1 AND EV880.CD_EMPRESA  = EV879.CD_EMPRESA ' + #13#10 +
    'INNER JOIN TFLP_PO_ITEM AS EV881 ON  EV881.CD_EVENTO = 881 AND EV881.NR_PROCESSO = EV879.NR_PROCESSO ' + #13#10 +
    'AND EV881.NR_ITEM_CLIENTE = EV879.NR_ITEM_CLIENTE AND EV881.NR_PARCIAL = 1 AND EV881.CD_EMPRESA  = EV879.CD_EMPRESA ' + #13#10 +
    'INNER JOIN TFLP_PO_ITEM AS EV955 ON  EV955.CD_EVENTO = 955 AND	EV955.NR_PROCESSO = EV879.NR_PROCESSO ' + #13#10 +
    'AND EV955.NR_ITEM_CLIENTE = EV879.NR_ITEM_CLIENTE AND EV955.NR_PARCIAL = 1 AND EV955.CD_EMPRESA  = EV879.CD_EMPRESA ' + #13#10 +
    'WHERE EV879.CD_EVENTO = 879 ' + #13#10 +
    'AND EV879.NR_PROCESSO = ' + QuotedStr(Header.NrPedido) + #13#10 +
    'AND EV879.NR_ITEM_CLIENTE = ' + QuotedStr(FormatFloat('0000', Item.NrItemCliente)) + ' ' + #13#10 +
    'AND EV879.NR_PARCIAL = 1 ' + #13#10 +
    'AND EV879.CD_EMPRESA  = ' + QuotedStr(Header.CdEmpresa);

  queryPOItem.Open;

  if queryPOItem.FieldByName('DT879').AsString = '' then
    vEvento := '879'
  else if (vData <> queryPOItem.FieldByName('DT879').AsString) and (queryPOItem.FieldByName('DT880').AsString = '') then
    vEvento := '880'
  else if (vData <> queryPOItem.FieldByName('DT880').AsString) and (queryPOItem.FieldByName('DT881').AsString = '')
    and (queryPOItem.FieldByName('DT880').AsString <> '') then
    vEvento := '881'
  else if (vData <> queryPOItem.FieldByName('DT881').AsString) and (queryPOItem.FieldByName('DT955').AsString = '')
    and (queryPOItem.FieldByName('DT881').AsString <> '') then
    vEvento := '955'
  else if (vData <> queryPOItem.FieldByName('DT955').AsString) then vEvento := '955';

  if vEvento <> '' then
  begin
    queryPOItem.Close;
    queryPOItem.SQL.Clear;
    queryPOItem.SQL.Text :=
      ' UPDATE TFLP_PO_ITEM ' +
      ' SET DT_REALIZACAO = CAST(' + QuotedStr(FormatDateTime('yyyy-mm-dd', Item.DtATP)) + ' AS DATE) ' +
      ' WHERE CD_EVENTO  = ' + QuotedStr(vEvento) +
      '  AND NR_PROCESSO = ' + QuotedStr(Header.NrPedido) +
      '  AND NR_ITEM_CLIENTE = ' + QuotedStr(FormatFloat('0000', Item.NrItemCliente)) +
      '  AND NR_PARCIAL = 1' +
      '  AND CD_EMPRESA  = ' + QuotedStr(Header.CdEmpresa);
    queryPOItem.ExecSQL;
  end;

end;

procedure TdmdMain.UpdateObservacaoEvento022(Header: THeader; Item: TItem);
begin
  queryPOItem.Close;
  queryPOItem.SQL.Clear;
  queryPOItem.SQL.Text :=
    ' UPDATE TFLP_PO_ITEM ' +
    ' SET TX_OBS = ' + QuotedStr(Item.ObservacaoEvento22 + ' ' + Item.Observações) +
    ' WHERE CD_EVENTO  IN (''022'') ' +
    '  AND NR_PROCESSO = ' + QuotedStr(Header.NrPedido) +
    '  AND NR_ITEM_CLIENTE = ' + QuotedStr(FormatFloat('0000', Item.NrItemCliente)) +
    '  AND NR_PARCIAL = 1' +
    '  AND CD_EMPRESA  = ' + QuotedStr(Header.CdEmpresa);


//    ' UPDATE TFLP_PO_ITEM ' +
//    ' SET DT_REALIZACAO = :DT_REALIZACAO ' +
//    ' WHERE CD_EVENTO  IN (''798'') ' +
//    '  AND NR_PROCESSO = :NR_PROCESSO ' +
//    '  AND NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE ' +
//    '  AND CD_EMPRESA  = ' + Header.CdEmpresa;
//  queryPOItem.ParamByName('DT_REALIZACAO').Value := IncDay(Header.DtRecebPO, Item.LeadTime);
//  queryPOItem.ParamByName('NR_PROCESSO').Value   := Header.NrPedido;
//  queryPOItem.ParamByName('NR_ITEM_CLIENTE').Value   := FormatFloat('0000', Item.NrItemCliente);
  queryPOItem.ExecSQL;
end;

procedure TdmdMain.InsertInstrucaoDesembaracoPedido(InstrucaoDesembaraco: String; Header: THeader; Item: TItem);
begin
  queryPOItem.Close;
  queryPOItem.SQL.Clear;
  queryPOItem.SQL.Text :=
    ' INSERT INTO TINSTRUCAO_DESEMBARACO_PEDIDO(ID_CODIGO, NR_REFERENCIA, NR_ITEM_PO, NR_PARCIAL, DT_INCLUSAO) ' +
             ' VALUES(:ID_CODIGO, :NR_REFERENCIA, :NR_ITEM_PO, 1, ' +
             ' CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103))';
  queryPOItem.ParamByName('ID_CODIGO').Value := InstrucaoDesembaraco;
  queryPOItem.ParamByName('NR_REFERENCIA').Value   := Header.NrPedido;
  queryPOItem.ParamByName('NR_ITEM_PO').Value   := FormatFloat('0000', Item.NrItemCliente);
  queryPOItem.ExecSQL;
end;



{procedures antigas *Cardinal*}

procedure TdmdMain.ConfiguraConexaoBroker(const Servidor, Banco, Usuario,
  Senha: string);
begin
  dbBroker.Close;
  dbBroker.Params.Values['Server'] := Servidor;
  dbBroker.Params.Values['Database'] := Banco;
  dbBroker.Params.Values['User_Name'] := Usuario;
  dbBroker.Params.Values['Password'] := Senha;
  dbBroker.Params.Values['DriverID'] := 'MSSQL';
  dbBroker.Open;
end;

function TdmdMain.GetDigitalizacaoPath(const AProcesso: string): string;
begin
  qryBroker.Close;
  qryBroker.SQL.Text := 'SELECT BROKER.DBO.FN_PATH_DIGITALIZACAO(''' + Trim(AProcesso) + ''', 1)';
  qryBroker.Open;
  Result := IncludeTrailingPathDelimiter(Trim(qryBroker.Fields[0].AsString));
  Result := Result + 'TPROCESSO\' + Trim(AProcesso) + '\';
  qryBroker.Close;
end;

function TdmdMain.ServerDateTime: TDateTime;
begin
  qryServerTime.Close;
  qryServerTime.SQL.Text := 'SELECT GETDATE() AS CurrentDateTime ';
  qryServerTime.Open;
  Result := qryServerTime.FieldByName('CurrentDateTime').AsDateTime;
  qryServerTime.Close;
end;

procedure TdmdMain.IncluirArquivo(const NR_Processo, NomeArquivo, DescricaoArquivo: string; TipoDocumento, Tabela: Integer);
begin
  qryBroker.Close;
  qryBroker.SQL.Text := 'INSERT INTO TPROCESSO_DOCTOS '+
    '(NR_PROCESSO, CD_TIPO_DOCTO, NM_DESCRICAO, NM_ARQUIVO, CD_USUARIO_CRIACAO, DT_CRIACAO, IN_ATIVO, ID_TABELA) '+
    'VALUES (:NR_PROCESSO, :CD_TIPO_DOCTO, :NM_DESCRICAO, :NM_ARQUIVO, :CD_USUARIO_CRIACAO, :DT_CRIACAO, 1 , :ID_TABELA) ';
  qryBroker.ParamByName('NR_PROCESSO').AsString := NR_Processo;
  qryBroker.ParamByName('CD_TIPO_DOCTO').AsInteger := TipoDocumento;
  qryBroker.ParamByName('NM_DESCRICAO').AsString := DescricaoArquivo;
  qryBroker.ParamByName('NM_ARQUIVO').AsString := NomeArquivo;
  qryBroker.ParamByName('CD_USUARIO_CRIACAO').Asstring := '0707'; //Departamento de Software
  qryBroker.ParamByName('DT_CRIACAO').AsDateTime := ServerDateTime;
  qryBroker.ParamByName('ID_TABELA').AsInteger := Tabela;
  qryBroker.ExecSQL;
end;

function TdmdMain.GetSQLObjectId(const ObjectName: string): Int64;
begin
  qryBroker.Close;
  qryBroker.SQL.Text := 'SELECT OBJECT_ID FROM SYS.TABLES WHERE NAME = ' + QuotedStr(ObjectName);
  qryBroker.Open;
  Result := qryBroker.FieldByName('OBJECT_ID').AsInteger;
  qryBroker.Close;
end;

procedure TdmdMain.GravaArquivo(const PathArquivo, NomeArquivo, NR_Processo, Descricao: string);
var
  DigPath: string;
  TabelaId: Int64;
  Incluir: Boolean;
  NovoNome: string;
begin
  try
    DigPath := GetDigitalizacaoPath(NR_Processo);
    TabelaId := GetSQLObjectId('TPROCESSO');
    if not FileExists(PathArquivo + NomeArquivo) then
      Exit;
    NovoNome := RightStr(NomeArquivo, 15);
    Incluir := not FileExists(DigPath + NovoNome);
    if not Incluir then
    begin
      SetFileAttributes(PWideChar(DigPath + NovoNome), faNormal);
      if not DeleteFile(PWideChar(DigPath + NovoNome)) then
      begin
        raise Exception.Create('Não foi possível remover o arquivo '+ DigPath + NomeArquivo +
                   '.'#13'A operação não foi concluída.');
        Exit;
      end;
    end;
    if not CopiaArquivo(PathArquivo + NomeArquivo, DigPath + NovoNome, False) then
    begin
      raise Exception.Create('Erro ao copiar o arquivo ' + PathArquivo + NomeArquivo + ' para '+ DigPath + NovoNome +
                 '.'#13'A operação não foi concluída.');
    end;
    if Incluir then
    begin
      IncluirArquivo(NR_Processo, NovoNome, Descricao, 14, TabelaId);
      Log('Arquivo enviado para o Digitalizar: ' + NovoNome, nil);
    end
    else
      Log('Arquivo não enviado para o Digitalizar: ' + NovoNome, nil);
  finally
    //if FileExists(PathArquivo + NomeArquivo) then
    //  DeleteFile(PWideChar(PathArquivo + NomeArquivo));
  end;
end;

function TdmdMain.EnviaEmail(ARemetente: String; APara, ACopia, ACopiaOculta: TStringArray;
   AAssunto, ACorpo: String; AAnexos: TStringArray; TrataHTML: Boolean): Boolean;
var
  NewText1 : TIdText;
  I: Integer;
begin
  qryBroker.Close;
  qryBroker.sql.Text := 'SELECT NM_HOST, NR_PORTA, NM_LOGIN, NM_SENHA, EMAIL_TLS FROM VW_CONFIG_MAIL ( NOLOCK )';
  try
    qryBroker.Open;
    IdSMTP1.Host     := qryBroker.FieldByName('NM_HOST').AsString;//'email-smtp.us-east-1.amazonaws.com';
    IdSMTP1.Port     := qryBroker.FieldByName('NR_PORTA').AsInteger;//587;
    IdSMTP1.Username := qryBroker.FieldByName('NM_LOGIN').AsString;//'AKIAIX5BPVHLHQRKEUTA';
    IdSMTP1.Password := qryBroker.FieldByName('NM_SENHA').AsString;//'ArDzRv3zLp+wJyYyFjwWka9oiryB3dgBhcS5X2JXijbh';
    if (qryBroker.FieldByName('EMAIL_TLS').AsBoolean) then
    begin
      IdSMTP1.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
      IdSMTP1.UseTLS := utUseExplicitTLS;
    end
    else
    begin
      IdSMTP1.IOHandler := nil;
      IdSMTP1.UseTLS := utNoTLSSupport;
    end;
    qryBroker.Close;
    IdMessage1.Clear;

    NewText1 := TIdText.Create(IdMessage1.MessageParts);

    try
      with NewText1 do
      begin
        ContentType:='text/html';
        for I := 0 to High(AAnexos) do
          if FileExists(AAnexos[I]) then
            TIdAttachmentFile.Create(IdMessage1.MessageParts, AAnexos[I]);
        if TrataHTML then
        begin
          Body.Add('<html>');
          Body.Add('<body>');
          Body.Add(ACorpo);
          Body.Add('<br>');
          Body.Add('<br>');
          Body.Add('Email gerado automaticamente.<br>');
          Body.Add('Duvidas: <a href="mailto:ti@myindaia.com.br">ti@myindaia.com.br</a>');
          Body.Add('</body>');
          Body.Add('</html>');
        end
        else
          Body.Add(ACorpo);
      end;

      if ARemetente = '' then
        ARemetente := 'ti@myindaia.com.br';

      with IdMessage1 do
      begin
        From.Text := ARemetente;

        // Eliminar Destitário inserido mais de uma vez
        for I := 0 to High(APara) do
          if (APara[I] <> '') and (AnsiIndexText(APara[I], APara) = I) then
            Recipients.Add.Text := APara[I];

        // Eliminar Cópia inserido mais de uma vez ou inserido em ADestinatarios
        for I := 0 to High(ACopia) do
          if (ACopia[I] <> '') and (AnsiIndexText(ACopia[I], ACopia) = I)
             and (AnsiIndexText(ACopia[I], APara) < 0) then
            CCList.Add.Text := ACopia[I];

        // Eliminar Cópia Oculta inserido mais de uma vez ou inserido em ADestinatarios ou inserido em ACopia
        for I := 0 to High(ACopiaOculta) do
          if (ACopiaOculta[I] <> '') and (AnsiIndexText(ACopiaOculta[I], ACopiaOculta) = I)
             and (AnsiIndexText(ACopiaOculta[I], APara) < 0) and (AnsiIndexText(ACopiaOculta[I], ACopia) < 0) then
            BccList.Add.Text := ACopiaOculta[I];
        Subject := AAssunto;
      end;
      IdSMTP1.Connect;
      try
        IdSMTP1.Send(IdMessage1);
        Result := True;
      except
        on E: Exception do
        begin
          Log(E.Message, nil);
          Result := False;
        end;
      end;
    finally
      FreeAndNil(NewText1);
      IdSMTP1.Disconnect;
      IdMessage1.Clear;
    end;
  finally
    //qryConfigMail.Close;
    //Connection.Close;
  end;
end;

{ TProcesso }

constructor TProcesso.Create(const ANR_Processo, ANR_Conhecimento, AArmazemDescarga,
  ANomeAtendente, AEmailAtendente: string);
begin
  NR_Processo := ANR_Processo;
  NR_Conhecimento := ANR_Conhecimento;
  NomeAtendente := ANomeAtendente;
  EmailAtendente := AEmailAtendente;
  ArmazemDescarga := AArmazemDescarga;
end;

end.
