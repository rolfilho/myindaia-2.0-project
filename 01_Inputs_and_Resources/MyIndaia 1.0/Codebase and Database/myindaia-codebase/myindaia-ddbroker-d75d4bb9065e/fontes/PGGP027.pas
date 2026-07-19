unit PGGP027;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Db, StdCtrls, Mask, ExtCtrls, UCRPE32, ComCtrls, ShellApi,
  DBCtrls, DBTables, DBGrids, RXLookup, RxDBComb, Funcoes;

type
  Tfrm_sel_unid_prod_emb = class(TForm)
    Panel1: TPanel;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    btn_imprimir: TButton;
    btn_sair: TButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    crp_unid_prod: TCrpe;
    lbl_periodo: TLabel;
    lbl_a: TLabel;
    lbl_cliente: TLabel;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    btn_co_cliente: TSpeedButton;
    lbl_grupo: TLabel;
    btn_co_grupo: TSpeedButton;
    edt_nm_grupo: TEdit;
    msk_cd_grupo: TMaskEdit;
    lbl_emb: TLabel;
    btn_co_embarcacao: TSpeedButton;
    msk_cd_embarcacao: TMaskEdit;
    edt_nm_embarcacao: TEdit;
    lbl_area: TLabel;
    btn_co_area: TSpeedButton;
    msk_cd_area: TMaskEdit;
    edt_nm_area: TEdit;
    lbl_analista_comissaria: TLabel;
    btn_co_analista_comissaria: TSpeedButton;
    msk_cd_analista_comissaria: TMaskEdit;
    edt_nm_analista_comissaria: TEdit;
    chk_obs: TCheckBox;
    msk_dt_inicio: TDateTimePicker;
    msk_dt_fim: TDateTimePicker;
    chk_arquivo: TCheckBox;
    chk_excel: TCheckBox;
    edt_nm_celula: TEdit;
    btn_co_celula: TSpeedButton;
    lbl_celula: TLabel;
    msk_cd_celula: TMaskEdit;
    lbl_servico: TLabel;
    edt_nm_servico: TEdit;
    btn_co_servico: TSpeedButton;
    msk_cd_servico: TMaskEdit;
    chk_dias_uteis: TCheckBox;
    lbl_lead_time: TLabel;
    cbo_lead_time: TComboBox;
    chk_area: TCheckBox;
    lbl_canal: TLabel;
    cbo_tp_canal: TComboBox;
    msk_cd_agente: TMaskEdit;
    msk_cd_armazem: TMaskEdit;
    msk_cd_pais: TMaskEdit;
    msk_cd_transp: TMaskEdit;
    lbl_agente: TLabel;
    lbl_arm_desc: TLabel;
    lbl_pais: TLabel;
    lbl_transp: TLabel;
    btn_co_agente: TSpeedButton;
    btn_co_armazem: TSpeedButton;
    btn_co_pais: TSpeedButton;
    btn_co_transp: TSpeedButton;
    edt_nm_agente: TEdit;
    edt_nm_armazem: TEdit;
    edt_nm_pais: TEdit;
    edt_nm_transp: TEdit;
    lbl_demurrage: TLabel;
    cbo_demurrage: TComboBox;
    Shape1: TShape;
    procedure RelLeadTimeExcel;
    procedure RelLeadTimeAreaExcel;
    procedure btn_sairClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure btn_co_embarcacaoClick(Sender: TObject);
    procedure msk_cd_embarcacaoExit(Sender: TObject);
    procedure btn_co_areaClick(Sender: TObject);
    procedure msk_cd_areaExit(Sender: TObject);
    procedure msk_cd_analista_comissariaExit(Sender: TObject);
    procedure btn_co_analista_comissariaClick(Sender: TObject);
    procedure msk_dt_fimExit(Sender: TObject);
    procedure msk_dt_inicioExit(Sender: TObject);
    procedure btn_co_celulaClick(Sender: TObject);
    procedure msk_cd_celulaExit(Sender: TObject);
    procedure btn_co_servicoClick(Sender: TObject);
    procedure msk_cd_servicoExit(Sender: TObject);
    procedure RelDesviosExcel;
    procedure btn_co_agenteClick(Sender: TObject);
    procedure btn_co_armazemClick(Sender: TObject);
    procedure btn_co_paisClick(Sender: TObject);
    procedure btn_co_transpClick(Sender: TObject);
    procedure msk_cd_agenteExit(Sender: TObject);
    procedure msk_cd_paisExit(Sender: TObject);
    procedure msk_cd_transpExit(Sender: TObject);
    procedure msk_cd_armazemExit(Sender: TObject);
  private
  public
    tp_rel : Byte;
    ComPeriodo : Boolean;
   (* 1 - FollowUp de Navios
      2 - Despachos para Pagamento
      3 - Demurrage - Gerencial
      4 - Lead Time
      5 - Despachos Não Desembaraçados DI
      6 - Desvios
      7 - Gerencial Mod2
      8 - Controle de Requerimento
      *)
  end;

var
  Saida    : String;
  Txt      : TextFile;
  cNomeTxt : String;
  NomeTxt, NomeXls, str_cr: String;
  ArquivoTXT: TextFile;
  frm_sel_unid_prod_emb: Tfrm_sel_unid_prod_emb;

implementation

{$R *.DFM}

uses GSMLIB,  PGGP001, PGGP017, PGGP028, PGSM010, PGSM016, PGSM018, PGSM022, PGSM024,
     PGSM044, PGSM088, PGSM119, PGSM212, PGSM064, PGSM210, PGSM051, uAg;

procedure Tfrm_sel_unid_prod_emb.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sel_unid_prod_emb.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = '' then
  begin
    if tp_rel in [1, 2, 3, 4, 5, 6, 7, 8] then edt_nm_unid_neg.Text := 'Todas'
    else edt_nm_unid_neg.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_unid_neg );
  if msk_cd_unid_neg.Text <> '' then
  begin
    with datm_sel_unid_prod_emb do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.RecordCount > 0 then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_.FieldByName('NM_UNID_NEG').AsString;
      end
      else
      begin
        BoxMensagem( 'Unidade de Negócio não cadastrada!', 2 );
        msk_cd_unid_neg.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_unid_neg.Text := '';
  end;
end;

procedure Tfrm_sel_unid_prod_emb.msk_cd_produtoExit(Sender: TObject);
begin
  if msk_cd_produto.Text = '' then
  begin
    if tp_rel in [1, 2, 3, 4, 5, 6, 7, 8] then edt_nm_produto.Text := 'Todos'
    else edt_nm_produto.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_produto );
  if msk_cd_produto.Text <> '' then
  begin
    with datm_sel_unid_prod_emb do
    begin
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
      qry_produto_.Prepare;
      qry_produto_.Open;
      if qry_produto_.RecordCount > 0 then
      begin
        edt_nm_produto.Text := qry_produto_.FieldByName('NM_PRODUTO').AsString;
      end
      else
      begin
        BoxMensagem( 'Produto não cadastrado!', 2 );
        msk_cd_produto.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_produto.Text := '';
  end;
end;

procedure Tfrm_sel_unid_prod_emb.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_sel_unid_prod_emb do
  begin
    Application.CreateForm( Tfrm_unidade, frm_unidade );
    with frm_unidade do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
      msk_cd_unid_negExit(nil);
    end;
  end;
end;

procedure Tfrm_sel_unid_prod_emb.btn_co_produtoClick(Sender: TObject);
begin
  with datm_sel_unid_prod_emb do
  begin
    Application.CreateForm( Tfrm_produto, frm_produto );
    with frm_produto do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_produto.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
      msk_cd_produtoExit(nil);
    end;
  end;
end;

procedure Tfrm_sel_unid_prod_emb.btn_imprimirClick(Sender: TObject);
var
  nr_identificador: integer;
begin
  nr_identificador := 0;

  if ( Trim( msk_cd_unid_neg.Text ) = '' ) and Not ( tp_rel in [1, 2, 3, 7, 8] ) then
  begin
    BoxMensagem( 'Informe uma Unidade de Negócio!', 2 );
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;

  if ( Trim( msk_cd_produto.Text ) = '' ) and Not ( tp_rel in [1, 2, 3, 7, 8] )  then
  begin
    BoxMensagem( 'Informe um Produto!', 2 );
    msk_cd_produto.SetFocus;
    Exit;
  end;

  if ( ( Trim( msk_cd_cliente.Text ) = '' ) and ( Trim( msk_cd_grupo.Text ) = '' ) ) and ( Not ( tp_rel in [1, 2, 3, 5, 7] ) ) then
  begin
    BoxMensagem( 'Informe um Cliente ou Grupo!', 2 );
    msk_cd_cliente.SetFocus;
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  with crp_unid_prod do
  begin
    if tp_rel in [2, 5, 6] then
       Connect := 'DSN=BROKER; UID=sa; PWD=123; DSQ=BROKER';

    case tp_rel of
      // FollowUp de Navios
      1: begin
           with datm_sel_unid_prod_emb do
           begin
             try
               datm_main.db_broker.StartTransaction;
               CloseStoredProc( sp_rel_followup_navio );
               if Trim( msk_cd_unid_neg.Text ) = '' then
                 sp_rel_followup_navio.ParamByName('@cd_unid_neg').AsString   := 'X'
               else
                 sp_rel_followup_navio.ParamByName('@cd_unid_neg').AsString   := msk_cd_unid_neg.Text;

               if Trim( msk_cd_produto.Text ) = '' then
                 sp_rel_followup_navio.ParamByName('@cd_produto').AsString    := 'X'
               else
                 sp_rel_followup_navio.ParamByName('@cd_produto').AsString    := msk_cd_produto.Text;

               if Trim( msk_cd_grupo.Text ) = '' then
                 sp_rel_followup_navio.ParamByName('@cd_grupo').AsString      := 'X'
               else
                 sp_rel_followup_navio.ParamByName('@cd_grupo').AsString      := msk_cd_grupo.Text;

               if Trim( msk_cd_cliente.Text ) = '' then
                 sp_rel_followup_navio.ParamByName('@cd_cliente').AsString    := 'X'
               else
                 sp_rel_followup_navio.ParamByName('@cd_cliente').AsString    := msk_cd_cliente.Text;

               if msk_dt_inicio.Date = 0 then
                 sp_rel_followup_navio.ParamByName('@dt_inicio').AsString     := 'X'
               else
                 sp_rel_followup_navio.ParamByName('@dt_inicio').AsString     := FormatDateTime( FData, msk_dt_inicio.Date );

               if msk_dt_fim.Date = 0 then
                 sp_rel_followup_navio.ParamByName('@dt_fim').AsString        := 'X'
               else
                 sp_rel_followup_navio.ParamByName('@dt_fim').AsString        := FormatDateTime( FData, msk_dt_fim.Date );

               if Trim( msk_cd_embarcacao.Text ) = '' then
                 sp_rel_followup_navio.ParamByName('@cd_embarcacao').AsString := 'X'
               else
                 sp_rel_followup_navio.ParamByName('@cd_embarcacao').AsString := msk_cd_embarcacao.Text;

               if Trim( msk_cd_area.Text ) = '' then
                 sp_rel_followup_navio.ParamByName('@cd_area').AsString := 'X'
               else
                 sp_rel_followup_navio.ParamByName('@cd_area').AsString := msk_cd_area.Text;

               if Trim( msk_cd_analista_comissaria.Text ) = '' then
                 sp_rel_followup_navio.ParamByName('@cd_analista_comissaria').AsString := 'X'
               else
                 sp_rel_followup_navio.ParamByName('@cd_analista_comissaria').AsString := msk_cd_analista_comissaria.Text;

               if chk_obs.Checked then
                 sp_rel_followup_navio.ParamByName('@in_obs').AsString := '1'
               else
                 sp_rel_followup_navio.ParamByName('@in_obs').AsString := '0';

               if Trim( msk_cd_servico.Text ) = '' then
                 sp_rel_followup_navio.ParamByName('@cd_servico').AsString := 'X'
               else
                 sp_rel_followup_navio.ParamByName('@cd_servico').AsString := msk_cd_servico.Text;

               ExecStoredProc( sp_rel_followup_navio );
               nr_identificador := sp_rel_followup_navio.ParamByName('@nr_identificador').AsInteger;
               CloseStoredProc( sp_rel_followup_navio );
               datm_main.db_broker.Commit;
             except
               on E: Exception do
               begin
                 if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                 TrataErro(E);
               end;
             end;
           end;
         end;

      // Despachos para Pagamento
      2: begin
           with datm_sel_unid_prod_emb do
           begin
             ReportName  := cDir_Rpt + '\CRGI017.RPT';
             try
               datm_main.db_broker.StartTransaction;
               CloseStoredProc( sp_rel_desp_pagto );
               if Trim( msk_cd_unid_neg.Text ) = '' then
                 sp_rel_desp_pagto.ParamByName('@cd_unid_neg').AsString   := 'X'
               else
                 sp_rel_desp_pagto.ParamByName('@cd_unid_neg').AsString   := msk_cd_unid_neg.Text;
               if Trim( msk_cd_produto.Text ) = '' then
                 sp_rel_desp_pagto.ParamByName('@cd_produto').AsString    := 'X'
               else
                 sp_rel_desp_pagto.ParamByName('@cd_produto').AsString    := msk_cd_produto.Text;
               if Trim( msk_cd_analista_comissaria.Text ) = '' then
                 sp_rel_desp_pagto.ParamByName('@cd_analista_comissaria').AsString := 'X'
               else
                 sp_rel_desp_pagto.ParamByName('@cd_analista_comissaria').AsString := msk_cd_analista_comissaria.Text;
               if Trim( msk_cd_area.Text ) = '' then
                 sp_rel_desp_pagto.ParamByName('@cd_area').AsString := 'X'
               else
                 sp_rel_desp_pagto.ParamByName('@cd_area').AsString := msk_cd_area.Text;
               ExecStoredProc( sp_rel_desp_pagto );
               nr_identificador := sp_rel_desp_pagto.ParamByName('@nr_identificador').AsInteger;
               CloseStoredProc( sp_rel_desp_pagto );
               datm_main.db_broker.Commit;
             except
               on E: Exception do
               begin
                 if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                 TrataErro(E);
               end;
             end;
           end;
         end;

      // Demurrage - Gerencial
      3: begin
           with datm_sel_unid_prod_emb do
           begin
             try
               datm_main.db_broker.StartTransaction;
               CloseStoredProc( sp_rel_dem_gerencial );
               if Trim( msk_cd_unid_neg.Text ) = '' then
                 sp_rel_dem_gerencial.ParamByName('@cd_unid_neg').AsString   := 'X'
               else
                 sp_rel_dem_gerencial.ParamByName('@cd_unid_neg').AsString   := msk_cd_unid_neg.Text;
               if Trim( msk_cd_produto.Text ) = '' then
                 sp_rel_dem_gerencial.ParamByName('@cd_produto').AsString    := 'X'
               else
                 sp_rel_dem_gerencial.ParamByName('@cd_produto').AsString    := msk_cd_produto.Text;
               if Trim( msk_cd_grupo.Text ) = '' then
                 sp_rel_dem_gerencial.ParamByName('@cd_grupo').AsString := 'X'
               else
                 sp_rel_dem_gerencial.ParamByName('@cd_grupo').AsString := msk_cd_grupo.Text;
               if Trim( msk_cd_cliente.Text ) = '' then
                 sp_rel_dem_gerencial.ParamByName('@cd_cliente').AsString := 'X'
               else
                 sp_rel_dem_gerencial.ParamByName('@cd_cliente').AsString := msk_cd_cliente.Text;
               if Trim( msk_cd_embarcacao.Text ) = '' then
                 sp_rel_dem_gerencial.ParamByName('@cd_embarcacao').AsString := 'X'
               else
                 sp_rel_dem_gerencial.ParamByName('@cd_embarcacao').AsString := msk_cd_embarcacao.Text;
               if Trim( msk_cd_area.Text ) = '' then
                 sp_rel_dem_gerencial.ParamByName('@cd_area').AsString := 'X'
               else
                 sp_rel_dem_gerencial.ParamByName('@cd_area').AsString := msk_cd_area.Text;
               if msk_dt_inicio.Date = 0 then
                 sp_rel_dem_gerencial.ParamByName('@dt_inicio').AsString := 'X'
               else
                 sp_rel_dem_gerencial.ParamByName('@dt_inicio').AsString := FormatDateTime( FData, msk_dt_inicio.Date );
               if msk_dt_fim.Date = 0 then
                 sp_rel_dem_gerencial.ParamByName('@dt_fim').AsString := 'X'
               else
                 sp_rel_dem_gerencial.ParamByName('@dt_fim').AsString := FormatDateTime( FData, msk_dt_fim.Date );
               ExecStoredProc( sp_rel_dem_gerencial );
               nr_identificador := sp_rel_dem_gerencial.ParamByName('@nr_identificador').AsInteger;
               CloseStoredProc( sp_rel_dem_gerencial );
               datm_main.db_broker.Commit;
             except
               on E: Exception do
               begin
                 if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                 TrataErro(E);
               end;
             end;
           end;
         end;

      // Lead Time
      4: begin
           with datm_sel_unid_prod_emb do
           begin
             try
               Screen.Cursor := crHourGlass;
               datm_main.db_broker.StartTransaction;
               CloseStoredProc( sp_rel_lead_time );
               if Trim( msk_cd_unid_neg.Text ) = '' then
                 sp_rel_lead_time.ParamByName('@cd_unid_neg').AsString   := 'X'
               else
                 sp_rel_lead_time.ParamByName('@cd_unid_neg').AsString   := Trim( msk_cd_unid_neg.Text );
               if Trim( msk_cd_produto.Text ) = '' then
                 sp_rel_lead_time.ParamByName('@cd_produto').AsString    := 'X'
               else
                 sp_rel_lead_time.ParamByName('@cd_produto').AsString    := Trim( msk_cd_produto.Text );
               if Trim( msk_cd_grupo.Text ) = '' then
                 sp_rel_lead_time.ParamByName('@cd_grupo').AsString := 'X'
               else
                 sp_rel_lead_time.ParamByName('@cd_grupo').AsString := Trim( msk_cd_grupo.Text );
               if Trim( msk_cd_cliente.Text ) = '' then
                 sp_rel_lead_time.ParamByName('@cd_cliente').AsString := 'X'
               else
                 sp_rel_lead_time.ParamByName('@cd_cliente').AsString := Trim( msk_cd_cliente.Text );
               if Trim( msk_cd_area.Text ) = '' then
                 sp_rel_lead_time.ParamByName('@cd_area').AsString := 'X'
               else
                 sp_rel_lead_time.ParamByName('@cd_area').AsString := Trim( msk_cd_area.Text );
               if msk_dt_inicio.Date = 0 then
                 sp_rel_lead_time.ParamByName('@dt_inicio').AsString := 'X'
               else
                 sp_rel_lead_time.ParamByName('@dt_inicio').AsDate := msk_dt_inicio.Date ;
               if msk_dt_fim.Date = 0 then
                 sp_rel_lead_time.ParamByName('@dt_fim').AsString := 'X'
               else
                 sp_rel_lead_time.ParamByName('@dt_fim').AsDate   := msk_dt_fim.Date ;
               if chk_dias_uteis.Checked then
                 sp_rel_lead_time.ParamByName('@tp_dias').AsString := '1'
               else
                 sp_rel_lead_time.ParamByName('@tp_dias').AsString := '0';
               if cbo_lead_time.ItemIndex < 0 then
                 sp_rel_lead_time.ParamByName('@in_lead_time').AsString := '0'
               else
                 sp_rel_lead_time.ParamByName('@in_lead_time').AsString := IntToStr( cbo_lead_time.ItemIndex );
               if Trim (cbo_tp_canal.Text) = 'TODOS' then
                 sp_rel_lead_time.ParamByName('@cd_canal').AsString := 'X'
               else
                 sp_rel_lead_time.ParamByName('@cd_canal').AsString := IntToStr( cbo_tp_canal.ItemIndex );
               ExecStoredProc( sp_rel_lead_time );
               nr_identificador := sp_rel_lead_time.ParamByName('@nr_identificador').AsInteger;
               CloseStoredProc( sp_rel_lead_time );
               datm_main.db_broker.Commit;
               Screen.Cursor := crDefault;
             except
               on E: Exception do
               begin
                 if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                 TrataErro(E);
               end;
             end;
           end;
         end;

      5: begin
           with datm_sel_unid_prod_emb do
           begin
             ReportName  := cDir_Rpt + '\CRGI014.RPT';

             CloseStoredProc( sp_rel_nao_desemb_di );
             if Trim( msk_cd_unid_neg.Text ) = '' then
               sp_rel_nao_desemb_di.ParamByName('@cd_unid_neg').AsString            := 'X'
             else
               sp_rel_nao_desemb_di.ParamByName('@cd_unid_neg').AsString            := msk_cd_unid_neg.Text;
             if Trim( msk_cd_produto.Text ) = '' then
               sp_rel_nao_desemb_di.ParamByName('@cd_produto').AsString             := 'X'
             else
               sp_rel_nao_desemb_di.ParamByName('@cd_produto').AsString             := msk_cd_produto.Text;
             if Trim( msk_cd_grupo.Text ) = '' then
               sp_rel_nao_desemb_di.ParamByName('@cd_grupo').AsString               := 'X'
             else
               sp_rel_nao_desemb_di.ParamByName('@cd_grupo').AsString               := msk_cd_grupo.Text;
             if Trim( msk_cd_cliente.Text ) = '' then
               sp_rel_nao_desemb_di.ParamByName('@cd_cliente').AsString             := 'X'
             else
               sp_rel_nao_desemb_di.ParamByName('@cd_cliente').AsString             := msk_cd_cliente.Text;
             if Trim( msk_cd_analista_comissaria.Text ) = '' then
               sp_rel_nao_desemb_di.ParamByName('@cd_analista_comissaria').AsString := 'X'
             else
               sp_rel_nao_desemb_di.ParamByName('@cd_analista_comissaria').AsString := msk_cd_analista_comissaria.Text;
             if Trim( msk_cd_celula.Text ) = '' then
               sp_rel_nao_desemb_di.ParamByName('@cd_celula').AsString              := 'X'
             else
               sp_rel_nao_desemb_di.ParamByName('@cd_celula').AsString              := msk_cd_celula.Text;
             if chk_obs.Checked then
               sp_rel_nao_desemb_di.ParamByName('@in_obs').AsString := '1'
             else
               sp_rel_nao_desemb_di.ParamByName('@in_obs').AsString := '0';
             ExecStoredProc( sp_rel_nao_desemb_di );
             nr_identificador := sp_rel_nao_desemb_di.ParamByName('@nr_identificador').AsInteger;
             CloseStoredProc( sp_rel_nao_desemb_di );
           end;
         end;

      6: begin //Desvios
           with datm_sel_unid_prod_emb do
           begin
             try
               Screen.Cursor := crHourGlass;
               datm_main.db_broker.StartTransaction;
               CloseStoredProc( sp_rel_desvios );
               if Trim( msk_cd_unid_neg.Text ) = '' then
                 sp_rel_desvios.ParamByName('@cd_unid_neg').AsString   := 'X'
               else
                 sp_rel_desvios.ParamByName('@cd_unid_neg').AsString   := Trim( msk_cd_unid_neg.Text );
               if Trim( msk_cd_produto.Text ) = '' then
                 sp_rel_desvios.ParamByName('@cd_produto').AsString    := 'X'
               else
                 sp_rel_desvios.ParamByName('@cd_produto').AsString    := Trim( msk_cd_produto.Text );
               if Trim( msk_cd_grupo.Text ) = '' then
                 sp_rel_desvios.ParamByName('@cd_grupo').AsString := 'X'
               else
                 sp_rel_desvios.ParamByName('@cd_grupo').AsString := Trim( msk_cd_grupo.Text );
               if Trim( msk_cd_cliente.Text ) = '' then
                 sp_rel_desvios.ParamByName('@cd_cliente').AsString := 'X'
               else
                 sp_rel_desvios.ParamByName('@cd_cliente').AsString := Trim( msk_cd_cliente.Text );
               if Trim( msk_cd_area.Text ) = '' then
                 sp_rel_desvios.ParamByName('@cd_area').AsString := 'X'
               else
                 sp_rel_desvios.ParamByName('@cd_area').AsString := Trim( msk_cd_area.Text );
               if msk_dt_inicio.Date = 0 then
                 sp_rel_desvios.ParamByName('@dt_inicio').AsString := 'X'
               else
                 sp_rel_desvios.ParamByName('@dt_inicio').AsDate := msk_dt_inicio.Date ;
               if msk_dt_fim.Date = 0 then
                 sp_rel_desvios.ParamByName('@dt_fim').AsString := 'X'
               else
                 sp_rel_desvios.ParamByName('@dt_fim').AsDate   := msk_dt_fim.Date ;
               if chk_dias_uteis.Checked then
                 sp_rel_desvios.ParamByName('@tp_dias').AsString := '1'
               else
                 sp_rel_desvios.ParamByName('@tp_dias').AsString := '0';
               if cbo_lead_time.ItemIndex < 0 then
                 sp_rel_desvios.ParamByName('@in_lead_time').AsString := '0'
               else
                 sp_rel_desvios.ParamByName('@in_lead_time').AsString := IntToStr( cbo_lead_time.ItemIndex );
               if chk_dias_uteis.Checked then
                 sp_rel_desvios.ParamByName('@tp_dias').AsString := '1'
               else
                 sp_rel_desvios.ParamByName('@tp_dias').AsString := '0';
               ExecStoredProc( sp_rel_desvios );
               nr_identificador := sp_rel_desvios.ParamByName('@nr_identificador').AsInteger;
               CloseStoredProc( sp_rel_desvios );
               datm_main.db_broker.Commit;
               Screen.Cursor := crDefault;
             except
               on E: Exception do
               begin
                 if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                 TrataErro(E);
               end;
             end;
           end;
         end;

      // Demurrage - Gerencial Mof2   
      7: begin
           with datm_sel_unid_prod_emb do
           begin
             try
               datm_main.db_broker.StartTransaction;
               CloseStoredProc( sp_rel_dem_gerencial2 );
               if Trim( msk_cd_unid_neg.Text ) = '' then
                 sp_rel_dem_gerencial2.ParamByName('@cd_unid_neg').AsString   := 'X'
               else
                 sp_rel_dem_gerencial2.ParamByName('@cd_unid_neg').AsString   := msk_cd_unid_neg.Text;
               if Trim( msk_cd_produto.Text ) = '' then
                 sp_rel_dem_gerencial2.ParamByName('@cd_produto').AsString    := 'X'
               else
                 sp_rel_dem_gerencial2.ParamByName('@cd_produto').AsString    := msk_cd_produto.Text;
               if Trim( msk_cd_grupo.Text ) = '' then
                 sp_rel_dem_gerencial2.ParamByName('@cd_grupo').AsString := 'X'
               else
                 sp_rel_dem_gerencial2.ParamByName('@cd_grupo').AsString := msk_cd_grupo.Text;
               if Trim( msk_cd_cliente.Text ) = '' then
                 sp_rel_dem_gerencial2.ParamByName('@cd_cliente').AsString := 'X'
               else
                 sp_rel_dem_gerencial2.ParamByName('@cd_cliente').AsString := msk_cd_cliente.Text;
               if Trim( msk_cd_embarcacao.Text ) = '' then
                 sp_rel_dem_gerencial2.ParamByName('@cd_embarcacao').AsString := 'X'
               else
                 sp_rel_dem_gerencial2.ParamByName('@cd_embarcacao').AsString := msk_cd_embarcacao.Text;
               if Trim( msk_cd_area.Text ) = '' then
                 sp_rel_dem_gerencial2.ParamByName('@cd_area').AsString := 'X'
               else
                 sp_rel_dem_gerencial2.ParamByName('@cd_area').AsString := msk_cd_area.Text;
               if Trim( msk_cd_armazem.Text ) = '' then
                 sp_rel_dem_gerencial2.ParamByName('@cd_armazem_descarga').AsString := 'X'
               else
                 sp_rel_dem_gerencial2.ParamByName('@cd_armazem_descarga').AsString := msk_cd_armazem.Text;
               if Trim( msk_cd_pais.Text ) = '' then
                 sp_rel_dem_gerencial2.ParamByName('@cd_pais_origem').AsString := 'X'
               else
                 sp_rel_dem_gerencial2.ParamByName('@cd_pais_origem').AsString := msk_cd_pais.Text;
               if Trim( msk_cd_agente.Text ) = '' then
                 sp_rel_dem_gerencial2.ParamByName('@cd_agente').AsString := 'X'
               else
                 sp_rel_dem_gerencial2.ParamByName('@cd_agente').AsString := msk_cd_agente.Text;
               if Trim( msk_cd_transp.Text ) = '' then
                 sp_rel_dem_gerencial2.ParamByName('@cd_transportador').AsString := 'X'
               else
                 sp_rel_dem_gerencial2.ParamByName('@cd_transportador').AsString := msk_cd_transp.Text;
               if Trim( cbo_demurrage.Text ) = 'Não' then
                 sp_rel_dem_gerencial2.ParamByName('@demurrage').AsString := 'N'
               else if Trim( cbo_demurrage.Text ) = 'Sim' then
                 sp_rel_dem_gerencial2.ParamByName('@demurrage').AsString := 'S'
               else
                  sp_rel_dem_gerencial2.ParamByName('@demurrage').AsString := 'X';
               if msk_dt_inicio.Date = 0 then
                 sp_rel_dem_gerencial2.ParamByName('@dt_inicio').AsString := 'X'
               else
                 sp_rel_dem_gerencial2.ParamByName('@dt_inicio').AsDatetime := StrToDate( FormatDateTime( FData, msk_dt_inicio.Date ));
               if msk_dt_fim.Date = 0 then
                 sp_rel_dem_gerencial2.ParamByName('@dt_fim').AsString := 'X'
               else
                 sp_rel_dem_gerencial2.ParamByName('@dt_fim').AsDatetime := StrToDate(FormatDateTime( FData, msk_dt_fim.Date ));
               ExecStoredProc( sp_rel_dem_gerencial2 );
               nr_identificador := sp_rel_dem_gerencial2.ParamByName('@nr_identificador').AsInteger;
               CloseStoredProc( sp_rel_dem_gerencial2 );
               datm_main.db_broker.Commit;
             except
               on E: Exception do
               begin
                 if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                 TrataErro(E);
               end;
             end;
           end;
         end;

      // Controle de Requerimento
      8: begin
           with datm_sel_unid_prod_emb do
           begin
             try
               datm_main.db_broker.StartTransaction;
               CloseStoredProc( sp_rel_requerimento );
               if Trim( msk_cd_unid_neg.Text ) = '' then
                 sp_rel_requerimento.ParamByName('@cd_unid_neg').AsString   := 'X'
               else
                 sp_rel_requerimento.ParamByName('@cd_unid_neg').AsString   := msk_cd_unid_neg.Text;
               if Trim( msk_cd_produto.Text ) = '' then
                 sp_rel_requerimento.ParamByName('@cd_produto').AsString    := 'X'
               else
                 sp_rel_requerimento.ParamByName('@cd_produto').AsString    := msk_cd_produto.Text;
               if Trim( msk_cd_grupo.Text ) = '' then
                 sp_rel_requerimento.ParamByName('@cd_grupo').AsString := 'X'
               else
                 sp_rel_requerimento.ParamByName('@cd_grupo').AsString := msk_cd_grupo.Text;
               if Trim( msk_cd_cliente.Text ) = '' then
                 sp_rel_requerimento.ParamByName('@cd_cliente').AsString := 'X'
               else
                 sp_rel_requerimento.ParamByName('@cd_cliente').AsString := msk_cd_cliente.Text;
               if Trim( msk_cd_area.Text ) = '' then
                 sp_rel_requerimento.ParamByName('@cd_area').AsString := 'X'
               else
                 sp_rel_requerimento.ParamByName('@cd_area').AsString := msk_cd_area.Text;
                 if msk_dt_inicio.Date = 0 then
                   sp_rel_requerimento.ParamByName('@dt_inicio').AsString     := 'X'
                 else
                   sp_rel_requerimento.ParamByName('@dt_inicio').AsString     := FormatDateTime( FData, msk_dt_inicio.Date );

                 if msk_dt_fim.Date = 0 then
                   sp_rel_requerimento.ParamByName('@dt_fim').AsString        := 'X'
                 else
                   sp_rel_requerimento.ParamByName('@dt_fim').AsString        := FormatDateTime( FData, msk_dt_fim.Date );
                 ExecStoredProc( sp_rel_requerimento );
                 nr_identificador := sp_rel_requerimento.ParamByName('@nr_identificador').AsInteger;
                 CloseStoredProc( sp_rel_requerimento );
                 datm_main.db_broker.Commit;
             except
               on E: Exception do
               begin
                 if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                 TrataErro(E);
               end;
             end;
           end;
         end;

  end; // end case

    if tp_rel in [2, 5] then Formulas[0] := 'NrIdentificador = ' + Trim( IntToStr( nr_identificador ) );

    if tp_rel = 1 then
    begin
      with datm_sel_unid_prod_emb do
      begin
        qry_trel_followup_navio_.Close;
        qry_trel_followup_navio_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_trel_followup_navio_.Prepare;
        qry_trel_followup_navio_.Open;

        ppSelUnidProdEmb.Template.FileName         := cDir_RPT + '\RBPO006.rtm';
        ppSelUnidProdEmb.Template.LoadFromFile;
        ppSelUnidProdEmb.AllowPrintToFile          := True;
        ppSelUnidProdEmb.TextFileName              := cDir_RPT + '\Follow-Up Navio.PDF';
        ppSelUnidProdEmb.PrinterSetup.DocumentName := Caption;

        if chk_arquivo.Checked then
        begin
          ppSelUnidProdEmb.DeviceType        := 'PDFFile';
        end
        else
          ppSelUnidProdEmb.DeviceType := 'Screen';

        ppSelUnidProdEmb.Print;
      end;
    end;

    if tp_rel = 3 then
    begin
      with datm_sel_unid_prod_emb do
      begin
        qry_rel_dem_ger_.Close;
        qry_rel_dem_ger_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_rel_dem_ger_.Prepare;
        qry_rel_dem_ger_.Open;

        if chk_arquivo.Checked then
        begin
          ppSelUnidProdEmb.AllowPrintToFile  := True;
          ppSelUnidProdEmb.DeviceType        := 'PDFFile';
        end
        else
          ppSelUnidProdEmb.DeviceType := 'Screen';
        ppSelUnidProdEmb.TextFileName := cDir_RPT + '\Relatorio Gerencial de Demurrage.PDF';
        ppSelUnidProdEmb.Template.FileName := cDir_RPT + '\RBDEM001.RTM';
        ppSelUnidProdEmb.Template.LoadFromFile;
        ppSelUnidProdEmb.PrinterSetup.DocumentName := Caption;
        ppSelUnidProdEmb.Print;
      end;
    end;

    if tp_rel = 4 then
    begin
      with datm_sel_unid_prod_emb do
      begin
        if chk_area.Checked then
        begin
          qry_rel_lead_time_area_.Close;
          qry_rel_lead_time_area_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
          qry_rel_lead_time_area_.Prepare;
          qry_rel_lead_time_area_.Open;
          if qry_rel_lead_time_area_.EOF then
          begin
            BoxMensagem( 'Não existem dados a exibir!', 2 );
            qry_rel_lead_time_area_.Close;
            Exit;
          end;
        end
        else
        begin
          qry_rel_lead_time_.Close;
          qry_rel_lead_time_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
          qry_rel_lead_time_.Prepare;
          qry_rel_lead_time_.Open;
          if qry_rel_lead_time_.EOF then
          begin
            BoxMensagem( 'Não existem dados a exibir!', 2 );
            qry_rel_lead_time_.Close;
            Exit;
          end;
        end;

        if chk_excel.Checked then
        begin
          if chk_area.Checked then
            RelLeadTimeAreaExcel
          else
            RelLeadTimeExcel;
        end
        else
        begin
          if chk_area.Checked then
          begin
            ppSelUnidProdEmb.Template.FileName := cDir_RPT + '\RBIMP005.RTM';
          end
          else
          begin
            ppSelUnidProdEmb.Template.FileName := cDir_RPT + '\RBIMP003.RTM';
          end;
          ppSelUnidProdEmb.Template.LoadFromFile;
          if chk_arquivo.Checked then
          begin
            ppSelUnidProdEmb.AllowPrintToFile := True;
            ppSelUnidProdEmb.DeviceType       := 'PDFFile';
          end
          else
          ppSelUnidProdEmb.DeviceType := 'Screen';
          ppSelUnidProdEmb.TextFileName := cDir_RPT + '\Relatorio Lead Time.PDF';
          ppSelUnidProdEmb.PrinterSetup.DocumentName := Caption;
          ppSelUnidProdEmb.Print;
        end;
        qry_rel_lead_time_.Close;
        qry_rel_lead_time_area_.Close;
      end;
    end;

    if tp_rel = 6 then  // Desvios
    begin
      with datm_sel_unid_prod_emb do
      begin
        qry_desvios_.Close;
        qry_desvios_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_desvios_.Prepare;
        qry_desvios_.Open;

        qry_count_desvios_.Close;
        qry_count_desvios_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_count_desvios_.Prepare;
        qry_count_desvios_.Open;

        qry_trel_desvios_graf_.Close;
        qry_trel_desvios_graf_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_trel_desvios_graf_.Prepare;
        qry_trel_desvios_graf_.Open;

        qry_count_total_.Close;
        qry_count_total_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_count_total_.Prepare;
        qry_count_total_.Open;

        qry_trel_desv_media_dias_evento_.Close;
        qry_trel_desv_media_dias_evento_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_trel_desv_media_dias_evento_.Prepare;
        qry_trel_desv_media_dias_evento_.Open;

        qry_trel_desvios_ap_evento_.Close;
        qry_trel_desvios_ap_evento_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_trel_desvios_ap_evento_.Prepare;
        qry_trel_desvios_ap_evento_.Open;

        if qry_desvios_.EOF then
        begin
          BoxMensagem( 'Não existem dados a exibir!', 2 );
          qry_desvios_.Close;
          Exit;
        end;

        if chk_excel.Checked then
        begin
          RelDesviosExcel;
        end
        else
        begin
          ppSelUnidProdEmb.Template.FileName := cDir_RPT + '\RBEST004.RTM';
          ppSelUnidProdEmb.Template.LoadFromFile;
          if chk_arquivo.Checked then
          begin
            ppSelUnidProdEmb.AllowPrintToFile  := True;
            ppSelUnidProdEmb.DeviceType        := 'PDFFile';
          end
          else
            ppSelUnidProdEmb.DeviceType := 'Screen';

          ppSelUnidProdEmb.TextFileName := cDir_RPT + '\Relatorio Desvios.PDF';
          ppSelUnidProdEmb.PrinterSetup.DocumentName := Caption;
          ppSelUnidProdEmb.Print;
        end;
        qry_desvios_.Close;
      end;
    end;

    if tp_rel = 7 then
    begin
      with datm_sel_unid_prod_emb do
      begin
        qry_rel_dem_ger2_.Close;
        qry_rel_dem_ger2_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_rel_dem_ger2_.Prepare;
        qry_rel_dem_ger2_.Open;

        if qry_rel_dem_ger2_.EOF then
        begin
          BoxMensagem( 'Não existem dados a exibir!', 2 );
          qry_rel_dem_ger2_.Close;
          Exit;
        end;

        ppSelUnidProdEmb.Template.FileName         := cDir_RPT + '\RBDEM003.rtm';
        ppSelUnidProdEmb.Template.LoadFromFile;
        ppSelUnidProdEmb.PrinterSetup.DocumentName := Caption;
        ppSelUnidProdEmb.AllowPrintToFile  := True;

        if chk_arquivo.Checked then
        begin
          ppSelUnidProdEmb.DeviceType        := 'ExcelFile';
          ppSelUnidProdEmb.TextFileName := cDir_RPT + '\Relatorio Demurrage Gerencial Mod2.xls';
        end
        else
          ppSelUnidProdEmb.DeviceType := 'Screen';
          ppSelUnidProdEmb.Print;
      end;
    end;

    if tp_rel = 8 then
    begin
      with datm_sel_unid_prod_emb do
      begin
        qry_rel_requerimento_.Close;
        qry_rel_requerimento_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_rel_requerimento_.Prepare;
        qry_rel_requerimento_.Open;

        ppSelUnidProdEmb.DeviceType := 'Screen';
        ppSelUnidProdEmb.Template.FileName := cDir_RPT + '\RBPO009.RTM';
        ppSelUnidProdEmb.Template.LoadFromFile;
        ppSelUnidProdEmb.PrinterSetup.DocumentName := Caption;

        if qry_rel_requerimento_.EOF then
        begin
          BoxMensagem( 'Não existem dados a exibir!', 2 );
          qry_rel_requerimento_.Close;
          Exit;
        end;

          ppSelUnidProdEmb.DeviceType := 'Screen';
          ppSelUnidProdEmb.Print;
      end;
    end;

    if tp_rel in [2, 5] then
    begin
      Connect := 'DSN=BROKER; UID=' + 'sa' + '; PWD=' + '123' + '; DSQ=BROKER';
      try
      Execute;
      except on e:exception do
      begin
       ShowMessage(e.message);
      end;
      end;
    end;

    // Limpa as tabelas para os relatórios
    with datm_sel_unid_prod_emb.qry_apaga_dados do
    begin
      case tp_rel of
        1 : SQL.Add( 'DELETE FROM TREL_FOLLOWUP_NAVIO WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR ' );
        2 : SQL.Add( 'DELETE FROM TREL_DESP_PAGTO WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR ' );
        3 : SQL.Add( 'DELETE FROM TREL_DEM_GERENCIAL WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR ' );
        4 :
        begin
          SQL.Add( 'DELETE FROM TREL_LEAD_TIME WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR ' );
          SQL.Add( 'DELETE FROM TREL_LEAD_TIME_AREA WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR ' );
        end;
        5 :
        begin
          ApagaDados( 'TREL_NAO_DESEMB_DI', nr_identificador );
          ApagaDados( 'TREL_NAO_DESEMB_DI_EV', nr_identificador );
        end;
        6 :
        begin
          ApagaDados( 'TREL_DESVIOS', nr_identificador );
          ApagaDados( 'TREL_DESVIOS_GRAF', nr_identificador );
          ApagaDados( 'TREL_DESVIOS_EVENTOS', nr_identificador );
        end;
        7: ApagaDados( 'TREL_DEM_GERENCIAL2', nr_identificador );
        8: ApagaDados( 'TREL_REQUERIMENTO', nr_identificador );
      end;
      ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
      Prepare;
      ExecSQL;
    end;
  end;
  Screen.Cursor := crDefault;
end;


procedure Tfrm_sel_unid_prod_emb.FormShow(Sender: TObject);
begin
  msk_dt_inicio.Date := dt_server;
  msk_dt_fim.Date    := dt_server;

  if ComPeriodo then
    lbl_periodo.Caption := 'Selecione um período:'
  else
  begin
    if tp_rel in [1] then
    begin
      lbl_periodo.Caption := 'Selecione uma data:';
      msk_dt_inicio.Date := dt_server;
    end;
  end;

  case tp_rel of
    1 : begin
      Caption := 'Follow-Up de Navios';
      lbl_grupo.Visible      := True;
      msk_cd_grupo.Visible   := True;
      edt_nm_grupo.Visible   := True;
      btn_co_grupo.Visible   := True;
      lbl_cliente.Visible    := True;
      msk_cd_cliente.Visible := True;
      edt_nm_cliente.Visible := True;
      btn_co_cliente.Visible := True;
      lbl_servico.Visible    := True;
      msk_cd_servico.Visible := True;
      edt_nm_servico.Visible := True;
      btn_co_servico.Visible := True;
      chk_obs.Visible        := True;
      chk_arquivo.Visible    := True;

      lbl_servico.Top        := lbl_celula.Top;
      msk_cd_servico.Top     := msk_cd_celula.Top;
      edt_nm_servico.Top     := edt_nm_celula.Top;
      btn_co_servico.Top     := btn_co_celula.Top;

      chk_obs.Top            := 338;
      chk_obs.Left           := msk_cd_servico.Left;
      lbl_periodo.Top        := chk_obs.Top + 20;
      msk_dt_inicio.Top      := lbl_periodo.Top + 16;
      msk_dt_fim.Top         := msk_dt_inicio.Top;
      btn_imprimir.Top       := msk_dt_inicio.Top + 50;
      btn_sair.Top           := btn_imprimir.Top;
      lbl_a.Top              := msk_dt_inicio.Top + 4;
      frm_sel_unid_prod_emb.Height := btn_imprimir.Top + 65 ;

      msk_cd_servico.TabOrder:= msk_cd_analista_comissaria.TabOrder + 1;
      msk_dt_inicio.TabOrder := msk_cd_analista_comissaria.TabOrder + 2;
      msk_dt_fim.TabOrder    := msk_dt_inicio.TabOrder + 2;
    end;

    2 : begin
      Caption := 'Despachos para Pagamento';
      lbl_analista_comissaria.Top         := lbl_grupo.Top;
      msk_cd_analista_comissaria.Top      := msk_cd_grupo.Top;
      edt_nm_analista_comissaria.Top      := edt_nm_grupo.Top;
      btn_co_analista_comissaria.Top      := btn_co_grupo.Top;
      msk_cd_analista_comissaria.TabOrder := 2;

      lbl_area.Top                        := lbl_cliente.Top;
      msk_cd_area.Top                     := msk_cd_cliente.Top;
      edt_nm_area.Top                     := edt_nm_cliente.Top;
      btn_co_area.Top                     := btn_co_cliente.Top;
      msk_cd_area.TabOrder                := 3;
      btn_imprimir.Top                    := msk_cd_area.Top + 44;
      btn_sair.Top                        := btn_imprimir.Top;
      frm_sel_unid_prod_emb.Height        := btn_sair.Top + 65;

      lbl_emb.Visible                     := False;
      msk_cd_embarcacao.Visible           := False;
      edt_nm_embarcacao.Visible           := False;
      btn_co_embarcacao.Visible           := False;

      lbl_periodo.Visible                 := False;
      msk_dt_inicio.Visible               := False;
      msk_dt_fim.Visible                  := False;
      lbl_a.Visible                       := False;
    end;

    3 : begin
      Caption := 'Demurrage - Gerencial';
      lbl_grupo.Visible      := True;
      msk_cd_grupo.Visible   := True;
      edt_nm_grupo.Visible   := True;
      btn_co_grupo.Visible   := True;
      lbl_cliente.Visible    := True;
      msk_cd_cliente.Visible := True;
      edt_nm_cliente.Visible := True;
      btn_co_cliente.Visible := True;
      chk_obs.Visible        := False;

      lbl_analista_comissaria.Visible    := False;
      msk_cd_analista_comissaria.Visible := False;
      edt_nm_analista_comissaria.Visible := False;
      btn_co_analista_comissaria.Visible := False;
      lbl_periodo.Top                    := msk_cd_area.Top + 25;
      msk_dt_inicio.Top      := lbl_periodo.Top + 16;
      msk_dt_fim.Top         := msk_dt_inicio.Top;
      lbl_a.Top              := msk_dt_inicio.Top + 4;
      btn_imprimir.Top       := msk_dt_inicio.Top + 44;
      btn_sair.Top           := btn_imprimir.Top;
      btn_imprimir.Top       := msk_dt_inicio.Top + 60;
      btn_sair.Top           := btn_imprimir.Top;
      frm_sel_unid_prod_emb.Height := btn_imprimir.Top + 60 ;

      chk_arquivo.Visible                := True;
      msk_dt_inicio.TabOrder             := msk_cd_area.TabOrder + 1;
      msk_dt_fim.TabOrder                := msk_dt_inicio.TabOrder + 1;
    end;

    4 : begin
      Caption                            := 'Lead Time';
      lbl_grupo.Visible                  := True;
      msk_cd_grupo.Visible               := True;
      edt_nm_grupo.Visible               := True;
      btn_co_grupo.Visible               := True;
      lbl_cliente.Visible                := True;
      msk_cd_cliente.Visible             := True;
      edt_nm_cliente.Visible             := True;
      btn_co_cliente.Visible             := True;
      chk_obs.Visible                    := False;
      chk_excel.Visible                  := True;
      lbl_canal.Visible                  := True;
      cbo_tp_canal.Visible               := True;

      lbl_analista_comissaria.Visible    := False;
      msk_cd_analista_comissaria.Visible := False;
      edt_nm_analista_comissaria.Visible := False;
      btn_co_analista_comissaria.Visible := False;

      lbl_emb.Visible                    := False;
      msk_cd_embarcacao.Visible          := False;
      edt_nm_embarcacao.Visible          := False;
      btn_co_embarcacao.Visible          := False;

      lbl_lead_time.Visible              := True;
      cbo_lead_time.Visible              := True;

      frm_sel_unid_prod_emb.Height       := 400;
      lbl_area.Top                       := lbl_emb.Top;
      msk_cd_area.Top                    := msk_cd_embarcacao.Top;
      edt_nm_area.Top                    := edt_nm_embarcacao.Top;
      btn_co_area.Top                    := edt_nm_embarcacao.Top;
      lbl_periodo.Top                    := lbl_emb.Top + 39;
      msk_dt_inicio.Top                  := msk_cd_embarcacao.Top + 39;
      msk_dt_fim.Top                     := msk_cd_embarcacao.Top + 39;
      lbl_a.Top                          := msk_cd_embarcacao.Top + 39;
      chk_arquivo.Top                    := msk_dt_inicio.Top;
      chk_excel.Top                      := chk_arquivo.Top + 16;
      chk_dias_uteis.Top                 := chk_excel.Top + 16;
      chk_area.Top                       := chk_dias_uteis.Top + 16;
      lbl_lead_time.Top                  := lbl_analista_comissaria.Top;
      lbl_canal.Top                      := lbl_analista_comissaria.Top;
      cbo_lead_time.Top                  := msk_cd_analista_comissaria.Top;
      cbo_tp_canal.Top                   := msk_cd_analista_comissaria.Top;
      btn_imprimir.Top                   := frm_sel_unid_prod_emb.Height - 60;
      btn_sair.Top                       := frm_sel_unid_prod_emb.Height - 60;


      with datm_sel_unid_prod_emb.qry_tp_lead_time_ do
      begin
        cbo_lead_time.Clear;
        Close;
        Prepare;
        Open;
        while Not Eof do
        begin
          cbo_lead_time.Items.Add( FieldByName('NM_TP_LEAD_TIME').AsString );
          Next;
        end;
        Close;
        cbo_lead_time.ItemIndex := 0;
      end;

      with datm_sel_unid_prod_emb.qry_tp_canal_ do
      begin
        cbo_tp_canal.Clear;
        Close;
        Prepare;
        Open;
        while Not Eof do
        begin
          cbo_tp_canal.Items.Add( FieldByName('NM_CANAL').AsString );
          Next;
        end;
        Close;
        cbo_tp_canal.ItemIndex := 3;
      end;

      chk_arquivo.Visible                := True;
      chk_dias_uteis.Visible             := True;
      chk_area.Visible                   := True;
      msk_dt_inicio.TabOrder             := msk_cd_area.TabOrder + 1;
      msk_dt_fim.TabOrder                := msk_dt_inicio.TabOrder + 1;
    end;

    5 : begin
      lbl_periodo.Visible                := False;
      msk_dt_inicio.Visible              := False;
      chk_obs.Visible                    := True;
      Caption                            := 'Despachos Não Desembaraçados - D.I.';

      lbl_grupo.Visible                  := True;
      msk_cd_grupo.Visible               := True;
      edt_nm_grupo.Visible               := True;
      btn_co_grupo.Visible               := True;

      lbl_cliente.Visible                := True;
      msk_cd_cliente.Visible             := True;
      edt_nm_cliente.Visible             := True;
      btn_co_cliente.Visible             := True;

      lbl_emb.Visible                    := False;
      msk_cd_embarcacao.Visible          := False;
      edt_nm_embarcacao.Visible          := False;
      btn_co_embarcacao.Visible          := False;

      lbl_area.Visible                   := False;
      msk_cd_area.Visible                := False;
      edt_nm_area.Visible                := False;
      btn_co_area.Visible                := False;

      lbl_analista_comissaria.Visible    := True;
      msk_cd_analista_comissaria.Visible := True;
      edt_nm_analista_comissaria.Visible := True;
      btn_co_analista_comissaria.Visible := True;

      lbl_celula.Visible                 := True;
      msk_cd_celula.Visible              := True;
      edt_nm_celula.Visible              := True;
      btn_co_celula.Visible              := True;

      lbl_celula.Left                    := lbl_emb.Left;
      lbl_celula.Top                     := lbl_emb.Top;
      msk_cd_celula.Left                 := msk_cd_embarcacao.Left;
      msk_cd_celula.Top                  := msk_cd_embarcacao.Top;
      edt_nm_celula.Left                 := edt_nm_embarcacao.Left - 12;
      edt_nm_celula.Top                  := edt_nm_embarcacao.Top;
      btn_co_celula.Left                 := btn_co_embarcacao.Left;
      btn_co_celula.Top                  := btn_co_embarcacao.Top;

      chk_obs.Left                       := lbl_analista_comissaria.Left;
      chk_obs.Top                        := lbl_analista_comissaria.Top;
      btn_imprimir.Top                   := chk_obs.Top + 35;
      btn_sair.Top                       := btn_imprimir.Top;
      frm_sel_unid_prod_emb.Height       := btn_imprimir.Top + 65;


      lbl_analista_comissaria.Left       := lbl_celula.Left;
      lbl_analista_comissaria.Top        := lbl_celula.Top + 40;
      msk_cd_analista_comissaria.Left    := msk_cd_celula.Left;
      msk_cd_analista_comissaria.Top     := msk_cd_celula.Top + 40;
      edt_nm_analista_comissaria.Left    := edt_nm_celula.Left + 12;
      edt_nm_analista_comissaria.Top     := edt_nm_celula.Top + 40;
      btn_co_analista_comissaria.Left    := btn_co_celula.Left;
      btn_co_analista_comissaria.Top     := btn_co_celula.Top + 40;

      msk_cd_celula.TabOrder             := 6;
      msk_cd_analista_comissaria.TabOrder:= 7;


      msk_cd_grupo.SetFocus;
end;

    6 : begin  //Desvios
      Caption                            := 'Desvios';
      lbl_grupo.Visible                  := True;
      msk_cd_grupo.Visible               := True;
      edt_nm_grupo.Visible               := True;
      btn_co_grupo.Visible               := True;
      lbl_cliente.Visible                := True;
      msk_cd_cliente.Visible             := True;
      edt_nm_cliente.Visible             := True;
      btn_co_cliente.Visible             := True;
      chk_excel.Visible                  := True;
      chk_dias_uteis.Visible             := True;

      lbl_analista_comissaria.Visible    := False;
      msk_cd_analista_comissaria.Visible := False;
      edt_nm_analista_comissaria.Visible := False;
      btn_co_analista_comissaria.Visible := False;

      lbl_emb.Visible                    := False;
      msk_cd_embarcacao.Visible          := False;
      edt_nm_embarcacao.Visible          := False;
      btn_co_embarcacao.Visible          := False;

      lbl_lead_time.Visible              := True;
      cbo_lead_time.Visible              := True;
      chk_arquivo.Visible                := True;
      chk_area.Visible                   := False;

      lbl_area.Top                       := lbl_area.Top - 39;
      msk_cd_area.Top                    := msk_cd_area.Top - 39;
      edt_nm_area.Top                    := edt_nm_area.Top - 39;
      btn_co_area.Top                    := btn_co_area.Top - 39;

      lbl_periodo.Top                    := msk_cd_area.Top + 30;
      msk_dt_inicio.Top                  := lbl_periodo.Top + 16;
      lbl_a.Top                          := msk_dt_inicio.Top + 5;
      msk_dt_fim.Top                     := msk_dt_inicio.Top;
      lbl_lead_time.Top                  := msk_dt_inicio.Top + 29;
      cbo_lead_time.Top                  := lbl_lead_time.Top+ 17;
      chk_arquivo.Top                    := msk_dt_inicio.Top;
      chk_excel.Top                      := chk_arquivo.Top + 19;
      btn_imprimir.Top                   := cbo_lead_time.Top + 40;
      btn_sair.Top                       := btn_imprimir.Top ;
      chk_dias_uteis.Top                 := chk_arquivo.Top + 38;

      frm_sel_unid_prod_emb.Height       := cbo_lead_time.top + 100;

      with datm_sel_unid_prod_emb.qry_tp_lead_time_ do
      begin
        cbo_lead_time.Clear;
        Close;
        Prepare;
        Open;
        while Not Eof do
        begin
          cbo_lead_time.Items.Add( FieldByName('NM_TP_LEAD_TIME').AsString );
          Next;
        end;
        Close;
        cbo_lead_time.ItemIndex := 0;
      end;

      msk_dt_inicio.TabOrder             := msk_cd_area.TabOrder + 1;
      msk_dt_fim.TabOrder                := msk_dt_inicio.TabOrder + 1;
    end;

    7 : begin
      Caption := 'Gerencial Modelo2';
      lbl_grupo.Visible      := True;
      msk_cd_grupo.Visible   := True;
      edt_nm_grupo.Visible   := True;
      btn_co_grupo.Visible   := True;
      lbl_cliente.Visible    := True;
      msk_cd_cliente.Visible := True;
      edt_nm_cliente.Visible := True;
      btn_co_cliente.Visible := True;
      chk_obs.Visible        := False;
      lbl_agente.Visible     := True;
      msk_cd_agente.Visible  := True;
      edt_nm_agente.Visible  := True;
      btn_co_agente.Visible  := True;
      lbl_arm_desc.Visible   := True;
      msk_cd_armazem.Visible := True;
      edt_nm_armazem.Visible := True;
      btn_co_armazem.Visible := True;
      lbl_pais.Visible       := True;
      msk_cd_pais.Visible    := True;
      edt_nm_pais.Visible    := True;
      btn_co_pais.Visible    := True;
      lbl_transp.Visible     := True;
      msk_cd_transp.Visible  := True;
      edt_nm_transp.Visible  := True;
      btn_co_transp.Visible  := True;
      lbl_demurrage.Visible   := True;
      cbo_demurrage.Visible  := True;
      cbo_demurrage.ItemIndex := 0;

      lbl_analista_comissaria.Visible    := False;
      msk_cd_analista_comissaria.Visible := False;
      edt_nm_analista_comissaria.Visible := False;
      btn_co_analista_comissaria.Visible := False;

      chk_arquivo.Visible                := True;
      msk_dt_inicio.TabOrder             := cbo_demurrage.TabOrder + 1;
      msk_dt_fim.TabOrder                := msk_dt_inicio.TabOrder + 1;

      lbl_agente.Top                     :=  lbl_analista_comissaria.Top;
      msk_cd_agente.Top                  := msk_cd_analista_comissaria.Top;
      edt_nm_agente.Top                  := edt_nm_analista_comissaria.Top;
      btn_co_agente.Top                  := btn_co_analista_comissaria.Top;
      lbl_arm_desc.Top                   := lbl_celula.Top ;
      msk_cd_armazem.Top                 := msk_cd_celula.Top;
      edt_nm_armazem.Top                 := edt_nm_celula.Top;
      btn_co_armazem.Top                 := btn_co_celula.Top;
      lbl_pais.Top                       := lbl_servico.Top;
      msk_cd_pais.Top                    := msk_cd_servico.top;
      edt_nm_pais.Top                    := edt_nm_servico.Top;
      btn_co_pais.Top                    := btn_co_servico.Top;
      lbl_transp.Top                     := lbl_servico.Top + 41;
      msk_cd_transp.Top                  := msk_cd_servico.Top + 42;
      edt_nm_transp.Top                  := edt_nm_servico.Top + 42;
      btn_co_transp.Top                  := btn_co_servico.Top + 42;
      lbl_demurrage.Top                  := msk_cd_transp.Top + 24;
      cbo_demurrage.Top                  := lbl_demurrage.Top + 16;
      lbl_periodo.Top                    := cbo_demurrage.Top + 31;
      msk_dt_inicio.Top                  := lbl_periodo.Top + 16;
      msk_dt_fim.Top                     := msk_dt_inicio.Top;
      lbl_a.Top                          := msk_dt_fim.Top + 5;
      btn_imprimir.Top                   := msk_dt_inicio.Top + 60;
      btn_sair.Top                       := btn_imprimir.Top;
      chk_arquivo.Top                    := msk_dt_fim.Top + 4;
      frm_sel_unid_prod_emb.Height       := btn_imprimir.Top + 60 ;
    end;

    // Requerimento
    8 : begin
      Caption := 'Controle de Requerimento';
      lbl_grupo.Visible      := True;
      msk_cd_grupo.Visible   := True;
      edt_nm_grupo.Visible   := True;
      btn_co_grupo.Visible   := True;
      lbl_cliente.Visible    := True;
      msk_cd_cliente.Visible := True;
      edt_nm_cliente.Visible := True;
      btn_co_cliente.Visible := True;
      chk_obs.Visible        := False;
      lbl_agente.Visible     := False;
      msk_cd_agente.Visible  := False;
      edt_nm_agente.Visible  := False;
      btn_co_agente.Visible  := False;
      lbl_arm_desc.Visible   := False;
      msk_cd_armazem.Visible := False;
      edt_nm_armazem.Visible := False;
      btn_co_armazem.Visible := False;
      lbl_pais.Visible       := False;
      msk_cd_pais.Visible    := False;
      edt_nm_pais.Visible    := False;
      btn_co_pais.Visible    := False;
      lbl_transp.Visible     := False;
      msk_cd_transp.Visible  := False;
      edt_nm_transp.Visible  := False;
      btn_co_transp.Visible  := False;
      lbl_demurrage.Visible  := False;
      cbo_demurrage.Visible  := False;
      lbl_emb.Visible        := False;
      msk_cd_embarcacao.Visible := False;
      edt_nm_embarcacao.Visible := False;
      btn_co_embarcacao.Visible := False;

      lbl_analista_comissaria.Visible    := False;
      msk_cd_analista_comissaria.Visible := False;
      edt_nm_analista_comissaria.Visible := False;
      btn_co_analista_comissaria.Visible := False;

      chk_arquivo.Visible                := False;
      msk_dt_inicio.TabOrder             := cbo_demurrage.TabOrder + 1;
      msk_dt_fim.TabOrder                := msk_dt_inicio.TabOrder + 1;

      lbl_area.Top    :=  lbl_emb.Top;
      msk_cd_area.Top :=  msk_cd_embarcacao.Top;
      edt_nm_area.Top := edt_nm_embarcacao.Top;
      btn_co_area.Top := btn_co_embarcacao.Top;
      lbl_periodo.Top := 243;
      msk_dt_inicio.Top := 257;
      msk_dt_fim.Top := msk_dt_inicio.Top;
      lbl_a.Top :=  msk_dt_inicio.Top + 4;
      btn_imprimir.Top := lbl_a.Top + 45;
      btn_sair.Top := btn_imprimir.Top;
      frm_sel_unid_prod_emb.Height := btn_imprimir.top + 65;
    end;

  end;

  with datm_sel_unid_prod_emb do
  begin
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_unid_neg_.Prepare;
    qry_produto_.Prepare;
    qry_unid_neg_.Open;
    qry_produto_.Open;
    qry_tp_canal_.Close;
    qry_tp_canal_.Prepare;
    qry_tp_canal_.Open;

    qry_tp_lead_time_.Close;
    qry_tp_lead_time_.Prepare;
    qry_tp_lead_time_.Open;
  end;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_produtoExit(nil);

  lbl_a.Visible        := ComPeriodo;
  msk_dt_fim.Visible   := ComPeriodo;
end;


procedure Tfrm_sel_unid_prod_emb.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_sel_unid_prod_emb do
  begin
    qry_embarcacao_.Close;
    qry_grupo_.Close;
    qry_cliente_.Close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_usuario_.Close;
    qry_area_.Close;
    qry_tp_lead_time_.Close;
    qry_desvios_.Close;
    qry_tp_canal_.Close;
    Free;
  end;
  crp_unid_prod.Free;
  Action := caFree;
end;


procedure Tfrm_sel_unid_prod_emb.FormCreate(Sender: TObject);
begin
  // Inicializa o Data Module para Seleção de Recebimento
  Application.CreateForm( Tdatm_sel_unid_prod_emb, datm_sel_unid_prod_emb );
end;


procedure Tfrm_sel_unid_prod_emb.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.Text = '' then
  begin
    if tp_rel in [1] then edt_nm_cliente.Text := 'Todos'
    else edt_nm_cliente.Text := '';
    Exit;
  end;
  ValCodEdt(msk_cd_cliente);
  with datm_sel_unid_prod_emb.qry_cliente_ do
  begin
    Close;
    ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    Prepare;
    Open;
    if Eof then
    begin
      BoxMensagem( 'Cliente não encontrado!', 2 );
      msk_cd_cliente.Clear;
      edt_nm_cliente.Clear;
      msk_cd_cliente.SetFocus;
    end
    else edt_nm_cliente.Text := FieldByName('AP_EMPRESA').AsString;
    Close;
  end;
end;


procedure Tfrm_sel_unid_prod_emb.btn_co_clienteClick(Sender: TObject);
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

procedure Tfrm_sel_unid_prod_emb.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg            then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto             then btn_co_produtoClick(nil);
    if Sender = msk_cd_grupo               then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente             then btn_co_clienteClick(nil);
    if Sender = msk_cd_embarcacao          then btn_co_embarcacaoClick(nil);
    if Sender = msk_cd_area                then btn_co_areaClick(nil);
    if Sender = msk_cd_celula              then btn_co_celulaClick(nil);
    if Sender = msk_cd_analista_comissaria then btn_co_analista_comissariaClick(nil);
    if Sender = msk_cd_servico             then btn_co_servicoClick(nil);
    if Sender = msk_cd_agente              then btn_co_agenteClick(nil);
    if Sender = msk_cd_armazem             then btn_co_armazemclick(nil);
    if Sender = msk_cd_pais                then btn_co_paisClick(nil);
    if Sender = msk_cd_transp              then btn_co_transpClick(nil);
  end;
end;


procedure Tfrm_sel_unid_prod_emb.btn_co_grupoClick(Sender: TObject);
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

procedure Tfrm_sel_unid_prod_emb.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.Text = '' then
  begin
    if tp_rel in [1] then edt_nm_grupo.Text := 'Todos'
    else edt_nm_grupo.Text := '';
    Exit;
  end;
  ValCodEdt(msk_cd_grupo);
  with datm_sel_unid_prod_emb.qry_grupo_ do
  begin
    Close;
    ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
    Prepare;
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


procedure Tfrm_sel_unid_prod_emb.msk_cd_grupoChange(Sender: TObject);
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


procedure Tfrm_sel_unid_prod_emb.msk_cd_clienteChange(Sender: TObject);
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


procedure Tfrm_sel_unid_prod_emb.btn_co_embarcacaoClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_emb, frm_emb );
  with frm_emb do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_emb.Cons_OnLine_Texto := msk_cd_embarcacao.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_embarcacao.Text := frm_emb.Cons_OnLine_Texto;
  end;
  msk_cd_embarcacaoExit(nil);
  msk_cd_embarcacao.SetFocus;
end;


procedure Tfrm_sel_unid_prod_emb.msk_cd_embarcacaoExit(Sender: TObject);
begin
  edt_nm_embarcacao.Clear;
  if msk_cd_embarcacao.Text = '' then
  begin
    if tp_rel in [1, 3, 7] then edt_nm_embarcacao.Text := 'Todos'
    else edt_nm_embarcacao.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_embarcacao );
  with datm_sel_unid_prod_emb.qry_embarcacao_ do
  begin
    Close;
    ParamByName('CD_EMBARCACAO').AsString := msk_cd_embarcacao.Text;
    Prepare;
    Open;
    if Eof then
    begin
      BoxMensagem( 'Embarcação não encontrada!',2 );
      msk_cd_embarcacao.Clear;
      edt_nm_embarcacao.Clear;
      msk_cd_embarcacao.SetFocus;
    end
    else edt_nm_embarcacao.Text := FieldByName('NM_EMBARCACAO').AsString;
    Close;
  end;
end;


procedure Tfrm_sel_unid_prod_emb.btn_co_areaClick(Sender: TObject);
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
  msk_cd_area.SetFocus;
end;


procedure Tfrm_sel_unid_prod_emb.msk_cd_areaExit(Sender: TObject);
begin
  edt_nm_area.Clear;
  if msk_cd_area.Text = '' then
  begin
    if tp_rel in [1, 2, 3, 4, 6, 7] then edt_nm_area.Text := 'Todas'
    else edt_nm_area.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_area );
  with datm_sel_unid_prod_emb.qry_area_ do
  begin
    Close;
    ParamByName('CD_AREA').AsString := msk_cd_area.Text;
    Prepare;
    Open;
    if Eof then
    begin
      BoxMensagem( 'Área não encontrada!', 2 );
      msk_cd_area.Clear;
      edt_nm_area.Clear;
      msk_cd_area.SetFocus;
    end
    else edt_nm_area.Text := FieldByName('NM_AREA').AsString;
    Close;
  end;
end;


procedure Tfrm_sel_unid_prod_emb.msk_cd_analista_comissariaExit(Sender: TObject);
begin
  edt_nm_analista_comissaria.Clear;
  if msk_cd_analista_comissaria.Text = '' then
  begin
    if tp_rel in [1, 2, 5, 7] then edt_nm_analista_comissaria.Text := 'Todos'
    else edt_nm_analista_comissaria.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_analista_comissaria );
  with datm_sel_unid_prod_emb.qry_usuario_ do
  begin
    Close;
    ParamByName('CD_ANALISTA').AsString := msk_cd_analista_comissaria.Text;
    ParamByName('CD_CARGO').AsString    := str_cd_cargo;
    ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
    Prepare;
    Open;

    if RecordCount = 0 then
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


procedure Tfrm_sel_unid_prod_emb.btn_co_analista_comissariaClick(Sender: TObject);
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


procedure Tfrm_sel_unid_prod_emb.msk_dt_fimExit(Sender: TObject);
begin
  if msk_dt_fim.Date = 0 then
  begin
    BoxMensagem( 'Informe uma Data Inicial!', 2 );
    msk_dt_fim.SetFocus;
    Exit;
  end;
end;


procedure Tfrm_sel_unid_prod_emb.msk_dt_inicioExit(Sender: TObject);
begin
  if msk_dt_inicio.Date = 0 then
  begin
    BoxMensagem( 'Informe uma Data Inicial!', 2 );
    msk_dt_inicio.SetFocus;
    Exit;
  end;
end;


procedure Tfrm_sel_unid_prod_emb.RelLeadTimeExcel;
var NmGrupo : String[60];
    QtGeral, QtGrupo, TotAbMeta, TotAcMeta, TotGrupo, TotAbMetaGeral, TotAcMetaGeral, TotGeral : Integer;
    SomaGrupo, SomaGeral, MediaGrupo, MediaGeral : Double;
begin
  str_cr := #13#10;

  NomeTxt := cDir_Rpt + '\RelLeadTime.TXT';
  NomeXls := cDir_Rpt + '\RelLeadTime.XLS';
  FileMode := 1;

  AssignFile( ArquivoTXT, NomeTxt );
  ReWrite ( ArquivoTXT );

  with datm_sel_unid_prod_emb do
  begin
    //Título
    Saida :=  str_cr + str_cr + str_cr + str_cr + str_cr + str_cr + str_cr + str_cr +
              ';RELATÓRIO LEAD TIME - ' + FormatDateTime( FData, msk_dt_inicio.Date ) +
              ' a ' + FormatDateTime( FData, msk_dt_fim.Date ) + str_cr + str_cr;
    Write ( ArquivoTXT, Saida );
    //Unidade de Negócio
    Saida := 'Unidade:;' + Trim( edt_nm_unid_neg.Text ) + str_cr;
    Write ( ArquivoTXT, Saida );
    //Produto
    Saida := 'Produto:;' + Trim( edt_nm_produto.Text ) + str_cr;
    Write ( ArquivoTXT, Saida );
    //Cliente
    if ( Trim( edt_nm_grupo.Text ) <> '' ) and ( Trim( edt_nm_grupo.Text ) <> 'Todos' ) then
      Saida := 'Cliente:;' + Trim( edt_nm_grupo.Text ) + str_cr
    else
      Saida := 'Cliente:;' + Trim( edt_nm_cliente.Text ) + str_cr;
    Write ( ArquivoTXT, Saida );
    //Área
    Saida := 'Área:;' + Trim( edt_nm_area.Text ) + str_cr + str_cr;
    Write ( ArquivoTXT, Saida );

    Saida := 'Grupo;Tipo de Serviço;Qtde;Abaixo;;Acima;;Lead Time;Meta' + str_cr +
             ';;Total;Qtde;Média;Qtde;Média;Grupo' + str_cr;
    Write ( ArquivoTXT, Saida );

    TotAbMeta      := 0;
    TotAcMeta      := 0;
    TotGrupo       := 0;
    SomaGrupo      := 0;
    QtGrupo        := 0;
    TotAbMetaGeral := 0;
    TotAcMetaGeral := 0;
    TotGeral       := 0;
    SomaGeral      := 0;
    QtGeral        := 0;

    while Not qry_rel_lead_time_.EOF do
    begin
      NmGrupo := qry_rel_lead_time_.FieldByName('NM_GRUPO').AsString;
      Saida := qry_rel_lead_time_.FieldByName('NM_GRUPO').AsString + ';';
      Saida := Saida + qry_rel_lead_time_.FieldByName('NM_SERVICO').AsString + ';';
      Saida := Saida + IntToStr( qry_rel_lead_time_.FieldByName('QT_TOT_PROC').AsInteger ) + ';';
      Saida := Saida + IntToStr( qry_rel_lead_time_.FieldByName('QT_ABAIXO_META').AsInteger ) + ';';
      Saida := Saida + IntToStr( qry_rel_lead_time_.FieldByName('MEDIA_ABAIXO_META').AsInteger ) + ';';
      Saida := Saida + IntToStr( qry_rel_lead_time_.FieldByName('QT_ACIMA_META').AsInteger ) + ';';
      Saida := Saida + IntToStr( qry_rel_lead_time_.FieldByName('MEDIA_ACIMA_META').AsInteger ) + ';';
      Saida := Saida + FormatFloat( '#0,.0', qry_rel_lead_time_.FieldByName('MEDIA_GRUPO').AsFloat ) + ';';
      Saida := Saida + IntToStr( qry_rel_lead_time_.FieldByName('NR_META').AsInteger ) + str_cr;
      Write ( ArquivoTXT, Saida );
      //Totais Grupo
      TotAbMeta      := TotAbMeta + qry_rel_lead_time_.FieldByName('QT_ABAIXO_META').AsInteger;
      TotAcMeta      := TotAcMeta + qry_rel_lead_time_.FieldByName('QT_ACIMA_META').AsInteger;
      TotGrupo       := TotGrupo  + qry_rel_lead_time_.FieldByName('QT_TOT_PROC').AsInteger;
      SomaGrupo      := SomaGrupo + qry_rel_lead_time_.FieldByName('MEDIA_GRUPO').AsFloat;
      QtGrupo        := QtGrupo   + 1;
      //Totais Geral
      TotAbMetaGeral := TotAbMetaGeral + qry_rel_lead_time_.FieldByName('QT_ABAIXO_META').AsInteger;
      TotAcMetaGeral := TotAcMetaGeral + qry_rel_lead_time_.FieldByName('QT_ACIMA_META').AsInteger;
      TotGeral       := TotGeral       + qry_rel_lead_time_.FieldByName('QT_TOT_PROC').AsInteger;
      SomaGeral      := SomaGeral      + qry_rel_lead_time_.FieldByName('MEDIA_GRUPO').AsFloat;
      QtGeral        := QtGeral        + 1;
      qry_rel_lead_time_.Next;

      if ( qry_rel_lead_time_.FieldByName('NM_GRUPO').AsString <> NmGrupo ) or
         ( qry_rel_lead_time_.EOF ) then
      begin
        MediaGrupo := Arredondar( ( SomaGrupo / QtGrupo ), 1 );
        Saida := ';Sub-Total;' + IntToStr( TotGrupo ) + ';' + IntToStr( TotAbMeta ) +';;' + IntToStr( TotAcMeta ) + ';;' + FormatFloat( '#0,.0', MediaGrupo ) + ';' + str_cr;
        Write ( ArquivoTXT, Saida );
        TotAbMeta := 0;
        TotAcMeta := 0;
        TotGrupo  := 0;
        QtGrupo   := 0;
        SomaGrupo := 0;
      end;
    end;
    MediaGeral := Arredondar( ( SomaGeral / QtGeral ), 1 );
    Saida := ';Total;' + IntToStr( TotGeral ) + ';' + IntToStr( TotAbMetaGeral ) +';;' + IntToStr( TotAcMetaGeral ) + ';;' + FormatFloat( '#0,.0', MediaGeral ) + ';' + str_cr;
    Write ( ArquivoTXT, Saida );

    qry_rel_lead_time_.Close;
  end;

  CloseFile( ArquivoTXT );

  Screen.Cursor := crDefault;

  ShellExecute( Application.Handle, 'Open', 'EXCEL.EXE', PChar( NomeXls ), '', SW_MAXIMIZE );
end;


procedure Tfrm_sel_unid_prod_emb.btn_co_celulaClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_celula, frm_celula);
  with frm_celula do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_celula.Cons_OnLine_Texto := msk_cd_celula.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_celula.Text := frm_celula.Cons_OnLine_Texto;
  end;
  msk_cd_celulaExit(nil);
  msk_cd_celula.SetFocus;
end;


procedure Tfrm_sel_unid_prod_emb.msk_cd_celulaExit(Sender: TObject);
begin
   edt_nm_celula.Clear;
  if msk_cd_celula.Text = '' then
  begin
    if tp_rel in [1, 2, 5] then edt_nm_celula.Text := 'Todos'
    else edt_nm_celula.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_celula );
  with datm_sel_unid_prod_emb.qry_celula do
  begin
    Close;
    ParamByName('CD_CELULA').AsString := msk_cd_celula.Text;
    Prepare;
    Open;
    if Eof then
    begin
      BoxMensagem( 'Celula não encontrada!', 2 );
      msk_cd_celula.Clear;
      edt_nm_celula.Clear;
      msk_cd_celula.SetFocus;
    end
    else edt_nm_celula.Text := FieldByName('NM_CELULA').AsString;
    Close;
  end;
end;


procedure Tfrm_sel_unid_prod_emb.btn_co_servicoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_servico, frm_servico);
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


procedure Tfrm_sel_unid_prod_emb.msk_cd_servicoExit(Sender: TObject);
begin
   edt_nm_servico.Clear;
  if msk_cd_servico.Text = '' then
  begin
    if tp_rel in [1, 2, 5] then edt_nm_servico.Text := 'Todos'
    else edt_nm_servico.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_servico );
  with datm_sel_unid_prod_emb.qry_servico_ do
  begin
    Close;
    ParamByName('CD_SERVICO').AsString := msk_cd_servico.Text;
    Prepare;
    Open;
    if Eof then
    begin
      BoxMensagem( 'Servico não encontrado!', 2 );
      msk_cd_servico.Clear;
      edt_nm_servico.Clear;
      msk_cd_servico.SetFocus;
    end
    else edt_nm_servico.Text := FieldByName('NM_SERVICO').AsString;
      Close;
  end;
end;


procedure Tfrm_sel_unid_prod_emb.RelDesviosExcel;
var NmGrupo : String[60];
    TotAbMeta, TotAcMeta, TotGrupo, TotAbMetaGeral, TotAcMetaGeral, TotGeral : Integer;
    servico : string[3];
begin
  str_cr := #13#10;
  servico := '';

  NomeTxt := cDir_Rpt + '\RelDesvios.TXT';
  NomeXls := cDir_Rpt + '\RelDesvios.XLS';
  FileMode := 1;

  AssignFile( ArquivoTXT, NomeTxt );
  ReWrite ( ArquivoTXT );

  with datm_sel_unid_prod_emb do
  begin
    //Título
    Saida :=  str_cr + str_cr + str_cr + str_cr + str_cr + str_cr + str_cr + str_cr +
              ';RELATÓRIO DESVIOS - ' + FormatDateTime( FData, msk_dt_inicio.Date ) +
              ' a ' + FormatDateTime( FData, msk_dt_fim.Date ) + str_cr + str_cr;
    Write ( ArquivoTXT, Saida );
    //Unidade de Negócio
    Saida := 'Unidade:;' + Trim( edt_nm_unid_neg.Text ) + str_cr;
    Write ( ArquivoTXT, Saida );
    //Produto
    Saida := 'Produto:;' + Trim( edt_nm_produto.Text ) + str_cr;
    Write ( ArquivoTXT, Saida );
    //Cliente
    if ( Trim( edt_nm_grupo.Text ) <> '' ) and ( Trim( edt_nm_grupo.Text ) <> 'Todos' ) then
      Saida := 'Cliente:;' + Trim( edt_nm_grupo.Text ) + str_cr
    else
      Saida := 'Cliente:;' + Trim( edt_nm_cliente.Text ) + str_cr;
    Write ( ArquivoTXT, Saida );
    //Área
    Saida := 'Área:;' + Trim( edt_nm_area.Text ) + str_cr + str_cr;
    Write ( ArquivoTXT, Saida );

    Saida := 'Grupo;Tipo de Serviço;Qtde;Abaixo;;Acima;;Lead Time;Meta' + str_cr +
             ';;Total;Qtde;Média;Qtde;Média;Grupo' + str_cr;
    Write ( ArquivoTXT, Saida );

    TotAbMeta      := 0;
    TotAcMeta      := 0;
    TotGrupo       := 0;
    TotAbMetaGeral := 0;
    TotAcMetaGeral := 0;
    TotGeral       := 0;

    while Not qry_desvios_.EOF do
    begin
      if ( servico = '' ) or ( servico <> qry_desvios_.FieldByName('CD_SERVICO').AsString ) then
      begin
        NmGrupo := qry_desvios_.FieldByName('NM_GRUPO').AsString;

        Saida := qry_desvios_.FieldByName('NM_GRUPO').AsString + ';' + str_cr;
        Write ( ArquivoTXT, Saida );

        Saida := qry_desvios_.FieldByName('NM_GRUPO').AsString + ';';
        Saida := Saida + qry_desvios_.FieldByName('NM_SERVICO').AsString + ';';
        Saida := Saida + IntToStr( qry_desvios_.FieldByName('QT_TOT_PROC').AsInteger ) + ';';
        Saida := Saida + IntToStr( qry_desvios_.FieldByName('QT_ABAIXO_META').AsInteger ) + ';';
        Saida := Saida + IntToStr( qry_desvios_.FieldByName('MEDIA_ABAIXO_META').AsInteger ) + ';';
        Saida := Saida + IntToStr( qry_desvios_.FieldByName('QT_ACIMA_META').AsInteger ) + ';';
        Saida := Saida + IntToStr( qry_desvios_.FieldByName('MEDIA_ACIMA_META').AsInteger ) + ';';
        Saida := Saida + IntToStr( qry_desvios_.FieldByName('MEDIA_GRUPO').AsInteger ) + ';';
        Saida := Saida + IntToStr( qry_desvios_.FieldByName('NR_META').AsInteger ) + str_cr;
        Write ( ArquivoTXT, Saida );

        Saida := qry_desvios_.FieldByName('NM_GRUPO').AsString + ';' + str_cr;
        Write ( ArquivoTXT, Saida );

        Saida := qry_desvios_.FieldByName('NM_GRUPO').AsString + ';' + 'Pedido' + ';' + 'Processo' + ';' + 'Fornecedor' + ';' + 'Produto' + ';';
        Saida := Saida  + 'Lead-Time' + ';' + 'Resp. pelo Desvio' + ';' + 'Prest. de Serviço' + str_cr;
        Write ( ArquivoTXT, Saida );
        servico := qry_desvios_.FieldByName('CD_SERVICO').AsString;


        //Totais Grupo
        TotAbMeta      := TotAbMeta + qry_desvios_.FieldByName('QT_ABAIXO_META').AsInteger;
        TotAcMeta      := TotAcMeta + qry_desvios_.FieldByName('QT_ACIMA_META').AsInteger;
        TotGrupo       := TotGrupo  + qry_desvios_.FieldByName('QT_TOT_PROC').AsInteger;
        //Totais Geral
        TotAbMetaGeral := TotAbMetaGeral + qry_desvios_.FieldByName('QT_ABAIXO_META').AsInteger;
        TotAcMetaGeral := TotAcMetaGeral + qry_desvios_.FieldByName('QT_ACIMA_META').AsInteger;
        TotGeral       := TotGeral       + qry_desvios_.FieldByName('QT_TOT_PROC').AsInteger;
      end;

      Saida := qry_desvios_.FieldByName('NM_GRUPO').AsString + ';';
      Saida := Saida + qry_desvios_.FieldByName('REFERENCIA').AsString + '' + ';';
      Saida := Saida + qry_desvios_.FieldByName('NR_PROCESSO').AsString + ';';
      Saida := Saida + qry_desvios_.FieldByName('AP_EMPRESA').AsString + ';';
      Saida := Saida + qry_desvios_.FieldByName('MERCADORIA').AsString + ';';
      Saida := Saida + qry_desvios_.FieldByName('LEAD_TIME').AsString + ';';
      Saida := Saida + qry_desvios_.FieldByName('EVENTOS').AsString + ';';
      Saida := Saida + qry_desvios_.FieldByName('PRESTADORES').AsString + ';';
      Saida := Saida + qry_desvios_.FieldByName('CANAL').AsString + str_cr;
      Write ( ArquivoTXT, Saida );

      qry_desvios_.Next;

      if ( qry_desvios_.FieldByName('NM_GRUPO').AsString <> NmGrupo ) or
         ( qry_desvios_.EOF ) then
      begin
        Saida := ';Sub-Total;' + IntToStr( TotGrupo ) + ';' + IntToStr( TotAbMeta ) +';;' + IntToStr( TotAcMeta ) + ';;;' + str_cr;
        Write ( ArquivoTXT, Saida );
        TotAbMeta      := 0;
        TotAcMeta      := 0;
        TotGrupo       := 0;
      end;
    end;
    Saida := ';Total;' + IntToStr( TotGeral ) + ';' + IntToStr( TotAbMetaGeral ) +';;' + IntToStr( TotAcMetaGeral ) + ';;;' + str_cr;
    Write ( ArquivoTXT, Saida );

    qry_desvios_.Close;
  end;

  CloseFile( ArquivoTXT );

  Screen.Cursor := crDefault;

  ShellExecute( Application.Handle, 'Open', 'EXCEL.EXE', PChar( NomeXls ), '', SW_MAXIMIZE );
end;


procedure Tfrm_sel_unid_prod_emb.RelLeadTimeAreaExcel;
var NmGrupo : String[60];
    NmArea  : String[50];
    QtGrupo, QtArea, QtGeral,
    TotAbMetaGrupo, TotAbMetaArea, TotAbMetaGeral,
    TotAcMetaGrupo, TotAcMetaArea, TotAcMetaGeral,
    TotArea, TotGrupo, TotGeral : Integer;
    SomaGrupo, SomaArea, SomaGeral,
    MediaGrupo, MediaArea, MediaGeral : Double;
begin
  str_cr := #13#10;

  NomeTxt := cDir_Rpt + '\RelLeadTimeArea.TXT';
  NomeXls := cDir_Rpt + '\RelLeadTimeArea.XLS';
  FileMode := 1;

  AssignFile( ArquivoTXT, NomeTxt );
  ReWrite ( ArquivoTXT );

  with datm_sel_unid_prod_emb do
  begin
    //Título
    Saida :=  str_cr + str_cr + str_cr + str_cr + str_cr + str_cr + str_cr + str_cr +
              ';RELATÓRIO LEAD TIME - ' + FormatDateTime( FData, msk_dt_inicio.Date ) +
              ' a ' + FormatDateTime( FData, msk_dt_fim.Date ) + str_cr + str_cr;
    Write ( ArquivoTXT, Saida );
    //Unidade de Negócio
    Saida := 'Unidade:;' + Trim( edt_nm_unid_neg.Text ) + str_cr;
    Write ( ArquivoTXT, Saida );
    //Produto
    Saida := 'Produto:;' + Trim( edt_nm_produto.Text ) + str_cr;
    Write ( ArquivoTXT, Saida );
    //Cliente
    if ( Trim( edt_nm_grupo.Text ) <> '' ) and ( Trim( edt_nm_grupo.Text ) <> 'Todos' ) then
      Saida := 'Cliente:;' + Trim( edt_nm_grupo.Text ) + str_cr + str_cr
    else
      Saida := 'Cliente:;' + Trim( edt_nm_cliente.Text ) + str_cr + str_cr;
    Write ( ArquivoTXT, Saida );

    Saida := 'Grupo;Tipo de Serviço;Qtde;Abaixo;;Acima;;Lead Time;Meta' + str_cr +
             ';;Total;Qtde;Média;Qtde;Média;Grupo' + str_cr;
    Write ( ArquivoTXT, Saida );

    TotAbMetaGrupo := 0;
    TotAbMetaArea  := 0;
    TotAbMetaGeral := 0;
    TotAcMetaGrupo := 0;
    TotAcMetaArea  := 0;
    TotAcMetaGeral := 0;
    TotGrupo       := 0;
    TotArea        := 0;
    TotGeral       := 0;
    SomaGrupo      := 0;
    SomaArea       := 0;
    SomaGeral      := 0;
    QtGrupo        := 0;
    QtArea         := 0;
    QtGeral        := 0;

    while Not qry_rel_lead_time_area_.EOF do
    begin
      if ( qry_rel_lead_time_area_.FieldByName('NM_AREA').AsString <> NmArea ) then
        Saida := 'Área: ' + qry_rel_lead_time_area_.FieldByName('CD_AREA').AsString + ';' + qry_rel_lead_time_area_.FieldByName('NM_AREA').AsString + str_cr
      else
        Saida := '';
      NmArea  := qry_rel_lead_time_area_.FieldByName('NM_AREA').AsString;
      NmGrupo := qry_rel_lead_time_area_.FieldByName('NM_GRUPO').AsString;
      Saida   := Saida + qry_rel_lead_time_area_.FieldByName('NM_GRUPO').AsString + ';';
      Saida   := Saida + qry_rel_lead_time_area_.FieldByName('NM_SERVICO').AsString + ';';
      Saida   := Saida + IntToStr( qry_rel_lead_time_area_.FieldByName('QT_TOT_PROC').AsInteger ) + ';';
      Saida   := Saida + IntToStr( qry_rel_lead_time_area_.FieldByName('QT_ABAIXO_META').AsInteger ) + ';';
      Saida   := Saida + IntToStr( qry_rel_lead_time_area_.FieldByName('MEDIA_ABAIXO_META').AsInteger ) + ';';
      Saida   := Saida + IntToStr( qry_rel_lead_time_area_.FieldByName('QT_ACIMA_META').AsInteger ) + ';';
      Saida   := Saida + IntToStr( qry_rel_lead_time_area_.FieldByName('MEDIA_ACIMA_META').AsInteger ) + ';';
      Saida   := Saida + FormatFloat( '#0,.0', qry_rel_lead_time_area_.FieldByName('MEDIA_GRUPO').AsFloat ) + ';';
      Saida   := Saida + IntToStr( qry_rel_lead_time_area_.FieldByName('NR_META').AsInteger ) + str_cr;
      Write ( ArquivoTXT, Saida );
      //Totais Grupo
      TotAbMetaGrupo := TotAbMetaGrupo + qry_rel_lead_time_area_.FieldByName('QT_ABAIXO_META').AsInteger;
      TotAcMetaGrupo := TotAcMetaGrupo + qry_rel_lead_time_area_.FieldByName('QT_ACIMA_META').AsInteger;
      TotGrupo       := TotGrupo  + qry_rel_lead_time_area_.FieldByName('QT_TOT_PROC').AsInteger;
      SomaGrupo      := SomaGrupo + qry_rel_lead_time_area_.FieldByName('MEDIA_GRUPO').AsFloat;
      QtGrupo        := QtGrupo   + 1;
      //Totais Área
      TotAbMetaArea  := TotAbMetaArea + qry_rel_lead_time_area_.FieldByName('QT_ABAIXO_META').AsInteger;
      TotAcMetaArea  := TotAcMetaArea + qry_rel_lead_time_area_.FieldByName('QT_ACIMA_META').AsInteger;
      TotArea        := TotArea  + qry_rel_lead_time_area_.FieldByName('QT_TOT_PROC').AsInteger;
      SomaArea       := SomaArea + qry_rel_lead_time_area_.FieldByName('MEDIA_GRUPO').AsFloat;
      QtArea         := QtArea   + 1;
      //Totais Geral
      TotAbMetaGeral := TotAbMetaGeral + qry_rel_lead_time_area_.FieldByName('QT_ABAIXO_META').AsInteger;
      TotAcMetaGeral := TotAcMetaGeral + qry_rel_lead_time_area_.FieldByName('QT_ACIMA_META').AsInteger;
      TotGeral       := TotGeral       + qry_rel_lead_time_area_.FieldByName('QT_TOT_PROC').AsInteger;
      SomaGeral      := SomaGeral      + qry_rel_lead_time_area_.FieldByName('MEDIA_GRUPO').AsFloat;
      QtGeral        := QtGeral        + 1;
      qry_rel_lead_time_area_.Next;

      //Total Grupo
      if ( qry_rel_lead_time_area_.FieldByName('NM_GRUPO').AsString <> NmGrupo ) or
         ( qry_rel_lead_time_area_.FieldByName('NM_AREA').AsString <> NmArea ) or
         ( qry_rel_lead_time_area_.EOF ) then
      begin
        MediaGrupo := Arredondar( ( SomaGrupo / QtGrupo ), 1 );
        Saida := ';Total Grupo;' + IntToStr( TotGrupo ) + ';' + IntToStr( TotAbMetaGrupo ) +';;' + IntToStr( TotAcMetaGrupo ) + ';;' + FormatFloat( '#0,.0', MediaGrupo ) + ';' + str_cr;
        Write ( ArquivoTXT, Saida );
        TotAbMetaGrupo := 0;
        TotAcMetaGrupo := 0;
        TotGrupo       := 0;
        QtGrupo        := 0;
        SomaGrupo      := 0;
      end;

      //Total Área
      if ( qry_rel_lead_time_area_.FieldByName('NM_AREA').AsString <> NmArea ) or
         ( qry_rel_lead_time_area_.EOF ) then
      begin
        MediaArea := Arredondar( ( SomaArea / QtArea ), 1 );
        Saida := ';Total Área;' + IntToStr( TotArea ) + ';' + IntToStr( TotAbMetaArea ) +';;' + IntToStr( TotAcMetaArea ) + ';;' + FormatFloat( '#0,.0', MediaArea ) + ';' + str_cr;
        Write ( ArquivoTXT, Saida );
        TotAbMetaArea := 0;
        TotAcMetaArea := 0;
        TotArea       := 0;
        QtArea        := 0;
        SomaArea      := 0;
      end;
    end;
    MediaGeral := Arredondar( ( SomaGeral / QtGeral ), 1 );
    Saida := ';Total;' + IntToStr( TotGeral ) + ';' + IntToStr( TotAbMetaGeral ) +';;' + IntToStr( TotAcMetaGeral ) + ';;' + FormatFloat( '#0,.0', MediaGeral ) + ';' + str_cr;
    Write ( ArquivoTXT, Saida );

    qry_rel_lead_time_area_.Close;
  end;

  CloseFile( ArquivoTXT );

  Screen.Cursor := crDefault;

  ShellExecute( Application.Handle, 'Open', 'EXCEL.EXE', PChar( NomeXls ), '', SW_MAXIMIZE );
end;


procedure Tfrm_sel_unid_prod_emb.btn_co_armazemClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_amz, frm_amz );
  with frm_amz do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_amz.Cons_OnLine_Texto := msk_cd_armazem.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_armazem.Text := frm_amz.Cons_OnLine_Texto;
  end;
  msk_cd_armazemExit(nil);
  msk_cd_armazem.SetFocus;
end;


procedure Tfrm_sel_unid_prod_emb.btn_co_paisClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_pais, frm_pais );
  with frm_pais do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_pais.Cons_OnLine_Texto := msk_cd_pais.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_pais.Text := frm_pais.Cons_OnLine_Texto;
  end;
  msk_cd_paisExit(nil);
  msk_cd_pais.SetFocus;
end;


procedure Tfrm_sel_unid_prod_emb.btn_co_transpClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_transp_rod, frm_transp_rod );
  with frm_transp_rod do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_transp_rod.Cons_OnLine_Texto := msk_cd_transp.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_transp.Text := frm_transp_rod.Cons_OnLine_Texto;
  end;
  msk_cd_transpExit(nil);
  msk_cd_transp.SetFocus;
end;


procedure Tfrm_sel_unid_prod_emb.msk_cd_agenteExit(Sender: TObject);
begin
  if msk_cd_agente.Text = '' then
  begin
    if tp_rel in [1, 2, 3, 4, 5, 6, 7] then edt_nm_agente.Text := 'Todos'
    else edt_nm_agente.Text := '';
    Exit;
  end;
    ValCodEdt( msk_cd_agente );
  if msk_cd_agente.Text <> '' then
  begin
    with datm_sel_unid_prod_emb do
    begin
      qry_agente_.Close;
      qry_agente_.ParamByName('CD_AGENTE').AsString := msk_cd_agente.Text;
      qry_agente_.Prepare;
      qry_agente_.Open;

      if qry_agente_.RecordCount > 0 then
      begin
        edt_nm_agente.Text := qry_agente_.FieldByName('NM_AGENTE').AsString;
      end
      else
      begin
        BoxMensagem( 'Agente não cadastrado!', 2 );
        msk_cd_agente.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_agente.Text := '';
  end;
end;


procedure Tfrm_sel_unid_prod_emb.msk_cd_paisExit(Sender: TObject);
begin
  if msk_cd_pais.Text = '' then
  begin
    if tp_rel in [7] then edt_nm_pais.Text := 'Todos'
    else edt_nm_pais.Text := '';
    Exit;
  end;

  ValCodEdt( msk_cd_pais );
  if msk_cd_pais.Text <> '' then
  begin
    with datm_sel_unid_prod_emb do
    begin
      qry_pais_.Close;
      qry_pais_.ParamByName('CD_PAIS').AsString := msk_cd_pais.Text;
      qry_pais_.Prepare;
      qry_pais_.Open;

      if qry_pais_.RecordCount > 0 then
      begin
        edt_nm_pais.Text := qry_pais_.FieldByName('NM_PAIS').AsString;
      end
      else
      begin
        BoxMensagem( 'País não cadastrado!', 2 );
        msk_cd_pais.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_pais.Text := '';
  end;
end;


procedure Tfrm_sel_unid_prod_emb.msk_cd_transpExit(Sender: TObject);
begin
  if msk_cd_transp.Text = '' then
  begin
    if tp_rel in [7] then edt_nm_transp.Text := 'Todos'
    else edt_nm_transp.Text := '';
    Exit;
  end;

  ValCodEdt( msk_cd_transp );
  if msk_cd_transp.Text <> '' then
  begin
    with datm_sel_unid_prod_emb do
    begin
      qry_transp_.Close;
      qry_transp_.ParamByName('CD_TRANSP_ROD').AsString := msk_cd_transp.Text;
      qry_transp_.Prepare;
      qry_transp_.Open;
      if qry_transp_.RecordCount > 0 then
      begin
        edt_nm_transp.Text := qry_transp_.FieldByName('NM_TRANSP_ROD').AsString;
      end
      else
      begin
        BoxMensagem( 'Transportadora não cadastrada!', 2 );
        msk_cd_transp.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_transp.Text := '';
  end;
end;


procedure Tfrm_sel_unid_prod_emb.msk_cd_armazemExit(Sender: TObject);
begin
  if msk_cd_armazem.Text = '' then
  begin
    if tp_rel in [7] then edt_nm_armazem.Text := 'Todos'
    else edt_nm_armazem.Text := '';
    Exit;
  end;

  ValCodEdt( msk_cd_armazem );
  if msk_cd_armazem.Text <> '' then
  begin
    with datm_sel_unid_prod_emb do
    begin
      qry_amz_.Close;
      qry_amz_.ParamByName('CD_ARMAZEM').AsString := msk_cd_armazem.Text;
      qry_amz_.Prepare;
      qry_amz_.Open;
      if qry_amz_.RecordCount > 0 then
      begin
        edt_nm_armazem.Text := qry_amz_.FieldByName('NM_ARMAZEM').AsString;
      end
      else
      begin
        BoxMensagem( 'Armazém não cadastrado!', 2 );
        msk_cd_armazem.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_armazem.Text := '';
  end;
end;


procedure Tfrm_sel_unid_prod_emb.btn_co_agenteClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_ag, frm_ag );
  with frm_ag do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_ag.Cons_OnLine_Texto := msk_cd_agente.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_agente.Text := frm_ag.Cons_OnLine_Texto;
  end;
  msk_cd_agenteExit(nil);
  msk_cd_agente.SetFocus;
end;


end.
