unit uProcComercAgendVisita;
(*******************************************************************************
SISTEMA: Broker - Cargo
PROGRAMA: PGSM256.PAS - frm_agendamento_visita
AUTOR: Paulo do Amaral Costa
DATA: 29/07/2002
MANUTENÇÃO:  -
DATA: -
NÚMERO DOCUMENTO - ADBCEC-0011
ANALISTAS RESPONSÁVEIS: Claudemir Lopes  &  Renato Ribeiro
CLIENTE: Ecotrans / Sr. Hélio
********************************************************************************)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, DBCGrids, PGGP001, RXDBCtrl, ToolEdit, RxDBComb, Funcoes;

type
  Tfrm_proc_comerc_agend_visita = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    pnl_entrada_de_dados: TPanel;
    stt_nm_usuario: TStaticText;
    dbrg_in_periodo: TDBRadioGroup;
    dbmemo_obs_agenda: TDBMemo;
    stt_nr_proc_comerc: TStaticText;
    stt_look_nm_cliente: TStaticText;
    stt_cd_unid_neg: TStaticText;
    stt_look_nm_unid_neg: TStaticText;
    Label19: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dtpick_dt_agenda: TDateTimePicker;
    Label7: TLabel;
    edt_contato: TEdit;
    btn_cons_agenda: TSpeedButton;
    msk_hora: TMaskEdit;
    dbedt_cd_vendedor: TDBEdit;
    Label3: TLabel;
    dbedt_look_nm_vendedor: TDBEdit;
    btn_co_cd_vendedor: TSpeedButton;
    Bevel1: TBevel;
    dbedt_nm_historico: TRxDBComboBox;
    Label29: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_salvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_cons_agendaClick(Sender: TObject);
    procedure msk_horaExit(Sender: TObject);
    procedure dbrg_in_periodoClick(Sender: TObject);
    procedure btn_co_cd_vendedorClick(Sender: TObject);
    procedure dbedt_cd_vendedorExit(Sender: TObject);
    procedure dtpick_dt_agendaExit(Sender: TObject);
    procedure dbedt_cd_vendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


  private
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;

    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure Cancelar;
    procedure Desabilitar;
    procedure Habilitar;
  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_proc_comerc_agend_visita: Tfrm_proc_comerc_agend_visita;
  tt_hr:TTime;
implementation

uses GSMLIB, PGGP017, PGSM252, PGSM253, PGSM255, dAgendaComercial, uVendedores,
  dProcComerc, uProcComerc, uAgendaComercial, ConsOnLineEx;


{$R *.DFM}

procedure Tfrm_proc_comerc_agend_visita.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_proc_comerc.qry_agenda_comerc_.Close;
  Action := caFree;
end;

procedure Tfrm_proc_comerc_agend_visita.btn_salvarClick(Sender: TObject);
begin
{ --- inibido para permitir datas retroativas kleber (28/07/2006)
  if dtpick_dt_agenda.DateTime < dt_server - 1 then
  begin
    Boxmensagem('Deve ser informado uma data superior a de ontem!',2);
    dtpick_dt_agenda.SetFocus;
    Exit;
  end;                }
  if Not Consiste then Exit;
  if Not Grava    then Exit;
end;

procedure Tfrm_proc_comerc_agend_visita.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;

  stt_nm_usuario.Caption := stt_nm_usuario.Caption + str_nm_usuario;
  stt_cd_unid_neg.Caption := datm_proc_comerc.qry_proc_comerc_CD_UNID_NEG.AsString;
  stt_look_nm_unid_neg.Caption := datm_proc_comerc.qry_proc_comerc_look_NM_UNID_NEG.AsString;
  stt_nr_proc_comerc.Caption := datm_proc_comerc.qry_proc_comerc_NR_PROC_COMERC.AsString;
  stt_look_nm_cliente.Caption := datm_proc_comerc.qry_proc_comerc_NM_EMPRESA.AsString;

  case Tag of
    1 : with datm_proc_comerc do  //<-- tag = 1 indica abertura de form para novo agendamento
        begin
          Habilitar;
          qry_ult_agenda_comerc_.Close;
          qry_ult_agenda_comerc_.Prepare;
          qry_ult_agenda_comerc_.Open;
          qry_agenda_comerc_.Close;
          qry_agenda_comerc_.Open;
          qry_agenda_comerc_.Append;
          qry_agenda_comerc_CD_AGENDA.Value  := qry_ult_agenda_comerc_ULTIMO.Value + 1;
          qry_ult_agenda_comerc_.Close;
          qry_agenda_comerc_IN_PERIODO.Value  := '1';
        //  qry_agenda_comerc_CD_VENDEDOR.AsString:=qry_proc_comerc_CD_VENDEDOR.AsString;
          dbmemo_obs_agenda.Enabled := true;
          dbmemo_obs_agenda.Color := clWindow;
          edt_contato.text:=qry_proc_comerc_NM_CONTATO.AsString;
          qry_agenda_comerc_IN_CANCELADO.Value  := '0';
          if (Sender = btn_incluir) then
          begin
            frm_proc_comerc.Get_DataHora_Servidor;
            edt_contato.Text := '';
          end;
          qry_agenda_comerc_DT_AGENDA.AsString := FormatDateTime('dd/mm/yyyy',dt_server);
          //qry_agenda_comerc_HR_AGENDA.AsString:= FormatDateTime('hh:nn',hr_server);
          qry_agenda_comerc_NR_PROC_COMERC.AsString := qry_proc_comerc_NR_PROC_COMERC.Value;
          dtpick_dt_agenda.Date := StrToDate(FormatDateTime('dd/mm/yyyy',dt_server));
          //msk_hora.text := (FormatDateTime('hh:nn',hr_server));
        end;
    2 : with datm_proc_comerc do  //<-- tag = 2 indica abertura de form para ediçao do agendamento corrente
        begin
          dbmemo_obs_agenda.Enabled := false;
          dbmemo_obs_agenda.Color := clMenu;
          qry_agenda_comerc_.Close;
          qry_agenda_comerc_.SQL.Clear;
          qry_agenda_comerc_.SQL.Add('select * from TAGENDA_COMERC where CD_AGENDA=:CD_AGENDA');
          qry_agenda_comerc_.ParamByName('CD_AGENDA').Value := qry_agenda_comerc_lista_CD_AGENDA.Value;
          qry_agenda_comerc_.Open;
          qry_agenda_comerc_.Edit;
          if qry_proc_comerc_historico_.Locate('CD_AGENDA', qry_agenda_comerc_CD_AGENDA.Value,[]) then
          edt_contato.Text := qry_proc_comerc_historico_NM_CONTATO.Value;
          dtpick_dt_agenda.Date := StrToDate(FormatDateTime('dd/mm/yyyy',qry_agenda_comerc_DT_AGENDA.Value));
          msk_hora.Text := (FormatDateTime('hh:nn',qry_agenda_comerc_HR_AGENDA.Value));
        end;
  end;

  btn_sair.Enabled := True;
  btn_salvar.Enabled := True;
  btn_incluir.Enabled  := False;
  dbedt_cd_vendedor.SetFocus;
end;

function Tfrm_proc_comerc_agend_visita.Consiste : Boolean;
begin
  Consiste:=True;
  if dbedt_cd_vendedor.TEXT =''then
  begin
    Consiste := False;
    BoxMensagem('Campo "Vendedor" deve ser preenchido!', 2);
    dbedt_cd_vendedor.SetFocus;
    SysUtils.Abort;
  end;
  if edt_contato.Text = '' then
  begin
    Consiste := False;
    BoxMensagem('Campo "Contato" deve ser preenchido!', 2);
    edt_contato.SetFocus;
    SysUtils.Abort;
  end;
  if dbrg_in_periodo.Value = '' then
  begin
    Consiste := False;
    BoxMensagem('Campo "Período" deve ser marcado!', 2);
    dbrg_in_periodo.SetFocus;
    SysUtils.Abort;
  end;
  if msk_hora.Text = '  :  ' then begin
    Consiste := False;
    BoxMensagem('Campo "Hora" deve ser preenchido ou preenchido corretamente', 2);
    dbrg_in_periodo.SetFocus;
    SysUtils.Abort;
  end;
  if dbedt_nm_historico.Text = '' then begin
    Consiste := False;
    BoxMensagem('Campo "Meio de Contato" deve ser preenchido', 2);
    dbrg_in_periodo.SetFocus;
    SysUtils.Abort;
  end;
  Consiste := True;
end;

function Tfrm_proc_comerc_agend_visita.Grava : Boolean;
begin
  try
    datm_proc_comerc.qry_agenda_comerc_DT_AGENDA.AsString := DateToStr(dtpick_dt_agenda.Date);
    datm_proc_comerc.qry_agenda_comerc_HR_AGENDA.AsString := msk_hora.text;

    with datm_proc_comerc do
    begin
      qry_agenda_.Close;
      qry_agenda_.ParamByName('CD_VENDEDOR').Value := dbedt_cd_vendedor.TExt;
      qry_agenda_.ParamByName('IN_PERIODO').Value := dbrg_in_periodo.Value;
      qry_agenda_.ParamByName('DT_AGENDA').Value := qry_agenda_comerc_DT_AGENDA.Value;
      qry_agenda_.Open;
      if not qry_agenda_.IsEmpty then
        if (qry_agenda_.RecordCount > 1) or (qry_agenda_CD_AGENDA.Value <> qry_agenda_comerc_CD_AGENDA.Value) then
        begin
          BoxMensagem('Vendedor já possui compromisso agendado para esta DATA e PERÍODO!',2);
          Grava:= False;
          qry_agenda_.Close;
          Exit;
        end;
      qry_agenda_.Close;
    end;

    if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;

    if ( datm_proc_comerc.qry_agenda_comerc_.State = dsInsert ) then
    begin
      datm_proc_comerc.qry_ult_proc_comerc_historico_.Close;
      datm_proc_comerc.qry_ult_proc_comerc_historico_.Prepare;
      datm_proc_comerc.qry_ult_proc_comerc_historico_.Open;
     { With Tquery.Create(Application) do
        begin
         DataBasename:='DBBROKER';
         Sql.Add('INSERT INTO TPROC_COMERC_HISTORICO (NR_PROC_COMERC, CD_HIST_PROC_COMERC, DT_HISTORICO,');
         Sql.Add(' HR_HISTORICO, CD_AGENDA, NM_HISTORICO, NM_CONTATO, TX_OBS_HISTORICO)');
         Sql.Add('VALUES(:NR_PROC_COMERC, :CD_HIST_PROC_COMERC, :DT_HISTORICO,');
         Sql.Add(' :HR_HISTORICO, :CD_AGENDA, :NM_HISTORICO, :NM_CONTATO, :TX_OBS_HISTORICO)');
         Params[0].AsString:= datm_proc_comerc.qry_proc_comerc_NR_PROC_COMERC.Value;
         Params[1].VAlue   := datm_proc_comerc.qry_ult_proc_comerc_historico_ULTIMO.Value + 1;
         Params[2].AsString:= datm_proc_comerc.qry_agenda_comerc_DT_AGENDA.AsString;
         Params[3].AsString:= datm_proc_comerc.qry_agenda_comerc_HR_AGENDA.AsString;
         Params[4].Value   := datm_proc_comerc.qry_agenda_comerc_CD_AGENDA.Value;
         Params[5].AsString:= '0';
         Params[6].AsString:= edt_contato.Text;
         Params[7].AsString:= datm_proc_comerc.qry_agenda_comerc_OBS_AGENDA.AsString;//dbmemo_obs_agenda.Text;
         //Params[8].AsString:=
         ExecSql;
        end;}
       datm_proc_comerc.qry_agenda_comerc_DT_AGENDA.AsString := DateTimeToStr(dtpick_dt_agenda.Date);
       datm_proc_comerc.qry_agenda_comerc_HR_AGENDA.AsString := msk_hora.text;
       datm_proc_comerc.qry_agenda_comerc_NM_CONTATO.AsString :=edt_contato.TEXT;
       datm_proc_comerc.qry_agenda_comerc_.Post;

      datm_proc_comerc.qry_proc_comerc_historico_.Append;
      datm_proc_comerc.qry_proc_comerc_historico_NR_PROC_COMERC.Value  := datm_proc_comerc.qry_proc_comerc_NR_PROC_COMERC.Value;
      datm_proc_comerc.qry_proc_comerc_historico_CD_HIST_PROC_COMERC.Value  := datm_proc_comerc.qry_ult_proc_comerc_historico_ULTIMO.Value + 1;
      datm_proc_comerc.qry_ult_proc_comerc_historico_.Close;
      datm_proc_comerc.qry_proc_comerc_historico_DT_HISTORICO.AsString := datm_proc_comerc.qry_agenda_comerc_DT_AGENDA.AsString;
      datm_proc_comerc.qry_proc_comerc_historico_HR_HISTORICO.AsString := datm_proc_comerc.qry_agenda_comerc_HR_AGENDA.AsString;
      datm_proc_comerc.qry_proc_comerc_historico_CD_AGENDA.Value := datm_proc_comerc.qry_agenda_comerc_CD_AGENDA.Value;
      datm_proc_comerc.qry_proc_comerc_historico_NM_HISTORICO.Value := datm_proc_comerc.qry_agenda_comerc_TP_AGENDA.AsString;
      datm_proc_comerc.qry_proc_comerc_historico_NM_CONTATO.Value := edt_contato.Text;
      datm_proc_comerc.qry_proc_comerc_historico_TX_OBS_HISTORICO.AsString := datm_proc_comerc.qry_agenda_comerc_OBS_AGENDA.AsString;
      datm_proc_comerc.qry_proc_comerc_historico_.Post;
      Desabilitar;
    end
    else
    if ( datm_proc_comerc.qry_agenda_comerc_.State = dsEdit ) then
    begin
      if datm_proc_comerc.qry_proc_comerc_historico_.Locate('CD_AGENDA', datm_proc_comerc.qry_agenda_comerc_CD_AGENDA.Value,[]) then
      begin
        datm_proc_comerc.qry_agenda_comerc_DT_AGENDA.AsString := DateTimeToStr(dtpick_dt_agenda.Date);
        datm_proc_comerc.qry_agenda_comerc_HR_AGENDA.AsString := msk_hora.text;
        datm_proc_comerc.qry_agenda_comerc_NM_CONTATO.AsString :=edt_contato.TEXT;
        datm_proc_comerc.qry_agenda_comerc_.Post;

        datm_proc_comerc.qry_proc_comerc_historico_.Edit;
        datm_proc_comerc.qry_proc_comerc_historico_DT_HISTORICO.AsString := datm_proc_comerc.qry_agenda_comerc_DT_AGENDA.AsString;
        datm_proc_comerc.qry_proc_comerc_historico_HR_HISTORICO.AsString := datm_proc_comerc.qry_agenda_comerc_HR_AGENDA.AsString;
        datm_proc_comerc.qry_proc_comerc_historico_CD_AGENDA.Value := datm_proc_comerc.qry_agenda_comerc_CD_AGENDA.Value;
        datm_proc_comerc.qry_proc_comerc_historico_NM_HISTORICO.Value := datm_proc_comerc.qry_agenda_comerc_TP_AGENDA.AsString;
        datm_proc_comerc.qry_proc_comerc_historico_NM_CONTATO.Value := edt_contato.Text;
        datm_proc_comerc.qry_proc_comerc_historico_.Post;

        Desabilitar;
      end
      else
      begin
        BoxMensagem('Registro do Histórico do agendamento não existe!', 2);
        datm_proc_comerc.qry_proc_comerc_historico_.cancel;
      end;
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      datm_proc_comerc.qry_agenda_comerc_.cancel;
      datm_proc_comerc.qry_proc_comerc_historico_.cancel;
      TrataErro(E);
      Grava := False;
    end;
  end;
  btn_salvar.Enabled := False;
  btn_incluir.Enabled := True;
//  if Tag = 2 then
//    Close;
end;

function Tfrm_proc_comerc_agend_visita.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_proc_comerc.qry_agenda_comerc_.State in [dsEdit] ) and st_modificar ) or
     ( datm_proc_comerc.qry_agenda_comerc_.State in [dsInsert] ) then
  begin
    if BoxMensagem('O Cadastro de Agendamento de Visitas foi alterado.' + #13#10 +
       'Deseja salvar as alterações?', 1) then
    begin
      if Not Consiste then
      begin
        VerAlt := False;
        //Exit;
        Abort;
      end;
      if Not Grava then
      begin
        VerAlt := False;
        //Exit;
        Abort;
      end;
    end
    else
      Cancelar;
  end;
end;

procedure Tfrm_proc_comerc_agend_visita.Cancelar;
begin
  try
    if datm_proc_comerc.qry_agenda_comerc_.State in [dsInsert, dsEdit] then
    begin
      datm_proc_comerc.qry_agenda_comerc_.Cancel;
      dbedt_cd_vendedor.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
end;

procedure Tfrm_proc_comerc_agend_visita.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  VerAlt;
end;

procedure Tfrm_proc_comerc_agend_visita.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_proc_comerc_agend_visita.btn_incluirClick(Sender: TObject);
begin
  datm_proc_comerc.qry_agenda_comerc_.SQL.Clear;
  datm_proc_comerc.qry_agenda_comerc_.SQL.Add('select TOP 1 * from TAGENDA_COMERC');
  FormShow(btn_incluir);
end;

procedure Tfrm_proc_comerc_agend_visita.Desabilitar;
begin
  dbedt_cd_vendedor.Enabled := False;
  edt_contato.Enabled := False;
  dbrg_in_periodo.Enabled := False;
  dtpick_dt_agenda.Enabled := False;
  msk_hora.enabled:=false;
  dbmemo_obs_agenda.Enabled := False;
end;

procedure Tfrm_proc_comerc_agend_visita.Habilitar;
begin
  dbedt_cd_vendedor.Enabled := True;
  edt_contato.Enabled := True;
  dbrg_in_periodo.Enabled := True;
  dtpick_dt_agenda.Enabled := True;
  msk_hora.enabled:=true;
  dbmemo_obs_agenda.Enabled := True;
end;

procedure Tfrm_proc_comerc_agend_visita.btn_cons_agendaClick(
  Sender: TObject);
begin
  vStr_cd_modulo := '31';
  str_cd_rotina := '3103';
  Application.CreateForm(Tfrm_agenda_comercial , frm_agenda_comercial  );
  with frm_agenda_comercial do
   begin
    ts_mov_ag.TabVisible:=false;
    btn_incluir.Enabled :=false;
    btn_excluir.Enabled :=false;
    msk_cd_vendedor.text:=datm_proc_comerc.qry_agenda_comerc_CD_VENDEDOR.AsString;
    edt_nm_vendedor.text:=dbedt_look_nm_vendedor.text;
    DateEditData.text   :=DateToStr(dtpick_dt_agenda.Date);
    DateEditDataExit(nil);
    ShowModal;
   end;
   vStr_cd_modulo := '31';
   str_cd_rotina := '3101';
end;

procedure Tfrm_proc_comerc_agend_visita.msk_horaExit(Sender: TObject);
var hora1:integer;

begin
 hora1:=strtoint(copy(msk_hora.TEXT,1,2));
 if (hora1 >= 18)  or (hora1 < 08) or (( hora1 >= 12)and (hora1 < 14)) then
    begin
     Boxmensagem('Hora fora dos intervalos de trabalho!',2);
     exit;
    end;
     if hora1 in[8,9] then
      datm_proc_comerc.qry_agenda_comerc_IN_PERIODO.AsString:='1';

    if hora1 in[10,11] then
      datm_proc_comerc.qry_agenda_comerc_IN_PERIODO.AsString:='2';

    if hora1 in[14,15] then
      datm_proc_comerc.qry_agenda_comerc_IN_PERIODO.AsString:='3';

   if hora1 in[16,17] then
      datm_proc_comerc.qry_agenda_comerc_IN_PERIODO.AsString:='4';


end;

procedure Tfrm_proc_comerc_agend_visita.dbrg_in_periodoClick(
  Sender: TObject);
begin
 if dbrg_in_periodo.ItemIndex = 0 then
    begin
      msk_hora.TEXT:='08:00';
    end;
   if dbrg_in_periodo.ItemIndex = 1 then
    begin
      msk_hora.TEXT:='10:00';
    end;
   if dbrg_in_periodo.ItemIndex = 2 then
    begin
    msk_hora.TEXT:='14:00';
    end;
   if dbrg_in_periodo.ItemIndex = 3 then
    begin
    msk_hora.TEXT:='16:00';
    end;
end;

procedure Tfrm_proc_comerc_agend_visita.btn_co_cd_vendedorClick(
  Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_proc_comerc.qry_agenda_comerc_) then exit;
    datm_proc_comerc.qry_agenda_comerc_CD_VENDEDOR.Value := ConsultaOnLineEx('TVENDEDOR','Vendedores',['CD_VENDEDOR','NM_VENDEDOR'],['Código','Nome'],'CD_VENDEDOR',nil);
  end;
  dbedt_cd_vendedorExit(Sender);
end;

procedure Tfrm_proc_comerc_agend_visita.dbedt_cd_vendedorExit(
  Sender: TObject);
begin
  if Not ( datm_proc_comerc.qry_agenda_comerc_.State in [dsEdit, dsInsert] ) then Exit;

 if dbedt_cd_vendedor.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_vendedor );
    if dbedt_look_nm_vendedor.text = '' then
      begin
       Boxmensagem('Código do vendedor inválido!',2);
       dbedt_cd_vendedor.setfocus;
       Exit;
      end;
     with Tquery.Create(Application) do
      begin
       DatabaseName:='DBBROKER';
       Sql.Clear;
       Sql.Add('SELECT COUNT(CD_VENDEDOR)  FROM TPROC_VENDEDOR  ');
       Sql.Add(' WHERE NR_PROC_COMERC="'+datm_proc_comerc.qry_proc_comerc_NR_PROC_COMERC.AsString+'"');
       Sql.Add(' AND CD_VENDEDOR = "'+dbedt_cd_vendedor.Text+'"');
       Open;
       if Fields[0].AsInteger = 0 then
        begin
         Boxmensagem('O Vendedor não esta relacionado para este Cliente!',2);
         dbedt_cd_vendedor.setfocus;
         Free;
         Exit;
        end;
        Free;
      end;
  end;

end;

procedure Tfrm_proc_comerc_agend_visita.dtpick_dt_agendaExit(Sender: TObject);
var
  data : string;
begin
  try
    data:= datetimetostr(dtpick_dt_agenda.DateTime);
  except
    boxmensagem('Necessário Inserir uma data',2);
    exit;
  end;
{ --- inibido para permitir datas prévias (kleber 28/07/2006)
  if dtpick_dt_agenda.DateTime < dt_server - 1 then
  begin
    Boxmensagem('Deve ser informado uma data superior a de ontem!',2);
    dtpick_dt_agenda.SetFocus;
  end;   }
end;

procedure Tfrm_proc_comerc_agend_visita.dbedt_cd_vendedorKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_vendedor then btn_co_cd_vendedorClick(btn_co_cd_vendedor);
  end;
end;

end.
