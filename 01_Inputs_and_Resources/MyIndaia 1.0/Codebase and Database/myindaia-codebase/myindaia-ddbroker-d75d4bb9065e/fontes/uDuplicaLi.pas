unit uDuplicaLi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, FMTBcd, SqlExpr, PGGP017, cxCheckBox,
  Provider, DBClient;

const
  UM_CHECK = WM_USER + 10000;
  
type
  TfrmDuplicaLI = class(TForm)
    Panel1: TPanel;
    qryMain: TSQLQuery;
    dsMain: TDataSource;
    qryMainNR_PROCESSO: TStringField;
    qryMainCD_IMPORTADOR: TStringField;
    qryMainAP_EMPRESA: TStringField;
    qryMainDT_PROCESSO_LI: TSQLTimeStampField;
    qryMainNR_REGISTRO_LI: TStringField;
    qryMainDT_REGISTRO_LI: TSQLTimeStampField;
    DataSetProvider1: TDataSetProvider;
    cdsMain: TClientDataSet;
    cdsMainNR_PROCESSO: TStringField;
    cdsMainCD_IMPORTADOR: TStringField;
    cdsMainAP_EMPRESA: TStringField;
    cdsMainDT_PROCESSO_LI: TSQLTimeStampField;
    cdsMainNR_REGISTRO_LI: TStringField;
    cdsMainDT_REGISTRO_LI: TSQLTimeStampField;
    cdsMaincbx: TBooleanField;
    Panel2: TPanel;
    cxGrid: TcxGrid;
    cxGridDBTableView: TcxGridDBTableView;
    colCheck: TcxGridDBColumn;
    cxGridDBTableViewNR_PROCESSO: TcxGridDBColumn;
    cxGridDBTableViewCD_IMPORTADOR: TcxGridDBColumn;
    cxGridDBTableViewAP_EMPRESA: TcxGridDBColumn;
    cxGridDBTableViewDT_PROCESSO_LI: TcxGridDBColumn;
    cxGridDBTableViewNR_REGISTRO_LI: TcxGridDBColumn;
    cxGridDBTableViewDT_REGISTRO_LI: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Panel3: TPanel;
    lbl_nr_processo: TLabel;
    btn_nr_processo: TSpeedButton;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    msk_nr_processo: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    edt_nm_produto: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    msk_cd_produto: TMaskEdit;
    chk_ult_processos: TCheckBox;
    Panel4: TPanel;
    Label1: TLabel;
    btn_nr_processoDestino: TSpeedButton;
    msk_nr_processoDestino: TMaskEdit;
    lbxProcessoDestino: TListBox;
    Panel5: TPanel;
    SpeedButton2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_nr_processoClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure colCheckPropertiesEditValueChanged(Sender: TObject);
    procedure cxGridDBTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGridDBTableViewMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btn_nr_processoDestinoClick(Sender: TObject);
    procedure msk_nr_processoDestinoExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    function ConsultaProcesso(UltimosProcessos: Boolean; const Cliente: string = ''): string;
  public
    class procedure Execute;
    procedure Check(AGridView: TcxGridDBTableView);
    procedure UmCheck(var Message: TMessage); message UM_CHECK;
  end;
{
var
  frmDuplicaLI: TfrmDuplicaLI;
}
implementation

uses PGGP001, Funcoes, ConsOnLineEx, KrLI;

{$R *.dfm}

class procedure TfrmDuplicaLI.Execute;
var
  frmDuplicaLI: TfrmDuplicaLI;
begin
  frmDuplicaLI := TfrmDuplicaLI.Create(nil);
  try
    frmDuplicaLI.ShowModal;
  finally
    frmDuplicaLI.Free;
  end;
end;

procedure TfrmDuplicaLI.FormCreate(Sender: TObject);
begin
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_produto.Text  := str_cd_produto;
  btn_co_unid_negClick(Sender);
  btn_co_produtoClick(Sender);
end;

procedure TfrmDuplicaLI.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg);
    msk_cd_unid_negExit(nil);
  end
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');
end;

procedure TfrmDuplicaLI.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto);
    msk_cd_produtoExit(nil);
  end
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure TfrmDuplicaLI.msk_cd_unid_negExit(Sender: TObject);
begin
  btn_co_unid_negClick(Sender);
end;

procedure TfrmDuplicaLI.msk_cd_produtoExit(Sender: TObject);
begin
  btn_co_produtoClick(Sender);
end;

function TfrmDuplicaLI.ConsultaProcesso(UltimosProcessos: Boolean; const Cliente: string): string;
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  try
    vListAux.Add('SELECT SUBSTRING(NR_PROCESSO, 5, 14) AS NR_PROCESSO, DT_ABERTURA, ' );
    vListAux.Add('  CD_CLIENTE,    (SELECT AP_EMPRESA    FROM TEMPRESA_NAC ( NOLOCK ) WHERE CD_EMPRESA    = PR.CD_CLIENTE)    AS NM_CLIENTE,    ' );
    vListAux.Add('  CD_SERVICO,    (SELECT NM_SERVICO    FROM TSERVICO     ( NOLOCK ) WHERE CD_SERVICO    = PR.CD_SERVICO)    AS NM_SERVICO,    ' );
    vListAux.Add('  CD_EMBARCACAO, (SELECT NM_EMBARCACAO FROM TEMBARCACAO  ( NOLOCK ) WHERE CD_EMBARCACAO = PR.CD_EMBARCACAO) AS NM_EMBARCACAO, ' );
    vListAux.Add('  NR_CONHECIMENTO, NR_CONHECIMENTO_MASTER, NR_DI, NR_MANIFESTO    ' );
    vListAux.Add('FROM TPROCESSO PR ( NOLOCK ) ' );
    vListAux.Add('WHERE CD_UNID_NEG  = ' + QuotedStr(msk_cd_unid_neg.Text) );
    vListAux.Add('  AND CD_PRODUTO   = ' + QuotedStr(msk_cd_produto.Text)  );
    vListAux.Add('  AND IN_CANCELADO = ''0''' );
    if Cliente <> '' then
      vListAux.Add('  AND CD_CLIENTE = ' + QuotedStr(Cliente));
    if UltimosProcessos then
      vListAux.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));

    Result := ConsultaOnLineExSQLList(vListAux,'Processos',
        ['NR_PROCESSO' ,'DT_ABERTURA'     ,'CD_CLIENTE'  ,'NM_CLIENTE','CD_SERVICO'  ,'NM_SERVICO','CD_EMBARCACAO'  ,'NM_EMBARCACAO','NR_CONHECIMENTO' ,'NR_CONHECIMENTO_MASTER' ,'NR_DI','NR_MANIFESTO' ],
        ['Nr. Processo','Data de Abertura','Cód. Cliente','Cliente'   ,'Cód. Serviço','Serviço'   ,'Cod. Embarcação','Embarcação'   ,'Nr. Conhecimento','Nr. Conhecimento Master','DI'   ,'Nr. Manifesto'],
         'NR_PROCESSO',nil);
  finally
    vListAux.Free;
  end;
end;

procedure TfrmDuplicaLI.btn_nr_processoClick(Sender: TObject);
begin
  msk_nr_processo.Text := ConsultaProcesso(chk_ult_processos.Checked);
  msk_nr_processoExit(nil);
end;

procedure TfrmDuplicaLI.msk_nr_processoExit(Sender: TObject);
begin
  if msk_nr_processo.Text <> '' then
  begin
    cdsMain.Close;
    qryMain.Close;
    qryMain.SQL.Text := ' SELECT  L.NR_PROCESSO, L.CD_IMPORTADOR, E.AP_EMPRESA, L.DT_PROCESSO_LI, L.NR_REGISTRO_LI, L.DT_REGISTRO_LI '+
                        ' FROM TLICENCA_IMPORTACAO L '+
                        ' INNER JOIN TEMPRESA_NAC E on E.CD_EMPRESA = L.CD_IMPORTADOR '+
                        ' where NR_PROCESSO LIKE  '+QuotedStr(Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text )+'%')+
                        ' ORDER BY L.NR_PROCESSO ';
    cdsMain.Open;
  end;
end;

{Incio das rotinas de tratamento do checbox}

procedure TfrmDuplicaLI.colCheckPropertiesEditValueChanged(
  Sender: TObject);
var
  ACheck: TcxCheckBox;
  AGridSite: TcxGridSite;
  AGridView: TcxGridDBTableView;
begin
  ACheck := Sender as TcxCheckBox;
  AGridSite := ACheck.Parent as TcxGridSite;
  AGridView := AGridSite.GridView as TcxGridDBTableView;
  Check(AGridView);
end;

procedure TfrmDuplicaLI.cxGridDBTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
  AView: TcxGridDBTableView;
begin
  AView := Sender as TcxGridDBTableView;
  PostMessage(Handle, UM_CHECK, Integer(AView), 0);
end;

procedure TfrmDuplicaLI.cxGridDBTableViewMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  AHitTest: TcxCustomGridHitTest;
  AView: TcxGridDBTableView;
  I, J: integer;
begin
  AView := TcxGridDBTableView(TcxGridSite(Sender).GridView);
  AHitTest := AView.ViewInfo.GetHitTest(X,Y);
  if AHitTest is TcxGridRowIndicatorHitTest then
  begin
    I := TcxGridRowIndicatorHitTest(AHitTest).GridRecord.RecordIndex;
    J := colCheck.Index;
    AView.DataController.Values[I, J] := True;
    Check(AView);
  end;
end;

procedure TfrmDuplicaLI.Check(AGridView: TcxGridDBTableView);
var
  i, ARowIndex: integer;
begin
  for i:= 0 to AGridView.DataController.RecordCount - 1 do
  begin
    ARowIndex := AGridView.DataController.GetRowIndexByRecordIndex(i, False);
    if AGridView.DataController.Values[i, colCheck.Index] = true then
      AGridView.DataController.ChangeRowSelection(ARowIndex, true)
    else
      AGridView.DataController.ChangeRowSelection(ARowIndex, false);
  end;
end;

procedure TfrmDuplicaLI.UmCheck(var Message: TMessage);
begin
  Check(TcxGridDBTableView(Message.WParam));
end;

{Fim das rotinas de tratamento do checbox}

procedure TfrmDuplicaLI.btn_nr_processoDestinoClick(Sender: TObject);
begin
  msk_nr_processoDestino.Text := ConsultaProcesso(False, cdsMainCD_IMPORTADOR.AsString);
  msk_nr_processoDestinoExit(nil);
end;

procedure TfrmDuplicaLI.msk_nr_processoDestinoExit(Sender: TObject);
var
  Processo: string;
begin
  if Length(msk_nr_processoDestino.Text) >= 12 then
  begin
    Processo := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processoDestino.Text );
    if lbxProcessoDestino.Items.IndexOf(Processo) >= 0 then
    begin
      ShowMessage('Processo já se encontra na lista.');
      Exit;
    end;
    lbxProcessoDestino.Items.Add(Processo);
    msk_nr_processoDestino.Clear;
    msk_nr_processoDestino.SetFocus;
  end;
end;

procedure TfrmDuplicaLI.SpeedButton2Click(Sender: TObject);
var
  LIs: TStrings;
  I: Integer;
begin
  if MessageDlg('Confirma duplicação das LI''s?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk then
  begin
    LIs := TStringList.Create;
    try
      for I := 0 to cxGridDBTableView.Controller.SelectedRecordCount - 1 do
        LIs.Add(VarToStr(cxGridDBTableView.Controller.SelectedRecords[I].Values[1]));
      DuplicarLI(LIs, lbxProcessoDestino.Items);
      ShowMessage('Concluído.');
    finally
      LIs.Free;
    end;
  end;
end;

procedure TfrmDuplicaLI.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

end.
