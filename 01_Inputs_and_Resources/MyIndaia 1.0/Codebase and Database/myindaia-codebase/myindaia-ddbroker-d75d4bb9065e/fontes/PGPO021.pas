(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGPO021.PAS - frm_po_imp

AUTOR: Leandro Stipanich

DATA: dd/mm/yyyy

Manutenção: Leandro Stipanich

Data: 08/01/2002

*************************************************************************************************)

unit PGPO021;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, UCRPE32, DBCtrls, Funcoes;

type
  Tfrm_po_imp = class(TForm)
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    lbl_cd_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    edt_nm_cliente: TEdit;
    msk_cd_cliente: TMaskEdit;
    Label1: TLabel;
    btn_co_evento: TSpeedButton;
    msk_cd_evento: TMaskEdit;
    edt_nm_evento: TEdit;
    rdgrp_resp: TRadioGroup;
    btn_iniciar: TButton;
    btn_fechar: TButton;
    crp_po_imp: TCrpe;
    msk_dt_inicio: TMaskEdit;
    lbl_periodo_de: TLabel;
    msk_dt_fim: TMaskEdit;
    lbl_periodo_a: TLabel;
    lbl_produto: TLabel;
    btn_co_area: TSpeedButton;
    msk_cd_area: TMaskEdit;
    edt_nm_area: TEdit;
    lblGrupo: TLabel;
    btn_co_grupo: TSpeedButton;
    edt_nm_grupo: TEdit;
    msk_cd_grupo: TMaskEdit;
    lbl_status: TLabel;
    cbbox_status: TComboBox;
    lbl_servico: TLabel;
    btn_co_servico: TSpeedButton;
    msk_cd_servico: TMaskEdit;
    edt_nm_servico: TEdit;
    chk_arquivo: TCheckBox;
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_areaExit(Sender: TObject);
    procedure btn_co_areaClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure btn_co_eventoClick(Sender: TObject);
    procedure msk_cd_eventoExit(Sender: TObject);
    procedure btn_iniciarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_servicoExit(Sender: TObject);
    procedure btn_co_servicoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tp_rel : Byte;
    { 1 - Follow-Up P.O. }
  end;

var
  frm_po_imp: Tfrm_po_imp;

implementation

uses GSMLIB, PGGP001, PGGP017, PGPO022, PGSM018, PGSM022, PGSM024, PGSM036, PGSM119, PGSM212;

{$R *.DFM}

procedure Tfrm_po_imp.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.Text = '' then Exit;
  ValCodEdt( msk_cd_unid_neg );
  with datm_po_imp.qry_unid_neg_ do
  begin
    Close;
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Unidade não encontrada!', 2 );
      msk_cd_unid_neg.Clear;
      edt_nm_unid_neg.Clear;
    end
    else edt_nm_unid_neg.Text := FieldByName('AP_UNID_NEG').AsString;
    Close;
  end;
end;

procedure Tfrm_po_imp.msk_cd_areaExit(Sender: TObject);
begin
  edt_nm_area.Clear;
  if msk_cd_area.Text = '' then
  begin
    edt_nm_area.Text := 'Todas';
    Exit;
  end;
  ValCodEdt( msk_cd_area );
  with datm_po_imp.qry_area_ do
  begin
    Close;
    ParamByName('CD_AREA').AsString := msk_cd_area.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Área não encontrada!', 2 );
      msk_cd_area.Clear;
      edt_nm_area.Clear;
    end
    else edt_nm_area.Text := FieldByName('NM_AREA').AsString;
    Close;
  end;
end;

procedure Tfrm_po_imp.btn_co_areaClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_area, frm_area );
  with frm_area do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_area.Cons_OnLine_Texto := msk_cd_area.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_area.Text := frm_area.Cons_OnLine_Texto;
  end;
  msk_cd_areaExit(nil);
end;

procedure Tfrm_po_imp.btn_co_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
  Application.CreateForm( Tfrm_unidade, frm_unidade );
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    msk_cd_unid_negExit(nil);
    if ( frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    end;
  end;
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_po_imp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_po_imp.Free;
  crp_po_imp.Free;
  Action := caFree;
end;

procedure Tfrm_po_imp.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_po_imp, datm_po_imp );
end;

procedure Tfrm_po_imp.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.Text = '' then
  begin
    edt_nm_cliente.Text := 'Todos';
    Exit;
  end;
  ValCodEdt( msk_cd_cliente );
  with datm_po_imp.qry_cliente_ do
  begin
    Close;
    ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Cliente não encontrado!', 2 );
      msk_cd_cliente.Clear;
      msk_cd_cliente.SetFocus;
    end
    else edt_nm_cliente.Text := FieldByName('AP_EMPRESA').AsString;
    Close;
  end;
end;

procedure Tfrm_po_imp.btn_co_clienteClick(Sender: TObject);
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

procedure Tfrm_po_imp.btn_co_eventoClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_evento, frm_evento );
  with frm_evento do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_evento.Cons_OnLine_Texto := msk_cd_evento.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_evento.Text := frm_evento.Cons_OnLine_Texto;
  end;
  msk_cd_eventoExit(nil);
  msk_cd_evento.SetFocus;
end;

procedure Tfrm_po_imp.msk_cd_eventoExit(Sender: TObject);
begin
  edt_nm_evento.Clear;
  if msk_cd_evento.Text = '' then
  begin
    edt_nm_evento.Text := 'Todos';
    Exit;
  end;
  ValCodEdt( msk_cd_evento );
  with datm_po_imp.qry_evento_ do
  begin
    Close;
    ParamByName('CD_EVENTO').AsString := msk_cd_evento.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Evento não encontrado!', 2 );
      msk_cd_evento.Clear;
      msk_cd_evento.SetFocus;
    end
    else edt_nm_evento.Text:= FieldByName('NM_EVENTO').AsString;
    Close;
  end;
end;

procedure Tfrm_po_imp.btn_iniciarClick(Sender: TObject);
var st_responsavel:String;
    nr_identificador : Integer;
begin
  nr_identificador := 0;
  if msk_cd_unid_neg.Text = '' then
  begin
    BoxMensagem( 'A Unidade de Negócio é obrigatório!', 2 );
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;

  if ( msk_dt_inicio.Text <> '  /  /    ' ) and
     ( msk_dt_fim.Text    <> '  /  /    ' ) then
  begin
    if StrToDate( msk_dt_inicio.Text ) > StrToDate( msk_dt_fim.Text ) then
    begin
      BoxMensagem( 'Data de início do período deve ser menor que a de fim do período!', 2 );
      msk_dt_inicio.Clear;
      msk_dt_inicio.SetFocus;
      Exit;
    end;
  end;

  with crp_po_imp, datm_po_imp do
  begin
    Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
    if tp_rel = 1 then
    begin
      try
        datm_main.db_broker.StartTransaction;

        Screen.Cursor := crHourGlass;
        Application.ProcessMessages;

        CloseStoredProc( sp_po_rel_flp );
        sp_po_rel_flp.ParamByName('@cd_unid_neg').AsString   := msk_cd_unid_neg.Text;
        if Trim( msk_cd_grupo.Text ) = '' then
           sp_po_rel_flp.ParamByName('@cd_grupo').AsString   := 'X'
        else
           sp_po_rel_flp.ParamByName('@cd_grupo').AsString   := Trim( msk_cd_grupo.Text );
        if Trim( msk_cd_cliente.Text ) = '' then
           sp_po_rel_flp.ParamByName('@cd_cliente').AsString := 'X'
        else
           sp_po_rel_flp.ParamByName('@cd_cliente').AsString := Trim( msk_cd_cliente.Text );
        if Trim( msk_cd_servico.Text ) = '' then
           sp_po_rel_flp.ParamByName('@cd_servico').AsString := 'X'
        else
           sp_po_rel_flp.ParamByName('@cd_servico').AsString := Trim( msk_cd_servico.Text );
        if Trim( msk_cd_evento.Text ) = '' then
           sp_po_rel_flp.ParamByName('@cd_evento').AsString  := 'X'
        else
           sp_po_rel_flp.ParamByName('@cd_evento').AsString  := Trim( msk_cd_evento.Text );
        if Trim( msk_cd_area.Text ) = '' then
           sp_po_rel_flp.ParamByName('@cd_area').AsString    := 'X'
        else
           sp_po_rel_flp.ParamByName('@cd_area').AsString    := Trim( msk_cd_area.Text );
        case rdgrp_resp.ItemIndex of
        0: st_responsavel := 'C';
        1: st_responsavel := 'D';
        2: st_responsavel := 'X';
        end;
        sp_po_rel_flp.ParamByName('@cd_resp').AsString       := st_responsavel;
        if cbbox_status.ItemIndex <= 0 then
           sp_po_rel_flp.ParamByName('@cd_status').AsString  := 'X'
        else
           sp_po_rel_flp.ParamByName('@cd_status').AsString  := IntToStr( cbbox_status.ItemIndex - 1 ) ;
        if ( msk_dt_inicio.Text <> '  /  /    ' ) then
           sp_po_rel_flp.ParamByName('@dt_inicio').AsDate    := StrToDate( msk_dt_inicio.Text );
        if ( msk_dt_fim.Text    <> '  /  /    ' ) then
           sp_po_rel_flp.ParamByName('@dt_fim').AsDate       := StrToDate( msk_dt_fim.Text );
        ExecStoredProc( sp_po_rel_flp );
        nr_identificador := sp_po_rel_flp.ParamByName('@nr_identificador').AsInteger;
        CloseStoredProc( sp_po_rel_flp );

        datm_main.db_broker.Commit;

        qry_trel_po_flp_.Close;
        qry_trel_po_flp_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_trel_po_flp_.Prepare;
        qry_trel_po_flp_.Open;

        Screen.Cursor := crDefault;
        Application.ProcessMessages;

        if qry_trel_po_flp_.RecordCount = 0 then
        begin
          BoxMensagem('Impressão de Follow-Up P.O. vazia!', 2);
          msk_cd_cliente.Text;
          Exit
        end
        else
        begin
          ppReport.Template.FileName := cDir_RPT + '\RBPO005.RTM';
          ppReport.Template.LoadFromFile;
          ppReport.AllowPrintToFile := True;
          ppReport.PrinterSetup.DocumentName := Caption;
          ppReport.TextFileName     := cDir_Rpt + '\RBPO005.PDF';
          if chk_arquivo.Checked then
            ppReport.DeviceType     := 'PDFFile'
          else
            ppReport.DeviceType     := 'Screen';
          ppReport.Print;
          qry_trel_po_flp_.Close;
          qry_trel_po_flp_item_.Close;
        end;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
          BoxMensagem( 'Falha na Geração do Relatório!', 2 );
        end;
      end;
    end;
  end;
  ApagaDados( 'TREL_PO_FLP', nr_identificador );
  ApagaDados( 'TREL_PO_FLP_EV', nr_identificador );
  ApagaDados( 'TREL_PO_FLP_ITEM', nr_identificador );
end;

procedure Tfrm_po_imp.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_po_imp.msk_cd_unid_negKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg  then btn_co_unid_negClick(nil);
    if Sender = msk_cd_area      then btn_co_areaClick(nil);
    if Sender = msk_cd_grupo     then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente   then btn_co_clienteClick(nil);
    if Sender = msk_cd_servico   then btn_co_servicoClick(nil);
    if Sender = msk_cd_evento    then btn_co_eventoClick(nil);
  end;
end;

procedure Tfrm_po_imp.FormShow(Sender: TObject);
begin
  if tp_rel = 1 then
  begin
    Caption := 'Follow-Up P.O.';
    lbl_periodo_de.Visible := True;
    lbl_periodo_a.Visible  := True;
    msk_dt_inicio.Visible  := True;
    msk_dt_fim.Visible     := True;
    chk_arquivo.Visible    := True;
    with datm_po_imp do
    begin
      cbbox_status.Items.Clear;
      cbbox_status.Items.Add( 'Todos' );
      qry_status_flp_.Close;
      qry_status_flp_.Prepare;
      qry_status_flp_.Open;
      qry_status_flp_.First;
      while Not qry_status_flp_.EOF do
      begin
        cbbox_status.Items.Add( qry_status_flp_.FieldByName('NM_STATUS_FLP').AsString );
        qry_status_flp_.Next;
      end;
      qry_status_flp_.Close;
    end;
  end;
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_grupo.SetFocus;
end;

procedure Tfrm_po_imp.btn_co_grupoClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_grupo, frm_grupo );
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

procedure Tfrm_po_imp.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.Text = '' then Exit;
  ValCodEdt( msk_cd_grupo );
  with datm_po_imp.qry_grupo_ do
  begin
    ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Grupo de Clientes não encontrado!', 2 );
      msk_cd_grupo.Clear;
      msk_cd_grupo.SetFocus;
    end
    else edt_nm_grupo.Text := FieldByName('NM_GRUPO').AsString;
    Close;
  end;
end;

procedure Tfrm_po_imp.msk_cd_clienteChange(Sender: TObject);
begin
  if msk_cd_cliente.Text = '' then
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

procedure Tfrm_po_imp.msk_cd_grupoChange(Sender: TObject);
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


procedure Tfrm_po_imp.msk_cd_servicoExit(Sender: TObject);
begin
  edt_nm_servico.Clear;
  if msk_cd_servico.Text = '' then
  begin
    edt_nm_servico.Text := 'Todos';
    Exit;
  end;
  ValCodEdt( msk_cd_servico );
  with datm_po_imp.qry_servico_ do
  begin
    Close;
    ParamByName('CD_SERVICO').AsString := msk_cd_servico.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Serviço não encontrado!', 2 );
      msk_cd_servico.Clear;
      msk_cd_servico.SetFocus;
    end
    else edt_nm_servico.Text:= FieldByName('NM_SERVICO').AsString;
    Close;
  end;
end;

procedure Tfrm_po_imp.btn_co_servicoClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_servico, frm_servico );
  with frm_servico do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_servico.Cons_OnLine_Texto := msk_cd_servico.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_servico.Text := frm_servico.Cons_OnLine_Texto;
  end;
  msk_cd_servicoExit(nil);
  msk_cd_servico.SetFocus;
end;


end.


