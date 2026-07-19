unit PGFT025;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCRPE32, StdCtrls, Mask, Buttons, ExtCtrls, Funcoes;

type
  Tfrm_imp_receitas_operacionais = class(TForm)
    Crp_Despesas_nao_faturadas: TCrpe;
    Panel1: TPanel;
    btn_iniciar: TButton;
    btn_fechar: TButton;
    RadioGroup1: TRadioGroup;
    mskedt_periodo_final: TMaskEdit;
    Label2: TLabel;
    mskedt_periodo_inicial: TMaskEdit;
    Label3: TLabel;
    edt_nm_produto: TEdit;
    mskedt_cd_produto: TMaskEdit;
    Label1: TLabel;
    btn_cd_produto: TSpeedButton;
    btn_cd_unid_neg: TSpeedButton;
    edt_nm_unid_neg: TEdit;
    mskedt_cd_unid_neg: TMaskEdit;
    lbl_cd_unid_neg: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Label4: TLabel;
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_cd_produtoClick(Sender: TObject);
    procedure mskedt_cd_unid_negExit(Sender: TObject);
    procedure mskedt_cd_produtoExit(Sender: TObject);
    procedure btn_iniciarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure mskedt_periodo_inicialExit(Sender: TObject);
    procedure mskedt_periodo_finalExit(Sender: TObject);
    procedure mskedt_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_imp_receitas_operacionais: Tfrm_imp_receitas_operacionais;

implementation

uses PGGP001, PGSM018, PGSM010, PGFT026, GSMLIB, PGGP017;

{$R *.DFM}




procedure Tfrm_imp_receitas_operacionais.btn_cd_unid_negClick(Sender: TObject);
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

procedure Tfrm_imp_receitas_operacionais.btn_cd_produtoClick(Sender: TObject);
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

procedure Tfrm_imp_receitas_operacionais.mskedt_cd_unid_negExit(
  Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if mskedt_cd_unid_neg.text = '' then exit;
  ValCodEdt(mskedt_cd_unid_neg);
  With datm_imp_receitas_operacionais.qry_unid_neg_ Do
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

procedure Tfrm_imp_receitas_operacionais.mskedt_cd_produtoExit(Sender: TObject);
begin
  edt_nm_produto.Clear;
  if mskedt_cd_produto.text = '' then exit;
  ValCodEdt(mskedt_cd_produto);
  With datm_imp_receitas_operacionais.qry_produto_ Do
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

procedure Tfrm_imp_receitas_operacionais.btn_iniciarClick(Sender: TObject);
var nr_identificador: integer;
begin
  nr_identificador := 0;
  
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

  try
    datm_main.db_broker.StartTransaction;
    with datm_imp_receitas_operacionais do
    begin
      CloseStoredProc(sp_cria_dados);
      sp_cria_dados.ParamByName('@unidade').AsString       := mskedt_cd_unid_neg.Text;
      sp_cria_dados.ParamByName('@produto').AsString       := mskedt_cd_produto.Text;
      sp_cria_dados.ParamByName('@periodo_inicial').AsDate := StrToDate(mskedt_periodo_inicial.text);
      sp_cria_dados.ParamByName('@periodo_final').AsDate   := StrToDate(mskedt_periodo_final.text);
      case RadioGroup1.ItemIndex of
      0: sp_cria_dados.ParamByName('@chave').AsString      := 'R';
      1: sp_cria_dados.ParamByName('@chave').AsString      := 'P';
      2: sp_cria_dados.ParamByName('@chave').AsString      := 'M';
      end;
      ExecStoredProc(sp_cria_dados);
      nr_identificador                       := sp_cria_dados.ParamByName('@nr_identificador').AsInteger;
      CloseStoredProc(sp_cria_dados);
    end;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  with Crp_Despesas_nao_faturadas do
  begin
    Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
    ReportName  := cdir_rpt + '\CRFT011.RPT';
    Formulas[0] := 'unidade = "'+ mskedt_cd_unid_neg.Text + '"';
    Formulas[1] := 'produto = "'+ mskedt_cd_produto.Text + '"';
    Formulas[2] := 'periodo_inicial = '+ DataCrystal(mskedt_Periodo_Inicial.Text);
    Formulas[3] := 'periodo_final = '+ DataCrystal(mskedt_Periodo_Final.Text);
    Formulas[4] := 'identificador = '+ IntToStr(nr_identificador);
    case RadioGroup1.ItemIndex of
    0: Formulas[5] := 'ordem = "R"';
    1: Formulas[5] := 'ordem = "P"';
    2: Formulas[5] := 'ordem = "M"';
    end;
    Execute;
  end;
  with datm_imp_receitas_operacionais.qry_apaga_dados do
  begin
    ParamByName('IDENTIFICADOR').AsInteger:= nr_identificador;
    Prepare;
    ExecSQL;
  end;
end;

procedure Tfrm_imp_receitas_operacionais.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_imp_receitas_operacionais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_imp_receitas_operacionais.free;
  Crp_Despesas_nao_faturadas.Free;
  action:= cafree;
end;

procedure Tfrm_imp_receitas_operacionais.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_imp_receitas_operacionais, datm_imp_receitas_operacionais);
end;




procedure Tfrm_imp_receitas_operacionais.mskedt_periodo_inicialExit(Sender: TObject);
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

procedure Tfrm_imp_receitas_operacionais.mskedt_periodo_finalExit(
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

procedure Tfrm_imp_receitas_operacionais.mskedt_cd_unid_negKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = mskedt_cd_unid_neg then btn_cd_unid_negClick(nil);
    if Sender = mskedt_cd_produto then btn_cd_produtoClick(nil);
  end;

end;

procedure Tfrm_imp_receitas_operacionais.FormShow(Sender: TObject);
begin
  mskedt_cd_unid_neg.Text := str_cd_unid_neg;
  mskedt_cd_produto.Text  := str_cd_produto;
  mskedt_cd_unid_negExit(nil);
  mskedt_cd_produtoExit(nil);
end;

end.
