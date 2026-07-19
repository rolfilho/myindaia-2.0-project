(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGPG007.PAS - Emissão de Cheques Operacionais
DATA: 09/10/2001
Manutenção:
OBS.: O campo FORMCONT está com default = '1' ( para não imprimir 2x o cheque )
*************************************************************************************************)
unit PGPG007;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, ComCtrls, DosLib, Printers, Funcoes;

type
  Tfrm_imp_pagtos = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_sair: TMenuItem;
    btn_marca_todas: TSpeedButton;
    btn_desmarca_todas: TSpeedButton;
    dbgrdPagtos: TDBGrid;
    mi_imprimir: TMenuItem;
    btn_imprimir: TSpeedButton;
    dbgrdItensPendentes: TDBGrid;
    Mensagem: TStatusBar;
    btn_canc_lanc: TSpeedButton;
    tmr_cheque: TTimer;
    btn_refresh: TSpeedButton;
    Label10: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    Panel1: TPanel;
    lbl_pagto: TLabel;
    lbl_nr_cheque_ini: TLabel;
    lbl_banco: TLabel;
    btn_co_banco: TSpeedButton;
    lbl_dt_pagto: TLabel;
    msk_dt_base: TMaskEdit;
    msk_nr_cheque: TMaskEdit;
    msk_cd_banco: TMaskEdit;
    edt_nm_banco: TEdit;
    msk_dt_pagto: TMaskEdit;
    Panel2: TPanel;
    lbl_pagtos: TLabel;
    Panel3: TPanel;
    lbl_processos: TLabel;
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure Abre_Pagtos;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_marca_todasClick(Sender: TObject);
    procedure btn_desmarca_todasClick(Sender: TObject);
    procedure msk_dt_baseEnter(Sender: TObject);
    procedure msk_dt_baseExit(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure msk_cd_bancoExit(Sender: TObject);
    procedure msk_cd_bancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure Dados(Copia : Boolean );
    procedure btn_canc_lancClick(Sender: TObject);
    procedure msk_nr_chequeExit(Sender: TObject);
    procedure tmr_chequeTimer(Sender: TObject);
    procedure msk_dt_pagtoExit(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    str_nm_cidade_cheque : String[30];
  public
    st_modificar, st_incluir, st_excluir : Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    dt_solic_ch : String[10];
    nr_proc : String[18];
    hm_para_solic_ch : String[5];
    cd_unid_neg, cd_produto : String[2];
    dt_base : String;
    Imprimindo : Boolean;
  end;

var
  frm_imp_pagtos : Tfrm_imp_pagtos;
  CancelaOperacao, Cancelado, Solicitando : Boolean;
  Txt : TextFile;
  str_cr, saida, str_extenso : string;
  Tamanho, Contador : Byte;
  Nr_cheque : Longint;

implementation

uses GSMLIB, PGGP001, PGGP017, PGSM010, PGSM018, PGSM041, PGSM059, PGSM090,
     PGGP015, PGPG008, PGPG004, ConsOnlineEx;

{$R *.DFM}

procedure Tfrm_imp_pagtos.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_imp_pagtos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_imp_pagtos do
  begin
    qry_status_solic_pagto_.Close;
    tbl_yesno_.Close;

    qry_param_.Close;
    qry_item_.Close;
    qry_processo_.Close;
    qry_unid_neg_.Close;
    qry_banco_.Close;
    qry_produto_.Close;
    qry_servico_.Close;
    qry_emp_nac_.Close;
    qry_lib_pagto_.Close;
    qry_lib_pagto_item_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_imp_pagtos.FormCreate(Sender: TObject);
begin
  CancelaOperacao := False;
  Cancelado       := False;
  Imprimindo      := False;

  st_modificar    := False;
  st_incluir      := False;
  st_excluir      := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir );
  btn_canc_lanc.Enabled := st_excluir; //Rodrigo Capra

  // Cria o DataModule de Dados de Solicitação de Cheque 
  Application.CreateForm(Tdatm_imp_pagtos, datm_imp_pagtos );

  msk_dt_base.Text  := DateToStr( dt_server );
  msk_dt_pagto.Text := DateToStr( dt_server );

  with datm_imp_pagtos do
  begin
    qry_status_solic_pagto_.Close;
    qry_status_solic_pagto_.Prepare;
    qry_status_solic_pagto_.Open;
    tbl_yesno_.Open;

    qry_param_.Close;
    qry_param_.Prepare;
    qry_param_.Open;
    hm_para_solic_ch := qry_param_HM_PARA_SOLIC_CH.AsString;
    if Trim(hm_para_solic_ch) = '' then
    begin
      BoxMensagem('Atenção! Problemas com tabela de parâmetros!' + #13#10 +
                  'Não tente incluir Solicitação de Pagamento. Contate o CPD!', 2);
    end;

    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;

    qry_banco_.Close;
    qry_banco_.Prepare;
    qry_banco_.Open;

    qry_processo_.Close;
    qry_processo_.Prepare;
    qry_processo_.Open;

    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;

    qry_servico_.Close;
    qry_servico_.Prepare;
    qry_servico_.Open;

    qry_emp_nac_.Close;
    qry_emp_nac_.Prepare;
    qry_emp_nac_.Open;

    qry_lib_pagto_.Close;
    qry_lib_pagto_item_.Close;
    Abre_Pagtos;
  end;
end;

procedure Tfrm_imp_pagtos.btn_cancelarClick(Sender: TObject);
begin
  if Solicitando then CancelaOperacao := True;
  btn_desmarca_todasClick(nil);
end;

procedure Tfrm_imp_pagtos.Abre_Pagtos;
begin
  with datm_imp_pagtos do
  begin
    if ( msk_dt_base.Text = '  /  /    ' ) or
       ( Trim( msk_cd_unid_neg.Text ) = '' ) then
      Exit;

    qry_lib_pagto_.Close;
    qry_lib_pagto_.ParamByName('DT_PAGTO').AsDate      := StrToDate( msk_dt_base.Text );
    qry_lib_pagto_.ParamByName('CD_BANCO').AsString    := Trim( msk_cd_banco.Text );
    qry_lib_pagto_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
    qry_lib_pagto_.Prepare;
    qry_lib_pagto_.Open;

    qry_lib_pagto_item_.Close;
    qry_lib_pagto_item_.Prepare;
    qry_lib_pagto_item_.Open;

    qry_solic_pagto_.Close;
    qry_solic_pagto_.Prepare;
    qry_solic_pagto_.Open;
  end;
end;

procedure Tfrm_imp_pagtos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_imp_pagtos.btn_marca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Visible    := False;
  btn_desmarca_todas.Visible := True;
  btn_desmarca_todas.Left    := btn_marca_todas.Left;
  datm_imp_pagtos.qry_lib_pagto_.First;
  for i := 0 to datm_imp_pagtos.qry_lib_pagto_.RecordCount - 1 do
  begin
    dbgrdPagtos.SelectedRows.CurrentRowSelected := True;
    datm_imp_pagtos.qry_lib_pagto_.Next;
  end;
end;

procedure Tfrm_imp_pagtos.btn_desmarca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Visible    := True;
  btn_desmarca_todas.Visible := False;
  if dbgrdPagtos.SelectedRows.Count > 0 then
     TTable(dbgrdPagtos.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdPagtos.SelectedRows[0]));
  for i := 0 to dbgrdPagtos.SelectedRows.Count - 1 do
  begin
    dbgrdPagtos.SelectedRows.CurrentRowSelected := False;
    if dbgrdPagtos.SelectedRows.Count > 0 then
      TTable(dbgrdPagtos.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdPagtos.SelectedRows[0]))
    else Break;
  end;
end;

procedure Tfrm_imp_pagtos.msk_dt_baseEnter(Sender: TObject);
begin
  dt_base := msk_dt_base.Text;
end;

procedure Tfrm_imp_pagtos.msk_dt_baseExit(Sender: TObject);
begin
  if msk_dt_base.Text = dt_base then Exit;
  Abre_Pagtos;
end;

procedure Tfrm_imp_pagtos.btn_imprimirClick(Sender: TObject);
var
  Arquivo, cNomeTxt : String;
  cd_banco: String[3];
  i : Integer;
begin
  if dbgrdPagtos.SelectedRows.Count = 0 then
  begin
    BoxMensagem( 'Selecione um pagamento!', 2 );
    dbgrdPagtos.SetFocus;
    Exit;
  end;

  if Trim(msk_cd_banco.Text) = '' then
  begin
    BoxMensagem( 'Selecione um banco!', 3 );
    msk_cd_banco.SetFocus;
    Exit;
  end;

  if Trim(msk_nr_cheque.Text) = '' then
  begin
    BoxMensagem( 'Selecione o nº inicial do cheque!', 3 );
    msk_nr_cheque.SetFocus;
    Exit;
  end;

  with datm_imp_pagtos do
  begin
    qry_caixa_ctrl_.Close;
    qry_caixa_ctrl_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
    qry_caixa_ctrl_.Prepare;
    qry_caixa_ctrl_.Open;
    if Not qry_caixa_ctrl_.EOF then
       if ( StrToDate( msk_dt_pagto.Text ) > Date ) or
          ( StrToDate( msk_dt_pagto.Text ) < qry_caixa_ctrl_.FieldByName('DT_MOVIMENTO').AsDateTime ) then
    begin
      BoxMensagem( 'Movimento financeiro fechado, ou Data inválida', 2 );
      qry_caixa_ctrl_.Close;
      msk_dt_pagto.Text;
      Exit;
    end;
    qry_caixa_ctrl_.Close;

    // Verificar se existe mais de um Favorecido X Banco 
    cd_banco      := '';
    if dbgrdPagtos.SelectedRows.Count > 0 then
       TTable(dbgrdPagtos.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdPagtos.SelectedRows[0]));
    for i := 0 to dbgrdPagtos.SelectedRows.Count - 1 do
    begin
      cd_banco := qry_lib_pagto_CD_BANCO.AsString;
      TTable(dbgrdPagtos.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdPagtos.SelectedRows[i]));
      if ( cd_banco <> qry_lib_pagto_CD_BANCO.AsString ) then
      begin
        BoxMensagem('Existem mais de um Banco selecionado!' + #13#10 +
                    'Não será possível gerar Pagamento!', 2);
        Exit;
      end;
    end;

    if dbgrdPagtos.SelectedRows.Count > 0 then
          TTable( dbgrdPagtos.DataSource.DataSet ).GotoBookMark( TBookMark( dbgrdPagtos.SelectedRows[0] ) );
    for i := 0 to dbgrdPagtos.SelectedRows.Count - 1 do
    begin
      //S.D.A.
      if qry_lib_pagto_item_CD_ITEM.AsString = str_cd_item_sda then
      begin
        with datm_imp_pagtos do
        begin
          qry_lib_pagto_item_.First;
          while Not ( qry_lib_pagto_item_.EOF ) do
          begin
            qry_consiste_sda_.Close;
            qry_consiste_sda_.ParamByName('NR_PROCESSO').AsString := qry_lib_pagto_item_NR_PROCESSO.AsString;
            qry_consiste_sda_.Prepare;
            qry_consiste_sda_.Open;
            if qry_consiste_sda_.RecordCount > 0 then
            begin
              if Arredondar( qry_consiste_sda_.FieldByName('VL_SDA').AsFloat , 2 ) > 0 then
              begin
                BoxMensagem( 'Já existe S.D.A. Pago para o processo ' + Copy( qry_lib_pagto_item_NR_PROCESSO.AsString, 5, 14 ) + '!', 2 );
                Exit;
              end;
            end;
            qry_consiste_sda_.Close;

            qry_consiste_sda2_.Close;
            qry_consiste_sda2_.ParamByName('NR_PROCESSO').AsString := qry_lib_pagto_item_NR_PROCESSO.AsString;
            qry_consiste_sda2_.Prepare;
            qry_consiste_sda2_.Open;
            if qry_consiste_sda2_.RecordCount = 0 then
            begin
              BoxMensagem( 'A Guia de S.D.A. para o processo ' + Copy( qry_lib_pagto_item_NR_PROCESSO.AsString, 5, 14 ) + ' precisa ser Distribuída e Emitida !', 2 );
              Exit;
            end;
            qry_consiste_sda2_.Close;

            qry_lib_pagto_item_.Next;
          end;
          qry_lib_pagto_item_.First;
        end;
      end;

      TTable( dbgrdPagtos.DataSource.DataSet ).GotoBookMark( TBookMark( dbgrdPagtos.SelectedRows[i] ) );
    end;

    Imprimindo          := True;
    Mensagem.SimpleText := 'Gerando Arquivo de Cheques...';
    Screen.Cursor       := crHourGlass;
    Application.ProcessMessages;

    Nr_cheque := StrToInt(msk_nr_cheque.Text);
    str_cr := #13#10;

    if dbgrdPagtos.SelectedRows.Count > 0 then
       TTable(dbgrdPagtos.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdPagtos.SelectedRows[0]));
    for i := 0 to dbgrdPagtos.SelectedRows.Count - 1 do 
    begin
      if ( Trim( qry_lib_pagto_NR_DOCTO.AsString ) <> Trim ( FormatFloat('000000', Nr_cheque) ) ) and
         ( Trim( qry_lib_pagto_NR_DOCTO.AsString ) <> '' ) then //Reemissão - Verifica se o dia em que vai cancelar está aberto
      begin
        qry_caixa_ctrl_.Close;
        qry_caixa_ctrl_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
        qry_caixa_ctrl_.Prepare;
        qry_caixa_ctrl_.Open;
        if Not qry_caixa_ctrl_.EOF then
           if ( StrToDate( msk_dt_base.Text ) > Date ) or
              ( StrToDate( msk_dt_base.Text ) < qry_caixa_ctrl_.FieldByName('DT_MOVIMENTO').AsDateTime ) then
        begin
          BoxMensagem( 'Movimento financeiro da Data Base fechado ou Data Base inválida', 2 );
          qry_caixa_ctrl_.Close;
          msk_dt_base.Text;
          Imprimindo := False;
          Exit;
        end;
        qry_caixa_ctrl_.Close;
      end;

      if qry_lib_pagto_VL_PAGTO.AsFloat > 0 then
      begin
        if Not qry_banco_FORMCONT.AsBoolean then
        begin
          BoxMensagem('Prepare o Cheque nº ' + FormatFloat('000000', Nr_cheque), 3);
        end;

        // Montar o nome do Arquivo
        cNomeTxt := cDir_Rpt + '\CHEQUE.TXT';
        // Variável global de controle do Pascal
        FileMode := 2;

        //Apelido do Banco.bat
        Arquivo := Trim( qry_banco_AP_BANCO.AsString ) + '.BAT';
        WinExec( PChar( Arquivo ), SW_SHOW );

        try
          AssignFile( Txt, cNomeTxt );
          ReWrite( Txt );
        except
          Mensagem.SimpleText := 'Erro na criação do Arquivo.';
          Imprimindo := False;
          Exit
        end;
        //Emitir Cheque
        Dados(False);

        try
          datm_main.db_broker.StartTransaction;

          //Reemissão
          if ( ( Trim( qry_lib_pagto_NR_DOCTO.AsString ) <> Trim ( FormatFloat('000000', Nr_cheque) ) ) and
               ( Trim( qry_lib_pagto_NR_DOCTO.AsString ) <> '' ) ) or
             ( StrToInt( qry_solic_pagto_CD_STATUS_CHEQUE.AsString ) in [1, 2] ) then
          begin
            CloseStoredProc( sp_reemite_cheque );
            sp_reemite_cheque.ParamByName('@nr_ref').AsString         := qry_lib_pagto_NR_REF.AsString;
            sp_reemite_cheque.ParamByName('@dt_base').AsDateTime      := StrToDate( msk_dt_base.Text );
            sp_reemite_cheque.ParamByName('@dt_pagto').AsDateTime     := StrToDate( msk_dt_pagto.Text );
            sp_reemite_cheque.ParamByName('@nr_novo_cheque').AsString := FormatFloat('000000', Nr_cheque);
            ExecStoredProc( sp_reemite_cheque );
            CloseStoredProc( sp_reemite_cheque );
          end
          else
          begin
            //Verifica último lote para casos de emissão de cheques com data anterior a hoje
            qry_ult_ref_.Close;
            qry_ult_ref_.ParamByName('DT_PAGTO').AsDateTime := StrToDate( msk_dt_pagto.Text );
            qry_ult_ref_.Prepare;
            qry_ult_ref_.Open;
            qry_lib_pagto_item_.First;
            while Not ( qry_lib_pagto_item_.EOF ) do
            begin
              //Atualizando Número e Status do Cheque
              if Not ( qry_solic_pagto_.State in [dsEdit] ) then qry_solic_pagto_.Edit;

              //Se emitido então fica reemitido
              if qry_solic_pagto_CD_STATUS_CHEQUE.AsString = '1' then
                 qry_solic_pagto_CD_STATUS_CHEQUE.AsString := '2';

              if qry_solic_pagto_CD_STATUS.AsString <> '17' then
              begin
                //Se solicitado então fica emitido
                if qry_solic_pagto_CD_STATUS_CHEQUE.AsString = '0' then
                   qry_solic_pagto_CD_STATUS_CHEQUE.AsString := '1';
                qry_solic_pagto_NR_DOCTO.AsString   := FormatFloat('000000', Nr_cheque);
                if StrToDate( msk_dt_base.Text ) = StrToDate( msk_dt_pagto.Text ) then
                begin
                  qry_solic_pagto_DT_PAGTO.AsDateTime := StrToDate( msk_dt_pagto.Text );
                end
                else
                begin
                  //Renumera Lote
                  qry_solic_pagto_DT_PAGTO.AsDateTime := StrToDate( msk_dt_pagto.Text );
                  qry_solic_pagto_NR_REF.AsString     := qry_ult_ref_ULT_REF.AsString;
                end;
                qry_solic_pagto_CD_STATUS.AsString := '7'; //Pago
              end;

              qry_solic_pagto_.Post;

              qry_lib_pagto_item_.Next;
            end;

            CloseStoredProc( sp_distribui_pagto );
            sp_distribui_pagto.ParamByName('@dt_pagto').AsDateTime := StrToDate( msk_dt_pagto.Text );
            if StrToDate( msk_dt_base.Text ) = StrToDate( msk_dt_pagto.Text ) then
              sp_distribui_pagto.ParamByName('@nr_ref').AsString   := qry_lib_pagto_NR_REF.AsString
            else
              sp_distribui_pagto.ParamByName('@nr_ref').AsString   := qry_ult_ref_ULT_REF.AsString;
            sp_distribui_pagto.ParamByName('@tp_destino').AsString := '2';
            sp_distribui_pagto.ParamByName('@nr_doc').AsString := '';
            ExecStoredProc( sp_distribui_pagto );
            CloseStoredProc( sp_distribui_pagto );

            qry_ult_ref_.Close;
          end;

          if Not ( qry_banco_.State in [dsInsert, dsEdit] ) then qry_banco_.Edit;
          qry_banco_NR_CHEQUE.AsString := StrZero( Nr_cheque, 6 );
          qry_banco_.Post;

          datm_main.db_broker.Commit;

          Nr_cheque := Nr_cheque + 1;
        except
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        end;

        //Se não possuir formulário contínuo com cópias carbonadas, emitir a folha de
        // cópia de Cheque da S. Magalhães
        if Not qry_banco_FORMCONT.AsBoolean then
        begin
          Dados(True);
        end;
        CloseFile( Txt );

        Mensagem.SimpleText := 'Arquivo gerado com sucesso.';
        CopyFileLpt1( cNomeTxt, 'LPT1' );

        // ATUALIZAÇÃO DA TFOLLOWUP - MICHEL - 24/10/2008
        qry_lib_pagto_item_.First;
        // Percorre os processos para
        while not qry_lib_pagto_item_.Eof do
        begin
          // Verifica se é Armazenagem para atualizar no followup
          if (qry_lib_pagto_item_CD_ITEM.AsString = '401') or (qry_lib_pagto_item_CD_ITEM.AsString = '514') or
             (qry_lib_pagto_item_CD_ITEM.AsString = '015') or (qry_lib_pagto_item_CD_ITEM.AsString = '041') or
             (qry_lib_pagto_item_CD_ITEM.AsString = '588') or (qry_lib_pagto_item_CD_ITEM.AsString = '504') or
             (qry_lib_pagto_item_CD_ITEM.AsString = '061') or (qry_lib_pagto_item_CD_ITEM.AsString = '420') or
             (qry_lib_pagto_item_CD_ITEM.AsString = '422') or (qry_lib_pagto_item_CD_ITEM.AsString = '416') or
             (qry_lib_pagto_item_CD_ITEM.AsString = '507') or (qry_lib_pagto_item_CD_ITEM.AsString = '503')  then
          begin
            // Verifica se já está a data do evento já está preenchida
            if ConsultaLookUPSQL(' SELECT COUNT(*) QTD ' +
                                 ' FROM TFOLLOWUP ' +
                                 ' WHERE NR_PROCESSO = ''' + qry_lib_pagto_item_NR_PROCESSO.AsString + '''' +
                                 '   AND CD_EVENTO = ''090'' AND DT_REALIZACAO IS NULL ', 'QTD') = '1' then
            begin
              // Atualiza na TFollowup
              FastExecSQL(' UPDATE TFOLLOWUP ' +
                          //' SET DT_REALIZACAO      = CONVERT(DATETIME, ''' + DateToStr(Now) + '''), ' +
                          ' SET DT_REALIZACAO      = GETDATE(), ' + // Comentado acima para utilizar a hora - Michel - 06/04/2010
                          '     CD_RESP_REALIZACAO = ''' + str_cd_usuario + ''' ' +
                          ' WHERE NR_PROCESSO = ''' + qry_lib_pagto_item_NR_PROCESSO.AsString +  ''' ' +
                          '   AND CD_EVENTO   = ''090''');
              // Atualiza as datas seguintes
              if sp_atz_followup.Active then
                CloseStoredProc(sp_atz_followup);
              sp_atz_followup.ParamByName('@nr_processo').AsString := qry_lib_pagto_item_NR_PROCESSO.AsString;
              ExecStoredProc(sp_atz_followup);
              CloseStoredProc(sp_atz_followup);
            end;
          end
          // Verifica se é Marinha Mercante para atualizar no followup
          else if (qry_lib_pagto_item_CD_ITEM.AsString = '157') then
          begin
            // Verifica se já está a data do evento já está preenchida
            if ConsultaLookUPSQL(' SELECT COUNT(*) QTD ' +
                                 ' FROM TFOLLOWUP ' +
                                 ' WHERE NR_PROCESSO = ''' + qry_lib_pagto_item_NR_PROCESSO.AsString + '''' +
                                 '   AND CD_EVENTO = ''533'' AND DT_REALIZACAO IS NULL ', 'DT_REALIZACAO') = '1' then
            begin
              // Atualiza na TFollowup
              FastExecSQL(' UPDATE TFOLLOWUP ' +
                          //' SET DT_REALIZACAO      = CONVERT(DATETIME, ''' + DateToStr(Now) + '''), ' +
                          ' SET DT_REALIZACAO      = GETDATE(), ' + // Comentado acima para utilizar a hora - Michel - 06/04/2010
                          '     CD_RESP_REALIZACAO = ''' + str_cd_usuario + ''' ' +
                          ' WHERE NR_PROCESSO = ''' + qry_lib_pagto_item_NR_PROCESSO.AsString +  ''' ' +
                          '   AND CD_EVENTO   = ''533''');
              // Atualiza as datas seguintes
              if sp_atz_followup.Active then
                CloseStoredProc(sp_atz_followup);
              sp_atz_followup.ParamByName('@nr_processo').AsString := qry_lib_pagto_item_NR_PROCESSO.AsString;
              ExecStoredProc(sp_atz_followup);
              CloseStoredProc(sp_atz_followup);
            end;
          end;  // Fim da atualização do Followup
          qry_lib_pagto_item_.Next;
        end;
      end;

      dbgrdPagtos.SelectedRows.CurrentRowSelected := False;
      if dbgrdPagtos.SelectedRows.Count > 0 then
        TTable(dbgrdPagtos.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdPagtos.SelectedRows[0]))
      else Break;
    end;
  end;

  Screen.Cursor := crDefault;
  Application.ProcessMessages;
  Mensagem.SimpleText := 'Fim da impressão dos Cheques';
  msk_nr_cheque.Text := StrZero( ( Nr_cheque ), 6 );
  Imprimindo := False;
  Abre_Pagtos;
end;

procedure Tfrm_imp_pagtos.msk_cd_bancoExit(Sender: TObject);
begin
  if msk_cd_banco.Text <> '' then
  begin
    ValCodEdt( msk_cd_banco );
    with datm_imp_pagtos do
    begin
      qry_banco_.Close;
      qry_banco_.SQL[2] := 'WHERE CD_BANCO = "' + msk_cd_banco.Text + '"';
      qry_banco_.Prepare;
      qry_banco_.Open;
      if Not qry_banco_.EOF then
      begin
        edt_nm_banco.Text  := qry_banco_NM_BANCO.AsString;
        if qry_banco_NR_CHEQUE.AsString <> '' then
        begin
          msk_nr_cheque.Text := StrZero( ( StrToInt( qry_banco_NR_CHEQUE.AsString ) + 1 ), 6 );
        end;
        Abre_Pagtos;
      end
      else
      begin
        BoxMensagem('Banco não cadastrado!', 2);
        msk_cd_banco.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_banco.Text := '';
    Abre_Pagtos;
  end;
end;

procedure Tfrm_imp_pagtos.msk_cd_bancoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = msk_cd_banco    then btn_co_bancoClick(nil);
  end;
end;

procedure Tfrm_imp_pagtos.btn_co_bancoClick(Sender: TObject);
begin
  with datm_imp_pagtos Do
  begin
    Application.CreateForm(Tfrm_banco, frm_banco );
    with frm_banco do
    Begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_banco.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_banco.Text := frm_banco.Cons_OnLine_Texto;
      msk_cd_bancoExit(nil);
    end;
  end;
end;

procedure Tfrm_imp_pagtos.Dados(Copia : Boolean);
begin
  try
    with datm_imp_pagtos do
    begin
      //Inicializa
      // ESC @ ESC x n ESC M EXP ESC C 0 n ESC 0 ESC (  t  3 0 1 25 0 ESC t  1
      // saida := #27#64#27#120#1#27#77#18#27#67#0#3#27#48#27#40#116#3#0#1#25#0#27#116#1;
      saida := #27#64#27#120#1#27#77#18#27#67#0#3#27#48#27#40#116#3#0#1#25#0#27#116#1;
      Write( Txt, Saida );
      if Copia then
      begin
        saida := SaltaLinhas(8);
        Write( Txt, Saida );
      end;
      saida := SaltaLinhas(qry_banco_LVALOR.AsInteger - 1);
      Write( Txt, Saida );
      //Valor
      saida := Space( qry_banco_CVALOR.AsInteger ) +
               FormatFloat('###,###,###,##0.00', qry_lib_pagto_VL_PAGTO.AsFloat );
      saida := saida + SaltaLinhas(qry_banco_LEXTENSO.AsInteger - qry_banco_LVALOR.AsInteger);
      Write( Txt, saida );
      //Extenso
      //Determinando tamanho máximo do extenso
      str_extenso := Extenso(qry_lib_pagto_VL_PAGTO.AsFloat);
      Tamanho := 80 - qry_banco_CEXTENSO.AsInteger;
      if Length( str_extenso ) <= Tamanho then
      begin
        saida := Space( qry_banco_CEXTENSO.AsInteger ) + str_extenso;
        saida := saida + SaltaLinhas(qry_banco_LFAVOR.AsInteger - qry_banco_LEXTENSO.AsInteger);
      end
      else
      begin
        Contador := 0;
        while Copy(str_extenso, (Tamanho - Contador), 1) <> ' ' do
        begin
          Contador := Contador + 1;
        end;
        saida := Space( qry_banco_CEXTENSO.AsInteger ) +
                 Space( Contador ) + Copy(str_extenso, 1, (Tamanho - Contador) );
        saida := saida + SaltaLinhas(qry_banco_LEXTENSO2.AsInteger - qry_banco_LEXTENSO.AsInteger);
        saida := saida + Space( qry_banco_CEXTENSO2.AsInteger ) +
                 Copy(str_extenso, (Tamanho - Contador), Length(str_extenso) );
        saida := saida + SaltaLinhas(qry_banco_LFAVOR.AsInteger - qry_banco_LEXTENSO2.AsInteger);
      end;
      Write( Txt, Saida );

      saida := Space( qry_banco_CFAVOR.AsInteger ) +
               UpperCase(qry_lib_pagto_NM_FAVORECIDO.AsString);
      saida := saida + SaltaLinhas(qry_banco_LCIDADE.AsInteger - qry_banco_LFAVOR.AsInteger);
      Write( Txt, Saida );

      //Cidade + '  ' + Dia + ' ' + Mes + ' ' + Ano 
      qry_cidade_.Close;
      qry_cidade_.ParamByName('NR_PROCESSO').AsString := qry_lib_pagto_item_NR_PROCESSO.AsString;
      qry_cidade_.Prepare;
      qry_cidade_.Open;
      str_nm_cidade_cheque := qry_cidade_END_CIDADE.AsString;
      qry_cidade_.Close;

      saida := Space( qry_banco_CCIDADE.AsInteger ) +
               UpperCase( Trim( str_nm_cidade_cheque ) ) +
               Space( ( ( qry_banco_CDIA.AsInteger -
                          qry_banco_CCIDADE.AsInteger) -
               Length( Trim( str_nm_cidade_cheque ) ) ) );
      saida := saida + FormatDateTime('dd', dt_server) +
                       Space( ( ( qry_banco_CMES.AsInteger -
                            qry_banco_CDIA.AsInteger) - 2 ) );
      saida := saida + UpperCase(ameses[StrToInt(FormatDateTime('mm', dt_server) ) ] ) +
                       Space( ( ( qry_banco_CANO.AsInteger - qry_banco_CMES.AsInteger) -
                          Length( Trim( ameses[StrToInt(FormatDateTime('mm', dt_server) ) ] ) ) ) );
      case StrToInt(qry_banco_ANOMASK.AsString) of
        9999: saida := saida + FormatDateTime('yyyy', dt_server);
        99: saida := saida + FormatDateTime('yy', dt_server);
        9:  saida := saida + Copy(FormatDateTime('yy', dt_server), 2, 1);
      end;
      Write( Txt, Saida );

      if Copia then
      begin
        saida := SaltaLinhas(qry_banco_LCHEQUE.AsInteger - qry_banco_LCIDADE.AsInteger - 8);
        saida := saida + Space(qry_banco_CCHEQUE.AsInteger) +
                 qry_solic_pagto_NR_DOCTO.AsString +
                 Space( ( ( qry_banco_CBANCO.AsInteger - qry_banco_CCHEQUE.AsInteger ) - 6 ) ) +
                       UpperCase( Trim( qry_banco_AP_BANCO.AsString ) );
        Write( Txt, Saida );
      end;

      saida := #12;
      Write( Txt, Saida );
      saida := #27#67#0#6;
      Write( Txt, Saida );
    end;
  except
    Mensagem.SimpleText := 'Erro na geração do Arquivo de Cheques';
    datm_imp_pagtos.qry_solic_pagto_.Close;
    CloseFile( Txt );
    Exit
  end;
end;

procedure Tfrm_imp_pagtos.btn_canc_lancClick(Sender: TObject);
var i : Integer;
begin
  with datm_imp_pagtos do
  begin
    qry_caixa_ctrl_.Close;
    qry_caixa_ctrl_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
    qry_caixa_ctrl_.Prepare;
    qry_caixa_ctrl_.Open;
    if Not qry_caixa_ctrl_.EOF then
       if ( StrToDate( msk_dt_pagto.Text ) > Date ) or
          ( StrToDate( msk_dt_pagto.Text ) < qry_caixa_ctrl_.FieldByName('DT_MOVIMENTO').AsDateTime ) then
    begin
      BoxMensagem( 'Movimento financeiro da Data Pagto fechado ou Data Pagto inválida', 2 );
      qry_caixa_ctrl_.Close;
      msk_dt_pagto.Text;
      Exit;
    end;
    qry_caixa_ctrl_.Close;
    qry_caixa_ctrl_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
    qry_caixa_ctrl_.Prepare;
    qry_caixa_ctrl_.Open;
    if Not qry_caixa_ctrl_.EOF then
       if ( StrToDate( msk_dt_base.Text ) > Date ) or
          ( StrToDate( msk_dt_base.Text ) < qry_caixa_ctrl_.FieldByName('DT_MOVIMENTO').AsDateTime ) then
    begin
      BoxMensagem( 'Movimento financeiro da Data Base fechado ou Data Base inválida', 2 );
      qry_caixa_ctrl_.Close;
      msk_dt_base.Text;
      Exit;
    end;
    qry_caixa_ctrl_.Close;

    if dbgrdPagtos.SelectedRows.Count > 0 then
       TTable(dbgrdPagtos.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdPagtos.SelectedRows[0]))
    else
    begin
      BoxMensagem('Selecione um pagamento!', 2);
      Exit;
    end;

    Imprimindo := True;
    for i := 0 to dbgrdPagtos.SelectedRows.Count - 1 do
    begin
      if Not BoxMensagem( 'Confirma cancelamento da Ref. nº ' + qry_lib_pagto_NR_REF.AsString + '?', 1 ) then Exit;
      try
        datm_main.db_broker.StartTransaction;

        CloseStoredProc(sp_cancela_solic_pagto);
        sp_cancela_solic_pagto.ParamByName('@dt_pagto').AsDateTime := qry_lib_pagto_DT_PAGTO.AsDateTime;
        sp_cancela_solic_pagto.ParamByName('@nr_ref').AsString     := qry_lib_pagto_NR_REF.AsString;
        sp_cancela_solic_pagto.ParamByName('@in_ted').AsString     := '0';
        ExecStoredProc(sp_cancela_solic_pagto);
        CloseStoredProc(sp_cancela_solic_pagto);

        // novo sp de cancelamento - 09/2006
       { CloseStoredProc( sp_distribui_pagamento );
        sp_distribui_pagamento.ParamByName('@dt_pagto').AsDateTime := qry_lib_pagto_DT_PAGTO.AsDateTime;
        sp_distribui_pagamento.ParamByName('@nr_ref').AsString     := qry_lib_pagto_NR_REF.AsString;
        sp_distribui_pagamento.ParamByName('@tp_destino').AsString := '2';
        sp_distribui_pagamento.ParamByName('@dt_canc').AsDateTime := dt_server;
        ExecStoredProc( sp_distribui_pagamento );
        CloseStoredProc( sp_distribui_pagamento );}

        (* Antiga sp de cancelamento
        CloseStoredProc( sp_distribui_pagto );
        sp_distribui_pagto.ParamByName('@dt_pagto').AsDateTime := qry_lib_pagto_DT_PAGTO.AsDateTime;
        sp_distribui_pagto.ParamByName('@nr_ref').AsString     := qry_lib_pagto_NR_REF.AsString;
        sp_distribui_pagto.ParamByName('@tp_destino').AsString := '2';
        ExecStoredProc( sp_distribui_pagto );
        CloseStoredProc( sp_distribui_pagto );
        *)
        datm_main.db_broker.Commit;
      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        qry_solic_pagto_.Cancel;
      end;

      // ATUALIZAÇÃO DA TFOLLOWUP - MICHEL - 24/10/2008
      // ATUALIZAÇÃO DA TFOLLOWUP - MICHEL - 24/10/2008
      qry_lib_pagto_item_.First;
      // Percorre os processos para
      while not qry_lib_pagto_item_.Eof do
      begin
        // Verifica se é Armazenagem para atualizar no followup
        if (qry_lib_pagto_item_CD_ITEM.AsString = '401') or (qry_lib_pagto_item_CD_ITEM.AsString = '514') or
           (qry_lib_pagto_item_CD_ITEM.AsString = '015') or (qry_lib_pagto_item_CD_ITEM.AsString = '041') or
           (qry_lib_pagto_item_CD_ITEM.AsString = '588') or (qry_lib_pagto_item_CD_ITEM.AsString = '504') or
           (qry_lib_pagto_item_CD_ITEM.AsString = '061') or (qry_lib_pagto_item_CD_ITEM.AsString = '420') or
           (qry_lib_pagto_item_CD_ITEM.AsString = '422') or (qry_lib_pagto_item_CD_ITEM.AsString = '416') or
           (qry_lib_pagto_item_CD_ITEM.AsString = '507') or (qry_lib_pagto_item_CD_ITEM.AsString = '503')  then
        begin
          // Atualiza na TFollowup
          FastExecSQL(' UPDATE TFOLLOWUP ' +
                      ' SET DT_REALIZACAO      = NULL, ' +
                      '     CD_RESP_REALIZACAO = ''' + str_cd_usuario + ''' ' +
                      ' WHERE NR_PROCESSO = ''' + qry_lib_pagto_item_NR_PROCESSO.AsString +  ''' ' +
                      '   AND CD_EVENTO   = ''090''');
          // Atualiza as datas seguintes
          if sp_atz_followup.Active then
            CloseStoredProc(sp_atz_followup);
          sp_atz_followup.ParamByName('@nr_processo').AsString := qry_lib_pagto_item_NR_PROCESSO.AsString;
          ExecStoredProc(sp_atz_followup);
          CloseStoredProc(sp_atz_followup);
        end
        // Verifica se é Marinha Mercante para atualizar no followup
        else if (qry_lib_pagto_item_CD_ITEM.AsString = '157') then
        begin
          // Atualiza na TFollowup
          FastExecSQL(' UPDATE TFOLLOWUP ' +
                      ' SET DT_REALIZACAO      = NULL, ' +
                      '     CD_RESP_REALIZACAO = ''' + str_cd_usuario + ''' ' +
                      ' WHERE NR_PROCESSO = ''' + qry_lib_pagto_item_NR_PROCESSO.AsString +  ''' ' +
                      '   AND CD_EVENTO   = ''533''');
          // Atualiza as datas seguintes
          if sp_atz_followup.Active then
            CloseStoredProc(sp_atz_followup);
          sp_atz_followup.ParamByName('@nr_processo').AsString := qry_lib_pagto_item_NR_PROCESSO.AsString;
          ExecStoredProc(sp_atz_followup);
          CloseStoredProc(sp_atz_followup);
        end;  // Fim da atualização do Followup
        qry_lib_pagto_item_.Next;
      end;

      dbgrdPagtos.SelectedRows.CurrentRowSelected := False;
      if dbgrdPagtos.SelectedRows.Count > 0 then
        TTable(dbgrdPagtos.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdPagtos.SelectedRows[0]))
      else Break;

    end;

    Imprimindo := False;

    Abre_Pagtos;
  end;
end;

procedure Tfrm_imp_pagtos.msk_nr_chequeExit(Sender: TObject);
begin
  if Trim( msk_nr_cheque.Text ) <> '' then
     msk_nr_cheque.Text := StrZero( StrToInt( msk_nr_cheque.Text ), 6 );
end;

procedure Tfrm_imp_pagtos.tmr_chequeTimer(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  if Imprimindo then Exit;
  if dbgrdPagtos.SelectedRows.Count > 0 then
  begin
    Screen.Cursor := crDefault;
    Exit;
  end;
  msk_cd_bancoExit(nil);
  Screen.Cursor := crDefault;
end;

procedure Tfrm_imp_pagtos.msk_dt_pagtoExit(Sender: TObject);
begin
  with datm_imp_pagtos do
  begin
    qry_caixa_ctrl_.Close;
    qry_caixa_ctrl_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
    qry_caixa_ctrl_.Prepare;
    qry_caixa_ctrl_.Open;
    if Not qry_caixa_ctrl_.EOF then
       if ( StrToDate( msk_dt_pagto.Text ) > Date ) or
          ( StrToDate( msk_dt_pagto.Text ) < qry_caixa_ctrl_.FieldByName('DT_MOVIMENTO').AsDateTime ) then
       BoxMensagem( 'Movimento financeiro fechado, ou Data inválida', 2 );
    qry_caixa_ctrl_.Close;
  end;
end;

procedure Tfrm_imp_pagtos.msk_cd_unid_negEnter(Sender: TObject);
begin
  cd_unid_neg := msk_cd_unid_neg.Text;
end;

procedure Tfrm_imp_pagtos.msk_cd_unid_negExit(Sender: TObject);
begin
  if Trim( msk_cd_unid_neg.Text ) = cd_unid_neg then Exit;
  if Trim( msk_cd_unid_neg.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_unid_neg );
    with datm_imp_pagtos do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_unid_neg_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '" AND ';
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if Not qry_unid_neg_.EOF then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
        Abre_Pagtos;
      end
      else
      begin
        BoxMensagem( 'Unidade de Negócio não cadastrada ou não' + #13#10 +
                     'habilitada para este Usuário nesta Unidade/Produto', 2 );
        edt_nm_unid_neg.Text := '';
        msk_cd_unid_neg.SetFocus;
        Exit;
      end;
    end
  end
  else
  begin
    edt_nm_unid_neg.Text := '';
  end;
end;

procedure Tfrm_imp_pagtos.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_imp_pagtos do
  begin
    Application.CreateForm( Tfrm_unidade, frm_unidade );
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

procedure Tfrm_imp_pagtos.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  Panel2.Color := clPnlClaroBroker;
  Panel3.Color := clPnlClaroBroker;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
end;

end.
