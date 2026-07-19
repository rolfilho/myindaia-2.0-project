unit uRetencaoPorEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls, DB, DBTables, DateUtils,
  Buttons, Mask, DBCtrls, PGGP017, Menus, ComOBJ;

type
  TFrmControleRetencao = class(TForm)
    pnl_cadastro: TPanel;
    pgctrl_ct_contabil: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    ts_grafico: TTabSheet;
    tvw_grafico: TTreeView;
    DBGrid1: TDBGrid;
    dtsRetencao: TDataSource;
    SqlRetencao: TQuery;
    btn_sair: TSpeedButton;
    SqlRetencaoDetalhe: TQuery;
    dtsRetencaoDetalhe: TDataSource;
    Panel1: TPanel;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    CmbMes: TComboBox;
    CmbAno: TComboBox;
    BtnCalcular: TSpeedButton;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Panel2: TPanel;
    lbl_cd_cliente: TLabel;
    dbedt_cd_cliente: TDBEdit;
    dbedt_nm_cliente: TDBEdit;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    sqlEmpresa: TQuery;
    lbl_cd_unid_neg: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_cd_unid_neg: TSpeedButton;
    SqlRetencaoDetalheDT_FATURA: TDateTimeField;
    SqlRetencaoDetalheVL_TRIBUTAVEL: TFloatField;
    SqlRetencaoDetalheVL_COFINS: TFloatField;
    SqlRetencaoDetalheIN_COFINS_RETIDO: TStringField;
    SqlRetencaoDetalheIN_COFINS_RETIDO_ATUAL: TStringField;
    SqlRetencaoDetalheVL_COFINS_RETIDO: TFloatField;
    SqlRetencaoCGC_EMPRESA: TStringField;
    SqlRetencaoVL_TOT_TRIBUT: TFloatField;
    SqlRetencaoVL_COFINS: TFloatField;
    SqlRetencaoVL_IR: TFloatField;
    SqlRetencaonm_empresa: TStringField;
    SqlRetencaocd_cliente: TStringField;
    SqlRetencaoDetalheNR_NOTA: TStringField;
    SqlRetencaoDetalheDT_VENC: TDateTimeField;
    SqlRetencaoDetalheNR_SOLICITACAO: TStringField;
    SqlRetencaoDetalheVL_IR: TFloatField;
    SqlRetencaoDetalheIN_IR_RETIDO: TStringField;
    SqlRetencaoDetalheIN_IR_RETIDO_ATUAL: TStringField;
    SqlRetencaoDetalheVL_IR_RETIDO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnCalcularClick(Sender: TObject);
    procedure CmbAnoChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SqlRetencaoAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
  private
    DataInicial, DataFinal : TDateTime;
    pAno : Integer;
    procedure CalculaData;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmControleRetencao: TFrmControleRetencao;

implementation

uses PGGP001, Funcoes, ConsOnLineEx;

{$R *.dfm}

procedure TFrmControleRetencao.CalculaData;
begin
  pAno := StrToInt(CmbAno.Text);
  DataInicial := EncodeDate(pAno, CmbMes.ItemIndex+1, 1);
  DataFinal := EncodeDate ( pAno, CmbMes.ItemIndex+1, DaysInAMonth(pAno,CmbMes.ItemIndex+1));
end;


procedure TFrmControleRetencao.FormCreate(Sender: TObject);
begin
  CmbMes.ItemIndex := (MonthOf(Date)) - 1;
  CmbAno.ItemIndex := CmbAno.Items.IndexOf(IntToStr((YearOf(Date))));
  pgctrl_ct_contabil.ActivePage := ts_lista;
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  edt_nm_unid_neg.Text := str_nm_unid_neg;
end;

procedure TFrmControleRetencao.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmControleRetencao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
    Close;
end;

procedure TFrmControleRetencao.BtnCalcularClick(Sender: TObject);
var vCgcUnidade : String;
begin
  vCgcUnidade := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', msk_cd_unid_neg.Text,  'CGC_UNID_NEG');
  CalculaData;
  with SqlRetencao do
  begin
    Close;
    Databasename := 'DBBROKER';
    Sql.Clear;
    Sql.Add('select COF.CGC_EMPRESA, Sum(COF.VL_TRIBUTAVEL) VL_TOT_TRIBUT, Sum(COF.VL_COFINS_RETIDO) VL_COFINS, Sum(IR.VL_IR_RETIDO) VL_IR');
    Sql.Add(' from TRETENCAO_COFINS COF');
    Sql.Add('   LEFT join TRETENCAO_IR IR on COF.NR_SOLICITACAO = IR.NR_SOLICITACAO AND IR.CGC_UNID_NEG = COF.CGC_UNID_NEG');
    Sql.Add(' WHERE');
    Sql.Add('   COF.DT_FATURA BETWEEN :dt_ini and :dt_fim and COF.CGC_UNID_NEG = :CGC_UNID_NEG');
    Sql.Add(' group by COF.CGC_EMPRESA');
    ParamByName('DT_INI').AsDateTime := DataInicial;
    ParamByName('DT_FIM').AsDateTime := DataFinal;
    ParamByName('CGC_UNID_NEG').AsString := vCgcUnidade;
    Open;
  end;
end;

procedure TFrmControleRetencao.CmbAnoChange(Sender: TObject);
begin
  BtnCalcular.Click;
  pgctrl_ct_contabil.ActivePage := ts_lista;
end;

procedure TFrmControleRetencao.DBGrid1DblClick(Sender: TObject);
begin
  pgctrl_ct_contabil.ActivePage := ts_dados_basicos;
end;

procedure TFrmControleRetencao.SqlRetencaoAfterScroll(DataSet: TDataSet);
var vCgcUnidade : String;
begin
  vCgcUnidade := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', msk_cd_unid_neg.Text,  'CGC_UNID_NEG');
  with SqlRetencaoDetalhe do
  begin
    Close;
    Databasename := 'DBBROKER';
    Sql.Clear;
    Sql.Add('select F.DT_FATURA, COF.DT_FATURA AS DT_VENC, COF.NR_NOTA, COF.NR_SOLICITACAO, COF.VL_TRIBUTAVEL,');
    Sql.Add('   COF.VL_COFINS, COF.IN_COFINS_RETIDO, IN_COFINS_RETIDO_ATUAL, VL_COFINS_RETIDO,');
    Sql.Add('   IR.VL_IR, IR.IN_IR_RETIDO, IR.IN_IR_RETIDO_ATUAL, ISNULL(IR.VL_IR_RETIDO,0) VL_IR_RETIDO');
    Sql.Add(' from TRETENCAO_COFINS COF');
    Sql.Add('  LEFT join TRETENCAO_IR IR on COF.NR_SOLICITACAO = IR.NR_SOLICITACAO AND IR.CGC_UNID_NEG = COF.CGC_UNID_NEG');
    Sql.Add('  INNER JOIN TS_FATURA F ON F.CD_PRODUTO = COF.CD_PRODUTO AND F.CD_UNID_NEG = COF.CD_UNID_NEG AND F.NR_SOLICITACAO = COF.NR_SOLICITACAO');
    Sql.Add(' WHERE');
    Sql.Add('   COF.DT_FATURA BETWEEN :dt_ini and :dt_fim');
    sql.Add('   and COF.CGC_EMPRESA = :CGC_EMPRESA and COF.CGC_UNID_NEG = :CGC_UNID_NEG');
    Sql.Add(' order by IR.DT_FATURA, COF.NR_NOTA');
    ParamByName('DT_INI').AsDateTime   := DataInicial;
    ParamByName('DT_FIM').AsDateTime   := DataFinal;
    ParamByName('CGC_EMPRESA').AsString := SqlRetencao.FieldByName('CGC_EMPRESA').AsString;
//    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    ParamByName('CGC_UNID_NEG').AsString := vCgcUnidade;
    Open;
  end;
end;

procedure TFrmControleRetencao.FormShow(Sender: TObject);
begin
  BtnCalcular.Click;
  sqlEmpresa.Active;
end;

procedure TFrmControleRetencao.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (TDBGrid(Sender).DataSource.DataSet.FieldByName('IN_COFINS_RETIDO').AsFloat > 0) and
     (TDBGrid(Sender).DataSource.DataSet.FieldByName('VL_IR_RETIDO').AsFloat = 0) and
     (TDBGrid(Sender).DataSource.DataSet.FieldByName('VL_COFINS_RETIDO').AsFloat > 0) then

  begin
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := $00E4F4E3; //verde
  end
  else if (TDBGrid(Sender).DataSource.DataSet.FieldByName('IN_IR_RETIDO').AsString <> '0') and
          (TDBGrid(Sender).DataSource.DataSet.FieldByName('VL_IR_RETIDO').AsFloat > 0) and
          (TDBGrid(Sender).DataSource.DataSet.FieldByName('VL_COFINS_RETIDO').AsFloat = 0) then
  begin
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := $00FFF1E6; //azul
  end
  else if (TDBGrid(Sender).DataSource.DataSet.FieldByName('VL_IR_RETIDO').AsFloat > 0) and
          (TDBGrid(Sender).DataSource.DataSet.FieldByName('VL_COFINS_RETIDO').AsFloat > 0) then
  begin
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := $00C2FBFE; //amarelo
  end
  else if (TDBGrid(Sender).DataSource.DataSet.FieldByName('VL_IR_RETIDO').AsFloat = 0) and
          (TDBGrid(Sender).DataSource.DataSet.FieldByName('VL_COFINS_RETIDO').AsFloat = 0) then
  begin
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := clWindow;
  end;
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmControleRetencao.Button1Click(Sender: TObject);
{var
  IntRow,IntCol: word;
  xlWorkB, Excel, oSheet : Variant;}
begin
{  try
    Excel := CreateOLEObject('Excel.Application');
    xlWorkB := Excel.Workbooks.Open( 'c:\TESTE.XLS' );
    Excel.ActiveWorkBook.SaveAs('c:\' +
    Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');
    oSheet := Excel.WorkBooks[1].Worksheets[1];

    if not Excel.Application.Visible then
      Excel.Application.Visible := True;
    Excel.WorkBooks.Add;

    // Exporta as linhas e colunas do Grid
    with DBGrid1 do
    for IntRow := 0 to SqlRetencaoDetalhe.RecordCount-1 do
      for IntCol := 0 to 10-1 do
        Excel.Cells[IntCol+1,IntRow+1] := Excel.Cells[IntCol,IntRow];
  except
    showmessage('Ocorreu erro ao executar a transferência\');
  end;}
end;

procedure TFrmControleRetencao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmControleRetencao.btn_cd_unid_negClick(Sender: TObject);
begin
  msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg, 1,msk_cd_unid_neg.Text);
  msk_cd_unid_negExit(nil);
end;

procedure TFrmControleRetencao.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');
  BtnCalcularClick(nil);
end;

end.
