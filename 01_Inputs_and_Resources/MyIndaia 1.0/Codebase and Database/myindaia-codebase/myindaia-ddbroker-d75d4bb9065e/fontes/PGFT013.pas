unit PGFT013;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCRPE32, StdCtrls, Mask, Buttons, ExtCtrls, Funcoes;

type
  Tfrm_imp_lanc_fat_cc = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    btn_co_produto: TSpeedButton;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    Label2: TLabel;
    lbl_grupo: TLabel;
    btn_co_grupo: TSpeedButton;
    lbl_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_dt_lancamento: TMaskEdit;
    btn_iniciar: TButton;
    btn_fechar: TButton;
    chk_cliente_ativo: TCheckBox;
    chk_clientes: TCheckBox;
    msk_cd_grupo: TMaskEdit;
    edt_nm_grupo: TEdit;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    Crp_Lancamento_Faturamento: TCRPE;
    Shape1: TShape;
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure msk_dt_lancamentoExit(Sender: TObject);
    procedure btn_iniciarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
  private
    { Private declarations }
  public
    str_relatorio:integer;
    { Public declarations }
  end;

var
  frm_imp_lanc_fat_cc: Tfrm_imp_lanc_fat_cc;

implementation

{$R *.DFM}
uses GSMLIB, PGFT014, PGSM018, PGSM010, PGGP001, PGSM119, PGSM024;


procedure Tfrm_imp_lanc_fat_cc.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.Text = '' then
  begin
    edt_nm_unid_neg.Text := 'Todas';
    Exit;
  end;
  ValCodEdt(msk_cd_unid_neg);
  with datm_imp_lanc_fat_cc.qry_unid_neg_ do
  begin
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Unidade de Negócio não encontrada!', 2 );
      msk_cd_unid_neg.Clear;
      edt_nm_unid_neg.Clear;
    end
    else edt_nm_unid_neg.Text := FieldByName('AP_UNID_NEG').AsString;
    Close;
  end;
end;

procedure Tfrm_imp_lanc_fat_cc.btn_co_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    msk_cd_unid_negExit(nil);
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    end;
  end;
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_imp_lanc_fat_cc.msk_cd_produtoExit(Sender: TObject);
begin
  edt_nm_produto.Clear;
  if msk_cd_produto.Text = '' then
  begin
    edt_nm_produto.Text := 'Todos';
    Exit;
  end;
  ValCodEdt(msk_cd_produto);
  with datm_imp_lanc_fat_cc.qry_produto_ do
  begin
    ParamByName('CD_PRODUTO').AsString := msk_cd_Produto.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Produto não encontrado!', 2 );
      msk_cd_Produto.Clear;
      edt_nm_Produto.Clear;
    end
    else edt_nm_produto.Text := FieldByName('AP_PRODUTO').AsString;
    Close;
  end;
end;

procedure Tfrm_imp_lanc_fat_cc.btn_co_produtoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';
  Application.CreateForm(Tfrm_produto, frm_produto);
  with frm_produto do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_produto.Cons_OnLine_Texto := msk_cd_produto.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
  end;
  msk_cd_produtoExit(nil);
end;

procedure Tfrm_imp_lanc_fat_cc.btn_co_grupoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';
  Application.CreateForm(Tfrm_grupo, frm_grupo);
  with frm_grupo do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    if frm_grupo.Cons_OnLine_Texto <> '' then msk_cd_grupo.Text := frm_grupo.Cons_OnLine_Texto;
  end;
  msk_cd_grupoExit(nil);
end;

procedure Tfrm_imp_lanc_fat_cc.btn_co_clienteClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';
  Application.CreateForm(Tfrm_cliente, frm_cliente);
  with frm_cliente do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_cliente.Cons_OnLine_Texto := msk_cd_cliente.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_cliente.Text := frm_cliente.Cons_OnLine_Texto;
  end;
  msk_cd_clienteExit(nil);
end;

procedure Tfrm_imp_lanc_fat_cc.btn_fecharClick(Sender: TObject);
begin
//  Close;
end;

procedure Tfrm_imp_lanc_fat_cc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_imp_lanc_fat_cc.free;
  Crp_Lancamento_Faturamento.Free;
  action:= caFree;
end;

procedure Tfrm_imp_lanc_fat_cc.msk_dt_lancamentoExit(Sender: TObject);
begin
  if msk_dt_lancamento.text = '  /  /    ' then exit;
  try
    StrToDate(msk_dt_lancamento.Text);
  except
    on EConvertError do
    begin
      BoxMensagem('Data Inválida!',2);
      msk_dt_lancamento.Clear;
      msk_dt_lancamento.SetFocus;
    end;
  end;
end;

procedure Tfrm_imp_lanc_fat_cc.btn_iniciarClick(Sender: TObject);
var
  ativo, cliente_only, grupo, cliente : String;
begin
  if msk_dt_lancamento.Text = '  /  /    ' then
  begin
    BoxMensagem('Informe a Data!',2);
    msk_dt_lancamento.SetFocus;
    Exit;
  end;
  if chk_cliente_ativo.State = cbChecked then
    ativo := '1'
  else
    ativo := '0';
  if chk_clientes.State = cbChecked then
    cliente_only := '1'
  else
    cliente_only := '0';
  if msk_cd_grupo.Text = '' then
    grupo := 'X'
  else
    grupo := msk_cd_grupo.Text;
  if msk_cd_cliente.Text = '' then
    cliente := 'X'
  else
    cliente := msk_cd_cliente.Text;

  with Crp_Lancamento_Faturamento do
  begin
    Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

    case str_relatorio of
      1 : ReportName  := cDir_Rpt + '\CRFT018.RPT';
      2 : ReportName  := cDir_Rpt + '\CRES001.RPT';
    end;
    ReportTitle := Caption +  #13 + 'Data de Referência: ' + msk_dt_lancamento.Text;
    Formulas[0] := 'Dt_Lancamento = ' + DataCrystal(msk_dt_lancamento.Text);
    Formulas[1] := 'Unidade = "' + msk_cd_unid_neg.Text + '"';
    Formulas[2] := 'Produto = "' + msk_cd_produto.Text + '"';
    if str_relatorio = 2 then
    begin
      Formulas[3] := 'Grupo = "' + grupo + '"';
      Formulas[4] := 'Cliente = "' + cliente + '"';
      Formulas[5] := 'Ativo = "' + ativo + '"';
      Formulas[6] := 'Clienteonly = "' + cliente_only + '"';
    end;
    Execute;
  end;

end;

procedure Tfrm_imp_lanc_fat_cc.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_imp_lanc_fat_cc, datm_imp_lanc_fat_cc);
end;

procedure Tfrm_imp_lanc_fat_cc.FormShow(Sender: TObject);
begin
  case str_relatorio of
  1:begin
      Caption:= 'Relação dos Lançamentos do Faturamento';
      Label2.Caption:= 'Data do Lançamento';
      Label2.Top := Label2.Top - 90;
      msk_dt_lancamento.Top := msk_dt_lancamento.Top - 90;
      chk_cliente_ativo.Top := chk_cliente_ativo.Top - 90;
      chk_clientes.Top := chk_clientes.Top - 90;
      btn_iniciar.Top := btn_iniciar.Top - 90;
      btn_fechar.Top := btn_fechar.Top - 90;
      frm_imp_lanc_fat_cc.Height :=  frm_imp_lanc_fat_cc.Height - 90;
    end;
  2:begin
      Caption:= 'Vencimento da Validade no Credenciamento da Receita Federal';
      Label2.Caption:= 'Data de Referência';
      chk_cliente_ativo.Visible := True;
      chk_clientes.Visible := True;
      lbl_grupo.Visible := True;
      msk_cd_grupo.Visible := True;
      edt_nm_grupo.Visible := True;
      btn_co_grupo.Visible := True;
      lbl_cliente.Visible := True;
      msk_cd_cliente.Visible := True;
      edt_nm_cliente.Visible := True;
      btn_co_cliente.Visible := True;
    end;
  end;
end;

procedure Tfrm_imp_lanc_fat_cc.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto then btn_co_produtoClick(nil);
    if Sender = msk_cd_grupo then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente then btn_co_clienteClick(nil);
  end;
end;

procedure Tfrm_imp_lanc_fat_cc.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.Text = '' then
  begin
    //edt_nm_grupo.Text := 'Todos'
    edt_nm_grupo.Text := '';
    Exit;
  end;
  ValCodEdt(msk_cd_grupo);
  with datm_imp_lanc_fat_cc.qry_grupo_ do
  begin
    Close;
    ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Grupo de Clientes não encontrado!',2);
      msk_cd_grupo.Clear;
      msk_cd_grupo.SetFocus;
    end
    else edt_nm_grupo.Text:= FieldByName('NM_GRUPO').AsString;
    Close;
  end;
end;

procedure Tfrm_imp_lanc_fat_cc.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.Text = '' then
  begin
    edt_nm_cliente.Text := 'Todos';
    //edt_nm_cliente.Text := '';
    Exit;
  end;
  ValCodEdt(msk_cd_cliente);
  with datm_imp_lanc_fat_cc.qry_cliente_ do
  begin
    Close;
    ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    Prepare;
    Open;
    if Eof then
    begin
      BoxMensagem( 'Cliente não encontrado!', 2 );
      msk_cd_cliente.Clear;
      edt_nm_cliente.Clear;
      msk_cd_cliente.SetFocus;
    end
    else edt_nm_cliente.Text := FieldByName('AP_EMPRESA').AsString;
    Close;
  end;
end;

procedure Tfrm_imp_lanc_fat_cc.msk_cd_grupoChange(Sender: TObject);
begin
  if msk_cd_grupo.Text = '' then
  begin
    msk_cd_cliente.Color   := clWindow;
    msk_cd_cliente.Enabled := True;
    msk_cd_cliente.TabStop := True;
    btn_co_cliente.Enabled := True;
  end
  else
  begin
    edt_nm_cliente.Text    := '';
    msk_cd_cliente.Color   := clMenu;
    msk_cd_cliente.Enabled := False;
    msk_cd_cliente.TabStop := False;
    btn_co_cliente.Enabled := False;
  end;
end;

procedure Tfrm_imp_lanc_fat_cc.msk_cd_clienteChange(Sender: TObject);
begin
  if msk_cd_cliente.text = '' then
  begin
    msk_cd_grupo.Color   := clWindow;
    msk_cd_grupo.Enabled := True;
    msk_cd_grupo.TabStop := True;
    btn_co_grupo.Enabled := True;
  end
  else
  begin
    edt_nm_grupo.Text    := '';
    msk_cd_grupo.Color   := clMenu;
    msk_cd_grupo.Enabled := False;
    msk_cd_grupo.TabStop := False;
    btn_co_grupo.Enabled := False;
  end;
end;

end.
