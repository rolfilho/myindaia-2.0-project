unit PGRE002;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Db, StdCtrls, Mask, ExtCtrls, UCRPE32, ComCtrls, ShellApi,
  DBCtrls, ComObj, Funcoes;

type
  Tfrm_rel_exp_flp = class(TForm)
    Panel1: TPanel;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    btn_imprimir: TButton;
    btn_sair: TButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
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
    msk_dt_inicio: TDateTimePicker;
    msk_dt_fim: TDateTimePicker;
    msk_cd_area: TMaskEdit;
    Label1: TLabel;
    edt_nm_area: TEdit;
    btn_co_area: TSpeedButton;
    Label2: TLabel;
    msk_cd_analista: TMaskEdit;
    edt_nm_analista: TEdit;
    Label3: TLabel;
    btn_co_analista: TSpeedButton;
    msk_cd_via_transp: TMaskEdit;
    edt_nm_via_transp: TEdit;
    btn_co_via_transp: TSpeedButton;
    chk_arquivo: TCheckBox;
    Label4: TLabel;
    btn_co_contato: TSpeedButton;
    msk_cd_contato: TMaskEdit;
    edt_nm_contato: TEdit;
    msk_cd_destino: TMaskEdit;
    Label5: TLabel;
    edt_nm_destino: TEdit;
    btn_co_destino: TSpeedButton;
    cbo_faturado: TComboBox;
    Label6: TLabel;
    dbrgrp_ev_conclusor: TRadioGroup;
    chk_obs: TCheckBox;
    chk_eta: TCheckBox;
    msk_dt_eta: TDateTimePicker;
    lblpais: TLabel;
    msk_cd_pais: TMaskEdit;
    edt_nm_pais: TEdit;
    btn_co_pais: TSpeedButton;
    lbltransp: TLabel;
    msk_cd_transp: TMaskEdit;
    edt_nm_transp: TEdit;
    btn_co_transp: TSpeedButton;
    procedure btn_sairClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
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
    procedure msk_cd_areaExit(Sender: TObject);
    procedure msk_cd_analistaExit(Sender: TObject);
    procedure btn_co_areaClick(Sender: TObject);
    procedure btn_co_analistaClick(Sender: TObject);
    procedure msk_cd_via_transpExit(Sender: TObject);
    procedure btn_co_via_transpClick(Sender: TObject);
    procedure msk_cd_contatoExit(Sender: TObject);
    procedure btn_co_contatoClick(Sender: TObject);
    procedure msk_cd_unid_negChange(Sender: TObject);
    procedure msk_cd_destinoExit(Sender: TObject);
    procedure btn_co_destinoClick(Sender: TObject);
    procedure chk_etaClick(Sender: TObject);
    procedure btn_co_paisClick(Sender: TObject);
    procedure btn_co_transpClick(Sender: TObject);
    procedure msk_cd_paisExit(Sender: TObject);
    procedure msk_cd_transpExit(Sender: TObject);
  private
    consulta : Byte;
  public
    tp_rel : Byte;
    ComPeriodo : Boolean;
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer );
  end;
  // tp_rel:
  // 1 - F&ollow-Up ( Controle de Exportação )
  // 2 - Planilha Controle Processos
  // 3 - Follow-Up - Controle de Processos

var
  Saida    : String;
  Txt      : TextFile;
  cNomeTxt : String;
  frm_rel_exp_flp: Tfrm_rel_exp_flp;

implementation

{$R *.DFM}

uses FILETEXT, GSMLIB, PGGP001, PGGP017, PGRE003, PGSM018, PGSM024, PGSM119,
     PGSM212, PGSM016, PGSM011, PGSM096, PGSM148, PGSM025, PGSM051;

procedure Tfrm_rel_exp_flp.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_rel_exp_flp.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = '' then
  begin
    edt_nm_unid_neg.Text := 'Todas';
    Exit;
  end;

  ValCodEdt( msk_cd_unid_neg );
  if msk_cd_unid_neg.Text <> '' then
  begin
    with datm_rel_exp_flp do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.RecordCount > 0 then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
      end
      else
      begin
        BoxMensagem('Unidade de Negócio não cadastrada!', 2);
        msk_cd_unid_neg.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_unid_neg.Text := '';
  end;
end;

procedure Tfrm_rel_exp_flp.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_rel_exp_flp do
  begin
    Application.CreateForm(Tfrm_unidade, frm_unidade );
    with frm_unidade do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
      msk_cd_unid_negExit(nil);
    end;
  end;
end;

procedure Tfrm_rel_exp_flp.btn_imprimirClick(Sender: TObject);
var
  nr_identificador, nLinha: integer;
  Excel, xlWorkB, oSheet: OleVariant;
  navio : string;
begin
  if msk_dt_inicio.Date = 0 then
  begin
    BoxMensagem( 'Informe uma data para seleção!', 2 );
    msk_dt_inicio.SetFocus;
    Exit;
  end;

  if msk_dt_fim.Date = 0 then
  begin
    BoxMensagem( 'Informe uma data final para seleção!', 2 );
    msk_dt_fim.SetFocus;
    Exit;
  end;

  if ( msk_dt_inicio.Date > msk_dt_fim.Date ) then
  begin
    BoxMensagem( 'Data final deve ser maior ou igual a data inicial!', 2 );
    msk_dt_inicio.SetFocus;
    Exit;
  end;

  if ( msk_cd_via_transp.Text = '02' ) or ( msk_cd_via_transp.Text = '03' ) or
     ( msk_cd_via_transp.Text = '05' ) or ( msk_cd_via_transp.Text = '08' ) or
     ( msk_cd_via_transp.Text = '09' ) then
  begin
    BoxMensagem( 'Digite uma Via de Transporte válida -> Marítima/Aérea/Ferroviária/Rodoviária!', 2 );
    edt_nm_via_transp.Text := '';
    msk_cd_via_transp.Text := '';
    msk_cd_via_transp.SetFocus;
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;


  with datm_rel_exp_flp do
  begin
    //----------------   Follow-Up ( Controle de Exportação )
    if tp_rel = 1 then
    begin
      CloseStoredProc( sp_rel_exp_flp );
      if Trim( msk_cd_unid_neg.Text ) = '' then
        sp_rel_exp_flp.ParamByName('@cd_unid_neg').AsString := 'X'
      else
        sp_rel_exp_flp.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
      if Trim( msk_cd_grupo.Text ) = '' then
        sp_rel_exp_flp.ParamByName('@cd_grupo').AsString    := 'X'
      else
        sp_rel_exp_flp.ParamByName('@cd_grupo').AsString    := msk_cd_grupo.Text;
      if Trim( msk_cd_cliente.Text ) = '' then
        sp_rel_exp_flp.ParamByName('@cd_cliente').AsString  := 'X'
      else
        sp_rel_exp_flp.ParamByName('@cd_cliente').AsString  := msk_cd_cliente.Text;
      if Trim( msk_cd_area.Text ) = '' then
        sp_rel_exp_flp.ParamByName('@cd_area').AsString     := 'X'
      else
        sp_rel_exp_flp.ParamByName('@cd_area').AsString     := msk_cd_area.Text;
      if Trim( msk_cd_via_transp.Text ) = '' then
        sp_rel_exp_flp.ParamByName('@cd_via_transporte').AsString  := 'X'
      else
        sp_rel_exp_flp.ParamByName('@cd_via_transporte').AsString  := msk_cd_via_transp.Text;
      if Trim( msk_cd_analista.Text ) = '' then
        sp_rel_exp_flp.ParamByName('@cd_analista_comissaria').AsString  := 'X'
      else
        sp_rel_exp_flp.ParamByName('@cd_analista_comissaria').AsString  := msk_cd_analista.Text;
      if Trim( msk_cd_contato.Text ) = '' then
        sp_rel_exp_flp.ParamByName('@cd_contato').AsString  := 'X'
      else
        sp_rel_exp_flp.ParamByName('@cd_contato').AsString  := msk_cd_contato.Text;
      if chk_obs.Checked then
        sp_rel_exp_flp.ParamByName('@in_obs').AsString  := '1'
      else
        sp_rel_exp_flp.ParamByName('@in_obs').AsString  := '0';

      // 0 - Averbação   1 - Retirada BL     2 - Saque Bordero
      sp_rel_exp_flp.ParamByName('@in_conclusor').AsString  := IntToStr( dbrgrp_ev_conclusor.ItemIndex );
      sp_rel_exp_flp.ParamByName('@dt_inicio').AsDate       := msk_dt_inicio.Date;
      sp_rel_exp_flp.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;

      ExecStoredProc( sp_rel_exp_flp );
      nr_identificador := sp_rel_exp_flp.ParamByName('@nr_identificador').AsInteger;
      CloseStoredProc( sp_rel_exp_flp );

      if Trim(  msk_cd_via_transp.Text ) <> '' then
      begin
        case StrToInt( msk_cd_via_transp.Text) of
        // Marítima
        1: begin
             qry_follow_up_mar_.Close;
             qry_follow_up_mar_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
             qry_follow_up_mar_.Prepare;
             qry_follow_up_mar_.Open;

             ppRepFollowup.Template.FileName := cDir_RPT + '\RBEXP002.RTM';
             ppRepFollowup.Template.LoadFromFile;
             ppRepFollowup.TextFileName      := cDir_RPT + '\RBEXP002.PDF';
             pplbl_transporte.Caption  := 'NAVIO';
             pplbl_titulo.Caption      := 'Follow-up de Exportação - Modal: Marítima';
             pplbl_periodo.Caption     := FormatDateTime( 'dd/mm/yyyy',msk_dt_inicio.Date ) + ' a ' + FormatDateTime( 'dd/mm/yyyy',msk_dt_fim.Date );
             ppSbRpMaritima.Visible    := True;
             ppSummMar.NewPage := False;

             ppRepFollowup.AllowPrintToFile  := True;

             if chk_arquivo.Checked then
               ppRepFollowup.DeviceType        := 'PDFFile'
             else
               ppRepFollowup.DeviceType        := 'Screen';


             ppRepFollowup.Print;
           end;
        // Aérea
        4: begin
             qry_follow_up_aer_.Close;
             qry_follow_up_aer_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
             qry_follow_up_aer_.Prepare;
             qry_follow_up_aer_.Open;

             ppRepFollowup.Template.FileName := cDir_RPT + '\RBEXP002.RTM';
             ppRepFollowup.Template.LoadFromFile;
             ppRepFollowup.TextFileName      := cDir_RPT + '\RBEXP002.PDF';
             pplbl_transporte.Caption  := 'AGENTE';
             pplbl_titulo.Caption      := 'Follow-up de Exportação - Modal: Aérea';
             pplbl_periodo.Caption     := FormatDateTime( 'dd/mm/yyyy',msk_dt_inicio.Date ) + ' a ' + FormatDateTime( 'dd/mm/yyyy',msk_dt_fim.Date );
             ppSbRpAerea.Visible       := True;
             ppSummAer.NewPage := False;
             ppRepFollowup.AllowPrintToFile  := True;
             if chk_arquivo.Checked then
               ppRepFollowup.DeviceType        := 'PDFFile'
             else
               ppRepFollowup.DeviceType        := 'Screen';

             ppRepFollowup.Print;
           end;
        // Ferroviária
        6: begin
             qry_follow_up_fer_.Close;
             qry_follow_up_fer_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
             qry_follow_up_fer_.Prepare;
             qry_follow_up_fer_.Open;

             ppRepFollowup.Template.FileName := cDir_RPT + '\RBEXP002.RTM';
             ppRepFollowup.Template.LoadFromFile;
             ppRepFollowup.TextFileName      := cDir_RPT + '\RBEXP002.PDF';
             pplbl_transporte.Caption  := 'TRANSPORTADOR';
             pplbl_titulo.Caption      := 'Follow-up de Exportação - Modal: Ferroviária';
             pplbl_periodo.Caption     := FormatDateTime( 'dd/mm/yyyy',msk_dt_inicio.Date ) + ' a ' + FormatDateTime( 'dd/mm/yyyy',msk_dt_fim.Date );
             ppSbRpFerroviaria.Visible := True;
             ppSummFer.NewPage := False;

             ppRepFollowup.AllowPrintToFile  := True;

             if chk_arquivo.Checked then
               ppRepFollowup.DeviceType        := 'PDFFile'
             else
               ppRepFollowup.DeviceType        := 'Screen';


             ppRepFollowup.Print;
           end;
        //Rodoviária
        7: begin
             qry_follow_up_rod_.Close;
             qry_follow_up_rod_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
             qry_follow_up_rod_.Prepare;
             qry_follow_up_rod_.Open;

             ppRepFollowup.Template.FileName := cDir_RPT + '\RBEXP002.RTM';
             ppRepFollowup.Template.LoadFromFile;
             pplbl_transporte.Caption  := 'TRANSPORTADOR';
             ppRepFollowup.TextFileName      := cDir_RPT + '\RBEXP002.PDF';
             pplbl_titulo.Caption      := 'Follow-up de Exportação - Modal: Rodoviária';
             pplbl_periodo.Caption     := FormatDateTime( 'dd/mm/yyyy',msk_dt_inicio.Date ) + ' a ' + FormatDateTime( 'dd/mm/yyyy',msk_dt_fim.Date );
             ppSbRpRodoviaria.Visible  := True;
             ppSummRod.NewPage := False;

             ppRepFollowup.AllowPrintToFile  := True;

             if chk_arquivo.Checked then
               ppRepFollowup.DeviceType        := 'PDFFile'
             else
               ppRepFollowup.DeviceType        := 'Screen';

             ppRepFollowup.Print;
           end;
        end;
      end
      else
      begin
        qry_follow_up_mar_.Close;
        qry_follow_up_mar_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_follow_up_mar_.Prepare;
        qry_follow_up_mar_.Open;

        qry_follow_up_aer_.Close;
        qry_follow_up_aer_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_follow_up_aer_.Prepare;
        qry_follow_up_aer_.Open;

        qry_follow_up_fer_.Close;
        qry_follow_up_fer_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_follow_up_fer_.Prepare;
        qry_follow_up_fer_.Open;

        qry_follow_up_rod_.Close;
        qry_follow_up_rod_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_follow_up_rod_.Prepare;
        qry_follow_up_rod_.Open;

        ppRepFollowup.Template.FileName := cDir_RPT + '\RBEXP002.RTM';
        ppRepFollowup.Template.LoadFromFile;
        ppRepFollowup.TextFileName      := cDir_RPT + '\RBEXP002.PDF';
        pplbl_titulo.Caption      := 'Follow-up de Exportação';
        pplbl_periodo.Caption     := FormatDateTime( 'dd/mm/yyyy',msk_dt_inicio.Date ) + ' a ' + FormatDateTime( 'dd/mm/yyyy',msk_dt_fim.Date );

        if not qry_follow_up_mar_.EOF then
          ppSbRpMaritima.Visible    := True;

        if not qry_follow_up_aer_.EOF then
          ppSbRpAerea.Visible       := True;


        if not qry_follow_up_fer_.EOF then
          ppSbRpFerroviaria.Visible := True;

        if not qry_follow_up_rod_.EOF then
          ppSbRpRodoviaria.Visible  := True;

        ppRepFollowup.AllowPrintToFile  := True;

        if chk_arquivo.Checked then
          ppRepFollowup.DeviceType        := 'PDFFile'
        else
          ppRepFollowup.DeviceType        := 'Screen';

        ppRepFollowup.Print;
      end;
      //Apaga Tabela
      ApagaDados( 'TREL_EXP_FLP', nr_identificador );

    end;


    //----------------   Planilha Controle Processos
    if tp_rel = 2 then
    begin
      CloseStoredProc( sp_rel_flp_ind );
      if Trim( msk_cd_unid_neg.Text ) = '' then
        sp_rel_flp_ind.ParamByName('@cd_unid_neg').AsString := 'X'
      else
        sp_rel_flp_ind.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
      if Trim( msk_cd_grupo.Text ) = '' then
        sp_rel_flp_ind.ParamByName('@cd_grupo').AsString    := 'X'
      else
        sp_rel_flp_ind.ParamByName('@cd_grupo').AsString    := msk_cd_grupo.Text;
      if Trim( msk_cd_cliente.Text ) = '' then
        sp_rel_flp_ind.ParamByName('@cd_cliente').AsString  := 'X'
      else
        sp_rel_flp_ind.ParamByName('@cd_cliente').AsString  := msk_cd_cliente.Text;
      if Trim( msk_cd_via_transp.Text ) = '' then
        sp_rel_flp_ind.ParamByName('@cd_via_transporte').AsString  := 'X'
      else
        sp_rel_flp_ind.ParamByName('@cd_via_transporte').AsString  := msk_cd_via_transp.Text;
      if Trim( msk_cd_contato.Text ) = '' then
        sp_rel_flp_ind.ParamByName('@cd_contato').AsString  := 'X'
      else
        sp_rel_flp_ind.ParamByName('@cd_contato').AsString  := msk_cd_contato.Text;
      if Trim( msk_cd_destino.Text ) = '' then
        sp_rel_flp_ind.ParamByName('@cd_destino').AsString  := 'X'
      else
        sp_rel_flp_ind.ParamByName('@cd_destino').AsString  := msk_cd_destino.Text;
      if Trim (cbo_faturado.Text) = 'TODOS' then
        sp_rel_flp_ind.ParamByName('@cd_faturado').AsString := 'X'
      else
        sp_rel_flp_ind.ParamByName('@cd_faturado').AsString := IntToStr( cbo_faturado.ItemIndex );

      sp_rel_flp_ind.ParamByName('@dt_inicio').AsDate       := msk_dt_inicio.Date;
      sp_rel_flp_ind.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;

      ExecStoredProc( sp_rel_flp_ind );
      nr_identificador := sp_rel_flp_ind.ParamByName('@nr_identificador').AsInteger;
      CloseStoredProc( sp_rel_flp_ind );

      qry_rel_flp_ind_.Close;
      qry_rel_flp_ind_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
      qry_rel_flp_ind_.Prepare;
      qry_rel_flp_ind_.Open;

      if qry_rel_flp_ind_.EOF then
      begin
        BoxMensagem('Não há dados para exibir', 2)
      end
      else
      begin
        try
          Excel := CreateOLEObject('Excel.Application');

          xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\FOLLOWUP_INDAIA.XLS' );

          Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\FOLLOWUP_INDAIA_' +
          Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');

          oSheet := Excel.WorkBooks[1].Worksheets[1];
        except
          begin
            BoxMensagem('Erro na criação da Planilha.', 2) ;
            Exit;
          end
        end;

        //filtros da planilha
        oSheet.Cells[ 02, 05 ].value := edt_nm_unid_neg.text;
        oSheet.Cells[ 02, 09 ].value := DatetoStr( msk_dt_inicio.date ) + ' à ' + DatetoStr( msk_dt_fim.date );
        if ( edt_nm_grupo.text = '' ) OR ( Trim( edt_nm_grupo.text ) = 'Todos' ) then
        begin
          oSheet.Cells[ 03, 04 ].value := 'Cliente:';
          oSheet.Cells[ 03, 05 ].value := edt_nm_cliente.text;
        end
        else
        begin
          oSheet.Cells[ 03, 04 ].value := 'Grupo:';
          oSheet.Cells[ 03, 05 ].value := edt_nm_grupo.text;
        end;
        oSheet.Cells[ 03, 09 ].value := cbo_faturado.text;
        oSheet.Cells[ 04, 05 ].value := edt_nm_via_transp.text;
        oSheet.Cells[ 05, 05 ].value := edt_nm_contato.text;
        oSheet.Cells[ 06, 05 ].value := edt_nm_destino.text;

         nLinha := 11;
         // Alimenta a planilha
         while not qry_rel_flp_ind_.EOF do
         begin
           nLinha := nLinha + 1;

           oSheet.Cells[ nLinha, 2 ].value := qry_rel_flp_ind_NR_PROCESSO_PO.AsString;
           oSheet.Cells[ nLinha, 3 ].value := Copy( qry_rel_flp_ind_NR_PROCESSO.AsString, 5, 10 );
           oSheet.Cells[ nLinha, 4 ].value := qry_rel_flp_ind_NM_PAIS_DESTINO.AsString;
           oSheet.Cells[ nLinha, 5 ].value := qry_rel_flp_ind_NR_PROCESSO_PO_BOOK.AsString;
           oSheet.Cells[ nLinha, 6 ].value := qry_rel_flp_ind_NM_AREA.AsString;
           oSheet.Cells[ nLinha, 7 ].value := qry_rel_flp_ind_DT_SOLIC_ORD_VENDA.AsString;
           if qry_rel_flp_ind_FLAG_DT_EMISSAO_ORD_VENDA.AsString = '1' then
             oSheet.Cells[ nLinha, 8 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_EMISSAO_ORD_VENDA.AsString = '2' then
               oSheet.Cells[ nLinha, 8 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 8 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 8 ].value := qry_rel_flp_ind_DT_EMISSAO_ORD_VENDA.AsString;
           oSheet.Cells[ nLinha, 9 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 9 ].value := qry_rel_flp_ind_DT_SOLIC_ORD_REMESSA.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_EMISSAO_ORD_REMESSA.AsString = '1' then
             oSheet.Cells[ nLinha, 10 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_EMISSAO_ORD_REMESSA.AsString = '2' then
               oSheet.Cells[ nLinha, 10 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 10 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 10 ].value := qry_rel_flp_ind_DT_EMISSAO_ORD_REMESSA.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_EMAIL_LIB.AsString = '1' then
             oSheet.Cells[ nLinha, 11 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_EMAIL_LIB.AsString = '2' then
               oSheet.Cells[ nLinha, 11 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 11 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 11 ].value := qry_rel_flp_ind_DT_EMAIL_LIB.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_ABERTURA.AsString = '1' then
             oSheet.Cells[ nLinha, 12 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_ABERTURA.AsString = '2' then
               oSheet.Cells[ nLinha, 12 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 12 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 12 ].value := qry_rel_flp_ind_DT_ABERTURA.AsString;
           //
           oSheet.Cells[ nLinha, 13 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 13 ].value := qry_rel_flp_ind_DT_RECEB_INST_EMB.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_CK_LIST_OK.AsString = '1' then
             oSheet.Cells[ nLinha, 14 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_CK_LIST_OK.AsString = '2' then
               oSheet.Cells[ nLinha, 14 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 14 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 14 ].value := qry_rel_flp_ind_DT_CK_LIST_OK.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_CK_LIST_NC.AsString = '1' then
             oSheet.Cells[ nLinha, 15 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_CK_LIST_NC.AsString = '2' then
               oSheet.Cells[ nLinha, 15 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 15 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 15 ].value := qry_rel_flp_ind_DT_CK_LIST_NC.AsString;
           //
           oSheet.Cells[ nLinha, 16 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 16 ].value := qry_rel_flp_ind_DT_CK_LIST_NOTA.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_SOLIC_NUM.AsString = '1' then
             oSheet.Cells[ nLinha, 17 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_SOLIC_NUM.AsString = '2' then
               oSheet.Cells[ nLinha, 17 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 17 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 17 ].value := qry_rel_flp_ind_DT_SOLIC_NUM.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_RECEB_NUM.AsString = '1' then
             oSheet.Cells[ nLinha, 18 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_RECEB_NUM.AsString = '2' then
               oSheet.Cells[ nLinha, 18 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 18 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 18 ].value := qry_rel_flp_ind_DT_RECEB_NUM.AsString;
           //
           oSheet.Cells[ nLinha, 19 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 19 ].value := qry_rel_flp_ind_NM_ARMADOR.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_SOLIC_BOOKING.AsString = '1' then
             oSheet.Cells[ nLinha, 20 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_SOLIC_BOOKING.AsString = '2' then
               oSheet.Cells[ nLinha, 20 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 20 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 20 ].value := qry_rel_flp_ind_DT_SOLIC_BOOKING.AsString;
           //
           oSheet.Cells[ nLinha, 21 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 21 ].value := qry_rel_flp_ind_DT_CONF_BOOKING.AsString;
           oSheet.Cells[ nLinha, 22 ].value := qry_rel_flp_ind_NM_CONHECIMENTO.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_DEAD_LINE_IMO.AsString = '1' then
             oSheet.Cells[ nLinha, 23 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_DEAD_LINE_IMO.AsString = '2' then
               oSheet.Cells[ nLinha, 23 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 23 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 23 ].value := qry_rel_flp_ind_DT_DEAD_LINE_IMO.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_DEAD_LINE_BL.AsString = '1' then
             oSheet.Cells[ nLinha, 24 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_DEAD_LINE_BL.AsString = '2' then
               oSheet.Cells[ nLinha, 24 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 24 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 24 ].value := qry_rel_flp_ind_DT_DEAD_LINE_BL.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_DEAD_LINE_CARGA.AsString = '1' then
             oSheet.Cells[ nLinha, 25 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_DEAD_LINE_CARGA.AsString = '2' then
               oSheet.Cells[ nLinha, 25 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 25 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 25 ].value := qry_rel_flp_ind_DT_DEAD_LINE_CARGA.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_DEAD_LINE_DESEMB.AsString = '1' then
             oSheet.Cells[ nLinha, 26 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_DEAD_LINE_DESEMB.AsString = '2' then
               oSheet.Cells[ nLinha, 26 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 26 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 26 ].value := qry_rel_flp_ind_DT_DEAD_LINE_DESEMB.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_PROG_RET_CNTR_VAZIO.AsString = '1' then
             oSheet.Cells[ nLinha, 27 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_PROG_RET_CNTR_VAZIO.AsString = '2' then
               oSheet.Cells[ nLinha, 27 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 27 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 27 ].value := qry_rel_flp_ind_DT_PROG_RET_CNTR_VAZIO.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_PROG_CARREG_FABRICA.AsString = '1' then
             oSheet.Cells[ nLinha, 28 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_PROG_CARREG_FABRICA.AsString = '2' then
               oSheet.Cells[ nLinha, 28 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 28 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 28 ].value := qry_rel_flp_ind_DT_PROG_CARREG_FABRICA.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_PROG_ENTREGA_TERM.AsString = '1' then
             oSheet.Cells[ nLinha, 29 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_PROG_ENTREGA_TERM.AsString = '2' then
               oSheet.Cells[ nLinha, 29 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 29 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 29 ].value := qry_rel_flp_ind_DT_PROG_ENTREGA_TERM.AsString;
           //  PREV. EMB. CARREG.
           oSheet.Cells[ nLinha, 30 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 30 ].value := qry_rel_flp_ind_DT_PROG_PREV_EMB_CARREG.AsString;
           oSheet.Cells[ nLinha, 31 ].value := qry_rel_flp_ind_DT_PROG_ENTREGA.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_ATUAL_RET_CNTR_VAZIO.AsString = '1' then
             oSheet.Cells[ nLinha, 32 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_ATUAL_RET_CNTR_VAZIO.AsString = '2' then
               oSheet.Cells[ nLinha, 32 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 32 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 32 ].value := qry_rel_flp_ind_DT_ATUAL_RET_CNTR_VAZIO.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_ATUAL_CARREG_FABRICA.AsString = '1' then
             oSheet.Cells[ nLinha, 33 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_ATUAL_CARREG_FABRICA.AsString = '2' then
               oSheet.Cells[ nLinha, 33 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 33 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 33 ].value := qry_rel_flp_ind_DT_ATUAL_CARREG_FABRICA.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_ATUAL_ENTREGA_TERM.AsString = '1' then
             oSheet.Cells[ nLinha, 34 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_ATUAL_ENTREGA_TERM.AsString = '2' then
               oSheet.Cells[ nLinha, 34 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 34 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 34 ].value := qry_rel_flp_ind_DT_ATUAL_ENTREGA_TERM.AsString;
           //
           oSheet.Cells[ nLinha, 35 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 35 ].value := qry_rel_flp_ind_DT_ATUAL_EMB_CARREG.AsString;
           oSheet.Cells[ nLinha, 36 ].value := qry_rel_flp_ind_DT_ATUAL_ENTREGA.AsString;
           oSheet.Cells[ nLinha, 37 ].value := qry_rel_flp_ind_DT_ENV_INFO_CLI.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_INSPECAO_EMB.AsString = '1' then
             oSheet.Cells[ nLinha, 38 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_INSPECAO_EMB.AsString = '2' then
               oSheet.Cells[ nLinha, 38 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 38 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 38 ].value := qry_rel_flp_ind_DT_INSPECAO_EMB.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_SOLIC_FUMIG.AsString = '1' then
             oSheet.Cells[ nLinha, 39 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_SOLIC_FUMIG.AsString = '2' then
               oSheet.Cells[ nLinha, 39 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 39 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 39 ].value := qry_rel_flp_ind_DT_SOLIC_FUMIG.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_CONF_FUMIG.AsString = '1' then
             oSheet.Cells[ nLinha, 40 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_CONF_FUMIG.AsString = '2' then
               oSheet.Cells[ nLinha, 40 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 40 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 40 ].value := qry_rel_flp_ind_DT_CONF_FUMIG.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_EMISSAO_CONFEC_DOCS.AsString = '1' then
             oSheet.Cells[ nLinha, 41 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_EMISSAO_CONFEC_DOCS.AsString = '2' then
               oSheet.Cells[ nLinha, 41 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 41 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 41 ].value := qry_rel_flp_ind_DT_EMISSAO_CONFEC_DOCS.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_CONF_CONFEC_DOCS.AsString = '1' then
             oSheet.Cells[ nLinha, 42 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_CONF_CONFEC_DOCS.AsString = '2' then
               oSheet.Cells[ nLinha, 42 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 42 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 42 ].value := qry_rel_flp_ind_DT_CONF_CONFEC_DOCS.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_CERT_ORIGEM.AsString = '1' then
             oSheet.Cells[ nLinha, 43 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_CERT_ORIGEM.AsString = '2' then
               oSheet.Cells[ nLinha, 43 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 43 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 43 ].value := qry_rel_flp_ind_DT_CERT_ORIGEM.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_DIGITALIZACAO.AsString = '1' then
             oSheet.Cells[ nLinha, 44 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_DIGITALIZACAO.AsString = '2' then
               oSheet.Cells[ nLinha, 44 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 44 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 44 ].value := qry_rel_flp_ind_DT_DIGITALIZACAO.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_EMISSAO_RE.AsString = '1' then
             oSheet.Cells[ nLinha, 45 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_EMISSAO_RE.AsString = '2' then
               oSheet.Cells[ nLinha, 45 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 45 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 45 ].value := qry_rel_flp_ind_DT_EMISSAO_RE.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_LIB_RE.AsString = '1' then
             oSheet.Cells[ nLinha, 46 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_LIB_RE.AsString = '2' then
               oSheet.Cells[ nLinha, 46 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 46 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 46 ].value := qry_rel_flp_ind_DT_LIB_RE.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_RECEB_NF.AsString = '1' then
             oSheet.Cells[ nLinha, 47 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_RECEB_NF.AsString = '2' then
               oSheet.Cells[ nLinha, 47 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 47 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 47 ].value := qry_rel_flp_ind_DT_RECEB_NF.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_EMISSAO_DDE.AsString = '1' then
             oSheet.Cells[ nLinha, 48 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_EMISSAO_DDE.AsString = '2' then
               oSheet.Cells[ nLinha, 48 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 48 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 48 ].value := qry_rel_flp_ind_DT_EMISSAO_DDE.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_LIB_DDE.AsString = '1' then
             oSheet.Cells[ nLinha, 49 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_LIB_DDE.AsString = '2' then
               oSheet.Cells[ nLinha, 49 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 49 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 49 ].value := qry_rel_flp_ind_DT_LIB_DDE.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_EMISSAO_DOCS.AsString = '1' then
             oSheet.Cells[ nLinha, 50 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_EMISSAO_DOCS.AsString = '2' then
               oSheet.Cells[ nLinha, 50 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 50 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 50 ].value := qry_rel_flp_ind_DT_EMISSAO_DOCS.AsString;
           //
           oSheet.Cells[ nLinha, 51 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 51 ].value := qry_rel_flp_ind_DT_REEMISSAO_DOCS.AsString;
           oSheet.Cells[ nLinha, 52 ].value := qry_rel_flp_ind_DT_PREV_CHEGADA_DEST.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_LEGAL_CONSUL.AsString = '1' then
             oSheet.Cells[ nLinha, 53 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_LEGAL_CONSUL.AsString = '2' then
               oSheet.Cells[ nLinha, 53 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 53 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 53 ].value := qry_rel_flp_ind_DT_LEGAL_CONSUL.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_RET_REC_DOCS.AsString = '1' then
             oSheet.Cells[ nLinha, 54 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_RET_REC_DOCS.AsString = '2' then
               oSheet.Cells[ nLinha, 54 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 54 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 54 ].value := qry_rel_flp_ind_DT_RET_REC_DOCS.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_EMISSAO_FORM_A.AsString = '1' then
             oSheet.Cells[ nLinha, 55 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_EMISSAO_FORM_A.AsString = '2' then
               oSheet.Cells[ nLinha, 55 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 55 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 55 ].value := qry_rel_flp_ind_DT_EMISSAO_FORM_A.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_LIB_FORM_A.AsString = '1' then
             oSheet.Cells[ nLinha, 56 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_LIB_FORM_A.AsString = '2' then
               oSheet.Cells[ nLinha, 56 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 56 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 56 ].value := qry_rel_flp_ind_DT_LIB_FORM_A.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_AVISO_EMB_CLI.AsString = '1' then
             oSheet.Cells[ nLinha, 57 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_AVISO_EMB_CLI.AsString = '2' then
               oSheet.Cells[ nLinha, 57 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 57 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 57 ].value := qry_rel_flp_ind_DT_AVISO_EMB_CLI.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_SAQUE_BORDERO.AsString = '1' then
             oSheet.Cells[ nLinha, 58 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_SAQUE_BORDERO.AsString = '2' then
               oSheet.Cells[ nLinha, 58 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 58 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 58 ].value := qry_rel_flp_ind_DT_SAQUE_BORDERO.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_ENVIO_COURRIER.AsString = '1' then
             oSheet.Cells[ nLinha, 59 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_ENVIO_COURRIER.AsString = '2' then
               oSheet.Cells[ nLinha, 59 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 59 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 59 ].value := qry_rel_flp_ind_DT_ENVIO_COURRIER.AsString;
           //
           oSheet.Cells[ nLinha, 60 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 60 ].value := qry_rel_flp_ind_DT_RECEB_COURRIER.AsString;
           if qry_rel_flp_ind_FLAG_DT_AVERBACAO.AsString = '1' then
             oSheet.Cells[ nLinha, 61 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_AVERBACAO.AsString = '2' then
               oSheet.Cells[ nLinha, 61 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 61 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 61 ].value := qry_rel_flp_ind_DT_AVERBACAO.AsString;
           //
           oSheet.Cells[ nLinha, 62 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 62 ].value := qry_rel_flp_ind_DT_ALT_RE.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_ENVIO_FAT.AsString = '1' then
             oSheet.Cells[ nLinha, 63 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_ENVIO_FAT.AsString = '2' then
               oSheet.Cells[ nLinha, 63 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 63 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 63 ].value := qry_rel_flp_ind_DT_ENVIO_FAT.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_EMISSAO_FAT.AsString = '1' then
             oSheet.Cells[ nLinha, 64 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_EMISSAO_FAT.AsString = '2' then
               oSheet.Cells[ nLinha, 64 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 64 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 64 ].value := qry_rel_flp_ind_DT_EMISSAO_FAT.AsString;
           //
           if qry_rel_flp_ind_FLAG_DT_CONF_FAT.AsString = '1' then
             oSheet.Cells[ nLinha, 65 ].Font.ColorIndex := 3
           else
             if qry_rel_flp_ind_FLAG_DT_CONF_FAT.AsString = '2' then
               oSheet.Cells[ nLinha, 65 ].Font.ColorIndex := 5
             else
               oSheet.Cells[ nLinha, 65 ].Font.ColorIndex := 1;
           oSheet.Cells[ nLinha, 65 ].value := qry_rel_flp_ind_DT_CONF_FAT.AsString;
           oSheet.Cells[ nLinha, 66 ].value := '  ';

           qry_rel_flp_ind_.next;
         end;

         sp_rel_flp_ind.close;
         Screen.Cursor := crDefault;

         //Limpa a tabela auxiliar
         ApagaDados( 'TREL_FLP_IND', nr_identificador );

         Excel.Visible := True;

         // Envia msg de sucesso
         ShowMessage('Planilha gerada com sucesso');

         Screen.Cursor := crDefault;
         Application.ProcessMessages;
      end;
    end;


    //----------------   Follow-Up - Controle de Processos
    if tp_rel = 3 then
    begin
      CloseStoredProc( sp_rel_controle_proc );
      if Trim( msk_cd_unid_neg.Text ) = '' then
        sp_rel_controle_proc.ParamByName('@cd_unid_neg').AsString := 'X'
      else
        sp_rel_controle_proc.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
      if Trim( msk_cd_grupo.Text ) = '' then
        sp_rel_controle_proc.ParamByName('@cd_grupo').AsString    := 'X'
      else
        sp_rel_controle_proc.ParamByName('@cd_grupo').AsString    := msk_cd_grupo.Text;
      if Trim( msk_cd_cliente.Text ) = '' then
        sp_rel_controle_proc.ParamByName('@cd_cliente').AsString  := 'X'
      else
        sp_rel_controle_proc.ParamByName('@cd_cliente').AsString  := msk_cd_cliente.Text;
      if Trim( msk_cd_area.Text ) = '' then
        sp_rel_controle_proc.ParamByName('@cd_area').AsString     := 'X'
      else
        sp_rel_controle_proc.ParamByName('@cd_area').AsString     := msk_cd_area.Text;
      if Trim( msk_cd_via_transp.Text ) = '' then
        sp_rel_controle_proc.ParamByName('@cd_via_transporte').AsString  := 'X'
      else
        sp_rel_controle_proc.ParamByName('@cd_via_transporte').AsString  := msk_cd_via_transp.Text;
      if Trim( msk_cd_analista.Text ) = '' then
        sp_rel_controle_proc.ParamByName('@cd_analista_comissaria').AsString  := 'X'
      else
        sp_rel_controle_proc.ParamByName('@cd_analista_comissaria').AsString  := msk_cd_analista.Text;
      if Trim( msk_cd_contato.Text ) = '' then
        sp_rel_controle_proc.ParamByName('@cd_contato').AsString  := 'X'
      else
        sp_rel_controle_proc.ParamByName('@cd_contato').AsString  := msk_cd_contato.Text;
      if Trim( msk_cd_pais.Text ) = '' then
        sp_rel_controle_proc.ParamByName('@cd_pais').AsString  := 'X'
      else
        sp_rel_controle_proc.ParamByName('@cd_pais').AsString  := msk_cd_pais.Text;
      if Trim( msk_cd_transp.Text ) = '' then
        sp_rel_controle_proc.ParamByName('@cd_transp').AsString  := 'X'
      else
        sp_rel_controle_proc.ParamByName('@cd_transp').AsString  := msk_cd_transp.Text;
      if chk_obs.Checked then
        sp_rel_controle_proc.ParamByName('@in_obs').AsString  := '1'
      else
        sp_rel_controle_proc.ParamByName('@in_obs').AsString  := '0';
      if chk_eta.Checked then
        sp_rel_controle_proc.ParamByName('@dt_eta').AsDate  := msk_dt_eta.Date
      else
        sp_rel_controle_proc.ParamByName('@dt_eta').AsDate  := 109575;      // data = 01/01/1900

      // 0 - Averbação   1 - Retirada BL     2 - Saque Bordero
      sp_rel_controle_proc.ParamByName('@in_conclusor').AsString  := IntToStr( dbrgrp_ev_conclusor.ItemIndex );
      sp_rel_controle_proc.ParamByName('@dt_inicio').AsDate       := msk_dt_inicio.Date;
      sp_rel_controle_proc.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;

      ExecStoredProc( sp_rel_controle_proc );
      nr_identificador := sp_rel_controle_proc.ParamByName('@nr_identificador').AsInteger;
      CloseStoredProc( sp_rel_controle_proc );

      qry_controle_proc_.Close;
      qry_controle_proc_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
      if msk_cd_via_transp.Text = '07' then    // Qdo via de transporte rodoviária ( 7 ) muda o ORDER BY
        qry_controle_proc_.SQL[34] := 'P.NM_PAIS, R.DT_PREV_CARREGAMENTO, T.NM_TRANSP_ROD, R.NR_CAMINHAO, R.CD_CLIENTE, R.NM_CONTATO';
      qry_controle_proc_.Prepare;
      qry_controle_proc_.Open;

      if qry_controle_proc_.EOF then
      begin
        BoxMensagem('Não há dados para exibir', 2)
      end
      else
      begin
        try
          Excel := CreateOLEObject('Excel.Application');

          if msk_cd_via_transp.Text <> '07' then
          begin
            xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\Controle_E.XLS' );
            Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\Controle_E_' +
            Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');
          end
          else
          begin
            xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\Cont_E.XLS' );
            Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\Cont_E_' +
            Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');
          end;
          oSheet := Excel.WorkBooks[1].Worksheets[1];
        except
          begin
            BoxMensagem('Erro na criação da Planilha.', 2) ;
            Exit;
          end
        end;

        // Filtros da planilha
        //oSheet.Cells[ 03, 09 ].Interior.ColorIndex := 38;
        oSheet.Cells[ 03, 05 ].value := edt_nm_unid_neg.text;
        oSheet.Cells[ 03, 09 ].value := DatetoStr( msk_dt_inicio.date ) + ' à ' + DatetoStr( msk_dt_fim.date );
        if ( edt_nm_grupo.text = '' ) OR ( Trim( edt_nm_grupo.text ) = 'Todos' ) then
        begin
          oSheet.Cells[ 04, 04 ].value := 'Cliente:';
          oSheet.Cells[ 04, 05 ].value := edt_nm_cliente.text;
        end
        else
        begin
          oSheet.Cells[ 04, 04 ].value := 'Grupo:';
          oSheet.Cells[ 04, 05 ].value := edt_nm_grupo.text;
        end;
        oSheet.Cells[ 05, 05 ].value := edt_nm_via_transp.text;
        oSheet.Cells[ 06, 05 ].value := edt_nm_contato.text;
        nLinha := 9;
        navio := '';

         // Alimenta a planilha
         while not qry_controle_proc_.EOF do
         begin
           nLinha := nLinha + 1;
           if ( navio <> qry_controle_proc_EMBARCACAO.AsString ) then
           begin
             // oSheet.Cells[ nLinha, 04 ].Interior.ColorIndex := 37;

             nLinha := nLinha + 1;
             oSheet.Cells[ nLinha, 01 ].Font.Bold := True;
             oSheet.Cells[ nLinha, 01 ].value := 'Navio: ' + qry_controle_proc_EMBARCACAO.AsString;
             navio := qry_controle_proc_EMBARCACAO.AsString;

             oSheet.Cells[ nLinha, 04 ].Font.Bold := True;
             oSheet.Cells[ nLinha, 04 ].value := 'ETA: ' + qry_controle_proc_DT_PREV_EMB.AsString;
             oSheet.Cells[ nLinha, 06 ].Font.Bold := True;
             oSheet.Cells[ nLinha, 06 ].value := 'Saída: ' + qry_controle_proc_DT_EMBARQUE.AsString;

             nLinha := nLinha + 1;
           end;

           oSheet.Cells[ nLinha, 1 ].value := qry_controle_proc_NR_PROCESSO.AsString;
           if msk_cd_via_transp.Text <> '07' then
           begin
             oSheet.Cells[ nLinha, 2 ].value := qry_controle_proc_CLIENTE.AsString
           end
           else
             oSheet.Cells[ nLinha, 2 ].value := qry_controle_proc_IMPORTADOR.AsString;

           if msk_cd_via_transp.Text <> '07' then
           begin
             oSheet.Cells[ nLinha, 3 ].value := qry_controle_proc_FATURA.AsString;
             oSheet.Cells[ nLinha, 4 ].value := qry_controle_proc_AREA.AsString;
             oSheet.Cells[ nLinha, 5 ].value := qry_controle_proc_CONTATO.AsString;
             oSheet.Cells[ nLinha, 6 ].value := qry_controle_proc_PAIS.AsString;
           end
           else   // Rodoviário
           begin
             oSheet.Cells[ nLinha, 3 ].value := qry_controle_proc_ORDEM.AsString;
             oSheet.Cells[ nLinha, 4 ].value := qry_controle_proc_FATURA.AsString;
             oSheet.Cells[ nLinha, 5 ].value := qry_controle_proc_AREA.AsString;
             oSheet.Cells[ nLinha, 6 ].value := qry_controle_proc_CONTATO.AsString;
             oSheet.Cells[ nLinha, 7 ].value := qry_controle_proc_PAIS.AsString;
           end;

           if msk_cd_via_transp.Text <> '07' then
           begin
             oSheet.Cells[ nLinha, 7 ].value := qry_controle_proc_NR_BOOKING.AsString;
             if qry_controle_proc_DT_BOOKING.AsString <> '' then
               oSheet.Cells[ nLinha, 8 ].value := Copy( qry_controle_proc_DT_BOOKING.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_BOOKING.AsString, 9, 2 )
             else
             begin
               if qry_controle_proc_IN_BOOKING.AsString = '0' then
                 oSheet.Cells[ nLinha, 8 ].value := '-';
             end;
             if qry_controle_proc_DT_DD_IMO.AsString <> '' then
               oSheet.Cells[ nLinha, 9 ].value := Copy( qry_controle_proc_DT_DD_IMO.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_DD_IMO.AsString, 9, 2 )
             else
             begin
               if qry_controle_proc_IN_DD_IMO.AsString = '0' then
                 oSheet.Cells[ nLinha, 9 ].value := '-';
             end;
             if qry_controle_proc_DT_ENT_IMO.AsString <> '' then
               oSheet.Cells[ nLinha, 10 ].value := Copy( qry_controle_proc_DT_ENT_IMO.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_ENT_IMO.AsString, 9, 2 )
             else
             begin
               if qry_controle_proc_IN_ENT_IMO.AsString = '0' then
                 oSheet.Cells[ nLinha, 10 ].value := '-';
             end;
             if qry_controle_proc_DT_LIBERACAO.AsString <> '' then
               oSheet.Cells[ nLinha, 11 ].value := Copy( qry_controle_proc_DT_LIBERACAO.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_LIBERACAO.AsString, 9, 2 )
             else
             begin
               if qry_controle_proc_IN_LIBERACAO.AsString = '0' then
                 oSheet.Cells[ nLinha, 11 ].value := '-';
             end;
             if qry_controle_proc_DT_DESEMB.AsString <> '' then
               oSheet.Cells[ nLinha, 12 ].value := Copy( qry_controle_proc_DT_DESEMB.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_DESEMB.AsString, 9, 2 )
             else
             begin
               if qry_controle_proc_IN_DESEMB.AsString = '0' then
                 oSheet.Cells[ nLinha, 12 ].value := '-';
             end;
             if qry_controle_proc_DT_DD_DDE.AsString <> '' then
               oSheet.Cells[ nLinha, 13 ].value := Copy( qry_controle_proc_DT_DD_DDE.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_DD_DDE.AsString, 9, 2 )
             else
             begin
               if qry_controle_proc_IN_DD_DDE.AsString = '0' then
                 oSheet.Cells[ nLinha, 13 ].value := '-';
             end;
             if qry_controle_proc_DT_ENT_DDE.AsString <> '' then
               oSheet.Cells[ nLinha, 14 ].value := Copy( qry_controle_proc_DT_ENT_DDE.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_ENT_DDE.AsString, 9, 2 )
             else
             begin
               if qry_controle_proc_IN_ENT_DDE.AsString = '0' then
                 oSheet.Cells[ nLinha, 14 ].value := '-';
             end;
             if qry_controle_proc_DT_INSPECAO.AsString <> '' then
               oSheet.Cells[ nLinha, 15 ].value := Copy( qry_controle_proc_DT_INSPECAO.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_INSPECAO.AsString, 9, 2 )
             else
             begin
               if qry_controle_proc_IN_INSPECAO.AsString = '0' then
                 oSheet.Cells[ nLinha, 15 ].value := '-';
             end;
             if qry_controle_proc_DT_FUMIGACAO.AsString <> '' then
               oSheet.Cells[ nLinha, 16 ].value := Copy( qry_controle_proc_DT_FUMIGACAO.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_FUMIGACAO.AsString, 9, 2 )
             else
             begin
               if qry_controle_proc_IN_FUMIGACAO.AsString = '0' then
                 oSheet.Cells[ nLinha, 16 ].value := '-';
             end;
             if qry_controle_proc_DT_DD_CC.AsString <> '' then
               oSheet.Cells[ nLinha, 17 ].value := Copy( qry_controle_proc_DT_DD_CC.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_DD_CC.AsString, 9, 2 )
             else
             begin
               if qry_controle_proc_IN_DD_CC.AsString = '0' then
                 oSheet.Cells[ nLinha, 17 ].value := '-';
             end;
             if qry_controle_proc_DT_ENT_MERCAD.AsString <> '' then
               oSheet.Cells[ nLinha, 18 ].value := Copy( qry_controle_proc_DT_ENT_MERCAD.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_ENT_MERCAD.AsString, 9, 2 )
             else
             begin
               if qry_controle_proc_IN_ENT_MERCAD.AsString = '0' then
                 oSheet.Cells[ nLinha, 18 ].value := '-';
             end;
             if qry_controle_proc_DT_DD_DRAFT.AsString <> '' then
               oSheet.Cells[ nLinha, 19 ].value := Copy( qry_controle_proc_DT_DD_DRAFT.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_DD_DRAFT.AsString, 9, 2 )
             else
             begin
               if qry_controle_proc_IN_DD_DRAFT.AsString = '0' then
                 oSheet.Cells[ nLinha, 19 ].value := '-';
             end;
             if qry_controle_proc_DT_ENT_DRAFT_BL.AsString <> '' then
               oSheet.Cells[ nLinha, 20 ].value := Copy( qry_controle_proc_DT_ENT_DRAFT_BL.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_ENT_DRAFT_BL.AsString, 9, 2 )
             else
             begin
               if qry_controle_proc_IN_ENT_DRAFT_BL.AsString = '0' then
                 oSheet.Cells[ nLinha, 20 ].value := '-';
             end;
             oSheet.Cells[ nLinha, 21 ].value := Copy( qry_controle_proc_DT_EMBARQUE.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_EMBARQUE.AsString, 9, 2 );
             if qry_controle_proc_DT_RET_BL.AsString <> '' then
               oSheet.Cells[ nLinha, 22 ].value := Copy( qry_controle_proc_DT_RET_BL.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_RET_BL.AsString, 9, 2 )
             else
             begin
               if qry_controle_proc_IN_RET_BL.AsString = '0' then
                 oSheet.Cells[ nLinha, 22 ].value := '-';
             end;
             if qry_controle_proc_DT_ENVIO_DOC_CLI.AsString <> '' then
               oSheet.Cells[ nLinha, 23 ].value := Copy( qry_controle_proc_DT_ENVIO_DOC_CLI.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_ENVIO_DOC_CLI.AsString, 9, 2 )
             else
             begin
               if qry_controle_proc_IN_ENVIO_DOC_CLI.AsString = '0' then
                 oSheet.Cells[ nLinha, 23 ].value := '-';
             end;
             if qry_controle_proc_DT_ENVIO_SAQUE_BORDERO.AsString <> '' then
               oSheet.Cells[ nLinha, 24 ].value := Copy( qry_controle_proc_DT_ENVIO_SAQUE_BORDERO.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_ENVIO_SAQUE_BORDERO.AsString, 9, 2 )
             else
             begin
               if qry_controle_proc_IN_ENVIO_SB.AsString = '0' then
                 oSheet.Cells[ nLinha, 24 ].value := '-';
             end;
           end
           else // Rodoviário
           begin
             oSheet.Cells[ nLinha, 8 ].value := qry_controle_proc_TRANSPORTADORA.AsString;
             if length( qry_controle_proc_NR_CAMINHAO.AsString ) <> 0 then
               oSheet.Cells[ nLinha, 9 ].value := qry_controle_proc_NR_CAMINHAO.AsString
             else
               oSheet.Cells[ nLinha, 9 ].value := ' ';
             // Booking Rodoviário
             if qry_controle_proc_DT_PREV_CARREGAMENTO.AsString <> '' then
               oSheet.Cells[ nLinha, 10 ].value := Copy( qry_controle_proc_DT_PREV_CARREGAMENTO.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_PREV_CARREGAMENTO.AsString, 9, 2 )
             else
               oSheet.Cells[ nLinha, 10 ].value := '*';
             if qry_controle_proc_DT_BOOKING.AsString <> '' then
               oSheet.Cells[ nLinha, 11 ].value := Copy( qry_controle_proc_DT_BOOKING.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_BOOKING.AsString, 9, 2 )
             else
               oSheet.Cells[ nLinha, 11 ].value := '*';
             // IMO
             if qry_controle_proc_DT_DD_IMO.AsString <> '' then
               oSheet.Cells[ nLinha, 12 ].value := Copy( qry_controle_proc_DT_DD_IMO.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_DD_IMO.AsString, 9, 2 )
             else
               oSheet.Cells[ nLinha, 12 ].value := '*';
             if qry_controle_proc_DT_EMBARQUE.AsString <> '' then
               oSheet.Cells[ nLinha, 13 ].value := Copy( qry_controle_proc_DT_EMBARQUE.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_EMBARQUE.AsString, 9, 2 )
             else
               oSheet.Cells[ nLinha, 13 ].value := '*';
             if qry_controle_proc_DT_CHEGADA_FRONTEIRA.AsString <> '' then
               oSheet.Cells[ nLinha, 14 ].value := Copy( qry_controle_proc_DT_CHEGADA_FRONTEIRA.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_CHEGADA_FRONTEIRA.AsString, 9, 2 )
             else
               oSheet.Cells[ nLinha, 14 ].value := '*';
             // RE
             if qry_controle_proc_DT_LIBERACAO.AsString <> '' then
               oSheet.Cells[ nLinha, 15 ].value := Copy( qry_controle_proc_DT_LIBERACAO.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_LIBERACAO.AsString, 9, 2 )
             else
             begin
               if qry_controle_proc_IN_LIBERACAO.AsString = '0' then
                 oSheet.Cells[ nLinha, 15 ].value := '-'
               else
                 oSheet.Cells[ nLinha, 15 ].value := '*';
             end;
             // DDE
             if qry_controle_proc_DT_DESEMB.AsString <> '' then
               oSheet.Cells[ nLinha, 16 ].value := Copy( qry_controle_proc_DT_DESEMB.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_DESEMB.AsString, 9, 2 )
             else
               oSheet.Cells[ nLinha, 16 ].value := '*';
             if qry_controle_proc_DT_ENT_IMO.AsString <> '' then
               oSheet.Cells[ nLinha, 17 ].value := Copy( qry_controle_proc_DT_ENT_IMO.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_ENT_IMO.AsString, 9, 2 )
             else
               oSheet.Cells[ nLinha, 17 ].value := '*';
             // Docs Enviados
             if qry_controle_proc_DT_ENVIO_DOC_CLI.AsString <> '' then
               oSheet.Cells[ nLinha, 18 ].value := Copy( qry_controle_proc_DT_ENVIO_DOC_CLI.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_ENVIO_DOC_CLI.AsString, 9, 2 )
             else
             begin
               if qry_controle_proc_IN_ENVIO_DOC_CLI.AsString = '0' then
                 oSheet.Cells[ nLinha, 18 ].value := '-'
               else
                 oSheet.Cells[ nLinha, 18 ].value := '*';
             end;
             if qry_controle_proc_DT_ENVIO_SAQUE_BORDERO.AsString <> '' then
               oSheet.Cells[ nLinha, 19 ].value := Copy( qry_controle_proc_DT_ENVIO_SAQUE_BORDERO.AsString, 1, 6 ) + Copy( qry_controle_proc_DT_ENVIO_SAQUE_BORDERO.AsString, 9, 2 )
             else
             begin
               if qry_controle_proc_IN_ENVIO_SB.AsString = '0' then
                 oSheet.Cells[ nLinha, 19 ].value := '-'
               else
                 oSheet.Cells[ nLinha, 19 ].value := '*';
             end;
           end;

           if chk_obs.Checked then
           begin
             nLinha := nLinha + 1;
             oSheet.Cells[ nLinha, 1 ].value := qry_controle_proc_TX_OBS.AsString;

             // Comando abaixo faz observação sair em uma linha. Retirado em 05/07/2005 a pedido de usuário
             //oSheet.Cells[ nLinha, 1 ].WrapText := False;
           end;

           qry_controle_proc_.next;
         end;

         sp_rel_controle_proc.close;
         Screen.Cursor := crDefault;

         // Limpa a tabela auxiliar
         ApagaDados( 'TREL_CONTROLE_EXP', nr_identificador );

         Excel.Visible := True;

         // Envia msg de sucesso
         ShowMessage('Planilha gerada com sucesso');

         Screen.Cursor := crDefault;
         Application.ProcessMessages;
      end;
    end;
  end;
  Screen.Cursor := crDefault;
end;


procedure Tfrm_rel_exp_flp.FormShow(Sender: TObject);
begin
  msk_dt_inicio.Date := dt_server;
  msk_dt_fim.Date    := dt_server;

  with datm_rel_exp_flp do
  begin
    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;
    qry_via_transp_.Close;
    qry_via_transp_.Prepare;
    qry_via_transp_.Open;
    qry_via_.Close;
    qry_via_.Prepare;
    qry_via_.Open;
  end;

  if ( tp_rel = 1 ) then
  begin
    frm_rel_exp_flp.Height := 482;
    frm_rel_exp_flp.Caption := 'Follow-Up ( Controle de Exportação )';

    chk_obs.Visible := True;
    chk_obs.TabOrder := 8;
    dbrgrp_ev_conclusor.Visible := True;
    dbrgrp_ev_conclusor.TabOrder := 9;
    lbl_periodo.Top := lbl_periodo.Top + 55;
    msk_dt_inicio.Top := msk_dt_inicio.Top + 55;
    msk_dt_fim.Top := msk_dt_fim.Top + 55;
    lbl_a.Top := lbl_a.Top + 55;
    btn_imprimir.Top := btn_imprimir.Top + 55;
    btn_sair.Top := btn_sair.Top + 55;

    msk_dt_inicio.TabOrder := dbrgrp_ev_conclusor.TabOrder + 1;
    msk_dt_fim.TabOrder    := msk_dt_inicio.TabOrder + 1;
  end;

  if tp_rel = 2 then
  begin
    frm_rel_exp_flp.Height := 430;
    frm_rel_exp_flp.Caption := 'Planilha Controle Processos';

    Label1.Visible := False;
    msk_cd_area.Visible := False;
    edt_nm_area.Visible := False;
    btn_co_area.Visible := False;

    Label2.Top := 123;
    msk_cd_via_transp.Top := 137;
    edt_nm_via_transp.Top := 137;
    btn_co_via_transp.Top := 137;

    Label3.Visible := False;
    msk_cd_analista.Visible := False;
    edt_nm_analista.Visible := False;
    btn_co_analista.Visible := False;

    Label4.Caption := 'Analista';
    Label4.Top := 162;
    msk_cd_contato.Top := 177;
    edt_nm_contato.Top := 177;
    btn_co_contato.Top := 177;

    Label5.Visible := True;
    msk_cd_destino.Visible := True;
    edt_nm_destino.Visible := True;
    btn_co_destino.Visible := True;
    Label5.Top := 201;
    msk_cd_destino.Top := 215;
    edt_nm_destino.Top := 215;
    btn_co_destino.Top := 215;

    chk_arquivo.Visible := False;

    Label6.Visible := True;
    cbo_faturado.Visible := True;
    Label6.Top := 239;
    cbo_faturado.Top := 253;

    msk_dt_inicio.TabOrder := cbo_faturado.TabOrder + 1;
    msk_dt_fim.TabOrder    := msk_dt_inicio.TabOrder + 1;
  end;

  if tp_rel = 3 then
  begin
    frm_rel_exp_flp.Height := 572;
    frm_rel_exp_flp.Caption := 'Follow-Up - Controle de Processos';
    lblpais.Visible := True;
    msk_cd_pais.Visible := True;
    edt_nm_pais.Visible := True;
    btn_co_pais.Visible := True;
    lbltransp.Visible := True;
    msk_cd_transp.Visible := True;
    edt_nm_transp.Visible := True;
    btn_co_transp.Visible := True;
    msk_cd_pais.TabOrder := msk_cd_contato.TabOrder + 1;
    msk_cd_transp.TabOrder := msk_cd_pais.TabOrder + 1;

    lblpais.Top := lblpais.Top - 192;
    msk_cd_pais.Top := msk_cd_pais.Top - 192;
    edt_nm_pais.Top := edt_nm_pais.Top - 192;
    btn_co_pais.Top := btn_co_pais.Top - 192;
    lbltransp.Top := lbltransp.Top - 190;
    msk_cd_transp.Top := msk_cd_transp.Top - 190;
    edt_nm_transp.Top := edt_nm_transp.Top - 190;
    btn_co_transp.Top := btn_co_transp.Top - 190;

    chk_arquivo.Visible := False;
    chk_obs.Visible := True;
    chk_obs.TabOrder := 9;
    chk_eta.Visible := True;
    chk_eta.TabOrder := 10;
    dbrgrp_ev_conclusor.Visible := True;
    dbrgrp_ev_conclusor.TabOrder := 11;
    lbl_periodo.Top := lbl_periodo.Top + 135;
    msk_dt_inicio.Top := msk_dt_inicio.Top + 135;
    msk_dt_fim.Top := msk_dt_fim.Top + 135;
    lbl_a.Top := lbl_a.Top + 135;
    chk_obs.Top := chk_obs.Top + 65;
    chk_eta.Top := chk_eta.Top + 65;
    msk_dt_eta.Top := msk_dt_eta.Top + 65;
    dbrgrp_ev_conclusor.Top := dbrgrp_ev_conclusor.Top + 80;
    btn_imprimir.Top := btn_imprimir.Top + 140;
    btn_sair.Top := btn_sair.Top + 140;

    msk_dt_inicio.TabOrder := dbrgrp_ev_conclusor.TabOrder + 1;
    msk_dt_fim.TabOrder    := msk_dt_inicio.TabOrder + 1;
  end;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_rel_exp_flp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_rel_exp_flp do
  begin
    qry_grupo_.Close;
    qry_cliente_.Close;
    qry_unid_neg_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_rel_exp_flp.FormCreate(Sender: TObject);
begin
  // Inicializa o Data Module
  Application.CreateForm( Tdatm_rel_exp_flp, datm_rel_exp_flp );
end;

procedure Tfrm_rel_exp_flp.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.text = '' then
  begin
    if tp_rel = 5 then edt_nm_cliente.Text := ''
    else edt_nm_cliente.Text := 'Todos';
    msk_cd_contato.Enabled := False;
    msk_cd_contato.TabStop := False;
    msk_cd_contato.Color   := clMenu;
    edt_nm_contato.Text    := '';
    btn_co_contato.Enabled := False;
    Exit;
  end
  else
  begin
    if msk_cd_unid_neg.text <> '' then
    begin
      msk_cd_contato.Enabled := True;
      msk_cd_contato.TabStop := True;
      msk_cd_contato.Color   := clWindow;
      btn_co_contato.Enabled := True;
    end;
  end;
  ValCodEdt( msk_cd_cliente );
  with datm_rel_exp_flp.qry_cliente_ do
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
    else
    begin
      edt_nm_cliente.Text:= FieldByName('AP_EMPRESA').AsString;
    end;
    Close;
  end;
end;

procedure Tfrm_rel_exp_flp.btn_co_clienteClick(Sender: TObject);
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

procedure Tfrm_rel_exp_flp.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg   then btn_co_unid_negClick(nil);
    if Sender = msk_cd_grupo      then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente    then btn_co_clienteClick(nil);
    if Sender = msk_cd_area       then btn_co_areaClick(nil);
    if Sender = msk_cd_via_transp then btn_co_via_transpClick(nil);
    if Sender = msk_cd_analista   then btn_co_analistaClick(nil);
    if Sender = msk_cd_destino    then btn_co_destinoClick(nil);
    if Sender = msk_cd_pais       then btn_co_paisClick(nil);
    if Sender = msk_cd_transp     then btn_co_transpClick(nil);
  end;
end;

procedure Tfrm_rel_exp_flp.btn_co_grupoClick(Sender: TObject);
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

procedure Tfrm_rel_exp_flp.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.Text = '' then
  begin
    if tp_rel = 5 then edt_nm_grupo.Text := ''
    else edt_nm_grupo.Text := 'Todos';
    Exit;
  end;
  ValCodEdt( msk_cd_grupo );
  with datm_rel_exp_flp.qry_grupo_ do
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

procedure Tfrm_rel_exp_flp.msk_cd_grupoChange(Sender: TObject);
begin
  if msk_cd_grupo.Text = '' then
  begin
    msk_cd_cliente.Color   := clWindow;
    msk_cd_cliente.Enabled := True;
    msk_cd_cliente.TabStop := True;
    btn_co_cliente.Enabled := True;
    msk_cd_contato.Enabled := True;
    msk_cd_contato.TabStop := True;
    msk_cd_contato.Color   := clWindow;
    btn_co_contato.Enabled := True;
  end
  else
  begin
    edt_nm_cliente.Text    := '';
    msk_cd_cliente.Color   := clMenu;
    msk_cd_cliente.Enabled := False;
    msk_cd_cliente.TabStop := False;
    btn_co_cliente.Enabled := False;
    msk_cd_contato.Enabled := False;
    msk_cd_contato.TabStop := False;
    msk_cd_contato.Color   := clMenu;
    edt_nm_contato.Text    := '';
    btn_co_contato.Enabled := False;
  end;
end;

procedure Tfrm_rel_exp_flp.msk_cd_clienteChange(Sender: TObject);
begin
  if msk_cd_cliente.text = '' then
  begin
    msk_cd_grupo.Color     := clWindow;
    msk_cd_grupo.Enabled   := True;
    msk_cd_grupo.TabStop   := True;
    btn_co_grupo.Enabled   := True;
    msk_cd_contato.Enabled := False;
    msk_cd_contato.TabStop := False;
    msk_cd_contato.Color   := clMenu;
    edt_nm_contato.Text    := '';
    btn_co_contato.Enabled := False;
  end
  else
  begin
    edt_nm_grupo.Text      := '';
    msk_cd_grupo.Color     := clMenu;
    msk_cd_grupo.Enabled   := False;
    msk_cd_grupo.TabStop   := False;
    btn_co_grupo.Enabled   := False;
    if msk_cd_unid_neg.text <> '' then
    begin
      msk_cd_contato.Enabled := True;
      msk_cd_contato.TabStop := True;
      msk_cd_contato.Color   := clWindow;
      btn_co_contato.Enabled := True;
    end;
  end;
end;

procedure Tfrm_rel_exp_flp.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Close;
end;

procedure Tfrm_rel_exp_flp.msk_cd_areaExit(Sender: TObject);
begin
  if msk_cd_area.Text = '' then
  begin
    edt_nm_area.Text := 'Todas';
    Exit;
  end;

  ValCodEdt( msk_cd_area );
  if msk_cd_area.Text <> '' then
  begin
    with datm_rel_exp_flp do
    begin
      qry_area_.Close;
      qry_area_.ParamByName('CD_AREA').AsString := msk_cd_area.Text;
      qry_area_.Prepare;
      qry_area_.Open;
      if qry_area_.RecordCount > 0 then
      begin
        edt_nm_area.Text := qry_area_NM_AREA.AsString;
      end
      else
      begin
        BoxMensagem('Área não cadastrada!', 2);
        edt_nm_area.Text := '';
        msk_cd_area.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_area.Text := '';
  end;
end;

procedure Tfrm_rel_exp_flp.msk_cd_analistaExit(Sender: TObject);
begin
  if msk_cd_analista.Text = '' then
  begin
    edt_nm_analista.Text := 'Todas';
    Exit;
  end;

  ValCodEdt( msk_cd_analista );
  if msk_cd_analista.Text <> '' then
  begin
    with datm_rel_exp_flp do
    begin
      qry_analista_.Close;
      qry_analista_.ParamByName('CD_USUARIO').AsString := msk_cd_analista.Text;
      qry_analista_.Prepare;
      qry_analista_.Open;
      if qry_analista_.RecordCount > 0 then
      begin
        edt_nm_analista.Text := qry_analista_NM_USUARIO.AsString;
      end
      else
      begin
        BoxMensagem('Usuário não cadastrado!', 2);
        edt_nm_analista.Text := '';
        msk_cd_analista.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_analista.Text := '';
  end;
end;


procedure Tfrm_rel_exp_flp.btn_co_areaClick(Sender: TObject);
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

procedure Tfrm_rel_exp_flp.btn_co_analistaClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_usuario, frm_usuario);
  with frm_usuario do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_usuario.Cons_OnLine_Texto := msk_cd_analista.Text;
    lCons_OnLine := True;
    cd_cargo   := '';
    cd_usuario := '';
    ShowModal;
    lCons_OnLine := False;
    msk_cd_analista.Text := frm_usuario.Cons_OnLine_Texto;
  end;
  msk_cd_analistaExit(nil);
  msk_cd_analista.SetFocus;
end;


procedure Tfrm_rel_exp_flp.msk_cd_via_transpExit(Sender: TObject);
begin
  if msk_cd_via_transp.Text = '' then
  begin
    BoxMensagem('Digite uma Via de Transporte -> Marítima/Aérea/Ferroviária/Rodoviária!', 2);
    edt_nm_via_transp.text := '';
    msk_cd_via_transp.SetFocus;
    Exit;
  end;

  if ( msk_cd_via_transp.Text = '02' ) OR ( msk_cd_via_transp.Text = '03' ) OR ( msk_cd_via_transp.Text = '05' ) OR
     ( msk_cd_via_transp.Text = '08' ) OR ( msk_cd_via_transp.Text = '09' ) then
  begin
    BoxMensagem('Digite uma Via de Transporte válida -> Marítima/Aérea/Ferroviária/Rodoviária!', 2);
    edt_nm_via_transp.text := '';
    msk_cd_via_transp.text := '';
    msk_cd_via_transp.SetFocus;
    Exit;
  end;

  ValCodEdt( msk_cd_via_transp );
  if msk_cd_via_transp.Text <> '' then
  begin
    with datm_rel_exp_flp do
    begin
      qry_via_transp_.Close;
      qry_via_transp_.ParamByName('CD_VIA_TRANSP').AsString := msk_cd_via_transp.Text;
      qry_via_transp_.Prepare;
      qry_via_transp_.Open;
      if qry_via_transp_.RecordCount > 0 then
      begin
        edt_nm_via_transp.Text := qry_via_transp_NM_VIA_TRANSP.AsString;
      end
      else
      begin
        BoxMensagem('Via de Transporte não cadastrada!', 2);
        edt_nm_via_transp.Text := '';
        msk_cd_via_transp.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_via_transp.Text := 'Todos';
  end;
end;

procedure Tfrm_rel_exp_flp.btn_co_via_transpClick(Sender: TObject);
begin
  consulta := 1;
  Consulta_On_line( 'TVIA_TRANSPORTE', datm_rel_exp_flp.qry_via_CD_VIA_TRANSPORTE, 'Via de Transporte', 56 );

  msk_cd_via_transpExit(nil);
  msk_cd_via_transp.SetFocus;
end;

procedure Tfrm_rel_exp_flp.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
begin
  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo           := nCodigo;
  datm_consulta_padrao.Tabela.TableName := cNomeTabela;

  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.Cons_OnLine        := fCampo;

  with frm_consulta_padrao do
  begin

    Caption := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    if consulta = 1 then
      msk_cd_via_transp.text := Cons_Online_Texto;
    if consulta = 2 then
      msk_cd_destino.text := Cons_Online_Texto;
    if consulta = 3 then
      msk_cd_pais.text := Cons_Online_Texto;
    if consulta = 4 then
      msk_cd_transp.text := Cons_Online_Texto;

  end;
end;

procedure Tfrm_rel_exp_flp.msk_cd_contatoExit(Sender: TObject);
begin
  if msk_cd_contato.Text = '' then
  begin
    edt_nm_contato.Text := 'Todos';
    Exit;
  end;

  ValCodEdt( msk_cd_contato );
  if msk_cd_contato.Text <> '' then
  begin
    with datm_rel_exp_flp do
    begin
      qry_contato_.Close;
      qry_contato_.ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
      qry_contato_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_contato_.ParamByName('CD_PRODUTO').AsString := '02';
      qry_contato_.ParamByName('CD_CONTATO').AsString := msk_cd_contato.Text;
      qry_contato_.Prepare;
      qry_contato_.Open;
      if qry_contato_.RecordCount > 0 then
      begin
        edt_nm_contato.Text := qry_contato_NM_CONTATO.AsString;
      end
      else
      begin
        BoxMensagem('Contato não cadastrado!', 2);
        edt_nm_contato.Text := '';
        msk_cd_contato.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_contato.Text := '';
  end;
end;

procedure Tfrm_rel_exp_flp.btn_co_contatoClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_cliente_contato, frm_cliente_contato );
  with frm_cliente_contato do
  begin
    str_cliente        := msk_cd_cliente.text;
    str_unid           := msk_cd_unid_neg.text;
    str_produto        := '02';
    lCons_OnLine       := True;
    Caption            := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
    if frm_cliente_contato.Cons_OnLine_Texto <> '' then
    begin
      msk_cd_contato.Text := frm_cliente_contato.Cons_OnLine_Texto;
      msk_cd_contatoExit(nil);
    end;
  end;
end;

procedure Tfrm_rel_exp_flp.msk_cd_unid_negChange(Sender: TObject);
begin
  if msk_cd_unid_neg.text = '' then
  begin
    msk_cd_contato.Enabled := False;
    msk_cd_contato.TabStop := False;
    msk_cd_contato.Color   := clMenu;
    edt_nm_contato.Text    := '';
    btn_co_contato.Enabled := False;
  end
  else
  begin
    if msk_cd_cliente.text <> '' then
    begin
      msk_cd_contato.Enabled := True;
      msk_cd_contato.TabStop := True;
      msk_cd_contato.Color   := clWindow;
      btn_co_contato.Enabled := True;
    end;
  end;
end;

procedure Tfrm_rel_exp_flp.msk_cd_destinoExit(Sender: TObject);
begin
  if msk_cd_destino.Text = '' then
  begin
    edt_nm_destino.Text := 'Todos';
    Exit;
  end;

  ValCodEdt( msk_cd_destino );
  if msk_cd_destino.Text <> '' then
  begin
    with datm_rel_exp_flp do
    begin
      qry_pais_.Close;
      qry_pais_.ParamByName('CODIGO').AsString := msk_cd_destino.Text;
      qry_pais_.Prepare;
      qry_pais_.Open;
      if qry_pais_.RecordCount > 0 then
      begin
        edt_nm_destino.Text := qry_pais_DESCRICAO.AsString;
      end
      else
      begin
        BoxMensagem('País não encontrado!', 2);
        edt_nm_destino.Text := '';
        msk_cd_destino.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_destino.Text := 'Todos';
  end;
end;

procedure Tfrm_rel_exp_flp.btn_co_destinoClick(Sender: TObject);
begin
  consulta := 2;
  Consulta_On_line( 'TPAIS', datm_rel_exp_flp.qry_pais_CODIGO, 'País', 59);

  msk_cd_destinoExit(nil);
  msk_cd_destino.SetFocus;
end;

procedure Tfrm_rel_exp_flp.chk_etaClick(Sender: TObject);
begin
  if chk_eta.Checked then
  begin
    msk_dt_eta.Visible := True;
    msk_dt_eta.TabOrder := chk_eta.TabOrder + 1;
    msk_dt_eta.Date := dt_server;
    dbrgrp_ev_conclusor.TabOrder := msk_dt_eta.TabOrder + 1;
  end
  else
    msk_dt_eta.Visible := False;
end;

procedure Tfrm_rel_exp_flp.btn_co_paisClick(Sender: TObject);
begin
  consulta := 3;
  Consulta_On_line( 'TPAIS', datm_rel_exp_flp.qry_pais_CODIGO, 'País', 59);

  msk_cd_paisExit(nil);
  msk_cd_pais.SetFocus;
end;

procedure Tfrm_rel_exp_flp.btn_co_transpClick(Sender: TObject);
begin
  consulta := 4;
  Consulta_On_line( 'TTRANSP_ROD', datm_rel_exp_flp.qry_transp_CD_TRANSP_ROD, 'Transportador', 60);

  msk_cd_transpExit(nil);
  msk_cd_transp.SetFocus;
end;

procedure Tfrm_rel_exp_flp.msk_cd_paisExit(Sender: TObject);
begin
  if msk_cd_pais.Text = '' then
  begin
    edt_nm_pais.Text := 'Todos';
    Exit;
  end;

  ValCodEdt( msk_cd_pais );
  if msk_cd_pais.Text <> '' then
  begin
    with datm_rel_exp_flp do
    begin
      qry_pais_.Close;
      qry_pais_.ParamByName('CODIGO').AsString := msk_cd_pais.Text;
      qry_pais_.Prepare;
      qry_pais_.Open;
      if qry_pais_.RecordCount > 0 then
      begin
        edt_nm_pais.Text := qry_pais_DESCRICAO.AsString;
      end
      else
      begin
        BoxMensagem('País não encontrado!', 2);
        edt_nm_pais.Text := '';
        msk_cd_pais.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_pais.Text := 'Todos';
  end;
end;

procedure Tfrm_rel_exp_flp.msk_cd_transpExit(Sender: TObject);
begin
  if msk_cd_transp.Text = '' then
  begin
    edt_nm_transp.Text := 'Todos';
    Exit;
  end;

  ValCodEdt( msk_cd_transp );
  if msk_cd_transp.Text <> '' then
  begin
    with datm_rel_exp_flp do
    begin
      qry_transp_.Close;
      qry_transp_.ParamByName('CD_TRANSP_ROD').AsString := msk_cd_transp.Text;
      qry_transp_.Prepare;
      qry_transp_.Open;
      if qry_transp_.RecordCount > 0 then
      begin
        edt_nm_transp.Text := qry_transp_AP_TRANSP_ROD.AsString;
      end
      else
      begin
        BoxMensagem('Transportadora não encontrada!', 2);
        edt_nm_transp.Text := '';
        msk_cd_transp.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_transp.Text := 'Todos';
  end;
end;

end.
