unit PGLQ007;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCRPE32, StdCtrls, Mask, Buttons, Funcoes, PGGP017;

type
  Tfrm_imp_cheque_branco = class(TForm)
    Crp_Cheque_Brancos_Pendentes: TCrpe;
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    Label1: TLabel;
    btn_cd_produto: TSpeedButton;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    lbl_cd_usuario: TLabel;
    btn_co_usuario: TSpeedButton;
    edt_nm_usuario: TEdit;
    msk_cd_usuario: TMaskEdit;
    btn_iniciar: TButton;
    btn_fechar: TButton;
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_cd_produtoClick(Sender: TObject);
    procedure btn_co_usuarioClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_usuarioExit(Sender: TObject);
    procedure btn_iniciarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_imp_cheque_branco: Tfrm_imp_cheque_branco;

implementation

uses PGGP001, PGSM018, PGSM010, GSMLIB, PGSM016, PGLQ008;

{$R *.DFM}

procedure Tfrm_imp_cheque_branco.btn_cd_unid_negClick(Sender: TObject);
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

procedure Tfrm_imp_cheque_branco.btn_cd_produtoClick(Sender: TObject);
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

procedure Tfrm_imp_cheque_branco.btn_co_usuarioClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_usuario, frm_usuario);
  with frm_usuario do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_usuario.Cons_OnLine_Texto := msk_cd_usuario.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_usuario.Text := frm_usuario.Cons_OnLine_Texto;
  end;
  msk_cd_usuarioExit(nil);
  msk_cd_usuario.SetFocus;
end;

procedure Tfrm_imp_cheque_branco.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.text = '' then Exit;
  ValCodEdt(msk_cd_unid_neg);
  with datm_imp_cheque_branco.qry_unid_neg_ do
  begin
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Unidade não encontrada!',2);
      msk_cd_unid_neg.Clear;
      edt_nm_unid_neg.Clear;
    end
    else edt_nm_unid_neg.Text:= FieldByName('AP_UNID_NEG').AsString;
    Close;
  end;
end;

procedure Tfrm_imp_cheque_branco.msk_cd_produtoExit(Sender: TObject);
begin
  edt_nm_produto.Clear;
  if msk_cd_produto.text = '' then Exit;
  ValCodEdt(msk_cd_produto);
  with datm_imp_cheque_branco.qry_produto_ do
  begin
    ParamByName('CD_PRODUTO').AsString := msk_cd_Produto.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Produto não encontrado!',2);
      msk_cd_Produto.Clear;
      edt_nm_Produto.Clear;
    end
    else edt_nm_produto.Text:= FieldByName('AP_PRODUTO').AsString;
    Close;
  end;
end;

procedure Tfrm_imp_cheque_branco.msk_cd_usuarioExit(Sender: TObject);
begin
  edt_nm_usuario.Clear;
  if msk_cd_usuario.text = '' then Exit;
  ValCodEdt(msk_cd_usuario);
  with datm_imp_cheque_branco.qry_usuario_ do
  begin
    ParamByName('CD_USUARIO').AsString := msk_cd_usuario.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Usuário não encontrado!',2);
      msk_cd_usuario.Clear;
      edt_nm_usuario.Clear;
    end
    else edt_nm_usuario.Text:= FieldByName('AP_USUARIO').AsString;
    Close;
  end;
end;

procedure Tfrm_imp_cheque_branco.btn_iniciarClick(Sender: TObject);
begin
  with Crp_Cheque_Brancos_Pendentes do
  begin
    Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
    ReportName  := cDir_Rpt + '\CRLQ007.RPT';
    Formulas[0] := 'Usuario = "'+ Trim( msk_cd_usuario.Text )  + '"';
    Formulas[1] := 'Unidade = "'+ Trim( msk_cd_unid_neg.Text ) + '"';
    Formulas[2] := 'Produto = "'+ Trim( msk_cd_produto.Text )  + '"';
    Execute;
  end;
end;

procedure Tfrm_imp_cheque_branco.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_imp_cheque_branco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_imp_cheque_branco.Free;
  Crp_Cheque_Brancos_Pendentes.Free;
  Action := caFree;
end;

procedure Tfrm_imp_cheque_branco.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_imp_cheque_branco, datm_imp_cheque_branco);
end;

procedure Tfrm_imp_cheque_branco.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_cd_produtoClick(nil);
    if Sender = msk_cd_usuario  then btn_co_usuarioClick(nil);
  end;
end;

procedure Tfrm_imp_cheque_branco.FormShow(Sender: TObject);
begin
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_produtoExit(nil);
  msk_cd_usuario.Text := str_cd_usuario;
  msk_cd_usuarioExit(nil);
  btn_iniciar.SetFocus;
end;

end.
