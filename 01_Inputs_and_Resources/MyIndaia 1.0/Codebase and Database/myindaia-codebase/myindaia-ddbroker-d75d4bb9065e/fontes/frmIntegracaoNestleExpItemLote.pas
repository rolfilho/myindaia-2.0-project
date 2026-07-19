unit FrmIntegracaoNestleExpItemLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, Grids, DBGrids, DB, DBTables,
  Excel2000, OleServer, ComObj, DateUtils;

type


  TAdicionarExpoItemLote = class;
  TIntegracaoPlanilha = class;
  TLogCallBack = procedure of object;

  TNumeroContainer = (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, X, Z);

  TFormIntegracaoNestleExpItemLote = class(TForm)
    Panel3: TPanel;
    dsMain: TDataSource;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    qryMain: TQuery;
    GroupBox1: TGroupBox;
    lbl_nr_processo: TLabel;
    msk_nr_processo: TMaskEdit;
    Panel1: TPanel;
    btnIntegrarPlanilha: TBitBtn;
    Label1: TLabel;
    qryMainPROCESSO: TStringField;
    btn_fechar: TButton;
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    gbxStatus: TGroupBox;
    lblStatus: TLabel;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure msk_nr_processoChange(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure btnIntegrarPlanilhaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    IntegracaoPlanilha: TIntegracaoPlanilha;
  public
    { Public declarations }
    procedure getLogAtualizado;

  end;


  TIntegracaoPlanilha = class
  private
    queryConsultaItens: TQuery;
    NrProcesso: String;
    arquivoPlanilha: String;
    LinhaItem: Integer;
    Excel: OleVariant;
    oSheet: OleVariant;
    AdicionarExpoItemLote: TAdicionarExpoItemLote;
    LogCallBack: TLogCallBack;
    NomeArquivoLog: string;
    procedure IntegrarPlanilhaAdicionarExpoItemLote(nrProcesso: string);
    function ConsultaItens(NrProcesso: String): Boolean;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TAdicionarExpoItemLote = class
  private
    FQuantidadeCxs: Double;
    FPesoLiquido: Double;
    FPesoBruto: Double;
    FOrdem: string;
    FProduto: string;
    FLote: string;
    FValidade: TDateTime;
    FDataFabricacao: TDateTime;
    FNrProcesso: string;
    FItem: string;
    FCdMercadoria: String;
  public
    DataServidor: TDateTime;
    LogCallBack: TLogCallBack;
    NomeArquivoLog: string;
    property Item: string read FItem write FItem;
    property NrProcesso: string read FNrProcesso write FNrProcesso;
    property Ordem: string read FOrdem write FOrdem;
    property Produto: string read FProduto write FProduto;
    property Lote: string read FLote write FLote;
    property DataFabricacao: TDateTime read FDataFabricacao write FDataFabricacao;
    property Validade: TDateTime read FValidade write FValidade;
    property QuantidadeCxs: Double read FQuantidadeCxs write FQuantidadeCxs;
    property PesoBruto: Double read FPesoBruto write FPesoBruto;
    property PesoLiquido: Double read FPesoLiquido write FPesoLiquido;
    property CdMercadoria: String read FCdMercadoria write FCdMercadoria;
    procedure Log(const Msg: string);
    constructor Create;
    destructor Destroy; override;
  private
    queryInsereLote: TQuery;
    queryAtualizaMercadoria: TQuery;
    queryConsultaMercadoria: TQuery;
    queryServerDateTime: TQuery;
    function AdicionaItem: string;
    function ConsultaMercadoriaExiste: Boolean;
    procedure ServerDateTime;
    procedure AdicionaNovoLote;
  end;


var
  FormIntegracaoNestleExpItemLote: TFormIntegracaoNestleExpItemLote;

const
  Grupo: String = 'C53';

implementation

uses
//PGGP001, Funcoes, ConsOnLineEx, KrQuery, PGGP017;
  GSMLIB, PGGP017,  KrDialog, TypInfo, ConsOnLineEx;

{$R *.dfm}

procedure TFormIntegracaoNestleExpItemLote.FormShow(Sender: TObject);
begin
//  qryMain.Open;
//  lblArquivoLog.Caption := 'Arquivo log: ' + NomeArquivoLog;
  getLogAtualizado;  
end;

procedure TFormIntegracaoNestleExpItemLote.msk_nr_processoChange(Sender: TObject);
begin
//  qryMain.Locate('PROCESSO', msk_nr_processo.Text, [loCaseInsensitive, loPartialKey])
end;



function GetLocalPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

function NomeArquivoLog: string;
begin
  ForceDirectories(GetLocalPath +'TEMP');

  Result := GetLocalPath + 'TEMP\IntegracaoNestleExpoItemLote_' + FormatDateTime('yyyy-mm-dd', Now) + '.log';
end;

procedure Log(const Msg: string; CallBack: TLogCallBack);
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
    Writeln (LogFile, DateTimeToStr (Now) + ':' + Msg);
  finally
    CloseFile (LogFile);
    if Assigned(CallBack) then
      CallBack;
  end;
end;


procedure TFormIntegracaoNestleExpItemLote.getLogAtualizado;
begin
  if not FileExists(NomeArquivoLog) then
    Memo1.Lines.SaveToFile(NomeArquivoLog)
  else
    Memo1.Lines.LoadFromFile(NomeArquivoLog);
end;

procedure TFormIntegracaoNestleExpItemLote.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormIntegracaoNestleExpItemLote.btnIntegrarPlanilhaClick(
  Sender: TObject);
begin
  IntegracaoPlanilha := TIntegracaoPlanilha.Create;
  try
    if qryMainPROCESSO.AsString = '' then
    begin
      showmessage('Selecionar um processo');
      Exit;
    end;

    if not IntegracaoPlanilha.ConsultaItens(qryMainPROCESSO.AsString) then
    begin
      showmessage('Não existe itens de exportação para este processo.');
      Exit;
    end;

    if not OpenDialog1.Execute then
      Exit;

    IntegracaoPlanilha.NomeArquivoLog := NomeArquivoLog;
    IntegracaoPlanilha.LogCallBack := Self.getLogAtualizado;
    IntegracaoPlanilha.arquivoPlanilha := OpenDialog1.FileName;
    IntegracaoPlanilha.NrProcesso := qryMainPROCESSO.AsString;
    IntegracaoPlanilha.IntegrarPlanilhaAdicionarExpoItemLote(qryMainPROCESSO.AsString);
  finally
    IntegracaoPlanilha.Free;
  end;
end;


{ TIntegracaoPlanilha }

function TIntegracaoPlanilha.ConsultaItens(NrProcesso: String): Boolean;
begin
  queryConsultaItens.Close;
  queryConsultaItens.SQL.Text :=
    'SELECT NR_PROCESSO FROM TPROCESSO_EXP_ITEM ' +
    'WHERE NR_PROCESSO = :NR_PROCESSO ';
  queryConsultaItens.ParamByName('NR_PROCESSO').AsString :=  NrProcesso;
  queryConsultaItens.Open;

  result := queryConsultaItens.RecordCount > 0;

end;

constructor TIntegracaoPlanilha.Create;
begin
  queryConsultaItens := TQuery.Create(nil);
  queryConsultaItens.DatabaseName := 'DBBROKER';

end;

destructor TIntegracaoPlanilha.Destroy;
begin
  queryConsultaItens.Free;

  inherited;
end;

procedure TIntegracaoPlanilha.IntegrarPlanilhaAdicionarExpoItemLote(nrProcesso: string);
var
  vArquivoSalvo: string;
  itemCount: Integer;
  vLimitador : string;

  function ConverterEmData(value: String): TDateTime;
  var
    dataStr: string;
  begin
    dataStr := StringReplace(value, '.', '/', [rfReplaceAll]);
    Result := StrToDateTime(dataStr);
  end;
begin

  Excel := CreateOleObject('Excel.Application');
  try
    Excel.Visible := True;

    Excel.WorkBooks.Add(arquivoPlanilha);
    oSheet := Excel.Workbooks[1].WorkSheets[1];

    LinhaItem := 2 ;
    ItemCount := 0;
    vLimitador := oSheet.Cells[LinhaItem, 1].value;

    while vLimitador <> '' do
    begin
      try
        AdicionarExpoItemLote := TAdicionarExpoItemLote.Create;
        try
          Inc(ItemCount);
          AdicionarExpoItemLote.NomeArquivoLog := NomeArquivoLog;
          AdicionarExpoItemLote.LogCallBack := LogCallBack;

          AdicionarExpoItemLote.Log('');
          AdicionarExpoItemLote.Log('Lendo a linha: ' + IntToStr(LinhaItem));

          AdicionarExpoItemLote.NrProcesso := nrProcesso;
          AdicionarExpoItemLote.Item := formatFloat('000', ItemCount);

          AdicionarExpoItemLote.Ordem := Trim(oSheet.Cells[LinhaItem,1].value);
          AdicionarExpoItemLote.Produto := Trim(oSheet.Cells[LinhaItem,2].value);
          AdicionarExpoItemLote.Lote := Trim(oSheet.Cells[LinhaItem,3].value);
          AdicionarExpoItemLote.DataFabricacao := ConverterEmData(Trim(oSheet.Cells[LinhaItem,4].value));
          AdicionarExpoItemLote.Validade := ConverterEmData(Trim(oSheet.Cells[LinhaItem,5].value));
          AdicionarExpoItemLote.QuantidadeCxs := StrToFloatDef(Trim(oSheet.Cells[LinhaItem,6].value), 0);
//          AdicionarExpoItemLote.PesoBruto := StrToFloatDef(Trim(oSheet.Cells[LinhaItem,7].value), 0);
//          AdicionarExpoItemLote.PesoLiquido := StrToFloatDef(Trim(oSheet.Cells[LinhaItem,8].value), 0);

          try
            AdicionarExpoItemLote.AdicionaItem;
            oSheet.Cells[LinhaItem,9].value := 'Lotes incluídos com sucesso.';
          except
            oSheet.Cells[LinhaItem,9].value := 'Erro ao incluir os lotes no banco de dados.';
          end;
        except
          on E: Exception do
          begin
            AdicionarExpoItemLote.log(E.Message);
            oSheet.Cells[LinhaItem,20].value := E.Message;
          end;
        end;
      finally
        AdicionarExpoItemLote.Free;
      end;
      Inc(LinhaItem);
      vLimitador := oSheet.Cells[LinhaItem, 1].value;
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

{ TAdicionarExpoItemLote }

constructor TAdicionarExpoItemLote.Create;
begin
  queryConsultaMercadoria := TQuery.Create(nil);
  queryConsultaMercadoria.DatabaseName := 'DBBROKER';

  queryServerDateTime := TQuery.Create(nil);
  queryServerDateTime.DatabaseName := 'DBBROKER';

  queryInsereLote := TQuery.Create(nil);
  queryInsereLote.DatabaseName := 'DBBROKER';

  queryAtualizaMercadoria := TQuery.Create(nil);
  queryAtualizaMercadoria.DatabaseName := 'DBBROKER';

  ServerDateTime;

end;

destructor TAdicionarExpoItemLote.Destroy;
begin
  queryConsultaMercadoria.Free;
//  queryServerDateTime.Free;
  queryInsereLote.Free;
  queryAtualizaMercadoria.Free;

  inherited;
end;

function TAdicionarExpoItemLote.AdicionaItem: string;
begin
  datm_main.db_broker.StartTransaction;
  try
    if ConsultaMercadoriaExiste then
      AdicionaNovoLote
    else
      Log('Item nâo existe.');

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


procedure TAdicionarExpoItemLote.AdicionaNovoLote;
begin
  queryInsereLote.Close;
  queryInsereLote.SQL.Text :=
    'INSERT INTO TRAP_FORNECIMENTO_LOTE ' + #13#10 +
    '(CD_FORNECIMENTO, CD_GRUPO, CD_SKU, CD_LOTE, DT_FABRICACAO, DT_VENCIMENTO, QT_MERCADORIA, QT_PESO_BRUTO, QT_PESO_LIQ, NR_PROCESSO) ' + #13#10 +
    'VALUES (:CD_FORNECIMENTO, :CD_GRUPO, :CD_SKU, :CD_LOTE, :DT_FABRICACAO, :DT_VENCIMENTO, :QT_MERCADORIA, :QT_PESO_BRUTO, :QT_PESO_LIQ, :NR_PROCESSO)';

  queryInsereLote.ParamByName('CD_FORNECIMENTO').AsString := Ordem;
  queryInsereLote.ParamByName('CD_GRUPO').AsString := '155';
  queryInsereLote.ParamByName('CD_SKU').AsString := CdMercadoria;
  queryInsereLote.ParamByName('CD_LOTE').AsString :=  Lote;
  queryInsereLote.ParamByName('DT_FABRICACAO').AsDateTime := DataFabricacao;
  queryInsereLote.ParamByName('DT_VENCIMENTO').AsDateTime :=  Validade;
  queryInsereLote.ParamByName('QT_MERCADORIA').AsFloat :=  QuantidadeCxs;
  queryInsereLote.ParamByName('QT_PESO_BRUTO').AsFloat := PesoBruto;
  queryInsereLote.ParamByName('QT_PESO_LIQ').AsFloat :=  PesoLiquido;
  queryInsereLote.ParamByName('NR_PROCESSO').AsString :=  NrProcesso;

  queryInsereLote.ExecSQL;

  Log('Inserindo lote: ' + Lote);

end;

function TAdicionarExpoItemLote.ConsultaMercadoriaExiste: Boolean;
begin
  queryConsultaMercadoria.Close;
  queryConsultaMercadoria.SQL.Text :=
    'SELECT NR_PROCESSO, NR_ORDER, CD_MERCADORIA, ' + #13#10 +
    '(VL_TOT_PESO_BRUTO / QT_MERCADORIA) AS PESO_BRUTO_POR_CAIXA, ' + #13#10 +
    '(VL_TOT_PESO_LIQ / QT_MERCADORIA) AS PESO_LIQ_POR_CAIXA ' + #13#10 +
    'FROM TPROCESSO_EXP_ITEM ' + #13#10 +
    'WHERE NR_PROCESSO = :NR_PROCESSO AND ' + #13#10 +
    'NR_ORDER = :CD_ORDER AND ' + #13#10 +
    'SUBSTRING(CD_MERCADORIA, PATINDEX(''%[^0]%'', CD_MERCADORIA), LEN(CD_MERCADORIA)) = :CD_MERCADORIA ';
  queryConsultaMercadoria.ParamByName('NR_PROCESSO').AsString :=  NrProcesso;
  queryConsultaMercadoria.ParamByName('CD_ORDER').AsString :=  Ordem;
  queryConsultaMercadoria.ParamByName('CD_MERCADORIA').AsString := Produto;
  queryConsultaMercadoria.Open;

  result := queryConsultaMercadoria.RecordCount > 0;

  CdMercadoria := queryConsultaMercadoria.fieldByName('CD_MERCADORIA').AsString;
  PesoBruto := queryConsultaMercadoria.fieldByName('PESO_BRUTO_POR_CAIXA').AsFloat * QuantidadeCxs;
  PesoLiquido := queryConsultaMercadoria.fieldByName('PESO_LIQ_POR_CAIXA').AsFloat * QuantidadeCxs;
end;

procedure TAdicionarExpoItemLote.ServerDateTime;
begin
  queryServerDateTime.Close;
  queryServerDateTime.SQL.Text := 'SELECT GETDATE() AS CurrentDateTime ';
  queryServerDateTime.Open;
  DataServidor := queryServerDateTime.FieldByName('CurrentDateTime').AsDateTime;

end;

procedure TAdicionarExpoItemLote.Log(const Msg: string);
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

//procedure TAdicionarExpoItemLote.PreencheStatus(const Msg: string, Ativar: Boolean);
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
//    if Msg = '' then
//      Writeln (LogFile, Msg)
//    else
//      Writeln (LogFile, DateTimeToStr (Now) + ': ' + Msg);
//  finally
//    CloseFile (LogFile);
//    if Assigned(LogCallBack) then
//      LogCallBack;
//  end;
//end;

procedure TFormIntegracaoNestleExpItemLote.BitBtn1Click(Sender: TObject);
begin
  if Length(msk_nr_processo.Text) > 11 then
  begin
    qryMain.Close;
    qryMain.SQL.Text :=
      'SELECT DISTINCT ' + #13#10 +
      'TP.NR_PROCESSO AS PROCESSO ' + #13#10 +
      'FROM TPROCESSO TP WITH (NOLOCK) ' + #13#10 +
      'INNER JOIN TPROCESSO_EXP PE ON PE.NR_PROCESSO = TP.NR_PROCESSO ' + #13#10 +
      'WHERE CD_GRUPO = ''155'' AND ' + #13#10 +
      'TP.NR_PROCESSO LIKE ''%' + msk_nr_processo.Text +''' ' + #13#10 +
      'ORDER BY TP.NR_PROCESSO ASC ';
    qryMain.Open;

  end;
end;

end.

