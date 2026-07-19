unit PGFT019;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCRPE32, StdCtrls, Mask, Buttons, ShellApi, Db, DBTables, ComCtrls,
  ExtCtrls, TeeProcs, TeEngine, Chart, Series, DBChart, QrTee, quickrpt,
  ppViewr, ComObj, Funcoes, DateUtils, DBCtrls, Excel2000, Grids, DBGrids;

type
  Tfrm_sel_unid_cli = class(TForm)
    crp_afaturar: TCrpe;
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    lbl_cd_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    edt_nm_cliente: TEdit;
    msk_cd_cliente: TMaskEdit;
    btn_iniciar: TButton;
    btn_fechar: TButton;
    lbl_periodo: TLabel;
    lbl_a: TLabel;
    lblGrupo: TLabel;
    btn_co_grupo: TSpeedButton;
    edt_nm_grupo: TEdit;
    msk_cd_grupo: TMaskEdit;
    lbl_relatorio: TLabel;
    msk_nr_relatorio: TMaskEdit;
    msk_cd_area: TMaskEdit;
    edt_nm_area: TEdit;
    btn_co_area: TSpeedButton;
    lblArea: TLabel;
    msk_dt_inicio: TDateTimePicker;
    msk_dt_fim: TDateTimePicker;
    chk_arquivo: TCheckBox;
    ppView: TppViewer;
    Button1: TButton;
    lbl_grupo_area: TLabel;
    msk_cd_grupo_area: TMaskEdit;
    chk_grafico: TCheckBox;
    cbo_lead_time: TComboBox;
    lbl_lead_time: TLabel;
    lbl_produto: TLabel;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    btn_co_produto: TSpeedButton;
    rdg_tp_processo: TRadioGroup;
    chk_completo: TCheckBox;
    chk_dias_uteis: TCheckBox;
    rdg_tipo: TRadioGroup;
    cbb_Selec: TComboBox;
    lbl_selec: TLabel;
    lbl_via_transp: TLabel;
    btn_co_via_transp: TSpeedButton;
    msk_cd_via_transp: TMaskEdit;
    edt_nm_via_transp: TEdit;
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_iniciarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_co_areaClick(Sender: TObject);
    procedure msk_cd_areaExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_via_transpClick(Sender: TObject);
    procedure msk_cd_via_transpExit(Sender: TObject);
  private
    str_cnpj :  String[14];
  public
    tp_rel : Byte;
    ComPeriodo : Boolean;
    procedure GeraArquivoRelImpCntrDemurrage(nr_identificador: Integer);
    procedure GeraExcelRelImpCntrDemurrage(nr_identificador: Integer);
    procedure GeraFluxoCaixa;
    procedure GeraDIRegistrada;
    procedure GeraDIDesembaracada;
    procedure EncheMatriz;
    // 1, 3, 4, 6, 9, 10, 12, 15, 18, 19, 20: Excluídos
    // 2 - Resumo Geral dos Processos a Serem Faturados - Cliente - Unid - Produto - Processo
    // 11 - Conta Corrente - Cliente
    // 12 - Resumo do Faturamento ==> Transferido para frm_sel_unid_cli_grupo_item
    // 13 - Exportação - Estatística Cambial
    // 14 - Fluxo de Caixa
    // 16 - Processos Faturados por Prefixo
    // 17 - Faturas, Notas Fiscais, Notas Emitidas / Canceladas
    // 21 - Exportação - Relação Embarque X Averbação
    // 22 - Saída DDImport
    // 23 - Faturamento - Relação de Notas Fiscais - Receitas
    // 24 - Relação de Contêineres X Demurrage
    // 25 - Relação de DI´s Registradas
    // 26 - Relação de DI´s Desembaraçadas
    // 27 - KPI Exportação
    // 28 - Impostos SAP
    // 29 - Relação de Canais X Mês
    // 31 - Custos ( Exportação )
    // 32 - Lead Time2

  end;

var
  Saida    : String;
  Txt      : TextFile;
  cNomeTxt : String;
  frm_sel_unid_cli: Tfrm_sel_unid_cli;

implementation

uses PGGP001, PGSM018, PGSM024, PGFT020, GSMLIB, PGGP017, PGSM119, PGSM212,
  PGSM010, ConsOnLineEx, PGSM011, PGSM026, PGDI019, KrDialog;

var
  arConta : Array[1..15] Of String[10];
  nmConta : Array[1..15] Of String[30];

  {$R *.DFM}

procedure Tfrm_sel_unid_cli.btn_cd_unid_negClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    msk_cd_unid_negExit(nil);
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    end;
  end;
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_sel_unid_cli.btn_co_clienteClick(Sender: TObject);
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

procedure Tfrm_sel_unid_cli.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.Text = '' then
  begin
    if tp_rel in [5] then
      edt_nm_unid_neg.Text := ''
    else
      edt_nm_unid_neg.Text := 'Todas';
    Exit;
  end;
  ValCodEdt(msk_cd_unid_neg);
  with datm_sel_unid_cli.qry_unid_neg_ do
  begin
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Unidade não encontrada!', 2 );
      msk_cd_unid_neg.Clear;
      edt_nm_unid_neg.Clear;
      msk_cd_unid_neg.SetFocus;
    end
    else
    begin
      edt_nm_unid_neg.Text := FieldByName('AP_UNID_NEG').AsString;
    end;
    Close;
  end;
end;

procedure Tfrm_sel_unid_cli.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if ( msk_cd_cliente.Text = '' ) and ( Not ( tp_rel in [11] ) ) then
  begin
    edt_nm_cliente.Text := 'Todos';
    Exit;
  end
  else
  begin
    edt_nm_cliente.Text := '';
  end;

  ValCodEdt(msk_cd_cliente);
  with datm_sel_unid_cli.qry_cliente_ do
  begin
    ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      if Not tp_rel in [11] then BoxMensagem( 'Cliente não encontrado!', 2 );
      msk_cd_cliente.Clear;
      edt_nm_cliente.Clear;
    end
    else
    begin
      if tp_rel in [11] then
         edt_nm_cliente.Text := FieldByName('NM_EMPRESA').AsString
      else
         edt_nm_cliente.Text := FieldByName('AP_EMPRESA').AsString;
      if Trim( FieldByName('CGC_EMPRESA').AsString ) <> '' then str_cnpj := FieldByName('CGC_EMPRESA').AsString
      else str_cnpj := '';
    end;
    Close;
  end;
end;

procedure Tfrm_sel_unid_cli.btn_iniciarClick(Sender: TObject);
var
  ArqKPI : TextFile;
  LinhaKPI, KPIPath, nr_processo, vStrAux, vEmpresa: String;
  nr_identificador, nLinha, nColuna, vCorAux, i, nCor, nLinhaTotal, vfield : Integer;
  Excel, xlWorkB, oSheet: OleVariant;
  vlTotComissao, vlTotSDA, vlTotCIF, vlTotTerminal, vlTotNormal, vlTotal : Double;
  {vlDiaRec, vlDiaPrev,} vlDiaPre, vlDiaPg, vlDiaPreTot, vlDiaPgTot : Double;
  vQryPrevisto, vQryConta, vQryContaPai, vQryContaFilho, vQryProv, vQryTransf : TQuery;
  vDtMov, vDtReg : TDateTime;
  vDiferencaDias, y, x, pull, xy : Integer;
  conta, conta_analitica, vSelec, vSSR, vSSP, vNomeItem: String;
  {vlTotArray, vlTotPArray,} vlSaidaPrevArray, vlSaidaPagArray, vlContaSaidaPrev, vlContaSaidaReal : array of Double;
  vSubTotalII, vTotalII, vSubTotalIPI, vTotalIPI, vSubTotalICMS, vTotalICMS,
  vSubTotalSCX, vTotalSCX, vSubTotalPesoLiq, vTotalPesoLiq, vSubTotalPIS, vTotalPIS,
  vSubTotalCOFINS, vTotalCOFINS: Double;

begin
  ActiveControl := nil;

  if tp_rel in [5] then
  begin
    if Trim( msk_cd_unid_neg.Text ) = '' then
    begin
      BoxMensagem( 'Informe uma Unidade de Negócio!', 2 );
      msk_cd_unid_neg.SetFocus;
      Exit;
    end;
  end;

  if tp_rel in [5] then
  begin
    if msk_dt_inicio.Date = 0 then
    begin
      BoxMensagem( 'Informe uma Data!', 2 );
      msk_dt_inicio.SetFocus;
      Exit;
    end;
  end;

  // Período
  if tp_rel in [7, 8, 11, 13, 14, 16, 17, 21, 24, 25, 26, 27, 28, 29, 30, 31] then
  begin
    if msk_dt_inicio.Date = 0 then
    begin
      BoxMensagem('Informe uma Data Inicial!', 2);
      msk_dt_inicio.SetFocus;
      Exit;
    end;
    if msk_dt_fim.Date = 0 then
    begin
      BoxMensagem('Informe uma Data Final!', 2);
      msk_dt_fim.SetFocus;
      Exit;
    end;

    if msk_dt_fim.Date < msk_dt_inicio.Date then
    begin
      BoxMensagem('Data Inicial deve ser maior que a Final!', 2);
      msk_dt_inicio.SetFocus;
      Exit;
    end;
  end;

  with crp_afaturar do
  begin
    if ComPeriodo then
    begin
      if tp_rel = 7 then
      begin
        Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
        ReportName  := cDir_Rpt + '\CRGE002.RPT';
        Formulas[0] := 'Cliente = "'+ msk_cd_cliente.Text + '"';
        Formulas[1] := 'Unidade = "'+ msk_cd_unid_neg.Text + '"';
        Formulas[2] := 'Grupo = "'+ msk_cd_Grupo.Text + '"';
        Formulas[3] := 'DataIni = '+ DataCrystal( FormatDateTime( FData, msk_dt_inicio.Date ) );
        Formulas[4] := 'DataFim = '+ DataCrystal( FormatDateTime( FData, msk_dt_fim.Date ) );

        if ( msk_dt_inicio.Date = msk_dt_fim.Date ) then
           ReportTitle := Caption + ' Dia: ' + FormatDateTime( FData, msk_dt_inicio.Date )
        else
           ReportTitle := Caption + ' Período: ' + FormatDateTime( FData, msk_dt_inicio.Date ) + ' a ' + FormatDateTime( FData, msk_dt_fim.Date );
        Execute;
      end;

      if tp_rel = 8 then
      begin
        Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
        ReportName  := cDir_Rpt + '\CRGI011.RPT';
        Formulas[0] := 'Cliente = "'+ msk_cd_cliente.Text + '"';
        Formulas[1] := 'Unidade = "'+ msk_cd_unid_neg.Text + '"';
        Formulas[2] := 'Grupo = "'+ msk_cd_Grupo.Text + '"';
        Formulas[3] := 'DataIni = '+ DataCrystal( FormatDateTime( FData, msk_dt_inicio.Date ) );
        Formulas[4] := 'DataFim = '+ DataCrystal( FormatDateTime( FData, msk_dt_fim.Date ) );

        if ( msk_dt_inicio.Date = msk_dt_fim.Date ) then
           ReportTitle := Caption + ' Dia: ' + FormatDateTime( FData, msk_dt_inicio.Date )
        else
           ReportTitle := Caption + ' Período: ' + FormatDateTime( FData, msk_dt_inicio.Date ) + ' a ' + FormatDateTime( FData, msk_dt_fim.Date );
        Execute;
      end;

      if tp_rel = 11 then
      begin
        Screen.Cursor := crHourGlass;
        Application.ProcessMessages;

        Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

        // Rodar Procedure
        with datm_sel_unid_cli do
        begin
          CloseStoredProc( sp_rel_cli_cc );
          if Trim( msk_cd_unid_neg.Text ) = '' then
            sp_rel_cli_cc.ParamByName('@cd_unid_neg').AsString  := 'X'
          else
            sp_rel_cli_cc.ParamByName('@cd_unid_neg').AsString  := Trim( msk_cd_unid_neg.Text );
          sp_rel_cli_cc.ParamByName('@dt_inicio').AsDate      := msk_dt_inicio.Date;
          sp_rel_cli_cc.ParamByName('@dt_fim').AsDate         := msk_dt_fim.Date;
          if Trim( msk_cd_grupo.Text ) = '' then
             sp_rel_cli_cc.ParamByName('@cd_grupo').AsString  := 'X'
          else
             sp_rel_cli_cc.ParamByName('@cd_grupo').AsString  := Trim( msk_cd_grupo.Text );
          if Trim( msk_cd_cliente.Text ) = '' then
             sp_rel_cli_cc.ParamByName('@cd_cliente').AsString := 'X'
          else
             sp_rel_cli_cc.ParamByName('@cd_cliente').AsString := Trim( msk_cd_cliente.Text );
          case rdg_tipo.ItemIndex of
            0 : sp_rel_cli_cc.ParamByName('@tp_rel').AsInteger := 0;
            1 : sp_rel_cli_cc.ParamByName('@tp_rel').AsInteger := 1;
            2 : sp_rel_cli_cc.ParamByName('@tp_rel').AsInteger := 2;
          end;
          ExecStoredProc( sp_rel_cli_cc );
          nr_identificador := sp_rel_cli_cc.ParamByName('@nr_identificador').AsInteger;
          CloseStoredProc( sp_rel_cli_cc );
        end;

        Formulas[0] := 'NrIdentificador = ' + IntToStr( nr_identificador );

        if Trim( msk_cd_cliente.Text ) <> '' then
        begin
          ReportName  := cDir_Rpt + '\CRFI015.RPT';
          if str_cnpj = '' then
            ReportTitle := 'C.N.P.J.:' + Space(20) + 'CLIENTE: ' + edt_nm_cliente.Text
          else
            ReportTitle := 'C.N.P.J.: ' + Copy( str_cnpj, 1, 2 ) + '.' + Copy( str_cnpj, 3, 3 ) + '.' +
                          Copy( str_cnpj, 6, 3 ) + '/' + Copy( str_cnpj, 9, 4 ) + '-' + Copy( str_cnpj, 13, 2 ) +
                          ' CLIENTE: ' + edt_nm_cliente.Text;

        end
        else
        begin
          ReportTitle := 'Contas Corrente - Grupo';
          ReportName  := cDir_Rpt + '\CRFI024.RPT';
        end;

        Screen.Cursor := crDefault;
        Application.ProcessMessages;

        Execute;

        ApagaDados( 'TREL_CC_CLI', nr_identificador );
      end;

      if tp_rel = 13 then // Exportação - Estatística Cambial
      begin
        with datm_sel_unid_cli do
        begin
          qry_rel_exp_est_cambial_.Close;
          qry_rel_exp_est_cambial_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
          qry_rel_exp_est_cambial_.ParamByName('CD_GRUPO').AsString    := Trim( msk_cd_grupo.Text );
          qry_rel_exp_est_cambial_.ParamByName('CD_CLIENTE').AsString  := Trim( msk_cd_cliente.Text );
          qry_rel_exp_est_cambial_.ParamByName('DT_INICIO').AsDate     := msk_dt_inicio.Date;
          qry_rel_exp_est_cambial_.ParamByName('DT_FIM').AsDate        := msk_dt_fim.Date;
          qry_rel_exp_est_cambial_.Prepare;
          qry_rel_exp_est_cambial_.Open;

          ppReport.Template.FileName := cDir_RPT + '\RBEXP001.RTM';
          ppReport.Template.LoadFromFile;
          pplbl_titulo.Caption       := 'Estatística Cambial - De ' + FormatDateTime( FData, msk_dt_inicio.Date ) + ' a ' + FormatDateTime( FData, msk_dt_fim.Date );
          ppReport.AllowPrintToFile  := True;
          ppReport.TextFileName      := cDir_Rpt + '\RBEXP001.PDF';
          ppReport.DeviceType        := 'Screen';
          ppReport.Print;

          qry_rel_exp_est_cambial_.Close;
        end;
      end;


      //14  Fluxo de Caixa // revisado André 10/12/2008
      if tp_rel = 14 then GeraFluxoCaixa;

      (******************************************************************************************************)
      (*
      if tp_rel = 15 then  // Fluxo de Caixa Operacional
      begin
        Screen.Cursor := crHourGlass;
        Application.ProcessMessages;

        Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
        ReportName  := cDir_Rpt + '\CRFI019.RPT';
        // Rodar Procedure
        with datm_sel_unid_cli do
        begin
          CloseStoredProc( sp_rel_fluxo_caixa_op );
          sp_rel_fluxo_caixa_op.ParamByName('@cd_unid_neg').AsString  := Trim( msk_cd_unid_neg.Text );
          sp_rel_fluxo_caixa_op.ParamByName('@cd_grupo').AsString     := Trim( msk_cd_grupo.Text );
          sp_rel_fluxo_caixa_op.ParamByName('@cd_cliente').AsString   := Trim( msk_cd_cliente.Text );
          sp_rel_fluxo_caixa_op.ParamByName('@dt_inicio').AsDate      := StrToDate( msk_dt_inicio.Text );
          sp_rel_fluxo_caixa_op.ParamByName('@dt_fim').AsDate         := StrToDate( msk_dt_fim.Text );
          ExecStoredProc( sp_rel_fluxo_caixa_op );
          nr_identificador := sp_rel_fluxo_caixa_op.ParamByName('@nr_identificador').AsInteger;
          CloseStoredProc( sp_rel_fluxo_caixa_op );
        end;

        Formulas[0] := 'NrIdentificador = ' + IntToStr( nr_identificador );

        if msk_dt_inicio.Text = msk_dt_fim.Text then
          ReportTitle := Trim( Caption ) + ' - ' + msk_dt_inicio.Text
        else
          ReportTitle := Trim( Caption ) + ' - ' + msk_dt_inicio.Text + ' a ' + msk_dt_fim.Text;

        Screen.Cursor := crDefault;
        Application.ProcessMessages;

        Execute;

        with datm_sel_unid_cli.qry_apaga_dados_ do
        begin
          SQL.Clear;
          SQL.Add( 'DELETE FROM TREL_FLUXO_CAIXA_OP WHERE NR_IDENTIFICADOR = ' + IntToStr( nr_identificador ) );
          Prepare;
          ExecSQL;

          SQL.Clear;
          SQL.Add( 'DELETE FROM TREL_FLUXO_CAIXA_OP WHERE NR_IDENTIFICADOR = ' + IntToStr( nr_identificador ) );
          Prepare;
          ExecSQL;

        end;
      end;
      *)

      // ------------------------------------------------------------------

      if tp_rel = 16 then
      begin
        Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
        ReportName  := cDir_Rpt + '\CRFT036.RPT';
        Formulas[0] := 'UnidNeg = "'+ msk_cd_unid_neg.Text + '"';
        Formulas[1] := 'Grupo = "'+ msk_cd_Grupo.Text + '"';
        Formulas[2] := 'Cliente = "'+ msk_cd_cliente.Text + '"';
        Formulas[3] := 'DataInicio = '+ DataCrystal( FormatDateTime( FData, msk_dt_inicio.Date ) );
        Formulas[4] := 'DataFim = '+ DataCrystal( FormatDateTime( FData, msk_dt_fim.Date ) );
        Formulas[5] := 'Area = "'+ msk_cd_area.text + '"';

        if ( msk_dt_inicio.Date = msk_dt_fim.Date ) then
           ReportTitle := Caption + ' Dia: ' + FormatDateTime( FData, msk_dt_inicio.Date )
        else
           ReportTitle := Caption + ' Período: ' + FormatDateTime( FData, msk_dt_inicio.Date ) + ' a ' + FormatDateTime( FData, msk_dt_fim.Date );
        Execute;
      end;

      if tp_rel = 17 then
      begin
        Screen.Cursor := crHourGlass;
        Application.ProcessMessages;

        Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
        ReportName  := cDir_Rpt + '\CRFT019.RPT';
        //Rodar Procedure
        with datm_sel_unid_cli do
        begin
          CloseStoredProc( sp_rel_emitido_cancelado );
          sp_rel_emitido_cancelado.ParamByName('@cd_unid_neg').AsString  := msk_cd_unid_neg.Text;
          sp_rel_emitido_cancelado.ParamByName('@dt_inicio').AsDate      := msk_dt_inicio.Date;
          sp_rel_emitido_cancelado.ParamByName('@dt_fim').AsDate         := msk_dt_fim.Date;
          if Trim( msk_cd_grupo.Text ) = '' then
             sp_rel_emitido_cancelado.ParamByName('@cd_grupo').AsString  := 'X'
          else
             sp_rel_emitido_cancelado.ParamByName('@cd_grupo').AsString  := Trim( msk_cd_grupo.Text );
          if Trim( msk_cd_cliente.Text ) = '' then
             sp_rel_emitido_cancelado.ParamByName('@cd_cliente').AsString := 'X'
          else
             sp_rel_emitido_cancelado.ParamByName('@cd_cliente').AsString := Trim( msk_cd_cliente.Text );
          ExecStoredProc( sp_rel_emitido_cancelado );
          nr_identificador := sp_rel_emitido_cancelado.ParamByName('@nr_identificador').AsInteger;
          CloseStoredProc( sp_rel_emitido_cancelado );
        end;

        Formulas[0] := 'NrIdentificador = ' + IntToStr( nr_identificador );
        if ( msk_dt_inicio.Date = msk_dt_fim.Date ) then
           ReportTitle := Caption + ' Dia: ' + FormatDateTime( FData, msk_dt_inicio.Date )
        else
           ReportTitle := Caption + ' Período: ' + FormatDateTime( FData, msk_dt_inicio.Date ) + ' a ' + FormatDateTime( FData, msk_dt_fim.Date );

        Screen.Cursor := crDefault;
        Application.ProcessMessages;

        Execute;

        ApagaDados( 'TREL_EMITIDO_CANCELADO', nr_identificador );
      end;

      if tp_rel = 21 then
      begin
        with datm_sel_unid_cli do
        begin
          Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
          ReportName  := cDir_Rpt + '\CREX001.RPT';
          CloseStoredProc( sp_rel_exp_emb_averb );
          if Trim( msk_cd_unid_neg.Text ) = '' then
            sp_rel_exp_emb_averb.ParamByName('@cd_unid_neg').AsString  := 'X'
          else
            sp_rel_exp_emb_averb.ParamByName('@cd_unid_neg').AsString  := msk_cd_unid_neg.Text;
          if Trim( msk_cd_grupo.Text ) = '' then
            sp_rel_exp_emb_averb.ParamByName('@cd_grupo').AsString := 'X'
          else
            sp_rel_exp_emb_averb.ParamByName('@cd_grupo').AsString := msk_cd_grupo.Text;
          if Trim( msk_cd_cliente.Text ) = '' then
            sp_rel_exp_emb_averb.ParamByName('@cd_cliente').AsString := 'X'
          else
            sp_rel_exp_emb_averb.ParamByName('@cd_cliente').AsString := msk_cd_cliente.Text;
          sp_rel_exp_emb_averb.ParamByName('@dt_ini').AsDate         := msk_dt_inicio.Date;
          sp_rel_exp_emb_averb.ParamByName('@dt_fim').AsDate         := msk_dt_fim.Date;
          ExecStoredProc( sp_rel_exp_emb_averb );
          nr_identificador := sp_rel_exp_emb_averb.ParamByName('@nr_identificador').AsInteger;
          CloseStoredProc( sp_rel_exp_emb_averb );

          Formulas[0] := 'NrIdentificador = ' + IntToStr( nr_identificador );

          Execute;

          ApagaDados( 'TREL_EXP_EMB_AVERB', nr_identificador );
        end;
      end;

      if tp_rel = 23 then // Faturamento - Relação de Notas Fiscais - Receita 
      begin
        with datm_sel_unid_cli do
        begin
          qry_rel_fat_nf_.Close;
          qry_rel_fat_nf_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
          qry_rel_fat_nf_.ParamByName('DT_INICIO').AsDate     := msk_dt_inicio.Date;
          qry_rel_fat_nf_.ParamByName('DT_FIM').AsDate        := msk_dt_fim.Date;
          qry_rel_fat_nf_.Prepare;
          qry_rel_fat_nf_.Open;

          ppReport.Template.FileName := cDir_RPT + '\RBFAT001.RTM';
          ppReport.Template.LoadFromFile;
          pplbl_titulo.Caption       := 'Relação de Notas Fiscais - Receitas - De ' + FormatDateTime( FData, msk_dt_inicio.Date ) + ' a ' + FormatDateTime( FData, msk_dt_fim.Date );
          ppReport.AllowPrintToFile  := True;
          ppReport.TextFileName      := cDir_Rpt + '\RBFAT001.PDF';
          ppReport.DeviceType        := 'Screen';
          ppReport.Print;

          qry_rel_fat_nf_.Close;
        end;
      end;

      if tp_rel = 24 then
      begin
        with datm_sel_unid_cli do
        begin
          Screen.Cursor := crHourGlass;
          Application.ProcessMessages;

          CloseStoredProc( sp_rel_imp_demurrage );
          if Trim( msk_cd_unid_neg.Text ) = '' then
            sp_rel_imp_demurrage.ParamByName('@cd_unid_neg').AsString := 'X'
          else
            sp_rel_imp_demurrage.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
          if Trim( msk_cd_grupo.Text ) = '' then
            sp_rel_imp_demurrage.ParamByName('@cd_grupo').AsString    := 'X'
          else
            sp_rel_imp_demurrage.ParamByName('@cd_grupo').AsString    := msk_cd_grupo.Text;
          if Trim( msk_cd_cliente.Text ) = '' then
            sp_rel_imp_demurrage.ParamByName('@cd_cliente').AsString  := 'X'
          else
            sp_rel_imp_demurrage.ParamByName('@cd_cliente').AsString  := msk_cd_cliente.Text;
          sp_rel_imp_demurrage.ParamByName('@dt_inicio').AsDate       := msk_dt_inicio.Date;
          sp_rel_imp_demurrage.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;
          ExecStoredProc( sp_rel_imp_demurrage );
          nr_identificador := sp_rel_imp_demurrage.ParamByName('@nr_identificador').AsInteger;
          CloseStoredProc( sp_rel_imp_demurrage );

          //GeraArquivoRelImpCntrDemurrage( nr_identificador );
          GeraExcelRelImpCntrDemurrage(nr_identificador);

          ApagaDados( 'TREL_IMP_DEMURRAGE', nr_identificador );
          ApagaDados( 'TREL_IMP_DEMURRAGE_PAGTO', nr_identificador );

          Screen.Cursor := crDefault;
          Application.ProcessMessages;
        end;
      end;

      // Importação - Relação de DI´s Registradas // Revisado - Michel - 03/02/2009
      if tp_rel = 25 then
        GeraDIRegistrada;

      // Importação - Relação de DI´s Desembaraçadas // Revisado - Michel - 03/02/2009
      if tp_rel = 26 then
        GeraDIDesembaracada;

      if tp_rel = 27 then
      begin
        with datm_sel_unid_cli do
        begin
          Screen.Cursor := crHourGlass;
          CloseStoredProc( sp_rel_kpi_exportacao );
          if Trim( msk_cd_unid_neg.Text ) = '' then
            sp_rel_kpi_exportacao.ParamByName('@cd_unid_neg').AsString  := 'X'
          else
            sp_rel_kpi_exportacao.ParamByName('@cd_unid_neg').AsString  := msk_cd_unid_neg.Text;
          if Trim( msk_cd_grupo.Text ) = '' then
            sp_rel_kpi_exportacao.ParamByName('@cd_grupo').AsString := 'X'
          else
            sp_rel_kpi_exportacao.ParamByName('@cd_grupo').AsString := msk_cd_grupo.Text;
          if Trim( msk_cd_cliente.Text ) = '' then
            sp_rel_kpi_exportacao.ParamByName('@cd_cliente').AsString := 'X'
          else
            sp_rel_kpi_exportacao.ParamByName('@cd_cliente').AsString := msk_cd_cliente.Text;
          if Trim( msk_cd_area.Text ) = '' then
            sp_rel_kpi_exportacao.ParamByName('@cd_area').AsString := 'X'
          else
            sp_rel_kpi_exportacao.ParamByName('@cd_area').AsString := msk_cd_area.Text;
          //incluído 16/01/04
          if cbo_lead_time.ItemIndex < 0 then
            sp_rel_kpi_exportacao.ParamByName('@in_lead_time').AsString := '0'
          else
            sp_rel_kpi_exportacao.ParamByName('@in_lead_time').AsString := IntToStr( cbo_lead_time.ItemIndex );

          sp_rel_kpi_exportacao.ParamByName('@dt_ini').AsDate         := msk_dt_inicio.Date;
          sp_rel_kpi_exportacao.ParamByName('@dt_fim').AsDate         := msk_dt_fim.Date;
          ExecStoredProc( sp_rel_kpi_exportacao );
          nr_identificador := sp_rel_kpi_exportacao.ParamByName('@nr_identificador').AsInteger;
          CloseStoredProc( sp_rel_kpi_exportacao );


          if nr_identificador <> 0 then
          begin
            qry_rel_kpi_exportacao_.Close;
            qry_rel_kpi_exportacao_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
            qry_rel_kpi_exportacao_.Prepare;
            qry_rel_kpi_exportacao_.Open;

            KPIPath := cDir_Rpt + '\KPI_EXP.TXT';
            FileMode := 1;
            AssignFile( ArqKPI, KPIPath );
            ReWrite( ArqKPI );

            LinhaKPI := 'Unidade:;' + qry_rel_kpi_exportacao_NM_UNID_NEG.AsString + ';' + #13#10;
            Write( ArqKPI, LinhaKPI );
            LinhaKPI := '  ' + #13#10;
            Write( ArqKPI, LinhaKPI );
            LinhaKPI := 'Nº Pedido/ Compras;Data Pedido/ Compras;Recebimento Pedido;País;Área;Cliente;Envio ao Com. Ext.;Solicitação da OV;Ordem;Data Emissão;';
            Write( ArqKPI, LinhaKPI );
            LinhaKPI := 'Data Liberação Estoque;Solicitação Remessa;Remessa;Data Emissão;Data Consolidação;';
            Write( ArqKPI, LinhaKPI );
            LinhaKPI := 'Liberação p/ Fábrica;Liberação do Processo;Nº Nota Fiscal;Data Nota Fiscal;Data Recebimento Nota Fiscal;Nº EX;MODAL;Nr Caminhão;Transporte;Previsão de Embarque;Data Dead Line Draft;Data Dead Line Carga;Desembaraço/ Conhec. Emb.;';
            Write( ArqKPI, LinhaKPI );
            LinhaKPI := 'Data do Embarque;Data Retirada BL;Data Envio Docts Cliente;Data Entrega Doct ao Câmbio;Data Averbação;Data Chegada Docts Cliente;Data de Chegada Mercadoria Cliente;Moeda;Total Fatura;INCOTERMS;Analista BASF;';
            Write( ArqKPI, LinhaKPI );
            LinhaKPI := 'Rec Pedido vs Pedido;Lib Estoque vs Rec Pedido;Solic OV vs Lib Estoque;Ordem vs Solic OV;Remessa vs Solic Remessa;Solic OV vs Remessa;Lib Fabr vs Remessa;NF vs Lib Fabr;Embarque vs Docs Câmbio;';
            Write( ArqKPI, LinhaKPI );
            LinhaKPI := 'Embarque vs Rec Pedido;Embarque vs Pedido;Lib Processo vs Lib Fabr;Embarque vs NF;Desembaraço vs NF;Desembaraço vs Recebimento NF;Embarque vs Desembarque;Averbação vs Embarque;Consolidação vs NF;';
            Write( ArqKPI, LinhaKPI );
            LinhaKPI := 'Embarque vs Consolidação;Desembaraço vs Embarque;Averbação vs Desembaraço;Ch Merc Cliente vs Desembaraço;Embarque vs Lib Estoque;Desembaraço vs Lib Estoque;';
            Write( ArqKPI, LinhaKPI );
            LinhaKPI := 'Email Liberação vs Dead Line Draft;Email Liberação vs Dead Line Carga;Email Liberação vs Desembaraço;Email Liberação vs NF (Processo);Email Liberação vs Embarque;Recebimento NF vs Dead Line Draft;';
            Write( ArqKPI, LinhaKPI );
            LinhaKPI := 'Embarque vs Retirada BL;Embarque vs Envio Doctos Cliente' + #13#10;
            Write( ArqKPI, LinhaKPI );

            While not qry_rel_kpi_exportacao_.EOF do
            begin
              LinhaKPI := qry_rel_kpi_exportacao_NR_REF_PEDIDO.AsString;

              qry_ref_cliente_.Close;
              qry_ref_cliente_.ParamByName('NR_PROCESSO').AsString := qry_rel_kpi_exportacao_NR_PROCESSO.AsString;
              qry_ref_cliente_.Prepare;
              qry_ref_cliente_.Open;

              if qry_ref_cliente_.RecordCount > 1 then
              begin
                qry_ref_cliente_.Next;
                While not qry_ref_cliente_.EOF do
                begin
                  LinhaKPI := LinhaKPI + ' / ' + qry_ref_cliente_CD_REFERENCIA.AsString;
                  qry_ref_cliente_.Next;
                 end;
              end;
              LinhaKPI := LinhaKPI + ';';

              if qry_rel_kpi_exportacao_DT_REF_PEDIDO.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_REF_PEDIDO.AsDateTime ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              if qry_rel_kpi_exportacao_DT_REC_PEDIDO.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_REC_PEDIDO.AsDateTime ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              LinhaKPI := LinhaKPI + qry_rel_kpi_exportacao_DESCRICAO.AsString + ';';
              LinhaKPI := LinhaKPI + qry_rel_kpi_exportacao_NM_AREA.AsString + ';';
              LinhaKPI := LinhaKPI + qry_rel_kpi_exportacao_NM_EMPRESA.AsString + ';';
              if qry_rel_kpi_exportacao_DT_ENV_COMEXT.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_ENV_COMEXT.AsDateTime )+ ';'
              else
                LinhaKPI := LinhaKPI + ';';
              if qry_rel_kpi_exportacao_DT_SOLIC_OV.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_SOLIC_OV.AsDateTime )+ ';'
              else
                LinhaKPI := LinhaKPI + ';';
              LinhaKPI := LinhaKPI + qry_rel_kpi_exportacao_NR_REF_ORDEM.AsString + ';';
              if qry_rel_kpi_exportacao_DT_REF_ORDEM.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_REF_ORDEM.AsDateTime ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              if qry_rel_kpi_exportacao_DT_LIB_EST.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_LIB_EST.AsDateTime ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              if qry_rel_kpi_exportacao_DT_SOLIC_REMESSA.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_SOLIC_REMESSA.AsDateTime ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              LinhaKPI := LinhaKPI + qry_rel_kpi_exportacao_NR_REF_REMESSA.AsString + ';';
              if qry_rel_kpi_exportacao_DT_REF_REMESSA.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_REF_REMESSA.AsDateTime ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              if qry_rel_kpi_exportacao_DT_CONSOLIDACAO.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_CONSOLIDACAO.AsDateTime ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              if qry_rel_kpi_exportacao_DT_LIB_FAB.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_LIB_FAB.AsDateTime ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              if qry_rel_kpi_exportacao_DT_LIB_PROC.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_LIB_PROC.AsDateTime ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              LinhaKPI := LinhaKPI + qry_rel_kpi_exportacao_NR_NF.AsString + ';';
              if qry_rel_kpi_exportacao_DT_NF.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_NF.AsDateTime ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              if qry_rel_kpi_exportacao_DT_REC_NF.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_REC_NF.AsDateTime ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              LinhaKPI := LinhaKPI + Copy( qry_rel_kpi_exportacao_NR_PROCESSO.AsString, 5, 10 ) + ';';
              LinhaKPI := LinhaKPI + qry_rel_kpi_exportacao_NM_VIA_TRANSPORTE.AsString + ';';
              LinhaKPI := LinhaKPI + qry_rel_kpi_exportacao_NR_CAMINHAO.AsString + ';';
              if length( Trim( qry_rel_kpi_exportacao_NM_EMBARCACAO.AsString ) ) > 0 then
                LinhaKPI := LinhaKPI + qry_rel_kpi_exportacao_NM_EMBARCACAO.AsString + ';'
              else
                LinhaKPI := LinhaKPI + qry_rel_kpi_exportacao_NM_TRANSP_ROD.AsString + ';';
              if qry_rel_kpi_exportacao_DT_PREV_EMB.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_PREV_EMB.AsDateTime ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';

              if qry_rel_kpi_exportacao_DT_DL_DRAFT.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_DL_DRAFT.AsDateTime ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              if qry_rel_kpi_exportacao_DT_DL_CARGA.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_DL_CARGA.AsDateTime ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';

              if qry_rel_kpi_exportacao_DT_DESEMB.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_DESEMB.AsDateTime ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              if qry_rel_kpi_exportacao_DT_EMB.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_EMB.AsDateTime ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';

              if qry_rel_kpi_exportacao_DT_RET_BL.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_RET_BL.AsDateTime ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';

              if qry_rel_kpi_exportacao_DT_ENV_DOC.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_ENV_DOC.AsDateTime ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              if qry_rel_kpi_exportacao_DT_ENT_DOC.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_ENT_DOC.AsDateTime ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              if qry_rel_kpi_exportacao_DT_AVERBACAO.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_AVERBACAO.AsDateTime ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              if qry_rel_kpi_exportacao_DT_CHEGADA_DOC.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_CHEGADA_DOC.AsDateTime ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              if qry_rel_kpi_exportacao_DT_CH_MERC.AsDateTime <> 0 then
                LinhaKPI := LinhaKPI + FormatDateTime( 'dd/mm/yyyy', qry_rel_kpi_exportacao_DT_CH_MERC.AsDateTime ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              LinhaKPI := LinhaKPI + qry_rel_kpi_exportacao_AP_MOEDA.AsString + ';';
              LinhaKPI := LinhaKPI + FormatFloat( '###,###,##0.00', qry_rel_kpi_exportacao_VL_TOTAL.AsFloat ) + ';';
              LinhaKPI := LinhaKPI + qry_rel_kpi_exportacao_CD_INCOTERM.AsString + ';';
              LinhaKPI := LinhaKPI + qry_rel_kpi_exportacao_NM_CONTATO.AsString + ';';
              // Rec Pedido vs Pedido
              if qry_rel_kpi_exportacao_NR_DIAS_REC_PED.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_REC_PED.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Lib Estoque vs Rec Pedido
              if qry_rel_kpi_exportacao_NR_DIAS_LIB_REC.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_LIB_REC.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Solic OV vs Lib Estoque
              if qry_rel_kpi_exportacao_NR_DIAS_SOLIC_LIB.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_SOLIC_LIB.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Ordem vs Solic OV
              if qry_rel_kpi_exportacao_NR_DIAS_OR_SOLIC.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_OR_SOLIC.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Remessa vs Solic Remessa
              if qry_rel_kpi_exportacao_NR_DIAS_REM_SOLIC.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_REM_SOLIC.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Solic OV vs Remessa
              if qry_rel_kpi_exportacao_NR_DIAS_SOLIC_REM.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_SOLIC_REM.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Lib Fabr vs Remessa
              if qry_rel_kpi_exportacao_NR_DIAS_LIB_REM.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_LIB_REM.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // NF vs Lib Fabr
              if qry_rel_kpi_exportacao_NR_DIAS_NF_LIB.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_NF_LIB.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Embarque vs Docs Câmbio
              if qry_rel_kpi_exportacao_NR_DIAS_DES_NF.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_DES_NF.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Embarque vs Rec Pedido
              if qry_rel_kpi_exportacao_NR_DIAS_EMB_DES.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_EMB_DES.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Embarque vs Pedido
              if qry_rel_kpi_exportacao_NR_DIAS_AV_EMB.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_AV_EMB.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Lib Processo vs Lib Fabr
              if qry_rel_kpi_exportacao_NR_DIAS_EMB_DOCS.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_EMB_DOCS.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Embarque vs NF
              if qry_rel_kpi_exportacao_NR_DIAS_EMB_REC.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_EMB_REC.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Desembaraço vs NF
              if qry_rel_kpi_exportacao_NR_DIAS_EMB_PED.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_EMB_PED.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Desembaraço vs Recebimento NF
              if qry_rel_kpi_exportacao_NR_DIAS_DES_REC.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_DES_REC.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Embarque vs Desembarque
              if qry_rel_kpi_exportacao_NR_DIAS_LIB_LIB.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_LIB_LIB.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Averbação vs Embarque
              if qry_rel_kpi_exportacao_NR_DIAS_EMB_NF.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_EMB_NF.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Consolidação vs NF
              if qry_rel_kpi_exportacao_NR_DIAS_CON_NF.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_CON_NF.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Embarque vs Consolidação
              if qry_rel_kpi_exportacao_NR_DIAS_EMB_CON.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_EMB_CON.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Desembaraco vs Embarque
              if qry_rel_kpi_exportacao_NR_DIAS_DES_EMB.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_DES_EMB.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Averbação vs Desembaraço
              if qry_rel_kpi_exportacao_NR_DIAS_AV_DES.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_AV_DES.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Ch Merc Cliente vs Desembaraco
              if qry_rel_kpi_exportacao_NR_DIAS_CH_DES.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_CH_DES.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Embarque vs Lib Estoque
              if qry_rel_kpi_exportacao_NR_DIAS_EMB_LIB.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_EMB_LIB.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Desembaraço vs Lib Estoque
              if qry_rel_kpi_exportacao_NR_DIAS_DES_LIB.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_DES_LIB.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';

              // Email Liberação vs Dead Line Draft
              if qry_rel_kpi_exportacao_NR_DIAS_LIB_DLD.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_LIB_DLD.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Email Liberação vs Dead Line Carga
              if qry_rel_kpi_exportacao_NR_DIAS_LIB_DLC.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_LIB_DLC.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Email Liberação vs Desembaraco
              if qry_rel_kpi_exportacao_NR_DIAS_LIB_DESEMB.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_LIB_DESEMB.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Email Liberação vs NF
              if qry_rel_kpi_exportacao_NR_DIAS_LIB_NF.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_LIB_NF.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Email Liberação vs Embarque
              if qry_rel_kpi_exportacao_NR_DIAS_LIB_EMB.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_LIB_EMB.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Recebimento NF vs Dead Line Draft
              if qry_rel_kpi_exportacao_NR_DIAS_NF_DLD.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_NF_DLD.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Embarque vs Retirada BL
              if qry_rel_kpi_exportacao_NR_DIAS_EMB_BL.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_EMB_BL.AsInteger ) + ';'
              else
                LinhaKPI := LinhaKPI + ';';
              // Embarque vs Envio Doctos Cliente
              if qry_rel_kpi_exportacao_NR_DIAS_EMB_DOC.AsInteger <> 0 then
                LinhaKPI := LinhaKPI + FormatFloat( '###', qry_rel_kpi_exportacao_NR_DIAS_EMB_DOC.AsInteger )
              else
                LinhaKPI := LinhaKPI;

              LinhaKPI := LinhaKPI +  #13#10;
              Write( ArqKPI, LinhaKPI );

              qry_rel_kpi_exportacao_.Next;
            end;

            qry_rel_kpi_exportacao_.Close;
            CloseFile( ArqKPI );

            // Monta planilha Excel
            ShellExecute( Application.Handle, 'Open', 'EXCEL.EXE', PChar( cDir_Rpt + '\KPI_EXP1.XLS' ), '', SW_MAXIMIZE );
            ApagaDados( 'TREL_KPI_EXPORTACAO', nr_identificador );
          end

          else
          begin
            BoxMensagem( 'Não há informações para esse cliente/período.', 3 );
          end;
          Screen.Cursor := crDefault;
        end;
      end;

      if tp_rel = 28 then //Impostos SAP
      begin
        with datm_sel_unid_cli do
        begin
          qry_rel_imp_sap_.Close;
          qry_rel_imp_sap_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
          qry_rel_imp_sap_.ParamByName('CD_GRUPO').AsString    := Trim( msk_cd_grupo.Text );
          qry_rel_imp_sap_.ParamByName('CD_CLIENTE').AsString  := Trim( msk_cd_cliente.Text );
          qry_rel_imp_sap_.ParamByName('CD_AREA').AsString     := Trim( msk_cd_area.Text );
          qry_rel_imp_sap_.ParamByName('DT_INICIO').AsString   := FormatDateTime( 'yyyymmdd', msk_dt_inicio.Date );
          qry_rel_imp_sap_.ParamByName('DT_FIM').AsString      := FormatDateTime( 'yyyymmdd', msk_dt_fim.Date );
          qry_rel_imp_sap_.Prepare;
          qry_rel_imp_sap_.Open;

          {ppReport.Template.FileName := cDir_RPT + '\RBIMP004.RTM';
          ppReport.Template.LoadFromFile;
          if msk_dt_inicio.Date = msk_dt_inicio.Date then
            pplbl_titulo.Caption       := 'Impostos SAP - Dia ' + FormatDateTime( FData, msk_dt_inicio.Date )
          else
            pplbl_titulo.Caption       := 'Impostos SAP - Período ' + FormatDateTime( FData, msk_dt_inicio.Date ) + ' a ' +
                                                                      FormatDateTime( FData, msk_dt_fim.Date );
          if Trim( msk_cd_area.Text ) <> '' then
          begin
            pplbl_titulo.Caption := pplbl_titulo.Caption + ' - ' + Trim( edt_nm_area.Text );
          end;

          ppReport.AllowPrintToFile  := True;
          ppReport.TextFileName      := cDir_Rpt + '\RBIMP004.PDF';
          ppReport.DeviceType        := 'Screen';
          ppReport.Print;}

          if qry_rel_imp_sap_.RecordCount = 0 then
          begin
            BoxMensagem('Não há dados para exibir', 2)
          end
          else
          begin
            try
              Excel := CreateOLEObject('Excel.Application');
              xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\REL_IMP_SAP.XLS' );
              Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\REL_IMP_SAP_' +
              StringReplace(DateToStr(Date), '/', '-', [rfReplaceAll]) + '.XLS');
              oSheet := Excel.WorkBooks[1].Worksheets[1];
            except
              on E: Exception do
              begin
                Warning('Erro na criação da Planilha.'+#13#10+
                        'Mensagem original:'+#13#10+
                        E.Message);
                Exit;
              end
            end;

            //oSheet.Cells[04, 'H'].Value := FormatDateTime(FData, msk_dt_inicio.Date);
            // A data comentada acima não aparece mais no relatório. É gerado apenas o do dia anterior - Michel - 21/07/2009
            nLinha := 2;

            try
              while not qry_rel_imp_sap_.Eof do
              begin
                oSheet.Cells[nLinha, 'A'].Value := qry_rel_imp_sap_NM_GRUPO.AsString;
                oSheet.Cells[nLinha, 'B'].Value := '3152296';
                oSheet.Cells[nLinha, 'C'].Value := qry_rel_imp_sap_CNPJ_EMPRESA.AsString;
                oSheet.Cells[nLinha, 'D'].Value := qry_rel_imp_sap_NR_PROCESSO.AsString;
                oSheet.Cells[nLinha, 'E'].Value := qry_rel_imp_sap_NR_DI.AsString;
                oSheet.Cells[nLinha, 'F'].Value := qry_rel_imp_sap_DT_REG_DI.AsString;
                oSheet.Cells[nLinha, 'G'].Value := qry_rel_imp_sap_NR_PEDIDO.AsString;
                oSheet.Cells[nLinha, 'H'].Value := qry_rel_imp_sap_NR_ITEM.AsString;
                oSheet.Cells[nLinha, 'I'].Value := qry_rel_imp_sap_DS_NFS.AsString;
                oSheet.Cells[nLinha, 'J'].Value := qry_rel_imp_sap_VL_II_ITEM.AsFloat;
                oSheet.Cells[nLinha, 'K'].Value := qry_rel_imp_sap_VL_IPI_ITEM.AsFloat;
                oSheet.Cells[nLinha, 'L'].Value := qry_rel_imp_sap_VL_ICMS_ITEM.AsFloat;
                oSheet.Cells[nLinha, 'M'].Value := qry_rel_imp_sap_VL_TX_SCX.AsFloat;
                oSheet.Cells[nLinha, 'N'].Value := qry_rel_imp_sap_PL_MERCADORIA.AsFloat;
                oSheet.Cells[nLinha, 'O'].Value := qry_rel_imp_sap_VL_PIS_ITEM.AsFloat;
                oSheet.Cells[nLinha, 'P'].Value := qry_rel_imp_sap_VL_COFINS_ITEM.AsFloat;
                oSheet.Cells[nLinha, 'Q'].Value := qry_rel_imp_sap_NR_DECL_IMP_PROT.AsString;
                oSheet.Cells[nLinha, 'R'].Value := qry_rel_imp_sap_UTILIZ_MAT.AsInteger;
                oSheet.Cells[nLinha, 'T'].Value := qry_rel_imp_sap_VL_ANTIDUMPING.AsFloat;  //FERNANDA 16/02/12 O_01576/12 -->>INCLUINDO LINHA PARA TAXAS ANTIDUMPING QUANDO HOUVER.
                oSheet.Cells[nLinha, 'U'].Value := qry_rel_imp_sap_VL_MULTA_LI.AsFloat;
                oSheet.Cells[nLinha, 'V'].Value := qry_rel_imp_sap_COD_MERCADORIA.AsString;
                Inc(nLinha);
                qry_rel_imp_sap_.Next;
              end;
              oSheet.Columns['A:V'].EntireColumn.AutoFit;
            except
              on E: Exception do
              begin
                MessageDlg('Erro preenchendo a planilha.' + #13 + E.Message, mtError, [mbOk], 0);
                //Break; // Break fora do loop
              end;
            end;
          end;
          xlWorkB.Save;
          Excel.Visible := True;
          qry_rel_imp_sap_.Close;
        end;
      end;

      if tp_rel = 29 then // Importação - Relação de Canais x Mês
      begin
        with datm_sel_unid_cli do
        begin
          try
            Screen.Cursor := crHourGlass;

            datm_main.db_broker.StartTransaction;
            CloseStoredProc( sp_rel_canal_mes );
            if Trim( msk_cd_unid_neg.Text ) = '' then
              sp_rel_canal_mes.ParamByName('@cd_unid_neg').AsString := 'X'
            else
              sp_rel_canal_mes.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
            if Trim( msk_cd_grupo.Text ) = '' then
              sp_rel_canal_mes.ParamByName('@cd_grupo').AsString    := 'X'
            else
              sp_rel_canal_mes.ParamByName('@cd_grupo').AsString    := msk_cd_grupo.Text;
            if Trim( msk_cd_cliente.Text ) = '' then
              sp_rel_canal_mes.ParamByName('@cd_cliente').AsString  := 'X'
            else
              sp_rel_canal_mes.ParamByName('@cd_cliente').AsString  := msk_cd_cliente.Text;
            if Trim( msk_cd_area.Text ) = '' then
              sp_rel_canal_mes.ParamByName('@cd_area').AsString     := 'X'
            else
              sp_rel_canal_mes.ParamByName('@cd_area').AsString     := msk_cd_area.Text;
            sp_rel_canal_mes.ParamByName('@dt_inicio').AsDate       := msk_dt_inicio.Date;
            sp_rel_canal_mes.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;
            ExecStoredProc( sp_rel_canal_mes );
            nr_identificador := sp_rel_canal_mes.ParamByName('@nr_identificador').AsInteger;
            CloseStoredProc( sp_rel_canal_mes );
            datm_main.db_broker.Commit;

            qry_rel_canal_mes_.Close;
            qry_rel_canal_mes_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
            qry_rel_canal_mes_.Prepare;
            qry_rel_canal_mes_.Open;

            ppReport.Template.FileName := cDir_RPT + '\RBEST003.RTM';
            ppReport.Template.LoadFromFile;

            if msk_dt_inicio.Date = msk_dt_fim.Date then
            begin
              pplbl_titulo.Caption := 'RELAÇÃO DE CANAIS EM ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date );
            end
            else
            begin
              pplbl_titulo.Caption := 'RELAÇÃO DE CANAIS NO PERÍODO DE ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) +
                                      ' A ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date );
            end;
            if chk_arquivo.Checked then
            begin
              ppReport.AllowPrintToFile  := True;
              ppReport.TextFileName      := cDir_Rpt + '\RBEST003.PDF';
              ppReport.DeviceType        := 'PDFFile';
            end
            else
            begin
              ppReport.AllowPrintToFile  := False;
              ppReport.DeviceType        := 'Screen';
            end;
            Screen.Cursor := crDefault;

            ppReport.Print;
            qry_rel_canal_mes_.Close;

            ApagaDados( 'TREL_CANAL_MES', nr_identificador );

            Screen.Cursor := crDefault;
            Application.ProcessMessages;
          except
            on E: Exception do
            begin
              if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
              TrataErro(E);
            end;
          end;
        end;
      end;

      if tp_rel = 30 then // Importação - Relação de Canais x Mês Mod.2
      begin
        with datm_sel_unid_cli do
        begin
          try
            Screen.Cursor := crHourGlass;

            datm_main.db_broker.StartTransaction;
            CloseStoredProc( sp_rel_canal_mes_mod2 );
            if Trim( msk_cd_unid_neg.Text ) = '' then
              sp_rel_canal_mes_mod2.ParamByName('@cd_unid_neg').AsString := 'X'
            else
              sp_rel_canal_mes_mod2.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
            if Trim( msk_cd_grupo.Text ) = '' then
              sp_rel_canal_mes_mod2.ParamByName('@cd_grupo').AsString    := 'X'
            else
              sp_rel_canal_mes_mod2.ParamByName('@cd_grupo').AsString    := msk_cd_grupo.Text;
            if Trim( msk_cd_cliente.Text ) = '' then
              sp_rel_canal_mes_mod2.ParamByName('@cd_cliente').AsString  := 'X'
            else
              sp_rel_canal_mes_mod2.ParamByName('@cd_cliente').AsString  := msk_cd_cliente.Text;
            if Trim( msk_cd_area.Text ) = '' then
              sp_rel_canal_mes_mod2.ParamByName('@cd_area').AsString     := 'X'
            else
            sp_rel_canal_mes_mod2.ParamByName('@cd_area').AsString     := msk_cd_area.Text;
            if Trim( msk_cd_grupo_area.Text ) = '' then
              sp_rel_canal_mes_mod2.ParamByName('@cd_grupo_area').AsString     := 'X'
            else
            sp_rel_canal_mes_mod2.ParamByName('@cd_grupo_area').AsString     := msk_cd_grupo_area.Text;
            sp_rel_canal_mes_mod2.ParamByName('@dt_inicio').AsDate       := msk_dt_inicio.Date;
            sp_rel_canal_mes_mod2.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;

            ExecStoredProc( sp_rel_canal_mes_mod2 );
            nr_identificador := sp_rel_canal_mes_mod2.ParamByName('@nr_identificador').AsInteger;
            CloseStoredProc( sp_rel_canal_mes_mod2 );
            datm_main.db_broker.Commit;

            qry_rel_canal_mes_mod2_.Close;
            qry_rel_canal_mes_mod2_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
            qry_rel_canal_mes_mod2_.Prepare;
            qry_rel_canal_mes_mod2_.Open;

            qry_rel_canal_graf_.Close;
            qry_rel_canal_graf_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
            qry_rel_canal_graf_.Prepare;
            qry_rel_canal_graf_.Open;

            if chk_grafico.Checked = True then
            begin
               ppReport.Template.FileName := cDir_RPT + '\RBEST006.RTM';
               ppReport.Template.LoadFromFile;
            end
            else
            begin
               ppReport.Template.FileName := cDir_RPT + '\RBEST005.RTM';
               ppReport.Template.LoadFromFile;

              if Trim( msk_cd_cliente.Text ) <> '' then
                ppLabel1.Text := 'Cliente: ' + edt_nm_cliente.Text else
                ppLabel1.Text := edt_nm_grupo.Text;

              if msk_dt_inicio.Date = msk_dt_fim.Date then
              begin
                pplbl_titulo.Caption := 'RELAÇÃO DE CANAIS MOD2 EM ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date );
              end
              else
              begin
                pplbl_titulo.Caption := 'RELAÇÃO DE CANAIS MOD2 NO PERÍODO DE ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) +
                                        ' A ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date );
              end;
              if chk_arquivo.Checked then
              begin
                ppReport.AllowPrintToFile  := True;
                ppReport.TextFileName      := cDir_Rpt + '\RBEST005.PDF';
                ppReport.DeviceType        := 'PDFFile';
              end
              else
              begin
                ppReport.AllowPrintToFile  := False;
                ppReport.DeviceType        := 'Screen';
              end;
            end;
            Screen.Cursor := crDefault;

            ppReport.Print;
            qry_rel_canal_mes_mod2_.Close;

            ApagaDados( 'TREL_CANAL_MES_MOD2', nr_identificador );
            ApagaDados( 'TREL_CANAL_GRAF', nr_identificador );

            Screen.Cursor := crDefault;
            Application.ProcessMessages;
          except
            on E: Exception do
            begin
              if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
              TrataErro(E);
            end;
          end;
        end;
      end;
      //
      if tp_rel = 31 then // Exportação - Custos
      begin
        with datm_sel_unid_cli do
        begin
          try
            Screen.Cursor := crHourGlass;

            datm_main.db_broker.StartTransaction;
            CloseStoredProc( sp_rel_custos_bsh );
            if Trim( msk_cd_unid_neg.Text ) = '' then
              sp_rel_custos_bsh.ParamByName('@cd_unid_neg').AsString := 'X'
            else
              sp_rel_custos_bsh.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
            if Trim( msk_cd_produto.Text ) = '' then
              sp_rel_custos_bsh.ParamByName('@cd_produto').AsString := 'X'
            else
              sp_rel_custos_bsh.ParamByName('@cd_produto').AsString := msk_cd_produto.Text;
            if Trim( msk_cd_grupo.Text ) = '' then
              sp_rel_custos_bsh.ParamByName('@cd_grupo').AsString    := 'X'
            else
              sp_rel_custos_bsh.ParamByName('@cd_grupo').AsString    := msk_cd_grupo.Text;
            if Trim( msk_cd_cliente.Text ) = '' then
              sp_rel_custos_bsh.ParamByName('@cd_cliente').AsString  := 'X'
            else
              sp_rel_custos_bsh.ParamByName('@cd_cliente').AsString  := msk_cd_cliente.Text;
            sp_rel_custos_bsh.ParamByName('@dt_inicio').AsDate       := msk_dt_inicio.Date;
            sp_rel_custos_bsh.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;

            ExecStoredProc( sp_rel_custos_bsh );
            nr_identificador := sp_rel_custos_bsh.ParamByName('@nr_identificador').AsInteger;
            CloseStoredProc( sp_rel_custos_bsh );
            datm_main.db_broker.Commit;

            qry_rel_custos_bsh_.Close;
            qry_rel_custos_bsh_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
            qry_rel_custos_bsh_.Prepare;
            qry_rel_custos_bsh_.Open;

            if datm_sel_unid_cli.qry_rel_custos_bsh_.RecordCount = 0 then
            begin
              BoxMensagem('Não há dados para exibir', 2)
            end
            else
            begin
              try
                Excel := CreateOLEObject('Excel.Application');

                xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\CUSTOS_EXPORTACAO.XLS' );

                Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\CUSTOS_EXPORTACAO_' +
                Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');

                oSheet := Excel.WorkBooks[1].Worksheets[1];
              except
                begin
                  BoxMensagem('Erro na criação da Planilha.', 2) ;
                  Exit;
                end
              end;

               // Filtros da planilha
               oSheet.Cells[ 02, 02 ].value := 'Unidade : ' + edt_nm_unid_neg.text;
               oSheet.Cells[ 03, 02 ].value := 'Produto : ' + edt_nm_produto.text;
               oSheet.Cells[ 02, 02 ].Font.Bold := True;
               oSheet.Cells[ 03, 02 ].Font.Bold := True;

               if Trim( msk_cd_grupo.Text ) <> '' then
               oSheet.Cells[ 04, 02 ].value := 'Grupo : ' + edt_nm_grupo.text else
               oSheet.Cells[ 04, 02 ].value := 'Cliente : ' + edt_nm_cliente.text;
               oSheet.Cells[ 05, 02 ].value := 'Processos Faturados : ' + FormatDateTime( FData, msk_dt_inicio.Date ) + ' à ' +
               FormatDateTime( FData, msk_dt_fim.Date );
               oSheet.Cells[ 04, 02 ].Font.Bold := True;
               oSheet.Cells[ 05, 02 ].Font.Bold := True;

               // Neste momento será preenchido a planilha com os dados da query
               nColuna := 01;
               nLinha  := 29;

               datm_sel_unid_cli.qry_custos_bsh_itens_.Close;
               datm_sel_unid_cli.qry_custos_bsh_itens_.Prepare;
               datm_sel_unid_cli.qry_custos_bsh_itens_.Open;

                // Preencho a coluna 1, a partir da linha 29 com os nomes dos itens
                datm_sel_unid_cli.qry_custos_bsh_itens_.First;
                while not datm_sel_unid_cli.qry_custos_bsh_itens_.EOF do
                begin
                  oSheet.Cells[ nLinha, 01 ].value := qry_custos_bsh_itens_NM_ITEM.AsString;
                  oSheet.Cells[ nLinha, 01 ].select;
                 // oSheet.Cells[ nLinha, 01 ].Interior.Bold := True;

                  nLinha := nLinha + 1;

                  datm_sel_unid_cli.qry_custos_bsh_itens_.Next;
                end;

                // Alimenta a planilha
                while not datm_sel_unid_cli.qry_rel_custos_bsh_.EOF do
                begin
                  if nr_processo <> qry_rel_custos_bsh_NR_PROCESSO_INDAIA.AsString then
                  begin
                    // Reinicializa o contador de linhas
                    nLinha := 29;
                    nColuna := nColuna + 1;

                    // Coloca o valor zero para os valores dos itens dos processos
                    datm_sel_unid_cli.qry_custos_bsh_itens_.First;
                    while not datm_sel_unid_cli.qry_custos_bsh_itens_.EOF do
                    begin
                      oSheet.Cells[ nLinha, nColuna ].value := '0,00';
                      nLinha := nLinha + 1;

                      datm_sel_unid_cli.qry_custos_bsh_itens_.Next;
                    end;
                   // oSheet.Cells[ 07, nColuna ].Interior.Bold := True;
                    oSheet.Cells[ 07, nColuna ].value := qry_rel_custos_bsh_NR_PROCESSO_CLIENTE.AsString;
                    oSheet.Cells[ 08, nColuna ].value := qry_rel_custos_bsh_NR_PROCESSO_INDAIA.AsString;
                    oSheet.Cells[ 09, nColuna ].value := qry_rel_custos_bsh_NM_IMPORTADOR.AsString;
                    oSheet.Cells[ 10, nColuna ].value := qry_rel_custos_bsh_LOCAL_DESTINO.AsString;
                    oSheet.Cells[ 11, nColuna ].value := qry_rel_custos_bsh_NM_CONTATO.AsString;
                    oSheet.Cells[ 12, nColuna ].value := qry_rel_custos_bsh_CD_INCOTERM.AsString;
                    oSheet.Cells[ 13, nColuna ].value := qry_rel_custos_bsh_QT_TOTAL_PRODUTO.AsString;
                    oSheet.Cells[ 14, nColuna ].value := qry_rel_custos_bsh_AP_MERCADORIA.AsString;
                    oSheet.Cells[ 15, nColuna ].value := qry_rel_custos_bsh_DS_INF_GERAL_EMB.AsString;
                    oSheet.Cells[ 16, nColuna ].value := qry_rel_custos_bsh_NM_EMBARCACAO.AsString;
                    oSheet.Cells[ 17, nColuna ].value := qry_rel_custos_bsh_DT_ETA.AsString;
                    oSheet.Cells[ 18, nColuna ].value := qry_rel_custos_bsh_DT_CARREGAMENTO.AsString;
                    oSheet.Cells[ 19, nColuna ].value := qry_rel_custos_bsh_DT_INSTRUCAO.AsString;
                    oSheet.Cells[ 20, nColuna ].value := qry_rel_custos_bsh_DT_FATURAMENTO.AsString;
                    oSheet.Cells[ 21, nColuna ].value := qry_rel_custos_bsh_DT_DEAD_LINE.AsString;
                    oSheet.Cells[ 22, nColuna ].value := qry_rel_custos_bsh_DT_ETD.AsString;
                    oSheet.Cells[ 23, nColuna ].value := qry_rel_custos_bsh_DS_OBS.AsString;
                    oSheet.Cells[ 24, nColuna ].value := qry_rel_custos_bsh_NM_MOEDA.AsString;
                    oSheet.Cells[ 25, nColuna ].value := FormatFloat('#0,.00', qry_rel_custos_bsh_VL_INVOICE_MOEDA.AsFloat);
                    oSheet.Cells[ 26, nColuna ].value := FormatFloat('#0,.00', qry_rel_custos_bsh_VL_NF.AsFloat);
                    oSheet.Cells[ 27, nColuna ].value := qry_rel_custos_bsh_TP_FRETE.AsString;
                    oSheet.Cells[ 28, nColuna ].value := FormatFloat('#0,.00', qry_rel_custos_bsh_VL_FRETE.AsFloat);
                    oSheet.Cells[ 28 + qry_rel_custos_bsh_CD_LINHA_IMPRESSAO_ITEM.AsInteger, nColuna ].value := FormatFloat('#0,.00', qry_rel_custos_bsh_VL_ITEM.asFloat);
                  end
                  else
                  begin
                   nLinha := 28;
                   // Atualiza os valores dos itens dos processos
                   oSheet.Cells[ nLinha + qry_rel_custos_bsh_CD_LINHA_IMPRESSAO_ITEM.AsInteger , nColuna ].value :=
                                                           FormatFloat('#0,.00', qry_rel_custos_bsh_VL_ITEM.AsFloat);
                  end;

                  nr_processo := qry_rel_custos_bsh_NR_PROCESSO_INDAIA.AsString;
                  qry_rel_custos_bsh_.next;
                end;

                 qry_rel_custos_bsh_.close;
                 Screen.Cursor := crDefault;

                 // Limpa a tabela auxiliae
                 ApagaDados( 'TREL_CUSTOS_BSH', nr_identificador );

                 Excel.Visible := True;

                 // Envia msg de sucesso
                 ShowMessage('Planilha gerada com sucesso');
                 Screen.Cursor := crDefault;
                 Application.ProcessMessages;
            end;
          except
             on E: Exception do
             begin
               if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                TrataErro(E);
              end;
          end;
        end;
      end;
      //32
     if tp_rel = 32 then // Lead Time2
     begin
        vlTotComissao := 0;
        vlTotSDA      := 0;
        vlTotCIF      := 0;

        with datm_sel_unid_cli do
        begin
          try
            Screen.Cursor := crHourGlass;

            datm_main.db_broker.StartTransaction;
            CloseStoredProc( sp_rel_lead_time2 );
            if Trim( msk_cd_unid_neg.Text ) = '' then
              sp_rel_lead_time2.ParamByName('@cd_unid_neg').AsString := 'X'
            else
              sp_rel_lead_time2.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
            if Trim( msk_cd_produto.Text ) = '' then
              sp_rel_lead_time2.ParamByName('@cd_produto').AsString := 'X'
            else
              sp_rel_lead_time2.ParamByName('@cd_produto').AsString := msk_cd_produto.Text;
            if Trim( msk_cd_grupo.Text ) = '' then
              sp_rel_lead_time2.ParamByName('@cd_grupo').AsString    := 'X'
            else
              sp_rel_lead_time2.ParamByName('@cd_grupo').AsString    := msk_cd_grupo.Text;
            if Trim( msk_cd_cliente.Text ) = '' then
              sp_rel_lead_time2.ParamByName('@cd_cliente').AsString  := 'X'
            else
              sp_rel_lead_time2.ParamByName('@cd_cliente').AsString  := msk_cd_cliente.Text;

            sp_rel_lead_time2.ParamByName('@dt_inicio').AsDate       := msk_dt_inicio.Date;
            sp_rel_lead_time2.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;

            if rdg_tp_processo.ItemIndex = 0 then
              sp_rel_lead_time2.ParamByName('@in_proc_pago').AsString := '1' else
              sp_rel_lead_time2.ParamByName('@in_proc_pago').AsString := '0';

            if rdg_tp_processo.ItemIndex = 1 then
              sp_rel_lead_time2.ParamByName('@in_proc_desemb').AsString := '1' else
              sp_rel_lead_time2.ParamByName('@in_proc_desemb').AsString := '0';

            if rdg_tp_processo.ItemIndex = 2 then
              sp_rel_lead_time2.ParamByName('@in_proc_pago_desemb').AsString := '1' else
              sp_rel_lead_time2.ParamByName('@in_proc_pago_desemb').AsString := '0';

            if chk_completo.Checked = True then
              sp_rel_lead_time2.ParamByName('@in_completo').AsString := '1' else
              sp_rel_lead_time2.ParamByName('@in_completo').AsString := '0';

            if chk_dias_uteis.Checked = True then
              sp_rel_lead_time2.ParamByName('@in_dias_uteis').AsString := '1' else
              sp_rel_lead_time2.ParamByName('@in_dias_uteis').AsString := '0';

            ExecStoredProc( sp_rel_lead_time2 );
            nr_identificador := sp_rel_lead_time2.ParamByName('@nr_identificador').AsInteger;
            CloseStoredProc( sp_rel_lead_time2 );
            datm_main.db_broker.Commit;

            qry_rel_lead_time2_.Close;
            qry_rel_lead_time2_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
            qry_rel_lead_time2_.Prepare;
            qry_rel_lead_time2_.Open;

            if datm_sel_unid_cli.qry_rel_lead_time2_.RecordCount = 0 then
            begin
              BoxMensagem('Não há dados para exibir', 2)
            end
            else
            begin
              try
                Excel := CreateOLEObject('Excel.Application');
                xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\REL_LEAD_TIME2.XLS' );
                Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\REL_LEAD_TIME2_' +
                Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');
                oSheet := Excel.WorkBooks[1].Worksheets[1];
              except
                begin
                  BoxMensagem('Erro na criação da Planilha.', 2) ;
                  Exit;
                end
              end;

               // nome do relatório
               oSheet.Cells[ 02, 03 ].value := 'Relatório Lead Time - Modelo 2';

               // filtros da planilha
               oSheet.Cells[ 04, 03 ].value := 'Unidade: ' + edt_nm_unid_neg.text;
               oSheet.Cells[ 05, 03 ].value := 'Produto: ' + edt_nm_produto.text;

               if Trim( msk_cd_grupo.Text ) <> '' then
               oSheet.Cells[ 04, 04 ].value := 'Grupo: ' + edt_nm_grupo.text else
               oSheet.Cells[ 04, 04 ].value := 'Cliente: ' + edt_nm_cliente.text;

               oSheet.Cells[ 04, 05 ].value := DateToStr(msk_dt_inicio.Date) + '   a   ' + DateToStr(msk_dt_fim.Date);

            if rdg_tp_processo.ItemIndex = 1 then
              sp_rel_lead_time2.ParamByName('@in_proc_desemb').AsString := '1' else
              sp_rel_lead_time2.ParamByName('@in_proc_desemb').AsString := '0';

            if rdg_tp_processo.ItemIndex = 2 then
              sp_rel_lead_time2.ParamByName('@in_proc_pago_desemb').AsString := '1' else
              sp_rel_lead_time2.ParamByName('@in_proc_pago_desemb').AsString := '0';

                FormatDateTime( FData, msk_dt_fim.Date );

                if chk_completo.Checked = False then // a última coluna de informação do relatório será o terminal de descarga
                begin
                  oSheet.Columns[ 17 ].Delete;
                  oSheet.Columns[ 17 ].Delete;
                  oSheet.Columns[ 17 ].Delete;
                  oSheet.Columns[ 17 ].Delete;
                  oSheet.Columns[ 17 ].Delete;
                  oSheet.Columns[ 17 ].Delete;
                  oSheet.Columns[ 17 ].Delete;
                  oSheet.Columns[ 17 ].Delete;
                end;

                nLinha := 09;

                if chk_completo.Checked = True then
                begin
                  oSheet.Cells[ 07, 17 ].value     := 'COMISSÃO - R$';
                  oSheet.Cells[ 07, 17 ].Interior.ColorIndex := 41;
                  oSheet.Cells[ 07, 17 ].Font.Bold := True;
                  oSheet.Cells[ 08, 17 ].value     := 'SEM IMPOSTOS';
                  oSheet.Cells[ 08, 17 ].Interior.ColorIndex := 41;
                  oSheet.Cells[ 08, 17 ].Font.Bold := True;
                  oSheet.Cells[ 07, 18 ].value     := 'SDAS - R$';
                  oSheet.Cells[ 07, 18 ].Interior.ColorIndex := 41;
                  oSheet.Cells[ 07, 18 ].Font.Bold := True;
                  oSheet.Cells[ 07, 19 ].value     := 'CIF - R$';
                  oSheet.Cells[ 07, 19 ].Interior.ColorIndex := 41;
                  oSheet.Cells[ 07, 19 ].Font.Bold := True;
                  oSheet.Cells[ 07, 20 ].value     := 'PERÍODO';
                  oSheet.Cells[ 07, 20 ].Interior.ColorIndex := 41;
                  oSheet.Cells[ 07, 20 ].Font.Bold := True;
                  oSheet.Cells[ 07, 21 ].value     := 'ARMAZENAGEM - R$';
                  oSheet.Cells[ 07, 21 ].Interior.ColorIndex := 41;
                  oSheet.Cells[ 07, 21 ].Font.Bold := True;
                  oSheet.Cells[ 08, 21 ].value     := 'TERMINAL';
                  oSheet.Cells[ 08, 21 ].Interior.ColorIndex := 41;
                  oSheet.Cells[ 08, 21 ].Font.Bold := True;
                  oSheet.Cells[ 08, 22 ].value     := 'NORMAL';
                  oSheet.Cells[ 08, 22 ].Interior.ColorIndex := 41;
                  oSheet.Cells[ 08, 22 ].Font.Bold := True;
                  oSheet.Cells[ 07, 23 ].value     := 'VOLUMES';
                  oSheet.Cells[ 07, 23 ].Interior.ColorIndex := 41;
                  oSheet.Cells[ 07, 23 ].Font.Bold := True;
                  oSheet.Cells[ 07, 24 ].value     := 'ESPÉCIE';
                  oSheet.Cells[ 07, 24 ].Interior.ColorIndex := 41;
                  oSheet.Cells[ 07, 24 ].Font.Bold := True;
                end;

                // Alimenta a planilha
                vCorAux := 34;

                while not datm_sel_unid_cli.qry_rel_lead_time2_.EOF do
                begin
                  if vCorAux = 34 then
                    vCorAux := 0
                  else vCorAux := 34;

                  oSheet.Cells[ nLinha, 01 ].Font.Bold := True;

                  oSheet.Cells[ nLinha, 01 ].value := qry_rel_lead_time2_NR_PROCESSO.AsString;

                  with TQuery.Create(Application) do
                  begin
                    DatabaseName := 'DBBROKER';
                    SQL.Clear;
                    SQL.Add('SELECT CD_REFERENCIA FROM TREF_CLIENTE WHERE NR_PROCESSO = ''' + msk_cd_unid_neg.Text + msk_cd_produto.Text + qry_rel_lead_time2_NR_PROCESSO.AsString + '''');
                    Open;
                    First;
                    vStrAux := '';
                    while not EOF do
                    begin
                      vStrAux := vStrAux + Fields[0].AsString + '  ';
                      Next;
                    end;
                    oSheet.Cells[ nLinha, 02 ].Value := Copy( vStrAux, 0, Length(vStrAux) );
                    Close;
                    Free;
                  end;

                  oSheet.Cells[ nLinha, 03 ].value := qry_rel_lead_time2_NM_AGENTE_CARGA.AsString;
                  oSheet.Cells[ nLinha, 04 ].value := ConsultaLookUP('TSERVICO','CD_SERVICO',ConsultaLookUP('TPROCESSO','NR_PROCESSO',msk_cd_unid_neg.Text + msk_cd_produto.Text + qry_rel_lead_time2_NR_PROCESSO.AsString,'CD_SERVICO'),'NM_SERVICO');
                  oSheet.Cells[ nLinha, 05 ].value := qry_rel_lead_time2_NM_CLIENTE.AsString;
                  oSheet.Cells[ nLinha, 06 ].value := qry_rel_lead_time2_NM_EMBARCACAO.AsString;
                  oSheet.Cells[ nLinha, 07 ].value := ' ' + DateToStr(qry_rel_lead_time2_DT_CHEGADA_NAVIO.AsDateTime);
                  oSheet.Cells[ nLinha, 08 ].value := qry_rel_lead_time2_ARMZ_ATRACACAO.AsString;
                  oSheet.Cells[ nLinha, 09 ].value := ConsultaLookUPSQL('SELECT CD_MARGEM FROM TARMAZEM AR, TPROCESSO PR WHERE AR.CD_ARMAZEM = PR.CD_ARMAZEM_ATRACACAO AND PR.NR_PROCESSO = ''' + msk_cd_unid_neg.Text + msk_cd_produto.Text + qry_rel_lead_time2_NR_PROCESSO.AsString + '''','CD_MARGEM');
                  oSheet.Cells[ nLinha, 10 ].value := ConsultaLookUP('TARMAZEM','CD_ARMAZEM',ConsultaLookUP('TPROCESSO','NR_PROCESSO',msk_cd_unid_neg.Text + msk_cd_produto.Text + qry_rel_lead_time2_NR_PROCESSO.AsString,'CD_ARMAZEM_DESCARGA'),'NM_ARMAZEM');
                  oSheet.Cells[ nLinha, 11 ].value := ' ' + DateToStr(qry_rel_lead_time2_DT_PRESENCA_CARGA.AsDateTime);
                  oSheet.Cells[ nLinha, 12 ].value := ' ' + DateToStr(qry_rel_lead_time2_DT_REGISTRO_DI.AsDateTime);
                  oSheet.Cells[ nLinha, 13 ].value := ' ' + DateToStr(qry_rel_lead_time2_DT_DESEMBARACO.AsDateTime);
                  oSheet.Cells[ nLinha, 14 ].value := qry_rel_lead_time2_TEMPO_DESEMBARACO.AsString;
                  oSheet.Cells[ nLinha, 15 ].value := qry_rel_lead_time2_NM_CANAL.AsString;
                  oSheet.Cells[ nLinha, 16 ].value := ' ' + DateToStr(qry_rel_lead_time2_DT_DOCTOS_TRANSPORT.AsDateTime);

                  oSheet.Cells[ nLinha, 01 ].Interior.ColorIndex := vCorAux;
                  oSheet.Cells[ nLinha, 02 ].Interior.ColorIndex := vCorAux;
                  oSheet.Cells[ nLinha, 03 ].Interior.ColorIndex := vCorAux;
                  oSheet.Cells[ nLinha, 04 ].Interior.ColorIndex := vCorAux;
                  oSheet.Cells[ nLinha, 05 ].Interior.ColorIndex := vCorAux;
                  oSheet.Cells[ nLinha, 06 ].Interior.ColorIndex := vCorAux;
                  oSheet.Cells[ nLinha, 07 ].Interior.ColorIndex := vCorAux;
                  oSheet.Cells[ nLinha, 08 ].Interior.ColorIndex := vCorAux;
                  oSheet.Cells[ nLinha, 09 ].Interior.ColorIndex := vCorAux;
                  oSheet.Cells[ nLinha, 10 ].Interior.ColorIndex := vCorAux;
                  oSheet.Cells[ nLinha, 11 ].Interior.ColorIndex := vCorAux;
                  oSheet.Cells[ nLinha, 12 ].Interior.ColorIndex := vCorAux;
                  oSheet.Cells[ nLinha, 13 ].Interior.ColorIndex := vCorAux;
                  oSheet.Cells[ nLinha, 14 ].Interior.ColorIndex := vCorAux;
                  oSheet.Cells[ nLinha, 15 ].Interior.ColorIndex := vCorAux;
                  oSheet.Cells[ nLinha, 16 ].Interior.ColorIndex := vCorAux;

                  if chk_completo.Checked = True then
                  begin
                    oSheet.Cells[ nLinha, 17 ].value := FormatFloat('#0,.00', qry_rel_lead_time2_VL_COMISSAO.AsFloat);
                    vlTotComissao := vlTotComissao + qry_rel_lead_time2_VL_COMISSAO.AsFloat;
                    oSheet.Cells[ nLinha, 18 ].value := FormatFloat('#0,.00', qry_rel_lead_time2_VL_SDA.AsFloat);
                    vlTotSDA      := vlTotSDA + qry_rel_lead_time2_VL_SDA.AsFloat;
                    oSheet.Cells[ nLinha, 19 ].value := FormatFloat('#0,.00', qry_rel_lead_time2_VL_CIF.AsFloat);
                    vlTotCIF      := vlTotCIF + qry_rel_lead_time2_VL_CIF.AsFloat;
                    oSheet.Cells[ nLinha, 20 ].value := qry_rel_lead_time2_PERIODO_ARMAZENAGEM.AsString;
                    oSheet.Cells[ nLinha, 21 ].value := FormatFloat('#0,.00', qry_rel_lead_time2_VL_ARMZ_TERMINAL.AsFloat);
                    vlTotTerminal := vlTotTerminal + qry_rel_lead_time2_VL_ARMZ_TERMINAL.AsFloat;
                    oSheet.Cells[ nLinha, 22 ].value := FormatFloat('#0,.00', qry_rel_lead_time2_VL_ARMZ_NORMAL.AsFloat );
                    vlTotNormal   := vlTotNormal   + qry_rel_lead_time2_VL_ARMZ_NORMAL.AsFloat;
                    oSheet.Cells[ nLinha, 23 ].value := qry_rel_lead_time2_QT_VOLUMES.AsString;
                    oSheet.Cells[ nLinha, 24 ].value := qry_rel_lead_time2_NM_ESPECIE.AsString;

                    oSheet.Cells[ nLinha, 17 ].Interior.ColorIndex := vCorAux;
                    oSheet.Cells[ nLinha, 18 ].Interior.ColorIndex := vCorAux;
                    oSheet.Cells[ nLinha, 19 ].Interior.ColorIndex := vCorAux;
                    oSheet.Cells[ nLinha, 20 ].Interior.ColorIndex := vCorAux;
                    oSheet.Cells[ nLinha, 21 ].Interior.ColorIndex := vCorAux;
                    oSheet.Cells[ nLinha, 22 ].Interior.ColorIndex := vCorAux;
                    oSheet.Cells[ nLinha, 23 ].Interior.ColorIndex := vCorAux;
                    oSheet.Cells[ nLinha, 24 ].Interior.ColorIndex := vCorAux;
                  end;
                  nLinha := nLinha + 1;
                  qry_rel_lead_time2_.next;
                end;

                oSheet.Cells[ nLinha + 1, 01 ].Interior.ColorIndex := 15;
                oSheet.Cells[ nLinha + 1, 02 ].Interior.ColorIndex := 15;
                oSheet.Cells[ nLinha + 1, 03 ].Interior.ColorIndex := 15;
                oSheet.Cells[ nLinha + 1, 04 ].Interior.ColorIndex := 15;
                oSheet.Cells[ nLinha + 1, 05 ].Interior.ColorIndex := 15;
                oSheet.Cells[ nLinha + 1, 06 ].Interior.ColorIndex := 15;
                oSheet.Cells[ nLinha + 1, 07 ].Interior.ColorIndex := 15;
                oSheet.Cells[ nLinha + 1, 08 ].Interior.ColorIndex := 15;
                oSheet.Cells[ nLinha + 1, 09 ].Interior.ColorIndex := 15;
                oSheet.Cells[ nLinha + 1, 10 ].Interior.ColorIndex := 15;
                oSheet.Cells[ nLinha + 1, 11 ].Interior.ColorIndex := 15;
                oSheet.Cells[ nLinha + 1, 12 ].Interior.ColorIndex := 15;
                oSheet.Cells[ nLinha + 1, 13 ].Interior.ColorIndex := 15;
                oSheet.Cells[ nLinha + 1, 14 ].Interior.ColorIndex := 15;
                oSheet.Cells[ nLinha + 1, 15 ].Interior.ColorIndex := 15;
                oSheet.Cells[ nLinha + 1, 16 ].Interior.ColorIndex := 15;

                if chk_completo.Checked = True then
                begin

                  oSheet.Cells[ nLinha + 1, 17 ].Interior.ColorIndex := 15;
                  oSheet.Cells[ nLinha + 1, 18 ].Interior.ColorIndex := 15;
                  oSheet.Cells[ nLinha + 1, 19 ].Interior.ColorIndex := 15;
                  oSheet.Cells[ nLinha + 1, 20 ].Interior.ColorIndex := 15;
                  oSheet.Cells[ nLinha + 1, 21 ].Interior.ColorIndex := 15;
                  oSheet.Cells[ nLinha + 1, 22 ].Interior.ColorIndex := 15;
                  oSheet.Cells[ nLinha + 1, 23 ].Interior.ColorIndex := 15;
                  oSheet.Cells[ nLinha + 1, 24 ].Interior.ColorIndex := 15;

                end;

                oSheet.Cells[ nLinha + 1, 01 ].Font.Bold := True;
                oSheet.Cells[ nLinha + 1, 01 ].Font.Size := 10;

                if rdg_tp_processo.ItemIndex = 0 then
                  oSheet.Cells[ nLinha + 1, 01 ].value := 'Processos Pagos : ' + IntToStr(datm_sel_unid_cli.qry_rel_lead_time2_.RecordCount)
                else if rdg_tp_processo.ItemIndex = 1 then
                  oSheet.Cells[ nLinha + 1, 01 ].value := 'Processos Desembaraçados : ' +
                                                          IntToStr(datm_sel_unid_cli.qry_rel_lead_time2_.RecordCount) else
                  oSheet.Cells[ nLinha + 1, 01 ].value := 'Processos Pagos e Desembaraçados : ' +
                                                          IntToStr(datm_sel_unid_cli.qry_rel_lead_time2_.RecordCount);

                if chk_completo.Checked = True then
                begin
                    oSheet.Cells[ nLinha + 1, 17 ].value := FormatFloat('#0,.00', vlTotComissao);
                    oSheet.Cells[ nLinha + 1, 18 ].value := FormatFloat('#0,.00', vlTotSDA);
                    oSheet.Cells[ nLinha + 1, 19 ].value := FormatFloat('#0,.00', vlTotCIF);

                    oSheet.Cells[ nLinha + 1, 21 ].value := FormatFloat('#0,.00', vlTotTerminal);
                    oSheet.Cells[ nLinha + 1, 22 ].value := FormatFloat('#0,.00', vlTotNormal);
                    if vlTotTerminal > vlTotNormal then
                      oSheet.Cells[ nLinha + 1, 23 ].value := FormatFloat('#0,.00', vlTotTerminal - vlTotNormal)
                    else
                      oSheet.Cells[ nLinha + 1, 23 ].value := FormatFloat('#0,.00', vlTotNormal - vlTotTerminal);

                    oSheet.Cells[ nLinha + 1, 17 ].Font.Bold := True;
                    oSheet.Cells[ nLinha + 1, 17 ].Font.Size := 10;
                    oSheet.Cells[ nLinha + 1, 18 ].Font.Bold := True;
                    oSheet.Cells[ nLinha + 1, 18 ].Font.Size := 10;
                    oSheet.Cells[ nLinha + 1, 19 ].Font.Bold := True;
                    oSheet.Cells[ nLinha + 1, 19 ].Font.Size := 10;

                    oSheet.Cells[ nLinha + 1, 21 ].Font.Bold := True;
                    oSheet.Cells[ nLinha + 1, 21 ].Font.Size := 10;
                    oSheet.Cells[ nLinha + 1, 22 ].Font.Bold := True;
                    oSheet.Cells[ nLinha + 1, 22 ].Font.Size := 10;
                    oSheet.Cells[ nLinha + 1, 23 ].Font.Bold := True;
                    oSheet.Cells[ nLinha + 1, 23 ].Font.Size := 10;
                    oSheet.Cells[ nLinha + 1, 23 ].Font.ColorIndex := 3;
                 end;


                 qry_rel_lead_time2_.close;
                 Screen.Cursor := crDefault;

                 //Limpa a tabela auxiliae
                 ApagaDados( 'TREL_LEAD_TIME2', nr_identificador );

                 Excel.Visible := True;

                 // Envia msg de sucesso
                 BoxMensagem('Planilha gerada com sucesso', 2);

                 Screen.Cursor := crDefault;
                 Application.ProcessMessages;
            end;
             except
             on E: Exception do
             begin
               if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                TrataErro(E);
              end;
          end;
        end;
      end;
      //32
    end
    else
    begin
      if tp_rel <> 6 then
      begin
        Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
      end
      else
      begin
        Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
      end;

      case tp_rel of
        2 : ReportName  := cDir_Rpt + '\CRFT003.RPT';
        5 : ReportName  := cDir_Rpt + '\CRGI004.RPT';
      end;
      if tp_rel = 5 then
        ReportTitle := Caption + ' - ' + FormatDateTime( FData, msk_dt_inicio.Date )
      else
        ReportTitle := Caption;

      Formulas[0] := 'Cliente = "'+ msk_cd_cliente.Text + '"';
      Formulas[1] := 'Unidade = "'+ msk_cd_unid_neg.Text + '"';
      if tp_rel in [2] then
      begin
        Formulas[2] := 'Grupo = "'+ msk_cd_Grupo.Text + '"';
      end;
      if tp_rel = 5 then
      begin
        Formulas[2] := 'DataBase = '+ DataCrystal( FormatDateTime( FData, msk_dt_inicio.Date ) );
        Formulas[3] := 'CD_EV_CHEGADA = "'+ str_cd_ev_chegada + '"';
        Formulas[4] := 'CD_EV_DESEMB = "'+ str_cd_ev_desemb + '"';
        Formulas[5] := 'CD_EV_REG_DI = "'+ str_cd_ev_reg_di + '"';
        Formulas[6] := 'CD_EV_ENT_SETPIN = "'+ str_cd_ev_ent_setpin + '"';
        Formulas[7] := 'CD_EV_SAI_SETPIN = "'+ str_cd_ev_sai_setpin + '"';
        Formulas[8] := 'CD_EV_DESCARGA = "'+ str_cd_ev_descarga + '"';
        Formulas[9] := 'NomeUnid = "'+ Trim(edt_nm_unid_neg.Text) + '"';
      end;
      Execute;
    end;
  end;
end;

procedure Tfrm_sel_unid_cli.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sel_unid_cli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_sel_unid_cli do
  begin
    if qry_grupo_.Active    then qry_grupo_.Close;
    if qry_cliente_.Active  then qry_cliente_.Close;
    if qry_unid_neg_.Active then qry_unid_neg_.Close;
    if qry_area_.Active     then qry_area_.Close;
    Free;
  end;
  crp_afaturar.Free; 
  Action := cafree;
end;

procedure Tfrm_sel_unid_cli.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_sel_unid_cli, datm_sel_unid_cli);
end;

procedure Tfrm_sel_unid_cli.FormShow(Sender: TObject);
begin
  msk_dt_inicio.Date := dt_server;
  msk_dt_fim.Date    := dt_server;

  case tp_rel of
    1 : Caption := 'Relação de REs';
    2 : Caption := 'Resumo Geral dos Processos a Serem Faturados';
    4 : Caption := 'Movimento dos Processos';
    5 : begin
           Caption                := 'Andamento dos Processos - Importação';
           lbl_periodo.Caption    := 'Selecione uma data:';
           lbl_a.Visible          := False;
           msk_dt_fim.Visible     := False;
        end;
    7 : begin
           Caption                := 'Processos Averbados - Exportação';
           lbl_periodo.Caption    := 'Selecione um período:';
           lbl_a.Visible          := True;
           msk_dt_fim.Visible     := True;
        end;
    8 : begin
           Caption                := 'Mapa Mensal do Movimento dos Documentos Recebidos';
           lbl_periodo.Caption    := 'Selecione um período:';
           lbl_a.Visible          := True;
           msk_dt_fim.Visible     := True;
        end;
    11 : begin
           Caption := 'Conta Corrente - Cliente';
           lbl_periodo.Caption    := 'Selecione um período:';
           lbl_a.Visible          := True;      msk_dt_fim.Visible     := True;
           lblGrupo.Visible       := True;      msk_cd_grupo.Visible   := True;
           edt_nm_grupo.Visible   := True;      btn_co_grupo.Visible   := True;
           rdg_tipo.Visible       := True;

           lblGrupo.Top           := 66;        msk_cd_grupo.Top       := 80;
           edt_nm_grupo.Top       := 80;        btn_co_grupo.Top       := 80;
           lbl_cd_cliente.Top     := 117;       msk_cd_cliente.Top     := 131;
           edt_nm_cliente.Top     := 131;       btn_co_cliente.Top     := 131;
           rdg_tipo.Left          := 28;        rdg_tipo.Top           := 209;

           lbl_periodo.Top        := lbl_periodo.Top + 64;
           msk_dt_inicio.Top      := msk_dt_inicio.Top + 64;
           lbl_a.Top              := lbl_a.Top + 64;
           msk_dt_fim.Top         := msk_dt_fim.Top + 64;
           btn_iniciar.Top        := btn_iniciar.Top + 184;
           btn_fechar.Top         := btn_fechar.Top + 184;

           msk_cd_unid_neg.TabOrder   := 1;   msk_cd_grupo.TabOrder      := 2;
           msk_cd_cliente.TabOrder    := 3;   rdg_tipo.TabOrder          := 6;

           msk_cd_unid_neg.Text   := str_cd_unid_neg;
           msk_cd_unid_negExit(nil);
         end;
    13 : begin
           Caption := 'Exportação - Estatística Cambial';
           lbl_periodo.Caption    := 'Selecione um período:';
           lbl_a.Visible          := True;
           msk_dt_fim.Visible     := True;

           msk_cd_unid_neg.Text     := str_cd_unid_neg;
           msk_cd_unid_negExit(nil);

           lbl_cd_cliente.Visible := True;
           msk_cd_cliente.Visible := True;
           edt_nm_cliente.Visible := True;
           btn_co_cliente.Visible := True;
         end;
    14 : begin
           Caption := 'Fluxo de Caixa';
           lbl_periodo.Caption    := 'Selecione um período:';
           lbl_a.Visible          := True;
           lbl_cd_cliente.Visible := False;
           msk_cd_cliente.Visible := False;
           edt_nm_cliente.Visible := False;
           btn_co_cliente.Visible := False;
           lbl_selec.Visible := True;
           cbb_selec.Visible := True;
           msk_cd_unid_neg.TabOrder   := 1;
           msk_dt_inicio.TabOrder     := 2;     msk_dt_fim.TabOrder      := 3;

           lbl_periodo.Top         := lbl_periodo.Top - 40;    lbl_a.Top               := lbl_a.Top - 40;
           msk_dt_inicio.Top       := msk_dt_inicio.Top - 40;  msk_dt_fim.Top          := msk_dt_fim.Top - 40;
           frm_sel_unid_cli.Height := 229;                     frm_sel_unid_cli.Width  := 450;
         end;
    16 : begin
           Caption := 'Processos Faturados por Prefixo';
           lbl_periodo.Caption    := 'Selecione um período:';
           lbl_a.Visible          := True;
           msk_dt_fim.Visible     := True;
           lblarea.Visible        := True;
           msk_cd_area.Visible    := True;
           edt_nm_area.Visible    := True;
           btn_co_area.Visible    := True;

           msk_cd_unid_neg.Text     := str_cd_unid_neg;
           msk_cd_unid_negExit(nil);
         end;
    17 : begin
           Caption := 'Faturas, NF, Notas - Emitidas/Canceladas';
           lbl_periodo.Caption    := 'Selecione um período:';
           lbl_a.Visible          := True;
           msk_dt_fim.Visible     := True;

           msk_cd_unid_neg.Text     := str_cd_unid_neg;
           msk_cd_unid_negExit(nil);
         end;
    21 : begin
           Caption := 'Relação Processos - Embarque X Averbação';
           lbl_periodo.Caption    := 'Selecione um período:';
           lbl_a.Visible          := True;
           msk_dt_fim.Visible     := True;

           msk_cd_unid_neg.Text     := str_cd_unid_neg;
           msk_cd_unid_negExit(nil);
         end;
    23 : begin
           Caption                := 'Relação de Notas Fiscais - Receitas';
           lbl_cd_cliente.Visible := False;
           msk_cd_cliente.Visible := False;
           edt_nm_cliente.Visible := False;
           btn_co_cliente.Visible := False;

           msk_cd_unid_neg.Text     := str_cd_unid_neg;
           msk_cd_unid_negExit(nil);

           msk_dt_inicio.SetFocus;

        end;
    24 : begin
           Caption                  := 'Relação de Cntr X Demurrage';
           msk_cd_unid_neg.Text     := str_cd_unid_neg;
           msk_cd_unid_negExit(nil);

           msk_dt_inicio.SetFocus;

        end;
    25 : begin
           Caption                  := 'Relação de DI´s Registradas';
           msk_cd_unid_neg.Text     := str_cd_unid_neg;
           chk_arquivo.left         := 252 ;
           chk_arquivo.Visible      := True;
           msk_cd_unid_negExit(nil);

           msk_dt_inicio.SetFocus;
        end;
    26 : begin
           Caption                  := 'Relação de DI´s desembaraçadas';
           msk_cd_unid_neg.Text     := str_cd_unid_neg;
           msk_cd_unid_negExit(nil);

           msk_dt_inicio.SetFocus; 
        end;
    27 : begin
           Caption                  := 'KPI Exportação';
           lbl_periodo.Caption      := 'Selecione um período:';
           lbl_a.Visible            := True;
           msk_dt_fim.Visible       := True;
           lblArea.Visible          := True;
           msk_cd_area.Visible      := True;
           edt_nm_area.Visible      := True;
           btn_co_area.Visible      := True;
           lbl_lead_time.Visible    := True;
           cbo_lead_time.Visible    := True;

           msk_cd_unid_neg.Text     := str_cd_unid_neg;
           msk_cd_unid_negExit(nil);

           with datm_sel_unid_cli.qry_tp_lead_time_ do
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
         end;
    28: begin
          Caption := 'Impostos SAP';

          lblArea.Visible        := True;
          msk_cd_area.Visible    := True;
          edt_nm_area.Visible    := True;
          btn_co_area.Visible    := True;

          lbl_periodo.Caption    := 'Selecione um período:';
          lbl_a.Visible          := True;
          msk_dt_fim.Visible     := True;

          msk_cd_unid_neg.Text   := str_cd_unid_neg;
          msk_cd_unid_negExit(nil);
        end;
    29 : begin
           Caption                  := 'Relação de Canais';
           msk_cd_unid_neg.Text     := str_cd_unid_neg;
           lblarea.Visible          := True;
           msk_cd_area.Visible      := True;
           edt_nm_area.Visible      := True;
           btn_co_area.Visible      := True;
           chk_arquivo.Visible      := True;
           chk_arquivo.Left         := msk_dt_fim.Left + msk_dt_fim.Width + 10;
           msk_cd_unid_negExit(nil);

           msk_dt_inicio.SetFocus;
        end;
    30 : begin
           Caption                   := 'Relação de Canais Mod2';
           msk_cd_unid_neg.Text      := str_cd_unid_neg;
           lblarea.Visible           := True;
           msk_cd_area.Visible       := True;
           edt_nm_area.Visible       := True;
           btn_co_area.Visible       := True;
           chk_arquivo.Visible       := True;
           lbl_grupo_area.Visible    := True;
           msk_cd_grupo_area.Visible := True;
           chk_grafico.Visible       := True;

           Height                        := Height + 52;
           lblGrupo.Visible              := True;
           msk_cd_grupo.Visible          := True;
           edt_nm_grupo.Visible          := True;
           btn_co_grupo.Visible          := True;

           lblGrupo.Top                  := 58;
           msk_cd_grupo.Top              := 70;
           edt_nm_grupo.Top              := 70;
           btn_co_grupo.Top              := 70;

           lbl_cd_cliente.Top            := lbl_cd_cliente.Top + 42;
           msk_cd_cliente.Top            := msk_cd_cliente.Top + 42;
           edt_nm_cliente.Top            := edt_nm_cliente.Top + 42;
           btn_co_cliente.Top            := btn_co_cliente.Top + 42;
           lblArea.Top                   := lblArea.Top - 52;
           msk_cd_area.Top               := msk_cd_area.Top - 52;
           edt_nm_area.Top               := edt_nm_area.Top - 52;
           btn_co_area.Top               := btn_co_area.Top - 52;
           lbl_grupo_area.Top            := lblArea.Top;
           msk_cd_grupo_area.Top         := msk_cd_grupo_area.Top - 52;
           lbl_periodo.Top               := lbl_periodo.Top + 100;
           msk_dt_inicio.Top             := msk_dt_inicio.Top + 100;
           lbl_a.Top                     := lbl_a.Top + 100;
           msk_dt_fim.Top                := msk_dt_fim.Top + 100;
           btn_iniciar.Top               := btn_iniciar.Top + 110;
           btn_fechar.Top                := btn_fechar.Top + 110;
           chk_arquivo.Left              := msk_dt_fim.Left + msk_dt_fim.Width + 10;
           chk_arquivo.Top               := msk_dt_fim.Top;
           chk_grafico.Left              := chk_arquivo.Left;
           chk_grafico.Top               := chk_arquivo.Top + 20;
           msk_cd_cliente.OnChange       := msk_cd_clienteChange;

           msk_cd_unid_neg.TabOrder   := 1;
           msk_cd_grupo.TabOrder      := 2;
           msk_cd_cliente.TabOrder    := 3;
           msk_cd_area.TabOrder       := 4;
           msk_cd_grupo_area.TabOrder := 5;
           msk_dt_inicio.TabOrder     := 6;
           msk_dt_fim.TabOrder        := 7;
           chk_arquivo.TabOrder       := 8;
           chk_grafico.TabOrder       := 9;
           btn_iniciar.TabOrder       := 10;
           btn_fechar.TabOrder        := 11;

           msk_cd_unid_negExit(nil);

           msk_dt_inicio.SetFocus;
        end;

    31 : begin
           Caption                   := 'Custos - Exportação';
           msk_cd_unid_neg.Text      := str_cd_unid_neg;

           Height                        := Height + 52;
           lblGrupo.Visible              := True;
           msk_cd_grupo.Visible          := True;
           edt_nm_grupo.Visible          := True;
           btn_co_grupo.Visible          := True;
           lbl_produto.Visible           := True;
           msk_cd_produto.Visible        := True;
           edt_nm_produto.Visible        := True;
           btn_co_produto.Visible        := True;

           lblGrupo.Top                  := lbl_cd_cliente.Top + 40;
           msk_cd_grupo.Top              := msk_cd_cliente.Top + 40;
           edt_nm_grupo.Top              := edt_nm_cliente.Top + 40;
           btn_co_grupo.Top              := edt_nm_cliente.Top + 40;

           lbl_produto.Top               := lbl_cd_cliente.Top;
           msk_cd_produto.Top            := msk_cd_cliente.Top;
           edt_nm_produto.Top            := edt_nm_cliente.Top;
           btn_co_produto.Top            := edt_nm_cliente.Top;
           lbl_cd_cliente.Top            := lblGrupo.Top + 42;
           msk_cd_cliente.Top            := msk_cd_grupo.Top + 42;
           edt_nm_cliente.Top            := edt_nm_grupo.Top + 42;
           btn_co_cliente.Top            := btn_co_grupo.Top + 42;
           lbl_periodo.Top               := lbl_periodo.Top + 100;
           msk_dt_inicio.Top             := msk_dt_inicio.Top + 100;
           lbl_a.Top                     := lbl_a.Top + 100;
           msk_dt_fim.Top                := msk_dt_fim.Top + 100;
           btn_iniciar.Top               := btn_iniciar.Top + 110;
           btn_fechar.Top                := btn_fechar.Top + 110;
           msk_cd_cliente.OnChange       := msk_cd_clienteChange;

           msk_cd_unid_neg.SetFocus;

           msk_cd_unid_neg.TabOrder   := 1;
           msk_cd_produto.TabOrder    := 2;
           msk_cd_grupo.TabOrder      := 3;
           msk_cd_cliente.TabOrder    := 4;
           msk_dt_inicio.TabOrder     := 5;
           msk_dt_fim.TabOrder        := 6;
           btn_iniciar.TabOrder       := 7;
           btn_fechar.TabOrder        := 8;

           msk_cd_unid_negExit(nil);
         end;
    32 : begin
           Caption                   := 'Lead Time2';
           msk_cd_unid_neg.Text      := str_cd_unid_neg;

           Height                        := Height + 52;
           lblGrupo.Visible              := True;
           msk_cd_grupo.Visible          := True;
           edt_nm_grupo.Visible          := True;
           btn_co_grupo.Visible          := True;
           lbl_produto.Visible           := True;
           msk_cd_produto.Visible        := True;
           edt_nm_produto.Visible        := True;
           btn_co_produto.Visible        := True;
           rdg_tp_processo.Visible       := True;
           chk_completo.Visible          := True;
           chk_dias_uteis.Visible        := True;

           msk_cd_produto.Text           := '01';
           lblGrupo.Top                  := lbl_cd_cliente.Top + 40;
           msk_cd_grupo.Top              := msk_cd_cliente.Top + 40;
           edt_nm_grupo.Top              := edt_nm_cliente.Top + 40;
           btn_co_grupo.Top              := edt_nm_cliente.Top + 40;

           lbl_produto.Top               := lbl_cd_cliente.Top;
           msk_cd_produto.Top            := msk_cd_cliente.Top;
           edt_nm_produto.Top            := edt_nm_cliente.Top;
           btn_co_produto.Top            := edt_nm_cliente.Top;
           lbl_cd_cliente.Top            := lblGrupo.Top + 42;
           msk_cd_cliente.Top            := msk_cd_grupo.Top + 42;
           edt_nm_cliente.Top            := edt_nm_grupo.Top + 42;
           btn_co_cliente.Top            := btn_co_grupo.Top + 42;
           lbl_periodo.Top               := lbl_periodo.Top + 100;
           msk_dt_inicio.Top             := msk_dt_inicio.Top + 100;
           lbl_a.Top                     := lbl_a.Top + 100;
           msk_dt_fim.Top                := msk_dt_fim.Top + 100;
           rdg_tp_processo.Top           := msk_dt_fim.Top + 30;
           chk_completo.Top              := rdg_tp_processo.Top;
           chk_dias_uteis.Top            := chk_completo.Top + 30;
           btn_iniciar.Top               := btn_iniciar.Top + 215;
           btn_fechar.Top                := btn_fechar.Top + 215;
           msk_cd_cliente.OnChange       := msk_cd_clienteChange;

           msk_cd_unid_neg.SetFocus;

           msk_cd_unid_neg.TabOrder   := 1;
           msk_cd_produto.TabOrder    := 2;
           msk_cd_grupo.TabOrder      := 3;
           msk_cd_cliente.TabOrder    := 4;
           msk_dt_inicio.TabOrder     := 5;
           msk_dt_fim.TabOrder        := 6;
           rdg_tp_processo.TabOrder   := 7;
           chk_completo.TabOrder      := 8;
           chk_dias_uteis.TabOrder    := 9;
           btn_iniciar.TabOrder       := 10;
           btn_fechar.TabOrder        := 11;

           msk_cd_unid_negExit(nil);
           msk_cd_produtoExit(nil);
         end;
  end;

  if tp_rel in [2, 7, 8, 13, 17, 21, 24 ] then
  begin
    Height                        := Height + 42;
    lblGrupo.Visible              := True;
    msk_cd_grupo.Visible          := True;
    edt_nm_grupo.Visible          := True;
    btn_co_grupo.Visible          := True;

    lblGrupo.Top                  := 58;
    msk_cd_grupo.Top              := 70;
    edt_nm_grupo.Top              := 70;
    btn_co_grupo.Top              := 70;

    lbl_cd_cliente.Top            := lbl_cd_cliente.Top + 42;
    msk_cd_cliente.Top            := msk_cd_cliente.Top + 42;
    edt_nm_cliente.Top            := edt_nm_cliente.Top + 42;
    btn_co_cliente.Top            := btn_co_cliente.Top + 42;
    lbl_periodo.Top               := lbl_periodo.Top + 42;
    msk_dt_inicio.Top             := msk_dt_inicio.Top + 42;
    lbl_a.Top                     := lbl_a.Top + 42;
    msk_dt_fim.Top                := msk_dt_fim.Top + 42;
    btn_iniciar.Top               := btn_iniciar.Top + 42;
    btn_fechar.Top                := btn_fechar.Top + 42;
    lbl_relatorio.Top             := lbl_relatorio.Top + 42;
    msk_nr_relatorio.Top          := msk_nr_relatorio.Top + 42;

    msk_cd_cliente.OnChange       := msk_cd_clienteChange;
  end;

  if tp_rel in [25, 26 ] then
  begin
    Height                        := Height + 42;
    lblGrupo.Visible              := True;
    msk_cd_grupo.Visible          := True;
    edt_nm_grupo.Visible          := True;
    btn_co_grupo.Visible          := True;
    lblArea.Visible               := True;
    msk_cd_area.Visible           := True;
    edt_nm_area.Visible           := True;
    btn_co_area.Visible           := True;

    lblGrupo.Top                  := 58;
    msk_cd_grupo.Top              := 70;
    edt_nm_grupo.Top              := 70;
    btn_co_grupo.Top              := 70;

    lbl_cd_cliente.Top            := lbl_cd_cliente.Top + 42;
    msk_cd_cliente.Top            := msk_cd_cliente.Top + 42;
    edt_nm_cliente.Top            := edt_nm_cliente.Top + 42;
    btn_co_cliente.Top            := btn_co_cliente.Top + 42;

    lbl_via_transp.Top            := 191;
    msk_cd_via_transp.Top         := 208;
    edt_nm_via_transp.Top         := 208;
    btn_co_via_transp.Top         := 208;

    lblArea.Top                   := lbl_periodo.Top + 42;
    msk_cd_area.Top               := msk_dt_inicio.Top + 42;
    edt_nm_area.Top               := msk_dt_inicio.Top + 42;
    btn_co_area.Top               := msk_dt_inicio.Top + 42;

    lbl_periodo.Top               := 240;
    msk_dt_inicio.Top             := 255;
    lbl_a.Top                     := 240;
    msk_dt_fim.Top                := 255;
    btn_iniciar.Top               := 290;
    btn_fechar.Top                := 290;
    lbl_relatorio.Top             := lbl_relatorio.Top + 82;
    msk_nr_relatorio.Top          := msk_nr_relatorio.Top + 82;
    chk_arquivo.Top               := msk_dt_fim.Top;

    lbl_via_transp.Visible        := True;
    msk_cd_via_transp.Visible     := True;
    edt_nm_via_transp.Visible     := True;
    btn_co_via_transp.Visible     := True;

    msk_cd_cliente.OnChange       := msk_cd_clienteChange;
  end;

  if tp_rel = 16 then
  begin
    Height                        := Height + 42;
    lblGrupo.Visible              := True;
    msk_cd_grupo.Visible          := True;
    edt_nm_grupo.Visible          := True;
    btn_co_grupo.Visible          := True;

    lblGrupo.Top                  := 58;
    msk_cd_grupo.Top              := 70;
    edt_nm_grupo.Top              := 70;
    btn_co_grupo.Top              := 70;

    lbl_cd_cliente.Top            := lbl_cd_cliente.Top + 42;
    msk_cd_cliente.Top            := msk_cd_cliente.Top + 42;
    edt_nm_cliente.Top            := edt_nm_cliente.Top + 42;
    btn_co_cliente.Top            := btn_co_cliente.Top + 42;
    lblArea.Top                   := lblArea.Top - 52;
    msk_cd_area.Top               := msk_cd_area.top - 52;
    edt_nm_area.Top               := edt_nm_area.Top - 52;
    btn_co_area.Top               := btn_co_area.Top - 52;

    lbl_periodo.Top               := lbl_periodo.Top + 92;
    msk_dt_inicio.Top             := msk_dt_inicio.Top + 92;
    lbl_a.Top                     := lbl_a.Top + 92;
    msk_dt_fim.Top                := msk_dt_fim.Top + 92;
    btn_iniciar.Top               := btn_iniciar.Top + 92;
    btn_fechar.Top                := btn_fechar.Top + 92;
    lbl_relatorio.Top             := lbl_relatorio.Top + 92;
    msk_nr_relatorio.Top          := msk_nr_relatorio.Top + 92;

    Height                        := Height + 142;
    lblGrupo.Visible              := True;
    msk_cd_grupo.Visible          := True;
    edt_nm_grupo.Visible          := True;
    btn_co_grupo.Visible          := True;

    lblGrupo.Top                  := 58;
    msk_cd_grupo.Top              := 70;
    edt_nm_grupo.Top              := 70;
    btn_co_grupo.Top              := 70;

    lbl_cd_cliente.Top            := lbl_cd_cliente.Top + 42;
    msk_cd_cliente.Top            := msk_cd_cliente.Top + 42;
    edt_nm_cliente.Top            := edt_nm_cliente.Top + 42;
    btn_co_cliente.Top            := btn_co_cliente.Top + 42;
    lblArea.Top                   := lblArea.Top - 52;
    msk_cd_area.Top               := msk_cd_area.Top - 52;
    edt_nm_area.Top               := edt_nm_area.Top - 52;
    btn_co_area.Top               := btn_co_area.Top - 52;

    lbl_periodo.Top               := lbl_periodo.Top + 84;
    msk_dt_inicio.Top             := msk_dt_inicio.Top + 84;
    lbl_a.Top                     := lbl_a.Top + 84;
    msk_dt_fim.Top                := msk_dt_fim.Top + 84;
    btn_iniciar.Top               := btn_iniciar.Top + 84;
    btn_fechar.Top                := btn_fechar.Top + 84;

    msk_cd_cliente.OnChange       := msk_cd_clienteChange;

    msk_cd_cliente.OnChange       := msk_cd_clienteChange;
  end;

  if tp_rel in [27, 28, 29] then
  begin
    Height                        := Height + 42;
    lblGrupo.Visible              := True;
    msk_cd_grupo.Visible          := True;
    edt_nm_grupo.Visible          := True;
    btn_co_grupo.Visible          := True;

    lblGrupo.Top                  := 58;
    msk_cd_grupo.Top              := 70;
    edt_nm_grupo.Top              := 70;
    btn_co_grupo.Top              := 70;

    lbl_cd_cliente.Top            := lbl_cd_cliente.Top + 42;
    msk_cd_cliente.Top            := msk_cd_cliente.Top + 42;
    edt_nm_cliente.Top            := edt_nm_cliente.Top + 42;
    btn_co_cliente.Top            := btn_co_cliente.Top + 42;
    lblArea.Top                   := lblArea.Top - 52;
    msk_cd_area.Top               := msk_cd_area.Top - 52;
    edt_nm_area.Top               := edt_nm_area.Top - 52;
    btn_co_area.Top               := btn_co_area.Top - 52;
    lbl_periodo.Top               := lbl_periodo.Top + 84;
    msk_dt_inicio.Top             := msk_dt_inicio.Top + 84;
    lbl_a.Top                     := lbl_a.Top + 84;
    msk_dt_fim.Top                := msk_dt_fim.Top + 84;
    btn_iniciar.Top               := btn_iniciar.Top + 84;
    btn_fechar.Top                := btn_fechar.Top + 84;

    if tp_rel = 27 then
    begin
      lbl_lead_time.Top             := lbl_periodo.Top;
      cbo_lead_time.Top             := msk_dt_inicio.Top;
    end;

    msk_cd_cliente.OnChange       := msk_cd_clienteChange;
  end;

  if tp_rel <> 5 then
  begin
    lbl_a.Visible                 := ComPeriodo;
    lbl_periodo.Visible           := ComPeriodo;
    msk_dt_inicio.Visible         := ComPeriodo;
    msk_dt_fim.Visible            := ComPeriodo;
  end;

  if tp_rel in [ 13, 16, 17, 21, 24, 27, 29] then
  begin
    msk_cd_grupo.SetFocus;
  end;

  if msk_cd_cliente.Visible then
  begin
    msk_dt_inicio.TabOrder := msk_cd_cliente.TabOrder + 1;
  end;

  if msk_cd_area.Visible then
  begin
    msk_dt_inicio.TabOrder := msk_cd_area.TabOrder + 1;
  end;

  if tp_rel in [29] then
    chk_arquivo.Top := msk_dt_fim.Top;

  msk_dt_fim.TabOrder := msk_dt_inicio.TabOrder + 1;

  if tp_rel in [27] then
     cbo_lead_time.TabOrder        := msk_dt_fim.TabOrder + 1;
end;

procedure Tfrm_sel_unid_cli.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
    if Sender = msk_cd_cliente  then btn_co_clienteClick(nil);
    if Sender = msk_cd_grupo    then btn_co_grupoClick(nil);
    if Sender = msk_cd_area     then btn_co_areaClick(nil);
  end;
end;

procedure Tfrm_sel_unid_cli.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if ( msk_cd_grupo.Text = '' ) and ( Not ( tp_rel in [11] ) ) then
  begin
    edt_nm_grupo.Text := 'Todos';
    Exit;
  end
  else
  begin
    edt_nm_grupo.Text := '';
  end;

  ValCodEdt(msk_cd_grupo);
  with datm_sel_unid_cli.qry_grupo_ do
  begin
    Close;
    ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
    Prepare;
    Open;
    if EOF then
    begin
      if Not ( tp_rel in [11] ) then BoxMensagem( 'Grupo não encontrado!', 2 );
      msk_cd_grupo.Clear;
      edt_nm_grupo.Clear;
    end
    else
    begin
      edt_nm_grupo.Text:= FieldByName('NM_GRUPO').AsString;
      str_cnpj := FieldByName('CNPJ_GRUPO').AsString;
    end;
    Close;
  end;
end;

procedure Tfrm_sel_unid_cli.btn_co_grupoClick(Sender: TObject);
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

procedure Tfrm_sel_unid_cli.msk_cd_grupoChange(Sender: TObject);
begin
  if msk_cd_grupo.Text <> '' then
  begin
    msk_cd_cliente.Text     := '';
    msk_cd_cliente.Color    := clMenu;
    edt_nm_cliente.Text     := '';
    msk_cd_cliente.Enabled  := False;
    btn_co_cliente.Enabled  := False;
  end
  else
  begin
    msk_cd_cliente.Color    := clWindow;
    msk_cd_cliente.Enabled  := True;
    btn_co_cliente.Enabled  := True;
  end;
end;

procedure Tfrm_sel_unid_cli.msk_cd_clienteChange(Sender: TObject);
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

procedure Tfrm_sel_unid_cli.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_sel_unid_cli.btn_co_areaClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_area, frm_area);
  with frm_area do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_area.Cons_OnLine_Texto := msk_cd_area.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_area.Text := frm_area.Cons_OnLine_Texto;
  end;
  msk_cd_area.SetFocus;
end;

procedure Tfrm_sel_unid_cli.msk_cd_areaExit(Sender: TObject);
begin
  edt_nm_area.Clear;
  if msk_cd_area.Text = '' then
  begin
    edt_nm_area.text := 'Todas';
    Exit;
  end
  else
  begin
    edt_nm_area.Text := '';
  end;

  ValCodEdt(msk_cd_area);
  with datm_sel_unid_cli.qry_area_ do
  begin
    ParamByName('CD_AREA').AsString := msk_cd_area.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
       BoxMensagem( 'Área não encontrada!', 2 );
       msk_cd_area.Clear;
       edt_nm_area.Clear;
    end
    else
    begin
      edt_nm_area.Text := FieldByName('NM_AREA').AsString;
    end;
    Close;
  end;
end;

procedure Tfrm_sel_unid_cli.GeraArquivoRelImpCntrDemurrage( nr_identificador: Integer );
var
  rel_cd_unid_neg : String[2];
  rel_nr_processo : String[18];
  FimA, FimB, FimC, FimP : Boolean;
begin
  Application.ProcessMessages;

  with datm_sel_unid_cli do
  begin
    cNomeTxt := cDir_Rpt + '\REL_IMP_CNTR_DEMURRAGE.TXT';
    FileMode := 2;
    try
      AssignFile( Txt, cNomeTxt );
      ReWrite( Txt );
    except
      BoxMensagem( 'Erro na criação do Arquivo!', 2 );
      Exit;
    end;

    Saida := 'RELAÇÃO DE CONTÊINER X DEMURRAGE' + #13#10;
    Write( Txt, Saida );

    qry_rel_imp_demurrage_proc_.Close;
    qry_rel_imp_demurrage_proc_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
    qry_rel_imp_demurrage_proc_.Prepare;
    qry_rel_imp_demurrage_proc_.Open;

    Saida := 'Unidade:' + qry_rel_imp_demurrage_proc_.FieldByName('NM_UNID_NEG').AsString + #13#10;
    Write( Txt, Saida );

    Saida := 'Processo;Cntr;Tipo;Demurrage;Transportador Marítimo;Ref. Cliente;Exportador;Armazém de Atracação;Armazém de Descarga;Fábrica de Destino;Área;Data de Envio Doctos;';
    Write( Txt, Saida );
    Saida := 'Entrada do Navio;Entrada no Terminal Retroportuário;Presença de Carga;Liberação do B/L;Registro DI;Canal de Parametrização;Averbação no Terminal;';
    Write( Txt, Saida );
    Saida := 'Desembaraço DI;Retirada CI;Inspeção no MA;Envio da NF ao Transportador;Transportador;Entrada na Fábrica;Devolução do Contêiner;Total de Demurrage Pago;Pagamento da Demurrage' + #13#10;
    Write( Txt, Saida );

    rel_cd_unid_neg := qry_rel_imp_demurrage_proc_.FieldByName('CD_UNID_NEG').AsString;
    rel_nr_processo := '';
    qry_rel_imp_demurrage_proc_.First;
    while Not qry_rel_imp_demurrage_proc_.EOF do
    begin
      FimA := False;
      FimB := False;
      FimC := False;
      FimP := False;

      qry_rel_imp_demurrage_.Close;
      qry_rel_imp_demurrage_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
      qry_rel_imp_demurrage_.ParamByName('NR_PROCESSO').AsString       := qry_rel_imp_demurrage_proc_.FieldByName('NR_PROCESSO').AsString;
      qry_rel_imp_demurrage_.Prepare;
      qry_rel_imp_demurrage_.Open;

      qry_rel_imp_demurrage_pagto_.Close;
      qry_rel_imp_demurrage_pagto_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
      qry_rel_imp_demurrage_pagto_.ParamByName('NR_PROCESSO').AsString       := qry_rel_imp_demurrage_proc_.FieldByName('NR_PROCESSO').AsString;
      qry_rel_imp_demurrage_pagto_.Prepare;
      qry_rel_imp_demurrage_pagto_.Open;

      qry_rel_imp_demurrage_ref_.Close;
      qry_rel_imp_demurrage_ref_.ParamByName('NR_PROCESSO').AsString         := qry_rel_imp_demurrage_proc_.FieldByName('NR_PROCESSO').AsString;
      qry_rel_imp_demurrage_ref_.Prepare;
      qry_rel_imp_demurrage_ref_.Open;

      //Unid. Negócio
      if rel_cd_unid_neg <> qry_rel_imp_demurrage_proc_.FieldByName('CD_UNID_NEG').AsString then
      begin
        Saida := 'Unidade: ' + Trim( qry_rel_imp_demurrage_proc_.FieldByName('NM_UNID_NEG').AsString ) + #13#10;
        Write( Txt, Saida );
      end;

      while ( Not FimA ) or ( Not FimB ) or ( Not FimC ) do
      begin
        if Not FimA then
        begin
          // Processo
          if Not FimP then
            Saida := Trim( qry_rel_imp_demurrage_.FieldByName('NR_PROCESSO').AsString ) + ';'
          else
            Saida := ';';
          // Contêiner
          Saida := Saida + Trim( qry_rel_imp_demurrage_.FieldByName('NR_CNTR').AsString ) + ';';
          // Tipo
          Saida := Saida + Trim( qry_rel_imp_demurrage_.FieldByName('NM_TP_CNTR').AsString ) + ';';
          // Demurrage
          Saida := Saida + Trim( qry_rel_imp_demurrage_.FieldByName('IN_DEMURRAGE').AsString ) + ';';
          // Transportador Marítimo
          if Not FimP then
            Saida := Saida + Trim( qry_rel_imp_demurrage_.FieldByName('NM_TRANSPORTADOR').AsString ) + ';'
          else
            Saida := Saida + ';';
          Write( Txt, Saida );
        end
        else
        begin
          Saida := Replicate( ';', 5 );
          Write( Txt, Saida );
        end;

        if Not FimB then
        begin
          // Ref.Cliente
          Saida := Trim( qry_rel_imp_demurrage_ref_.FieldByName('CD_REFERENCIA').AsString ) + ';';
        end
        else
        begin
          Saida := Replicate( ';', 1 );
        end;
        Write( Txt, Saida );

        if Not FimA then
        begin
          if Not FimP then
          begin
            //Exportador
            Saida := Trim( qry_rel_imp_demurrage_.FieldByName('NM_EXPORTADOR').AsString ) + ';';
            //Armazém de Atracação
            Saida := Saida + Trim( qry_rel_imp_demurrage_.FieldByName('NM_ARMAZEM_ATRACACAO').AsString ) + ';';
            //Armazém de Descarga
            Saida := Saida + Trim( qry_rel_imp_demurrage_.FieldByName('NM_ARMAZEM_DESCARGA').AsString ) + ';';
            //Fábrica de Destino
            Saida := Saida + Trim( qry_rel_imp_demurrage_.FieldByName('NM_CLIENTE').AsString ) + ';';
            //Área
            Saida := Saida + Trim( qry_rel_imp_demurrage_.FieldByName('NM_AREA').AsString ) + ';';
            //Data de Envio Doctos
            if Not qry_rel_imp_demurrage_.FieldByName('DT_DOCTOS_OK').IsNull then
              Saida := Saida + FormatDateTime( FData, qry_rel_imp_demurrage_.FieldByName('DT_DOCTOS_OK').AsDateTime );
            Saida := Saida + ';';
            //Data de Entrada do Navio
            if Not qry_rel_imp_demurrage_.FieldByName('DT_ENT').IsNull then
              Saida := Saida + FormatDateTime( FData, qry_rel_imp_demurrage_.FieldByName('DT_ENT').AsDateTime );
            Saida := Saida + ';';
            //Data de Entrada no Terminal Retroportuário
            if Not qry_rel_imp_demurrage_.FieldByName('DT_ENT_TERMINAL').IsNull then
              Saida := Saida + FormatDateTime( FData, qry_rel_imp_demurrage_.FieldByName('DT_ENT_TERMINAL').AsDateTime );
            Saida := Saida + ';';
            //Data da Presença de Carga
            if Not qry_rel_imp_demurrage_.FieldByName('DT_PRES_CARGA').IsNull then
              Saida := Saida + FormatDateTime( FData, qry_rel_imp_demurrage_.FieldByName('DT_PRES_CARGA').AsDateTime );
            Saida := Saida + ';';
            //Data da Liberação do B/L
            if Not qry_rel_imp_demurrage_.FieldByName('DT_LIB_BL').IsNull then
              Saida := Saida + FormatDateTime( FData, qry_rel_imp_demurrage_.FieldByName('DT_LIB_BL').AsDateTime );
            Saida := Saida + ';';
            //Data do Registro DI
            if Not qry_rel_imp_demurrage_.FieldByName('DT_REG_DI').IsNull then
              Saida := Saida + FormatDateTime( FData, qry_rel_imp_demurrage_.FieldByName('DT_REG_DI').AsDateTime );
            Saida := Saida + ';';
          end
          else
          begin
            Saida := Replicate( ';', 11 );
          end;
          Write( Txt, Saida );
          if Not FimP then
          begin
            //Canal de Parametrização
            Saida := Trim( qry_rel_imp_demurrage_.FieldByName('NM_CANAL').AsString ) + ';';
            //Data da Averbação no Terminal
            if Not qry_rel_imp_demurrage_.FieldByName('DT_AVERBACAO').IsNull then
              Saida := Saida + FormatDateTime( FData, qry_rel_imp_demurrage_.FieldByName('DT_AVERBACAO').AsDateTime );
            Saida := Saida + ';';
            //Data do Desembaraço DI
            if Not qry_rel_imp_demurrage_.FieldByName('DT_DESEMB').IsNull then
              Saida := Saida + FormatDateTime( FData, qry_rel_imp_demurrage_.FieldByName('DT_DESEMB').AsDateTime );
            Saida := Saida + ';';
            //Data da Retirada CI
            if Not qry_rel_imp_demurrage_.FieldByName('DT_CI').IsNull then
              Saida := Saida + FormatDateTime( FData, qry_rel_imp_demurrage_.FieldByName('DT_CI').AsDateTime );
            Saida := Saida + ';';
            //Data da Inspeção no MA
            if Not qry_rel_imp_demurrage_.FieldByName('DT_INSP_MA').IsNull then
              Saida := Saida + FormatDateTime( FData, qry_rel_imp_demurrage_.FieldByName('DT_INSP_MA').AsDateTime );
            Saida := Saida + ';';
            //Data de Envio da NF ao Transportador
            if Not qry_rel_imp_demurrage_.FieldByName('DT_NF_TRANSP').IsNull then
              Saida := Saida + FormatDateTime( FData, qry_rel_imp_demurrage_.FieldByName('DT_NF_TRANSP').AsDateTime );
            Saida := Saida + ';';
            //Transportador
            Saida := Saida + Trim( qry_rel_imp_demurrage_.FieldByName('NM_TRANSP_NAC').AsString ) + ';';
            //Data de Entrada na Fábrica
            if Not qry_rel_imp_demurrage_.FieldByName('DT_ENTR_FABRICA').IsNull then
              Saida := Saida + FormatDateTime( FData, qry_rel_imp_demurrage_.FieldByName('DT_ENTR_FABRICA').AsDateTime );
            Saida := Saida + ';';
          end
          else
          begin
            Saida := Replicate( ';', 8 );
          end;
          // Estava dentro do IF acima, mas foi solicitado pela Maira para exibir sempre. E foi alterado o Replicate de 9 para 8 - Michel - 13/05/2009
          //Data de Devolução do Contêiner
          if Not qry_rel_imp_demurrage_.FieldByName('DT_DEVOLUCAO_CNTR').IsNull then
            Saida := Saida + FormatDateTime( FData, qry_rel_imp_demurrage_.FieldByName('DT_DEVOLUCAO_CNTR').AsDateTime );
          Saida := Saida + ';';
          Write( Txt, Saida );
        end
        else
        begin
          Saida := Replicate( ';', 20 );
          Write( Txt, Saida );
        end;

        if Not FimC then
        begin
          //Total de Demurrage Pago
          Saida := FormatFloat( '#0,.00', qry_rel_imp_demurrage_pagto_.FieldByName('VL_PAGAMENTO').AsFloat ) + ';';
          //Dt Pagamento da Demurrage
          if Not qry_rel_imp_demurrage_pagto_.FieldByName('DT_PAGAMENTO').IsNull then
            Saida := Saida + FormatDateTime( FData, qry_rel_imp_demurrage_pagto_.FieldByName('DT_PAGAMENTO').AsDateTime );
          Saida := Saida + ';';
          Write( Txt, Saida );
        end
        else
        begin
          Saida := Saida + Replicate( ';', 2 );
          Write( Txt, Saida );
        end;

        Saida := #13#10;
        Write( Txt, Saida );

        qry_rel_imp_demurrage_.Next;
        qry_rel_imp_demurrage_pagto_.Next;
        qry_rel_imp_demurrage_ref_.Next;

        if Not FimA then
          if qry_rel_imp_demurrage_.EOF then
            FimA := True;

        if Not FimB then
          if qry_rel_imp_demurrage_ref_.EOF then
            FimB := True;

        if Not FimC then
          if qry_rel_imp_demurrage_pagto_.EOF then
            FimC := True;

        FimP := True;
      end;

      rel_cd_unid_neg := qry_rel_imp_demurrage_proc_.FieldByName('CD_UNID_NEG').AsString;

      qry_rel_imp_demurrage_proc_.Next;
    end;
    qry_rel_imp_demurrage_proc_.Close;

    CloseFile( Txt );

    BoxMensagem( 'Arquivo Gerado com sucesso!', 3 );

  end;
end;

procedure Tfrm_sel_unid_cli.Button1Click(Sender: TObject);
begin
  with datm_sel_unid_cli do
  begin
    ppView.Visible := True;
    ppView.Report  := datm_sel_unid_cli.ppReport;
    ppView.Width   := Screen.Width;
    ppView.Height  := Screen.Height;
    ppReport.PrintToDevices;
  end;
end;

procedure Tfrm_sel_unid_cli.btn_co_produtoClick(Sender: TObject);
begin
  with datm_sel_unid_cli do
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

procedure Tfrm_sel_unid_cli.msk_cd_produtoExit(Sender: TObject);
begin
  if msk_cd_produto.Text = '' then
  begin
    if tp_rel in [31] then edt_nm_produto.Text := 'Todos'
    else edt_nm_produto.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_produto );
  if msk_cd_produto.Text <> '' then
  begin
    with datm_sel_unid_cli do
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

procedure Tfrm_sel_unid_cli.EncheMatriz;
begin
  arConta[1] := '6410100001';
  arConta[2] := '6410300000';
  arConta[3] := '6110100005';
  arConta[4] := '6410200005';
  arConta[5] := '2111100005';
  arConta[6] := '6210100007';
  arConta[7] := '6310100009';
  arConta[8] := '1121100007';
  arConta[9] := '1120400007';
  arConta[10] := '1120500001';
  arConta[11] := '1120300002';
  arConta[12] := '1121300006';
  arConta[13] := '6410400004';
  arConta[14] := '2110800003';
  arConta[15] := '6120200002';

  nmConta[1] := 'DESPESAS ADMINISTRATIVAS';
  nmConta[2] := 'DESPESAS C/ PESSOAL';
  nmConta[3] := 'PRESTAÇÕES DE SERVIÇOS';
  nmConta[4] := 'HONORÁRIOS DIRETORIA';
  nmConta[5] := 'CRED. E DEV. SÓCIO / PARENT';
  nmConta[6] := 'IMPOSTOS';
  nmConta[7] := 'CUSTO DOS SERV. PRESTADOS';
  nmConta[8] := 'ADTO A FORNECEDOR';
  nmConta[9] := 'ADIANT 13º SALÁRIO';
  nmConta[10] := 'ADIANT DE FÉRIAS';
  nmConta[11] := 'ADIANT FUNCIONÁRIO';
  nmConta[12] := 'EMPRÉSTIMO À FUNCIONÁRIO';
  nmConta[13] := 'ENCARGOS SOCIAIS';
  nmConta[14] := 'SAL. GRAT. HONORÁRIOS A PAGAR';
  nmConta[15] := 'OUTRAS RECEITAS FINANCEIRAS';
end;

procedure Tfrm_sel_unid_cli.GeraFluxoCaixa;
var
  nr_identificador, nLinha, nColuna, vDiferencaDias, x : Integer;
  Excel, xlWorkB, oSheet: OleVariant;
  vQryTransf : TQuery;
  vDtMov, vDtReg : TDateTime;
  vSelec, vSSR, vSSP, vNomeItem: String;

    function ColExcel(col: integer): string;
    const vLetra: array [0..26] of string = ('','A','B','C','D','E','F','G','H','I','J','K',
                                              'L','M','N','O','P','Q','R','S','T','U','V',
                                              'W','X','Y','Z');
  begin
    Result := vletra[col div 26];
    Result := Result + vletra[col mod 26];
    //trata exceção , a letra z
    if vLetra[(col - 1) mod 26] = 'Y' then
       Result := vletra[(col - 1) div 26] + 'Z';
  end;

begin
  try
    with datm_sel_unid_cli do
    begin
  //    Screen.Cursor := crHourGlass;
      case cbb_selec.ItemIndex of
      0: vSelec := '1';
      1: vSelec := '0';
      2: vSelec := 'X';
      end;

      datm_main.db_broker.StartTransaction;
      CloseStoredProc( sp_rel_fluxo_cx );
      if Trim( msk_cd_unid_neg.Text ) = '' then
        sp_rel_fluxo_cx.ParamByName('@cd_unid_neg').AsString := 'X'
      else
        sp_rel_fluxo_cx.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
      sp_rel_fluxo_cx.ParamByName('@dt_inicio').AsDate      := msk_dt_inicio.Date;
      sp_rel_fluxo_cx.ParamByName('@dt_fim').AsDate         := msk_dt_fim.Date;
      sp_rel_fluxo_cx.ParamByName('@in_selecionado').AsString := vSelec;
      ExecStoredProc( sp_rel_fluxo_cx );
      nr_identificador := sp_rel_fluxo_cx.ParamByName('@nr_identificador').AsInteger;
      CloseStoredProc( sp_rel_fluxo_cx   );
      datm_main.db_broker.Commit;

      with Tquery.Create(Application) do
      begin
        DataBaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add( 'SELECT CD_UNID_NEG, DT_MOVIMENTO, SUM( VL_SALDO )AS SALDO, NR_CONTA, TP_MOVIMENTO, NM_CONTA ' );
        SQL.Add( 'FROM TREL_FLUXO_CAIXA WHERE TP_MOVIMENTO NOT IN ( ''SR'', ''SP'' )' );
        SQL.Add( ' GROUP BY CD_UNID_NEG, NR_CONTA, DT_MOVIMENTO, TP_MOVIMENTO, NM_CONTA ' );
        SQL.Add( 'ORDER BY NR_CONTA, DT_MOVIMENTO, TP_MOVIMENTO' );
        Open;

        if RecordCount = 0 then
          BoxMensagem('Não há dados para exibir', 2)
        else
        begin
          try
            Excel := CreateOLEObject('Excel.Application');
            xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\FLUXO.XLS' );
            Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\FLUXO_' +
            Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');
            oSheet := Excel.WorkBooks[1].Worksheets[1];
            vDiferencaDias := ( DaysBetween( msk_dt_fim.Date, msk_dt_inicio.Date ) ) + 1;
          except
            BoxMensagem('Erro na criação da Planilha.', 2) ;
            Free;
            Exit;
          end;
        end;

        // nome do relatório
        oSheet.Cells[ 02, 02 ].Font.Bold := True;
        oSheet.Cells[ 02, 02 ].value := 'Fluxo de Caixa Administrativo - Período de  ' + DateToStr(msk_dt_inicio.Date) + '  à  ' + DateToStr(msk_dt_fim.Date);
        // filtros da planilha
        oSheet.Cells[ 04, 03 ].value := edt_nm_unid_neg.text;
        oSheet.Cells[ 05, 03 ].value := ConsultaLookUP('TUSUARIO','CD_USUARIO',str_cd_usuario,'AP_USUARIO') + '  em  ' +  DateToStr( date() ) + ' - ' + TimeToStr( time() );

        // Lança data no topo das planilhas
        nColuna := 2;
        vDtReg := msk_dt_inicio.Date;
        for x:= 1 to vDiferencaDias do
        begin
          oSheet.Cells[ 7, nColuna ].value :=  Copy( DateToSTR( vDtReg ), 1, 2 );
          oSheet := Excel.WorkBooks[1].Worksheets[2];
          oSheet.Cells[ 1, nColuna ].value :=  Copy( DateToSTR( vDtReg ), 1, 2 );
          oSheet := Excel.WorkBooks[1].Worksheets[3];
          oSheet.Cells[ 1, nColuna ].value :=  Copy( DateToSTR( vDtReg ), 1, 2 );
          oSheet := Excel.WorkBooks[1].Worksheets[1];
          nColuna := nColuna + 1;
          vDtReg := vDtReg + 1;
        end;
      end;

      //lança transferências bancárias
      vQryTransf := TQuery.Create(application);
      vQryTransf.DataBaseName := 'DBBROKER';
      vQryTransf.SQL.Clear;
      vQryTransf.SQL.Add('SELECT SUM(CASE TP_NATUREZA WHEN "C" THEN VL_LANCAMENTO WHEN "D" THEN (VL_LANCAMENTO)*(-1) END), DT_MOVIMENTO FROM TCAIXA ');
//    if Trim(msk_cd_unid_neg.Text) = '01' then
      vQryTransf.SQL.Add('  WHERE CD_BANCO = ''310'' ');
//      else if Trim(msk_cd_unid_neg.Text) = '02' then
//        vQryTransf.SQL.Add('  WHERE CD_BANCO = ''329'' ')
//      else if Trim(msk_cd_unid_neg.Text) = '' then
//        vQryTransf.SQL.Add('  WHERE CD_BANCO IN (''310'', ''329'') ');
      vQryTransf.SQL.Add('   AND CD_CT_CONTABIL IN ("010040000002", "010040000006", "010040000004", "010040000001", "010040020001", "010040010006", "010040010005", "010040000007") ');
      vQryTransf.SQL.Add('   AND DT_MOVIMENTO BETWEEN "' + DateToStr(msk_dt_inicio.Date) + '" AND "' + DateToStr(msk_dt_fim.Date) + '" ');
      vQryTransf.SQL.Add('   AND TP_LANCAMENTO = "C" ');
      vQryTransf.SQL.Add(' GROUP BY DT_MOVIMENTO ');
      vQryTransf.Open;

      //ENTRADAS
      //transferência de banco
      nColuna := 2;
      vDtReg := msk_dt_inicio.Date;
      for x := 1 to vDiferencaDias do
      begin
        vQryTransf.First;
        if vQryTransf.Locate('DT_MOVIMENTO', vDtReg, [loCaseInsensitive]) then
          oSheet.Cells[ 11, nColuna ].value := vQryTransf.Fields[0].AsFloat;
        vDtReg := vDtReg + 1;
        nColuna := nColuna + 1;
      end;
      vQryTransf.Close;
      vQryTransf.Free;

      // Lançamento Diversos - ANDRÉ 10/12/2008  (3. CRÉDITOS DIVERSOS E 4. PAGAMENTOS DIVERSOS)
      nColuna := 2;
      vDtReg := msk_dt_inicio.Date;
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add(' SELECT C.DT_MOVIMENTO,');
//        SQL.Add('   SUM(CASE C1.IN_RESTITUI WHEN ''0'' THEN C1.VL_LANCAMENTO WHEN ''1'' THEN (C1.VL_LANCAMENTO) * (-1) END) AS CREDITO,');
//        SQL.Add('   SUM(CASE C2.IN_RESTITUI WHEN ''0'' THEN C2.VL_LANCAMENTO WHEN ''1'' THEN (C2.VL_LANCAMENTO) * (-1) END) AS DEBITO');
        SQL.Add('   SUM(C1.VL_LANCAMENTO) AS CREDITO,');
        SQL.Add('   SUM(C2.VL_LANCAMENTO) AS DEBITO');
        SQL.Add(' FROM TCAIXA C');
        SQL.Add('   LEFT JOIN TCAIXA C1 ON C1.NR_LANCAMENTO = C.NR_LANCAMENTO AND C1.DT_MOVIMENTO = C.DT_MOVIMENTO AND C1.TP_NATUREZA = ''C'' ');
        SQL.Add('   LEFT JOIN TCAIXA C2 ON C2.NR_LANCAMENTO = C.NR_LANCAMENTO AND C2.DT_MOVIMENTO = C.DT_MOVIMENTO AND C2.TP_NATUREZA = ''D'' ');
//        if Trim(msk_cd_unid_neg.Text) = '01' then
        SQL.Add('  WHERE C.CD_BANCO = ''310'' ');
//        else
//          if Trim(msk_cd_unid_neg.Text) = '02' then
//            SQL.Add('  WHERE C.CD_BANCO = ''329'' ')
//          else if Trim(msk_cd_unid_neg.Text) = '' then
//            SQL.Add('  WHERE C.CD_BANCO IN (''310'', ''329'')');
        SQL.Add('  AND C.DT_MOVIMENTO BETWEEN CONVERT (DATETIME, ''' + DateToStr(vDtReg) + ''', 103)');
        SQL.Add('                         AND CONVERT (DATETIME, ''' + DatetoStr(msk_dt_fim.date) + ''', 103)');
        SQL.Add('  AND C.IN_CANCELADO = ''0'' ');
        SQL.Add('  AND ISNULL(C.CD_CT_CONTABIL, '''') NOT IN ("010040000002", "010040000006", "010040000004", "010040000001", "010040020001", "010040010006", "010040010005", "010040000007") ');
        SQL.Add('  GROUP BY C.DT_MOVIMENTO');
        Open;
        First;
        while not EOF do
        begin
          if DayOf(Fields[0].AsDateTime) <> StrToInt(oSheet.Cells[ 7, nColuna ].Value)  then
            nColuna := nColuna + 1
          else
          begin
            oSheet.Cells[ 13, nColuna ].value := Fields[1].AsFloat; //- oSheet.Cells[ 11, nColuna ].value;
            oSheet.Cells[ 15, nColuna ].value := Fields[2].AsFloat; //- oSheet.Cells[ 11, nColuna ].value;
            vDtReg := vDtReg + 1;
            nColuna := nColuna + 1;
            Next; // Novo registro
          end;
        end;
        Free;
      end;

      // Receitas Recebidas e Previstas André 10/12/2008
      with qry_rel_fluxo_caixa_receitas do
      begin
        Open;
        First;
        nColuna := 2;
        vDtReg := msk_dt_inicio.Date;
        if not IsEmpty then
        while not EOF do
        begin
          if DayOf(Fields[0].asDatetime) <> StrToInt(oSheet.Cells[ 7, nColuna ].Value) then
            nColuna := nColuna + 1
          else
          begin
          // Recebidas
            oSheet.Cells[ 20, nColuna ].value := Fields[1].AsFloat;
            oSheet.Cells[ 21, nColuna ].value := Fields[2].AsFloat;
            oSheet.Cells[ 22, nColuna ].value := Fields[3].AsFloat;
          // Previstas
            oSheet.Cells[ 25, nColuna ].value := Fields[4].AsFloat;
            oSheet.Cells[ 26, nColuna ].value := Fields[5].AsFloat;
            oSheet.Cells[ 27, nColuna ].value := Fields[6].AsFloat;

          //fórmula do total Receitas Recebidas
            osheet.Cells[ 19, nColuna ].Value := '= ' + ColExcel(nColuna) + '20 + ' + ColExcel(nColuna) + '21 + ' + ColExcel(nColuna) + '22';
          //fórmula do total Receitas Previstas
            oSheet.Cells[ 24, nColuna ].value := '= ' + ColExcel(nColuna) + '25 + ' + ColExcel(nColuna) + '26 + ' + ColExcel(nColuna) + '27';

          //soma 1 dia na data
            vDtReg := vDtReg + 1;
            nColuna := nColuna + 1;
            Next;
          end;
        end;
        nColuna := 0;
      end;


      // SAÍDAS REAIS e PREVISTAS     ANDRÉ 11/12/2008

{      vSSR := ConsultaLookUPSQL( 'SELECT COUNT(*) BLABLABLA FROM TREL_FLUXO_CAIXA WHERE TP_MOVIMENTO = ''SSR'' ', 'BLABLABLA');
      vSSP := ConsultaLookUPSQL( 'SELECT COUNT(*) BLABLABLA FROM TREL_FLUXO_CAIXA WHERE TP_MOVIMENTO = ''SSP'' ', 'BLABLABLA');
      vSSR := IIF (StrToInt(vSSR) >= StrToInt(vSSP), 'SSR', 'SSP');
      vSSP := IIF (vSSR = 'SSR', 'SSP', 'SSR'); }

      with TQuery.Create(Application) do
      begin
        DataBaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add( ' SELECT F1.DT_MOVIMENTO,');
        SQL.Add( '   (SELECT CONVERT( FLOAT, ISNULL(SUM(F2.VL_SALDO), 0)) FROM TREL_FLUXO_CAIXA F2 WHERE F2.DT_MOVIMENTO = F1.DT_MOVIMENTO AND F2.TP_MOVIMENTO = ''SSP'') AS SSP,');
        SQL.Add( '   (SELECT CONVERT( FLOAT, ISNULL(SUM(F2.VL_SALDO), 0)) FROM TREL_FLUXO_CAIXA F2 WHERE F2.DT_MOVIMENTO = F1.DT_MOVIMENTO AND F2.TP_MOVIMENTO = ''SSR'') AS SSR ');
        SQL.Add( ' FROM TREL_FLUXO_CAIXA F1');
        SQL.Add( ' WHERE F1.TP_MOVIMENTO IN (''SSP'', ''SSR'')');
        SQL.Add( ' GROUP BY F1.DT_MOVIMENTO');
        SQL.Add( ' ORDER BY F1.DT_MOVIMENTO');

       {SQL.Add( ' SELECT F1.DT_MOVIMENTO, SUM(ISNULL(F1.VL_SALDO, 0)), ');
        SQL.Add( '  (SELECT SUM(ISNULL(F2.VL_SALDO, 0)) FROM TREL_FLUXO_CAIXA F2 ');
        SQL.Add( '    WHERE F2.DT_MOVIMENTO = F1.DT_MOVIMENTO AND F2.TP_MOVIMENTO = ''' + vSSP + ''') ');
        SQL.Add( ' FROM TREL_FLUXO_CAIXA F1 ');
        SQL.Add( ' WHERE F1.TP_MOVIMENTO = ''' + vSSR + ''' ');
        SQL.Add( ' GROUP BY DT_MOVIMENTO ');
        SQL.Add( ' ORDER BY DT_MOVIMENTO ');  }
        Open;
        First;

        if RecordCount <> 0 then
        begin
          nColuna := 2;
          for x:= 1 to vDiferencaDias do
          begin
            if DayOf(Fields[0].AsDateTime) <> StrToInt(oSheet.Cells[ 7, nColuna ].Value) then
              nColuna := nColuna + 1
            else
            begin
              oSheet.Cells[ 32, nColuna ].value := Fields[1].AsFloat;
              oSheet.Cells[ 30, nColuna ].value := Fields[2].AsFloat;
              nColuna := nColuna + 1;
              Next;
            end;
          end;
        end;

        // TOTALIZAÇÃO DAS DESPESAS (PLANILHA FLUXO) André 08/01/2009
        SQL.Clear;
        SQL.Add(' SELECT DT_MOVIMENTO, SUM(VL_SALDO), PREFIXO, TP_MOVIMENTO ');
        SQL.Add(' FROM VW_TREL_FLUXO_CAIXA ');
        SQL.Add(' WHERE PREFIXO <> 0 ');
        SQL.Add(' GROUP BY DT_MOVIMENTO, PREFIXO, TP_MOVIMENTO ');
        Open;

        //Inclui registros nas linhas 38 a 88
        nColuna := 2;
        First;
        while not EOF do
        begin
          if DayOf(Fields[0].AsDateTime) <> StrToInt(oSheet.Cells[ 7, nColuna ].Value) then
            nColuna := nColuna + 1
          else
          begin
            Case Fields[2].AsInteger of
              6055 : if Fields[3].AsString = 'SP' then
                       oSheet.Cells[ 39, nColuna ].value := Fields[1].AsFloat
                     else
                       oSheet.Cells[ 40, nColuna ].value := Fields[1].AsFloat;
              6051 : if Fields[3].AsString = 'SP' then
                       oSheet.Cells[ 43, nColuna ].value := Fields[1].AsFloat
                     else
                       oSheet.Cells[ 44, nColuna ].value := Fields[1].AsFloat;
              6000 : if Fields[3].AsString = 'SP' then
                       oSheet.Cells[ 47, nColuna ].value := Fields[1].AsFloat
                     else
                       oSheet.Cells[ 48, nColuna ].value := Fields[1].AsFloat;
              6053 : if Fields[3].AsString = 'SP' then
                       oSheet.Cells[ 51, nColuna ].value := Fields[1].AsFloat
                     else
                       oSheet.Cells[ 52, nColuna ].value := Fields[1].AsFloat;
              6020 : if Fields[3].AsString = 'SP' then
                       oSheet.Cells[ 55, nColuna ].value := Fields[1].AsFloat
                     else
                       oSheet.Cells[ 56, nColuna ].value := Fields[1].AsFloat;
              1013 : if Fields[3].AsString = 'SP' then
                       oSheet.Cells[ 59, nColuna ].value := Fields[1].AsFloat
                     else
                       oSheet.Cells[ 60, nColuna ].value := Fields[1].AsFloat;
              1015 : if Fields[3].AsString = 'SP' then
                       oSheet.Cells[ 63, nColuna ].value := Fields[1].AsFloat
                     else
                       oSheet.Cells[ 64, nColuna ].value := Fields[1].AsFloat;
              1016 : if Fields[3].AsString = 'SP' then
                       oSheet.Cells[ 67, nColuna ].value := Fields[1].AsFloat
                     else
                       oSheet.Cells[ 68, nColuna ].value := Fields[1].AsFloat;
              1014 : if Fields[3].AsString = 'SP' then
                       oSheet.Cells[ 71, nColuna ].value := Fields[1].AsFloat
                     else
                       oSheet.Cells[ 72, nColuna ].value := Fields[1].AsFloat;
              1019 : if Fields[3].AsString = 'SP' then
                       oSheet.Cells[ 75, nColuna ].value := Fields[1].AsFloat
                     else
                       oSheet.Cells[ 76, nColuna ].value := Fields[1].AsFloat;
              6052 : if Fields[3].AsString = 'SP' then
                       oSheet.Cells[ 79, nColuna ].value := Fields[1].AsFloat
                     else
                       oSheet.Cells[ 80, nColuna ].value := Fields[1].AsFloat;
              2003 : if Fields[3].AsString = 'SP' then
                       oSheet.Cells[ 83, nColuna ].value := Fields[1].AsFloat
                     else
                       oSheet.Cells[ 84, nColuna ].value := Fields[1].AsFloat;
              6001 : if Fields[3].AsString = 'SP' then
                       oSheet.Cells[ 87, nColuna ].value := Fields[1].AsFloat
                     else
                       oSheet.Cells[ 88, nColuna ].value := Fields[1].AsFloat;
            end; // case
            Next;
          end;  //else
        end; //begin
        Free;
      end; // with


        // TOTAIS
        // Saldo Inicial
        vQryTransf := Tquery.Create(Application);
        vQryTransf.DataBaseName := 'DBBROKER';
        vQryTransf.SQL.Clear;
        vQryTransf.SQL.Add( 'SELECT ROUND(SUM(ISNULL( VL_SALDO_ANT, 0 ) ),2) AS VL_SALDO, DT_MOVIMENTO ' ); {+ ISNULL( VL_TOT_CRE, 0 ) - ISNULL( VL_TOT_DEB, 0 ) retirado para pegar somente o saldo inicial}
        vQryTransf.SQL.Add( ' FROM TCAIXA_SALDOS (NOLOCK) ' );
        vQryTransf.SQL.Add( ' WHERE DT_MOVIMENTO BETWEEN CONVERT (DATETIME, CONVERT (VARCHAR, ''' + DatetoStr(msk_dt_inicio.date) + ''', 103), 103)');
        vQryTransf.SQL.Add('                         AND CONVERT (DATETIME, CONVERT (VARCHAR, ''' + DatetoStr(msk_dt_fim.date) + ''', 103), 103)');
//        if Trim(msk_cd_unid_neg.Text) = '01' then
//        begin
        vQryTransf.SQL.Add(' AND CD_UNID_NEG = ''' +msk_cd_unid_neg.Text+ '''');
        vQryTransf.SQL.Add(' AND (CD_CT_CAIXA = (SELECT TOP 1(CD_CONTA) FROM TCONTA_CAIXA (NOLOCK) WHERE  CD_BANCO = ''310''))  ');
       {end
       else
         if Trim(msk_cd_unid_neg.Text) = '02' then
         begin
           vQryTransf.SQL.Add( ' AND CD_UNID_NEG = ''02'' ');
           vQryTransf.SQL.Add(' AND CD_CT_CAIXA = (SELECT TOP 1(CD_CONTA) FROM TCONTA_CAIXA (NOLOCK) WHERE  CD_BANCO = ''329'')  ');
         end
         else
         if Trim(msk_cd_unid_neg.Text) = '' then
         begin
           vQryTransf.SQL.Add( ' AND CD_UNID_NEG IN ('''') ');
           vQryTransf.SQL.Add(' AND (CD_CT_CAIXA = (SELECT TOP 1(CD_CONTA) FROM TCONTA_CAIXA (NOLOCK) WHERE  CD_BANCO = ''310'')  ');
           vQryTransf.SQL.Add(' OR   CD_CT_CAIXA = (SELECT TOP 1(CD_CONTA) FROM TCONTA_CAIXA (NOLOCK) WHERE  CD_BANCO = ''329''))  ');
         end;}
        vQryTransf.SQL.Add('GROUP BY DT_MOVIMENTO ');
        vQryTransf.SQL.Add('ORDER BY DT_MOVIMENTO ');
        vQryTransf.Open;

        nColuna := 2;
        for x:= 1 to vDiferencaDias do
        begin
          if (vQryTransf.Fields[1].AsDateTime <= Date) and (vQryTransf.Eof = False)  then
          begin
            if DayOf(vQryTransf.Fields[1].AsDatetime) <> StrToInt(oSheet.Cells[ 7 , nColuna ].Value) then
              nColuna := nColuna + 1
            else
            begin
              oSheet.cells[ 9 , nColuna ].Value := vQryTransf.Fields[0].AsFloat;
              oSheet.Cells[ 35, nColuna ].value := '= ' + ColExcel(nColuna) + '9 + ' + ColExcel(nColuna) + '11 + ' + ColExcel(nColuna) + '13 - ' + ColExcel(nColuna) + '15';
              oSheet.Cells[ 36, nColuna ].value := '= ' + ColExcel(nColuna) + '9 + ' + ColExcel(nColuna) + '24 - ' + ColExcel(nColuna) + '32';
            end;
            vQryTransf.Next;
            nColuna := nColuna + 1;
          end
          else
          begin
            nColuna := nColuna + 1;
            oSheet.Cells[ 9, nColuna ].value :=  '= ' + ColExcel(nColuna - 1) + '36';
            oSheet.Cells[ 35, nColuna ].value := '= ' + ColExcel(nColuna) + '9 + ' + ColExcel(nColuna) + '11 + ' + ColExcel(nColuna) + '13 - ' + ColExcel(nColuna) + '15';
            oSheet.Cells[ 36, nColuna ].value := '= ' + ColExcel(nColuna) + '9 + ' + ColExcel(nColuna) + '24 - ' + ColExcel(nColuna) + '32';
          end;
        end;
        vQryTransf.Close;
        vQryTransf.Free;

      // Planilha Saídas Previstas - Analítico (ANDRÉ 11/12/2008)
      with Tquery.Create(Application) do
      begin
        DataBaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add( ' SELECT DT_MOVIMENTO, NM_CONTA, VL_SALDO ' );
        SQL.Add( ' FROM TREL_FLUXO_CAIXA' );
        SQL.Add( ' WHERE TP_MOVIMENTO = ''SP'' ');
        SQL.Add( ' GROUP BY NM_CONTA, DT_MOVIMENTO, VL_SALDO ' );
        SQL.Add( ' ORDER BY NM_CONTA ' );
        Open;
        First;

        if RecordCount <> 0 then
        begin
          oSheet := Excel.WorkBooks[1].Worksheets[2];
          nLinha := 1;
          nColuna := 2;
          // Insere nome dos Itens de Saida Real
          while not EOF do
          begin
            if vNomeItem <> Fields[1].AsString then
            begin
              nLinha := nLinha + 2;
              vNomeItem := Fields[1].AsString;
              oSheet.Cells[ nLinha, 1 ].value := Fields[1].AsString;
              oSheet.Cells[ nLinha, 1 ].Font.Bold := True;
            end
            else
              if DayOf(Fields[0].AsDateTime) <> StrToInt(Excel.WorkBooks[1].Worksheets[1].Cells[ 7, nColuna ].Value) then
                nColuna := nColuna + 1
              else
              begin
                oSheet.Cells[ nLinha, nColuna ].value := Fields[2].AsFloat;
                nColuna := 2;
                Next;
              end;
          end;
        end;
        Free;
      end; //with

      // Planilha Saídas Reais - Analítico (ANDRÉ 11/12/2008)
      with Tquery.Create(Application) do
      begin
        DataBaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add( ' SELECT DT_MOVIMENTO, NM_CONTA, VL_SALDO ' );
        SQL.Add( ' FROM TREL_FLUXO_CAIXA' );
        SQL.Add( ' WHERE TP_MOVIMENTO = ''SR'' ');
        SQL.Add( ' GROUP BY NM_CONTA, DT_MOVIMENTO, VL_SALDO ' );
        SQL.Add( ' ORDER BY NM_CONTA ' );
        Open;
        First;

        if RecordCount <> 0 then
        begin
          oSheet := Excel.WorkBooks[1].Worksheets[3];
          nLinha := 1;
          nColuna := 2;
          // Insere nome dos Itens de Saida Real
          while not EOF do
          begin
            if vNomeItem <> Fields[1].AsString then
            begin
              nLinha := nLinha + 2;
              vNomeItem := Fields[1].AsString;
              oSheet.Cells[ nLinha, 1 ].value := Fields[1].AsString;
              oSheet.Cells[ nLinha, 1 ].Font.Bold := True;
            end
            else
            begin
              if DayOf(Fields[0].AsDateTime) <> StrToInt(Excel.WorkBooks[1].WorkSheets[1].Cells[7 , nColuna ].Value) then
                nColuna := nColuna + 1
              else
              begin
                oSheet.Cells[ nLinha, nColuna ].value := Fields[2].AsFloat;
                nColuna := 2;
                Next;
              end;
            end;
          end;
        end;
        Free;
      end; //with

      // Colore planilha
      oSheet := Excel.WorkBooks[1].Worksheets[1];
      for x:= 1 to vDiferencaDias do
      begin
        oSheet.Cells[ 7, nColuna ].Interior.ColorIndex := 11;  // azul escuro

        nLinha := 8;
        while nLinha < 16 do
        begin
          oSheet.Cells[ nLinha, nColuna ].Interior.ColorIndex := 35;  // azul claro
          nLinha := nLinha + 1;
          if nLinha <> 21 then
            oSheet.Cells[ nLinha, nColuna ].Interior.ColorIndex := 34;  // verde claro
          nLinha := nLinha + 1;
        end;

        oSheet.Cells[ 35, nColuna ].Interior.ColorIndex := 5;  // azul médio
        oSheet.Cells[ 36, nColuna ].Interior.ColorIndex := 5;  // azul médio

        oSheet.Cells[ 17, nColuna ].Interior.ColorIndex := 2;  // branco
        oSheet.Cells[ 28, nColuna ].Interior.ColorIndex := 2;  // branco
        oSheet.Cells[ 34, nColuna ].Interior.ColorIndex := 2;  // branco

        nLinha := 38;
        while nLinha < 97 do
        begin
          oSheet.Cells[ nLinha, nColuna ].Interior.ColorIndex := 35;  // azul claro
          nLinha := nLinha + 1;
          if nLinha <> 97 then
            oSheet.Cells[ nLinha, nColuna ].Interior.ColorIndex := 34;  // verde claro
          nLinha := nLinha + 1;
        end;

        nColuna := nColuna + 1;
      end; // fim colore planilha
      Excel.Visible := True;
    end;
  except
    if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback; // Incluido por michel para evitar transação travada - Michel - 19/04/2010
    Excel.Quit;
    BoxMensagem('Erro na criação da Planilha.', 2) ;
  end;
    FastExecSQL( ' DELETE TREL_FLUXO_CAIXA' );
    FastExecSQL( ' DELETE TREL_FLUXO_CAIXA_RECEITAS' );
end;

procedure Tfrm_sel_unid_cli.btn_co_via_transpClick(Sender: TObject);
begin
  msk_cd_via_transp.Text := ConsultaOnLineEx('TVIA_TRANSP_BROKER', 'VIA DE TRANSPORTE', ['CD_VIA_TRANSP', 'NM_VIA_TRANSP'], ['CODIGO', 'DESCRIÇÃO'], 'CD_VIA_TRANSP');
  msk_cd_via_transpExit(Sender);
end;

procedure Tfrm_sel_unid_cli.msk_cd_via_transpExit(Sender: TObject);
begin
  if Trim(msk_cd_via_transp.Text) <> '' then
  begin
    msk_cd_via_transp.Text := Copy('00' + msk_cd_via_transp.Text, Length(msk_cd_via_transp.Text)+1, 2);
    edt_nm_via_transp.Text := ConsultaLookUP('TVIA_TRANSP_BROKER', 'CD_VIA_TRANSP', msk_cd_via_transp.Text, 'ISNULL(NM_VIA_TRANSP, '''')');
  end
  else
    edt_nm_via_transp.Text := 'Todos';
end;

procedure Tfrm_sel_unid_cli.GeraDIDesembaracada;
var
  nr_identificador: Integer;
begin
  with datm_sel_unid_cli do
  begin
    try
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;

      datm_main.db_broker.StartTransaction;
      CloseStoredProc( sp_rel_di_reg_desemb );
      if Trim( msk_cd_unid_neg.Text ) = '' then
        sp_rel_di_reg_desemb.ParamByName('@cd_unid_neg').AsString   := 'X'
      else
        sp_rel_di_reg_desemb.ParamByName('@cd_unid_neg').AsString   := msk_cd_unid_neg.Text;
      sp_rel_di_reg_desemb.ParamByName('@cd_produto').AsString      := '01';
      if Trim( msk_cd_grupo.Text ) = '' then
        sp_rel_di_reg_desemb.ParamByName('@cd_grupo').AsString      := 'X'
      else
        sp_rel_di_reg_desemb.ParamByName('@cd_grupo').AsString      := msk_cd_grupo.Text;
      if Trim( msk_cd_cliente.Text ) = '' then
        sp_rel_di_reg_desemb.ParamByName('@cd_cliente').AsString    := 'X'
      else
        sp_rel_di_reg_desemb.ParamByName('@cd_cliente').AsString    := msk_cd_cliente.Text;
      if Trim( msk_cd_area.Text ) = '' then
        sp_rel_di_reg_desemb.ParamByName('@cd_area').AsString       := 'X'
      else
        sp_rel_di_reg_desemb.ParamByName('@cd_area').AsString       := msk_cd_area.Text;
      if Trim( msk_cd_via_transp.Text ) = '' then
        sp_rel_di_reg_desemb.ParamByName('@cd_via_transp').AsString := 'X'
      else
        sp_rel_di_reg_desemb.ParamByName('@cd_via_transp').AsString := msk_cd_via_transp.Text;
      sp_rel_di_reg_desemb.ParamByName('@dt_inicio').AsDate       := msk_dt_inicio.Date;
      sp_rel_di_reg_desemb.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;
      sp_rel_di_reg_desemb.ParamByName('@tp_rel').AsString        := '1';

      ExecStoredProc( sp_rel_di_reg_desemb );
      nr_identificador := sp_rel_di_reg_desemb.ParamByName('@nr_identificador').AsInteger;
      CloseStoredProc( sp_rel_di_reg_desemb );
      datm_main.db_broker.Commit;

      qry_rel_di_reg_desemb_.Close;
      qry_rel_di_reg_desemb_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
      qry_rel_di_reg_desemb_.Prepare;
      qry_rel_di_reg_desemb_.Open;

      ppReport.Template.FileName := cDir_RPT + '\RBIMP001.RTM';
      ppReport.Template.LoadFromFile;
      if msk_dt_inicio.Date = msk_dt_fim.Date then
      begin
        pplbl_titulo.Caption := 'DI´s DESEMBARAÇADAS EM ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date );
      end
      else
      begin
        pplbl_titulo.Caption := 'DI´s DESEMBARAÇADAS NO PERÍODO DE ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) +
                                ' A ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date );
      end;
      ppReport.AllowPrintToFile  := True;
      ppReport.TextFileName      := cDir_Rpt + '\RBIMP002.PDF';
      ppReport.DeviceType        := 'PDFFile';
      ppReport.DeviceType        := 'Screen';
      ppReport.Print;

      qry_rel_di_reg_desemb_.Close;

      ApagaDados( 'TREL_DI_REG_DESEMB', nr_identificador );

      Screen.Cursor := crDefault;
      Application.ProcessMessages;
    except
    on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;
end;

procedure Tfrm_sel_unid_cli.GeraDIRegistrada;
var
  nr_identificador: Integer;
begin
  with datm_sel_unid_cli do
  begin
    try
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;

      datm_main.db_broker.StartTransaction;
      CloseStoredProc( sp_rel_di_reg_desemb );
      if Trim( msk_cd_unid_neg.Text ) = '' then
        sp_rel_di_reg_desemb.ParamByName('@cd_unid_neg').AsString   := 'X'
      else
        sp_rel_di_reg_desemb.ParamByName('@cd_unid_neg').AsString   := msk_cd_unid_neg.Text;
      sp_rel_di_reg_desemb.ParamByName('@cd_produto').AsString      := '01';
      if Trim( msk_cd_grupo.Text ) = '' then
        sp_rel_di_reg_desemb.ParamByName('@cd_grupo').AsString      := 'X'
      else
        sp_rel_di_reg_desemb.ParamByName('@cd_grupo').AsString      := msk_cd_grupo.Text;
      if Trim( msk_cd_cliente.Text ) = '' then
        sp_rel_di_reg_desemb.ParamByName('@cd_cliente').AsString    := 'X'
      else
        sp_rel_di_reg_desemb.ParamByName('@cd_cliente').AsString    := msk_cd_cliente.Text;
      if Trim( msk_cd_area.Text ) = '' then
        sp_rel_di_reg_desemb.ParamByName('@cd_area').AsString       := 'X'
      else
        sp_rel_di_reg_desemb.ParamByName('@cd_area').AsString       := msk_cd_area.Text;
      if Trim( msk_cd_via_transp.Text ) = '' then
        sp_rel_di_reg_desemb.ParamByName('@cd_via_transp').AsString := 'X'
      else
        sp_rel_di_reg_desemb.ParamByName('@cd_via_transp').AsString := msk_cd_via_transp.Text;
      sp_rel_di_reg_desemb.ParamByName('@dt_inicio').AsDate       := msk_dt_inicio.Date;
      sp_rel_di_reg_desemb.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;
      sp_rel_di_reg_desemb.ParamByName('@tp_rel').AsString        := '0';
      ExecStoredProc( sp_rel_di_reg_desemb );

      nr_identificador := sp_rel_di_reg_desemb.ParamByName('@nr_identificador').AsInteger;
      CloseStoredProc( sp_rel_di_reg_desemb );
      datm_main.db_broker.Commit;

      qry_rel_di_reg_desemb_.Close;
      qry_rel_di_reg_desemb_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
      qry_rel_di_reg_desemb_.Prepare;
      qry_rel_di_reg_desemb_.Open;

      ppReport.Template.FileName := cDir_RPT + '\RBIMP001.RTM';
      ppReport.Template.LoadFromFile;
      if msk_dt_inicio.Date = msk_dt_fim.Date then
      begin
        pplbl_titulo.Caption := 'DI´s REGISTRADAS EM ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date );
      end
      else
      begin
        pplbl_titulo.Caption := 'DI´s REGISTRADAS NO PERÍODO DE ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) +
                                ' A ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date );
      end;
      if chk_arquivo.Checked then
      begin
        ppReport.AllowPrintToFile  := True;
        ppReport.TextFileName      := cDir_Rpt + '\RBIMP001.PDF';
        ppReport.DeviceType        := 'PDFFile';
      end
      else
      begin
        ppReport.AllowPrintToFile  := False;
        ppReport.DeviceType        := 'Screen';
      end;
      ppReport.Print;
      qry_rel_di_reg_desemb_.Close;

      ApagaDados( 'TREL_DI_REG_DESEMB', nr_identificador );

      Screen.Cursor := crDefault;
      Application.ProcessMessages;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;
end;

procedure Tfrm_sel_unid_cli.GeraExcelRelImpCntrDemurrage(nr_identificador: Integer);
var
  Excel: TExcelApplication;
  WorkBook: ExcelWorkbook;
  Sheet: ExcelWorksheet;
  Linha: Integer;
  Mercadorias: String;
  Processo: String;
begin
  Application.ProcessMessages;

  with datm_sel_unid_cli do
  begin
    try
      Excel := TExcelApplication.Create(Self);
      WorkBook := Excel.Workbooks.Open(cDir_Rpt + '\REL_IMP_CNTR_DEMURRAGE.XLS', EmptyParam,
           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0) as ExcelWorkBook;
      WorkBook.SaveAs(cDir_Rpt + '\REL_IMP_CNTR_DEMURRAGE_' + StringReplace(DateToStr(Now), '/', '-', [rfReplaceAll]) + '.XLS',
         EmptyParam, EmptyParam, EmptyParam, False, False, xlNoChanges, EmptyParam, False, EmptyParam, EmptyParam, 0)
    except
      MessageDlg('Erro ao abrir o arquivo ''' + cDir_Rpt + '\REL_IMP_CNTR_DEMURRAGE.XLS''.'#13 +
         'Verifique se o arquivo existe e se não está sendo utilizado.', mtError, [mbOk], 0);
      Excel.Quit;
      Exit;
    end;

    try
      Sheet := WorkBook.Sheets[1] as ExcelWorkSheet;

      Sheet.Range['E2', 'E2'].Value := 'Período de ' + DateToStr(msk_dt_inicio.Date) + ' à ' + DateToStr(msk_dt_fim.Date);
      if (Trim(msk_cd_cliente.Text) = '') and (Trim(msk_cd_grupo.Text) = '') then
        Sheet.Range['E3', 'E3'].Value := 'Cliente: Todos'
      else if (Trim(msk_cd_cliente.Text) <> '') then
        Sheet.Range['E3', 'E3'].Value := 'Cliente: ' + ConsultaLookUP('TGRUPO', 'CD_GRUPO', msk_cd_grupo.Text, 'NM_GRUPO')
      else if (Trim(msk_cd_cliente.Text) <> '') then
        Sheet.Range['E3', 'E3'].Value := 'Cliente: ' + ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', msk_cd_cliente.Text, 'NM_EMPRESA');

      qry_rel_imp_demurrage_proc_.Close;
      qry_rel_imp_demurrage_proc_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
      qry_rel_imp_demurrage_proc_.Prepare;
      qry_rel_imp_demurrage_proc_.Open;

      Linha := 9;

      qry_rel_imp_demurrage_proc_.First;
      while Not qry_rel_imp_demurrage_proc_.EOF do
      begin
        qry_rel_imp_demurrage_.Close;
        qry_rel_imp_demurrage_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_rel_imp_demurrage_.ParamByName('NR_PROCESSO').AsString       := qry_rel_imp_demurrage_proc_.FieldByName('NR_PROCESSO').AsString;
        qry_rel_imp_demurrage_.Prepare;
        qry_rel_imp_demurrage_.Open;

        qry_rel_imp_demurrage_pagto_.Close;
        qry_rel_imp_demurrage_pagto_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_rel_imp_demurrage_pagto_.ParamByName('NR_PROCESSO').AsString       := qry_rel_imp_demurrage_proc_.FieldByName('NR_PROCESSO').AsString;
        qry_rel_imp_demurrage_pagto_.Prepare;
        qry_rel_imp_demurrage_pagto_.Open;

        qry_rel_imp_demurrage_ref_.Close;
        qry_rel_imp_demurrage_ref_.ParamByName('NR_PROCESSO').AsString         := qry_rel_imp_demurrage_proc_.FieldByName('NR_PROCESSO').AsString;
        qry_rel_imp_demurrage_ref_.Prepare;
        qry_rel_imp_demurrage_ref_.Open;


        while (not qry_rel_imp_demurrage_.Eof) or (not qry_rel_imp_demurrage_pagto_.Eof) or
           (not qry_rel_imp_demurrage_ref_.Eof) do
        begin
          Sheet.Range['A' + IntToStr(Linha), 'A' + IntToStr(Linha)].Value := qry_rel_imp_demurrage_NM_AREA.AsString;
          Sheet.Range['B' + IntToStr(Linha), 'B' + IntToStr(Linha)].Value := qry_rel_imp_demurrage_NR_PROCESSO.AsString;
          if not qry_rel_imp_demurrage_.Eof then
          begin
            Sheet.Range['C' + IntToStr(Linha), 'C' + IntToStr(Linha)].Value := qry_rel_imp_demurrage_NR_CNTR.AsString;
            Sheet.Range['D' + IntToStr(Linha), 'D' + IntToStr(Linha)].Value := qry_rel_imp_demurrage_NM_TP_CNTR.AsString;
          end;
          //if Sheet.Range['E' + IntToStr(Linha-1), 'E' + IntToStr(Linha-1)].Value <> qry_rel_imp_demurrage_NM_TRANSPORTADOR.AsString then
            Sheet.Range['E' + IntToStr(Linha), 'E' + IntToStr(Linha)].Value := qry_rel_imp_demurrage_NM_TRANSPORTADOR.AsString;

          //if not qry_rel_imp_demurrage_ref_.Eof then
          begin
            Sheet.Range['F' + IntToStr(Linha), 'F' + IntToStr(Linha)].Value := qry_rel_imp_demurrage_ref_CD_REFERENCIA.AsString;
            qry_rel_imp_demurrage_ref_merc.Close;
            qry_rel_imp_demurrage_ref_merc.ParamByName('NR_PROCESSO').AsString   := qry_rel_imp_demurrage_ref_NR_PROCESSO.AsString;
            qry_rel_imp_demurrage_ref_merc.ParamByName('CD_REFERENCIA').AsString := qry_rel_imp_demurrage_ref_CD_REFERENCIA.AsString;
            qry_rel_imp_demurrage_ref_merc.Open;
            Mercadorias := '';
            while not qry_rel_imp_demurrage_ref_merc.Eof do
            begin
              Mercadorias := Mercadorias + ', '#10 + qry_rel_imp_demurrage_ref_mercAP_MERCADORIA.AsString;
              qry_rel_imp_demurrage_ref_merc.Next;
            end;
            Delete(Mercadorias, 1, 3);
            Sheet.Range['G' + IntToStr(Linha), 'G' + IntToStr(Linha)].Value := Mercadorias;
          end;

          //if not qry_rel_imp_demurrage_.Eof then
          begin
            //if Sheet.Range['H' + IntToStr(Linha-1), 'H' + IntToStr(Linha-1)].Value <> qry_rel_imp_demurrage_NM_EXPORTADOR.AsString then
              Sheet.Range['H' + IntToStr(Linha), 'H' + IntToStr(Linha)].Value := qry_rel_imp_demurrage_NM_EXPORTADOR.AsString;
            //if Sheet.Range['I' + IntToStr(Linha-1), 'I' + IntToStr(Linha-1)].Value <> qry_rel_imp_demurrage_NM_CLIENTE.AsString then
              Sheet.Range['I' + IntToStr(Linha), 'I' + IntToStr(Linha)].Value := qry_rel_imp_demurrage_NM_CLIENTE.AsString;
            //if Sheet.Range['J' + IntToStr(Linha-1), 'J' + IntToStr(Linha-1)].Value <> qry_rel_imp_demurrage_NM_TRANSP_NAC.AsString then
              Sheet.Range['J' + IntToStr(Linha), 'J' + IntToStr(Linha)].Value := qry_rel_imp_demurrage_NM_TRANSP_NAC.AsString;
            //if Sheet.Range['K' + IntToStr(Linha-1), 'K' + IntToStr(Linha-1)].Value <> DateToStr(qry_rel_imp_demurrage_DT_ENT_TERMINAL.AsDateTime) then
            if qry_rel_imp_demurrage_DT_ENT_TERMINAL.AsDateTime > 0 then
              Sheet.Range['K' + IntToStr(Linha), 'K' + IntToStr(Linha)].Value := DateToStr(qry_rel_imp_demurrage_DT_ENT_TERMINAL.AsDateTime);
            //if Sheet.Range['L' + IntToStr(Linha-1), 'L' + IntToStr(Linha-1)].Value <> DateToStr(qry_rel_imp_demurrage_DT_DESEMB.AsDateTime) then
            if qry_rel_imp_demurrage_DT_DESEMB.AsDateTime > 0 then
              Sheet.Range['L' + IntToStr(Linha), 'L' + IntToStr(Linha)].Value := DateToStr(qry_rel_imp_demurrage_DT_DESEMB.AsDateTime);
            //if Sheet.Range['M' + IntToStr(Linha-1), 'M' + IntToStr(Linha-1)].Value <> DateToStr(qry_rel_imp_demurrage_DT_DEVOLUCAO_CNTR.AsDateTime) then
            if not qry_rel_imp_demurrage_.Eof then // retirado de cima e colocado aqui para não repetir apenas o numero do container - Michel - 04/11/2009
              if qry_rel_imp_demurrage_DT_DEVOLUCAO_CNTR.AsDateTime > 0 then
                Sheet.Range['M' + IntToStr(Linha), 'M' + IntToStr(Linha)].Value := DateToStr(qry_rel_imp_demurrage_DT_DEVOLUCAO_CNTR.AsDateTime);
          end;
          if not qry_rel_imp_demurrage_pagto_.Eof then
          begin
            //if Sheet.Range['N' + IntToStr(Linha-1), 'N' + IntToStr(Linha-1)].Value <> qry_rel_imp_demurrage_pagto_VL_PAGAMENTO.AsString then
              Sheet.Range['N' + IntToStr(Linha), 'N' + IntToStr(Linha)].Value := qry_rel_imp_demurrage_pagto_VL_PAGAMENTO.AsFloat;
            //if Sheet.Range['O' + IntToStr(Linha-1), 'O' + IntToStr(Linha-1)].Value <> DateToStr(qry_rel_imp_demurrage_pagto_DT_PAGAMENTO.AsDateTime) then
            if qry_rel_imp_demurrage_pagto_DT_PAGAMENTO.AsDateTime > 0 then
              Sheet.Range['O' + IntToStr(Linha), 'O' + IntToStr(Linha)].Value := DateToStr(qry_rel_imp_demurrage_pagto_DT_PAGAMENTO.AsDateTime);
          end;

          qry_rel_imp_demurrage_.Next;
          qry_rel_imp_demurrage_pagto_.Next;
          qry_rel_imp_demurrage_ref_.Next;
          Inc(Linha);
        end;
        Processo := qry_rel_imp_demurrage_proc_NR_PROCESSO.AsString;
        while (not qry_rel_imp_demurrage_proc_.Eof) and (qry_rel_imp_demurrage_proc_NR_PROCESSO.AsString = Processo) do
          qry_rel_imp_demurrage_proc_.Next;
      end;
      BoxMensagem('Arquivo Gerado com sucesso!', 3);
    except
      on E: Exception do
        MessageDlg('Erro preenchendo o arquivo.'#13 + E.Message, mtError, [mbOk], 0);
    end;
    Excel.Visible[0] := True;
    qry_rel_imp_demurrage_proc_.Close;
    WorkBook.Save(0);
  end;
end;

end.

