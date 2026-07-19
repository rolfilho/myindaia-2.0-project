unit PGSM077;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, Funcoes;

type
  Tfrm_cliente_faturamento = class(TForm)
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
    pgctrl_cliente_faturamento: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    ts_receita_imp: TTabSheet;
    ts_receita_exp: TTabSheet;
    lbl_Cliente: TLabel;
    dbedt_cd_cliente: TDBEdit;
    dbedt_nm_cliente: TDBEdit;
    lbl_unid_neg: TLabel;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    lbl_produto: TLabel;
    dbedt_cd_produto: TDBEdit;
    dbedt_nm_produto: TDBEdit;
    lbl_servico: TLabel;
    dbedt_cd_servico: TDBEdit;
    dbedt_nm_servico: TDBEdit;
    pnl_entrada_de_dados: TPanel;
    lbl_cliente2: TLabel;
    lbl_unid_neg2: TLabel;
    lbl_produto2: TLabel;
    lbl_servico2: TLabel;
    dbedt_cd_cliente2: TDBEdit;
    dbedt_nm_cliente2: TDBEdit;
    dbedt_cd_unid_neg2: TDBEdit;
    dbedt_nm_unid_neg2: TDBEdit;
    dbedt_cd_produto2: TDBEdit;
    dbedt_nm_produto2: TDBEdit;
    dbedt_cd_servico2: TDBEdit;
    dbedt_nm_servico2: TDBEdit;
    lbl_item: TLabel;
    dbedt_cd_item: TDBEdit;
    dbedt_nm_item: TDBEdit;
    btn_co_item: TSpeedButton;
    btn_tp_calculo: TSpeedButton;
    dbedt_nm_calculo: TEdit;
    lbl_tipo_calculo: TLabel;
    lbl_cliente3: TLabel;
    dbedt_nm_cliente3: TDBEdit;
    lbl_servico3: TLabel;
    dbedt_nm_servico3: TDBEdit;
    lbl_regime_trib: TLabel;
    lbl_unid_neg3: TLabel;
    dbedt_nm_unid_neg3: TDBEdit;
    lbl_item2: TLabel;
    dbedt_nm_item2: TDBEdit;
    lbl_dt_base: TLabel;
    dblckbox_dt_base: TDBLookupComboBox;
    lbl_produto3: TLabel;
    dbedt_nm_produto3: TDBEdit;
    lbl_in_ativo: TLabel;
    dblkpcbox_in_ativo: TDBLookupComboBox;
    pnl_taxa: TPanel;
    Label2: TLabel;
    lbl_base_calc_taxa: TLabel;
    lbl_moeda_taxa: TLabel;
    lbl_taxa: TLabel;
    btn_co_moeda_taxa: TSpeedButton;
    dbedt_vl_num_taxa: TDBEdit;
    dbedt_vl_den_taxa: TDBEdit;
    dbedt_calc_taxa: TDBEdit;
    dblckbox_base_calc_taxa: TDBLookupComboBox;
    dbedt_cd_moeda_taxa: TDBEdit;
    dbedt_nm_moeda_taxa: TDBEdit;
    pnl_min: TPanel;
    Label10: TLabel;
    lbl_min: TLabel;
    dbedt_vl_num_min: TDBEdit;
    dbedt_vl_den_min: TDBEdit;
    pnl_max: TPanel;
    Label14: TLabel;
    lbl_max: TLabel;
    dbedt_vl_num_max: TDBEdit;
    dbedt_vl_den_max: TDBEdit;
    lbl_cliente4: TLabel;
    dbedt_nm_cliente4: TDBEdit;
    lbl_servico4: TLabel;
    dbedt_nm_servico4: TDBEdit;
    lbl_unid_neg4: TLabel;
    dbedt_nm_unid_neg4: TDBEdit;
    lbl_item3: TLabel;
    dbedt_nm_item3: TDBEdit;
    lbl_produto4: TLabel;
    dbedt_nm_produto4: TDBEdit;
    lbl_dt_base2: TLabel;
    lbl_tp_faixa: TLabel;
    lbl_tp_faixa_valor: TLabel;
    lbl_pc_reduc_re_canc: TLabel;
    lbl_ativo2: TLabel;
    dblck_box_in_ativo2: TDBLookupComboBox;
    dbedt_pc_reduc_re_canc: TDBEdit;
    dblckbox_tp_faixa_valor: TDBLookupComboBox;
    dblckbox_tp_faixa: TDBLookupComboBox;
    dblckbox_regime_trib2: TDBLookupComboBox;
    pnl_taxa2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbl_taxa2: TLabel;
    btn_co_moeda_taxa2: TSpeedButton;
    dbedt_vl_num_taxa2: TDBEdit;
    dbedt_vl_den_taxa2: TDBEdit;
    dbedt_calc_taxa2: TDBEdit;
    dblckbox_base_calc_taxa2: TDBLookupComboBox;
    dbedt_cd_moeda_taxa2: TDBEdit;
    dbedt_nm_moeda_taxa2: TDBEdit;
    pnl_min2: TPanel;
    Label8: TLabel;
    lbl_min2: TLabel;
    dbedt_vl_num_min2: TDBEdit;
    dbedt_vl_den_min2: TDBEdit;
    pnl_max2: TPanel;
    Label13: TLabel;
    lbl_max2: TLabel;
    dbedt_vl_num_max2: TDBEdit;
    dbedt_vl_den_max2: TDBEdit;
    btn_faixas: TButton;
    dbgrd_reg_trib: TDBGrid;
    dbedt_tp_calculo: TDBEdit;
    pnlFaixasImp: TPanel;
    Panel2: TPanel;
    dbgrd_Faixas_Imp: TDBGrid;
    dbedtImpQTD_ATE: TDBEdit;
    dbedtImpVL_FAIXA: TDBEdit;
    btnIncluirFaixaImp: TSpeedButton;
    btnSalvarFaixaImp: TSpeedButton;
    btnCancelarFaixaImp: TSpeedButton;
    btnExcluirFaixaImp: TSpeedButton;
    dbedtImpQTD_DE: TDBEdit;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    pnlFaixasExp: TPanel;
    Panel3: TPanel;
    btnIncluirFaixaExp: TSpeedButton;
    btnSalvarFaixaExp: TSpeedButton;
    btnCancelarFaixaExp: TSpeedButton;
    btnExcluirFaixaExp: TSpeedButton;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dbgrd_Faixas_Exp: TDBGrid;
    dbedtExpQTD_ATE: TDBEdit;
    dbedtExpVL_FAIXA: TDBEdit;
    dbedtExpQTD_DE: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure dbedt_cd_itemChange(Sender: TObject);
    procedure dbedt_cd_itemExit(Sender: TObject);
    procedure btn_co_itemClick(Sender: TObject);
    procedure btn_tp_calculoClick(Sender: TObject);
    procedure dbedt_vl_num_taxaChange(Sender: TObject);
    procedure dbedt_vl_den_taxaExit(Sender: TObject);
    procedure dbedt_vl_den_acrExit(Sender: TObject);
    procedure dbedt_vl_den_fora_regiaoExit(Sender: TObject);
    procedure dbedt_vl_den_minExit(Sender: TObject);
    procedure dbedt_vl_den_maxExit(Sender: TObject);
    procedure dbedt_calc_taxaChange(Sender: TObject);
    procedure dblckbox_base_calc_taxaClick(Sender: TObject);
    procedure dblckbox_base_calc_acrClick(Sender: TObject);
    procedure dblckbox_base_calc_fora_regiaoClick(Sender: TObject);
    procedure dblckbox_base_calc_minClick(Sender: TObject);
    procedure dblckbox_base_calc_maxClick(Sender: TObject);
    procedure dbedt_cd_moeda_taxaExit(Sender: TObject);
    procedure dbedt_cd_moeda_acrExit(Sender: TObject);
    procedure dbedt_cd_moeda_fora_regiaoExit(Sender: TObject);
    procedure dbedt_cd_moeda_minExit(Sender: TObject);
    procedure dbedt_cd_moeda_maxExit(Sender: TObject);
    procedure btn_co_moeda_taxaClick(Sender: TObject);
    procedure btn_co_moeda_acrClick(Sender: TObject);
    procedure btn_co_moeda_fora_regiaoClick(Sender: TObject);
    procedure btn_co_moeda_minClick(Sender: TObject);
    procedure btn_co_moeda_maxClick(Sender: TObject);
    procedure VerBaseCalcTaxa;
    procedure VerBaseCalcTaxa2;
    procedure dbedt_vl_num_taxa2Change(Sender: TObject);
    procedure dbedt_vl_den_min2Exit(Sender: TObject);
    procedure dbedt_vl_den_taxa2Exit(Sender: TObject);
    procedure dbedt_vl_den_max2Exit(Sender: TObject);
    procedure dbedt_calc_taxa2Change(Sender: TObject);
    procedure dblckbox_base_calc_max2Click(Sender: TObject);
    procedure dbedt_cd_moeda_taxa2Exit(Sender: TObject);
    procedure dbedt_cd_moeda_min2Exit(Sender: TObject);
    procedure dbedt_cd_moeda_max2Exit(Sender: TObject);
    procedure btn_co_moeda_taxa2Click(Sender: TObject);
    procedure btn_co_moeda_min2Click(Sender: TObject);
    procedure btn_co_moeda_max2Click(Sender: TObject);
    procedure btn_faixasClick(Sender: TObject);
    procedure dblckbox_tp_faixaClick(Sender: TObject);
    procedure pgctrl_cliente_faturamentoChange(Sender: TObject);
    procedure pgctrl_cliente_faturamentoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dblckbox_base_calc_min2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_itemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblckbox_base_calc_taxa2Click(Sender: TObject);
    procedure btnIncluirFaixaImpClick(Sender: TObject);
    procedure btnSalvarFaixaImpClick(Sender: TObject);
    procedure btnCancelarFaixaImpClick(Sender: TObject);
    procedure btnExcluirFaixaImpClick(Sender: TObject);
    procedure btnIncluirFaixaExpClick(Sender: TObject);
    procedure btnSalvarFaixaExpClick(Sender: TObject);
    procedure btnCancelarFaixaExpClick(Sender: TObject);
    procedure btnExcluirFaixaExpClick(Sender: TObject);
  private
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..1] Of String[60];
    lCancelar, lAbertura, lSalvar, lExcluir : Boolean;
    st_modificar, st_incluir, st_excluir : Boolean;
    function Consiste : Boolean;
    function Grava    : Boolean;
    function VerAlt   : Boolean;
    procedure Cancelar;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure ReceitaImp;
    procedure ReceitaExp;
    procedure CodExits;
  public
    Code : Integer;
    str_cliente, str_unid, str_produto, str_servico : String;
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String );
  end;

var
  frm_cliente_faturamento: Tfrm_cliente_faturamento;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGSM048, PGSM059, PGSM078, PGSM096, PGSM109, PGSM148, ConsOnLineEx;

procedure Tfrm_cliente_faturamento.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

 { Inicializa o Data Module para Cliente X Faturamento}
  Application.CreateForm( Tdatm_cliente_faturamento, datm_cliente_faturamento );

  with datm_cliente_faturamento do
  begin
    ds_cliente_faturamento.AutoEdit := st_modificar;

    tbl_yesno_.Open;
    tbl_dt_base_.Open;
    tbl_regime_trib_.Open;
    tbl_tp_faixa_.Open;
    tbl_tp_faixa_valor_.Open;

    qry_base_calc_imp_.Close;
    qry_base_calc_imp_.Prepare;
    qry_base_calc_imp_.Open;

    qry_base_calc_exp_.Close;
    qry_base_calc_exp_.Prepare;
    qry_base_calc_exp_.Open;

    qry_empresa_nac_.Close;
    qry_empresa_nac_.Prepare;
    qry_empresa_nac_.Open;

    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;

    qry_servico_.Close;
    qry_servico_.Prepare;
    qry_servico_.Open;

    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;

    qry_banco_.Close;
    qry_banco_.Prepare;
    qry_banco_.Open;

    qry_calculo_.Close;
    qry_calculo_.Prepare;
    qry_calculo_.Open;

    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;

    qry_cliente_faturamento_.Close;
    qry_cliente_faturamento_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
    qry_cliente_faturamento_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_cliente_faturamento_.ParamByName('CD_PRODUTO').AsString  := str_produto;
    qry_cliente_faturamento_.ParamByName('CD_SERVICO').AsString  := str_servico;
    qry_cliente_faturamento_.Prepare;
    qry_cliente_faturamento_.Open;
  end;

  a_str_indices[0] := 'CD_ITEM';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código do Item');
    ItemIndex := 0;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;
end;

procedure Tfrm_cliente_faturamento.FormShow(Sender: TObject);
begin
  ts_receita_imp.TabVisible := False;
  ts_receita_exp.TabVisible := False;

  lNaoConsiste := False;
  lAbertura    := True;
  with datm_cliente_faturamento do
  begin
    qry_cliente_faturamento_.Close;
    qry_cliente_faturamento_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
    qry_cliente_faturamento_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_cliente_faturamento_.ParamByName('CD_PRODUTO').AsString  := str_produto;
    qry_cliente_faturamento_.ParamByName('CD_SERVICO').AsString  := str_servico;
    qry_cliente_faturamento_.Prepare;
    qry_cliente_faturamento_.Open;
  end;

  pgctrl_cliente_faturamento.ActivePage := ts_lista;
  edt_chave.SetFocus;
  lAbertura := False;
end;

procedure Tfrm_cliente_faturamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_cliente_faturamento do
    begin
      tbl_yesno_.Close;
      tbl_dt_base_.Close;
      tbl_regime_trib_.Close;
      tbl_tp_faixa_.Close;
      tbl_tp_faixa_valor_.Close;

      qry_base_calc_imp_.Close;
      qry_base_calc_exp_.Close;

      qry_empresa_nac_.Close;
      qry_unid_neg_.Close;
      qry_produto_.Close;
      qry_servico_.Close;
      qry_item_.Close;
      qry_banco_.Close;
      qry_moeda_.Close;
      qry_calculo_.Close;
      qry_cliente_faturamento_.Close;
      Free;
    end;
  end
  else
    Action := caNone;
end;

procedure Tfrm_cliente_faturamento.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  with datm_cliente_faturamento do
  begin
    qry_cliente_faturamento_.DisableControls;
    qry_cliente_faturamento_.Cancel;
    qry_cliente_faturamento_.Append;
    qry_cliente_faturamento_.EnableControls;
    qry_cliente_faturamento_CD_CLIENTE.AsString  := str_cliente;
    qry_cliente_faturamento_CD_UNID_NEG.AsString := str_unid;
    qry_cliente_faturamento_CD_PRODUTO.AsString  := str_produto;
    qry_cliente_faturamento_CD_SERVICO.AsString  := str_servico;
  end;
  pgctrl_cliente_faturamento.ActivePage := ts_dados_basicos;
  dbedt_cd_item.SetFocus;
end;

procedure Tfrm_cliente_faturamento.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava    then Exit;
end;

procedure Tfrm_cliente_faturamento.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_cliente_faturamento.Cancelar;
begin
  with datm_cliente_faturamento do
  begin
    lCancelar := True;
    try
      if qry_cliente_faturamento_.State in [dsInsert, dsEdit] then
         qry_cliente_faturamento_.Cancel;

      if qry_receita_imp_.State in [dsInsert, dsEdit] then
         qry_receita_imp_.Cancel;

      if qry_receita_exp_.State in [dsInsert, dsEdit] then
         qry_receita_exp_.Cancel;

      pgctrl_cliente_faturamento.ActivePage := ts_dados_basicos;
      dbedt_cd_item.SetFocus;
      if qry_cliente_faturamento_LookTabelaCalculo.AsString = 'I' then
      begin
        ts_receita_imp.TabVisible := True;
        ts_receita_exp.TabVisible := False;
      end
      else if qry_cliente_faturamento_LookTabelaCalculo.AsString = 'E' then
      begin
        ts_receita_imp.TabVisible := False;
        ts_receita_exp.TabVisible := True;
      end;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
    lCancelar := False;
    Btn_Mi(st_incluir, False, False, st_excluir );
  end;
end;

procedure Tfrm_cliente_faturamento.btn_excluirClick(Sender: TObject);
begin
  lExcluir := True;
  if BoxMensagem( 'Este Cliente X Item do Faturamento será excluído! Confirma exclusão?', 1 ) then
  try
    datm_main.db_broker.StartTransaction;
    with datm_cliente_faturamento do
    begin
      {Apagar Receitas de Importação}
      CloseStoredProc(sp_receitas);
      sp_receitas.ParamByName('@cd_cliente').AsString  := str_cliente;
      sp_receitas.ParamByName('@cd_unid_neg').AsString := str_unid;
      sp_receitas.ParamByName('@cd_produto').AsString  := str_produto;
      sp_receitas.ParamByName('@cd_servico').AsString  := str_servico;
      sp_receitas.ParamByName('@cd_item').AsString     := qry_cliente_faturamento_CD_ITEM.AsString;
      sp_receitas.ParamByName('@operacao').AsString    := '-';
      sp_receitas.ParamByName('@mod').AsString         := 'I';
      ExecStoredProc(sp_receitas);
      CloseStoredProc(sp_receitas);

      {Apagar Receitas de Exportação}
      CloseStoredProc(sp_receitas);
      sp_receitas.ParamByName('@cd_cliente').AsString  := str_cliente;
      sp_receitas.ParamByName('@cd_unid_neg').AsString := str_unid;
      sp_receitas.ParamByName('@cd_produto').AsString  := str_produto;
      sp_receitas.ParamByName('@cd_servico').AsString  := str_servico;
      sp_receitas.ParamByName('@cd_item').AsString     := qry_cliente_faturamento_CD_ITEM.AsString;
      sp_receitas.ParamByName('@operacao').AsString    := '-';
      sp_receitas.ParamByName('@mod').AsString         := 'E';
      ExecStoredProc(sp_receitas);
      CloseStoredProc(sp_receitas);

      qry_receita_imp_.Close;
      qry_receita_imp_.Prepare;
      qry_receita_imp_.Open;
      qry_receita_exp_.Close;
      qry_receita_exp_.Prepare;
      qry_receita_exp_.Open;

      {Apaga por último os dados de cliente faturamento pois eles servem de
       parâmetro para Receitas de Importação e Exportação}
      qry_cliente_faturamento_.Delete;

    end;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_cliente_faturamento.qry_cliente_faturamento_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  pgctrl_cliente_faturamento.ActivePage := ts_lista;
  lExcluir := False;
end;

procedure Tfrm_cliente_faturamento.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_cliente_faturamento.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_cliente_faturamento.qry_cliente_faturamento_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

function Tfrm_cliente_faturamento.Consiste : Boolean;
begin
  Consiste := True;
  {Item}
  if Not lNaoConsiste then
  begin
    if dbedt_cd_item.Text = '' then
    begin
      BoxMensagem('Campo Item deve ser preenchido!', 2);
      pgctrl_cliente_faturamento.ActivePage := ts_dados_basicos;
      dbedt_cd_item.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  if ( datm_cliente_faturamento.qry_cliente_faturamento_.State in [dsEdit, dsInsert] ) then
  begin
//    ValidCodigo( dbedt_cd_item );
    if dbedt_cd_item.Text <> '' then
    begin
      if dbedt_nm_item.Text = '' then
      begin
        BoxMensagem('Código do Item inválido!', 2);
        pgctrl_cliente_faturamento.ActivePage := ts_dados_basicos;
        dbedt_cd_item.SetFocus;
        Consiste := False;
        Exit;
      end;
      with datm_cliente_faturamento do
      begin
        qry_cliente_item_ton_.Close;
        qry_cliente_item_ton_.ParamByName('CD_CLIENTE').AsString  := qry_cliente_faturamento_CD_CLIENTE.AsString;
        qry_cliente_item_ton_.ParamByName('CD_UNID_NEG').AsString := qry_cliente_faturamento_CD_UNID_NEG.AsString;
        qry_cliente_item_ton_.ParamByName('CD_PRODUTO').AsString  := qry_cliente_faturamento_CD_PRODUTO.AsString;
        qry_cliente_item_ton_.ParamByName('CD_SERVICO').AsString  := qry_cliente_faturamento_CD_SERVICO.AsString;
        qry_cliente_item_ton_.ParamByName('CD_ITEM').AsString     := qry_cliente_faturamento_CD_ITEM.AsString;
        qry_cliente_item_ton_.Prepare;
        qry_cliente_item_ton_.Open;
        if qry_cliente_item_ton_.RecordCount > 0 then
        begin
          BoxMensagem('Esse item já esta cadastrado no Itens por Toneladas!', 2);
          pgctrl_cliente_faturamento.ActivePage := ts_dados_basicos;
          dbedt_cd_item.SetFocus;
          Consiste := False;
          qry_cliente_item_ton_.Close;
          Exit;
        end;
        qry_cliente_item_ton_.Close;
      end;
    end;
  end;

  {Tipo de Cálculo}
  if Not lNaoConsiste then
  begin
    if dbedt_tp_calculo.Text = '' then
    begin
      BoxMensagem('Campo Tipo de Cálculo deve ser preenchido!', 2);
      pgctrl_cliente_faturamento.ActivePage := ts_dados_basicos;
      pgctrl_cliente_faturamento.ActivePage := ts_dados_basicos;
      dbedt_tp_calculo.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  if ( datm_cliente_faturamento.qry_cliente_faturamento_.State in [dsEdit, dsInsert] ) then
  begin
//    ValidCodigo( dbedt_tp_calculo );
    if dbedt_tp_calculo.Text <> '' then
    begin
      if dbedt_nm_calculo.Text = '' then
      begin
        BoxMensagem('Código do Tipo de Cálculo inválido!', 2);
        pgctrl_cliente_faturamento.ActivePage := ts_dados_basicos;
        dbedt_tp_calculo.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  {Moeda Taxa Importação}
  if ( datm_cliente_faturamento.qry_receita_imp_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_moeda_taxa );
    if dbedt_cd_moeda_taxa.Text <> '' then
    begin
      if dbedt_nm_moeda_taxa.Text = '' then
      begin
        BoxMensagem('Código da Moeda/Índice da Taxa inválido!',2);
        pgctrl_cliente_faturamento.ActivePage := ts_receita_imp;
        dbedt_cd_moeda_taxa.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  {Moeda Taxa Exportação}
  if ( datm_cliente_faturamento.qry_receita_exp_.State in [dsEdit, dsInsert] ) and
     dbedt_cd_moeda_taxa2.Enabled then
  begin
    ValidCodigo( dbedt_cd_moeda_taxa2 );
    if dbedt_cd_moeda_taxa2.Text <> '' then
    begin
      if dbedt_nm_moeda_taxa2.Text = '' then
      begin
        BoxMensagem('Código da Moeda/Índice da Taxa inválido!',2);
        pgctrl_cliente_faturamento.ActivePage := ts_receita_exp;
        dbedt_cd_moeda_taxa2.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;
end;

{$HINTS OFF}
function Tfrm_cliente_faturamento.Grava : Boolean;
var
  lDadosBasicos : Boolean;
  str_cd_item, str_tp_calculo : String;
begin
  if pgctrl_cliente_faturamento.ActivePage = ts_dados_basicos then lDadosBasicos := True
  else lDadosBasicos := False;
  lSalvar := True;
  with datm_cliente_faturamento do
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( qry_cliente_faturamento_.State in [dsInsert, dsEdit] ) or
         ( qry_receita_imp_.State in [dsInsert, dsEdit] ) or
         ( qry_receita_exp_.State in [dsInsert, dsEdit] ) then
      begin
        if ( qry_cliente_faturamento_.State in [dsInsert, dsEdit] ) then
        begin
          qry_cliente_faturamento_.Post;
          lDadosBasicos := True;
        end;

        if ( qry_receita_imp_.State in [dsEdit] ) then
        begin
          qry_receita_imp_.Post;
          lDadosBasicos := False;
        end;

        if ( qry_receita_exp_.State in [dsEdit] ) then
        begin
          qry_receita_exp_.Post;
          lDadosBasicos := False;
        end;
      end;
      datm_main.db_broker.Commit;
      Grava := True;

      if lDadosBasicos then
      begin
        lDadosBasicos := False;
        if qry_cliente_faturamento_LookTabelaCalculo.AsString = 'I' then
        begin
          ReceitaImp;
          Exit;
        end
        else if qry_cliente_faturamento_LookTabelaCalculo.AsString = 'E' then
        begin
          ReceitaExp;
          Exit;
        end;
      end;

      str_cd_item    := qry_cliente_faturamento_CD_ITEM.AsString;
      str_tp_calculo := qry_cliente_faturamento_TP_CALCULO.AsString;

      qry_cliente_faturamento_.Close;
      qry_cliente_faturamento_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
      qry_cliente_faturamento_.ParamByName('CD_UNID_NEG').AsString := str_unid;
      qry_cliente_faturamento_.ParamByName('CD_PRODUTO').AsString  := str_produto;
      qry_cliente_faturamento_.ParamByName('CD_SERVICO').AsString  := str_servico;
      qry_cliente_faturamento_.Prepare;
      qry_cliente_faturamento_.Open;

      qry_cliente_faturamento_.Locate('CD_ITEM;TP_CALCULO',
      VarArrayOf([str_cd_item, str_tp_calculo ]), [loCaseInsensitive]);

    except
      on E: Exception do
      begin
        qry_cliente_faturamento_.Cancel;
        qry_receita_imp_.Cancel;
        qry_receita_exp_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
    lSalvar := False;
//    pgctrl_cliente_faturamento.ActivePage := ts_dados_basicos;
    dbnvg.Enabled     := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled  := False;

    if qry_cliente_faturamento_LookTabelaCalculo.AsString = 'I' then
    begin
      ts_receita_imp.TabVisible := True;
      ts_receita_exp.TabVisible := False;
    end
    else if qry_cliente_faturamento_LookTabelaCalculo.AsString = 'E' then
    begin
      ts_receita_imp.TabVisible := False;
      ts_receita_exp.TabVisible := True;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;
{$HINTS ON}

procedure Tfrm_cliente_faturamento.dbedt_cd_itemChange(Sender: TObject);
begin
  if ( datm_cliente_faturamento.qry_cliente_faturamento_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_cliente_faturamento.dbedt_cd_itemExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente_faturamento.btn_co_itemClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2214';
  Application.CreateForm(Tfrm_item, frm_item);
  frm_item.Cons_OnLine := datm_cliente_faturamento.qry_cliente_faturamento_CD_ITEM;
  with frm_item do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_faturamento.qry_cliente_faturamento_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_faturamento.qry_cliente_faturamento_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_faturamento do
  begin
    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_itemExit(nil);
end;

procedure Tfrm_cliente_faturamento.btn_tp_calculoClick(Sender: TObject);
begin
    if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_cliente_faturamento.qry_cliente_faturamento_) then exit;
    datm_cliente_faturamento.qry_cliente_faturamento_TP_CALCULO.AsString := ConsultaOnLineEx('TCALCULO','Tipos de Cálculo',['CD_CALCULO','NM_CALCULO'],['Código','Descrição'],'CD_CALCULO',nil)
  end else
    dbedt_nm_calculo.Text := ConsultaLookUP('TCALCULO','CD_CALCULO',datm_cliente_faturamento.qry_cliente_faturamento_TP_CALCULO.AsString,'NM_CALCULO')
end;

procedure Tfrm_cliente_faturamento.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String );
begin

  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo              := 7;
  datm_consulta_padrao.Tabela.DatabaseName := 'DBBROKER';
  datm_consulta_padrao.Tabela.TableName    := cNomeTabela;
  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.Cons_OnLine          := fCampo;
  frm_consulta_padrao.st_modificar         := st_modificar;

  with frm_consulta_padrao do
  begin
    Caption := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_cliente_faturamento.dbedt_vl_num_taxaChange(Sender: TObject);
begin
  if lCancelar or lAbertura or lSalvar or lExcluir  then Exit;
  if ( datm_cliente_faturamento.qry_receita_imp_.State in [dsInactive] ) then Exit;
  if ( datm_cliente_faturamento.qry_receita_imp_.RecordCount > 0 ) or
     ( datm_cliente_faturamento.qry_receita_imp_.State in [dsInsert] ) then
  begin
    if pgctrl_cliente_faturamento.ActivePage <> ts_receita_imp then Exit;
    if Not ( datm_cliente_faturamento.qry_receita_imp_.State in [dsInsert] ) then
       datm_cliente_faturamento.qry_receita_imp_.Edit;
    Btn_Mi( False, True, True, False );
  end;
end;

procedure Tfrm_cliente_faturamento.dbedt_vl_den_taxaExit(Sender: TObject);
var
  nNumTaxa : Integer;
begin
  if datm_cliente_faturamento.qry_receita_imp_.State in [dsInactive] then Exit;
  if Not ( datm_cliente_faturamento.qry_receita_imp_.State in [dsInsert] )
     and ( st_modificar ) then datm_cliente_faturamento.qry_receita_imp_.Edit
  else
  if Not ( datm_cliente_faturamento.qry_receita_imp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_taxa.Text, nNumTaxa, Code);
    if ( dbedt_vl_den_taxa.Text = '' ) or ( nNumTaxa <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_cliente_faturamento.ActivePage := ts_receita_imp;
      dbedt_vl_num_taxa.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_cliente_faturamento.dbedt_vl_den_acrExit(Sender: TObject);
var
  nNumAcr : Integer;
begin
  if datm_cliente_faturamento.qry_receita_imp_.State in [dsInactive] then Exit;
  if Not ( datm_cliente_faturamento.qry_receita_imp_.State in [dsInsert] )
     and ( st_modificar ) then datm_cliente_faturamento.qry_receita_imp_.Edit
  else
  if Not ( datm_cliente_faturamento.qry_receita_imp_.State in [dsEdit, dsInsert] ) then
  begin
    {Val(dbedt_vl_den_acr.Text, nNumAcr, Code);
    if ( dbedt_vl_den_acr.Text = '' ) or ( nNumAcr <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_cliente_faturamento.ActivePage := ts_receita_imp;
      dbedt_vl_num_acr.SetFocus;
    end;}
    Exit;
  end;
end;

procedure Tfrm_cliente_faturamento.dbedt_vl_den_fora_regiaoExit(
  Sender: TObject);
var
  nNumForaRegiao : Integer;
begin
  if datm_cliente_faturamento.qry_receita_imp_.State in [dsInactive] then Exit;
  if Not ( datm_cliente_faturamento.qry_receita_imp_.State in [dsInsert] )
     and ( st_modificar ) then datm_cliente_faturamento.qry_receita_imp_.Edit
  else
  if Not ( datm_cliente_faturamento.qry_receita_imp_.State in [dsEdit, dsInsert] ) then
  begin
    {Val(dbedt_vl_den_fora_regiao.Text, nNumForaRegiao, Code);
    if ( dbedt_vl_den_fora_regiao.Text = '' ) or ( nNumForaRegiao <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_cliente_faturamento.ActivePage := ts_receita_imp;
      dbedt_vl_num_fora_regiao.SetFocus;
    end;}
    Exit;
  end;
end;

procedure Tfrm_cliente_faturamento.dbedt_vl_den_minExit(Sender: TObject);
var
  nNumMin : Integer;
begin
  if datm_cliente_faturamento.qry_receita_imp_.State in [dsInactive] then Exit;
  if Not ( datm_cliente_faturamento.qry_receita_imp_.State in [dsInsert] )
     and ( st_modificar ) then datm_cliente_faturamento.qry_receita_imp_.Edit
  else
  if Not ( datm_cliente_faturamento.qry_receita_imp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_min.Text, nNumMin, Code);
    if ( dbedt_vl_den_min.Text = '' ) or ( nNumMin <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_cliente_faturamento.ActivePage := ts_receita_imp;
      dbedt_vl_num_min.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_cliente_faturamento.dbedt_vl_den_maxExit(Sender: TObject);
var
  nNumMax : Integer;
begin
  if datm_cliente_faturamento.qry_receita_imp_.State in [dsInactive] then Exit;
  if Not ( datm_cliente_faturamento.qry_receita_imp_.State in [dsInsert] )
     and ( st_modificar ) then datm_cliente_faturamento.qry_receita_imp_.Edit
  else
  if Not ( datm_cliente_faturamento.qry_receita_imp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_max.Text, nNumMax, Code);
    if ( dbedt_vl_den_max.Text = '' ) or ( nNumMax <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_cliente_faturamento.ActivePage := ts_receita_imp;
      dbedt_vl_num_max.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_cliente_faturamento.dbedt_calc_taxaChange(Sender: TObject);
begin
  if datm_cliente_faturamento.qry_receita_imp_Calc_Taxa.AsFloat > 0 then
  begin
    dblckbox_base_calc_taxa.Enabled := True;
    dblckbox_base_calc_taxa.TabStop := True;
  end
  else
  begin
    if datm_cliente_faturamento.qry_receita_imp_.State in [dsInsert,dsEdit] then
       datm_cliente_faturamento.qry_receita_imp_TP_BASE_CALC_TAXA.AsString := '0';
    dblckbox_base_calc_taxa.Enabled := False;
    dblckbox_base_calc_taxa.TabStop := False;
  end;
  VerBaseCalcTaxa;
end;

procedure Tfrm_cliente_faturamento.dblckbox_base_calc_taxaClick(
  Sender: TObject);
begin
  dbedt_vl_num_taxaChange(nil);
  VerBaseCalcTaxa;
end;

procedure Tfrm_cliente_faturamento.dblckbox_base_calc_acrClick(
  Sender: TObject);
begin
  dbedt_vl_num_taxaChange(nil);
end;

procedure Tfrm_cliente_faturamento.dblckbox_base_calc_fora_regiaoClick(
  Sender: TObject);
begin
  dbedt_vl_num_taxaChange(nil);
end;

procedure Tfrm_cliente_faturamento.dblckbox_base_calc_minClick(
  Sender: TObject);
begin
  dbedt_vl_num_taxaChange(nil);
end;

procedure Tfrm_cliente_faturamento.dblckbox_base_calc_maxClick(
  Sender: TObject);
begin
  dbedt_vl_num_taxaChange(nil);
end;

procedure Tfrm_cliente_faturamento.dbedt_cd_moeda_taxaExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente_faturamento.dbedt_cd_moeda_acrExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente_faturamento.dbedt_cd_moeda_fora_regiaoExit(
  Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente_faturamento.dbedt_cd_moeda_minExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente_faturamento.dbedt_cd_moeda_maxExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente_faturamento.btn_co_moeda_taxaClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_cliente_faturamento.qry_receita_imp_CD_MOEDA_TAXA;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_faturamento.qry_receita_imp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_faturamento.qry_receita_imp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_faturamento do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_taxaExit(nil);
end;

procedure Tfrm_cliente_faturamento.btn_co_moeda_acrClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_cliente_faturamento.qry_receita_imp_CD_MOEDA_ACR;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_faturamento.qry_receita_imp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_faturamento.qry_receita_imp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_faturamento do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_acrExit(nil);
end;

procedure Tfrm_cliente_faturamento.btn_co_moeda_fora_regiaoClick(
  Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_cliente_faturamento.qry_receita_imp_CD_MOEDA_FORA_REGIAO;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_faturamento.qry_receita_imp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_faturamento.qry_receita_imp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_faturamento do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_fora_regiaoExit(nil);
end;

procedure Tfrm_cliente_faturamento.btn_co_moeda_minClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_cliente_faturamento.qry_receita_imp_CD_MOEDA_MIN;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_faturamento.qry_receita_imp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_faturamento.qry_receita_imp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_faturamento do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_minExit(nil);
end;

procedure Tfrm_cliente_faturamento.btn_co_moeda_maxClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_cliente_faturamento.qry_receita_imp_CD_MOEDA_MAX;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_faturamento.qry_receita_imp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_faturamento.qry_receita_imp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_faturamento do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_maxExit(nil);
end;

procedure Tfrm_cliente_faturamento.VerBaseCalcTaxa;
begin
  if (datm_cliente_faturamento.qry_receita_imp_TP_BASE_CALC_TAXA.AsString = '5') or
     (datm_cliente_faturamento.qry_receita_imp_TP_BASE_CALC_TAXA.AsString = '6') then
  begin
    dbedt_cd_moeda_taxa.Color    := clWhite;
    dbedt_cd_moeda_taxa.TabStop  := True;
    dbedt_cd_moeda_taxa.ReadOnly := False;
    btn_co_moeda_taxa.Enabled    := True;
  end
  else
  begin
    if datm_cliente_faturamento.qry_receita_imp_.State in [dsInsert,dsEdit] then
       datm_cliente_faturamento.qry_receita_imp_CD_MOEDA_TAXA.AsString := '';
    dbedt_cd_moeda_taxa.Color    := clMenu;
    dbedt_cd_moeda_taxa.TabStop  := False;
    dbedt_cd_moeda_taxa.ReadOnly := True;
    btn_co_moeda_taxa.Enabled    := False;
  end;
  pnlFaixasImp.Visible := datm_cliente_faturamento.qry_receita_imp_TP_BASE_CALC_TAXA.AsString = '7';
end;

procedure Tfrm_cliente_faturamento.dbedt_vl_num_taxa2Change(Sender: TObject);
begin
  if lCancelar or lAbertura or lSalvar or lExcluir  then Exit;
  if ( datm_cliente_faturamento.qry_receita_exp_.State in [dsInactive] ) then Exit;
  if ( datm_cliente_faturamento.qry_receita_exp_.RecordCount > 0 ) or
     ( datm_cliente_faturamento.qry_receita_exp_.State in [dsInsert] ) then
  begin
    if pgctrl_cliente_faturamento.ActivePage <> ts_receita_exp then Exit;
    if Not ( datm_cliente_faturamento.qry_receita_exp_.State in [dsInsert] ) then
       datm_cliente_faturamento.qry_receita_exp_.Edit;
    Btn_Mi( False, True, True, False );
  end;
end;

procedure Tfrm_cliente_faturamento.dbedt_vl_den_min2Exit(Sender: TObject);
var
  nNumMin2 : Integer;
begin
  if datm_cliente_faturamento.qry_receita_exp_.State in [dsInactive] then Exit;
  if Not ( datm_cliente_faturamento.qry_receita_exp_.State in [dsInsert] )
     and ( st_modificar ) then datm_cliente_faturamento.qry_receita_exp_.Edit
  else
  if Not ( datm_cliente_faturamento.qry_receita_exp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_min2.Text, nNumMin2, Code);
    if ( dbedt_vl_den_min2.Text = '' ) or ( nNumMin2 <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_cliente_faturamento.ActivePage := ts_receita_exp;
      dbedt_vl_num_min2.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_cliente_faturamento.dbedt_vl_den_taxa2Exit(Sender: TObject);
var
  nNumTaxa2: Integer;
begin
  if datm_cliente_faturamento.qry_receita_exp_.State in [dsInactive] then Exit;
  if Not ( datm_cliente_faturamento.qry_receita_exp_.State in [dsInsert] )
     and ( st_modificar ) then datm_cliente_faturamento.qry_receita_exp_.Edit
  else
  if Not ( datm_cliente_faturamento.qry_receita_exp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_taxa2.Text, nNumTaxa2, Code);
    if ( dbedt_vl_den_taxa2.Text = '' ) or ( nNumTaxa2 <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_cliente_faturamento.ActivePage := ts_receita_exp;
      dbedt_vl_num_taxa2.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_cliente_faturamento.dbedt_vl_den_max2Exit(Sender: TObject);
var
  nNumMax2 : Integer;
begin
  if datm_cliente_faturamento.qry_receita_exp_.State in [dsInactive] then Exit;
  if Not ( datm_cliente_faturamento.qry_receita_exp_.State in [dsInsert] )
     and ( st_modificar ) then datm_cliente_faturamento.qry_receita_exp_.Edit
  else
  if Not ( datm_cliente_faturamento.qry_receita_exp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_max2.Text, nNumMax2, Code);
    if ( dbedt_vl_den_max2.Text = '' ) or ( nNumMax2 <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_cliente_faturamento.ActivePage := ts_receita_exp;
      dbedt_vl_num_max2.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_cliente_faturamento.dbedt_calc_taxa2Change(Sender: TObject);
begin
  if datm_cliente_faturamento.qry_receita_exp_Calc_Taxa2.AsFloat > 0 then
  begin
    dblckbox_base_calc_taxa2.Enabled := True;
    dblckbox_base_calc_taxa2.TabStop := True;
  end
  else
  begin
    if datm_cliente_faturamento.qry_receita_exp_.State in [dsInsert,dsEdit] then
       datm_cliente_faturamento.qry_receita_exp_TP_BASE_CALC_TAXA.AsString := '0';
    dblckbox_base_calc_taxa2.Enabled := False;
    dblckbox_base_calc_taxa2.TabStop := False;
  end;
  VerBaseCalcTaxa2;
end;

procedure Tfrm_cliente_faturamento.VerBaseCalcTaxa2;
begin
  if datm_cliente_faturamento.qry_receita_exp_TP_BASE_CALC_TAXA.AsString = '5' then
  begin
    dbedt_cd_moeda_taxa2.Color    := clWhite;
    dbedt_cd_moeda_taxa2.TabStop  := True;
    dbedt_cd_moeda_taxa2.ReadOnly := False;
    btn_co_moeda_taxa2.Enabled    := True;
  end
  else
  begin
    if datm_cliente_faturamento.qry_receita_exp_.State in [dsInsert,dsEdit] then
       datm_cliente_faturamento.qry_receita_exp_CD_MOEDA_TAXA.AsString := '';
    dbedt_cd_moeda_taxa2.Color    := clMenu;
    dbedt_cd_moeda_taxa2.TabStop  := False;
    dbedt_cd_moeda_taxa2.ReadOnly := True;
    btn_co_moeda_taxa2.Enabled    := False;
  end;
  pnlFaixasExp.Visible := datm_cliente_faturamento.qry_receita_Exp_TP_BASE_CALC_TAXA.AsString = '7';
end;

procedure Tfrm_cliente_faturamento.dblckbox_base_calc_max2Click(
  Sender: TObject);
begin
  dbedt_vl_num_taxa2Change(nil);
end;

procedure Tfrm_cliente_faturamento.dbedt_cd_moeda_taxa2Exit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente_faturamento.dbedt_cd_moeda_min2Exit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente_faturamento.dbedt_cd_moeda_max2Exit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente_faturamento.btn_co_moeda_taxa2Click(
  Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_cliente_faturamento.qry_receita_exp_CD_MOEDA_TAXA;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_faturamento.qry_receita_exp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_faturamento.qry_receita_exp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_faturamento do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_taxa2Exit(nil);
end;

procedure Tfrm_cliente_faturamento.btn_co_moeda_min2Click(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_cliente_faturamento.qry_receita_exp_CD_MOEDA_MIN;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_faturamento.qry_receita_exp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_faturamento.qry_receita_exp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_faturamento do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_min2Exit(nil);
end;

procedure Tfrm_cliente_faturamento.btn_co_moeda_max2Click(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_cliente_faturamento.qry_receita_exp_CD_MOEDA_MAX;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_faturamento.qry_receita_exp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_faturamento.qry_receita_exp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_faturamento do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_max2Exit(nil);
end;


procedure Tfrm_cliente_faturamento.btn_faixasClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Application.CreateForm(Tfrm_faixas, frm_faixas );
  frm_faixas.str_cliente := datm_cliente_faturamento.qry_cliente_faturamento_CD_CLIENTE.AsString;
  frm_faixas.str_unid    := datm_cliente_faturamento.qry_cliente_faturamento_CD_UNID_NEG.AsString;
  frm_faixas.str_produto := datm_cliente_faturamento.qry_cliente_faturamento_CD_PRODUTO.AsString;
  frm_faixas.str_servico := datm_cliente_faturamento.qry_cliente_faturamento_CD_SERVICO.AsString;
  frm_faixas.str_item    := datm_cliente_faturamento.qry_cliente_faturamento_CD_ITEM.AsString;
  frm_faixas.ShowModal;
end;

procedure Tfrm_cliente_faturamento.dblckbox_tp_faixaClick(Sender: TObject);
begin
  dbedt_vl_num_taxa2Change(nil);
  if datm_cliente_faturamento.qry_receita_exp_TP_FAIXA.AsString = '0' then {Sem faixa}
  begin
    pnl_taxa2.Visible  := True;
    btn_faixas.visible := False;
  end
  else
  begin
    pnl_taxa2.Visible  := False;
    btn_faixas.visible := True;
  end;
end;

function Tfrm_cliente_faturamento.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_cliente_faturamento.qry_cliente_faturamento_.State in [dsEdit] ) and st_modificar ) or
     ( datm_cliente_faturamento.qry_cliente_faturamento_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Clientes X Faturamento foi alterado.' + #13#10 +
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

  if ( ( datm_cliente_faturamento.qry_receita_imp_.State in [dsEdit] ) and st_modificar ) or
     ( datm_cliente_faturamento.qry_receita_imp_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Receitas da Importação foi alterado.' + #13#10 +
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

  if ( ( datm_cliente_faturamento.qry_receita_exp_.State in [dsEdit] ) and st_modificar ) or
     ( datm_cliente_faturamento.qry_receita_exp_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Receitas da Exportação foi alterado.' + #13#10 +
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

procedure Tfrm_cliente_faturamento.pgctrl_cliente_faturamentoChange(
  Sender: TObject);
begin

  if pgctrl_cliente_faturamento.ActivePage <> ts_receita_imp then
     datm_cliente_faturamento.qry_receita_exp_.Cancel;

  if (pgctrl_cliente_faturamento.ActivePage = ts_lista) or
     (pgctrl_cliente_faturamento.ActivePage = ts_dados_basicos) then
    dbnvg.DataSource := datm_cliente_faturamento.ds_cliente_faturamento;

  if (pgctrl_cliente_faturamento.ActivePage = ts_receita_imp) then
    dbnvg.DataSource := datm_cliente_faturamento.ds_receita_imp;

  if (pgctrl_cliente_faturamento.ActivePage = ts_receita_exp) then
    dbnvg.DataSource := datm_cliente_faturamento.ds_receita_exp;

  if (pgctrl_cliente_faturamento.ActivePage = ts_lista ) then
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

  if (pgctrl_cliente_faturamento.ActivePage = ts_dados_basicos ) then
  begin
    if datm_cliente_faturamento.qry_cliente_faturamento_LookTabelaCalculo.AsString = 'I' then
    begin
      ts_receita_imp.TabVisible := True;
      ts_receita_exp.TabVisible := False;
    end
    else
    if datm_cliente_faturamento.qry_cliente_faturamento_LookTabelaCalculo.AsString = 'E' then
    begin
      ts_receita_imp.TabVisible := False;
      ts_receita_exp.TabVisible := True;
    end;
  end;
end;

procedure Tfrm_cliente_faturamento.pgctrl_cliente_faturamentoChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_cliente_faturamento.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_cliente_faturamento.ReceitaImp;
begin
  with datm_cliente_faturamento do
  begin
    qry_receita_imp_.Close;
    qry_receita_imp_.Prepare;
    qry_receita_imp_.Open;

    ts_receita_imp.TabVisible := True;
    ts_receita_exp.TabVisible := False;
    pgctrl_cliente_faturamento.ActivePage := ts_receita_imp;

    if qry_receita_imp_.RecordCount = 0 then
    begin
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(sp_receitas);
        sp_receitas.ParamByName('@cd_cliente').AsString  := str_cliente;
        sp_receitas.ParamByName('@cd_unid_neg').AsString := str_unid;
        sp_receitas.ParamByName('@cd_produto').AsString  := str_produto;
        sp_receitas.ParamByName('@cd_servico').AsString  := str_servico;
        sp_receitas.ParamByName('@cd_item').AsString     := qry_cliente_faturamento_CD_ITEM.AsString;
        sp_receitas.ParamByName('@operacao').AsString    := '+';
        sp_receitas.ParamByName('@mod').AsString         := 'I';
        ExecStoredProc(sp_receitas);
        CloseStoredProc(sp_receitas);
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      qry_receita_imp_.Close;
      qry_receita_imp_.Prepare;
      qry_receita_imp_.Open;
      qry_receita_imp_.First;
      qry_receita_imp_.Edit;

      dbedt_cd_moeda_taxa.Color           := clMenu;
      dbedt_cd_moeda_taxa.TabStop         := False;
      dbedt_cd_moeda_taxa.ReadOnly        := True;
      btn_co_moeda_taxa.Enabled           := False;
    end;
  end;
end;

procedure Tfrm_cliente_faturamento.ReceitaExp;
begin
  with datm_cliente_faturamento do
  begin
    qry_receita_exp_.Close;
    qry_receita_exp_.Prepare;
    qry_receita_exp_.Open;

    ts_receita_imp.TabVisible := False;
    ts_receita_exp.TabVisible := True;
    pgctrl_cliente_faturamento.ActivePage := ts_receita_exp;

    if qry_receita_exp_.RecordCount = 0 then
    begin
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(sp_receitas);
        sp_receitas.ParamByName('@cd_cliente').AsString  := str_cliente;
        sp_receitas.ParamByName('@cd_unid_neg').AsString := str_unid;
        sp_receitas.ParamByName('@cd_produto').AsString  := str_produto;
        sp_receitas.ParamByName('@cd_servico').AsString  := str_servico;
        sp_receitas.ParamByName('@cd_item').AsString     := qry_cliente_faturamento_CD_ITEM.AsString;
        sp_receitas.ParamByName('@operacao').AsString    := '+';
        sp_receitas.ParamByName('@mod').AsString         := 'E';
        ExecStoredProc(sp_receitas);
        CloseStoredProc(sp_receitas);
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      qry_receita_exp_.Close;
      qry_receita_exp_.Prepare;
      qry_receita_exp_.Open;
      qry_receita_exp_.First;
      qry_receita_exp_.Edit;

      pnl_taxa2.Visible := True;
      btn_faixas.visible := False;

      dbedt_cd_moeda_taxa2.Color                        := clMenu;
      dbedt_cd_moeda_taxa2.TabStop                      := False;
      dbedt_cd_moeda_taxa2.ReadOnly                     := True;
      btn_co_moeda_taxa2.Enabled                        := False;
    end;
  end;
end;

procedure Tfrm_cliente_faturamento.dblckbox_base_calc_min2Click(
  Sender: TObject);
begin
  dbedt_vl_num_taxa2Change(nil);
end;

procedure Tfrm_cliente_faturamento.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then Close;
end;

procedure Tfrm_cliente_faturamento.dbedt_cd_itemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = dbedt_cd_item              then btn_co_itemClick(nil);
    if Sender = dbedt_tp_calculo           then btn_tp_calculoClick(nil);
    if Sender = dbedt_cd_moeda_taxa        then btn_co_moeda_taxaClick(nil);
    if Sender = dbedt_cd_moeda_taxa2       then btn_co_moeda_taxa2Click(nil);
  end;
end;

procedure Tfrm_cliente_faturamento.CodExits;
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;
procedure Tfrm_cliente_faturamento.dblckbox_base_calc_taxa2Click(
  Sender: TObject);
begin
  dbedt_vl_num_taxa2Change(nil);
  VerBaseCalcTaxa2;
end;

procedure Tfrm_cliente_faturamento.btnIncluirFaixaImpClick(Sender: TObject);
begin
  datm_cliente_faturamento.qryFaixasImp.Append;
end;

procedure Tfrm_cliente_faturamento.btnSalvarFaixaImpClick(Sender: TObject);
begin
  datm_cliente_faturamento.qryFaixasImp.Post;
end;

procedure Tfrm_cliente_faturamento.btnCancelarFaixaImpClick(Sender: TObject);
begin
  datm_cliente_faturamento.qryFaixasImp.Cancel;
end;

procedure Tfrm_cliente_faturamento.btnExcluirFaixaImpClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir esta faixa?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    datm_cliente_faturamento.qryFaixasImp.Delete;
end;

procedure Tfrm_cliente_faturamento.btnIncluirFaixaExpClick(Sender: TObject);
begin
  datm_cliente_faturamento.qryFaixasExp.Append;
end;

procedure Tfrm_cliente_faturamento.btnSalvarFaixaExpClick(Sender: TObject);
begin
  datm_cliente_faturamento.qryFaixasExp.Post;
end;

procedure Tfrm_cliente_faturamento.btnCancelarFaixaExpClick(Sender: TObject);
begin
  datm_cliente_faturamento.qryFaixasExp.Cancel;
end;

procedure Tfrm_cliente_faturamento.btnExcluirFaixaExpClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir esta faixa?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    datm_cliente_faturamento.qryFaixasExp.Delete;
end;

end.
