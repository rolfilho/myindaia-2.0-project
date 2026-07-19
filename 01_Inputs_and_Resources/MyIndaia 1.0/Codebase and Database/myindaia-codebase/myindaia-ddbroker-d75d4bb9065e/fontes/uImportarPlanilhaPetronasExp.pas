unit uImportarPlanilhaPetronasExp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, comobj,
  DBTables, ComCtrls, StrUtils;

type
  TfrmImportarPlanilhaPetronasExp = class(TForm)
    Panel1: TPanel;
    cdsPlanilha: TClientDataSet;
    dsPlanilha: TDataSource;
    dsMercadorias: TDataSource;
    cdsItensPE_: TClientDataSet;
    OpenDialog1: TOpenDialog;
    Panel6: TPanel;
    edtCaminho: TEdit;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    btnImportar: TSpeedButton;
    Panel3: TPanel;
    btnImportarItens: TSpeedButton;
    dsItensPE: TDataSource;
    cdsMercadorias: TClientDataSet;
    btnSair: TSpeedButton;
    cdsPlanilhaCodigo: TStringField;
    cdsPlanilhaProduto: TStringField;
    cdsPlanilhaEmbalagem: TStringField;
    cdsPlanilhaQtLitroUnitario: TStringField;
    cdsPlanilhaQuantidade: TStringField;
    cdsPlanilhaQtLitroTot: TStringField;
    cdsPlanilhaVlUnitario: TStringField;
    cdsMercadoriasCD_MERCADORIA: TStringField;
    cdsMercadoriasAP_MERCADORIA: TStringField;
    cdsMercadoriasCD_NCM_SH: TStringField;
    cdsMercadoriasNM_MERCADORIA: TStringField;
    cdsPlanilhaID: TIntegerField;
    cdsMercadoriasID: TIntegerField;
    pgDados: TPageControl;
    tbsPlanilha: TTabSheet;
    tbsMercadoria: TTabSheet;
    tbsItens: TTabSheet;
    dbgridMercadorias: TDBGrid;
    nilha: TDBGrid;
    dbgridPlanilha: TDBGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    lblTotalPlan: TLabel;
    lblTotalItens: TLabel;
    lblTotalMercadorias: TLabel;
    tbsResultado: TTabSheet;
    rMemo: TRichEdit;
    qryTemp: TQuery;
    lblNrProcesso: TLabel;
    lblGrupo: TLabel;
    ProgressBar1: TProgressBar;
    lblInfo: TLabel;
    cdsPlanilhaVlTotal: TFloatField;
    cdsPlanilhaPesoLiqUnitario: TFloatField;
    cdsPlanilhaPesoLiqTotal: TFloatField;
    cdsPlanilhaPesoBrutoUnitario: TFloatField;
    cdsPlanilhaPesoBrutoTotal: TFloatField;
    cdsPlanilhaNCM: TStringField;
    cdsItensPE_CD_MERCADORIA: TStringField;
    cdsItensPE_CD_NCM: TStringField;
    cdsItensPE_QT_MERCADORIA: TFloatField;
    cdsItensPE_VL_UNITARIO: TFloatField;
    cdsItensPE_VL_PESO_LIQ_UNIT: TFloatField;
    cdsItensPE_VL_TOT_ITEM: TFloatField;
    cdsItensPE_VL_TOT_PESO_LIQ: TFloatField;
    cdsItensPE_VL_TOT_PESO_BRUTO: TFloatField;
    cdsItensPE_TX_MERCADORIA: TStringField;
    cdsItensPE_NR_ITEM: TStringField;
    cdsMercadoriasDS_UNID_MEDIDA: TStringField;
    cdsItensPE_DS_EMBALAGEM: TStringField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnImportarItensClick(Sender: TObject);
    procedure rMemoChange(Sender: TObject);
  private
    { Private declarations }
  procedure ImportarMercadorias;
  procedure ImportarItensPE;
  procedure LimparTabelaItens;

  function SqlInsertProcessoExpItem : String;
  function SqlDeleteProcessoExpItem : String;
  function SqlInsertMercadoriaExp : String;
  function SqlConsultaMercadoriaExp : String;
  function SqlConsultaMercadoriaExpSemNCM : String;
  function SqlInsertUnidadeMedida : string;
  function SqlUpdateProcessoExp : String;

  procedure CarregarPlanilha;
  procedure CarregarItens;
  procedure CarregarMercadorias;
  function CodigoUnidadeMedida(unidadeMedida : string) : string;
  function InsereUnidadeMedida(unidadeMedida : string) : string;
  procedure UpdateQtItensPE;

  procedure IniciarProgressBar(total : integer);
  procedure AtualizaProgress;
  function Distinct(CDS: TClientDataSet; FieldName: string): TStringList;
  procedure DefineParamType(var Query : TQuery);
  procedure DefineDataTypeString(var Query : TQuery);
  procedure Log(msg : String);
  public
    { Public declarations }
  end;
  
var
  frmImportarPlanilhaPetronasExp: TfrmImportarPlanilhaPetronasExp;

implementation

uses
  ConsOnLineEx, PGGP017, GSMLIB;

{$R *.dfm}

procedure TfrmImportarPlanilhaPetronasExp.SpeedButton1Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  edtCaminho.text := OpenDialog1.FileName;
end;

procedure TfrmImportarPlanilhaPetronasExp.CarregarPlanilha;
var
  vPlanilhaExcel, vSheet: OLEVariant;
  i, id: Integer;
begin
  vPlanilhaExcel := CreateOleObject('Excel.Application');
  try
    vPlanilhaExcel.Visible := False;
    vPlanilhaExcel.WorkBooks.Add(edtCaminho.text);
    vSheet := vPlanilhaExcel.Workbooks[1].WorkSheets[1];

    i  := 3;
    id := 0;
    cdsPlanilha.DisableControls;
    cdsPlanilha.EmptyDataSet;
    try
      while vSheet.Cells[I, 1].Value <> '' do
      begin
        inc(id);
        cdsPlanilha.Append;
        cdsPlanilhaid.value                 := id;
        cdsPlanilhaCodigo.value             := vSheet.Cells[i,1].value;
        cdsPlanilhaQuantidade.value         := vSheet.Cells[i,2].value;
        cdsPlanilhaProduto.value            := vSheet.Cells[i,3].value;
        cdsPlanilhaEmbalagem.value          := vSheet.Cells[i,4].value;
        cdsPlanilhaQtLitroUnitario.value    := vSheet.Cells[i,5].value;
        cdsPlanilhaQtLitroTot.value         := vSheet.Cells[i,6].value;
        cdsPlanilhaVlUnitario.value         := vSheet.Cells[i,7].value;
        cdsPlanilhaVlTotal.value            := vSheet.Cells[i,8].value;
        cdsPlanilhaPesoLiqUnitario.value    := vSheet.Cells[i,9].value;
        cdsPlanilhaPesoLiqTotal.value       := vSheet.Cells[i,10].value;
        cdsPlanilhaPesoBrutoUnitario.value  := vSheet.Cells[i,11].value;
        cdsPlanilhaPesoBrutoTotal.value     := vSheet.Cells[i,12].value;
        cdsPlanilhaNCM.value                := vSheet.Cells[i,13].value;
        cdsPlanilha.post;
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

procedure TfrmImportarPlanilhaPetronasExp.FormCreate(Sender: TObject);
begin
  cdsPlanilha.CreateDataSet;
  cdsItensPE_.CreateDataSet;
  cdsMercadorias.CreateDataSet;

  lblInfo.caption := '';
  pgDados.ActivePage := tbsPlanilha;
end;

procedure TfrmImportarPlanilhaPetronasExp.btnImportarClick(
  Sender: TObject);
begin
  try
    btnImportarItens.enabled := false;    
    CarregarPlanilha;
    CarregarItens;
    CarregarMercadorias;
  finally
    btnImportarItens.enabled := true;
  end;
end;

procedure TfrmImportarPlanilhaPetronasExp.CarregarItens;
var id : integer;
begin
  try
    cdsPlanilha.DisableControls;
    cdsItensPE_.DisableControls;

    id := 0;
    cdsItensPE_.EmptyDataSet;
    cdsPlanilha.first;
    while not cdsPlanilha.Eof do
    begin
      inc(id);
      cdsItensPE_.Append;
      cdsItensPE_NR_ITEM.value            := rightstr('000' + inttostr(id),3);
      cdsItensPE_CD_MERCADORIA.value      := cdsPlanilhaCodigo.value;
      cdsItensPE_TX_MERCADORIA.value      := cdsPlanilhaProduto.value;
      cdsItensPE_CD_NCM.value             := cdsPlanilhaNCM.value;
      cdsItensPE_QT_MERCADORIA.value      := strtoFloat(cdsPlanilhaQuantidade.asstring);
      cdsItensPE_VL_UNITARIO.value        := strtoFloat(cdsPlanilhaVlUnitario.asstring);
      cdsItensPE_VL_PESO_LIQ_UNIT.value   := strtoFloat(cdsPlanilhaPesoLiqUnitario.asstring);
      cdsItensPE_VL_TOT_ITEM.value        := strtoFloat(cdsPlanilhaVlTotal.asstring);
      cdsItensPE_VL_TOT_PESO_LIQ.value    := strtoFloat(cdsPlanilhaPesoLiqTotal.asstring);
      cdsItensPE_VL_TOT_PESO_BRUTO.value  := strtoFloat(cdsPlanilhaPesoBrutoTotal.asstring);
      cdsItensPE_DS_EMBALAGEM.value       := trim(cdsPlanilhaEmbalagem.value);

      cdsItensPE_.post;
      cdsPlanilha.next;
    end;
  finally
    cdsPlanilha.first;
    cdsPlanilha.EnableControls;
    cdsItensPE_.First;
    cdsItensPE_.EnableControls;
    lblTotalItens.Caption := 'Total :' + inttostr(id);
  end;
end;

procedure TfrmImportarPlanilhaPetronasExp.CarregarMercadorias;
var id : integer;
begin
  id := 0;
  try
    cdsPlanilha.DisableControls;
    cdsMercadorias.DisableControls;
    cdsMercadorias.EmptyDataSet;
    cdsPlanilha.first;
    while not cdsPlanilha.Eof do
    begin
      if not cdsMercadorias.Locate('CD_MERCADORIA;CD_NCM_SH',
                                   VarArrayOf([cdsPlanilhaCodigo.value,cdsPlanilhaNCM.Value]), [loCaseInsensitive]) then
      begin
        inc(id);
        cdsMercadorias.Append;
        cdsMercadoriasid.value                 := id;
        cdsMercadoriasCD_MERCADORIA.value      := cdsPlanilhaCodigo.value;
        cdsMercadoriasAP_MERCADORIA.value      := cdsPlanilhaProduto.value;
        cdsMercadoriasNM_MERCADORIA.Value      := cdsPlanilhaProduto.value;
        cdsMercadoriasDS_UNID_MEDIDA.value     := cdsPlanilhaEmbalagem.value;
        cdsMercadoriasCD_NCM_SH.Value          := cdsPlanilhaNCM.Value;
        cdsMercadorias.post;
      end;
      cdsPlanilha.next;
    end;
  finally
    cdsPlanilha.first;
    cdsPlanilha.EnableControls;
    cdsMercadorias.First;
    cdsMercadorias.EnableControls;
    lblTotalMercadorias.Caption := 'Total :' + inttostr(id);
  end;
end;

procedure TfrmImportarPlanilhaPetronasExp.btnImportarItensClick(Sender: TObject);
begin
  pgDados.ActivePage := tbsResultado;
  IniciarProgressBar(0);
  rMemo.Clear;

  ImportarMercadorias;
  LimparTabelaItens;
  ImportarItensPE;

  lblInfo.caption := 'Ok';
end;

procedure TfrmImportarPlanilhaPetronasExp.UpdateQtItensPE;
begin
  qryTemp.close;
  qryTemp.sql.text := SqlUpdateProcessoExp;
  DefineParamType(qryTemp);
  qryTemp.ParamByName('QT_TOTAL_ITENS').DataType  := ftInteger;
  qryTemp.ParamByName('QT_TOTAL_ITENS').value     := cdsItensPE_.recordCount;
  qryTemp.ExecSql;
end;

procedure TfrmImportarPlanilhaPetronasExp.ImportarMercadorias;
var countMercadoriasInseridas : integer;
begin
  cdsMercadorias.disableControls;
  countMercadoriasInseridas := 0;

  lblInfo.caption := 'Inserindo Mercadorias Novas';
  log(lblInfo.caption);
  IniciarProgressBar(cdsMercadorias.recordcount);

  cdsMercadorias.first;
  while not cdsMercadorias.eof do
  begin
    qryTemp.Close;
    qryTemp.SQL.text := SqlConsultaMercadoriaExp;
    DefineParamType(qryTemp);
    DefineDataTypeString(qryTemp);
    qryTemp.ParamByName('CD_MERCADORIA').value     := cdsMercadoriasCD_MERCADORIA.AsString;
    qryTemp.ParamByName('CD_NCM_SH').value         := cdsMercadoriasCD_NCM_SH.asstring;
    qryTemp.ParamByName('CD_GRUPO').value          := lblGrupo.Caption;
    qryTemp.Open;

    //se não existe mercadoria com esse codigo, ncm e grupo, verifica se existe só com codigo e grupo.
    if qryTemp.IsEmpty then
    begin
      qryTemp.Close;
      qryTemp.SQL.text := SqlConsultaMercadoriaExpSemNCM;
      DefineParamType(qryTemp);
      DefineDataTypeString(qryTemp);
      qryTemp.ParamByName('CD_MERCADORIA').value     := cdsMercadoriasCD_MERCADORIA.AsString;
      qryTemp.ParamByName('CD_GRUPO').value          := lblGrupo.Caption;
      qryTemp.Open;
      if not qryTemp.IsEmpty then
      begin
        Log('Mercadoria já existe com NCM diferente :' + cdsMercadoriasCD_MERCADORIA.asstring + ' ' + cdsMercadoriasNM_MERCADORIA.asstring);
      end;
    end;

    if qryTemp.IsEmpty then
    begin
      Log('Inserindo Mercadoria :' + cdsMercadoriasCD_MERCADORIA.asstring + ' ' +cdsMercadoriasNM_MERCADORIA.asstring);

      qryTemp.close;
      qryTemp.sql.text := SqlInsertMercadoriaExp;
      DefineParamType(qryTemp);
      DefineDataTypeString(qryTemp);
      qryTemp.ParamByName('CD_USUARIO_CRIACAO').value := Str_cd_usuario;
      qryTemp.ParamByName('CD_GRUPO').value           := lblGrupo.Caption;
      qryTemp.ParamByName('CD_MERCADORIA').value      := cdsMercadoriasCD_MERCADORIA.asstring;
      qryTemp.ParamByName('NM_MERCADORIA').value      := cdsMercadoriasNM_MERCADORIA.asstring;
      qryTemp.ParamByName('AP_MERCADORIA').value      := cdsMercadoriasAP_MERCADORIA.asstring;
      qryTemp.ParamByName('CD_UN_MED_COMERC').value   := CodigoUnidadeMedida(trim(cdsMercadoriasDS_UNID_MEDIDA.asstring));
      qryTemp.ParamByName('CD_NCM_SH').value          := cdsMercadoriasCD_NCM_SH.asstring;
      qryTemp.ExecSQL;

      inc(countMercadoriasInseridas);
    end;
    AtualizaProgress;
    cdsMercadorias.next;
  end;
  log(inttoStr(countMercadoriasInseridas) + ' mercadorias novas inseridas');
  cdsMercadorias.enableControls;
end;

procedure TfrmImportarPlanilhaPetronasExp.ImportarItensPE;
var countItensInseridos : integer;
begin
  try
    cdsItensPE_.disableControls;
    countItensInseridos := 0;
    lblInfo.caption := 'Inserindo Itens';
    Log(lblInfo.caption);
    IniciarProgressBar(cdsItensPE_.recordcount);

    cdsItensPE_.first;
    while not cdsItensPE_.eof do
    begin
      lblInfo.caption := 'Inserindo Itens - ' + inttostr(cdsItensPE_.recno);
      Application.ProcessMessages;
      qryTemp.close;
      qryTemp.sql.text := SqlInsertProcessoExpItem;
      DefineParamType(qryTemp);
      DefineDataTypeString(qryTemp);

      qryTemp.ParamByName('QT_MERCADORIA').DataType      := ftfloat;
      qryTemp.ParamByName('VL_UNITARIO').DataType        := ftfloat;
      qryTemp.ParamByName('VL_PESO_LIQ_UNIT').DataType   := ftfloat;
      qryTemp.ParamByName('VL_TOT_ITEM').DataType        := ftfloat;
      qryTemp.ParamByName('VL_TOT_PESO_LIQ').DataType    := ftfloat;
      qryTemp.ParamByName('VL_TOT_PESO_BRUTO').DataType  := ftfloat;

      qryTemp.ParamByName('NR_PROCESSO').value          := lblNrProcesso.caption;
      qryTemp.ParamByName('NR_ITEM').value              := cdsItensPE_NR_ITEM.asstring;
      qryTemp.ParamByName('CD_MERCADORIA').value        := cdsItensPE_CD_MERCADORIA.asstring;
      qryTemp.ParamByName('CD_NCM').value               := cdsItensPE_CD_NCM.asstring;
      qryTemp.ParamByName('CD_UNID_MEDIDA').value       := CodigoUnidadeMedida(trim(cdsItensPE_DS_EMBALAGEM.asstring));

      qryTemp.ParamByName('QT_MERCADORIA').value        := cdsItensPE_QT_MERCADORIA.asFloat;
      qryTemp.ParamByName('VL_UNITARIO').value          := cdsItensPE_VL_UNITARIO.asFloat;
      qryTemp.ParamByName('VL_PESO_LIQ_UNIT').value     := cdsItensPE_VL_PESO_LIQ_UNIT.asFloat;
      qryTemp.ParamByName('VL_TOT_ITEM').value          := cdsItensPE_VL_TOT_ITEM.asFloat;
      qryTemp.ParamByName('VL_TOT_PESO_LIQ').value      := cdsItensPE_VL_TOT_PESO_LIQ.asFloat;
      qryTemp.ParamByName('VL_TOT_PESO_BRUTO').value    := cdsItensPE_VL_TOT_PESO_BRUTO.asFloat;
      qryTemp.ParamByName('TX_MERCADORIA').value        := cdsItensPE_TX_MERCADORIA.asstring;
      qryTemp.ParamByName('CD_FABR_EXPO').value         := '1';

      qryTemp.ExecSQL;

      inc(countItensInseridos);
      AtualizaProgress;
      Application.ProcessMessages;
      cdsItensPE_.next;
    end;

    UpdateQtItensPE;
  finally
    Log(inttoStr(countItensInseridos) + ' itens inseridos');
    cdsItensPE_.enableControls;
  end;
end;

function TfrmImportarPlanilhaPetronasExp.CodigoUnidadeMedida(unidadeMedida : string) : string;
var codUnidadeMedida : String;
begin
  codUnidadeMedida := ConsultaLookUP('TUNID_MEDIDA_BROKER','NM_UNID_MEDIDA',unidadeMedida,'CD_UNID_MEDIDA');
  if codUnidadeMedida = '' then
    codUnidadeMedida := InsereUnidadeMedida(unidadeMedida);

  result := codUnidadeMedida;
end;

function TfrmImportarPlanilhaPetronasExp.InsereUnidadeMedida(unidadeMedida : string) : string;
begin
  result := '';
  qryTemp.close;
  qryTemp.sql.text := SqlInsertUnidadeMedida;
  DefineParamType(qryTemp);
  DefineDataTypeString(qryTemp);

  qryTemp.ParamByName('NM_UNID_MEDIDA').value     := unidadeMedida;
  qryTemp.ParamByName('NM_UNID_MEDIDA_ING').value := unidadeMedida;
  qryTemp.ParamByName('NM_UNID_MEDIDA_ESP').value := unidadeMedida;

  qryTemp.Open;
  if qryTemp.recordCount > 0 then
    result := qryTemp.fieldByName('ID').asstring;
end;

procedure TfrmImportarPlanilhaPetronasExp.LimparTabelaItens;
begin
  lblInfo.caption := 'Limpando Itens';
  Log(lblInfo.caption);
  IniciarProgressBar(3);

  qryTemp.Close;
  qryTemp.SQL.text := SqlDeleteProcessoExpItem;
  DefineParamType(qryTemp);
  DefineDataTypeString(qryTemp);
  qryTemp.ParamByName('NR_PROCESSO').value := lblNrProcesso.caption;
  qryTemp.ExecSQL;
  AtualizaProgress;
end;

function TfrmImportarPlanilhaPetronasExp.SqlConsultaMercadoriaExp : String;
begin
  result :=
  ' SELECT CD_MERCADORIA                   ' + sLineBreak +
  '   FROM TMERCADORIA_EXP                 ' + sLineBreak +
  '  WHERE CD_MERCADORIA = :CD_MERCADORIA  ' + sLineBreak +
  '    AND CD_NCM_SH     = :CD_NCM_SH      ' + sLineBreak +
  '    AND CD_GRUPO      = :CD_GRUPO       ' + sLineBreak ;
end;

function TfrmImportarPlanilhaPetronasExp.SqlConsultaMercadoriaExpSemNCM : String;
begin
  result :=
  ' SELECT CD_MERCADORIA                   ' + sLineBreak +
  '   FROM TMERCADORIA_EXP                 ' + sLineBreak +
  '  WHERE CD_MERCADORIA = :CD_MERCADORIA  ' + sLineBreak +
  '    AND CD_GRUPO      = :CD_GRUPO       ' + sLineBreak ;
end;

function TfrmImportarPlanilhaPetronasExp.SqlInsertUnidadeMedida : string;
begin
  result :=
    '  DECLARE @ID CHAR(3) = (SELECT MAX(CD_UNID_MEDIDA) +1 FROM TUNID_MEDIDA_BROKER) ' + sLineBreak +
    '  INSERT INTO TUNID_MEDIDA_BROKER                             ' + sLineBreak +
    '  (                                                           ' + sLineBreak +
    '   CD_UNID_MEDIDA,                                            ' + sLineBreak +
    '   NM_UNID_MEDIDA,                                            ' + sLineBreak +
    '   IN_ATIVO,                                                  ' + sLineBreak +
    '   NM_UNID_MEDIDA_ING,                                        ' + sLineBreak +
    '   NM_UNID_MEDIDA_ESP                                         ' + sLineBreak +
    '  )                                                           ' + sLineBreak +
    '  VALUES                                                      ' + sLineBreak +
    '  (                                                           ' + sLineBreak +
    '   @ID,                                                       ' + sLineBreak +
    '   :NM_UNID_MEDIDA,                                           ' + sLineBreak +
    '   1,                                                         ' + sLineBreak +
    '   :NM_UNID_MEDIDA_ING,                                       ' + sLineBreak +
    '   :NM_UNID_MEDIDA_ESP                                        ' + sLineBreak +
    '  )                                                           ' + sLineBreak +
    '  SELECT @ID AS ID                                            ' + sLineBreak ;
end;

function TfrmImportarPlanilhaPetronasExp.SqlInsertMercadoriaExp : string;
begin
  result :=
    '  INSERT INTO TMERCADORIA_EXP ' + sLineBreak +
    '  (                           ' + sLineBreak +
    '   CD_MERCADORIA,             ' + sLineBreak +
    '   NM_MERCADORIA,             ' + sLineBreak +
    '   AP_MERCADORIA,             ' + sLineBreak +
    '   CD_GRUPO,                  ' + sLineBreak +
    '   CD_UN_MED_COMERC,          ' + sLineBreak +
    '   CD_NCM_SH,                 ' + sLineBreak +
    '   DT_CRIACAO,                ' + sLineBreak +
    '   CD_USUARIO_CRIACAO,        ' + sLineBreak +
    '   IN_ATIVO                   ' + sLineBreak +
    '  )                           ' + sLineBreak +
    '  VALUES                      ' + sLineBreak +
    '  (                           ' + sLineBreak +
    '   :CD_MERCADORIA,            ' + sLineBreak +
    '   :NM_MERCADORIA,            ' + sLineBreak +
    '   :AP_MERCADORIA,            ' + sLineBreak +
    '   :CD_GRUPO,                 ' + sLineBreak +
    '   :CD_UN_MED_COMERC,         ' + sLineBreak +
    '   :CD_NCM_SH,                ' + sLineBreak +
    '   GETDATE(),                 ' + sLineBreak +
    '   :CD_USUARIO_CRIACAO,       ' + sLineBreak +
    '   1                          ' + sLineBreak +
    '  )                           ' + sLineBreak ;
end;

function TfrmImportarPlanilhaPetronasExp.SqlInsertProcessoExpItem : String;
begin
  result :=
  '  INSERT INTO TPROCESSO_EXP_ITEM  ' + sLineBreak +
  '  (                               ' + sLineBreak +
  '   NR_PROCESSO,                   ' + sLineBreak +
  '   NR_ITEM ,                      ' + sLineBreak +
  '   CD_MERCADORIA ,                ' + sLineBreak +
  '   CD_NCM,                        ' + sLineBreak +
  '   CD_UNID_MEDIDA,                ' + sLineBreak +
  '   QT_MERCADORIA,                 ' + sLineBreak +
  '   CD_FABR_EXPO,                  ' + sLineBreak +
  '   VL_UNITARIO,                   ' + sLineBreak +
  '   VL_PESO_LIQ_UNIT,              ' + sLineBreak +
  '   VL_TOT_ITEM,                   ' + sLineBreak +
  '   VL_TOT_PESO_LIQ,               ' + sLineBreak +
  '   VL_TOT_PESO_BRUTO,             ' + sLineBreak +
  '   TX_MERCADORIA                  ' + sLineBreak +
  '  )                               ' + sLineBreak +
  '  VALUES                          ' + sLineBreak +
  '  (                               ' + sLineBreak +
  '   :NR_PROCESSO,                  ' + sLineBreak +
  '   :NR_ITEM ,                     ' + sLineBreak +
  '   :CD_MERCADORIA ,               ' + sLineBreak +
  '   :CD_NCM,                       ' + sLineBreak +
  '   :CD_UNID_MEDIDA,               ' + sLineBreak +
  '   :QT_MERCADORIA,                ' + sLineBreak +
  '   :CD_FABR_EXPO,                 ' + sLineBreak +
  '   :VL_UNITARIO,                  ' + sLineBreak +
  '   :VL_PESO_LIQ_UNIT,             ' + sLineBreak +
  '   :VL_TOT_ITEM,                  ' + sLineBreak +
  '   :VL_TOT_PESO_LIQ,              ' + sLineBreak +
  '   :VL_TOT_PESO_BRUTO,            ' + sLineBreak +
  '   :TX_MERCADORIA                 ' + sLineBreak +
  '  )                               ' + sLineBreak ;
end;

function TfrmImportarPlanilhaPetronasExp.SqlDeleteProcessoExpItem : String;
begin
  result := ' DELETE FROM TPROCESSO_EXP_ITEM WHERE NR_PROCESSO = :NR_PROCESSO';
end;

function TfrmImportarPlanilhaPetronasExp.SqlUpdateProcessoExp : String;
begin
  result := ' UPDATE TPROCESSO_EXP SET QT_TOTAL_ITENS = :QT_TOTAL_ITENS WHERE NR_PROCESSO = :NR_PROCESSO';
end;

procedure TfrmImportarPlanilhaPetronasExp.DefineParamType(var Query : TQuery);
var i: integer;
begin
  for i := 0 to Query.ParamCount -1 do
  begin
    Query.Params[i].ParamType := ptInput;
  end;
end;

procedure TfrmImportarPlanilhaPetronasExp.DefineDataTypeString(var Query : TQuery);
var i: integer;
begin
  for i := 0 to Query.ParamCount -1 do
  begin
    Query.Params[i].DataType := ftString;
  end;
end;

function TfrmImportarPlanilhaPetronasExp.Distinct(CDS: TClientDataSet; FieldName: string): TStringList;
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

procedure TfrmImportarPlanilhaPetronasExp.IniciarProgressBar(total : integer);
begin
  ProgressBar1.Max      := total;
  ProgressBar1.Position := 0;
  Application.ProcessMessages;
end;

procedure TfrmImportarPlanilhaPetronasExp.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmImportarPlanilhaPetronasExp.rMemoChange(Sender: TObject);
begin
  SendMessage(rMemo.Handle, EM_LINESCROLL, 0,rMemo.Lines.Count);
end;

procedure TfrmImportarPlanilhaPetronasExp.Log(msg : String);
begin
  rMemo.Lines.Add(formatdatetime('dd/mm/yyyy hh:mm:ss ', now) + msg);
  Application.ProcessMessages;
end;

procedure TfrmImportarPlanilhaPetronasExp.AtualizaProgress;
begin
  ProgressBar1.Position := ProgressBar1.Position +1;
end;

end.




