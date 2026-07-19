unit uConsultaMantra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Buttons, StdCtrls, Mask, Grids, DBGrids, ExtCtrls,
  Tabs, DBCtrls, ppCtrls, jpeg, ppPrnabl, ppClass, ppBands, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, ppVar, ppStrtch, ppMemo, RxGIF,
  ppParameter, ppModule, raCodMod, ppSubRpt, ppDB, ppDBPipe, ppDBBDE;

type
  TfrmConsultaMantra = class(TForm)
    pnl2: TPanel;
    qryProcesso: TQuery;
    dsProcesso: TDataSource;
    qryConsulta: TQuery;
    dsConsulta: TDataSource;
    ppReport: TppReport;
    qryProcessoNR_PROCESSO: TStringField;
    qryProcessocalcNrProcesso: TStringField;
    qryConsultaNR_PROCESSO: TStringField;
    qryConsultaNR_CONSULTA: TAutoIncField;
    qryConsultaDT_CONSULTA: TDateTimeField;
    qryConsultaTX_SITUACAO: TStringField;
    qryConsultaDT_SITUACAO: TDateTimeField;
    qryConsultaTX_TELA_SITUACAO: TMemoField;
    shp5: TShape;
    shp2: TShape;
    lbl2: TLabel;
    lbl_cd_unid_neg: TLabel;
    medt_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    lbl3: TLabel;
    cbbSituacao: TComboBox;
    shp3: TShape;
    lbl4: TLabel;
    shp4: TShape;
    lbl1: TLabel;
    medtProcesso: TMaskEdit;
    bvl1: TBevel;
    pnl3: TPanel;
    dbgrdProcesso: TDBGrid;
    pnl1: TPanel;
    shp1: TShape;
    btnImprimir: TSpeedButton;
    dbgrdConsulta: TDBGrid;
    dbmmoTelaSituacao: TDBMemo;
    bvlEspaco3: TBevel;
    lblTelaSituacao: TLabel;
    ppParameterList1: TppParameterList;
    ppTitleBand1: TppTitleBand;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppImage1: TppImage;
    ppImage3: TppImage;
    ppImage4: TppImage;
    ppLabel1: TppLabel;
    ppLabel12: TppLabel;
    ppDBText4: TppDBText;
    ppShape7: TppShape;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppShape3: TppShape;
    ppHeaderBand1: TppHeaderBand;
    ppImage5: TppImage;
    ppImage6: TppImage;
    ppImage7: TppImage;
    ppShape8: TppShape;
    ppDetailBand1: TppDetailBand;
    ppDBMemo1: TppDBMemo;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppImage2: TppImage;
    ppLabel5: TppLabel;
    ppShape6: TppShape;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    dsRel: TDataSource;
    qryRel: TQuery;
    qryRelNR_PROCESSO: TStringField;
    qryRelNR_PROC: TStringField;
    qryRelIMPORTADOR: TStringField;
    qryRelNR_VOO: TStringField;
    qryRelNR_MANIFESTO: TStringField;
    qryRelTX_SITUACAO: TStringField;
    qryRelTX_TELA_SITUACAO: TMemoField;
    dsRelRef: TDataSource;
    qryRelRef: TQuery;
    qryRelRefREF: TStringField;
    qryRelRefCD_REFERENCIA: TStringField;
    qryRelRefNR_ITEM_PO: TStringField;
    ppRel: TppBDEPipeline;
    ppRelRef: TppBDEPipeline;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBText2: TppDBText;
    raCodeModule1: TraCodeModule;
    raCodeModule2: TraCodeModule;
    SpeedButton1: TSpeedButton;
    qryConsultaNR_QTDE_PAGINAS: TIntegerField;
    qryConsultaNR_PROCESSO_SIMPLES: TStringField;
    pnlProcesso: TPanel;
    dbtxtProcesso: TDBText;
    dbtxtProcessoSombra: TDBText;
    procedure FormShow(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure cbbSituacaoChange(Sender: TObject);
    procedure qryProcessoCalcFields(DataSet: TDataSet);
    procedure medtProcessoChange(Sender: TObject);
    procedure qryConsultaAfterScroll(DataSet: TDataSet);
    procedure medt_cd_unid_negExit(Sender: TObject);
    procedure medt_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnImprimirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    procedure AlimentaComboSituacao;
    procedure PreparaQueryProcessos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaMantra: TfrmConsultaMantra;

implementation

uses PGGP017, PGGP001, ConsOnLineEx, Funcoes, PGSM990;

{$R *.dfm}

procedure TfrmConsultaMantra.FormShow(Sender: TObject);
begin
  // Adicionado por Michel para verificar se não veio do Followup, porque neste caso não precisa efetuar estas consultas - 27/11/2009
  if medt_cd_unid_neg.Visible then
  begin
    medt_cd_unid_neg.Text := str_cd_unid_neg;
    AlimentaComboSituacao;
    cbbSituacao.ItemIndex := 0;
    PreparaQueryProcessos;
    pnlProcesso.Visible       := False;
  end;
end;

procedure TfrmConsultaMantra.PreparaQueryProcessos;
begin
  qryProcesso.Close;
  qryProcesso.SQL.Clear;
  qryProcesso.SQL.Add('SELECT PM.NR_PROCESSO ');
  qryProcesso.SQL.Add('  FROM TPROCESSO_MANTRA PM');
  qryProcesso.SQL.Add(' WHERE ((PM.TX_SITUACAO = ''' + cbbSituacao.Text + ''') OR (''' + cbbSituacao.Text + ''' = ''Todas'')) ');
  if Trim(medt_cd_unid_neg.Text) <> '' then
    qryProcesso.SQL.Add('   AND ((SUBSTRING(PM.NR_PROCESSO, 1,2) = ''' + medt_cd_unid_neg.Text + ''') OR (''' + edt_nm_unid_neg.Text + ''' = ''Todas'')) ');
  qryProcesso.SQL.Add(' GROUP BY PM.NR_PROCESSO');
  qryProcesso.Prepare;
  qryProcesso.Open;
  qryConsulta.Close;
  qryConsulta.Prepare;
  qryConsulta.Open;
end;

procedure TfrmConsultaMantra.AlimentaComboSituacao;
begin
  cbbSituacao.Items.Clear;
  cbbSituacao.Items.Add('Todas');
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT DISTINCT TX_SITUACAO FROM TPROCESSO_MANTRA');
    Open;
    while not EOF do
    begin
      cbbSituacao.Items.Add(Fields[0].AsString);
      Next;
    end;
    Close;
    Free;
  end;
end;

procedure TfrmConsultaMantra.btn_co_unid_negClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
    medt_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg)
  else begin
    if Trim(medt_cd_unid_neg.Text) = '' then
      edt_nm_unid_neg.Text :=  'Todas'
    else
      edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', medt_cd_unid_neg.Text,'AP_UNID_NEG');
  end;
  PreparaQueryProcessos;
end;

procedure TfrmConsultaMantra.cbbSituacaoChange(Sender: TObject);
begin
  PreparaQueryProcessos;
end;

procedure TfrmConsultaMantra.qryProcessoCalcFields(DataSet: TDataSet);
begin
  qryProcessocalcNrProcesso.AsString := Copy(qryProcessoNR_PROCESSO.AsString, 5, 10);
end;

procedure TfrmConsultaMantra.medtProcessoChange(Sender: TObject);
begin
  try
    qryProcesso.Locate('NR_PROCESSO', Trim(medt_cd_unid_neg.Text) + '01' + Trim(medtProcesso.Text), [loCaseInsensitive, loPartialKey]);
  except
    Application.MessageBox('Chave Inválida!', 'Erro de pesquisa', MB_OK + MB_ICONERROR);
  end;
end;

procedure TfrmConsultaMantra.qryConsultaAfterScroll(DataSet: TDataSet);
begin
  lblTelaSituacao.BringToFront;
  if (dbmmoTelaSituacao.Text) = '' then lblTelaSituacao.Caption := 'NÃO DISPONÍVEL'
  else lblTelaSituacao.Caption := '';

end;

procedure TfrmConsultaMantra.medt_cd_unid_negExit(Sender: TObject);
begin
  if medt_cd_unid_neg.Text <> '' then
    medt_cd_unid_neg.Text :=  Copy('00', 1, 2 - Length( medt_cd_unid_neg.Text)) +  medt_cd_unid_neg.Text;

end;

procedure TfrmConsultaMantra.medt_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then btn_co_unid_negClick(btn_co_unid_neg);
end;

procedure TfrmConsultaMantra.btnImprimirClick(Sender: TObject);
begin
  qryRel.DataSource := dsConsulta;
  qryRel.Close;
  qryRel.Open;
  qryRelRef.Close;
  qryRelRef.Open;

//  ppReport.Print;
  Application.CreateForm(TFrm_impressao, Frm_impressao );
  Frm_impressao.cd_unid_neg   := medt_cd_unid_neg.Text;
  Frm_impressao.cd_produto    := '01';
  Frm_impressao.cd_modulo     := '0214';
  Frm_impressao.ShowModal;

end;

procedure TfrmConsultaMantra.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.
