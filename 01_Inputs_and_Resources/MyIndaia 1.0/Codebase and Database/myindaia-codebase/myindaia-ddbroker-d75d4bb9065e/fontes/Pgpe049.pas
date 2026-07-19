(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGPE049.PAS - Form Relatório de DDE - Vencimento

AUTOR: Leandro Stipanich

DATA: dd/mm/yyyy

Manutenção:

*************************************************************************************************)
unit PGPE049;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Mask, ExtCtrls, UCRPE32;

type
  Tfrm_rel_dde_vencto = class(TForm)
    Panel1: TPanel;
    msk_cd_unidade: TMaskEdit;
    msk_cd_produto: TMaskEdit;
    msk_cd_grupo: TMaskEdit;
    msk_cd_cliente: TMaskEdit;
    msk_dt_ini: TMaskEdit;
    msk_dt_fim: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edt_nm_unidade: TEdit;
    edt_nm_produto: TEdit;
    edt_nm_grupo: TEdit;
    edt_nm_cliente: TEdit;
    Label6: TLabel;
    Button1: TButton;
    Button2: TButton;
    btn_co_unidade: TSpeedButton;
    SpeedButton2: TSpeedButton;
    btn_co_grupo: TSpeedButton;
    btn_co_cliente: TSpeedButton;
    crp_vencto_dde: TCrpe;
    procedure Button2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure msk_cd_unidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_unidadeClick(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure msk_cd_unidadeExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_rel_dde_vencto: Tfrm_rel_dde_vencto;

implementation

uses PGPE050, PGSM018, PGSM119, PGSM024, GSMLIB, PGGP001, PGGP017;

{$R *.DFM}

procedure Tfrm_rel_dde_vencto.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_rel_dde_vencto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_rel_dde_vencto.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_rel_dde_vencto,datm_rel_dde_vencto );
end;

procedure Tfrm_rel_dde_vencto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_rel_dde_vencto do
  begin
    qry_cliente_.Close;
    qry_grupo_.Close;
    qry_unidade_.Close;

    Free;
  end;
  crp_vencto_dde.Free;         
  Action := caFree;
end;

procedure Tfrm_rel_dde_vencto.msk_cd_unidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unidade then btn_co_unidadeClick( nil ) else
    if Sender = msk_cd_cliente then btn_co_clienteClick( nil ) else
    if Sender = msk_cd_grupo   then btn_co_grupoClick( nil );
  end;
end;

procedure Tfrm_rel_dde_vencto.btn_co_unidadeClick(Sender: TObject);
begin
  with datm_rel_dde_vencto do
  begin
    Application.CreateForm( Tfrm_unidade, frm_unidade );
    with frm_unidade do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;

      if (frm_unidade.Cons_OnLine_Texto <> '' ) then
      begin
        msk_cd_unidade.Text := frm_unidade.Cons_OnLine_Texto;
        qry_unidade_.Close;
        qry_unidade_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unidade.Text;
        qry_unidade_.Prepare;
        qry_unidade_.Open;
        if qry_unidade_.RecordCount > 0 then edt_nm_unidade.Text := qry_unidade_NM_UNID_NEG.AsString;
        qry_unidade_.Close;
      end;
    end;
  end;
end;

procedure Tfrm_rel_dde_vencto.btn_co_grupoClick(Sender: TObject);
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

procedure Tfrm_rel_dde_vencto.btn_co_clienteClick(Sender: TObject);
begin
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
  msk_cd_cliente.SetFocus;
end;

procedure Tfrm_rel_dde_vencto.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.text = '' then Exit;
  ValCodEdt(msk_cd_grupo);
  with datm_rel_dde_vencto.qry_grupo_ do
  begin
    ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Grupo não encontrado!',2);
      msk_cd_grupo.Clear;
      edt_nm_grupo.Clear;
    end
    else edt_nm_grupo.Text:= FieldByName('NM_GRUPO').AsString;
    Close;
  end;
end;

procedure Tfrm_rel_dde_vencto.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.text = '' then exit;
  ValCodEdt(msk_cd_cliente);
  with datm_rel_dde_vencto.qry_cliente_ do
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

procedure Tfrm_rel_dde_vencto.msk_cd_grupoChange(Sender: TObject);
begin
  if msk_cd_grupo.Text <> '' then
  begin
    msk_cd_cliente.Text    := '';
    msk_cd_cliente.Color   := clMenu;
    edt_nm_cliente.Text    := '';
    msk_cd_cliente.Enabled := False;
    btn_co_cliente.Enabled := False;
  end
  else
  begin
    msk_cd_cliente.Color   := clWindow;
    msk_cd_cliente.Enabled := True;
    btn_co_cliente.Enabled := True;
  end;
end;

procedure Tfrm_rel_dde_vencto.msk_cd_clienteChange(Sender: TObject);
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

procedure Tfrm_rel_dde_vencto.msk_cd_unidadeExit(Sender: TObject);
begin
  edt_nm_unidade.Clear;
  if msk_cd_unidade.text = '' then Exit;
  ValCodEdt(msk_cd_unidade);
  with datm_rel_dde_vencto.qry_unidade_ do
  begin
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unidade.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Unidade não encontrada!',2);
      msk_cd_unidade.Clear;
      edt_nm_unidade.Clear;
    end
    else edt_nm_unidade.Text:= FieldByName('NM_UNID_NEG').AsString;
    Close;
  end;
end;

procedure Tfrm_rel_dde_vencto.Button1Click(Sender: TObject);
var
  nr_identificador : Integer;
begin
  try
    msk_dt_ini.Text := DateToStr( StrToDate( msk_dt_ini.Text ) );
  except
    BoxMensagem( 'Data Inicial Inválida!',2 );
    msk_dt_ini.SetFocus;
    Exit;
  end;

  try
    msk_dt_fim.Text := DateToStr( StrToDate( msk_dt_fim.Text ) );
  except
    BoxMensagem( 'Data Final Inválida!',2 );
    msk_dt_fim.SetFocus;
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  with datm_rel_dde_vencto, crp_vencto_dde do
  begin
    try
      datm_main.db_broker.StartTransaction;

      CloseStoredProc( sp_vencto_dde );

      if Trim( msk_cd_unidade.Text ) = '' then
        sp_vencto_dde.ParamByName( '@CD_UNID_NEG' ).AsString := 'X'
      else
        sp_vencto_dde.ParamByName( '@CD_UNID_NEG' ).AsString := msk_cd_unidade.Text;

      if Trim( msk_cd_cliente.Text ) = '' then
        sp_vencto_dde.ParamByName( '@CD_CLIENTE' ).AsString  := 'X'
      else
        sp_vencto_dde.ParamByName( '@CD_CLIENTE' ).AsString  := msk_cd_cliente.Text;

      if Trim( msk_cd_grupo.Text ) = '' then
        sp_vencto_dde.ParamByName( '@CD_GRUPO' ).AsString    := 'X'
      else
        sp_vencto_dde.ParamByName( '@CD_GRUPO' ).AsString    := msk_cd_grupo.Text;

      sp_vencto_dde.ParamByName( '@DT_INICIAL' ).AsDateTime  := StrToDateTime( msk_dt_ini.Text );
      sp_vencto_dde.ParamByName( '@DT_FINAL' ).AsDateTime    := StrToDateTime( msk_dt_fim.Text );

      ExecStoredProc( sp_vencto_dde );

      nr_identificador := sp_vencto_dde.ParamByName( '@NR_IDENTIFICADOR' ).AsInteger;

      CloseStoredProc( sp_vencto_dde );

      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Exit;
      end;
    end;

    Connect     := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
    ReportName  := cDir_Rpt + '\CRPE006.RPT';
    Formulas[0] := 'nr_identificador = '+ IntToStr(nr_identificador);
    Formulas[1] := 'periodo = "'+ 'Período ' + msk_dt_ini.Text + ' à ' + msk_dt_fim.Text + '"';
    Execute;

    ApagaDados( 'TREL_VENCTO_DDE', nr_identificador );
  end;

  Screen.Cursor := crDefault;
end;

end.
