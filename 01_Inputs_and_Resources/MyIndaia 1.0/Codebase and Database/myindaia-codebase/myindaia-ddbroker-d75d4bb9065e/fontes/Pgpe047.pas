(*************************************************************************************************
//Sistema: DD Broker - Indaiá Logística

//PROGRAMA: PGPE047.PAS - Filtro para relatórios por Unidade, Cliente/Grupo, Analista e Serviço

//AUTOR: Leandro Stipanich

//DATA: 13/09/2001

//MANUTENÇÃO:

//DATA: 

*************************************************************************************************)
unit PGPE047;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, UCRPE32, Funcoes;

type
  Tfrm_sel_unid_cli_serv_anal = class(TForm)
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    lblGrupo: TLabel;
    btn_co_grupo: TSpeedButton;
    edt_nm_grupo: TEdit;
    msk_cd_grupo: TMaskEdit;
    lbl_cd_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    edt_nm_cliente: TEdit;
    msk_cd_cliente: TMaskEdit;
    Label5: TLabel;
    btn_co_servico: TSpeedButton;
    msk_cd_servico: TMaskEdit;
    edt_nm_servico: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    lbl_analista_comissaria: TLabel;
    msk_cd_analista_comissaria: TMaskEdit;
    edt_nm_analista_comissaria: TEdit;
    btn_co_analista_comissaria: TSpeedButton;
    chk_so_ult_obs: TCheckBox;
    chk_pend_averb: TCheckBox;
    crp_relat: TCRPE;
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure msk_cd_servicoExit(Sender: TObject);
    procedure btn_co_servicoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_servicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_analista_comissariaExit(Sender: TObject);
    procedure btn_co_analista_comissariaClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    tp_rel : Byte;
    { Public declarations }
  end;

var
  frm_sel_unid_cli_serv_anal: Tfrm_sel_unid_cli_serv_anal;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGSM018, PGSM119, PGSM022, PGSM016, Pgpe048, PGSM024;

procedure Tfrm_sel_unid_cli_serv_anal.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.text = '' then
  begin
    edt_nm_unid_neg.Text := 'Todas';
    Exit;
  end;

  ValCodEdt(msk_cd_unid_neg);
  With datm_sel_unid_cli_serv_anal.qry_unid_neg_ Do
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

procedure Tfrm_sel_unid_cli_serv_anal.btn_cd_unid_negClick(
  Sender: TObject);
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


procedure Tfrm_sel_unid_cli_serv_anal.msk_cd_grupoChange(Sender: TObject);
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

procedure Tfrm_sel_unid_cli_serv_anal.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.Text = '' then
  begin
    edt_nm_grupo.Text := 'Todas';
    Exit;
  end;
  ValCodEdt(msk_cd_grupo);
  With datm_sel_unid_cli_serv_anal.qry_grupo_ Do
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

procedure Tfrm_sel_unid_cli_serv_anal.btn_co_grupoClick(Sender: TObject);
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


procedure Tfrm_sel_unid_cli_serv_anal.msk_cd_clienteChange(
  Sender: TObject);
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

procedure Tfrm_sel_unid_cli_serv_anal.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.text = '' then
  begin
    edt_nm_cliente.Text := 'Todas';
    Exit;
  end;

  ValCodEdt(msk_cd_cliente);
  With datm_sel_unid_cli_serv_anal.qry_cliente_ Do
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

procedure Tfrm_sel_unid_cli_serv_anal.btn_co_clienteClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cliente, frm_cliente);
  with frm_cliente do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    if frm_cliente.Cons_OnLine_Texto <> '' then msk_cd_cliente.Text := frm_cliente.Cons_OnLine_Texto;
  end;
  msk_cd_clienteExit(nil);
end;

procedure Tfrm_sel_unid_cli_serv_anal.msk_cd_servicoExit(Sender: TObject);
begin
  // Servico 
  if (msk_cd_servico.Text <> '') then
  begin
    ValCodEdt( msk_cd_servico );

    with datm_sel_unid_cli_serv_anal.qry_servico_ do
    begin
      Close;
      ParamByName('CD_SERVICO').AsString := msk_cd_servico.Text;
      Prepare;
      Open;
      if Eof then
      begin
        BoxMensagem('Serviço inexistente!', 2);
        msk_cd_servico.Text      := '';
        edt_nm_servico.Text      := '';
        msk_cd_servico.SetFocus;
      end
      else
      begin
        // Cliente X Serviço

        with datm_sel_unid_cli_serv_anal do
        begin
          edt_nm_servico.Text      := qry_servico_NM_SERVICO.AsString;

          qry_cliente_servico_.Close;
          if msk_cd_grupo.Text <> '' then
             qry_cliente_servico_.SQL[5] := 'AND E.CD_GRUPO = "' + msk_cd_grupo.Text + '"'
          else if msk_cd_cliente.Text <> '' then
             qry_cliente_servico_.SQL[5] := 'AND S.CD_CLIENTE = "' + msk_cd_cliente.Text + '"';

          qry_cliente_servico_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
          qry_cliente_servico_.ParamByName('CD_PRODUTO').AsString  := '02';
          qry_cliente_servico_.ParamByName('CD_SERVICO').AsString  := msk_cd_servico.Text;
          qry_cliente_servico_.Prepare;
          qry_cliente_servico_.Open;

          if qry_cliente_servico_.EOF then
          begin
            BoxMensagem( 'Grupo/Cliente não tem habilitação para este serviço!', 2);
            msk_cd_servico.SetFocus;
            Exit;
          end;
        end;
      end;
    end;
  end
  else
    edt_nm_servico.Text := 'Todos';
end;

procedure Tfrm_sel_unid_cli_serv_anal.btn_co_servicoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2303';

  Application.CreateForm(Tfrm_servico, frm_servico);
  with frm_servico do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;
  msk_cd_servico.Text := frm_servico.Cons_OnLine_Texto;

  vStr_cd_modulo := '15';
  str_cd_rotina := '1555';

  msk_cd_servicoExit(nil);
end;


procedure Tfrm_sel_unid_cli_serv_anal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_sel_unid_cli_serv_anal.Free;
  crp_relat.Free;
  Action:= cafree;
end;

procedure Tfrm_sel_unid_cli_serv_anal.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_sel_unid_cli_serv_anal, datm_sel_unid_cli_serv_anal);
end;

procedure Tfrm_sel_unid_cli_serv_anal.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_sel_unid_cli_serv_anal.msk_cd_servicoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg             then btn_cd_unid_negClick(nil);
    if Sender = msk_cd_grupo                then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente              then btn_co_clienteClick(nil);
    if Sender = msk_cd_servico              then btn_co_servicoClick(nil);
    if Sender = msk_cd_analista_comissaria  then btn_co_analista_comissariaClick(nil);
  end;
end;

procedure Tfrm_sel_unid_cli_serv_anal.FormShow(Sender: TObject);
begin
  msk_cd_unid_neg.Text            := str_cd_unid_neg;
  msk_cd_grupo.Text               := '';
  msk_cd_cliente.Text             := '';
  msk_cd_servico.Text             := '';
  msk_cd_analista_comissaria.Text := '';
  msk_cd_unid_negExit(nil);
  msk_cd_grupoExit(nil);
  msk_cd_clienteExit(nil);
  msk_cd_servicoExit(nil);
  msk_cd_analista_comissariaExit(nil);

  case tp_rel of
    1: Caption := 'Relatório de Andamento de Processos';
    2: Caption := 'Relatório de Controle de Averbação';
  end;

  chk_pend_averb.Visible := tp_rel = 2;

end;

procedure Tfrm_sel_unid_cli_serv_anal.msk_cd_analista_comissariaExit(
  Sender: TObject);
begin
  edt_nm_analista_comissaria.Clear;
  if msk_cd_analista_comissaria.Text = '' then
  begin
    edt_nm_analista_comissaria.Text := 'Todos';
    Exit;
  end;
  ValCodEdt(msk_cd_analista_comissaria);
  with datm_sel_unid_cli_serv_anal.qry_usuario_ do
  begin
    Close;
    ParamByName('CD_USUARIO').AsString := msk_cd_analista_comissaria.Text;
    Prepare;
    Open;
    if Eof then
    begin
      BoxMensagem( 'Analista da Comissária não encontrado!', 2 );
      msk_cd_analista_comissaria.Clear;
      edt_nm_analista_comissaria.Clear;
      msk_cd_analista_comissaria.SetFocus;
    end
    else edt_nm_analista_comissaria.Text := FieldByName('NM_USUARIO').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_unid_cli_serv_anal.btn_co_analista_comissariaClick(
  Sender: TObject);
begin
  Application.CreateForm(Tfrm_usuario, frm_usuario);
  with frm_usuario do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_usuario.Cons_OnLine_Texto := msk_cd_analista_comissaria.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_analista_comissaria.Text := frm_usuario.Cons_OnLine_Texto;
  end;
  msk_cd_analista_comissariaExit(nil);
  msk_cd_analista_comissaria.SetFocus;
end;

procedure Tfrm_sel_unid_cli_serv_anal.OKBtnClick(Sender: TObject);
var
  nr_identificador: integer;
begin
  nr_identificador := 0;

  if ( Trim( msk_cd_unid_neg.Text ) = '' ) and Not ( tp_rel in [1] ) then
  begin
    BoxMensagem( 'Informe uma Unidade de Negócio!', 2 );
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;

  if ( ( Trim(msk_cd_cliente.Text) = '' ) and ( Trim(msk_cd_grupo.Text) = '' ) ) and ( Not ( tp_rel in [1] ) ) then
  begin
    BoxMensagem('Informe um Cliente ou Grupo!', 2);
    msk_cd_cliente.SetFocus;
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  with crp_relat do
  begin
    if tp_rel in [ 1,2 ] then
    begin
      Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
      ReportTitle := Caption;
    end;

    case tp_rel of
      1: begin
           ReportName  := cDir_Rpt + '\CRPE003.RPT';
           with datm_sel_unid_cli_serv_anal do
           begin
             CloseStoredProc( sp_rel_and_processo_exp );
             sp_rel_and_processo_exp.ParamByName('@cd_unid_neg').AsString   := msk_cd_unid_neg.Text;
             sp_rel_and_processo_exp.ParamByName('@cd_grupo').AsString      := msk_cd_grupo.Text;
             sp_rel_and_processo_exp.ParamByName('@cd_cliente').AsString    := msk_cd_cliente.Text;
             sp_rel_and_processo_exp.ParamByName('@cd_analista').AsString   := msk_cd_analista_comissaria.Text;
             sp_rel_and_processo_exp.ParamByName('@cd_servico').AsString    := msk_cd_servico.Text;
             if chk_so_ult_obs.Checked then
               sp_rel_and_processo_exp.ParamByName('@so_ult_obs').AsString  := '1'
             else
               sp_rel_and_processo_exp.ParamByName('@so_ult_obs').AsString  := '0';

             ExecStoredProc( sp_rel_and_processo_exp );
             nr_identificador := sp_rel_and_processo_exp.ParamByName('@nr_identificador').AsInteger;
             CloseStoredProc( sp_rel_and_processo_exp );
           end;
         end;
      2: begin
           ReportName  := cDir_Rpt + '\CRPE004.RPT';
           with datm_sel_unid_cli_serv_anal do
           begin
             CloseStoredProc( sp_rel_cont_averb );
             if Trim( msk_cd_unid_neg.Text ) = '' then
               sp_rel_cont_averb.ParamByName( '@cd_unid_neg' ).AsString   := 'X'
             else
               sp_rel_cont_averb.ParamByName( '@cd_unid_neg' ).AsString   := msk_cd_unid_neg.Text;

             if Trim( msk_cd_grupo.Text ) = '' then
               sp_rel_cont_averb.ParamByName( '@cd_grupo' ).AsString      := 'X'
             else
               sp_rel_cont_averb.ParamByName( '@cd_grupo' ).AsString      := msk_cd_grupo.Text;

             if Trim( msk_cd_cliente.Text ) = '' then
               sp_rel_cont_averb.ParamByName( '@cd_cliente' ).AsString    := 'X'
             else
               sp_rel_cont_averb.ParamByName( '@cd_cliente' ).AsString    := msk_cd_cliente.Text;

             if Trim( msk_cd_analista_comissaria.Text ) = '' then
               sp_rel_cont_averb.ParamByName( '@cd_analista' ).AsString   := 'X'
             else
               sp_rel_cont_averb.ParamByName( '@cd_analista' ).AsString   := msk_cd_analista_comissaria.Text;

             if Trim( msk_cd_servico.Text ) = '' then
               sp_rel_cont_averb.ParamByName( '@cd_servico' ).AsString    := 'X'
             else
               sp_rel_cont_averb.ParamByName( '@cd_servico' ).AsString    := msk_cd_servico.Text;

             if chk_pend_averb.Checked then
               sp_rel_cont_averb.ParamByName( '@in_proc_averb' ).AsString := '1'
             else
               sp_rel_cont_averb.ParamByName( '@in_proc_averb' ).AsString := '0';

             ExecStoredProc( sp_rel_cont_averb );
             nr_identificador := sp_rel_cont_averb.ParamByName('@nr_identificador').AsInteger;
             CloseStoredProc( sp_rel_cont_averb );
           end;
         end;
    end; //end case

    if tp_rel in [ 1,2 ] then
    begin
      Formulas[0] := 'NrIdentificador = ' + IntToStr( nr_identificador );

      if tp_rel = 2 then
      begin
        if chk_so_ult_obs.Checked then
          Formulas[1] := 'Ult_Obs = 1'
        else
          Formulas[1] := 'Ult_Obs = 0';
      end;

      Execute;

      // Apaga Dados 
      with datm_sel_unid_cli_serv_anal.qry_apaga_dados do
      begin
        if tp_rel = 1 then
          SQL[0] := 'DELETE FROM TREL_AND_PROCESSO_EXP'
        else
          SQL[0] := 'DELETE FROM TREL_CONT_AVERB';
        ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        Prepare;
        ExecSQL;

        // Observações
        if tp_rel = 2 then
        begin
          SQL[0] := 'DELETE FROM TREL_CONT_AVERB_OBS';
          ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
          Prepare;
          ExecSQL;
        end;
      end;

    end;

  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_sel_unid_cli_serv_anal.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

end.
