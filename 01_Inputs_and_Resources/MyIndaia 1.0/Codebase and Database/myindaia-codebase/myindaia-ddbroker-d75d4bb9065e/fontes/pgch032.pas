unit PGCH032;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Db, StdCtrls, Mask, ExtCtrls, UCRPE32, ComCtrls, quickrpt, Funcoes;

type
  Tfrm_sel_cli_periodo = class(TForm)
    Panel1: TPanel;
    btn_imprimir: TButton;
    btn_sair: TButton;
    crp_cli_periodo: TCrpe;
    lbl_periodo: TLabel;
    lbl_a: TLabel;
    lbl_cd_cliente: TLabel;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    btn_co_cliente: TSpeedButton;
    Label2: TLabel;
    btn_co_grupo: TSpeedButton;
    edt_nm_grupo: TEdit;
    msk_cd_grupo: TMaskEdit;
    rg_processos_: TRadioGroup;
    msk_cd_unid_neg: TMaskEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid: TSpeedButton;
    btn_co_prod: TSpeedButton;
    Label3: TLabel;
    Label1: TLabel;
    msk_dt_inicio: TDateTimePicker;
    msk_dt_fim: TDateTimePicker;
    lbl_cd_armazem: TLabel;
    btn_co_armazem: TSpeedButton;
    msk_cd_armazem: TMaskEdit;
    edt_nm_armazem: TEdit;
    cbo_canal: TComboBox;
    lbl_canal: TLabel;
    Shape1: TShape;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_clienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure btn_co_unidClick(Sender: TObject);
    procedure btn_co_prodClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_armazemExit(Sender: TObject);
    procedure btn_co_armazemClick(Sender: TObject);
  private
  public
    tp_relat:String[1];
  end;

var
  frm_sel_cli_periodo: Tfrm_sel_cli_periodo;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGSM024, PGSM064, pgch033, PGSM119, PGSM018, PGSM010;

procedure Tfrm_sel_cli_periodo.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sel_cli_periodo.btn_imprimirClick(Sender: TObject);
var nr_identificador : Integer;
    nm_canal : string;
begin
  if msk_dt_inicio.Date = 0 then
  begin
    BoxMensagem('Informe a data de início!', 2);
    msk_dt_inicio.SetFocus;
    Exit;
  end;

  if msk_dt_fim.Visible then
  if ( msk_dt_fim.Date = 0 ) then
  begin
    BoxMensagem('Informe a data final!', 2);
    msk_dt_fim.SetFocus;
    Exit;
  end;

  { Rodrigo Capra - 07/12/2007 - Ocorrência nº 05702/07
  if tp_relat = '6' then
  begin
    if ( Trim( msk_cd_grupo.Text ) = '' ) and
       ( Trim( msk_cd_cliente.Text ) = '' ) then
    begin
      BoxMensagem( 'Informe um Grupo ou cliente!', 2 );
      msk_cd_grupo.SetFocus;
      Exit;
    end;
  end;}

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  nr_identificador := 0;

  if StrToInt(tp_relat) < 3 then
  begin
    with datm_sel_cli_periodo do
    begin
      try
        datm_main.db_broker.StartTransaction;
        if tp_relat = '1' then
        begin
          CloseStoredProc( sp_proc_pag_desemb );
          if Trim(msk_cd_unid_neg.Text) = '' then
            sp_proc_pag_desemb.ParamByName('@cd_unid_neg').AsString  := 'X'
          else
            sp_proc_pag_desemb.ParamByName('@cd_unid_neg').AsString  := msk_cd_unid_neg.Text;
          if Trim(msk_cd_produto.Text) = '' then
            sp_proc_pag_desemb.ParamByName('@cd_produto').AsString   := 'X'
          else
            sp_proc_pag_desemb.ParamByName('@cd_produto').AsString   := msk_cd_produto.Text;
          if Trim( msk_cd_grupo.Text ) = '' then
            sp_proc_pag_desemb.ParamByName('@cd_grupo').AsString     := 'X'
          else
            sp_proc_pag_desemb.ParamByName('@cd_grupo').AsString     := Trim( msk_cd_grupo.Text );
          if Trim( msk_cd_cliente.Text ) = '' then
            sp_proc_pag_desemb.ParamByName('@cd_cliente').AsString   := 'X'
          else
            sp_proc_pag_desemb.ParamByName('@cd_cliente').AsString   := Trim( msk_cd_cliente.Text );
         if Trim( cbo_canal.Text ) = 'TODOS' then
            sp_proc_pag_desemb.ParamByName('@cd_canal').AsString := 'X'
          else
          begin
            datm_sel_cli_periodo.qry_tp_canal_.Locate('NM_CANAL', cbo_canal.Text, []);
            sp_proc_pag_desemb.ParamByName('@cd_canal').AsString := datm_sel_cli_periodo.qry_tp_canal_CD_CANAL.AsString;
            //sp_proc_pag_desemb.ParamByName('@cd_canal').AsString := IntToStr( cbo_canal.ItemIndex );
          end;
          sp_proc_pag_desemb.ParamByName('@PeriodoInicial').AsString := FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date );
          sp_proc_pag_desemb.ParamByName('@PeriodoFinal').AsString   := FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date );
          ExecStoredProc( sp_proc_pag_desemb );
          nr_identificador := sp_proc_pag_desemb.ParamByName('@nr_identificador').AsInteger;
          CloseStoredProc( sp_proc_pag_desemb );
        end;
        if tp_relat = '2' then
        begin
          CloseStoredProc( sp_proc_pag_desemb );
          if Trim(msk_cd_unid_neg.Text) = '' then
            sp_proc_pag_des_li.ParamByName('@cd_unid_neg').AsString := 'X'
          else
            sp_proc_pag_des_li.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
          if Trim(msk_cd_produto.Text) = '' then
            sp_proc_pag_des_li.ParamByName('@cd_produto').AsString  := 'X'
          else
            sp_proc_pag_des_li.ParamByName('@cd_produto').AsString  := msk_cd_produto.Text;
          if Trim( msk_cd_grupo.Text ) = '' then
            sp_proc_pag_des_li.ParamByName('@cd_grupo').AsString := 'X'
          else
            sp_proc_pag_des_li.ParamByName('@cd_grupo').AsString := Trim( msk_cd_grupo.Text );
          if Trim( msk_cd_cliente.Text ) = '' then
            sp_proc_pag_des_li.ParamByName('@cd_cliente').AsString := 'X'
          else
          sp_proc_pag_des_li.ParamByName('@cd_cliente').AsString := Trim( msk_cd_cliente.Text );
          sp_proc_pag_des_li.ParamByName('@PeriodoInicial').AsString := FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date );
          sp_proc_pag_des_li.ParamByName('@PeriodoFinal').AsString   := FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date );
          ExecStoredProc( sp_proc_pag_des_li );
          nr_identificador := sp_proc_pag_des_li.ParamByName('@nr_identificador').AsInteger;
          CloseStoredProc( sp_proc_pag_des_li );
        end;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
          Exit;
        end;
      end;
    end;
    with crp_cli_periodo do
    begin
      Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

      if (Trim(cbo_canal.Text) <> '') then
        nm_canal := ' Canal: ' + cbo_canal.Text;

      ReportTitle := Caption + #13 +' Ref Mes ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' a ' +
                     FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date ) + ' '+ nm_canal ;
      if tp_relat = '1' then
      begin
        ReportName  := cDir_Rpt + '\CRGI001.RPT';
      end;
      if tp_relat = '2' then
      begin
        ReportName  := cDir_Rpt + '\CRGI002.RPT';
      end;
      Formulas[0] := 'Identificador = '+  IntToStr( nr_identificador );
      Execute;
    end;
    if tp_relat = '1' then
    begin
      with datm_sel_cli_periodo.qry_apaga_dados do
      begin
        ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        Prepare;
        ExecSQL;
      end;
    end;
    if tp_relat = '2' then
    begin
      ApagaDados( 'TAUX_PROC_PAG_DES_LI', nr_identificador );
    end;
  end
  else if tp_relat = '4' then // Minuta de Transporte
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    with crp_cli_periodo do
    begin
      Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

      ReportName  := cDir_Rpt + '\CRGI018.RPT';
      ReportTitle := Caption + ' [ ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' ]';
      Formulas[0] := 'DataSelecao = '+ DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) );
      Formulas[1] := 'Unidade     = "'+ Trim(msk_cd_unid_neg.Text) + '"';
      Formulas[2] := 'Produto     = "'+ Trim(msk_cd_produto.Text) + '"';
      Formulas[3] := 'Grupo       = "'+ Trim(msk_cd_grupo.Text) + '"';
      Formulas[4] := 'Cliente     = "'+ Trim(msk_cd_cliente.Text) + '"';
      Formulas[5] := 'Armazem     = "'+ Trim(msk_cd_armazem.Text) + '"';
      Execute;
    end;
    Screen.Cursor := crDefault;
  end
  else if tp_relat = '5' then // Saldo Geral de Clientes
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    with crp_cli_periodo do
    begin
      Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

      ReportName  := cDir_Rpt + '\CRFT008.RPT';
      ReportTitle := Caption + ' em ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date );;
      Formulas[0] := 'Data_Base = ' + DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) );
      Formulas[1] := 'Unidade     = "'+ Trim(msk_cd_unid_neg.Text) + '"';
      Formulas[2] := 'Produto     = "'+ Trim(msk_cd_produto.Text) + '"';
      Execute;
    end;
    Screen.Cursor := crDefault;
  end
  else if tp_relat = '6' then {Adiantamentos Pendentes de Faturamento}
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    with crp_cli_periodo do
    begin
      Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

      ReportName  := cDir_Rpt + '\CRFT046.RPT';
      { Unidade }
      if Trim( msk_cd_unid_neg.Text ) = '' then
        Formulas[0] := 'Unidade       = "X"'
      else
        Formulas[0] := 'Unidade       = "'+ Trim(msk_cd_unid_neg.Text) + '"';
      { Produto }
      if Trim( msk_cd_produto.Text )  = '' then
        Formulas[1] := 'Produto       = "X"'
      else
        Formulas[1] := 'Produto       = "'+ Trim(msk_cd_produto.Text) + '"';
      { Grupo }
      if Trim( msk_cd_grupo.Text )  = '' then
        Formulas[2] := 'Grupo         = "X"'
      else
        Formulas[2] := 'Grupo         = "'+ Trim(msk_cd_grupo.Text) + '"';
      { Cliente }
      if Trim( msk_cd_cliente.Text )  = '' then
        Formulas[3] := 'Cliente       = "X"'
      else
        Formulas[3] := 'Cliente       = "'+ Trim(msk_cd_cliente.Text) + '"';

      Formulas[4]   := 'Dt_Inicial    = '+ DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) );
      Formulas[5]   := 'Dt_Final      = '+ DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date ) );
      Execute;
    end;
    Screen.Cursor := crDefault;
  end
  else
  begin
    with datm_sel_cli_periodo do
    begin
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc( sp_processos_abertos_fat );
        sp_processos_abertos_fat.ParamByName('@cd_unid_neg').AsString := Trim( msk_cd_unid_neg.Text );
        sp_processos_abertos_fat.ParamByName('@cd_produto').AsString  := Trim( msk_cd_produto.Text );
        sp_processos_abertos_fat.ParamByName('@cd_grupo').AsString    := Trim( msk_cd_grupo.Text );
        sp_processos_abertos_fat.ParamByName('@cd_cliente').AsString  := Trim( msk_cd_cliente.Text );

        if rg_processos_.ItemIndex = 0 then
           sp_processos_abertos_fat.ParamByName('@status').AsString := 'A'
        else
           sp_processos_abertos_fat.ParamByName('@status').AsString := 'F';

        sp_processos_abertos_fat.ParamByName('@dt_inicio').AsDate   := msk_dt_inicio.Date;
        sp_processos_abertos_fat.ParamByName('@dt_fim').AsDate      := msk_dt_fim.Date;

        ExecStoredProc( sp_processos_abertos_fat );
        nr_identificador := sp_processos_abertos_fat.ParamByName('@nr_identificador').AsInteger;

        CloseStoredProc( sp_processos_abertos_fat );

        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
          Exit;
        end;
      end;
    end;

    with crp_cli_periodo do
    begin
     Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
     ReportName  := cDir_Rpt + '\CRFT032.RPT';
     if rg_processos_.ItemIndex = 0 then
        ReportTitle := 'PROCESSOS EM ABERTO '
     else ReportTitle := 'PROCESSOS FATURADOS ';
        ReportTitle := ReportTitle + #13 +' Ref Mes ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' a ' +
                       FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date );
     Formulas[0] := 'nr_identificador = ' + inttostr( nr_identificador );
     Execute;
    end;

    with datm_sel_cli_periodo.qry_limpa_proc_abfat_ do
    begin
      try
        datm_main.db_broker.StartTransaction;
        ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        Prepare;
        ExecSQL;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
          Exit;
        end;
      end;
    end;
  end;

  Screen.Cursor := crDefault;
  Application.ProcessMessages;
end;

procedure Tfrm_sel_cli_periodo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  crp_cli_periodo.Free;
  Action := caFree;
end;

procedure Tfrm_sel_cli_periodo.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_sel_cli_periodo, datm_sel_cli_periodo);
end;

procedure Tfrm_sel_cli_periodo.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.text = '' then edt_nm_cliente.Text := 'Todos'
  else
  begin
    ValCodEdt(msk_cd_cliente);
    with datm_sel_cli_periodo.qry_cliente_ do
    begin
      Close;
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
end;

procedure Tfrm_sel_cli_periodo.btn_co_clienteClick(Sender: TObject);
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


procedure Tfrm_sel_cli_periodo.FormShow(Sender: TObject);
var
  i : Integer;
begin

  with frm_sel_cli_periodo do
  begin
    for i := 0 to (ComponentCount - 1) do
    begin
      {RadioGroup}
      if Components[i] is TRadioGroup then
      begin
        if tp_relat = '3' then
           ( Components[i] as TRadioGroup ).Visible := True;
      end

      {ComboBox}
      else if Components[i] is TComboBox then
      begin
        if (StrToInt(tp_relat) <> 1) and
        (Components[i].Name = 'cbo_canal') then
        (Components[i] as TComboBox).Visible := False
       end

      {MaskEdits}
      else if Components[i] is TMaskEdit then
      begin
        if ( StrToInt(tp_relat) <= 3 ) and
           ( Components[i].Name <> 'msk_cd_armazem' ) then
          ( Components[i] as TMaskEdit ).Visible := True
        else if StrToInt(tp_relat) in [ 5 ] then
        begin
          if ( Components[i].Name = 'msk_cd_unid_neg') or ( Components[i].Name = 'msk_cd_produto' ) then
             ( Components[i] as TMaskEdit ).Visible := True
          else if Components[i].Name = 'msk_dt_inicio' then
          begin
            ( Components[i] as TMaskEdit ).Top     := 111;
            ( Components[i] as TMaskEdit ).Left    := 16;
            ( Components[i] as TMaskEdit ).Visible := True;
            Label2.Caption        := 'Data';
            Label2.Visible        := True
          end;
        end
        else if StrToInt(tp_relat) in [ 4,6 ] then
        begin
          ( Components[i] as TMaskEdit ).Visible := ( ( Components[i].Name = 'msk_cd_unid_neg' ) or
                                                      ( Components[i].Name = 'msk_cd_produto'  ) or
                                                      ( Components[i].Name = 'msk_cd_grupo'    ) or
                                                      ( Components[i].Name = 'msk_cd_cliente'  ) or
                                                      ( Components[i].Name = 'msk_dt_inicio'   ) or
                                                      ( Components[i].Name = 'msk_dt_fim'      ) );
          if StrToInt(tp_relat) = 4 then
            msk_cd_armazem.Visible := True;
        end
        else
        begin
          if ( Components[i].Name <> 'msk_cd_unid_neg' ) and
             ( Components[i].Name <> 'msk_cd_armazem' ) and
             ( Components[i].Name <> 'msk_cd_produto' ) then
          begin
            ( Components[i] as TMaskEdit ).Visible := True;
            ( Components[i] as TMaskEdit ).Top     := ( ( Components[i] as TMaskEdit ).Top ) - 81;
          end;
        end;
      end

      {Edits}
      else if Components[i] is TEdit then
      begin
        if ( StrToInt(tp_relat) <= 3 ) and
           ( Components[i].Name <> 'edt_nm_armazem' ) then
           ( Components[i] as TEdit ).Visible := True
        else if StrToInt(tp_relat) in [ 5 ] then
        begin
          if ( Components[i].Name = 'edt_nm_unid_neg' ) or ( Components[i].Name = 'edt_nm_produto' ) then
             ( Components[i] as TEdit).Visible := True;
        end
        else if StrToInt(tp_relat) in [ 4,6 ] then
        begin
          ( Components[i] as TEdit ).Visible := ( ( Components[i].Name = 'edt_nm_unid_neg' ) or
                                                  ( Components[i].Name = 'edt_nm_produto'  ) or
                                                  ( Components[i].Name = 'edt_nm_grupo'    ) or
                                                  ( Components[i].Name = 'edt_nm_cliente'  ) );
          if StrToInt(tp_relat) = 4 then
            edt_nm_armazem.Visible := True;
        end
        else
        begin
          if ( Components[i].Name <> 'edt_nm_unid_neg' ) and
             ( Components[i].Name <> 'edt_nm_armazem' ) and
             ( Components[i].Name <> 'edt_nm_produto' ) then
          begin
            ( Components[i] as TEdit ).Visible := True;
            ( Components[i] as TEdit ).Top     := ( ( Components[i] as TEdit ).Top ) - 81
          end;
        end;
      end

      {Labels}
      else if Components[i] is TLabel then
      begin
       if (StrToInt(tp_relat) = 1) and
           (Components[i].Name <> 'lbl_cd_armazem') then
          ( Components[i] as TLabel ).Visible := True;

        if ( StrToInt(tp_relat) in [2,3] ) and
           ( Components[i].Name <> 'lbl_cd_armazem') and
           ( Components[i].Name <> 'lbl_canal') then
           ( Components[i] as TLabel ).Visible := True

        else if StrToInt(tp_relat) in [5] then
        begin
          if ( ( Components[i].Name = 'Label1' ) or
               ( Components[i].Name = 'Label3' ) or
               ( Components[i].Name = 'lbl_periodo' ) ) then
            ( Components[i] as TLabel ).Visible := True;
        end
        else if StrToInt(tp_relat) in [ 4,6 ] then
        begin
          ( Components[i] as TLabel ).Visible := ( ( Components[i].Name = 'Label1'         ) or
                                                   ( Components[i].Name = 'Label2'         ) or
                                                   ( Components[i].Name = 'Label3'         ) or
                                                   ( Components[i].Name = 'lbl_cd_cliente' ) or
                                                   ( Components[i].Name = 'lbl_periodo'    ) or
                                                   ( Components[i].Name = 'lbl_a'          ) );
          if StrToInt(tp_relat) = 4 then
            lbl_cd_armazem.Visible := True;
        end
        else
        begin
          if ( Components[i].Name <> 'Label1' ) and
             ( Components[i].Name <> 'Label3' ) and
             ( Components[i].Name <> 'lbl_cd_armazem' ) and
             ( Components[i].Name <> 'lbl_canal' ) then
          begin
            ( Components[i] as TLabel ).Visible := True;
//            ( Components[i] as TLabel ).Top     := ( ( Components[i] as TLabel ).Top ) - 81
          end;
        end;
      end

      {SpeedButtons}
      else if Components[i] is TSpeedButton then
      begin
        if ( StrToInt(tp_relat) <= 3 ) and
           ( Components[i].Name <> 'btn_co_armazem' ) then
          ( Components[i] as TSpeedButton ).Visible := True
        else if StrToInt(tp_relat) in [ 5 ] then
        begin
          if ( Components[i].Name = 'btn_co_unid' ) or ( Components[i].Name = 'btn_co_prod' ) then
             ( Components[i] as TSpeedButton ).Visible := True;
        end
        else if StrToInt(tp_relat) in [ 4,6 ] then
        begin
          ( Components[i] as TSpeedButton ).Visible := ( ( Components[i].Name = 'btn_co_unid'    ) or
                                                         ( Components[i].Name = 'btn_co_prod'    ) or
                                                         ( Components[i].Name = 'btn_co_grupo'   ) or
                                                         ( Components[i].Name = 'btn_co_cliente' ) );
          if StrToInt(tp_relat) = 4 then
            btn_co_armazem.Visible := True;
        end
        else
        begin
          if ( Components[i].Name <> 'btn_co_unid' ) and
             ( Components[i].Name <> 'btn_co_prod' ) and
             ( Components[i].Name <> 'btn_co_armazem' ) then
          begin
            ( Components[i] as TSpeedButton ).Visible := True;
            ( Components[i] as TSpeedButton ).Top     := ( ( Components[i] as TSpeedButton ).Top ) - 81
          end;
        end;
      end;
    end;
  end;
  { Rótulo do Formulário }
  case StrToInt( tp_relat ) of
    1 : Caption := 'Processos Pagos/Desembaraçados - DI';
    2 : Caption := 'Processos Pagos/Desembaraçados - LI';
    3 : Caption := 'Processos em aberto/faturados';
    4 : Caption := 'Minuta de Transporte';
    5 : Caption := 'Saldo de Clientes';
    6 : Caption := 'Adiantamentos Pendentes de Faturamento';
  end;

  msk_dt_inicio.Date := dt_server;
  msk_dt_fim.Date    := dt_server;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_produtoExit(nil);

  if msk_cd_produto.Visible then
    msk_dt_inicio.TabOrder := msk_cd_produto.TabOrder + 1;
  if msk_cd_cliente.Visible then
    msk_dt_inicio.TabOrder := msk_cd_cliente.TabOrder + 1;
  if msk_cd_armazem.Visible then
    msk_dt_inicio.TabOrder := msk_cd_armazem.TabOrder + 1;

  msk_dt_fim.TabOrder := msk_dt_inicio.TabOrder + 1;

  if StrToInt(tp_relat) = 1 then
    begin
      lbl_canal.Top := lbl_periodo.Top;
      cbo_canal.Top := msk_dt_inicio.Top;
      lbl_periodo.Top := lbl_cd_armazem.Top + 10;
      msk_dt_inicio.Top := msk_cd_armazem.Top + 10;
      lbl_a.Top := msk_cd_armazem.Top + 13;
      msk_dt_fim.Top := msk_cd_armazem.Top + 10;
      btn_imprimir.Top := cbo_canal.Top + 50;
      btn_sair.Top := cbo_canal.Top + 50;
      frm_sel_cli_periodo.Height := 360;
    end;                                  

   with datm_sel_cli_periodo.qry_tp_canal_ do
          begin
            cbo_canal.Clear;
            Close;
            Prepare;
            Open;
            while Not Eof do
            begin
              cbo_canal.Items.Add( FieldByName('NM_CANAL').AsString );
              Next;
            end;
            //Close;
            cbo_canal.ItemIndex := 0;
          end;
end;

procedure Tfrm_sel_cli_periodo.msk_cd_clienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unidClick(nil);
    if Sender = msk_cd_produto  then btn_co_prodClick(nil);
    if Sender = msk_cd_cliente  then btn_co_clienteClick(nil);
    if Sender = msk_cd_grupo    then btn_co_grupoClick(nil);
    if Sender = msk_cd_armazem  then btn_co_armazemClick(nil);
  end;
end;

procedure Tfrm_sel_cli_periodo.msk_cd_grupoChange(Sender: TObject);
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

procedure Tfrm_sel_cli_periodo.btn_co_grupoClick(Sender: TObject);
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

procedure Tfrm_sel_cli_periodo.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.text = '' then edt_nm_grupo.Text := 'Todos'
  else
  begin
    ValCodEdt(msk_cd_grupo);
    with datm_sel_cli_periodo.qry_grupo_ do
    begin
      Close;
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
end;

procedure Tfrm_sel_cli_periodo.msk_cd_clienteChange(Sender: TObject);
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

procedure Tfrm_sel_cli_periodo.btn_co_unidClick(Sender: TObject);
begin
  with datm_sel_cli_periodo do
  begin
    Application.CreateForm(Tfrm_unidade, frm_unidade);
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
      qry_unidade_.Close;
      qry_unidade_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_unidade_.Prepare;
      qry_unidade_.Open;
      if qry_unidade_.RecordCount > 0 then edt_nm_unid_neg.Text := qry_unidade_NM_UNID_NEG.AsString;
      qry_unidade_.Close;
    end;
  end;
end;

procedure Tfrm_sel_cli_periodo.btn_co_prodClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_produto, frm_produto);
  with frm_produto do
  begin
    lCons_OnLine       := True;
    Caption            := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine       := False;
  end;
  msk_cd_produto.Text  := frm_produto.Cons_OnLine_Texto;
  with datm_sel_cli_periodo.qry_produto_ do
  begin
    Close;
    ParamByName('CD_PRODUTO').asString := msk_cd_produto.Text;
    Prepare;
    Open;
    edt_nm_produto.Text := FieldByName('NM_PRODUTO').asString
  end;
end;

procedure Tfrm_sel_cli_periodo.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.text = '' then edt_nm_unid_neg.Text := 'Todos'
  else
  begin
    ValCodEdt(msk_cd_unid_neg);
    With datm_sel_cli_periodo.qry_unidade_ do
    begin
      Close;
      ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      Prepare;
      Open;
      if RecordCount = 0 then
      begin
        BoxMensagem('Unidade não encontrada!',2);
        msk_cd_unid_neg.Clear;
        edt_nm_unid_neg.Clear;
      end
      else edt_nm_unid_neg.Text:= FieldByName('NM_UNID_NEG').AsString;
      Close;
    end;
  end;
end;

procedure Tfrm_sel_cli_periodo.msk_cd_produtoExit(Sender: TObject);
begin
  edt_nm_produto.Clear;
  if msk_cd_produto.text = '' then edt_nm_produto.Text := 'Todos'
  else
  begin
    ValCodEdt(msk_cd_produto);
    With datm_sel_cli_periodo.qry_produto_ do
    begin
      Close;
      ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
      Prepare;
      Open;
      if RecordCount = 0 then
      begin
        BoxMensagem('Produto não encontrado!',2);
        msk_cd_produto.Clear;
        edt_nm_produto.Clear;
      end
      else edt_nm_produto.Text:= FieldByName('NM_PRODUTO').AsString;
      Close;
    end;
  end;
end;

procedure Tfrm_sel_cli_periodo.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then Close;
end;



procedure Tfrm_sel_cli_periodo.msk_cd_armazemExit(Sender: TObject);
begin
  edt_nm_armazem.Clear;
  if msk_cd_armazem.text = '' then
    edt_nm_armazem.Text := 'Todos'
  else
  begin
    ValCodEdt(msk_cd_armazem);
    edt_nm_armazem.Text := FastEdit( 'TARMAZEM', msk_cd_armazem, 'CD_ARMAZEM', 'NM_ARMAZEM' );
    if Trim(edt_nm_armazem.Text) = '' then
    begin
      BoxMensagem('Armazem de Descarga não encontrado!',2);
      msk_cd_armazem.Clear;
      msk_cd_armazem.SetFocus;
    end;
  end;
end;

procedure Tfrm_sel_cli_periodo.btn_co_armazemClick(Sender: TObject);
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


end.
