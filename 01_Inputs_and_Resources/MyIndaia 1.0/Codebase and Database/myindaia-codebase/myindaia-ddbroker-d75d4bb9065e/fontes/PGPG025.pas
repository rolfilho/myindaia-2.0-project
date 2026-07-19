(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGPG025.PAS - Geração de TED
Data: 09/10/2001
*************************************************************************************************)
unit PGPG025;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, ComCtrls, DosLib, Funcoes;

type
  Tfrm_pagto_gera_ted = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_sair: TMenuItem;
    btn_marca_todas: TSpeedButton;
    btn_desmarca_todas: TSpeedButton;
    dbgrdPagtos: TDBGrid;
    lbl_pagtos: TLabel;
    mi_gerar: TMenuItem;
    btn_gerar: TSpeedButton;
    dbgrdItensPendentes: TDBGrid;
    lbl_processos: TLabel;
    lbl_pagto: TLabel;
    msk_dt_base: TMaskEdit;
    msk_nr_remessa: TMaskEdit;
    lbl_banco: TLabel;
    btn_co_banco: TSpeedButton;
    msk_cd_banco: TMaskEdit;
    edt_nm_banco: TEdit;
    Mensagem: TStatusBar;
    btn_canc_lanc: TSpeedButton;
    tmr_cheque: TTimer;
    lbl_dt_pagto: TLabel;
    msk_dt_pagto: TMaskEdit;
    btn_refresh: TSpeedButton;
    Label10: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
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
    procedure btn_gerarClick(Sender: TObject);
    procedure msk_cd_bancoExit(Sender: TObject);
    procedure msk_cd_bancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure Dados(Copia : Boolean );
    procedure btn_canc_lancClick(Sender: TObject);
    procedure msk_nr_remessaExit(Sender: TObject);
    procedure tmr_chequeTimer(Sender: TObject);
    procedure msk_dt_pagtoExit(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Header;
    procedure Trailler;
  private
    function Consiste : Boolean;
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
  frm_pagto_gera_ted : Tfrm_pagto_gera_ted;
  CancelaOperacao, Cancelado, Solicitando : Boolean;
  Txt : TextFile;
  saida, str_extenso, cNomeTxt : string;
  Tamanho, Contador : Byte;
  nr_remessa : Longint;

  num_seq : Double;
  posicao : integer;
  linha, AgenciaEmp: String;
  Total_Valor, Total_Valor_Aut: Double;

implementation

uses GSMLIB,  PGGP001, PGGP017, PGSM010, PGSM018, PGSM041, PGSM059, PGSM090,
     PGGP015, PGPG026;

{$R *.DFM}

procedure Tfrm_pagto_gera_ted.btn_sairClick(Sender: TObject);
begin
  Close;
end;


procedure Tfrm_pagto_gera_ted.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_pagto_gera_ted do
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


procedure Tfrm_pagto_gera_ted.FormCreate(Sender: TObject);
begin
  CancelaOperacao := False;
  Cancelado       := False;
  Imprimindo      := False;

  st_modificar    := False;
  st_incluir      := False;
  st_excluir      := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir );

  // Cria o DataModule de Geração de TED 
  Application.CreateForm(Tdatm_pagto_gera_ted, datm_pagto_gera_ted );

  msk_dt_base.Text  := DateToStr( dt_server );
  msk_dt_pagto.Text := DateToStr( dt_server );

  with datm_pagto_gera_ted do
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


procedure Tfrm_pagto_gera_ted.btn_cancelarClick(Sender: TObject);
begin
  if Solicitando then CancelaOperacao := True;
  btn_desmarca_todasClick(nil);
end;

procedure Tfrm_pagto_gera_ted.Abre_Pagtos;
begin
  with datm_pagto_gera_ted do
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

procedure Tfrm_pagto_gera_ted.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;


procedure Tfrm_pagto_gera_ted.btn_marca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Visible    := False;
  btn_desmarca_todas.Visible := True;
  btn_desmarca_todas.Left    := btn_marca_todas.Left;
  datm_pagto_gera_ted.qry_lib_pagto_.First;
  for i := 0 to datm_pagto_gera_ted.qry_lib_pagto_.RecordCount - 1 do
  begin
    dbgrdPagtos.SelectedRows.CurrentRowSelected := True;
    datm_pagto_gera_ted.qry_lib_pagto_.Next;
  end;
end;

procedure Tfrm_pagto_gera_ted.btn_desmarca_todasClick(Sender: TObject);
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


procedure Tfrm_pagto_gera_ted.msk_dt_baseEnter(Sender: TObject);
begin
  dt_base := msk_dt_base.Text;
end;

procedure Tfrm_pagto_gera_ted.msk_dt_baseExit(Sender: TObject);
begin
  if msk_dt_base.Text = dt_base then Exit;
  Abre_Pagtos;
end;


procedure Tfrm_pagto_gera_ted.btn_gerarClick(Sender: TObject);
var
  i : Integer;
begin
  if dbgrdPagtos.SelectedRows.Count = 0 then
  begin
    BoxMensagem('Selecione um pagamento!', 2);
    dbgrdPagtos.SetFocus;
    Exit;
  end;

  if Trim( msk_cd_banco.Text ) = '' then
  begin
    BoxMensagem('Selecione um banco!', 2);
    msk_cd_banco.SetFocus;
    Exit;
  end;

  if Trim(msk_nr_remessa.Text) = '' then
  begin
    nr_remessa := 1;
  end;

  with datm_pagto_gera_ted do
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

    Imprimindo          := True;
    Mensagem.SimpleText := 'Gerando Arquivo de Remessa para TED...';
    Screen.Cursor       := crHourGlass;
    Application.ProcessMessages;

    nr_remessa := StrToInt( msk_nr_remessa.Text );

    if not Consiste then
       Exit;
    if dbgrdPagtos.SelectedRows.Count > 0 then
       TTable(dbgrdPagtos.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdPagtos.SelectedRows[0]));

    Header;
    for i := 0 to dbgrdPagtos.SelectedRows.Count - 1 do
    begin
      if qry_lib_pagto_VL_PAGTO.AsFloat > 0 then
      begin
        Dados(False);

        try
          datm_main.db_broker.StartTransaction;
          // Verifica último lote para casos de emissão de remessa com data anterior a hoje
          qry_ult_ref_.Close;
          qry_ult_ref_.ParamByName('DT_PAGTO').AsDateTime := StrToDate( msk_dt_pagto.Text );
          qry_ult_ref_.Prepare;
          qry_ult_ref_.Open;
          qry_lib_pagto_item_.First;
          while Not ( qry_lib_pagto_item_.EOF ) do
          begin
            // Atualizando Número e Status da Remessa
            if Not ( qry_solic_pagto_.State in [dsEdit] ) then qry_solic_pagto_.Edit;

            if qry_solic_pagto_CD_STATUS.AsString <> '17' then
            begin
              qry_solic_pagto_NR_DOCTO.AsString   := FormatFloat('000000', nr_remessa);
              if StrToDate( msk_dt_base.Text ) = StrToDate( msk_dt_pagto.Text ) then
              begin
                qry_solic_pagto_DT_PAGTO.AsDateTime := StrToDate( msk_dt_pagto.Text );
              end
              else
              begin
                // Renumera Lote
                qry_solic_pagto_DT_PAGTO.AsDateTime := StrToDate( msk_dt_pagto.Text );
                qry_solic_pagto_NR_REF.AsString     := qry_ult_ref_ULT_REF.AsString;
              end;
              qry_solic_pagto_CD_STATUS.AsString := '7'; // Pago
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

          // Grava nº da remessa que gerou - 29/06/2006
          if Not ( qry_banco_.State in [dsInsert, dsEdit] ) then qry_banco_.Edit;
          qry_banco_NR_REMESSA.AsString := StrZero( nr_remessa, 6 );
          qry_banco_.Post;

          datm_main.db_broker.Commit;

        except
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        end;

      end;

      dbgrdPagtos.SelectedRows.CurrentRowSelected := False;
      if dbgrdPagtos.SelectedRows.Count > 0 then
        TTable(dbgrdPagtos.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdPagtos.SelectedRows[0]))
      else Break;
    end;

  end;
  Trailler;
  CloseFile( Txt );

  Screen.Cursor := crDefault;
  Application.ProcessMessages;
  Mensagem.SimpleText := 'Fim da Geração da Remessa';
  msk_nr_remessa.Text := StrZero( ( nr_remessa + 1 ), 6 );
  Imprimindo := False;
  Abre_Pagtos;
end;


procedure Tfrm_pagto_gera_ted.msk_cd_bancoExit(Sender: TObject);
begin
  if msk_cd_banco.Text <> '' then
  begin
    ValCodEdt( msk_cd_banco );
    with datm_pagto_gera_ted do
    begin
      qry_banco_.Close;
      qry_banco_.SQL[2] := 'WHERE CD_BANCO = "' + msk_cd_banco.Text + '"';
      qry_banco_.Prepare;
      qry_banco_.Open;
      if Not qry_banco_.EOF then
      begin
        edt_nm_banco.Text  := qry_banco_NM_BANCO.AsString;
        if Trim( qry_banco_nr_remessa.AsString ) <> '' then
        begin
          msk_nr_remessa.Text := StrZero( ( StrToInt( qry_banco_NR_REMESSA.AsString ) + 1 ), 6 );
        end
        else
        begin
          msk_nr_remessa.Text := '000001';
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


procedure Tfrm_pagto_gera_ted.msk_cd_bancoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = msk_cd_banco    then btn_co_bancoClick(nil);
  end;
end;

procedure Tfrm_pagto_gera_ted.btn_co_bancoClick(Sender: TObject);
begin
  with datm_pagto_gera_ted Do
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


procedure Tfrm_pagto_gera_ted.Dados(Copia : Boolean);
begin
  try
    with datm_pagto_gera_ted do
    begin
      qry_banco_ted_.Close;
      qry_banco_ted_.ParamByName('CD_BANCO').AsString := msk_cd_banco.Text;
      qry_banco_ted_.Prepare;
      qry_banco_ted_.Open;
      // Registros do Arquivo
      num_seq := num_seq + 1;
      Linha := '101';
      Linha := Linha + StrZero( StrToFloat( qry_unid_neg_.FieldByName( 'CGC_UNID_NEG' ).AsString ), 14);
      Linha := Linha + StrZero( ( StrToInt( qry_banco_ted_.FieldByName( 'NR_CONTA' ).AsString + qry_banco_ted_.FieldByName( 'DAC_AGENCIA' ).AsString ) ), 8 ) ;
      Linha := Linha + Space(3);
      Write( Txt, Linha );

      Posicao := Pos( '-', qry_banco_ted_.FieldByName('CD_AGENCIA').AsString );
      if Posicao = 0 then
      begin
         Linha := '00' + qry_banco_ted_.FieldByName('CD_AGENCIA').AsString  + '00';
         //Linha := StrZero( StrToInt( qry_banco_ted_.FieldByName('CD_AGENCIA').AsString ), 7 );
         AgenciaEmp := Linha;
      end
      else
      begin
        if Posicao <> 1 then
        begin
           Linha := StrZero( StrToInt( Copy( qry_banco_ted_.FieldByName('CD_AGENCIA').AsString, 1, Posicao - 1  ) + Copy( qry_banco_ted_.FieldByName('CD_AGENCIA').AsString, ( Posicao + 1 ), ( length( qry_banco_ted_.FieldByName('CD_AGENCIA').AsString ) - Posicao ) ) ), 7 );
           AgenciaEmp := Linha;
        end
        else
        begin
           Linha := StrZero( StrToInt( Copy( qry_banco_ted_.FieldByName('CD_AGENCIA').AsString, 2, Length( qry_banco_ted_.FieldByName('CD_AGENCIA').AsString ) ) ), 7 );
           AgenciaEmp := Linha;
        end;
      end;

      Linha := Linha + Space(2);
      Write( Txt, Linha );
      Linha := Space(25);
      Write( Txt, Linha );

      qry_favorecido_.Close;
      qry_favorecido_.ParamByName('CD_FAVORECIDO').AsString := qry_lib_pagto_CD_FAVORECIDO.AsString;
      qry_favorecido_.Prepare;
      qry_favorecido_.Open;

      if ( qry_favorecido_.FieldByName('CGC_EMPRESA').AsString = '' ) or ( qry_favorecido_.FieldByName('CGC_EMPRESA').IsNull ) then
      begin
        Linha := StrZero( StrToFloat( qry_favorecido_.FieldByName('CPF_EMPRESA').AsString), 14 );
      end
      else
      begin
        Linha := StrZero( StrToFloat( qry_favorecido_.FieldByName('CGC_EMPRESA').AsString), 14 );
      end;

      Linha := Linha + 'OUT';
      // verificar tamanho compromisso cliente
      Linha := Linha + FormatDateTime( 'ddmmyy', qry_lib_pagto_.FieldByName('DT_PAGTO').AsDateTime ) + qry_lib_pagto_NR_REF.AsString + '0' + '0';
      Linha := Linha + Space(17) + 'C01';
      Linha := Linha + FormatDateTime( 'ddmmyy', qry_lib_pagto_.FieldByName('DT_PAGTO').AsDateTime ) + qry_lib_pagto_NR_REF.AsString + '0';
      Linha := Linha + FormatDateTime( 'ddmmyy', qry_lib_pagto_.FieldByName('DT_PAGTO').AsDateTime );
      Write( Txt, Linha );

      Linha := Copy( FormatFloat( '00000000000.00', qry_lib_pagto_VL_PAGTO.AsFloat ), 1, 11 ) +
               Copy( FormatFloat( '00000000000.00', qry_lib_pagto_VL_PAGTO.AsFloat ), 13, 2 );
      Total_Valor := Total_Valor + qry_lib_pagto_VL_PAGTO.AsFloat;

      qry_banco_ted_.Close;
      qry_banco_ted_.ParamByName('CD_BANCO').AsString := qry_favorecido_.FieldByName('CD_BANCO').AsString;
      qry_banco_ted_.Prepare;
      qry_banco_ted_.Open;

      if Trim( qry_banco_ted_.FieldByName( 'NR_BANCO' ).AsString ) = '422' then
      begin
         Linha := Linha + 'CC ';
      end
      else
      begin
         Linha := Linha + 'TED';
      end;
      Write( Txt, Linha );


      Linha := qry_banco_ted_.FieldByName('NR_BANCO').AsString;

      Posicao := Pos( '-', qry_banco_ted_.FieldByName('CD_AGENCIA').AsString );

      if Posicao = 0 then
         Linha := Linha + StrZero( StrToInt( qry_banco_ted_.FieldByName('CD_AGENCIA').AsString ), 7 )
      else
      begin
        if Posicao <> 1 then
           Linha := Linha + StrZero( StrToInt( Copy( qry_banco_ted_.FieldByName('CD_AGENCIA').AsString, 1, Posicao - 1  ) + Copy( qry_banco_ted_.FieldByName('CD_AGENCIA').AsString, ( Posicao + 1 ), ( length( qry_banco_ted_.FieldByName('CD_AGENCIA').AsString ) - Posicao ) ) ), 7 )
        else
           Linha := Linha + StrZero( StrToInt( Copy( qry_banco_ted_.FieldByName('CD_AGENCIA').AsString, 2, length( qry_banco_ted_.FieldByName('CD_AGENCIA').AsString ) ) ), 7);
      end;

      Linha := Linha + Replicate( '0', 3 );
      // Modificado de StrToInt para StrToIntDef pq o valor do nr_conta + dac agencia tinha estourado - 16/12/2004 
      Linha := Linha + StrZero( StrToIntDef( qry_banco_ted_.FieldByName('NR_CONTA').AsString + qry_banco_ted_.FieldByName( 'DAC_AGENCIA' ).AsString, 0 ), 10 );
      Linha := Linha + Space(20);
      Linha := Linha + AgenciaEmp;
      Linha := Linha + Space(55);
      Write ( Txt, Linha );

      Linha := Replicate( '0', 16 );
      Linha := Linha + Copy( Trim( qry_favorecido_.FieldByName('NM_FAVORECIDO').AsString ), 1, 30 ) + Space( 30 - Length( Copy( Trim( qry_favorecido_.FieldByName('NM_FAVORECIDO').AsString ), 1, 30 ) ) );
      Linha := Linha + Space(54);
      Linha := Linha + Replicate( '0', 13 );
      Linha := Linha + FormatDateTime( 'ddmmyy', qry_lib_pagto_.FieldByName('DT_PAGTO').AsDateTime );
      Write ( Txt, Linha );

      Linha := Copy( FormatFloat( '00000000000.00', qry_lib_pagto_VL_PAGTO.AsFloat ), 1, 11 ) +
               Copy( FormatFloat( '00000000000.00', qry_lib_pagto_VL_PAGTO.AsFloat ), 13, 2 );
      Total_Valor_Aut := Total_Valor_Aut + qry_lib_pagto_VL_PAGTO.AsFloat;
      Linha := Linha + 'R$  ' + Space(8) + ' ';
      Linha := Linha + Space(2);
      Linha := Linha + FormatFloat( '000000', num_seq ) + #13#10;
      Write( Txt, Linha );
    end;
  except
    Mensagem.SimpleText := 'Erro na geração do Arquivo de Remessa';
    datm_pagto_gera_ted.qry_solic_pagto_.Close;
    CloseFile( Txt );
    Exit
  end;
end;


procedure Tfrm_pagto_gera_ted.btn_canc_lancClick(Sender: TObject);
var i : Integer;
begin
  with datm_pagto_gera_ted do
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
        sp_cancela_solic_pagto.ParamByName('@in_ted').AsString     := '1';
        ExecStoredProc(sp_cancela_solic_pagto);
        CloseStoredProc(sp_cancela_solic_pagto);

        // novo código - 12/09/2006
        CloseStoredProc( sp_distribui_pagamento );
        sp_distribui_pagamento.ParamByName('@dt_pagto').AsDateTime := qry_lib_pagto_DT_PAGTO.AsDateTime;
        sp_distribui_pagamento.ParamByName('@nr_ref').AsString     := qry_lib_pagto_NR_REF.AsString;
        sp_distribui_pagamento.ParamByName('@tp_destino').AsString := '2';
        sp_distribui_pagamento.ParamByName('@dt_canc').AsDateTime := dt_server;
        ExecStoredProc( sp_distribui_pagamento );
        CloseStoredProc( sp_distribui_pagamento );
        (*
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

      dbgrdPagtos.SelectedRows.CurrentRowSelected := False;
      if dbgrdPagtos.SelectedRows.Count > 0 then
        TTable(dbgrdPagtos.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdPagtos.SelectedRows[0]))
      else Break;

    end;

    Imprimindo := False;

    Abre_Pagtos;
  end;
end;

procedure Tfrm_pagto_gera_ted.msk_nr_remessaExit(Sender: TObject);
begin
  if Trim( msk_nr_remessa.Text ) <> '' then
     msk_nr_remessa.Text := StrZero( StrToInt( msk_nr_remessa.Text ), 6 );
end;

procedure Tfrm_pagto_gera_ted.tmr_chequeTimer(Sender: TObject);
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

procedure Tfrm_pagto_gera_ted.msk_dt_pagtoExit(Sender: TObject);
begin
  with datm_pagto_gera_ted do
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

procedure Tfrm_pagto_gera_ted.msk_cd_unid_negEnter(Sender: TObject);
begin
  cd_unid_neg := msk_cd_unid_neg.Text;
end;

procedure Tfrm_pagto_gera_ted.msk_cd_unid_negExit(Sender: TObject);
begin
  if Trim( msk_cd_unid_neg.Text ) = cd_unid_neg then Exit;
  if Trim( msk_cd_unid_neg.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_unid_neg );
    with datm_pagto_gera_ted do
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

procedure Tfrm_pagto_gera_ted.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_pagto_gera_ted do
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

procedure Tfrm_pagto_gera_ted.FormShow(Sender: TObject);
begin
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
end;


procedure Tfrm_pagto_gera_ted.Header;
begin
  Total_Valor := 0;
  Total_Valor_Aut := 0;
  // Montar o nome do Arquivo
  cNomeTxt := cDir_Rpt + '\TE' + msk_nr_remessa.Text +'.TXT';
  // Variável global de controle do Pascal
  FileMode := 2;

  try
    AssignFile( Txt, cNomeTxt );
    ReWrite( Txt );
  except
    Mensagem.SimpleText := 'Erro na criação do Arquivo.';
    Imprimindo := False;
    Exit
  end;

  num_seq := 1;
  Posicao := 0;
  with datm_pagto_gera_ted do
  begin
    qry_banco_ted_.Close;
    qry_banco_ted_.ParamByName('CD_BANCO').AsString := msk_cd_banco.Text;
    qry_banco_ted_.Prepare;
    qry_banco_ted_.Open;
    // Header
    Linha := '01REMESSA11PAGTOS FORNECED';
    Linha := Linha + StrZero( ( StrToInt( qry_banco_ted_.FieldByName( 'NR_CONTA' ).AsString + qry_banco_ted_.FieldByName( 'DAC_AGENCIA' ).AsString ) ), 8 ) ;
    Linha := Linha + 'S' + Space(2);
    Write( Txt, Linha );

    Posicao := Pos( '-', qry_banco_ted_.FieldByName('CD_AGENCIA').AsString );
    if Posicao = 0 then
       // Bco Safra
        Linha := '00' + qry_banco_ted_.FieldByName('CD_AGENCIA').AsString  + '00'
    else
    begin
      if Posicao <> 1 then
         Linha := StrZero( StrToInt( Copy( qry_banco_ted_.FieldByName('CD_AGENCIA').AsString, 1, Posicao - 1  ) + Copy( qry_banco_ted_.FieldByName('CD_AGENCIA').AsString, ( Posicao + 1 ), ( length( qry_banco_ted_.FieldByName('CD_AGENCIA').AsString ) - Posicao ) ) ), 7 )
      else
         Linha := StrZero( StrToInt( Copy( qry_banco_ted_.FieldByName('CD_AGENCIA').AsString, 2, length( qry_banco_ted_.FieldByName('CD_AGENCIA').AsString ) ) ), 7);
    end;

    Linha := Linha + Space(2);
    Linha := Linha + Copy( qry_unid_neg_.FieldByName('NM_UNID_NEG').AsString, 1, 30 ) + Space( 30 - Length( Trim( Copy( qry_unid_neg_.FieldByName('NM_UNID_NEG').AsString, 1, 30 ) ) ) );
    Linha := Linha + '422BANCO SAFRA S/A';
    Linha := Linha + FormatDateTime( 'ddmmyy', Date );
    Linha := Linha + '000';
    Write( Txt, Linha );
    Linha := Space(250);
    Write( Txt, Linha );
    Linha := Space(35);
    Write( Txt, Linha );
    Linha := msk_nr_remessa.Text + FormatFloat( '000000', num_seq ) + #13#10;
    Write( Txt, Linha );
    // FIM Header
  end;
end;

procedure Tfrm_pagto_gera_ted.Trailler;
begin
    num_seq := num_seq + 1;
    Linha := '9' + Space(123);
    Write( Txt, Linha );

    Linha := Copy( FormatFloat( '0000000000000.00', Total_Valor ), 1, 13 ) +
             Copy( FormatFloat( '0000000000000.00', Total_Valor ), 15, 2 );
    Linha := Linha + Space(109);
    Write( Txt, Linha );

    Linha := '000000000000000'; //somatória do campo abatimento
    Linha := Linha + Space(82);
    Linha := Linha + '000000000000000' + Space(4); //somatória do campo juros/multa
    Write( Txt, Linha );

    Linha := Copy( FormatFloat( '0000000000000.00', Total_Valor_Aut ), 1, 13 ) +
             Copy( FormatFloat( '0000000000000.00', Total_Valor_Aut ), 15, 2 );
    Linha := Linha + Space(15);
    Linha := Linha + FormatFloat( '000000', num_seq ) + #13#10;
    Write( Txt, Linha );
end;

function Tfrm_pagto_gera_ted.Consiste : Boolean;
var
  i: Integer;
begin
  Consiste := True;

  for i := 0 to dbgrdPagtos.SelectedRows.Count - 1 do
  begin
    with datm_pagto_gera_ted do
    begin
      qry_favorecido_.Close;
      qry_favorecido_.ParamByName('CD_FAVORECIDO').AsString := qry_lib_pagto_CD_FAVORECIDO.AsString;
      qry_favorecido_.Prepare;
      qry_favorecido_.Open;

      if ( qry_favorecido_.FieldByName('CGC_EMPRESA').AsString = '' ) or ( qry_favorecido_.FieldByName('CGC_EMPRESA').IsNull ) then
      begin
        if ( qry_favorecido_.FieldByName('CPF_EMPRESA').AsString = '' ) or ( qry_favorecido_.FieldByName('CPF_EMPRESA').IsNull ) then
        begin
          BoxMensagem( 'Fornecedor ' + qry_lib_pagto_CD_FAVORECIDO.AsString +
                       ' não tem CGC/CPF cadastrado', 2 );
          Consiste := False;
          Exit;
        end;
      end;
      if ( qry_favorecido_.FieldByName('CD_BANCO').AsString = '' ) or ( qry_favorecido_.FieldByName('CD_BANCO').IsNull ) then
      begin
        BoxMensagem( 'Banco do Favorecido está vazio. ' + qry_lib_pagto_CD_FAVORECIDO.AsString, 2 );
        Consiste := False;
        Exit;
      end;

      qry_banco_ted_.Close;
      qry_banco_ted_.ParamByName('CD_BANCO').AsString := qry_favorecido_.FieldByName('CD_BANCO').AsString;
      qry_banco_ted_.Prepare;
      qry_banco_ted_.Open;


      if ( qry_banco_ted_.FieldByName('NR_CONTA').AsString = qry_banco_.FieldByName('NR_CONTA').AsString ) and
         ( qry_banco_ted_.FieldByName('CD_BANCO').AsString = qry_banco_.FieldByName('CD_BANCO').AsString ) then
      begin
        BoxMensagem( 'Conta do Favorecido é igual ao banco selecionado ' + msk_cd_banco.Text , 2 );
        Consiste := False;
        Exit;
      end;
      if ( qry_banco_ted_.FieldByName('NR_CONTA').AsString = '' ) or ( qry_banco_ted_.FieldByName('NR_CONTA').IsNull )  then
      begin
        BoxMensagem( 'Conta do Favorecido está vazia. ' + qry_lib_pagto_CD_FAVORECIDO.AsString, 2 );
        Consiste := False;
        Exit;
      end;
      if ( qry_banco_ted_.FieldByName('CD_AGENCIA').AsString = '' ) or ( qry_banco_ted_.FieldByName('CD_AGENCIA').IsNull ) then
      begin
        BoxMensagem( 'Agência do Favorecido está vazia. ' + qry_lib_pagto_CD_FAVORECIDO.AsString, 2 );
        Consiste := False;
        Exit;
      end;
    end;
  end;
end;

end.
