unit PGSM059;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, UCRPE32, RxDBComb, Funcoes, DateUtils, DBTables;

type
  Tfrm_item = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    pgctrl_item: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_nm_item: TLabel;
    lbl_cd_item: TLabel;
    lblAtivo: TLabel;
    dbedt_nm_item: TDBEdit;
    dbedt_cd_item: TDBEdit;
    dblkpcbox_ativo: TDBLookupComboBox;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    dblckbox_tipo_item: TDBLookupComboBox;
    lbl_tipo_item: TLabel;
    Label1: TLabel;
    dbedt_nm_ingles: TDBEdit;
    Label2: TLabel;
    dbedt_nm_apelido: TDBEdit;
    lbl_item_di: TLabel;
    dblckpbox_item_di: TDBLookupComboBox;
    lbl_cpmf: TLabel;
    dblckpbox_cmpf: TDBLookupComboBox;
    lbl_ct_contabil: TLabel;
    btn_co_ct_contabil: TSpeedButton;
    lbl_acesso: TLabel;
    lbl_aux: TLabel;
    dbedt_cd_ct_contabil: TDBEdit;
    dbedt_cd_acesso: TDBEdit;
    dbedt_cd_aux: TDBEdit;
    lbl_reemb: TLabel;
    dblckpbox_reembolso: TDBLookupComboBox;
    lbl_diversos: TLabel;
    dblckpbox_diversos: TDBLookupComboBox;
    lbl_calcula_ir: TLabel;
    dblckpbox_calcula_ir: TDBLookupComboBox;
    lbl_nr_ordem_fat: TLabel;
    dbedt_nr_ordem_fat: TDBEdit;
    dbedt_cd_ct_gerencial: TDBEdit;
    btn_co_ct_gerencial: TSpeedButton;
    dbedt_nm_ct_gerencial: TDBEdit;
    lbl_ct_gerencial: TLabel;
    Label3: TLabel;
    dblckpbox_tributavel: TDBLookupComboBox;
    btn_imprimir: TSpeedButton;
    crp_item: TCrpe;
    lbl_solic_pagto: TLabel;
    dblckpbox_in_solic_pagto: TDBLookupComboBox;
    ts_area: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbl_taxa2: TLabel;
    btn_co_moeda: TSpeedButton;
    dbedt_vl_num_indice: TDBEdit;
    dbedt_vl_den_indice: TDBEdit;
    dbedt_calc_indice: TDBEdit;
    dblckbox_forma_rateio: TDBLookupComboBox;
    dbedt_cd_moeda: TDBEdit;
    dbedt_nm_moeda: TDBEdit;
    pnl_ts_area_indice: TPanel;
    dbedt_nm_item_ts_area: TDBEdit;
    dbedt_cd_item_ts_area: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBGrid1: TDBGrid;
    Label108: TLabel;
    btn_co_area: TSpeedButton;
    dbedt_cd_area: TDBEdit;
    dbedt_nm_area: TDBEdit;
    Label9: TLabel;
    btn_duplicar: TSpeedButton;
    mi_duplicar: TMenuItem;
    Label10: TLabel;
    dblckbox_ratear_li: TDBLookupComboBox;
    Label11: TLabel;
    dblckpbox_in_desp_alf: TDBLookupComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    Label12: TLabel;
    rdbgoup_tp_item: TDBRadioGroup;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    lb_sigla_iata: TLabel;
    dbluckup_tipo_base_calculo: TDBLookupComboBox;
    dbcombo_via_transp: TRxDBComboBox;
    dbedt_sigla_iata: TDBEdit;
    dbluckup_tipo_frete: TRxDBComboBox;
    Bevel1: TBevel;
    shp1: TShape;
    ts_Rateio: TTabSheet;
    DBEdit1: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit2: TDBEdit;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_cd_produto: TLabel;
    edt_nm_unid_neg: TEdit;
    edt_nm_produto: TEdit;
    btn_co_produto: TSpeedButton;
    Label25: TLabel;
    btn_rateio: TSpeedButton;
    dbedt_nm_custo: TEdit;
    dbedt_cd_ct_custo: TDBEdit;
    msk_cd_unid_neg: TDBEdit;
    msk_cd_produto: TDBEdit;
    dbedt_nm_ct_contabil: TEdit;
    ts_Group_Services: TTabSheet;
    Label18: TLabel;
    Label19: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    GridGroupServices: TDBGrid;
    Label20: TLabel;
    btn_group_services: TSpeedButton;
    dbedt_nm_Group_Service: TEdit;
    dbedt_cd_Group_Service: TDBEdit;
    Label21: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    dbNecessitaRecibo: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_itemChange(Sender: TObject);
    procedure pgctrl_itemChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_acessoEnter(Sender: TObject);
    procedure dbedt_cd_auxEnter(Sender: TObject);
    procedure dbedt_cd_acessoExit(Sender: TObject);
    procedure dbedt_cd_auxExit(Sender: TObject);
    procedure dbedt_cd_ct_contabilExit(Sender: TObject);
    procedure dbedt_cd_ct_contabilKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_ct_contabilClick(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_ct_gerencialExit(Sender: TObject);
    procedure btn_co_ct_gerencialClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure btn_co_areaClick(Sender: TObject);
    procedure btn_co_moedaClick(Sender: TObject);
    procedure dbedt_cd_areaChange(Sender: TObject);
    procedure dbedt_calc_indiceChange(Sender: TObject);
    procedure dbedt_vl_den_indiceExit(Sender: TObject);
    procedure dbedt_cd_areaExit(Sender: TObject);
    procedure dbedt_cd_moedaExit(Sender: TObject);
    procedure btn_duplicarClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_rateioClick(Sender: TObject);
    procedure dbedt_cd_ct_custoExit(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_group_servicesClick(Sender: TObject);
    procedure dbedt_cd_Group_ServiceExit(Sender: TObject);
  private
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..2] Of String[60];
    Pesquisa, st_modulo, st_rotina : String;
    cd_acesso, cd_aux : String[1];
    st_modificar, st_incluir, st_excluir : Boolean;
    lCancelar, lAbertura, lSalvar, lExcluir : Boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure Cancelar;
    procedure CodExits;
  public
    Code : Integer;
    lRecDesp, lRec, lRecDe1 : Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );    
  end;

var
  frm_item: Tfrm_item;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGSM060, PGSM168, PGSM170, pgsm212, PGSM048,
  PGSM033, ConsOnLineEx;

procedure Tfrm_item.FormCreate(Sender: TObject);
begin
  st_modulo    := vStr_cd_modulo;
  st_rotina    := str_cd_rotina;

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
  lRecDesp     := False;
  lRec         := False;
  lRecDe1      := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

 { Inicializa o Data Module para Itens}
  Application.CreateForm( Tdatm_item, datm_item );

  pnl_entrada_de_dados.Enabled := st_modificar;
  pnl_ts_area_indice.Enabled   := st_modificar;

  with datm_item do
  begin
    ds_item.AutoEdit       := st_modificar;
    ds_item_area_.AutoEdit := st_modificar;
    tbl_tipo_item.Open;
    tbl_yesno_.Open;
    qry_ttp_base_calc_frete.Open;

    qry_item_group_service.Open;
    qry_Group_Service.Open;

    qry_item_.Close;
    qry_item_.SQL[3] := 'NM_ITEM';
    if lRecDesp then qry_item_.SQL[1] := 'WHERE (CD_TIPO_ITEM = "D") OR (CD_TIPO_ITEM = "R" ) OR (CD_TIPO_ITEM = "X" ) OR (CD_TIPO_ITEM = "V" ) OR (CD_TIPO_ITEM = "N" )';
    if lRec     then qry_item_.SQL[1] := 'WHERE (CD_TIPO_ITEM = "R" )';
    if lRecDe1  then qry_item_.SQL[1] := 'WHERE (CD_TIPO_ITEM = "D" )';
    qry_item_.Prepare;
    qry_item_.Open;
  end;

  a_str_indices[0] := 'CD_ITEM';
  a_str_indices[1] := 'NM_ITEM';
  a_str_indices[2] := 'CD_CT_CONTABIL';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    Items.Add('Conta Contábil');
    ItemIndex := 1;
  end;

  btn_incluir.Enabled  := st_incluir;
  mi_incluir.Enabled   := st_incluir;
  btn_excluir.Enabled  := st_excluir;
  mi_excluir.Enabled   := st_excluir;
end;

procedure Tfrm_item.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  lNaoConsiste := False;
  lAbertura    := True;
  pgctrl_item.ActivePage := ts_lista;
  edt_chave.SetFocus;
  with datm_item do
  begin
    qry_item_.Close;
    qry_item_.SQL[3] := 'NM_ITEM';
    qry_item_.Prepare;
    if lRecDesp then qry_item_.SQL[1] := 'WHERE (CD_TIPO_ITEM = "D") OR (CD_TIPO_ITEM = "R" ) OR (CD_TIPO_ITEM = "X" ) OR (CD_TIPO_ITEM = "V" ) OR (CD_TIPO_ITEM = "N" )';
    if lRec     then qry_item_.SQL[1] := 'WHERE (CD_TIPO_ITEM = "R" )';
    if lRecDe1  then qry_item_.SQL[1] := 'WHERE (CD_TIPO_ITEM = "D" )';
    qry_item_.Open;

    qry_ct_contabilRM_.Close;
    qry_ct_contabilRM_.Prepare;
    qry_ct_contabilRM_.Open;

    qry_param_.Close;
    qry_param_.Prepare;
    qry_param_.Open;

    qry_item_area_.Close;
    qry_item_area_.Prepare;
    qry_item_area_.Open;

    qry_item_Rateio.Close;
    qry_item_Rateio.Prepare;
    qry_item_Rateio.Open;

    qry_tp_rateio_desp.Close;
    qry_tp_rateio_desp.Prepare;
    qry_tp_rateio_desp.Open;
    if qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then {RM Saldus}
    begin
      {Acesso}
      lbl_acesso.Visible                      := False;
      dbedt_cd_acesso.Visible                 := False;
      {Aux}
      lbl_aux.Visible                         := False;
      dbedt_cd_aux.Visible                    := False;
      {Conta Contábil}
      lbl_ct_contabil.Left                    := lbl_acesso.Left;
      dbedt_cd_ct_contabil.Left               := dbedt_cd_acesso.Left;
      dbedt_nm_ct_contabil.Left               := dbedt_cd_acesso.Left + 80;
      dbedt_nm_ct_contabil.Width              := dbedt_nm_ct_contabil.Width + 90;
      //dbedt_nm_ct_contabil.DataField          := 'LookCtContabilRM';
      //dbedt_nm_ct_gerencial.DataField         := 'LookCtGerencialRM';
      qry_item_.FieldByName('CD_CT_CONTABIL').EditMask := '';
    end
    else
    begin {ContMaster/SI}
      {Acesso}
      lbl_acesso.Visible                      := True;
      dbedt_cd_acesso.Visible                 := True;
      {Aux}
      lbl_aux.Visible                         := True;
      dbedt_cd_aux.Visible                    := True;
      {Conta Contábil}
      //dbedt_nm_ct_contabil.DataField          := 'LookCtContabil';
      //dbedt_nm_ct_gerencial.DataField         := 'LookCtGerencial';
      //qry_item_.FieldByName('CD_CT_CONTABIL').EditMask := '999.99.99999;0;_';
    end;
  end;
  lAbertura := False;
end;

procedure Tfrm_item.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  crp_item.Free;
  if VerAlt then
  begin
    with datm_item do
    begin
      qry_ct_contabil_.Close;
      qry_ct_contabilRM_.Close;
      tbl_tipo_item.Close;
      tbl_yesno_.Close;
      qry_item_.Close;
      qry_item_area_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_item.CodExits;
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_item.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_item.qry_item_CD_ITEM.AsString;
    except
      try
        Cons_OnLine_Texto := datm_item.qry_item_CD_ITEM.AsString;
      except
        BoxMensagem('Não consegui retornar Código do Item!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_item.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_item.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;
  btn_mi( False, True, True, False );

  if ( pgctrl_item.ActivePage=ts_dados_basicos ) or ( pgctrl_item.ActivePage=ts_lista ) then
  begin
    with datm_item do
    begin
      qry_item_.DisableControls;
      qry_item_.Cancel;
      qry_item_.Append;
      qry_item_.EnableControls;
      qry_item_CD_ITEM.AsString  := UltCod( qry_ult_item_, qry_ult_item_ULTIMO );
      qry_item_IN_ATIVO.AsString := '1';
      qry_item_IN_RECIBO.AsString := '1';
    end;
    pgctrl_item.ActivePage := ts_dados_basicos;
    pnl_ts_area_indice.Enabled := true;
    dbedt_nm_item.SetFocus;
  end;

  if pgctrl_item.ActivePage=ts_area then
  begin
    with datm_item do
    begin
      qry_item_area_.DisableControls;
      qry_item_area_.Cancel;
      qry_item_area_.Append;
      qry_item_area_.EnableControls;
      qry_item_area_CD_ITEM.AsString := qry_item_CD_ITEM.AsString;
      qry_item_area_IN_LI.AsString := '0'
    end;
    pgctrl_item.ActivePage := ts_area;
    dbedt_cd_area.SetFocus;
  end;

  if pgctrl_item.ActivePage = ts_Rateio then
  begin
    with datm_item do
    begin
      qry_Item_Rateio.DisableControls;
      qry_Item_Rateio.Append;
      qry_Item_Rateio.EnableControls;
    end;
    pgctrl_item.ActivePage := ts_Rateio;
    pnl_ts_area_indice.Enabled := true;
    msk_cd_unid_neg.SetFocus;
  end;

  if pgctrl_item.ActivePage = ts_Group_Services then
  begin
    with datm_item do
    begin
      GridGroupServices.Enabled := False;
      qry_item_group_service.DisableControls;
      qry_item_group_service.Append;
      qry_item_group_service.EnableControls;
//      qry_item_group_serviceCD_ITEM.AsString := UltCod( qry_ult_group_service, qry_ult_group_serviceULTIMO );
    end;
    dbedt_cd_Group_Service.SetFocus;
  end;
end;

procedure Tfrm_item.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if not Consiste then
    Exit;
  if not Grava then
    Exit;
end;

procedure Tfrm_item.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_item.Cancelar;
begin
  lCancelar := True;
  if pgctrl_item.ActivePage=ts_dados_basicos then
  begin
    try
      if datm_item.qry_item_.State in [dsInsert, dsEdit] then
      begin
        datm_item.qry_item_.Cancel;
        pgctrl_item.ActivePage := ts_dados_basicos;
        dbedt_nm_item.SetFocus;
      end;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
  end;

  if pgctrl_item.ActivePage=ts_area then
  begin
    try
      if datm_item.qry_item_area_.State in [dsInsert, dsEdit] then
      begin
      if datm_item.qry_item_area_.RecordCount = 0 then
      begin
        datm_item.qry_item_area_.Cancel;
        pnl_ts_area_indice.Enabled := false;
        pgctrl_item.ActivePage := ts_area;
      end
      else
      begin
        datm_item.qry_item_area_.Cancel;
        if datm_item.qry_item_area_.RecordCount = 0 then
          pnl_ts_area_indice.Enabled := false
        else
          pnl_ts_area_indice.Enabled := true;
        pgctrl_item.ActivePage := ts_area;
        dbedt_cd_area.SetFocus;
      end;
      end;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
  end;

  if pgctrl_item.ActivePage = ts_Rateio then
  begin
    try
      if datm_item.qry_item_Rateio.State in [dsInsert, dsEdit] then
      begin
      if datm_item.qry_item_Rateio.RecordCount = 0 then
      begin
        datm_item.qry_item_Rateio.Cancel;
        pnl_ts_area_indice.Enabled := false;
        pgctrl_item.ActivePage := ts_Rateio;
      end
      else
      begin
        datm_item.qry_item_Rateio.Cancel;
        if datm_item.qry_item_Rateio.RecordCount = 0 then
          pnl_ts_area_indice.Enabled := false
        else
          pnl_ts_area_indice.Enabled := true;
        pgctrl_item.ActivePage := ts_Rateio;
        msk_cd_unid_neg.SetFocus;
      end;
      end;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
  end;

  if pgctrl_item.ActivePage = ts_Group_Services then
  begin
    try
      if datm_item.qry_item_group_service.State in [dsInsert, dsEdit] then
        datm_item.qry_item_group_service.Cancel;
      GridGroupServices.Enabled := True;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
  end;

  lCancelar := False;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_item.btn_excluirClick(Sender: TObject);
var
  nr_item : String;
begin
  lExcluir := True;
  if ( pgctrl_item.ActivePage=ts_dados_basicos ) or ( pgctrl_item.ActivePage=ts_lista ) then
  begin
    if BoxMensagem( 'Este item será excluído!' + #13#10 +
                    'Áreas referentes ao item também serão excluídas.' + #13#10 +
                    'Confirma exclusão?', 1 ) then
    begin
      try
        datm_main.db_broker.StartTransaction;
        nr_item := datm_item.qry_item_CD_ITEM.AsString;
        datm_item.qry_item_.Delete;

        {Apagando as prioridades de todas as Unidades X Produtos }
        datm_item.qry_deleta_priori_.ParamByName('CD_ITEM').AsString := nr_item;
        datm_item.qry_deleta_priori_.Prepare;
        datm_item.qry_deleta_priori_.ExecSQL;

        {Apagando as áreas referentes ao item }
        datm_item.qry_deleta_area_.ParamByName('CD_ITEM').AsString := nr_item;
        datm_item.qry_deleta_area_.Prepare;
        datm_item.qry_deleta_area_.ExecSQL;

        datm_main.db_broker.Commit;

        with TQuery.Create(application) do
        begin
          DatabaseName := 'DBBROKER';
          SQL.Clear;
          SQL.Add(' DELETE FROM MYINDAIA.DBO.TITEM WHERE CD_ITEM = ''' + nr_item  + ''' ');
          ExecSQL;
          Free;
        end;
      except
        on E: Exception do
        begin
          datm_item.qry_item_.Cancel;
          datm_item.qry_item_area_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;
    pgctrl_item.ActivePage := ts_lista;
  end;

  if pgctrl_item.ActivePage=ts_area then
  begin
    if BoxMensagem( 'Este item x área será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) Then
    if datm_item.qry_item_area_.RecordCount = 0 then
      pnl_ts_area_indice.Enabled := false
    else
    begin
      datm_item.qry_item_area_.Delete;
      if datm_item.qry_item_area_.RecordCount = 0 then
        pnl_ts_area_indice.Enabled := false
      else
        pnl_ts_area_indice.Enabled := true;
    end;
    pgctrl_item.ActivePage := ts_area;
  end;

  if pgctrl_item.ActivePage = ts_Rateio then
  begin
    if not datm_item.qry_item_Rateio.IsEmpty then
    begin
      if BoxMensagem( 'Este Rateio de Receita será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) Then
      if datm_item.qry_item_Rateio.RecordCount = 0 then
        pnl_ts_area_indice.Enabled := false
      else
      begin
        datm_item.qry_item_Rateio.Delete;
        if datm_item.qry_item_Rateio.RecordCount = 0 then
          pnl_ts_area_indice.Enabled := false
        else
          pnl_ts_area_indice.Enabled := true;
      end;
      pgctrl_item.ActivePage := ts_Rateio;
    end
    else
      BoxMensagem( 'Não há Rateio de Receita para ser excluído!', 2 );
  end;

  if pgctrl_item.ActivePage = ts_Group_Services then
  begin
    if not datm_item.qry_item_group_service.IsEmpty then
    begin
      if BoxMensagem( 'Este Group Service será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
        datm_item.qry_item_group_service.Delete;
    end
    else
      BoxMensagem( 'Não há "Group Service" para ser excluído!', 2 );
  end;
  lExcluir := False;
end;

procedure Tfrm_item.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_item.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_item.qry_item_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_item.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_item.qry_item_CD_ITEM.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_item.qry_item_.Close;
  datm_item.qry_item_.SQL[3] := a_str_indices[cb_ordem.ItemIndex];
  if lRecDesp then datm_item.qry_item_.SQL[1] := 'WHERE (CD_TIPO_ITEM = "D") OR (CD_TIPO_ITEM = "R" ) OR (CD_TIPO_ITEM = "X" ) OR (CD_TIPO_ITEM = "V" ) OR (CD_TIPO_ITEM = "N" )';
  if lRec     then datm_item.qry_item_.SQL[1] := 'WHERE (CD_TIPO_ITEM = "R" )';
  datm_item.qry_item_.Open;
  Localiza(datm_item.qry_item_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

function Tfrm_item.Consiste : Boolean;
begin
  Consiste := True;
  if pgctrl_item.ActivePage = ts_dados_basicos then
  begin
    if dbedt_cd_item.Text = '' then
    begin
      BoxMensagem('Campo Cód. Item deve ser preenchido!', 2);
      pgctrl_item.ActivePage := ts_dados_basicos;
      dbedt_cd_item.SetFocus;
      Consiste := False;
      Exit;
    end;

    if dbedt_nm_item.Text = '' then
    begin
      BoxMensagem('Campo Descrição deve ser preenchido!', 2);
      pgctrl_item.ActivePage := ts_dados_basicos;
      dbedt_nm_item.SetFocus;
      Consiste := False;
      Exit;
    end;

    if datm_item.qry_item_CD_TIPO_ITEM.IsNull then
    begin
      BoxMensagem('Selecione o Tipo do Item!', 2);
      pgctrl_item.ActivePage := ts_dados_basicos;
      dblckbox_tipo_item.SetFocus;
      Consiste := False;
      Exit;
    end;

    if datm_item.qry_item_Look_TP_ITEM_ATIVO.AsString <> '1' then
    begin
      BoxMensagem('Esse Tipo de Item não esta disponível para o usuário corrente!', 2);
      pgctrl_item.ActivePage := ts_dados_basicos;
      dblckbox_tipo_item.SetFocus;
      Consiste := False;
      Exit;
    end;

    {Conta Contábil}
    if ( Trim( dbedt_cd_ct_contabil.Text ) = '' ) then
    begin
      BoxMensagem('Campo Conta Contábil deve ser preenchido!', 2);
      pgctrl_item.ActivePage := ts_dados_basicos;
      dbedt_cd_ct_contabil.SetFocus;
      Consiste := False;
      Exit;
    end;

    if ( Trim( dbedt_cd_ct_contabil.Text ) <> '' ) and
       ( Trim( dbedt_nm_ct_contabil.Text ) = '' ) then
    begin
      if datm_item.qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then {RM Saldus}
         BoxMensagem( 'Conta inválida!', 2 )
      else {ContMaster/SI}
         BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2 );
      pgctrl_item.ActivePage := ts_dados_basicos;
      dbedt_cd_ct_contabil.SetFocus;
      Consiste := False;
      Exit;
    end;

    if ( Trim( dbedt_cd_ct_gerencial.Text ) <> '' ) and
       ( Trim( dbedt_nm_ct_gerencial.Text ) = '' ) then
    begin
      BoxMensagem( 'Conta Gerencial inválida!', 2 );
      pgctrl_item.ActivePage := ts_dados_basicos;
      dbedt_cd_ct_gerencial.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  if pgctrl_item.ActivePage=ts_area then
  begin
    { Moeda }
    if ( datm_item.qry_item_area_.State in [dsEdit, dsInsert] ) then
    begin
      if ( Trim( dbedt_cd_moeda.Text ) <> '' ) then
      begin
        ValidCodigo( dbedt_cd_moeda );
        if dbedt_nm_moeda.Text = '' then
        begin
          BoxMensagem('Código da Moeda/Índice inválido!',2);
          pgctrl_item.ActivePage := ts_area;
          dbedt_cd_moeda.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

    if ( datm_item.qry_item_area_.State in [dsEdit, dsInsert] ) then
    begin
      if dbedt_cd_area.Text = '' then
      begin
        BoxMensagem('Campo Área deve ser preenchido!', 2);
        pgctrl_item.ActivePage := ts_area;
        dbedt_cd_area.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    { Área }
    if ( datm_item.qry_item_area_.State in [dsEdit, dsInsert] ) then
    begin
      if ( Trim( dbedt_cd_area.Text ) <> '' ) then
      begin
        ValidCodigo( dbedt_cd_area );
        if ( Trim ( dbedt_nm_area.Text ) = '' ) then
        begin
          BoxMensagem('Essa Área não está cadastrada!', 2);
          dbedt_nm_area.Text := '';
          pgctrl_item.ActivePage := ts_area;
          dbedt_cd_area.SetFocus;
        end;
      end;
    end;
  end;

  if pgctrl_item.ActivePage = ts_Rateio then
  begin
    if ( datm_item.qry_item_Rateio.State in [dsEdit, dsInsert] ) then
    begin
      if Trim(msk_cd_unid_neg.Text) <> '' then
      begin
        if edt_nm_unid_neg.Text = '' then
        begin
          BoxMensagem('Unidade de Negócio não cadastrada!', 2);
          edt_nm_unid_neg.Text         := '';
          pgctrl_item.ActivePage       := ts_Rateio;
          msk_cd_unid_neg.SetFocus;
          Consiste := False;
          Exit;
        end;

        {with datm_item do
        begin
          qry_unid_neg_.Close;
          qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
          qry_unid_neg_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '" AND ';
          qry_unid_neg_.Prepare;
          qry_unid_neg_.Open;
          if qry_unid_neg_.RecordCount > 0 then
          begin
            edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
          end
          else
          begin
            BoxMensagem('Unidade de Negócio não cadastrada!', 2);
            edt_nm_unid_neg.Text         := '';
            pgctrl_item.ActivePage       := ts_Rateio;
            msk_cd_unid_neg.SetFocus;
            Consiste := False;
            Exit;
          end;
        end}
      end;
      {else
      begin
        BoxMensagem('Unidade de Negócio precisa ser preenchida!', 2);
        msk_cd_unid_neg.SetFocus;
      end;}

      // Produto
      if msk_cd_produto.Text <> '' then
      begin
        if edt_nm_produto.Text = '' then
        begin
          BoxMensagem('Produto não cadastrado!', 2);
          edt_nm_produto.Text          := '';
          pgctrl_item.ActivePage       := ts_Rateio;
          msk_cd_produto.SetFocus;
          Consiste := False;
          Exit;
        end;

        {with datm_item do
        begin
          qry_produto_.Close;
          qry_produto_.SQL[2] := 'WHERE CD_PRODUTO = "' + msk_cd_produto.Text + '"';
          qry_produto_.Prepare;
          qry_produto_.Open;
          if qry_produto_.RecordCount > 0 then
          begin
            edt_nm_produto.Text := qry_produto_NM_PRODUTO.AsString;
          end
          else
          begin
            BoxMensagem('Produto não cadastrado!', 2);
            edt_nm_produto.Text          := '';
            pgctrl_item.ActivePage       := ts_Rateio;
            msk_cd_produto.SetFocus;
            Consiste := False;
            Exit;
          end;
        end}
      end;
      {else
      begin
        BoxMensagem('Produto precisa ser preenchido!', 2);
        msk_cd_produto.SetFocus;
      end;}

      if Trim(dbedt_cd_ct_custo.Text) <> '' then
      begin
        if dbedt_nm_custo.Text = '' then
        begin
          BoxMensagem('Rateio não cadastrado!', 2);
          dbedt_cd_ct_custo.Text          := '';
          pgctrl_item.ActivePage          := ts_Rateio;
          dbedt_cd_ct_custo.SetFocus;
          Consiste := False;
          Exit;
        end
      end;
      {else
      begin
        BoxMensagem('Rateio precisa ser preenchido!', 2);
        dbedt_cd_rateio.SetFocus;
      end;}
    end;
  end;

  if pgctrl_item.ActivePage = ts_Group_Services then
  begin
    if dbedt_cd_Group_Service.Text = '' then
    begin
      BoxMensagem('Campo Group Service deve ser preenchido!', 2);
      pgctrl_item.ActivePage := ts_Group_Services;
      dbedt_cd_Group_Service.SetFocus;
      Consiste := False;
      Exit;
    end;

    if ( datm_item.qry_item_group_service.State in [dsEdit, dsInsert] ) then
    begin
      if ( Trim( dbedt_cd_Group_Service.Text ) <> '' ) then
      begin
        ValidCodigo( dbedt_cd_Group_Service );
        if dbedt_nm_Group_Service.Text = '' then
        begin
          BoxMensagem('Código do Group Server inválido!',2);
          pgctrl_item.ActivePage := ts_Group_Services;
          dbedt_cd_Group_Service.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end;
end;

function Tfrm_item.Grava : Boolean;
var
  nr_item, Code : integer;
  cd_area : String[2];
  cd_item   : String[3];
begin
  Grava := False;
  lSalvar := True;
  if pgctrl_item.ActivePage=ts_dados_basicos then
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_item.qry_item_.State in [dsInsert, dsEdit] ) then
      begin
        if datm_item.qry_item_.State in [dsInsert] then
        begin
          {Inserindo a prioridade do item para todas as Unidades X Produto}
          with datm_item do
          begin
            if qry_unid_neg_prod_.Active then qry_unid_neg_prod_.Close;
            qry_unid_neg_prod_.Prepare;
            qry_unid_neg_prod_.Open;
            while Not qry_unid_neg_prod_.EOF do
            begin
              if qry_priori_item_.Active then qry_priori_item_.Close;
              qry_priori_item_.Prepare;
              qry_priori_item_.Open;
              qry_priori_item_.Append;
              qry_priori_item_CD_UNID_NEG.AsString := qry_unid_neg_prod_CD_UNID_NEG.AsString;
              qry_priori_item_CD_PRODUTO.AsString := qry_unid_neg_prod_CD_PRODUTO.AsString;
              qry_priori_item_CD_ITEM.AsString := qry_item_CD_ITEM.AsString;
              {Verificando número da última prioridade}
              Val(qry_item_CD_ITEM.AsString, nr_item, Code );
              qry_priori_item_NR_PRIORIDADE.AsInteger := nr_item;
              qry_priori_item_.Post;
              qry_unid_neg_prod_.Next;
            end;
          end;
        end;
        datm_item.qry_item_.Post;
        Pesquisa := datm_item.qry_item_CD_ITEM.AsString;
        datm_item.qry_item_.Close;
        if lRecDesp then datm_item.qry_item_.SQL[1] := 'WHERE (CD_TIPO_ITEM = "D") OR (CD_TIPO_ITEM = "R" ) OR (CD_TIPO_ITEM = "X" ) OR (CD_TIPO_ITEM = "V" ) OR (CD_TIPO_ITEM = "N" )';
        if lRec     then datm_item.qry_item_.SQL[1] := 'WHERE (CD_TIPO_ITEM = "R" )';
        datm_item.qry_item_.Prepare;
        datm_item.qry_item_.Open;
        Localiza(datm_item.qry_item_, Pesquisa, a_str_indices[0] );
      end;
      datm_main.db_broker.Commit;

      with TQuery.Create(application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add(' DELETE FROM MYINDAIA.DBO.TITEM WHERE CD_ITEM = ''' + Pesquisa  + ''' ');
        ExecSQL;
        SQL.Clear;
        SQL.Add(' INSERT INTO MYINDAIA.DBO.TITEM ( ');
        SQL.Add(' CD_ITEM, NM_ITEM, CD_TIPO_ITEM, CD_TIPO_LANC_FAT, IN_ATIVO, IN_CPMF, CD_CT_CONTABIL, CD_CT_CUSTO, IN_CONSOLIDA, CD_FORMA_RATEIO, ');
        SQL.Add(' CD_TIPO_AVON, IN_DOLAR,IN_FAV_SM, CD_CT_GERENCIAL, CD_FILIAL, NM_APELIDO, NM_ITEM_INGLES, IN_ITEM_DI, CD_ACESSO, CD_AUX,');
        SQL.Add(' IN_REEMBOLSO, IN_DIVERSOS, IN_CALCULA_IR, NR_ORDEM_FAT, IN_TRIBUTAVEL, IN_SOLIC_PAGTO, IN_DESP_ALF, IN_REEMB_FINANC, TP_ITEM, ');
        SQL.Add(' CD_IATA, CD_ITEM_CONTABIL, CD_HIST_CONTABIL, IN_CALC_IN381, TP_FRETE, TP_BASE_CALCULO, CD_VIA_TRANSPORTE, NM_ITEM_ESPANHOL ) ');
        SQL.Add(' SELECT CD_ITEM, NM_ITEM, CD_TIPO_ITEM, CD_TIPO_LANC_FAT, IN_ATIVO, IN_CPMF, CD_CT_CONTABIL, CD_CT_CUSTO, IN_CONSOLIDA, CD_FORMA_RATEIO, ');
        SQL.Add(' CD_TIPO_AVON, IN_DOLAR,IN_FAV_SM, CD_CT_GERENCIAL, CD_FILIAL, NM_APELIDO, NM_ITEM_INGLES, IN_ITEM_DI, CD_ACESSO, CD_AUX, ');
        SQL.Add(' IN_REEMBOLSO, IN_DIVERSOS, IN_CALCULA_IR, NR_ORDEM_FAT, IN_TRIBUTAVEL, IN_SOLIC_PAGTO, IN_DESP_ALF, IN_REEMB_FINANC, TP_ITEM  , ');
        SQL.Add(' CD_IATA, CD_ITEM_CONTABIL, CD_HIST_CONTABIL, IN_CALC_IN381, TP_FRETE, TP_BASE_CALCULO, CD_VIA_TRANSPORTE, NM_ITEM_ESPANHOL ');
        SQL.Add(' FROM TITEM (NOLOCK) WHERE IN_ATIVO = ''1'' AND CD_ITEM = ''' + Pesquisa + ''' ');
        ExecSQL;
        Free;
      end;
      Grava := True;
    except
      on E: Exception do
      begin
        datm_item.qry_item_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;

  if pgctrl_item.ActivePage=ts_area then
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_item.qry_item_area_.State in [dsInsert, dsEdit] ) then
      begin
        with datm_item.qry_item_area_ do
        begin
          cd_area := datm_item.qry_item_area_CD_AREA.AsString;
          cd_item := datm_item.qry_item_area_CD_ITEM.AsString;
          Post;
          Close;
          Prepare;
          Open;
          Locate('CD_AREA;CD_ITEM', VarArrayOf([cd_area, cd_item]), [loCaseInsensitive]);
        end;
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        datm_item.qry_item_area_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end
  end;

  if pgctrl_item.ActivePage = ts_Rateio then
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_item.qry_item_Rateio.State in [dsInsert, dsEdit] ) then
      begin
        with datm_item.qry_item_Rateio do
        begin
          //cd_area := datm_item.qry_item_area_CD_AREA.AsString;
          cd_item := datm_item.qry_item_area_CD_ITEM.AsString;
          Post;
          Close;
          Prepare;
          Open;
          {datm_item.qry_produto_.Close;
          datm_item.qry_produto_.Open;
          datm_item.qry_Unidade.Close;
          datm_item.qry_Unidade.Open;}
          //Locate('CD_AREA;CD_ITEM', VarArrayOf([cd_area, cd_item]), [loCaseInsensitive]);
        end;
      end;
      datm_main.db_broker.Commit;
      datm_item.qry_produto_.Close;
      Grava := True;
    except
      on e: Exception do
      begin
        datm_item.qry_item_Rateio.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
        Exit;
      end;
    end
  end;
  if pgctrl_item.ActivePage = ts_Group_Services then
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_item.qry_item_group_service.State in [dsInsert, dsEdit] ) then
      begin
        with datm_item.qry_item_group_service do
        begin
          Post;
          Close;
          Prepare;
          Open;
        end;
      end;
      datm_main.db_broker.Commit;
      Grava := True;
      GridGroupServices.Enabled := True;
    except
      on e: Exception do
      begin
//        datm_item.qry_item_group_service.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
        Exit;
      end;
    end
  end;

  lSalvar := False;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_item.pgctrl_itemChange(Sender: TObject);
begin
  btn_duplicar.Enabled := false;
  mi_duplicar.Enabled  := false;
  if (pgctrl_item.ActivePage = ts_lista ) then
  begin
    dbnvg.Enabled     := True;
    edt_chave.Enabled := True;
    cb_ordem.Enabled  := True;
  end
  else
  begin
    dbnvg.Enabled     := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled  := False;
  end;

  if ( pgctrl_item.ActivePage = ts_area ) then
  begin
    if ( st_modificar <> false ) then
    begin
      btn_duplicar.Enabled := true;
      mi_duplicar.Enabled  := true;
      if datm_item.qry_item_area_.RecordCount = 0 then
        pnl_ts_area_indice.Enabled := false
      else
        pnl_ts_area_indice.Enabled := true
    end
    else
      pnl_ts_area_indice.Enabled := false; 
  end;
end;

procedure Tfrm_item.pgctrl_itemChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  ActiveControl := nil;
  AllowChange := VerAlt;
end;

function Tfrm_item.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_item.qry_item_.State in [dsEdit] ) and st_modificar ) or
     ( datm_item.qry_item_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Itens foi alterado.' + #13#10 +
       'Deseja salvar as alterações?', 1) then
    begin
      VerAlt := False;
      if Not Consiste then
        Exit;
      if Not Grava then
        Exit;
    end
    else
      Cancelar;
  end;

    if ( ( datm_item.qry_item_area_.State in [dsEdit] ) and st_modificar ) or
     ( datm_item.qry_item_area_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Item x Áreas foi alterado.' + #13#10 +
       'Deseja salvar as alterações?', 1) then
    begin
      VerAlt := False;
      if Not Consiste then
        Exit;
      if Not Grava then
        Exit;
    end
    else
      Cancelar;
  end;
end;

procedure Tfrm_item.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_item.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_item.dbedt_cd_acessoEnter(Sender: TObject);
begin
  cd_acesso := dbedt_cd_acesso.Text;
end;

procedure Tfrm_item.dbedt_cd_auxEnter(Sender: TObject);
begin
  cd_aux := dbedt_cd_aux.Text;
end;

procedure Tfrm_item.dbedt_cd_acessoExit(Sender: TObject);
begin
  if dbedt_cd_acesso.Text = cd_acesso then Exit;
  with datm_item do
  begin
    if ( Trim( dbedt_cd_acesso.Text ) <> '' ) and ( Trim( dbedt_cd_aux.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_.Close;
      qry_ct_contabil_unica_.ParamByName('CD_ACESSO_AUX').AsString := Trim( dbedt_cd_acesso.Text ) + Trim( dbedt_cd_aux.Text );
      qry_ct_contabil_unica_.Prepare;
      qry_ct_contabil_unica_.Open;
      if qry_ct_contabil_unica_.RecordCount > 0 then
      begin
        if qry_item_.State in [dsEdit, dsInsert] then qry_item_CD_CT_CONTABIL.AsString := qry_ct_contabil_unica_CD_CT_CONTABIL.AsString;
      end
      else
      begin
        BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2 );
      end;
      qry_ct_contabil_unica_.Close;
    end;
  end;
end;

procedure Tfrm_item.dbedt_cd_auxExit(Sender: TObject);
begin
  if dbedt_cd_aux.Text = cd_aux then Exit;
  with datm_item do
  begin
    if ( Trim( dbedt_cd_acesso.Text ) <> '' ) and ( Trim( dbedt_cd_aux.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_.Close;
      qry_ct_contabil_unica_.ParamByName('CD_ACESSO_AUX').AsString := Trim( dbedt_cd_acesso.Text ) + Trim( dbedt_cd_aux.Text );
      qry_ct_contabil_unica_.Prepare;
      qry_ct_contabil_unica_.Open;
      if qry_ct_contabil_unica_.RecordCount > 0 then
      begin
        if qry_item_.State in [dsEdit, dsInsert] then qry_item_CD_CT_CONTABIL.AsString := qry_ct_contabil_unica_CD_CT_CONTABIL.AsString;
      end
      else
      begin
        BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2);
      end;
      qry_ct_contabil_unica_.Close;
    end;
  end;
end;

procedure Tfrm_item.dbedt_cd_ct_contabilExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_item.dbedt_cd_ct_contabilKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
//    if Sender = dbedt_cd_ct_gerencial then btn_co_ct_gerencialClick(nil);
    if Sender = dbedt_cd_ct_contabil   then btn_co_ct_contabilClick(btn_co_ct_contabil);
    if Sender = dbedt_cd_Group_Service then btn_group_servicesClick(btn_group_services);
{    if Sender = dbedt_cd_area         then btn_co_areaClick(nil);
    if Sender = dbedt_cd_moeda        then btn_co_moedaClick(nil);
    if Sender = msk_cd_unid_neg       then btn_co_unid_negClick(btn_co_unid_neg)else
    if Sender = msk_cd_produto        then btn_co_produtoClick(btn_co_produto)  else
    if Sender = dbedt_cd_ct_custo     then btn_rateioClick(btn_rateio) else}
  end;
end;

procedure Tfrm_item.btn_co_ct_contabilClick(Sender: TObject);
begin
  if datm_item.qry_item_.State in [dsInsert, dsEdit] then
    Btn_Mi( False, True, True, False );

  if datm_item.qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
  begin
    Cons_On_line( 'DBBROKER', 'TCONTABIL_PLANO', datm_item.qry_item_CD_CT_CONTABIL,
                  'Contas Contábeis', 8,
                  'SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "' + str_cd_coligada + '"',
                  'TQuery' );
  end
  else
  begin
//    Cons_On_line( 'DBBROKER', 'TCT_CONTABIL', datm_item.qry_item_CD_CT_CONTABIL,'Contas Contábeis', 37, '' ,'TTable');

    if Sender Is TSpeedButton then
    begin
      if not PoeEmEdicao(datm_item.qry_item_) then
        Exit;
//      Btn_Mi( False, True, True, False );
//      datm_item.qry_item_CD_CT_CONTABIL.AsString
      dbedt_cd_ct_contabil.Text := ConsultaOnLineExSQL('select CD_CT_CONTABIL, NM_CT_CONTABIL, CD_ACESSO, CD_AUX from TCT_CONTABIL where ANO_CONTA = ' + IntToStr(YearOf(dt_server)), 'Contas Contábeis',
                                                                               ['CD_CT_CONTABIL', 'NM_CT_CONTABIL', 'CD_ACESSO', 'CD_AUX'],
                                                                               ['Código',         'Descrição',      'Acesso',    'Aux'   ],
                                                                               'CD_CT_CONTABIL', frm_main.mi_cad_fin_conta_contabil, dbedt_cd_ct_contabil.Text);
    end
    else
    begin
      dbedt_nm_ct_contabil.Text                  := ConsultaLookUpSQL('select NM_CT_CONTABIL from TCT_CONTABIL ' +
                                                                      ' WHERE CD_CT_CONTABIL = "' + dbedt_cd_ct_contabil.Text + '" ' +
                                                                      ' AND ANO_CONTA = ' + IntToStr(YearOf(dt_server)),'NM_CT_CONTABIL');
    end;
  end;
//  dbedt_cd_ct_contabilExit(nil);
end;

procedure Tfrm_item.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbg_cadastroDblClick(nil);
end;

procedure Tfrm_item.dbedt_cd_ct_gerencialExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_item.btn_co_ct_gerencialClick(Sender: TObject);
begin
  with datm_item do
  begin
    qry_param_.Close;
    qry_param_.Prepare;
    qry_param_.Open;
    if qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
    begin
      Cons_On_line( 'DBBROKER', 'TCONTABIL_GERENCIAL', qry_item_CD_CT_GERENCIAL,
                    'Contas Gerenciais', 13,
                    'SELECT CD_COLIGADA, CD_CT_GERENCIAL, NM_CT_GERENCIAL FROM TCONTABIL_GERENCIAL ',
                    'TQuery' );
    end
    else
    begin
      Application.CreateForm(Tfrm_ct_gerencial, frm_ct_gerencial);
      frm_ct_gerencial.Cons_OnLine := qry_item_CD_CT_GERENCIAL;
      with frm_ct_gerencial do
      begin
        Caption := Caption + ' [Consulta On-Line]';
        lCons_OnLine := True;
        if Not ( qry_item_.State in [dsEdit, dsInsert] ) and
           ( st_modificar ) then
          qry_item_.Edit;
        ShowModal;
        lCons_OnLine := False;
      end;
      qry_ct_gerencial_.Close;
      qry_ct_gerencial_.Prepare;
      qry_ct_gerencial_.Open;
    end;
    dbedt_cd_ct_gerencialExit(Sender);
  end;
end;



procedure Tfrm_item.btn_imprimirClick(Sender: TObject);
begin
  with crp_item do
  begin
    ReportName  := cDir_Rpt + '\CRCD005.RPT';
    Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
    SortFields[0] := '+{TITEM.' + Trim( a_str_indices[cb_ordem.ItemIndex] ) + '}';
    Execute;
  end;
end;   

procedure Tfrm_item.btn_co_areaClick(Sender: TObject);
begin
  with datm_item do
  begin
    Application.CreateForm( Tfrm_area, frm_area );
    with frm_area do
    begin
      Cons_OnLine  := qry_item_area_CD_AREA;
      lCons_OnLine := True;
      if Not ( qry_item_area_.State in [dsEdit, dsInsert] ) then
        qry_item_area_.Edit;
      ShowModal;
      lCons_OnLine   := False;
    end;
    dbedt_cd_areaExit(nil);
  end;
end;

procedure Tfrm_item.btn_co_moedaClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    Cons_OnLine  := datm_item.qry_item_area_CD_MOEDA_INDICE;
    lCons_OnLine := True;
    if Not ( datm_item.qry_item_area_.State in [dsEdit, dsInsert] ) then
      datm_item.qry_item_area_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_item do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moedaExit(nil);
end;

procedure Tfrm_item.dbedt_cd_areaChange(Sender: TObject);
begin
  if ( datm_item.qry_item_area_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_item.dbedt_calc_indiceChange(Sender: TObject);
begin
  if datm_item.qry_item_area_CalcIndice.AsFloat > 0 then
  begin
    dblckbox_forma_rateio.Enabled := True;
    dblckbox_forma_rateio.TabStop := True;
  end
  else
  begin
    if datm_item.qry_item_area_.State in [dsInsert,dsEdit] then
       datm_item.qry_item_area_TP_RATEIO_DESP.AsString := '0';
    dblckbox_forma_rateio.Enabled := True;
    dblckbox_forma_rateio.TabStop := True;
  end;
end;

procedure Tfrm_item.dbedt_vl_den_indiceExit(Sender: TObject);
var
  nNumTaxa : Integer;
begin
  if datm_item.qry_item_area_.State in [dsInactive] then Exit;
  if Not ( datm_item.qry_item_area_.State in [dsInsert] )
     and ( st_modificar ) then datm_item.qry_item_area_.Edit
  else
  if not ( datm_item.qry_item_area_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_indice.Text, nNumTaxa, Code);
    if ( dbedt_vl_den_indice.Text = '' ) or ( nNumTaxa <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_item.ActivePage := ts_area;
      dbedt_vl_num_indice.SetFocus;
    end;
    Exit;
  end;
end;


procedure Tfrm_item.dbedt_cd_areaExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_item.dbedt_cd_moedaExit(Sender: TObject);
begin
  CodExits;
end; 

procedure Tfrm_item.btn_duplicarClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_duplica_eventos, frm_duplica_eventos );
  frm_duplica_eventos.nr_form := 2;
  frm_duplica_eventos.str_servico_destino := datm_item.qry_item_CD_ITEM.AsString;
  frm_duplica_eventos.cd_nm_destino := 'Item Destino: '+ #13#10 +dbedt_cd_item_ts_area.Text+' - '+dbedt_nm_item_ts_area.Text;
  frm_duplica_eventos.ShowModal;
  datm_item.qry_item_area_.Close;
  datm_item.qry_item_area_.Prepare;
  datm_item.qry_item_area_.Open;    
end;

procedure Tfrm_item.btn_co_unid_negClick(Sender: TObject);
begin
  if ( datm_item.qry_item_Rateio.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );

  if Sender Is TSpeedButton Then
  begin
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg, 1,msk_cd_unid_neg.Text);
  end
  else
  begin
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');
  end;
end;

procedure Tfrm_item.btn_co_produtoClick(Sender: TObject);
begin
  if ( datm_item.qry_item_Rateio.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );

  if Sender Is TSpeedButton Then
  begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','NM_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto, 1, msk_cd_produto.Text);
  end
  else
  begin
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'NM_PRODUTO');
  end;
end;

procedure Tfrm_item.btn_rateioClick(Sender: TObject);
begin
  if ( datm_item.qry_item_Rateio.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );

  if Sender is TSpeedButton then
  begin
    if not ( datm_item.qry_Item_Rateio.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_item.qry_Item_Rateio.Edit;
    datm_item.qry_Item_RateioCD_CT_CUSTO.AsString := ConsultaOnLineEx('TCONTABIL_CUSTO','Centro de Custo',['CD_CT_CUSTO','NM_CT_CUSTO'],['Código','Descrição'],'CD_CT_CUSTO',frm_main.mi_cad_fin_conta_gerencial, 0)
  end
  else
  begin
    dbedt_nm_custo.Text := ConsultaLookUPSQL('select CD_CT_CUSTO, NM_CT_CUSTO FROM TCONTABIL_CUSTO where IN_ATIVO = 1 and CD_CT_CUSTO = ''' + dbedt_cd_ct_custo.Text + '''','NM_CT_CUSTO');
  end;
end;

procedure Tfrm_item.dbedt_cd_ct_custoExit(Sender: TObject);
begin
  if Trim(dbedt_cd_ct_custo.Text) <> '' then
  begin
    dbedt_cd_ct_custo.Text := FStrZero(dbedt_cd_ct_custo.Text, 4);
    CodExits;
  end;
end;

procedure Tfrm_item.msk_cd_unid_negExit(Sender: TObject);
begin
  if Trim(msk_cd_unid_neg.Text) <> '' then
  begin
    msk_cd_unid_neg.Text := FStrZero(msk_cd_unid_neg.Text, 2);
    CodExits;
  end;
end;

procedure Tfrm_item.msk_cd_produtoExit(Sender: TObject);
begin
  if Trim(msk_cd_produto.Text) <> '' then
  begin
    msk_cd_produto.Text := FStrZero(msk_cd_produto.Text, 2);
    CodExits;
  end;
end;

procedure Tfrm_item.btn_group_servicesClick(Sender: TObject);
begin
  if ( datm_item.qry_item_group_service.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
  if Sender Is TSpeedButton Then
    dbedt_cd_Group_Service.Text := ConsultaOnLineEx('TTP_GROUP_SERVICES','Group Services',['CD_GROUP_SERVICES','NM_GROUP_SERVICES'],['Código','Descrição'],'CD_GROUP_SERVICES',nil, 1,dbedt_cd_Group_Service.Text)
  else
    dbedt_nm_Group_Service.Text := ConsultaLookUP('TTP_GROUP_SERVICES','CD_GROUP_SERVICES', dbedt_cd_Group_Service.Text,'NM_GROUP_SERVICES');
end;

procedure Tfrm_item.dbedt_cd_Group_ServiceExit(Sender: TObject);
begin
  if Trim(dbedt_cd_Group_Service.Text) <> '' then
  begin
    dbedt_cd_Group_Service.Text := FStrZero(dbedt_cd_Group_Service.Text, 4);
    CodExits;
  end;
end;

end.
