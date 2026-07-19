unit PGFT011;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, UCRPE32;

type
  Tfrm_cli_mes_ano = class(TForm)
    Label1: TLabel;
    mskedt_mes_ano: TMaskEdit;
    crp_cli_mes_ano: TCrpe;
    lbl_cd_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    edt_nm_cliente: TEdit;
    msk_cd_cliente: TMaskEdit;
    btn_iniciar: TButton;
    btn_fechar: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_iniciarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_clienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    tp_relat : String[1];
    { Public declarations }
  end;

var
  frm_cli_mes_ano: Tfrm_cli_mes_ano;

implementation

{$R *.DFM}

uses GSMLIB, PGSM024, PGGP001, PGFT012;

procedure Tfrm_cli_mes_ano.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_cli_mes_ano.Free;
  crp_cli_mes_ano.Free;
  action:= cafree;
end;

procedure Tfrm_cli_mes_ano.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_cli_mes_ano, datm_cli_mes_ano);
end;

procedure Tfrm_cli_mes_ano.btn_iniciarClick(Sender: TObject);
begin
  if msk_cd_cliente.Text = '' then
  begin
    BoxMensagem('Selecione um cliente!', 3);
    msk_cd_cliente.SetFocus;
    Exit;
  end;

  try
    if (StrToInt(Copy(mskedt_Mes_ano.text,1,2)) < 1) or
       (StrToInt(Copy(mskedt_Mes_ano.text,1,2)) > 12) then
    begin
      BoxMensagem('Mês inválido',2);
      MskEdt_Mes_Ano.Setfocus;
      MskEdt_Mes_Ano.SelStart:= 0;
      MskEdt_Mes_Ano.SelLength:= 2;
      exit;
    end;
  except
    on EConvertError do
    begin
      BoxMensagem('Mês inválido!',2);
      MskEdt_Mes_Ano.Setfocus;
      MskEdt_Mes_Ano.SelStart:= 0;
      MskEdt_Mes_Ano.SelLength:= 2;
      exit;
    end;
  end;

  try
    StrToInt(Copy(mskedt_Mes_ano.text,4,4));
  except
    on EConvertError do
    begin
      BoxMensagem('Ano inválido!',2);
      MskEdt_Mes_Ano.Setfocus;
      MskEdt_Mes_Ano.SelStart:= 3;
      MskEdt_Mes_Ano.SelLength:= 4;
      exit;
    end;
  end;

  with crp_cli_mes_ano do
  begin
    Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

    if tp_relat = '1' then ReportName  := cDir_Rpt + '\CRGI001.RPT';
    if tp_relat = '2' then ReportName  := cDir_Rpt + '\CRGI002.RPT';

    ReportTitle := Caption + ' Ref Mes ' + Copy(mskedt_Mes_ano.text,1,2) + '/' +
                   Copy(mskedt_Mes_ano.text,4,4);
    Formulas[0] := 'Cliente = "'+ msk_cd_cliente.Text + '"';
    if tp_relat = '1' then Formulas[1] := 'CD_EV_REG_DI = "' + str_cd_ev_reg_di + '"';
    if tp_relat = '2' then Formulas[1] := 'CD_EV_PAGTO_LI = "' + str_cd_ev_pagto_li + '"';
    Formulas[2] := 'CD_EV_DESEMB = "' + str_cd_ev_desemb + '"';
    Formulas[3] := 'Mes = ' + Copy(mskedt_Mes_ano.text,1,2);
    Formulas[4] := 'Ano = ' + Copy(mskedt_Mes_ano.text,4,4);
    Execute;
  end;
end;

procedure Tfrm_cli_mes_ano.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_cli_mes_ano.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.text = '' then
  begin
    edt_nm_cliente.Text := '';
    Exit;
  end;
  ValCodEdt(msk_cd_cliente);
  With datm_cli_mes_ano.qry_cliente_ Do
  begin
    ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Cliente não encontrado!',2);
      msk_cd_cliente.Clear;
      edt_nm_cliente.Clear;
      msk_cd_cliente.SetFocus;
    end
    else edt_nm_cliente.Text:= FieldByName('AP_EMPRESA').AsString;
    Close;
  end;
end;

procedure Tfrm_cli_mes_ano.btn_co_clienteClick(Sender: TObject);
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

procedure Tfrm_cli_mes_ano.FormShow(Sender: TObject);
begin
  if tp_relat = '1' then Caption := 'Processos Pagos/Desembaraçados - DI';
  if tp_relat = '2' then Caption := 'Processos Pagos/Desembaraçados - LI';
end;

procedure Tfrm_cli_mes_ano.msk_cd_clienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_cd_cliente then btn_co_clienteClick(nil);
  end;
end;

end.
