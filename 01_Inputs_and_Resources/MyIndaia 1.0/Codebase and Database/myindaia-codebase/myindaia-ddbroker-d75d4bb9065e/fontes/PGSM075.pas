(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGSM075.PAS - Cadastro de Cliente X Serviço
DATA: dd/mm/yyyy
Data: 25/09/2001 - AM 0054/01 - Mais de um Banco para Débito de Tributos
*************************************************************************************************)

unit PGSM075;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, Funcoes, ConsOnLineEx;

type
  Tfrm_cliente_servico = class(TForm)
    pgctrl_cliente_servico: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    mi_excluir: TMenuItem;
    pnl_cadastro: TPanel;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    btn_incluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_excluir: TSpeedButton;
    dbnvg: TDBNavigator;
    shp1: TShape;
    pnlBotoes: TPanel;
    btn_numerario: TButton;
    btn_armazenagem: TButton;
    btn_faturamento: TButton;
    btn_fat_compl: TButton;
    btn_itens_por_ton: TButton;
    btn_repres: TButton;
    btn_duplicacao: TButton;
    pnl1: TPanel;
    lbl_Cliente: TLabel;
    lbl_unid_neg: TLabel;
    lbl_produto: TLabel;
    dbedt_cd_cliente: TDBEdit;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_cd_produto: TDBEdit;
    dbedt_nm_produto: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    dbedt_razao_social: TDBEdit;
    pnl2: TPanel;
    lbl_cliente2: TLabel;
    lbl_unid_neg2: TLabel;
    lbl_produto2: TLabel;
    lbl_servico: TLabel;
    btn_co_servico: TSpeedButton;
    dbedt_cd_cliente2: TDBEdit;
    dbedt_nm_cliente2: TDBEdit;
    dbedt_cd_unid_neg2: TDBEdit;
    dbedt_nm_unid_neg2: TDBEdit;
    dbedt_cd_produto2: TDBEdit;
    dbedt_nm_produto2: TDBEdit;
    dbedt_cd_servico: TDBEdit;
    dbedt_nm_servico: TDBEdit;
    pnlFrete: TPanel;
    shp2: TShape;
    Label3: TLabel;
    dbgrdTabFrete: TDBGrid;
    lbl_banco_deb_cc: TLabel;
    btn_co_banco_deb_cc: TSpeedButton;
    lbl_banco_com: TLabel;
    btn_co_banco_com: TSpeedButton;
    lbl_banco_deb_com: TLabel;
    btn_co_banco_deb_com: TSpeedButton;
    gbox_proposta: TGroupBox;
    lbl_pz_proposta: TLabel;
    lbl_dt_captacao: TLabel;
    lbl_dias: TLabel;
    lbl_nr_dps: TLabel;
    Label1: TLabel;
    dbedt_pz_proposta: TDBEdit;
    dbedt_dt_captacao: TDBEdit;
    dbedt_nr_dps: TDBEdit;
    dbedt_dt_autorizacao: TDBEdit;
    dbedt_cd_banco_deb_cc: TDBEdit;
    dbedt_nm_banco_deb_cc: TDBEdit;
    dbedt_cd_banco_com: TDBEdit;
    dbedt_nm_banco_com: TDBEdit;
    dbedt_cd_banco_deb_com: TDBEdit;
    dbedt_nm_banco_deb_com: TDBEdit;
    pnl3: TPanel;
    lbl_in_ativo: TLabel;
    lbl_in_incide_sda: TLabel;
    lbl_prefixo: TLabel;
    Label2: TLabel;
    lbl_cd_tab_sda: TLabel;
    btn_co_tab_sda: TSpeedButton;
    dblkpcbox_ativo: TDBLookupComboBox;
    dblkpcbox_in_incide_sda: TDBLookupComboBox;
    dbedt_cd_prefixo: TDBEdit;
    dblkpcbox_in_cpmf_num: TDBLookupComboBox;
    dbedt_cd_tab_sda: TDBEdit;
    dbedt_nm_tab_sda: TDBEdit;
    dbchk_volumes_mod2: TDBCheckBox;
    dbchk_lanca_solic: TDBCheckBox;
    lbl1: TLabel;
    DBCheckBox2: TDBCheckBox;
    chk_hab_ativa: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure dbedt_cd_servicoChange(Sender: TObject);
    procedure dbedt_cd_servicoExit(Sender: TObject);
    procedure btn_co_servicoClick(Sender: TObject);
    procedure btn_numerarioClick(Sender: TObject);
    procedure btn_faturamentoClick(Sender: TObject);
    procedure pgctrl_cliente_servicoChange(Sender: TObject);
    procedure pgctrl_cliente_servicoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_servicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_duplicacaoClick(Sender: TObject);
    procedure btn_itens_por_tonClick(Sender: TObject);
    procedure dbedt_cd_prefixoExit(Sender: TObject);
    procedure btn_co_banco_deb_ccClick(Sender: TObject);
    procedure btn_co_banco_comClick(Sender: TObject);
    procedure dbedt_cd_banco_deb_ccExit(Sender: TObject);
    procedure dbedt_cd_banco_comExit(Sender: TObject);
    procedure btn_co_banco_deb_comClick(Sender: TObject);
    procedure dbedt_cd_banco_deb_comExit(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_fat_complClick(Sender: TObject);
    procedure btn_represClick(Sender: TObject);
    procedure btn_co_tab_sdaClick(Sender: TObject);
    procedure dbedt_cd_tab_sdaExit(Sender: TObject);
    procedure btn_armazenagemClick(Sender: TObject);
    procedure dbchk_volumes_mod2Click(Sender: TObject);
    procedure dbchk_lanca_solicClick(Sender: TObject);
    procedure dbgrdTabFreteColExit(Sender: TObject);
    procedure dbgrdTabFreteDblClick(Sender: TObject);
    procedure dbgrdTabFreteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdTabFreteEnter(Sender: TObject);
    procedure dbedt_cd_servicoEnter(Sender: TObject);
    procedure chk_hab_ativaClick(Sender: TObject);
  private
    a_str_indices : Array[0..1] Of String[60];
    st_modificar, st_incluir, st_excluir : Boolean;
    vCdServico: string[3];
    vViaTransp: string[2];

    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure AlteraFrete(pTpAlteracao: Byte);
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    str_cliente, str_unid, str_produto, str_tp_tab_sda : String;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
    vAlteracaoFrete: Byte;
  end;

var
  frm_cliente_servico: Tfrm_cliente_servico;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGSM022, PGSM025, PGSM030, PGSM041, PGSM065, PGSM076, PGSM077,
     PGSM071, PGSM027, uClienteArmazem;

procedure Tfrm_cliente_servico.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  // Inicializa o Data Module para Cliente X Serviço
  Application.CreateForm( Tdatm_cliente_servico, datm_cliente_servico );

  with datm_cliente_servico do
  begin
    ds_cliente_servico.AutoEdit := st_modificar;

    tbl_yesno_.Open;

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

    qry_cliente_servico_.Close;
    qry_cliente_servico_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
    qry_cliente_servico_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_cliente_servico_.ParamByName('CD_PRODUTO').AsString  := str_produto;
    qry_cliente_servico_.Prepare;
    qry_cliente_servico_.Open;
    qryClienteServicoFrete.Close;
    qryClienteServicoFrete.Close;

  end;

  a_str_indices[0] := 'CD_SERVICO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código do Serviço');
    ItemIndex := 0;
  end;
  btn_incluir.Enabled := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;
  mi_incluir.Enabled  := st_incluir;
end;

procedure Tfrm_cliente_servico.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pnlbotoes.Color := clMenuBroker;
  shp1.Brush.Color := clPnlClaroBroker;
  with datm_cliente_servico do
  begin
    qry_cliente_servico_.Close;
    qry_cliente_servico_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
    qry_cliente_servico_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_cliente_servico_.ParamByName('CD_PRODUTO').AsString  := str_produto;
    qry_cliente_servico_.Prepare;
    qry_cliente_servico_.Open;
    qryClienteServicoFrete.Close;
    qryClienteServicoFrete.Open;
  end;

  pgctrl_cliente_servico.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;


procedure Tfrm_cliente_servico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_cliente_servico do
    begin
      tbl_yesno_.Close;
      qry_empresa_nac_.Close;
      qry_unid_neg_.Close;
      qry_produto_.Close;
      qry_servico_.Close;
      qry_cliente_servico_.Close;
      qryClienteServicoFrete.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_cliente_servico.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  mi_excluir.Enabled  := False;
  btn_excluir.Enabled := False;

  with datm_cliente_servico do
  begin
    qry_cliente_servico_.DisableControls;
    qry_cliente_servico_.Cancel;
    qry_cliente_servico_.Append;
    qry_cliente_servico_.EnableControls;
    qry_cliente_servico_CD_CLIENTE.AsString  := str_cliente;
    qry_cliente_servico_CD_UNID_NEG.AsString := str_unid;
    qry_cliente_servico_CD_PRODUTO.AsString  := str_produto;
    qry_cliente_servico_IN_INCIDE_SDA.AsString := '1';
    qry_cliente_servico_IN_ATIVO.AsString := '1';
    qry_cliente_servico_IN_REL_VOL_MOD2.AsString := '0';
    qry_cliente_servico_IN_LANCA_SOLIC.AsString := '0';
  end;
  pgctrl_cliente_servico.ActivePage := ts_dados_basicos;
  dbedt_cd_servico.SetFocus;
end;


procedure Tfrm_cliente_servico.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;

  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_cliente_servico.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
  vAlteracaoFrete := 0;
end;

procedure Tfrm_cliente_servico.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_cliente_servico.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_cliente_servico.qry_cliente_servico_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_cliente_servico.dbedt_cd_servicoChange(Sender: TObject);
begin
  If ( datm_cliente_servico.qry_cliente_servico_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;


function Tfrm_cliente_servico.Consiste : Boolean;
begin
  Consiste := True;

  if datm_cliente_servico.qry_cliente_servico_.State = dsEdit then
  begin
    if vCdServico = dbedt_cd_servico.Text then
      vAlteracaoFrete := 0 //nenhuma alteração
    else
      if (vViaTransp = ConsultaLookUp('VW_SERVICO_GERAL', 'CD_SERVICO', dbedt_cd_servico.Text, 'CD_VIA_TRANSPORTE')) then
        vAlteracaoFrete := 1 //edita os fretes para serviço
      else
        vAlteracaoFrete := 2 //exclui os fretes no serviço
  end
  else
    vAlteracaoFrete := 0; //nenhuma alteração

  if dbedt_cd_servico.Text = '' then
  begin
    BoxMensagem('Campo Serviço deve ser preenchido!', 2);
    pgctrl_cliente_servico.ActivePage := ts_dados_basicos;
    dbedt_cd_servico.SetFocus;
    Consiste := False;
    Exit;
  end;

  if Not ( datm_cliente_servico.qry_cliente_servico_.State in [dsEdit, dsInsert] ) then Exit;
  if dbedt_cd_servico.Modified then
    if (not datm_cliente_servico.ServicoNovo) or (dbedt_nm_servico.Text = '') then
      ValidCodigo( dbedt_cd_servico );
  if dbedt_cd_servico.Text <> '' Then
  begin
    if dbedt_nm_servico.Text = '' Then
    begin
      BoxMensagem('Código do Serviço inválido!',2);
      pgctrl_cliente_servico.ActivePage := ts_dados_basicos;
      dbedt_cd_servico.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  if Length( dbedt_cd_prefixo.Text ) = 1 then
  begin
    BoxMensagem('Prefixo Inválido!', 2);
    pgctrl_cliente_servico.ActivePage := ts_dados_basicos;
    dbedt_cd_prefixo.SetFocus;
    Consiste := False;
    Exit;
  end;

  // Banco para Debito em Conta
  if ( datm_cliente_servico.qry_cliente_servico_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_banco_deb_cc );
    if dbedt_cd_banco_deb_cc.Text <> '' then
    begin
      if dbedt_nm_banco_deb_cc.Text = '' then
      begin
        BoxMensagem('Código do Banco para Débito em Conta inválido!',2);
        pgctrl_cliente_servico.ActivePage := ts_dados_basicos;
        dbedt_cd_banco_deb_cc.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  // Banco da Comissária
  if ( datm_cliente_servico.qry_cliente_servico_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_banco_com );
    if dbedt_cd_banco_com.Text <> '' then
    begin
      if dbedt_nm_banco_com.Text = '' then
      begin
        BoxMensagem('Código do Banco da Comissária inválido!',2);
        pgctrl_cliente_servico.ActivePage := ts_dados_basicos;
        dbedt_cd_banco_com.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  // Banco para Débito em Conta da Comissária
  if ( datm_cliente_servico.qry_cliente_servico_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_banco_deb_com );
    if dbedt_cd_banco_deb_com.Text <> '' then
    begin
      if dbedt_nm_banco_deb_com.Text = '' then
      begin
        BoxMensagem('Código do Banco para Débito em Conta da Comissária inválido!', 2);
        pgctrl_cliente_servico.ActivePage := ts_dados_basicos;
        dbedt_cd_banco_deb_com.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  // Tabela de SDA
  if ( datm_cliente_servico.qry_cliente_servico_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_tab_sda );
    if dbedt_cd_tab_sda.Text <> '' then
    begin
      if dbedt_cd_tab_sda.Text = '' then
      begin
        BoxMensagem('Código da Tabela de SDA Inválido!', 2);
        pgctrl_cliente_servico.ActivePage := ts_dados_basicos;
        dbedt_cd_tab_sda.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;
end;


function Tfrm_cliente_servico.Grava : Boolean;
var cd_servico: String;
begin
  with datm_cliente_servico do
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( qry_cliente_servico_.State in [dsInsert, dsEdit] ) then
      begin
        cd_servico := qry_cliente_servico_CD_SERVICO.AsString;
        qry_cliente_servico_.Post;
        qry_cliente_servico_.ApplyUpdates;
        AlteraFrete(vAlteracaoFrete);
        qry_cliente_servico_.Close;
        qry_cliente_servico_.Prepare;
        qry_cliente_servico_.Open;
        qry_cliente_servico_.Locate('CD_CLIENTE;CD_UNID_NEG;CD_PRODUTO;CD_SERVICO', VarArrayOf ([str_cliente, str_unid, str_produto, cd_servico]), [loCaseInsensitive] );
        qryClienteServicoFrete.Close;
        qryClienteServicoFrete.Open;
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        datm_cliente_servico.qry_cliente_servico_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_cliente_servico.dbedt_cd_servicoExit(Sender: TObject);
begin

  Consiste;
end;

procedure Tfrm_cliente_servico.btn_co_servicoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2303';
  Application.CreateForm(Tfrm_servico, frm_servico);
  frm_servico.Cons_OnLine := datm_cliente_servico.qry_cliente_servico_CD_SERVICO;
  with frm_servico Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_cliente_servico.qry_cliente_servico_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_servico.qry_cliente_servico_.Edit;
    chkServicoNovo.Checked := True;
    chkServicoNovoClick(chkServicoNovo);
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_servico do
  begin
    qry_servico_.Close;
    qry_servico_.Prepare;
    qry_servico_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_servicoExit(Sender);
end;

function Tfrm_cliente_servico.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_cliente_servico.qry_cliente_servico_.State in [dsEdit] ) and st_modificar ) or
     ( datm_cliente_servico.qry_cliente_servico_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Cliente X Serviços foi alterado.' + #13#10 +
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


procedure Tfrm_cliente_servico.Cancelar;
begin
  try
    if datm_cliente_servico.qry_cliente_servico_.State in [dsInsert, dsEdit] then
    begin
      datm_cliente_servico.qry_cliente_servico_.Cancel;
      pgctrl_cliente_servico.ActivePage := ts_dados_basicos;
      dbedt_cd_servico.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;


procedure Tfrm_cliente_servico.btn_numerarioClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Application.CreateForm(Tfrm_cliente_numerario, frm_cliente_numerario );
  frm_cliente_numerario.str_cliente := datm_cliente_servico.qry_cliente_servico_CD_CLIENTE.AsString;
  frm_cliente_numerario.str_unid    := datm_cliente_servico.qry_cliente_servico_CD_UNID_NEG.AsString;
  frm_cliente_numerario.str_produto := datm_cliente_servico.qry_cliente_servico_CD_PRODUTO.AsString;
  frm_cliente_numerario.str_servico := datm_cliente_servico.qry_cliente_servico_CD_SERVICO.AsString;
  frm_cliente_numerario.ShowModal;
end;


procedure Tfrm_cliente_servico.btn_faturamentoClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Application.CreateForm(Tfrm_cliente_faturamento, frm_cliente_faturamento );
  frm_cliente_faturamento.str_cliente := datm_cliente_servico.qry_cliente_servico_CD_CLIENTE.AsString;
  frm_cliente_faturamento.str_unid    := datm_cliente_servico.qry_cliente_servico_CD_UNID_NEG.AsString;
  frm_cliente_faturamento.str_produto := datm_cliente_servico.qry_cliente_servico_CD_PRODUTO.AsString;
  frm_cliente_faturamento.str_servico := datm_cliente_servico.qry_cliente_servico_CD_SERVICO.AsString;
  frm_cliente_faturamento.ShowModal;
end;


procedure Tfrm_cliente_servico.pgctrl_cliente_servicoChange(Sender: TObject);
begin
  dbnvg.Enabled               := pgctrl_cliente_servico.ActivePage = ts_lista;
  edt_chave.Enabled           := pgctrl_cliente_servico.ActivePage = ts_lista;
  cb_ordem.Enabled            := pgctrl_cliente_servico.ActivePage = ts_lista;
end;

procedure Tfrm_cliente_servico.pgctrl_cliente_servicoChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_cliente_servico.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
end;

procedure Tfrm_cliente_servico.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_cliente_servico.dbedt_cd_servicoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_servico       then btn_co_servicoClick(nil);
    if Sender = dbedt_cd_banco_deb_cc  then btn_co_banco_deb_ccClick(nil);
    if Sender = dbedt_cd_banco_com     then btn_co_banco_comClick(nil);
    if Sender = dbedt_cd_banco_deb_com then btn_co_banco_deb_comClick(nil);
    if Sender = dbedt_cd_tab_sda       then btn_co_tab_sdaClick(nil);
  end;
end;

procedure Tfrm_cliente_servico.btn_duplicacaoClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Application.CreateForm(Tfrm_duplica_param_cli, frm_duplica_param_cli );
  frm_duplica_param_cli.str_cliente := datm_cliente_servico.qry_cliente_servico_CD_CLIENTE.AsString;
  frm_duplica_param_cli.str_unid    := datm_cliente_servico.qry_cliente_servico_CD_UNID_NEG.AsString;
  frm_duplica_param_cli.str_produto := datm_cliente_servico.qry_cliente_servico_CD_PRODUTO.AsString;
  frm_duplica_param_cli.str_servico := datm_cliente_servico.qry_cliente_servico_CD_SERVICO.AsString;
  frm_duplica_param_cli.ShowModal;
end;

procedure Tfrm_cliente_servico.btn_itens_por_tonClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  (*
  Application.CreateForm(Tfrm_cliente_item_por_ton, frm_cliente_item_por_ton );
  frm_cliente_item_por_ton.str_cliente := datm_cliente_servico.qry_cliente_servico_CD_CLIENTE.AsString;
  frm_cliente_item_por_ton.str_unid    := datm_cliente_servico.qry_cliente_servico_CD_UNID_NEG.AsString;
  frm_cliente_item_por_ton.str_produto := datm_cliente_servico.qry_cliente_servico_CD_PRODUTO.AsString;
  frm_cliente_item_por_ton.str_servico := datm_cliente_servico.qry_cliente_servico_CD_SERVICO.AsString;
  frm_cliente_item_por_ton.ShowModal;
  *)
end;

procedure Tfrm_cliente_servico.dbedt_cd_prefixoExit(Sender: TObject);
begin
  Consiste;
end;


procedure Tfrm_cliente_servico.btn_co_banco_deb_ccClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2216';
  Application.CreateForm(Tfrm_banco, frm_banco);
  frm_banco.Cons_OnLine := datm_cliente_servico.qry_cliente_servico_CD_BANCO_DEB_CC;
  with frm_banco do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_servico.qry_cliente_servico_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_servico.qry_cliente_servico_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_servico do
  begin
    qry_banco_.Close;
    qry_banco_.Prepare;
    qry_banco_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_banco_deb_ccExit(nil);
end;


procedure Tfrm_cliente_servico.btn_co_banco_comClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2216';
  Application.CreateForm(Tfrm_banco, frm_banco);
  frm_banco.Cons_OnLine := datm_cliente_servico.qry_cliente_servico_CD_BANCO_COM;
  with frm_banco do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_servico.qry_cliente_servico_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_servico.qry_cliente_servico_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_servico do
  begin
    qry_banco_.Close;
    qry_banco_.Prepare;
    qry_banco_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_banco_comExit(nil);
end;

procedure Tfrm_cliente_servico.dbedt_cd_banco_deb_ccExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_cliente_servico.dbedt_cd_banco_comExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_cliente_servico.btn_co_banco_deb_comClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2216';
  Application.CreateForm(Tfrm_banco, frm_banco);
  frm_banco.Cons_OnLine := datm_cliente_servico.qry_cliente_servico_CD_BANCO_DEB_COM;
  with frm_banco do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_servico.qry_cliente_servico_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_servico.qry_cliente_servico_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_servico do
  begin
    qry_banco_.Close;
    qry_banco_.Prepare;
    qry_banco_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_banco_deb_comExit(nil);
end;

procedure Tfrm_cliente_servico.dbedt_cd_banco_deb_comExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_cliente_servico.btn_excluirClick(Sender: TObject);
begin
  with datm_cliente_servico do
  begin
    qry_tot_proc_.Close;
    qry_tot_proc_.ParamByName('CD_UNID_NEG').AsString := qry_cliente_servico_CD_UNID_NEG.AsString;
    qry_tot_proc_.ParamByName('CD_PRODUTO').AsString  := qry_cliente_servico_CD_PRODUTO.AsString;
    qry_tot_proc_.ParamByName('CD_CLIENTE').AsString  := qry_cliente_servico_CD_CLIENTE.AsString;
    qry_tot_proc_.ParamByName('CD_SERVICO').AsString  := qry_cliente_servico_CD_SERVICO.AsString;
    qry_tot_proc_.Prepare;
    qry_tot_proc_.Open;
    if qry_tot_proc_TOT_PROC.AsInteger > 0 then
    begin
      BoxMensagem( 'Existem Processos abertos para esta Unidade X Produto X Cliente X Serviço!', 2 );
      qry_tot_proc_.Close;
      Exit;
    end;
    qry_tot_proc_.Close;

    if BoxMensagem('Tem certeza que deseja excluir este registro?', 1) then
    begin
      qry_exclui_.Close;
// Passa Servico pra variável utilizada dentro da Procedure que esclui os fretes
      vCdServico := qry_cliente_servico_CD_SERVICO.asString;
      AlteraFrete(2);
// exclui o serviço
      qry_exclui_.ParamByName('CD_PRODUTO').asString     := qry_cliente_servico_CD_PRODUTO.asString;
      qry_exclui_.ParamByName('CD_UNID_NEG').asString    := qry_cliente_servico_CD_UNID_NEG.asString;
      qry_exclui_.ParamByName('CD_CLIENTE').asString     := qry_cliente_servico_CD_CLIENTE.asString;
      qry_exclui_.ParamByName('CD_SERVICO').asString     := qry_cliente_servico_CD_SERVICO.asString;
      datm_main.db_broker.StartTransaction;
      try
        qry_exclui_.Prepare;
        qry_exclui_.ExecSQL;
        qry_exclui_.UnPrepare;
        qry_exclui_.Close;
        datm_main.db_broker.Commit;
        qry_cliente_servico_.Close;
        qry_cliente_servico_.Open;
      except
        if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;
        BoxMensagem('Não foi possível excluir.', 2 );
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_cliente_servico.btn_fat_complClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  (*
  Application.CreateForm(Tfrm_cliente_itens, frm_cliente_itens);
  frm_cliente_itens.str_cliente := datm_cliente_servico.qry_cliente_servico_CD_CLIENTE.AsString;
  frm_cliente_itens.str_unid    := datm_cliente_servico.qry_cliente_servico_CD_UNID_NEG.AsString;
  frm_cliente_itens.str_produto := datm_cliente_servico.qry_cliente_servico_CD_PRODUTO.AsString;
  frm_cliente_itens.str_servico := datm_cliente_servico.qry_cliente_servico_CD_SERVICO.AsString;
  frm_cliente_itens.ShowModal;
  *)
end;

procedure Tfrm_cliente_servico.btn_represClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Application.CreateForm(Tfrm_cliente_repres, frm_cliente_repres );
  frm_cliente_repres.str_cliente := datm_cliente_servico.qry_cliente_servico_.FieldByName('CD_CLIENTE').AsString;
  frm_cliente_repres.str_unid    := datm_cliente_servico.qry_cliente_servico_.FieldByName('CD_UNID_NEG').AsString;
  frm_cliente_repres.str_produto := datm_cliente_servico.qry_cliente_servico_.FieldByName('CD_PRODUTO').AsString;
  frm_cliente_repres.str_servico := datm_cliente_servico.qry_cliente_servico_.FieldByName('CD_SERVICO').AsString;
  frm_cliente_repres.ShowModal;
end;


procedure Tfrm_cliente_servico.btn_co_tab_sdaClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_sda, frm_sda);
  frm_sda.Cons_OnLine := datm_cliente_servico.qry_cliente_servico_CD_TAB_SDA;
  with frm_sda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_servico.qry_cliente_servico_.State in [dsEdit, dsInsert] )
       then datm_cliente_servico.qry_cliente_servico_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_servico do
  begin
    qry_sda_.Close;
    qry_sda_.Prepare;
    qry_sda_.Open;
  end;
  dbedt_cd_tab_sdaExit(Sender);
end;

procedure Tfrm_cliente_servico.dbedt_cd_tab_sdaExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_cliente_servico.btn_armazenagemClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Application.CreateForm(Tfrm_cliente_armazem, frm_cliente_armazem );
  frm_cliente_armazem.str_cliente := datm_cliente_servico.qry_cliente_servico_CD_CLIENTE.AsString;
  frm_cliente_armazem.str_unid    := datm_cliente_servico.qry_cliente_servico_CD_UNID_NEG.AsString;
  frm_cliente_armazem.str_produto := datm_cliente_servico.qry_cliente_servico_CD_PRODUTO.AsString;
  frm_cliente_armazem.str_servico := datm_cliente_servico.qry_cliente_servico_CD_SERVICO.AsString;
  frm_cliente_armazem.ShowModal;
end;

procedure Tfrm_cliente_servico.dbchk_volumes_mod2Click(Sender: TObject);
begin
  If ( datm_cliente_servico.qry_cliente_servico_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_cliente_servico.dbchk_lanca_solicClick(Sender: TObject);
begin
  If ( datm_cliente_servico.qry_cliente_servico_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_cliente_servico.dbgrdTabFreteColExit(Sender: TObject);
begin
  if TDBGrid(Sender).DataSource.DataSet.State in [dsBrowse, dsInactive] then
    TDBGrid(Sender).DataSource.DataSet.Edit;
  if TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'CD_TAB_FRETE' then
    if (((not datm_cliente_servico.ServicoNovo) and (ConsultaLookUpSQL(' SELECT DESC_TAB_FRETE ' +
                                                                       ' FROM TTAB_FRETE ' +
                                                                       ' WHERE CD_TAB_FRETE = "' + TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_TAB_FRETE').AsString + '"' +
                                                                       '   AND IN_DESEMBARACO IN (1,2) ' +
                                                                       '   AND CD_VIA_TRANSP IN (SELECT CD_VIA_TRANSPORTE ' +
                                                                       '                         FROM TSERVICO ' +
                                                                       '                         WHERE CD_SERVICO = "' + datm_cliente_servico.qry_cliente_servico_CD_SERVICO.ASString + '") ', 'DESC_TAB_FRETE') = '')) or
       ((datm_cliente_servico.ServicoNovo) and (ConsultaLookUpSQL(' SELECT DESC_TAB_FRETE ' +
                                                                  ' FROM TTAB_FRETE ' +
                                                                  ' WHERE CD_TAB_FRETE = "' + TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_TAB_FRETE').AsString + '"' +
                                                                  '   AND IN_DESEMBARACO IN (1,2) ' +
                                                                  '   AND CD_VIA_TRANSP IN (SELECT CD_VIA_TRANSPORTE ' +
                                                                  '                         FROM TSERVICO_NOVO ' +
                                                                  '                         WHERE CD_SERVICO = ' + datm_cliente_servico.qry_cliente_servico_CD_SERVICO.ASString + ') ', 'DESC_TAB_FRETE') = ''))) and
       (TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_TAB_FRETE').AsString <> '')  then
    begin
      ShowMessage('Tabela de Frete Inválida ou inexistente!');
      TDBGrid(Sender).DataSource.DataSet.Cancel;
    end;
end;

procedure Tfrm_cliente_servico.dbgrdTabFreteDblClick(Sender: TObject);
begin
  if TDBGrid(Sender).DataSource.DataSet.State in [dsBrowse, dsInactive] then
    TDBGrid(Sender).DataSource.DataSet.Edit;
  if datm_cliente_servico.ServicoNovo then
    TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_TAB_FRETE').AsString := ConsultaOnlineExSQL('SELECT F.CD_TAB_FRETE, ' +
                                                                                                   '       (SELECT P1.NM_PORTO ' +
                                                                                                   '        FROM TPORTO P1 (NOLOCK) ' +
                                                                                                   '        WHERE P1.CD_PORTO = F.CD_ORIGEM_TAB_FRETE)  ORIGEM, ' +
                                                                                                   '       (SELECT P2.NM_PORTO ' +
                                                                                                   '        FROM TPORTO P2 (NOLOCK) ' +
                                                                                                   '        WHERE P2.CD_PORTO = F.CD_DESTINO_TAB_FRETE) DESTINO, ' +
                                                                                                   '       (SELECT T.DESCRICAO ' +
                                                                                                   '        FROM TTRANSPORTADOR_ITL T (NOLOCK) ' +
                                                                                                   '        WHERE T.CODIGO = F.CD_ARMADOR) ARMADOR, ' +
                                                                                                   '       (SELECT A.NM_AGENTE ' +
                                                                                                   '        FROM TAGENTE A ' +
                                                                                                   '        WHERE A.CD_AGENTE = F.CD_AGENTE_TAB_FRETE) AGENTE, ' +
                                                                                                   '       (SELECT M.AP_MOEDA ' +
                                                                                                   '        FROM TMOEDA_BROKER M (NOLOCK) ' +
                                                                                                   '        WHERE M.CD_MOEDA = F.CD_MOEDA_TAB_FRETE) MOEDA ' +
                                                                                                   ' FROM TTAB_FRETE F (NOLOCK) ' +
                                                                                                   ' WHERE F.IN_DESEMBARACO IN (1,2) ' +
                                                                                                   '   AND F.CD_VIA_TRANSP IN (SELECT S.CD_VIA_TRANSPORTE ' +
                                                                                                   '                           FROM TSERVICO_NOVO S (NOLOCK) ' +
                                                                                                   '                           WHERE S.CD_SERVICO = ' + datm_cliente_servico.qry_cliente_servico_CD_SERVICO.ASString + ') ',
                                                                                                        'Tabelas de Frete',
                                                                                                        ['CD_TAB_FRETE', 'ORIGEM', 'DESTINO', 'ARMADOR', 'AGENTE', 'MOEDA'],
                                                                                                        ['Código', 'Origem', 'Destino', 'Armador', 'Agente', 'Moeda'],
                                                                                                        'CD_TAB_FRETE', nil,
                                                                                                        TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_TAB_FRETE').AsString)
    else
      TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_TAB_FRETE').AsString := ConsultaOnlineExSQL('SELECT F.CD_TAB_FRETE, ' +
                                                                                                   '       (SELECT P1.NM_PORTO ' +
                                                                                                   '        FROM TPORTO P1 (NOLOCK) ' +
                                                                                                   '        WHERE P1.CD_PORTO = F.CD_ORIGEM_TAB_FRETE)  ORIGEM, ' +
                                                                                                   '       (SELECT P2.NM_PORTO ' +
                                                                                                   '        FROM TPORTO P2 (NOLOCK) ' +
                                                                                                   '        WHERE P2.CD_PORTO = F.CD_DESTINO_TAB_FRETE) DESTINO, ' +
                                                                                                   '       (SELECT T.DESCRICAO ' +
                                                                                                   '        FROM TTRANSPORTADOR_ITL T (NOLOCK) ' +
                                                                                                   '        WHERE T.CODIGO = F.CD_ARMADOR) ARMADOR, ' +
                                                                                                   '       (SELECT A.NM_AGENTE ' +
                                                                                                   '        FROM TAGENTE A ' +
                                                                                                   '        WHERE A.CD_AGENTE = F.CD_AGENTE_TAB_FRETE) AGENTE, ' +
                                                                                                   '       (SELECT M.AP_MOEDA ' +
                                                                                                   '        FROM TMOEDA_BROKER M (NOLOCK) ' +
                                                                                                   '        WHERE M.CD_MOEDA = F.CD_MOEDA_TAB_FRETE) MOEDA ' +
                                                                                                   ' FROM TTAB_FRETE F (NOLOCK) ' +
                                                                                                   ' WHERE F.IN_DESEMBARACO IN (1,2) ' +
                                                                                                   '   AND F.CD_VIA_TRANSP IN (SELECT S.CD_VIA_TRANSPORTE ' +
                                                                                                   '                           FROM TSERVICO S (NOLOCK) ' +
                                                                                                   '                           WHERE S.CD_SERVICO = "' + datm_cliente_servico.qry_cliente_servico_CD_SERVICO.ASString + '" ) ',
                                                                                                        'Tabelas de Frete',
                                                                                                        ['CD_TAB_FRETE', 'ORIGEM', 'DESTINO', 'ARMADOR', 'AGENTE', 'MOEDA'],
                                                                                                        ['Código', 'Origem', 'Destino', 'Armador', 'Agente', 'Moeda'],
                                                                                                        'CD_TAB_FRETE', nil,
                                                                                                        TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_TAB_FRETE').AsString)


end;

procedure Tfrm_cliente_servico.dbgrdTabFreteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then  dbgrdTabFreteDblClick(Sender);
end;

procedure Tfrm_cliente_servico.dbgrdTabFreteEnter(Sender: TObject);
begin
  if TDBGrid(Sender).DataSource.DataSet.IsEmpty then TDBGrid(Sender).DataSource.DataSet.Insert;
end;

procedure Tfrm_cliente_servico.dbedt_cd_servicoEnter(Sender: TObject);
begin
  vCdServico := dbedt_cd_servico.Text;
  if datm_cliente_servico.ServicoNovo then
    vViaTransp := ConsultaLookUp('TSERVICO_NOVO', 'CD_SERVICO', dbedt_cd_servico.Text, 'CD_VIA_TRANSPORTE')
  else
    vViaTransp := ConsultaLookUp('TSERVICO', 'CD_SERVICO', dbedt_cd_servico.Text, 'CD_VIA_TRANSPORTE');
  vAlteracaoFrete := 0;
end;

procedure Tfrm_cliente_servico.AlteraFrete(pTpAlteracao: Byte);
begin
{
 0 --> registro em inserção ou sem alteração do Serviço (não altera nada)
 1 --> alteração de Cód. de Serviço para outro de mesma via de Transporte, altera todos os registros do Serviço antigo para o serviço novo
 2 --> alteração de Cód. de Serviço para outro de via de Transpporte dieferente, exclui todos os registros do Serviço antigo
}

  case pTPAlteracao of
    0: Exit;
    1: FastExecSQL(' UPDATE TCLIENTE_SERVICO_FRETE SET CD_SERVICO = "' + datm_cliente_servico.qry_cliente_servico_.FieldByName('CD_SERVICO').AsString + '" ' +
                   ' WHERE CD_UNID_NEG = "' + datm_cliente_servico.qry_cliente_servico_.FieldByName('CD_UNID_NEG').AsString + '" ' +
                   '   AND CD_PRODUTO  = "' + datm_cliente_servico.qry_cliente_servico_.FieldByName('CD_PRODUTO').AsString + '" ' +
                   '   AND CD_CLIENTE  = "' + datm_cliente_servico.qry_cliente_servico_.FieldByName('CD_CLIENTE').AsString + '" ' +
                   '   AND CD_SERVICO  = "' + vCdServico + '" ');
    2: FastExecSQL(' DELETE FROM TCLIENTE_SERVICO_FRETE ' +
                   ' WHERE CD_UNID_NEG = "' + datm_cliente_servico.qry_cliente_servico_.FieldByName('CD_UNID_NEG').AsString + '" ' +
                   '   AND CD_PRODUTO  = "' + datm_cliente_servico.qry_cliente_servico_.FieldByName('CD_PRODUTO').AsString + '" ' +
                   '   AND CD_CLIENTE  = "' + datm_cliente_servico.qry_cliente_servico_.FieldByName('CD_CLIENTE').AsString + '" ' +
                   '   AND CD_SERVICO  = "' + vCdServico + '" ');
  end;
end;


procedure Tfrm_cliente_servico.chk_hab_ativaClick(Sender: TObject);
begin
  with datm_cliente_servico do begin
    qry_cliente_servico_.Close;
    if chk_hab_ativa.Checked then
       qry_cliente_servico_.ParamByName('IN_ATIVO').AsString   := 'X'
    else
       qry_cliente_servico_.ParamByName('IN_ATIVO').Value   := Null;
    qry_cliente_servico_.Prepare;
    qry_cliente_servico_.Open;
  end;

end;

end.
