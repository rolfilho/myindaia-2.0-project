(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGPG029.PAS - Geração de TED Administrativos
DATA: 27/07/2002
Manutenção:
Data: 09/10/2001
*************************************************************************************************)
unit PGPG029;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, ComCtrls, DosLib, UCRPE32, Funcoes;

type
  Tfrm_imp_adm_gera_ted = class(TForm)
    menu_cadastro: TMainMenu;
    mi_sair: TMenuItem;
    dbgrdAdm: TDBGrid;
    lbl_pagto_recebto: TLabel;
    mi_gerar: TMenuItem;
    dbgrdItensPendentes: TDBGrid;
    lbl_processos: TLabel;
    lbl_dt_base: TLabel;
    msk_dt_base: TMaskEdit;
    lbl_nr_remessa_ini: TLabel;
    msk_nr_remessa: TMaskEdit;
    lbl_banco: TLabel;
    btn_co_banco: TSpeedButton;
    msk_cd_banco: TMaskEdit;
    edt_nm_banco: TEdit;
    Mensagem: TStatusBar;
    Label1: TLabel;
    btn_co_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    rdgrp_tp_natureza: TRadioGroup;
    rdgrp_tp_lancamento: TRadioGroup;
    lbl_dt_pagto: TLabel;
    msk_dt_pagto: TMaskEdit;
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_marca_todas: TSpeedButton;
    btn_desmarca_todas: TSpeedButton;
    btn_imprimir: TSpeedButton;
    btn_canc_lanc: TSpeedButton;
    dbnvg: TDBNavigator;
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure Abre_Adm;
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
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rdgrp_tp_naturezaClick(Sender: TObject);
    procedure rdgrp_tp_lancamentoClick(Sender: TObject);
    procedure msk_nr_remessaExit(Sender: TObject);
    procedure msk_dt_pagtoExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure Header;
    procedure Trailler;
  private

    procedure GeraTed;
    function Consiste : Boolean;
  public
    st_modificar, st_incluir, st_excluir : Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    dt_solic_ch : String[10];
    nr_proc : String[18];
    hm_para_solic_ch : String[5];
    cd_unid_neg, cd_produto : String[2];
    dt_pagamento : String;
  end;

var
  frm_imp_adm_gera_ted : Tfrm_imp_adm_gera_ted;
  CancelaOperacao, Cancelado, Solicitando : Boolean;
  Txt : TextFile;
  str_cr, saida, str_extenso, cNomeTxt: string;
  Tamanho, Contador : Byte;
  Nr_remessa : Longint;

  num_seq : Double;
  posicao : integer;
  linha, AgenciaEmp: String;
  Total_Valor, Total_Valor_Aut: Double;

implementation

uses GSMLIB, PGGP001, PGGP017, PGPG030, PGSM018, PGSM041, PGPG026;

{$R *.DFM}

procedure Tfrm_imp_adm_gera_ted.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_imp_adm_gera_ted.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_imp_adm_gera_ted do
  begin
    qry_status_solic_pagto_.Close;
    qry_ct_contabil_.Close;
    qry_unid_neg_.Close;
    qry_banco_.Close;
    qry_historico_.Close;
    qry_ct_contabil_.Close;
    qry_lib_adm_.Close;
    qry_lib_adm_item_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_imp_adm_gera_ted.FormCreate(Sender: TObject);
begin
  CancelaOperacao := False;
  Cancelado       := False;

  st_modificar    := False;
  st_incluir      := False;
  st_excluir      := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir );

  // Cria o DataModule de Dados de Geração de TED 
  Application.CreateForm(Tdatm_imp_adm_gera_ted, datm_imp_adm_gera_ted );

  msk_dt_base.Text  := DateToStr( dt_server );
  msk_dt_pagto.Text := DateToStr( dt_server );

  with datm_imp_adm_gera_ted do
  begin
    qry_status_solic_pagto_.Close;
    qry_status_solic_pagto_.Prepare;
    qry_status_solic_pagto_.Open;

    qry_ct_contabil_.Close;
    qry_ct_contabil_.Prepare;
    qry_ct_contabil_.Open;

    qry_banco_.Close;
    qry_banco_.Prepare;
    qry_banco_.Open;

    qry_historico_.Close;
    qry_historico_.Prepare;
    qry_historico_.Open;

    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    qry_lib_adm_.Close;
    qry_lib_adm_item_.Close;

    msk_cd_unid_neg.Text := str_cd_unid_neg;
    msk_cd_unid_negExit(nil);

    Abre_Adm;
  end;
end;

procedure Tfrm_imp_adm_gera_ted.btn_cancelarClick(Sender: TObject);
begin
  if Solicitando then CancelaOperacao := True;
  btn_desmarca_todasClick(nil);
end;

procedure Tfrm_imp_adm_gera_ted.Abre_Adm;
begin
  with datm_imp_adm_gera_ted do
  begin
    if msk_dt_base.Text = '  /  /    ' then Exit;

    qry_lib_adm_.Close;
    qry_lib_adm_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
    qry_lib_adm_.ParamByName('DT_PAGTO').AsDate      := StrToDate( msk_dt_base.Text );
    if msk_cd_banco.Visible then
       qry_lib_adm_.ParamByName('CD_BANCO').AsString := Trim( msk_cd_banco.Text )
    else
       qry_lib_adm_.ParamByName('CD_BANCO').AsString := '';
    if rdgrp_tp_natureza.ItemIndex = 0 then
       qry_lib_adm_.ParamByName('TP_NATUREZA').AsString    := 'C'
    else
       qry_lib_adm_.ParamByName('TP_NATUREZA').AsString    := 'D';
    if rdgrp_tp_lancamento.ItemIndex = 0 then
       qry_lib_adm_.ParamByName('TP_LANCAMENTO').AsString  := 'C'
    else
       qry_lib_adm_.ParamByName('TP_LANCAMENTO').AsString  := 'N';
    qry_lib_adm_.Prepare;
    qry_lib_adm_.Open;

    qry_lib_adm_item_.Close;
    qry_lib_adm_item_.Prepare;
    qry_lib_adm_item_.Open;

    qry_solic_adm_.Close;
    qry_solic_adm_.Prepare;
    qry_solic_adm_.Open;
  end;
end;

procedure Tfrm_imp_adm_gera_ted.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_imp_adm_gera_ted.btn_marca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Visible    := False;
  btn_desmarca_todas.Visible := True;
  btn_desmarca_todas.Left    := btn_marca_todas.Left;
  datm_imp_adm_gera_ted.qry_lib_adm_.First;
  for i := 0 to datm_imp_adm_gera_ted.qry_lib_adm_.RecordCount - 1 do
  begin
    dbgrdAdm.SelectedRows.CurrentRowSelected := True;
    datm_imp_adm_gera_ted.qry_lib_adm_.Next;
  end;
end;

procedure Tfrm_imp_adm_gera_ted.btn_desmarca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Visible    := True;
  btn_desmarca_todas.Visible := False;
  if dbgrdAdm.SelectedRows.Count > 0 then
     TTable(dbgrdAdm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdAdm.SelectedRows[0]));
  for i := 0 to dbgrdAdm.SelectedRows.Count - 1 do
  begin
    dbgrdAdm.SelectedRows.CurrentRowSelected := False;
    if dbgrdAdm.SelectedRows.Count > 0 then
      TTable(dbgrdAdm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdAdm.SelectedRows[0]))
    else Break;
  end;
end;

procedure Tfrm_imp_adm_gera_ted.msk_dt_baseEnter(Sender: TObject);
begin
  dt_pagamento := msk_dt_base.Text;
end;

procedure Tfrm_imp_adm_gera_ted.msk_dt_baseExit(Sender: TObject);
begin
  if msk_dt_base.Text = dt_pagamento then Exit;
  Abre_Adm;
end;

procedure Tfrm_imp_adm_gera_ted.btn_imprimirClick(Sender: TObject);
begin
  if rdgrp_tp_lancamento.ItemIndex = 0 then //Geração de TED
  begin
    if dbgrdAdm.SelectedRows.Count = 0 then
    begin
      BoxMensagem( 'Selecione um pagamento!', 2 );
      dbgrdAdm.SetFocus;
      Exit;
    end;

    if Trim( msk_cd_banco.Text ) = '' then
    begin
      BoxMensagem( 'Selecione um banco!', 3 );
      msk_cd_banco.SetFocus;
      Exit;
    end;

    if Trim( msk_nr_remessa.Text ) = '' then
    begin
      nr_remessa := 1;
    end;

    with datm_imp_adm_gera_ted do
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
    end;

    GeraTed;
  end;

  Screen.Cursor := crDefault;
  Application.ProcessMessages;
  msk_nr_remessa.Text := StrZero( ( Nr_remessa + 1 ), 6 );
  Mensagem.SimpleText := 'Fim da emissão';
  Abre_Adm;
end;

procedure Tfrm_imp_adm_gera_ted.msk_cd_bancoExit(Sender: TObject);
begin
  if msk_cd_banco.Text <> '' then
  begin
    ValCodEdt( msk_cd_banco );
    with datm_imp_adm_gera_ted do
    begin
      qry_banco_.Close;
      qry_banco_.SQL[2] := 'WHERE CD_BANCO = "' + msk_cd_banco.Text + '"';
      qry_banco_.Prepare;
      qry_banco_.Open;
      if Not qry_banco_.EOF then
      begin
        edt_nm_banco.Text := qry_banco_NM_BANCO.AsString;
        if qry_banco_NR_REMESSA.AsString <> '' then
        begin
          msk_nr_remessa.Text := StrZero( ( StrToInt( qry_banco_NR_REMESSA.AsString ) + 1 ), 6 );
        end
        else
        begin
          msk_nr_remessa.Text := '000001';
        end;
        Abre_Adm;
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
    Abre_Adm;
  end;
end;

procedure Tfrm_imp_adm_gera_ted.msk_cd_bancoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_cd_banco then btn_co_bancoClick(nil);
  end;
end;

procedure Tfrm_imp_adm_gera_ted.btn_co_bancoClick(Sender: TObject);
begin
  with datm_imp_adm_gera_ted Do
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

procedure Tfrm_imp_adm_gera_ted.Dados(Copia : Boolean);
begin
  try
    with datm_imp_adm_gera_ted do
    begin

      qry_banco_ted_.Close;
      qry_banco_ted_.ParamByName('CD_BANCO').AsString := msk_cd_banco.Text;
      qry_banco_ted_.Prepare;
      qry_banco_ted_.Open;

      num_seq := num_seq + 1;
      Linha := '101';
      Linha := Linha + StrZero( StrToFloat( qry_unid_neg_.FieldByName( 'CGC_UNID_NEG' ).AsString ), 14);
      Linha := Linha + StrZero( ( StrToInt( qry_banco_ted_.FieldByName( 'NR_CONTA' ).AsString + qry_banco_ted_.FieldByName( 'DAC_AGENCIA' ).AsString ) ), 8 ) ;
      Linha := Linha + Space(3);
      Write( Txt, Linha );

      Posicao := Pos( '-', qry_banco_ted_.FieldByName('CD_AGENCIA').AsString );
      if Posicao = 0 then
      begin
         Linha := StrZero( StrToInt( qry_banco_ted_.FieldByName('CD_AGENCIA').AsString ), 5 ) + '00';
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
      qry_favorecido_.ParamByName('CD_FAVORECIDO').AsString := qry_lib_adm_CD_FAVORECIDO.AsString;
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
      //verificar tamanho compromisso cliente
      Linha := Linha + FormatDateTime( 'ddmmyy', qry_lib_adm_.FieldByName('DT_PAGTO').AsDateTime ) + qry_lib_adm_NR_REF.AsString + '0' + '0';
      Linha := Linha + Space(17) + 'C01';
      Linha := Linha + FormatDateTime( 'ddmmyy', qry_lib_adm_.FieldByName('DT_PAGTO').AsDateTime ) + qry_lib_adm_NR_REF.AsString + '0';
      Linha := Linha + FormatDateTime( 'ddmmyy', qry_lib_adm_.FieldByName('DT_PAGTO').AsDateTime );
      Write( Txt, Linha );

      Linha := Copy( FormatFloat( '00000000000.00', qry_lib_adm_VL_LANCTO.AsFloat ), 1, 11 ) +
               Copy( FormatFloat( '00000000000.00', qry_lib_adm_VL_LANCTO.AsFloat ), 13, 2 );
      Total_Valor := Total_Valor + qry_lib_adm_VL_LANCTO.AsFloat;

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
      // Banco Favorecido
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
      Linha := Linha + StrZero( StrToInt( qry_banco_ted_.FieldByName('NR_CONTA').AsString + qry_banco_ted_.FieldByName( 'DAC_AGENCIA' ).AsString ), 10 );
      Linha := Linha + Space(20);
      Linha := Linha + AgenciaEmp;
      Linha := Linha + Space(55);
      Write ( Txt, Linha );

      Linha := Replicate( '0', 16 );
      Linha := Linha + Copy( Trim( qry_favorecido_.FieldByName('NM_FAVORECIDO').AsString ), 1, 30 ) + Space( 30 - Length( Copy( Trim( qry_favorecido_.FieldByName('NM_FAVORECIDO').AsString ), 1, 30 ) ) );
      Linha := Linha + Space(54);
      Linha := Linha + Replicate( '0', 13 );
      Linha := Linha + FormatDateTime( 'ddmmyy', qry_lib_adm_.FieldByName('DT_PAGTO').AsDateTime );
      Write ( Txt, Linha );

      Linha := Copy( FormatFloat( '00000000000.00', qry_lib_adm_VL_LANCTO.AsFloat ), 1, 11 ) +
               Copy( FormatFloat( '00000000000.00', qry_lib_adm_VL_LANCTO.AsFloat ), 13, 2 );
      Total_Valor_Aut := Total_Valor_Aut + qry_lib_adm_VL_LANCTO.AsFloat;
      Linha := Linha + 'R$  ' + Space(8) + ' ';
      Linha := Linha + Space(2);
      Linha := Linha + FormatFloat( '000000', num_seq ) + #13#10;
      Write( Txt, Linha );
    end;
  except
    Mensagem.SimpleText := 'Erro na geração do TED';
    datm_imp_adm_gera_ted.qry_solic_adm_.Close;
    CloseFile( Txt );
    Exit
  end;
end;

procedure Tfrm_imp_adm_gera_ted.btn_canc_lancClick(Sender: TObject);
var i : Integer;
    nr_novo_lancamento : String[3];
begin
  with datm_imp_adm_gera_ted do
  begin
    if dbgrdAdm.SelectedRows.Count > 0 then
       TTable(dbgrdAdm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdAdm.SelectedRows[0]))
    else
    begin
      BoxMensagem('Selecione um pagamento!', 2);
      Exit;
    end;

    for i := 0 to dbgrdAdm.SelectedRows.Count - 1 do
    begin
      if Not BoxMensagem( 'Confirma cancelamento da Ref. nº ' + qry_lib_adm_item_NR_REF.AsString + '?', 1) then Exit;

      qry_rel_liq_.Close;
      qry_rel_liq_.ParamByName('CD_UNID_NEG').AsString    := qry_lib_adm_item_CD_UNID_NEG.AsString;
      qry_rel_liq_.ParamByName('CD_CT_CONTABIL').AsString := qry_lib_adm_item_CD_CT_CONTABIL.AsString;
      qry_rel_liq_.ParamByName('TP_NATUREZA').AsString    := qry_lib_adm_item_TP_NATUREZA.AsString;
      qry_rel_liq_.ParamByName('DT_LANCTO').AsDateTime    := qry_lib_adm_item_DT_LANCTO.AsDateTime;
      qry_rel_liq_.ParamByName('NR_LANCAMENTO').AsString  := qry_lib_adm_item_NR_LANCAMENTO.AsString;
      qry_rel_liq_.Prepare;
      qry_rel_liq_.Open;
      if qry_rel_liq_TOT_LIQ.AsInteger > 0 then
      begin
        BoxMensagem('Conta Contábil pertence a relatório de reembolso já liquidado!', 2);
        qry_rel_liq_.Close;
        Exit;
      end;
      qry_rel_liq_.Close;

      try
        datm_main.db_broker.StartTransaction;
        TTable(dbgrdAdm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdAdm.SelectedRows[i]));
        qry_lib_adm_item_.First;
        while Not qry_lib_adm_item_.EOF do
        begin
          if Not ( qry_lib_adm_item_CD_STATUS_ADM.AsString = '4'  ) and
             Not ( qry_lib_adm_item_CD_STATUS_ADM.AsString = '17' ) then
          begin
            qry_solic_adm_.Close;
            qry_solic_adm_.Prepare;
            qry_solic_adm_.Open;
            if Not qry_solic_adm_.EOF then
            begin
              if Not ( qry_solic_adm_.State in [dsInsert, dsEdit] ) then qry_solic_adm_.Edit;
              if ( ( qry_solic_adm_CD_STATUS_ADM.AsString = '7' ) and
                   ( Trim( qry_solic_adm_NR_DOCTO.AsString ) <> '' ) ) or
                 ( qry_solic_adm_IN_TRANSF_FIN.AsString = '1' ) then
              begin
                 qry_solic_adm_IN_TRANSF_FIN.AsString := '0'
              end
              else
              begin
                qry_solic_adm_IN_TRANSF_FIN.AsString := '1';
              end;
              qry_solic_adm_CD_STATUS_ADM.AsString := '4'; // Antes 4 - Cancelado
              qry_solic_adm_.Post;

              qry_ult_lancto_.Close;
              qry_ult_lancto_.ParamByName('CD_UNID_NEG').AsString := qry_solic_adm_CD_UNID_NEG.AsString;
              qry_ult_lancto_.ParamByName('DT_LANCTO').AsDateTime := qry_solic_adm_DT_LANCTO.AsDateTime;
              qry_ult_lancto_.Prepare;
              qry_ult_lancto_.Open;
              if qry_ult_lancto_NR_LANCAMENTO.AsString = '000' then
                 nr_novo_lancamento := '001'
              else
                 nr_novo_lancamento := qry_ult_lancto_NR_LANCAMENTO.AsString;
              qry_ult_lancto_.Close;

              qry_ins_adm_.Close;
              qry_ins_adm_.ParamByName('CD_UNID_NEG').AsString        := qry_solic_adm_CD_UNID_NEG.AsString;
              qry_ins_adm_.ParamByName('DT_LANCTO').AsDateTime        := qry_solic_adm_DT_LANCTO.AsDateTime;
              qry_ins_adm_.ParamByName('TP_NATUREZA').AsString        := qry_solic_adm_TP_NATUREZA.AsString;
              qry_ins_adm_.ParamByName('CD_CT_CONTABIL').AsString     := qry_solic_adm_CD_CT_CONTABIL.AsString;
              qry_ins_adm_.ParamByName('NR_LANCAMENTO').AsString      := qry_solic_adm_NR_LANCAMENTO.AsString;
              qry_ins_adm_.ParamByName('NR_NOVO_LANCAMENTO').AsString := nr_novo_lancamento;
              qry_ins_adm_.ExecSQL;

            end;
          end;
          qry_lib_adm_item_.Next;
        end;

        // nova sp de cancelamento 09/2006
        CloseStoredProc( sp_distribui_adminis );
        sp_distribui_adminis.ParamByName('@cd_unid_neg').AsString := qry_lib_adm_CD_UNID_NEG.AsString;
        sp_distribui_adminis.ParamByName('@dt_pagto').AsDateTime  := qry_lib_adm_DT_PAGTO.AsDateTime;
        sp_distribui_adminis.ParamByName('@dt_canc').AsDateTime  := dt_server;
        sp_distribui_adminis.ParamByName('@nr_ref').AsString      := qry_lib_adm_NR_REF.AsString;
        sp_distribui_adminis.ParamByName('@tp_natureza').AsString := qry_lib_adm_TP_NATUREZA.AsString;
        ExecStoredProc( sp_distribui_adminis );
        CloseStoredProc( sp_distribui_adminis );


        (* Antiga sp de cancelamento
        CloseStoredProc( sp_distribui_adm );
        sp_distribui_adm.ParamByName('@cd_unid_neg').AsString := qry_lib_adm_CD_UNID_NEG.AsString;
        sp_distribui_adm.ParamByName('@dt_pagto').AsDateTime  := qry_lib_adm_DT_PAGTO.AsDateTime;
        sp_distribui_adm.ParamByName('@nr_ref').AsString      := qry_lib_adm_NR_REF.AsString;
        sp_distribui_adm.ParamByName('@tp_natureza').AsString := qry_lib_adm_TP_NATUREZA.AsString;
        ExecStoredProc( sp_distribui_adm );
        CloseStoredProc( sp_distribui_adm );
        *)
        //desmonta o lançamento no contas a pagar
        DesmontaLancContasPagar(qry_lib_adm_item_DT_LANCTO.AsDateTime, qry_lib_adm_item_NR_REF.AsString);
        datm_main.db_broker.Commit;
      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        qry_solic_adm_.Cancel;
      end;

    end;
    Abre_Adm;
  end;
end;

procedure Tfrm_imp_adm_gera_ted.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text <> '' then
  begin
    ValCodEdt( msk_cd_unid_neg );
    with datm_imp_adm_gera_ted do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '"';
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.RecordCount > 0 then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
        Abre_Adm;
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
    Abre_Adm;
  end;
end;

procedure Tfrm_imp_adm_gera_ted.FormShow(Sender: TObject);
begin
  rdgrp_tp_natureza.ItemIndex   := 1;
  rdgrp_tp_lancamento.ItemIndex := 0;
  msk_cd_banco.SetFocus;
end;

procedure Tfrm_imp_adm_gera_ted.rdgrp_tp_naturezaClick(Sender: TObject);
begin
  if rdgrp_tp_natureza.ItemIndex = 0 then
    lbl_pagto_recebto.Caption := 'Recebimentos'
  else
    lbl_pagto_recebto.Caption := 'Pagamentos';

  Abre_Adm;
end;

procedure Tfrm_imp_adm_gera_ted.GeraTed;
var
  cd_banco: String[3];
  i : Integer;
begin
  with datm_imp_adm_gera_ted do
  begin
    // Verificar se existe mais de um Favorecido X Banco 
    cd_banco      := '';
    if dbgrdAdm.SelectedRows.Count > 0 then
       TTable(dbgrdAdm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdAdm.SelectedRows[0]));
    for i := 0 to dbgrdAdm.SelectedRows.Count - 1 do
    begin
      cd_banco := qry_lib_adm_CD_BANCO.AsString;
      TTable(dbgrdAdm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdAdm.SelectedRows[i]));
      if ( cd_banco <> qry_lib_adm_CD_BANCO.AsString ) then
      begin
        BoxMensagem('Existem mais de um Banco selecionado!' + #13#10 +
                    'Não será possível gerar Pagamento!', 2);
        Exit;
      end;
    end;

    Mensagem.SimpleText := 'Gerando Arquivo de Remessa...';
    Screen.Cursor       := crHourGlass;
    Application.ProcessMessages;

    Nr_remessa := StrToInt(msk_nr_remessa.Text);
    str_cr := #13#10;

    if not Consiste then
       Exit;
    if dbgrdAdm.SelectedRows.Count > 0 then
       TTable(dbgrdAdm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdAdm.SelectedRows[0]));

    Header;
    for i := 0 to dbgrdAdm.SelectedRows.Count - 1 do
    begin
      Dados(False);

      try
        datm_main.db_broker.StartTransaction;
        // Reemissão
        if ( Trim( qry_lib_adm_NR_DOCTO.AsString ) <> Trim ( FormatFloat('000000', Nr_remessa) ) ) and
           ( Trim( qry_lib_adm_NR_DOCTO.AsString ) <> '' ) then
        begin
          CloseStoredProc( sp_reemite_cheque_adm );
          sp_reemite_cheque_adm.ParamByName('@cd_unid_neg').AsString    := qry_lib_adm_CD_UNID_NEG.AsString;
          sp_reemite_cheque_adm.ParamByName('@nr_ref').AsString         := qry_lib_adm_NR_REF.AsString;
          sp_reemite_cheque_adm.ParamByName('@dt_base').AsDateTime      := StrToDate( msk_dt_base.Text );
          sp_reemite_cheque_adm.ParamByName('@dt_pagto').AsDateTime     := StrToDate( msk_dt_pagto.Text );
          sp_reemite_cheque_adm.ParamByName('@nr_novo_cheque').AsString := FormatFloat('000000', Nr_remessa);
          ExecStoredProc( sp_reemite_cheque_adm );
          CloseStoredProc( sp_reemite_cheque_adm );
        end
        else
        begin
          // Verifica último lote para casos de emissão de cheques com data anterior a hoje
          qry_ult_ref_.Close;
          qry_ult_ref_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
          qry_ult_ref_.ParamByName('DT_PAGTO').AsDateTime  := StrToDate( msk_dt_pagto.Text );
          qry_ult_ref_.Prepare;
          qry_ult_ref_.Open;

          qry_lib_adm_item_.First;
          while Not ( qry_lib_adm_item_.EOF ) do
          begin
            // Atualizando Número e Status do Cheque
            if Not ( qry_solic_adm_.State in [dsEdit] ) then qry_solic_adm_.Edit;
            // Se emitido então fica reemitido
            if qry_solic_adm_CD_STATUS_CHEQUE.AsString = '1' then
               qry_solic_adm_CD_STATUS_CHEQUE.AsString := '2';
            // Se solicitado então fica emitido
            if qry_solic_adm_CD_STATUS_CHEQUE.AsString = '0' then
               qry_solic_adm_CD_STATUS_CHEQUE.AsString := '1';
            qry_solic_adm_NR_DOCTO.AsString            := FormatFloat( '000000', Nr_remessa );

            if StrToDate( msk_dt_base.Text ) = StrToDate( msk_dt_pagto.Text ) then
            begin
              qry_solic_adm_DT_PAGTO.AsDateTime := StrToDate( msk_dt_pagto.Text );
            end
            else
            begin
              // Renumera Lote
              qry_solic_adm_DT_PAGTO.AsDateTime := StrToDate( msk_dt_pagto.Text );
              qry_solic_adm_NR_REF.AsString     := qry_ult_ref_ULT_REF.AsString;
            end;
            qry_solic_adm_.Post;

            qry_lib_adm_item_.Next;
          end;

          CloseStoredProc( sp_distribui_adm );
          sp_distribui_adm.ParamByName('@cd_unid_neg').AsString := qry_lib_adm_CD_UNID_NEG.AsString;
          sp_distribui_adm.ParamByName('@dt_pagto').AsDateTime  := StrToDate( msk_dt_pagto.Text );
          if StrToDate( msk_dt_base.Text ) = StrToDate( msk_dt_pagto.Text ) then
          begin
            sp_distribui_adm.ParamByName('@nr_ref').AsString := qry_lib_adm_NR_REF.AsString;
          end
          else                                                 
          begin
            sp_distribui_adm.ParamByName('@nr_ref').AsString := qry_ult_ref_ULT_REF.AsString;
          end;
          sp_distribui_adm.ParamByName('@tp_natureza').AsString := datm_imp_adm_gera_ted.qry_lib_adm_TP_NATUREZA.AsString;
          ExecStoredProc( sp_distribui_adm );
          CloseStoredProc( sp_distribui_adm );
          qry_ult_ref_.Close;

          qry_lib_adm_item_.First;
          while Not ( qry_lib_adm_item_.EOF ) do
          begin
            // Atualizando Status
            if Not ( qry_solic_adm_.State in [dsEdit] ) then qry_solic_adm_.Edit;
            if qry_solic_adm_TP_NATUREZA.AsString = 'C' then
               qry_solic_adm_CD_STATUS_ADM.AsString       := '18' // Recebido
            else
               qry_solic_adm_CD_STATUS_ADM.AsString       := '7'; // Pago
            qry_solic_adm_.Post;

            qry_lib_adm_item_.Next;
          end;

        end;

        // Atualiza nº da remessa 
        if Not ( qry_banco_.State in [dsInsert, dsEdit] ) then qry_banco_.Edit;
        qry_banco_NR_REMESSA.AsString := StrZero( Nr_remessa, 6 );
        qry_banco_.Post;

        datm_main.db_broker.Commit;

      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      end;


      dbgrdAdm.SelectedRows.CurrentRowSelected := False;
      if dbgrdAdm.SelectedRows.Count > 0 then
        TTable(dbgrdAdm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdAdm.SelectedRows[0]))
      else Break;
    end;

    Trailler;
    CloseFile( Txt );
  end;
end;


procedure Tfrm_imp_adm_gera_ted.rdgrp_tp_lancamentoClick(Sender: TObject);
begin
  if rdgrp_tp_lancamento.ItemIndex = 0 then
  begin
    lbl_nr_remessa_ini.Visible := True;
    msk_nr_remessa.Visible     := True;
  end;
  Abre_Adm;
end;

procedure Tfrm_imp_adm_gera_ted.msk_nr_remessaExit(Sender: TObject);
begin
  if Trim( msk_nr_remessa.Text ) <> '' then
     msk_nr_remessa.Text := StrZero( StrToInt( msk_nr_remessa.Text ), 6 );
end;

procedure Tfrm_imp_adm_gera_ted.msk_dt_pagtoExit(Sender: TObject);
begin
  with datm_imp_adm_gera_ted do
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


procedure Tfrm_imp_adm_gera_ted.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_imp_adm_gera_ted do
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
      qry_unidade_.UnPrepare;
      qry_unidade_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_unidade_.Prepare;
      qry_unidade_.Open;
      if qry_unidade_.RecordCount > 0 then edt_nm_unid_neg.Text := qry_unidade_NM_UNID_NEG.AsString;
      qry_unidade_.Close;
    end;
  end;

end;


procedure Tfrm_imp_adm_gera_ted.Header;
begin

  // Montar o nome do Arquivo 
  cNomeTxt := cDir_Rpt + '\TE' + msk_nr_remessa.Text +'.TXT';
  // Variável global de controle do Pascal
  FileMode := 2;

  try
    AssignFile( Txt, cNomeTxt );
    ReWrite( Txt );
  except
    Mensagem.SimpleText := 'Erro na criação do Arquivo.';
    Exit
  end;

  num_seq := 1;
  Posicao := 0;
  with datm_imp_adm_gera_ted do
  begin
    qry_banco_ted_.Close;
    qry_banco_ted_.ParamByName('CD_BANCO').AsString := msk_cd_banco.Text;
    qry_banco_ted_.Prepare;
    qry_banco_ted_.Open;

    Linha := '01REMESSA11PAGTOS FORNECED';
    Linha := Linha + StrZero( ( StrToInt( qry_banco_ted_.FieldByName( 'NR_CONTA' ).AsString + qry_banco_ted_.FieldByName( 'DAC_AGENCIA' ).AsString ) ), 8 ) ;
    Linha := Linha + 'S' + Space(2);
    Write( Txt, Linha );

    Posicao := Pos( '-', qry_banco_ted_.FieldByName('CD_AGENCIA').AsString );
    if Posicao = 0 then
       Linha := StrZero( StrToInt( qry_banco_ted_.FieldByName('CD_AGENCIA').AsString ), 5 ) + '00'
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
  end;
end;

procedure Tfrm_imp_adm_gera_ted.Trailler;
begin
    num_seq := num_seq + 1;
    Linha := '9' + Space(123);
    Write( Txt, Linha );

    Linha := Copy( FormatFloat( '0000000000000.00', Total_Valor ), 1, 13 ) +
             Copy( FormatFloat( '0000000000000.00', Total_Valor ), 15, 2 );
    Linha := Linha + Space(109);
    Write( Txt, Linha );

    Linha := '000000000000000'; // somatória do campo abatimento
    Linha := Linha + Space(82);
    Linha := Linha + '000000000000000' + Space(4); // somatória do campo juros/multa
    Write( Txt, Linha );

    Linha := Copy( FormatFloat( '0000000000000.00', Total_Valor_Aut ), 1, 13 ) +
             Copy( FormatFloat( '0000000000000.00', Total_Valor_Aut ), 15, 2 );
    Linha := Linha + Space(15);
    Linha := Linha + FormatFloat( '000000', num_seq ) + #13#10;
    Write( Txt, Linha );
end;

function Tfrm_imp_adm_gera_ted.Consiste : Boolean;
var
  i : Integer;
begin
  Consiste := True;

  for i := 0 to dbgrdAdm.SelectedRows.Count - 1 do
  begin
    with datm_imp_adm_gera_ted do
    begin
      qry_favorecido_.Close;
      qry_favorecido_.ParamByName('CD_FAVORECIDO').AsString := qry_lib_adm_CD_FAVORECIDO.AsString;
      qry_favorecido_.Prepare;
      qry_favorecido_.Open;

     if ( qry_favorecido_.FieldByName('CGC_EMPRESA').AsString = '' ) or ( qry_favorecido_.FieldByName('CGC_EMPRESA').IsNull ) then
     begin
       if ( qry_favorecido_.FieldByName('CPF_EMPRESA').AsString = '' ) or ( qry_favorecido_.FieldByName('CPF_EMPRESA').IsNull ) then
       begin
         BoxMensagem( 'Fornecedor ' + qry_lib_adm_CD_FAVORECIDO.AsString +
                      ' não tem CGC/CPF cadastrado', 2 );
         Consiste := False;
         Exit;
       end;
     end;

      if ( qry_favorecido_.FieldByName('CD_BANCO').AsString = '' ) or ( qry_favorecido_.FieldByName('CD_BANCO').IsNull ) then
      begin
        BoxMensagem( 'Banco do Favorecido está vazio. ' + qry_lib_adm_CD_FAVORECIDO.AsString, 2 );
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
        BoxMensagem( 'Conta do Favorecido está vazia. ' + qry_lib_adm_CD_FAVORECIDO.AsString, 2 );
        Consiste := False;
        Exit;
      end;
      if ( qry_banco_ted_.FieldByName('CD_AGENCIA').AsString = '' ) or ( qry_banco_ted_.FieldByName('CD_AGENCIA').IsNull ) then
      begin
        BoxMensagem( 'Agência do Favorecido está vazia. ' + qry_lib_adm_CD_FAVORECIDO.AsString, 2 );
        Consiste := False;
        Exit;
      end;
    end;
  end;
end;

end.
