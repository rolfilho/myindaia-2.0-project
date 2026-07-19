unit uParametrizacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Buttons, StdCtrls, Mask, Grids, DBGrids, ExtCtrls,
  Tabs, DBCtrls, ppCtrls, jpeg, ppPrnabl, ppClass, ppBands, ppCache,
  ppComm, ppRelatv, ppProd, ppReport,ShellAPI;

type
  Tfrm_parametrizacao = class(TForm)
    pnl2: TPanel;
    pnl3: TPanel;
    shp1: TShape;
    dbgrd1: TDBGrid;
    lbl1: TLabel;
    medt1: TMaskEdit;
    medt2: TMaskEdit;
    lbl_cd_unid_neg: TLabel;
    edt_nm_unid_neg: TEdit;
    medt_cd_unid_neg: TMaskEdit;
    btn_co_unid_neg: TSpeedButton;
    qryProcessoParametrizacao: TQuery;
    dsProcessoParametrizacao: TDataSource;
    dbgrd2: TDBGrid;
    qryParametrizacao: TQuery;
    dsParametrizacao: TDataSource;
    qryProcessoParametrizacaoNR_DI: TStringField;
    pnl4: TPanel;
    qryParametrizacaoDATA_CONSULTA: TDateTimeField;
    qryParametrizacaoHORA_CONSULTA: TStringField;
    qryParametrizacaoCD_CANAL: TStringField;
    qryParametrizacaoTX_ETAPA: TStringField;
    qryParametrizacaoTX_FISCAL: TStringField;
    qryParametrizacaoDATA_SITUACAO: TDateTimeField;
    qryParametrizacaoTX_SITUACAO: TStringField;
    qryParametrizacaoTX_AFRMM: TStringField;
    qryParametrizacaoTX_ICMS: TStringField;
    qryParametrizacaocalc_CANAL: TStringField;
    qryParametrizacaoNR_DI: TStringField;
    qryParametrizacaoCD_PORTO: TStringField;
    qryParametrizacaoTX_DIR_IMAGEM: TStringField;
    pnlImagem: TPanel;
    pnl5: TPanel;
    tsGuias: TTabSet;
    pnl1: TPanel;
    btn1: TSpeedButton;
    nbGuias: TNotebook;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    dbedt1: TDBEdit;
    dbedt2: TDBEdit;
    dbedt3: TDBEdit;
    dbedt4: TDBEdit;
    dbedt5: TDBEdit;
    dbedt6: TDBEdit;
    dbedt7: TDBEdit;
    dbedt8: TDBEdit;
    shp2: TShape;
    lbl10: TLabel;
    shpCanal: TShape;
    shp3: TShape;
    lbl11: TLabel;
    dbtxt1: TDBText;
    shp4: TShape;
    lbl12: TLabel;
    shp5: TShape;
    shp6: TShape;
    shp7: TShape;
    shp8: TShape;
    shp9: TShape;
    shp10: TShape;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    cmbSituacao: TComboBox;
    cmbFiscal: TComboBox;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    rb4: TRadioButton;
    rb5: TRadioButton;
    pnl6: TPanel;
    shp11: TShape;
    lbl16: TLabel;
    shp13: TShape;
    pnl7: TPanel;
    btn_rel_calc: TSpeedButton;
    ppAcompanhamentoDespacho: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage1: TppImage;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppShape2: TppShape;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    qryProcessoParametrizacaonr_processo: TStringField;
    shp14: TShape;
    lbl18: TLabel;
    dbtxt2: TDBText;
    qryParametrizacaocalc_HORA_CONSULTA: TStringField;
    btn_sair: TSpeedButton;
    pnl9: TPanel;
    ScrollBox1: TScrollBox;
    shp15: TShape;
    shp16: TShape;
    qryParametrizacaoDATA_EXAME: TDateTimeField;
    qryParametrizacaoDATA_RETIFICA: TDateTimeField;
    dbedt9: TDBEdit;
    dbedt10: TDBEdit;
    dbmmo1: TDBMemo;
    dbmmo2: TDBMemo;
    lbl19: TLabel;
    lbl20: TLabel;
    qryParametrizacaoTX_EXAME: TMemoField;
    qryParametrizacaoTX_RETIFICA: TMemoField;
    shp17: TShape;
    qryProcessoParametrizacaocalc_NR_DI: TStringField;
    btnFiltrar: TSpeedButton;
    imgParametrizacao: TImage;
    procedure FormShow(Sender: TObject);
    procedure dbgrd2DblClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure qryParametrizacaoCalcFields(DataSet: TDataSet);
    procedure dbgrd2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tsGuiasClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btn_rel_calcClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure qryParametrizacaoAfterScroll(DataSet: TDataSet);
    procedure qryProcessoParametrizacaoCalcFields(DataSet: TDataSet);
  private
    procedure AlimentaComboSituacao;
    procedure AlimentaComboFiscal;
    procedure PreparaQueryProcessos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_parametrizacao: Tfrm_parametrizacao;

implementation

uses PGGP017, PGGP001, ConsOnLineEx, Funcoes;

{$R *.dfm}

procedure Tfrm_parametrizacao.FormShow(Sender: TObject);
begin
  medt_cd_unid_neg.Text := str_cd_unid_neg;
  pnlImagem.Top := 41;
  AlimentaComboSituacao;
  AlimentaComboFiscal;
  rb5.Checked := True;
end;

procedure Tfrm_parametrizacao.PreparaQueryProcessos;
begin
  qryProcessoParametrizacao.Close;
  qryProcessoParametrizacao.SQL.Clear;
  qryProcessoParametrizacao.SQL.Add('SELECT PP.NR_DI, PR.NR_PROCESSO');
  qryProcessoParametrizacao.SQL.Add('  FROM TPROCESSO_PARAMETRIZACAO PP, TPROCESSO PR, TFOLLOWUP FU');
  qryProcessoParametrizacao.SQL.Add(' WHERE PR.NR_DI = PP.NR_DI');
  qryProcessoParametrizacao.SQL.Add('   AND FU.NR_PROCESSO = PR.NR_PROCESSO');
  qryProcessoParametrizacao.SQL.Add('   AND FU.CD_EVENTO = ''021''');
  if Trim(medt_cd_unid_neg.Text) <> '' then
    qryProcessoParametrizacao.SQL.Add('   AND PR.CD_UNID_NEG = ''' + medt_cd_unid_neg.Text + '''');
  if Trim(cmbSituacao.Text) <> '' then
    qryProcessoParametrizacao.SQL.Add('   AND PP.TX_SITUACAO = ''' + cmbSituacao.Text + '''');
  if Trim(cmbFiscal.Text) <> '' then
    qryProcessoParametrizacao.SQL.Add('   AND PP.TX_FISCAL = ''' + cmbFiscal.Text + '''');
  if not rb5.Checked then
    if rb1.Checked then
      qryProcessoParametrizacao.SQL.Add('   AND PP.CD_CANAL = ''D''');
    if rb2.Checked then
      qryProcessoParametrizacao.SQL.Add('   AND PP.CD_CANAL = ''V''');
    if rb4.Checked then
      qryProcessoParametrizacao.SQL.Add('   AND PP.CD_CANAL = ''L''');
    if rb3.Checked then
      qryProcessoParametrizacao.SQL.Add('   AND PP.CD_CANAL = ''A''');
  if ( medt1.Text <> '  /  /    ' ) and ( medt2.Text <> '  /  /    ' ) then
    qryProcessoParametrizacao.SQL.Add('   AND FU.DT_REALIZACAO BETWEEN CONVERT(DATETIME,''' + medt1.Text + ''',103) AND CONVERT(DATETIME,''' + medt2.Text + ''',103)');
  qryProcessoParametrizacao.SQL.Add(' GROUP BY PP.NR_DI, PR.NR_PROCESSO');
  qryProcessoParametrizacao.Prepare;
  qryProcessoParametrizacao.Open;
  qryParametrizacao.Close;
  qryParametrizacao.Prepare;
  qryParametrizacao.Open;
end;

procedure Tfrm_parametrizacao.AlimentaComboFiscal;
begin
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT DISTINCT TX_FISCAL FROM TPROCESSO_PARAMETRIZACAO');
    Open;
    while not EOF do
    begin
      cmbFiscal.Items.Add(Fields[0].AsString);
      Next;
    end;
    Close;
    Free;
  end;
end;

procedure Tfrm_parametrizacao.AlimentaComboSituacao;
begin
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT DISTINCT TX_SITUACAO FROM TPROCESSO_PARAMETRIZACAO');
    Open;
    while not EOF do
    begin
      cmbSituacao.Items.Add(Fields[0].AsString);
      Next;
    end;
    Close;
    Free;
  end;
end;

procedure Tfrm_parametrizacao.dbgrd2DblClick(Sender: TObject);
begin
  if fileexists(trim(qryParametrizacao.FieldByName('TX_DIR_IMAGEM').AsString)) then
    ShellExecuteA(Self.Handle, nil, PAnsiChar(qryParametrizacao.FieldByName('TX_DIR_IMAGEM').AsString), nil, nil, SW_SHOW)
  else
    ShowMessage('Não consta arquivo vinculado!');
 // pnlImagem.width   := 715;
 // pnlImagem.height   := 471;  
 // pnlImagem.Visible := True;

  if qryParametrizacaoCD_CANAL.AsString = 'V' then
    shpCanal.Brush.Color := clRed
  else if qryParametrizacaoCD_CANAL.AsString = 'D' then
    shpCanal.Brush.Color := clLime
  else if qryParametrizacaoCD_CANAL.AsString = 'A' then
    shpCanal.Brush.Color := clGray
  else if qryParametrizacaoCD_CANAL.AsString = 'L' then
    shpCanal.Brush.Color := clYellow; 
end;

procedure Tfrm_parametrizacao.btn1Click(Sender: TObject);
begin
  pnlImagem.Visible := False;
end;

procedure Tfrm_parametrizacao.qryParametrizacaoCalcFields(DataSet: TDataSet);
begin
  qryParametrizacaoCalc_CANAL.AsString := 'l';
  qryParametrizacaoCalc_HORA_CONSULTA.AsString := Copy(qryParametrizacaoHORA_CONSULTA.AsString,1,2) + ':' + Copy(qryParametrizacaoHORA_CONSULTA.AsString,3,2);
end;

procedure Tfrm_parametrizacao.dbgrd2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  sTexto : string;
  R : TRect;
begin
  if Column.FieldName = 'calc_CANAL' then
  begin
    If ( qryParametrizacaoCD_CANAL.AsString = 'V' ) Then
    begin
      dbgrd2.Canvas.Font.Color  := clRed;
      sTexto := Column.Field.AsString;
    end else
    If ( qryParametrizacaoCD_CANAL.AsString = 'L' ) Then
    begin
      dbgrd2.Canvas.Font.Color  := clYellow;
      sTexto := Column.Field.AsString;
    end else
    If ( qryParametrizacaoCD_CANAL.AsString = 'D' ) Then
    begin
      dbgrd2.Canvas.Font.Color  := clGreen;
      sTexto := Column.Field.AsString;
    end else
    If ( qryParametrizacaoCD_CANAL.AsString = 'A' ) Then
    begin
      dbgrd2.Canvas.Font.Color  := clGray;
      sTexto := Column.Field.AsString;
    end else
    begin
      dbgrd2.Canvas.Font.Color  := clWhite;
      sTexto := '¬';
    end;
    R := Rect;
    dbgrd2.Canvas.FillRect( R );

    Inc( R.Left, 2 );
    Dec( R.Right, 3 );
    Column.Alignment := taCenter;
    DrawText( dbgrd2.Canvas.Handle, PChar( sTexto ), Length( sTexto ), R, DT_VCENTER );
  end;
end;

procedure Tfrm_parametrizacao.tsGuiasClick(Sender: TObject);
begin
  nbGuias.PageIndex := tsGuias.TabIndex;
end;

procedure Tfrm_parametrizacao.btn_co_unid_negClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
    medt_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg)
  Else edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', medt_cd_unid_neg.Text,'AP_UNID_NEG');
end;

procedure Tfrm_parametrizacao.btnFiltrarClick(Sender: TObject);
begin
  PreparaQueryProcessos;
end;

procedure Tfrm_parametrizacao.btn_rel_calcClick(Sender: TObject);
begin
  ppImage1.Picture := imgParametrizacao.Picture;
  ppLabel3.Caption := Copy(qryProcessoParametrizacaoNR_PROCESSO.AsString,5,12);
  ppAcompanhamentoDespacho.Print;
end;

procedure Tfrm_parametrizacao.btn_sairClick(Sender: TObject);
begin
  nbGuias.ActivePage := 'Dados';
  tsGuias.TabIndex   := nbGuias.PageIndex;
  pnlImagem.Visible  := False;
end;

procedure Tfrm_parametrizacao.qryParametrizacaoAfterScroll(
  DataSet: TDataSet);
begin
  if ( Trim(qryParametrizacaoTX_EXAME.AsString) <> '' ) or ( Trim(qryParametrizacaoTX_RETIFICA.AsString) <> '' ) then
    shp17.Brush.Color := clBtnFace
  else
  shp17.Brush.Color := clMenuBroker;

 // imgParametrizacao.Picture.LoadFromFile( qryParametrizacao.FieldByName('TX_DIR_IMAGEM').AsString );
end;

procedure Tfrm_parametrizacao.qryProcessoParametrizacaoCalcFields(
  DataSet: TDataSet);
begin
  qryProcessoParametrizacao.FieldByName('calc_NR_DI').AsString := Copy(qryProcessoParametrizacao.FieldByName('NR_DI').AsString,1,2)+'/'+
                                                                  Copy(qryProcessoParametrizacao.FieldByName('NR_DI').AsString,3,7)+'-'+
                                                                  Copy(qryProcessoParametrizacao.FieldByName('NR_DI').AsString,10,1);
end;

end.
