unit DmBroker;

interface

uses
  System.SysUtils, System.Classes, Winapi.Windows, Dialogs, System.Generics.Collections,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdMessage,
  IdBaseComponent, IdComponent, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdText, IdAttachmentFile, System.StrUtils,
  Bde.DBTables, Datasnap.Provider, Datasnap.DBClient;

type
  TStringArray = array of String;

  TdmdBroker = class(TDataModule)
    qryProcesso: TFDQuery;
    qryUpdateEvento: TFDQuery;
    dbBroker: TFDConnection;
    dsGrupo: TDataSource;
    dsDados: TDataSource;
    dsEmpresa: TDataSource;
    dsUnidadeNeg: TDataSource;
    dsProduto: TDataSource;
    qryGrupo: TFDQuery;
    qryEmpresa: TFDQuery;
    qryUnidadeNeg: TFDQuery;
    qryProduto: TFDQuery;
    qryDados: TFDQuery;
    qryDadosNR_PROCESSO: TStringField;
    qryDadosNR_CONHECIMENTO: TStringField;
    qryDadosNUM_CE: TStringField;
    qryDadosINTEGRAL: TIntegerField;
    qryDadosISENCAO: TIntegerField;
    qryDadosSUSPENSAO: TIntegerField;
    qryDadosCD_EMPRESA: TStringField;
    qryDadosCGC_EMPRESA: TStringField;
    qryDadosCD_GRUPO: TStringField;
    qryDadosNM_GRUPO: TStringField;
    qryDadosCD_TP_ISENCAO: TStringField;
    qryDadosCD_TP_SUSPENSAO: TStringField;
    qryDadosIC_ISENCAO_PARCIAL: TStringField;
    qryDadosQT_PESO_ISENCAO: TBCDField;
    qryDadosIC_SUSPENSAO_PARCIAL: TStringField;
    qryDadosQT_PESO_SUSPENSAO: TFloatField;
    qryDadosNR_BANCO: TStringField;
    qryDadosCD_AGENCIA: TStringField;
    qryDadosNR_CONTA: TStringField;
    qryTemp: TFDQuery;
    qryDadosSALDO: TBCDField;
    qryDadosTP_CONTA: TStringField;
    qryInserePagamentoWallet: TFDQuery;
    qryLogPgmto: TFDQuery;
    qryInserePagamentoWalletRESULTADO: TStringField;
    cdsDados: TClientDataSet;
    dspDados: TDataSetProvider;
    cdsGrupo: TClientDataSet;
    dspGrupo: TDataSetProvider;
    cdsEmpresa: TClientDataSet;
    dspEmpresa: TDataSetProvider;
    cdsUnidadeNeg: TClientDataSet;
    dspUnidadeNeg: TDataSetProvider;
    cdsProduto: TClientDataSet;
    dspProduto: TDataSetProvider;
    cdsDadosNR_PROCESSO: TStringField;
    cdsDadosNR_CONHECIMENTO: TStringField;
    cdsDadosNUM_CE: TStringField;
    cdsDadosINTEGRAL: TIntegerField;
    cdsDadosISENCAO: TIntegerField;
    cdsDadosSUSPENSAO: TIntegerField;
    cdsDadosCD_EMPRESA: TStringField;
    cdsDadosCGC_EMPRESA: TStringField;
    cdsDadosCD_GRUPO: TStringField;
    cdsDadosNM_GRUPO: TStringField;
    cdsDadosCD_TP_ISENCAO: TStringField;
    cdsDadosCD_TP_SUSPENSAO: TStringField;
    cdsDadosIC_ISENCAO_PARCIAL: TStringField;
    cdsDadosQT_PESO_ISENCAO: TBCDField;
    cdsDadosIC_SUSPENSAO_PARCIAL: TStringField;
    cdsDadosQT_PESO_SUSPENSAO: TFloatField;
    cdsDadosNR_BANCO: TStringField;
    cdsDadosCD_AGENCIA: TStringField;
    cdsDadosNR_CONTA: TStringField;
    cdsDadosIN_INTEGRAL: TStringField;
    cdsDadosIN_ISENCAO: TStringField;
    cdsDadosIN_SUSPENSAO: TStringField;
    cdsDadosSALDO: TBCDField;
    cdsDadosTP_CONTA: TStringField;
    qryUsuarioWallet: TFDQuery;
    qryUsuarioWalletid: TLargeintField;
    qryUsuarioWalletCD_USUARIO: TStringField;
    qryDadosDT_VENCIMENTO_SUSPENSAO: TSQLTimeStampField;
    cdsDadosDT_VENCIMENTO_SUSPENSAO: TSQLTimeStampField;
    qryUpdateNumeroPedidoProcesso: TFDQuery;
    qryVerificaLogPagamento: TFDQuery;
    qryVerificaEventoPreenchido: TFDQuery;
    qryVerificaPagamentoWallet: TFDQuery;
    qryVerificaNumeroPedidoProcesso: TFDQuery;
    qryVerificaArquivoDigitalizado: TFDQuery;
    qryDadosDI_EXTERNA: TStringField;
    qryDadosDEFINIR: TIntegerField;
    qryDadosNR_ATO_CONCESSORIO: TStringField;
    cdsDadosDI_EXTERNA: TStringField;
    cdsDadosDEFINIR: TIntegerField;
    cdsDadosNR_ATO_CONCESSORIO: TStringField;
    cdsDadosIN_DEFINIR: TStringField;
    dsDIExterna: TDataSource;
    qryDIExterna: TFDQuery;
    cdsDIExterna: TClientDataSet;
    dspDIExterna: TDataSetProvider;
    qryDIExternaCD_PGMTO_SEM_DI: TFDAutoIncField;
    qryDIExternaNR_PROCESSO: TStringField;
    qryDIExternaNR_CONHECIMENTO: TStringField;
    qryDIExternaNUM_CE: TStringField;
    qryDIExternaTP_PGMTO: TIntegerField;
    qryDIExternaNR_PARCELA_ENTREPOSTO: TIntegerField;
    qryDIExternaCD_TP_ISENCAO: TStringField;
    qryDIExternaCD_TP_SUSPENSAO: TStringField;
    qryDIExternaIC_ISENCAO_PARCIAL: TStringField;
    qryDIExternaQT_PESO_ISENCAO: TBCDField;
    qryDIExternaIC_SUSPENSAO_PARCIAL: TStringField;
    qryDIExternaQT_PESO_SUSPENSAO: TFloatField;
    qryDIExternaDT_VENCIMENTO_SUSPENSAO: TSQLTimeStampField;
    qryDIExternaNR_ATO_CONCESSORIO: TStringField;
    cdsDIExternaCD_PGMTO_SEM_DI: TAutoIncField;
    cdsDIExternaNR_PROCESSO: TStringField;
    cdsDIExternaNR_CONHECIMENTO: TStringField;
    cdsDIExternaNUM_CE: TStringField;
    cdsDIExternaTP_PGMTO: TIntegerField;
    cdsDIExternaNR_PARCELA_ENTREPOSTO: TIntegerField;
    cdsDIExternaCD_TP_ISENCAO: TStringField;
    cdsDIExternaCD_TP_SUSPENSAO: TStringField;
    cdsDIExternaIC_ISENCAO_PARCIAL: TStringField;
    cdsDIExternaQT_PESO_ISENCAO: TBCDField;
    cdsDIExternaIC_SUSPENSAO_PARCIAL: TStringField;
    cdsDIExternaQT_PESO_SUSPENSAO: TFloatField;
    cdsDIExternaDT_VENCIMENTO_SUSPENSAO: TSQLTimeStampField;
    cdsDIExternaNR_ATO_CONCESSORIO: TStringField;
    dsIsencao: TDataSource;
    qryIsencao: TFDQuery;
    cdsIsencao: TClientDataSet;
    dspIsencao: TDataSetProvider;
    dsSuspensao: TDataSource;
    qrySuspensao: TFDQuery;
    cdsSuspensao: TClientDataSet;
    dspSuspensao: TDataSetProvider;
    qryIsencaoCD_TP_ISENCAO: TStringField;
    qryIsencaoDS_TP_ISENCAO: TStringField;
    qrySuspensaoCD_TP_SUSPENSAO: TStringField;
    qrySuspensaoDS_TP_SUSPENSAO: TStringField;
    cdsSuspensaoCD_TP_SUSPENSAO: TStringField;
    cdsSuspensaoDS_TP_SUSPENSAO: TStringField;
    cdsIsencaoCD_TP_ISENCAO: TStringField;
    cdsIsencaoDS_TP_ISENCAO: TStringField;
    cdsDIExternanmIsencao: TStringField;
    cdsDIExternaNomeTipoSuspensao: TStringField;
    dsDIExternaIsencao: TDataSource;
    cdsDIExternaIsencao: TClientDataSet;
    AutoIncField1: TAutoIncField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField4: TStringField;
    StringField5: TStringField;
    BCDField1: TBCDField;
    StringField7: TStringField;
    FloatField1: TFloatField;
    SQLTimeStampField1: TSQLTimeStampField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    dsDIExternaSuspensao: TDataSource;
    cdsDIExternaSuspensao: TClientDataSet;
    StringField19: TStringField;
    StringField20: TStringField;
    dsDIExternaIntegral: TDataSource;
    cdsDIExternaIntegral: TClientDataSet;
    AutoIncField3: TAutoIncField;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    BCDField3: TBCDField;
    StringField27: TStringField;
    FloatField3: TFloatField;
    SQLTimeStampField3: TSQLTimeStampField;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    cdsDIExternaSuspensaodsSuspensaoParcial: TStringField;
    cdsDIExternaSuspensaoIC_SUSPENSAO_PARCIAL: TStringField;
    cdsDIExternaSuspensaoCD_PGMTO_SEM_DI: TAutoIncField;
    cdsDIExternaSuspensaoNR_PROCESSO: TStringField;
    cdsDIExternaSuspensaoNR_CONHECIMENTO: TStringField;
    cdsDIExternaSuspensaoNUM_CE: TStringField;
    cdsDIExternaSuspensaoTP_PGMTO: TIntegerField;
    cdsDIExternaSuspensaoNR_PARCELA_ENTREPOSTO: TIntegerField;
    cdsDIExternaSuspensaoCD_TP_ISENCAO: TStringField;
    cdsDIExternaSuspensaoCD_TP_SUSPENSAO: TStringField;
    cdsDIExternaSuspensaoIC_ISENCAO_PARCIAL: TStringField;
    cdsDIExternaSuspensaoQT_PESO_ISENCAO: TBCDField;
    cdsDIExternaSuspensaoQT_PESO_SUSPENSAO: TFloatField;
    cdsDIExternaSuspensaoDT_VENCIMENTO_SUSPENSAO: TSQLTimeStampField;
    cdsDIExternaSuspensaoNR_ATO_CONCESSORIO: TStringField;
    cdsDIExternaIsencaodsIsencaoParcial: TStringField;
    cdsDIExternaIsencaoIC_ISENCAO_PARCIAL: TStringField;
    qryDadosNACIONALIZACAO: TStringField;
    cdsDadosNACIONALIZACAO: TStringField;
    qryDadosNR_PARCELA_ENTREPOSTO: TStringField;
    cdsDadosNR_PARCELA_ENTREPOSTO: TStringField;
    qryAtualizaSaldoProcesso: TFDQuery;
    dbV2: TFDConnection;
    procedure cdsDadosCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsDIExternaReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsDIExternaSuspensaoCalcFields(DataSet: TDataSet);
    procedure cdsDIExternaIsencaoCalcFields(DataSet: TDataSet);
  private
    function GetSQLObjectId(const ObjectName: string): Int64;
    procedure IncluirArquivo(const NR_Processo, NomeArquivo, DescricaoArquivo: string; TipoDocumento, Tabela: Integer);
    procedure ConfiguraConexao(const Servidor, Banco, Usuario, Senha: string);
    procedure ConfiguraConexaoV2(const Servidor, Banco, Usuario, Senha: string);
  public
    function GetDigitalizacaoPath(const AProcesso: string): string;
    function GetSequenciaArquivo(const AProcesso, TipoArquivo: string): Integer;
    procedure AtualizarEvento(NR_Processo, NR_Evento: string);
    procedure AtualizarNumeroPedidoProcesso(NumeroProcesso, NumeroPedido : String);
    procedure InserirPagamentoWallet(ValorDebito : Double; Nr_Processo, TipoConta : String);
    procedure InserirLogPagamento(TP_PGMTO, TP_ACAO : String; VL_PGMTO,
              VL_PESO : Double; NR_PGMTO, NR_PROCESSO, NUM_CE , TP_ISENCAO, TP_SUSPENSAO:String );
    procedure GravarArquivo(const PathArquivo, NomeArquivo,NomeArquivo_SemProcesso, NR_Processo, Descricao: string; TipoDocumento : integer = 152);
    function VerificarNumeroPedidoProcessoPreenchido(NumeroProcesso : String) :boolean;
    function VerificarArquivoDigitalizado(NumeroProcesso : String) : boolean;
    function VerificarEventoPreenchido(Nr_Processo, Cd_Evento : String) : Boolean;
    function VerificarExisteLogPagamento(TP_PGMTO, TP_ACAO : String; VL_PGMTO : Double; NR_PROCESSO, NR_CE : String) : boolean;
    function VerificarPagamentoWallet(ValorDebito : Double; Nr_Processo, TipoConta : String) : boolean;
    function VerificarProcessoTemSaldo(ValorMercante : Double; NR_PROCESSO : String) : Boolean;
  end;

var
  dmdBroker: TdmdBroker;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uNavPgmtoMercante, UPgmtoMercante;


{$R *.dfm}

procedure TdmdBroker.DataModuleCreate(Sender: TObject);
begin
  ConfiguraConexao('INDAIA10', 'BROKER', 'SA', '123');
  ConfiguraConexaoV2('INDAIA10', 'MYINDAIAV2', 'SA', '123');
 // ConfiguraConexao('Antuerpia', 'BROKER', 'SA', '123');
end;

procedure TdmdBroker.ConfiguraConexao(const Servidor, Banco, Usuario, Senha: string);
begin
  dbBroker.Close;
  dbBroker.Params.Values['Server']    := Servidor;
  dbBroker.Params.Values['Database']  := Banco;
  dbBroker.Params.Values['User_Name'] := Usuario;
  dbBroker.Params.Values['Password']  := Senha;
  dbBroker.Params.Values['DriverID']  := 'MSSQL';
  dbBroker.Open;
end;

procedure TdmdBroker.ConfiguraConexaoV2(const Servidor, Banco, Usuario, Senha: string);
begin
  dbV2.Close;
  dbV2.Params.Values['Server']    := Servidor;
  dbV2.Params.Values['Database']  := Banco;
  dbV2.Params.Values['User_Name'] := Usuario;
  dbV2.Params.Values['Password']  := Senha;
  dbV2.Params.Values['DriverID']  := 'MSSQL';
  dbV2.Open;
end;

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
      frmNavPgmtoMercante.log('Arquivo copiado para: ' + ANovoArquivo, frmNavPgmtoMercante.logar);
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

procedure TdmdBroker.AtualizarEvento(NR_Processo, NR_Evento: string);
begin
  qryUpdateEvento.Close;
  qryUpdateEvento.ParamByName('NR_PROCESSO').AsString := NR_Processo;
  qryUpdateEvento.ParamByName('CD_EVENTO').AsString   := NR_Evento;
  qryUpdateEvento.ExecSQL;
end;

procedure TdmdBroker.cdsDadosCalcFields(DataSet: TDataSet);
begin
  if dmdBroker.cdsDados.FieldByName('INTEGRAL').asInteger > 0 then
    dmdBroker.cdsDados.FieldByName('IN_INTEGRAL').AsString := 'a'
  else
    dmdBroker.cdsDados.FieldByName('IN_INTEGRAL').AsString := '';


  if dmdBroker.cdsDados.FieldByName('ISENCAO').asInteger > 0 then
    dmdBroker.cdsDados.FieldByName('IN_ISENCAO').AsString := 'a'
  else
    dmdBroker.cdsDados.FieldByName('IN_ISENCAO').AsString := '';


  if dmdBroker.cdsDados.FieldByName('SUSPENSAO').asInteger > 0 then
    dmdBroker.cdsDados.FieldByName('IN_SUSPENSAO').AsString := 'a'
  else
    dmdBroker.cdsDados.FieldByName('IN_SUSPENSAO').AsString := '';


  if dmdBroker.cdsDados.FieldByName('DEFINIR').asInteger > 0 then
    dmdBroker.cdsDados.FieldByName('IN_DEFINIR').AsString := 'a'
  else
    dmdBroker.cdsDados.FieldByName('IN_DEFINIR').AsString := '';
end;

procedure TdmdBroker.cdsDIExternaIsencaoCalcFields(DataSet: TDataSet);
begin
  if cdsDIExternaIsencaoIC_ISENCAO_PARCIAL.AsString = '1' then
    cdsDIExternaIsencaodsIsencaoParcial.AsString := 'Sim'
  else
    cdsDIExternaIsencaodsIsencaoParcial.AsString := 'Não';
end;

procedure TdmdBroker.cdsDIExternaReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
raise Exception.Create(E.Message);
end;

procedure TdmdBroker.cdsDIExternaSuspensaoCalcFields(DataSet: TDataSet);
begin
  if cdsDIExternaSuspensaoIC_SUSPENSAO_PARCIAL.AsString = '1' then
    cdsDIExternaSuspensaodsSuspensaoParcial.Value := 'Sim'
  else
    cdsDIExternaSuspensaodsSuspensaoParcial.Value := 'Não';
end;

function TdmdBroker.GetSequenciaArquivo(const AProcesso, TipoArquivo: string): Integer;
var
  Quantidade : Integer;
begin
  Quantidade := 1;

  qryTemp.Close;
  qryTemp.SQL.Text := 'SELECT COUNT(*) + 1  AS SEQ  '+
                        '  FROM TPROCESSO_DOCTOS      '+
                        ' WHERE NR_PROCESSO   = '+ QuotedStr(AProcesso)   +
                        '   AND CD_TIPO_DOCTO = '+ QuotedStr(TipoArquivo) ;
  qryTemp.Open;
  if not qryTemp.isEmpty then
    Quantidade := qryTemp.Fields[0].asInteger;

  qryTemp.Close;

  Result := Quantidade;
end;

function TdmdBroker.GetDigitalizacaoPath(const AProcesso: string): string;
begin
  qryTemp.Close;
  qryTemp.SQL.Text := 'SELECT BROKER.DBO.FN_PATH_DIGITALIZACAO(''' + Trim(AProcesso) + ''', 1)';
  qryTemp.Open;
  Result := IncludeTrailingPathDelimiter(Trim(qryTemp.Fields[0].AsString));
  Result := Result + 'TPROCESSO\' + Trim(AProcesso) + '\';
  qryTemp.Close;
end;

function TdmdBroker.GetSQLObjectId(const ObjectName: string): Int64;
begin
  qryTemp.Close;
  qryTemp.SQL.Text := 'SELECT OBJECT_ID FROM SYS.TABLES WHERE NAME = ' + QuotedStr(ObjectName);
  qryTemp.Open;
  Result := qryTemp.FieldByName('OBJECT_ID').AsInteger;
  qryTemp.Close;
end;

procedure TdmdBroker.IncluirArquivo(const NR_Processo, NomeArquivo, DescricaoArquivo: string; TipoDocumento, Tabela: Integer);
begin
  qryTemp.Close;
  qryTemp.SQL.Text :=   'INSERT INTO TPROCESSO_DOCTOS                                                                                          '+
                        '(NR_PROCESSO, CD_TIPO_DOCTO, NM_DESCRICAO, NM_ARQUIVO, CD_USUARIO_CRIACAO, DT_CRIACAO, IN_ATIVO, ID_TABELA)         '+
                        'VALUES (:NR_PROCESSO, :CD_TIPO_DOCTO, :NM_DESCRICAO, :NM_ARQUIVO, :CD_USUARIO_CRIACAO, :DT_CRIACAO, 1 , :ID_TABELA) ';

  qryTemp.ParamByName('NR_PROCESSO').AsString        := NR_Processo;
  qryTemp.ParamByName('CD_TIPO_DOCTO').AsInteger     := TipoDocumento;
  qryTemp.ParamByName('NM_DESCRICAO').AsString       := DescricaoArquivo;
  qryTemp.ParamByName('NM_ARQUIVO').AsString         := NomeArquivo;
  qryTemp.ParamByName('CD_USUARIO_CRIACAO').Asstring := '0707'; //Departamento de Software
  qryTemp.ParamByName('DT_CRIACAO').AsDateTime       := Now;
  qryTemp.ParamByName('ID_TABELA').AsInteger         := Tabela;

  qryTemp.ExecSQL;
end;

procedure TdmdBroker.GravarArquivo(const PathArquivo, NomeArquivo,NomeArquivo_SemProcesso, NR_Processo, Descricao: string; TipoDocumento : integer = 152);
var
  DigPath: string;
  TabelaId: Int64;
  Incluir: Boolean;
begin
  DigPath  := GetDigitalizacaoPath(NR_Processo);
  TabelaId := GetSQLObjectId('TPROCESSO');

  //exite na origem?
  if not FileExists(PathArquivo + NomeArquivo) then
    Exit;

  //só depo incluir se não existe no destino
  Incluir := not FileExists(DigPath + NomeArquivo_SemProcesso);

  //se existe, apaga do destino.
  if not Incluir then
  begin
    SetFileAttributes(PWideChar(DigPath + NomeArquivo_SemProcesso), faNormal);
    if not DeleteFile(PWideChar(DigPath + NomeArquivo_SemProcesso)) then
    begin
      raise Exception.Create('Não foi possível remover o arquivo '+ DigPath + NomeArquivo_SemProcesso +
                             '.'#13'A operação não foi concluída.');
      Exit;
    end;
  end;

  if not CopiaArquivo(PathArquivo + NomeArquivo, DigPath + NomeArquivo_SemProcesso, False) then
  begin
    raise Exception.Create('Erro ao copiar o arquivo ' + PathArquivo + NomeArquivo + ' para '+ DigPath + NomeArquivo_SemProcesso +
                           '.'#13'A operação não foi concluída.');
  end
  else
  begin
    //se realmente existe na digitalizacao, apaga da origem para nao ficar com lixo
    if FileExists(DigPath + NomeArquivo_SemProcesso) then
      deletefile(PWideChar(PathArquivo + NomeArquivo));
  end;

  if Incluir then
  begin
    IncluirArquivo(NR_Processo, NomeArquivo_SemProcesso, Descricao, TipoDocumento, TabelaId);

    if frmNavPgmtoMercante.TP_COMPROVANTE_ATUAL = 'INTEGRAL' then
    begin
      frmNavPgmtoMercante.StatusPagamentoIntegral.imprimirComprovante := true;
      frmNavPgmtoMercante.pbProcessamento.Position := frmNavPgmtoMercante.pbProcessamento.Position +1;
    end;

    if frmNavPgmtoMercante.TP_COMPROVANTE_ATUAL = 'SUSPENSAO' then
    begin
      frmNavPgmtoMercante.StatusDeclaracaoSuspensao.imprimirComprovante := true;
      frmNavPgmtoMercante.pbProcessamento.Position := frmNavPgmtoMercante.pbProcessamento.Position +1;
    end;

   if frmNavPgmtoMercante.TP_COMPROVANTE_ATUAL = 'SUSPENSAO TUM' then
    begin
      frmNavPgmtoMercante.StatusPagamentoTumSuspensao.imprimirComprovante := true;
      frmNavPgmtoMercante.pbProcessamento.Position := frmNavPgmtoMercante.pbProcessamento.Position +1;
    end;

   if frmNavPgmtoMercante.TP_COMPROVANTE_ATUAL = 'ISENCAO' then
    begin
      frmNavPgmtoMercante.StatusDeclaracaoIsencao.imprimirComprovante := true;
      frmNavPgmtoMercante.pbProcessamento.Position := frmNavPgmtoMercante.pbProcessamento.Position +1;
    end;

    frmNavPgmtoMercante.log('* Arquivo enviado para a Digitalização *', frmNavPgmtoMercante.logar);
  end
  else
  begin
    frmNavPgmtoMercante.log('Erro - Arquivo não enviado para a Digitalização: ' + NomeArquivo, frmNavPgmtoMercante.logar);
    frmNavPgmtoMercante.btnReprocessar.Enabled := true;
  end;
end;

procedure TdmdBroker.InserirPagamentoWallet(ValorDebito : Double; Nr_Processo, TipoConta : String);
begin
  try
    qryInserePagamentoWallet.Close;
    qryInserePagamentoWallet.ParamByName('NR_PROCESSO').Value  := Nr_Processo;
    qryInserePagamentoWallet.ParamByName('TIPO_CONTA').Value   := TipoConta;
    qryInserePagamentoWallet.ParamByName('VALOR_DEBITO').Value := ValorDebito;
    qryInserePagamentoWallet.ParamByName('USUARIO').Value      := frmPgmtoMercante.sUsuarioWallet;
    qryInserePagamentoWallet.open;

    qryAtualizaSaldoProcesso.Close;
    qryAtualizaSaldoProcesso.ParamByName('customID').Value := Nr_Processo;
    qryAtualizaSaldoProcesso.Open;
  finally
    qryInserePagamentoWallet.Close;
    qryAtualizaSaldoProcesso.Close;
  end;
end;

function TdmdBroker.VerificarPagamentoWallet(ValorDebito : Double; Nr_Processo, TipoConta : String) : boolean;
begin
  try
    qryVerificaPagamentoWallet.Close;
    qryVerificaPagamentoWallet.ParamByName('NR_PROCESSO').Value  := Nr_Processo;
    qryVerificaPagamentoWallet.ParamByName('TIPO_CONTA').Value   := TipoConta;
    qryVerificaPagamentoWallet.ParamByName('VALOR_PGMTO').Value  := ValorDebito;
    qryVerificaPagamentoWallet.ParamByName('USER_ID').Value      := frmPgmtoMercante.sUsuarioWallet;

    qryVerificaPagamentoWallet.open;
    if qryVerificaPagamentoWallet.eof then
      result := false
    else
      result := true
  finally
    qryVerificaPagamentoWallet.Close;
  end;
end;

function TdmdBroker.VerificarProcessoTemSaldo(ValorMercante : Double; NR_PROCESSO : String) : Boolean;
var
  SaldoProcesso : Double;
  tpconta : string;
begin
  frmNavPgmtoMercante.VALOR_PAGAMENTO := ValorMercante;

  qryTemp.close;
  qryTemp.SQL.Text := 'SELECT DBO.FN_SALDO_PROCESSO('+QuotedStr(NR_PROCESSO)+') AS SALDO';
  qryTemp.open;

  if not dmdBroker.qryTemp.isempty then
    SaldoProcesso := qryTemp.FieldByName('SALDO').AsFloat
  else
    SaldoProcesso := 0;

  qryTemp.close;
  tpconta := frmNavPgmtoMercante.mDados.FieldByName('TP_CONTA').AsString;

  frmNavPgmtoMercante.log('Saldo Processo : ' + formatfloat('00.00', SaldoProcesso) + '   Conta: ' + tpconta, frmNavPgmtoMercante.logar);

  Result := ((SaldoProcesso - ValorMercante) >=  0) or (tpconta = 'CLIENTE');
end;

procedure TdmdBroker.InserirLogPagamento(TP_PGMTO, TP_ACAO : String; VL_PGMTO,
 VL_PESO : Double; NR_PGMTO, NR_PROCESSO, NUM_CE , TP_ISENCAO, TP_SUSPENSAO:String );
begin
// TP_ACAO  =  D : DECLARACAO  - P : PAGAMENTO
// VL_PGMTO =  1 : INTEGRAL    - 2 : ISENCAO    - 3 : SUSPENCAO

  qryLogPgmto.close;
  qryLogPgmto.ParamByName('DT_PGMTO').value              := now;
  qryLogPgmto.ParamByName('CD_USUARIO').value            := frmPgmtoMercante.sUsuarioMyIndaia;
  qryLogPgmto.ParamByName('NR_PROCESSO').value           := NR_PROCESSO;
  qryLogPgmto.ParamByName('NUM_CE').value                := NUM_CE;
  qryLogPgmto.ParamByName('TP_PGMTO').value              := TP_PGMTO;
  qryLogPgmto.ParamByName('TP_ACAO').value               := TP_ACAO;
  qryLogPgmto.ParamByName('VL_PGMTO').value              := VL_PGMTO;
  qryLogPgmto.ParamByName('VL_PESO').value               := VL_PESO;
  qryLogPgmto.ParamByName('CD_TP_ISENCAO').value         := TP_ISENCAO;
  qryLogPgmto.ParamByName('CD_TP_SUSPENSAO').value       := TP_SUSPENSAO;
  qryLogPgmto.ParamByName('NR_PEDIDO_PGMTO_AFRMM').value := NR_PGMTO;

  qryLogPgmto.execSql;
end;

function TdmdBroker.VerificarExisteLogPagamento(TP_PGMTO, TP_ACAO : String; VL_PGMTO : Double; NR_PROCESSO, NR_CE : String) : boolean;
begin
// TP_ACAO  =  D : DECLARACAO  - P : PAGAMENTO
// VL_PGMTO =  1 : INTEGRAL    - 2 : ISENCAO    - 3 : SUSPENCAO
  try
    qryVerificaLogPagamento.close;
    qryVerificaLogPagamento.ParamByName('CD_USUARIO').value      := frmPgmtoMercante.sUsuarioMyIndaia;
    qryVerificaLogPagamento.ParamByName('NR_PROCESSO').value     := NR_PROCESSO;
    qryVerificaLogPagamento.ParamByName('NUM_CE').value          := NR_CE;
    qryVerificaLogPagamento.ParamByName('TP_PGMTO').value        := TP_PGMTO;
    qryVerificaLogPagamento.ParamByName('TP_ACAO').value         := TP_ACAO;
    qryVerificaLogPagamento.ParamByName('VL_PGMTO').value        := VL_PGMTO;
    qryVerificaLogPagamento.open;

    if qryVerificaLogPagamento.eof then
      result := false
    else
      result := true;
  finally
    qryVerificaLogPagamento.close;
  end;
end;

function TdmdBroker.VerificarEventoPreenchido(Nr_Processo, Cd_Evento : String) : Boolean;
begin
  try
    qryVerificaEventoPreenchido.close;
    qryVerificaEventoPreenchido.ParamByName('NR_PROCESSO').value   := Nr_Processo;
    qryVerificaEventoPreenchido.ParamByName('CD_EVENTO').value     := Cd_Evento;
    qryVerificaEventoPreenchido.open;
    if not qryVerificaEventoPreenchido.eof then
    begin
      if qryVerificaEventoPreenchido.FieldByName('DT_REALIZACAO').IsNull then
        result := false
      else
        result := true;
    end
    else
      result := false;
  finally
      qryVerificaEventoPreenchido.close;
  end;
end;

procedure TdmdBroker.AtualizarNumeroPedidoProcesso(NumeroProcesso, NumeroPedido : String);
begin
  try
    if trim(NumeroPedido) = '' then
      NumeroPedido := '0';

    qryUpdateNumeroPedidoProcesso.Close;
    qryUpdateNumeroPedidoProcesso.ParamByName('NR_PROCESSO').Value           := NumeroProcesso;
    qryUpdateNumeroPedidoProcesso.ParamByName('NR_PEDIDO_PGMTO_AFRMM').Value := NumeroPedido;
    qryUpdateNumeroPedidoProcesso.ExecSql;
  except on e:exception do
    frmNavPgmtoMercante.log('Erro ao atualizar numero do pedido na manutenção do processo. ' + e.Message, frmNavPgmtoMercante.logar);
  end;
end;

function TdmdBroker.VerificarArquivoDigitalizado(NumeroProcesso : String) : boolean;
var descricao , caminhodigitalizacao: string;
begin
  try
    descricao            := frmNavPgmtoMercante.CarregaDescricaoArquivo;
    caminhodigitalizacao := dmdBroker.GetDigitalizacaoPath(NumeroProcesso);

    qryVerificaArquivoDigitalizado.Close;
    qryVerificaArquivoDigitalizado.ParamByName('NR_PROCESSO').Value := NumeroProcesso;
    qryVerificaArquivoDigitalizado.ParamByName('DS_ARQUIVO').Value  := descricao;
    qryVerificaArquivoDigitalizado.Open;

    if qryVerificaArquivoDigitalizado.isempty then
      result := false
    else
    begin
      if fileexists(caminhodigitalizacao + qryVerificaArquivoDigitalizado.FieldByName('NM_ARQUIVO').AsString) then
        result := true
      else
        result := false;
    end;

  finally
    qryVerificaArquivoDigitalizado.Close;
  end;
end;

function TdmdBroker.VerificarNumeroPedidoProcessoPreenchido(NumeroProcesso : String) :boolean;
begin
  try
    qryVerificaNumeroPedidoProcesso.Close;
    qryVerificaNumeroPedidoProcesso.ParamByName('NR_PROCESSO').Value := NumeroProcesso;
    qryVerificaNumeroPedidoProcesso.Open;

    if trim(qryVerificaNumeroPedidoProcesso.fieldByName('NR_PEDIDO_PGMTO_AFRMM').asstring) = '' then
      result := false
    else
      result := true;
  finally
    qryVerificaNumeroPedidoProcesso.Close;
  end;
end;

end.
