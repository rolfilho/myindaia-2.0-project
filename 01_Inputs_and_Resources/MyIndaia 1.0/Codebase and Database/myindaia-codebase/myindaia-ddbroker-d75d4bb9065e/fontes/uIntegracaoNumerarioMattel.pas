unit uIntegracaoNumerarioMattel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DateUtils,
  StdCtrls, Mask, Buttons, ExtCtrls, Funcoes, DB, DBTables, Excel2000, OleServer, ComObj,
  Grids, DBGrids, DBClient, ConsOnLineEx;

type

  TIntegracaoNumerario = class
  private
    numeroProcesso: String;
    Processos: String;
    nomePlanilha: String;
    LinhaItem: Integer;
    LinhaItemDetalhe: Integer;
    Excel: OleVariant;
    xlWorkB1: OleVariant;
    oSheet: OleVariant;
    listaDadosComplementares: TStringList;
    queryDraftDanfeItens: TQuery;
    queryDraftDanfeItensDetalhe: TQuery;
    procedure gerarDraft;
    procedure criaPlanilha;
    procedure preencheExcelItens;
    procedure preencheExcelItensDetalhe;
    function getSqlDraftDanfeItens: String;
    function getSqlDraftDanfeItensDetalhe: String;

  public
    constructor Create;
    destructor Destroy; override;
  end;

  Tfrm_integracao_numerario_mattel = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    shpTitulo: TShape;
    lblTitulo: TLabel;
    Panel3: TPanel;
    dbgProcessos: TDBGrid;
    Panel4: TPanel;
    msk_nr_processo: TMaskEdit;
    lbl_nr_processo: TLabel;
    btn_co_processo: TSpeedButton;
    btnAdd: TSpeedButton;
    btn5: TSpeedButton;
    lbl_cd_produto: TLabel;
    btn_co_produto: TSpeedButton;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btnGeraPlanilha: TSpeedButton;
    btn_sair: TSpeedButton;
    cdsMain: TClientDataSet;
    cdsMainNR_PROCESSO: TStringField;
    dsMain: TDataSource;
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_processoClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btnGeraPlanilhaClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    IntegracaoNumerario: TIntegracaoNumerario;
    function AdicionaProcessoNaLista(const Processo: string): Boolean;
  public

    { Public declarations }
  end;


var
  frm_integracao_numerario_mattel: Tfrm_integracao_numerario_mattel;

implementation

uses PGGP001, PGSM018, PGSM010, PGSM024, PGFT024, GSMLIB, PGGP017, PGSM105,
  KrDialog,  KrQuery, KrFormat, KrUtil, MaskUtils;

{$R *.DFM}

procedure Tfrm_integracao_numerario_mattel.btn_co_unid_negClick(
  Sender: TObject);
begin
  if Sender Is TSpeedButton Then
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg, 1,msk_cd_unid_neg.Text)
  else
  if Sender Is TMaskEdit Then
    if Length(TMaskEdit(Sender).Text) > 1 then
      edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');
end;

procedure Tfrm_integracao_numerario_mattel.btn_co_produtoClick(
  Sender: TObject);
begin
  if Sender Is TSpeedButton Then
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto, 1, msk_cd_produto.Text)
  else
  if Sender Is TMaskEdit Then
    if Length(TMaskEdit(Sender).Text) > 1 then
      edt_nm_produto.Text := ConsultaLookUP('TPRODUTO', 'CD_PRODUTO', msk_cd_produto.Text, 'AP_PRODUTO');
end;

procedure Tfrm_integracao_numerario_mattel.msk_nr_processoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    btnAdd.click();
  end;

end;

procedure Tfrm_integracao_numerario_mattel.btn_co_processoClick(
  Sender: TObject);
var
  vListAux: TStringList;
  Ret: string;
begin
  if (msk_cd_unid_neg.Text = '') then
  begin
    MessageDlg('Unidade não informada.', mtWarning, [mbOK], 0);
    Exit;
  end;
  if (msk_cd_produto.Text = '') then
  begin
    MessageDlg('Produto não informado.', mtWarning, [mbOK], 0);
    Exit;
  end;

  vListAux := TStringList.Create;
  try
    vListAux.Text := 'SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, '+
                     '       PR.CD_SERVICO, G.NM_GRUPO, DT_ABERTURA '+
                     'FROM TPROCESSO   PR ( NOLOCK ) '+
                     'INNER JOIN TGRUPO G ( NOLOCK ) ON G.CD_GRUPO = PR.CD_GRUPO '+
                     'WHERE CD_PRODUTO      = ' + QuotedStr(msk_cd_produto.Text) +
                     '  AND CD_UNID_NEG     = ' + QuotedStr(msk_cd_unid_neg.Text) +
                     '  AND PR.CD_GRUPO   = ''B77'' ' +
                     '  AND PR.IN_CANCELADO = ' + QuotedStr('0');

    Ret := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_GRUPO', 'DT_ABERTURA'],['Processo', 'Serviço', 'Grupo', 'Data de Abertura'],'NR_PROCESSO',nil, Ret);
    if Ret <> '' then
       msk_nr_processo.text := ret;
     // AdicionaProcessoNaLista(msk_cd_unid_neg.Text + msk_cd_produto.Text + Ret);

//    msk_nr_processo.Clear;
  finally
    vListAux.Free;
  end;
end;

procedure Tfrm_integracao_numerario_mattel.btnAddClick(Sender: TObject);
begin
  if Length(msk_nr_processo.Text)>= 12 then
  begin
    if (msk_cd_unid_neg.Text = '') then
    begin
      MessageDlg('Unidade não informada.', mtWarning, [mbOK], 0);
      Exit;
    end;
    if (msk_cd_produto.Text = '') then
    begin
      MessageDlg('Produto não informado.', mtWarning, [mbOK], 0);
      Exit;
    end;
    if AdicionaProcessoNaLista(msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text) then
      msk_nr_processo.Clear;
  end;

end;

function Tfrm_integracao_numerario_mattel.AdicionaProcessoNaLista(const Processo: string): Boolean;
var
  Query: TLocalQuery;
  SQL: string;
begin
  Result := False;
  SQL := 'SELECT NR_PROCESSO FROM TPROCESSO P (NOLOCK) WHERE RTRIM(P.NR_PROCESSO) = :NR_PROCESSO ';

  Query := AutoQuery.Query;
  Query.SQL.Text := SQL;
  Query.ParamByName('NR_PROCESSO').AsString := Processo;
  Query.Open;
  if not Query.IsEmpty then
  begin
    Result := True;
    while not Query.Eof do
    begin
      cdsMain.Append;
      cdsMainNR_PROCESSO.AsString := Query.FieldByName('NR_PROCESSO').AsString;
      cdsMain.Post;
      Query.Next;
    end;
  end
  else
    MessageDlg('Não foi possível adicionar o processo na lista.', mtWarning, [mbOK], 0);
end;

procedure Tfrm_integracao_numerario_mattel.btn5Click(Sender: TObject);
begin
  if not cdsMain.eof then
    cdsMain.delete;
end;

procedure Tfrm_integracao_numerario_mattel.btnGeraPlanilhaClick(
  Sender: TObject);
var
  sprocessos: String;
begin
  if cdsMain.IsEmpty then
  begin
    MessageDlg('Não há processos na lista.', mtInformation, [mbOK], 0);
    Exit;
  end;

  sprocessos := '';
  cdsMain.first;
  while not cdsMain.eof do
  begin
    if sprocessos = '' then
      sprocessos := QuotedStr(cdsMain.fieldByName('NR_PROCESSO').asString)
    else
      sprocessos :=  sprocessos + ',' + QuotedStr(cdsMain.fieldByName('NR_PROCESSO').asString);
    cdsMain.next;      
  end;

  IntegracaoNumerario := TIntegracaoNumerario.Create;
  try
//    IntegracaoNumerario.numeroProcesso := '0101IM-000159-21';
    IntegracaoNumerario.Processos := sprocessos;
    IntegracaoNumerario.gerarDraft;
  finally
    IntegracaoNumerario.Free;
  end;
end;

procedure Tfrm_integracao_numerario_mattel.btn_sairClick(Sender: TObject);
begin
  Close;
end;


{ TIntegracaoNumerario }

constructor TIntegracaoNumerario.Create;
begin

  queryDraftDanfeItens := TQuery.Create(nil);
  queryDraftDanfeItens.DatabaseName := 'DBBROKER';

  queryDraftDanfeItensDetalhe := TQuery.Create(nil);
  queryDraftDanfeItensDetalhe.DatabaseName := 'DBBROKER';


end;

destructor TIntegracaoNumerario.Destroy;
begin
  queryDraftDanfeItens.Free;
  queryDraftDanfeItensDetalhe.Free;
  inherited;
end;

procedure TIntegracaoNumerario.gerarDraft;
var
  pastaPlanilha: String;

  procedure apagaArquivosExistentes(arquivo: String);
  begin
    if FileExists(arquivo) then
      DeleteFile(arquivo);
  end;
begin
  LinhaItem := 12;
  LinhaItemDetalhe := 12;
  pastaPlanilha := 'C:\DDBROKER\NOTA FISCAL\';

  queryDraftDanfeItens.SQL.Text := getSqlDraftDanfeItens;
//  queryDraftDanfeItens.paramByName('NR_PROCESSO').AsString := numeroProcesso ;
  queryDraftDanfeItens.Open;

  queryDraftDanfeItensDetalhe.SQL.Text := getSqlDraftDanfeItensDetalhe;
  queryDraftDanfeItensDetalhe.Open;

  try
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    nomePlanilha := 'NUMERARIO_MATTEL' + '.XLS';
    criaPlanilha;
    try
      queryDraftDanfeItens.First;
      while not queryDraftDanfeItens.Eof do
      begin
        preencheExcelItens;
        queryDraftDanfeItens.Next;
      end;


      queryDraftDanfeItensDetalhe.First;
      while not queryDraftDanfeItensDetalhe.Eof do
      begin
        preencheExcelItensDetalhe;
        queryDraftDanfeItensDetalhe.Next;
      end;


      
      apagaArquivosExistentes(pastaPlanilha + nomePlanilha);
      Excel.ActiveWorkBook.SaveAs(pastaPlanilha + nomePlanilha);
    finally
      Excel.Quit;
    end;



    Screen.Cursor := crDefault;
    Information( ' planilhas geradas com sucesso na pasta: ' + pastaPlanilha );
    Application.ProcessMessages;

  finally
    queryDraftDanfeItens.Close;
    queryDraftDanfeItensDetalhe.Close;
  end;
end;


procedure TIntegracaoNumerario.criaPlanilha;
begin
    try
      Excel := CreateOLEObject('Excel.Application');
      xlWorkB1 := Excel.Workbooks.Open('C:\ddbroker\MODELO NUMERARIO MATTEL.xls');
//      oSheet := Excel.WorkBooks[1].Worksheets[1];
//      Excel.Visible := True;
    except
      BoxMensagem('Erro na criação da Planilha. Verifique se a Planilha não está em uso ou se o Excel está aberto.',2) ;
      Exit;
    end;
end;

procedure TIntegracaoNumerario.preencheExcelItens;
var
  ColunaItem: Integer;

  function AddColuna: Integer;
  begin
    ColunaItem := ColunaItem + 1;
    result := ColunaItem;
  end;
begin
  ColunaItem := 2;
  Excel.WorkBooks[1].Worksheets[2].Cells[LinhaItem,ColunaItem].value := queryDraftDanfeItens.FieldByName('PROCESSO').AsString;
  Excel.WorkBooks[1].Worksheets[2].Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('PEDIDOS').AsString;
  Excel.WorkBooks[1].Worksheets[2].Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('VALOR').AsFloat;
  Inc(LinhaItem);

end;


procedure TIntegracaoNumerario.preencheExcelItensDetalhe;
var
  ColunaItemDetalhe: Integer;

  function AddColuna: Integer;
  begin
    ColunaItemDetalhe := ColunaItemDetalhe + 1;
    result := ColunaItemDetalhe;
  end;
begin
  ColunaItemDetalhe := 2;
  Excel.WorkBooks[1].Worksheets[3].Cells[LinhaItemDetalhe,ColunaItemDetalhe].value := queryDraftDanfeItensDetalhe.FieldByName('PROCESSO').AsString;
  Excel.WorkBooks[1].Worksheets[3].Cells[LinhaItemDetalhe,AddColuna].value := queryDraftDanfeItensDetalhe.FieldByName('PEDIDOS').AsString;
  Excel.WorkBooks[1].Worksheets[3].Cells[LinhaItemDetalhe,AddColuna].value := queryDraftDanfeItensDetalhe.FieldByName('DESPESA').AsString;
  Excel.WorkBooks[1].Worksheets[3].Cells[LinhaItemDetalhe,AddColuna].value := queryDraftDanfeItensDetalhe.FieldByName('VALOR').AsFloat;
  Inc(LinhaItemDetalhe);

end;

function TIntegracaoNumerario.getSqlDraftDanfeItens: String;
begin
  Result :=
  '  SELECT       DISTINCT                                                                                ' + #13#10 +
  '   SUBSTRING(TP.NR_PROCESSO,5,16) AS [PROCESSO]                                                        ' + #13#10 +
  '  ,CAST(STUFF(( SELECT DISTINCT '', '' + LTRIM(RTRIM(RC.CD_REFERENCIA))                                ' + #13#10 +
  '                 FROM BROKER.DBO.TREF_CLIENTE RC WITH (NOLOCK)                                         ' + #13#10 +
  '                           WHERE RC.NR_PROCESSO = TP.NR_PROCESSO FOR XML                               ' + #13#10 +
  '                                 PATH('''') ), 1, 1, '''') AS VARCHAR(200)) AS [PEDIDOS]               ' + #13#10 +
  '  ,(( DI.VL_TOTAL_FRETE_MN +                                                                           ' + #13#10 +
  '  (CASE                                                                                                ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''2143'' THEN 815                                                         ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''0009'' THEN 815                                                         ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''1884'' THEN 815                                                         ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''1877'' THEN 772                                                         ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''0624'' THEN 772                                                         ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''2569'' THEN 910                                                         ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''1977'' THEN 910                                                         ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''1864'' THEN 910                                                         ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''0225'' THEN 910                                                         ' + #13#10 +
  '  ELSE 1227 END) )                                                                                     ' + #13#10 +
  '  * 0.08 ) --AFRMM                                                                                     ' + #13#10 +
  '  + (CASE                                                                                              ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''2143'' THEN 815                                                         ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''0009'' THEN 815                                                         ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''1884'' THEN 815                                                         ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''1877'' THEN 772                                                         ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''0624'' THEN 772                                                         ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''2569'' THEN 910                                                         ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''1977'' THEN 910                                                         ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''1864'' THEN 910                                                         ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''0225'' THEN 910                                                         ' + #13#10 +
  '  ELSE 1227 END)  *  ( SELECT COUNT(NR_CNTR) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK)                ' + #13#10 +
  '              WHERE PC.NR_PROCESSO = TP.NR_PROCESSO )      --CAPATAZIAS                                ' + #13#10 +
  '  + (( SELECT COUNT(OA.NR_LI) FROM BROKER.DBO.TPROCESSO_LI_ORGAO_ANUENTE OA (NOLOCK)                   ' + #13#10 +
  '                     WHERE OA.CD_ORGAO_ANUENTE LIKE ''%INMETRO%'' AND OA.NR_PROCESSO =                 ' + #13#10 +
  '                                                     TP.NR_PROCESSO ) * 53.53) --INMETRO               ' + #13#10 +
  '  + CASE WHEN ( TP.VL_CIF_MN / ( SELECT COUNT(NR_CNTR) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK)      ' + #13#10 +
  '              WHERE PC.NR_PROCESSO = TP.NR_PROCESSO )  )                                               ' + #13#10 +
  '               * (0.286 / 100) < 930 THEN 930 *                                                        ' + #13#10 +
  '  ( SELECT COUNT(NR_CNTR) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK)                                   ' + #13#10 +
  '              WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ) ELSE                                             ' + #13#10 +
  ' ((( TP.VL_CIF_MN / ( SELECT COUNT(NR_CNTR) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK)                 ' + #13#10 +
  '      WHERE PC.NR_PROCESSO = TP.NR_PROCESSO )  )                                                       ' + #13#10 +
  '       * (0.286 / 100)) + 385 + 65 )                                                                   ' + #13#10 +
  '   * ( SELECT COUNT(NR_CNTR) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK)                                ' + #13#10 +
  '              WHERE PC.NR_PROCESSO = TP.NR_PROCESSO )    END --ARMAZENAGEM                             ' + #13#10 +
  '  + CASE WHEN ( SELECT COUNT(NR_CNTR) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK)                       ' + #13#10 +
  '              WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ) = 1 THEN                                         ' + #13#10 +
  '  ((( SUM(AI.VL_BASE_CALC_ICMS)  + (( DI.VL_TOTAL_FRETE_MN +                                           ' + #13#10 +
  ' (CASE                                                                                                 ' + #13#10 +
  '   WHEN TP.CD_TRANSPORTADOR = ''2143'' THEN 815                                                        ' + #13#10 +
  '   WHEN TP.CD_TRANSPORTADOR = ''0009'' THEN 815                                                        ' + #13#10 +
  '   WHEN TP.CD_TRANSPORTADOR = ''1884'' THEN 815                                                        ' + #13#10 +
  '   WHEN TP.CD_TRANSPORTADOR = ''1877'' THEN 772                                                        ' + #13#10 +
  '   WHEN TP.CD_TRANSPORTADOR = ''0624'' THEN 772                                                        ' + #13#10 +
  '   WHEN TP.CD_TRANSPORTADOR = ''2569'' THEN 910                                                        ' + #13#10 +
  '   WHEN TP.CD_TRANSPORTADOR = ''1977'' THEN 910                                                        ' + #13#10 +
  '   WHEN TP.CD_TRANSPORTADOR = ''1864'' THEN 910                                                        ' + #13#10 +
  '   WHEN TP.CD_TRANSPORTADOR = ''0225'' THEN 910                                                        ' + #13#10 +
  '  ELSE 1227 END) )  * 0.08 )  ) * 0.0002 )  + 2171.46 + 118.21 + 36.68 ) / 0.83  ELSE                  ' + #13#10 +
  '   (((SUM(AI.VL_BASE_CALC_ICMS) + (( DI.VL_TOTAL_FRETE_MN +                                            ' + #13#10 +
  '  (CASE                                                                                                ' + #13#10 +
  '   WHEN TP.CD_TRANSPORTADOR = ''2143'' THEN 815                                                        ' + #13#10 +
  '   WHEN TP.CD_TRANSPORTADOR = ''0009'' THEN 815                                                        ' + #13#10 +
  '   WHEN TP.CD_TRANSPORTADOR = ''1884'' THEN 815                                                        ' + #13#10 +
  '   WHEN TP.CD_TRANSPORTADOR = ''1877'' THEN 772                                                        ' + #13#10 +
  '   WHEN TP.CD_TRANSPORTADOR = ''0624'' THEN 772                                                        ' + #13#10 +
  '   WHEN TP.CD_TRANSPORTADOR = ''2569'' THEN 910                                                        ' + #13#10 +
  '   WHEN TP.CD_TRANSPORTADOR = ''1977'' THEN 910                                                        ' + #13#10 +
  '   WHEN TP.CD_TRANSPORTADOR = ''1864'' THEN 910                                                        ' + #13#10 +
  '   WHEN TP.CD_TRANSPORTADOR = ''0225'' THEN 910                                                        ' + #13#10 +
  '   ELSE 1227 END) )  * 0.08 )  ) * 0.0002 )  + 4342.92 + 236.42 + 36.68 ) / 0.83 END --TRANSPORTE      ' + #13#10 +
  '  AS [VALOR]                                                                                           ' + #13#10 +
  '  FROM BROKER.dbo.TPROCESSO TP (NOLOCK)                                                                ' + #13#10 +
  '  LEFT JOIN BROKER.dbo.TDECLARACAO_IMPORTACAO DI (NOLOCK) ON DI.NR_PROCESSO = TP.NR_PROCESSO           ' + #13#10 +
  '  LEFT JOIN BROKER.DBO.TADICAO_DE_IMPORTACAO AI (NOLOCK) ON AI.NR_PROCESSO = TP.NR_PROCESSO            ' + #13#10 +
//  '  WHERE TP.NR_PROCESSO IN (''0101IM-012197-23'',''0101IM-012199-23'',''0101IM-012200-23'',''0101IM-012551-23'') --:NR_PROCESSO    ';
  '  WHERE TP.NR_PROCESSO IN ('+Processos+')        ' + #13#10 +
  '  GROUP BY TP.NR_PROCESSO, DI.VL_TOTAL_FRETE_MN, TP.CD_TRANSPORTADOR, TP.VL_CIF_MN ';
//  '  WHERE TP.NR_PROCESSO = :NR_PROCESSO    ';
end;




function TIntegracaoNumerario.getSqlDraftDanfeItensDetalhe: String;
begin
  Result :=
  ' SELECT                                                  ' + #13#10 +
  ' SUBSTRING(TP.NR_PROCESSO,5,16) AS [PROCESSO]             ' + #13#10 +
  ' ,CAST(STUFF(( SELECT DISTINCT '', '' + LTRIM(RTRIM(RC.CD_REFERENCIA)) FROM BROKER.DBO.TREF_CLIENTE RC WITH (NOLOCK) ' + #13#10 +
  '  WHERE RC.NR_PROCESSO = TP.NR_PROCESSO FOR XML PATH('''') ), 1, 1, '''') AS VARCHAR(200)) AS [PEDIDOS]  ' + #13#10 +
  ' ,''AFRMM'' AS [DESPESA]                                                ' + #13#10 +
  '	,(( DI.VL_TOTAL_FRETE_MN +                                             ' + #13#10 +
  '    (CASE                                                               ' + #13#10 +
  '    WHEN TP.CD_TRANSPORTADOR = ''2143'' THEN 815                        ' + #13#10 +
  '    WHEN TP.CD_TRANSPORTADOR = ''0009'' THEN 815                        ' + #13#10 +
  '    WHEN TP.CD_TRANSPORTADOR = ''1884'' THEN 815                        ' + #13#10 +
  '    WHEN TP.CD_TRANSPORTADOR = ''1877'' THEN 772                        ' + #13#10 +
  '    WHEN TP.CD_TRANSPORTADOR = ''0624'' THEN 772                        ' + #13#10 +
  '    WHEN TP.CD_TRANSPORTADOR = ''2569'' THEN 910                        ' + #13#10 +
  '    WHEN TP.CD_TRANSPORTADOR = ''1977'' THEN 910                        ' + #13#10 +
  '    WHEN TP.CD_TRANSPORTADOR = ''1864'' THEN 910                        ' + #13#10 +
  '    WHEN TP.CD_TRANSPORTADOR = ''0225'' THEN 910                        ' + #13#10 +
  '    ELSE 1227 END) )                                                    ' + #13#10 +
  '    * 0.08 ) AS [VALOR]                                                 ' + #13#10 +
  '	FROM BROKER.dbo.TPROCESSO TP (NOLOCK)                                  ' + #13#10 +
  '    LEFT JOIN BROKER.dbo.TDECLARACAO_IMPORTACAO DI (NOLOCK) ON DI.NR_PROCESSO = TP.NR_PROCESSO     ' + #13#10 +
  '    WHERE TP.NR_PROCESSO IN ('+Processos+')                              ' + #13#10 +
  '	UNION ALL      ' + #13#10 +
  '	SELECT                                                                  ' + #13#10 +
  '     SUBSTRING(TP.NR_PROCESSO,5,16) AS [PROCESSO]                        ' + #13#10 +
  '  ,CAST(STUFF(( SELECT DISTINCT '', '' + LTRIM(RTRIM(RC.CD_REFERENCIA)) FROM BROKER.DBO.TREF_CLIENTE RC WITH (NOLOCK) ' + #13#10 +
  '  WHERE RC.NR_PROCESSO = TP.NR_PROCESSO FOR XML PATH('''') ), 1, 1, '''') AS VARCHAR(200)) AS [PEDIDOS]  ' + #13#10 +
  '    ,''CAPATAZIAS'' AS [DESPESA]                                         ' + #13#10 +
  '    , (CASE                                                              ' + #13#10 +
  '    WHEN TP.CD_TRANSPORTADOR = ''2143'' THEN 815                         ' + #13#10 +
  '    WHEN TP.CD_TRANSPORTADOR = ''0009'' THEN 815                         ' + #13#10 +
  '    WHEN TP.CD_TRANSPORTADOR = ''1884'' THEN 815                         ' + #13#10 +
  '    WHEN TP.CD_TRANSPORTADOR = ''1877'' THEN 772                         ' + #13#10 +
  '    WHEN TP.CD_TRANSPORTADOR = ''0624'' THEN 772                         ' + #13#10 +
  '    WHEN TP.CD_TRANSPORTADOR = ''2569'' THEN 910                         ' + #13#10 +
  '    WHEN TP.CD_TRANSPORTADOR = ''1977'' THEN 910                         ' + #13#10 +
  '    WHEN TP.CD_TRANSPORTADOR = ''1864'' THEN 910                         ' + #13#10 +
  '    WHEN TP.CD_TRANSPORTADOR = ''0225'' THEN 910                         ' + #13#10 +
  '    ELSE 1227 END) *  ( SELECT COUNT(NR_CNTR) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK)                ' + #13#10 +
  '              WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ) AS [VALOR]                                            ' + #13#10 +
  '	FROM BROKER.dbo.TPROCESSO TP (NOLOCK)                                   ' + #13#10 +
  '    LEFT JOIN BROKER.dbo.TDECLARACAO_IMPORTACAO DI (NOLOCK) ON DI.NR_PROCESSO = TP.NR_PROCESSO    ' + #13#10 +
  '    WHERE TP.NR_PROCESSO IN ('+Processos+')                               ' + #13#10 +
  '	UNION ALL          ' + #13#10 +
  '	SELECT              ' + #13#10 +
  ' SUBSTRING(TP.NR_PROCESSO,5,16) AS [PROCESSO]                               ' + #13#10 +
  '  ,CAST(STUFF(( SELECT DISTINCT '', '' + LTRIM(RTRIM(RC.CD_REFERENCIA)) FROM BROKER.DBO.TREF_CLIENTE RC WITH (NOLOCK) ' + #13#10 +
  '  WHERE RC.NR_PROCESSO = TP.NR_PROCESSO FOR XML PATH('''') ), 1, 1, '''') AS VARCHAR(200)) AS [PEDIDOS]  ' + #13#10 +
  '  ,''INMETRO'' AS [DESPESA]                                                         ' + #13#10 +
  '	, (( SELECT COUNT(OA.NR_LI) FROM BROKER.DBO.TPROCESSO_LI_ORGAO_ANUENTE OA (NOLOCK) ' + #13#10 +
  '     WHERE OA.CD_ORGAO_ANUENTE LIKE ''%INMETRO%'' AND OA.NR_PROCESSO = TP.NR_PROCESSO ) * 53.53) AS [VALOR] ' + #13#10 +
  '	FROM BROKER.dbo.TPROCESSO TP (NOLOCK)          ' + #13#10 +
  '    LEFT JOIN BROKER.dbo.TDECLARACAO_IMPORTACAO DI (NOLOCK) ON DI.NR_PROCESSO = TP.NR_PROCESSO    ' + #13#10 +
  '    WHERE TP.NR_PROCESSO IN ('+Processos+')        ' + #13#10 +
  '	UNION ALL           ' + #13#10 +
  '	SELECT               ' + #13#10 +
  '     SUBSTRING(TP.NR_PROCESSO,5,16) AS [PROCESSO]   ' + #13#10 +
  '  ,CAST(STUFF(( SELECT DISTINCT '', '' + LTRIM(RTRIM(RC.CD_REFERENCIA)) FROM BROKER.DBO.TREF_CLIENTE RC WITH (NOLOCK) ' + #13#10 +
  '  WHERE RC.NR_PROCESSO = TP.NR_PROCESSO FOR XML PATH('''') ), 1, 1, '''') AS VARCHAR(200)) AS [PEDIDOS]  ' + #13#10 +
  '	,''ARMAZENAGEM'' AS [DESPESA]                ' + #13#10 +
  '  , CASE WHEN ( TP.VL_CIF_MN / ( SELECT COUNT(NR_CNTR) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK)      ' + #13#10 +
  '              WHERE PC.NR_PROCESSO = TP.NR_PROCESSO )  )                                               ' + #13#10 +
  '               * (0.286 / 100) < 930 THEN 930 *                                                       ' + #13#10 +
  '  ( SELECT COUNT(NR_CNTR) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK)                                   ' + #13#10 +
  '              WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ) ELSE                                             ' + #13#10 +
  '  ((( TP.VL_CIF_MN / ( SELECT COUNT(NR_CNTR) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK)                 ' + #13#10 +
   '     WHERE PC.NR_PROCESSO = TP.NR_PROCESSO )  )                                                        ' + #13#10 +
  '       * (0.286 / 100)) + 385 + 65 )                            ' + #13#10 +
  '   * ( SELECT COUNT(NR_CNTR) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK)                                ' + #13#10 +
  '              WHERE PC.NR_PROCESSO = TP.NR_PROCESSO )    END  AS [VALOR] ' + #13#10 +
  '	FROM BROKER.dbo.TPROCESSO TP (NOLOCK)        ' + #13#10 +
  '    LEFT JOIN BROKER.dbo.TDECLARACAO_IMPORTACAO DI (NOLOCK) ON DI.NR_PROCESSO = TP.NR_PROCESSO   ' + #13#10 +
  '    WHERE TP.NR_PROCESSO IN ('+Processos+')     ' + #13#10 +
  '	UNION ALL           ' + #13#10 +
  '	SELECT               ' + #13#10 +
  ' SUBSTRING(TP.NR_PROCESSO,5,16) AS [PROCESSO]   ' + #13#10 +
  '  ,CAST(STUFF(( SELECT DISTINCT '', '' + LTRIM(RTRIM(RC.CD_REFERENCIA)) FROM BROKER.DBO.TREF_CLIENTE RC WITH (NOLOCK) ' + #13#10 +
  '  WHERE RC.NR_PROCESSO = TP.NR_PROCESSO FOR XML PATH('''') ), 1, 1, '''') AS VARCHAR(200)) AS [PEDIDOS]  ' + #13#10 +
  '	,''TRANSPORTE'' AS [DESPESA]             ' + #13#10 +
  ' , CASE WHEN ( SELECT COUNT(NR_CNTR) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK)            ' + #13#10 +
  '             WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ) = 1 THEN                              ' + #13#10 +
  '   ((( SUM(AI.VL_BASE_CALC_ICMS)  + (( DI.VL_TOTAL_FRETE_MN +                              ' + #13#10 +
  '   (CASE                                                                                   ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''2143'' THEN 815                                             ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''0009'' THEN 815                                             ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''1884'' THEN 815                                             ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''1877'' THEN 772                                             ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''0624'' THEN 772                                             ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''2569'' THEN 910                                             ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''1977'' THEN 910                                             ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''1864'' THEN 910                                             ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''0225'' THEN 910                                             ' + #13#10 +
  '  ELSE 1227 END) ) * 0.08 ) ) * 0.0002 )  + 2171.46 + 118.21 + 36.68 ) / 0.83              ' + #13#10 +
  '   ELSE                                                                                    ' + #13#10 +
  '   (((SUM(AI.VL_BASE_CALC_ICMS) +(( DI.VL_TOTAL_FRETE_MN +                                 ' + #13#10 +
  '  (CASE                                                                                    ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''2143'' THEN 815                                             ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''0009'' THEN 815                                             ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''1884'' THEN 815                                             ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''1877'' THEN 772                                             ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''0624'' THEN 772                                             ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''2569'' THEN 910                                             ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''1977'' THEN 910                                             ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''1864'' THEN 910                                             ' + #13#10 +
  '  WHEN TP.CD_TRANSPORTADOR = ''0225'' THEN 910                                             ' + #13#10 +
  '  ELSE 1227 END) ) * 0.08 ) ) * 0.0002 )  + 4342.92 + 236.42 + 36.68 ) / 0.83   END AS [VALOR]   ' + #13#10 +
  '	FROM BROKER.dbo.TPROCESSO TP (NOLOCK)          ' + #13#10 +
  '    LEFT JOIN BROKER.dbo.TDECLARACAO_IMPORTACAO DI (NOLOCK) ON DI.NR_PROCESSO = TP.NR_PROCESSO          ' + #13#10 +
  '    LEFT JOIN BROKER.DBO.TADICAO_DE_IMPORTACAO AI (NOLOCK) ON AI.NR_PROCESSO = TP.NR_PROCESSO           ' + #13#10 +
  '    WHERE TP.NR_PROCESSO IN ('+Processos+')                                                             ' + #13#10 +
  '   GROUP BY TP.NR_PROCESSO, DI.VL_TOTAL_FRETE_MN, TP.CD_TRANSPORTADOR          ';



end;



procedure Tfrm_integracao_numerario_mattel.FormCreate(Sender: TObject);
begin
  cdsMain.CreateDataSet;
  cdsMain.Open;
end;

end.
