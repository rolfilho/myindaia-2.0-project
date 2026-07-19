unit uDIPreCalculo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, Mask, Buttons, Grids, DBGrids, DB,
  ToolEdit, CurrEdit;

type
  Tfrm_DI_PreCalculo = class(TForm)
    pnlOpcoes: TPanel;
    pnlCapa: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    gbFrete: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    gbFOB: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Label8: TLabel;
    DBNavigator1: TDBNavigator;
    edtAdicaoAtual: TEdit;
    edtAdicaoTotal: TEdit;
    Label9: TLabel;
    gbSeguro: TGroupBox;
    dbedt_CD_MOEDA_MLE: TDBEdit;
    dblkcb_NM_MOEDA_MLE: TDBLookupComboBox;
    dbedt_VL_MLE_MOEDA: TDBEdit;
    dbedt_CD_MOEDA_FRETE: TDBEdit;
    dblkcb_NM_MOEDA_FRETE: TDBLookupComboBox;
    dbedt_VL_FRETE_MOEDA: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    dbedt_VL_SEGURO_MOEDA: TDBEdit;
    dbedt_CD_MOEDA_SEGURO: TDBEdit;
    dblkcb_NM_MOEDA_SEGURO: TDBLookupComboBox;
    Label12: TLabel;
    dbedt_TX_MLE: TDBEdit;
    Label13: TLabel;
    dbedt_TX_FRETE: TDBEdit;
    Label14: TLabel;
    dbedt_TX_SEGURO: TDBEdit;
    dbedt_INCOTERM: TDBEdit;
    dbedt_TX_DOLAR: TDBEdit;
    btnCalcular: TSpeedButton;
    SpeedButton3: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    dbtxtVL_II: TDBText;
    dbtxtVL_IPI: TDBText;
    dbtxt_VL_PIS: TDBText;
    dbtxt_VL_COFINS: TDBText;
    dbtxt_VL_ICMS: TDBText;
    dbtxt_VL_OUTRAS_DESP_REAIS: TDBText;
    dbtxt_VL_TOTAL: TDBText;
    Label24: TLabel;
    dbedt_VL_BASE_PIS_COFINS: TDBText;
    Label25: TLabel;
    dbtxt_VL_BASE_ICMS: TDBText;
    btnExcluirAdicao: TSpeedButton;
    DBText1: TDBText;
    DBText2: TDBText;
    gbAcrescimosDeducoes: TGroupBox;
    Label27: TLabel;
    dbedt_VL_ACRESCIMOS_REAIS: TDBEdit;
    Label28: TLabel;
    dbedt_VL_DEDUCOES_REAIS: TDBEdit;
    gbCIF: TGroupBox;
    Label16: TLabel;
    dbedt_VL_CIF_DOLAR: TDBEdit;
    Label26: TLabel;
    cedt_CIF_REAIS: TCurrencyEdit;
    procedure edtAdicaoAtualExit(Sender: TObject);
    procedure edtAdicaoAtualKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_INCOTERMEnter(Sender: TObject);
    procedure dbedt_INCOTERMExit(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnExcluirAdicaoClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_TX_DOLARChange(Sender: TObject);
    procedure edtAdicaoAtualChange(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AtualizaStatusBotoes;
    procedure Execute(AProcesso: String);
  end;     

var
  frm_DI_PreCalculo: Tfrm_DI_PreCalculo;

implementation

uses dDIPreCalculo, ConsOnlineEx;

{$R *.dfm}

procedure Tfrm_DI_PreCalculo.edtAdicaoAtualExit(Sender: TObject);
begin
  if edtAdicaoAtual.Text = '' then
    edtAdicaoAtual.Text := '1';
  if StrToInt(edtAdicaoAtual.Text) > StrToInt(edtAdicaoTotal.Text) then
    edtAdicaoAtual.Text := edtAdicaoTotal.Text;
  datm_DI_PreCalculo.qryPreCalculoAdicao.Locate('NR_ADICAO', edtAdicaoAtual.Text, []);
end;

procedure Tfrm_DI_PreCalculo.edtAdicaoAtualKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9']) then
    Key := #0;
end;

procedure Tfrm_DI_PreCalculo.dbedt_INCOTERMEnter(Sender: TObject);
begin
  TDBEdit(Sender).Color := clInfoBk;
end;

procedure Tfrm_DI_PreCalculo.dbedt_INCOTERMExit(Sender: TObject);
begin
  TDBEdit(Sender).Color := clWindow;
end;

procedure Tfrm_DI_PreCalculo.btnSalvarClick(Sender: TObject);
begin
  if datm_DI_PreCalculo.qryPreCalculoCapa.State in [dsEdit, dsInsert] then
    datm_DI_PreCalculo.qryPreCalculoCapa.Post;
  if datm_DI_PreCalculo.qryPreCalculoAdicao.State in [dsEdit, dsInsert] then
    datm_DI_PreCalculo.qryPreCalculoAdicao.Post;
end;

procedure Tfrm_DI_PreCalculo.btnCancelarClick(Sender: TObject);
begin
  if datm_DI_PreCalculo.qryPreCalculoCapa.State in [dsEdit, dsInsert] then
    datm_DI_PreCalculo.qryPreCalculoCapa.Cancel;
end;

procedure Tfrm_DI_PreCalculo.AtualizaStatusBotoes;
begin
  btnSalvar.Enabled        := (datm_DI_PreCalculo.qryPreCalculoCapa.State in [dsEdit, dsInsert]);
  btnCancelar.Enabled      := btnSalvar.Enabled;
  btnCalcular.Enabled      := not ((datm_DI_PreCalculo.qryPreCalculoCapa.State in [dsEdit, dsInsert]) or (datm_DI_PreCalculo.qryPreCalculoAdicao.State in [dsEdit, dsInsert]));
  btnExcluirAdicao.Enabled := (not datm_DI_PreCalculo.qryPreCalculoAdicao.Eof) and (not (datm_DI_PreCalculo.qryPreCalculoAdicao.State in [dsEdit, dsInsert]));
end;

procedure Tfrm_DI_PreCalculo.btnCalcularClick(Sender: TObject);
var
  SomaCIF: Real;
  NrAdicao: Integer;
begin
  SomaCIF := 0;
  NrAdicao := datm_DI_PreCalculo.qryPreCalculoAdicaoNR_ADICAO.AsInteger;
  datm_DI_PreCalculo.qryPreCalculoAdicao.DisableControls;
  datm_DI_PreCalculo.qryPreCalculoAdicao.First;
  while not datm_DI_PreCalculo.qryPreCalculoAdicao.Eof do
  begin
    SomaCIF := SomaCIF + datm_DI_PreCalculo.qryPreCalculoAdicaoVL_CIF_REAIS.AsFloat;
    datm_DI_PreCalculo.qryPreCalculoAdicao.Next;
  end;
  datm_DI_PreCalculo.qryPreCalculoAdicao.Locate('NR_ADICAO', NrAdicao, []);
  datm_DI_PreCalculo.qryPreCalculoAdicao.EnableControls;

  if Abs((datm_DI_PreCalculo.qryPreCalculoCapaVL_CIF_DOLAR.AsFloat * datm_DI_PreCalculo.qryPreCalculoCapaTX_DOLAR.AsFloat) - SomaCIF) > 0.02 then
    MessageDlg('O valor CIF da capa não bate com a soma dos itens.'#13'Verifique os valores e a taxa do Dolar antes de continuar.', mtInformation, [mbOk], 0)
  else
  begin
    datm_DI_PreCalculo.qryTotais.Close;
    if datm_DI_PreCalculo.SP_PRE_CALCULO.Active then
      datm_DI_PreCalculo.SP_PRE_CALCULO.Close;
    datm_DI_PreCalculo.SP_PRE_CALCULO.ParamByName('@NR_PROCESSO').AsString := datm_DI_PreCalculo.qryPreCalculoCapaNR_PROCESSO.AsString;
    datm_DI_PreCalculo.SP_PRE_CALCULO.ExecProc;
    datm_DI_PreCalculo.SP_PRE_CALCULO.Close;
    datm_DI_PreCalculo.qryTotais.Open;
  end;
end;

procedure Tfrm_DI_PreCalculo.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_DI_PreCalculo.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
  if datm_DI_PreCalculo.qryPreCalculoCapa.State in [dsEdit, dsInsert] then
    case MessageDlg('Há dados não salvos na capa.'#13'Deseja salvar antes de sair?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes: btnSalvar.Click;
      mrNo: ;
      mrCancel: CanClose := False;
    end;
  if datm_DI_PreCalculo.qryPreCalculoAdicao.State in [dsEdit, dsInsert] then
    case MessageDlg('Há dados não salvos na adição.'#13'Deseja salvar antes de sair?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes: datm_DI_PreCalculo.qryPreCalculoAdicao.Post;
      mrNo: ;
      mrCancel: CanClose := False;
    end;
end;

procedure Tfrm_DI_PreCalculo.Execute(AProcesso: String);
begin
  if datm_DI_PreCalculo.qryPreCalculoCapa.Active then
    datm_DI_PreCalculo.qryPreCalculoCapa.Close;
  datm_DI_PreCalculo.qryPreCalculoCapa.ParamByName('NR_PROCESSO').AsString := AProcesso;
  datm_DI_PreCalculo.qryPreCalculoCapa.Open;
  if datm_DI_PreCalculo.qryPreCalculoCapa.IsEmpty then
  begin
    datm_DI_PreCalculo.qryPreCalculoCapa.Insert;
    datm_DI_PreCalculo.qryPreCalculoCapaNR_PROCESSO.AsString        := AProcesso;
    datm_DI_PreCalculo.qryPreCalculoCapaVL_FOB_MOEDA.AsFloat        := 0;
    datm_DI_PreCalculo.qryPreCalculoCapaTX_FOB.AsFloat              := 0;
    datm_DI_PreCalculo.qryPreCalculoCapaVL_FRETE_MOEDA.AsFloat      := 0;
    datm_DI_PreCalculo.qryPreCalculoCapaTX_FRETE.AsFloat            := 0;
    datm_DI_PreCalculo.qryPreCalculoCapaVL_SEGURO_MOEDA.AsFloat     := 0;
    datm_DI_PreCalculo.qryPreCalculoCapaTX_SEGURO.AsFloat           := 0;
    datm_DI_PreCalculo.qryPreCalculoCapaVL_CIF_DOLAR.AsFloat        := 0;
    //datm_DI_PreCalculo.qryPreCalculoCapaTX_DOLAR.AsString           := ConsultaLookUPSQL(' SELECT CONVERT(FLOAT, REPLACE(ISNULL(TAXA_CONVERSAO, 0), '','', ''.'')) AS TX' +
    //                                                                                     ' FROM TCONVERSAO_CAMBIO ' +
    //                                                                                     ' WHERE CODIGO = ''220''', 'TX');

    // Comentado acima e utilizando abaixo porque em algum momento pegou taxa errada - Michel - 21/11/2011
    datm_DI_PreCalculo.qryPreCalculoCapaTX_DOLAR.AsFloat            := datm_DI_PreCalculo.GetTaxa('220');

    datm_DI_PreCalculo.qryPreCalculoCapaVL_ACRESCIMOS_REAIS.AsFloat := 0;
    datm_DI_PreCalculo.qryPreCalculoCapaVL_DEDUCOES_REAIS.AsFloat   := 0;
    datm_DI_PreCalculo.qryPreCalculoCapa.Post;
  end;

  if datm_DI_PreCalculo.qryPreCalculoAdicao.Active then
    datm_DI_PreCalculo.qryPreCalculoAdicao.Close;
  datm_DI_PreCalculo.qryPreCalculoAdicao.Open;
  if datm_DI_PreCalculo.qryTotais.Active then
    datm_DI_PreCalculo.qryTotais.Close;
  datm_DI_PreCalculo.qryTotais.Open;
  ShowModal;
end;

procedure Tfrm_DI_PreCalculo.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_DI_PreCalculo, datm_DI_PreCalculo);
end;

procedure Tfrm_DI_PreCalculo.FormDestroy(Sender: TObject);
begin
  FreeAndNil(datm_DI_PreCalculo);
end;

procedure Tfrm_DI_PreCalculo.btnExcluirAdicaoClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja excluir a adição?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) = mrYes then
    datm_DI_PreCalculo.qryPreCalculoAdicao.Delete;
end;

procedure Tfrm_DI_PreCalculo.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (Key = VK_DELETE) then
    Abort;
end;

procedure Tfrm_DI_PreCalculo.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure Tfrm_DI_PreCalculo.dbedt_TX_DOLARChange(Sender: TObject);
var
  Taxa, CIF, Reais: Double;
begin
  if (dbedt_TX_DOLAR.Text = '') or (dbedt_VL_CIF_DOLAR.Text = '') then
    Reais := 0
  else
  begin
    if TryStrToFloat(StringReplace(dbedt_TX_DOLAR.Text, '.', '', []), Taxa) and
       TryStrToFloat(StringReplace(dbedt_VL_CIF_DOLAR.Text, '.', '', []), CIF) Then
      Reais := CIF * Taxa
    else
      Reais := 0;
  end;
  cedt_CIF_Reais.Value := Reais;
end;

procedure Tfrm_DI_PreCalculo.edtAdicaoAtualChange(Sender: TObject);
begin
  AtualizaStatusBotoes;
end;

end.
