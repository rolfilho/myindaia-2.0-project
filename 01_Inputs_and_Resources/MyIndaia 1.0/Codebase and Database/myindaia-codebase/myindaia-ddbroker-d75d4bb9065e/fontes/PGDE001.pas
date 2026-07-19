(*************************************************************************************************
Sistema: Controle de Demurrage

PROGRAMA: PGDE001.PAS - frm_dem_cntr - Contêineres

AUTOR: Leandro Stipanich

DATA: 15/07/2002

Manutenção: Leandro Stipanich
*************************************************************************************************)
unit PGDE001;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, DBCGrids, ToolEdit, RXDBCtrl, Funcoes, ConsOnLineEx;

type
  Tfrm_dem_cntr = class(TForm)
    pgctrl_dem_cntr: TPageControl;
    pnl_manut_proc: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    ts_cntr: TTabSheet;
    dbgrd_cntr: TDBGrid;
    btn_proc_realiza: TSpeedButton;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_proc_realiza: TMenuItem;
    mi_sair: TMenuItem;
    btn_fat: TSpeedButton;
    btn_manut_proc: TSpeedButton;
    mi_manut_proc: TMenuItem;
    ts_dep: TTabSheet;
    ts_av_lav: TTabSheet;
    dbgrd_dep: TDBGrid;
    dbgrd_av_lav: TDBGrid;
    pnl_cntr: TPanel;
    lbl_nr_cntr: TLabel;
    lbl_dt_ent_arm: TLabel;
    lbl_tipo: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    dbedt_nr_cntr: TDBEdit;
    dblckp_box_tp_cntr: TDBLookupComboBox;
    dbedt_dt_ent: TDBEdit;
    dblckpbox_tp_dias: TDBLookupComboBox;
    lbl_dt_demurrage: TLabel;
    lbl_demurrage: TLabel;
    lbl_free_time: TLabel;
    Label300: TLabel;
    Label2: TLabel;
    lbl_status: TLabel;
    dblckpbox_demurrage: TDBLookupComboBox;
    dbedt_nr_free_time: TDBEdit;
    dbedt_dt_dias_corridos: TDBEdit;
    dbedt_nm_status: TDBEdit;
    pnl_dep: TPanel;
    pnl_av_lav: TPanel;
    Label7: TLabel;
    lbl_banco: TLabel;
    btn_co_banco: TSpeedButton;
    dbedt_nr_cntr1: TDBEdit;
    dbedt_nm_banco: TDBEdit;
    lbl_vl_deposito: TLabel;
    Label8: TLabel;
    lbl_depositado: TLabel;
    lbl_devolvido: TLabel;
    dbedt_vl_deposito: TDBEdit;
    dbedt_tx_conversao: TDBEdit;
    dblckpbox_depositado: TDBLookupComboBox;
    dblckpbox_devolvido: TDBLookupComboBox;
    Label9: TLabel;
    lbl_obs: TLabel;
    lbl_vl_avaria: TLabel;
    lbl_avaria: TLabel;
    dbedt_nr_cntr2: TDBEdit;
    dbedt_vl_avaria: TDBEdit;
    dblckpbox_avaria: TDBLookupComboBox;
    dbm_obs_avaria: TDBMemo;
    lbl_vl_lavagem: TLabel;
    lbl_lavagem: TLabel;
    dbedt_vl_lavagem: TDBEdit;
    dblckpbox_lavagem: TDBLookupComboBox;
    Label13: TLabel;
    dbedt_dt_dias_cobrar: TDBEdit;
    dbedt_dt_ent_arm: TDBDateEdit;
    dbedt_dt_demurrage: TDBDateEdit;
    dbedt_dt_devolucao: TDBDateEdit;
    mi_fat: TMenuItem;
    Label15: TLabel;
    Panel1: TPanel;
    dblckpbox_repassa_tp_dias: TDBLookupComboBox;
    lbl_via_transp: TLabel;
    msk_nr_processo: TMaskEdit;
    lbl_nr_processo: TLabel;
    btn_co_processo: TSpeedButton;
    btn_co_produto: TSpeedButton;
    edt_nm_produto: TEdit;
    msk_cd_produto: TMaskEdit;
    lbl_cd_produto: TLabel;
    btn_co_unid_neg: TSpeedButton;
    edt_nm_unid_neg: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    lbl_cd_unid_neg: TLabel;
    Panel2: TPanel;
    Label5: TLabel;
    dbedt_nr_processo2: TDBEdit;
    Panel3: TPanel;
    Label4: TLabel;
    dbedt_nr_processo1: TDBEdit;
    dbedt_cd_banco: TDBEdit;
    procedure btn_sairClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure pgctrl_dem_cntrChange(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure dbnvgBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure pgctrl_dem_cntrChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure dbedt_nr_cntrChange(Sender: TObject);
    procedure btn_proc_realizaClick(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure msk_nr_processoEnter(Sender: TObject);
    procedure msk_nr_processoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbedt_nr_cntrExit(Sender: TObject);
    procedure btn_manut_procClick(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure dbedt_cd_bancoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_dt_ent_armExit(Sender: TObject);
    procedure btn_fatClick(Sender: TObject);
    procedure dblckpbox_repassa_tp_diasEnter(Sender: TObject);
    procedure dblckpbox_repassa_tp_diasExit(Sender: TObject);
    procedure dbedt_cd_bancoChange(Sender: TObject);
  private
    st_modulo, st_rotina : String;
    lAbertura, lNaoConsiste : Boolean;
    cd_unid_neg_proc, cd_produto_proc : String[2];
    tp_dias : String[1];
    var_nr_proc : String[14];

    function Grava : Boolean;
    function Consiste : Boolean;
    function VerAlt : Boolean;
    function VerProcesso : Boolean;
    procedure Cancelar;
    procedure CodExits;
    procedure Abertura;
    function  VerUnidNegProduto : Boolean;

  public
    st_modificar, st_incluir, st_excluir : Boolean;
    pesq_nr_proc, pesq_cd_unid_neg, pesq_cd_prod : String;
    lCons_OnLine : Boolean;
    Cons_OnLine  : TStringField;
    Cons_OnLine_Texto : String;
    DtCarregAnt, DtEntrFabrAnt, DtRetCntrant, DtEntrPatio, DtDevolucao: String;
    procedure btn_mi(i:Boolean; s:Boolean; c:Boolean; e:Boolean);
    procedure VerCntr;
    procedure VerDep;
    procedure VerAvLav;
  end;

var
  frm_dem_cntr: Tfrm_dem_cntr;

implementation

uses GSMLIB, PGGP001, PGGP017, PGDE002, PGSM010, PGSM018, PGSM041, PGSM136, PGGP015;
{$R *.DFM}

procedure Tfrm_dem_cntr.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
  str_cd_rotina_atalho := '';
end;

procedure Tfrm_dem_cntr.msk_cd_unid_negExit(Sender: TObject);
begin
  with datm_dem_cntr do
  begin
    if cd_unid_neg_proc = msk_cd_unid_neg.Text then Exit;
    if ( Trim( msk_cd_unid_neg.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_unid_neg );
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
      qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if ( qry_unid_neg_.EOF ) then
      begin
        BoxMensagem( 'Unidade de Negócio não cadastrada ou Usuário sem direitos de acesso!', 2 );
        msk_cd_unid_neg.Text := '';
        edt_nm_unid_neg.Text := '';
        msk_nr_processo.Text := '';
        msk_cd_unid_neg.SetFocus;
        qry_unid_neg_.Close;
        Exit;
      end
      else
      begin
        if VerUnidNegProduto then
          edt_nm_unid_neg.Text := qry_unid_neg_.FieldByName('AP_UNID_NEG').AsString;
      end;
    end;
    qry_unid_neg_.Close;
  end;
end;

procedure Tfrm_dem_cntr.btn_co_produtoClick(Sender: TObject);
begin
{  Application.CreateForm(Tfrm_produto, frm_produto);

  with frm_produto do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
  msk_cd_produtoExit(nil);  }

  if Sender is TSpeedButton then begin
    msk_cd_produto.Text := ConsultaOnlineEx('TPRODUTO', 'Produtos', ['CD_PRODUTO', 'NM_PRODUTO'], ['Código', 'Descrição'], 'CD_PRODUTO', nil, 1, msk_cd_produto.Text);
    msk_cd_produtoExit(nil);
  end else
    edt_nm_produto.Text := ConsultaLookUp('TPRODUTO', 'CD_PRODUTO', msk_cd_produto.Text, 'AP_PRODUTO');
end;

procedure Tfrm_dem_cntr.pgctrl_dem_cntrChange(Sender: TObject);
begin
  btn_mi( False, False, False, False );

  with datm_dem_cntr do
  begin
    if ( pgctrl_dem_cntr.ActivePage = ts_cntr ) then
      btn_mi( st_incluir, False, False, st_excluir );

    if ( pgctrl_dem_cntr.ActivePage = ts_dep ) or
       ( pgctrl_dem_cntr.ActivePage = ts_av_lav ) then
      btn_mi( False, False, False, False );

    {DBNAVIGATOR}
    dbnvg.Enabled := True;

    if ( pgctrl_dem_cntr.ActivePage = ts_cntr ) then
    begin
      dbnvg.DataSource := ds_cntr;

      qry_cntr_.Close;
      qry_cntr_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                       Trim( msk_cd_produto.Text ) +
                                                       Trim( msk_nr_processo.Text );
      qry_cntr_.Prepare;
      qry_cntr_.Open;
    end;

    if ( pgctrl_dem_cntr.ActivePage = ts_dep ) then
    begin
      dbnvg.DataSource := ds_dep;

      qry_dep_.Close;
      qry_dep_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                      Trim( msk_cd_produto.Text ) +
                                                      Trim( msk_nr_processo.Text );
      qry_dep_.Prepare;
      qry_dep_.Open;
    end;

    if ( pgctrl_dem_cntr.ActivePage = ts_av_lav ) then
    begin
      dbnvg.DataSource := ds_av_lav;

      qry_av_lav_.Close;
      qry_av_lav_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                         Trim( msk_cd_produto.Text ) +
                                                         Trim( msk_nr_processo.Text );
      qry_av_lav_.Prepare;
      qry_av_lav_.Open;
    end;
  end;
end;

procedure Tfrm_dem_cntr.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_dem_cntr.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_dem_cntr.Cancelar;
begin
  with datm_dem_cntr do
  begin
    try
      if pgctrl_dem_cntr.ActivePage = ts_cntr then
      begin
        if qry_cntr_.State in [dsInsert, dsEdit] then
        begin
          qry_cntr_.Cancel;
          VerCntr;
        end;
      end;

      if pgctrl_dem_cntr.ActivePage = ts_dep then
      begin
        if qry_dep_.State in [dsInsert, dsEdit] then
        begin
          qry_dep_.Cancel;
          VerDep;
        end;
      end;

      if pgctrl_dem_cntr.ActivePage = ts_av_lav then
      begin
        if qry_av_lav_.State in [dsInsert, dsEdit] then
        begin
          qry_av_lav_.Cancel;
          VerAlt;
        end;
      end;

    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;

    if pgctrl_dem_cntr.ActivePage = ts_cntr then
      btn_mi( st_incluir, False, False, st_excluir );
    if ( pgctrl_dem_cntr.ActivePage = ts_dep ) or
       ( pgctrl_dem_cntr.ActivePage = ts_av_lav ) then
      btn_mi( False, False, False, False );
  end;
end;

procedure Tfrm_dem_cntr.dbnvgBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  btn_mi( False, False, False, False );
end;

function Tfrm_dem_cntr.Consiste;
begin
  with datm_dem_cntr do
  begin
    Consiste := True;
    {**************************************************************************}
    {Consistências de Contêineres}
    if pgctrl_dem_cntr.ActivePage = ts_cntr then
    begin
      if ( Not ( qry_cntr_.State in [dsInsert, dsEdit] ) ) then Exit;
      {Nº Contêiner}
      if Not lNaoConsiste then
      begin
        if dbedt_nr_cntr.Text = '' then
        begin
          BoxMensagem( 'Campo Nº Contêiner deve ser preenchido!', 2 );
          pgctrl_dem_cntr.ActivePage := ts_cntr;
          dbedt_nr_cntr.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

    {Consistências de Depósitos}
    if pgctrl_dem_cntr.ActivePage = ts_dep then
    begin
      if ( qry_dep_.State in [dsInsert, dsEdit] ) then
      begin;
        {Banco}
        ValidCodigo( dbedt_cd_banco );
        if dbedt_cd_banco.Text <> '' then
        begin
          if dbedt_nm_banco.Text = '' then
          begin
            BoxMensagem( 'Código do Banco inválido!', 2 );
            pgctrl_dem_cntr.ActivePage := ts_dep;
            dbedt_cd_banco.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_dem_cntr.FormClose(Sender: TObject;
   var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_dem_cntr do
    begin
      cd_unid_neg_gestao := msk_cd_unid_neg.Text;
      cd_prod_gestao     := msk_cd_produto.Text;
      if Trim( msk_nr_processo.Text ) <> '' then
      begin
        nr_processo_gestao := Trim( msk_cd_unid_neg.Text ) +
                              Trim( msk_cd_produto.Text ) +
                              Trim( msk_nr_processo.Text );
      end
      else
        str_nr_processo    := '';

      qry_produto_.Close;
      qry_unid_neg_.Close;
      qry_yes_no_.Close;
      qry_banco_.Close;

      qry_usuario_habilitacao_.Close;
      qry_cntr_.Close;
      qry_dep_.Close;
      qry_av_lav_.Close;
      qry_processo_.Close;

      Destroy;
      Action := caFree;
    end;
  end
  else
    Action := caNone;
end;

procedure Tfrm_dem_cntr.btn_co_unid_negClick(Sender: TObject);
begin
{  Application.CreateForm(Tfrm_unidade, frm_unidade);

  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
  msk_cd_unid_negExit(nil); }

  if Sender is TSpeedButton then begin
    msk_cd_unid_neg.Text := ConsultaOnlineEx('TUNID_NEG', '', ['CD_UNID_NEG', 'NM_UNID_NEG'], ['Código', 'Descrição'], 'CD_UNID_NEG', nil, 1, msk_cd_unid_neg.Text);
    msk_cd_unid_negExit(nil);
  end else
    edt_nm_unid_neg.Text := ConsultaLookUp('TUNID_NEG', 'CD_UNID_NEG', msk_cd_unid_neg.Text, 'AP_UNID_NEG');
end;

procedure Tfrm_dem_cntr.btn_incluirClick(Sender: TObject);
begin
  with datm_dem_cntr do
  begin
    if pgctrl_dem_cntr.ActivePage = ts_cntr then
    begin
      if qry_cntr_.State in [dsInsert] then
         qry_cntr_.Cancel;

      qry_cntr_.Append;
      qry_cntr_NR_PROCESSO.AsString   := qry_processo_NR_PROCESSO.AsString;

      qry_dt_ent_.Close;
      qry_dt_ent_.ParamByName('NR_PROCESSO').AsString := Trim( qry_cntr_NR_PROCESSO.AsString );
      qry_dt_ent_.Prepare;
      qry_dt_ent_.Open;
      if Not qry_dt_ent_.EOF then
      begin
        if Not qry_dt_ent_DT_REALIZACAO.IsNull then
          qry_cntr_DT_ENT.AsDateTime := qry_dt_ent_DT_REALIZACAO.AsDateTime;
      end;
      qry_dt_ent_.Close;

      qry_cntr_IN_DESOVA.AsString     := '0';
      qry_cntr_TP_DIAS.AsString       := '1';
      qry_cntr_IN_DEMURRAGE.AsString  := '0';
      qry_cntr_IN_DEPOSITADO.AsString := '0';
      qry_cntr_IN_DEVOLVIDO.AsString  := '0';
      qry_cntr_IN_AVARIA.AsString     := '0';
      qry_cntr_IN_LAVAGEM.AsString    := '0';
      qry_cntr_TP_CNTR.AsString       := '01';
      qry_cntr_IN_MESQUITA.AsString   := '0';
      pnl_cntr.Enabled                := True;
      dbedt_nr_cntr.SetFocus;
    end;
  end;

  btn_mi( False, True, True, False );
end;

procedure Tfrm_dem_cntr.btn_excluirClick(Sender: TObject);
begin
  if pgctrl_dem_cntr.ActivePage = ts_cntr then
  begin
    if BoxMensagem( 'Este Contêiner será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
    try
      datm_main.db_broker.StartTransaction;
      datm_dem_cntr.qry_cntr_.Delete;
      VerCntr;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_dem_cntr.qry_cntr_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;

  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_dem_cntr.btn_mi(i:Boolean; s:Boolean; c:Boolean; e:Boolean);
begin
  btn_incluir.Enabled  := False;  mi_incluir.Enabled   := i;
  btn_salvar.Enabled   := s;  mi_salvar.Enabled    := s;
  btn_Cancelar.Enabled := c;  mi_Cancelar.Enabled  := c;
  btn_excluir.Enabled  := e;  mi_excluir.Enabled   := e;
end;

procedure Tfrm_dem_cntr.pgctrl_dem_cntrChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_dem_cntr.VerAlt : Boolean;
begin
  VerAlt := True;
  with datm_dem_cntr do
  begin
    if ( qry_cntr_.State in [dsEdit, dsInsert] ) or
       ( qry_dep_.State in [dsEdit, dsInsert] ) or
       ( qry_av_lav_.State in [dsEdit, dsInsert] ) then
    begin
      if BoxMensagem( 'Cadastro de Contêineres foi alterado.' + #13#10 +'Deseja salvar as alterações?', 1 ) then
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

procedure Tfrm_dem_cntr.CodExits;
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_dem_cntr.VerCntr;
begin
  with datm_dem_cntr do
  begin
    if Not ( qry_cntr_.State in [dsInactive] ) then
    begin
      pnl_cntr.Enabled := ( Not qry_cntr_NR_FREE_TIME.IsNull ) and ( qry_cntr_NR_FREE_TIME.AsString <> '' )
    end;
  end;
end;

procedure Tfrm_dem_cntr.VerDep;
begin
  with datm_dem_cntr do
  begin
    if Not ( qry_dep_.State in [dsInactive] ) then
    begin
      if Not qry_dep_.EOF then
        pnl_dep.Enabled := True
      else
        pnl_dep.Enabled := False;
    end;
  end;
end;

procedure Tfrm_dem_cntr.VerAvLav;
begin
  with datm_dem_cntr do
  begin
    if Not ( qry_av_lav_.State in [dsInactive] ) then
    begin
      if Not qry_av_lav_.EOF then
        pnl_av_lav.Enabled := True
      else
        pnl_av_lav.Enabled := False;
    end;
  end;
end;

function Tfrm_dem_cntr.Grava : Boolean;
var
  NrProcessoAnt, NrCntrAnt : String;
begin
  with datm_dem_cntr do
  begin
    try
      datm_main.db_broker.StartTransaction;

      NrProcessoAnt := qry_cntr_NR_PROCESSO.AsString;
      NrCntrAnt := qry_cntr_NR_CNTR.AsString;

      if pgctrl_dem_cntr.ActivePage = ts_cntr then
      begin
        if qry_cntr_.State in [ dsInsert, dsEdit ] then
        begin
          if ( (DtCarregAnt <> qry_cntr_DT_CARREGAMENTO.AsString) or
               (DtEntrFabrAnt <> qry_cntr_DT_ENTREGA_FABRICA.AsString) or
               (DtRetCntrAnt <> qry_cntr_DT_RET_CNTR_FABRICA.AsString) or
               (DtEntrPatio <> qry_cntr_DT_ENTRADA_PATIO_TRANSP.AsString) or
               (DtDevolucao <> qry_cntr_DT_DEVOLUCAO_CNTR.AsString) ) then
          begin
            qry_cntr_IN_MESQUITA.AsString := '0';
          end;

          qry_cntr_.Post;
          qry_cntr_.Edit;
          if qry_cntr_IN_DEMURRAGE.AsString = '1' then
          begin
            CloseStoredProc( sp_calc_dt_demurrage );
            sp_calc_dt_demurrage.ParamByName('@nr_processo').AsString := qry_cntr_NR_PROCESSO.AsString;
            sp_calc_dt_demurrage.ParamByName('@nr_cntr').AsString     := qry_cntr_NR_CNTR.AsString;
            ExecStoredProc( sp_calc_dt_demurrage );
            if sp_calc_dt_demurrage.ParamByName('@dt_demurrage').AsDateTime <> 0 then
              qry_cntr_DT_DEMURRAGE.AsDateTime := sp_calc_dt_demurrage.ParamByName('@dt_demurrage').AsDateTime;
            CloseStoredProc( sp_calc_dt_demurrage );
          end
          else
          begin
            qry_cntr_DT_DEMURRAGE.AsVariant := null;
          end;
          qry_cntr_.Post;

          qry_cntr_.Close;
          qry_cntr_.Open;
          qry_cntr_.Locate('NR_PROCESSO;NR_CNTR',
            VarArrayOf( [NrProcessoAnt, NrCntrAnt]), [loCaseInsensitive] );
          VerCntr;
        end;
      end;

      if pgctrl_dem_cntr.ActivePage = ts_dep then
      begin
        NrProcessoAnt := qry_dep_NR_PROCESSO.AsString;
        NrCntrAnt     := qry_dep_NR_CNTR.AsString;
        if qry_dep_.State in [ dsInsert, dsEdit ] then
        begin
          qry_dep_.Post;
          qry_dep_.Close;
          qry_dep_.Open;
          qry_dep_.Locate('NR_PROCESSO;NR_CNTR',
            VarArrayOf( [NrProcessoAnt, NrCntrAnt]), [loCaseInsensitive] );
          VerDep;
        end;
      end;

      if pgctrl_dem_cntr.ActivePage = ts_av_lav then
      begin
        NrProcessoAnt := qry_av_lav_NR_PROCESSO.AsString;
        NrCntrAnt     := qry_av_lav_NR_CNTR.AsString;
        if qry_av_lav_.State in [ dsInsert, dsEdit ] then
        begin
          qry_av_lav_.Post;
          qry_av_lav_.Close;
          qry_av_lav_.Open;
          qry_av_lav_.Locate('NR_PROCESSO;NR_CNTR',
            VarArrayOf( [NrProcessoAnt, NrCntrAnt]), [loCaseInsensitive] );
          VerAvLav;
        end;
      end;

      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        qry_cntr_.Cancel;
        qry_dep_.Cancel;
        qry_av_lav_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
    if pgctrl_dem_cntr.ActivePage = ts_cntr then
      btn_mi( st_incluir, False, False, st_excluir );
    if ( pgctrl_dem_cntr.ActivePage = ts_dep ) or
       ( pgctrl_dem_cntr.ActivePage = ts_av_lav ) then
      btn_mi( False, False, False, False );
  end;
end;

procedure Tfrm_dem_cntr.msk_cd_produtoExit(Sender: TObject);
begin
  with datm_dem_cntr do
  begin
    if cd_produto_proc = msk_cd_produto.Text then Exit;
    if ( Trim( msk_cd_produto.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_produto );
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_produto_.ParamByName('CD_PRODUTO').AsString := Trim( msk_cd_produto.Text );
      qry_produto_.Prepare;
      qry_produto_.Open;
      if ( qry_produto_.EOF ) then
      begin
        BoxMensagem( 'Produto não cadastrado ou Usuário sem direitos de acesso!', 2 );
        msk_cd_produto.Text := '';
        edt_nm_produto.Text := '';
        msk_nr_processo.Text := '';
        msk_cd_produto.SetFocus;
        qry_produto_.Close;
        Exit;
      end
      else
      begin
        if VerUnidNegProduto then
          edt_nm_produto.Text := qry_produto_.FieldByName('AP_PRODUTO').AsString;
      end;
    end;
    qry_produto_.Close;
  end;
end;

function Tfrm_dem_cntr.VerUnidNegProduto : Boolean;
var
  nr_processo : String;
begin
  with datm_dem_cntr do
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;

    VerUnidNegProduto := True;
    if ( Trim( msk_cd_unid_neg.Text ) <> '' ) and ( Trim( msk_cd_produto.Text ) <> '' ) then
    begin
      // abre queries
      qry_usuario_habilitacao_.Close;
      qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_usuario_habilitacao_.Prepare;
      qry_usuario_habilitacao_.Open;
      if Not qry_usuario_habilitacao_.Locate('CD_UNID_NEG;CD_PRODUTO', VarArrayOf([ Trim( msk_cd_unid_neg.Text ), Trim( msk_cd_produto.Text )]), [loCaseInsensitive]) then
      begin
        BoxMensagem( 'Unidade x Produto não encontrado ou sem habilitação para o usuário!', 2 );
        edt_nm_unid_neg.Text        := '';
        edt_nm_produto.Text         := '';
        msk_nr_processo.Text        := '';
        VerUnidNegProduto           := False;
      end
      else
      begin
        Screen.Cursor := crHourGlass;
        Application.ProcessMessages;
        edt_nm_unid_neg.Text := qry_usuario_habilitacao_.FieldByName('AP_UNID_NEG').AsString;
        edt_nm_produto.Text  := qry_usuario_habilitacao_.FieldByName('AP_PRODUTO').AsString;
        nr_processo          := qry_processo_NR_PROCESSO.AsString;

        qry_processo_.Close;
        qry_processo_.ParamByName('NR_PROCESSO').AsString := nr_processo;
        qry_processo_.Prepare;
        qry_processo_.Open;

        Screen.Cursor := crDefault;
        Application.ProcessMessages;
      end;
    end
    else
       edt_nm_unid_neg.Text := '';

    Screen.Cursor := crDefault;
    Application.ProcessMessages;
  end;
end;

procedure Tfrm_dem_cntr.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    str_cd_rotina_atalho := '';
    Close;
  end;
end;

procedure Tfrm_dem_cntr.Abertura;
begin
  with datm_dem_cntr do
  begin
    if ( ( pesq_cd_unid_neg <> '' ) and
         ( pesq_cd_prod     <> '' ) and
         ( pesq_nr_proc     <> '' ) ) then
    begin
      str_nr_processo := pesq_nr_proc;
    end;

    if Trim( str_nr_processo ) = '' then
    begin
      if lAbertura then
      begin
        msk_nr_processo.Text := '';
        var_nr_proc          := '';
      end;
    end
    else
    begin
      msk_cd_unid_neg.Text := Copy( str_nr_processo, 1, 2 );
      msk_cd_produto.Text  := Copy( str_nr_processo, 3, 2 );
      msk_nr_processo.Text := Copy( str_nr_processo, 5, 14 );
      VerProcesso;
    end;

    ds_processo.AutoEdit  := st_modificar;
    ds_cntr.AutoEdit := st_modificar;
  end;
end;

procedure Tfrm_dem_cntr.msk_cd_unid_negEnter(Sender: TObject);
begin
  cd_unid_neg_proc := msk_cd_unid_neg.Text;
end;

procedure Tfrm_dem_cntr.msk_cd_produtoEnter(Sender: TObject);
begin
  cd_produto_proc := msk_cd_produto.Text;
end;

procedure Tfrm_dem_cntr.dbedt_nr_cntrChange(Sender: TObject);
begin
  with datm_dem_cntr do
  begin
    if Not lAbertura then
    begin
      if ( qry_cntr_.State in [ dsInsert, dsEdit ] ) then
         btn_mi( False, True, True, False );
      if ( qry_dep_.State in [ dsInsert, dsEdit ] ) then
         btn_mi( False, True, True, False );
      if ( qry_av_lav_.State in [ dsInsert, dsEdit ] ) then
         btn_mi( False, True, True, False );
    end;
  end;
end;

procedure Tfrm_dem_cntr.btn_proc_realizaClick(Sender: TObject);
begin
  str_cd_rotina_atalho := '0110';

  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_dem_cntr.btn_co_processoClick(Sender: TObject);
{begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm( Tfrm_consulta_processo, frm_consulta_processo );
  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := msk_cd_produto.Text;
  frm_consulta_processo.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if ( frm_consulta_processo.Nr_Processo <> '' ) then
  begin
    msk_nr_processo.Text := Copy( frm_consulta_processo.Nr_Processo, 5, 14 );
    msk_nr_processoExit(nil);
  end;  }
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''' + msk_cd_produto.Text  + '''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  msk_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil, msk_nr_processo.Text);
  vListAux.Free;
end;

procedure Tfrm_dem_cntr.msk_nr_processoExit(Sender: TObject);
begin
  with datm_dem_cntr do
  begin
    if Trim( msk_nr_processo.Text ) <> '' then
    begin
      if Not VerProcesso then
      begin
        pgctrl_dem_cntr.Enabled := False;
        msk_nr_processo.SetFocus;
        Exit;
      end
      else
      begin
        pgctrl_dem_cntr.Enabled := True;
        VerCntr;
        str_nr_processo := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
        pgctrl_dem_cntr.SetFocus;
      end;
    end
    else
    begin
      pgctrl_dem_cntr.Enabled := False;
      btn_mi( False, False, False, False );
      qry_cntr_.Close;
      qry_dep_.Close;
      qry_av_lav_.Close;
    end;

  qry_transp_.Close;
  qry_transp_.ParamByName('NR_PROCESSO').AsString := Trim( qry_cntr_NR_PROCESSO.AsString );
  qry_transp_.Prepare;
  qry_transp_.Open;

  label15.Caption := (qry_transp_AP_TRANSP_ROD.AsString );
  end;
end;

function Tfrm_dem_cntr.VerProcesso;
begin
  VerProcesso := True;
  if ( Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text ) ) =
     var_nr_proc then Exit;

  with datm_dem_cntr do
  begin
    qry_processo_.Close;
    qry_processo_.UnPrepare;
    qry_processo_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                         Trim( msk_cd_produto.Text ) +
                                                         Trim( msk_nr_processo.Text );
    qry_processo_.Prepare;
    qry_processo_.Open;
    if qry_processo_.RecordCount = 0 then
    begin
      qry_processo_.Close;
      BoxMensagem( 'Processo não encontrado! Digite novamente!', 2 );
      VerProcesso := False;
      Exit;
    end;

    if qry_processo_IN_CANCELADO.AsString = '1' then
    begin
      qry_processo_.Close;
      BoxMensagem( 'Processo Cancelado! Digite novamente!', 2 );
      VerProcesso := False;
      Exit;
    end;

    if qry_processo_IN_LIBERADO.AsString = '0' then
    begin
      qry_processo_.Close;
      BoxMensagem( 'Processo não está liberado! Digite novamente!', 2 );
      VerProcesso := False;
      Exit;
    end;

    if qry_processo_IN_PRODUCAO.AsString = '0' then
    begin
      qry_processo_.Close;
      BoxMensagem( 'Processo não está na produção! Digite novamente!', 2 );
      VerProcesso := False;
      Exit;
    end;

    pgctrl_dem_cntr.ActivePage := ts_cntr;

    qry_cntr_.Close;
    qry_cntr_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                     Trim( msk_cd_produto.Text ) +
                                                     Trim( msk_nr_processo.Text );
    qry_cntr_.Prepare;
    qry_cntr_.Open;

    if Trim( str_nr_cntr ) <> '' then
    begin
      qry_cntr_.Locate( 'NR_CNTR', str_nr_cntr, [loPartialKey ] );
      str_nr_cntr := '';
    end;
  end;
end;

procedure Tfrm_dem_cntr.msk_nr_processoEnter(Sender: TObject);
begin
  var_nr_proc := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
end;

procedure Tfrm_dem_cntr.msk_nr_processoChange(Sender: TObject);
begin
  if datm_dem_cntr.qry_processo_.Active then
     datm_dem_cntr.qry_processo_.Close;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_dem_cntr.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_dem_cntr, datm_dem_cntr );
end;

procedure Tfrm_dem_cntr.dbedt_nr_cntrExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_dem_cntr.btn_manut_procClick(Sender: TObject);
begin
  str_cd_rotina_atalho := '0102';

  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_dem_cntr.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(btn_co_unid_neg);
    if Sender = msk_cd_produto  then btn_co_produtoClick(btn_co_produto);
    if Sender = msk_nr_processo then btn_co_processoClick(btn_co_processo);
    if Sender = dbedt_cd_banco  then btn_co_bancoClick(btn_co_banco);
  end;

  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;
end;

procedure Tfrm_dem_cntr.btn_co_bancoClick(Sender: TObject);
begin
{  vStr_cd_modulo := '22';
  str_cd_rotina := '2216';

  with datm_dem_cntr do
  begin
    Application.CreateForm( Tfrm_banco, frm_banco );
    with frm_banco do
    begin
      Cons_OnLine := qry_dep_CD_BANCO_CAUCAO;
      lCons_OnLine := True;
      if ( st_modificar ) and Not ( qry_dep_.State in [dsEdit] ) then
         qry_dep_.Edit;
      Caption := Caption + ' [Consulta On-Line]';
      ShowModal;
      lCons_OnLine := False;
    end;
    dbedt_cd_bancoExit(nil);
  end;

  vStr_cd_modulo := '01';
  str_cd_rotina := '0126';    }

  if Sender is TSpeedButton then begin
    if ( st_modificar ) and Not ( datm_dem_cntr.qry_dep_.State in [dsEdit] ) then
       datm_dem_cntr.qry_dep_.Edit;
    datm_dem_cntr.qry_dep_CD_BANCO_CAUCAO.AsString := ConsultaOnlineEx('TBANCO', 'Bancos', ['CD_BANCO', 'NM_BANCO'], ['Código', 'Descrição'], 'CD_BANCO', nil, 1, datm_dem_cntr.qry_dep_CD_BANCO_CAUCAO.AsString);
    dbedt_cd_bancoExit(nil);
  end else
    dbedt_nm_banco.Text := ConsultaLookUp('TBANCO', 'CD_BANCO', datm_dem_cntr.qry_dep_CD_BANCO_CAUCAO.AsString, 'NM_BANCO');
end;

procedure Tfrm_dem_cntr.dbedt_cd_bancoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_dem_cntr.FormShow(Sender: TObject);
begin
  pnl_manut_proc.Color := clMenuBroker;
  // Rotinas de FormCreate
  st_modulo    := vStr_cd_modulo;
  st_rotina    := str_cd_rotina;
  var_nr_proc  := '';

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  // Fim Rotinas de FormCreate

  pgctrl_dem_cntr.ActivePage := ts_cntr;

  with datm_dem_cntr do
  begin
    qry_yes_no_.Close;
    qry_yes_no_.Prepare;
    qry_yes_no_.Open;
  end;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);

  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_produtoExit(nil);

  lAbertura := True;
  Abertura;
  lAbertura := False;

  lNaoConsiste               := False;
  pgctrl_dem_cntr.ActivePage := ts_cntr;

  if Trim( str_nr_processo ) = '' then
  begin
    btn_mi( False, False, False, False );
    msk_nr_processo.SetFocus;
  end
  else
  begin
    msk_nr_processoExit(nil);
    msk_nr_processo.SetFocus;
  end;
end;

procedure Tfrm_dem_cntr.dbedt_dt_ent_armExit(Sender: TObject);
begin
  with datm_dem_cntr do
  begin
    if Not ( qry_cntr_.State in [dsEdit, dsInsert] ) then Exit;
    if qry_cntr_IN_DEMURRAGE.AsString = '1' then
    begin
      CloseStoredProc( sp_calc_dt_demurrage );
      sp_calc_dt_demurrage.ParamByName('@nr_processo').AsString := qry_cntr_NR_PROCESSO.AsString;
      sp_calc_dt_demurrage.ParamByName('@nr_cntr').AsString     := qry_cntr_NR_CNTR.AsString;
      ExecStoredProc( sp_calc_dt_demurrage );
      if sp_calc_dt_demurrage.ParamByName('@dt_demurrage').AsDateTime <> 0 then
      begin
        dbedt_dt_demurrage.Text := FormatDateTime( FData, sp_calc_dt_demurrage.ParamByName('@dt_demurrage').AsDateTime );
        qry_cntr_DT_DEMURRAGE.AsDateTime := sp_calc_dt_demurrage.ParamByName('@dt_demurrage').AsDateTime;
      end
      else
      begin
        dbedt_dt_demurrage.Text := '  /  /    ';
        qry_cntr_DT_DEMURRAGE.AsVariant := null;
      end;
      CloseStoredProc( sp_calc_dt_demurrage );
    end
    else
    begin
      dbedt_dt_demurrage.Text := '  /  /    ';
      qry_cntr_DT_DEMURRAGE.AsVariant := null;
    end;
  end;
end;

procedure Tfrm_dem_cntr.btn_fatClick(Sender: TObject);
begin
  str_cd_rotina_atalho := '0127';

  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_dem_cntr.dblckpbox_repassa_tp_diasEnter(Sender: TObject);
begin
  tp_dias := datm_dem_cntr.qry_tp_dias_TP_DIAS.AsString;
end;

procedure Tfrm_dem_cntr.dblckpbox_repassa_tp_diasExit(Sender: TObject);
begin
  with datm_dem_cntr do
  begin
    if ( Trim( qry_tp_dias_TP_DIAS.AsString ) <> tp_dias ) and ( Trim( qry_tp_dias_TP_DIAS.AsString ) <> '' ) then
    begin
      if BoxMensagem( 'Deseja repassar este Tipo de Contagem de dias para todos os Contêineres?', 1 ) then
      begin
        try
          datm_main.db_broker.StartTransaction;
          CloseStoredProc( sp_repassa_tp_dias );
          sp_repassa_tp_dias.ParamByName('@nr_processo').AsString := qry_cntr_NR_PROCESSO.AsString;
          sp_repassa_tp_dias.ParamByName('@tp_dias').AsString     := Trim( qry_tp_dias_TP_DIAS.AsString );
          ExecStoredProc( sp_repassa_tp_dias );
          CloseStoredProc( sp_repassa_tp_dias );
          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
        qry_cntr_.Close;
        qry_cntr_.Prepare;
        qry_cntr_.Open;
      end;
    end;
  end;
end;


procedure Tfrm_dem_cntr.dbedt_cd_bancoChange(Sender: TObject);
begin
  dbedt_nr_cntrChange(nil);
  btn_co_bancoClick(nil);
end;

end.

