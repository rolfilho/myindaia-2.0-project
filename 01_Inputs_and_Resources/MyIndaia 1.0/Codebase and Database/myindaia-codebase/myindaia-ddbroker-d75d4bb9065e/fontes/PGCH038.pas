unit PGCH038;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, UCRPE32, FILETEXT, ExtCtrls, ShellAPI, Funcoes;

type
  Tfrm_sel_unid_prod_cli = class(TForm)
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    lbl_mes_ano: TLabel;
    msk_mes_ano: TMaskEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    lbl_cd_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    edt_nm_cliente: TEdit;
    msk_cd_cliente: TMaskEdit;
    lblGrupo: TLabel;
    btn_co_grupo: TSpeedButton;
    edt_nm_grupo: TEdit;
    msk_cd_grupo: TMaskEdit;
    crp_unid_prod_cli: TCrpe;
    lbl_produto: TLabel;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    btn_co_produto: TSpeedButton;
    rdgrp_tipo_rel: TRadioGroup;
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure rdgrp_tipo_relClick(Sender: TObject);
  private
    { Private declarations }
  public
    str_relatorio: integer;
    { Public declarations }
  end;

var
  frm_sel_unid_prod_cli: Tfrm_sel_unid_prod_cli;

implementation

{$R *.DFM}

uses GSMLIB, PGSM018, PGCH039, PGGP001, PGSM104, PGSM119, PGSM010;

procedure Tfrm_sel_unid_prod_cli.btn_cd_unid_negClick(Sender: TObject);
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
    if (Cons_OnLine_Texto <> '' ) then msk_cd_unid_neg.Text := Cons_OnLine_Texto;
  end;
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_sel_unid_prod_cli.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.text = '' then
  begin
    if str_relatorio in [1] then edt_nm_unid_neg.Text := 'Todas'
    else edt_nm_unid_neg.Clear;
    Exit;
  end;

  ValCodEdt(msk_cd_unid_neg);
  With datm_sel_unid_prod_cli.qry_unid_neg_ Do
  begin
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Unidade não encontrada!',2);
      msk_cd_unid_neg.Clear;
      edt_nm_unid_neg.Clear;
      msk_cd_unid_neg.SetFocus;
    end
    else edt_nm_unid_neg.Text:= FieldByName('AP_UNID_NEG').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_unid_prod_cli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  crp_unid_prod_cli.Free;
  datm_sel_unid_prod_cli.Free;
  Action:= cafree;
end;

procedure Tfrm_sel_unid_prod_cli.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_sel_unid_prod_cli, datm_sel_unid_prod_cli);
end;

procedure Tfrm_sel_unid_prod_cli.OKBtnClick(Sender: TObject);
var
  dt_ini, dt_fim : TDateTime;
begin
  if str_relatorio = 1 then
  begin
    if ( msk_cd_grupo.Text = '' ) and ( msk_cd_cliente.Text = '' ) then
    begin
      BoxMensagem('Informe um Grupo ou Cliente!',2);
      if msk_cd_grupo.Enabled then msk_cd_grupo.SetFocus
      else msk_cd_cliente.SetFocus;
      Exit;
    end;

    try
      if (StrToInt(Copy(msk_Mes_ano.text,1,2)) < 1) or
         (StrToInt(Copy(msk_Mes_ano.text,1,2)) > 12) then
      begin
        BoxMensagem('Mês inválido',2);
        msk_mes_ano.Setfocus;
        msk_mes_ano.SelStart:= 0;
        msk_mes_ano.SelLength:= 2;
        Exit;
      end;
    except
      on EConvertError do
      begin
        BoxMensagem('Mês inválido!',2);
        msk_mes_ano.Setfocus;
        msk_mes_ano.SelStart:= 0;
        msk_mes_ano.SelLength:= 2;
        Exit;
      end;
    end;

    try
      StrToInt(Copy(msk_mes_ano.text,4,4));
    except
      on EConvertError do
      begin
        BoxMensagem('Ano inválido!',2);
        msk_mes_ano.Setfocus;
        msk_mes_ano.SelStart:= 3;
        msk_mes_ano.SelLength:= 4;
        exit;
      end;
    end;
  end;

  {Força mês/ano atual no tipo de relatório normal}
  if rdgrp_tipo_rel.ItemIndex = 0 then
    msk_mes_ano.Text := Copy( FormatDateTime('dd/mm/yyyy', Date), 4, 7 );

  dt_ini := StrToDate('01/' + msk_mes_ano.Text);
  if ( rdgrp_tipo_rel.ItemIndex = 0 ) and
     ( StrToInt( Copy( FormatDateTime('dd/mm/yyyy', Date), 1, 2 ) ) in [1..5] ) then {Normal}
     dt_ini := dt_ini - 5;
  dt_fim := StrToDate('01/' + IntToStr( StrToInt( Copy( msk_mes_ano.Text, 1, 2 ) ) + 1 ) + '/' + Copy( msk_mes_ano.Text, 4, 4 ) ) - 1;

  with crp_unid_prod_cli do
  begin
    case str_relatorio of
    1: begin
         Connect     := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

         ReportName  := cDir_Rpt + '\CRGI010.RPT';
         ReportTitle := UpperCase( Caption );
         Formulas[0] := 'Unidade = "' + msk_cd_unid_neg.Text + '"';
         Formulas[1] := 'Produto = "' + msk_cd_produto.Text + '"';
         Formulas[2] := 'Grupo = "' + msk_cd_grupo.Text + '"';
         Formulas[3] := 'Cliente = "' + msk_cd_cliente.Text + '"';
         Formulas[4] := 'DataIni = ' + DataCrystal( FormatDateTime('dd/mm/yyyy', dt_ini ) );
         Formulas[5] := 'Datafim = ' + DataCrystal( FormatDateTime('dd/mm/yyyy', dt_fim ) );
         Formulas[6] := 'TipoRelatorio = "' + IntToStr( rdgrp_tipo_rel.ItemIndex + 1 ) + '"';
         PrintFileName := cDir_Rpt + '\LeadTime.XLS';
         Execute;

         if BoxMensagem('Planilha Gerada com sucesso!' + #13#10 +
                        'Deseja abrir planilha no Excel?' , 1) then
            ShellExecute( Application.Handle, 'Open', 'EXCEL.EXE', PChar( cDir_Rpt + '\LeadTime.XLS' ), '', SW_MAXIMIZE );
      end;
    end;
  end;
end;

procedure Tfrm_sel_unid_prod_cli.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_sel_unid_prod_cli.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.text = '' then Exit;
  ValCodEdt(msk_cd_cliente);
  With datm_sel_unid_prod_cli.qry_cliente_ Do
  begin
    ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    Prepare;
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

procedure Tfrm_sel_unid_prod_cli.btn_co_clienteClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  Application.CreateForm(Tfrm_cliente_co, frm_cliente_co);
  with frm_cliente_co do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    if Cons_OnLine_Texto <> '' then msk_cd_cliente.Text := Cons_OnLine_Texto;
  end;
  msk_cd_clienteExit(nil);
end;

procedure Tfrm_sel_unid_prod_cli.btn_co_grupoClick(Sender: TObject);
begin
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

procedure Tfrm_sel_unid_prod_cli.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.text = '' then Exit;
  ValCodEdt(msk_cd_grupo);
  With datm_sel_unid_prod_cli.qry_grupo_ Do
  begin
    ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
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

procedure Tfrm_sel_unid_prod_cli.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sel_unid_prod_cli.FormShow(Sender: TObject);
begin
  case str_relatorio of
    1: Caption:= 'Lead Time';
  end;
  msk_cd_unid_neg.Text     := str_cd_unid_neg;
  msk_cd_produto.Text      := str_cd_produto;
  msk_cd_unid_negExit(nil);
  msk_cd_produtoExit(nil);
  rdgrp_tipo_rel.ItemIndex := 0;
  msk_mes_ano.Text         := Copy( FormatDateTime('dd/mm/yyyy', Date), 4, 7 );
end;

procedure Tfrm_sel_unid_prod_cli.msk_cd_grupoChange(Sender: TObject);
begin
  if msk_cd_grupo.text = '' then
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

procedure Tfrm_sel_unid_prod_cli.msk_cd_clienteChange(Sender: TObject);
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

procedure Tfrm_sel_unid_prod_cli.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_co_produtoClick(nil);
    if Sender = msk_cd_grupo    then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente  then btn_co_clienteClick(nil);
  end;

end;

procedure Tfrm_sel_unid_prod_cli.msk_cd_produtoExit(Sender: TObject);
begin
  if msk_cd_produto.text = '' then
  begin
    if str_relatorio in [1] then edt_nm_produto.Text := 'Todos'
    else edt_nm_produto.Text := '';
    Exit;
  end;

  ValCodEdt( msk_cd_produto );
  with datm_sel_unid_prod_cli do
  begin
    qry_produto_.Close;
    qry_produto_.SQL[2] := 'WHERE CD_PRODUTO = "' + msk_cd_produto.Text + '"';
    qry_produto_.Prepare;
    qry_produto_.Open;
    if qry_produto_.RecordCount > 0 then
    begin
      edt_nm_produto.Text := qry_produto_NM_PRODUTO.AsString;
    end
    else
    begin
      BoxMensagem('Produto não cadastrado!', 2);
      msk_cd_produto.Clear;
      edt_nm_produto.Clear;
      msk_cd_produto.SetFocus;
    end
  end;
end;

procedure Tfrm_sel_unid_prod_cli.btn_co_produtoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';
  Application.CreateForm(Tfrm_produto, frm_produto );
  with frm_produto do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    if (Cons_OnLine_Texto <> '' ) then msk_cd_produto.Text := Cons_OnLine_Texto;
  end;
  msk_cd_produtoExit(nil);
end;

procedure Tfrm_sel_unid_prod_cli.rdgrp_tipo_relClick(Sender: TObject);
begin
  if rdgrp_tipo_rel.ItemIndex = 0 then
  begin
    lbl_mes_ano.Visible := False;
    msk_mes_ano.Visible := False;
  end
  else
  begin
    lbl_mes_ano.Visible := True;
    msk_mes_ano.Visible := True;
  end;
end;

end.
