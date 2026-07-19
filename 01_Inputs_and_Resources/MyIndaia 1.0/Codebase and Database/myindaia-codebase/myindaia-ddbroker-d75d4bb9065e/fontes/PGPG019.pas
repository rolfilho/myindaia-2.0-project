(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGPG019.PAS - Emissão de Cheques Administrativos
DATA: 09/10/2001
Manutenção:
*************************************************************************************************)
unit PGPG019;
                       
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, ComCtrls, DosLib, UCRPE32, Funcoes;

type
  Tfrm_imp_adm = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_sair: TMenuItem;
    btn_marca_todas: TSpeedButton;
    btn_desmarca_todas: TSpeedButton;
    dbgrdAdm: TDBGrid;
    lbl_pagto_recebto: TLabel;
    mi_imprimir: TMenuItem;
    btn_imprimir: TSpeedButton;
    dbgrdItensPendentes: TDBGrid;
    lbl_processos: TLabel;
    lbl_dt_base: TLabel;
    msk_dt_base: TMaskEdit;
    lbl_nr_cheque_ini: TLabel;
    msk_nr_cheque: TMaskEdit;
    lbl_banco: TLabel;
    btn_co_banco: TSpeedButton;
    msk_cd_banco: TMaskEdit;
    edt_nm_banco: TEdit;
    Mensagem: TStatusBar;
    btn_canc_lanc: TSpeedButton;
    Label1: TLabel;
    btn_co_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    rdgrp_tp_natureza: TRadioGroup;
    crp_nota: TCrpe;
    rdgrp_tp_lancamento: TRadioGroup;
    lbl_dt_pagto: TLabel;
    msk_dt_pagto: TMaskEdit;
    lbl_nr_nota: TLabel;
    msk_nr_nota: TMaskEdit;
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
    procedure msk_nr_chequeExit(Sender: TObject);
    procedure msk_dt_pagtoExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
  private
    nr_docto_nota : String[6];
    nr_ult_nota : String[6];
    nr_ult_nota_fat : String[6];
    nr_ult_nota_adm : String[6];
    str_nm_cidade_cheque : String[30];

    procedure ImpCheque;
    procedure ImpNota;
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
  frm_imp_adm : Tfrm_imp_adm;
  CancelaOperacao, Cancelado, Solicitando : Boolean;
  Txt : TextFile;
  str_cr, saida, str_extenso : string;
  Tamanho, Contador : Byte;
  Nr_cheque : Longint;

implementation

uses GSMLIB, PGGP001, PGGP017, PGPG020, PGSM018, PGSM041;

{$R *.DFM}

procedure Tfrm_imp_adm.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_imp_adm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_imp_adm do
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
  crp_nota.Free;
  Action := caFree;
end;

procedure Tfrm_imp_adm.FormCreate(Sender: TObject);
begin
  CancelaOperacao := False;
  Cancelado       := False;

  st_modificar    := False;
  st_incluir      := False;
  st_excluir      := False;
                                                        
  AtribuiDireitos( st_modificar, st_incluir, st_excluir );
  btn_canc_lanc.Enabled := st_excluir; //Rodrigo Capra

  // Cria o DataModule de Dados de Solicitação de Cheque 
  Application.CreateForm(Tdatm_imp_adm, datm_imp_adm );

  msk_dt_base.Text  := DateToStr( dt_server );
  msk_dt_pagto.Text := DateToStr( dt_server );

  with datm_imp_adm do
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

procedure Tfrm_imp_adm.btn_cancelarClick(Sender: TObject);
begin
  if Solicitando then CancelaOperacao := True;
  btn_desmarca_todasClick(nil);
end;

procedure Tfrm_imp_adm.Abre_Adm;
begin
  with datm_imp_adm do
  begin
    if msk_dt_base.Text = '  /  /    ' then Exit;

    qry_lib_adm_.Close;
    qry_lib_adm_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
    qry_lib_adm_.ParamByName('DT_MONTAGEM').AsDate      := StrToDate( msk_dt_base.Text );
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

procedure Tfrm_imp_adm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_imp_adm.btn_marca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Visible    := False;
  btn_desmarca_todas.Visible := True;
  btn_desmarca_todas.Left    := btn_marca_todas.Left;
  datm_imp_adm.qry_lib_adm_.First;
  for i := 0 to datm_imp_adm.qry_lib_adm_.RecordCount - 1 do
  begin
    dbgrdAdm.SelectedRows.CurrentRowSelected := True;
    datm_imp_adm.qry_lib_adm_.Next;
  end;
end;

procedure Tfrm_imp_adm.btn_desmarca_todasClick(Sender: TObject);
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

procedure Tfrm_imp_adm.msk_dt_baseEnter(Sender: TObject);
begin
  dt_pagamento := msk_dt_base.Text;
end;

procedure Tfrm_imp_adm.msk_dt_baseExit(Sender: TObject);
begin
  if msk_dt_base.Text = dt_pagamento then Exit;
  Abre_Adm;
end;

procedure Tfrm_imp_adm.btn_imprimirClick(Sender: TObject);
begin
  if rdgrp_tp_lancamento.ItemIndex = 0 then //Cheque
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

    if Trim( msk_nr_cheque.Text ) = '' then
    begin
      BoxMensagem( 'Selecione o nº inicial do cheque!', 3 );
      msk_nr_cheque.SetFocus;
      Exit;
    end;

    with datm_imp_adm do
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

    ImpCheque;
  end
  else //Nota
  begin
    if dbgrdAdm.SelectedRows.Count = 0 then
    begin
      BoxMensagem( 'Selecione uma Nota!', 2 );
      dbgrdAdm.SetFocus;
      Exit;
    end;

    if ( Trim( nr_docto_nota ) = '' ) then
    begin
      BoxMensagem( 'Informe um número de Nota', 2 );
      dbgrdAdm.SetFocus;
      Exit;
    end;

    with datm_imp_adm do
    begin
      qry_ult_nota_fat_.Close;
      qry_ult_nota_fat_.Prepare;
      qry_ult_nota_fat_.Open;
      if Not qry_ult_nota_fat_.EOF then
         nr_ult_nota_fat := IntToStr( StrToInt( qry_ult_nota_fat_NR_NOTA_FAT.AsString ) )
      else
         nr_ult_nota_fat := '';
      qry_ult_nota_fat_.Close;

      qry_ult_nota_adm_.Close;
      qry_ult_nota_adm_.Prepare;
      qry_ult_nota_adm_.Open;
      if Not qry_ult_nota_adm_.EOF then
         nr_ult_nota_adm := IntToStr( StrToInt( qry_ult_nota_adm_NR_NOTA_ADM.AsString ) )
      else
         nr_ult_nota_adm := '';
      qry_ult_nota_adm_.Close;

      if ( nr_ult_nota > nr_ult_nota_fat ) and ( nr_ult_nota > nr_ult_nota_adm ) then
         nr_docto_nota := nr_ult_nota
      else if ( nr_ult_nota_fat > nr_ult_nota ) and ( nr_ult_nota_fat > nr_ult_nota_adm ) then
         nr_docto_nota := nr_ult_nota_fat
      else
         nr_docto_nota := nr_ult_nota_adm;

      if ( Trim( nr_docto_nota ) <> '' ) then nr_docto_nota := IntToStr( StrToInt( nr_docto_nota ) + 1 );
      nr_docto_nota := Replicate( '0' , 6 - Length( Trim( nr_docto_nota ) ) ) + Trim( nr_docto_nota );

      if nr_docto_nota <> msk_nr_nota.Text then
      begin
        if Not BoxMensagem( 'Nº da última Nota diferente do informado para impressão!' + #13#10 + 'Continua?' , 1 ) then
        begin
          dbgrdAdm.SetFocus;
          Exit;
        end;
      end;

      if msk_dt_pagto.Text <> msk_dt_base.Text then
      begin
        if Not BoxMensagem( 'Data Pagto diferente da Data Base!' + #13#10 + 'Continua?' , 1 ) then
        begin
          dbgrdAdm.SetFocus;
          Exit;
        end;
      end;
    end;

    ImpNota;
  end;

  Screen.Cursor := crDefault;
  Application.ProcessMessages;
  Mensagem.SimpleText := 'Fim da emissão';
  Abre_Adm;
end;

procedure Tfrm_imp_adm.msk_cd_bancoExit(Sender: TObject);
begin
  if msk_cd_banco.Text <> '' then
  begin
    ValCodEdt( msk_cd_banco );
    with datm_imp_adm do
    begin
      qry_banco_.Close;
      qry_banco_.SQL[2] := 'WHERE CD_BANCO = "' + msk_cd_banco.Text + '"';
      qry_banco_.Prepare;
      qry_banco_.Open;
      if Not qry_banco_.EOF then
      begin
        edt_nm_banco.Text := qry_banco_NM_BANCO.AsString;
        if qry_banco_NR_CHEQUE.AsString <> '' then
        begin
          msk_nr_cheque.Text := StrZero( ( StrToInt( qry_banco_NR_CHEQUE.AsString ) + 1 ), 6 );
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

procedure Tfrm_imp_adm.msk_cd_bancoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_cd_banco then btn_co_bancoClick(nil);
  end;
end;

procedure Tfrm_imp_adm.btn_co_bancoClick(Sender: TObject);
begin
  with datm_imp_adm Do
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

procedure Tfrm_imp_adm.Dados(Copia : Boolean);
begin
  try
    with datm_imp_adm do
    begin
      // Inicializa
      // ESC @ ESC x n ESC M EXP ESC C 0 n ESC 0 ESC (  t  3 0 1 25 0 ESC t  1
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
               FormatFloat('###,###,###,##0.00', qry_lib_adm_VL_LANCTO.AsFloat );
      saida := saida + SaltaLinhas(qry_banco_LEXTENSO.AsInteger - qry_banco_LVALOR.AsInteger);
      Write( Txt, saida );
      //Extenso
      //Determinando tamanho máximo do extenso
      str_extenso := Extenso(qry_lib_adm_VL_LANCTO.AsFloat);
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
               UpperCase(qry_lib_adm_NM_FAVORECIDO.AsString);
      saida := saida + SaltaLinhas(qry_banco_LCIDADE.AsInteger - qry_banco_LFAVOR.AsInteger);
      Write( Txt, Saida );

      //Cidade + '  ' + Dia + ' ' + Mes + ' ' + Ano
      str_nm_cidade_cheque := qry_lib_adm_item_END_CIDADE.AsString;

      saida := Space( qry_banco_CCIDADE.AsInteger ) +
               UpperCase(Trim( str_nm_cidade_cheque ) ) +
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
                 qry_solic_adm_NR_DOCTO.AsString +
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
    datm_imp_adm.qry_solic_adm_.Close;
    CloseFile( Txt );
    Exit
  end;
end;

procedure Tfrm_imp_adm.btn_canc_lancClick(Sender: TObject);
var i : Integer;
    nr_novo_lancamento : String[3];
begin
  with datm_imp_adm do
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
              qry_solic_adm_CD_STATUS_ADM.AsString := '4'; //Antes 4 - Cancelado
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
        sp_distribui_adminis.ParamByName('@dt_pagto').AsDateTime  := qry_lib_adm_DT_MONTAGEM.AsDateTime;
        sp_distribui_adminis.ParamByName('@dt_canc').AsDateTime   := dt_server;
        sp_distribui_adminis.ParamByName('@nr_ref').AsString      := qry_lib_adm_NR_REF.AsString;
        sp_distribui_adminis.ParamByName('@tp_natureza').AsString := qry_lib_adm_TP_NATUREZA.AsString;
        ExecStoredProc( sp_distribui_adminis );
        CloseStoredProc( sp_distribui_adminis );

        (* Antiga sp de cancelamento
        CloseStoredProc( sp_distribui_adm );
        sp_distribui_adm.ParamByName('@cd_unid_neg').AsString := qry_lib_adm_CD_UNID_NEG.AsString;
        sp_distribui_adm.ParamByName('@dt_pagto').AsDateTime  := qry_lib_adm_DT_MONTAGEM.AsDateTime;  //rodrigo
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

procedure Tfrm_imp_adm.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text <> '' then
  begin
    ValCodEdt( msk_cd_unid_neg );
    with datm_imp_adm do
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

procedure Tfrm_imp_adm.FormShow(Sender: TObject);
begin
  //Carrega nº da nota administrativa
  with datm_imp_adm do
  begin
    qry_ult_nota_fat_.Close;
    qry_ult_nota_fat_.Prepare;
    qry_ult_nota_fat_.Open;
    if Not qry_ult_nota_fat_.EOF then
       nr_ult_nota_fat := IntToStr( StrToInt( qry_ult_nota_fat_NR_NOTA_FAT.AsString ) )
    else
       nr_ult_nota_fat := '';
    qry_ult_nota_fat_.Close;

    qry_ult_nota_adm_.Close;
    qry_ult_nota_adm_.Prepare;
    qry_ult_nota_adm_.Open;
    if Not qry_ult_nota_adm_.EOF then
       nr_ult_nota_adm := IntToStr( StrToInt( qry_ult_nota_adm_NR_NOTA_ADM.AsString ) )
    else
       nr_ult_nota_adm := '';
    qry_ult_nota_adm_.Close;

    if ( nr_ult_nota > nr_ult_nota_fat ) and ( nr_ult_nota > nr_ult_nota_adm ) then
       nr_docto_nota := nr_ult_nota
    else if ( nr_ult_nota_fat > nr_ult_nota ) and ( nr_ult_nota_fat > nr_ult_nota_adm ) then
       nr_docto_nota := nr_ult_nota_fat
    else
       nr_docto_nota := nr_ult_nota_adm;

    if ( Trim( nr_docto_nota ) <> '' ) then nr_docto_nota := IntToStr( StrToInt( nr_docto_nota ) + 1 );
    nr_docto_nota := Replicate( '0' , 6 - Length( Trim( nr_docto_nota ) ) ) + Trim( nr_docto_nota );

    msk_nr_nota.Text := nr_docto_nota;

    dbgrdItensPendentes.Columns[2].FieldName := 'NM_CT_CONTABIL';
    qry_lib_adm_item_.FieldByName('CD_CT_CONTABIL').EditMask := '999.99.99999;0;_';
    dbgrdItensPendentes.Columns[2].Title.Caption := 'Conta Contábil';
  end;

  rdgrp_tp_natureza.ItemIndex   := 1;
  rdgrp_tp_lancamento.ItemIndex := 0;
  msk_cd_banco.SetFocus;
end;

procedure Tfrm_imp_adm.rdgrp_tp_naturezaClick(Sender: TObject);
begin
  if rdgrp_tp_natureza.ItemIndex = 0 then
    lbl_pagto_recebto.Caption := 'Recebimentos'
  else
    lbl_pagto_recebto.Caption := 'Pagamentos';
  Abre_Adm;
end;


procedure Tfrm_imp_adm.ImpCheque;
var
  cNomeTxt : String;
  cd_banco: String[3];
  i : Integer;
begin
  with datm_imp_adm do
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
        BoxMensagem('Existe mais de um Banco selecionado!' + #13#10 +
                    'Não será possível gerar Pagamento!', 2);
        Exit;
      end;
    end;

    Mensagem.SimpleText := 'Gerando Arquivo de Cheques...';
    Screen.Cursor       := crHourGlass;
    Application.ProcessMessages;

    Nr_cheque := StrToInt(msk_nr_cheque.Text);
    str_cr := #13#10;

    if dbgrdAdm.SelectedRows.Count > 0 then
       TTable(dbgrdAdm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdAdm.SelectedRows[0]));
    for i := 0 to dbgrdAdm.SelectedRows.Count - 1 do
    begin
      if Not qry_banco_FORMCONT.AsBoolean then
      begin
        BoxMensagem( 'Prepare o Cheque nº ' + FormatFloat( '000000', Nr_cheque), 3 );
      end;

      // Montar o nome do Arquivo
      cNomeTxt := cDir_Risc + '\CHEQUE.TXT';
      // Variável global de controle do Pascal
      FileMode := 2;
      try
        AssignFile( Txt, cNomeTxt );
        ReWrite( Txt );
      except
        Mensagem.SimpleText := 'Erro na criação do Arquivo.';
        Exit;
      end;
      Dados(False);
      try
        datm_main.db_broker.StartTransaction;
        // Reemissão
        if ( Trim( qry_lib_adm_NR_DOCTO.AsString ) <> Trim ( FormatFloat('000000', Nr_cheque) ) ) and
           ( Trim( qry_lib_adm_NR_DOCTO.AsString ) <> '' ) and
           ( StrToInt( qry_lib_adm_CD_STATUS_CHEQUE.AsString ) in [1, 2] ) then
        begin
          CloseStoredProc( sp_reemite_cheque_adm );
          sp_reemite_cheque_adm.ParamByName('@cd_unid_neg').AsString    := qry_lib_adm_CD_UNID_NEG.AsString;
          sp_reemite_cheque_adm.ParamByName('@nr_ref').AsString         := datm_imp_adm.qry_lib_adm_NR_REF.AsString;
          sp_reemite_cheque_adm.ParamByName('@dt_base').AsDateTime      := StrToDate( msk_dt_base.Text );
          sp_reemite_cheque_adm.ParamByName('@dt_pagto').AsDateTime     := StrToDate( msk_dt_pagto.Text );
          sp_reemite_cheque_adm.ParamByName('@nr_novo_cheque').AsString := FormatFloat('000000', Nr_cheque);
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
            qry_solic_adm_NR_DOCTO.AsString            := FormatFloat( '000000', Nr_cheque );

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
          sp_distribui_adm.ParamByName('@tp_natureza').AsString := qry_lib_adm_TP_NATUREZA.AsString;
//          ExecStoredProc( sp_distribui_adm );
//          CloseStoredProc( sp_distribui_adm );
//          qry_ult_ref_.Close;
   
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
          ExecStoredProc( sp_distribui_adm );
          CloseStoredProc( sp_distribui_adm );
          qry_ult_ref_.Close;
        end;

        if Not ( qry_banco_.State in [dsInsert, dsEdit] ) then qry_banco_.Edit;
        qry_banco_NR_CHEQUE.AsString := StrZero( Nr_cheque, 6 );
        qry_banco_.Post;

        datm_main.db_broker.Commit;

        Nr_cheque := Nr_cheque + 1;
      except
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;
      end;

      // Se não possuir formulário contínuo com cópias carbonadas, emitir a folha de
      // cópia de Cheque da S. Magalhães
      if Not qry_banco_FORMCONT.AsBoolean then
      begin
        Dados(True);
      end;

      CloseFile( Txt );  

      Mensagem.SimpleText := 'Arquivo gerado com sucesso.';
      CopyFileLpt1( cNomeTxt, 'LPT1' );

      dbgrdAdm.SelectedRows.CurrentRowSelected := False;
      if dbgrdAdm.SelectedRows.Count > 0 then
        TTable(dbgrdAdm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdAdm.SelectedRows[0]))
      else Break;
    end;
    msk_nr_cheque.Text := StrZero( ( Nr_cheque ), 6 );
  end;
end;

procedure Tfrm_imp_adm.ImpNota;
var
  i : Byte;
  in_soma : Boolean;
begin
  with datm_imp_adm do
  begin
    in_soma := False;
    if dbgrdAdm.SelectedRows.Count > 0 then
       TTable(dbgrdAdm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdAdm.SelectedRows[0]));
    for i := 0 to dbgrdAdm.SelectedRows.Count - 1 do
    begin
      qry_lib_adm_item_.First;
      while Not qry_lib_adm_item_.EOF do
      begin
        qry_solic_adm_.Close;
        qry_solic_adm_.Prepare;
        qry_solic_adm_.Open;
        if Not qry_solic_adm_.EOF then
        begin
          try
            datm_main.db_broker.StartTransaction;
            if Not ( qry_solic_adm_.State in [dsInsert, dsEdit] ) then qry_solic_adm_.Edit;
            qry_solic_adm_CD_USUARIO_IMP.AsString := str_cd_usuario;
            if qry_solic_adm_TP_NATUREZA.AsString = 'C' then
               qry_solic_adm_CD_STATUS_ADM.AsString  := '18'
            else
               qry_solic_adm_CD_STATUS_ADM.AsString  := '7';

            qry_solic_adm_DT_PAGTO.AsDateTime := StrToDate( msk_dt_pagto.Text );
            if Trim( qry_solic_adm_NR_DOCTO.AsString ) = '' then
            begin
               in_soma := True;
               qry_solic_adm_NR_DOCTO.AsString := nr_docto_nota;
            end;

            qry_solic_adm_.Post;
            datm_main.db_broker.Commit;
          except
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            qry_solic_adm_.Cancel;
          end;
        end;
        qry_lib_adm_item_.Next;
      end;

      if in_soma then
      begin
        nr_docto_nota := IntToStr( StrToInt( nr_docto_nota ) + 1 );
        nr_docto_nota := Replicate( '0' , 6 - Length( Trim( nr_docto_nota ) ) ) + Trim( nr_docto_nota );
        msk_nr_nota.Text := nr_docto_nota;
      end;

      CloseStoredProc( sp_distribui_adm );
      sp_distribui_adm.ParamByName('@cd_unid_neg').AsString := qry_lib_adm_CD_UNID_NEG.AsString;
      sp_distribui_adm.ParamByName('@dt_pagto').AsDateTime  := StrToDate( msk_dt_pagto.Text );
      sp_distribui_adm.ParamByName('@nr_ref').AsString      := qry_lib_adm_NR_REF.AsString;
      sp_distribui_adm.ParamByName('@tp_natureza').AsString := qry_lib_adm_TP_NATUREZA.AsString;
      ExecStoredProc( sp_distribui_adm );
      CloseStoredProc( sp_distribui_adm );

      dbgrdAdm.SelectedRows.CurrentRowSelected := False;
      if dbgrdAdm.SelectedRows.Count > 0 then
        TTable(dbgrdAdm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdAdm.SelectedRows[0]))
      else Break;
    end;
  end;

  Screen.Cursor := crHourGlass;
  with crp_nota do
  begin
    Connect     := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
    ReportName  := cDir_Rpt + '\CRFI011.RPT';
    Formulas[0] := 'Usuario = "'+ str_cd_usuario + '"';
    Formulas[1] := 'Unidade = "'+ msk_cd_unid_neg.Text + '"';
    Execute;
  end;

  try
    datm_main.db_broker.StartTransaction;
    datm_imp_adm.qry_limpa_usuario_.Close;
    datm_imp_adm.qry_limpa_usuario_.ParamByName('CD_USUARIO_IMP').AsString := str_cd_usuario;
    datm_imp_adm.qry_limpa_usuario_.Prepare;
    datm_imp_adm.qry_limpa_usuario_.ExecSQL;
    datm_main.db_broker.Commit;
  except
    if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
  end;

  Screen.Cursor := crArrow;
end;

procedure Tfrm_imp_adm.rdgrp_tp_lancamentoClick(Sender: TObject);
begin
  if rdgrp_tp_lancamento.ItemIndex = 0 then // Cheque
  begin
    lbl_nr_cheque_ini.Visible := True;
    msk_nr_cheque.Visible     := True;
    lbl_nr_nota.Visible       := False;
    msk_nr_nota.Visible       := False;
  end
  else // Notas
  begin
    lbl_nr_cheque_ini.Visible := False;
    msk_nr_cheque.Visible     := False;
    lbl_nr_nota.Visible       := True;
    msk_nr_nota.Visible       := True;
  end;
  Abre_Adm;
end;

procedure Tfrm_imp_adm.msk_nr_chequeExit(Sender: TObject);
begin
  if Trim( msk_nr_cheque.Text ) <> '' then
     msk_nr_cheque.Text := StrZero( StrToInt( msk_nr_cheque.Text ), 6 );
end;

procedure Tfrm_imp_adm.msk_dt_pagtoExit(Sender: TObject);
begin
  with datm_imp_adm do
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


procedure Tfrm_imp_adm.btn_co_unid_negClick(Sender: TObject);
begin

  with datm_imp_adm do
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

end.
