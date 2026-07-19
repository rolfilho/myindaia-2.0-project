unit PGSM065;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, Funcoes ;

type
  Tfrm_cliente_numerario = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pgctrl_cliente_numerario: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    ts_receita_imp: TTabSheet;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    ts_receita_exp: TTabSheet;
    lbl_cliente: TLabel;
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
    lbl_cliente2: TLabel;
    dbedt_cd_cliente2: TDBEdit;
    dbedt_nm_cliente2: TDBEdit;
    lbl_unid_neg2: TLabel;
    dbedt_cd_unid_neg2: TDBEdit;
    dbedt_nm_unid_neg2: TDBEdit;
    lbl_produto2: TLabel;
    dbedt_cd_produto2: TDBEdit;
    dbedt_nm_produto2: TDBEdit;
    lbl_servico2: TLabel;
    dbedt_cd_servico2: TDBEdit;
    dbedt_nm_servico2: TDBEdit;
    lbl_nr_solicitacao: TLabel;
    dbedt_nr_solicitacao: TDBEdit;
    lbl_item: TLabel;
    dbedt_cd_item: TDBEdit;
    dbedt_nm_item: TDBEdit;
    btn_co_item: TSpeedButton;
    lbl_tipo_calculo: TLabel;
    dbedt_tp_calculo: TDBEdit;
    dbedt_nm_calculo: TDBEdit;
    btn_tp_calculo: TSpeedButton;
    lbl_cliente3: TLabel;
    lbl_unid_neg3: TLabel;
    lbl_produto3: TLabel;
    dbedt_nm_cliente3: TDBEdit;
    dbedt_nm_unid_neg3: TDBEdit;
    dbedt_nm_produto3: TDBEdit;
    lbl_servico3: TLabel;
    lbl_item2: TLabel;
    dbedt_nm_servico3: TDBEdit;
    dbedt_nm_item2: TDBEdit;
    pnl_taxa: TPanel;
    Label2: TLabel;
    lbl_base_calc_taxa: TLabel;
    lbl_moeda_taxa: TLabel;
    dbedt_vl_num_taxa: TDBEdit;
    dbedt_vl_den_taxa: TDBEdit;
    dbedt_calc_taxa: TDBEdit;
    dblckbox_base_calc_taxa: TDBLookupComboBox;
    dbedt_cd_moeda_taxa: TDBEdit;
    dbedt_nm_moeda_taxa: TDBEdit;
    lbl_taxa: TLabel;
    btn_co_moeda_taxa: TSpeedButton;
    pnl_acr: TPanel;
    Label1: TLabel;
    lbl_base_calc_acr: TLabel;
    lbl_moeda_acr: TLabel;
    lbl_acr: TLabel;
    btn_co_moeda_acr: TSpeedButton;
    dbedt_vl_num_acr: TDBEdit;
    dbedt_vl_den_acr: TDBEdit;
    dblckbox_base_calc_acr: TDBLookupComboBox;
    dbedt_cd_moeda_acr: TDBEdit;
    dbedt_nm_moeda_acr: TDBEdit;
    pnl_fora_regiao: TPanel;
    Label6: TLabel;
    lbl_base_calc_fora_regiao: TLabel;
    lbl_moeda_fora_regiao: TLabel;
    lbl_fora_regiao: TLabel;
    btn_co_moeda_fora_regiao: TSpeedButton;
    dbedt_vl_num_fora_regiao: TDBEdit;
    dbedt_vl_den_fora_regiao: TDBEdit;
    dbedt_calc_fora_regiao: TDBEdit;
    dblckbox_base_calc_fora_regiao: TDBLookupComboBox;
    dbedt_cd_moeda_fora_regiao: TDBEdit;
    dbedt_nm_moeda_fora_regiao: TDBEdit;
    pnl_min: TPanel;
    Label10: TLabel;
    lbl_base_calc_min: TLabel;
    lbl_moeda_min: TLabel;
    lbl_min: TLabel;
    btn_co_moeda_min: TSpeedButton;
    dbedt_vl_num_min: TDBEdit;
    dbedt_vl_den_min: TDBEdit;
    dbedt_calc_min: TDBEdit;
    dblckbox_base_calc_min: TDBLookupComboBox;
    dbedt_cd_moeda_min: TDBEdit;
    dbedt_nm_moeda_min: TDBEdit;
    pnl_max: TPanel;
    Label14: TLabel;
    lbl_base_calc_max: TLabel;
    lbl_moeda_max: TLabel;
    lbl_max: TLabel;
    btn_co_moeda_max: TSpeedButton;
    dbedt_vl_num_max: TDBEdit;
    dbedt_vl_den_max: TDBEdit;
    dbedt_calc_max: TDBEdit;
    dblckbox_base_calc_max: TDBLookupComboBox;
    dbedt_cd_moeda_max: TDBEdit;
    dbedt_nm_moeda_max: TDBEdit;
    lbl_regime_trib: TLabel;
    lbl_dt_base: TLabel;
    dblckbox_dt_base: TDBLookupComboBox;
    lbl_in_ativo: TLabel;
    dblkpcbox_in_ativo: TDBLookupComboBox;
    dbedt_calc_acr: TDBEdit;
    lbl_cliente4: TLabel;
    dbedt_nm_cliente4: TDBEdit;
    lbl_servico4: TLabel;
    dbedt_nm_servico4: TDBEdit;
    lbl_unid_neg4: TLabel;
    dbedt_nm_unid_neg4: TDBEdit;
    lbl_item3: TLabel;
    dbedt_nm_item3: TDBEdit;
    dbedt_nm_produto4: TDBEdit;
    lbl_produto4: TLabel;
    lbl_tp_faixa: TLabel;
    dblckbox_tp_faixa: TDBLookupComboBox;
    dblckbox_regime_trib2: TDBLookupComboBox;
    lbl_dt_base2: TLabel;
    lbl_ativo2: TLabel;
    dblck_box_in_ativo2: TDBLookupComboBox;
    lbl_tp_faixa_valor: TLabel;
    dblckbox_tp_faixa_valor: TDBLookupComboBox;
    lbl_pc_reduc_re_canc: TLabel;
    dbedt_pc_reduc_re_canc: TDBEdit;
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
    lbl_base_calc_min2: TLabel;
    lbl_moeda_min2: TLabel;
    lbl_min2: TLabel;
    btn_co_moeda_min2: TSpeedButton;
    dbedt_vl_num_min2: TDBEdit;
    dbedt_vl_den_min2: TDBEdit;
    dbedt_calc_min2: TDBEdit;
    dblckbox_base_calc_min2: TDBLookupComboBox;
    dbedt_cd_moeda_min2: TDBEdit;
    dbedt_nm_moeda_min2: TDBEdit;
    pnl_max2: TPanel;
    Label13: TLabel;
    lbl_base_calc_max2: TLabel;
    lbl_moeda_max2: TLabel;
    lbl_max2: TLabel;
    btn_co_moeda_max2: TSpeedButton;
    dbedt_vl_num_max2: TDBEdit;
    dbedt_vl_den_max2: TDBEdit;
    dbedt_calc_max2: TDBEdit;
    dblckbox_base_calc_max2: TDBLookupComboBox;
    dbedt_cd_moeda_max2: TDBEdit;
    dbedt_nm_moeda_max2: TDBEdit;
    btn_faixas: TButton;
    dbgrd_reg_trib: TDBGrid;
    Label7: TLabel;
    dblckpbox_tp_destino: TDBLookupComboBox;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cmb_ordem: TComboBox;
    bvl1: TBevel;
    procedure btn_tp_calculoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure dbedt_cd_itemExit(Sender: TObject);
    procedure btn_co_itemClick(Sender: TObject);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure dbedt_tp_calculoExit(Sender: TObject);
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
    procedure dblckbox_base_calc_taxaClick(Sender: TObject);
    procedure dblckbox_base_calc_acrClick(Sender: TObject);
    procedure dblckbox_base_calc_fora_regiaoClick(Sender: TObject);
    procedure dblckbox_base_calc_minClick(Sender: TObject);
    procedure dblckbox_base_calc_maxClick(Sender: TObject);
    procedure dbedt_calc_taxaChange(Sender: TObject);
    procedure dbedt_calc_acrChange(Sender: TObject);
    procedure dbedt_calc_fora_regiaoChange(Sender: TObject);
    procedure dbedt_calc_minChange(Sender: TObject);
    procedure dbedt_calc_maxChange(Sender: TObject);
    procedure dbedt_vl_den_taxaExit(Sender: TObject);
    procedure dbedt_vl_den_acrExit(Sender: TObject);
    procedure dbedt_vl_den_fora_regiaoExit(Sender: TObject);
    procedure dbedt_vl_den_minExit(Sender: TObject);
    procedure dbedt_vl_den_maxExit(Sender: TObject);
    procedure dbedt_nr_solicitacaoChange(Sender: TObject);
    procedure VerBaseCalcTaxa;
    procedure VerBaseCalcAcr;
    procedure VerBaseCalcForaRegiao;
    procedure VerBaseCalcMin;
    procedure VerBaseCalcMax;
    procedure VerBaseCalcTaxa2;
    procedure VerBaseCalcMin2;
    procedure VerBaseCalcMax2;
    procedure dbedt_vl_num_taxaChange(Sender: TObject);
    procedure dbedt_vl_num_taxa2Change(Sender: TObject);
    procedure dbedt_vl_den_taxa2Exit(Sender: TObject);
    procedure dbedt_vl_den_min2Exit(Sender: TObject);
    procedure dbedt_vl_den_max2Exit(Sender: TObject);
    procedure dbedt_calc_taxa2Change(Sender: TObject);
    procedure dbedt_calc_min2Change(Sender: TObject);
    procedure dbedt_calc_max2Change(Sender: TObject);
    procedure dblckbox_base_calc_taxa2Click(Sender: TObject);
    procedure dblckbox_base_calc_min2Click(Sender: TObject);
    procedure dblckbox_base_calc_max2Click(Sender: TObject);
    procedure dbedt_cd_moeda_taxa2Exit(Sender: TObject);
    procedure dbedt_cd_moeda_min2Exit(Sender: TObject);
    procedure dbedt_cd_moeda_max2Exit(Sender: TObject);
    procedure btn_co_moeda_taxa2Click(Sender: TObject);
    procedure btn_co_moeda_min2Click(Sender: TObject);
    procedure btn_co_moeda_max2Click(Sender: TObject);
    procedure btn_faixasClick(Sender: TObject);
    procedure dblckbox_tp_faixaClick(Sender: TObject);
    procedure pgctrl_cliente_numerarioChange(Sender: TObject);
    procedure pgctrl_cliente_numerarioChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbedt_nr_solicitacaoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_itemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_bancoExit(Sender: TObject);
  private
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..1] Of String[60];
    lCancelar, lAbertura, lSalvar, lExcluir, st_modificar, st_incluir, st_excluir : Boolean;
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
  frm_cliente_numerario: Tfrm_cliente_numerario;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGSM041, PGSM048, PGSM059, PGSM067, PGSM096, PGSM109, PGSM148;

procedure Tfrm_cliente_numerario.btn_tp_calculoClick(Sender: TObject);
begin
  Consulta_On_line( 'TCALCULO', datm_cliente_numerario.qry_cliente_numerario_TP_CALCULO, 'Tipo de Cálculo' );
end;

procedure Tfrm_cliente_numerario.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String );
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
    Caption      := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_cliente_numerario.FormCreate(Sender: TObject);
begin
  lCancelar    := False;
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

 { Inicializa o Data Module para Cliente X Numerário}
  Application.CreateForm( Tdatm_cliente_numerario, datm_cliente_numerario );

  with datm_cliente_numerario do
  begin
    ds_cliente_numerario.AutoEdit := st_modificar;

    tbl_yesno_.Open;
    tbl_dt_base_.Open;
    tbl_regime_trib_.Open;
    tbl_tp_faixa_.Open;
    tbl_tp_faixa_valor_.Open;

    qry_tp_destino_.Close;
    qry_tp_destino_.Prepare;
    qry_tp_destino_.Open;

    qry_base_calc_exp_.Close;
    qry_base_calc_exp_.Prepare;
    qry_base_calc_exp_.Open;

    qry_base_calc_imp_.Close;
    qry_base_calc_imp_.Prepare;
    qry_base_calc_imp_.Open;

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

    qry_cliente_numerario_.Close;
    qry_cliente_numerario_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
    qry_cliente_numerario_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_cliente_numerario_.ParamByName('CD_PRODUTO').AsString  := str_produto;
    qry_cliente_numerario_.ParamByName('CD_SERVICO').AsString  := str_servico;
    qry_cliente_numerario_.Prepare;
    qry_cliente_numerario_.Open;

  end;

  a_str_indices[0] := 'CD_ITEM';

  with cmb_ordem do
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

procedure Tfrm_cliente_numerario.FormShow(Sender: TObject);
begin
  ts_receita_imp.TabVisible := False;
  ts_receita_exp.TabVisible := False;

  lNaoConsiste := False;
  lAbertura    := True;
  with datm_cliente_numerario do
  begin
    qry_cliente_numerario_.Close;
    qry_cliente_numerario_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
    qry_cliente_numerario_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_cliente_numerario_.ParamByName('CD_PRODUTO').AsString  := str_produto;
    qry_cliente_numerario_.ParamByName('CD_SERVICO').AsString  := str_servico;
    qry_cliente_numerario_.Prepare;
    qry_cliente_numerario_.Open;
  end;

  pgctrl_cliente_numerario.ActivePage := ts_lista;
  edt_chave.SetFocus;
  lAbertura    := False;
end;

procedure Tfrm_cliente_numerario.FormClose(Sender: TObject;
var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_cliente_numerario do
    begin
      tbl_yesno_.Close;
      tbl_dt_base_.Close;
      tbl_regime_trib_.Close;
      tbl_tp_faixa_.Close;
      tbl_tp_faixa_valor_.Close;

      qry_tp_destino_.Close;
      qry_base_calc_exp_.Close;
      qry_base_calc_imp_.Close;

      qry_empresa_nac_.Close;
      qry_unid_neg_.Close;
      qry_produto_.Close;
      qry_servico_.Close;
      qry_item_.Close;
      qry_banco_.Close;
      qry_calculo_.Close;
      qry_moeda_.Close;
      qry_cliente_numerario_.Close;
      Free;
    end;
  end
  else
    Action := caNone;
end;

procedure Tfrm_cliente_numerario.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  with datm_cliente_numerario do
  begin
    qry_cliente_numerario_.DisableControls;
    qry_cliente_numerario_.Cancel;
    qry_cliente_numerario_.Append;
    qry_cliente_numerario_.EnableControls;

    qry_cliente_numerario_CD_CLIENTE.AsString  := str_cliente;
    qry_cliente_numerario_CD_UNID_NEG.AsString := str_unid;
    qry_cliente_numerario_CD_PRODUTO.AsString  := str_produto;
    qry_cliente_numerario_CD_SERVICO.AsString  := str_servico;

  end;
  pgctrl_cliente_numerario.ActivePage := ts_dados_basicos;
  dbedt_nr_solicitacao.SetFocus;
end;

procedure Tfrm_cliente_numerario.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava    then Exit;
end;

procedure Tfrm_cliente_numerario.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_cliente_numerario.Cancelar;
begin
  lCancelar := True;
  try
    if datm_cliente_numerario.qry_cliente_numerario_.State in [dsInsert, dsEdit] then
      datm_cliente_numerario.qry_cliente_numerario_.Cancel;

    if datm_cliente_numerario.qry_receita_imp_.State in [dsInsert, dsEdit] then
      datm_cliente_numerario.qry_receita_imp_.Cancel;

    if datm_cliente_numerario.qry_receita_exp_.State in [dsInsert, dsEdit] then
      datm_cliente_numerario.qry_receita_exp_.Cancel;

    pgctrl_cliente_numerario.ActivePage := ts_dados_basicos;
    dbedt_nr_solicitacao.SetFocus;
    with datm_cliente_numerario do
    begin
      if qry_cliente_numerario_LookTabelaCalculo.AsString = 'I' then
      begin
        ts_receita_imp.TabVisible := True;
        ts_receita_exp.TabVisible := False;
      end
      else if qry_cliente_numerario_LookTabelaCalculo.AsString = 'E' then
      begin
        ts_receita_imp.TabVisible := False;
        ts_receita_exp.TabVisible := True;
      end;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  lCancelar := False;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_cliente_numerario.btn_excluirClick(Sender: TObject);
begin
  lExcluir := True;
  if BoxMensagem( 'Este Cliente X Item do Numerário será excluído! Confirma exclusão?', 1 ) then
  try
    datm_main.db_broker.StartTransaction;
    with datm_cliente_numerario do
    begin
      {Apagar Receitas de Importação}
      CloseStoredProc(sp_receitas);
      sp_receitas.ParamByName('@cd_cliente').AsString  := str_cliente;
      sp_receitas.ParamByName('@cd_unid_neg').AsString := str_unid;
      sp_receitas.ParamByName('@cd_produto').AsString  := str_produto;
      sp_receitas.ParamByName('@cd_servico').AsString  := str_servico;
      sp_receitas.ParamByName('@cd_item').AsString     := qry_cliente_numerario_CD_ITEM.AsString;
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
      sp_receitas.ParamByName('@cd_item').AsString     := qry_cliente_numerario_CD_ITEM.AsString;
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

      {Apaga por último os dados de cliente numerário pois eles servem de
       parâmetro para Receitas de Importação e Exportação}
      qry_cliente_numerario_.Delete;

    end;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_cliente_numerario.qry_cliente_numerario_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  pgctrl_cliente_numerario.ActivePage := ts_lista;
  lExcluir := False;
end;

procedure Tfrm_cliente_numerario.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_cliente_numerario.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_cliente_numerario.qry_cliente_numerario_, edt_chave.Text, a_str_indices[cmb_ordem.ItemIndex] );
end;

function Tfrm_cliente_numerario.Consiste : Boolean;
begin
  Consiste := True;

  {Nº Solicitação}
  if dbedt_nr_solicitacao.Text = '' then
  begin
    BoxMensagem('Campo Nº Solicitação deve ser preenchido!', 2);
    pgctrl_cliente_numerario.ActivePage := ts_dados_basicos;
    dbedt_nr_solicitacao.SetFocus;
    Consiste := False;
    Exit;
  end;

  {Item}
  if Not lNaoConsiste then
  begin
    if dbedt_cd_item.Text = '' then
    begin
      BoxMensagem('Campo Item deve ser preenchido!', 2);
      pgctrl_cliente_numerario.ActivePage := ts_dados_basicos;
      dbedt_cd_item.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  if ( datm_cliente_numerario.qry_cliente_numerario_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item );
    if dbedt_cd_item.Text <> '' then
    begin
      if dbedt_nm_item.Text = '' then
      begin
        BoxMensagem('Código do Item inválido!', 2);
        pgctrl_cliente_numerario.ActivePage := ts_dados_basicos;
        dbedt_cd_item.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  {Tipo de Cálculo}
  if Not lNaoConsiste then
  begin
    if dbedt_tp_calculo.Text = '' then
    begin
      BoxMensagem('Campo Tipo de Cálculo deve ser preenchido!', 2);
      pgctrl_cliente_numerario.ActivePage := ts_dados_basicos;
      dbedt_tp_calculo.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  if ( datm_cliente_numerario.qry_cliente_numerario_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_tp_calculo );
    if dbedt_tp_calculo.Text <> '' then
    begin
      if dbedt_nm_calculo.Text = '' then
      begin
        BoxMensagem('Código do Tipo de Cálculo inválido!', 2);
        pgctrl_cliente_numerario.ActivePage := ts_dados_basicos;
        dbedt_tp_calculo.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  {Moeda Taxa Importação}
  if ( datm_cliente_numerario.qry_receita_imp_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_moeda_taxa );
    if dbedt_cd_moeda_taxa.Text <> '' then
    begin
      if dbedt_nm_moeda_taxa.Text = '' then
      begin
        BoxMensagem('Código da Moeda/Índice da Taxa inválido!',2);
        pgctrl_cliente_numerario.ActivePage := ts_receita_imp;
        dbedt_cd_moeda_taxa.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  {Moeda Acréscimo}
  if ( datm_cliente_numerario.qry_receita_imp_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_moeda_acr );
    if dbedt_cd_moeda_acr.Text <> '' then
    begin
      if dbedt_nm_moeda_acr.Text = '' then
      begin
        BoxMensagem('Código da Moeda/Índice do Acréscimo inválido!',2);
        pgctrl_cliente_numerario.ActivePage := ts_receita_imp;
        dbedt_cd_moeda_acr.SetFocus;
        Exit;
      end;
    end;
  end;

  {Moeda Fora Região}
  if ( datm_cliente_numerario.qry_receita_imp_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_moeda_fora_regiao );
    if dbedt_cd_moeda_fora_regiao.Text <> '' then
    begin
      if dbedt_nm_moeda_fora_regiao.Text = '' then
      begin
        BoxMensagem('Código da Moeda/Índice de Fora da Região inválido!',2);
        pgctrl_cliente_numerario.ActivePage := ts_receita_imp;
        dbedt_cd_moeda_fora_regiao.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  {Moeda Mínimo Importação}
  if ( datm_cliente_numerario.qry_receita_imp_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_moeda_min );
    if dbedt_cd_moeda_min.Text <> '' then
    begin
      if dbedt_nm_moeda_min.Text = '' then
      begin
        BoxMensagem('Código da Moeda/Índice Mínimo inválido!',2);
        pgctrl_cliente_numerario.ActivePage := ts_receita_imp;
        dbedt_cd_moeda_min.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  {Moeda Máximo Importação}
  if ( datm_cliente_numerario.qry_receita_imp_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_moeda_max );
    if dbedt_nm_moeda_max.Text <> '' then
    begin
      if dbedt_cd_moeda_max.Text = '' then
      begin
        BoxMensagem('Código da Moeda/Índice Máximo inválido!',2);
        pgctrl_cliente_numerario.ActivePage := ts_receita_imp;
        dbedt_cd_moeda_max.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  {Moeda Taxa Exportação}
  if ( datm_cliente_numerario.qry_receita_exp_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_moeda_taxa2 );
    if dbedt_cd_moeda_taxa2.Text <> '' then
    begin
      if dbedt_nm_moeda_taxa2.Text = '' then
      begin
        BoxMensagem('Código da Moeda/Índice da Taxa inválido!',2);
        pgctrl_cliente_numerario.ActivePage := ts_receita_exp;
        dbedt_cd_moeda_taxa2.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  {Moeda Mínimo Exportação}
  if ( datm_cliente_numerario.qry_receita_exp_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_moeda_min2 );
    if dbedt_cd_moeda_min2.Text <> '' then
    begin
      if dbedt_nm_moeda_min2.Text = '' then
      begin
        BoxMensagem('Código da Moeda/Índice Mínimo inválido!',2);
        pgctrl_cliente_numerario.ActivePage := ts_receita_exp;
        dbedt_cd_moeda_min2.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  {Moeda Máximo Exportação}
  if ( datm_cliente_numerario.qry_receita_exp_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_moeda_max2 );
    if dbedt_cd_moeda_max2.Text <> '' then
    begin
      if dbedt_nm_moeda_max2.Text = '' then
      begin
        BoxMensagem('Código da Moeda/Índice Máximo inválido!',2);
        pgctrl_cliente_numerario.ActivePage := ts_receita_exp;
        dbedt_cd_moeda_max2.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;
end;

function Tfrm_cliente_numerario.Grava : Boolean;
var
  lDadosBasicos : Boolean;
  str_nr_solic, str_cd_item, str_tp_calculo : String;
begin
  lDadosBasicos := True;
  lSalvar := True;
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_cliente_numerario.qry_cliente_numerario_.State in [dsInsert, dsEdit] ) or
       ( datm_cliente_numerario.qry_receita_imp_.State in [dsInsert, dsEdit] ) or
       ( datm_cliente_numerario.qry_receita_exp_.State in [dsInsert, dsEdit] ) then
    begin
      if ( datm_cliente_numerario.qry_cliente_numerario_.State in [dsInsert, dsEdit] ) then
      begin
        datm_cliente_numerario.qry_cliente_numerario_.Post;
        lDadosBasicos := True;
      end;

      if ( datm_cliente_numerario.qry_receita_imp_.State in [dsEdit] ) then
      begin
        datm_cliente_numerario.qry_receita_imp_.Post;
        lDadosBasicos := False;
      end;

      if ( datm_cliente_numerario.qry_receita_exp_.State in [dsEdit] ) then
      begin
        datm_cliente_numerario.qry_receita_exp_.Post;
        lDadosBasicos := False;
      end;
    end;
    datm_main.db_broker.Commit;
    Grava := True;

    if lDadosBasicos then
    begin
      with datm_cliente_numerario do
      begin
        if qry_cliente_numerario_LookTabelaCalculo.AsString = 'I' then
        begin
          ReceitaImp;
          Exit;
        end
        else if qry_cliente_numerario_LookTabelaCalculo.AsString = 'E' then
        begin
          ReceitaExp;
          Exit;
        end;
      end;
    end;

    with datm_cliente_numerario do
    begin
      str_nr_solic   := qry_cliente_numerario_NR_SOLICITACAO.AsString;
      str_cd_item    := qry_cliente_numerario_CD_ITEM.AsString;
      str_tp_calculo := qry_cliente_numerario_TP_CALCULO.AsString;

      qry_cliente_numerario_.Close;
      qry_cliente_numerario_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
      qry_cliente_numerario_.ParamByName('CD_UNID_NEG').AsString := str_unid;
      qry_cliente_numerario_.ParamByName('CD_PRODUTO').AsString  := str_produto;
      qry_cliente_numerario_.ParamByName('CD_SERVICO').AsString  := str_servico;
      qry_cliente_numerario_.Prepare;
      qry_cliente_numerario_.Open;

      datm_cliente_numerario.qry_cliente_numerario_.Locate('NR_SOLICITACAO;CD_ITEM;TP_CALCULO',
      VarArrayOf([str_nr_solic, str_cd_item, str_tp_calculo ]),
                  [loCaseInsensitive]);
    end;
  except
    on E: Exception do
    begin
      datm_cliente_numerario.qry_cliente_numerario_.Cancel;
      datm_cliente_numerario.qry_receita_imp_.Cancel;
      datm_cliente_numerario.qry_receita_exp_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  lSalvar := False;
  pgctrl_cliente_numerario.ActivePage := ts_dados_basicos;
  dbnvg.Enabled     := False;
  edt_chave.Enabled := False;
  cmb_ordem.Enabled  := False;

  with datm_cliente_numerario do
  begin
    if datm_cliente_numerario.qry_cliente_numerario_LookTabelaCalculo.AsString = 'I' then
    begin
      ts_receita_imp.TabVisible := True;
      ts_receita_exp.TabVisible := False;
    end
    else if datm_cliente_numerario.qry_cliente_numerario_LookTabelaCalculo.AsString = 'E' then
    begin
      ts_receita_imp.TabVisible := False;
      ts_receita_exp.TabVisible := True;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_cliente_numerario.dbedt_cd_itemExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente_numerario.btn_co_itemClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2214';
  Application.CreateForm(Tfrm_item, frm_item);
  frm_item.Cons_OnLine := datm_cliente_numerario.qry_cliente_numerario_CD_ITEM;
  with frm_item do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_numerario.qry_cliente_numerario_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_numerario.qry_cliente_numerario_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_numerario do
  begin
    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_itemExit(nil);
end;

procedure Tfrm_cliente_numerario.btn_co_bancoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2216';
  Application.CreateForm(Tfrm_banco, frm_banco);
  frm_banco.Cons_OnLine := datm_cliente_numerario.qry_cliente_numerario_CD_BANCO;
  with frm_banco do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_numerario.qry_cliente_numerario_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_numerario.qry_cliente_numerario_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_numerario do
  begin
    qry_banco_.Close;
    qry_banco_.Prepare;
    qry_banco_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_bancoExit(nil);
end;

procedure Tfrm_cliente_numerario.dbedt_tp_calculoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente_numerario.dbedt_cd_moeda_taxaExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente_numerario.dbedt_cd_moeda_acrExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente_numerario.dbedt_cd_moeda_fora_regiaoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente_numerario.dbedt_cd_moeda_minExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente_numerario.dbedt_cd_moeda_maxExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente_numerario.btn_co_moeda_taxaClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_cliente_numerario.qry_receita_imp_CD_MOEDA_TAXA;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_numerario.qry_receita_imp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_numerario.qry_receita_imp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_numerario do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_taxaExit(nil);
end;

procedure Tfrm_cliente_numerario.btn_co_moeda_acrClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_cliente_numerario.qry_receita_imp_CD_MOEDA_ACR;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_numerario.qry_receita_imp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_numerario.qry_receita_imp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_numerario do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_acrExit(nil);
end;

procedure Tfrm_cliente_numerario.btn_co_moeda_fora_regiaoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_cliente_numerario.qry_receita_imp_CD_MOEDA_FORA_REGIAO;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_numerario.qry_receita_imp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_numerario.qry_receita_imp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_numerario do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_fora_regiaoExit(nil);
end;

procedure Tfrm_cliente_numerario.btn_co_moeda_minClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_cliente_numerario.qry_receita_imp_CD_MOEDA_MIN;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_numerario.qry_receita_imp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_numerario.qry_receita_imp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_numerario do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_minExit(nil);
end;

procedure Tfrm_cliente_numerario.btn_co_moeda_maxClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_cliente_numerario.qry_receita_imp_CD_MOEDA_MAX;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_numerario.qry_receita_imp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_numerario.qry_receita_imp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_numerario do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_maxExit(nil);
end;

procedure Tfrm_cliente_numerario.dblckbox_base_calc_taxaClick(Sender: TObject);
begin
  dbedt_vl_num_taxaChange(nil);
  VerBaseCalcTaxa;
end;

procedure Tfrm_cliente_numerario.dblckbox_base_calc_acrClick(Sender: TObject);
begin
  dbedt_vl_num_taxaChange(nil);
  VerBaseCalcAcr;
end;

procedure Tfrm_cliente_numerario.dblckbox_base_calc_fora_regiaoClick(Sender: TObject);
begin
  dbedt_vl_num_taxaChange(nil);
  VerBaseCalcForaRegiao;
end;

procedure Tfrm_cliente_numerario.dblckbox_base_calc_minClick(Sender: TObject);
begin
  dbedt_vl_num_taxaChange(nil);
  VerBaseCalcMin;
end;

procedure Tfrm_cliente_numerario.dblckbox_base_calc_maxClick(Sender: TObject);
begin
  dbedt_vl_num_taxaChange(nil);
  VerBaseCalcMax;
end;

procedure Tfrm_cliente_numerario.dbedt_calc_taxaChange(Sender: TObject);
begin
  if datm_cliente_numerario.qry_receita_imp_Calc_Taxa.AsFloat > 0 then
  begin
    dblckbox_base_calc_taxa.Enabled := True;
    dblckbox_base_calc_taxa.TabStop := True;
  end
  else
  begin
    if datm_cliente_numerario.qry_receita_imp_.State in [dsInsert,dsEdit] then
       datm_cliente_numerario.qry_receita_imp_TP_BASE_CALC_TAXA.AsString := '0';
    dblckbox_base_calc_taxa.Enabled := False;
    dblckbox_base_calc_taxa.TabStop := False;
  end;
  VerBaseCalcTaxa;
end;

procedure Tfrm_cliente_numerario.dbedt_calc_acrChange(Sender: TObject);
begin
  if datm_cliente_numerario.qry_receita_imp_Calc_Acr.AsFloat > 0 then
  begin
    dblckbox_base_calc_acr.Enabled := True;
    dblckbox_base_calc_acr.TabStop := True;
  end
  else
  begin
    if datm_cliente_numerario.qry_receita_imp_.State in [dsInsert,dsEdit] then
       datm_cliente_numerario.qry_receita_imp_TP_BASE_CALC_ACR.AsString := '0';
    dblckbox_base_calc_acr.Enabled := False;
    dblckbox_base_calc_acr.TabStop := False;
  end;
  VerBaseCalcAcr;
end;

procedure Tfrm_cliente_numerario.dbedt_calc_fora_regiaoChange(Sender: TObject);
begin
  if datm_cliente_numerario.qry_receita_imp_Calc_Fora_Regiao.AsFloat > 0 then
  begin
    dblckbox_base_calc_fora_regiao.Enabled := True;
    dblckbox_base_calc_fora_regiao.TabStop := True;
  end
  else
  begin
    if datm_cliente_numerario.qry_receita_imp_.State in [dsInsert,dsEdit] then
       datm_cliente_numerario.qry_receita_imp_TP_BASE_CALC_FORA_REGIAO.AsString := '0';
    dblckbox_base_calc_fora_regiao.Enabled := False;
    dblckbox_base_calc_fora_regiao.TabStop := False;
  end;
  VerBaseCalcForaRegiao;
end;

procedure Tfrm_cliente_numerario.dbedt_calc_minChange(Sender: TObject);
begin
  if datm_cliente_numerario.qry_receita_imp_Calc_Min.AsFloat > 0 then
  begin
    dblckbox_base_calc_min.Enabled := True;
    dblckbox_base_calc_min.TabStop := True;
  end
  else
  begin
    if datm_cliente_numerario.qry_receita_imp_.State in [dsInsert,dsEdit] then
       datm_cliente_numerario.qry_receita_imp_TP_BASE_CALC_MIN.AsString := '0';
    dblckbox_base_calc_min.Enabled := False;
    dblckbox_base_calc_min.TabStop := False;
  end;
  VerBaseCalcMin;
end;

procedure Tfrm_cliente_numerario.dbedt_calc_maxChange(Sender: TObject);
begin
  if datm_cliente_numerario.qry_receita_imp_Calc_Max.AsFloat > 0 then
  begin
    dblckbox_base_calc_max.Enabled := True;
    dblckbox_base_calc_max.TabStop := True;
  end
  else
  begin
    if datm_cliente_numerario.qry_receita_imp_.State in [dsInsert,dsEdit] then
       datm_cliente_numerario.qry_receita_imp_TP_BASE_CALC_MAX.AsString := '0';
    dblckbox_base_calc_max.Enabled := False;
    dblckbox_base_calc_max.TabStop := False;
  end;
  VerBaseCalcMax;
end;

procedure Tfrm_cliente_numerario.dbedt_vl_den_taxaExit(Sender: TObject);
var
  nNumTaxa : Integer;
begin
  if datm_cliente_numerario.qry_receita_imp_.State in [dsInactive] then Exit;
  if Not ( datm_cliente_numerario.qry_receita_imp_.State in [dsInsert] )
     and ( st_modificar ) then datm_cliente_numerario.qry_receita_imp_.Edit
  else
  if Not ( datm_cliente_numerario.qry_receita_imp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_taxa.Text, nNumTaxa, Code);
    if ( dbedt_vl_den_taxa.Text = '' ) or ( nNumTaxa <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_cliente_numerario.ActivePage := ts_receita_imp;
      dbedt_vl_num_taxa.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_cliente_numerario.dbedt_vl_den_acrExit(Sender: TObject);
var
  nNumAcr : Integer;
begin
  if datm_cliente_numerario.qry_receita_imp_.State in [dsInactive] then Exit;
  if Not ( datm_cliente_numerario.qry_receita_imp_.State in [dsInsert] )
     and ( st_modificar ) then datm_cliente_numerario.qry_receita_imp_.Edit
  else
  if Not ( datm_cliente_numerario.qry_receita_imp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_acr.Text, nNumAcr, Code);
    if ( dbedt_vl_den_acr.Text = '' ) or ( nNumAcr <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_cliente_numerario.ActivePage := ts_receita_imp;
      dbedt_vl_num_acr.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_cliente_numerario.dbedt_vl_den_fora_regiaoExit(Sender: TObject);
var
  nNumForaRegiao : Integer;
begin
  if datm_cliente_numerario.qry_receita_imp_.State in [dsInactive] then Exit;
  if Not ( datm_cliente_numerario.qry_receita_imp_.State in [dsInsert] )
     and ( st_modificar ) then datm_cliente_numerario.qry_receita_imp_.Edit
  else
  if Not ( datm_cliente_numerario.qry_receita_imp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_fora_regiao.Text, nNumForaRegiao, Code);
    if ( dbedt_vl_den_fora_regiao.Text = '' ) or ( nNumForaRegiao <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_cliente_numerario.ActivePage := ts_receita_imp;
      dbedt_vl_num_fora_regiao.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_cliente_numerario.dbedt_vl_den_minExit(Sender: TObject);
var
  nNumMin : Integer;
begin
  if datm_cliente_numerario.qry_receita_imp_.State in [dsInactive] then Exit;
  if Not ( datm_cliente_numerario.qry_receita_imp_.State in [dsInsert] )
     and ( st_modificar ) then datm_cliente_numerario.qry_receita_imp_.Edit
  else
  if Not ( datm_cliente_numerario.qry_receita_imp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_min.Text, nNumMin, Code);
    if ( dbedt_vl_den_min.Text = '' ) or ( nNumMin <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_cliente_numerario.ActivePage := ts_receita_imp;
      dbedt_vl_num_min.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_cliente_numerario.dbedt_vl_den_maxExit(Sender: TObject);
var
  nNumMax : Integer;
begin
  if datm_cliente_numerario.qry_receita_imp_.State in [dsInactive] then Exit;
  if Not ( datm_cliente_numerario.qry_receita_imp_.State in [dsInsert] )
     and ( st_modificar ) then datm_cliente_numerario.qry_receita_imp_.Edit
  else
  if Not ( datm_cliente_numerario.qry_receita_imp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_max.Text, nNumMax, Code);
    if ( dbedt_vl_den_max.Text = '' ) or ( nNumMax <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_cliente_numerario.ActivePage := ts_receita_imp;
      dbedt_vl_num_max.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_cliente_numerario.dbedt_nr_solicitacaoChange(Sender: TObject);
begin
  if datm_cliente_numerario.qry_cliente_numerario_.State in [dsInsert,dsEdit] then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_cliente_numerario.VerBaseCalcTaxa;
begin
  if datm_cliente_numerario.qry_receita_imp_TP_BASE_CALC_TAXA.AsString = '5' then
  begin
    dbedt_cd_moeda_taxa.Color    := clWhite;
    dbedt_cd_moeda_taxa.TabStop  := True;
    dbedt_cd_moeda_taxa.ReadOnly := False;
    btn_co_moeda_taxa.Enabled    := True;
  end
  else
  begin
    if datm_cliente_numerario.qry_receita_imp_.State in [dsInsert,dsEdit] then
       datm_cliente_numerario.qry_receita_imp_CD_MOEDA_TAXA.AsString := '';
    dbedt_cd_moeda_taxa.Color    := clMenu;
    dbedt_cd_moeda_taxa.TabStop  := False;
    dbedt_cd_moeda_taxa.ReadOnly := True;
    btn_co_moeda_taxa.Enabled    := False;
  end;
end;

procedure Tfrm_cliente_numerario.VerBaseCalcAcr;
begin
  if datm_cliente_numerario.qry_receita_imp_TP_BASE_CALC_ACR.AsString = '5' then
  begin
    dbedt_cd_moeda_acr.Color    := clWhite;
    dbedt_cd_moeda_acr.TabStop  := True;
    dbedt_cd_moeda_acr.ReadOnly := False;
    btn_co_moeda_acr.Enabled    := True;
  end
  else
  begin
    if datm_cliente_numerario.qry_receita_imp_.State in [dsInsert,dsEdit] then
       datm_cliente_numerario.qry_receita_imp_CD_MOEDA_ACR.AsString := '';
    dbedt_cd_moeda_acr.Color    := clMenu;
    dbedt_cd_moeda_acr.TabStop  := False;
    dbedt_cd_moeda_acr.ReadOnly := True;
    btn_co_moeda_acr.Enabled    := False;
  end;
end;

procedure Tfrm_cliente_numerario.VerBaseCalcForaRegiao;
begin
  if datm_cliente_numerario.qry_receita_imp_TP_BASE_CALC_FORA_REGIAO.AsString = '5' then
  begin
    dbedt_cd_moeda_fora_regiao.Color    := clWhite;
    dbedt_cd_moeda_fora_regiao.TabStop  := True;
    dbedt_cd_moeda_fora_regiao.ReadOnly := False;
    btn_co_moeda_fora_regiao.Enabled    := True;
  end
  else
  begin
    if datm_cliente_numerario.qry_receita_imp_.State in [dsInsert,dsEdit] then
       datm_cliente_numerario.qry_receita_imp_CD_MOEDA_FORA_REGIAO.AsString := '';
    dbedt_cd_moeda_fora_regiao.Color    := clMenu;
    dbedt_cd_moeda_fora_regiao.TabStop  := False;
    dbedt_cd_moeda_fora_regiao.ReadOnly := True;
    btn_co_moeda_fora_regiao.Enabled    := False;
  end;
end;

procedure Tfrm_cliente_numerario.VerBaseCalcMin;
begin
  if datm_cliente_numerario.qry_receita_imp_TP_BASE_CALC_MIN.AsString = '5' then
  begin
    dbedt_cd_moeda_min.Color    := clWhite;
    dbedt_cd_moeda_min.TabStop  := True;
    dbedt_cd_moeda_min.ReadOnly := False;
    btn_co_moeda_min.Enabled    := True;
  end
  else
  begin
    if datm_cliente_numerario.qry_receita_imp_.State in [dsInsert,dsEdit] then
       datm_cliente_numerario.qry_receita_imp_CD_MOEDA_MIN.AsString := '';
    dbedt_cd_moeda_min.Color    := clMenu;
    dbedt_cd_moeda_min.TabStop  := False;
    dbedt_cd_moeda_min.ReadOnly := True;
    btn_co_moeda_min.Enabled    := False;
  end;
end;

procedure Tfrm_cliente_numerario.VerBaseCalcMax;
begin
  if datm_cliente_numerario.qry_receita_imp_TP_BASE_CALC_MAX.AsString = '5' then
  begin
    dbedt_cd_moeda_max.Color    := clWhite;
    dbedt_cd_moeda_max.TabStop  := True;
    dbedt_cd_moeda_max.ReadOnly := False;
    btn_co_moeda_max.Enabled    := True;
  end
  else
  begin
    if datm_cliente_numerario.qry_receita_imp_.State in [dsInsert,dsEdit] then
       datm_cliente_numerario.qry_receita_imp_CD_MOEDA_MAX.AsString := '';
    dbedt_cd_moeda_max.Color    := clMenu;
    dbedt_cd_moeda_max.TabStop  := False;
    dbedt_cd_moeda_max.ReadOnly := True;
    btn_co_moeda_max.Enabled    := False;
  end;
end;

procedure Tfrm_cliente_numerario.dbedt_vl_num_taxaChange(Sender: TObject);
begin
  if lCancelar or lAbertura or lSalvar or lExcluir  then Exit;
  if ( datm_cliente_numerario.qry_receita_imp_.State in [dsInactive] ) then Exit;
  if ( datm_cliente_numerario.qry_receita_imp_.RecordCount > 0 ) or
     ( datm_cliente_numerario.qry_receita_imp_.State in [dsInsert] ) then
  begin
    if pgctrl_cliente_numerario.ActivePage <> ts_receita_imp then Exit;
    if Not ( datm_cliente_numerario.qry_receita_imp_.State in [dsInsert] ) then
       datm_cliente_numerario.qry_receita_imp_.Edit;
    Btn_Mi( False, True, True, False );
  end;
end;

procedure Tfrm_cliente_numerario.dbedt_vl_num_taxa2Change(Sender: TObject);
begin
  if lCancelar or lAbertura or lSalvar or lExcluir  then Exit;
  if ( datm_cliente_numerario.qry_receita_exp_.State in [dsInactive] ) then Exit;
  if ( datm_cliente_numerario.qry_receita_exp_.RecordCount > 0 ) or
     ( datm_cliente_numerario.qry_receita_exp_.State in [dsInsert] ) then
  begin
    if pgctrl_cliente_numerario.ActivePage <> ts_receita_exp then Exit;
    if Not ( datm_cliente_numerario.qry_receita_exp_.State in [dsInsert] ) then
       datm_cliente_numerario.qry_receita_exp_.Edit;
    Btn_Mi( False, True, True, False );
  end;
end;

procedure Tfrm_cliente_numerario.dbedt_vl_den_taxa2Exit(Sender: TObject);
var
  nNumTaxa2: Integer;
begin
  if datm_cliente_numerario.qry_receita_exp_.State in [dsInactive] then Exit;
  if Not ( datm_cliente_numerario.qry_receita_exp_.State in [dsInsert] )
     and ( st_modificar ) then datm_cliente_numerario.qry_receita_exp_.Edit
  else
  if Not ( datm_cliente_numerario.qry_receita_exp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_taxa2.Text, nNumTaxa2, Code);
    if ( dbedt_vl_den_taxa2.Text = '' ) or ( nNumTaxa2 <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_cliente_numerario.ActivePage := ts_receita_exp;
      dbedt_vl_num_taxa2.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_cliente_numerario.dbedt_vl_den_min2Exit(Sender: TObject);
var
  nNumMin2 : Integer;
begin
  if datm_cliente_numerario.qry_receita_exp_.State in [dsInactive] then Exit;
  if Not ( datm_cliente_numerario.qry_receita_exp_.State in [dsInsert] )
     and ( st_modificar ) then datm_cliente_numerario.qry_receita_exp_.Edit
  else
  if Not ( datm_cliente_numerario.qry_receita_exp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_min2.Text, nNumMin2, Code);
    if ( dbedt_vl_den_min2.Text = '' ) or ( nNumMin2 <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_cliente_numerario.ActivePage := ts_receita_exp;
      dbedt_vl_num_min2.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_cliente_numerario.dbedt_vl_den_max2Exit(Sender: TObject);
var
  nNumMax2 : Integer;
begin
  if datm_cliente_numerario.qry_receita_exp_.State in [dsInactive] then Exit;
  if Not ( datm_cliente_numerario.qry_receita_exp_.State in [dsInsert] )
     and ( st_modificar ) then datm_cliente_numerario.qry_receita_exp_.Edit
  else
  if Not ( datm_cliente_numerario.qry_receita_exp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_max2.Text, nNumMax2, Code);
    if ( dbedt_vl_den_max2.Text = '' ) or ( nNumMax2 <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_cliente_numerario.ActivePage := ts_receita_exp;
      dbedt_vl_num_max2.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_cliente_numerario.dbedt_calc_taxa2Change(Sender: TObject);
begin
  if datm_cliente_numerario.qry_receita_exp_Calc_Taxa2.AsFloat > 0 then
  begin
    dblckbox_base_calc_taxa2.Enabled := True;
    dblckbox_base_calc_taxa2.TabStop := True;
  end
  else
  begin
    if datm_cliente_numerario.qry_receita_exp_.State in [dsInsert,dsEdit] then
       datm_cliente_numerario.qry_receita_exp_TP_BASE_CALC_TAXA.AsString := '0';
    dblckbox_base_calc_taxa2.Enabled := False;
    dblckbox_base_calc_taxa2.TabStop := False;
  end;
  VerBaseCalcTaxa2;
end;

procedure Tfrm_cliente_numerario.dbedt_calc_min2Change(Sender: TObject);
begin
  if datm_cliente_numerario.qry_receita_exp_Calc_Min2.AsFloat > 0 then
  begin
    dblckbox_base_calc_min2.Enabled := True;
    dblckbox_base_calc_min2.TabStop := True;
  end
  else
  begin
    if datm_cliente_numerario.qry_receita_exp_.State in [dsInsert,dsEdit] then
       datm_cliente_numerario.qry_receita_exp_TP_BASE_CALC_MIN.AsString := '0';
    dblckbox_base_calc_min2.Enabled := False;
    dblckbox_base_calc_min2.TabStop := False;
  end;
  VerBaseCalcMin2;
end;

procedure Tfrm_cliente_numerario.dbedt_calc_max2Change(Sender: TObject);
begin
  if datm_cliente_numerario.qry_receita_exp_Calc_Max2.AsFloat > 0 then
  begin
    dblckbox_base_calc_max2.Enabled := True;
    dblckbox_base_calc_max2.TabStop := True;
  end
  else
  begin
    if datm_cliente_numerario.qry_receita_exp_.State in [dsInsert,dsEdit] then
       datm_cliente_numerario.qry_receita_exp_TP_BASE_CALC_MAX.AsString := '0';
    dblckbox_base_calc_max2.Enabled := False;
    dblckbox_base_calc_max2.TabStop := False;
  end;
  VerBaseCalcMax2;
end;

procedure Tfrm_cliente_numerario.VerBaseCalcTaxa2;
begin
  if datm_cliente_numerario.qry_receita_exp_TP_BASE_CALC_TAXA.AsString = '5' then
  begin
    dbedt_cd_moeda_taxa2.Color    := clWhite;
    dbedt_cd_moeda_taxa2.TabStop  := True;
    dbedt_cd_moeda_taxa2.ReadOnly := False;
    btn_co_moeda_taxa2.Enabled    := True;
  end
  else
  begin
    if datm_cliente_numerario.qry_receita_exp_.State in [dsInsert,dsEdit] then
       datm_cliente_numerario.qry_receita_exp_CD_MOEDA_TAXA.AsString := '';
    dbedt_cd_moeda_taxa2.Color    := clMenu;
    dbedt_cd_moeda_taxa2.TabStop  := False;
    dbedt_cd_moeda_taxa2.ReadOnly := True;
    btn_co_moeda_taxa2.Enabled    := False;
  end;
end;

procedure Tfrm_cliente_numerario.VerBaseCalcMin2;
begin
  if datm_cliente_numerario.qry_receita_exp_TP_BASE_CALC_MIN.AsString = '5' then
  begin
    dbedt_cd_moeda_min2.Color    := clWhite;
    dbedt_cd_moeda_min2.TabStop  := True;
    dbedt_cd_moeda_min2.ReadOnly := False;
    btn_co_moeda_min2.Enabled    := True;
  end
  else
  begin
    if datm_cliente_numerario.qry_receita_exp_.State in [dsInsert,dsEdit] then
       datm_cliente_numerario.qry_receita_exp_CD_MOEDA_MIN.AsString := '';
    dbedt_cd_moeda_min2.Color    := clMenu;
    dbedt_cd_moeda_min2.TabStop  := False;
    dbedt_cd_moeda_min2.ReadOnly := True;
    btn_co_moeda_min2.Enabled    := False;
  end;
end;

procedure Tfrm_cliente_numerario.VerBaseCalcMax2;
begin
  if datm_cliente_numerario.qry_receita_exp_TP_BASE_CALC_MAX.AsString = '5' then
  begin
    dbedt_cd_moeda_max2.Color    := clWhite;
    dbedt_cd_moeda_max2.TabStop  := True;
    dbedt_cd_moeda_max2.ReadOnly := False;
    btn_co_moeda_max2.Enabled    := True;
  end
  else
  begin
    if datm_cliente_numerario.qry_receita_exp_.State in [dsInsert,dsEdit] then
       datm_cliente_numerario.qry_receita_exp_CD_MOEDA_MAX.AsString := '';
    dbedt_cd_moeda_max2.Color    := clMenu;
    dbedt_cd_moeda_max2.TabStop  := False;
    dbedt_cd_moeda_max2.ReadOnly := True;
    btn_co_moeda_max2.Enabled    := False;
  end;
end;

procedure Tfrm_cliente_numerario.dblckbox_base_calc_taxa2Click(Sender: TObject);
begin
  dbedt_vl_num_taxa2Change(nil);
  VerBaseCalcTaxa2;
end;

procedure Tfrm_cliente_numerario.dblckbox_base_calc_min2Click(Sender: TObject);
begin
  dbedt_vl_num_taxa2Change(nil);
  VerBaseCalcMin2;
end;

procedure Tfrm_cliente_numerario.dblckbox_base_calc_max2Click(Sender: TObject);
begin
  dbedt_vl_num_taxa2Change(nil);
  VerBaseCalcMax2;
end;

procedure Tfrm_cliente_numerario.dbedt_cd_moeda_taxa2Exit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente_numerario.dbedt_cd_moeda_min2Exit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente_numerario.dbedt_cd_moeda_max2Exit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente_numerario.btn_co_moeda_taxa2Click(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_cliente_numerario.qry_receita_exp_CD_MOEDA_TAXA;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_numerario.qry_receita_exp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_numerario.qry_receita_exp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_numerario do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_taxa2Exit(nil);
end;

procedure Tfrm_cliente_numerario.btn_co_moeda_min2Click(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_cliente_numerario.qry_receita_exp_CD_MOEDA_MIN;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_numerario.qry_receita_exp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_numerario.qry_receita_exp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_numerario do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_min2Exit(nil);
end;

procedure Tfrm_cliente_numerario.btn_co_moeda_max2Click(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_cliente_numerario.qry_receita_exp_CD_MOEDA_MAX;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_numerario.qry_receita_exp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_numerario.qry_receita_exp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_numerario do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_max2Exit(nil);
end;

procedure Tfrm_cliente_numerario.btn_faixasClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Application.CreateForm(Tfrm_faixas, frm_faixas );
  frm_faixas.str_cliente := datm_cliente_numerario.qry_cliente_numerario_CD_CLIENTE.AsString;
  frm_faixas.str_unid    := datm_cliente_numerario.qry_cliente_numerario_CD_UNID_NEG.AsString;
  frm_faixas.str_produto := datm_cliente_numerario.qry_cliente_numerario_CD_PRODUTO.AsString;
  frm_faixas.str_servico := datm_cliente_numerario.qry_cliente_numerario_CD_SERVICO.AsString;
  frm_faixas.str_item    := datm_cliente_numerario.qry_cliente_numerario_CD_ITEM.AsString;
  frm_faixas.ShowModal;
end;

procedure Tfrm_cliente_numerario.dblckbox_tp_faixaClick(Sender: TObject);
begin
  dbedt_vl_num_taxa2Change(nil);
  if datm_cliente_numerario.qry_receita_exp_TP_FAIXA.AsString = '0' then {Sem faixa}
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

function Tfrm_cliente_numerario.VerAlt : Boolean;
begin
  VerAlt := True;

  if ( ( datm_cliente_numerario.qry_cliente_numerario_.State in [dsEdit] ) and st_modificar ) or
     ( datm_cliente_numerario.qry_cliente_numerario_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Clientes X Numerário foi alterado.' + #13#10 +
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

  if ( ( datm_cliente_numerario.qry_receita_imp_.State in [dsEdit] ) and st_modificar ) or
     ( datm_cliente_numerario.qry_receita_imp_.State in [dsInsert] ) then
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

  if ( ( datm_cliente_numerario.qry_receita_exp_.State in [dsEdit] ) and st_modificar ) or
     ( datm_cliente_numerario.qry_receita_exp_.State in [dsInsert] ) then
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

procedure Tfrm_cliente_numerario.pgctrl_cliente_numerarioChange(Sender: TObject);
begin
  if pgctrl_cliente_numerario.ActivePage <> ts_receita_imp then
     datm_cliente_numerario.qry_receita_imp_.Cancel;

  if (pgctrl_cliente_numerario.ActivePage = ts_lista) or
     (pgctrl_cliente_numerario.ActivePage = ts_dados_basicos) then
     dbnvg.DataSource := datm_cliente_numerario.ds_cliente_numerario;

  if (pgctrl_cliente_numerario.ActivePage = ts_receita_imp) then
     dbnvg.DataSource := datm_cliente_numerario.ds_receita_imp;

  if (pgctrl_cliente_numerario.ActivePage = ts_receita_exp) then
     dbnvg.DataSource := datm_cliente_numerario.ds_receita_exp;

  if (pgctrl_cliente_numerario.ActivePage = ts_lista ) then
  begin
    dbnvg.Enabled     := True;
    edt_chave.Enabled := True;
    cmb_ordem.Enabled  := True;
  end
  else
  begin
    dbnvg.Enabled     := False;
    edt_chave.Enabled := False;
    cmb_ordem.Enabled  := False;
  end;

  if (pgctrl_cliente_numerario.ActivePage = ts_dados_basicos ) then
  begin
    if datm_cliente_numerario.qry_cliente_numerario_LookTabelaCalculo.AsString = 'I' then
    begin
      ts_receita_imp.TabVisible := True;
      ts_receita_exp.TabVisible := False;
    end
    else
    if datm_cliente_numerario.qry_cliente_numerario_LookTabelaCalculo.AsString = 'E' then
    begin
      ts_receita_imp.TabVisible := False;
      ts_receita_exp.TabVisible := True;
    end;
  end;
end;

procedure Tfrm_cliente_numerario.pgctrl_cliente_numerarioChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_cliente_numerario.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_cliente_numerario.ReceitaImp;
begin
  with datm_cliente_numerario do
  begin
    qry_receita_imp_.Close;
    qry_receita_imp_.Prepare;
    qry_receita_imp_.Open;

    ts_receita_imp.TabVisible := True;
    ts_receita_exp.TabVisible := False;
    pgctrl_cliente_numerario.ActivePage := ts_receita_imp;

    if qry_receita_imp_.RecordCount = 0 then
    begin
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(sp_receitas);
        sp_receitas.ParamByName('@cd_cliente').AsString  := str_cliente;
        sp_receitas.ParamByName('@cd_unid_neg').AsString := str_unid;
        sp_receitas.ParamByName('@cd_produto').AsString  := str_produto;
        sp_receitas.ParamByName('@cd_servico').AsString  := str_servico;
        sp_receitas.ParamByName('@cd_item').AsString     := qry_cliente_numerario_CD_ITEM.AsString;
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

      dbedt_cd_moeda_acr.Color            := clMenu;
      dbedt_cd_moeda_acr.TabStop          := False;
      dbedt_cd_moeda_acr.ReadOnly         := True;
      btn_co_moeda_acr.Enabled            := False;

      dbedt_cd_moeda_fora_regiao.Color    := clMenu;
      dbedt_cd_moeda_fora_regiao.TabStop  := False;
      dbedt_cd_moeda_fora_regiao.ReadOnly := True;
      btn_co_moeda_fora_regiao.Enabled    := False;

      dbedt_cd_moeda_min.Color            := clMenu;
      dbedt_cd_moeda_min.TabStop          := False;
      dbedt_cd_moeda_min.ReadOnly         := True;
      btn_co_moeda_min.Enabled            := False;

      dbedt_cd_moeda_max.Color            := clMenu;
      dbedt_cd_moeda_max.TabStop          := False;
      dbedt_cd_moeda_max.ReadOnly         := True;
      btn_co_moeda_max.Enabled            := False;
    end;
  end;
end;

procedure Tfrm_cliente_numerario.ReceitaExp;
begin
  with datm_cliente_numerario do
  begin
    qry_receita_exp_.Close;
    qry_receita_exp_.Prepare;
    qry_receita_exp_.Open;

    ts_receita_imp.TabVisible := False;
    ts_receita_exp.TabVisible := True;
    pgctrl_cliente_numerario.ActivePage := ts_receita_exp;

    if qry_receita_exp_.RecordCount = 0 then
    begin
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(sp_receitas);
        sp_receitas.ParamByName('@cd_cliente').AsString  := str_cliente;
        sp_receitas.ParamByName('@cd_unid_neg').AsString := str_unid;
        sp_receitas.ParamByName('@cd_produto').AsString  := str_produto;
        sp_receitas.ParamByName('@cd_servico').AsString  := str_servico;
        sp_receitas.ParamByName('@cd_item').AsString     := qry_cliente_numerario_CD_ITEM.AsString;
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

      qry_receita_exp_TP_FAIXA_VALOR.AsString    := '0';
      qry_receita_exp_PC_REDUC_RE_CANC.AsFloat   := 0;

      qry_receita_exp_VL_DEN_TAXA.AsFloat        := 1;
      qry_receita_exp_VL_DEN_MIN.AsFloat         := 1;
      qry_receita_exp_VL_DEN_MAX.AsFloat         := 1;

      qry_receita_exp_TP_BASE_CALC_TAXA.AsString := '0';
      qry_receita_exp_TP_BASE_CALC_MIN.AsString  := '0';
      qry_receita_exp_TP_BASE_CALC_MAX.AsString  := '0';
      qry_receita_exp_IN_ATIVO.AsString          := '1';

      dbedt_cd_moeda_taxa2.Color                 := clMenu;
      dbedt_cd_moeda_taxa2.TabStop               := False;
      dbedt_cd_moeda_taxa2.ReadOnly              := True;
      btn_co_moeda_taxa2.Enabled                 := False;

      dbedt_cd_moeda_min2.Color                  := clMenu;
      dbedt_cd_moeda_min2.TabStop                := False;
      dbedt_cd_moeda_min2.ReadOnly               := True;
      btn_co_moeda_min2.Enabled                  := False;

      dbedt_cd_moeda_max2.Color                  := clMenu;
      dbedt_cd_moeda_max2.TabStop                := False;
      dbedt_cd_moeda_max2.ReadOnly               := True;
      btn_co_moeda_max2.Enabled                  := False;
    end;
  end;
end;

procedure Tfrm_cliente_numerario.dbedt_nr_solicitacaoExit(Sender: TObject);
begin
  if datm_cliente_numerario.qry_cliente_numerario_.State in [dsEdit, dsInsert] then
     ValidCodigo( dbedt_nr_solicitacao );
end;

procedure Tfrm_cliente_numerario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_cliente_numerario.dbedt_cd_itemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_item              then btn_co_itemClick(nil);
    if Sender = dbedt_tp_calculo           then btn_tp_calculoClick(nil);
    if Sender = dbedt_cd_moeda_taxa        then btn_co_moeda_taxaClick(nil);
    if Sender = dbedt_cd_moeda_acr         then btn_co_moeda_acrClick(nil);
    if Sender = dbedt_cd_moeda_fora_regiao then btn_co_moeda_fora_regiaoClick(nil);
    if Sender = dbedt_cd_moeda_min         then btn_co_moeda_minClick(nil);
    if Sender = dbedt_cd_moeda_max         then btn_co_moeda_maxClick(nil);
    if Sender = dbedt_cd_moeda_taxa2       then btn_co_moeda_taxa2Click(nil);
    if Sender = dbedt_cd_moeda_min2        then btn_co_moeda_min2Click(nil);
    if Sender = dbedt_cd_moeda_max2        then btn_co_moeda_max2Click(nil);
  end;
end;

procedure Tfrm_cliente_numerario.CodExits;
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_cliente_numerario.dbedt_cd_bancoExit(Sender: TObject);
begin
  CodExits;
end;


end.
