unit PGGA013;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCRPE32, StdCtrls, Mask, Buttons, Funcoes;

type
  Tfrm_rel_proc_pend = class(TForm)
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    lbl_cd_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    edt_nm_cliente: TEdit;
    msk_cd_cliente: TMaskEdit;
    btn_iniciar: TButton;
    btn_fechar: TButton;
    Label1: TLabel;
    btn_cd_produto: TSpeedButton;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_data_base: TMaskEdit;
    Label2: TLabel;
    crp_rel_proc_pend: TCrpe;
    lbl_grupo: TLabel;
    btn_co_grupo: TSpeedButton;
    edt_nm_grupo: TEdit;
    msk_cd_grupo: TMaskEdit;
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_iniciarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_data_baseExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_cd_produtoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  frm_rel_proc_pend: Tfrm_rel_proc_pend;

implementation

uses PGGP001, PGSM018, PGSM024, PGGA014, GSMLIB, PGSM010, PGSM119;

{$R *.DFM}

procedure Tfrm_rel_proc_pend.btn_cd_unid_negClick(Sender: TObject);
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
    msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    msk_cd_unid_negExit(nil);
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    end;
  end;
  msk_cd_unid_negExit(nil);
  msk_cd_unid_neg.SetFocus;
end;

procedure Tfrm_rel_proc_pend.btn_co_clienteClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cliente, frm_cliente);
  With frm_cliente Do
  Begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_cliente.Cons_OnLine_Texto := msk_cd_cliente.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_cliente.Text := frm_cliente.Cons_OnLine_Texto;
  end;
  msk_cd_clienteExit(nil);
  msk_cd_cliente.SetFocus;
end;

procedure Tfrm_rel_proc_pend.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.Text = '' then Exit;
  ValCodEdt(msk_cd_unid_neg);
  With datm_rel_proc_pend.qry_unid_neg_ Do
  begin
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Unidade não encontrada!',2);
      msk_cd_unid_neg.Clear;
      msk_cd_unid_neg.SetFocus;
    end
    else edt_nm_unid_neg.Text:= FieldByName('AP_UNID_NEG').AsString;
    Close;
  end;
end;

procedure Tfrm_rel_proc_pend.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.Text = '' then
  begin
    edt_nm_cliente.text:= '';
    Exit;
  end;
  ValCodEdt(msk_cd_cliente);
  With datm_rel_proc_pend.qry_cliente_ Do
  begin
    ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Cliente não encontrado!',2);
      msk_cd_cliente.Clear;
      msk_cd_cliente.SetFocus;
    end
    else edt_nm_cliente.Text:= FieldByName('AP_EMPRESA').AsString;
    Close;
  end;

end;


procedure Tfrm_rel_proc_pend.btn_iniciarClick(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = '' then
  begin
    BoxMensagem( 'A Unidade de Negócio é obrigatório!', 2 );
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;

  if msk_cd_produto.Text = '' then
  begin
    BoxMensagem( 'O Produto é obrigatório!', 2 );
    msk_cd_produto.SetFocus;
    Exit;
  end;

  if msk_data_base.Text = '  /  /    ' then
  begin
    BoxMensagem( 'A data base é obrigatória!', 2 );
    msk_data_base.SetFocus;
    Exit;
  end;

  if StrToDate( msk_data_base.Text ) < Date then
  begin
    BoxMensagem( 'Data base deve ser maior ou igual a data de hoje!', 2 );
    msk_data_base.Clear;
    msk_data_base.SetFocus;
    Exit;
  end;

  Screen.Cursor := crHourGlass;

  with crp_rel_proc_pend do
  begin
    Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
    ReportName  := cDir_Rpt + '\CRGA001.RPT';
    if Trim( msk_cd_cliente.Text ) = '' then ParamFields[0] := 'XXXXX'
    else ParamFields[0] := msk_cd_cliente.Text;
    ParamFields[1] := msk_cd_unid_neg.Text;
    ParamFields[2] := msk_cd_produto.Text;
    ParamFields[3] := msk_data_base.Text;
    if Trim( msk_cd_grupo.Text ) = '' then ParamFields[4] := 'XXX'
    else ParamFields[4] := msk_cd_grupo.Text;
    Execute;
  end;

  Screen.Cursor := crDefault;

end;

procedure Tfrm_rel_proc_pend.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_rel_proc_pend.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  crp_rel_proc_pend.Free;
  datm_rel_proc_pend.free;
  action:= cafree;
end;

procedure Tfrm_rel_proc_pend.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_rel_proc_pend, datm_rel_proc_pend);
  msk_data_base.Text:= DateToStr(date);
end;

procedure Tfrm_rel_proc_pend.msk_cd_produtoExit(Sender: TObject);
begin
  edt_nm_produto.Clear;
  if msk_cd_produto.Text = '' then Exit;
  ValCodEdt(msk_cd_produto);
  With datm_rel_proc_pend.qry_produto_ Do
  begin
    ParamByName('CD_PRODUTO').AsString := msk_cd_Produto.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Produto não encontrado!',2);
      msk_cd_Produto.Clear;
      msk_cd_Produto.SetFocus;
    end
    else edt_nm_produto.Text:= FieldByName('AP_PRODUTO').AsString;
    Close;
  end;

end;



procedure Tfrm_rel_proc_pend.msk_data_baseExit(Sender: TObject);
begin
  if msk_data_base.Text = '  /  /    ' then Exit;
  try
    StrToDate(msk_data_base.Text);
  Except
    On EConvertError do
    begin
      BoxMensagem('Data Inválida!',2);
      msk_data_base.clear;
      msk_data_base.setfocus;
    end;
  end;
end;

procedure Tfrm_rel_proc_pend.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_cd_produtoClick(nil);
    if Sender = msk_cd_cliente  then btn_co_clienteClick(nil);
    if Sender = msk_cd_grupo    then btn_co_grupoClick(nil);
  end;
end;

procedure Tfrm_rel_proc_pend.btn_cd_produtoClick(Sender: TObject);
begin
  vStr_cd_modulo        := '23';
  str_cd_rotina        := '2302';

  Application.CreateForm(Tfrm_produto, frm_produto);
  with frm_produto do
  begin
    lCons_OnLine       := True;
    Caption            := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine       := False;
  end;
  msk_cd_produto.Text  := frm_produto.Cons_OnLine_Texto;
  vStr_cd_modulo        := '01';
  str_cd_rotina        := '0102';

  msk_cd_produtoExit(nil);
end;

procedure Tfrm_rel_proc_pend.FormShow(Sender: TObject);
begin
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_produtoExit(nil);
  msk_cd_grupo.SetFocus;
end;

procedure Tfrm_rel_proc_pend.btn_co_grupoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_grupo, frm_grupo);
  with frm_grupo do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_grupo.Cons_OnLine_Texto := msk_cd_grupo.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_grupo.Text := frm_grupo.Cons_OnLine_Texto;
  end;
  msk_cd_grupoExit(nil);
  msk_cd_grupo.SetFocus;
end;

procedure Tfrm_rel_proc_pend.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if ( msk_cd_grupo.Text = '' ) then
  begin
    edt_nm_grupo.Text := '';
    Exit;
  end;

  ValCodEdt(msk_cd_grupo);
  with datm_rel_proc_pend.qry_grupo_ do
  begin
    ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
    Open;
    if EOF then
    begin
      msk_cd_grupo.Clear;
      edt_nm_grupo.Clear;
    end
    else
    begin
      edt_nm_grupo.Text:= FieldByName('NM_GRUPO').AsString;
    end;
    Close;
  end;
end;

procedure Tfrm_rel_proc_pend.msk_cd_grupoChange(Sender: TObject);
begin
  if msk_cd_grupo.Text <> '' then
  begin
    msk_cd_cliente.Text     := '';
    msk_cd_cliente.Color    := clMenu;
    edt_nm_cliente.Text     := '';
    msk_cd_cliente.Enabled  := False;
    btn_co_cliente.Enabled  := False;
  end
  else
  begin
    msk_cd_cliente.Color    := clWindow;
    msk_cd_cliente.Enabled  := True;
    btn_co_cliente.Enabled  := True;
  end;
end;

procedure Tfrm_rel_proc_pend.msk_cd_clienteChange(Sender: TObject);
begin
  if msk_cd_cliente.Text <> '' then
  begin
    msk_cd_grupo.Text    := '';
    msk_cd_grupo.Color   := clMenu;
    edt_nm_grupo.Text    := '';
    msk_cd_grupo.Enabled := False;
    btn_co_grupo.Enabled := False;
  end
  else
  begin
    msk_cd_grupo.Color   := clWindow;
    msk_cd_grupo.Enabled := True;
    btn_co_grupo.Enabled := True;
  end;
end;

end.
