(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGPG023.PAS - Liberação de TED´s Administrativos

AUTOR: Leandro Stipanich

DATA: 09/10/2001

Manutenção: Leandro Stipanich

Data: 09/10/2001

*************************************************************************************************)
unit PGPG023;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, ComCtrls, DosLib, UCRPE32, Funcoes;

type
  Tfrm_lib_adm = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_sair: TMenuItem;
    btn_marca_todas: TSpeedButton;
    btn_desmarca_todas: TSpeedButton;
    dbgrdAdm: TDBGrid;
    lbl_pagto_recebto: TLabel;
    mi_liberar: TMenuItem;
    btn_liberar: TSpeedButton;
    dbgrdItensPendentes: TDBGrid;
    lbl_processos: TLabel;
    lbl_dt_base: TLabel;
    msk_dt_base: TMaskEdit;
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
    rdgrp_tp_lancamento: TRadioGroup;
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
    procedure btn_liberarClick(Sender: TObject);
    procedure msk_cd_bancoExit(Sender: TObject);
    procedure msk_cd_bancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure btn_canc_lancClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rdgrp_tp_naturezaClick(Sender: TObject);
    procedure rdgrp_tp_lancamentoClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
  private
    procedure LibAdm;
  public
    st_modificar, st_incluir, st_excluir : Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    dt_solic_ch : String[10];
    nr_proc : String[18];
    cd_unid_neg, cd_produto : String[2];
    dt_pagamento : String;
  end;

var
  frm_lib_adm : Tfrm_lib_adm;
  CancelaOperacao, Cancelado, Solicitando : Boolean;
  Txt : TextFile;
  str_cr, saida, str_extenso : string;
  Tamanho, Contador : Byte;

implementation

uses GSMLIB, PGGP001, PGGP017, PGPG024, PGSM018, PGSM041;

{$R *.DFM}

procedure Tfrm_lib_adm.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_lib_adm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_lib_adm do
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

procedure Tfrm_lib_adm.FormCreate(Sender: TObject);
begin
  CancelaOperacao := False;
  Cancelado       := False;

  st_modificar    := False;
  st_incluir      := False;
  st_excluir      := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir );

  { Cria o DataModule de Dados de Solicitação de Cheque }
  Application.CreateForm(Tdatm_lib_adm, datm_lib_adm );

  msk_dt_base.Text  := DateToStr( dt_server );

  with datm_lib_adm do
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

procedure Tfrm_lib_adm.btn_cancelarClick(Sender: TObject);
begin
  if Solicitando then CancelaOperacao := True;
  btn_desmarca_todasClick(nil);
end;

procedure Tfrm_lib_adm.Abre_Adm;
begin
  with datm_lib_adm do
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

procedure Tfrm_lib_adm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_lib_adm.btn_marca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Visible    := False;
  btn_desmarca_todas.Visible := True;
  btn_desmarca_todas.Left    := btn_marca_todas.Left;
  datm_lib_adm.qry_lib_adm_.First;
  for i := 0 to datm_lib_adm.qry_lib_adm_.RecordCount - 1 do
  begin
    dbgrdAdm.SelectedRows.CurrentRowSelected := True;
    datm_lib_adm.qry_lib_adm_.Next;
  end;
end;

procedure Tfrm_lib_adm.btn_desmarca_todasClick(Sender: TObject);
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

procedure Tfrm_lib_adm.msk_dt_baseEnter(Sender: TObject);
begin
  dt_pagamento := msk_dt_base.Text;
end;

procedure Tfrm_lib_adm.msk_dt_baseExit(Sender: TObject);
begin
  if msk_dt_base.Text = dt_pagamento then Exit;
  Abre_Adm;
end;

procedure Tfrm_lib_adm.btn_liberarClick(Sender: TObject);
begin
  if rdgrp_tp_lancamento.ItemIndex = 0 then {Cheque}
  begin
    if dbgrdAdm.SelectedRows.Count = 0 then
    begin
      BoxMensagem( 'Selecione um pagamento!', 2 );
      dbgrdAdm.SetFocus;
      Exit;
    end;

    LibAdm;
  end
  else {Nota}
  begin
    if dbgrdAdm.SelectedRows.Count = 0 then
    begin
      BoxMensagem( 'Selecione uma Nota!', 2 );
      dbgrdAdm.SetFocus;
      Exit;
    end;

    LibAdm;
  end;

  Screen.Cursor := crDefault;
  Application.ProcessMessages;
  Mensagem.SimpleText := 'Fim da emissão';

  Abre_Adm;
end;

procedure Tfrm_lib_adm.msk_cd_bancoExit(Sender: TObject);
begin
  if msk_cd_banco.Text <> '' then
  begin
    ValCodEdt( msk_cd_banco );
    with datm_lib_adm do
    begin
      qry_banco_.Close;
      qry_banco_.SQL[2] := 'WHERE CD_BANCO = "' + msk_cd_banco.Text + '"';
      qry_banco_.Prepare;
      qry_banco_.Open;
      if Not qry_banco_.EOF then
      begin
        edt_nm_banco.Text := qry_banco_NM_BANCO.AsString;
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

procedure Tfrm_lib_adm.msk_cd_bancoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_banco then btn_co_bancoClick(nil);
  end;
end;

procedure Tfrm_lib_adm.btn_co_bancoClick(Sender: TObject);
begin
  with datm_lib_adm Do
  begin
    Application.CreateForm(Tfrm_banco, frm_banco );
    with frm_banco do
    begin
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

procedure Tfrm_lib_adm.btn_canc_lancClick(Sender: TObject);
var i : Integer;
    nr_novo_lancamento : String[3];
begin
  with datm_lib_adm do
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
              qry_solic_adm_CD_STATUS_ADM.AsString := '4'; {Antes 4 - Cancelado}
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

        datm_main.db_broker.Commit;

      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        qry_solic_adm_.Cancel;
      end;

    end;
    Abre_Adm;
  end;
end;

procedure Tfrm_lib_adm.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text <> '' then
  begin
    ValCodEdt( msk_cd_unid_neg );
    with datm_lib_adm do
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

procedure Tfrm_lib_adm.FormShow(Sender: TObject);
begin
  with datm_lib_adm do
  begin
    dbgrdItensPendentes.Columns[2].FieldName                 := 'NM_CT_CONTABIL';
    qry_lib_adm_item_.FieldByName('CD_CT_CONTABIL').EditMask := '999.99.99999;0;_';
    dbgrdItensPendentes.Columns[2].Title.Caption             := 'Conta Contábil';
  end;

  rdgrp_tp_natureza.ItemIndex   := 1;
  rdgrp_tp_lancamento.ItemIndex := 0;
  msk_cd_banco.SetFocus;
end;

procedure Tfrm_lib_adm.rdgrp_tp_naturezaClick(Sender: TObject);
begin
  if rdgrp_tp_natureza.ItemIndex = 0 then
    lbl_pagto_recebto.Caption := 'Recebimentos'
  else
    lbl_pagto_recebto.Caption := 'Pagamentos';

  Abre_Adm;
end;

procedure Tfrm_lib_adm.LibAdm;
var
  i : Integer;
begin
  with datm_lib_adm do
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;

    if dbgrdAdm.SelectedRows.Count > 0 then
       TTable(dbgrdAdm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdAdm.SelectedRows[0]));
    for i := 0 to dbgrdAdm.SelectedRows.Count - 1 do
    begin
      try
        datm_main.db_broker.StartTransaction;
        qry_lib_adm_item_.First;
        while Not ( qry_lib_adm_item_.EOF ) do
        begin
          {Atualizando Número e Status do Cheque}
          if Not ( qry_solic_adm_.State in [dsEdit] ) then qry_solic_adm_.Edit;
          qry_solic_adm_CD_STATUS_ADM.AsString := '16';
          qry_solic_adm_.Post;
          qry_lib_adm_item_.Next;
        end;

        datm_main.db_broker.Commit;

      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      end;

      dbgrdAdm.SelectedRows.CurrentRowSelected := False;
      if dbgrdAdm.SelectedRows.Count > 0 then
        TTable(dbgrdAdm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdAdm.SelectedRows[0]))
      else Break;
    end;
  end;
end;

procedure Tfrm_lib_adm.rdgrp_tp_lancamentoClick(Sender: TObject);
begin
  Abre_Adm;
end;

procedure Tfrm_lib_adm.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_lib_adm do
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
