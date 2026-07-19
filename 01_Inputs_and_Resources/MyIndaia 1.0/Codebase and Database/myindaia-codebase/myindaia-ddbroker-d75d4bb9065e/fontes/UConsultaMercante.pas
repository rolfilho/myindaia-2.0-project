unit UConsultaMercante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Grids, DBGrids, DBXpress, FMTBcd,
  DB, DBClient, Provider, SqlExpr, Buttons, Mask, DateUtils, ComCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, cxGridExportLink, cxTextEdit;

type
  TfrmConsultaMercante = class(TForm)
    pnlFundo: TPanel;
    pnlTopo: TPanel;
    pnlGrid: TPanel;
    pnlBottom: TPanel;
    btnTerceiros: TButton;
    qryGrupo: TSQLQuery;
    strngfldqry1CD_GRUPO: TStringField;
    strngfldqry1NM_GRUPO: TStringField;
    dspGrupo: TDataSetProvider;
    cdsGrupo: TClientDataSet;
    strngfldGrupoCD_GRUPO: TStringField;
    strngfldGrupoNM_GRUPO: TStringField;
    dsGrupo: TDataSource;
    qryEmpresa: TSQLQuery;
    qryEmpresaCD_EMPRESA: TStringField;
    qryEmpresaNM_EMPRESA: TStringField;
    dspEmpresa: TDataSetProvider;
    cdsEmpresa: TClientDataSet;
    cdsEmpresaCD_EMPRESA: TStringField;
    cdsEmpresaNM_EMPRESA: TStringField;
    dsEmpresa: TDataSource;
    cdsCarregamento: TClientDataSet;
    dspCarregamento: TDataSetProvider;
    dsCarregamento: TDataSource;
    qryCarregamento: TSQLQuery;
    qryCarregamentoDS_PORTO_CARREGAMENTO: TStringField;
    cdsCarregamentoDS_PORTO_CARREGAMENTO: TStringField;
    qryDescarregamento: TSQLQuery;
    dspDescarregamento: TDataSetProvider;
    cdsDescarregamento: TClientDataSet;
    dsDescarregamento: TDataSource;
    qryDescarregamentoDS_PORTO_DESCARREGAMENTO: TStringField;
    cdsDescarregamentoDS_PORTO_DESCARREGAMENTO: TStringField;
    qryDados: TSQLQuery;
    dspDados: TDataSetProvider;
    cdsDados: TClientDataSet;
    dsDados: TDataSource;
    qryDadosDT_CONSULTA: TSQLTimeStampField;
    qryDadosCD_GRUPO: TStringField;
    qryDadosNM_GRUPO: TStringField;
    qryDadosCD_EMPRESA: TStringField;
    qryDadosNM_EMPRESA: TStringField;
    qryDadosNR_CE_MERCANTE: TStringField;
    qryDadosNR_BL: TStringField;
    qryDadosNR_MANIFESTO: TStringField;
    qryDadosCD_EMBARCACAO: TStringField;
    qryDadosDS_EMBARCACAO: TStringField;
    qryDadosDS_PORTO_CARREGAMENTO: TStringField;
    qryDadosDS_PORTO_DESCARREGAMENTO: TStringField;
    cdsDadosDT_CONSULTA: TSQLTimeStampField;
    cdsDadosCD_GRUPO: TStringField;
    cdsDadosNM_GRUPO: TStringField;
    cdsDadosCD_EMPRESA: TStringField;
    cdsDadosNM_EMPRESA: TStringField;
    cdsDadosNR_CE_MERCANTE: TStringField;
    cdsDadosNR_BL: TStringField;
    cdsDadosNR_MANIFESTO: TStringField;
    cdsDadosCD_EMBARCACAO: TStringField;
    cdsDadosDS_EMBARCACAO: TStringField;
    cdsDadosDS_PORTO_CARREGAMENTO: TStringField;
    cdsDadosDS_PORTO_DESCARREGAMENTO: TStringField;
    qryDadosCGC_EMPRESA: TStringField;
    cdsDadosCGC_EMPRESA: TStringField;
    qryDadosIC_STATUS: TStringField;
    cdsDadosIC_STATUS: TStringField;
    qryDadosCD_DADOS_CON_SITE_TER: TIntegerField;
    cdsDadosCD_DADOS_CON_SITE_TER: TIntegerField;
    pnlFiltros: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cbGrupo: TDBLookupComboBox;
    cbPortoCarregamento: TDBLookupComboBox;
    cbPortoDescarregamento: TDBLookupComboBox;
    edtNumeroBL: TEdit;
    edtNrMercante: TEdit;
    cbEmpresa: TDBLookupComboBox;
    edrQtRegistros: TEdit;
    btnPesquisar: TBitBtn;
    edtGrupo: TEdit;
    edtEmpresa: TEdit;
    lblResultados: TLabel;
    rgStatus: TRadioGroup;
    qryDadosIC_STATUS_DESC: TStringField;
    cdsDadosIC_STATUS_DESC: TStringField;
    btnBlsCadastrados: TButton;
    pnlBlsEncontrados: TPanel;
    Panel3: TPanel;
    Label9: TLabel;
    btn_sair: TSpeedButton;
    sgrdBlsEncontrados: TStringGrid;
    qryVerifica: TSQLQuery;
    dspVerifica: TDataSetProvider;
    cdsVerifica: TClientDataSet;
    dsVerifica: TDataSource;
    qryDadosNM_NOTIFY_IDENTIFICACAO: TStringField;
    qryDadosNM_NOTIFY_CNPJ: TStringField;
    cdsDadosNM_NOTIFY_IDENTIFICACAO: TStringField;
    cdsDadosNM_NOTIFY_CNPJ: TStringField;
    edtDataConsultaInicial: TMaskEdit;
    edtDataConsultaFinal: TMaskEdit;
    lblDataConsulta: TLabel;
    edtDataOperacaoInicial: TMaskEdit;
    edtDataOperacaoFinal: TMaskEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    qryDadosDT_OPERACAO: TSQLTimeStampField;
    cdsDadosDT_OPERACAO: TSQLTimeStampField;
    pgcDados: TPageControl;
    tbTerceiros: TTabSheet;
    tbDivergenciaData: TTabSheet;
    qryDadosNR_PROCESSO: TStringField;
    qryDadosDT_OPERACAO_BROKER: TSQLTimeStampField;
    cdsDadosNR_PROCESSO: TStringField;
    cdsDadosDT_OPERACAO_BROKER: TSQLTimeStampField;
    dspDadosDivergencias: TDataSetProvider;
    qryDadosDivergencias: TSQLQuery;
    cdsDadosDivergencias: TClientDataSet;
    dsDadosDivergencias: TDataSource;
    qryDadosDivergenciasCD_DADOS_CON_SITE_TER: TIntegerField;
    qryDadosDivergenciasDT_CONSULTA: TSQLTimeStampField;
    qryDadosDivergenciasCD_GRUPO: TStringField;
    qryDadosDivergenciasNM_GRUPO: TStringField;
    qryDadosDivergenciasCD_EMPRESA: TStringField;
    qryDadosDivergenciasNM_EMPRESA: TStringField;
    qryDadosDivergenciasNR_CE_MERCANTE: TStringField;
    qryDadosDivergenciasNR_BL: TStringField;
    qryDadosDivergenciasNR_MANIFESTO: TStringField;
    qryDadosDivergenciasDT_OPERACAO: TSQLTimeStampField;
    qryDadosDivergenciasCD_EMBARCACAO: TStringField;
    qryDadosDivergenciasDS_EMBARCACAO: TStringField;
    qryDadosDivergenciasDS_PORTO_CARREGAMENTO: TStringField;
    qryDadosDivergenciasDS_PORTO_DESCARREGAMENTO: TStringField;
    qryDadosDivergenciasIC_STATUS: TStringField;
    qryDadosDivergenciasCGC_EMPRESA: TStringField;
    qryDadosDivergenciasIC_STATUS_DESC: TStringField;
    qryDadosDivergenciasNM_NOTIFY_IDENTIFICACAO: TStringField;
    qryDadosDivergenciasNM_NOTIFY_CNPJ: TStringField;
    qryDadosDivergenciasNR_PROCESSO: TStringField;
    qryDadosDivergenciasDT_OPERACAO_BROKER: TSQLTimeStampField;
    cdsDadosDivergenciasCD_DADOS_CON_SITE_TER: TIntegerField;
    cdsDadosDivergenciasDT_CONSULTA: TSQLTimeStampField;
    cdsDadosDivergenciasCD_GRUPO: TStringField;
    cdsDadosDivergenciasNM_GRUPO: TStringField;
    cdsDadosDivergenciasCD_EMPRESA: TStringField;
    cdsDadosDivergenciasNM_EMPRESA: TStringField;
    cdsDadosDivergenciasNR_CE_MERCANTE: TStringField;
    cdsDadosDivergenciasNR_BL: TStringField;
    cdsDadosDivergenciasNR_MANIFESTO: TStringField;
    cdsDadosDivergenciasDT_OPERACAO: TSQLTimeStampField;
    cdsDadosDivergenciasCD_EMBARCACAO: TStringField;
    cdsDadosDivergenciasDS_EMBARCACAO: TStringField;
    cdsDadosDivergenciasDS_PORTO_CARREGAMENTO: TStringField;
    cdsDadosDivergenciasDS_PORTO_DESCARREGAMENTO: TStringField;
    cdsDadosDivergenciasIC_STATUS: TStringField;
    cdsDadosDivergenciasCGC_EMPRESA: TStringField;
    cdsDadosDivergenciasIC_STATUS_DESC: TStringField;
    cdsDadosDivergenciasNM_NOTIFY_IDENTIFICACAO: TStringField;
    cdsDadosDivergenciasNM_NOTIFY_CNPJ: TStringField;
    cdsDadosDivergenciasNR_PROCESSO: TStringField;
    cdsDadosDivergenciasDT_OPERACAO_BROKER: TSQLTimeStampField;
    qryDadosNM_TERMINAL_DESCARGA: TStringField;
    cdsDadosNM_TERMINAL_DESCARGA: TStringField;
    btnExcel: TBitBtn;
    SaveDialog: TSaveDialog;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    cxGridDBTableView1DT_CONSULTA: TcxGridDBColumn;
    cxGridDBTableView1CD_GRUPO: TcxGridDBColumn;
    cxGridDBTableView1NM_GRUPO: TcxGridDBColumn;
    cxGridDBTableView1CGC_EMPRESA: TcxGridDBColumn;
    cxGridDBTableView1NR_CE_MERCANTE: TcxGridDBColumn;
    cxGridDBTableView1NR_BL: TcxGridDBColumn;
    cxGridDBTableView1NR_MANIFESTO: TcxGridDBColumn;
    cxGridDBTableView1DS_EMBARCACAO: TcxGridDBColumn;
    cxGridDBTableView1DS_PORTO_CARREGAMENTO: TcxGridDBColumn;
    cxGridDBTableView1DS_PORTO_DESCARREGAMENTO: TcxGridDBColumn;
    cxGridDBTableView1NM_NOTIFY_IDENTIFICACAO: TcxGridDBColumn;
    cxGridDBTableView1NM_NOTIFY_CNPJ: TcxGridDBColumn;
    cxGridDBTableView1DT_OPERACAO: TcxGridDBColumn;
    cxGridDBTableView1NM_TERMINAL_DESCARGA: TcxGridDBColumn;
    cxGridDBTableView1IC_STATUS: TcxGridDBColumn;
    cxGrid1: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    cxGridDBTableView2DT_CONSULTA: TcxGridDBColumn;
    cxGridDBTableView2CD_GRUPO: TcxGridDBColumn;
    cxGridDBTableView2NR_CE_MERCANTE: TcxGridDBColumn;
    cxGridDBTableView2NR_BL: TcxGridDBColumn;
    cxGridDBTableView2NR_MANIFESTO: TcxGridDBColumn;
    cxGridDBTableView2DS_EMBARCACAO: TcxGridDBColumn;
    cxGridDBTableView2DS_PORTO_CARREGAMENTO: TcxGridDBColumn;
    cxGridDBTableView2DS_PORTO_DESCARREGAMENTO: TcxGridDBColumn;
    cxGridDBTableView2DT_OPERACAO: TcxGridDBColumn;
    cxGridDBTableView2NR_PROCESSO: TcxGridDBColumn;
    cxGridDBTableView2DT_OPERACAO_BROKER: TcxGridDBColumn;
    cxGridDBTableView2NM_GRUPO: TcxGridDBColumn;
    cxGridDBTableView2CGC_EMPRESA: TcxGridDBColumn;
    cxGrid2: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    cdsDadosDetail: TClientDataSet;
    dsDadosDetail: TDataSource;
    qryDadosDS_CPF_CNPJ_CONSIGNATARIO: TStringField;
    qryDadosDS_MERCADORIA: TStringField;
    qryDadosDS_OBSERVACOES: TStringField;
    cdsDadosDS_MERCADORIA: TStringField;
    cdsDadosDS_OBSERVACOES: TStringField;
    cdsDadosDS_CPF_CNPJ_CONSIGNATARIO: TStringField;
    cxGridDBTableView1DS_CPF_CNPJ_CONSIGNATARIO: TcxGridDBColumn;
    cxGridDBTableView1DS_OBSERVACOES: TcxGridDBColumn;
    cxGridDBTableView1DS_MERCADORIA: TcxGridDBColumn;
    cxGridDBTableView3DS_DETALHAMENTO: TcxGridDBColumn;
    cdsDadosDetailDS_DETALHAMENTO: TStringField;
    qryDadosDS_DETALHAMENTO: TStringField;
    qryDadosDS_DETALHAMENTO_QUEBRA_ITEM: TStringField;
    cdsDadosDS_DETALHAMENTO: TStringField;
    cdsDadosDS_DETALHAMENTO_QUEBRA_ITEM: TStringField;
    cxDetalhamento: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure edrQtRegistrosKeyPress(Sender: TObject; var Key: Char);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtGrupoExit(Sender: TObject);
    procedure edtEmpresaExit(Sender: TObject);
    procedure cbGrupoExit(Sender: TObject);
    procedure cbEmpresaExit(Sender: TObject);
    procedure cbGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbEmpresaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbPortoCarregamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbPortoDescarregamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbGrupoCloseUp(Sender: TObject);
    procedure cbEmpresaCloseUp(Sender: TObject);
    procedure edtGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEmpresaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnTerceirosClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rgStatusClick(Sender: TObject);
    procedure btnBlsCadastradosClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure dbgDadosTitleClick(Column: TColumn);
    procedure pgcDadosChange(Sender: TObject);
    procedure dbgDivergenciasTitleClick(Column: TColumn);
    procedure btnExcelClick(Sender: TObject);
    procedure cxGridDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cdsDadosAfterScroll(DataSet: TDataSet);

  private
    { Private declarations }
  function GetSqlDados : String;
  function GetSqlPortoDescarregamento : String;
  function GetSqlPortoCarregamento : String;
  function GetSqlGrupo: String;
  function GetSqlEmpresa : String;
  procedure Filtrar;
  procedure PreencherCodigoGrupo;
  procedure PreencherCodigoEmpresa;
  procedure BuscarCodigoEmpresa;
  procedure BuscarCodigoGrupo;
  procedure GeraExcel(var grid : TcxGrid);

  public
    { Public declarations }
  end;

var
  frmConsultaMercante: TfrmConsultaMercante;

implementation

uses ShellAPI, PGGP017;

{$R *.dfm}

procedure TfrmConsultaMercante.FormCreate(Sender: TObject);
begin
  cdsDadosDetail.CreateDataSet;
  pgcDados.ActivePageIndex    := 0;
  edtDataConsultaInicial.text := formatDateTime('dd/mm/yyyy', incDay(now, -1));
  edtDataConsultaFinal.text   := formatDateTime('dd/mm/yyyy', now);

  qryDescarregamento.SQL.text := GetSqlPortoDescarregamento;
  qryCarregamento.SQL.text    := GetSqlPortoCarregamento;
  qryGrupo.sql.Text           := GetSqlGrupo;
  qryEmpresa.SQL.Text         := GetSqlEmpresa;

  cdsDescarregamento.Open;
  cdsCarregamento.Open;
  cdsGrupo.Open;
  cdsEmpresa.Open;

  cbEmpresa.keyvalue := '';

  Filtrar;

end;

function TfrmConsultaMercante.GetSqlDados : String ;
var Qt_Registros :String;
    Sql :string;
begin
   if edrQtRegistros.Text <> '' then
    Qt_Registros := edrQtRegistros.Text
   else
    Qt_Registros := '100';

{    Status mercante
     0 = CONSULTADO
     1 = TERCEIROS
     2 = CADASTRADO NO BROKER
     3 = BL CADASTRADO NO SISTEMA, MAS COM DATA DE OPERAÇÃO DIFERENTE
 }

   Sql    :=  '   SELECT TOP ' + Qt_Registros                                                                                     + sLineBreak +
              '           A.CD_DADOS_CON_SITE_TER,                                                                              ' + sLineBreak +
              '           A.DT_CONSULTA,                                                                                        ' + sLineBreak +
              '   	      A.CD_GRUPO,                                                                                           ' + sLineBreak +
              '   	      B.NM_GRUPO,                                                                                           ' + sLineBreak +
              '   	      A.CD_EMPRESA,                                                                                         ' + sLineBreak +
              '   	      C.NM_EMPRESA,                                                                                         ' + sLineBreak +
              '   	      A.NR_CE_MERCANTE,                                                                                     ' + sLineBreak +
              '   	      A.NR_BL,                                                                                              ' + sLineBreak +
              '   	      A.NR_MANIFESTO,                                                                                       ' + sLineBreak +
             	'           CONVERT(DATETIME, RIGHT(RTRIM(LTRIM(A.DT_OPERACAO)),4)        +''/''+                                 ' + sLineBreak +
              '                             SUBSTRING(RTRIM(LTRIM(A.DT_OPERACAO)),4,2)  +''/''+                                 ' + sLineBreak +
              '                             LEFT(RTRIM(LTRIM(A.DT_OPERACAO)),2)) AS DT_OPERACAO,                                ' + sLineBreak +
              '   	      A.CD_EMBARCACAO,                                                                                      ' + sLineBreak +
              '   	      A.CD_EMBARCACAO + '' '' + A.DS_EMBARCACAO AS DS_EMBARCACAO,                                           ' + sLineBreak +
              '   	      A.DS_PORTO_CARREGAMENTO,                                                                              ' + sLineBreak +
              '   	      A.DS_PORTO_DESCARREGAMENTO,                                                                           ' + sLineBreak +
              '   	      ISNULL(IC_STATUS, ''0'') AS IC_STATUS,                                                                ' + sLineBreak +
              '   	      SUBSTRING(C.CGC_EMPRESA,1,2) + ''.'' +                                                                ' + sLineBreak +
              '           SUBSTRING(C.CGC_EMPRESA,3,3) + ''.'' +                                                                ' + sLineBreak +
              '           SUBSTRING(C.CGC_EMPRESA,6,3) + ''/'' +                                                                ' + sLineBreak +
              '           SUBSTRING(C.CGC_EMPRESA,9,4) + ''-'' +                                                                ' + sLineBreak +
              '           SUBSTRING(C.CGC_EMPRESA,13,2) AS CGC_EMPRESA,                                                         ' + sLineBreak +
              '   	      CASE WHEN ISNULL(IC_STATUS, ''0'')= ''0''                                                             ' + sLineBreak +
              '                THEN ''Consultado''                                                                              ' + sLineBreak +
              '                ELSE ''Terceiros''                                                                               ' + sLineBreak +
              '           END AS IC_STATUS_DESC ,                                                                               ' + sLineBreak +
              '           NM_NOTIFY_IDENTIFICACAO ,                                                                             ' + sLineBreak +
              '           NM_NOTIFY_CNPJ,                                                                                       ' + sLineBreak +
              '           NR_PROCESSO,                                                                                          ' + sLineBreak +
              '           DT_OPERACAO_BROKER,                                                                                   ' + sLineBreak +
              '           NM_TERMINAL_DESCARGA,                                                                                 ' + sLineBreak +
              '           DS_CPF_CNPJ_CONSIGNATARIO,                                                                            ' + sLineBreak +
              '           CAST(DS_MERCADORIA AS VARCHAR(1000))  AS DS_MERCADORIA,                                               ' + sLineBreak +
              '           CAST(DS_OBSERVACOES AS VARCHAR(1000)) AS DS_OBSERVACOES,                                               ' + sLineBreak +
              '           REPLACE(ITENS.DS_DETALHAMENTO, ''@'', '''') AS DS_DETALHAMENTO,                                      ' + sLineBreak +
              '           ITENS.DS_DETALHAMENTO AS DS_DETALHAMENTO_QUEBRA_ITEM                                                  ' + sLineBreak +
              '     FROM TDADOS_CONHECIMENTO_SITE_TERCEIROS A WITH(NOLOCK)                                                      ' + sLineBreak +
              '     JOIN TGRUPO       B WITH(NOLOCK) ON B.CD_GRUPO   = A.CD_GRUPO                                               ' + sLineBreak +
              '     JOIN TEMPRESA_NAC C WITH(NOLOCK) ON C.CD_EMPRESA = A.CD_EMPRESA                                             ' + sLineBreak +
              '       OUTER APPLY (  SELECT CONVERT(VARCHAR(2000),                                                              ' + sLineBreak +
              '                             STUFF((                                                                             ' + sLineBreak +
              '                       SELECT ''  '' + ''ITEM '' + CAST(nr_item as varchar(4))+ '' : '' +                      ' + sLineBreak +
              '                              REPLACE(REPLACE(DS_DETALHAMENTO, CHAR(13), '' ''), CHAR(10), '' '') + ''@''        ' + sLineBreak +
              '                         FROM TDADOS_CONHECIMENTO_SITE_TERCEIROS_ITENS I                                         ' + sLineBreak +
              '                        WHERE I.NUM_CE = A.NR_CE_MERCANTE                                                        ' + sLineBreak +
              '                          AND I.CD_GRUPO = A.CD_GRUPO                                                            ' + sLineBreak +
              '                          AND I.CD_EMPRESA = A.CD_EMPRESA                                                        ' + sLineBreak +
              '                           FOR XML PATH('''')), 1, 2, '''')) AS DS_DETALHAMENTO) ITENS                           ' + sLineBreak +
              '   WHERE 1=1                                                                                                     ' + sLineBreak ;
        if pgcDados.ActivePage = tbTerceiros then
          Sql := Sql + '  AND ISNULL(IC_STATUS, ''0'') NOT IN (''2'',''3'')   /*2 = cadastrado ; 3= cadastrado com data divergente*/  ' + sLineBreak
        else
          if pgcDados.ActivePage = tbDivergenciaData then
            Sql := Sql + '  AND ISNULL(IC_STATUS, ''0'') IN (''3'')  /* 3= cadastrado com data divergente*/  ' + sLineBreak ;

  result := Sql;
end;

function TfrmConsultaMercante.GetSqlPortoDescarregamento : String;
begin
   Result := ' SELECT DISTINCT DS_PORTO_DESCARREGAMENTO                 ' + sLineBreak +
             '   FROM TDADOS_CONHECIMENTO_SITE_TERCEIROS A WITH(NOLOCK) ' + sLineBreak +
             ' ORDER BY DS_PORTO_DESCARREGAMENTO                        ' + sLineBreak ;
end;

function TfrmConsultaMercante.GetSqlPortoCarregamento : String;
begin
   Result := ' SELECT DISTINCT DS_PORTO_CARREGAMENTO                    ' + sLineBreak +
             '   FROM TDADOS_CONHECIMENTO_SITE_TERCEIROS A WITH(NOLOCK) ' + sLineBreak +
             '  ORDER BY  DS_PORTO_CARREGAMENTO                         ' + sLineBreak;
end;

function TfrmConsultaMercante.GetSqlGrupo: String;
begin
   Result :=  ' SELECT CD_GRUPO, NM_GRUPO      ' + sLineBreak +
              '   FROM TGRUPO                  ' + sLineBreak +
              '  WHERE ISNULL(IN_ATIVO,1) = 1  ' + sLineBreak +
              '  ORDER BY NM_GRUPO             ' + sLineBreak ;
end;

function TfrmConsultaMercante.GetSqlEmpresa : String;
begin
   Result :=  ' SELECT CD_EMPRESA, NM_EMPRESA    ' + sLineBreak +
              '   FROM TEMPRESA_NAC WITH(NOLOCK) ' + sLineBreak +
              '  WHERE ISNULL(IN_ATIVO, 1) = 1   ' + sLineBreak +
              '  ORDER BY NM_EMPRESA             ' + sLineBreak ;
end;

procedure TfrmConsultaMercante.Filtrar;
var Sql, sOrderBy :String;
begin
  try
    Screen.Cursor := crHourGlass;
    Sql := '';

    if not ( (cbGrupo.KeyValue = '') or (cbGrupo.KeyValue = null)) then
    begin
      Sql := Sql + sLineBreak + ' AND A.CD_GRUPO = '                 +  quotedStr(cbGrupo.KeyValue);
    end;

    if not ((cbEmpresa.KeyValue = '') or (cbEmpresa.KeyValue = null)) then
    begin
      Sql := Sql + sLineBreak + ' AND A.CD_EMPRESA = '               + quotedStr(cbEmpresa.KeyValue);
    end;

    if not (cbPortoCarregamento.text = '') then
    begin
      Sql := Sql + sLineBreak + ' AND A.DS_PORTO_CARREGAMENTO = '    + QuotedStr(cbPortoCarregamento.text);
    end;

    if not (cbPortoDescarregamento.text = '') then
    begin
      Sql := Sql + sLineBreak + ' AND A.DS_PORTO_DESCARREGAMENTO = ' + QuotedStr(cbPortoDescarregamento.text);
    end;

    if not (edtNumeroBL.text = '') then
    begin
      Sql := Sql + sLineBreak + ' AND A.NR_BL LIKE '                 + QuotedStr('%' + edtNumeroBL.text +'%');
    end;

    if not (edtNrMercante.text = '') then
    begin
      Sql := Sql + sLineBreak + ' AND A.NR_CE_MERCANTE LIKE '        + QuotedStr('%' + edtNrMercante.text + '%');
    end;


    if not ((edtDataOperacaoInicial.text = '') or ( edtDataOperacaoInicial.text = '  /  /    '))then
    begin
        Sql := Sql + sLineBreak +
               '   AND (CONVERT(DATETIME, RIGHT(RTRIM(LTRIM(A.DT_OPERACAO)),4) +''/''+                               '+ sLineBreak+
               '                 SUBSTRING(RTRIM(LTRIM(A.DT_OPERACAO)),4,2)    +''/''+                               '+ sLineBreak+
               '                 LEFT(RTRIM(LTRIM(A.DT_OPERACAO)),2)) >= '+QuotedStr(FormatDateTime('yyyy/mm/dd',
                                                             StrtoDate(edtDataOperacaoInicial.text)) + ' 00:00')+')  '+ sLineBreak;
    end;

    if not ((edtDataOperacaoFinal.text = '') or ( edtDataOperacaoFinal.text = '  /  /    '))then
    begin
        Sql := Sql + sLineBreak +
               '   AND (CONVERT(DATETIME, RIGHT(RTRIM(LTRIM(A.DT_OPERACAO)),4) +''/''+                             '+ sLineBreak+
               '                 SUBSTRING(RTRIM(LTRIM(A.DT_OPERACAO)),4,2)    +''/''+                             '+ sLineBreak+
               '                 LEFT(RTRIM(LTRIM(A.DT_OPERACAO)),2)) <= '+QuotedStr(FormatDateTime('yyyy/mm/dd',
                                                              StrtoDate(edtDataOperacaoFinal.text))+ ' 23:59')+')  '+ sLineBreak;
    end;


    if not ((edtDataConsultaInicial.text = '') or ( edtDataConsultaInicial.text = '  /  /    '))then
    begin
        Sql := Sql + sLineBreak +
               '   AND (A.DT_CONSULTA >= '+QuotedStr(FormatDateTime('yyyy/mm/dd', StrtoDate(edtDataConsultaInicial.text))+ ' 00:00')+') '+ sLineBreak ;
    end;

    if not ((edtDataConsultaFinal.text = '') or ( edtDataConsultaFinal.text = '  /  /    '))then
    begin
        Sql := Sql + sLineBreak +
               '   AND (A.DT_CONSULTA <= '+QuotedStr(FormatDateTime('yyyy/mm/dd', StrtoDate(edtDataConsultaFinal.text))+ ' 23:59')+') '+ sLineBreak ;
    end;

    sOrderBy :=  ' ORDER BY CONVERT(DATETIME, RIGHT(RTRIM(LTRIM(A.DT_OPERACAO)),4)        +''/''+   '+ sLineBreak+
                 '                            SUBSTRING(RTRIM(LTRIM(A.DT_OPERACAO)),4,2)  +''/''+   '+ sLineBreak+
                 '                            LEFT(RTRIM(LTRIM(A.DT_OPERACAO)),2)) DESC             '+ sLineBreak;

    if pgcDados.ActivePage = tbTerceiros then
    begin
      cdsDados.AfterScroll := nil;
      cdsDados.close;
      qryDados.Sql.Clear;
      qryDados.sql.text := GetSqlDados + sLineBreak + Sql + sLineBreak + sOrderBy;
      cdsDados.Open;
      cdsDados.AfterScroll := cdsDadosAfterScroll;
      cdsDados.first;

      cdsDados.IndexFieldNames := 'DT_OPERACAO';

      lblResultados.caption := 'Resultados: ' +  IntToStr(cdsDados.recordcount);
    end
    else
    if pgcDados.ActivePage = tbDivergenciaData then
    begin
      cdsDadosDivergencias.close;
      qryDadosDivergencias.Sql.Clear;
      qryDadosDivergencias.sql.text := GetSqlDados + sLineBreak + Sql + sLineBreak + sOrderBy;
      cdsDadosDivergencias.Open;

      cdsDadosDivergencias.IndexFieldNames := 'DT_OPERACAO';

      lblResultados.caption := 'Resultados: ' +  IntToStr(cdsDadosDivergencias.recordcount);
    end;    
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TfrmConsultaMercante.edrQtRegistrosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;


procedure TfrmConsultaMercante.btnPesquisarClick(Sender: TObject);
begin
  try
    btnPesquisar.Enabled := false;
    Filtrar;
  finally
    btnPesquisar.Enabled := true;
  end;
end;

procedure TfrmConsultaMercante.edtGrupoExit(Sender: TObject);
begin
  BuscarCodigoGrupo;
end;

procedure TfrmConsultaMercante.edtEmpresaExit(Sender: TObject);
begin
   BuscarCodigoEmpresa;
end;

procedure TfrmConsultaMercante.cbGrupoExit(Sender: TObject);
begin
  PreencherCodigoGrupo;
end;

procedure TfrmConsultaMercante.cbEmpresaExit(Sender: TObject);
begin
  PreencherCodigoEmpresa;
end;

procedure TfrmConsultaMercante.cbGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    cbGrupo.KeyValue := '';

    edtGrupo.text := cbGrupo.KeyValue;
end;

procedure TfrmConsultaMercante.cbEmpresaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    cbEmpresa.KeyValue := '';

    edtEmpresa.text := cbEmpresa.KeyValue;
end;

procedure TfrmConsultaMercante.cbPortoCarregamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    cbPortoCarregamento.KeyValue := '';
end;

procedure TfrmConsultaMercante.cbPortoDescarregamentoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    cbPortoDescarregamento.KeyValue := '';
end;

procedure TfrmConsultaMercante.cbGrupoCloseUp(Sender: TObject);
begin
  PreencherCodigoGrupo;
end;

procedure TfrmConsultaMercante.PreencherCodigoGrupo;
begin
  if not ((cbGrupo.KeyValue = '') or (cbGrupo.KeyValue = null)) then
    edtGrupo.Text := cdsGrupo.fieldbyName('CD_GRUPO').AsString
  else
    edtGrupo.Text := '';
end;

procedure TfrmConsultaMercante.PreencherCodigoEmpresa;
begin
  if not ((cbEmpresa.KeyValue = '') or (cbEmpresa.KeyValue = null)) then
    edtEmpresa.Text := cdsEmpresa.fieldbyName('CD_EMPRESA').AsString
  else
    edtEmpresa.Text := '';
end;

procedure TfrmConsultaMercante.BuscarCodigoEmpresa;
begin
  if cdsEmpresa.Locate('CD_EMPRESA', edtEmpresa.Text, [loCaseInsensitive]) then
    cbEmpresa.KeyValue := cdsEmpresa.fieldbyName('CD_EMPRESA').AsString
  else
    cbEmpresa.KeyValue := '';
end;

procedure TfrmConsultaMercante.BuscarCodigoGrupo;
begin
  if cdsGrupo.Locate('CD_GRUPO', edtGrupo.Text, [loCaseInsensitive]) then
    cbGrupo.KeyValue := cdsGrupo.fieldbyName('CD_GRUPO').AsString
  else
    cbGrupo.KeyValue := '';
end;

procedure TfrmConsultaMercante.cbEmpresaCloseUp(Sender: TObject);
begin
  PreencherCodigoEmpresa;                     
end;

procedure TfrmConsultaMercante.edtGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN  then
  begin
    BuscarCodigoGrupo;
  end;
end;

procedure TfrmConsultaMercante.edtEmpresaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN  then
  begin
    BuscarCodigoEmpresa;
  end;
end;

procedure TfrmConsultaMercante.FormShow(Sender: TObject);
begin
  frmConsultaMercante.ClientHeight := 700;
  frmConsultaMercante.ClientWidth  := 1280;
end;

procedure TfrmConsultaMercante.btnTerceirosClick(Sender: TObject);
var qryUpdate : TSqlQuery;
begin
  // 0 = CONSULTADO
  // 1 = TERCEIROS
  // 2 = CADASTRADO NO BROKER
  // 3 = BL CADASTRADO NO SISTEMA, MAS COM DATA DE OPERAÇÃO DIFERENTE

  if cdsDados.FieldByName('IC_STATUS').asString <> '1' then
  begin
    try
      qryUpdate := TSqlQuery.Create(self);
      qryUpdate.SQLConnection := datm_main.SQLConnection;

      qryUpdate.SQL.Text := ' UPDATE TDADOS_CONHECIMENTO_SITE_TERCEIROS ' + sLineBreak +
                            '    SET IC_STATUS = ''1''                  ' + sLineBreak +
                            '  WHERE CD_DADOS_CON_SITE_TER = :CHAVE     ' + sLineBreak ;
      qryUpdate.ParamByName('CHAVE').AsInteger := cdsDados.FieldByName('CD_DADOS_CON_SITE_TER').asInteger;
      qryUpdate.ExecSQL;
    finally
      qryUpdate.Free;
    end;

    filtrar;
  end;
end;

procedure TfrmConsultaMercante.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  {if cdsDados.FieldByName('IC_STATUS').asString = '1' then
  dbgDados.Canvas.Brush.Color := $008080FF;

  if (Rect.Top = TStringGrid(dbgDados).CellRect(0,TStringGrid(dbgDados).Row).Top) or (gdSelected in State) then
  begin
    dbgDados.Canvas.Brush.Color := $00FF9933;
  end;

  dbgDados.Canvas.FillRect(Rect);
  dbgDados.DefaultDrawColumnCell( Rect, DataCol, Column, State);  }
end;

procedure TfrmConsultaMercante.rgStatusClick(Sender: TObject);
begin
  if rgStatus.ItemIndex = 0 then  //todos
  begin
    cdsDados.Filtered     := false;
    cdsDados.Filter       := '';
    lblResultados.caption := 'Resultados: ' +  IntToStr(cdsDados.recordcount);
  end
  else
  if rgStatus.ItemIndex = 1 then //consultados
  begin
    cdsDados.Filtered     := false;
    cdsDados.Filter       := 'IC_STATUS = ''0''';
    cdsDados.Filtered     := true;
    lblResultados.caption := 'Resultados: ' +  IntToStr(cdsDados.recordcount);
  end
  else
  if rgStatus.ItemIndex = 2 then //terceiros
  begin
    cdsDados.Filtered     := false;
    cdsDados.Filter       := 'IC_STATUS = ''1''';
    cdsDados.Filtered     := true;
    lblResultados.caption := 'Resultados: ' +  IntToStr(cdsDados.recordcount);
  end;
end;

procedure TfrmConsultaMercante.btnBlsCadastradosClick(Sender: TObject);
var qryUpdate : TSqlQuery;
    BookMarkItem :TBookmark;
begin
  try
    //qryVerifica.close;
    cdsVerifica.close;

    qryVerifica.SQL.Text :=
    '  SELECT A.CD_DADOS_CON_SITE_TER, A.NR_BL, B.NR_PROCESSO                                                   '+ slineBreak+
    '   FROM TDADOS_CONHECIMENTO_SITE_TERCEIROS A WITH(NOLOCK)                                                  '+ slineBreak+
    '   JOIN TPROCESSO                          B WITH(NOLOCK) ON  B.CD_CLIENTE      = A.CD_EMPRESA             '+ slineBreak+
    '                                                         AND  B.CD_GRUPO        = A.CD_GRUPO               '+ slineBreak+
    '   AND LTRIM(RTRIM(REPLACE((REPLACE(REPLACE(NR_CONHECIMENTO, ''.'', ''''),''-'', '''')),''/'', ''''))) =   '+ slineBreak+
    '       LTRIM(RTRIM(REPLACE((REPLACE(REPLACE(A.NR_BL, ''.'', ''''),''-'', '''')),''/'', '''')))             '+ slineBreak+
    '                                                         AND  B.CD_PRODUTO      = ''01''                   '+ slineBreak+
    '   WHERE ISNULL(IC_STATUS,''0'') NOT IN (''2'',''3'')                                                      '+ slineBreak;
   // qryVerifica.open;
    cdsVerifica.open;

    qryUpdate := TSqlQuery.Create(self);
    qryUpdate.SQLConnection := datm_main.SQLConnection;

    if cdsVerifica.RecordCount > 0 then
    begin
      qryUpdate.SQL.Text :=
      '  UPDATE TDADOS_CONHECIMENTO_SITE_TERCEIROS                                                              '+ slineBreak+
      '     SET IC_STATUS = ''2''                                                                               '+ slineBreak+
      '    FROM TDADOS_CONHECIMENTO_SITE_TERCEIROS A WITH(NOLOCK)                                               '+ slineBreak+
      '    JOIN TPROCESSO                          B WITH(NOLOCK) ON  B.CD_CLIENTE      = A.CD_EMPRESA          '+ slineBreak+
      '                                                          AND  B.CD_GRUPO        = A.CD_GRUPO            '+ slineBreak+
      '   AND LTRIM(RTRIM(REPLACE((REPLACE(REPLACE(NR_CONHECIMENTO, ''.'', ''''),''-'', '''')),''/'', ''''))) = '+ slineBreak+
      '       LTRIM(RTRIM(REPLACE((REPLACE(REPLACE(A.NR_BL, ''.'', ''''),''-'', '''')),''/'', '''')))           '+ slineBreak+
      '                                                          AND  B.CD_PRODUTO      = ''01''                '+ slineBreak+
      '   WHERE ISNULL(IC_STATUS,''0'') NOT IN (''2'',''3'')                                                    '+ slineBreak;
      qryUpdate.ExecSql;                     

      sgrdBlsEncontrados.Cells[0,0]  := 'Processo';
      sgrdBlsEncontrados.Cells[1,0]  := 'Número BL';

      cdsVerifica.first;
      while not cdsVerifica.eof do
      begin
        sgrdBlsEncontrados.Cells[0,sgrdBlsEncontrados.RowCount-1] := Trim(cdsVerifica.FieldByName('NR_PROCESSO').AsString);
        sgrdBlsEncontrados.Cells[1,sgrdBlsEncontrados.RowCount-1] := Trim(cdsVerifica.FieldByName('NR_BL').AsString);

        sgrdBlsEncontrados.RowCount := sgrdBlsEncontrados.RowCount+1;
        cdsVerifica.next;
      end;

      sgrdBlsEncontrados.RowCount := sgrdBlsEncontrados.RowCount-1;

      pnlBlsEncontrados.left    := (round(frmConsultaMercante.Width / 2) - round(pnlBlsEncontrados.Width / 2));
      pnlBlsEncontrados.top     := 20;
      pnlBlsEncontrados.Height  := 330;
      pnlBlsEncontrados.Visible := true;

      BookMarkItem := cdsDados.GetBookmark;
      filtrar;
	   	cdsDados.GotoBookmark(BookMarkItem);
      cdsDados.FreeBookmark(BookMarkItem);
    end
    else
    begin
      ShowMessage('Nenhum BL encontrado.')
    end;
  finally
    qryUpdate.Free;
  end;
end;

procedure TfrmConsultaMercante.btn_sairClick(Sender: TObject);
begin
  pnlBlsEncontrados.Visible := false;
end;

procedure TfrmConsultaMercante.dbgDadosTitleClick(Column: TColumn);
begin
  cdsDados.IndexFieldNames := Column.FieldName;
end;

procedure TfrmConsultaMercante.pgcDadosChange(Sender: TObject);
begin
  if pgcDados.ActivePage = tbTerceiros then
  begin
    btnBlsCadastrados.visible := true;
    btnTerceiros.visible      := true;
    rgStatus.Visible          := true;
    if cdsDados.IsEmpty then
      filtrar;

    lblResultados.caption := 'Resultados: ' +  IntToStr(cdsDados.recordcount);
  end
  else
  if pgcDados.ActivePage = tbDivergenciaData then
  begin
    btnBlsCadastrados.visible := false;
    btnTerceiros.visible      := false;
    rgStatus.Visible          := false;
    if cdsDadosDivergencias.IsEmpty then
      filtrar;
    lblResultados.caption := 'Resultados: ' +  IntToStr(cdsDadosDivergencias.recordcount);
  end;
end;

procedure TfrmConsultaMercante.dbgDivergenciasTitleClick(Column: TColumn);
begin
  cdsDadosDivergencias.IndexFieldNames := Column.FieldName;
end;


procedure TfrmConsultaMercante.btnExcelClick(Sender: TObject);
begin
  if pgcDados.ActivePage =  tbTerceiros then
  begin
    try
      cxDetalhamento.visible := true;
      GeraExcel(cxGrid)
    finally
      cxDetalhamento.visible := false;
    end;
  end
  else
    GeraExcel(cxGrid1)
end;

procedure TfrmConsultaMercante.GeraExcel(var grid : TcxGrid);
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

procedure TfrmConsultaMercante.cxGridDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 if(AViewInfo.GridRecord.Values[14] = '1') then
    ACanvas.Brush.Color := $008080FF;
end;

procedure TfrmConsultaMercante.cdsDadosAfterScroll(DataSet: TDataSet);
var listaItens : TStringList;
 i : integer;
begin
  try
    listaItens := TStringList.Create;
    listaItens.clear;
    cdsDadosDetail.close;
    cdsDadosDetail.Open;
    cdsDadosDetail.EmptyDataSet;

    if cdsDadosDS_DETALHAMENTO_QUEBRA_ITEM.asstring <> '' then
    begin
      listaItens.clear;
      ExtractStrings(['@'],[], PChar(cdsDadosDS_DETALHAMENTO_QUEBRA_ITEM.asstring), listaItens);
      for i := 0 to listaItens.Count-1 do
      begin
        cdsDadosDetail.Append;
        cdsDadosDetail.FieldByName('DS_DETALHAMENTO').Value := trim(copy(listaItens[i], 1, length(listaItens[i])-1)) ;
        cdsDadosDetail.post;
      end;
    end;
  finally
    listaItens.free;
  end;
end;

end.
