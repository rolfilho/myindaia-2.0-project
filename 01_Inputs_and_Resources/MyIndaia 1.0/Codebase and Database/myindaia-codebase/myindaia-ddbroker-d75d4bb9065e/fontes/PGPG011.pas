unit PGPG011;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, ComCtrls, Funcoes;

type
  Tfrm_solic_adm = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    btn_solic: TSpeedButton;
    btn_marca_todas: TSpeedButton;
    btn_desmarca_todas: TSpeedButton;
    btn_canc_lanc: TSpeedButton;
    mi_solic: TMenuItem;
    pgctrl_solic_adm: TPageControl;
    ts_lista: TTabSheet;
    ts_adm: TTabSheet;
    pnl_solic_adm: TPanel;
    lbl_ct_contabil: TLabel;
    lbl_vl_item: TLabel;
    btn_co_ct_contabil: TSpeedButton;
    lbl_favorecido: TLabel;
    btn_co_favorecido: TSpeedButton;
    lbl_dt_pagto_recebto: TLabel;
    lbl_dt_vencto: TLabel;
    lbl_acesso: TLabel;
    lbl_aux: TLabel;
    lbl_historico: TLabel;
    btn_co_historico: TSpeedButton;
    lbl_desconto: TLabel;
    lbl_perc_desconto: TLabel;
    lbl_vl_total: TLabel;
    dbedt_vl_pagto: TDBEdit;
    dbedt_cd_favorecido: TDBEdit;
    dbedt_nm_ct_contabil: TDBEdit;
    dbedt_cd_ct_contabil: TDBEdit;
    dbedt_nm_favorecido: TDBEdit;
    dbedt_dt_pagto: TDBEdit;
    dbedt_dt_vencto: TDBEdit;
    dbedt_cd_acesso: TDBEdit;
    dbedt_cd_aux: TDBEdit;
    dbrdgrp_tp_natureza: TDBRadioGroup;
    dbedt_cd_historico: TDBEdit;
    dbedt_nm_historico: TDBEdit;
    dbedt_vl_desconto: TDBEdit;
    dbedt_perc_desconto: TDBEdit;
    dbedt_vl_total: TDBEdit;
    dbgrdSolicAdm: TDBGrid;
    lbl_nr_lancamento: TLabel;
    dbedt_nr_lancamento: TDBEdit;
    dbrdgrp_tp_lancamento: TDBRadioGroup;
    dbm_tx_historico: TDBMemo;
    Label1: TLabel;
    dbedt_cd_ct_custo: TDBEdit;
    dbedt_nm_custo: TDBEdit;
    btn_co_custo: TSpeedButton;
    pnl_filtros: TPanel;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_data: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_dt_base: TMaskEdit;
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure dbnvgBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure pgctrl_solic_pagtoChange(Sender: TObject);
    procedure dbedt_cd_favorecidoExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_ct_contabilClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure Abre_Adm;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_co_processoClick(Sender: TObject);
    procedure btn_co_favorecidoClick(Sender: TObject);
    procedure dbedt_cd_ct_contabilExit(Sender: TObject);
    procedure dbedt_cd_ct_contabilChange(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure btn_marca_todasClick(Sender: TObject);
    procedure btn_desmarca_todasClick(Sender: TObject);
    procedure btn_solicClick(Sender: TObject);
    procedure btn_canc_lancClick(Sender: TObject);
    procedure msk_dt_baseExit(Sender: TObject);
    procedure dbedt_cd_acessoEnter(Sender: TObject);
    procedure dbedt_cd_auxEnter(Sender: TObject);
    procedure dbedt_cd_acessoExit(Sender: TObject);
    procedure dbedt_cd_auxExit(Sender: TObject);
    procedure msk_dt_baseEnter(Sender: TObject);
    procedure dbedt_dt_venctoExit(Sender: TObject);
    procedure dbedt_vl_pagtoExit(Sender: TObject);
    procedure dbedt_cd_historicoExit(Sender: TObject);
    procedure dbedt_cd_ct_contabilKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_historicoClick(Sender: TObject);
    procedure pgctrl_solic_admChange(Sender: TObject);
    procedure dbedt_cd_ct_custoExit(Sender: TObject);
    procedure btn_co_custoClick(Sender: TObject);
  private
    st_modulo, st_rotina : String;
    cd_acesso, cd_aux : String[1];
    function Consiste : Boolean;
    function Grava    : Boolean;
    function VerAlt   : Boolean;
    procedure Cancelar;
  public
    lNaoConsiste, st_modificar, st_incluir, st_excluir : Boolean;
    incluindo, lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    dt_base : String[10];
    nr_proc : String[18];
    hm_para_solic_ch : String[5];
    cd_unid_neg, cd_produto : String[2];
  end;

var
  frm_solic_adm : Tfrm_solic_adm;
  CancelaOperacao, Cancelado, Solicitando : Boolean;

implementation

uses GSMLIB, PGGP001, PGGP017, PGSM010, PGSM018, PGGP015, PGPG012, PGSM090,
     PGSM168, PGSM174, ConsOnLineEx;

{$R *.DFM}

procedure Tfrm_solic_adm.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_solic_adm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_solic_adm do
    begin
      qry_solic_adm_.Close;
      qry_unid_neg_.Close;
      qry_favorecido_.Close;
      qry_ct_contabil_.Close;
      qry_banco_.Close;
      qry_status_solic_adm_.Close;
      qry_usuario_.Close;
      qry_param_.Close;
      Free;
    end;
    Action := caFree;
  end
  else
  begin
    Action := caNone;
  end;
end;

procedure Tfrm_solic_adm.FormCreate(Sender: TObject);
begin
  CancelaOperacao := False;
  Cancelado       := False;

  st_modulo    := vStr_cd_modulo;
  st_rotina    := str_cd_rotina;

  st_modificar    := False;
  st_incluir      := False;
  st_excluir      := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir );

  // Cria o DataModule de Dados de Solicitação de Pagamentos Administrativos 
  Application.CreateForm(Tdatm_solic_adm, datm_solic_adm );

  with datm_solic_adm do
  begin
    qry_status_solic_adm_.Close;
    qry_status_solic_adm_.Prepare;
    qry_status_solic_adm_.Open;

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
    qry_solic_adm_.FieldByName('CD_CT_CONTABIL').EditMask := '999.99.99999;0;_';

    hm_para_solic_ch := qry_param_HM_PARA_SOLIC_CH.AsString;
    if Trim(hm_para_solic_ch) = '' then
    begin
      BoxMensagem('Atenção! Problemas com tabela de parâmetros!' + #13#10 +
                  'Não tente incluir Solicitação de Pagamento. Contate o CPD!', 2);
    end;

    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    qry_favorecido_.Close;
    qry_favorecido_.Prepare;
    qry_favorecido_.Open;

    qry_ct_contabil_.Close;
    qry_ct_contabil_.Prepare;
    qry_ct_contabil_.Open;

    qry_banco_.Close;
    qry_banco_.Prepare;
    qry_banco_.Open;

    qry_status_solic_adm_.Close;
    qry_status_solic_adm_.Prepare;
    qry_status_solic_adm_.Open;

    qry_usuario_.Close;
    qry_usuario_.Prepare;
    qry_usuario_.Open;

    qry_solic_adm_.Close;

    msk_cd_unid_neg.Text := str_cd_unid_neg;
    msk_cd_unid_negExit(nil);
    msk_dt_base.Text := FormatDateTime( 'dd/mm/yyyy', dt_server );
    msk_dt_baseExit(nil);

    Abre_Adm;

    qry_solic_adm_CD_CT_CONTABIL.EditMask := '999.99.99999;0;_';
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );

  pgctrl_solic_adm.ActivePage := ts_lista;
end;

procedure Tfrm_solic_adm.FormShow(Sender: TObject);
begin
  lNaoConsiste := False;
  dbgrdSolicAdm.Columns[2].FieldName := 'LookCtContabil';
  dbgrdSolicAdm.Columns[2].Title.Caption := 'Conta Contábil';
end;

procedure Tfrm_solic_adm.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
  btn_incluir.Enabled                 := True;
  mi_incluir.Enabled                  := True;
  btn_salvar.Enabled                  := False;
  mi_salvar.Enabled                   := False;
  btn_cancelar.Enabled                := False;
  mi_cancelar.Enabled                 := False;
  if Solicitando then CancelaOperacao := True;
  incluindo                           := False;
  btn_desmarca_todasClick(nil);
  pnl_solic_adm.Enabled               := ( Not datm_solic_adm.qry_solic_adm_.EOF );
end;

procedure Tfrm_solic_adm.Cancelar;
begin
  try
    if datm_solic_adm.qry_solic_adm_.State in [dsInsert, dsEdit] then
    begin
      datm_solic_adm.qry_solic_adm_.Cancel;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
end;

procedure Tfrm_solic_adm.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  incluindo           := True;

  with datm_solic_adm do
  begin
    pgctrl_solic_adm.ActivePage := ts_adm;
    btn_desmarca_todasClick(nil);
    qry_solic_adm_.DisableControls;
    qry_solic_adm_.Cancel;
    qry_solic_adm_.Append;
    qry_solic_adm_.EnableControls;
    qry_solic_adm_CD_UNID_NEG.AsString      := msk_cd_unid_neg.Text;
    if msk_dt_base.Text <> '' then qry_solic_adm_DT_LANCTO.AsDateTime := StrToDate( msk_dt_base.Text )
    else qry_solic_adm_DT_LANCTO.AsDateTime := dt_server;

    qry_solic_adm_VL_LANCTO.AsFloat      := 0;
    qry_solic_adm_TP_NATUREZA.AsString   := 'D';
    qry_solic_adm_TP_LANCAMENTO.AsString := 'C';
    qry_solic_adm_CD_STATUS_ADM.AsString := '0'; // Em processamento
    qry_solic_adm_IN_SOLICITADO.AsString := '0';

    qry_ult_lancto_.Close;
    qry_ult_lancto_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_ult_lancto_.ParamByName('DT_LANCTO').AsDateTime := StrToDate( msk_dt_base.Text );
    qry_ult_lancto_.Prepare;
    qry_ult_lancto_.Open;
    if qry_ult_lancto_NR_LANCAMENTO.AsString = '000' then
       qry_solic_adm_NR_LANCAMENTO.AsString := '001'
    else
       qry_solic_adm_NR_LANCAMENTO.AsString := qry_ult_lancto_NR_LANCAMENTO.AsString;

    qry_ult_lancto_.Close;
    pgctrl_solic_adm.ActivePage := ts_adm;
    pnl_solic_adm.Enabled := True;
    if dbedt_cd_acesso.Visible then dbedt_cd_acesso.SetFocus
    else dbedt_cd_ct_contabil.SetFocus;
  end;
end;

procedure Tfrm_solic_adm.btn_salvarClick(Sender: TObject);
begin
  pgctrl_solic_adm.ActivePage := ts_adm;
  if pnl_solic_adm.Enabled then pnl_solic_adm.SetFocus;
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

function Tfrm_solic_adm.Consiste : Boolean;
begin
  Consiste := True;

  if datm_solic_adm.qry_solic_adm_.State in [dsInsert, dsEdit] then // Solicitação
  begin
    if Not lNaoConsiste then
    begin
      // Conta Contábil
      if ( Trim( dbedt_cd_ct_contabil.Text ) = '' ) then
      begin
        BoxMensagem('Campo Conta Contábil deve ser preenchido!', 2);
        pgctrl_solic_adm.ActivePage := ts_adm;
        dbedt_cd_ct_contabil.SetFocus;
        Consiste := False;
        Exit;
      end;

      // Data de Vencimento
      if ( dbedt_dt_vencto.Text = '  /  /    ' ) or
         ( Trim( dbedt_dt_vencto.Text ) = '' ) then
      begin
        BoxMensagem( 'Campo Data de Vencimento deve ser preenchida!', 2 );
        pgctrl_solic_adm.ActivePage := ts_adm;
        dbedt_dt_vencto.SetFocus;
        Consiste := False;
        Exit;
      end;

      // Valor
      if ( datm_solic_adm.qry_solic_adm_VL_LANCTO.AsFloat = 0 ) then
      begin
        BoxMensagem('Campo Valor do Lançamento deve ser maior que zero!', 2);
        pgctrl_solic_adm.ActivePage := ts_adm;
        dbedt_vl_pagto.SetFocus;
        Consiste := False;
        Exit;
      end;

      // Favorecido
      if dbedt_cd_favorecido.Text = '' then
      begin
        BoxMensagem('Campo Favorecido deve ser preenchido!', 2);
        pgctrl_solic_adm.ActivePage := ts_adm;
        dbedt_cd_favorecido.SetFocus;
        Consiste := False;
        Exit;
      end;

      // Centro de Custo
      if dbedt_cd_ct_custo.Text = '' then
      begin
        BoxMensagem('Campo Centro de Custo deve ser preenchido!', 2);
        pgctrl_solic_adm.ActivePage := ts_adm;
        dbedt_cd_ct_custo.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if Not ( datm_solic_adm.qry_solic_adm_.State in [dsEdit, dsInsert] ) then Exit;
    if ( Trim( dbedt_cd_ct_contabil.Text ) <> '' ) and
       ( Trim( dbedt_nm_ct_contabil.Text ) = '' ) then
    begin
      BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2 );
      pgctrl_solic_adm.ActivePage := ts_adm;
      dbedt_cd_ct_contabil.SetFocus;
      Consiste := False;
      Exit;
    end;

    // Favorecido 
    if Not ( datm_solic_adm.qry_solic_adm_.State in [dsEdit, dsInsert] ) then Exit;
    ValidCodigo( dbedt_cd_favorecido );
    if dbedt_cd_favorecido.Text <> '' then
    begin
      if dbedt_nm_favorecido.Text = '' then
      begin
        BoxMensagem('Código do Favorecido inválido!', 2);
        pgctrl_solic_adm.ActivePage := ts_adm;
        dbedt_cd_favorecido.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    // Histórico
    ValidCodigo( dbedt_cd_historico );
    if dbedt_cd_historico.Text <> '' then
    begin
      if dbedt_nm_historico.Text = '' then
      begin
        BoxMensagem('Código do Histórico inválido!', 2);
        pgctrl_solic_adm.ActivePage := ts_adm;
        dbedt_cd_historico.SetFocus;
        Consiste := False;
        Exit;
      end
      else
      begin
        if datm_solic_adm.qry_solic_adm_TX_HISTORICO.AsString = '' then
        begin
          if datm_solic_adm.qry_historico_.Locate( 'CD_HISTORICO', datm_solic_adm.qry_solic_adm_CD_HISTORICO.AsString, [loCaseInsensitive] ) then
          begin
            datm_solic_adm.qry_solic_adm_.FieldByName('TX_HISTORICO').Assign( datm_solic_adm.qry_historico_.FieldByName('TX_HISTORICO') );
          end;
        end;
      end;
    end;

    // Centro Custo
    if Not ( datm_solic_adm.qry_solic_adm_.State in [dsEdit, dsInsert] ) then Exit;
    ValidCodigo( dbedt_cd_favorecido );
    if dbedt_cd_ct_custo.Text <> '' then
    begin
      if dbedt_nm_custo.Text = '' then
      begin
        BoxMensagem('Código do Centro de Custo inválido!', 2);
        pgctrl_solic_adm.ActivePage := ts_adm;
        dbedt_cd_ct_custo.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

  end;
end;

function Tfrm_solic_adm.Grava : Boolean;
var
  Falha : Boolean;
begin
  Falha := False;
  Grava := False;
  if datm_solic_adm.qry_solic_adm_.State in [dsInsert, dsEdit] then // Solicitação
  begin
    try
      datm_main.db_broker.StartTransaction;

      with datm_solic_adm do
      begin
        qry_solic_adm_CD_USUARIO_SOLIC.AsString := str_cd_usuario;
        qry_solic_adm_.Post;
        Abre_Adm;
      end;
      if Not Falha then
      begin
        datm_main.db_broker.Commit;
        Grava     := True;
        incluindo := False;
      end;
    except
      on E: Exception do
      begin
        datm_solic_adm.qry_solic_adm_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
    Btn_Mi( st_incluir, False, False, st_excluir );
  end;
end;

procedure Tfrm_solic_adm.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;      mi_incluir.Enabled  := Inc;
  btn_salvar.Enabled   := Salv;     mi_salvar.Enabled   := Salv;
  btn_Cancelar.Enabled := Canc;     mi_Cancelar.Enabled := Canc;
  btn_solic.Enabled    := Not Salv; mi_solic.Enabled    := Not Salv;
end;

procedure Tfrm_solic_adm.dbnvgBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if datm_solic_adm.qry_solic_adm_.State in [dsInsert, dsEdit] then
     datm_solic_adm.qry_solic_adm_.Cancel;
end;

procedure Tfrm_solic_adm.pgctrl_solic_pagtoChange(Sender: TObject);
begin
  btn_incluir.Enabled := True;
  mi_incluir.Enabled  := True;
end;

procedure Tfrm_solic_adm.dbedt_cd_favorecidoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_solic_adm.msk_cd_unid_negExit(Sender: TObject);
begin
  if ( datm_solic_adm.qry_solic_adm_.State in [dsEdit, dsInsert] ) or
     ( Trim( msk_cd_unid_neg.Text ) = cd_unid_neg ) then Exit;
  if Trim( msk_cd_unid_neg.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_unid_neg );
    with datm_solic_adm do
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

procedure Tfrm_solic_adm.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_solic_adm do
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

procedure Tfrm_solic_adm.btn_co_ct_contabilClick(Sender: TObject);
var
  cd_ct_cont : String[10];
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2245';
  Application.CreateForm(Tfrm_ct_contabil, frm_ct_contabil);
  frm_ct_contabil.Cons_OnLine := datm_solic_adm.qry_solic_adm_CD_CT_CONTABIL;
  with frm_ct_contabil do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_solic_adm.qry_solic_adm_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
         datm_solic_adm.qry_solic_adm_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_solic_adm do
  begin
    cd_ct_cont := qry_solic_adm_CD_CT_CONTABIL.AsString;
    qry_ct_contabil_.Close;
    qry_ct_contabil_.Prepare;
    qry_ct_contabil_.Open;
    qry_solic_adm_CD_CT_CONTABIL.AsString := '';
    dbedt_cd_ct_contabilExit(nil);
    qry_solic_adm_CD_CT_CONTABIL.AsString := cd_ct_cont;
  end;
  vStr_cd_modulo := st_modulo;
  str_cd_rotina := st_rotina;
  dbedt_cd_ct_contabilExit(nil);
end;

function Tfrm_solic_adm.VerAlt;
begin
  VerAlt := True;
  if datm_solic_adm.qry_solic_adm_.State in [dsInsert, dsEdit] then
  begin
   if ( ( datm_solic_adm.qry_solic_adm_.State in [dsEdit] ) and st_modificar ) or
       ( datm_solic_adm.qry_solic_adm_.State in [dsInsert] ) then
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

procedure Tfrm_solic_adm.Abre_Adm;
var
  cd_unid_neg: String[2];
  dt_lancto  : TDateTime;
  cd_ct_contabil : String;
  nr_lancamento : String[3];
begin
  if ( Trim( msk_cd_unid_neg.Text ) = '' ) or ( msk_dt_base.Text = '  /  /    '  ) then Exit;
  with datm_solic_adm do
  begin
    cd_unid_neg    := qry_solic_adm_CD_UNID_NEG.AsString;
    dt_lancto      := qry_solic_adm_DT_LANCTO.AsDateTime;
    cd_ct_contabil := qry_solic_adm_CD_CT_CONTABIL.AsString;
    nr_lancamento  := qry_solic_adm_NR_LANCAMENTO.AsString;

    qry_solic_adm_.Close;
    qry_solic_adm_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_solic_adm_.ParamByName('DT_LANCTO').AsDateTime := StrToDate( msk_dt_base.Text );
    qry_solic_adm_.Prepare;
    qry_solic_adm_.Open;
    qry_solic_adm_.Locate( 'CD_UNID_NEG;DT_LANCTO;CD_CT_CONTABIL;NR_LANCAMENTO', VarArrayOf([cd_unid_neg, dt_lancto, cd_ct_contabil, nr_lancamento ]), [loCaseInsensitive] );
  end;
end;

procedure Tfrm_solic_adm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_solic_adm.btn_co_processoClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_consulta_processo,frm_consulta_processo);
  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg.Text;
  frm_consulta_processo.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;
end;


procedure Tfrm_solic_adm.btn_co_favorecidoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2208';
  Application.CreateForm(Tfrm_Favor, frm_Favor);
  frm_Favor.Cons_OnLine := datm_solic_adm.qry_solic_adm_CD_FAVORECIDO;
  with frm_Favor do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_solic_adm.qry_solic_adm_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_solic_adm.qry_solic_adm_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;

  with datm_solic_adm do
  begin
    qry_favorecido_.Close;
    qry_favorecido_.Prepare;
    qry_favorecido_.Open;
  end;
  vStr_cd_modulo := st_modulo;
  str_cd_rotina := st_rotina;
  dbedt_cd_favorecidoExit(nil);
end;

procedure Tfrm_solic_adm.dbedt_cd_ct_contabilExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_solic_adm.dbedt_cd_ct_contabilChange(Sender: TObject);
begin
  if datm_solic_adm.qry_solic_adm_.State in [ dsInsert, dsEdit ] then
  begin
    btn_mi( False, True, True, False );
  end;
end;

procedure Tfrm_solic_adm.msk_cd_unid_negEnter(Sender: TObject);
begin
  cd_unid_neg := msk_cd_unid_neg.Text;
end;

procedure Tfrm_solic_adm.btn_marca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Visible    := False;
  btn_desmarca_todas.Visible := True;
  btn_desmarca_todas.Left    := btn_marca_todas.Left;
  datm_solic_adm.qry_solic_adm_.First;
  for i := 0 to datm_solic_adm.qry_solic_adm_.RecordCount - 1 do
  begin
    dbgrdSolicAdm.SelectedRows.CurrentRowSelected := True;
    datm_solic_adm.qry_solic_adm_.Next;
  end;
end;

procedure Tfrm_solic_adm.btn_desmarca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Visible    := True;
  btn_desmarca_todas.Visible := False;
  if dbgrdSolicAdm.SelectedRows.Count > 0 then
     TTable(dbgrdSolicAdm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSolicAdm.SelectedRows[0]));
  for i := 0 to dbgrdSolicAdm.SelectedRows.Count - 1 do
  begin
    dbgrdSolicAdm.SelectedRows.CurrentRowSelected := False;
    if dbgrdSolicAdm.SelectedRows.Count > 0 then
      TTable(dbgrdSolicAdm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSolicAdm.SelectedRows[0]))
    else Break;
  end;
end;

procedure Tfrm_solic_adm.btn_solicClick(Sender: TObject);
var
  i : Integer;
begin
  Solicitando          := True;
  btn_cancelar.Enabled := True;
  mi_cancelar.Enabled  := True;

  with datm_solic_adm do
  begin
    if qry_solic_adm_.State in [dsInsert, dsEdit] then
    begin
      if Not Consiste then
      begin
        btn_desmarca_todasClick(nil);
        Exit;
      end;
      if Not Grava then
      begin
        btn_desmarca_todasClick(nil);
        Exit;
      end;
    end;

    pgctrl_solic_adm.ActivePage := ts_lista;
    qry_solic_adm_.First;
    while Not qry_solic_adm_.EOF do
    begin
      if dbgrdSolicAdm.SelectedRows.CurrentRowSelected then
      begin
        if dbedt_cd_favorecido.Text = '' then
        begin
          BoxMensagem( 'Campo Favorecido deve ser preenchido!', 2 );
          btn_desmarca_todasClick(nil);
          pgctrl_solic_adm.ActivePage := ts_adm;
          dbedt_cd_favorecido.SetFocus;
          Exit;
        end;
      end;
      qry_solic_adm_.Next;
    end;
  end;

  if dbgrdSolicAdm.SelectedRows.Count > 0 then
     TTable(dbgrdSolicAdm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSolicAdm.SelectedRows[0]));
  for i:= 0 to dbgrdSolicAdm.SelectedRows.Count - 1 do
  begin
    if ( datm_solic_adm.qry_solic_adm_IN_SOLICITADO.AsString = '0' ) and
       ( Not ( datm_solic_adm.qry_solic_adm_CD_STATUS_ADM.AsInteger in [4, 7, 15, 16, 17, 18] ) )then
    begin
      try
        datm_main.db_broker.StartTransaction;

        if Not ( datm_solic_adm.qry_solic_adm_.State in [dsEdit, dsInsert] ) then
           datm_solic_adm.qry_solic_adm_.Edit;

        datm_solic_adm.qry_solic_adm_CD_STATUS_ADM.AsString := '16';  // Liberado pelo Sistema

        datm_solic_adm.qry_solic_adm_IN_SOLICITADO.AsString    := '1';

        datm_solic_adm.qry_solic_adm_.Post;

        datm_main.db_broker.Commit;
      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      end;
    end;

    if CancelaOperacao then
    begin
      if BoxMensagem('Cancela a operação?', 1) then
      begin
        Cancelado            := True;
        CancelaOperacao      := False;
        Solicitando          := False;
        btn_cancelar.Enabled := False;
        mi_cancelar.Enabled  := False;
        Close;
        btn_desmarca_todasClick(nil);
        Exit;
      end
      else CancelaOperacao := False;
    end;

    dbgrdSolicAdm.SelectedRows.CurrentRowSelected := False;
    if dbgrdSolicAdm.SelectedRows.Count > 0 then
      TTable(dbgrdSolicAdm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSolicAdm.SelectedRows[0]))
    else Break;
  end;
  Solicitando          := False;
  CancelaOperacao      := False;
  Cancelado            := False;
  btn_cancelar.Enabled := False;
  mi_cancelar.Enabled  := False;
  btn_desmarca_todasClick(nil);
  Abre_Adm;
end;

procedure Tfrm_solic_adm.btn_canc_lancClick(Sender: TObject);
begin
  with datm_solic_adm do
  begin
    if Not BoxMensagem( 'Confirma cancelamento da Conta Contábil ' + qry_solic_adm_LookCtContabil.AsString + '?', 1) then Exit;

    qry_rel_liq_.Close;
    qry_rel_liq_.ParamByName('CD_UNID_NEG').AsString    := qry_solic_adm_CD_UNID_NEG.AsString;
    qry_rel_liq_.ParamByName('CD_CT_CONTABIL').AsString := qry_solic_adm_CD_CT_CONTABIL.AsString;
    qry_rel_liq_.ParamByName('TP_NATUREZA').AsString    := qry_solic_adm_TP_NATUREZA.AsString;
    qry_rel_liq_.ParamByName('DT_LANCTO').AsDateTime    := qry_solic_adm_DT_LANCTO.AsDateTime;
    qry_rel_liq_.ParamByName('NR_LANCAMENTO').AsString  := qry_solic_adm_NR_LANCAMENTO.AsString;
    qry_rel_liq_.Prepare;
    qry_rel_liq_.Open;
    if qry_rel_liq_TOT_LIQ.AsInteger > 0 then
    begin
      BoxMensagem('Conta Contábil pertence a relatório de reembolso já liquidado!', 2);
      qry_rel_liq_.Close;
      Exit;
    end;
    qry_rel_liq_.Close;

    if qry_solic_adm_CD_STATUS_ADM.AsString = '7' then
    begin
      BoxMensagem('Conta Contábil paga!', 2);
      Exit;
    end;

    if qry_solic_adm_CD_STATUS_ADM.AsString = '18' then
    begin
      BoxMensagem('Conta Contábil recebida!', 2);
      Exit;
    end;

    if ( qry_solic_adm_CD_STATUS_ADM.AsString = '4' ) then
    begin
      BoxMensagem('Conta Contábil cancelada!', 2);
      Exit;
    end;

    try
      datm_main.db_broker.StartTransaction;
      if Not ( qry_solic_adm_.State in [dsEdit, dsInsert] ) then qry_solic_adm_.Edit;
      qry_solic_adm_CD_STATUS_ADM.AsString := '4';
      qry_solic_adm_IN_SOLICITADO.AsString := '0';
      qry_solic_adm_.Post;
      datm_main.db_broker.Commit;
    except
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      qry_solic_adm_.Cancel;
    end;
  end;
end;

procedure Tfrm_solic_adm.msk_dt_baseExit(Sender: TObject);
begin
  if ( datm_solic_adm.qry_solic_adm_.State in [dsEdit, dsInsert] ) or
     ( Trim( msk_dt_base.Text ) = dt_base ) then Exit;
  if Trim( msk_dt_base.Text ) <> '' then
  begin
    Abre_Adm;
  end;
end;

procedure Tfrm_solic_adm.dbedt_cd_acessoEnter(Sender: TObject);
begin
  cd_acesso := dbedt_cd_acesso.Text;
end;

procedure Tfrm_solic_adm.dbedt_cd_auxEnter(Sender: TObject);
begin
  cd_aux := dbedt_cd_aux.Text;
end;

procedure Tfrm_solic_adm.dbedt_cd_acessoExit(Sender: TObject);
begin
  if dbedt_cd_acesso.Text = cd_acesso then Exit;
  with datm_solic_adm do
  begin
    if ( Trim( dbedt_cd_acesso.Text ) <> '' ) and ( Trim( dbedt_cd_aux.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_.Close;
      qry_ct_contabil_unica_.ParamByName('CD_ACESSO_AUX').AsString := Trim( dbedt_cd_acesso.Text ) + Trim( dbedt_cd_aux.Text );
      qry_ct_contabil_unica_.Prepare;
      qry_ct_contabil_unica_.Open;
      if qry_ct_contabil_unica_.RecordCount > 0 then
      begin
        if qry_solic_adm_.State in [dsEdit, dsInsert] then  qry_solic_adm_CD_CT_CONTABIL.AsString := qry_ct_contabil_unica_CD_CT_CONTABIL.AsString;
      end
      else
      begin
        BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2);
      end;
      qry_ct_contabil_unica_.Close;
    end;
  end;
end;

procedure Tfrm_solic_adm.dbedt_cd_auxExit(Sender: TObject);
begin
  if dbedt_cd_aux.Text = cd_aux then Exit;
  with datm_solic_adm do
  begin
    if ( Trim( dbedt_cd_acesso.Text ) <> '' ) and ( Trim( dbedt_cd_aux.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_.Close;
      qry_ct_contabil_unica_.ParamByName('CD_ACESSO_AUX').AsString := Trim( dbedt_cd_acesso.Text ) + Trim( dbedt_cd_aux.Text );
      qry_ct_contabil_unica_.Prepare;
      qry_ct_contabil_unica_.Open;
      if qry_ct_contabil_unica_.RecordCount > 0 then
      begin
        if qry_solic_adm_.State in [dsEdit, dsInsert] then qry_solic_adm_CD_CT_CONTABIL.AsString := qry_ct_contabil_unica_CD_CT_CONTABIL.AsString;
      end
      else
      begin
        BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2);
      end;
      qry_ct_contabil_unica_.Close;
    end;
  end;
end;

procedure Tfrm_solic_adm.msk_dt_baseEnter(Sender: TObject);
begin
  dt_base := msk_dt_base.Text;
end;

procedure Tfrm_solic_adm.dbedt_dt_venctoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_solic_adm.dbedt_vl_pagtoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_solic_adm.dbedt_cd_historicoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_solic_adm.dbedt_cd_ct_contabilKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg      then btn_co_unid_negClick(nil);
    if Sender = dbedt_cd_favorecido  then btn_co_favorecidoClick(nil);
    if Sender = dbedt_cd_ct_contabil then btn_co_ct_contabilClick(nil);
    if Sender = dbedt_cd_historico   then btn_co_historicoClick(nil);
    if Sender = dbedt_cd_ct_custo    then btn_co_custoClick(nil);
  end;
end;

procedure Tfrm_solic_adm.btn_co_historicoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2248';
  Application.CreateForm(Tfrm_hist_padrao, frm_hist_padrao);
  frm_hist_padrao.Cons_OnLine := datm_solic_adm.qry_solic_adm_CD_HISTORICO;
  with frm_hist_padrao do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_solic_adm.qry_solic_adm_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_solic_adm.qry_solic_adm_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;

  with datm_solic_adm do
  begin
    qry_historico_.Close;
    qry_historico_.Prepare;
    qry_historico_.Open;
  end;
  vStr_cd_modulo := st_modulo;
  str_cd_rotina := st_rotina;
  dbedt_cd_historicoExit(nil);
end;


procedure Tfrm_solic_adm.pgctrl_solic_admChange(Sender: TObject);
begin
  if pgctrl_solic_adm.ActivePage = ts_lista then
  begin
    btn_marca_todas.Enabled    := True;
    btn_desmarca_todas.Enabled := True;
    btn_solic.Enabled          := True;
    mi_solic.Enabled           := True;
  end
  else
  begin
    btn_marca_todas.Enabled    := False;
    btn_desmarca_todas.Enabled := False;
    btn_solic.Enabled          := False;
    mi_solic.Enabled           := False;
  end;
end;

procedure Tfrm_solic_adm.dbedt_cd_ct_custoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_solic_adm.btn_co_custoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if Not ( datm_solic_adm.qry_solic_adm_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
         datm_solic_adm.qry_solic_adm_.Edit;
   datm_solic_adm.qry_solic_adm_CD_CT_CUSTO.AsString := ConsultaOnLineEx('TCONTABIL_CUSTO','Centro Custo',['CD_CT_CUSTO','NM_CT_CUSTO'],['Código','Descrição'],'CD_CT_CUSTO',nil);
  end
  else
  begin
    dbedt_nm_custo.Text := ConsultaLookUp( 'TCONTABIL_CUSTO', 'CD_CT_CUSTO', datm_solic_adm.qry_solic_adm_CD_CT_CUSTO.AsString, 'NM_CT_CUSTO' );
  end;
end;

end.
