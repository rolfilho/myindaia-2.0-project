unit uIntegracaoAberturaProcessoNestle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DateUtils,
  StdCtrls, Mask, Buttons, ExtCtrls, Funcoes, DB, DBTables, Excel2000, OleServer, ComObj;

type

  TAberturaProcessos = class;
  TIntegracaoPlanilha = class;
  TLogCallBack = procedure of object;

  TNumeroContainer = (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, X, Z);

  Tfrm_integracao_abertura_processo_nestle = class(TForm)
    Panel1: TPanel;
    btn_fechar: TButton;
    shpTitulo: TShape;
    lblTitulo: TLabel;
    OpenDialog1: TOpenDialog;
    btnIntegrarPlanilha: TButton;
    Memo1: TMemo;
    lblArquivoLog: TLabel;
    procedure btn_fecharClick(Sender: TObject);
    procedure btnIntegrarPlanilhaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    IntegracaoPlanilha: TIntegracaoPlanilha;
  public
    procedure getLogAtualizado;
    { Public declarations }
  end;

  TIntegracaoPlanilha = class
  private
    arquivoPlanilha: String;
    LinhaItem: Integer;
    Excel: OleVariant;
    oSheet: OleVariant;
    AberturaProcessos: TAberturaProcessos;
    LogCallBack: TLogCallBack;
    NomeArquivoLog: string;
    procedure IntegrarPlanilhaAberturaProcessos;
  public
  end;

  TAberturaProcessos = class
  private
    FCodigoAgenteCarga: string;
    FCodigoTransportadora: string;
    FCodigoPais: string;
    FCodigoArea: string;
    FCodigoCliente: string;
    FQuantidadeContainers: integer;
    FCodigoServico: string;
    FCodigoRepresentante: string;
    FCodigoTipoEstufagem: string;
    FTipoContainer: string;
    FCodigoCelula: string;
    FCodigoTipoReferencia: string;
    FCodigoUnidade: string;
    FCodigoPrefixo: string;
    FCodigoProduto: string;
    FReferenciaDescricao: string;
    FDataPrevisaoCarregamento: TDateTime;
    FCodigoLocalEmbarque: String;
    FCodigoLocalDesembarque: String;
    FDataPrevisaoEmbarque: TDateTime;
    procedure SetCodigoAgenteCarga(const Value: string);
    procedure SetCodigoArea(const Value: string);
    procedure SetCodigoCliente(const Value: string);
    procedure SetCodigoPais(const Value: string);
    procedure SetCodigoTransportadora(const Value: string);
  public
    NumeroProcesso: String;
    DataServidor: TDateTime;
    LogCallBack: TLogCallBack;
    NomeArquivoLog: string;
    property CodigoUnidade: string read FCodigoUnidade write FCodigoUnidade;
    property CodigoProduto: string read FCodigoProduto write FCodigoProduto;
    property CodigoServico: string read FCodigoServico write FCodigoServico;
    property CodigoPrefixo: string read FCodigoPrefixo write FCodigoPrefixo;
    property CodigoCelula: string read FCodigoCelula write FCodigoCelula;
    property CodigoRepresentante: string read FCodigoRepresentante write FCodigoRepresentante;
    property CodigoTipoEstufagem: string read FCodigoTipoEstufagem write FCodigoTipoEstufagem;
    property CodigoTipoReferencia: string read FCodigoTipoReferencia write FCodigoTipoReferencia;
    property TipoContainer: string read FTipoContainer write FTipoContainer;
    property QuantidadeContainers: integer read FQuantidadeContainers write FQuantidadeContainers;
    property ReferenciaDescricao: string read FReferenciaDescricao write FReferenciaDescricao;
    property DataPrevisaoCarregamento: TDateTime read FDataPrevisaoCarregamento write FDataPrevisaoCarregamento;
    property CodigoCliente: string read FCodigoCliente write SetCodigoCliente;
    property CodigoArea: string read FCodigoArea write SetCodigoArea;
    property CodigoPais: string read FCodigoPais write SetCodigoPais;
    property CodigoAgenteCarga: string read FCodigoAgenteCarga write SetCodigoAgenteCarga;
    property CodigoTransportadora: string read FCodigoTransportadora write SetCodigoTransportadora;
    property DataPrevisaoEmbarque: TDateTime read FDataPrevisaoEmbarque write FDataPrevisaoEmbarque;
    property CodigoLocalEmbarque: String read FCodigoLocalEmbarque write FCodigoLocalEmbarque;
    property CodigoLocalDesembarque: String read FCodigoLocalDesembarque write FCodigoLocalDesembarque;
    procedure Log(const Msg: string);
    constructor Create;
    destructor Destroy; override;
  private
    queryInsereContainers: TQuery;
    queryInsereNovoProcesso: TQuery;
    queryInsereReferencia: TQuery;
    queryGetNumeroProcesso: TQuery;
    queryServerDateTime: TQuery;
    queryAtualizaEvento147: TQuery;
    queryAtualizaEvento003: TQuery;
    queryAtualizaEvento131: TQuery;    
    function AbrirProcesso: string;
    procedure getNumeroNovoProcesso;
    procedure ServerDateTime;
    procedure InsereContainers;
    procedure InsereNovoProcesso;
    procedure InsereReferencia;
    procedure AtualizaEvento147;
    procedure AtualizaEvento003;
    procedure AtualizaEvento131;    
  end;

var
  frm_integracao_abertura_processo_nestle: Tfrm_integracao_abertura_processo_nestle;

implementation

uses
  GSMLIB, PGGP017,  KrDialog, TypInfo, ConsOnLineEx;

{$R *.DFM}

function GetLocalPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

function NomeArquivoLog: string;
begin
  ForceDirectories(GetLocalPath +'TEMP');

  Result := GetLocalPath + 'TEMP\IntegracaoProcessosNestle_' + FormatDateTime('yyyy-mm-dd', Now) + '.log';
end;

//procedure Log(const Msg: string; CallBack: TLogCallBack);
//var
//  Filename: string;
//  LogFile: TextFile;
//begin
//  Filename := NomeArquivoLog;
//  AssignFile (LogFile, Filename);
//  if FileExists (FileName) then
//    Append (LogFile)
//  else
//    Rewrite (LogFile);
//  try
//    Writeln (LogFile, DateTimeToStr (Now) + ':' + Msg);
//  finally
//    CloseFile (LogFile);
//    if Assigned(CallBack) then
//      CallBack;
//  end;
//end;

procedure Tfrm_integracao_abertura_processo_nestle.FormShow(
  Sender: TObject);
begin
  lblArquivoLog.Caption := 'Arquivo log: ' + NomeArquivoLog;
  getLogAtualizado;
end;

procedure Tfrm_integracao_abertura_processo_nestle.getLogAtualizado;
begin
  if not FileExists(NomeArquivoLog) then
    Memo1.Lines.SaveToFile(NomeArquivoLog)
  else
    Memo1.Lines.LoadFromFile(NomeArquivoLog);
end;

procedure Tfrm_integracao_abertura_processo_nestle.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_integracao_abertura_processo_nestle.btnIntegrarPlanilhaClick(
  Sender: TObject);
begin
  IntegracaoPlanilha := TIntegracaoPlanilha.Create;
  try
    if not OpenDialog1.Execute then
      Exit;

    IntegracaoPlanilha.NomeArquivoLog := NomeArquivoLog;
    IntegracaoPlanilha.LogCallBack := Self.getLogAtualizado;
    IntegracaoPlanilha.arquivoPlanilha := OpenDialog1.FileName;
    IntegracaoPlanilha.IntegrarPlanilhaAberturaProcessos;
  finally
    IntegracaoPlanilha.Free;
  end;
end;


{ TIntegracaoPlanilha }

procedure TIntegracaoPlanilha.IntegrarPlanilhaAberturaProcessos;
var
  vArquivoSalvo: string;
begin
  Excel := CreateOleObject('Excel.Application');
  try
    Excel.Visible := True;

    Excel.WorkBooks.Add(arquivoPlanilha);
    oSheet := Excel.Workbooks[1].WorkSheets[1];

    LinhaItem := 2;

    while oSheet.Cells[LinhaItem, 1].Value <> '' do
    begin
      try
        AberturaProcessos := TAberturaProcessos.Create;
        try

          AberturaProcessos.NomeArquivoLog := NomeArquivoLog;
          AberturaProcessos.LogCallBack := LogCallBack;

          AberturaProcessos.Log('');
          AberturaProcessos.Log('Lendo a linha: ' + IntToStr(LinhaItem));

          AberturaProcessos.CodigoUnidade := '01';
          AberturaProcessos.CodigoProduto := '02';
          AberturaProcessos.CodigoServico := '2'; {Exportação Marítima}
          AberturaProcessos.CodigoPrefixo := 'EM';
          AberturaProcessos.CodigoCelula := '89'; {Atendimento Nestlé}
          AberturaProcessos.CodigoRepresentante := '00271'; {Indaiá}
          AberturaProcessos.TipoContainer := '11'; {40'HC}
          AberturaProcessos.CodigoTipoEstufagem := '1'; {FCL}
          AberturaProcessos.CodigoTipoReferencia := '04'; {Outros}
          AberturaProcessos.CodigoCliente := Trim(oSheet.Cells[LinhaItem,2].value);
          AberturaProcessos.CodigoArea := Trim(oSheet.Cells[LinhaItem,3].value);
          AberturaProcessos.CodigoPais := Trim(oSheet.Cells[LinhaItem,5].value);
          AberturaProcessos.QuantidadeContainers := oSheet.Cells[LinhaItem,6].value;
          AberturaProcessos.ReferenciaDescricao := Trim(oSheet.Cells[LinhaItem,7].value);
          AberturaProcessos.CodigoAgenteCarga := Trim(oSheet.Cells[LinhaItem,9].value);
          AberturaProcessos.DataPrevisaoCarregamento := StrToDateTime(Trim(oSheet.Cells[LinhaItem,10].value));
          AberturaProcessos.CodigoTransportadora := Trim(oSheet.Cells[LinhaItem,12].value);
          AberturaProcessos.DataPrevisaoEmbarque := StrToDateTime(Trim(oSheet.Cells[LinhaItem,13].value));
          AberturaProcessos.CodigoLocalEmbarque := Trim(oSheet.Cells[LinhaItem,14].value);
          AberturaProcessos.CodigoLocalDesembarque := Trim(oSheet.Cells[LinhaItem,15].value);


          try
            AberturaProcessos.AbrirProcesso;
            oSheet.Cells[LinhaItem,16].value := 'Processo incluído: ' + AberturaProcessos.NumeroProcesso;
          except
            oSheet.Cells[LinhaItem,16].value := 'Erro ao incluir processo no banco de dados.';
          end;
        except
          on E: Exception do
          begin
            AberturaProcessos.log(E.Message);
            oSheet.Cells[LinhaItem,13].value := E.Message;
          end;
        end;
      finally
        AberturaProcessos.Free;
      end;
      Inc(LinhaItem);
    end;

    vArquivoSalvo := ExtractFilePath(arquivoPlanilha) +
                     StringReplace(ExtractFileName(arquivoPlanilha), ExtractFileExt(arquivoPlanilha), '_Integrado', [rfReplaceAll]) +
                     ExtractFileExt(arquivoPlanilha);
    Excel.ActiveWorkBook.SaveAs(vArquivoSalvo);
    Information('Integração realizada com SUCESSO. ' + #13#10 + 'Arquivo com os números dos processos criados salvo: ' + vArquivoSalvo);
  finally
    Excel.WorkBooks.Close;
    Excel.Quit;
  end;
end;

{ TAberturaProcessos }

constructor TAberturaProcessos.Create;
begin
  queryGetNumeroProcesso := TQuery.Create(nil);
  queryGetNumeroProcesso.DatabaseName := 'DBBROKER';

  queryServerDateTime := TQuery.Create(nil);
  queryServerDateTime.DatabaseName := 'DBBROKER';

  queryInsereNovoProcesso := TQuery.Create(nil);
  queryInsereNovoProcesso.DatabaseName := 'DBBROKER';

  queryInsereReferencia := TQuery.Create(nil);
  queryInsereReferencia.DatabaseName := 'DBBROKER';

  queryInsereContainers := TQuery.Create(nil);
  queryInsereContainers.DatabaseName := 'DBBROKER';

  queryAtualizaEvento147 := TQuery.Create(nil);
  queryAtualizaEvento147.DatabaseName := 'DBBROKER';

  queryAtualizaEvento003 := TQuery.Create(nil);
  queryAtualizaEvento003.DatabaseName := 'DBBROKER';

  queryAtualizaEvento131 := TQuery.Create(nil);
  queryAtualizaEvento131.DatabaseName := 'DBBROKER';

  ServerDateTime;

end;

destructor TAberturaProcessos.Destroy;
begin
  queryGetNumeroProcesso.Free;
  queryServerDateTime.Free;
  queryInsereNovoProcesso.Free;
  queryInsereReferencia.Free;
  queryInsereContainers.Free;
  queryAtualizaEvento147.Free;
  queryAtualizaEvento003.Free;
  queryAtualizaEvento131.Free;  

  inherited;
end;

function TAberturaProcessos.AbrirProcesso: string;
begin
  GetNumeroNovoProcesso;
  datm_main.db_broker.StartTransaction;
  try
    InsereNovoProcesso;
    InsereReferencia;
    InsereContainers;
    AtualizaEvento147;
    AtualizaEvento003;
    AtualizaEvento131;
//    datm_main.db_broker.Rollback;
    datm_main.db_broker.Commit;
    Log('Inserido.');
    Sleep(1000);
  except
    datm_main.db_broker.Rollback;
    Log('Erro. Não Inserido.');
    Raise;
  end;
end;


procedure TAberturaProcessos.InsereNovoProcesso;
begin
  queryInsereNovoProcesso.Close;
  queryInsereNovoProcesso.SQL.Text :=
          'INSERT INTO TPROCESSO (  NR_PROCESSO,  CD_UNID_NEG,  CD_PRODUTO,  CD_SERVICO,  CD_CLIENTE,  CD_CELULA,  CD_REPRESENTANTE,  TP_ESTUFAGEM, ' + #13#10 +
          '                         CD_AREA,  CD_PAIS_DESTINO,  CD_AGENTE,  CD_TRANSP_NAC,  CD_USUARIO,  DT_ABERTURA,  CD_LOCAL_EMBARQUE,  CD_LOCAL_DESEMBARQUE, ' + #13#10 +
          '                         IN_CANCELADO,  IN_LIBERADO) ' + #13#10 +
          '               VALUES ( :NR_PROCESSO, :CD_UNID_NEG, :CD_PRODUTO, :CD_SERVICO, :CD_CLIENTE, :CD_CELULA, :CD_REPRESENTANTE, :TP_ESTUFAGEM, ' + #13#10 +
          '                        :CD_AREA, :CD_PAIS_DESTINO, :CD_AGENTE, :CD_TRANSP_NAC, :CD_USUARIO, :DT_ABERTURA, :CD_LOCAL_EMBARQUE, :CD_LOCAL_DESEMBARQUE, ' + #13#10 +
          '                        :IN_CANCELADO, :IN_LIBERADO) ';

  queryInsereNovoProcesso.ParamByName('NR_PROCESSO').AsString := NumeroProcesso;
  queryInsereNovoProcesso.ParamByName('CD_UNID_NEG').AsString := CodigoUnidade;
  queryInsereNovoProcesso.ParamByName('CD_PRODUTO').AsString := CodigoProduto;
  queryInsereNovoProcesso.ParamByName('CD_SERVICO').AsString := CodigoServico;
  queryInsereNovoProcesso.ParamByName('CD_CLIENTE').AsString := CodigoCliente;
  queryInsereNovoProcesso.ParamByName('CD_CELULA').AsString := CodigoCelula;
  queryInsereNovoProcesso.ParamByName('CD_REPRESENTANTE').AsString := CodigoRepresentante;
  queryInsereNovoProcesso.ParamByName('TP_ESTUFAGEM').AsString := CodigoTipoEstufagem;
  queryInsereNovoProcesso.ParamByName('CD_AREA').AsString := CodigoArea;
  queryInsereNovoProcesso.ParamByName('CD_PAIS_DESTINO').AsString := CodigoPais;
  queryInsereNovoProcesso.ParamByName('CD_AGENTE').AsString := CodigoAgenteCarga;
  queryInsereNovoProcesso.ParamByName('CD_TRANSP_NAC').AsString := CodigoTransportadora;
  queryInsereNovoProcesso.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
  queryInsereNovoProcesso.ParamByName('DT_ABERTURA').AsDateTime := DateOf(DataServidor);

  queryInsereNovoProcesso.ParamByName('CD_LOCAL_EMBARQUE').AsString := CodigoLocalEmbarque;
  queryInsereNovoProcesso.ParamByName('CD_LOCAL_DESEMBARQUE').AsString := CodigoLocalDesembarque;

  queryInsereNovoProcesso.ParamByName('IN_LIBERADO').AsString := '1';
  queryInsereNovoProcesso.ParamByName('IN_CANCELADO').AsString := '0';
  queryInsereNovoProcesso.ExecSQL;

  Log('Inserindo Processo: ' + NumeroProcesso);

end;

procedure TAberturaProcessos.InsereReferencia;
begin
  queryInsereReferencia.Close;
  queryInsereReferencia.SQL.Text := 'INSERT INTO TREF_CLIENTE ( NR_PROCESSO,  NR_SEQUENCIA,  CD_REFERENCIA,  TP_REFERENCIA,  CD_EMPRESA,  DT_REFERENCIA,  CD_AREA) ' + #13#10 +
                                    '                   VALUES(:NR_PROCESSO, :NR_SEQUENCIA, :CD_REFERENCIA, :TP_REFERENCIA, :CD_EMPRESA, :DT_REFERENCIA, :CD_AREA)';
  queryInsereReferencia.ParamByName('NR_PROCESSO').AsString := NumeroProcesso;
  queryInsereReferencia.ParamByName('NR_SEQUENCIA').AsString := '001';
  queryInsereReferencia.ParamByName('CD_REFERENCIA').AsString := ReferenciaDescricao;
  queryInsereReferencia.ParamByName('TP_REFERENCIA').AsString := CodigoTipoReferencia;
  queryInsereReferencia.ParamByName('CD_EMPRESA').AsString := CodigoCliente;
  queryInsereReferencia.ParamByName('DT_REFERENCIA').AsDateTime := DataServidor;
  queryInsereReferencia.ParamByName('CD_AREA').AsString := CodigoArea;
  queryInsereReferencia.ExecSQL;

  Log('Inserindo Referência');
end;

procedure TAberturaProcessos.InsereContainers;
var
  i: integer;
begin
  queryInsereContainers.Close;
  queryInsereContainers.SQL.Text := 'INSERT INTO TPROCESSO_CNTR (  NR_PROCESSO,  NR_CNTR,  TP_CNTR) ' + #13#10 +
                                    '                    VALUES ( :NR_PROCESSO, :NR_CNTR, :TP_CNTR)';

  for i := 0 to QuantidadeContainers - 1 do
  begin
    queryInsereContainers.ParamByName('NR_PROCESSO').AsString := NumeroProcesso;
    queryInsereContainers.ParamByName('NR_CNTR').AsString := GetEnumName(TypeInfo(TNumeroContainer), i);
    queryInsereContainers.ParamByName('TP_CNTR').AsString := TipoContainer;
    queryInsereContainers.ExecSQL;
  end;
  Log('Inserindo os containers');
end;

procedure TAberturaProcessos.AtualizaEvento003;
begin
  queryAtualizaEvento003.Close;
  queryAtualizaEvento003.SQL.Text := 'UPDATE TFOLLOWUP SET DT_REALIZACAO = GETDATE() WHERE NR_PROCESSO = :NR_PROCESSO AND CD_EVENTO = :CD_EVENTO ';
  queryAtualizaEvento003.ParamByName('NR_PROCESSO').AsString := NumeroProcesso;
  queryAtualizaEvento003.ParamByName('CD_EVENTO').AsString := '003';
  queryAtualizaEvento003.ExecSQL;
  Log('Atualizando o evento 003');
end;

procedure TAberturaProcessos.AtualizaEvento131;
begin
  queryAtualizaEvento131.Close;
  queryAtualizaEvento131.SQL.Text := 'UPDATE TFOLLOWUP SET DT_REALIZACAO = :DATA_PREVISAO_EMBARQUE WHERE NR_PROCESSO = :NR_PROCESSO AND CD_EVENTO = :CD_EVENTO ';
  queryAtualizaEvento131.ParamByName('DATA_PREVISAO_EMBARQUE').AsDateTime := DataPrevisaoEmbarque;
  queryAtualizaEvento131.ParamByName('NR_PROCESSO').AsString := NumeroProcesso;
  queryAtualizaEvento131.ParamByName('CD_EVENTO').AsString := '131';
  queryAtualizaEvento131.ExecSQL;
  Log('Atualizando o evento 131');
end;

procedure TAberturaProcessos.AtualizaEvento147;
begin
  queryAtualizaEvento147.Close;
  queryAtualizaEvento147.SQL.Text := 'UPDATE TFOLLOWUP SET DT_REALIZACAO = :PREVISAO_CARREGAMENTO WHERE NR_PROCESSO = :NR_PROCESSO AND CD_EVENTO = :CD_EVENTO ';
  queryAtualizaEvento147.ParamByName('PREVISAO_CARREGAMENTO').AsDateTime := DataPrevisaoCarregamento;
  queryAtualizaEvento147.ParamByName('NR_PROCESSO').AsString := NumeroProcesso;
  queryAtualizaEvento147.ParamByName('CD_EVENTO').AsString := '147';
  queryAtualizaEvento147.ExecSQL;
  Log('Atualizando o evento 147');
end;

procedure TAberturaProcessos.getNumeroNovoProcesso;
var
  InicioProcesso: String;
  NumeroBase: Integer;
begin
  InicioProcesso := CodigoUnidade +  CodigoProduto + CodigoPrefixo;

  queryGetNumeroProcesso.Close;
  queryGetNumeroProcesso.SQL.Text := 'SELECT MAX(NR_PROCESSO) ULTIMO FROM TPROCESSO '+
                                     ' WHERE SUBSTRING(NR_PROCESSO, 1, 6) = :NR_PROCESSO '+
                                     '  AND DT_ABERTURA BETWEEN (:DTINICIAL) AND (:DTFINAL) ';
  queryGetNumeroProcesso.ParamByName('NR_PROCESSO').AsString := InicioProcesso;
  queryGetNumeroProcesso.ParamByName('DTINICIAL').AsDateTime :=  StartOfTheYear(DataServidor);
  queryGetNumeroProcesso.ParamByName('DTFINAL').AsDateTime := EndOfTheYear(DataServidor);
  queryGetNumeroProcesso.Open;

  if not queryGetNumeroProcesso.IsEmpty then
    NumeroBase := StrToIntDef(Copy(queryGetNumeroProcesso.FieldByName('ULTIMO').AsString, 8, 6), 0) + 1
  else
    NumeroBase := 1;

  NumeroProcesso := InicioProcesso + '-' + FormatFloat('000000', NumeroBase) + '-' + FormatDateTime('YY', DataServidor);
end;

procedure TAberturaProcessos.ServerDateTime;
begin
  queryServerDateTime.Close;
  queryServerDateTime.SQL.Text := 'SELECT GETDATE() AS CurrentDateTime ';
  queryServerDateTime.Open;
  DataServidor := queryServerDateTime.FieldByName('CurrentDateTime').AsDateTime;

end;

procedure TAberturaProcessos.Log(const Msg: string);
var
  Filename: string;
  LogFile: TextFile;
begin
  Filename := NomeArquivoLog;
  AssignFile (LogFile, Filename);
  if FileExists (FileName) then
    Append (LogFile)
  else
    Rewrite (LogFile);
  try
    if Msg = '' then
      Writeln (LogFile, Msg)
    else
      Writeln (LogFile, DateTimeToStr (Now) + ': ' + Msg);
  finally
    CloseFile (LogFile);
    if Assigned(LogCallBack) then
      LogCallBack;
  end;
end;

procedure TAberturaProcessos.SetCodigoAgenteCarga(const Value: string);
begin
  if ConsultaLookUP('TAGENTE', 'CD_AGENTE', Value, 'NM_AGENTE') <> '' then
    FCodigoAgenteCarga := Value
  else
    Raise exception.Create('ERRO. Agente cód: ' + Value + ', não encontrado no banco de dados. Processo não incluído.');
end;

procedure TAberturaProcessos.SetCodigoArea(const Value: string);
begin
  if ConsultaLookUP('TAREA', 'CD_AREA', Value, 'NM_AREA') <> '' then
    FCodigoArea := Value
  else
    Raise exception.Create('ERRO. Área cód: ' + Value + ', não encontrada no banco de dados. Processo não incluído.');
end;

procedure TAberturaProcessos.SetCodigoCliente(const Value: string);
begin
  if ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', Value, 'NM_EMPRESA') <> '' then
    FCodigoCliente := Value
  else
    Raise exception.Create('ERRO. Cliente(Fábrica) cód: ' + Value + ', não encontrado no banco de dados. Processo não incluído.');
end;

procedure TAberturaProcessos.SetCodigoPais(const Value: string);
begin
  if ConsultaLookUP('TPAIS', 'CODIGO', Value, 'DESCRICAO') <> '' then
    FCodigoPais := Value
  else
    Raise exception.Create('ERRO. País cód: ' + Value + ', não encontrado no banco de dados. Processo não incluído.');
end;

procedure TAberturaProcessos.SetCodigoTransportadora(const Value: string);
begin
  if ConsultaLookUP('TTRANSP_ROD', 'CD_TRANSP_ROD', Value, 'NM_TRANSP_ROD') <> '' then
    FCodigoTransportadora := Value
  else
    Raise exception.Create('ERRO. Transportadora cód: ' + Value + ', não encontrada no banco de dados. Processo não incluído.');
end;

end.


