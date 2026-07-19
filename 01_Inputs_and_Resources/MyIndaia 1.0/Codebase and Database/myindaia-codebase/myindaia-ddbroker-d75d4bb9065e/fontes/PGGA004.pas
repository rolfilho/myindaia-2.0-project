(*************************************************************************************************

//Sistema: DD Broker - Indaiá Logística

//PROGRAMA: PGGA004.PAS - DataModule Realização por Processo

//AUTOR: Leandro Stipanich

//DATA: dd/mm/yyyy

//Manutenção: Leandro Stipanich

/Data: 15/09/2001
*************************************************************************************************)
unit PGGA004;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Funcoes;

type
  Tdatm_proc_realiza = class(TDataModule)
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_AP_EMPRESA: TStringField;
    qry_processo_NM_SERVICO: TStringField;
    qry_processo_IN_LIBERADO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    ds_processo: TDataSource;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_unid_neg_IN_ATIVO: TStringField;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_USUARIO: TStringField;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_usuario_habilitacao_IN_ATIVO: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_produto_IN_ATIVO: TStringField;
    qry_tfollowup_: TQuery;
    qry_tfollowup_NR_PROCESSO: TStringField;
    qry_tfollowup_CD_SERVICO: TStringField;
    qry_tfollowup_CD_EVENTO: TStringField;
    ds_tfollowup: TDataSource;
    qry_tevento_: TQuery;
    qry_tevento_CD_EVENTO: TStringField;
    qry_tevento_NM_EVENTO: TStringField;
    qry_tfollowup_Look_Evento: TStringField;
    qry_tfollowup_DT_REALIZACAO: TDateTimeField;
    sp_atz_followup: TStoredProc;
    qry_processo_IN_CANCELADO: TStringField;
    qry_processo_IN_PRODUCAO: TStringField;
    qry_tfollowup_IN_APLICAVEL: TStringField;
    qry_tfollowup_CD_RESP_INSPECAO: TStringField;
    qry_tfollowup_DT_INSPECAO: TDateTimeField;
    qry_tfollowup_CD_RESULT_INSPECAO: TStringField;
    qry_tfollowup_CD_RESP_REALIZACAO: TStringField;
    qry_tfollowup_CD_RESP_APLICACAO: TStringField;
    qry_tfollowup_DT_APLICACAO: TDateTimeField;
    qry_tfollowup_CalcAtrazado: TStringField;
    qry_tfollowup_DT_PREVISTA: TDateTimeField;
    qry_tfollowup_DT_LIMITE: TDateTimeField;
    qry_tp_canal_: TQuery;
    qry_tp_canal_CD_CANAL: TStringField;
    qry_tp_canal_NM_CANAL: TStringField;
    qry_proc_edita_: TQuery;
    qry_proc_edita_NR_PROCESSO: TStringField;
    qry_proc_edita_CD_CANAL: TStringField;
    qry_proc_edita_LookCanal: TStringField;
    ds_proc_edita: TDataSource;
    qry_tfollowup_TX_OBS: TMemoField;
    qry_tfollowup_IN_BLOQUEADO: TStringField;
    qry_tfollowup_CalcBloqueado: TStringField;
    qry_atz_di_: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    sp_atz_obs_followup: TStoredProc;
    qry_flp_pesq_ev_: TQuery;
    qry_flp_pesq_ev_NR_PROCESSO: TStringField;
    qry_flp_pesq_ev_CD_SERVICO: TStringField;
    qry_flp_pesq_ev_CD_EVENTO: TStringField;
    qry_flp_pesq_ev_NM_EVENTO: TStringField;
    qry_processo_NR_PROCESSO_VINC: TStringField;
    vw_in_edita_evento_: TQuery;
    vw_in_edita_evento_IN_EDITA: TStringField;
    vw_in_edita_evento_CD_EVENTO: TStringField;
    qry_tfollowup_IN_EDITA: TStringField;
    sp_ev_prev_fabrica: TStoredProc;
    qry_processo_IN_IMPORTANTE: TStringField;
    ds_processo_aux: TDataSource;
    qry_processo_aux_: TQuery;
    qry_processo_aux_IN_IMPORTANTE: TStringField;
    sp_ev_prev_emb: TStoredProc;
    procedure qry_tfollowup_AfterPost(DataSet: TDataSet);
    procedure qry_tfollowup_BeforePost(DataSet: TDataSet);
    procedure qry_tfollowup_AfterScroll(DataSet: TDataSet);
    procedure qry_tfollowup_IN_APLICAVELChange(Sender: TField);
    procedure qry_tfollowup_CalcFields(DataSet: TDataSet);
    procedure qry_proc_edita_BeforeClose(DataSet: TDataSet);
    procedure qry_proc_edita_AfterScroll(DataSet: TDataSet);
    procedure qry_processo_AfterOpen(DataSet: TDataSet);
    procedure qry_processo_AfterClose(DataSet: TDataSet);
    procedure qry_tfollowup_DT_REALIZACAOChange(Sender: TField);
    procedure qry_tfollowup_BeforeOpen(DataSet: TDataSet);
    procedure qry_tfollowup_AfterClose(DataSet: TDataSet);
    procedure datm_proc_realizaCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cd_reg_di, cd_emissao_fat, cd_prev_fab, cd_estim_cheg, cd_cheg : String[3];
  end;

var
  datm_proc_realiza: Tdatm_proc_realiza;

implementation

uses PGGA003, PGGP017, GSMLIB, PGGP001, PGSM156;

{$R *.DFM}

procedure Tdatm_proc_realiza.qry_tfollowup_AfterPost(DataSet: TDataSet);
var cProcesso, cServico, cEvento : String;
begin
  try
    with frm_proc_realiza do
    begin
      cProcesso := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
      cServico  := dbedt_cd_servico.Text;
      cEvento   := qry_tfollowup_CD_EVENTO.AsString;
    end;

    qry_tfollowup_.Close;

//    CloseStoredProc(sp_atz_followup);
//    sp_atz_followup.ParamByName('@nr_processo').AsString := cProcesso;
//    ExecStoredProc(sp_atz_followup);
//    CloseStoredProc(sp_atz_followup);

    CloseStoredProc( sp_atz_obs_followup );
    sp_atz_obs_followup.ParamByName('@nr_processo').AsString := cProcesso;
    ExecStoredProc( sp_atz_obs_followup );
    CloseStoredProc( sp_atz_obs_followup );

    CloseStoredProc( sp_ev_prev_fabrica );
    sp_ev_prev_fabrica.ParamByName('@nr_processo').AsString := cProcesso;
    sp_ev_prev_fabrica.ParamByName('@cd_evento').AsString   := cEvento;
    ExecStoredProc( sp_ev_prev_fabrica );
    CloseStoredProc( sp_ev_prev_fabrica );

    if Tfrm_follow_obs = nil then
    begin
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add('	UPDATE TFLP_PO_ITEM ');
        SQL.Add('	   SET DT_REALIZACAO = :DATA');
        SQL.Add('	 WHERE NR_PROCESSO  IN ( SELECT CD_REFERENCIA FROM TREF_CLIENTE WHERE NR_PROCESSO = ''' + cProcesso + '''');
        SQL.Add('	   AND NR_ITEM      IN ( SELECT NR_ITEM_PO    FROM TREF_CLIENTE WHERE NR_PROCESSO = ''' + cProcesso + '''');
        SQL.Add('	   AND CD_EVENTO     = ''' + cEvento + '''');
        SQL.Add('	   AND IN_APLICAVEL  = ''1''');
        ParamByName('DATA').AsDateTime := datm_proc_realiza.qry_tfollowup_DT_REALIZACAO.AsDateTime;
        ExecSQL;
        Free;
      end;
    end;

    // Altera data prev. emb. carr. para a data do carregamento - só Exportação
    if frm_proc_realiza.msk_cd_produto.Text = '02' then
    begin
      CloseStoredProc( sp_ev_prev_emb );
      sp_ev_prev_emb.ParamByName('@nr_processo').AsString := cProcesso;
      ExecStoredProc( sp_ev_prev_emb );
      CloseStoredProc( sp_ev_prev_emb );
    end;

    datm_main.db_broker.Commit;
    qry_tfollowup_.Prepare;
    qry_tfollowup_.Open;
    qry_tfollowup_.Locate('NR_PROCESSO;CD_SERVICO;CD_EVENTO',
                VarArrayOf ([cProcesso, cServico, cEvento]), [loCaseInsensitive]);
    qry_tfollowup_.EnableControls;
  except
    on E: Exception do
    begin
      datm_Proc_realiza.qry_tfollowup_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      BoxMensagem('Falha na Gravação!', 2);
    end;
  end;
  Screen.Cursor := crDefault;
end;

procedure Tdatm_proc_realiza.qry_tfollowup_BeforePost(DataSet: TDataSet);
begin
  qry_tfollowup_.DisableControls;
  Screen.Cursor := crHourGlass;
  if Not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;
  try
    if qry_tfollowup_.State in [dsEdit, dsInsert] then
    begin
      qry_tfollowup_CD_RESP_REALIZACAO.AsString := str_cd_usuario;
      qry_tfollowup_CD_RESP_INSPECAO.AsString   := str_cd_usuario;
      if dt_server > qry_tfollowup_DT_REALIZACAO.AsDateTime then
        qry_tfollowup_DT_INSPECAO.AsDateTime    := dt_server
      else
        qry_tfollowup_DT_INSPECAO.AsDateTime    := qry_tfollowup_DT_REALIZACAO.AsDatetime;
      qry_tfollowup_CD_RESULT_INSPECAO.AsString := 'C';
    end;
  except
    if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback; // Incluido por michel para evitar transação travada - Michel - 19/04/2010
  end;
end;

procedure Tdatm_proc_realiza.qry_tfollowup_AfterScroll(DataSet: TDataSet);
begin
  if ( qry_tfollowup_IN_APLICAVEL.AsString = '0' ) or
     ( qry_tfollowup_IN_BLOQUEADO.AsString = '1' ) then
  begin
    frm_proc_realiza.dbedt_realiza.Enabled  := False;
  end
  else
  begin
    frm_proc_realiza.dbedt_realiza.Enabled  := True;
  end;

  frm_proc_realiza.dbedt_realiza.Enabled  := not (qry_tfollowup_IN_EDITA.Value = '0');
  frm_proc_realiza.dbchk_aplic.Enabled    := not (qry_tfollowup_IN_EDITA.Value = '0');

  qry_flp_pesq_ev_.Close;
  qry_flp_pesq_ev_.Prepare;
  qry_flp_pesq_ev_.Open;

  //tarefa solicitada pelo sr. fernando reis
  //consiste em desabilitar eventos que alimentados automaticamente pelo sistema

  if ( qry_tfollowup_CD_EVENTO.AsString = cd_reg_di )      or
     ( qry_tfollowup_CD_EVENTO.AsString = cd_emissao_fat ) or
     ( qry_tfollowup_CD_EVENTO.AsString = cd_prev_fab )    or
     ( qry_tfollowup_CD_EVENTO.AsString = cd_estim_cheg )  or
     ( qry_tfollowup_CD_EVENTO.AsString = cd_cheg ) then
  begin
    frm_proc_realiza.dbedt_realiza.Enabled := false;
    frm_proc_realiza.dbchk_aplic.Enabled   := false;
  end
  else
  begin
    frm_proc_realiza.dbedt_realiza.Enabled := true;
    frm_proc_realiza.dbchk_aplic.Enabled   := true;
  end;

  Application.ProcessMessages;
end;

procedure Tdatm_proc_realiza.qry_tfollowup_IN_APLICAVELChange(Sender: TField);
begin
  if qry_tfollowup_IN_APLICAVEL.AsString = '0' then
  begin
    qry_tfollowup_DT_REALIZACAO.AsVariant    := Null;
    frm_proc_realiza.dbedt_realiza.Enabled   := False;
    qry_tfollowup_CD_RESP_APLICACAO.AsString := str_cd_usuario;
    qry_tfollowup_DT_APLICACAO.AsDateTime    := date;
  end
  else
  begin
    frm_proc_realiza.dbedt_realiza.Enabled := True;
    frm_proc_realiza.dbedt_realiza.SetFocus;
  end;
  Application.ProcessMessages;
end;

procedure Tdatm_proc_realiza.qry_tfollowup_CalcFields(DataSet: TDataSet);
begin
  if qry_tfollowup_IN_APLICAVEL.AsString = '1' then
    if ( qry_tfollowup_DT_REALIZACAO.IsNull ) or
       ( qry_tfollowup_DT_REALIZACAO.AsDateTime = 0 ) then
      if ( ( qry_tfollowup_DT_PREVISTA.AsDateTime <> 0 ) and
           ( qry_tfollowup_DT_PREVISTA.AsDateTime < date ) ) or
         ( ( qry_tfollowup_DT_LIMITE.AsDateTime <> 0 ) and
           ( qry_tfollowup_DT_LIMITE.AsDateTime < date ) ) then
        qry_tfollowup_CalcAtrazado.AsString := 'Atrasado'
      else
        if ( ( qry_tfollowup_DT_PREVISTA.AsDateTime <> 0 ) and
             ( qry_tfollowup_DT_PREVISTA.AsDateTime = date ) ) or
           ( ( qry_tfollowup_DT_LIMITE.AsDateTime <> 0 ) and
             ( qry_tfollowup_DT_LIMITE.AsDateTime = date ) ) then
          qry_tfollowup_CalcAtrazado.AsString := 'Atenção'
        else
          qry_tfollowup_CalcAtrazado.AsString := ''
    else
      qry_tfollowup_CalcAtrazado.AsString := ''
  else
    qry_tfollowup_CalcAtrazado.AsString := '';
  if qry_tfollowup_IN_BLOQUEADO.AsString = '0' then qry_tfollowup_CalcBloqueado.AsString := ''
  else qry_tfollowup_CalcBloqueado.AsString := 'X';
end;


procedure Tdatm_proc_realiza.qry_proc_edita_BeforeClose(DataSet: TDataSet);
begin
  if qry_proc_edita_.State in [dsEdit] then qry_proc_edita_.Post;
end;

procedure Tdatm_proc_realiza.qry_proc_edita_AfterScroll(DataSet: TDataSet);
begin
  if qry_proc_edita_.State in [dsEdit] then qry_proc_edita_.Post;
end;

procedure Tdatm_proc_realiza.qry_processo_AfterOpen(DataSet: TDataSet);
begin
  qry_proc_edita_.Open;
end;

procedure Tdatm_proc_realiza.qry_processo_AfterClose(DataSet: TDataSet);
begin
  qry_proc_edita_.Close;
end;

procedure Tdatm_proc_realiza.qry_tfollowup_DT_REALIZACAOChange(
  Sender: TField);
begin
  if qry_tfollowup_CD_EVENTO.AsString = str_cd_ev_chegada then
  begin
    datm_proc_realiza.qry_atz_di_.Close;
    datm_proc_realiza.qry_atz_di_.ParamByName('NR_PROCESSO').AsString := qry_tfollowup_NR_PROCESSO.AsString;
    datm_proc_realiza.qry_atz_di_.ParamByName('DT_CHEGADA').AsString  := FormatDateTime( 'ddmmyyyy', qry_tfollowup_DT_REALIZACAO.AsDateTime );
    datm_proc_realiza.qry_atz_di_.ExecSQL;
    datm_proc_realiza.qry_atz_di_.Close;
  end;
end;

procedure Tdatm_proc_realiza.qry_tfollowup_BeforeOpen(DataSet: TDataSet);
begin
  vw_in_edita_evento_.Open;
end;

procedure Tdatm_proc_realiza.qry_tfollowup_AfterClose(DataSet: TDataSet);
begin
  vw_in_edita_evento_.Close;
end;


procedure Tdatm_proc_realiza.datm_proc_realizaCreate(Sender: TObject);
begin
  with TQuery.Create( Application ) do
  begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add('SELECT CD_EV_REG_DI, CD_ITEM_DED, CD_EV_PREV_FABRICA, CD_EV_ESPERA_NAVIO, CD_EV_ENT'+
            '  FROM TPARAMETROS');
    Prepare;
    Open;
    cd_reg_di      := FieldByName('CD_EV_REG_DI').AsString;
    cd_emissao_fat := FieldByName('CD_ITEM_DED').AsString;
    cd_prev_fab    := FieldByName('CD_EV_PREV_FABRICA').AsString;
    cd_estim_cheg  := FieldByName('CD_EV_ESPERA_NAVIO').AsString;
    cd_cheg        := FieldByName('CD_EV_ENT').AsString;
    Free;
  end;
end;

end.
