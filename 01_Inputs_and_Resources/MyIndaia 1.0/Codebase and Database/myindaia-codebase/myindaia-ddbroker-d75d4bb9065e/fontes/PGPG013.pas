unit PGPG013;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, ComCtrls, Funcoes;

type
  Tfrm_monta_adm = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvgAdm: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    btn_montar: TSpeedButton;
    btn_desmarca_todas: TSpeedButton;
    btn_marca_todas: TSpeedButton;
    btn_canc_lanc: TSpeedButton;
    pgctrl_monta_adm: TPageControl;
    ts_favorecido: TTabSheet;
    lbl_banco: TLabel;
    btn_co_banco: TSpeedButton;
    lbl_favorecido: TLabel;
    btn_co_favorecido: TSpeedButton;
    msk_cd_banco: TMaskEdit;
    edt_nm_banco: TEdit;
    msk_cd_favorecido: TMaskEdit;
    edt_nm_favorecido: TEdit;
    ts_pagto: TTabSheet;
    lbl_pagto: TLabel;
    dbgrdRefPagtos: TDBGrid;
    dbgrdRefPagtosItens: TDBGrid;
    msk_dt_pagto: TMaskEdit;
    ts_recebto: TTabSheet;
    Label2: TLabel;
    msk_dt_recebto: TMaskEdit;
    dbgrdRefRecebto: TDBGrid;
    dbgrdRefRecebtosItens: TDBGrid;
    btn_co_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    Label3: TLabel;
    mi_montar: TMenuItem;
    lbl_dt_termino: TLabel;
    msk_dt_inicio: TMaskEdit;
    msk_dt_termino: TMaskEdit;
    lbl_dt_inicio: TLabel;
    pgctrl_monta_adm2: TPageControl;
    ts_lista: TTabSheet;
    ts_adm: TTabSheet;
    pnl_por_favorecido: TPanel;
    lbl_valor2: TLabel;
    lbl_status2: TLabel;
    lbl_dt_vencto: TLabel;
    lbl_dt_lancto: TLabel;
    lbl_acesso: TLabel;
    lbl_aux: TLabel;
    lbl_ct_contabil: TLabel;
    btn_co_ct_contabil: TSpeedButton;
    lbl_dt_pagto: TLabel;
    lbl_historico: TLabel;
    btn_co_historico: TSpeedButton;
    lbl_desconto: TLabel;
    lbl_perc_desconto: TLabel;
    lbl_vl_total: TLabel;
    dbedt_vl_pagto: TDBEdit;
    dbedt_dt_vencto: TDBEdit;
    dbedt_cd_status2: TDBEdit;
    dbedt_dt_lancto: TDBEdit;
    dbrdgrp_natureza: TDBRadioGroup;
    dbedt_cd_acesso: TDBEdit;
    dbedt_cd_aux: TDBEdit;
    dbedt_cd_ct_contabil: TDBEdit;
    dbedt_nm_ct_contabil: TDBEdit;
    dbedt_dt_pagto: TDBEdit;
    dbedt_cd_historico: TDBEdit;
    dbedt_nm_historico: TDBEdit;
    dbedt_vl_desconto: TDBEdit;
    dbedt_vl_perc_desconto: TDBEdit;
    dbedt_vl_total: TDBEdit;
    dbgrdMontaAdm: TDBGrid;
    dbm_tx_historico: TDBMemo;
    pnl_natureza: TPanel;
    rbtn_debito: TRadioButton;
    rbtn_credito: TRadioButton;
    lbl_nr_lancamento: TLabel;
    dbedt_nr_lancamento: TDBEdit;
    dbrdgrp_tp_lancamento: TDBRadioGroup;
    pnl_lancamento: TPanel;
    rbtn_nota: TRadioButton;
    rbtn_cheque: TRadioButton;
    lbl_total: TLabel;
    dbtxt_vl_total: TDBText;
    lbl_tot_selecionado: TLabel;
    lbl_vl_tot_selec: TLabel;
    Label1: TLabel;
    msk_cd_unid_neg_pagto: TMaskEdit;
    edt_nm_unid_neg_pagto: TEdit;
    btn_co_unid_neg_pagto: TSpeedButton;
    Label4: TLabel;
    msk_cd_unid_neg_recebto: TMaskEdit;
    edt_nm_unid_neg_recebto: TEdit;
    btn_co_unid_neg_recebto: TSpeedButton;
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure dbnvgAdmBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure dbedt_cd_bancoExit(Sender: TObject);
    procedure dbedt_cd_favorecidoExit(Sender: TObject);
    procedure dbedt_cd_destinoExit(Sender: TObject);
    procedure dbedt_cd_despachanteExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure Abre_Adm;
    procedure Abre_Pagtos;
    procedure Abre_Recebtos;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure dbedt_cd_calculoExit(Sender: TObject);
    procedure btn_montarClick(Sender: TObject);
    procedure msk_cd_bancoEnter(Sender: TObject);
    procedure msk_cd_favorecidoEnter(Sender: TObject);
    procedure msk_cd_bancoExit(Sender: TObject);
    procedure msk_cd_favorecidoExit(Sender: TObject);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure btn_co_favorecidoClick(Sender: TObject);
    procedure btn_marca_todasClick(Sender: TObject);
    procedure btn_desmarca_todasClick(Sender: TObject);
    procedure msk_dt_pagtoEnter(Sender: TObject);
    procedure msk_dt_pagtoExit(Sender: TObject);
    procedure pgctrl_monta_admChange(Sender: TObject);
    procedure btn_canc_lancClick(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_ct_contabilClick(Sender: TObject);
    procedure dbedt_cd_acessoChange(Sender: TObject);
    procedure msk_dt_recebtoEnter(Sender: TObject);
    procedure msk_dt_recebtoExit(Sender: TObject);
    procedure dbedt_cd_ct_contabilExit(Sender: TObject);
    procedure dbedt_cd_acessoEnter(Sender: TObject);
    procedure dbedt_cd_acessoExit(Sender: TObject);
    procedure dbedt_cd_auxEnter(Sender: TObject);
    procedure dbedt_cd_auxExit(Sender: TObject);
    procedure dbedt_cd_historicoExit(Sender: TObject);
    procedure btn_co_historicoClick(Sender: TObject);
    procedure msk_dt_inicioExit(Sender: TObject);
    procedure msk_dt_terminoExit(Sender: TObject);
    procedure msk_dt_inicioEnter(Sender: TObject);
    procedure msk_dt_terminoEnter(Sender: TObject);
    procedure dbedt_vl_pagtoEnter(Sender: TObject);
    procedure dbedt_vl_descontoEnter(Sender: TObject);
    procedure dbedt_vl_perc_descontoEnter(Sender: TObject);
    procedure dbedt_vl_pagtoExit(Sender: TObject);
    procedure dbedt_vl_descontoExit(Sender: TObject);
    procedure dbedt_vl_perc_descontoExit(Sender: TObject);
    procedure pgctrl_monta_adm2Change(Sender: TObject);
    procedure rbtn_creditoClick(Sender: TObject);
    procedure rbtn_debitoClick(Sender: TObject);
    procedure rbtn_chequeClick(Sender: TObject);
    procedure rbtn_notaClick(Sender: TObject);
    procedure dbgrdMontaAdmCellClick(Column: TColumn);
    procedure dbgrdMontaAdmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdMontaAdmKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_unid_neg_pagtoEnter(Sender: TObject);
    procedure msk_cd_unid_neg_recebtoEnter(Sender: TObject);
    procedure msk_cd_unid_neg_pagtoExit(Sender: TObject);
    procedure msk_cd_unid_neg_recebtoExit(Sender: TObject);
    procedure btn_co_unid_neg_pagtoClick(Sender: TObject);
    procedure btn_co_unid_neg_recebtoClick(Sender: TObject);
  private
    str_vl_pagto, str_vl_desconto, str_vl_perc_desconto, st_modulo, st_rotina : String;
    cd_acesso, cd_aux : String[1];
    dt_inicio, dt_termino : TDate;
    str_dt_inicio, str_dt_termino : String;
    hm_para_solic_ch : String[5];
    function Consiste : Boolean;
    function Grava    : Boolean;
    function VerAlt   : Boolean;
    procedure Cancelar;
    procedure TotSelecAdm;
  public
    lNaoConsiste, st_modificar, st_incluir, st_excluir : Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    dt_solic_ch : String[10];
    nr_proc : String[18];
    cd_destino : String[4];
    cd_banco : String[3];
    cd_favorecido : String[5];
    dt_pagamento, dt_recebimento : String;
    vl_tot_selec : Double;
  end;

var
  frm_monta_adm : Tfrm_monta_adm;
  CancelaOperacao, Cancelado, Marcando : Boolean;
  cd_unid_neg, cd_unid_neg_pagto, cd_unid_neg_recebto, cd_produto : String[2];
  nr_ref         : String[10];
  cd_ct_contabil : String[10];
  dt_lancto      : TDateTime;
  nr_lancamento  : String[3];
  tp_natureza    : String[1];
  tp_lancamento  : String[1];

implementation

uses GSMLIB, PGGP001, PGGP017, PGSM010, PGSM018, PGSM041, PGSM059, PGSM090,
     PGGP015, PGPG014, PGSM168, PGSM174;

{$R *.DFM}

procedure Tfrm_monta_adm.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_monta_adm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_monta_adm do
    begin
      qry_status_solic_adm_.Close;
      tbl_yesno_.Close;

      qry_param_.Close;
      qry_ct_contabil_.Close;
      qry_unid_neg_.Close;
      qry_favorecido_.Close;
      qry_banco_.Close;
      qry_monta_adm_.Close;
      Free;
    end;
    Action := caFree;
  end
  else
    Action := caNone;
end;

procedure Tfrm_monta_adm.FormCreate(Sender: TObject);
begin
  CancelaOperacao := False;
  Cancelado       := False;

  st_modulo    := vStr_cd_modulo;
  st_rotina    := str_cd_rotina;

  st_modificar    := False;
  st_incluir      := False;
  st_excluir      := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir );

  // Cria o DataModule de Dados de Solicitação de Cheque 
  Application.CreateForm(Tdatm_monta_adm, datm_monta_adm );

  msk_dt_pagto.Text   := DateToStr( dt_server );
  msk_dt_recebto.Text := DateToStr( dt_server );
  msk_dt_inicio.Text  := DateToStr( dt_server );
  msk_dt_termino.Text := DateToStr( dt_server );

  with datm_monta_adm do
  begin
    qry_status_solic_adm_.Close;
    qry_status_solic_adm_.Prepare;
    qry_status_solic_adm_.Open;
    tbl_yesno_.Open;

    qry_ct_contabilRM_.Close;
    qry_ct_contabilRM_.Prepare;
    qry_ct_contabilRM_.Open;

    qry_param_.Close;
    qry_param_.Prepare;
    qry_param_.Open;
    // Acesso
    lbl_acesso.Visible                      := True;
    dbedt_cd_acesso.Visible                 := True;
    // Aux
    lbl_aux.Visible                         := True;
    dbedt_cd_aux.Visible                    := True;
    // Conta Contábil
    dbedt_nm_ct_contabil.DataField          := 'LookCtContabil';
    qry_grd_adm_.FieldByName('CD_CT_CONTABIL').EditMask           := '999.99.99999;0;_';
    qry_monta_adm_.FieldByName('CD_CT_CONTABIL').EditMask         := '999.99.99999;0;_';
    qry_ref_pagto_itens_.FieldByName('CD_CT_CONTABIL').EditMask   := '999.99.99999;0;_';
    qry_ref_recebto_itens_.FieldByName('CD_CT_CONTABIL').EditMask := '999.99.99999;0;_';

    hm_para_solic_ch := qry_param_HM_PARA_SOLIC_CH.AsString;

    if Trim(hm_para_solic_ch) = '' then
    begin
      BoxMensagem('Atenção! Problemas com tabela de parâmetros!' + #13#10 +
                  'Não tente incluir Solicitação Administrativa. Contate o CPD!', 2);
    end;

    qry_ct_contabil_.Close;
    qry_ct_contabil_.Prepare;
    qry_ct_contabil_.Open;

    qry_processo_.Close;
    qry_processo_.Prepare;
    qry_processo_.Open;

    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;

    qry_servico_.Close;
    qry_servico_.Prepare;
    qry_servico_.Open;

    qry_emp_nac_.Close;
    qry_emp_nac_.Prepare;
    qry_emp_nac_.Open;

    qry_monta_adm_.Close;
    Abre_Adm;
  end;

  btn_mi( st_incluir, False, False, st_excluir );

  pgctrl_monta_adm2.ActivePage := ts_lista;

end;

procedure Tfrm_monta_adm.FormShow(Sender: TObject);
begin
  lNaoConsiste := False;
  pgctrl_monta_adm.ActivePage := ts_favorecido;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_unid_neg_pagto.Text := str_cd_unid_neg;
  msk_cd_unid_neg_pagtoExit(nil);
  msk_cd_unid_neg_recebto.Text := str_cd_unid_neg;
  msk_cd_unid_neg_recebtoExit(nil);
  msk_cd_favorecido.SetFocus;

  // Cancela Cheque
  with datm_monta_adm do
  begin
    if qry_param_IN_CANC_CH_ADM.Value = '0' then
    begin
      btn_cancelar.Visible := False;
      mi_cancelar.Visible  := False;
    end;

    dbgrdMontaAdm.Columns[1].FieldName             := 'LookCtContabil';
    dbgrdRefPagtosItens.Columns[1].FieldName       := 'LookCtContabil';
    dbgrdRefRecebtosItens.Columns[1].FieldName     := 'LookCtContabil';
    dbgrdMontaAdm.Columns[1].Title.Caption         := 'Conta Contábil';
    dbgrdRefPagtosItens.Columns[1].Title.Caption   := 'Conta Contábil';
    dbgrdRefRecebtosItens.Columns[1].Title.Caption := 'Conta Contábil';
  end;
end;

procedure Tfrm_monta_adm.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
  btn_salvar.Enabled   := False;
  mi_salvar.Enabled    := False;
  btn_cancelar.Enabled := False;
  mi_cancelar.Enabled  := False;
  if Marcando then CancelaOperacao := True;
end;

procedure Tfrm_monta_adm.Cancelar;
begin
  try
    if datm_monta_adm.qry_monta_adm_.State in [dsInsert, dsEdit] then
    begin
      datm_monta_adm.qry_monta_adm_.Cancel;
      msk_cd_favorecido.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
end;

procedure Tfrm_monta_adm.btn_salvarClick(Sender: TObject);
begin
  pnl_cadastro.SetFocus;
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
  btn_desmarca_todasClick(nil);
end;

function Tfrm_monta_adm.Consiste : Boolean;
begin
  Consiste := True;

  if pgctrl_monta_adm.ActivePage = ts_favorecido then
  begin
    if Not lNaoConsiste then
    begin
      // Conta Contábil
      if ( Trim( dbedt_cd_ct_contabil.Text ) = '' ) then
      begin
        BoxMensagem('Campo Conta Contábil deve ser preenchido!', 2);
        pgctrl_monta_adm.ActivePage := ts_favorecido;
        pgctrl_monta_adm2.ActivePage := ts_adm;
        dbedt_cd_ct_contabil.SetFocus;
        Consiste := False;
        Exit;
      end;

      // Valor
      if ( datm_monta_adm.qry_monta_adm_VL_LANCTO.AsFloat = 0 ) then
      begin
        BoxMensagem('Campo Valor do Lançamento deve ser maior que zero!', 2);
        dbedt_vl_pagto.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if Not ( datm_monta_adm.qry_monta_adm_.State in [dsEdit, dsInsert] ) then Exit;

    if ( Trim( dbedt_cd_ct_contabil.Text ) <> '' ) and
       ( Trim( dbedt_nm_ct_contabil.Text ) = '' ) then
    begin
      BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2 );
      pgctrl_monta_adm.ActivePage  := ts_favorecido;
      pgctrl_monta_adm2.ActivePage := ts_adm;
      dbedt_cd_ct_contabil.SetFocus;
      Consiste := False;
      Exit;
    end;

    // Histórico
    ValidCodigo( dbedt_cd_historico );
    if dbedt_cd_historico.Text <> '' then
    begin
      if dbedt_nm_historico.Text = '' then
      begin
        BoxMensagem('Código do Histórico inválido!', 2);
        dbedt_cd_historico.SetFocus;
        Consiste := False;
        Exit;
      end
      else
      begin
        if datm_monta_adm.qry_monta_adm_TX_HISTORICO.AsString = '' then
        begin
          if datm_monta_adm.qry_historico_.Locate( 'CD_HISTORICO', datm_monta_adm.qry_monta_adm_CD_HISTORICO.AsString, [loCaseInsensitive] ) then
             datm_monta_adm.qry_monta_adm_TX_HISTORICO.Assign( datm_monta_adm.qry_historico_TX_HISTORICO );
        end;
      end;
    end;
  end;
end;

function Tfrm_monta_adm.Grava : Boolean;
var
  Falha : Boolean;
begin
  Falha := False;
  Grava := False;
  if datm_monta_adm.qry_monta_adm_.State in [dsInsert, dsEdit] then // Montagem por Favorecido
  begin
    try
      datm_main.db_broker.StartTransaction;
      with datm_monta_adm do
      begin
        qry_monta_adm_.Post;
        Abre_Adm;
      end;
      if Not Falha then
      begin
        datm_main.db_broker.Commit;
        Grava := True;
      end;
    except
      on E: Exception do
      begin
        datm_monta_adm.qry_monta_adm_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
    btn_mi( st_incluir, False, False, st_excluir );
  end;
end;

procedure Tfrm_monta_adm.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled   := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled := Canc;
end;

procedure Tfrm_monta_adm.dbnvgAdmBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if datm_monta_adm.qry_monta_adm_.State in [dsInsert, dsEdit] then
     datm_monta_adm.qry_monta_adm_.Cancel;
end;

procedure Tfrm_monta_adm.dbedt_cd_bancoExit(Sender: TObject);
begin
  with datm_monta_adm do
  begin
    qry_banco_.Close;
    qry_banco_.SQL[2] := 'WHERE CD_BANCO <> ""';
    qry_banco_.Prepare;
    qry_banco_.Open;
  end;
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_monta_adm.dbedt_cd_favorecidoExit(Sender: TObject);
begin
  with datm_monta_adm do
  begin
    qry_favorecido_.Close;
    qry_favorecido_.SQL[2] := 'WHERE CD_FAVORECIDO <> ""';
    qry_favorecido_.Prepare;
    qry_favorecido_.Open;
  end;
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_monta_adm.dbedt_cd_destinoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_monta_adm.dbedt_cd_despachanteExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_monta_adm.msk_cd_unid_negExit(Sender: TObject);
begin
  if ( datm_monta_adm.qry_monta_adm_.State in [dsEdit, dsInsert] ) or
     ( Trim( msk_cd_unid_neg.Text ) = cd_unid_neg ) then Exit;
  if Trim( msk_cd_unid_neg.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_unid_neg );
    with datm_monta_adm do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '" AND IN_ATIVO = "1"';
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.RecordCount > 0 then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
      end
      else
      begin
        BoxMensagem('Unidade de Negócio não cadastrada!', 2);
        edt_nm_unid_neg.Text := '';
        msk_cd_unid_neg.SetFocus;
        Exit;
      end;
      Abre_Adm;
    end
  end
  else
  begin
    edt_nm_unid_neg.Text := '';
  end;
end;

procedure Tfrm_monta_adm.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_monta_adm do
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

function Tfrm_monta_adm.VerAlt;
begin
  VerAlt := True;
  if datm_monta_adm.qry_monta_adm_.State in [dsInsert, dsEdit] then
  begin
   if ( ( datm_monta_adm.qry_monta_adm_.State in [dsEdit] ) and st_modificar ) or
       ( datm_monta_adm.qry_monta_adm_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Solicitação de Pagamento foi alterada.' + #13#10 +
         'Deseja salvar as alterações?', 1) then
      begin
        if Not Consiste then
        begin
          VerAlt := False;
          Exit;
        end;
        if Not Grava then
        begin
          VerAlt := False;
          Exit;
        end;
      end
      else
        Cancelar;
    end;
  end;
end;

procedure Tfrm_monta_adm.Abre_Adm;
begin
  with datm_monta_adm do
  begin
    cd_unid_neg    := qry_monta_adm_CD_UNID_NEG.AsString;
    dt_lancto      := qry_monta_adm_DT_LANCTO.AsDateTime;
    cd_ct_contabil := qry_monta_adm_CD_CT_CONTABIL.AsString;
    tp_natureza    := qry_monta_adm_TP_NATUREZA.AsString;
    tp_lancamento  := qry_monta_adm_TP_LANCAMENTO.AsString;
    nr_lancamento  := qry_monta_adm_NR_LANCAMENTO.AsString;

    qry_grd_adm_.Close;
    if msk_dt_inicio.Text <> '  /  /    ' then
       qry_grd_adm_.ParamByName('DT_INICIO').AsDate      := StrToDate( msk_dt_inicio.Text )
    else
       qry_grd_adm_.ParamByName('DT_INICIO').AsDate      := dt_server;

    if msk_dt_termino.Text <> '  /  /    ' then
       qry_grd_adm_.ParamByName('DT_TERMINO').AsDate     := StrToDate( msk_dt_termino.Text )
    else
       qry_grd_adm_.ParamByName('DT_TERMINO').AsDate     := dt_server;

    qry_grd_adm_.ParamByName('CD_UNID_NEG').AsString     := msk_cd_unid_neg.Text;
    qry_grd_adm_.ParamByName('CD_FAVORECIDO').AsString   := msk_cd_favorecido.Text;
    if rbtn_credito.Checked then
      qry_grd_adm_.ParamByName('TP_NATUREZA').AsString   := 'C'
    else
      qry_grd_adm_.ParamByName('TP_NATUREZA').AsString   := 'D';
    if rbtn_cheque.Checked then
      qry_grd_adm_.ParamByName('TP_LANCAMENTO').AsString := 'C'
    else
      qry_grd_adm_.ParamByName('TP_LANCAMENTO').AsString := 'N';
    qry_grd_adm_.Prepare;
    qry_grd_adm_.Open;
    qry_grd_adm_.Locate( 'CD_UNID_NEG;DT_LANCTO;CD_CT_CONTABIL;TP_NATUREZA;NR_LANCAMENTO', VarArrayOf([cd_unid_neg, dt_lancto, cd_ct_contabil, tp_natureza, nr_lancamento ]), [loCaseInsensitive] );

    qry_soma_adm_.Close;
    if msk_dt_inicio.Text <> '  /  /    ' then
       qry_soma_adm_.ParamByName('DT_INICIO').AsDate      := StrToDate( msk_dt_inicio.Text )
    else
       qry_soma_adm_.ParamByName('DT_INICIO').AsDate      := dt_server;

    if msk_dt_termino.Text <> '  /  /    ' then
       qry_soma_adm_.ParamByName('DT_TERMINO').AsDate     := StrToDate( msk_dt_termino.Text )
    else
       qry_soma_adm_.ParamByName('DT_TERMINO').AsDate     := dt_server;

    qry_soma_adm_.ParamByName('CD_UNID_NEG').AsString     := msk_cd_unid_neg.Text;
    qry_soma_adm_.ParamByName('CD_FAVORECIDO').AsString   := msk_cd_favorecido.Text;
    if rbtn_credito.Checked then
      qry_soma_adm_.ParamByName('TP_NATUREZA').AsString   := 'C'
    else
      qry_soma_adm_.ParamByName('TP_NATUREZA').AsString   := 'D';
    if rbtn_cheque.Checked then
      qry_soma_adm_.ParamByName('TP_LANCAMENTO').AsString := 'C'
    else
      qry_soma_adm_.ParamByName('TP_LANCAMENTO').AsString := 'N';
    qry_soma_adm_.Prepare;
    qry_soma_adm_.Open;

    qry_monta_adm_.Close;
    qry_monta_adm_.Prepare;
    qry_monta_adm_.Open;
    Abre_Pagtos;
    Abre_Recebtos;

    vl_tot_selec := 0;
    lbl_vl_tot_selec.Caption := FormatFloat( '#0,.00', vl_tot_selec );
  end;
end;

procedure Tfrm_monta_adm.Abre_Pagtos;
begin
  with datm_monta_adm do
  begin
    if ( msk_dt_pagto.Text = '  /  /    ' ) or ( Trim( msk_cd_unid_neg_pagto.Text ) = '' ) then Exit;
    nr_ref         := qry_ref_pagto_NR_REF.AsString;
    cd_unid_neg    := qry_ref_pagto_CD_UNID_NEG.AsString;
    cd_ct_contabil := qry_ref_pagto_itens_CD_CT_CONTABIL.AsString;
    dt_lancto      := qry_ref_pagto_itens_DT_LANCTO.AsDateTime;
    nr_lancamento  := qry_ref_pagto_itens_NR_LANCAMENTO.AsString;

    qry_ref_pagto_.Close;
    qry_ref_pagto_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg_pagto.Text );
    qry_ref_pagto_.ParamByName('DT_PAGTO').AsDate      := StrToDate( msk_dt_pagto.Text );
    qry_ref_pagto_.Prepare;
    qry_ref_pagto_.Open;
    qry_ref_pagto_.Locate( 'NR_REF', nr_ref, [loCaseInsensitive] );
    qry_ref_pagto_itens_.Close;
    qry_ref_pagto_itens_.Prepare;
    qry_ref_pagto_itens_.Open;
    qry_ref_pagto_itens_.Locate( 'CD_UNID_NEG; CD_CT_CONTABIL', VarArrayOf([cd_unid_neg, cd_ct_contabil]), [loCaseInsensitive] );
  end;
end;

procedure Tfrm_monta_adm.Abre_Recebtos;
begin
  with datm_monta_adm do
  begin
    if ( msk_dt_recebto.Text = '  /  /    ' ) or ( Trim( msk_cd_unid_neg_recebto.Text ) = '' ) then Exit;
    nr_ref         := qry_ref_recebto_NR_REF.AsString;
    cd_unid_neg    := qry_ref_recebto_CD_UNID_NEG.AsString;
    cd_ct_contabil := qry_ref_recebto_itens_CD_CT_CONTABIL.AsString;
    dt_lancto      := qry_ref_recebto_itens_DT_LANCTO.AsDateTime;
    nr_lancamento  := qry_ref_recebto_itens_NR_LANCAMENTO.AsString;

    qry_ref_recebto_.Close;
    qry_ref_recebto_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg_recebto.Text );
    qry_ref_recebto_.ParamByName('DT_PAGTO').AsDate      := StrToDate( msk_dt_recebto.Text );
    qry_ref_recebto_.Prepare;
    qry_ref_recebto_.Open;
    qry_ref_recebto_.Locate( 'NR_REF', nr_ref, [loCaseInsensitive] );
    qry_ref_recebto_itens_.Close;
    qry_ref_recebto_itens_.Prepare;
    qry_ref_recebto_itens_.Open;
    qry_ref_recebto_itens_.Locate( 'CD_UNID_NEG; CD_CT_CONTABIL', VarArrayOf([cd_unid_neg, cd_ct_contabil]), [loCaseInsensitive] );
  end;
end;

procedure Tfrm_monta_adm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_monta_adm.msk_cd_unid_negEnter(Sender: TObject);
begin
  cd_unid_neg := msk_cd_unid_neg.Text;
end;

procedure Tfrm_monta_adm.dbedt_cd_calculoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_monta_adm.btn_montarClick(Sender: TObject);
var
  i : Integer;
  Erro: Boolean;
  cd_favorecido : String[5];
  in_ted: String[1];
begin
  ActiveControl := nil;
  with datm_monta_adm do
  begin
    if pgctrl_monta_adm.ActivePage = ts_favorecido then
    begin
      if dbgrdMontaAdm.SelectedRows.Count = 0 then
      begin
        BoxMensagem( 'Selecione um Pagamento!', 2 );
        btn_desmarca_todasClick(nil);
        Exit;
      end;

      if ( edt_nm_banco.Text = '' ) and ( rbtn_cheque.Checked ) then
      begin
        BoxMensagem( 'Informe o Banco para Pagamento/Recebimento', 2);
        btn_desmarca_todasClick(nil);
        msk_cd_banco.SetFocus;
        Exit;
      end;

      Erro := False;
      for i := 0 to dbgrdMontaAdm.SelectedRows.Count - 1 do
      begin
        TTable(dbgrdMontaAdm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdMontaAdm.SelectedRows[i]));
        if qry_monta_adm_CD_FAVORECIDO.AsString = '' then
        begin
          BoxMensagem('Conta Contábil: ' + Trim( qry_monta_adm_LookCtContabil.AsString ) + #13#10 +
                      'Campo Favorecido deve ser informado', 2);
          Erro := True;
          Break;
        end;
        if ( qry_monta_adm_CD_STATUS_ADM.AsString = '4' ) or
           ( qry_monta_adm_CD_STATUS_ADM.AsString = '17' ) then
        begin
          BoxMensagem( 'Conta Contábil: ' + Trim( qry_monta_adm_LookCtContabil.AsString ) + #13#10 +
                       'está cancelada!', 2 );
          Erro := True;
          Break;
        end;
      end;

      if Erro then
      begin
        btn_desmarca_todasClick(nil);
        Exit;
      end;

      TotSelecAdm;

      in_ted := '0';

      // Verificar se pagamento irá gerar TED
      if vl_tot_selec >= vl_minimo_ted then
      begin
        if Not BoxMensagem( 'Valor maior ou igual a R$ ' + FormatFloat( '#0,.00', vl_minimo_ted ) + #13#10 +
                            'O sistema irá gerar Pagamento em TED. Confirma? ', 1 ) then
        begin
          if Not BoxMensagem( 'Deseja então gerar Cheque?' +  #13#10 +
                              'Atenção pois serão geradas tarifas sobre o valor!', 1 ) then
          begin
            btn_desmarca_todasClick(nil);
            Exit;
          end
          else
          begin
            in_ted := '0';
          end;
        end
        else
        begin
          in_ted := '1';
        end;
      end;

      Marcando             := True;
      btn_cancelar.Enabled := True;
      mi_cancelar.Enabled  := True;

      cd_favorecido := '';
      try
        datm_main.db_broker.StartTransaction;
        qry_ult_ref_.Close;
        qry_ult_ref_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        qry_ult_ref_.Prepare;
        qry_ult_ref_.Open;

        if dbgrdMontaAdm.SelectedRows.Count > 0 then
           TTable(dbgrdMontaAdm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdMontaAdm.SelectedRows[0]));
        for i := 0 to dbgrdMontaAdm.SelectedRows.Count - 1 do
        begin
          if Not ( qry_monta_adm_.State in [dsEdit, dsInsert] ) then
             qry_monta_adm_.Edit;
          qry_monta_adm_IN_TED.AsString           := in_ted;
          qry_monta_adm_CD_BANCO.AsString         := msk_cd_banco.Text;
          qry_monta_adm_CD_USUARIO_MONTA.AsString := str_cd_usuario;
          qry_monta_adm_DT_PAGTO.AsDateTime       := dt_server;
          if qry_monta_adm_TP_NATUREZA.AsString = 'C' then
             qry_monta_adm_CD_STATUS_ADM.AsString := '18'; //Recebido

          if ( qry_monta_adm_TP_NATUREZA.AsString = 'D' ) and ( in_ted = '0' ) then
             qry_monta_adm_CD_STATUS_ADM.AsString := '7'; //Pago

          if ( qry_monta_adm_TP_NATUREZA.AsString = 'D' ) and ( in_ted = '1' ) then
             qry_monta_adm_CD_STATUS_ADM.AsString := '19'; //TED Aguardando liberação

          qry_monta_adm_NR_REF.AsString           := qry_ult_ref_ULT_REF.AsString;
          qry_monta_adm_.Post;

          if CancelaOperacao then
          begin
            if BoxMensagem('Cancela a operação?', 1) then
            begin
              Cancelado            := True;
              CancelaOperacao      := False;
              Marcando             := False;
              btn_cancelar.Enabled := False;
              mi_cancelar.Enabled  := False;
              Close;
              btn_desmarca_todasClick(nil);
              Exit;
            end
            else CancelaOperacao   := False;
          end;

          dbgrdMontaAdm.SelectedRows.CurrentRowSelected := False;
          if dbgrdMontaAdm.SelectedRows.Count > 0 then
            TTable(dbgrdMontaAdm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdMontaAdm.SelectedRows[0]))
          else Break;
        end;
        datm_main.db_broker.Commit;
      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      end;
      Marcando             := False;
      CancelaOperacao      := False;
      Cancelado            := False;
      btn_cancelar.Enabled := False;
      mi_cancelar.Enabled  := False;
      btn_desmarca_todasClick(nil);
      Abre_Adm;
    end;
  end;
end;

procedure Tfrm_monta_adm.msk_cd_bancoEnter(Sender: TObject);
begin
  cd_banco := msk_cd_banco.Text;
end;

procedure Tfrm_monta_adm.msk_cd_favorecidoEnter(Sender: TObject);
begin
  cd_favorecido := msk_cd_favorecido.Text;
end;

procedure Tfrm_monta_adm.msk_cd_bancoExit(Sender: TObject);
begin
  if ( datm_monta_adm.qry_monta_adm_.State in [dsEdit, dsInsert] ) or
     ( Trim( msk_cd_banco.Text ) = cd_banco ) then Exit;
  if Trim( msk_cd_banco.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_banco );
    with datm_monta_adm do
    begin
      qry_banco_.Close;
      qry_banco_.SQL[2] := 'WHERE CD_BANCO = "' + msk_cd_banco.Text + '" AND IN_ATIVO = "1"';
      qry_banco_.Prepare;
      qry_banco_.Open;
      if qry_banco_.RecordCount > 0 then
      begin
        edt_nm_banco.Text := qry_banco_NM_BANCO.AsString;
      end
      else
      begin
        BoxMensagem('Banco não cadastrado!', 2);
        edt_nm_banco.Text := '';
        msk_cd_banco.SetFocus;
        Exit;
      end;
      Abre_Adm;
    end
  end
  else
  begin
    edt_nm_banco.Text := '';
  end;
end;

procedure Tfrm_monta_adm.msk_cd_favorecidoExit(Sender: TObject);
begin
  if ( datm_monta_adm.qry_monta_adm_.State in [dsEdit, dsInsert] ) or
     ( Trim( msk_cd_favorecido.Text ) = cd_favorecido ) then Exit;
  if Trim( msk_cd_favorecido.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_favorecido );
    with datm_monta_adm do
    begin
      qry_favorecido_.Close;
      qry_favorecido_.Prepare;
      qry_favorecido_.Open;
      if qry_favorecido_.Locate( 'CD_FAVORECIDO', msk_cd_favorecido.Text, [loCaseInsensitive] ) then
      begin
        edt_nm_favorecido.Text := qry_favorecido_NM_FAVORECIDO.AsString;
      end
      else
      begin
        BoxMensagem('Favorecido não cadastrado!', 2);
        edt_nm_favorecido.Text := '';
        msk_cd_favorecido.SetFocus;
        Exit;
      end;
      Abre_Adm;
    end
  end
  else
  begin
    edt_nm_favorecido.Text := '';
  end;
end;

procedure Tfrm_monta_adm.btn_co_bancoClick(Sender: TObject);
begin
  with datm_monta_adm do
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

procedure Tfrm_monta_adm.btn_co_favorecidoClick(Sender: TObject);
begin
  with datm_monta_adm do
  begin
    Application.CreateForm(Tfrm_Favor, frm_Favor );
    with frm_Favor do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_Favor.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_favorecido.Text := frm_Favor.Cons_OnLine_Texto;
      msk_cd_favorecidoExit(nil);
    end;
  end;
end;

procedure Tfrm_monta_adm.btn_marca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  with datm_monta_adm do
  begin
    vl_tot_selec := 0;
    btn_marca_todas.Visible    := False;
    btn_desmarca_todas.Visible := True;
    btn_desmarca_todas.Left    := btn_marca_todas.Left;
    if pgctrl_monta_adm.ActivePage = ts_favorecido then
    begin
      if Not ( qry_grd_adm_.RecordCount > 0 ) then Exit;
      qry_grd_adm_.First;
      for i := 0 to datm_monta_adm.qry_grd_adm_.RecordCount - 1 do
      begin
        dbgrdMontaAdm.SelectedRows.CurrentRowSelected := True;
        vl_tot_selec := vl_tot_selec + qry_grd_adm_VL_LANCTO.AsFloat;
        lbl_vl_tot_selec.Caption := FormatFloat( '#0,.00', vl_tot_selec );
        qry_grd_adm_.Next;
      end;
    end;
  end;
end;

procedure Tfrm_monta_adm.btn_desmarca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  with datm_monta_adm do
  begin
    btn_marca_todas.Visible    := True;
    btn_desmarca_todas.Visible := False;
    if pgctrl_monta_adm.ActivePage = ts_favorecido then
    begin
      if dbgrdMontaAdm.SelectedRows.Count > 0 then
         TTable(dbgrdMontaAdm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdMontaAdm.SelectedRows[0]));
      for i := 0 to dbgrdMontaAdm.SelectedRows.Count - 1 do
      begin
        dbgrdMontaAdm.SelectedRows.CurrentRowSelected := False;
        if dbgrdMontaAdm.SelectedRows.Count > 0 then
          TTable(dbgrdMontaAdm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdMontaAdm.SelectedRows[0]))
        else Break;
      end;
    end;
    vl_tot_selec := 0;
    lbl_vl_tot_selec.Caption := FormatFloat( '#0,.00', vl_tot_selec );
  end;
end;

procedure Tfrm_monta_adm.msk_dt_pagtoEnter(Sender: TObject);
begin
  dt_pagamento := msk_dt_pagto.Text;
end;

procedure Tfrm_monta_adm.msk_dt_pagtoExit(Sender: TObject);
begin
  if msk_dt_pagto.Text = dt_pagamento then Exit;
  Abre_Pagtos;
end;

procedure Tfrm_monta_adm.pgctrl_monta_admChange(Sender: TObject);
begin
  if pgctrl_monta_adm.ActivePage = ts_favorecido then
  begin
    vl_tot_selec := 0;
    lbl_vl_tot_selec.Caption := '0,00';
    btn_canc_lanc.Enabled := False;
    dbnvgAdm.DataSource   := datm_monta_adm.ds_grd_adm;
  end;

  if ( pgctrl_monta_adm.ActivePage = ts_pagto ) or
     ( pgctrl_monta_adm.ActivePage = ts_recebto ) then
  begin
    btn_canc_lanc.Enabled := True;
  end;

  if ( pgctrl_monta_adm.ActivePage = ts_pagto ) then
  begin
    dbnvgAdm.DataSource   := datm_monta_adm.ds_ref_pagto;
  end;

  if ( pgctrl_monta_adm.ActivePage = ts_recebto ) then
  begin
    dbnvgAdm.DataSource   := datm_monta_adm.ds_ref_recebto;
  end;
end;

procedure Tfrm_monta_adm.btn_canc_lancClick(Sender: TObject);
var nr_novo_lancamento : String[3];
    i : Integer;
begin
  with datm_monta_adm do
  begin
    if pgctrl_monta_adm.ActivePage = ts_pagto then
    begin
      // Itens
      if ( dbgrdRefPagtosItens.SelectedRows.Count > 0 ) and ( dbgrdRefPagtos.SelectedRows.Count <= 0 ) then
        TTable(dbgrdRefPagtosItens.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdRefPagtosItens.SelectedRows[0]));
      for i := 0 to dbgrdRefPagtosItens.SelectedRows.Count - 1 do
      begin
        if Not BoxMensagem( 'Confirma cancelamento da Conta Contábil ' + qry_ref_pagto_itens_LookCtContabil.AsString + '?', 1) then Exit;

        if ( Trim( qry_ref_pagto_itens_NR_DOCTO.AsString ) <> '' ) or
           ( qry_ref_pagto_itens_IN_TRANSF_FIN.AsString = '1' ) then
        begin
          BoxMensagem('Conta Contábil paga!', 2);
          Exit;
        end;

        qry_rel_liq_.Close;
        qry_rel_liq_.ParamByName('CD_UNID_NEG').AsString    := qry_ref_pagto_itens_CD_UNID_NEG.AsString;
        qry_rel_liq_.ParamByName('CD_CT_CONTABIL').AsString := qry_ref_pagto_itens_CD_CT_CONTABIL.AsString;
        qry_rel_liq_.ParamByName('TP_NATUREZA').AsString    := 'D';
        qry_rel_liq_.ParamByName('DT_LANCTO').AsDateTime    := qry_ref_pagto_itens_DT_LANCTO.AsDateTime;
        qry_rel_liq_.ParamByName('NR_LANCAMENTO').AsString  := qry_ref_pagto_itens_NR_LANCAMENTO.AsString;
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
          qry_ult_lancto_.Close;
          qry_ult_lancto_.ParamByName('CD_UNID_NEG').AsString := qry_monta_pagto_CD_UNID_NEG.AsString;
          qry_ult_lancto_.ParamByName('DT_LANCTO').AsDateTime := qry_monta_pagto_DT_LANCTO.AsDateTime;
          qry_ult_lancto_.Prepare;
          qry_ult_lancto_.Open;
          if qry_ult_lancto_NR_LANCAMENTO.AsString = '000' then
             nr_novo_lancamento := '001'
          else
             nr_novo_lancamento := qry_ult_lancto_NR_LANCAMENTO.AsString;
          qry_ult_lancto_.Close;

          qry_ins_adm_.Close;
          qry_ins_adm_.ParamByName('CD_UNID_NEG').AsString        := qry_monta_pagto_CD_UNID_NEG.AsString;
          qry_ins_adm_.ParamByName('DT_LANCTO').AsDateTime        := qry_monta_pagto_DT_LANCTO.AsDateTime;
          qry_ins_adm_.ParamByName('TP_NATUREZA').AsString        := 'D';
          qry_ins_adm_.ParamByName('CD_CT_CONTABIL').AsString     := qry_monta_pagto_CD_CT_CONTABIL.AsString;
          qry_ins_adm_.ParamByName('NR_LANCAMENTO').AsString      := qry_monta_pagto_NR_LANCAMENTO.AsString;
          qry_ins_adm_.ParamByName('NR_NOVO_LANCAMENTO').AsString := nr_novo_lancamento;
          qry_ins_adm_.ExecSQL;

          if Not ( qry_monta_pagto_.State in [dsEdit, dsInsert] ) then qry_monta_pagto_.Edit;
          begin
            qry_monta_pagto_NR_REF.AsVariant           := Null;
            qry_monta_pagto_CD_BANCO.AsString          := '';
            qry_monta_pagto_CD_USUARIO_MONTA.AsString  := '';
            qry_monta_pagto_NR_DOCTO.AsString          := '';
            qry_monta_pagto_DT_PAGTO.AsVariant         := Null;
            qry_monta_pagto_CD_STATUS_ADM.AsString     := '4';
            qry_monta_pagto_.Post;
          end;

          datm_main.db_broker.Commit;
        except
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          qry_monta_pagto_.Cancel;
        end;

        dbgrdRefPagtosItens.SelectedRows.CurrentRowSelected := False;
        if dbgrdRefPagtosItens.SelectedRows.Count > 0 then
          TTable(dbgrdRefPagtosItens.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdRefPagtosItens.SelectedRows[0]))
        else Break;
      end;

      // Pagamentos Inteiros
      if dbgrdRefPagtos.SelectedRows.Count > 0 then
      begin
        TTable(dbgrdRefPagtos.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdRefPagtos.SelectedRows[0]));
        for i := 0 to dbgrdRefPagtos.SelectedRows.Count - 1 do
        begin
          if BoxMensagem( 'Confirma cancelamento do Lote ' + qry_ref_pagto_NR_REF.AsString + '?', 1) then
          begin
            qry_ref_pagto_itens_.First;

            if ( Trim( qry_ref_pagto_itens_NR_DOCTO.AsString ) <> '' ) or
               ( qry_ref_pagto_itens_IN_TRANSF_FIN.AsString = '1' ) then
            begin
              BoxMensagem('Conta Contábil paga!', 2);
              Exit;
            end;

            qry_rel_liq_.Close;
            qry_rel_liq_.ParamByName('CD_UNID_NEG').AsString    := qry_ref_pagto_itens_CD_UNID_NEG.AsString;
            qry_rel_liq_.ParamByName('CD_CT_CONTABIL').AsString := qry_ref_pagto_itens_CD_CT_CONTABIL.AsString;
            qry_rel_liq_.ParamByName('TP_NATUREZA').AsString    := 'D';
            qry_rel_liq_.ParamByName('DT_LANCTO').AsDateTime    := qry_ref_pagto_itens_DT_LANCTO.AsDateTime;
            qry_rel_liq_.ParamByName('NR_LANCAMENTO').AsString  := qry_ref_pagto_itens_NR_LANCAMENTO.AsString;
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
              while Not qry_ref_pagto_itens_.EOF do
              begin
                qry_ult_lancto_.Close;
                qry_ult_lancto_.ParamByName('CD_UNID_NEG').AsString := qry_monta_pagto_CD_UNID_NEG.AsString;
                qry_ult_lancto_.ParamByName('DT_LANCTO').AsDateTime := qry_monta_pagto_DT_LANCTO.AsDateTime;
                qry_ult_lancto_.Prepare;
                qry_ult_lancto_.Open;
                if qry_ult_lancto_NR_LANCAMENTO.AsString = '000' then
                   nr_novo_lancamento := '001'
                else
                   nr_novo_lancamento := qry_ult_lancto_NR_LANCAMENTO.AsString;
                qry_ult_lancto_.Close;

                qry_ins_adm_.Close;
                qry_ins_adm_.ParamByName('CD_UNID_NEG').AsString        := qry_monta_pagto_CD_UNID_NEG.AsString;
                qry_ins_adm_.ParamByName('DT_LANCTO').AsDateTime        := qry_monta_pagto_DT_LANCTO.AsDateTime;
                qry_ins_adm_.ParamByName('TP_NATUREZA').AsString        := 'D';
                qry_ins_adm_.ParamByName('CD_CT_CONTABIL').AsString     := qry_monta_pagto_CD_CT_CONTABIL.AsString;
                qry_ins_adm_.ParamByName('NR_LANCAMENTO').AsString      := qry_monta_pagto_NR_LANCAMENTO.AsString;
                qry_ins_adm_.ParamByName('NR_NOVO_LANCAMENTO').AsString := nr_novo_lancamento;
                qry_ins_adm_.ExecSQL;

                if Not ( qry_monta_pagto_.State in [dsEdit, dsInsert] ) then qry_monta_pagto_.Edit;
                begin
                  qry_monta_pagto_NR_REF.AsVariant           := Null;
                  qry_monta_pagto_CD_BANCO.AsString          := '';
                  qry_monta_pagto_CD_USUARIO_MONTA.AsString  := '';
                  qry_monta_pagto_NR_DOCTO.AsString          := '';
                  qry_monta_pagto_DT_PAGTO.AsVariant         := Null;
                  qry_monta_pagto_CD_STATUS_ADM.AsString     := '4';
                  qry_monta_pagto_.Post;
                end;

                qry_ref_pagto_itens_.Next;
              end;

              datm_main.db_broker.Commit;
            except
              if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
              qry_monta_pagto_.Cancel;
            end;
          end;

          dbgrdRefPagtos.SelectedRows.CurrentRowSelected := False;
          if dbgrdRefPagtos.SelectedRows.Count > 0 then
            TTable(dbgrdRefPagtos.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdRefPagtos.SelectedRows[0]))
          else Break;
        end;
      end;

      Abre_Pagtos;

    end;

    if pgctrl_monta_adm.ActivePage = ts_recebto then
    begin
      // Itens
      if ( dbgrdRefRecebtosItens.SelectedRows.Count > 0 ) and ( dbgrdRefRecebtosItens.SelectedRows.Count <= 0 ) then
        TTable(dbgrdRefRecebtosItens.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdRefRecebtosItens.SelectedRows[0]));
      for i := 0 to dbgrdRefRecebtosItens.SelectedRows.Count - 1 do
      begin
        if Not BoxMensagem( 'Confirma cancelamento da Conta Contábil ' + qry_ref_recebto_itens_LookCtContabil.AsString + '?', 1) then Exit;

        qry_rel_liq_.Close;
        qry_rel_liq_.ParamByName('CD_UNID_NEG').AsString    := qry_ref_recebto_itens_CD_UNID_NEG.AsString;
        qry_rel_liq_.ParamByName('CD_CT_CONTABIL').AsString := qry_ref_recebto_itens_CD_CT_CONTABIL.AsString;
        qry_rel_liq_.ParamByName('TP_NATUREZA').AsString    := 'C';
        qry_rel_liq_.ParamByName('DT_LANCTO').AsDateTime    := qry_ref_recebto_itens_DT_LANCTO.AsDateTime;
        qry_rel_liq_.ParamByName('NR_LANCAMENTO').AsString  := qry_ref_recebto_itens_NR_LANCAMENTO.AsString;
        qry_rel_liq_.Prepare;
        qry_rel_liq_.Open;
        if qry_rel_liq_TOT_LIQ.AsInteger > 0 then
        begin
          BoxMensagem('Conta Contábil pertence a relatório de reembolso já liquidado!', 2);
          qry_rel_liq_.Close;
          Exit;
        end;
        qry_rel_liq_.Close;

        if ( Trim( qry_ref_pagto_itens_NR_DOCTO.AsString ) = '' ) or
           ( qry_ref_pagto_itens_IN_TRANSF_FIN.AsString = '1' ) then
        begin
          BoxMensagem('Conta Contábil recebida!', 2);
          Exit;
        end;

        try
          datm_main.db_broker.StartTransaction;
          qry_ult_lancto_.Close;
          qry_ult_lancto_.ParamByName('CD_UNID_NEG').AsString := qry_monta_recebto_CD_UNID_NEG.AsString;
          qry_ult_lancto_.ParamByName('DT_LANCTO').AsDateTime := qry_monta_recebto_DT_LANCTO.AsDateTime;
          qry_ult_lancto_.Prepare;
          qry_ult_lancto_.Open;
          if qry_ult_lancto_NR_LANCAMENTO.AsString = '000' then
             nr_novo_lancamento := '001'
          else
             nr_novo_lancamento := qry_ult_lancto_NR_LANCAMENTO.AsString;
          qry_ult_lancto_.Close;

          qry_ins_adm_.Close;
          qry_ins_adm_.ParamByName('CD_UNID_NEG').AsString := qry_monta_recebto_CD_UNID_NEG.AsString;
          qry_ins_adm_.ParamByName('DT_LANCTO').AsDateTime := qry_monta_recebto_DT_LANCTO.AsDateTime;
          qry_ins_adm_.ParamByName('TP_NATUREZA').AsString := 'C';
          qry_ins_adm_.ParamByName('CD_CT_CONTABIL').AsString := qry_monta_recebto_CD_CT_CONTABIL.AsString;
          qry_ins_adm_.ParamByName('NR_LANCAMENTO').AsString := qry_monta_recebto_NR_LANCAMENTO.AsString;
          qry_ins_adm_.ParamByName('NR_NOVO_LANCAMENTO').AsString := nr_novo_lancamento;
          qry_ins_adm_.ExecSQL;

          if Not ( qry_monta_recebto_.State in [dsEdit, dsInsert] ) then qry_monta_recebto_.Edit;
          begin
            qry_monta_recebto_NR_REF.AsVariant           := Null;
            qry_monta_recebto_CD_BANCO.AsString          := '';
            qry_monta_recebto_CD_USUARIO_MONTA.AsString  := '';
            qry_monta_recebto_NR_DOCTO.AsString          := '';
            qry_monta_recebto_DT_PAGTO.AsVariant         := Null;
            qry_monta_recebto_CD_STATUS_ADM.AsString     := '4';
            qry_monta_recebto_.Post;
          end;

          datm_main.db_broker.Commit;
        except
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          qry_monta_recebto_.Cancel;
        end;

        dbgrdRefRecebtosItens.SelectedRows.CurrentRowSelected := False;
        if dbgrdRefRecebtosItens.SelectedRows.Count > 0 then
          TTable(dbgrdRefRecebtosItens.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdRefRecebtosItens.SelectedRows[0]))
        else Break;
      end;

      // Recebimentos inteiros
      if dbgrdRefRecebto.SelectedRows.Count > 0 then
      begin
        TTable(dbgrdRefRecebto.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdRefRecebto.SelectedRows[0]));
        for i := 0 to dbgrdRefRecebto.SelectedRows.Count - 1 do
        begin

          if BoxMensagem( 'Confirma cancelamento do Lote ' + qry_ref_recebto_NR_REF.AsString + '?', 1) then
          begin
            qry_ref_recebto_itens_.First;

            if ( Trim( qry_ref_pagto_itens_NR_DOCTO.AsString ) = '' ) or
               ( qry_ref_pagto_itens_IN_TRANSF_FIN.AsString = '1' ) then
            begin
              BoxMensagem('Conta Contábil recebida!', 2);
              Exit;
            end;

            qry_rel_liq_.Close;
            qry_rel_liq_.ParamByName('CD_UNID_NEG').AsString    := qry_ref_recebto_itens_CD_UNID_NEG.AsString;
            qry_rel_liq_.ParamByName('CD_CT_CONTABIL').AsString := qry_ref_recebto_itens_CD_CT_CONTABIL.AsString;
            qry_rel_liq_.ParamByName('TP_NATUREZA').AsString    := 'C';
            qry_rel_liq_.ParamByName('DT_LANCTO').AsDateTime    := qry_ref_recebto_itens_DT_LANCTO.AsDateTime;
            qry_rel_liq_.ParamByName('NR_LANCAMENTO').AsString  := qry_ref_recebto_itens_NR_LANCAMENTO.AsString;
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
              while Not qry_ref_recebto_itens_.EOF do
              begin
                qry_ult_lancto_.Close;
                qry_ult_lancto_.ParamByName('CD_UNID_NEG').AsString := qry_monta_recebto_CD_UNID_NEG.AsString;
                qry_ult_lancto_.ParamByName('DT_LANCTO').AsDateTime := qry_monta_recebto_DT_LANCTO.AsDateTime;
                qry_ult_lancto_.Prepare;
                qry_ult_lancto_.Open;
                if qry_ult_lancto_NR_LANCAMENTO.AsString = '000' then
                   nr_novo_lancamento := '001'
                else
                   nr_novo_lancamento := qry_ult_lancto_NR_LANCAMENTO.AsString;
                qry_ult_lancto_.Close;

                qry_ins_adm_.Close;
                qry_ins_adm_.ParamByName('CD_UNID_NEG').AsString := qry_monta_recebto_CD_UNID_NEG.AsString;
                qry_ins_adm_.ParamByName('DT_LANCTO').AsDateTime := qry_monta_pagto_DT_LANCTO.AsDateTime;
                qry_ins_adm_.ParamByName('TP_NATUREZA').AsString := 'D';
                qry_ins_adm_.ParamByName('CD_CT_CONTABIL').AsString := qry_monta_pagto_CD_CT_CONTABIL.AsString;
                qry_ins_adm_.ParamByName('NR_LANCAMENTO').AsString := qry_monta_pagto_NR_LANCAMENTO.AsString;
                qry_ins_adm_.ParamByName('NR_NOVO_LANCAMENTO').AsString := nr_novo_lancamento;
                qry_ins_adm_.ExecSQL;

                if Not ( qry_monta_pagto_.State in [dsEdit, dsInsert] ) then qry_monta_pagto_.Edit;
                begin
                  qry_monta_pagto_NR_REF.AsVariant           := Null;
                  qry_monta_pagto_CD_BANCO.AsString          := '';
                  qry_monta_pagto_CD_USUARIO_MONTA.AsString  := '';
                  qry_monta_pagto_NR_DOCTO.AsString          := '';
                  qry_monta_pagto_DT_PAGTO.AsVariant         := Null;
                  qry_monta_pagto_CD_STATUS_ADM.AsString     := '4';
                  qry_monta_pagto_.Post;
                end;

                qry_ref_pagto_itens_.Next;
              end;

              datm_main.db_broker.Commit;
            except
              if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
              qry_monta_pagto_.Cancel;
            end;
          end;

          dbgrdRefPagtos.SelectedRows.CurrentRowSelected := False;
          if dbgrdRefPagtos.SelectedRows.Count > 0 then
            TTable(dbgrdRefPagtos.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdRefPagtos.SelectedRows[0]))
          else Break;
        end;
      end;

      Abre_Pagtos;

    end;
  end;
  Abre_Adm;
end;

procedure Tfrm_monta_adm.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg         then btn_co_unid_negClick(nil);
    if Sender = msk_cd_unid_neg_pagto   then btn_co_unid_neg_pagtoClick(nil);
    if Sender = msk_cd_unid_neg_recebto then btn_co_unid_neg_recebtoClick(nil);
    if Sender = msk_cd_favorecido       then btn_co_favorecidoClick(nil);
    if Sender = msk_cd_banco            then btn_co_bancoClick(nil);
    if Sender = dbedt_cd_ct_contabil    then btn_co_ct_contabilClick(nil);
    if Sender = dbedt_cd_historico      then btn_co_historicoClick(nil);
  end;
end;

procedure Tfrm_monta_adm.btn_co_ct_contabilClick(Sender: TObject);
var
  cd_ct_cont : String[10];
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2245';
  Application.CreateForm(Tfrm_ct_contabil, frm_ct_contabil);
  frm_ct_contabil.Cons_OnLine := datm_monta_adm.qry_monta_adm_CD_CT_CONTABIL;
  with frm_ct_contabil do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_monta_adm.qry_monta_adm_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
         datm_monta_adm.qry_monta_adm_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_monta_adm do
  begin
    cd_ct_cont := qry_monta_adm_CD_CT_CONTABIL.AsString;
    qry_ct_contabil_.Close;
    qry_ct_contabil_.Prepare;
    qry_ct_contabil_.Open;
    qry_monta_adm_CD_CT_CONTABIL.AsString := '';
    dbedt_cd_ct_contabilExit(nil);
    qry_monta_adm_CD_CT_CONTABIL.AsString := cd_ct_cont;
  end;
  vStr_cd_modulo := st_modulo;
  str_cd_rotina := st_rotina;
  dbedt_cd_ct_contabilExit(nil);
end;

procedure Tfrm_monta_adm.dbedt_cd_acessoChange(Sender: TObject);
begin
  if datm_monta_adm.qry_monta_adm_.State in [ dsInsert, dsEdit ] then
  begin
    btn_salvar.Enabled   := True;
    mi_salvar.Enabled    := True;
    btn_cancelar.Enabled := True;
    mi_cancelar.Enabled  := True;
  end;
end;

procedure Tfrm_monta_adm.msk_dt_recebtoEnter(Sender: TObject);
begin
  dt_recebimento := msk_dt_recebto.Text;
end;

procedure Tfrm_monta_adm.msk_dt_recebtoExit(Sender: TObject);
begin
  if msk_dt_recebto.Text = dt_recebimento then Exit;
  Abre_Recebtos;
end;

procedure Tfrm_monta_adm.dbedt_cd_ct_contabilExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_monta_adm.dbedt_cd_acessoEnter(Sender: TObject);
begin
  cd_acesso := dbedt_cd_acesso.Text;
end;

procedure Tfrm_monta_adm.dbedt_cd_acessoExit(Sender: TObject);
begin
  if dbedt_cd_acesso.Text = cd_acesso then Exit;
  with datm_monta_adm do
  begin
    if ( Trim( dbedt_cd_acesso.Text ) <> '' ) and ( Trim( dbedt_cd_aux.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_.Close;
      qry_ct_contabil_unica_.ParamByName('CD_ACESSO_AUX').AsString := Trim( dbedt_cd_acesso.Text ) + Trim( dbedt_cd_aux.Text );
      qry_ct_contabil_unica_.Prepare;
      qry_ct_contabil_unica_.Open;
      if qry_ct_contabil_unica_.RecordCount > 0 then
      begin
        if qry_monta_adm_.State in [dsEdit, dsInsert] then  qry_monta_adm_CD_CT_CONTABIL.AsString := qry_ct_contabil_unica_CD_CT_CONTABIL.AsString;
      end
      else
      begin
        BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2);
      end;
      qry_ct_contabil_unica_.Close;
    end;
  end;
end;

procedure Tfrm_monta_adm.dbedt_cd_auxEnter(Sender: TObject);
begin
  cd_aux := dbedt_cd_aux.Text;
end;

procedure Tfrm_monta_adm.dbedt_cd_auxExit(Sender: TObject);
begin
  if dbedt_cd_aux.Text = cd_aux then Exit;
  with datm_monta_adm do
  begin
    if ( Trim( dbedt_cd_acesso.Text ) <> '' ) and ( Trim( dbedt_cd_aux.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_.Close;
      qry_ct_contabil_unica_.ParamByName('CD_ACESSO_AUX').AsString := Trim( dbedt_cd_acesso.Text ) + Trim( dbedt_cd_aux.Text );
      qry_ct_contabil_unica_.Prepare;
      qry_ct_contabil_unica_.Open;
      if qry_ct_contabil_unica_.RecordCount > 0 then
      begin
        if qry_monta_adm_.State in [dsEdit, dsInsert] then qry_monta_adm_CD_CT_CONTABIL.AsString := qry_ct_contabil_unica_CD_CT_CONTABIL.AsString;
      end
      else
      begin
        BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2);
      end;
      qry_ct_contabil_unica_.Close;
    end;
  end;
end;

procedure Tfrm_monta_adm.dbedt_cd_historicoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_monta_adm.btn_co_historicoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2248';
  Application.CreateForm(Tfrm_hist_padrao, frm_hist_padrao);
  frm_hist_padrao.Cons_OnLine := datm_monta_adm.qry_monta_adm_CD_HISTORICO;
  with frm_hist_padrao do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_monta_adm.qry_monta_adm_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_monta_adm.qry_monta_adm_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;

  with datm_monta_adm do
  begin
    qry_historico_.Close;
    qry_historico_.Prepare;
    qry_historico_.Open;
  end;
  vStr_cd_modulo := st_modulo;
  str_cd_rotina := st_rotina;
  dbedt_cd_historicoExit(nil);
end;

procedure Tfrm_monta_adm.msk_dt_inicioExit(Sender: TObject);
begin
  try
    if msk_dt_inicio.Text <> '  /  /    ' then
    begin
      dt_inicio := StrToDate( msk_dt_inicio.Text );
    end;
  except
    on E: Exception do
    begin
      TrataErro(E);
      msk_dt_inicio.SetFocus;
      Exit;
    end;
  end;
  if str_dt_inicio <> msk_dt_inicio.Text then Abre_Adm;
end;

procedure Tfrm_monta_adm.msk_dt_terminoExit(Sender: TObject);
begin
  try
    if msk_dt_termino.Text <> '  /  /    ' then
    begin
      dt_termino := StrToDate( msk_dt_termino.Text );
    end;
  except
    on E: Exception do
    begin
      TrataErro(E);
      msk_dt_termino.SetFocus;
      Exit;
    end;
  end;
  if str_dt_termino <> msk_dt_termino.Text then Abre_Adm;
end;

procedure Tfrm_monta_adm.msk_dt_inicioEnter(Sender: TObject);
begin
  str_dt_inicio := msk_dt_inicio.Text;
end;

procedure Tfrm_monta_adm.msk_dt_terminoEnter(Sender: TObject);
begin
  str_dt_termino := msk_dt_termino.Text;
end;

procedure Tfrm_monta_adm.dbedt_vl_pagtoEnter(Sender: TObject);
begin
  str_vl_pagto := dbedt_vl_pagto.Text;
end;

procedure Tfrm_monta_adm.dbedt_vl_descontoEnter(Sender: TObject);
begin
  str_vl_desconto := dbedt_vl_desconto.Text;
end;

procedure Tfrm_monta_adm.dbedt_vl_perc_descontoEnter(Sender: TObject);
begin
  str_vl_perc_desconto := dbedt_vl_perc_desconto.Text;
end;

procedure Tfrm_monta_adm.dbedt_vl_pagtoExit(Sender: TObject);
begin
  with datm_monta_adm do
  begin
    if str_vl_pagto <> dbedt_vl_pagto.Text then
    begin
      if ( qry_monta_adm_VL_DESCONTO.AsFloat > 0 ) then
      begin
        if Not ( qry_monta_adm_.State in [dsInsert, dsEdit] ) then
          qry_monta_adm_.Edit;
        if ( qry_monta_adm_VL_PERC_DESCONTO.AsFloat > 0 ) then
          qry_monta_adm_VL_DESCONTO.AsFloat :=
             Arredondar( ( ( qry_monta_adm_VL_LANCTO.AsFloat * qry_monta_adm_VL_PERC_DESCONTO.AsFloat  ) / 100 ), 2 );
      end;
    end;
  end;
end;

procedure Tfrm_monta_adm.dbedt_vl_descontoExit(Sender: TObject);
begin
  with datm_monta_adm do
  begin
    if str_vl_pagto <> dbedt_vl_pagto.Text then
    begin
      if ( qry_monta_adm_VL_DESCONTO.AsFloat > 0 ) then
      begin
        if Not ( qry_monta_adm_.State in [dsInsert, dsEdit] ) then
          qry_monta_adm_.Edit;
        if ( qry_monta_adm_VL_PERC_DESCONTO.AsFloat > 0 ) then
          qry_monta_adm_VL_DESCONTO.AsFloat :=
             Arredondar( ( ( qry_monta_adm_VL_LANCTO.AsFloat * qry_monta_adm_VL_PERC_DESCONTO.AsFloat  ) / 100 ), 2 );
      end;
    end;
  end;
end;

procedure Tfrm_monta_adm.dbedt_vl_perc_descontoExit(Sender: TObject);
begin
  with datm_monta_adm do
  begin
    if ( str_vl_perc_desconto <> dbedt_vl_perc_desconto.Text ) and
       ( qry_monta_adm_VL_PERC_DESCONTO.AsFloat > 0 ) then
    begin
      if Not ( qry_monta_adm_.State in [dsInsert, dsEdit] ) then
         qry_monta_adm_.Edit;
      qry_monta_adm_VL_DESCONTO.AsFloat :=
         Arredondar( ( ( qry_monta_adm_VL_LANCTO.AsFloat * qry_monta_adm_VL_PERC_DESCONTO.AsFloat  ) / 100 ), 2 );
    end;
  end;
end;

procedure Tfrm_monta_adm.pgctrl_monta_adm2Change(Sender: TObject);
begin
  if pgctrl_monta_adm2.ActivePage = ts_lista then
  begin
    btn_marca_todas.Enabled    := True;
    btn_desmarca_todas.Enabled := True;
    btn_montar.Enabled         := True;
    mi_montar.Enabled          := True;
  end
  else
  begin
    btn_marca_todas.Enabled    := False;
    btn_desmarca_todas.Enabled := False;
    btn_montar.Enabled         := False;
    mi_montar.Enabled          := False;
  end;
end;

procedure Tfrm_monta_adm.rbtn_creditoClick(Sender: TObject);
begin
  Abre_Adm;
end;

procedure Tfrm_monta_adm.rbtn_debitoClick(Sender: TObject);
begin
  Abre_Adm;
end;

procedure Tfrm_monta_adm.rbtn_chequeClick(Sender: TObject);
begin
  Abre_Adm;
end;

procedure Tfrm_monta_adm.rbtn_notaClick(Sender: TObject);
begin
  Abre_Adm;
end;

procedure Tfrm_monta_adm.TotSelecAdm;
var i: Byte;
    Bookmark: TBookmark;
begin
  with datm_monta_adm do
  begin
    vl_tot_selec := 0;
    if dbgrdMontaAdm.SelectedRows.Count > 0 then
    begin
      Bookmark := TTable(dbgrdMontaAdm.DataSource.DataSet).GetBookmark;
      for i := 0 to dbgrdMontaAdm.SelectedRows.Count - 1 do
      begin
        TTable( dbgrdMontaAdm.DataSource.DataSet ).GotoBookMark( TBookMark( dbgrdMontaAdm.SelectedRows[i] ) );
        vl_tot_selec := vl_tot_selec + qry_grd_adm_VL_LANCTO.AsFloat;
      end;
      TTable(dbgrdMontaAdm.DataSource.DataSet).GotoBookMark(BookMark);
    end;
    lbl_vl_tot_selec.Caption := FormatFloat( '#0,.00', vl_tot_selec );
  end;
end;

procedure Tfrm_monta_adm.dbgrdMontaAdmCellClick(Column: TColumn);
begin
  TotSelecAdm;
end;

procedure Tfrm_monta_adm.dbgrdMontaAdmKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  TotSelecAdm;
end;

procedure Tfrm_monta_adm.dbgrdMontaAdmKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  TotSelecAdm;
end;



procedure Tfrm_monta_adm.msk_cd_unid_neg_pagtoEnter(Sender: TObject);
begin
  cd_unid_neg_pagto := msk_cd_unid_neg_pagto.Text;
end;

procedure Tfrm_monta_adm.msk_cd_unid_neg_recebtoEnter(Sender: TObject);
begin
  cd_unid_neg_recebto := msk_cd_unid_neg_recebto.Text;
end;

procedure Tfrm_monta_adm.msk_cd_unid_neg_pagtoExit(Sender: TObject);
begin
  if ( datm_monta_adm.qry_monta_adm_.State in [dsEdit, dsInsert] ) or
     ( Trim( msk_cd_unid_neg_pagto.Text ) = cd_unid_neg_pagto ) then Exit;
  if Trim( msk_cd_unid_neg_pagto.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_unid_neg_pagto );
    with datm_monta_adm do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg_pagto.Text + '" AND IN_ATIVO = "1"';
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.RecordCount > 0 then
      begin
        edt_nm_unid_neg_pagto.Text := qry_unid_neg_NM_UNID_NEG.AsString;
      end
      else
      begin
        BoxMensagem( 'Unidade de Negócio não cadastrada!', 2 );
        edt_nm_unid_neg_pagto.Text := '';
        msk_cd_unid_neg_pagto.SetFocus;
        Exit;
      end;
      Abre_Pagtos;
    end
  end
  else
  begin
    edt_nm_unid_neg_pagto.Text := '';
  end;
end;

procedure Tfrm_monta_adm.msk_cd_unid_neg_recebtoExit(Sender: TObject);
begin
  if ( datm_monta_adm.qry_monta_adm_.State in [dsEdit, dsInsert] ) or
     ( Trim( msk_cd_unid_neg_recebto.Text ) = cd_unid_neg_recebto ) then Exit;
  if Trim( msk_cd_unid_neg_recebto.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_unid_neg_recebto );
    with datm_monta_adm do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg_recebto.Text + '" AND IN_ATIVO = "1"';
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.RecordCount > 0 then
      begin
        edt_nm_unid_neg_recebto.Text := qry_unid_neg_NM_UNID_NEG.AsString;
      end
      else
      begin
        BoxMensagem( 'Unidade de Negócio não cadastrada!', 2 );
        edt_nm_unid_neg_recebto.Text := '';
        msk_cd_unid_neg_recebto.SetFocus;
        Exit;
      end;
      Abre_Recebtos;
    end
  end
  else
  begin
    edt_nm_unid_neg_recebto.Text := '';
  end;
end;

procedure Tfrm_monta_adm.btn_co_unid_neg_pagtoClick(Sender: TObject);
begin
  with datm_monta_adm do
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
      msk_cd_unid_neg_pagto.Text := frm_unidade.Cons_OnLine_Texto;
      msk_cd_unid_neg_pagtoExit(nil);
    end;
  end;
end;

procedure Tfrm_monta_adm.btn_co_unid_neg_recebtoClick(Sender: TObject);
begin
  with datm_monta_adm do
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
      msk_cd_unid_neg_recebto.Text := frm_unidade.Cons_OnLine_Texto;
      msk_cd_unid_neg_recebtoExit(nil);
    end;
  end;
end;

end.
