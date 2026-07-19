unit PGFT023;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCRPE32, StdCtrls, Mask, Buttons, ExtCtrls, Funcoes;

type
  Tfrm_imp_despesas_nao_faturaveis = class(TForm)
    Crp_Despesas_nao_faturadas: TCrpe;
    Panel1: TPanel;
    btn_iniciar: TButton;
    btn_fechar: TButton;
    mskedt_periodo_final: TMaskEdit;
    Label2: TLabel;
    mskedt_periodo_inicial: TMaskEdit;
    Label3: TLabel;
    mskedt_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    SpeedButton6: TSpeedButton;
    lbl_cd_cliente: TLabel;
    mskedt_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    btn_cd_produto: TSpeedButton;
    Label1: TLabel;
    mskedt_cd_unid_neg: TMaskEdit;
    lbl_cd_unid_neg: TLabel;
    edt_nm_unid_neg: TEdit;
    btn_cd_unid_neg: TSpeedButton;
    Shape1: TShape;
    Label4: TLabel;
    Shape2: TShape;
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_cd_produtoClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure mskedt_cd_unid_negExit(Sender: TObject);
    procedure mskedt_cd_produtoExit(Sender: TObject);
    procedure mskedt_cd_clienteExit(Sender: TObject);
    procedure btn_iniciarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure mskedt_periodo_inicialExit(Sender: TObject);
    procedure mskedt_periodo_finalExit(Sender: TObject);
    procedure mskedt_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_imp_despesas_nao_faturaveis: Tfrm_imp_despesas_nao_faturaveis;

implementation

uses PGGP001, PGSM018, PGSM010, PGSM024, PGFT024, GSMLIB;

{$R *.DFM}




procedure Tfrm_imp_despesas_nao_faturaveis.btn_cd_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  With frm_unidade Do
  Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    mskedt_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    mskedt_cd_unid_negExit(nil);
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      mskedt_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    end;
  end;
  mskedt_cd_unid_negExit(nil);
end;

procedure Tfrm_imp_despesas_nao_faturaveis.btn_cd_produtoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';
  Application.CreateForm(Tfrm_produto, frm_produto);
  With frm_produto Do
  Begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_produto.Cons_OnLine_Texto := mskedt_cd_produto.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    mskedt_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
  end;
  mskedt_cd_produtoExit(nil);
end;

procedure Tfrm_imp_despesas_nao_faturaveis.SpeedButton6Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cliente, frm_cliente);
  With frm_cliente Do
  Begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_cliente.Cons_OnLine_Texto := mskedt_cd_cliente.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    mskedt_cd_cliente.Text := frm_cliente.Cons_OnLine_Texto;
  end;
  mskedt_cd_clienteExit(nil);
  mskedt_cd_cliente.SetFocus;
end;

procedure Tfrm_imp_despesas_nao_faturaveis.mskedt_cd_unid_negExit(
  Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if mskedt_cd_unid_neg.text = '' then exit;
  ValCodEdt(mskedt_cd_unid_neg);
  With datm_imp_despesas_nao_faturaveis.qry_unid_neg_ Do
  begin
    ParamByName('CD_UNID_NEG').AsString := mskedt_cd_unid_neg.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Unidade não encontrada!',2);
      mskedt_cd_unid_neg.Clear;
    end
    else edt_nm_unid_neg.Text:= FieldByName('AP_UNID_NEG').AsString;
    Close;
  end;

end;

procedure Tfrm_imp_despesas_nao_faturaveis.mskedt_cd_produtoExit(Sender: TObject);
begin
  edt_nm_produto.Clear;
  if mskedt_cd_produto.text = '' then exit;
  ValCodEdt(mskedt_cd_produto);
  With datm_imp_despesas_nao_faturaveis.qry_produto_ Do
  begin
    ParamByName('CD_PRODUTO').AsString := mskedt_cd_Produto.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Produto não encontrado!',2);
      mskedt_cd_Produto.Clear;
      edt_nm_Produto.Clear;
    end
    else edt_nm_produto.Text:= FieldByName('AP_PRODUTO').AsString;
    Close;
  end;
end;

procedure Tfrm_imp_despesas_nao_faturaveis.mskedt_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if mskedt_cd_cliente.text = '' then
  begin
    edt_nm_cliente.text:= 'Todos';
    exit;
  end;
  ValCodEdt(mskedt_cd_cliente);
  With datm_imp_despesas_nao_faturaveis.qry_cliente_ Do
  begin
    ParamByName('CD_CLIENTE').AsString := mskedt_cd_cliente.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Cliente não encontrado!',2);
      mskedt_cd_cliente.Clear;
      mskedt_cd_cliente.setfocus;
    end
    else edt_nm_cliente.Text:= FieldByName('AP_EMPRESA').AsString;
    Close;
  end;

end;


procedure Tfrm_imp_despesas_nao_faturaveis.btn_iniciarClick(Sender: TObject);
begin
  if mskedt_cd_unid_neg.text = '' then
  begin
    BoxMensagem('A unidade é obrigatória!',2);
    mskedt_cd_unid_neg.setfocus;
    exit;
  end;

  if mskedt_cd_produto.text = '' then
  begin
    BoxMensagem('O produto é obrigatório!',2);
    mskedt_cd_produto.setfocus;
    exit;
  end;

  if mskedt_periodo_inicial.text = '  /  /    ' then
  begin
    BoxMensagem('O período inicial é obrigatório!',2);
    mskedt_periodo_inicial.setfocus;
    exit;
  end;

  if mskedt_periodo_final.text = '  /  /    ' then
  begin
    BoxMensagem('O período final é obrigatório!',2);
    mskedt_periodo_final.setfocus;
    exit;
  end;

  if StrToDate(mskedt_periodo_inicial.text) > StrToDate(mskedt_periodo_final.text) then
  begin
    BoxMensagem('O período inicial não pode ser maior que o período final!',2);
    mskedt_periodo_final.setfocus;
    exit;
  end;
  With Crp_Despesas_nao_faturadas Do
  begin
    Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
    ReportName  := cdir_rpt + '\CRFT009.RPT';
    Formulas[0] := 'cliente = "'+ mskedt_cd_cliente.Text + '"';
    Formulas[1] := 'unidade = "'+ mskedt_cd_unid_neg.Text + '"';
    Formulas[2] := 'produto = "'+ mskedt_cd_produto.Text + '"';
    Formulas[3] := 'periodo_inicial = '+ DataCrystal(mskedt_Periodo_Inicial.Text);
    Formulas[4] := 'periodo_final = '+ DataCrystal(mskedt_Periodo_Final.Text);
    Execute;
  end;
end;


procedure Tfrm_imp_despesas_nao_faturaveis.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_imp_despesas_nao_faturaveis.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_imp_despesas_nao_faturaveis.free;
  Crp_Despesas_nao_faturadas.Free;
  action:= cafree;
end;

procedure Tfrm_imp_despesas_nao_faturaveis.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_imp_despesas_nao_faturaveis, datm_imp_despesas_nao_faturaveis);
end;




procedure Tfrm_imp_despesas_nao_faturaveis.mskedt_periodo_inicialExit(Sender: TObject);
begin
  if mskedt_periodo_inicial.text = '  /  /    ' then exit;
  try
    StrToDate(mskedt_periodo_inicial.Text);
  except
    on EConvertError do
    begin
      BoxMensagem('Data inválida!',2);
      mskedt_periodo_inicial.clear;
      mskedt_periodo_inicial.setfocus;
    end;
  end;
end;

procedure Tfrm_imp_despesas_nao_faturaveis.mskedt_periodo_finalExit(
  Sender: TObject);
begin
  if mskedt_periodo_final.text = '  /  /    ' then exit;
  try
    StrToDate(mskedt_periodo_final.Text);
  except
    on EConvertError do
    begin
      BoxMensagem('Data inválida!',2);
      mskedt_periodo_final.clear;
      mskedt_periodo_final.setfocus;
    end;                                      
  end;

end;

procedure Tfrm_imp_despesas_nao_faturaveis.mskedt_cd_unid_negKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = mskedt_cd_unid_neg then btn_cd_unid_negClick(nil);
    if Sender = mskedt_cd_produto then btn_cd_produtoClick(nil);
    if Sender = mskedt_cd_cliente then SpeedButton6Click(nil);
  end;
end;

end.
