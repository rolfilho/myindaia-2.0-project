unit PGSM026;

interface       

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_servico = class(TDataModule)
    ds_servico: TDataSource;
    qry_ult_servico_: TQuery;
    qry_ult_servico_ULTIMO: TStringField;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    ds_classif: TDataSource;
    qry_classif_: TQuery;
    ds_via_transp: TDataSource;
    qry_via_transp_: TQuery;
    qry_via_transp_CD_VIA_TRANSP: TStringField;
    qry_via_transp_NM_VIA_TRANSP: TStringField;
    qry_classif_CD_CLASSIFICACAO: TStringField;
    qry_classif_NM_CLASSIFICACAO: TStringField;
    ds_servico_evento: TDataSource;
    qry_servico_evento_: TQuery;
    qry_servico_evento_CD_SERVICO: TStringField;
    qry_servico_evento_CD_EVENTO: TStringField;
    qry_servico_evento_NR_ORDEM: TFloatField;
    qry_servico_evento_CD_EV_BASICO: TStringField;
    qry_servico_evento_PZ_DO_EV_BASICO: TFloatField;
    qry_servico_evento_CD_EV_FUTURO: TStringField;
    qry_servico_evento_PZ_ATE_EV_FUTURO: TFloatField;
    ds_evento: TDataSource;
    qry_evento_: TQuery;
    qry_evento_CD_EVENTO: TStringField;
    qry_evento_NM_EVENTO: TStringField;
    qry_servico_evento_LookEvento: TStringField;
    qry_servico_evento_Look_ev_basico: TStringField;
    qry_servico_evento_Look_ev_futuro: TStringField;
    qry_ult_ordem_: TQuery;
    qry_ult_ordem_ULTIMO: TFloatField;
    qry_servico_evento_LookServico: TStringField;
    qry_ev_base_: TQuery;
    qry_ev_futuro_: TQuery;
    qry_ev_futuro_NR_ORDEM: TFloatField;
    qry_ev_base_NR_ORDEM: TFloatField;
    sp_ordena_evento: TStoredProc;
    sp_exclui_servico_evento: TStoredProc;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    tbl_yesno_IN_YESNO: TBooleanField;
    qry_se_conclusor_: TQuery;
    qry_grupo_servico_: TQuery;
    qry_grupo_servico_CD_GRUPO: TStringField;
    qry_grupo_servico_NM_GRUPO: TStringField;
    qry_ctrl_vencto_: TQuery;
    qry_ctrl_vencto_TP_CTRL_VENCTO: TStringField;
    qry_ctrl_vencto_NM_TP_CTRL_VENCTO: TStringField;
    qry_servico_evento_CD_TIPO_EVENTO: TStringField;
    qry_ttp_tipo_evento_: TQuery;
    ds_ttp_tipo_evento: TDataSource;
    upd_servico: TUpdateSQL;
    qry_servico_: TQuery;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_servico_CD_CLASSIFICACAO: TStringField;
    qry_servico_CD_VIA_TRANSPORTE: TStringField;
    qry_servico_IN_ATIVO: TStringField;
    qry_servico_NR_DIAS_CONCLUSAO: TIntegerField;
    qry_servico_CD_EVENTO_CONCLUSOR: TStringField;
    qry_servico_IN_FOLLOWUP: TStringField;
    qry_servico_LookEventoConclusor: TStringField;
    qry_servico_LookClassif: TStringField;
    qry_servico_LookViaTransp: TStringField;
    qry_servico_LookAtivo: TStringField;
    qry_servico_IN_ADM_TEMP: TStringField;
    qry_servico_LookAdmTemp: TStringField;
    qry_servico_IN_INDENT: TStringField;
    qry_servico_CD_EV_INI: TStringField;
    qry_servico_CD_EV_FIM: TStringField;
    qry_servico_CD_GRUPO: TStringField;
    qry_servico_LookInicial: TStringField;
    qry_servico_LookFim: TStringField;
    qry_servico_LookServico: TStringField;
    qry_servico_TP_CTRL_VENCTO: TStringField;
    qry_servico_LookContVenc: TStringField;
    qry_servico_TP_SERVICO: TStringField;
    qry_servico_CD_CT_CUSTO_1: TStringField;
    qry_servico_CD_CT_CUSTO_2: TStringField;
    qry_servico_CD_CT_CUSTO_3: TStringField;
    qry_servico_CD_CT_CUSTO_4: TStringField;
    qry_servico_CD_CT_CUSTO_5: TStringField;
    qry_servico_CD_CT_CUSTO_6: TStringField;
    qry_servico_CD_CT_CUSTO_7: TStringField;
    qry_servico_CD_CT_CUSTO_8: TStringField;
    qry_servico_CD_CT_CUSTO_9: TStringField;
    qry_servico_CD_CT_CUSTO_10: TStringField;
    qry_servico_CD_CT_CUSTO_11: TStringField;
    qry_servico_IN_ALADI: TStringField;
    qry_servico_IN_FUMIGACAO: TStringField;
    qry_servico_LookAladi: TStringField;
    qry_servico_LookFumigacao: TStringField;
    qry_servico_IN_CHECK: TStringField;
    qry_servico_NR_CAD_CONFIG_STATUS: TIntegerField;
    qry_servico_IN_SUBSTITUI: TStringField;
    qry_servico_IN_LI: TStringField;
    qry_servico_NM_CLASSIFICACAO: TStringField;
    qry_servico_NM_VIA_TRANSP: TStringField;
    upd_servico_evento_: TUpdateSQL;
    qry_servico_evento_IN_DASHBOARD: TBooleanField;
    qry_servico_evento_IN_PRAZO_UTIL: TStringField;
    qry_servico_evento_IN_PRAZO_FERIADO: TStringField;
    sp_ordena_eventos_novo: TStoredProc;
    sp_exclui_servico_evento_novo: TStoredProc;
    procedure qry_servico_evento_AfterScroll(DataSet: TDataSet);
    procedure qry_servico_AfterScroll(DataSet: TDataSet);
    procedure qry_servico_BeforePost(DataSet: TDataSet);
    procedure qry_servico_evento_AfterDelete(DataSet: TDataSet);
    procedure qry_servico_AfterPost(DataSet: TDataSet);
    procedure qry_servico_evento_AfterPost(DataSet: TDataSet);
  private
    FServicoNovo: Boolean;
    procedure SetServicoNovo(const Value: Boolean);
  public
    Nr_Ordem : Integer;
    property ServicoNovo: Boolean read FServicoNovo write SetServicoNovo;
  end;

var
  datm_servico: Tdatm_servico;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGSM022;

procedure Tdatm_servico.qry_servico_evento_AfterScroll(DataSet: TDataSet);
begin
  Nr_Ordem := qry_servico_evento_NR_ORDEM.AsInteger;
//  o wagner falou pra comentar isso isso... o vítor fez !!!
//  if qry_servico_evento_CD_EVENTO.AsString = str_cd_ev_abre_proc then
//    frm_servico.pnl_servico_evento.Enabled := False
//  else
//    frm_servico.pnl_servico_evento.Enabled := True;
end;

procedure Tdatm_servico.qry_servico_AfterScroll(DataSet: TDataSet);
begin
  if Assigned(qry_servico_CD_SERVICO) then
  begin
    with qry_servico_evento_ do
    begin
      Close;
      if ServicoNovo then
        ParamByName('CD_SERVICO').AsInteger := qry_servico_CD_SERVICO.AsInteger
      else
        ParamByName('CD_SERVICO').AsString := qry_servico_CD_SERVICO.AsString;
      Prepare;
      Open;
    end;
  end;
end;

procedure Tdatm_servico.qry_servico_BeforePost(DataSet: TDataSet);
begin
  if qry_servico_CD_EVENTO_CONCLUSOR.AsString = '' then
  begin
    BoxMensagem( 'Evento Conclusor não informado! Serviço inativo!', 3);
    qry_servico_IN_ATIVO.AsString := '0';
  end;
end;

procedure Tdatm_servico.qry_servico_evento_AfterDelete(DataSet: TDataSet);
begin
  with frm_servico do
  begin
    if ( pgctrl_servico.ActivePage = ts_dados_basicos ) or
       ( pgctrl_servico.ActivePage = ts_lista ) then
    begin
      dbnvg.DataSource     := datm_servico.ds_servico;
      btn_duplicar.Enabled := False;
      mi_duplicar.Enabled  := False;
    end
    else
    begin
      dbnvg.DataSource := datm_servico.ds_servico_evento;
      if datm_servico.qry_servico_evento_.RecordCount = 0 then
      begin
        btn_duplicar.Enabled := True;
        mi_duplicar.Enabled  := True;
      end
      else
      begin
        btn_duplicar.Enabled := False;
        mi_duplicar.Enabled  := False;
      end;
    end;
  end;
  qry_servico_evento_.ApplyUpdates;  
end;

procedure Tdatm_servico.qry_servico_AfterPost(DataSet: TDataSet);
begin
  qry_servico_.ApplyUpdates;
end;

procedure Tdatm_servico.qry_servico_evento_AfterPost(DataSet: TDataSet);
begin
  qry_servico_evento_.ApplyUpdates;
end;

procedure Tdatm_servico.SetServicoNovo(const Value: Boolean);
var
  I: Integer;
  Ativo: Boolean;
  SQL, DSQL, ISQL, MSQL: string;
begin
  if FServicoNovo <> Value then
  begin
    FServicoNovo := Value;

    {if Value then
    begin
      sp_ordena_evento.StoredProcName := 'dbo.sp_ordena_eventos_novo';
      sp_exclui_servico_evento.StoredProcName := 'dbo.sp_exclui_servico_evento_novo';
    end
    else
    begin
      sp_ordena_evento.StoredProcName := 'dbo.sp_ordena_eventos';
      sp_exclui_servico_evento.StoredProcName := 'dbo.sp_exclui_servico_evento';
    end;}

    I := 0;
    while I < ComponentCount do
    begin
      if (Components[I] is TQuery) then
      begin
        Ativo := TQuery(Components[I]).Active;
        TQuery(Components[I]).Active := False;

        SQL := TQuery(Components[I]).SQL.Text;
        if Value then
        begin
          SQL := StringReplace(SQL, 'TSERVICO ', 'TSERVICO_NOVO ', [rfReplaceAll, rfIgnoreCase]);
          SQL := StringReplace(SQL, 'TSERVICO'#13, 'TSERVICO_NOVO'#13, [rfReplaceAll, rfIgnoreCase]);
          SQL := StringReplace(SQL, 'TSERVICO_EVENTO ', 'TSERVICO_EVENTO_NOVO ', [rfReplaceAll, rfIgnoreCase]);
          SQL := StringReplace(SQL, 'TSERVICO_EVENTO'#13, 'TSERVICO_EVENTO_NOVO'#13, [rfReplaceAll, rfIgnoreCase]);
        end
        else
        begin
          SQL := StringReplace(SQL, 'TSERVICO_NOVO ', 'TSERVICO ', [rfReplaceAll, rfIgnoreCase]);
          SQL := StringReplace(SQL, 'TSERVICO_NOVO'#13, 'TSERVICO'#13, [rfReplaceAll, rfIgnoreCase]);
          SQL := StringReplace(SQL, 'TSERVICO_EVENTO_NOVO ', 'TSERVICO_EVENTO ', [rfReplaceAll, rfIgnoreCase]);
          SQL := StringReplace(SQL, 'TSERVICO_EVENTO_NOVO'#13, 'TSERVICO_EVENTO'#13, [rfReplaceAll, rfIgnoreCase]);
        end;

        TQuery(Components[I]).SQL.Text := SQL;

        if TQuery(Components[I]).FieldList.IndexOf('CD_SERVICO') >= 0 then
          TQuery(Components[I]).FieldByName('CD_SERVICO').Free;
        TQuery(Components[I]).FieldDefs.Update;
        if TQuery(Components[I]).FieldDefs.IndexOf('CD_SERVICO') >= 0 then
        begin
          if Components[I] = qry_servico_ then
            qry_servico_CD_SERVICO := TStringField(TQuery(Components[I]).FieldDefs.Find('CD_SERVICO').CreateField(TQuery(Components[I])))
          else if Components[I] = qry_servico_evento_ then
            qry_servico_evento_CD_SERVICO := TStringField(TQuery(Components[I]).FieldDefs.Find('CD_SERVICO').CreateField(TQuery(Components[I])))
          else
            TQuery(Components[I]).FieldDefs.Find('CD_SERVICO').CreateField(TQuery(Components[I]));
          TQuery(Components[I]).FieldByName('CD_SERVICO').DisplayLabel := 'Código';
        end;

        TQuery(Components[I]).Active := Ativo;
      end
      else if (Components[I] is TUpdateSQL) then
      begin
        DSQL := TUpdateSQL(Components[I]).DeleteSQL.Text;
        ISQL := TUpdateSQL(Components[I]).InsertSQL.Text;
        MSQL := TUpdateSQL(Components[I]).ModifySQL.Text;

        if Value then
        begin
          DSQL := StringReplace(DSQL, 'TSERVICO ', 'TSERVICO_NOVO ', [rfReplaceAll, rfIgnoreCase]);
          DSQL := StringReplace(DSQL, 'TSERVICO'#13, 'TSERVICO_NOVO'#13, [rfReplaceAll, rfIgnoreCase]);
          DSQL := StringReplace(DSQL, 'TSERVICO_EVENTO ', 'TSERVICO_EVENTO_NOVO ', [rfReplaceAll, rfIgnoreCase]);
          DSQL := StringReplace(DSQL, 'TSERVICO_EVENTO'#13, 'TSERVICO_EVENTO_NOVO'#13, [rfReplaceAll, rfIgnoreCase]);

          ISQL := StringReplace(ISQL, 'TSERVICO ', 'TSERVICO_NOVO ', [rfReplaceAll, rfIgnoreCase]);
          ISQL := StringReplace(ISQL, 'TSERVICO'#13, 'TSERVICO_NOVO'#13, [rfReplaceAll, rfIgnoreCase]);
          ISQL := StringReplace(ISQL, 'TSERVICO_EVENTO ', 'TSERVICO_EVENTO_NOVO ', [rfReplaceAll, rfIgnoreCase]);
          ISQL := StringReplace(ISQL, 'TSERVICO_EVENTO'#13, 'TSERVICO_EVENTO_NOVO'#13, [rfReplaceAll, rfIgnoreCase]);

          MSQL := StringReplace(MSQL, 'TSERVICO ', 'TSERVICO_NOVO ', [rfReplaceAll, rfIgnoreCase]);
          MSQL := StringReplace(MSQL, 'TSERVICO'#13, 'TSERVICO_NOVO'#13, [rfReplaceAll, rfIgnoreCase]);
          MSQL := StringReplace(MSQL, 'TSERVICO_EVENTO ', 'TSERVICO_EVENTO_NOVO ', [rfReplaceAll, rfIgnoreCase]);
          MSQL := StringReplace(MSQL, 'TSERVICO_EVENTO'#13, 'TSERVICO_EVENTO_NOVO'#13, [rfReplaceAll, rfIgnoreCase]);
        end
        else
        begin
          DSQL := StringReplace(DSQL, 'TSERVICO_NOVO ', 'TSERVICO ', [rfReplaceAll, rfIgnoreCase]);
          DSQL := StringReplace(DSQL, 'TSERVICO_NOVO'#13, 'TSERVICO'#13, [rfReplaceAll, rfIgnoreCase]);
          DSQL := StringReplace(DSQL, 'TSERVICO_EVENTO_NOVO ', 'TSERVICO_EVENTO ', [rfReplaceAll, rfIgnoreCase]);
          DSQL := StringReplace(DSQL, 'TSERVICO_EVENTO_NOVO'#13, 'TSERVICO_EVENTO'#13, [rfReplaceAll, rfIgnoreCase]);

          ISQL := StringReplace(ISQL, 'TSERVICO_NOVO ', 'TSERVICO ', [rfReplaceAll, rfIgnoreCase]);
          ISQL := StringReplace(ISQL, 'TSERVICO_NOVO'#13, 'TSERVICO'#13, [rfReplaceAll, rfIgnoreCase]);
          ISQL := StringReplace(ISQL, 'TSERVICO_EVENTO_NOVO ', 'TSERVICO_EVENTO ', [rfReplaceAll, rfIgnoreCase]);
          ISQL := StringReplace(ISQL, 'TSERVICO_EVENTO_NOVO'#13, 'TSERVICO_EVENTO'#13, [rfReplaceAll, rfIgnoreCase]);

          MSQL := StringReplace(MSQL, 'TSERVICO_NOVO ', 'TSERVICO ', [rfReplaceAll, rfIgnoreCase]);
          MSQL := StringReplace(MSQL, 'TSERVICO_NOVO'#13, 'TSERVICO'#13, [rfReplaceAll, rfIgnoreCase]);
          MSQL := StringReplace(MSQL, 'TSERVICO_EVENTO_NOVO ', 'TSERVICO_EVENTO ', [rfReplaceAll, rfIgnoreCase]);
          MSQL := StringReplace(MSQL, 'TSERVICO_EVENTO_NOVO'#13, 'TSERVICO_EVENTO'#13, [rfReplaceAll, rfIgnoreCase]);
        end;

        TUpdateSQL(Components[I]).DeleteSQL.Text := DSQL;
        TUpdateSQL(Components[I]).InsertSQL.Text := ISQL;
        TUpdateSQL(Components[I]).ModifySQL.Text := MSQL;
      end;

      Inc(I);
    end;
  end;
end;

end.
