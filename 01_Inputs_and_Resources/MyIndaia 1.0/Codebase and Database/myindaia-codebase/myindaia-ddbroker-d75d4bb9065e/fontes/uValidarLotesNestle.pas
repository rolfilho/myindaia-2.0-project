unit uValidarLotesNestle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, comobj,
  DBTables, ComCtrls, StrUtils, Provider, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, cxGridExportLink, ShellAPI;

type
  TfrmValidarLotesNestle = class(TForm)
    Panel1: TPanel;
    cdsPedido: TClientDataSet;
    dsPlanilha: TDataSource;
    OpenDialog1: TOpenDialog;
    Panel6: TPanel;
    edtCaminho: TEdit;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    btnImportar: TSpeedButton;
    Panel3: TPanel;
    btnImportarItens: TSpeedButton;
    btnSair: TSpeedButton;
    cdsPedidoID: TIntegerField;
    pgDados: TPageControl;
    tbsPlanilha: TTabSheet;
    Panel7: TPanel;
    lblTotalPlan: TLabel;
    tbsResultado: TTabSheet;
    qryLotesProcesso: TQuery;
    cdsPedidoFATURA: TStringField;
    cdsPedidoCONTAINER: TStringField;
    cdsPedidoPEDIDO: TStringField;
    cdsPedidoPRODUTO: TStringField;
    cdsPedidoLOTE: TStringField;
    cdsPedidoQUANTIDADE: TFloatField;
    cdsPedidoNR_PROCESSO: TStringField;
    cdsPlanilha: TClientDataSet;
    cdsPlanilhaID: TIntegerField;
    cdsPlanilhaFATURA: TStringField;
    cdsPlanilhaCONTAINER: TStringField;
    cdsPlanilhaPEDIDO: TStringField;
    cdsPlanilhaPRODUTO: TStringField;
    cdsPlanilhaLOTE: TStringField;
    cdsPlanilhaQUANTIDADE: TFloatField;
    cdsPlanilhaNR_PROCESSO: TStringField;
    cdsPlanilhaDATA_FABRICACAO: TStringField;
    cdsPlanilhaDATA_VENCIMENTO: TStringField;
    cdsPedidoDATA_VENCIMENTO: TStringField;
    cdsPedidoDATA_FABRICACAO: TStringField;
    qryTemp: TQuery;
    cdsPlanilhaINDICE: TStringField;
    cdsResultado: TClientDataSet;
    dsResultado: TDataSource;
    dspLotesProcesso: TDataSetProvider;
    cdsLotesProcesso: TClientDataSet;
    cdsResultadoFATURA: TStringField;
    cdsResultadoPEDIDO: TStringField;
    cdsResultadoPROCESSO: TStringField;
    cdsResultadoPRODUTO: TStringField;
    cdsResultadoLOTE: TStringField;
    cdsResultadoFABRICACAO_PLAN: TStringField;
    cdsResultadoVENCIMENTO_PLAN: TStringField;
    cdsResultadoQT_PLANILHA: TStringField;
    cdsResultadoQT_PROCESSO: TStringField;
    pnlMensagem: TPanel;
    cdsResultadoCONTAINER_PLANILHA: TStringField;
    cdsResultadoCONTAINER_PROCESSO: TStringField;
    cdsResultadoVENCIMENTO_PROC: TStringField;
    cdsResultadoFABRICACAO_PROC: TStringField;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1FATURA: TcxGridDBColumn;
    cxGrid1DBTableView1PEDIDO: TcxGridDBColumn;
    cxGrid1DBTableView1PROCESSO: TcxGridDBColumn;
    cxGrid1DBTableView1PRODUTO: TcxGridDBColumn;
    cxGrid1DBTableView1LOTE: TcxGridDBColumn;
    cxGrid1DBTableView1FABRICACAO_PLAN: TcxGridDBColumn;
    cxGrid1DBTableView1FABRICACAO_PROC: TcxGridDBColumn;
    cxGrid1DBTableView1VENCIMENTO_PLAN: TcxGridDBColumn;
    cxGrid1DBTableView1VENCIMENTO_PROC: TcxGridDBColumn;
    cxGrid1DBTableView1QT_PLANILHA: TcxGridDBColumn;
    cxGrid1DBTableView1QT_PROCESSO: TcxGridDBColumn;
    cxGrid1DBTableView1CONTAINER_PLANILHA: TcxGridDBColumn;
    cxGrid1DBTableView1CONTAINER_PROCESSO: TcxGridDBColumn;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1ID: TcxGridDBColumn;
    cxGridDBTableView1FATURA: TcxGridDBColumn;
    cxGridDBTableView1CONTAINER: TcxGridDBColumn;
    cxGridDBTableView1PEDIDO: TcxGridDBColumn;
    cxGridDBTableView1PRODUTO: TcxGridDBColumn;
    cxGridDBTableView1LOTE: TcxGridDBColumn;
    cxGridDBTableView1QUANTIDADE: TcxGridDBColumn;
    cxGridDBTableView1DATA_FABRICACAO: TcxGridDBColumn;
    cxGridDBTableView1DATA_VENCIMENTO: TcxGridDBColumn;
    cxGridDBTableView1NR_PROCESSO: TcxGridDBColumn;
    cdsResultadoMENSAGEM: TStringField;
    cxGrid1DBTableView1MENSAGEM: TcxGridDBColumn;
    Panel2: TPanel;
    btnExcel: TBitBtn;
    SaveDialog: TSaveDialog;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnImportarItensClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcelClick(Sender: TObject);

  private
    { Private declarations }

  procedure CarregarPlanilha;
  procedure ValidarProcessos;
  function BuscarProcesso(fatura : string) : String;
  function SqlBuscaProcesso : String;               
  function SqlBuscaLotesProcesso : String;
  function Distinct(CDS: TClientDataSet; FieldName: string): TStringList;
  procedure GeraExcel(var grid : TcxGrid);
  public
    { Public declarations }
  end;

var
  frmValidarLotesNestle: TfrmValidarLotesNestle;

implementation

uses
  ConsOnLineEx, PGGP017, GSMLIB;

{$R *.dfm}

procedure TfrmValidarLotesNestle.FormCreate(Sender: TObject);
begin
  cdsPlanilha.CreateDataSet;
  cdsPedido.CreateDataSet;
  cdsResultado.CreateDataSet;
  
  pgDados.ActivePage := tbsPlanilha;
end;

procedure TfrmValidarLotesNestle.SpeedButton1Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  edtCaminho.text := OpenDialog1.FileName;
end;

procedure TfrmValidarLotesNestle.btnImportarClick(
  Sender: TObject);
begin
  try
    btnImportarItens.enabled := false;
    pnlMensagem.visible      := false;
    pgDados.ActivePage       := tbsPlanilha;

    CarregarPlanilha;
  finally
    btnImportarItens.enabled := true;
  end;
end;

procedure TfrmValidarLotesNestle.CarregarPlanilha;
var
  vPlanilhaExcel, vSheet: OLEVariant;
  i, id: Integer;
begin
  vPlanilhaExcel := CreateOleObject('Excel.Application');
  try
    vPlanilhaExcel.Visible := False;
    vPlanilhaExcel.WorkBooks.Add(edtCaminho.text);
    vSheet := vPlanilhaExcel.Workbooks[1].WorkSheets[1];

    i  := 2;
    id := 0;
    cdsPlanilha.DisableControls;
    cdsPlanilha.EmptyDataSet;
    try
      while (vSheet.Cells[I, 1].Value   <> '') or
            (vSheet.Cells[I+1, 1].Value <> '') or
            (vSheet.Cells[I+2, 1].Value <> '') do
      begin
        if vSheet.Cells[i,1].value <> '' then
        begin
          inc(id);
          cdsPlanilha.Append;
          cdsPlanilhaid.value              := id;
          cdsPlanilhaFATURA.value          := vSheet.Cells[i,1].value;
          cdsPlanilhaCONTAINER.value       := vSheet.Cells[i,2].value;
          cdsPlanilhaPEDIDO.value          := vSheet.Cells[i,3].value;
          cdsPlanilhaPRODUTO.value         := vSheet.Cells[i,4].value;
          cdsPlanilhaPRODUTO.value         := StringReplace(TrimLeft(StringReplace(cdsPlanilhaPRODUTO.asstring
                                              , '0', ' ', [rfReplaceAll])), ' ', '0', [rfReplaceAll]);
          cdsPlanilhaLOTE.value            := vSheet.Cells[i,5].value;
          cdsPlanilhaQUANTIDADE.value      := vSheet.Cells[i,6].value;
          try
            cdsPlanilhaDATA_FABRICACAO.value := DateToStr(StrToDate(stringreplace(vSheet.Cells[i,7].value, '.', '/', [rfReplaceAll])));
          except
          end;
          try
            cdsPlanilhaDATA_VENCIMENTO.value := DateToStr(StrToDate(stringreplace(vSheet.Cells[i,8].value, '.', '/', [rfReplaceAll])));
          except
          end;
          cdsPlanilhaNR_PROCESSO.value     := BuscarProcesso(cdsPlanilhaFATURA.value);
          cdsPlanilhaINDICE.value          := trim(cdsPlanilhaFATURA.value)  + '|' +
                                              trim(cdsPlanilhaPEDIDO.value)  + '|' +
                                              trim(cdsPlanilhaNR_PROCESSO.value);
          cdsPlanilha.post;
        end;
        Inc(i, 1);
      end;
    finally
      cdsPlanilha.First;
      cdsPlanilha.EnableControls;
      lblTotalPlan.Caption := 'Total :' + inttostr(id);
    end;
  finally
    vPlanilhaExcel.WorkBooks.Close;
  end;
end;

function TfrmValidarLotesNestle.BuscarProcesso(fatura : string) : String;
begin
  result := 'Não Integrado';
  qryTemp.Close;
  qryTemp.Sql.text := SqlBuscaProcesso;
  qryTemp.ParamByName('CD_REFERENCIA').ParamType := ptInput;
  qryTemp.ParamByName('CD_REFERENCIA').DataType  := ftString;
  qryTemp.ParamByName('CD_REFERENCIA').value     := fatura;
  qryTemp.open;

  if qryTemp.recordCount > 0 then
    result := qryTemp.fieldByName('NR_PROCESSO').asstring;
end;

procedure TfrmValidarLotesNestle.btnImportarItensClick(Sender: TObject);
begin
  try
    pnlMensagem.visible := false;  
    cdsPlanilha.disableControls;
    pgDados.ActivePage := tbsResultado;

    ValidarProcessos;
  finally
    cdsPlanilha.enableControls;
  end;
end;

procedure TfrmValidarLotesNestle.ValidarProcessos;
var i : integer; listPedidos, listDadosProcesso : TStringList;
 qtLote : Double;
 pedido, faturaNestle, processo : String;
begin
  try
    cdsResultado.emptyDataSet;
    listDadosProcesso := TStringList.create;
    listPedidos       := Distinct(cdsPlanilha, 'INDICE');
    for i := 0 to listPedidos.Count -1 do
    begin
      listDadosProcesso.clear;
      ExtractStrings(['|'], [], Pchar(listPedidos[i]) ,listDadosProcesso);
      if listDadosProcesso.count = 3 then
      begin
        faturaNestle := listDadosProcesso[0];
        pedido       := listDadosProcesso[1];
        processo     := listDadosProcesso[2];

        if trim(listPedidos[i]) <> '' then
        begin
          qryLotesProcesso.Close;
          cdsLotesProcesso.close;
          qryLotesProcesso.Sql.text := SqlBuscaLotesProcesso;
          qryLotesProcesso.ParamByName('CD_FORNECIMENTO').ParamType := ptInput;
          qryLotesProcesso.ParamByName('CD_FORNECIMENTO').DataType  := ftString;
          qryLotesProcesso.ParamByName('CD_GRUPO').ParamType        := ptInput;
          qryLotesProcesso.ParamByName('CD_GRUPO').DataType         := ftString;
          qryLotesProcesso.ParamByName('CD_FORNECIMENTO').value     := pedido;
          qryLotesProcesso.ParamByName('CD_GRUPO').value            := '155';
          cdsLotesProcesso.open;

          if cdsLotesProcesso.recordCount > 0 then
          begin
            cdsPlanilha.Filtered := false;
            cdsPlanilha.filter   := 'PEDIDO = ' + QuotedStr(pedido);
            cdsPlanilha.Filtered := true;
            cdsPedido.CloneCursor(cdsPlanilha,False);

            cdsPlanilha.First;
            while not cdsPlanilha.eof do
            begin
              cdsPedido.Filtered := false;
              cdsPedido.filter   := '     PEDIDO  = ' + QuotedStr(pedido) +
                                    ' and PRODUTO = ' + QuotedStr(cdsPlanilhaPRODUTO.asstring) +
                                    ' and LOTE    = ' + QuotedStr(cdsPlanilhaLOTE.asstring)+
                                    //' and DATA_FABRICACAO = ' + QuotedStr(cdsPlanilhaDATA_FABRICACAO.asstring)+
                                    //' and DATA_VENCIMENTO = ' + QuotedStr(cdsPlanilhaDATA_VENCIMENTO.asstring)+
                                    ' and CONTAINER = ' + QuotedStr(cdsPlanilhaCONTAINER.asstring);

              cdsPedido.Filtered := true;

              qtLote := 0;
              cdsPedido.first;
              while not cdsPedido.eof do
              begin
                qtLote := qtLote + cdsPedidoQUANTIDADE.asfloat;
                cdsPedido.next;
              end;

              if cdsLotesProcesso.locate('CD_SKU;CD_LOTE;NR_CNTR',//'CD_SKU;CD_LOTE;DT_FABRICACAO;DT_VENCIMENTO;NR_CNTR',
                                         VarArrayOf([cdsPedidoPRODUTO.value,
                                                     cdsPedidoLOTE.value,
                                                    // cdsPedidoDATA_FABRICACAO.value,
                                                    // cdsPedidoDATA_VENCIMENTO.value,
                                                     cdsPedidoCONTAINER.asstring]),   {*******}
                                         [loCaseInsensitive])
                OR
                cdsLotesProcesso.locate('CD_SKU;CD_LOTE',//'CD_SKU;CD_LOTE;DT_FABRICACAO;DT_VENCIMENTO',
                                                         VarArrayOf([cdsPedidoPRODUTO.value,
                                                                     cdsPedidoLOTE.value//,
                                                                    // cdsPedidoDATA_FABRICACAO.value,
                                                                    // cdsPedidoDATA_VENCIMENTO.value
                                                                    ]),
                                                         [loCaseInsensitive])  then
              begin
                if (cdsLotesProcesso.FieldByName('QT_MERCADORIA').asFloat <> qtLote) or
                   ((trim(cdsPedidoCONTAINER.asstring) <> '') and (trim(cdsPedidoCONTAINER.asstring) <> cdsLotesProcesso.FieldByName('NR_CNTR').asstring)) or
                   (cdsLotesProcesso.FieldByName('DT_FABRICACAO').asstring <> cdsPedidoDATA_FABRICACAO.asstring) or
                   (cdsLotesProcesso.FieldByName('DT_VENCIMENTO').asstring <> cdsPedidoDATA_VENCIMENTO.asstring)  then
                begin
                  cdsResultado.append;
                  cdsResultado.FieldByName('FATURA').asstring      := faturaNestle;
                  cdsResultado.FieldByName('PEDIDO').asstring      := pedido;
                  cdsResultado.FieldByName('PROCESSO').asstring    := processo;
                  cdsResultado.FieldByName('PRODUTO').asstring     := cdsLotesProcesso.FieldByName('CD_SKU').asString + ' ' +
                                                                      cdsLotesProcesso.FieldByName('AP_MERCADORIA').asString;
                  cdsResultado.FieldByName('LOTE').asstring        := cdsLotesProcesso.FieldByName('CD_LOTE').asString;

                  if  (cdsLotesProcesso.FieldByName('QT_MERCADORIA').asFloat <> qtLote) then
                  begin
                    cdsResultado.FieldByName('QT_PLANILHA').asstring := FloatToStr(qtLote);
                    cdsResultado.FieldByName('QT_PROCESSO').asstring := cdsLotesProcesso.FieldByName('QT_MERCADORIA').asstring;
                    cdsResultado.FieldByName('MENSAGEM').asstring    := cdsResultado.FieldByName('MENSAGEM').asstring + ' ' + 'Qt. diferente.';
                  end;

                  if (trim(cdsPedidoDATA_FABRICACAO.asstring) <> '') and
                     (cdsLotesProcesso.FieldByName('DT_FABRICACAO').asstring <> cdsPedidoDATA_FABRICACAO.asstring) then
                  begin
                    cdsResultado.FieldByName('FABRICACAO_PLAN').asstring  := cdsPedidoDATA_FABRICACAO.asstring;
                    cdsResultado.FieldByName('FABRICACAO_PROC').asstring  := cdsLotesProcesso.FieldByName('DT_FABRICACAO').asString;
                    cdsResultado.FieldByName('MENSAGEM').asstring    := cdsResultado.FieldByName('MENSAGEM').asstring + ' ' + 'Fabricação diferente.';
                  end;

                  if (trim(cdsPedidoDATA_VENCIMENTO.asstring) <> '') and
                     (cdsLotesProcesso.FieldByName('DT_VENCIMENTO').asstring <> cdsPedidoDATA_VENCIMENTO.asstring)  then
                  begin
                    cdsResultado.FieldByName('VENCIMENTO_PLAN').asstring  := cdsPedidoDATA_VENCIMENTO.asstring;
                    cdsResultado.FieldByName('VENCIMENTO_PROC').asstring  := cdsLotesProcesso.FieldByName('DT_VENCIMENTO').asString;
                    cdsResultado.FieldByName('MENSAGEM').asstring    := cdsResultado.FieldByName('MENSAGEM').asstring + ' ' + 'Vencimento diferente.';
                  end;

                  if (trim(cdsPedidoCONTAINER.asstring) <> '') and
                     (trim(cdsPedidoCONTAINER.asstring) <> cdsLotesProcesso.FieldByName('NR_CNTR').asstring) then
                  begin
                    cdsResultado.FieldByName('CONTAINER_PLANILHA').asstring := trim(cdsPedidoCONTAINER.asstring);
                    cdsResultado.FieldByName('CONTAINER_PROCESSO').asstring := cdsLotesProcesso.FieldByName('NR_CNTR').asstring;
                    cdsResultado.FieldByName('MENSAGEM').asstring    := cdsResultado.FieldByName('MENSAGEM').asstring + ' ' + 'Container diferente.';                    
                  end;

                  cdsResultado.post;
                end;
              end
              else
              begin
                cdsResultado.append;
                cdsResultado.FieldByName('FATURA').asstring              := faturaNestle;
                cdsResultado.FieldByName('PEDIDO').asstring              := pedido;
                cdsResultado.FieldByName('PROCESSO').asstring            := processo;
                cdsResultado.FieldByName('PRODUTO').asstring             := cdsPedidoPRODUTO.value;
                cdsResultado.FieldByName('LOTE').asstring                := cdsPedidoLOTE.value;
                cdsResultado.FieldByName('QT_PLANILHA').asstring         := FloatToStr(qtLote);
                cdsResultado.FieldByName('FABRICACAO_PROC').asstring     := cdsPedidoDATA_FABRICACAO.asstring;
                cdsResultado.FieldByName('VENCIMENTO_PROC').asstring     := cdsPedidoDATA_VENCIMENTO.asstring;
                cdsResultado.FieldByName('CONTAINER_PLANILHA').asstring  := trim(cdsPedidoCONTAINER.asstring);
                cdsResultado.FieldByName('MENSAGEM').asstring            := 'Lote x Mercadoria não existe no MyIndaiá.';

                cdsResultado.post;
              end;
              cdsPlanilha.next;
            end;

            //Verifica se existe alguma coisa no banco que nao veio na planilha
            cdsLotesProcesso.first;
            while not cdsLotesProcesso.eof do
            begin
              if not cdsPlanilha.locate('PEDIDO;PRODUTO;LOTE',//'PEDIDO;PRODUTO;LOTE;DATA_FABRICACAO;DATA_VENCIMENTO',
                                  VarArrayOf([cdsLotesProcesso.FieldByName('CD_FORNECIMENTO').asString ,
                                              cdsLotesProcesso.FieldByName('CD_SKU').asString ,
                                              cdsLotesProcesso.FieldByName('CD_LOTE').asString//,
                                             // cdsLotesProcesso.FieldByName('DT_FABRICACAO').asString,
                                             // cdsLotesProcesso.FieldByName('DT_VENCIMENTO').asString
                                              ]),
                                 [loCaseInsensitive]) then
              begin
                cdsResultado.append;
                cdsResultado.FieldByName('FATURA').asstring          := faturaNestle;
                cdsResultado.FieldByName('PEDIDO').asstring          := pedido;
                cdsResultado.FieldByName('PROCESSO').asstring        := processo;
                cdsResultado.FieldByName('PRODUTO').asstring         := cdsLotesProcesso.FieldByName('CD_SKU').asString + ' ' +
                                                                        cdsLotesProcesso.FieldByName('AP_MERCADORIA').asString;
                cdsResultado.FieldByName('LOTE').asstring            := cdsLotesProcesso.FieldByName('CD_LOTE').asString;
                cdsResultado.FieldByName('FABRICACAO_PROC').asstring := cdsLotesProcesso.FieldByName('DT_FABRICACAO').asString;
                cdsResultado.FieldByName('VENCIMENTO_PROC').asstring := cdsLotesProcesso.FieldByName('DT_VENCIMENTO').asString;
                cdsResultado.FieldByName('QT_PROCESSO').asstring     := cdsLotesProcesso.FieldByName('QT_MERCADORIA').asstring;
                cdsResultado.FieldByName('MENSAGEM').asstring        := 'Lote x Mercadoria não existe na planilha';
                cdsResultado.post;
              end;
              cdsLotesProcesso.next;
            end;
          end
          else
          begin
            cdsResultado.append;
            cdsResultado.FieldByName('FATURA').asstring   := faturaNestle;
            cdsResultado.FieldByName('PEDIDO').asstring   := pedido;
            cdsResultado.FieldByName('PROCESSO').asstring := processo;            
            cdsResultado.FieldByName('MENSAGEM').asstring := 'Pedido não existe no MyIndaiá.';
            cdsResultado.post;
          end;
        end;

        cdsPlanilha.filter   := '';
        cdsPlanilha.filtered := false;
      end;
    end;
    if cdsResultado.recordCount = 0 then
      pnlMensagem.visible := true;
  finally
    listDadosProcesso.free;
    listPedidos.free;
  end;
end;

function TfrmValidarLotesNestle.SqlBuscaProcesso : String;
begin
  result := ' SELECT NR_PROCESSO                        ' + slinebreak +
            '   FROM TREF_CLIENTE (NOLOCK)              ' + slinebreak +
            '  WHERE CD_REFERENCIA = :CD_REFERENCIA     ' + slinebreak +
            '    AND TP_REFERENCIA = ''08''             ';
end;

function TfrmValidarLotesNestle.SqlBuscaLotesProcesso : String;
begin
  result := '   SELECT A.CD_FORNECIMENTO,                                                       '+ slinebreak +
            '          SUM(A.QT_MERCADORIA) AS QT_MERCADORIA,                                   '+ slinebreak +
            '          REPLACE(LTRIM(REPLACE(A.CD_SKU, ''0'', '' '')), '' '', ''0'') AS CD_SKU, '+ slinebreak +
            '          D.AP_MERCADORIA,                                                         '+ slinebreak +
            '          A.CD_LOTE,                                                               '+ slinebreak +
            '          CONVERT(VARCHAR(10),A.DT_FABRICACAO, 103)  AS  DT_FABRICACAO,            '+ slinebreak +
            '          CONVERT(VARCHAR(10),A.DT_VENCIMENTO, 103)  AS  DT_VENCIMENTO,            '+ slinebreak +
            '          ISNULL(B.NR_CNTR,'''')                     AS  NR_CNTR                   '+ slinebreak +
            '   FROM TRAP_FORNECIMENTO_LOTE A (NOLOCK)                                          '+ slinebreak +
            '   JOIN TPROCESSO_EXP_PEDIDO   B (NOLOCK) ON B.NR_FATURA     = A.CD_FORNECIMENTO   '+ slinebreak +
            '   JOIN TPROCESSO              C (NOLOCK) ON C.NR_PROCESSO   = B.NR_PROCESSO       '+ slinebreak +
            '                                         AND C.CD_GRUPO      = A.CD_GRUPO          '+ slinebreak +
            '   LEFT                                                                            '+ slinebreak +
            '   JOIN TMERCADORIA_EXP        D (NOLOCK) ON D.CD_MERCADORIA = A.CD_SKU            '+ slinebreak +
            '                                         AND D.CD_GRUPO      = A.CD_GRUPO          '+ slinebreak +
            '  WHERE CD_FORNECIMENTO = :CD_FORNECIMENTO                                         '+ slinebreak +
            '    AND A.CD_GRUPO      = :CD_GRUPO                                                '+ slinebreak +
            '    GROUP BY                                                                       '+ slinebreak +
            '         A.CD_FORNECIMENTO,                                                        '+ slinebreak +
            '         A.CD_SKU,                                                                 '+ slinebreak +
            '         D.AP_MERCADORIA,                                                          '+ slinebreak +
            '         A.CD_LOTE,                                                                '+ slinebreak +
            '         A.DT_FABRICACAO,                                                          '+ slinebreak +
            '         A.DT_VENCIMENTO,                                                          '+ slinebreak +
            '         ISNULL(B.NR_CNTR,'''')                                                    ';
end;

function TfrmValidarLotesNestle.Distinct(CDS: TClientDataSet; FieldName: string): TStringList;
var
  Clone: TClientDataSet;
begin
  Result := TStringList.Create;
  Clone  := TClientDataSet.Create(nil);
  try
    Clone.CloneCursor(CDS,False);
    Clone.IndexFieldNames := FieldName;
    Clone.First;
    while not Clone.Eof do
    begin
      if Result.IndexOf( Clone.FieldByName(FieldName).AsString ) < 0 then
        Result.Add(Clone.FieldByName(FieldName).AsString);

      Clone.Next;
    end;
  finally
    Clone.Destroy;
  end;
end;

procedure TfrmValidarLotesNestle.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmValidarLotesNestle.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsPlanilha.close;
  cdsPedido.close;
  cdsResultado.close;
  cdsLotesProcesso.close;
end;

procedure TfrmValidarLotesNestle.btnExcelClick(Sender: TObject);
begin
  GeraExcel(cxGrid1);
end;

procedure TfrmValidarLotesNestle.GeraExcel(var grid : TcxGrid);
var
  FileExt: String;
begin
  SaveDialog.Filter := 'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt:= 'xls';

  if SaveDialog.Execute then
  begin
    FileExt := LowerCase(ExtractFileExt(SaveDialog.FileName));
    if FileExt = '.xls' then
          ExportGridToExcel(SaveDialog.FileName, grid, False, True, False)
    else
    if FileExt = '.xml' then
          ExportGridToXML(SaveDialog.FileName, grid, False)
    else
    if FileExt = '.txt' then
          ExportGridToText(SaveDialog.FileName, grid, False)
    else
    if FileExt = '.html' then
          ExportGridToHTML(SaveDialog.FileName, grid, False);

    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;


end.




