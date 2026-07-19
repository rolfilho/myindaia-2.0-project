unit FrmIntegracaoApolo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, Grids, DBGrids, DB, DBTables,
  Excel2000, OleServer, ComObj, DateUtils;

type


  TAdicionarItemExpo = class;
  TIntegracaoPlanilha = class;
  TLogCallBack = procedure of object;

  TNumeroContainer = (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, X, Z);

  TFormIntegracaoApolo = class(TForm)
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
    procedure FormShow(Sender: TObject);
    procedure msk_nr_processoChange(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure btnIntegrarPlanilhaClick(Sender: TObject);
  private
    { Private declarations }
    IntegracaoPlanilha: TIntegracaoPlanilha;
  public
    { Public declarations }
    procedure getLogAtualizado;

  end;


  TIntegracaoPlanilha = class
  private
    queryConsultaPedido: TQuery;
    queryConsultaItens: TQuery;
    queryDeleteItens: TQuery;
    NrPedido: String;
    arquivoPlanilha: String;
    LinhaItem: Integer;
    Excel: OleVariant;
    oSheet: OleVariant;
    AdicionarItemExpo: TAdicionarItemExpo;
    LogCallBack: TLogCallBack;
    NomeArquivoLog: string;
    procedure IntegrarPlanilhaAdicionarItemExpo(nrProcesso: string);
    function ConsultaPedido(value: String): String;
    function ConsultaItens(var nrDue: string; NrProcesso: String): Boolean;
    procedure DeleteItens(NrProcesso: String);
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TAdicionarItemExpo = class
  private
    FQuantidade: Double;
    FCategoria: string;
    FNCM: string;
    FPesoBrutoTotal: Double;
    FCodigo: string;
    FCubagemUnit: Double;
    FValorUnitarioDolar: Double;
    FLargura: Double;
    FPesoLiquidoUnit: Double;
    FValorUnitarioReal: Double;
    FPesoBrutoUnit: Double;
    FPesoLiquidoTotal: Double;
    FCubagemTotal: Double;
    FValorTotalReal: Double;
    FDescricao: string;
    FAltura: Double;
    FUnidadeCom: string;
    FValorTotalDolar: Double;
    FComprimento: Double;
    FItem: string;
    FNrPedido: string;
  public
    NumeroProcesso: String;
    DataServidor: TDateTime;
    LogCallBack: TLogCallBack;
    NomeArquivoLog: string;
    property Item: string read FItem write FItem;
    property Categoria: string read FCategoria write FCategoria;
    property Codigo: string read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    property UnidadeCom: string read FUnidadeCom write FUnidadeCom;
    property Quantidade: Double read FQuantidade write FQuantidade;
    property ValorUnitarioDolar: Double read FValorUnitarioDolar write FValorUnitarioDolar;
    property ValorTotalDolar: Double read FValorTotalDolar write FValorTotalDolar;
    property ValorUnitarioReal: Double read FValorUnitarioReal write FValorTotalReal;
    property ValorTotalReal: Double read FValorTotalReal write FValorTotalReal;
    property Comprimento: Double read FComprimento write FComprimento;
    property Largura: Double read FLargura write FLargura;
    property Altura: Double read FAltura write FAltura;
    property CubagemUnit: Double read FCubagemUnit write FCubagemUnit;
    property CubagemTotal: Double read FCubagemTotal write FCubagemTotal;
    property PesoBrutoUnit: Double read FPesoBrutoUnit write FPesoBrutoUnit;
    property PesoLiquidoUnit: Double read FPesoLiquidoUnit write FPesoLiquidoUnit;
    property PesoBrutoTotal: Double read FPesoBrutoTotal write FPesoBrutoTotal;
    property PesoLiquidoTotal: Double read FPesoLiquidoTotal write FPesoLiquidoTotal;
    property NCM: string read FNCM write FNCM;
    property NrPedido: string read FNrPedido write FNrPedido;
    procedure Log(const Msg: string);
    constructor Create;
    destructor Destroy; override;
  private
    queryInsereNovoItem: TQuery;
    queryAtualizaMercadoria: TQuery;
    queryConsultaMercadoria: TQuery;
    queryServerDateTime: TQuery;
    function AdicionaItem: string;
    function ConsultaMercadoriaExiste: Boolean;
    procedure ServerDateTime;
    procedure AdicionaNovoItem;
    procedure AtualizaMercadoria;

  end;


var
  FormIntegracaoApolo: TFormIntegracaoApolo;

const
  Grupo: String = 'C53';

implementation

uses
//PGGP001, Funcoes, ConsOnLineEx, KrQuery, PGGP017;
  GSMLIB, PGGP017,  KrDialog, TypInfo, ConsOnLineEx;

{$R *.dfm}

procedure TFormIntegracaoApolo.FormShow(Sender: TObject);
begin
  qryMain.Open;
//  lblArquivoLog.Caption := 'Arquivo log: ' + NomeArquivoLog;
  getLogAtualizado;  
end;

procedure TFormIntegracaoApolo.msk_nr_processoChange(Sender: TObject);
begin
  qryMain.Locate('PROCESSO', msk_nr_processo.Text, [loCaseInsensitive, loPartialKey])
end;



function GetLocalPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

function NomeArquivoLog: string;
begin
  ForceDirectories(GetLocalPath +'TEMP');

  Result := GetLocalPath + 'TEMP\IntegracaoExpoItensApolo_' + FormatDateTime('yyyy-mm-dd', Now) + '.log';
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


procedure TFormIntegracaoApolo.getLogAtualizado;
begin
  if not FileExists(NomeArquivoLog) then
    Memo1.Lines.SaveToFile(NomeArquivoLog)
  else
    Memo1.Lines.LoadFromFile(NomeArquivoLog);
end;

procedure TFormIntegracaoApolo.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormIntegracaoApolo.btnIntegrarPlanilhaClick(
  Sender: TObject);
var
  nrDue: string;
begin
  nrDue := '';
  IntegracaoPlanilha := TIntegracaoPlanilha.Create;
  try

    if IntegracaoPlanilha.ConsultaItens(nrDue, qryMainPROCESSO.AsString) then
    begin
      if nrDue <> '' then
      begin
        showmessage('Este Processo já possui número de DUE, não é possível integrar a planilha de itens.');
        Exit;
      end
      else
      begin
        if MessageDlg('Deseja exluir os itens atuais para inserir os itens da planilha?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
          IntegracaoPlanilha.DeleteItens(qryMainPROCESSO.AsString)
        else
          Exit;
      end;
    end;

    if not OpenDialog1.Execute then
      Exit;

    IntegracaoPlanilha.NomeArquivoLog := NomeArquivoLog;
    IntegracaoPlanilha.LogCallBack := Self.getLogAtualizado;
    IntegracaoPlanilha.arquivoPlanilha := OpenDialog1.FileName;
    IntegracaoPlanilha.NrPedido := IntegracaoPlanilha.ConsultaPedido(qryMainPROCESSO.AsString);
    IntegracaoPlanilha.IntegrarPlanilhaAdicionarItemExpo(qryMainPROCESSO.AsString);
  finally
    IntegracaoPlanilha.Free;
  end;
end;


{ TIntegracaoPlanilha }

constructor TIntegracaoPlanilha.Create;
begin
  queryConsultaPedido := TQuery.Create(nil);
  queryConsultaPedido.DatabaseName := 'DBBROKER';

  queryConsultaItens := TQuery.Create(nil);
  queryConsultaItens.DatabaseName := 'DBBROKER';

  queryDeleteItens := TQuery.Create(nil);
  queryDeleteItens.DatabaseName := 'DBBROKER';
end;

destructor TIntegracaoPlanilha.Destroy;
begin
  queryConsultaPedido.Free;
  queryConsultaItens.Free;
  queryDeleteItens.Free;

  inherited;
end;

function TIntegracaoPlanilha.ConsultaPedido(value: String): String;
begin
  queryConsultaPedido.Close;
  queryConsultaPedido.SQL.Text := 'SELECT TOP 1 CD_REFERENCIA ' +
                                  'FROM TREF_CLIENTE ' +
                                  'WHERE NR_PROCESSO = :NR_PROCESSO ' +
                                  'AND TP_REFERENCIA = ''01'' ';
  queryConsultaPedido.ParamByName('NR_PROCESSO').AsString :=  value;
  queryConsultaPedido.Open;

  result := queryConsultaPedido.FieldByName('CD_REFERENCIA').AsString;;
end;

function TIntegracaoPlanilha.ConsultaItens(var nrDue: string; NrProcesso: String): Boolean;
begin
  queryConsultaItens.Close;
  queryConsultaItens.SQL.Text := ' SELECT P.CD_DUE, PEI.NR_ITEM ' +
                                 ' FROM TPROCESSO_EXP_ITEM PEI ' +
                                 ' INNER JOIN TPROCESSO P ON P.NR_PROCESSO = PEI.NR_PROCESSO ' +
                                 ' WHERE PEI.NR_PROCESSO = :NR_PROCESSO ';
  queryConsultaItens.ParamByName('NR_PROCESSO').AsString :=  NrProcesso;
  queryConsultaItens.Open;

  nrDue := queryConsultaItens.FieldByName('CD_DUE').AsString;
  result := queryConsultaItens.recordCount > 0;
end;

procedure TIntegracaoPlanilha.DeleteItens(NrProcesso: String);
begin
  queryDeleteItens.Close;
  queryDeleteItens.SQL.Text := 'DELETE TPROCESSO_EXP_ITEM WHERE NR_PROCESSO = :NR_PROCESSO';
  queryDeleteItens.ParamByName('NR_PROCESSO').AsString :=  NrProcesso;
  queryDeleteItens.ExecSQL;
end;

procedure TIntegracaoPlanilha.IntegrarPlanilhaAdicionarItemExpo(nrProcesso: string);
var
  vArquivoSalvo: string;
  itemCount: Integer;

  function GetCodigoUnidade(value: string): String;
  begin
    if value = 'PC' then Result := '103' else
    if value = 'UM' then Result := '233';
  end;

begin

  Excel := CreateOleObject('Excel.Application');
  try
    Excel.Visible := True;

    Excel.WorkBooks.Add(arquivoPlanilha);
    oSheet := Excel.Workbooks[1].WorkSheets[1];

    LinhaItem := 5;
    ItemCount := 0;
    while oSheet.Cells[LinhaItem, 1].Value <> '' do
    begin
      try
        AdicionarItemExpo := TAdicionarItemExpo.Create;
        try
          Inc(ItemCount);
          AdicionarItemExpo.NomeArquivoLog := NomeArquivoLog;
          AdicionarItemExpo.LogCallBack := LogCallBack;

          AdicionarItemExpo.Log('');
          AdicionarItemExpo.Log('Lendo a linha: ' + IntToStr(LinhaItem));

          AdicionarItemExpo.NumeroProcesso := nrProcesso;
          AdicionarItemExpo.Item := formatFloat('000', ItemCount);
          AdicionarItemExpo.Categoria := Trim(oSheet.Cells[LinhaItem,1].value);
          AdicionarItemExpo.Codigo := Trim(oSheet.Cells[LinhaItem,2].value);
          AdicionarItemExpo.Descricao := Trim(oSheet.Cells[LinhaItem,3].value);
          AdicionarItemExpo.UnidadeCom := GetCodigoUnidade(Trim(oSheet.Cells[LinhaItem,4].value));
          AdicionarItemExpo.Quantidade := StrToFloat(Trim(oSheet.Cells[LinhaItem,5].value));
          AdicionarItemExpo.ValorUnitarioDolar := StrToFloat(Trim(oSheet.Cells[LinhaItem,6].value));
          AdicionarItemExpo.ValorTotalDolar := StrToFloat(Trim(oSheet.Cells[LinhaItem,7].value));
          AdicionarItemExpo.ValorUnitarioReal := StrToFloatDef(Trim(oSheet.Cells[LinhaItem,8].value), 0);
          AdicionarItemExpo.ValorTotalReal := StrToFloatDef(Trim(oSheet.Cells[LinhaItem,9].value), 0);
          AdicionarItemExpo.Comprimento := StrToFloat(Trim(oSheet.Cells[LinhaItem,10].value));
          AdicionarItemExpo.Largura := StrToFloat(Trim(oSheet.Cells[LinhaItem,11].value));
          AdicionarItemExpo.Altura := StrToFloat(Trim(oSheet.Cells[LinhaItem,12].value));
          AdicionarItemExpo.CubagemUnit := StrToFloat(Trim(oSheet.Cells[LinhaItem,13].value));
          AdicionarItemExpo.CubagemTotal := StrToFloat(Trim(oSheet.Cells[LinhaItem,14].value));
          AdicionarItemExpo.PesoBrutoUnit := StrToFloat(Trim(oSheet.Cells[LinhaItem,15].value));
          AdicionarItemExpo.PesoLiquidoUnit := StrToFloat(Trim(oSheet.Cells[LinhaItem,16].value));
          AdicionarItemExpo.PesoBrutoTotal := StrToFloat(Trim(oSheet.Cells[LinhaItem,17].value));
          AdicionarItemExpo.PesoLiquidoTotal := StrToFloat(Trim(oSheet.Cells[LinhaItem,18].value));
          AdicionarItemExpo.NCM := Trim(oSheet.Cells[LinhaItem,19].value);
          AdicionarItemExpo.NrPedido := NrPedido;

          try
            AdicionarItemExpo.AdicionaItem;
            oSheet.Cells[LinhaItem,20].value := 'Itens incluídos com sucesso.';
          except
            oSheet.Cells[LinhaItem,20].value := 'Erro ao incluir os itens no banco de dados.';
          end;
        except
          on E: Exception do
          begin
            AdicionarItemExpo.log(E.Message);
            oSheet.Cells[LinhaItem,20].value := E.Message;
          end;
        end;
      finally
        AdicionarItemExpo.Free;
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

{ TAdicionarItemExpo }

constructor TAdicionarItemExpo.Create;
begin
  queryConsultaMercadoria := TQuery.Create(nil);
  queryConsultaMercadoria.DatabaseName := 'DBBROKER';

  queryServerDateTime := TQuery.Create(nil);
  queryServerDateTime.DatabaseName := 'DBBROKER';

  queryInsereNovoItem := TQuery.Create(nil);
  queryInsereNovoItem.DatabaseName := 'DBBROKER';

  queryAtualizaMercadoria := TQuery.Create(nil);
  queryAtualizaMercadoria.DatabaseName := 'DBBROKER';

  ServerDateTime;

end;

destructor TAdicionarItemExpo.Destroy;
begin
  queryConsultaMercadoria.Free;
//  queryServerDateTime.Free;
  queryInsereNovoItem.Free;
  queryAtualizaMercadoria.Free;

  inherited;
end;

function TAdicionarItemExpo.AdicionaItem: string;
begin
  ConsultaMercadoriaExiste;
  datm_main.db_broker.StartTransaction;
  try
    ConsultaMercadoriaExiste;
    AtualizaMercadoria;
    AdicionaNovoItem;

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


procedure TAdicionarItemExpo.AdicionaNovoItem;
begin
  queryInsereNovoItem.Close;
  queryInsereNovoItem.SQL.Text :=
      ' INSERT INTO TPROCESSO_EXP_ITEM ' + #13#10 +
      ' (NR_PROCESSO, NR_ITEM, CD_MERCADORIA, TX_MERCADORIA, CD_UNID_MEDIDA, QT_MERCADORIA, VL_UNITARIO, VL_TOT_ITEM, VL_TOT_PESO_BRUTO, ' + #13#10 +
      ' VL_TOT_PESO_LIQ, CD_NCM, VL_COMPRIMENTO_EMB, VL_LARGURA_EMB, VL_ALTURA_EMB, VL_CUBAGEM, IN_ACORDO, NR_PEDIDO) ' + #13#10 +
      ' VALUES(:NR_PROCESSO, :NR_ITEM, :CD_MERCADORIA, :TX_MERCADORIA, :CD_UNID_MEDIDA, :QT_MERCADORIA, :VL_UNITARIO, :VL_TOT_ITEM, :VL_TOT_PESO_BRUTO, ' + #13#10 +
      ' :VL_TOT_PESO_LIQ, :CD_NCM, :VL_COMPRIMENTO_EMB, :VL_LARGURA_EMB, :VL_ALTURA_EMB, :VL_CUBAGEM, :IN_ACORDO, :NR_PEDIDO) ';

  queryInsereNovoItem.ParamByName('NR_PROCESSO').AsString := NumeroProcesso;
  queryInsereNovoItem.ParamByName('NR_ITEM').AsString := Item;
  queryInsereNovoItem.ParamByName('CD_MERCADORIA').AsString :=  Codigo;
  queryInsereNovoItem.ParamByName('TX_MERCADORIA').AsString :=  Descricao;
  queryInsereNovoItem.ParamByName('CD_UNID_MEDIDA').AsString :=  UnidadeCom;
  queryInsereNovoItem.ParamByName('QT_MERCADORIA').AsFloat :=  Quantidade;
  queryInsereNovoItem.ParamByName('VL_UNITARIO').AsFloat :=  ValorUnitarioDolar;
  queryInsereNovoItem.ParamByName('VL_TOT_ITEM').AsFloat := Arredondar(ValorUnitarioDolar * Quantidade, 2);
  queryInsereNovoItem.ParamByName('VL_TOT_PESO_BRUTO').AsFloat :=  PesoBrutoTotal;
  queryInsereNovoItem.ParamByName('VL_TOT_PESO_LIQ').AsFloat :=  PesoLiquidoTotal;
  queryInsereNovoItem.ParamByName('CD_NCM').AsString := NCM;
  queryInsereNovoItem.ParamByName('VL_COMPRIMENTO_EMB').AsFloat :=  Comprimento;
  queryInsereNovoItem.ParamByName('VL_LARGURA_EMB').AsFloat :=  Largura;
  queryInsereNovoItem.ParamByName('VL_ALTURA_EMB').AsFloat :=  Altura;
  queryInsereNovoItem.ParamByName('VL_CUBAGEM').AsFloat :=  CubagemTotal;
  queryInsereNovoItem.ParamByName('IN_ACORDO').AsInteger :=  0;
  queryInsereNovoItem.ParamByName('NR_PEDIDO').AsString :=  NrPedido;

  queryInsereNovoItem.ExecSQL;

  Log('Inserindo Processo: ' + NumeroProcesso);

//PARA TESTE - Tornar visível o memo1

//  Log('Categoria: ' + Categoria);
//  Log('Codigo: ' + Codigo );
//  Log('Descricao: ' +Descricao );
//  Log('UnidadeCom: ' +UnidadeCom );
//  Log('Quantidade: '+Quantidade );
//  Log('ValorUnitarioDolar:  ' +ValorUnitarioDolar);
//  Log('ValorTotalDolar:  ' +ValorTotalDolar);
//  Log('ValorUnitarioReal:  ' +ValorUnitarioReal );
//  Log('ValorTotalReal:  '+ValorTotalReal );
//  Log('Comprimento:  ' +Comprimento);
//  Log('Largura:  '+Largura );
//  Log('Altura:  ' +Altura);
//  Log('CubagemUnit:  ' +CubagemUnit);
//  Log('CubagemTotal:  ' +CubagemTotal);
//  Log('PesoBrutoUnit:  ' +PesoBrutoUnit);
//  Log('PesoLiquidoUnit:  ' +PesoLiquidoUnit);
//  Log('PesoBrutoTotal:  ' +PesoBrutoTotal );
//  Log('PesoLiquidoTotal:  ' +PesoLiquidoTotal);
//  Log('NCM:  ' +NCM);
//
//  Log('');


end;

procedure TAdicionarItemExpo.AtualizaMercadoria;
begin

  if ConsultaMercadoriaExiste then
  begin
    queryAtualizaMercadoria.Close;
    queryAtualizaMercadoria.SQL.Text :=
        'UPDATE TMERCADORIA_EXP SET CD_NCM_SH = :CD_NCM_SH ' +
        'WHERE CD_MERCADORIA = :CD_MERCADORIA ' +
        'AND CD_GRUPO = :CD_GRUPO ';
    queryAtualizaMercadoria.ParamByName('CD_NCM_SH').AsString := NCM;
    queryAtualizaMercadoria.ParamByName('CD_MERCADORIA').AsString := Codigo;
    queryAtualizaMercadoria.ParamByName('CD_GRUPO').AsString := Grupo;
    queryAtualizaMercadoria.ExecSQL;
  end else
  begin
    queryAtualizaMercadoria.Close;
    queryAtualizaMercadoria.SQL.Text :=
      'INSERT INTO TMERCADORIA_EXP (CD_MERCADORIA, AP_MERCADORIA, CD_UN_MED_COMERC, CD_NCM_SH, CD_GRUPO, NM_MERCADORIA) ' +
      'VALUES (:CD_MERCADORIA, :AP_MERCADORIA, :CD_UN_MED_COMERC, :CD_NCM_SH, :CD_GRUPO, :NM_MERCADORIA)';
    queryAtualizaMercadoria.ParamByName('CD_MERCADORIA').AsString := Codigo;
    queryAtualizaMercadoria.ParamByName('AP_MERCADORIA').AsString := Copy(Descricao, 0, 40);//Seria melhor fazer outra coluna??
    queryAtualizaMercadoria.ParamByName('CD_UN_MED_COMERC').AsString := UnidadeCom;
    queryAtualizaMercadoria.ParamByName('CD_NCM_SH').AsString :=  NCM;
    queryAtualizaMercadoria.ParamByName('CD_GRUPO').AsString :=  Grupo;
    queryAtualizaMercadoria.ParamByName('NM_MERCADORIA').AsString :=  Descricao;
    queryAtualizaMercadoria.ExecSQL;
  end;
  Log('Inserindo Referência');
end;

function TAdicionarItemExpo.ConsultaMercadoriaExiste: Boolean;
begin
  queryConsultaMercadoria.Close;
  queryConsultaMercadoria.SQL.Text :=
      'SELECT COUNT(*) QTD FROM TMERCADORIA_EXP ' +
      'WHERE CD_MERCADORIA = :CD_MERCADORIA ' +
      'AND CD_GRUPO = :CD_GRUPO ';
  queryConsultaMercadoria.ParamByName('CD_MERCADORIA').AsString :=  Codigo;
  queryConsultaMercadoria.ParamByName('CD_GRUPO').AsString := Grupo;
  queryConsultaMercadoria.Open;

  result := queryConsultaMercadoria.FieldByName('QTD').AsInteger > 0;
end;

procedure TAdicionarItemExpo.ServerDateTime;
begin
  queryServerDateTime.Close;
  queryServerDateTime.SQL.Text := 'SELECT GETDATE() AS CurrentDateTime ';
  queryServerDateTime.Open;
  DataServidor := queryServerDateTime.FieldByName('CurrentDateTime').AsDateTime;

end;

procedure TAdicionarItemExpo.Log(const Msg: string);
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

//procedure TAdicionarItemExpo.PreencheStatus(const Msg: string, Ativar: Boolean);
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

end.

