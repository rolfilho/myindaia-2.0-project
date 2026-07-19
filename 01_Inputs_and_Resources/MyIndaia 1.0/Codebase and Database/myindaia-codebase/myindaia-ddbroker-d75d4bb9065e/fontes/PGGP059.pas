unit PGGP059;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Db, StdCtrls, Mask, ExtCtrls, UCRPE32, ShellApi, ComCtrls,
  DBCtrls, DBCGrids, dbtables, ComObj, Funcoes, DateUtils;

type
  Tfrm_sel_padrao_agente = class(TForm)
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
    crp_padrao_agente: TCrpe;
    lbl_periodo: TLabel;
    lbl_a: TLabel;
    lbl_cd_cliente: TLabel;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    btn_co_cliente: TSpeedButton;
    lblGrupo: TLabel;
    btn_co_grupo: TSpeedButton;
    edt_nm_grupo: TEdit;
    msk_cd_grupo: TMaskEdit;
    lbl_agente: TLabel;
    btn_co_agente: TSpeedButton;
    msk_cd_agente: TMaskEdit;
    edt_nm_agente: TEdit;
    chk_cntr: TCheckBox;
    chk_carga_solta: TCheckBox;
    chk_excel: TCheckBox;
    msk_dt_inicio: TDateTimePicker;
    msk_dt_fim: TDateTimePicker;
    lbl_armazem: TLabel;
    msk_cd_armazem: TMaskEdit;
    edt_nm_armazem: TEdit;
    btn_co_armazem: TSpeedButton;
    lbl_area: TLabel;
    msk_cd_area: TMaskEdit;
    edt_nm_area: TEdit;
    btn_co_area: TSpeedButton;
    msk_cd_transportadora: TMaskEdit;
    lbl_transportadora: TLabel;
    edt_nm_transportadora: TEdit;
    btn_co_transportadora: TSpeedButton;
    lbl_busca: TLabel;
    cbo_busca: TComboBox;
    lbl_via_transp: TLabel;
    dblckpbox_via_transp: TDBLookupComboBox;
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
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_agenteExit(Sender: TObject);
    procedure btn_co_agenteClick(Sender: TObject);
    procedure msk_cd_armazemChange(Sender: TObject);
    procedure btn_co_armazemClick(Sender: TObject);
    procedure btn_co_areaClick(Sender: TObject);
    procedure msk_cd_areaExit(Sender: TObject);
    procedure msk_cd_armazemExit(Sender: TObject);
    procedure msk_cd_transportadoraExit(Sender: TObject);
    procedure btn_co_transportadoraClick(Sender: TObject);
    procedure dblckpbox_via_transpExit(Sender: TObject);
  private
    procedure GeraRelEstVolumesExcel( nr_identificador : Integer );
    procedure GeraRelEstVolumesExcelMod2( nr_identificador : Integer );
    procedure GeraRelEstArmzCargas( nr_identificador : Integer );
    procedure GeraRelEstArmazRem( nr_identificador : Integer );
    procedure GeraRelFupDia( nr_identificador : Integer );
  public
    tp_rel : Byte;
    ComPeriodo : Boolean;
    // 1 - Relação de Contêineres
    // 2 - Relação de Volumes
    // 3 - Relação de Volumes Mod.2
    // 4 - Relação de Armazenagem/Cargas
    // 5 - Relatório de Armazemagem e Fumigação
    // 6 - Follow-Up Diário
    // 7 - Follow-Up Processo
  end;

var
  Saida    : String;
  Txt      : TextFile;
  cNomeTxt : String;
  frm_sel_padrao_agente: Tfrm_sel_padrao_agente;

implementation

{$R *.DFM}

uses GSMLIB, FileText, PGGP001, PGGP017, PGGP060, PGSM010, PGSM018, PGSM024,
      PGSM119, uAg, pgsm212, PGSM064, PGSM051, PGRE003;

procedure Tfrm_sel_padrao_agente.btn_sairClick(Sender: TObject);
begin
  ActiveControl := nil;
end;

procedure Tfrm_sel_padrao_agente.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = '' then
  begin
    if tp_rel in [1, 2, 3, 4, 5, 6, 7] then edt_nm_unid_neg.Text := 'Todas'
    else edt_nm_unid_neg.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_unid_neg );
  if msk_cd_unid_neg.Text <> '' then
  begin
    with datm_sel_padrao_agente do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '"';
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.RecordCount > 0 then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
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

procedure Tfrm_sel_padrao_agente.msk_cd_produtoExit(Sender: TObject);
begin
  if msk_cd_produto.Text = '' then
  begin
    if tp_rel in [1, 2, 3, 4, 5, 6, 7] then edt_nm_produto.Text := 'Todos'
    else edt_nm_produto.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_produto );
  if msk_cd_produto.Text <> '' then
  begin
    with datm_sel_padrao_agente do
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
        msk_cd_produto.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_produto.Text := '';
  end;
end;

procedure Tfrm_sel_padrao_agente.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_sel_padrao_agente do
  begin
    Application.CreateForm(Tfrm_unidade, frm_unidade );
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

procedure Tfrm_sel_padrao_agente.btn_co_produtoClick(Sender: TObject);
begin
  with datm_sel_padrao_agente do
  begin
    Application.CreateForm(Tfrm_produto, frm_produto );
    with frm_produto do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_produto.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
      msk_cd_produtoExit(nil);
    end;
  end;
end;

procedure Tfrm_sel_padrao_agente.btn_imprimirClick(Sender: TObject);
var
  Excel, xlWorkB, oSheet: OleVariant;
  nLinha, planilha : Integer;
  nr_identificador: integer;
begin
  ActiveControl := nil;

  if ( Trim(msk_cd_unid_neg.Text) = '' ) and Not ( tp_rel in [1, 2, 3, 4, 5, 6, 7] ) then
  begin
    BoxMensagem( 'Informe uma Unidade de Negócio!', 2 );
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;

  if ( Trim(msk_cd_produto.Text) = '' ) and Not ( tp_rel in [1, 2, 3, 4, 5, 6, 7] )  then
  begin
    BoxMensagem( 'Informe um Produto!', 2 );
    msk_cd_produto.SetFocus;
    Exit;
  end;

  if ( ( Trim( msk_cd_cliente.Text ) = '' ) and ( Trim( msk_cd_grupo.Text ) = '' ) ) and Not ( tp_rel in [1, 2, 3, 4, 5, 6, 7] ) then
  begin
    BoxMensagem( 'Informe um Cliente ou Grupo!', 2 );
    msk_cd_cliente.SetFocus;
    Exit;
  end;

  if ( tp_rel in [1, 2, 3, 4, 5, 6, 7] ) then
  begin
    if msk_dt_inicio.Date = 0 then
    begin
      if ComPeriodo then BoxMensagem( 'Informe uma data de início para seleção!', 2 )
      else BoxMensagem( 'Informe uma data para seleção!', 2 );
      msk_dt_inicio.SetFocus;
      Exit;
    end;

    if ComPeriodo then
    begin
      if ( msk_dt_fim.Date = 0 ) then
      begin
        BoxMensagem('Informe uma data final para seleção!', 2);
        msk_dt_fim.SetFocus;
        Exit;
      end;

      if msk_dt_inicio.Date > msk_dt_fim.Date then
      begin
        BoxMensagem( 'Data final deve ser maior ou igual a data inicial!', 2 );
        msk_dt_inicio.SetFocus;
        Exit;
      end;
    end;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  with datm_sel_padrao_agente, crp_padrao_agente do
  begin
    Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

    case tp_rel of
      1: begin
           try
             datm_main.db_broker.StartTransaction;
             ReportName  := cDir_Rpt + '\CRES011.RPT';
             CloseStoredProc( sp_rel_cntr_origem );
             if Trim( msk_cd_unid_neg.Text ) = '' then
                sp_rel_cntr_origem.ParamByName('@cd_unid_neg').AsString := 'X'
             else
                sp_rel_cntr_origem.ParamByName('@cd_unid_neg').AsString := Trim( msk_cd_unid_neg.Text );
             if Trim( msk_cd_produto.Text ) = '' then
                sp_rel_cntr_origem.ParamByName('@cd_produto').AsString  := 'X'
             else
                sp_rel_cntr_origem.ParamByName('@cd_produto').AsString  := Trim( msk_cd_produto.Text );
             if Trim( msk_cd_grupo.Text ) = '' then
                sp_rel_cntr_origem.ParamByName('@cd_grupo').AsString    := 'X'
             else
                sp_rel_cntr_origem.ParamByName('@cd_grupo').AsString    := Trim( msk_cd_grupo.Text );
             if Trim( msk_cd_cliente.Text ) = '' then
                sp_rel_cntr_origem.ParamByName('@cd_cliente').AsString  := 'X'
             else
                sp_rel_cntr_origem.ParamByName('@cd_cliente').AsString  := Trim( msk_cd_cliente.Text );
             if Trim( msk_cd_agente.Text ) = '' then
                sp_rel_cntr_origem.ParamByName('@cd_agente').AsString   := 'X'
             else
                sp_rel_cntr_origem.ParamByName('@cd_agente').AsString   := Trim( msk_cd_agente.Text );
             sp_rel_cntr_origem.ParamByName('@dt_ini').AsDate           := msk_dt_inicio.Date;
             sp_rel_cntr_origem.ParamByName('@dt_fim').AsDate           := msk_dt_fim.Date;
             ExecStoredProc( sp_rel_cntr_origem );
             nr_identificador := sp_rel_cntr_origem.ParamByName('@nr_identificador').AsInteger;
             CloseStoredProc( sp_rel_cntr_origem );
             datm_main.db_broker.Commit;
           except
             if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
             Exit;
           end;

           Formulas[0] := 'NrIdentificador = ' + IntToStr( nr_identificador );

           if msk_dt_inicio.Date = msk_dt_fim.Date then
             ReportTitle := Trim( Caption ) + ' - ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date )
           else
             ReportTitle := Trim( Caption ) + ' - ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' a ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date );

           Screen.Cursor := crDefault;
           Application.ProcessMessages;

           Execute;

           ApagaDados( 'TREL_CNTR_ORIGEM', nr_identificador );
         end;

      2: begin
           try
             datm_main.db_broker.StartTransaction;
             ReportName  := cDir_Rpt + '\CRES013.RPT';
             CloseStoredProc( sp_rel_est_volumes );
             if Trim( msk_cd_unid_neg.Text ) = '' then
                sp_rel_est_volumes.ParamByName('@cd_unid_neg').AsString    := 'X'
             else
                sp_rel_est_volumes.ParamByName('@cd_unid_neg').AsString    := Trim( msk_cd_unid_neg.Text );
             if Trim( msk_cd_produto.Text ) = '' then
                sp_rel_est_volumes.ParamByName('@cd_produto').AsString     := 'X'
             else
                sp_rel_est_volumes.ParamByName('@cd_produto').AsString     := Trim( msk_cd_produto.Text );
             if Trim( msk_cd_grupo.Text ) = '' then
                sp_rel_est_volumes.ParamByName('@cd_grupo').AsString       := 'X'
             else
                sp_rel_est_volumes.ParamByName('@cd_grupo').AsString       := Trim( msk_cd_grupo.Text );
             if Trim( msk_cd_cliente.Text ) = '' then
                sp_rel_est_volumes.ParamByName('@cd_cliente').AsString     := 'X'
             else
                sp_rel_est_volumes.ParamByName('@cd_cliente').AsString     := Trim( msk_cd_cliente.Text );
             if Trim( msk_cd_agente.Text ) = '' then
                sp_rel_est_volumes.ParamByName('@cd_agente').AsString      := 'X'
             else
                sp_rel_est_volumes.ParamByName('@cd_agente').AsString      := Trim( msk_cd_agente.Text );
             sp_rel_est_volumes.ParamByName('@dt_ini').AsDate              := msk_dt_inicio.Date;
             sp_rel_est_volumes.ParamByName('@dt_fim').AsDate              := msk_dt_fim.Date;
             if chk_cntr.Checked then
                sp_rel_est_volumes.ParamByName('@in_cntr').AsString   := '1'
             else
                sp_rel_est_volumes.ParamByName('@in_cntr').AsString   := '0';
             if chk_carga_solta.Checked then
                sp_rel_est_volumes.ParamByName('@in_carga_solta').AsString := '1'
             else
                sp_rel_est_volumes.ParamByName('@in_carga_solta').AsString := '0';

             ExecStoredProc( sp_rel_est_volumes );
             nr_identificador := sp_rel_est_volumes.ParamByName('@nr_identificador').AsInteger;
             CloseStoredProc( sp_rel_est_volumes );
             datm_main.db_broker.Commit;
           except
             if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
             Exit;
           end;

           if chk_excel.Checked then
           begin
             GeraRelEstVolumesExcel( nr_identificador );
           end
           else
           begin
             Formulas[0] := 'NrIdentificador = ' + IntToStr( nr_identificador );

             if msk_dt_inicio.Date = msk_dt_fim.Date then
               ReportTitle := Trim( Caption ) + ' - ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date )
             else
               ReportTitle := Trim( Caption ) + ' - ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' a ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date );

             Screen.Cursor := crDefault;
             Application.ProcessMessages;

             Execute;
           end;

           ApagaDados( 'TREL_EST_VOLUMES', nr_identificador );

         end;
      3: begin
           try
             datm_main.db_broker.StartTransaction;

             CloseStoredProc( sp_rel_est_volumes_mod2 );
             if Trim( msk_cd_unid_neg.Text ) = '' then
                sp_rel_est_volumes_mod2.ParamByName('@cd_unid_neg').AsString    := 'X'
             else
                sp_rel_est_volumes_mod2.ParamByName('@cd_unid_neg').AsString    := Trim( msk_cd_unid_neg.Text );
             if Trim( msk_cd_produto.Text ) = '' then
                sp_rel_est_volumes_mod2.ParamByName('@cd_produto').AsString     := 'X'
             else
                sp_rel_est_volumes_mod2.ParamByName('@cd_produto').AsString     := Trim( msk_cd_produto.Text );
             if Trim( msk_cd_grupo.Text ) = '' then
                sp_rel_est_volumes_mod2.ParamByName('@cd_grupo').AsString       := 'X'
             else
                sp_rel_est_volumes_mod2.ParamByName('@cd_grupo').AsString       := Trim( msk_cd_grupo.Text );
             if Trim( msk_cd_cliente.Text ) = '' then
                sp_rel_est_volumes_mod2.ParamByName('@cd_cliente').AsString     := 'X'
             else
                sp_rel_est_volumes_mod2.ParamByName('@cd_cliente').AsString     := Trim( msk_cd_cliente.Text );
             if Trim( msk_cd_agente.Text ) = '' then
                sp_rel_est_volumes_mod2.ParamByName('@cd_agente').AsString      := 'X'
             else
                sp_rel_est_volumes_mod2.ParamByName('@cd_agente').AsString      := Trim( msk_cd_agente.Text );
             sp_rel_est_volumes_mod2.ParamByName('@dt_ini').AsDate              := msk_dt_inicio.Date;
             sp_rel_est_volumes_mod2.ParamByName('@dt_fim').AsDate              := msk_dt_fim.Date;
             if chk_cntr.Checked then
                sp_rel_est_volumes_mod2.ParamByName('@in_cntr').AsString   := '1'
             else
                sp_rel_est_volumes_mod2.ParamByName('@in_cntr').AsString   := '0';
             if chk_carga_solta.Checked then
                sp_rel_est_volumes_mod2.ParamByName('@in_carga_solta').AsString := '1'
             else
                sp_rel_est_volumes_mod2.ParamByName('@in_carga_solta').AsString := '0';

             ExecStoredProc( sp_rel_est_volumes_mod2 );
             nr_identificador := sp_rel_est_volumes_mod2.ParamByName('@nr_identificador').AsInteger;
             CloseStoredProc( sp_rel_est_volumes_mod2 );
             datm_main.db_broker.Commit;
           except
             if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
             Exit;
           end;
          (* if qry_rel_est_vol_mod2_.RecordCount = 0 then
             begin
               BoxMensagem ('Não há dados para esse relatório!', 3);
             end
             else
             begin *)
               if chk_excel.Checked then
                 begin
                   GeraRelEstVolumesExcelMod2( nr_identificador );
                 end
                 else
                 begin
                   qry_rel_est_vol_mod2_.Close;
                   qry_rel_est_vol_mod2_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
                   qry_rel_est_vol_mod2_.Prepare;
                   qry_rel_est_vol_mod2_.Open;

                   qry_rel_est_vol_mod2_sub_.Close;
                   qry_rel_est_vol_mod2_sub_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
                   qry_rel_est_vol_mod2_sub_.Prepare;
                   qry_rel_est_vol_mod2_sub_.Open;

                   ppSelPadraoAgente.Template.FileName         := cDir_RPT + '\RBPO008.rtm';
                   ppSelPadraoAgente.Template.LoadFromFile;
                   ppSelPadraoAgente.PrinterSetup.DocumentName := Caption;
                   ppSelPadraoAgente.DeviceType := 'Screen';

                  if msk_dt_inicio.Date = msk_dt_fim.Date then
                     ppTitulo.Caption := ppTitulo.Caption  + ' - ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date )
                   else
                     ppTitulo.Caption := ppTitulo.Caption + ' - ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' a ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date );

                   ppSelPadraoAgente.Print;
                 end;
             //end;

           ApagaDados( 'TREL_EST_VOLUMES_MOD2', nr_identificador );
         end;

      // Relação de Armazenagem/Cargas
      4: begin
           try
             datm_main.db_broker.StartTransaction;
             CloseStoredProc( sp_rel_est_armz_carga );
             if Trim( msk_cd_unid_neg.Text ) = '' then
                sp_rel_est_armz_carga.ParamByName('@cd_unid_neg').AsString    := 'X'
             else
                sp_rel_est_armz_carga.ParamByName('@cd_unid_neg').AsString    := Trim( msk_cd_unid_neg.Text );
             if Trim( msk_cd_produto.Text ) = '' then
                sp_rel_est_armz_carga.ParamByName('@cd_produto').AsString     := 'X'
             else
                sp_rel_est_armz_carga.ParamByName('@cd_produto').AsString     := Trim( msk_cd_produto.Text );
             if Trim( msk_cd_grupo.Text ) = '' then
                sp_rel_est_armz_carga.ParamByName('@cd_grupo').AsString       := 'X'
             else
                sp_rel_est_armz_carga.ParamByName('@cd_grupo').AsString       := Trim( msk_cd_grupo.Text );
             if Trim( msk_cd_cliente.Text ) = '' then
                sp_rel_est_armz_carga.ParamByName('@cd_cliente').AsString     := 'X'
             else
                sp_rel_est_armz_carga.ParamByName('@cd_cliente').AsString     := Trim( msk_cd_cliente.Text );
             if Trim( msk_cd_armazem.Text ) = '' then
                sp_rel_est_armz_carga.ParamByName('@cd_armazem').AsString      := 'X'
             else
                sp_rel_est_armz_carga.ParamByName('@cd_armazem').AsString      := Trim( msk_cd_armazem.Text );
             if Trim( msk_cd_area.Text ) = '' then
                sp_rel_est_armz_carga.ParamByName('@cd_area').AsString      := 'X'
             else
                sp_rel_est_armz_carga.ParamByName('@cd_area').AsString      := Trim( msk_cd_area.Text );
             sp_rel_est_armz_carga.ParamByName('@dt_ini').AsDate              := msk_dt_inicio.Date;
             sp_rel_est_armz_carga.ParamByName('@dt_fim').AsDate              := msk_dt_fim.Date;
             if chk_cntr.Checked then
                sp_rel_est_armz_carga.ParamByName('@in_cntr').AsString   := '1'
             else
                sp_rel_est_armz_carga.ParamByName('@in_cntr').AsString   := '0';
             if chk_carga_solta.Checked then
                sp_rel_est_armz_carga.ParamByName('@in_carga_solta').AsString := '1'
             else
                sp_rel_est_armz_carga.ParamByName('@in_carga_solta').AsString := '0';

             ExecStoredProc( sp_rel_est_armz_carga );
             nr_identificador := sp_rel_est_armz_carga.ParamByName('@nr_identificador').AsInteger;
             CloseStoredProc( sp_rel_est_armz_carga );
             datm_main.db_broker.Commit;
           except
             if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
             Exit;
           end;

           GeraRelEstArmzCargas( nr_identificador );

           ApagaDados( 'TREL_EST_ARMZ_CARGA', nr_identificador );
         end;
      // Relatório de Armazemagem e Fumigação
      5: begin
           try
             datm_main.db_broker.StartTransaction;
             CloseStoredProc( sp_rel_armaz_rem );
             if Trim( msk_cd_unid_neg.Text ) = '' then
                sp_rel_armaz_rem.ParamByName('@cd_unid_neg').AsString    := 'X'
             else
                sp_rel_armaz_rem.ParamByName('@cd_unid_neg').AsString    := Trim( msk_cd_unid_neg.Text );
             if Trim( msk_cd_produto.Text ) = '' then
                sp_rel_armaz_rem.ParamByName('@cd_produto').AsString     := 'X'
             else
                sp_rel_armaz_rem.ParamByName('@cd_produto').AsString     := Trim( msk_cd_produto.Text );
             if Trim( msk_cd_grupo.Text ) = '' then
                sp_rel_armaz_rem.ParamByName('@cd_grupo').AsString       := 'X'
             else
                sp_rel_armaz_rem.ParamByName('@cd_grupo').AsString       := Trim( msk_cd_grupo.Text );
             if Trim( msk_cd_cliente.Text ) = '' then
                sp_rel_armaz_rem.ParamByName('@cd_cliente').AsString     := 'X'
             else
                sp_rel_armaz_rem.ParamByName('@cd_cliente').AsString     := Trim( msk_cd_cliente.Text );
             if Trim( msk_cd_armazem.Text ) = '' then
                sp_rel_armaz_rem.ParamByName('@cd_armazem').AsString      := 'X'
             else
                sp_rel_armaz_rem.ParamByName('@cd_armazem').AsString      := Trim( msk_cd_armazem.Text );
             if Trim( msk_cd_agente.Text ) = '' then
                sp_rel_armaz_rem.ParamByName('@cd_agente').AsString      := 'X'
             else
                sp_rel_armaz_rem.ParamByName('@cd_agente').AsString      := Trim( msk_cd_agente.Text );
             if Trim( msk_cd_transportadora.Text ) = '' then
                sp_rel_armaz_rem.ParamByName('@cd_transportador').AsString      := 'X'
             else
                sp_rel_armaz_rem.ParamByName('@cd_transportador').AsString      := Trim( msk_cd_transportadora.Text );
             sp_rel_armaz_rem.ParamByName('@dt_inicio').AsDate           := msk_dt_inicio.Date;
             sp_rel_armaz_rem.ParamByName('@dt_fim').AsDate              := msk_dt_fim.Date;

             ExecStoredProc( sp_rel_armaz_rem );
             nr_identificador := sp_rel_armaz_rem.ParamByName('@nr_identificador').AsInteger;
             CloseStoredProc( sp_rel_armaz_rem );
             datm_main.db_broker.Commit;
           except
             if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
             Exit;
           end;

           GeraRelEstArmazRem( nr_identificador );

           ApagaDados( 'TREL_ARMAZ_REM', nr_identificador );
         end;
      // FOLLOW-UP DIÁRIO
      6: begin
           try
             datm_main.db_broker.StartTransaction;
             CloseStoredProc( sp_rel_fup_dia );
             if Trim( msk_cd_unid_neg.Text ) = '' then
                sp_rel_fup_dia.ParamByName('@cd_unid_neg').AsString    := 'X'
             else
                sp_rel_fup_dia.ParamByName('@cd_unid_neg').AsString    := Trim( msk_cd_unid_neg.Text );
             if Trim( msk_cd_produto.Text ) = '' then
                sp_rel_fup_dia.ParamByName('@cd_produto').AsString     := 'X'
             else
                sp_rel_fup_dia.ParamByName('@cd_produto').AsString     := Trim( msk_cd_produto.Text );
             if Trim( msk_cd_grupo.Text ) = '' then
                sp_rel_fup_dia.ParamByName('@cd_grupo').AsString       := 'X'
             else
                sp_rel_fup_dia.ParamByName('@cd_grupo').AsString       := Trim( msk_cd_grupo.Text );
             if Trim( msk_cd_cliente.Text ) = '' then
                sp_rel_fup_dia.ParamByName('@cd_cliente').AsString     := 'X'
             else
                sp_rel_fup_dia.ParamByName('@cd_cliente').AsString     := Trim( msk_cd_cliente.Text );
             if Trim( msk_cd_area.Text ) = '' then
                sp_rel_fup_dia.ParamByName('@cd_area').AsString        := 'X'
             else
                sp_rel_fup_dia.ParamByName('@cd_area').AsString        := Trim( msk_cd_area.Text );

             sp_rel_fup_dia.ParamByName('@cd_via_transp').AsString     := qry_via_transp_broker_CD_VIA_TRANSP.AsString;
             sp_rel_fup_dia.ParamByName('@dt_inicio').AsDate           := msk_dt_inicio.Date;
             sp_rel_fup_dia.ParamByName('@dt_fim').AsDate              := msk_dt_fim.Date;

             ExecStoredProc( sp_rel_fup_dia );
             nr_identificador := sp_rel_fup_dia.ParamByName('@nr_identificador').AsInteger;
             CloseStoredProc( sp_rel_fup_dia );
             datm_main.db_broker.Commit;
           except
             if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
             Exit;
           end;

           GeraRelFupDia( nr_identificador );

           ApagaDados( 'TREL_FUP_DIA', nr_identificador );
         end;
      // FOLLOW-UP DE PROCESSO
      7: begin
           try
             planilha := 0;
             // 1 - Processos em Desembaraço
             qry_fup_proc_.Close;
             if Trim( msk_cd_unid_neg.Text ) = '' then
                qry_fup_proc_.ParamByName('cd_unid_neg').AsString := 'X'
             else
                qry_fup_proc_.ParamByName('cd_unid_neg').AsString := Trim( msk_cd_unid_neg.Text );
             if Trim( msk_cd_produto.Text ) = '' then
                qry_fup_proc_.ParamByName('cd_produto').AsString := 'X'
             else
                qry_fup_proc_.ParamByName('cd_produto').AsString := Trim( msk_cd_produto.Text );
             if Trim( msk_cd_grupo.Text ) = '' then
                qry_fup_proc_.ParamByName('cd_grupo').AsString := 'X'
             else
                qry_fup_proc_.ParamByName('cd_grupo').AsString := Trim( msk_cd_grupo.Text );
             if Trim( msk_cd_cliente.Text ) = '' then
                qry_fup_proc_.ParamByName('cd_cliente').AsString := 'X'
             else
                qry_fup_proc_.ParamByName('cd_cliente').AsString := Trim( msk_cd_cliente.Text );
             if Trim( msk_cd_area.Text ) = '' then
                qry_fup_proc_.ParamByName('cd_area').AsString := 'X'
             else
                qry_fup_proc_.ParamByName('cd_area').AsString := Trim( msk_cd_area.Text );
             qry_fup_proc_.ParamByName('dt_base').AsDate := dt_server;
             qry_fup_proc_.Prepare;
             qry_fup_proc_.Open;

             if not qry_fup_proc_.EOF then
             begin
               planilha := 1;
               // Planilha Excel
               Excel := CreateOLEObject('Excel.Application');

                xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\REL_PROCESSO.XLS' );

                Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\REL_PROCESSO_' +
                Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');

                oSheet := Excel.WorkBooks[1].Worksheets[1];

               //filtros da planilha
               oSheet.Cells[ 02, 03 ].value := 'Unidade : ' + edt_nm_unid_neg.text;
               oSheet.Cells[ 02, 03 ].Font.Bold := True;

               if Trim( msk_cd_grupo.Text ) <> '' then
                 oSheet.Cells[ 03, 03 ].value := 'Grupo : ' + edt_nm_grupo.text
               else
                 oSheet.Cells[ 03, 03 ].value := 'Cliente : ' + edt_nm_cliente.text;

               oSheet.Cells[ 3, 3 ].Font.Bold := True;
               oSheet.Cells[ 4, 3 ].value := 'Follow-Up de Processos' ;
               oSheet.Cells[ 4, 3 ].Font.Bold := True;

               nLinha := 8;
               oSheet.Cells[ nLinha, 1 ].value := 'Processos em desembaraço ( Recepção de docto até Envio da Nota Fiscal a Transportadora )' ;
               oSheet.Cells[ nLinha, 1 ].Font.Bold := True;
               // Alimenta a planilha
               while not qry_fup_proc_.EOF do
               begin
                 nLinha := nLinha + 1;
                 oSheet.Cells[ nLinha, 1 ].value := '     ' + qry_fup_proc_NR_PROCESSO.AsString;
                 oSheet.Cells[ nLinha, 2 ].value := qry_fup_proc_CD_REFERENCIA.AsString;
                 oSheet.Cells[ nLinha, 3 ].value := qry_fup_proc_DT_REC_PO.AsString;
                 oSheet.Cells[ nLinha, 4 ].value := qry_fup_proc_PRODUTO.AsString;
                 oSheet.Cells[ nLinha, 5 ].value := qry_fup_proc_NR_VOO.AsString;
                 oSheet.Cells[ nLinha, 6 ].value := qry_fup_proc_DT_VOO.AsString;
                 oSheet.Cells[ nLinha, 7 ].value := qry_fup_proc_NAVIO.AsString;
                 oSheet.Cells[ nLinha, 8 ].value := qry_fup_proc_NR_VIAGEM.AsString;
                 oSheet.Cells[ nLinha, 9 ].value := qry_fup_proc_DT_NAVIO.AsString;
                 oSheet.Cells[ nLinha, 10 ].value := qry_fup_proc_DT_CAMBIO.AsString;
                 oSheet.Cells[ nLinha, 11 ].value := qry_fup_proc_DT_NUM.AsString;
                 oSheet.Cells[ nLinha, 12 ].value := qry_fup_proc_DT_NUM_IMP.AsString;
                 oSheet.Cells[ nLinha, 13 ].value := qry_fup_proc_DT_ORIG.AsString;
                 oSheet.Cells[ nLinha, 14 ].value := qry_fup_proc_DT_REG.AsString;
                 oSheet.Cells[ nLinha, 15 ].value := qry_fup_proc_NM_CANAL.AsString;
                 oSheet.Cells[ nLinha, 16 ].value := qry_fup_proc_DT_SOL_NF.AsString;
                 oSheet.Cells[ nLinha, 17 ].value := qry_fup_proc_DT_CI.AsString;
                 oSheet.Cells[ nLinha, 18 ].value := qry_fup_proc_TX_OBS.AsString;
                 oSheet.Rows[nLinha].RowHeight   := 12.75;
                 qry_fup_proc_.Next;
               end;
               qry_fup_proc_.Close;
             end;

             // 2 - PO aguardando documentos
             qry_fup_proc_po_.Close;
             if Trim( msk_cd_unid_neg.Text ) = '' then
                qry_fup_proc_po_.ParamByName('cd_unid_neg').AsString := 'X'
             else
                qry_fup_proc_po_.ParamByName('cd_unid_neg').AsString := Trim( msk_cd_unid_neg.Text );
             if Trim( msk_cd_produto.Text ) = '' then
                qry_fup_proc_po_.ParamByName('cd_produto').AsString := 'X'
             else
                qry_fup_proc_po_.ParamByName('cd_produto').AsString := Trim( msk_cd_produto.Text );
             if Trim( msk_cd_grupo.Text ) = '' then
                qry_fup_proc_po_.ParamByName('cd_grupo').AsString := 'X'
             else
                qry_fup_proc_po_.ParamByName('cd_grupo').AsString := Trim( msk_cd_grupo.Text );
             if Trim( msk_cd_cliente.Text ) = '' then
                qry_fup_proc_po_.ParamByName('cd_cliente').AsString := 'X'
             else
                qry_fup_proc_po_.ParamByName('cd_cliente').AsString := Trim( msk_cd_cliente.Text );
             if Trim( msk_cd_area.Text ) = '' then
                qry_fup_proc_po_.ParamByName('cd_area').AsString := 'X'
             else
                qry_fup_proc_po_.ParamByName('cd_area').AsString := Trim( msk_cd_area.Text );
             qry_fup_proc_po_.Prepare;
             qry_fup_proc_po_.Open;

             // Se query anterior do tp_rel = 7 não trouxe registros, abre planilha Excel agora
             if not qry_fup_proc_po_.EOF and ( planilha = 0 ) then
             begin
               planilha := 1;
               // Planilha Excel
               Excel := CreateOLEObject('Excel.Application');

                xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\REL_PROCESSO.XLS' );

                Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\REL_PROCESSO_' +
                Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');

                oSheet := Excel.WorkBooks[1].Worksheets[1];

               //filtros da planilha
               oSheet.Cells[ 02, 03 ].value := 'Unidade : ' + edt_nm_unid_neg.text;
               oSheet.Cells[ 02, 03 ].Font.Bold := True;

               if Trim( msk_cd_grupo.Text ) <> '' then
                 oSheet.Cells[ 03, 03 ].value := 'Grupo : ' + edt_nm_grupo.text
               else
                 oSheet.Cells[ 03, 03 ].value := 'Cliente : ' + edt_nm_cliente.text;

               oSheet.Cells[ 3, 3 ].Font.Bold := True;
               oSheet.Cells[ 4, 3 ].value := 'Follow-Up de Processos' ;
               oSheet.Cells[ 4, 3 ].Font.Bold := True;

               nLinha := 8;
             end;

             if not qry_fup_proc_po_.EOF then
             begin
               nLinha := nLinha + 2;
               oSheet.Cells[ nLinha, 1 ].value := 'P.O. Aguardando documentos para iniciar o desembaraço ( Abertura de processo até recepção de docto )' ;
               oSheet.Cells[ nLinha, 1 ].Font.Bold := True;

               nLinha := nLinha + 2;

               while not qry_fup_proc_po_.EOF do
               begin
                 nLinha := nLinha + 1;
                 oSheet.Cells[ nLinha, 1 ].value := '     ' + qry_fup_proc_po_NR_PROCESSO.AsString;
                 oSheet.Cells[ nLinha, 2 ].value := qry_fup_proc_po_CD_REFERENCIA.AsString;
                 oSheet.Cells[ nLinha, 3 ].value := qry_fup_proc_po_DT_REC_PO.AsString;
                 oSheet.Cells[ nLinha, 4 ].value := qry_fup_proc_po_PRODUTO.AsString;
                 oSheet.Cells[ nLinha, 5 ].value := qry_fup_proc_po_NR_VOO.AsString;
                 oSheet.Cells[ nLinha, 6 ].value := qry_fup_proc_po_DT_VOO.AsString;
                 oSheet.Cells[ nLinha, 7 ].value := qry_fup_proc_po_NAVIO.AsString;
                 oSheet.Cells[ nLinha, 8 ].value := qry_fup_proc_po_NR_VIAGEM.AsString;
                 oSheet.Cells[ nLinha, 9 ].value := qry_fup_proc_po_DT_NAVIO.AsString;
                 oSheet.Cells[ nLinha, 10 ].value := qry_fup_proc_po_DT_CAMBIO.AsString;
                 oSheet.Cells[ nLinha, 11 ].value := qry_fup_proc_po_DT_NUM.AsString;
                 oSheet.Cells[ nLinha, 12 ].value := qry_fup_proc_po_DT_NUM_IMP.AsString;
                 oSheet.Cells[ nLinha, 13 ].value := qry_fup_proc_po_DT_ORIG.AsString;
                 oSheet.Cells[ nLinha, 14 ].value := qry_fup_proc_po_DT_REG.AsString;
                 oSheet.Cells[ nLinha, 15 ].value := qry_fup_proc_po_NM_CANAL.AsString;
                 oSheet.Cells[ nLinha, 16 ].value := qry_fup_proc_po_DT_SOL_NF.AsString;
                 oSheet.Cells[ nLinha, 17 ].value := qry_fup_proc_po_DT_CI.AsString;
                 oSheet.Cells[ nLinha, 18 ].value := qry_fup_proc_po_TX_OBS.AsString;
                 oSheet.Rows[nLinha].RowHeight   := 12.75;
                 qry_fup_proc_po_.Next;
               end;
               qry_fup_proc_po_.Close;
             end;

             // 3 - Processos finalizados
             qry_fup_proc_fim_.Close;
             if Trim( msk_cd_unid_neg.Text ) = '' then
                qry_fup_proc_fim_.ParamByName('cd_unid_neg').AsString := 'X'
             else
                qry_fup_proc_fim_.ParamByName('cd_unid_neg').AsString := Trim( msk_cd_unid_neg.Text );
             if Trim( msk_cd_produto.Text ) = '' then
                qry_fup_proc_fim_.ParamByName('cd_produto').AsString := 'X'
             else
                qry_fup_proc_fim_.ParamByName('cd_produto').AsString := Trim( msk_cd_produto.Text );
             if Trim( msk_cd_grupo.Text ) = '' then
                qry_fup_proc_fim_.ParamByName('cd_grupo').AsString := 'X'
             else
                qry_fup_proc_fim_.ParamByName('cd_grupo').AsString := Trim( msk_cd_grupo.Text );
             if Trim( msk_cd_cliente.Text ) = '' then
                qry_fup_proc_fim_.ParamByName('cd_cliente').AsString := 'X'
             else
                qry_fup_proc_fim_.ParamByName('cd_cliente').AsString := Trim( msk_cd_cliente.Text );
             if Trim( msk_cd_area.Text ) = '' then
                qry_fup_proc_fim_.ParamByName('cd_area').AsString := 'X'
             else
                qry_fup_proc_fim_.ParamByName('cd_area').AsString := Trim( msk_cd_area.Text );
             qry_fup_proc_fim_.ParamByName('dt_base').AsDate := dt_server;
             qry_fup_proc_fim_.ParamByName('dt_inicio').AsDate := msk_dt_inicio.Date;
             qry_fup_proc_fim_.ParamByName('dt_fim').AsDate := msk_dt_fim.Date;
             qry_fup_proc_fim_.Prepare;
             qry_fup_proc_fim_.Open;

             // Se query anterior do tp_rel = 7 não trouxe registros, abre planilha Excel agora
             if not qry_fup_proc_fim_.EOF and ( planilha = 0 ) then
             begin
               planilha := 0;
               // Planilha Excel
               Excel := CreateOLEObject('Excel.Application');

                xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\REL_PROCESSO.XLS' );

                Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\REL_PROCESSO_' +
                Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');

                oSheet := Excel.WorkBooks[1].Worksheets[1];

               //filtros da planilha
               oSheet.Cells[ 02, 03 ].value := 'Unidade : ' + edt_nm_unid_neg.text;
               oSheet.Cells[ 02, 03 ].Font.Bold := True;

               if Trim( msk_cd_grupo.Text ) <> '' then
                 oSheet.Cells[ 03, 03 ].value := 'Grupo : ' + edt_nm_grupo.text
               else
                 oSheet.Cells[ 03, 03 ].value := 'Cliente : ' + edt_nm_cliente.text;

               oSheet.Cells[ 3, 3 ].Font.Bold := True;
               oSheet.Cells[ 4, 3 ].value := 'Follow-Up de Processos' ;
               oSheet.Cells[ 4, 3 ].Font.Bold := True;

               nLinha := 8;
             end;

             if not qry_fup_proc_fim_.EOF then
             begin
               nLinha := nLinha + 2;
               oSheet.Cells[ nLinha, 1 ].value := 'Processos Finalizados' ;
               oSheet.Cells[ nLinha, 1 ].Font.Bold := True;

               nLinha := nLinha + 2;

               while not qry_fup_proc_fim_.EOF do
               begin
                 nLinha := nLinha + 1;
                 oSheet.Cells[ nLinha, 1 ].value := '     ' + qry_fup_proc_fim_NR_PROCESSO.AsString;
                 oSheet.Cells[ nLinha, 2 ].value := qry_fup_proc_fim_CD_REFERENCIA.AsString;
                 oSheet.Cells[ nLinha, 3 ].value := qry_fup_proc_fim_DT_REC_PO.AsString;
                 oSheet.Cells[ nLinha, 4 ].value := qry_fup_proc_fim_PRODUTO.AsString;
                 oSheet.Cells[ nLinha, 5 ].value := qry_fup_proc_fim_NR_VOO.AsString;
                 oSheet.Cells[ nLinha, 6 ].value := qry_fup_proc_fim_DT_VOO.AsString;
                 oSheet.Cells[ nLinha, 7 ].value := qry_fup_proc_fim_NAVIO.AsString;
                 oSheet.Cells[ nLinha, 8 ].value := qry_fup_proc_fim_NR_VIAGEM.AsString;
                 oSheet.Cells[ nLinha, 9 ].value := qry_fup_proc_fim_DT_NAVIO.AsString;
                 oSheet.Cells[ nLinha, 10 ].value := qry_fup_proc_fim_DT_CAMBIO.AsString;
                 oSheet.Cells[ nLinha, 11 ].value := qry_fup_proc_fim_DT_NUM.AsString;
                 oSheet.Cells[ nLinha, 12 ].value := qry_fup_proc_fim_DT_NUM_IMP.AsString;
                 oSheet.Cells[ nLinha, 13 ].value := qry_fup_proc_fim_DT_ORIG.AsString;
                 oSheet.Cells[ nLinha, 14 ].value := qry_fup_proc_fim_DT_REG.AsString;
                 oSheet.Cells[ nLinha, 15 ].value := qry_fup_proc_fim_NM_CANAL.AsString;
                 oSheet.Cells[ nLinha, 16 ].value := qry_fup_proc_fim_DT_SOL_NF.AsString;
                 oSheet.Cells[ nLinha, 17 ].value := qry_fup_proc_fim_DT_CI.AsString;
                 oSheet.Cells[ nLinha, 18 ].value := qry_fup_proc_fim_TX_OBS.AsString;
                 oSheet.Rows[nLinha].RowHeight   := 12.75;
                 qry_fup_proc_fim_.Next;
               end;
               qry_fup_proc_fim_.Close;
             end;

             Screen.Cursor := crDefault;

             // Envia msg de sucesso
             if planilha = 1 then
             begin
               Excel.Visible := True;
               ShowMessage('Planilha gerada com sucesso');
             end
             else
               ShowMessage('Não há informações para o filtro digitado')

           except
             if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
             Exit;
           end;

           qry_fup_proc_.Close;
         end;
    end;
  end;
end;

procedure Tfrm_sel_padrao_agente.FormShow(Sender: TObject);
begin
  if ComPeriodo then
    lbl_periodo.Caption := 'Selecione um período:';

  case tp_rel of
    1 : Caption := 'Relação de Contêineres';
    2 : Caption := 'Relação de Volumes';
    3 : Caption := 'Relação de Volumes Mod.2';
    4 : Caption := 'Relação de Armazenagem/Cargas';
    5 : Caption := 'Relatório de Armazenagem e Fumigação';
    6 : Caption := 'Follow-Up Diário';
    7 : Caption := 'Follow-Up de Processo';
  end;

  with datm_sel_padrao_agente do
  begin
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_unid_neg_.Prepare;
    qry_produto_.Prepare;
    qry_unid_neg_.Open;
    qry_produto_.Open;
    qry_servico_.Close;
    qry_servico_.Prepare;
    qry_servico_.Open;
    qry_via_transp_broker_.Close;
    qry_via_transp_broker_.Prepare;
    qry_via_transp_broker_.Open;
  end;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_produtoExit(nil);

  lbl_a.Visible           := ComPeriodo;
  msk_dt_fim.Visible      := ComPeriodo;

  if tp_rel in [2, 3] then
  begin
    chk_cntr.Visible              := True;
    chk_carga_solta.Visible       := True;
    chk_excel.Visible             := True;
    frm_sel_padrao_agente.Height  := 380;
  end;

  if tp_rel = 1 then
  begin
    btn_imprimir.Top := msk_dt_fim.Top + 40;
    btn_sair.Top := btn_imprimir.Top;
    frm_sel_padrao_agente.Height := btn_sair.Top + 70;
    frm_sel_padrao_agente.Height := 380;
  end;

  if tp_rel = 7 then
    msk_dt_inicio.Date      := StrToDate( '01/' + Copy( DateToStr(dt_server), 4, 7 ) )
  else
    msk_dt_inicio.Date      := dt_server;
  msk_dt_fim.Date         := dt_server;

  if tp_rel = 4 then
  begin
    lbl_agente.Visible      := False;
    msk_cd_agente.Visible   := False;
    edt_nm_agente.Visible   := False;
    btn_co_agente.Visible   := False;
    lbl_armazem.Visible     := True;
    msk_cd_armazem.Visible  := True;
    edt_nm_armazem.Visible  := True;
    btn_co_armazem.Visible  := True;
    lbl_area.Visible        := True;
    msk_cd_area.Visible     := True;
    edt_nm_area.Visible     := True;
    btn_co_area.Visible     := True;
    chk_cntr.Visible        := True;
    chk_carga_solta.Visible := True;
    msk_dt_fim.Visible      := True;
    lbl_armazem.Top         := 166;
    msk_cd_armazem.Top      := 180;
    edt_nm_armazem.Top      := 180;
    btn_co_armazem.Top      := 180;
    lbl_area.Top            := 208;
    msk_cd_area.Top         := 220;
    edt_nm_area.Top         := 220;
    btn_co_area.Top         := 220;
    msk_cd_armazem.TabOrder := msk_cd_cliente.TabOrder + 1;
    msk_cd_area.TabOrder    := msk_cd_cliente.TabOrder + 2;
    lbl_periodo.Top         := lbl_periodo.Top + 45;
    msk_dt_inicio.Top       := msk_dt_inicio.Top + 45;
    lbl_a.Top               := lbl_a.Top + 45;
    msk_dt_fim.Top          := msk_dt_fim.Top + 45;
    chk_cntr.Top            := chk_cntr.Top + 45;
    chk_carga_solta.Top     := chk_carga_solta.Top + 45;
    btn_imprimir.Top        := btn_imprimir.Top + 30;
    btn_sair.Top            := btn_sair.Top + 30;
    chk_excel.Visible       := False;
    frm_sel_padrao_agente.Height := 405;

    chk_cntr.Visible := False;
    chk_carga_solta.Visible := False;
  end;

  if tp_rel = 5 then
  begin
    lbl_area.Visible              := False;
    msk_cd_area.Visible           := False;
    edt_nm_area.Visible           := False;
    btn_co_area.Visible           := False;
    lbl_armazem.Visible           := True;
    msk_cd_armazem.Visible        := True;
    edt_nm_armazem.Visible        := True;
    btn_co_armazem.Visible        := True;
    lbl_transportadora.Visible    := True;
    msk_cd_transportadora.Visible := True;
    edt_nm_transportadora.Visible := True;
    btn_co_transportadora.Visible := True;
    msk_dt_fim.Visible            := True;

    lbl_armazem.Top               := 166;
    msk_cd_armazem.Top            := 180;
    edt_nm_armazem.Top            := 180;
    btn_co_armazem.Top            := 180;
    lbl_agente.Top                := 208;
    msk_cd_agente.Top             := 220;
    edt_nm_agente.Top             := 220;
    btn_co_agente.Top             := 220;
    lbl_transportadora.Top        := 248;
    msk_cd_transportadora.Top     := 260;
    edt_nm_transportadora.Top     := 260;
    btn_co_transportadora.Top     := 260;

    msk_cd_armazem.TabOrder        := msk_cd_cliente.TabOrder + 1;
    msk_cd_agente.TabOrder         := msk_cd_armazem.TabOrder + 1;
    msk_cd_transportadora.TabOrder := msk_cd_agente.TabOrder + 1;
    msk_dt_inicio.TabOrder         := msk_cd_transportadora.TabOrder + 1;

    lbl_periodo.Top               := lbl_periodo.Top + 86;
    msk_dt_inicio.Top             := msk_dt_inicio.Top + 86;
    lbl_a.Top                     := lbl_a.Top + 86;
    msk_dt_fim.Top                := msk_dt_fim.Top + 86;
    btn_imprimir.Top              := btn_imprimir.Top + 70;
    btn_sair.Top                  := btn_sair.Top + 70;
    frm_sel_padrao_agente.Height  := 445;
  end;

  if tp_rel = 6 then
  begin
    lbl_agente.Visible            := False;
    msk_cd_agente.Visible         := False;
    edt_nm_agente.Visible         := False;
    btn_co_agente.Visible         := False;
    lbl_area.Visible              := True;
    msk_cd_area.Visible           := True;
    edt_nm_area.Visible           := True;
    btn_co_area.Visible           := True;
    lbl_via_transp.Visible        := True;
    dblckpbox_via_transp.Visible  := True;
    msk_dt_fim.Visible            := True;

    msk_cd_area.TabOrder          := msk_cd_cliente.TabOrder + 1;
    dblckpbox_via_transp.TabOrder := msk_cd_area.TabOrder + 1;
    msk_dt_inicio.TabOrder        := dblckpbox_via_transp.TabOrder + 1;

    lbl_area.Top                  := 166;
    msk_cd_area.Top               := 180;
    edt_nm_area.Top               := 180;
    btn_co_area.Top               := 180;
    lbl_via_transp.Top            := 206;
    dblckpbox_via_transp.Top      := 220;
    lbl_periodo.Top               := lbl_periodo.Top + 46;
    msk_dt_inicio.Top             := msk_dt_inicio.Top + 46;
    lbl_a.Top                     := lbl_a.Top + 46;
    msk_dt_fim.Top                := msk_dt_fim.Top + 46;
    btn_imprimir.Top              := btn_imprimir.Top + 20;
    btn_sair.Top                  := btn_sair.Top + 20;
    frm_sel_padrao_agente.Height  := 390;
  end;

  if tp_rel = 7 then
  begin
    lbl_agente.Visible            := False;
    msk_cd_agente.Visible         := False;
    edt_nm_agente.Visible         := False;
    btn_co_agente.Visible         := False;
    lbl_area.Visible              := True;
    msk_cd_area.Visible           := True;
    edt_nm_area.Visible           := True;
    btn_co_area.Visible           := True;
    lbl_area.Top                  := 166;
    msk_cd_area.Top               := 180;
    edt_nm_area.Top               := 180;
    btn_co_area.Top               := 180;

    frm_sel_padrao_agente.Height  := 390;
    msk_cd_area.TabOrder          := msk_cd_cliente.TabOrder + 1;
  end;

  if ( msk_cd_agente.Visible ) and ( tp_rel <> 5 )  then
    msk_dt_inicio.TabOrder := msk_cd_agente.TabOrder + 1;

  if msk_cd_area.Visible then
    msk_dt_inicio.TabOrder := msk_cd_area.TabOrder + 1;

  if tp_rel = 6   then
    msk_dt_inicio.TabOrder := dblckpbox_via_transp.TabOrder + 1;

  if tp_rel = 7   then
    msk_dt_inicio.TabOrder := msk_cd_area.TabOrder + 1;

  if msk_dt_fim.Visible then
    msk_dt_fim.TabOrder := msk_dt_inicio.TabOrder + 1;
end;

procedure Tfrm_sel_padrao_agente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  crp_padrao_agente.Free;
  with datm_sel_padrao_agente do
  begin
    qry_agente_.Close;
    qry_grupo_.Close;
    qry_cliente_.Close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_servico_.Close;
    qry_via_transp_broker_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_sel_padrao_agente.FormCreate(Sender: TObject);
begin
  // Inicializa o Data Module para Seleção de Relatórios
  Application.CreateForm( Tdatm_sel_padrao_agente, datm_sel_padrao_agente );
end;

procedure Tfrm_sel_padrao_agente.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.text = '' then
  begin
    if tp_rel = 6 then edt_nm_cliente.Text := ''
    else edt_nm_cliente.Text := 'Todos';
    Exit;
  end;
  ValCodEdt(msk_cd_cliente);
  with datm_sel_padrao_agente.qry_cliente_ do
  begin
    ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Cliente não encontrado!', 2 );
      msk_cd_cliente.Clear;
      edt_nm_cliente.Clear;
      msk_cd_cliente.SetFocus;
    end
    else edt_nm_cliente.Text:= FieldByName('AP_EMPRESA').AsString;
    Close;
  end;

  datm_sel_padrao_agente.qry_servico_.Close;
  datm_sel_padrao_agente.qry_servico_.Prepare;
  datm_sel_padrao_agente.qry_servico_.Open;
end;

procedure Tfrm_sel_padrao_agente.btn_co_clienteClick(Sender: TObject);
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

procedure Tfrm_sel_padrao_agente.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg       then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto        then btn_co_produtoClick(nil);
    if Sender = msk_cd_grupo          then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente        then btn_co_clienteClick(nil);
    if Sender = msk_cd_agente         then btn_co_agenteClick(nil);
    if Sender = msk_cd_armazem        then btn_co_armazemClick(nil);
    if Sender = msk_cd_area           then btn_co_areaClick(nil);
    if Sender = msk_cd_transportadora then btn_co_transportadoraClick(nil);
  end;
end;

procedure Tfrm_sel_padrao_agente.btn_co_grupoClick(Sender: TObject);
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

procedure Tfrm_sel_padrao_agente.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.Text = '' then
  begin
    if tp_rel = 6 then edt_nm_grupo.Text := ''
    else edt_nm_grupo.Text := 'Todos';
    Exit;
  end;
  ValCodEdt(msk_cd_grupo);
  with datm_sel_padrao_agente.qry_grupo_ do
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

  datm_sel_padrao_agente.qry_servico_.Close;
  datm_sel_padrao_agente.qry_servico_.Prepare;
  datm_sel_padrao_agente.qry_servico_.Open;
end;

procedure Tfrm_sel_padrao_agente.msk_cd_grupoChange(Sender: TObject);
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

procedure Tfrm_sel_padrao_agente.msk_cd_clienteChange(Sender: TObject);
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

procedure Tfrm_sel_padrao_agente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Close;
end;

procedure Tfrm_sel_padrao_agente.msk_cd_agenteExit(Sender: TObject);
begin
  edt_nm_agente.Clear;
  if msk_cd_agente.Text = '' then
  begin
    edt_nm_agente.Text := 'Todos';
    Exit;
  end;
  ValCodEdt( msk_cd_agente );
  with datm_sel_padrao_agente.qry_agente_ do
  begin
    Close;
    ParamByName('CD_AGENTE').AsString := msk_cd_agente.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Agente não encontrado!', 2 );
      msk_cd_agente.Clear;
      edt_nm_agente.Clear;
      msk_cd_agente.SetFocus;
    end
    else edt_nm_agente.Text:= FieldByName('NM_AGENTE').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_padrao_agente.btn_co_agenteClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ag, frm_ag);
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

procedure Tfrm_sel_padrao_agente.GeraRelEstVolumesExcel( nr_identificador : Integer );
var
  rel_cd_unid_neg, rel_cd_produto : String[2];
  rel_cd_cliente : String[5];
  rel_cd_agente : String[4];
  i: Integer;
  tx_mercadoria : AnsiString;
begin
  Application.ProcessMessages;
  with datm_sel_padrao_agente do
  begin
    cNomeTxt := cDir_Rpt + '\REL_EST_VOLUMES.TXT';
    FileMode := 2;
    try
      AssignFile( Txt, cNomeTxt );
      ReWrite( Txt );
    except
      BoxMensagem( 'Erro na criação do Arquivo!', 2 );
      Exit;
    end;

    Saida := #13#10#13#10#13#10#13#10#13#10#13#10;
    Write( Txt, Saida );
    Saida := 'Relação de Volumes;' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' a ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date ) + #13#10;
    Write( Txt, Saida );
    qry_rel_est_vol_.Close;
    qry_rel_est_vol_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
    qry_rel_est_vol_.Prepare;
    qry_rel_est_vol_.Open;

    Saida := 'Unidade: ' + qry_rel_est_vol_.FieldByName('NM_UNID_NEG').AsString + ';X' + #13#10;
    Write( Txt, Saida );
    Saida := 'Produto: ' + qry_rel_est_vol_.FieldByName('NM_PRODUTO').AsString + ';X' + #13#10;
    Write( Txt, Saida );
    Saida := 'Cliente: ' + qry_rel_est_vol_.FieldByName('NM_CLIENTE').AsString + ';X' + #13#10;
    Write( Txt, Saida );
    Saida := 'Agente: ' + qry_rel_est_vol_.FieldByName('NM_AGENTE').AsString + ';X' + #13#10;
    Write( Txt, Saida );
    Saida := 'Processo;Qtde;Volume;MLE;Moeda MLE;MLE R$;CIF R$;CIF US$;Local Origem/País Destino;Exportador/Importador;Tipo Frete;Transportador Marítimo;Armazém Descarga;Armazém Atracação;Data Desembaraço;Data Envio Nota Fiscal ao Transportador;Peso Bruto;';
    Write( Txt, Saida );
    Saida := 'Valor Frete;Moeda;Valor Frete R$;AFRMM;Liberação B/L;Taxa Desc.;Handling;Capatazia(THC Armador);THC/Terminal;Mov./Carregamento;Armazenagem' + #13#10;
    Write( Txt, Saida );
    rel_cd_unid_neg := qry_rel_est_vol_.FieldByName('CD_UNID_NEG').AsString;
    rel_cd_produto  := qry_rel_est_vol_.FieldByName('CD_PRODUTO').AsString;
    rel_cd_cliente  := qry_rel_est_vol_.FieldByName('CD_CLIENTE').AsString;
    rel_cd_agente   := qry_rel_est_vol_.FieldByName('CD_AGENTE').AsString;
    qry_rel_est_vol_.First;
    while Not qry_rel_est_vol_.EOF do
    begin
      // Unid. Negócio
      if rel_cd_unid_neg <> qry_rel_est_vol_.FieldByName('CD_UNID_NEG').AsString then
      begin
        Saida := 'Unidade: ' + qry_rel_est_vol_.FieldByName('NM_UNID_NEG').AsString + ';X' + #13#10;
        Write( Txt, Saida );
      end;
      // Produto
      if rel_cd_produto <> qry_rel_est_vol_.FieldByName('CD_PRODUTO').AsString then
      begin
        Saida := 'Produto: ' + qry_rel_est_vol_.FieldByName('NM_PRODUTO').AsString + ';X' + #13#10;
        Write( Txt, Saida );
      end;
      // Cliente
      if rel_cd_cliente <> qry_rel_est_vol_.FieldByName('CD_CLIENTE').AsString then
      begin
        Saida := 'Cliente: ' + qry_rel_est_vol_.FieldByName('NM_CLIENTE').AsString + ';X' + #13#10;
        Write( Txt, Saida );
      end;
      // Agente
      if rel_cd_agente <> qry_rel_est_vol_.FieldByName('CD_AGENTE').AsString then
      begin
        Saida := 'Agente: ' + qry_rel_est_vol_.FieldByName('NM_AGENTE').AsString + ';X' + #13#10;
        Write( Txt, Saida );
      end;
      // Processo
      Saida := Copy( qry_rel_est_vol_.FieldByName('NR_PROCESSO').AsString, 5, 14 ) + ';';
      Write( Txt, Saida );
      // Qtde.
      Saida := IntToStr( qry_rel_est_vol_.FieldByName('VL_QTDE').AsInteger ) + ';';
      Write( Txt, Saida );
      // Volume
      Saida := Trim( qry_rel_est_vol_.FieldByName('NM_VOLUME').AsString ) + ';';
      Write( Txt, Saida );
      // Valor MLE
      Saida := FormatFloat( '#0,.00', qry_rel_est_vol_.FieldByName('VL_MLE_MNEG').AsFloat ) + ';';
      Write( Txt, Saida );
      // Moeda do MLE
      Saida := Trim( qry_rel_est_vol_.FieldByName('NM_MOEDA_MLE').AsString ) + ';';
      Write( Txt, Saida );
      // Valor MLE R$
      Saida := FormatFloat( '#0,.00', qry_rel_est_vol_.FieldByName('VL_MLE_MN').AsFloat ) + ';';
      Write( Txt, Saida );
      // CIF Real
      Saida := FormatFloat( '#0,.00', qry_rel_est_vol_.FieldByName('VL_CIF_MN').AsFloat ) + ';';
      Write( Txt, Saida );
      // CIF Dolar
      Saida := FormatFloat( '#0,.00', qry_rel_est_vol_.FieldByName('VL_CIF_DOLAR').AsFloat ) + ';';
      Write( Txt, Saida );
      if ( Copy( qry_rel_est_vol_.FieldByName('NR_PROCESSO').AsString, 3, 2 ) = '01' ) or ( Copy( qry_rel_est_vol_.FieldByName('NR_PROCESSO').AsString, 3, 2 ) = '03' )  then
      begin
        // Local de Origem
        Saida := Trim( qry_rel_est_vol_.FieldByName('NM_LOCAL_ORIGEM').AsString ) + ';';
        Write( Txt, Saida );
      end
      else
      begin
        // País de Destino
        Saida := Trim( qry_rel_est_vol_.FieldByName('NM_PAIS_DESTINO').AsString ) + ';';
        Write( Txt, Saida );
      end;
      // Exportador/Importador
      Saida := Trim( qry_rel_est_vol_.FieldByName('NM_EMP_EST').AsString ) + ';';
      Write( Txt, Saida );
      // Tipo Frete
      Saida := Trim( qry_rel_est_vol_.FieldByName('NM_TP_FRETE').AsString ) + ';';
      Write( Txt, Saida );
      // Armador
      Saida := Trim( qry_rel_est_vol_.FieldByName('NM_TRANSPORTADOR').AsString ) + ';';
      Write( Txt, Saida );
      // Armazém Descarga
      Saida := Trim( qry_rel_est_vol_.FieldByName('NM_ARMAZEM_DESCARGA').AsString ) + ';';
      Write( Txt, Saida );
      // Armazém Atracação
      Saida := Trim( qry_rel_est_vol_.FieldByName('NM_ARMAZEM_ATRACACAO').AsString ) + ';';
      Write( Txt, Saida );
      // Dt. Desembaraço
      if qry_rel_est_vol_.FieldByName('DT_DESEMB').IsNull then
        Saida := ';'
      else
        Saida := FormatDateTime( FData, qry_rel_est_vol_.FieldByName('DT_DESEMB').AsDateTime ) + ';';
      Write( Txt, Saida );
      // Dt. Envio N.F. Transportador
      if qry_rel_est_vol_.FieldByName('DT_ENVIO_NF_TRANSP').IsNull then
        Saida := ';'
      else
        Saida := FormatDateTime( FData, qry_rel_est_vol_.FieldByName('DT_ENVIO_NF_TRANSP').AsDateTime ) + ';';
      Write( Txt, Saida );
      // Peso Bruto
      Saida := FormatFloat( '#0,.000', qry_rel_est_vol_.FieldByName('VL_PESO_BRUTO').AsFloat ) + ';';
      Write( Txt, Saida );
      // Valor Frete
      Saida := FormatFloat( '#0,.00', qry_rel_est_vol_.FieldByName('VL_FRETE_MNEG').AsFloat ) + ';';
      Write( Txt, Saida );
      // Moeda Frete
      Saida := Trim( qry_rel_est_vol_.FieldByName('NM_MOEDA_FRETE').AsString ) + ';';
      Write( Txt, Saida );
      // Valor Frete R$
      Saida := FormatFloat( '#0,.00', qry_rel_est_vol_.FieldByName('VL_FRETE_MN').AsFloat ) + ';';
      Write( Txt, Saida );
      // A.F.R.M.M.
      Saida := FormatFloat( '#0,.00', qry_rel_est_vol_.FieldByName('VL_AFRMM').AsFloat ) + ';';
      Write( Txt, Saida );
      // Liberação B/L
      Saida := FormatFloat( '#0,.00', qry_rel_est_vol_.FieldByName('VL_LIB_BL').AsFloat ) + ';';
      Write( Txt, Saida );
      // Taxa Desc.
      Saida := FormatFloat( '#0,.00', qry_rel_est_vol_.FieldByName('VL_TX_DESC').AsFloat ) + ';';
      Write( Txt, Saida );
      // Handling
      Saida := FormatFloat( '#0,.00', qry_rel_est_vol_.FieldByName('VL_HANDLING').AsFloat ) + ';';
      Write( Txt, Saida );
      // Capatazia (THC/Armador)
      Saida := FormatFloat( '#0,.00', qry_rel_est_vol_.FieldByName('VL_CAPATAZIA').AsFloat ) + ';';
      Write( Txt, Saida );
      // THC/Terminal
      Saida := FormatFloat( '#0,.00', qry_rel_est_vol_.FieldByName('VL_THC_TERMINAL').AsFloat ) + ';';
      Write( Txt, Saida );
      // Movimentação/Carregamento
      Saida := FormatFloat( '#0,.00', qry_rel_est_vol_.FieldByName('VL_MOV_CARREGAMENTO').AsFloat ) + ';';
      Write( Txt, Saida );
      // Armazenagem
      Saida := FormatFloat( '#0,.00', qry_rel_est_vol_.FieldByName('VL_ARMAZENAGEM').AsFloat ) + ';';
      Write( Txt, Saida );
      Saida := #13#10;
      Write( Txt, Saida );

      Saida := '';
      tx_mercadoria := qry_rel_est_vol_.FieldByName('TX_MERCADORIA').AsString;
      if Length( tx_mercadoria ) > 0 then
      begin
        for i := 0 to ( Length( tx_mercadoria ) - 1 ) do
        begin
          Saida := tx_mercadoria[i];
          Write( Txt, Saida );
        end;

        Saida := #13#10;
        Write( Txt, Saida );
      end;

      rel_cd_unid_neg := qry_rel_est_vol_.FieldByName('CD_UNID_NEG').AsString;
      rel_cd_produto  := qry_rel_est_vol_.FieldByName('CD_PRODUTO').AsString;
      rel_cd_cliente  := qry_rel_est_vol_.FieldByName('CD_CLIENTE').AsString;
      rel_cd_agente   := qry_rel_est_vol_.FieldByName('CD_AGENTE').AsString;

      qry_rel_est_vol_.Next;
    end;
    qry_rel_est_vol_.Close;

    CloseFile( Txt );

    //Fim da Geração do Arquivo
    ShellExecute( Application.Handle, 'Open', 'EXCEL.EXE', PChar( cDir_Rpt + '\REL_EST_VOLUMES.XLS' ), '', SW_MAXIMIZE );
  end;
end;

procedure Tfrm_sel_padrao_agente.GeraRelEstVolumesExcelMod2( nr_identificador : Integer );
var
  rel_cd_unid_neg, rel_cd_produto : String[2];
  rel_cd_cliente : String[5];
  rel_cd_agente : String[4];
  rel_nr_processo: String[10];
  nr_referencia: String[15];
  nm_area: String[50];
  nm_volume: String[100];
  rel_cd_servico: String[3];
begin
  Application.ProcessMessages;
  with datm_sel_padrao_agente do
  begin
    cNomeTxt := cDir_Rpt + '\REL_EST_VOLUMES_MOD2.TXT';
    FileMode := 2;
    try
      AssignFile( Txt, cNomeTxt );
      ReWrite( Txt );
    except
      BoxMensagem( 'Erro na criação do Arquivo!', 2 );
      Exit;
  end;

    Saida := #13#10#13#10#13#10#13#10#13#10#13#10;
    Write( Txt, Saida );
    Saida := 'Relação de Volumes Mod2;' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' a ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date ) + #13#10;
    Write( Txt, Saida );
    qry_rel_est_vol_mod2_.Close;
    qry_rel_est_vol_mod2_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
    qry_rel_est_vol_mod2_.Prepare;
    qry_rel_est_vol_mod2_.Open;

    Saida := 'Unidade: ' + qry_rel_est_vol_mod2_.FieldByName('NM_UNID_NEG').AsString + ';X' + #13#10;
    Write( Txt, Saida );
    Saida := 'Produto: ' + qry_rel_est_vol_mod2_.FieldByName('NM_PRODUTO').AsString + ';X' + #13#10;
    Write( Txt, Saida );
    if (Trim(edt_nm_grupo.Text) <> '') then
    begin
      Saida := 'Grupo: ' + Trim(edt_nm_grupo.Text) + ';X' + #13#10;
      Write( Txt, Saida );
    end;
    if (Trim(edt_nm_cliente.Text) <> '') then
    begin
      Saida := 'Cliente: ' + Trim(edt_nm_cliente.Text) + ';X' + #13#10;
      Write( Txt, Saida );
    end
    else
    begin
      Saida := 'Cliente: Todos' + ';X' + #13#10;
      Write( Txt, Saida );
    end;
    if (Trim(edt_nm_agente.Text) <> '') then
    begin
      Saida := 'Agente: ' + Trim(edt_nm_agente.Text) + ';X' + #13#10;
      Write( Txt, Saida );
    end
    else
    begin
      Saida := 'Agente: Todos' + ';X' + #13#10;
      Write( Txt, Saida );
    end;
    Saida := 'Processo;Agente;Serviço;Referencia;Area;Volume;Qtde;Peso Bruto;Armazém Atracação;Armazém Descarga;';
    Write( Txt, Saida );
    Saida := 'AFRMM;Liberação B/L;Taxa Desc.;Handling;Capatazia(THC Armador);THC/Terminal;Mov./Carregamento;Armazenagem;Tipo Frete;Valor Frete;Moeda;Valor R$;CIF R$;CIF US$;';
    Write( Txt, Saida );
    Saida := 'Valor IPI;Alíquota IPI(%);Regime Tributação IPI;Valor II;Alíquota II(%);Regime Tributação II;Canal;Data Chegada Navio;Data Presença de Carga;Data Registro;Data Desembaraço;Data Envio Nota Fiscal ao Transportador;' + #13#10;
    Write( Txt, Saida );
    rel_cd_unid_neg := qry_rel_est_vol_mod2_.FieldByName('CD_UNID_NEG').AsString;
    rel_cd_produto  := qry_rel_est_vol_mod2_.FieldByName('CD_PRODUTO').AsString;
    rel_cd_cliente  := qry_rel_est_vol_mod2_.FieldByName('CD_CLIENTE').AsString;
    rel_cd_agente   := qry_rel_est_vol_mod2_.FieldByName('CD_AGENTE').AsString;
    rel_cd_servico  := qry_rel_est_vol_mod2_.FieldByName('CD_SERVICO').AsString;
    qry_rel_est_vol_mod2_.First;
    while Not qry_rel_est_vol_mod2_.EOF do
    begin
      // Unid. Negócio
      if rel_cd_unid_neg <> qry_rel_est_vol_mod2_.FieldByName('CD_UNID_NEG').AsString then
      begin
        Saida := 'Unidade: ' + qry_rel_est_vol_mod2_.FieldByName('NM_UNID_NEG').AsString + ';X' + #13#10;
        Write( Txt, Saida );
      end;
      // Produto
      if rel_cd_produto <> qry_rel_est_vol_mod2_.FieldByName('CD_PRODUTO').AsString then
      begin
        Saida := 'Produto: ' + qry_rel_est_vol_mod2_.FieldByName('NM_PRODUTO').AsString + ';X' + #13#10;
        Write( Txt, Saida );
      end;
      // Cliente
      if rel_cd_cliente <> qry_rel_est_vol_mod2_.FieldByName('CD_CLIENTE').AsString then
      begin
        Saida := 'Cliente: ' + qry_rel_est_vol_mod2_.FieldByName('NM_CLIENTE').AsString + ';X' + #13#10;
        Write( Txt, Saida );
      end;
      {//Agente
      if rel_cd_agente <> qry_rel_est_vol_mod2_.FieldByName('CD_AGENTE').AsString then
      begin
        Saida := 'Agente: ' + qry_rel_est_vol_mod2_.FieldByName('NM_AGENTE').AsString + ';X' + #13#10;
        Write( Txt, Saida );
      end;
      //Serviço
      if rel_cd_servico <> Trim (qry_rel_est_vol_mod2_.FieldByName('CD_SERVICO').AsString ) then
      begin
        Saida := 'Serviço: ' + Trim (qry_rel_est_vol_mod2_.FieldByName('DS_SERVICO').AsString ) + ';X' + #13#10;
        Write( Txt, Saida );
      end;   }
      if rel_nr_processo <> qry_rel_est_vol_mod2_.FieldByName('NR_PROCESSO').AsString then
      begin
        rel_nr_processo := qry_rel_est_vol_mod2_.FieldByName('NR_PROCESSO').AsString;
        // Processo
        Saida := qry_rel_est_vol_mod2_.FieldByName('NR_PROCESSO').AsString + ';';
        Write( Txt, Saida );
        // Agente
        Saida := qry_rel_est_vol_mod2_.FieldByName('NM_AGENTE').AsString + ';';
        Write( Txt, Saida );
        // Serviço
        Saida := qry_rel_est_vol_mod2_.FieldByName('DS_SERVICO').AsString + ';';
        Write( Txt, Saida );
        //Referência
        Saida := Trim (qry_rel_est_vol_mod2_.FieldByName('CD_REFERENCIA').AsString ) + ';';
        Write( Txt, Saida );
        nr_referencia := Trim (qry_rel_est_vol_mod2_.FieldByName('CD_REFERENCIA').AsString );
        //Area
        nm_area := Trim (qry_rel_est_vol_mod2_.FieldByName('NM_AREA').AsString );
        Saida := Trim (qry_rel_est_vol_mod2_.FieldByName('NM_AREA').AsString ) + ';';
        Write( Txt, Saida );
        // Volume
        nm_volume := Trim (qry_rel_est_vol_mod2_.FieldByName('NM_VOLUME').AsString );
        Saida := Trim( qry_rel_est_vol_mod2_.FieldByName('NM_VOLUME').AsString ) + ';';
        Write( Txt, Saida );
        // Qtde.
        Saida := IntToStr( qry_rel_est_vol_mod2_.FieldByName('VL_QTDE').AsInteger ) + ';';
        Write( Txt, Saida );
        //Peso Bruto
        Saida := FormatFloat( '#0,.000', qry_rel_est_vol_mod2_.FieldByName('VL_PESO_BRUTO').AsFloat ) + ';';
        Write( Txt, Saida );
        //Armazém Atracação
        Saida := Trim( qry_rel_est_vol_mod2_.FieldByName('NM_ARMAZEM_ATRACACAO').AsString ) + ';';
        Write( Txt, Saida );
        //Armazém Descarga
        Saida := Trim( qry_rel_est_vol_mod2_.FieldByName('NM_ARMAZEM_DESCARGA').AsString ) + ';';
        Write( Txt, Saida );
        //A.F.R.M.M.
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_AFRMM').AsFloat ) + ';';
        Write( Txt, Saida );
        //Liberação B/L
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_LIB_BL').AsFloat ) + ';';
        Write( Txt, Saida );
        //Taxa Desc.
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_TX_DESC').AsFloat ) + ';';
        Write( Txt, Saida );
        //Handling
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_HANDLING').AsFloat ) + ';';
        Write( Txt, Saida );
        //Capatazia (THC/Armador)
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_CAPATAZIA').AsFloat ) + ';';
        Write( Txt, Saida );
        //THC/Terminal
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_THC_TERMINAL').AsFloat ) + ';';
        Write( Txt, Saida );
        //Movimentação/Carregamento
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_MOV_CARREGAMENTO').AsFloat ) + ';';
        Write( Txt, Saida );
        //Armazenagem
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_ARMAZENAGEM').AsFloat ) + ';';
        Write( Txt, Saida );
        //Tipo Frete
        Saida := Trim( qry_rel_est_vol_mod2_.FieldByName('NM_TP_FRETE').AsString ) + ';';
        Write( Txt, Saida );
        //Valor Frete
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_FRETE_MNEG').AsFloat ) + ';';
        Write( Txt, Saida );
        //Moeda Frete
        Saida := Trim( qry_rel_est_vol_mod2_.FieldByName('AP_MOEDA').AsString ) + ';';
        Write( Txt, Saida );
        //Valor Frete R$
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_FRETE_MN').AsFloat ) + ';';
        Write( Txt, Saida );
        // CIF Real
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_CIF_MN').AsFloat ) + ';';
        Write( Txt, Saida );
        // CIF Dolar
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_CIF_DOLAR').AsFloat ) + ';';
        Write( Txt, Saida );
        //Valor IPI
         Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_IPI_MN').AsFloat ) + ';';
        Write( Txt, Saida );
        //Valor Alíquota IPI
        Saida := Trim( qry_rel_est_vol_mod2_.FieldByName('VL_ALIQUOTA_IPI').AsString ) + ';';
        Write( Txt, Saida );
        // Regime Tributação IPI
        Saida := Trim( qry_rel_est_vol_mod2_.FieldByName('REGIME_IPI').AsString ) + ';';
        Write( Txt, Saida );
        //Valor II
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_II_MN').AsFloat ) + ';';
        Write( Txt, Saida );
        //Valor Alíquota II
        Saida := Trim( qry_rel_est_vol_mod2_.FieldByName('VL_ALIQUOTA_II').AsString ) + ';';
        Write( Txt, Saida );
        // Regime Tributação II
        Saida := Trim( qry_rel_est_vol_mod2_.FieldByName('REGIME_II').AsString ) + ';';
        Write( Txt, Saida );
        //Canal
        Saida := Trim (qry_rel_est_vol_mod2_.FieldByName('NM_CANAL').AsString ) + ';';
        Write( Txt, Saida );
        //Dt_Chegada_Navio
        Saida := ' ' + Trim (qry_rel_est_vol_mod2_.FieldByName('DT_CHEGADA_NAVIO').AsString ) + ';';
        Write( Txt, Saida );
        //Dt_Presença_Carga
        Saida := ' ' + Trim (qry_rel_est_vol_mod2_.FieldByName('DT_PRES_CARGA').AsString ) + ';';
        Write( Txt, Saida );
        //Dt_Registro
        Saida := ' ' + Trim (qry_rel_est_vol_mod2_.FieldByName('DT_REGISTRO').AsString ) + ';';
        Write( Txt, Saida );
        //Dt. Desembaraço
        if qry_rel_est_vol_mod2_.FieldByName('DT_DESEMB').IsNull then
          Saida := ';'
        else
          Saida := ' ' + FormatDateTime( FData, qry_rel_est_vol_mod2_.FieldByName('DT_DESEMB').AsDateTime ) + ';';
        Write( Txt, Saida );
        //Dt. Envio N.F. Transportador
        if qry_rel_est_vol_mod2_.FieldByName('DT_ENVIO_NF_TRANSP').IsNull then
          Saida := ';'
        else
          Saida := ' ' + FormatDateTime( FData, qry_rel_est_vol_mod2_.FieldByName('DT_ENVIO_NF_TRANSP').AsDateTime ) + ';';
        Write( Txt, Saida );

        Saida := #13#10;
        Write( Txt, Saida );

        Saida := '';
        rel_cd_unid_neg := qry_rel_est_vol_mod2_.FieldByName('CD_UNID_NEG').AsString;
        rel_cd_produto  := qry_rel_est_vol_mod2_.FieldByName('CD_PRODUTO').AsString;
        rel_cd_cliente  := qry_rel_est_vol_mod2_.FieldByName('CD_CLIENTE').AsString;
       (* rel_cd_agente   := qry_rel_est_vol_mod2_.FieldByName('CD_AGENTE').AsString;
        rel_cd_servico  := qry_rel_est_vol_mod2_.FieldByName('CD_SERVICO').AsString;*)
      end
      else
      begin
        if nr_referencia <> Trim (qry_rel_est_vol_mod2_.FieldByName('CD_REFERENCIA').AsString) then
        begin
          rel_nr_processo := qry_rel_est_vol_mod2_.FieldByName('NR_PROCESSO').AsString;

        // Processo
        Saida := qry_rel_est_vol_mod2_.FieldByName('NR_PROCESSO').AsString + ';';
        Write( Txt, Saida );
        // Agente
        Saida := qry_rel_est_vol_mod2_.FieldByName('NM_AGENTE').AsString + ';';
        Write( Txt, Saida );
        // Serviço
        Saida := qry_rel_est_vol_mod2_.FieldByName('DS_SERVICO').AsString + ';';
        Write( Txt, Saida );
        //Referência
        Saida := Trim (qry_rel_est_vol_mod2_.FieldByName('CD_REFERENCIA').AsString ) + ';';
        Write( Txt, Saida );
        nr_referencia := Trim (qry_rel_est_vol_mod2_.FieldByName('CD_REFERENCIA').AsString );
        //Area
        nm_area := Trim (qry_rel_est_vol_mod2_.FieldByName('NM_AREA').AsString );
        Saida := Trim (qry_rel_est_vol_mod2_.FieldByName('NM_AREA').AsString ) + ';';
        Write( Txt, Saida );
        // Volume
        nm_volume := Trim (qry_rel_est_vol_mod2_.FieldByName('NM_VOLUME').AsString );
        Saida := Trim( qry_rel_est_vol_mod2_.FieldByName('NM_VOLUME').AsString ) + ';';
        Write( Txt, Saida );
        // Qtde.
        Saida := IntToStr( qry_rel_est_vol_mod2_.FieldByName('VL_QTDE').AsInteger ) + ';';
        Write( Txt, Saida );
        //Peso Bruto
        Saida := FormatFloat( '#0,.000', qry_rel_est_vol_mod2_.FieldByName('VL_PESO_BRUTO').AsFloat ) + ';';
        Write( Txt, Saida );
        //Armazém Atracação
        Saida := Trim( qry_rel_est_vol_mod2_.FieldByName('NM_ARMAZEM_ATRACACAO').AsString ) + ';';
        Write( Txt, Saida );
        //Armazém Descarga
        Saida := Trim( qry_rel_est_vol_mod2_.FieldByName('NM_ARMAZEM_DESCARGA').AsString ) + ';';
        Write( Txt, Saida );
        //A.F.R.M.M.
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_AFRMM').AsFloat ) + ';';
        Write( Txt, Saida );
        //Liberação B/L
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_LIB_BL').AsFloat ) + ';';
        Write( Txt, Saida );
        //Taxa Desc.
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_TX_DESC').AsFloat ) + ';';
        Write( Txt, Saida );
        //Handling
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_HANDLING').AsFloat ) + ';';
        Write( Txt, Saida );
        //Capatazia (THC/Armador)
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_CAPATAZIA').AsFloat ) + ';';
        Write( Txt, Saida );
        //THC/Terminal
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_THC_TERMINAL').AsFloat ) + ';';
        Write( Txt, Saida );
        //Movimentação/Carregamento
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_MOV_CARREGAMENTO').AsFloat ) + ';';
        Write( Txt, Saida );
        //Armazenagem
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_ARMAZENAGEM').AsFloat ) + ';';
        Write( Txt, Saida );
        //Tipo Frete
        Saida := Trim( qry_rel_est_vol_mod2_.FieldByName('NM_TP_FRETE').AsString ) + ';';
        Write( Txt, Saida );
        //Valor Frete
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_FRETE_MNEG').AsFloat ) + ';';
        Write( Txt, Saida );
        //Moeda Frete
        Saida := Trim( qry_rel_est_vol_mod2_.FieldByName('AP_MOEDA').AsString ) + ';';
        Write( Txt, Saida );
        //Valor Frete R$
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_FRETE_MN').AsFloat ) + ';';
        Write( Txt, Saida );
        // CIF Real
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_CIF_MN').AsFloat ) + ';';
        Write( Txt, Saida );
        // CIF Dolar
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_CIF_DOLAR').AsFloat ) + ';';
        Write( Txt, Saida );
        //Valor IPI
         Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_IPI_MN').AsFloat ) + ';';
        Write( Txt, Saida );
        //Valor Alíquota IPI
        Saida := Trim( qry_rel_est_vol_mod2_.FieldByName('VL_ALIQUOTA_IPI').AsString ) + ';';
        Write( Txt, Saida );
        // Regime Tributação IPI
        Saida := Trim( qry_rel_est_vol_mod2_.FieldByName('REGIME_IPI').AsString ) + ';';
        Write( Txt, Saida );
        //Valor II
        Saida := FormatFloat( '#0,.00', qry_rel_est_vol_mod2_.FieldByName('VL_II_MN').AsFloat ) + ';';
        Write( Txt, Saida );
        //Valor Alíquota II
        Saida := Trim( qry_rel_est_vol_mod2_.FieldByName('VL_ALIQUOTA_II').AsString ) + ';';
        Write( Txt, Saida );
        // Regime Tributação II
        Saida := Trim( qry_rel_est_vol_mod2_.FieldByName('REGIME_II').AsString ) + ';';
        Write( Txt, Saida );
        //Canal
        Saida := Trim (qry_rel_est_vol_mod2_.FieldByName('NM_CANAL').AsString ) + ';';
        Write( Txt, Saida );
        //Dt_Chegada_Navio
        Saida := ' ' + Trim (qry_rel_est_vol_mod2_.FieldByName('DT_CHEGADA_NAVIO').AsString ) + ';';
        Write( Txt, Saida );
        //Dt_Presença_Carga
        Saida := ' ' + Trim (qry_rel_est_vol_mod2_.FieldByName('DT_PRES_CARGA').AsString ) + ';';
        Write( Txt, Saida );
        //Dt_Registro
        Saida := ' ' + Trim (qry_rel_est_vol_mod2_.FieldByName('DT_REGISTRO').AsString ) + ';';
        Write( Txt, Saida );
        //Dt. Desembaraço
        if qry_rel_est_vol_mod2_.FieldByName('DT_DESEMB').IsNull then
          Saida := ';'
        else
          Saida := ' ' + FormatDateTime( FData, qry_rel_est_vol_mod2_.FieldByName('DT_DESEMB').AsDateTime ) + ';';
        Write( Txt, Saida );
        //Dt. Envio N.F. Transportador
        if qry_rel_est_vol_mod2_.FieldByName('DT_ENVIO_NF_TRANSP').IsNull then
          Saida := ';'
        else
          Saida := ' ' + FormatDateTime( FData, qry_rel_est_vol_mod2_.FieldByName('DT_ENVIO_NF_TRANSP').AsDateTime ) + ';';
        Write( Txt, Saida );

        Saida := #13#10;
        Write( Txt, Saida );

        Saida := '';
        rel_cd_unid_neg := qry_rel_est_vol_mod2_.FieldByName('CD_UNID_NEG').AsString;
        rel_cd_produto  := qry_rel_est_vol_mod2_.FieldByName('CD_PRODUTO').AsString;
        rel_cd_cliente  := qry_rel_est_vol_mod2_.FieldByName('CD_CLIENTE').AsString;
         (*nr_referencia := Trim (qry_rel_est_vol_mod2_.FieldByName('CD_REFERENCIA').AsString );
            Saida := '"";"";"";' + Trim (qry_rel_est_vol_mod2_.FieldByName('CD_REFERENCIA').AsString ) + ';';
            Write( Txt, Saida );
            Saida := '"";"";"";"";"";"";"";';
            Write( Txt, Saida );
            Saida := '"";"";"";"";"";"";"";"";"";"";"";"";"";"";';
            Write( Txt, Saida );
            Saida := '"";"";"";"";"";"";"";"";"";'+ #13#10;
            Write( Txt, Saida );*)
        end;
      end;

      qry_rel_est_vol_mod2_.Next;
    end;
    qry_rel_est_vol_mod2_.Close;

    CloseFile( Txt );

    //Fim da Geração do Arquivo
    ShellExecute( Application.Handle, 'Open', 'EXCEL.EXE', PChar( cDir_Rpt + '\REL_EST_VOLUMES_MOD2.XLS' ), '', SW_MAXIMIZE );
  end;
end;

procedure Tfrm_sel_padrao_agente.msk_cd_armazemChange(Sender: TObject);
begin
  if msk_cd_armazem.Text = '' then
  begin
    btn_co_grupo.Enabled := True;
  end
  else
  begin
    btn_co_grupo.Enabled := False;
  end;
end;

procedure Tfrm_sel_padrao_agente.btn_co_armazemClick(Sender: TObject);
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

procedure Tfrm_sel_padrao_agente.btn_co_areaClick(Sender: TObject);
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

procedure Tfrm_sel_padrao_agente.msk_cd_areaExit(Sender: TObject);
begin
  edt_nm_area.Clear;
  if msk_cd_area.Text = '' then
  begin
    edt_nm_area.Text := 'Todas';
    Exit;
  end;
  ValCodEdt( msk_cd_area );
  with datm_sel_padrao_agente.qry_area_ do
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
      msk_cd_area.SetFocus;
    end
    else edt_nm_area.Text:= FieldByName('NM_AREA').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_padrao_agente.msk_cd_armazemExit(Sender: TObject);
begin
  edt_nm_armazem.Clear;
  if msk_cd_armazem.Text = '' then
  begin
    edt_nm_armazem.Text := 'Todos';
    Exit;
  end;
  ValCodEdt( msk_cd_armazem );
  with datm_sel_padrao_agente.qry_armazem_ do
  begin
    Close;
    ParamByName('CD_ARMAZEM').AsString := msk_cd_armazem.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Armazém não encontrado!', 2 );
      msk_cd_armazem.Clear;
      edt_nm_armazem.Clear;
      msk_cd_armazem.SetFocus;
    end
    else edt_nm_armazem.Text:= FieldByName('NM_ARMAZEM').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_padrao_agente.GeraRelEstArmzCargas( nr_identificador : Integer );
var
  Excel, xlWorkB, oSheet: OleVariant;
  nLinha, nCol : Integer;
  armazem : String;
begin

  Application.ProcessMessages;
  with datm_sel_padrao_agente do
  begin
    qry_rel_armz_carga_.Close;
    qry_rel_armz_carga_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
    qry_rel_armz_carga_.Prepare;
    qry_rel_armz_carga_.Open;

    if qry_rel_armz_carga_.EOF then
    begin
      BoxMensagem('Não há dados para exibir', 2)
    end
    else
    begin
      try
       Excel := CreateOLEObject('Excel.Application');

        xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\REL_ARMAZ_CARGA.XLS' );

        Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\REL_ARMAZ_CARGA_' +
        Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');

        oSheet := Excel.WorkBooks[1].Worksheets[1];
      except
        begin
          BoxMensagem('Erro na criação da Planilha.', 2) ;
          Exit;
        end
      end;

      //filtros da planilha
      oSheet.Cells[ 02, 03 ].value := 'Unidade : ' + edt_nm_unid_neg.text;
      oSheet.Cells[ 02, 03 ].Font.Bold := True;

      if Trim( msk_cd_grupo.Text ) <> '' then
        oSheet.Cells[ 03, 03 ].value := 'Grupo : ' + edt_nm_grupo.text
      else
        oSheet.Cells[ 03, 03 ].value := 'Cliente : ' + edt_nm_cliente.text;

      oSheet.Cells[ 04, 03 ].value := 'Armazenagem e Cargas' ;
      oSheet.Cells[ 03, 03 ].Font.Bold := True;
      oSheet.Cells[ 04, 03 ].Font.Bold := True;

      // Cabeçalho
      qry_cabec_.Close;
      qry_cabec_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
      qry_cabec_.ParamByName('NR_IDENTIFICADOR1').AsInteger := nr_identificador;
      qry_cabec_.Prepare;
      qry_cabec_.Open;

      nLinha := 8;
      nCol := 2;
      while not qry_cabec_.EOF do
      begin
        oSheet.Cells[ nLinha, nCol ].value := qry_cabec_MES.AsString + '/' + qry_cabec_ANO.AsString;
        nCol := nCol + 1;
        qry_cabec_.next;
      end;
      qry_cabec_.Close;

       // Alimenta a planilha
       armazem := '';
       while not qry_rel_armz_carga_.EOF do
       begin
         if armazem <> qry_rel_armz_carga_NM_ARMAZEM.AsString then
         begin
            nLinha := nLinha + 1;
            nCol := 1;
            armazem := qry_rel_armz_carga_NM_ARMAZEM.AsString;
            oSheet.Cells[ nLinha, 1 ].value := qry_rel_armz_carga_NM_ARMAZEM.AsString;
         end;
         nCol := nCol + 1;
         if ( qry_rel_armz_carga_QTDE.AsFloat ) > 0 then
           oSheet.Cells[ nLinha, nCol ].value := qry_rel_armz_carga_QTDE.AsFloat;

         nCol := nCol + 1;
         if ( qry_rel_armz_carga_ARMA.AsFloat ) > 0 then
           oSheet.Cells[ nLinha, nCol ].value := qry_rel_armz_carga_ARMA.AsFloat;

         qry_rel_armz_carga_.next;
       end;

        qry_rel_armz_carga_.close;
        Screen.Cursor := crDefault;

        Excel.Visible := True;

        // Envia msg de sucesso
        ShowMessage('Planilha gerada com sucesso');

        Screen.Cursor := crDefault;
        Application.ProcessMessages;
    end;
  end;

end;

procedure Tfrm_sel_padrao_agente.msk_cd_transportadoraExit(Sender: TObject);
begin
  edt_nm_transportadora.Clear;
  if msk_cd_transportadora.Text = '' then
  begin
    edt_nm_transportadora.Text := 'Todas';
    Exit;
  end;
  ValCodEdt( msk_cd_transportadora );
  with datm_sel_padrao_agente.qry_transportadora_ do
  begin
    Close;
    ParamByName('CD_TRANSP_ROD').AsString := msk_cd_transportadora.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Transportadora não encontrada!', 2 );
      msk_cd_transportadora.Clear;
      edt_nm_transportadora.Clear;
      msk_cd_transportadora.SetFocus;
    end
    else edt_nm_transportadora.Text:= FieldByName('AP_TRANSP_ROD').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_padrao_agente.btn_co_transportadoraClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_transp_rod, frm_transp_rod );
  with frm_transp_rod do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_transp_rod.Cons_OnLine_Texto := msk_cd_transportadora.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_transportadora.Text := frm_transp_rod.Cons_OnLine_Texto;
  end;
  msk_cd_transportadoraExit(nil);
  msk_cd_transportadora.SetFocus;
end;

procedure Tfrm_sel_padrao_agente.GeraRelEstArmazRem( nr_identificador : Integer );
var
  Excel, xlWorkB, oSheet: OleVariant;
  nLinha : Integer;
begin

  Application.ProcessMessages;
  with datm_sel_padrao_agente do
  begin
    qry_rel_armaz_rem_.Close;
    qry_rel_armaz_rem_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
    qry_rel_armaz_rem_.Prepare;
    qry_rel_armaz_rem_.Open;

    if qry_rel_armaz_rem_.EOF then
    begin
      BoxMensagem('Não há dados para exibir', 2)
    end
    else
    begin
      try
       Excel := CreateOLEObject('Excel.Application');

        xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\REL_ARMAZ_REM.XLS' );

        Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\REL_ARMAZ_REM_' +
        Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');

        oSheet := Excel.WorkBooks[1].Worksheets[1];
      except
        begin
          BoxMensagem('Erro na criação da Planilha.', 2) ;
          Exit;
        end
      end;

      //filtros da planilha
      oSheet.Cells[ 02, 03 ].value := 'Unidade : ' + edt_nm_unid_neg.text;
      oSheet.Cells[ 02, 03 ].Font.Bold := True;

      if Trim( msk_cd_grupo.Text ) <> '' then
        oSheet.Cells[ 03, 03 ].value := 'Grupo : ' + edt_nm_grupo.text
      else
        oSheet.Cells[ 03, 03 ].value := 'Cliente : ' + edt_nm_cliente.text;

      oSheet.Cells[ 04, 03 ].value := 'Armazenagem e Fumigação' ;
      oSheet.Cells[ 03, 03 ].Font.Bold := True;
      oSheet.Cells[ 04, 03 ].Font.Bold := True;

      nLinha := 8;
       // Alimenta a planilha
       while not qry_rel_armaz_rem_.EOF do
       begin
         nLinha := nLinha + 1;
         oSheet.Cells[ nLinha, 1 ].value := qry_rel_armaz_rem_NR_PROCESSO.AsString;
         oSheet.Cells[ nLinha, 2 ].value := qry_rel_armaz_rem_NM_EMPRESA.AsString;
         oSheet.Cells[ nLinha, 3 ].value := qry_rel_armaz_rem_NM_ARM_DESCARGA.AsString;
         oSheet.Cells[ nLinha, 4 ].value := qry_rel_armaz_rem_VL_ARMAZENAGEM.AsFloat;
         oSheet.Cells[ nLinha, 5 ].value := qry_rel_armaz_rem_NM_AGENTE.AsString;
         oSheet.Cells[ nLinha, 6 ].value := qry_rel_armaz_rem_NR_CONHECIMENTO.AsString;
         oSheet.Cells[ nLinha, 7 ].value := qry_rel_armaz_rem_NM_ARM_ATRACACAO.AsString;
         oSheet.Cells[ nLinha, 8 ].value := qry_rel_armaz_rem_VL_FUMIGACAO.AsFloat;
         oSheet.Cells[ nLinha, 9 ].value := qry_rel_armaz_rem_NM_EMP_FUMIGACAO.AsString;
         oSheet.Cells[ nLinha, 10 ].value := qry_rel_armaz_rem_AP_TRANSP_ROD.AsString;
         oSheet.Cells[ nLinha, 11 ].value := qry_rel_armaz_rem_NM_VOLUME.AsString;
         oSheet.Cells[ nLinha, 12 ].value := qry_rel_armaz_rem_NM_EMBALAGEM.AsString;
         oSheet.Cells[ nLinha, 13 ].value := qry_rel_armaz_rem_VL_QTDE.AsInteger;
         qry_rel_armaz_rem_.next;
       end;
       qry_rel_armaz_rem_.close;
       Screen.Cursor := crDefault;

       Excel.Visible := True;

       // Envia msg de sucesso
       ShowMessage('Planilha gerada com sucesso');

       Screen.Cursor := crDefault;
       Application.ProcessMessages;
    end;
  end;

end;

procedure Tfrm_sel_padrao_agente.GeraRelFupDia( nr_identificador : Integer );
var
  Excel, xlWorkB, oSheet: OleVariant;
  nLinha : Integer;
begin

  Application.ProcessMessages;
  with datm_sel_padrao_agente do
  begin
    qry_fup_dia_.Close;
    qry_fup_dia_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
    qry_fup_dia_.Prepare;
    qry_fup_dia_.Open;

    if qry_fup_dia_.EOF then
    begin
      BoxMensagem('Não há dados para exibir', 2)
    end
    else
    begin
      try
       Excel := CreateOLEObject('Excel.Application');

        xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\REL_FUP_DIA.XLS' );

        Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\REL_FUP_DIA_' +
        Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');

        oSheet := Excel.WorkBooks[1].Worksheets[1];
      except
        begin
          BoxMensagem('Erro na criação da Planilha.', 2) ;
          Exit;
        end
      end;

      //filtros da planilha
      oSheet.Cells[ 02, 03 ].value := 'Unidade : ' + edt_nm_unid_neg.text;
      oSheet.Cells[ 02, 03 ].Font.Bold := True;

      if Trim( msk_cd_grupo.Text ) <> '' then
        oSheet.Cells[ 03, 03 ].value := 'Grupo : ' + edt_nm_grupo.text
      else
        oSheet.Cells[ 03, 03 ].value := 'Cliente : ' + edt_nm_cliente.text;

      oSheet.Cells[ 04, 03 ].value := 'Follow-Up Diário' ;
      oSheet.Cells[ 03, 03 ].Font.Bold := True;
      oSheet.Cells[ 04, 03 ].Font.Bold := True;

      nLinha := 8;
       // Alimenta a planilha
       while not qry_fup_dia_.EOF do
       begin
         nLinha := nLinha + 1;
         oSheet.Cells[ nLinha, 1 ].value := qry_fup_dia_NR_PROCESSO.AsString;
         oSheet.Cells[ nLinha, 2 ].value := qry_fup_dia_NR_PO.AsString;
         oSheet.Cells[ nLinha, 3 ].value := qry_fup_dia_NR_FATURA.AsString;
         oSheet.Cells[ nLinha, 4 ].value := qry_fup_dia_NR_CONHECIMENTO.AsString;
         oSheet.Cells[ nLinha, 5 ].value := qry_fup_dia_NR_CERTIFICADO.AsString;
         oSheet.Cells[ nLinha, 6 ].value := qry_fup_dia_TX_MERCADORIA.AsString;
         oSheet.Cells[ nLinha, 7 ].value := qry_fup_dia_VL_QTDE.AsFloat;
         oSheet.Cells[ nLinha, 8 ].value := qry_fup_dia_NM_VOLUME.AsString;
         oSheet.Cells[ nLinha, 9 ].value := qry_fup_dia_NR_FREE.AsInteger;
         oSheet.Cells[ nLinha, 10 ].value := qry_fup_dia_NM_ARM_DESCARGA.AsString;
         if qry_via_transp_broker_CD_VIA_TRANSP.AsString = '01' then
           oSheet.Cells[ nLinha, 11 ].value := qry_fup_dia_NM_EMBARCACAO.AsString
         else
           oSheet.Cells[ nLinha, 11 ].value := qry_fup_dia_NR_VOO.AsString;
         if qry_via_transp_broker_CD_VIA_TRANSP.AsString = '01' then
           oSheet.Cells[ nLinha, 12 ].value := qry_fup_dia_DT_CHEGADA_NAVIO.AsString
         else
           oSheet.Cells[ nLinha, 12 ].value := qry_fup_dia_DT_VOO.AsString;
         oSheet.Cells[ nLinha, 13 ].value := qry_fup_dia_DT_PRES_CARGA.AsString;
         oSheet.Cells[ nLinha, 14 ].value := qry_fup_dia_DT_SOLIC_NUM.AsString;
         oSheet.Cells[ nLinha, 15 ].value := qry_fup_dia_DT_REC_NUM.AsString;
         oSheet.Cells[ nLinha, 16 ].value := qry_fup_dia_NR_DI.AsString;
         oSheet.Cells[ nLinha, 17 ].value := qry_fup_dia_DT_DI.AsString;
         oSheet.Cells[ nLinha, 18 ].value := qry_fup_dia_CANAL.AsString;
         oSheet.Cells[ nLinha, 19 ].value := qry_fup_dia_DT_DESEMB.AsString;
         oSheet.Cells[ nLinha, 20 ].value := qry_fup_dia_DT_ENT_TRANSP.AsString;
         oSheet.Cells[ nLinha, 21 ].value := qry_fup_dia_DT_TRANSP.AsString;
         oSheet.Cells[ nLinha, 22 ].value := qry_fup_dia_OBS.AsString;
         oSheet.Rows[nLinha].RowHeight   := 12.75;
         qry_fup_dia_.next;
       end;
       qry_fup_dia_.close;
       Screen.Cursor := crDefault;

       Excel.Visible := True;

       // Envia msg de sucesso
       ShowMessage('Planilha gerada com sucesso');

       Screen.Cursor := crDefault;
       Application.ProcessMessages;
    end;
  end;

end;

procedure Tfrm_sel_padrao_agente.dblckpbox_via_transpExit(Sender: TObject);
begin
   if dblckpbox_via_transp.Text = '' then
   begin
     ShowMessage('Selecione uma via de transporte');
     dblckpbox_via_transp.SetFocus;
     Exit;
   end;
end;

end.

