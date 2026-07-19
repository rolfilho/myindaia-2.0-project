unit PGSM109;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBCtrls, StdCtrls, Menus, Mask, Grids, DBGrids, ComCtrls, Buttons,
  ExtCtrls, Funcoes;

type
  Tfrm_faixas = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pgctrl_receita_exp_faixa: TPageControl;
    ts_lista: TTabSheet;
    lbl_cliente: TLabel;
    lbl_unid_neg: TLabel;
    lbl_produto: TLabel;
    lbl_servico: TLabel;
    dbg_cadastro: TDBGrid;
    dbedt_cd_cliente: TDBEdit;
    dbedt_nm_cliente: TDBEdit;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    dbedt_cd_produto: TDBEdit;
    dbedt_nm_produto: TDBEdit;
    dbedt_cd_servico: TDBEdit;
    dbedt_nm_servico: TDBEdit;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_cliente2: TLabel;
    lbl_unid_neg2: TLabel;
    lbl_produto2: TLabel;
    lbl_servico2: TLabel;
    lbl_fim_faixa: TLabel;
    lbl_inicio_faixa: TLabel;
    dbedt_cd_cliente2: TDBEdit;
    dbedt_nm_cliente2: TDBEdit;
    dbedt_cd_unid_neg2: TDBEdit;
    dbedt_nm_unid_neg2: TDBEdit;
    dbedt_cd_produto2: TDBEdit;
    dbedt_nm_produto2: TDBEdit;
    dbedt_cd_servico2: TDBEdit;
    dbedt_nm_servico2: TDBEdit;
    dbedt_fim_faixa: TDBEdit;
    dbedt_inicio_faixa: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    lbl_item: TLabel;
    dbedt_cd_item: TDBEdit;
    dbedt_nm_item: TDBEdit;
    lbl_item2: TLabel;
    dbedt_cd_item2: TDBEdit;
    dbedt_nm_item2: TDBEdit;
    lbl_nr_faixa: TLabel;
    dbedt_nr_faixa: TDBEdit;
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
    dblkpcbox_por_base_calc: TDBLookupComboBox;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure dbnvgBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure dbedt_vl_num_taxaChange(Sender: TObject);
    procedure dbedt_calc_taxaChange(Sender: TObject);
    procedure btn_co_moeda_taxaClick(Sender: TObject);
    procedure VerBaseCalcTaxa;
    procedure dbedt_cd_moeda_taxaExit(Sender: TObject);
    procedure dblckbox_base_calc_taxaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_moeda_taxaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    a_str_indices : Array[0..1] Of String[60];
    st_modificar, st_incluir, st_excluir : Boolean;
    function Grava    : Boolean;
    { Private declarations }
  public
    nCodigo, Code : Integer;
    str_cliente, str_unid, str_produto, str_servico, str_item : String;
  end;

var
  frm_faixas: Tfrm_faixas;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGSM048, PGSM059, PGSM129;

procedure Tfrm_faixas.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

 { Inicializa o Data Module para Receitas Exportação Faixas}
  Application.CreateForm( Tdatm_faixas, datm_faixas );

  with datm_faixas do
  begin
    ds_receita_exp_faixa.AutoEdit := st_modificar;

    tbl_base_calculo_.Open;

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

    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;

    qry_receita_exp_faixa_.Close;
    qry_receita_exp_faixa_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
    qry_receita_exp_faixa_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_receita_exp_faixa_.ParamByName('CD_PRODUTO').AsString  := str_produto;
    qry_receita_exp_faixa_.ParamByName('CD_SERVICO').AsString  := str_servico;
    qry_receita_exp_faixa_.ParamByName('CD_ITEM').AsString  := str_item;
    qry_receita_exp_faixa_.Prepare;
    qry_receita_exp_faixa_.Open;

  end;

  a_str_indices[0] := 'NR_FAIXA';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Nº Faixa');
    ItemIndex := 0;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;
end;

procedure Tfrm_faixas.FormShow(Sender: TObject);
begin
  with datm_faixas do
  begin
    qry_receita_exp_faixa_.Close;
    qry_receita_exp_faixa_.Prepare;
    qry_receita_exp_faixa_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
    qry_receita_exp_faixa_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_receita_exp_faixa_.ParamByName('CD_PRODUTO').AsString  := str_produto;
    qry_receita_exp_faixa_.ParamByName('CD_SERVICO').AsString  := str_servico;
    qry_receita_exp_faixa_.ParamByName('CD_ITEM').AsString  := str_item;
    qry_receita_exp_faixa_.Open;
  end;

  pgctrl_receita_exp_faixa.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_faixas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_faixas do
  begin
    tbl_base_calculo_.Open;
    qry_empresa_nac_.Close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_servico_.Close;
    qry_item_.Close;
    qry_moeda_.Close;
    qry_receita_exp_faixa_.Close;
//    Destroy;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_faixas.btn_incluirClick(Sender: TObject);
var
  Ultimo : Integer;
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  with datm_faixas do
  begin
    {Verifica se existem faixas. Se existir desabilita faixa inicia e faixa final}
    qry_receita_exp_faixa_.Close;
    qry_receita_exp_faixa_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
    qry_receita_exp_faixa_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_receita_exp_faixa_.ParamByName('CD_PRODUTO').AsString  := str_produto;
    qry_receita_exp_faixa_.ParamByName('CD_SERVICO').AsString  := str_servico;
    qry_receita_exp_faixa_.ParamByName('CD_ITEM').AsString  := str_item;
    qry_receita_exp_faixa_.Prepare;
    qry_receita_exp_faixa_.Open;

    qry_receita_exp_faixa_.DisableControls;
    qry_receita_exp_faixa_.Cancel;
    qry_receita_exp_faixa_.Append;
    qry_receita_exp_faixa_.EnableControls;

    qry_receita_exp_faixa_CD_CLIENTE.AsString  := str_cliente;
    qry_receita_exp_faixa_CD_UNID_NEG.AsString := str_unid;
    qry_receita_exp_faixa_CD_PRODUTO.AsString  := str_produto;
    qry_receita_exp_faixa_CD_SERVICO.AsString  := str_servico;
    qry_receita_exp_faixa_CD_ITEM.AsString     := str_item;
    qry_receita_exp_faixa_VL_DEN_FAIXA.AsFloat := 1;
    qry_receita_exp_faixa_TP_BASE_CALC_FAIXA.AsString := '0';
    qry_receita_exp_faixa_TP_POR_BASE_CALC.AsString := '0';

    qry_ult_faixa_.Close;
    qry_ult_faixa_.ParamByName('CD_CLIENTE').AsString := str_cliente;
    qry_ult_faixa_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_ult_faixa_.ParamByName('CD_PRODUTO').AsString := str_produto;
    qry_ult_faixa_.ParamByName('CD_SERVICO').AsString := str_servico;
    qry_ult_faixa_.ParamByName('CD_ITEM').AsString := str_item;
    qry_ult_faixa_.Open;
    Val( qry_ult_faixa_ULTIMO.AsString, nCodigo, Code);
    Ultimo := nCodigo;
    Inc(nCodigo);
    qry_receita_exp_faixa_NR_FAIXA.AsString := StrZero( nCodigo, qry_ult_faixa_ULTIMO.Size );
    qry_ult_faixa_.Close;

    if nCodigo = 1 then
    begin
      qry_receita_exp_faixa_VL_INICIO_FAIXA.AsFloat  := 0;
    end
    else
    begin
      qry_fim_faixa_.Close;
      qry_fim_faixa_.ParamByName('NR_ULT_FAIXA').AsString := StrZero( Ultimo, 2 );
      qry_fim_faixa_.ParamByName('CD_CLIENTE').AsString := str_cliente;
      qry_fim_faixa_.ParamByName('CD_UNID_NEG').AsString := str_unid;
      qry_fim_faixa_.ParamByName('CD_PRODUTO').AsString := str_produto;
      qry_fim_faixa_.ParamByName('CD_SERVICO').AsString := str_servico;
      qry_fim_faixa_.ParamByName('CD_ITEM').AsString := str_item;
      qry_fim_faixa_.Open;
      qry_receita_exp_faixa_VL_INICIO_FAIXA.AsFloat := qry_fim_faixa_VL_FIM_FAIXA.AsFloat;
      qry_fim_faixa_.Close;
    end;

    pgctrl_receita_exp_faixa.ActivePage := ts_dados_basicos;
    dbedt_fim_faixa.SetFocus;
  end;
end;

procedure Tfrm_faixas.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Grava then Exit;
end;

procedure Tfrm_faixas.btn_cancelarClick(Sender: TObject);
begin
  btn_incluir.Enabled  := st_incluir;
  mi_incluir.Enabled   := st_incluir;
  btn_excluir.Enabled  := st_excluir;
  mi_excluir.Enabled   := st_excluir;
  btn_salvar.Enabled   := False;
  mi_salvar.Enabled    := False;
  btn_cancelar.Enabled := False;
  mi_cancelar.Enabled  := False;
  try
    if datm_faixas.qry_receita_exp_faixa_.State in [dsInsert, dsEdit] then
    begin
      datm_faixas.qry_receita_exp_faixa_.Cancel;
      pgctrl_receita_exp_faixa.ActivePage := ts_dados_basicos;
      dbedt_fim_faixa.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
end;

procedure Tfrm_faixas.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Esta Faixa será excluída! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_faixas.qry_receita_exp_faixa_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_faixas.qry_receita_exp_faixa_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  pgctrl_receita_exp_faixa.ActivePage := ts_lista;
end;

procedure Tfrm_faixas.dbnvgBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  datm_faixas.qry_receita_exp_faixa_.Cancel;
end;

procedure Tfrm_faixas.btn_sairClick(Sender: TObject);
begin
  if ( ( datm_faixas.qry_receita_exp_faixa_.State in [dsEdit] ) and st_modificar ) or
     ( datm_faixas.qry_receita_exp_faixa_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Faixas foi alterado.' + #13#10 +
       'Deseja salvar as alterações?', 1) then
    begin
      if Not Grava then Exit;
    end
    else
       btn_cancelarClick(Sender);
  end;
  Close;
end;

procedure Tfrm_faixas.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_faixas.qry_receita_exp_faixa_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

function Tfrm_faixas.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    If ( datm_faixas.qry_receita_exp_faixa_.State in [dsInsert, dsEdit] ) then
    begin
      If ( datm_faixas.qry_receita_exp_faixa_.State in [dsInsert, dsEdit] ) then
      begin
        datm_faixas.qry_receita_exp_faixa_.Post;
      end;

      datm_faixas.qry_receita_exp_faixa_.Close;
      datm_faixas.qry_receita_exp_faixa_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
      datm_faixas.qry_receita_exp_faixa_.ParamByName('CD_UNID_NEG').AsString := str_unid;
      datm_faixas.qry_receita_exp_faixa_.ParamByName('CD_PRODUTO').AsString  := str_produto;
      datm_faixas.qry_receita_exp_faixa_.ParamByName('CD_SERVICO').AsString  := str_servico;
      datm_faixas.qry_receita_exp_faixa_.ParamByName('CD_ITEM').AsString     := str_item;
      datm_faixas.qry_receita_exp_faixa_.Prepare;
      datm_faixas.qry_receita_exp_faixa_.Open;

    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_faixas.qry_receita_exp_faixa_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;
  btn_salvar.Enabled   := False;
  mi_salvar.Enabled    := False;
  btn_Cancelar.Enabled := False;
  mi_Cancelar.Enabled  := False;
end;

procedure Tfrm_faixas.dbedt_vl_num_taxaChange(Sender: TObject);
begin
  If ( datm_faixas.qry_receita_exp_faixa_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_incluir.Enabled  := False;
    btn_excluir.Enabled  := False;
    mi_incluir.Enabled   := False;
    mi_excluir.Enabled   := False;
    btn_Salvar.Enabled   := True;
    mi_Salvar.Enabled    := True;
    btn_Cancelar.Enabled := True;
    mi_Cancelar.Enabled  := True;
  end;
end;

procedure Tfrm_faixas.dbedt_calc_taxaChange(Sender: TObject);
begin
  if datm_faixas.qry_receita_exp_faixa_Calc_Taxa.AsFloat > 0 then
  begin
    dblckbox_base_calc_taxa.Enabled := True;
    dblckbox_base_calc_taxa.TabStop := True;
  end
  else
  begin
    if datm_faixas.qry_receita_exp_faixa_.State in [dsInsert,dsEdit] then
    begin
       datm_faixas.qry_receita_exp_faixa_TP_BASE_CALC_FAIXA.AsString := '0';
    end;
    dblckbox_base_calc_taxa.Enabled := False;
    dblckbox_base_calc_taxa.TabStop := False;
  end;
  VerBaseCalcTaxa;
end;

procedure Tfrm_faixas.VerBaseCalcTaxa;
begin
  if datm_faixas.qry_receita_exp_faixa_TP_BASE_CALC_FAIXA.AsString = '5' then
  begin
    dbedt_cd_moeda_taxa.Color    := clWhite;
    dbedt_cd_moeda_taxa.TabStop  := True;
    dbedt_cd_moeda_taxa.ReadOnly := False;
    btn_co_moeda_taxa.Enabled    := True;
  end
  else
  begin
    if datm_faixas.qry_receita_exp_faixa_.State in [dsInsert,dsEdit] then
    begin
       datm_faixas.qry_receita_exp_faixa_CD_MOEDA_FAIXA.AsString := '';
    end;
    dbedt_cd_moeda_taxa.Color    := clMenu;
    dbedt_cd_moeda_taxa.TabStop  := False;
    dbedt_cd_moeda_taxa.ReadOnly := True;
    btn_co_moeda_taxa.Enabled    := False;
  end;
end;


procedure Tfrm_faixas.btn_co_moeda_taxaClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_faixas.qry_receita_exp_faixa_CD_MOEDA_FAIXA;
  With frm_moeda Do Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_faixas.qry_receita_exp_faixa_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_faixas.qry_receita_exp_faixa_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_faixas do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_taxaExit(Sender);
end;

procedure Tfrm_faixas.dbedt_cd_moeda_taxaExit(Sender: TObject);
begin
  If datm_faixas.qry_receita_exp_faixa_.State in [dsInactive] then Exit;
  If Not ( datm_faixas.qry_receita_exp_faixa_.State in [dsInsert] )
     and ( st_modificar ) then datm_faixas.qry_receita_exp_faixa_.Edit
  else
  If Not ( datm_faixas.qry_receita_exp_faixa_.State in [dsEdit, dsInsert] ) then
  begin
    if dbedt_cd_moeda_taxa.Text <> '' Then
    begin
      if dbedt_nm_moeda_taxa.Text = '' Then
      begin
        BoxMensagem('Código da Moeda/Índice da Taxa inválido!',2);
        pgctrl_receita_exp_faixa.ActivePage := ts_dados_basicos;
        dbedt_cd_moeda_taxa.SetFocus;
      end;
    end;
    Exit;
  end;
  ValidCodigo( dbedt_cd_moeda_taxa );
  if dbedt_cd_moeda_taxa.Text <> '' Then
  begin
    if dbedt_nm_moeda_taxa.Text = '' Then
    begin
      BoxMensagem('Código da Moeda/Índice da Taxa inválido!',2);
      pgctrl_receita_exp_faixa.ActivePage := ts_dados_basicos;
      dbedt_cd_moeda_taxa.SetFocus;
    end;
  end;
end;

procedure Tfrm_faixas.dblckbox_base_calc_taxaClick(Sender: TObject);
begin
  dbedt_vl_num_taxaChange(Sender);
  VerBaseCalcTaxa;
end;

procedure Tfrm_faixas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_faixas.dbedt_cd_moeda_taxaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
    begin
      if Sender = dbedt_cd_moeda_taxa then btn_co_moeda_taxaClick(nil);
    end;
end;

end.
