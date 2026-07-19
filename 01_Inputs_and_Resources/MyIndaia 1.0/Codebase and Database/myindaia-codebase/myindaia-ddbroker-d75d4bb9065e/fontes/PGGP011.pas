(*************************************************************************************************
Sistema: MyIndaia
PROGRAMA: PGGP011.PAS - Movimentação de Contas a Pagar
Manutenção:
Data: 13/10/2006 - Update da Montagem ( linha 3113 )
*************************************************************************************************)
unit PGGP011;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Grids, Db, DBGrids, ComCtrls, Menus, DBCtrls, Buttons, ExtCtrls,
  RXDBCtrl, ToolEdit, Funcoes, dbTables, DateUtils;
   
type
  Tfrm_ctaapagar = class(TForm)
    pnl_geral: TPanel;
    btn_incluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_canc_lanc: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_canc_lanc: TMenuItem;
    mi_sair: TMenuItem;
    pgctrl_ctaapagar: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    ts_lancamentos: TTabSheet;
    ts_distr_gerencial: TTabSheet;
    btn_excluir: TSpeedButton;
    mi_excluir: TMenuItem;
    dbgrd_lista: TDBGrid;
    pnl_ctaapagar: TPanel;
    lbl_nr_lanc: TLabel;
    lbl_cancelado: TLabel;
    dbedt_nr_ctaapagar: TDBEdit;
    lbl_lancamento: TLabel;
    dbedt_dt_ctaapagar: TDBEdit;
    lbl_usuario: TLabel;
    dbedt_nm_usuario: TEdit;
    Label11: TLabel;
    dbedt_cd_usuario_ger: TDBEdit;
    dbedt_nm_usuario_ger: TEdit;
    btn_co_usuario_ger: TSpeedButton;
    lbl_liberado: TLabel;
    pnl_distr_gerencial: TPanel;
    lbl_ct_gerencial: TLabel;
    lbl_vl_distr_gerencial: TLabel;
    btn_co_ct_gerencial: TSpeedButton;
    lbl_vl_lancamento: TLabel;
    dbgrd_distr_gerencial: TDBGrid;
    dbedt_cd_ct_gerencial: TDBEdit;
    dbedt_nm_ct_gerencial: TEdit;
    dbedt_vl_distr: TDBEdit;
    dbedt_vl_lancamento2: TDBEdit;
    Label7: TLabel;
    dbedt_dt_ctaapagar3: TDBEdit;
    dbedt_nr_ctaapagar3: TDBEdit;
    Label8: TLabel;
    Label12: TLabel;
    dbedt_cd_ct_contabil2: TDBEdit;
    dbedt_nm_ct_contabil2: TDBEdit;
    pnl_ctaapagar_lanc: TPanel;
    pgctrl_lancamentos: TPageControl;
    ts_lista_lanc: TTabSheet;
    ts_dados_lanc: TTabSheet;
    pnl_dados_basicos_lanc: TPanel;
    lbl_cd_ct_custo: TLabel;
    btn_co_ct_custo: TSpeedButton;
    lbl_filial: TLabel;
    btn_co_filial: TSpeedButton;
    Label4: TLabel;
    dbedt_cd_ct_custo: TDBEdit;
    dbedt_nm_ct_custo: TEdit;
    dbedt_cd_filial: TDBEdit;
    dbedt_nm_filial: TEdit;
    dbedt_vl_lancamento: TDBEdit;
    lbl_docto_banco: TLabel;
    dbedt_nr_doc_bco: TDBEdit;
    dbedt_cd_usuario: TDBEdit;
    btn_contabiliza: TSpeedButton;
    btn_pesq: TSpeedButton;
    mi_pesq: TMenuItem;
    ts_pesq: TTabSheet;
    pnl_pesquisa: TPanel;
    lbl_forn_pesq: TLabel;
    btn_co_forn_pesq: TSpeedButton;
    Label5: TLabel;
    lbl_vl_pagto_pesq: TLabel;
    lbl_banco_pesq: TLabel;
    btn_co_banco_pesq: TSpeedButton;
    lbl_cheque_pesq: TLabel;
    lbl_cd_ct_contabil: TLabel;
    btn_co_ct_ct_contabil_pesq: TSpeedButton;
    msk_cd_forn_pesq: TMaskEdit;
    edt_nm_forn_pesq: TEdit;
    msk_nm_historico_pesq: TMaskEdit;
    rdgrp_forma_pagto_pesq: TRadioGroup;
    msk_vl_pagto_pesq_inicial: TMaskEdit;
    msk_cd_banco_pesq: TMaskEdit;
    edt_nm_banco_pesq: TEdit;
    msk_nr_cheque_pesq: TMaskEdit;
    msk_cd_ct_contabil_pesq: TMaskEdit;
    edt_nm_ct_contabil_pesq: TEdit;
    Label2: TLabel;
    msk_vl_pagto_pesq_final: TMaskEdit;
    Label9: TLabel;
    Label10: TLabel;
    dbedt_cd_ct_custo2: TDBEdit;
    dbedt_nm_ct_custo2: TDBEdit;
    Label13: TLabel;
    dbedt_cd_ct_filial2: TDBEdit;
    dbedt_nm_filial2: TDBEdit;
    Label14: TLabel;
    dbedt_nr_titulo: TDBEdit;
    dbgrid_processos: TDBGrid;
    Label6: TLabel;
    cb_ordem: TComboBox;
    Panel1: TPanel;
    lbl_inicio: TLabel;
    lbl_fim: TLabel;
    lbl_unidade: TLabel;
    btn_co_coligada: TSpeedButton;
    rdgrp_base: TRadioGroup;
    msk_cd_unidade: TMaskEdit;
    edt_nm_unidade: TEdit;
    dbedt_cd_ct_contabil: TDBEdit;
    dbedt_nm_ct_contabil: TEdit;
    lb_item: TLabel;
    btn_ContaContabil: TSpeedButton;
    DBGrid1: TDBGrid;
    lb_contabiliiza: TLabel;
    msk_pesq_titulo: TMaskEdit;
    Label15: TLabel;
    msk_dt_inicio: TDateEdit;
    msk_dt_fim: TDateEdit;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    lbl_valor: TLabel;
    dbedt_dt_ctaapagar2: TDBEdit;
    dbedt_nr_ctaapagar2: TDBEdit;
    dbedt_valor: TDBEdit;
    BtnMonta: TSpeedButton;
    Montar1: TMenuItem;
    Label16: TLabel;
    EditValDisponivel: TEdit;
    Label19: TLabel;
    DBDateEdit1: TDBDateEdit;
    BtnAutoriz: TSpeedButton;
    AutorizaodePagtos1: TMenuItem;
    DBMemo1: TDBMemo;
    Label20: TLabel;
    Financeiro1: TMenuItem;
    btnFinanceiro: TSpeedButton;
    Shape1: TShape;
    Shape2: TShape;
    lbl_vl_ir: TLabel;
    lbl_vl_inss: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    dbedt_vl_ir: TDBEdit;
    dbedt_vl_inss: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Shape4: TShape;
    Shape5: TShape;
    Label22: TLabel;
    Shape6: TShape;
    Label23: TLabel;
    PnlDados: TPanel;
    Shape3: TShape;
    lbl_vl_lanc: TLabel;
    lbl_banco: TLabel;
    lbl_nr_cheque: TLabel;
    btn_co_banco: TSpeedButton;
    lbl_desconto: TLabel;
    lbl_acrescimo: TLabel;
    lbl_dt_pagamento: TLabel;
    lbl_vencimento: TLabel;
    lbl_qtde: TLabel;
    lbl_pagamento: TLabel;
    Label21: TLabel;
    dbedt_vl_despesa: TDBEdit;
    dbedt_nr_cheque: TDBEdit;
    dbedt_vl_desconto: TDBEdit;
    dbedt_vl_acrescimo: TDBEdit;
    dbedt_dt_pagamento: TDBEdit;
    msk_qtde: TMaskEdit;
    dbedt_dt_vencimento: TDBDateEdit;
    dbedt_vl_pagamento: TDBEdit;
    dbedt_dt_montagem: TDBEdit;
    dbedt_nm_banco: TEdit;
    dbedt_cd_banco: TDBEdit;
    dbedt_nm_historico: TDBEdit;
    lbl_historico: TLabel;
    grpbox_cd_barras: TGroupBox;
    dbedt_cd_barras: TDBEdit;
    dbchk_manual: TDBCheckBox;
    dbrdgrp_forma_pagto: TDBRadioGroup;
    lbl_fornec: TLabel;
    btn_co_fornecedor: TSpeedButton;
    lbl_favorecido: TLabel;
    btn_co_favorecido: TSpeedButton;
    dbedt_nm_fornecedor: TEdit;
    dbedt_nm_favorecido: TEdit;
    dbedt_cd_fornecedor: TDBEdit;
    dbedt_cd_favorecido: TDBEdit;
    dblck_lanc_provisionado1: TDBLookupComboBox;
    Label24: TLabel;
    dblck_lanc_provisionado: TDBLookupComboBox;
    Label26: TLabel;
    SpeedButton1: TSpeedButton;
    Label34: TLabel;
    Edit1: TEdit;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TEdit;
    dbchkSelecionado: TDBCheckBox;
    Label25: TLabel;
    btn_rateio: TSpeedButton;
    dbedt_nm_rateio: TEdit;
    dbedt_cd_rateio: TDBEdit;
    ts_Rateio: TTabSheet;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    procedure btn_sairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedt_cd_ct_contabilExit(Sender: TObject);
    procedure dbedt_cd_historicoExit(Sender: TObject);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure btn_ContaContabilClick(Sender: TObject);
    procedure btn_co_ct_custoClick(Sender: TObject);
    procedure btn_co_ct_gerencialClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure pgctrl_ctaapagarChange(Sender: TObject);
    procedure pgctrl_ctaapagarChanging(Sender: TObject; var AllowChange: Boolean);
    procedure btn_salvarClick(Sender: TObject);
    procedure dbrdgrp_forma_pagtoChange(Sender: TObject);
    procedure dbedt_cd_ct_custoExit(Sender: TObject);
    procedure dbedt_cd_ct_gerencialExit(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_favor_contabilKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure dbedt_cd_bancoExit(Sender: TObject);
    procedure btn_co_fornecedorClick(Sender: TObject);
    procedure dbedt_cd_fornecedorExit(Sender: TObject);
    procedure dbedt_cd_ct_contabilChange(Sender: TObject);
    procedure btn_co_usuario_gerClick(Sender: TObject);
    procedure dbedt_cd_usuario_gerExit(Sender: TObject);
    procedure btn_co_filialClick(Sender: TObject);
    procedure dbedt_cd_filialExit(Sender: TObject);
    procedure dbedt_cd_barrasExit(Sender: TObject);
    procedure dbedt_cd_barrasEnter(Sender: TObject);
    procedure dbedt_vl_descontoExit(Sender: TObject);
    procedure dbedt_vl_acrescimoExit(Sender: TObject);
    procedure dbedt_vl_despesaExit(Sender: TObject);
    procedure dbedt_vl_irExit(Sender: TObject);
    procedure dbedt_vl_inssExit(Sender: TObject);
    procedure dbedt_vl_despesaEnter(Sender: TObject);
    procedure dbedt_vl_descontoEnter(Sender: TObject);
    procedure btn_co_coligadaClick(Sender: TObject);
    procedure msk_cd_unidadeEnter(Sender: TObject);
    procedure msk_cd_unidadeExit(Sender: TObject);
    procedure rdgrp_baseClick(Sender: TObject);
    procedure btn_canc_lancClick(Sender: TObject);
    procedure btn_contabilizaClick(Sender: TObject);
    procedure btn_pesqClick(Sender: TObject);
    procedure btn_co_forn_pesqClick(Sender: TObject);
    procedure btn_co_banco_pesqClick(Sender: TObject);
    procedure btn_co_ct_ct_contabil_pesqClick(Sender: TObject);
    procedure msk_cd_forn_pesqExit(Sender: TObject);
    procedure msk_cd_banco_pesqExit(Sender: TObject);
    procedure msk_cd_ct_contabil_pesqExit(Sender: TObject);
    procedure msk_vl_pagto_pesq_inicialExit(Sender: TObject);
    procedure pnl_pesquisaEnter(Sender: TObject);
    procedure msk_vl_pagto_pesq_finalExit(Sender: TObject);
    procedure dbrdgrp_forma_pagtoExit(Sender: TObject);
    procedure dbedt_cd_favorecidoExit(Sender: TObject);
    procedure btn_co_favorecidoClick(Sender: TObject);
    procedure dbedt_cd_acessoEnter(Sender: TObject);
    procedure dbedt_cd_usuarioChange(Sender: TObject);
    procedure DateEdit1Enter(Sender: TObject);
    procedure DateEdit1Exit(Sender: TObject);
    procedure DateEdit2Enter(Sender: TObject);
    procedure msk_qtdeExit(Sender: TObject);
    procedure BtnMontaClick(Sender: TObject);
    procedure BtnAutorizClick(Sender: TObject);
    procedure btnFinanceiroClick(Sender: TObject);
    procedure DBDateEdit1Exit(Sender: TObject);
    procedure dblck_lanc_provisionadoClick(Sender: TObject);
    procedure dblck_lanc_provisionadoExit(Sender: TObject);
    procedure MaskEdit7Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dbgrd_listaDblClick(Sender: TObject);
    procedure btn_rateioClick(Sender: TObject);
    procedure dbedt_cd_rateioExit(Sender: TObject);
  private
    cd_ct_gerencial, cd_ct_contabil, nr_ctaapagar, cd_filial, cd_ct_custo, st_modulo, st_rotina : String;
    dt_ctaapagar: TDate;
    a_str_indices : Array[0..4] Of String[60];
    linsere_distr_ger, lts_distr_gerencial : Boolean;
    dt_inicio, dt_fim : String[10];
    cd_barras: String;
    vl_pagto : Double;
    function Consiste          : Boolean;
    function Grava             : Boolean;
    function VerAlt            : Boolean;
    procedure VerDistribuicao;
    procedure Cancelar;
    procedure CodExits;
    procedure AbreConta( DataInicio : TDate; DataFim : TDate; Coligada: String );
    procedure FechaQRYConta;
    procedure AtualizaValDisp;
    procedure GeraRateio( const pDT_CTAAPAGAR : TDateTime; const pNrConta : string;
                          const pCdUnidade : string; const pCd_Rateio : string;
                          pValor : Real; pCodLancamento : Integer = 0);
  public
    st_incluir, st_excluir : Boolean;
    lNaoConsiste, in_imp_cheque, Salvando : Boolean;
    cd_unidade_contas : String[2];
    lPesq, st_modificar : Boolean;
    str_cd_sistema_contabil : String[1];
    Str_Cd_FornAnterior : String;
    in_salva : Integer;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure CalcImpostos;
  end;

var
  frm_ctaapagar: Tfrm_ctaapagar;

implementation

{$R *.DFM}

uses GSMLIB,  PGGP001, PGGP017, PGSM016, PGSM018, PGSM041, PGSM096, PGGP012,
     PGSM090, PGSM148, PGSM108, PGGP059, ConsOnLineEx, uVenctoCtsPagar,
  dVenctoCtsPagar, Math;

procedure Tfrm_ctaapagar.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ctaapagar.FormCreate(Sender: TObject);
begin
  pgctrl_ctaapagar.ActivePage := ts_lista;
  st_modulo    := vStr_cd_modulo;
  st_rotina    := str_cd_rotina;

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  // Cria o DataModule de Dados do módulo Contas a Pagar
  Application.CreateForm( Tdatm_ctaapagar, datm_ctaapagar );

  with datm_ctaapagar do
  begin
    ds_ctaapagar.AutoEdit      := st_modificar;
    ds_ctaapagar_lanc.AutoEdit := st_modificar;
    ds_contabil_distr.AutoEdit := st_modificar;

   if in_integracao_contabil = '1' then
   begin
     SqlCustosContabil.Close;
     SqlCustosContabil.Prepare;
     SqlCustosContabil.Open;
     //qry_look_ct_custo_rm_.Close;
     //qry_look_ct_custo_rm_.Prepare;
     //qry_look_ct_custo_rm_.Open;
   end
   else
    begin
    qry_custo_aux_.Close;
    qry_custo_aux_.Prepare;
    qry_custo_aux_.Open;

    // qry_ctaapagar_lanc_Look_nome_ct_custo.LookupDataSet  := qry_custo_aux_;
    end;

    dt_inicio                  := FormatDateTime('dd/mm/yyyy', dt_server);
    dt_fim                     := FormatDateTime('dd/mm/yyyy', dt_server);
    msk_dt_inicio.Text         := FormatDateTime('dd/mm/yyyy', dt_server);
    msk_dt_fim.Text            := FormatDateTime('dd/mm/yyyy', dt_server);

    rdgrp_base.ItemIndex       := 0;

    a_str_indices[0] := 'A.DT_VENCIMENTO,A.NR_CTAAPAGAR';
    a_str_indices[1] := 'A.DT_CTAAPAGAR,A.NR_CTAAPAGAR';
    a_str_indices[2] := 'A.DT_PAGAMENTO,A.NR_CTAAPAGAR';
    a_str_indices[3] := 'F.AP_FAVORECIDO,A.NR_CTAAPAGAR';
    a_str_indices[4] := 'A.NR_TITULO,A.NR_CTAAPAGAR';

    with cb_ordem do
    begin
      Clear;
      Items.Add('Data Vencimento');
      Items.Add('Data Lançamento');
      Items.Add('Data Pagamento');
      Items.Add('Fornecedor');
      Items.Add('Nr. Título');
      ItemIndex := 0;
    end;

    qry_param_.Close;
    qry_param_.Prepare;
    qry_param_.Open;
    str_cd_sistema_contabil := qry_param_CD_SISTEMA_CONTABIL.AsString;
    qry_param_.Close;
    // AbreConta( dt_server, dt_server, msk_cd_unidade.Text );
  end;
  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_ctaapagar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_ctaapagar do
    begin
      FechaQRYConta;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_ctaapagar.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  with datm_ctaapagar do
  begin
    btn_salvar.Enabled    := Salv;  mi_salvar.Enabled      := Salv;
    btn_Cancelar.Enabled  := Canc;  mi_Cancelar.Enabled    := Canc;
    if ( pgctrl_ctaapagar.ActivePage = ts_distr_gerencial ) then
    begin
      btn_excluir.Enabled := ( qry_ctaapagar_ger_.RecordCount > 0 )           and
                             ( qry_ctaapagar_IN_CANCELADO.AsString = '0' )    and
                             ( qry_ctaapagar_IN_LIBERADO.AsString = '0' )     and
                             ( qry_ctaapagar_CD_LT_CONTAB.AsString = '' )     and
                             ( qry_ctaapagar_CD_LT_CONTAB_EXT.AsString = '' ) and
                             ( qry_ctaapagar_CD_USUARIO_GER.AsString = str_cd_usuario ) and Exc;
      mi_excluir.Enabled  := btn_excluir.Enabled;
      btn_incluir.Enabled := ( qry_ctaapagar_lanc_.RecordCount > 0 )          and
                             ( qry_ctaapagar_IN_CANCELADO.AsString = '0' )    and
                             ( qry_ctaapagar_IN_LIBERADO.AsString = '0' )     and
                             ( qry_ctaapagar_CD_LT_CONTAB.AsString = '' )     and
                             ( qry_ctaapagar_CD_LT_CONTAB_EXT.AsString = '' ) and
                             ( qry_ctaapagar_CD_USUARIO_GER.AsString = str_cd_usuario ) and Inc;
      mi_incluir.Enabled  := btn_incluir.Enabled;
    end
    else if ( pgctrl_ctaapagar.ActivePage = ts_lancamentos ) then
    begin
      btn_excluir.Enabled := ( qry_ctaapagar_lanc_.RecordCount > 0 )          and
                             ( qry_ctaapagar_IN_CANCELADO.AsString = '0' )    and
                             ( qry_ctaapagar_IN_LIBERADO.AsString = '0' )     and
                             ( qry_ctaapagar_CD_LT_CONTAB.AsString = '' )     and
                             ( qry_ctaapagar_CD_LT_CONTAB_EXT.AsString = '' ) and Exc;
      mi_excluir.Enabled  := btn_excluir.Enabled;
      btn_incluir.Enabled := ( qry_ctaapagar_.RecordCount > 0 )               and
                             ( qry_ctaapagar_IN_CANCELADO.AsString = '0' )    and
                             ( qry_ctaapagar_IN_LIBERADO.AsString = '0' )     and
                             ( qry_ctaapagar_CD_LT_CONTAB.AsString = '' )     and
                             ( qry_ctaapagar_CD_LT_CONTAB_EXT.AsString = '' ) and Inc;
      mi_incluir.Enabled  := btn_incluir.Enabled;
    end
    else  //não se apaga o lancamento, apenas cancela
    begin
      btn_excluir.Enabled := False;
      mi_excluir.Enabled  := btn_excluir.Enabled;
      btn_incluir.Enabled := Inc;
      mi_incluir.Enabled  := Inc;
    end;
  end;
end;

procedure Tfrm_ctaapagar.dbedt_cd_ct_contabilExit(Sender: TObject);
begin
//  CodExits;
  if Trim(dbedt_nm_ct_contabil.Text) <> '' then
  begin
    if Trim(dbedt_nm_rateio.Text) = '' then
    begin
      if datm_ctaapagar.qry_ctaapagar_lanc_.State in [dsInsert, dsEdit] then
        datm_ctaapagar.qry_ctaapagar_lanc_CD_RATEIO.AsString := ConsultaLookUP('TCT_CONTABIL','CD_CT_CONTABIL',datm_ctaapagar.qry_ctaapagar_lanc_CD_CT_CONTABIL.AsString,'CD_RATEIO');
    end;
  end;
end;

procedure Tfrm_ctaapagar.CodExits;
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_ctaapagar.dbedt_cd_historicoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_ctaapagar.btn_co_bancoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_ctaapagar.qry_ctaapagar_) then exit;
      datm_ctaapagar.qry_ctaapagar_CD_BANCO.AsString := ConsultaOnLineEx('TBANCO','Banco',['CD_BANCO','NM_BANCO'],['Código','Descrição'],'CD_BANCO',frm_main.mi_cad_fin_conta_banc)
  end
  else
    dbedt_nm_banco.Text := ConsultaLookUP('TBANCO','CD_BANCO',dbedt_cd_banco.Text,'NM_BANCO')
end;

procedure Tfrm_ctaapagar.btn_ContaContabilClick(Sender: TObject);
begin
//Rodrigo
//Filtrar as contas que são do ano da data do lançamento
  if Sender Is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_ctaapagar.qry_ctaapagar_lanc_) then
      Exit;
    Btn_Mi( False, True, True, False );
    datm_ctaapagar.qry_ctaapagar_lanc_CD_CT_CONTABIL.AsString := ConsultaOnLineExSQL('select CD_CT_CONTABIL, NM_CT_CONTABIL, CD_ACESSO, CD_AUX from TCT_CONTABIL where ANO_CONTA = ' + IntToStr(YearOf(datm_ctaapagar.qry_ctaapagar_DT_CTAAPAGAR.AsDateTime)), 'Contas Contábeis',
                                                                             ['CD_CT_CONTABIL', 'NM_CT_CONTABIL', 'CD_ACESSO', 'CD_AUX'],
                                                                             ['Código',         'Descrição',      'Acesso',    'Aux'   ],
                                                                             'CD_CT_CONTABIL', nil, dbedt_cd_ct_contabil.Text);
  end
  else
    dbedt_nm_ct_contabil.Text                                 := ConsultaLookUpSQL('select NM_CT_CONTABIL from TCT_CONTABIL ' +
                                                                                   ' WHERE CD_CT_CONTABIL = "' + dbedt_cd_ct_contabil.Text + '" ' +
                                                                                   ' AND ANO_CONTA = ' + IntToStr(YearOf(datm_ctaapagar.qry_ctaapagar_DT_CTAAPAGAR.AsDateTime)),'NM_CT_CONTABIL');
  if (Copy(dbedt_cd_ct_contabil.Text, 1 ,2) = '01') or (Copy(dbedt_cd_ct_contabil.Text, 1 ,2) = '02') then
  begin
    dbedt_cd_rateio.Text := '';
    dbedt_cd_rateio.Enabled := False;
    btn_rateio.Enabled      := False;
    dbedt_cd_rateio.Color   := clMenu;
  end
  else
  begin
    dbedt_cd_rateio.Enabled := True;
    btn_rateio.Enabled      := True;
    dbedt_cd_rateio.Color   := clWindow;
  end

{  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_ctaapagar.qry_ctaapagar_lanc_) then exit;
     datm_ctaapagar.qry_ctaapagar_lanc_CD_CT_CONTABIL.AsString := ConsultaOnLineEx('TCT_CONTABIL','Contas Contábeis',['CD_CT_CONTABIL','NM_CT_CONTABIL'],['Código','Descrição'],'CD_CT_CONTABIL',frm_main.mi_cad_fin_conta_contabil)
  end
  else
    dbedt_nm_ct_contabil.Text := ConsultaLookUP('TCT_CONTABIL','CD_CT_CONTABIL',dbedt_cd_ct_contabil.Text,'NM_CT_CONTABIL')}
end;


procedure Tfrm_ctaapagar.btn_co_ct_custoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_ctaapagar.qry_ctaapagar_lanc_) then exit;
      datm_ctaapagar.qry_ctaapagar_lanc_CD_CT_CUSTO.AsString := ConsultaOnLineEx('TCONTABIL_CUSTO','Centro de Custo',['CD_CT_CUSTO','NM_CT_CUSTO'],['Código','Descrição'],'CD_CT_CUSTO',frm_main.mi_cad_fin_centro_custos)
  end
  else
    dbedt_nm_ct_custo.Text := ConsultaLookUP('TCONTABIL_CUSTO','CD_CT_CUSTO',dbedt_cd_ct_custo.Text,'NM_CT_CUSTO')
end;


procedure Tfrm_ctaapagar.btn_co_ct_gerencialClick(Sender: TObject);
begin
  if str_cd_sistema_contabil = '0' then
  begin
    if Sender is TSpeedButton then
    Begin
      if not PoeEmEdicao(datm_ctaapagar.qry_ctaapagar_) then exit;
      datm_ctaapagar.qry_ctaapagar_ger_CD_CT_GERENCIAL.AsString := ConsultaOnLineExFiltro('TCONTABIL_GERENCIAL','Distribuição Gerencial',['CD_CT_GERENCIAL','NM_CT_GERENCIAL'],['Código','Descrição'],'CD_CT_GERENCIAL', 'CD_COLIGADA = ' + msk_cd_unidade.Text,frm_main.mi_cad_fin_conta_contabil);
    End
    else
      dbedt_nm_ct_gerencial.Text   := ConsultaLookUp('TCONTABIL_GERENCIAL','CD_CT_GERENCIAL',dbedt_cd_ct_gerencial.Text,'NM_CT_GERENCIAL');
  end
  else
  begin
    if Sender is TSpeedButton then
    Begin
      if not PoeEmEdicao(datm_ctaapagar.qry_ctaapagar_) then exit;
      datm_ctaapagar.qry_ctaapagar_ger_CD_CT_GERENCIAL.AsString := ConsultaOnLineEx('TCT_GERENCIAL','Contas Gerenciais',['CD_CT_GERENCIAL','NM_CT_GERENCIAL'],['Código','Descrição'],'CD_CT_GERENCIAL',frm_main.mi_cad_fin_conta_contabil);
    End
    else
      dbedt_nm_ct_gerencial.Text   := ConsultaLookUp('TCT_GERENCIAL','CD_CT_GERENCIAL',dbedt_cd_ct_gerencial.Text,'NM_CT_GERENCIAL');
  end;
end;


function Tfrm_ctaapagar.Consiste : Boolean;
var
  vl_distr_gerencial, vl_pagamento : Double;
begin
  Consiste := True;
  with datm_ctaapagar do
  begin
    // Consistências para Contas

    // Fornecedor
    if qry_ctaapagar_.State in [dsInsert, dsEdit] then
    begin
      ValidCodigo( dbedt_cd_fornecedor );
      if ( dbedt_cd_fornecedor.Text <> '' ) and ( datm_ctaapagar.qry_ctaapagar_IN_LANC_PROVISIONADO.AsString = '1' ) then
      begin
        if dbedt_nm_fornecedor.Text = '' then
        begin
          BoxMensagem('Código do Fornecedor inválido!',2);
          pgctrl_ctaapagar.ActivePage := ts_dados_basicos;
          dbedt_cd_fornecedor.SetFocus;
          Consiste := False;
          Exit;
        end
        else
        begin
          (*  Inibido em 02/09/2005 - será verificado na rotina de gravação
          qry_fav_.Close;
          qry_fav_.Prepare;
          qry_fav_.Open;
          if qry_fav_AP_FAVORECIDO.AsString = '' then
          begin
            BoxMensagem('Apelido do Fornecedor não informado!',2);
            pgctrl_ctaapagar.ActivePage := ts_dados_basicos;
            dbedt_cd_fornecedor.SetFocus;
            Consiste := False;
            Exit;
          end;
          if ( qry_fav_CD_TIPO_PESSOA.AsString = '1' ) and
             ( qry_fav_CGC_EMPRESA.AsString = '' ) then
          begin
            BoxMensagem('O Fornecedor é pessoa jurídica mas o CNPJ não foi informado!',2);
            pgctrl_ctaapagar.ActivePage := ts_dados_basicos;
            dbedt_cd_fornecedor.SetFocus;
            Consiste := False;
            Exit;
          end;
          if ( qry_fav_CD_TIPO_PESSOA.AsString = '2' ) and
             ( qry_fav_CPF_EMPRESA.AsString = '' ) then
          begin
            BoxMensagem('O Fornecedor é pessoa física mas o CPF não foi informado!',2);
            pgctrl_ctaapagar.ActivePage := ts_dados_basicos;
            dbedt_cd_fornecedor.SetFocus;
            Consiste := False;
            Exit;
          end; *)

        end;
      end;

      // Favorecido
      ValidCodigo( dbedt_cd_favorecido );
      if dbedt_cd_favorecido.Text <> '' then
      begin
        if dbedt_nm_favorecido.Text = '' then
        begin
          BoxMensagem( 'Código do Favorecido inválido!', 2 );
          pgctrl_ctaapagar.ActivePage := ts_dados_basicos;
          dbedt_cd_favorecido.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      // Histórico
      (* if dbedt_nm_historico.Text = '' then
      begin
        BoxMensagem( 'Campo histórico não informado !', 2 );
        pgctrl_ctaapagar.ActivePage := ts_dados_basicos;
        dbedt_nm_historico.SetFocus;
        Consiste := False;
        Exit;
      end; *)

      // Valor IR
      if qry_ctaapagar_LookControlaIR.AsBoolean then
      begin
        dbedt_vl_ir.Color    := clWindow;
        dbedt_vl_ir.ReadOnly := False;
        dbedt_vl_ir.TabStop  := True;
      end
      else
      begin
        dbedt_vl_ir.Color    := clMenu;
        dbedt_vl_ir.ReadOnly := True;
        dbedt_vl_ir.TabStop  := False;
      end;

      // Cód.Barras
      if ( Trim( dbedt_cd_barras.Text ) <> '' ) and ( Not dbchk_Manual.Checked ) then
      begin
        if Not CodBarra1DV( Trim( dbedt_cd_barras.Text ), True ) then
        begin
          pgctrl_ctaapagar.ActivePage := ts_dados_basicos;
          dbedt_cd_barras.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      if ( Trim( dbedt_cd_barras.Text ) <> '' ) and ( dbchk_Manual.Checked ) then
      begin
        if Not CodBarra3DV( Trim( dbedt_cd_barras.Text ), True ) then
        begin
          pgctrl_ctaapagar.ActivePage := ts_dados_basicos;
          dbedt_cd_barras.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      // Valor Desconto/Acréscimo
      if dbedt_cd_barras.Text = '' then
      begin
        dbedt_vl_despesa.Color      := clWindow;
        dbedt_vl_despesa.ReadOnly   := False;
        dbedt_vl_despesa.TabStop    := True;
      end
      else
      begin
        // Carregar valores
        if dbchk_Manual.Checked then
        begin
          vl_pagamento :=
             StrToFloat( Copy( Trim( dbedt_cd_barras.Text ), 34, Length( Trim( dbedt_cd_barras.Text ) ) - 35 ) + ',' +
                         Copy( Trim( dbedt_cd_barras.Text ), Length( Trim( dbedt_cd_barras.Text ) ) - 1, 2 ) );
        end
        else
        begin
          vl_pagamento :=
             Strtofloat( IntToStr( StrToInt( Copy( Trim( dbedt_cd_barras.Text ), 6, 12 ) ) ) + ',' +
                         Copy( Trim( dbedt_cd_barras.Text ), 18, 2 ) );
        end;

        if vl_pagamento > 0  then
        begin
          dbedt_vl_despesa.Color    := clMenu;
          dbedt_vl_despesa.ReadOnly := True;
          dbedt_vl_despesa.TabStop  := False;

          qry_ctaapagar_VL_DESPESA.AsFloat :=
            MyRound( vl_pagamento + qry_ctaapagar_VL_ACRESCIMO.AsFloat               -
            qry_ctaapagar_VL_DESCONTO.AsFloat - qry_ctaapagar_VL_IR.AsFloat -
            qry_ctaapagar_VL_INSS.AsFloat, 2 );
        end
        else
        begin
          dbedt_vl_despesa.Color    := clWindow;
          dbedt_vl_despesa.ReadOnly := False;
          dbedt_vl_despesa.TabStop  := True;
        end;
      end;

      // Despesa
      if Not lNaoConsiste then
      begin
        if length( dbedt_vl_desconto.Text ) = 0 then
        begin
          dbedt_vl_desconto.Text := '0';
        end;

        if StrToFloat( TiraPic ( dbedt_vl_despesa.Text ) ) <= 0 then
        begin
          BoxMensagem('Campo Valor da Despesa deve ser maior que zero!', 2);
          pgctrl_ctaapagar.ActivePage := ts_dados_basicos;
          dbedt_vl_despesa.SetFocus;
          Consiste := False;
          Exit;
        end;

        // Verificar se pagamento irá gerar TED
        If datm_ctaapagar.qry_ctaapagar_TP_PAGAMENTO.AsString <> 'T' Then
        Begin
          If StrToFloat( TiraPic ( dbedt_vl_despesa.Text ) ) >= vl_minimo_ted Then
          Begin
            If Not BoxMensagem( 'Valor maior ou igual a R$ ' + FormatFloat( '#0,.00', vl_minimo_ted ) + #13#10 +
                                'O sistema irá gerar Pagamento em TED. Confirma? ', 1 ) Then
            begin
              If Not BoxMensagem( 'Deseja então gerar Cheque?' +  #13#10 +
                                  'Atenção pois serão geradas tarifas sobre o valor!', 1 ) Then
              Begin
                dbrdgrp_forma_pagto.SetFocus;
                Consiste := False;
                Exit;
              end;
            End
            Else
              datm_ctaapagar.qry_ctaapagar_TP_PAGAMENTO.AsString := 'T';
          End;
        End
        Else
        Begin
          If StrToFloat( TiraPic ( dbedt_vl_despesa.Text ) ) < vl_minimo_ted Then
          Begin
            If Not BoxMensagem( 'Valor mínimo para TED é de R$ ' + FormatFloat( '#0,.00', vl_minimo_ted ) + #13#10 +
                                'O sistema irá gerar Pagamento em Cheque. Confirma? ', 1 ) Then
            begin
              dbrdgrp_forma_pagto.SetFocus;
              Consiste := False;
              Exit;
            End
            Else
              datm_ctaapagar.qry_ctaapagar_TP_PAGAMENTO.AsString := 'C';
          End;
        End;
      end;

      // Data de Vencimento
      if Not lNaoConsiste then
      begin
        if DBDateEdit1.Text = '  /  /    ' then
        begin
          BoxMensagem('Campo Data de Emissão DOC deve ser preenchido!', 2);
          pgctrl_ctaapagar.ActivePage := ts_dados_basicos;
          DBDateEdit1.SetFocus;
          Consiste := False;
          Exit;
        end;

        if dbedt_dt_vencimento.Text = '  /  /    ' then
        begin
          BoxMensagem('Campo Data de Vencimento deve ser preenchido!', 2);
          pgctrl_ctaapagar.ActivePage := ts_dados_basicos;
          dbedt_dt_vencimento.SetFocus;
          Consiste := False;
          Exit;
        end;

        if dbedt_nr_titulo.Text = '' then
        begin
          BoxMensagem( 'Nº Nota Fiscal deve ser preenchido!', 2 );
          pgctrl_ctaapagar.ActivePage := ts_dados_basicos;
          dbedt_nr_titulo.SetFocus;
          Consiste := False;
          Exit;
        end;

        (* else
        begin
          try
            StrToDate( dbedt_dt_vencimento.Text );
            If StrToDate( dbedt_dt_vencimento.Text ) < date Then
            begin
              BoxMensagem('Data de Vencimento não pode ser menor que o dia de hoje!', 2);
              pgctrl_ctaapagar.ActivePage := ts_dados_basicos;
              dbedt_dt_vencimento.SetFocus;
              Consiste := False;
              Exit;
            end
          except
            on EConvertError do
            begin
              BoxMensagem('Data Inválida!',2);
              dbedt_dt_vencimento.Clear;
              dbedt_dt_vencimento.SetFocus;
              Consiste := False;
              Exit;
            end;
          end;
        end; *)
      end;

      ValidCodigo( dbedt_cd_banco );
      if dbedt_cd_banco.Text <> '' then
      begin
        if dbedt_nm_banco.Text = '' then
        begin
          BoxMensagem('Código do Banco inválido!',2);
          pgctrl_ctaapagar.ActivePage := ts_dados_basicos;
          dbedt_cd_banco.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      // Usuário responsável pela Distribuição Gerencial
      if ( Not lNaoConsiste ) then
      begin
        if Trim( dbedt_cd_usuario_ger.Text )  <> '' then
        begin
          if dbedt_nm_usuario_ger.Text = '' then
          begin
            BoxMensagem('Campo Código do Usuário resp. pela Distr. Inválido!', 2);
            pgctrl_ctaapagar.ActivePage := ts_dados_basicos;
            dbedt_cd_usuario_ger.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      ValidCodigo( dbedt_cd_usuario_ger );
      if dbedt_cd_usuario_ger.Text <> '' then
      begin
        if dbedt_nm_usuario_ger.Text = '' then
        begin
          BoxMensagem('Código do Usuário resp. pela Distr. Gerencial inválido!', 2);
          pgctrl_ctaapagar.ActivePage := ts_dados_basicos;
          dbedt_cd_usuario_ger.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

    // Consistências para Lançamentos
    if qry_ctaapagar_lanc_.State in [dsInsert, dsEdit] then
    begin
      // Conta Contábil
      if Not lNaoConsiste then
      begin
        if ( Trim( dbedt_nm_ct_contabil.Text ) = '' ) then
        begin
          BoxMensagem('Conta Contabil inválida!', 2);
          pgctrl_lancamentos.ActivePage := ts_dados_lanc;
          dbedt_cd_ct_contabil.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;


    //Comentado por Rodrigo Capra - 03/01/2008 - 0068/08
    {if ( pgctrl_ctaapagar.ActivePage = ts_lancamentos ) and ( dbedt_cd_rateio.Text = '' ) then
    begin
      BoxMensagem( 'Código do Rateio obrigatório!', 2 );
      pgctrl_lancamentos.ActivePage := ts_dados_lanc;
      dbedt_cd_rateio.SetFocus;
      Consiste := False;
      Exit;
    end;}

    if dbedt_cd_rateio.Text <> '' then
    begin
      if dbedt_nm_rateio.Text = '' then
      begin
        BoxMensagem( 'Código do Rateio inválido!', 2 );
        pgctrl_lancamentos.ActivePage := ts_dados_lanc;
        dbedt_cd_rateio.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;


{    // Custo
    if ( pgctrl_ctaapagar.ActivePage = ts_lancamentos ) and ( dbedt_cd_ct_custo.Text = '' ) then
    begin
      BoxMensagem( 'Código do Custo obrigatório!', 2 );
      pgctrl_lancamentos.ActivePage := ts_dados_lanc;
      dbedt_cd_ct_custo.SetFocus;
      Consiste := False;
      Exit;
    end;

    if dbedt_cd_ct_custo.Text <> '' then
    begin
      if dbedt_nm_ct_custo.Text = '' then
      begin
        BoxMensagem( 'Código do Custo inválido!', 2 );
        pgctrl_lancamentos.ActivePage := ts_dados_lanc;
        dbedt_cd_ct_custo.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;}

      // Valor do Lançamento
      if Not lNaoConsiste then
      begin
        if StrToFloat( TiraPic ( dbedt_vl_lancamento.Text ) ) <= 0 then
        begin
          BoxMensagem('Campo Valor do Lançamento deve ser maior que zero!', 2);
          pgctrl_ctaapagar.ActivePage   := ts_lancamentos;
          pgctrl_lancamentos.ActivePage := ts_dados_lanc;
          dbedt_vl_lancamento.SetFocus;
          Consiste := False;
          Exit;
        end
        Else If StrToFloat( TiraPic ( dbedt_vl_lancamento.Text ) ) > StrToFloat( TiraPic ( EditValDisponivel.Text ) ) Then
        Begin
          BoxMensagem('Valor do Lançamento é maior que o Valor Disponível !', 2);
          pgctrl_ctaapagar.ActivePage   := ts_lancamentos;
          pgctrl_lancamentos.ActivePage := ts_dados_lanc;
          dbedt_vl_lancamento.SetFocus;
          Consiste := False;
          Exit;
        End
      end;

      // Código da Filial
      if Not lNaoConsiste then
      begin
        if dbedt_cd_filial.Text = '' then
        begin
          BoxMensagem('Campo Filial deve ser preenchido!', 2);
          pgctrl_ctaapagar.ActivePage   := ts_lancamentos;
          pgctrl_lancamentos.ActivePage := ts_dados_lanc;
          dbedt_cd_filial.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      ValidCodigo( dbedt_cd_filial );
      if dbedt_cd_filial.Text <> '' then
      begin
        if dbedt_nm_filial.Text = '' then
        begin
          BoxMensagem('Código da Filial inválido!', 2);
          pgctrl_ctaapagar.ActivePage   := ts_lancamentos;
          pgctrl_lancamentos.ActivePage := ts_dados_lanc;
          dbedt_cd_filial.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

    end;

    // Consistências para Distribuição Gerencial
    if qry_ctaapagar_ger_.State in [dsInsert, dsEdit] then
    begin
      // Distribuição Gerencial
      if Not lNaoConsiste then
      begin
        if dbedt_cd_ct_gerencial.Text = '' then
        begin
          BoxMensagem('Campo Código da Conta Gerencial deve ser preenchido!', 2);
          pgctrl_ctaapagar.ActivePage := ts_distr_gerencial;
          dbedt_cd_ct_gerencial.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      // ValidCodigo( dbedt_cd_ct_gerencial );
      if dbedt_cd_ct_gerencial.Text <> '' then
      begin
        if dbedt_nm_ct_gerencial.Text = '' then
        begin
          BoxMensagem('Código da Conta Gerencial inválido!',2);
          pgctrl_ctaapagar.ActivePage := ts_distr_gerencial;
          dbedt_cd_ct_gerencial.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      // Valor
      if Not lNaoConsiste then
      begin
        vl_distr_gerencial := StrToFloat( TiraPic ( dbedt_vl_distr.Text ) );
        if vl_distr_gerencial <= 0 then
        begin
          BoxMensagem('Campo Valor deve ser maior que zero!', 2);
          pgctrl_ctaapagar.ActivePage := ts_distr_gerencial;
          if pnl_distr_gerencial.Enabled then dbedt_vl_distr.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

    // Consistências para Pesquisa
    if pgctrl_ctaapagar.ActivePage = ts_pesq then
    begin
      // Forma de Pagto
      if rdgrp_forma_pagto_pesq.ItemIndex = -1 then rdgrp_forma_pagto_pesq.ItemIndex := 3;

      // Fornecedor (Pesquisa) 
      if msk_cd_forn_pesq.Text <> '' then
      begin
        ValCodEdt( msk_cd_forn_pesq );
        with datm_ctaapagar do
        begin
          qry_favorecido_.Close;
          qry_favorecido_.SQL[2] := 'WHERE CD_FAVORECIDO = "' + msk_cd_forn_pesq.Text + '"';
          qry_favorecido_.Prepare;
          qry_favorecido_.Open;
          if ( qry_favorecido_.Locate('CD_FAVORECIDO', msk_cd_forn_pesq.Text, [loCaseInsensitive]) ) then
          begin
            edt_nm_forn_pesq.Text := qry_favorecido_NM_FAVORECIDO.AsString;
          end
          else
          begin
            BoxMensagem('Fornecedor não cadastrado!', 2);
            msk_cd_forn_pesq.SetFocus;
            Consiste := False;
            Exit;
          end;
          qry_favorecido_.Close;
          qry_favorecido_.SQL[2] := 'WHERE CD_FAVORECIDO <> ""';
          qry_favorecido_.Prepare;
          qry_favorecido_.Open;
        end;
      end
      else
      begin
        edt_nm_forn_pesq.Text := '';
      end;

      // Banco (Pesquisa) 
      if msk_cd_banco_pesq.Text <> '' then
      begin
        ValCodEdt( msk_cd_banco_pesq );
        with datm_ctaapagar do
        begin
          qry_banco_.Close;
          qry_banco_.SQL[2] := 'WHERE CD_BANCO = "' + msk_cd_banco_pesq.Text + '"';
          qry_banco_.Prepare;
          qry_banco_.Open;
          if ( qry_banco_.Locate('CD_BANCO', msk_cd_banco_pesq.Text, [loCaseInsensitive]) ) then
          begin
            edt_nm_banco_pesq.Text := qry_banco_NM_BANCO.AsString;
          end
          else
          begin
            BoxMensagem('Banco não cadastrado!', 2);
            msk_cd_banco_pesq.SetFocus;
            Consiste := False;
            Exit;
          end;
          qry_banco_.Close;
          qry_banco_.SQL[2] := 'WHERE CD_BANCO <> ""';
          qry_banco_.Prepare;
          qry_banco_.Open;
        end;
      end
      else
      begin
        edt_nm_banco_pesq.Text := '';
      end;

      // Conta Contábil (Pesquisa) 
      if msk_cd_ct_contabil_pesq.Text <> '' then
      begin
        ValCodEdt( msk_cd_ct_contabil_pesq );
        with datm_ctaapagar do
        begin
          if str_cd_sistema_contabil = '0' then // RM Saldus
          begin
            qry_ct_contabilRM_.Close;
            qry_ct_contabilRM_.Prepare;
            qry_ct_contabilRM_.Open;
            if ( qry_ct_contabilRM_.Locate('CD_CT_CONTABIL', msk_cd_ct_contabil_pesq.Text, [loCaseInsensitive]) ) then
            begin
              edt_nm_ct_contabil_pesq.Text := qry_ct_contabilRM_NM_CT_CONTABIL.AsString;
            end
            else
            begin
              BoxMensagem('Conta Contábil não cadastrado!', 2);
              msk_cd_ct_contabil_pesq.SetFocus;
              Consiste := False;
              Exit;
            end;
          end
          else
          begin
            qry_ct_contabil_.Close;
            qry_ct_contabil_.Prepare;
            qry_ct_contabil_.Open;
            if ( qry_ct_contabil_.Locate('CD_CT_CONTABIL', msk_cd_ct_contabil_pesq.Text, [loCaseInsensitive]) ) then
            begin
              edt_nm_ct_contabil_pesq.Text := qry_ct_contabil_NM_CT_CONTABIL.AsString;
            end
            else
            begin
              BoxMensagem('Conta Contábil não cadastrado!', 2);
              msk_cd_ct_contabil_pesq.SetFocus;
              Consiste := False;
              Exit;
            end;
          end;
        end;
      end
      else
      begin
        edt_nm_ct_contabil_pesq.Text := '';
      end;
    end;
  end;
end;


procedure Tfrm_ctaapagar.FormShow(Sender: TObject);
begin
  in_imp_cheque                  := False;
  lNaoConsiste                   := False;
  msk_cd_unidade.Text            := str_cd_unid_neg;
  cd_unidade_contas              := '';
  msk_cd_unidadeExit(nil);
  dbnvg.DataSource               := datm_ctaapagar.ds_lista;

  btn_pesq.Visible               := lPesq;
  mi_pesq.Visible                := lPesq;
  ts_pesq.TabVisible             := lPesq;
  if lPesq then
  begin
    btn_pesq.Left                := btn_incluir.Left;
    pgctrl_ctaapagar.ActivePage  := ts_pesq;
  end
  else
  begin
    pgctrl_ctaapagar.ActivePage  := ts_lista;
  end;
  btn_incluir.Visible            := Not lPesq;
  btn_excluir.Visible            := Not lPesq;
  btn_salvar.Visible             := Not lPesq;
  btn_cancelar.Visible           := Not lPesq;
  btn_canc_lanc.Visible          := Not lPesq;
  //btn_contabiliza.Visible        := Not lPesq;
  mi_incluir.Visible             := Not lPesq;
  mi_excluir.Visible             := Not lPesq;
  mi_salvar.Visible              := Not lPesq;
  mi_cancelar.Visible            := Not lPesq;
  mi_canc_lanc.Visible           := Not lPesq;
  pnl_ctaapagar.Enabled          := Not lPesq;
  // pnl_dados_basicos_lanc.Enabled := Not lPesq;
  pnl_distr_gerencial.Enabled    := Not lPesq;
  in_salva                       := 0;
end;


procedure Tfrm_ctaapagar.AbreConta( DataInicio: TDate; DataFim: TDate; Coligada: String );
var
  str_filtro, str_sql, str_vl_inicial, str_vl_final, VerSelec : String;
  Procedure MontaSqlLista;
  Begin
    With datm_ctaapagar Do
    Begin
      qry_lista_.Close;
      qry_lista_.SQL.Clear;
      qry_lista_.SQL.Add( 'SELECT DISTINCT A.CD_UNID_NEG, A.DT_CTAAPAGAR, A.NR_CTAAPAGAR, A.NR_CTAAPAGAR_SELECIONADO, A.NR_TITULO, ' );
      qry_lista_.SQL.Add('( isnull(A.VL_LIQUIDO,0) ) VL_PAGAMENTO,');
      qry_lista_.SQL.Add( ' A.DT_VENCIMENTO, A.DT_PAGAMENTO, F2.AP_FAVORECIDO FAVORECIDO, ' );
      qry_lista_.SQL.Add( ' F.NM_FAVORECIDO NM_FORNECEDOR, F.AP_FAVORECIDO AP_FORNECEDOR, A.IN_CANCELADO, A.IN_DISTRIBUICAO, A.IN_LIBERADO, A.CD_FAVORECIDO, A.TP_PAGAMENTO, A.NR_REF, A.DT_MONTAGEM, A.STATUS, A.IN_LANC_PROVISIONADO, A.CD_BANCO, A.IN_SELECIONADO');
      qry_lista_.SQL.Add( ' FROM TCTAAPAGAR A (NOLOCK) ' );
      qry_lista_.SQL.Add( ' LEFT JOIN TCTAAPAGAR_LANC L (NOLOCK) ON L.DT_CTAAPAGAR = A.DT_CTAAPAGAR AND L.NR_CTAAPAGAR = A.NR_CTAAPAGAR AND A.CD_UNID_NEG = L.CD_UNID_NEG ' );
      qry_lista_.SQL.Add( ' LEFT JOIN TFAVORECIDO F (NOLOCK) ON A.CD_FORNECEDOR = F.CD_FAVORECIDO ' );
      qry_lista_.SQL.Add( ' LEFT JOIN TFAVORECIDO F2 (NOLOCK) ON A.CD_FAVORECIDO = F2.CD_FAVORECIDO ' );
      qry_lista_.SQL.Add( 'WHERE ' );
      qry_lista_.SQL.Add( str_filtro );
      qry_lista_.SQL.Add( 'BETWEEN :DT_INICIO AND :DT_FIM AND A.CD_UNID_NEG = :CD_UNID_NEG AND ' );
      qry_lista_.SQL.Add( str_sql );
      qry_lista_.SQL.Add( 'ORDER BY ' );
      qry_lista_.SQL.Add( a_str_indices[cb_ordem.ItemIndex] );
      qry_lista_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unidade.Text;
      qry_lista_.ParamByName('DT_INICIO').AsDateTime := StrToDate( msk_dt_inicio.Text );
      qry_lista_.ParamByName('DT_FIM').AsDateTime    := StrToDate( msk_dt_fim.Text );
      qry_lista_.Prepare;
      qry_lista_.Open;
    End;
  End;
begin
  if ( msk_dt_inicio.text <> '  /  /    ' ) and ( msk_dt_fim.text <> '  /  /    ' ) then
  begin
    case rdgrp_base.ItemIndex of
      0 : str_filtro := 'A.DT_CTAAPAGAR';
      1 : str_filtro := 'A.DT_VENCIMENTO';
      2 : str_filtro := 'A.DT_PAGAMENTO';
    end;
  end;

  with datm_ctaapagar do
  begin
    if ( qry_ctaapagar_.State      in [dsInsert] ) or
       ( qry_ctaapagar_lanc_.State in [dsInsert] ) or
       ( qry_ctaapagar_ger_.State  in [dsInsert] ) then Exit;

    Screen.Cursor      := crHourGlass;
    Application.ProcessMessages;

    qry_ct_distr_gerencial_.Close;
    qry_ct_distr_gerencial_.ParamByName('CD_COLIGADA').AsString := msk_cd_unidade.Text;
    qry_ct_distr_gerencial_.Prepare;
    qry_ct_distr_gerencial_.Open;

    //verifica permissão odo Cargo para ver tudo ou apenas os selecionados
    VerSelec := ConsultaLookUp('TCARGO', 'CD_CARGO', str_cd_cargo, 'IN_SELECIONADO');
    dbgrd_lista.Columns[1].Visible := (VerSelec = '0');
    dbgrd_lista.Columns[2].Visible := (VerSelec = '1');



    if lPesq then
    begin
      str_sql := '';

      // Fornecedor
      if msk_cd_forn_pesq.Text <> '' then
      begin
        str_sql := 'A.CD_FORNECEDOR = "' + msk_cd_forn_pesq.Text + '"';
      end;

      // Histórico
      if msk_nm_historico_pesq.Text <> '' then
      begin
        if str_sql <> '' then str_sql := str_sql + ' AND ';
        str_sql := str_sql + 'A.NM_HISTORICO LIKE "' + msk_nm_historico_pesq.Text + '%"';
      end;


      if TRIM(msk_pesq_titulo.Text) <> '' then
      begin
        if str_sql <> '' then str_sql := str_sql + ' AND ';
        str_sql := str_sql + 'A.NR_TITULO LIKE "' + msk_pesq_titulo.Text + '%"';
      end;

      // Forma de Pagto
      if rdgrp_forma_pagto_pesq.ItemIndex <> 3 then
      begin
        if str_sql <> '' then str_sql := str_sql + ' AND ';
        case rdgrp_forma_pagto_pesq.ItemIndex of
          0: str_sql := str_sql + 'A.TP_PAGAMENTO = "$"';
          1: str_sql := str_sql + 'A.TP_PAGAMENTO = "C"';
          2: str_sql := str_sql + 'A.TP_PAGAMENTO = "D"';
        end;
      end;

      // Valor Pagamento
      if ( Trim( msk_vl_pagto_pesq_inicial.Text ) <> '' ) or
         ( Trim( msk_vl_pagto_pesq_final.Text ) <> '' ) then
      begin
        if ( Trim( msk_vl_pagto_pesq_inicial.Text ) <> '' ) then
           str_vl_inicial := msk_vl_pagto_pesq_inicial.Text
        else
           str_vl_inicial := '0';

        if ( Trim( msk_vl_pagto_pesq_final.Text ) <> '' )   then
           str_vl_final   := msk_vl_pagto_pesq_final.Text
        else
           str_vl_final   := '0';

        if Pos(',', str_vl_inicial) > 0 then str_vl_inicial[Pos(',', str_vl_inicial)] := '.';
        if Pos(',', str_vl_final) > 0   then str_vl_final[Pos(',', str_vl_final)] := '.';

        if str_sql <> '' then str_sql := str_sql + ' AND ';
        if str_vl_final = '0' then
         // str_sql := str_sql + 'ROUND( A.VL_DESPESA + A.VL_ACRESCIMO - A.VL_DESCONTO - A.VL_IR - A.VL_INSS, 2 ) >= '
         //                    + str_vl_inicial
         str_sql := str_sql + ' A.VL_DESPESA  >= ' + str_vl_inicial
        else
          //str_sql := str_sql + 'ROUND( A.VL_DESPESA + A.VL_ACRESCIMO - A.VL_DESCONTO - A.VL_IR - A.VL_INSS, 2 ) BETWEEN ' +
          //                     str_vl_inicial + ' AND ' + str_vl_final;
          str_sql := str_sql + ' A.VL_DESPESA BETWEEN ' + str_vl_inicial + ' AND ' + str_vl_final;

      end;

      // Banco
      if msk_cd_banco_pesq.Text <> '' then
      begin
        if str_sql <> '' then str_sql := str_sql + ' AND ';
        str_sql := str_sql + 'A.CD_BANCO = "' + msk_cd_banco_pesq.Text + '"';
      end;

      // Cheque
      if msk_nr_cheque_pesq.Text <> '' then
      begin
        if str_sql <> '' then str_sql := str_sql + ' AND ';
        str_sql := str_sql + 'A.NR_CHEQUE = "' + msk_nr_cheque_pesq.Text + '"';
      end;

      // Conta Contábil
      if msk_cd_ct_contabil_pesq.Text <> '' then
      begin
        if str_sql <> '' then str_sql := str_sql + ' AND ';
        str_sql := str_sql + 'L.CD_CT_CONTABIL = "' + msk_cd_ct_contabil_pesq.Text + '"';
      end;

      if VerSelec = '1' then begin
        if str_sql <> '' then str_sql := str_sql + ' AND ';
        str_sql := str_sql + 'ISNULL(IN_SELECIONADO, "0") = "1" ';
      end;

      if str_sql = '' then str_sql := 'A.NR_CTAAPAGAR <> ""';



      MontaSqlLista;
    end
    else
    begin

      // Fornecedor
      if MaskEdit8.Text <> '' then
      begin
        str_sql := 'A.CD_FORNECEDOR = "' + MaskEdit8.Text + '"';
      end;

      if TRIM(MaskEdit7.Text) <> '' then
      begin
        if str_sql <> '' then str_sql := str_sql + ' AND ';
        str_sql := str_sql + 'A.NR_TITULO LIKE "' + MaskEdit7.Text + '%"';
      end;

      if VerSelec = '1' then begin
        if str_sql <> '' then str_sql := str_sql + ' AND ';
        str_sql := str_sql + 'ISNULL(IN_SELECIONADO, "0") = "1" ';
      end;

      if str_sql <> '' then str_sql := str_sql + ' AND ';

      qry_lista_.Close;
      qry_lista_.SQL.Clear;
      qry_lista_.SQL.Add('SELECT A.CD_UNID_NEG, A.DT_CTAAPAGAR, A.NR_CTAAPAGAR, A.NR_CTAAPAGAR_SELECIONADO, A.NR_TITULO,');
      qry_lista_.SQL.Add('( isnull(A.VL_LIQUIDO,0) ) ');
      qry_lista_.SQL.Add('VL_PAGAMENTO, A.DT_VENCIMENTO, A.DT_PAGAMENTO,');
      qry_lista_.SQL.Add('F.AP_FAVORECIDO AP_FORNECEDOR, F2.AP_FAVORECIDO FAVORECIDO, A.IN_CANCELADO, A.IN_DISTRIBUICAO, A.IN_LIBERADO, A.CD_FAVORECIDO, A.TP_PAGAMENTO, A.NR_REF, A.DT_MONTAGEM, A.STATUS, A.IN_LANC_PROVISIONADO, A.CD_BANCO, A.IN_SELECIONADO');
      qry_lista_.SQL.Add('FROM TCTAAPAGAR A (NOLOCK),');
      qry_lista_.SQL.Add('TFAVORECIDO F, TFAVORECIDO F2');
      qry_lista_.SQL.Add('WHERE ');
      if str_filtro <> '' then
        qry_lista_.SQL.Add( str_filtro + ' BETWEEN :DT_INICIO AND :DT_FIM AND');
      qry_lista_.SQL.Add( str_sql );
      if msk_cd_unidade.Text <> '' then
        qry_lista_.SQL.Add('A.CD_UNID_NEG = :CD_UNID_NEG AND');
      qry_lista_.SQL.Add('A.CD_FORNECEDOR *= F.CD_FAVORECIDO and A.CD_FAVORECIDO *= F2.CD_FAVORECIDO');
      qry_lista_.SQL.Add('ORDER BY');
      qry_lista_.SQL.Add( a_str_indices[cb_ordem.ItemIndex] );
      if msk_cd_unidade.Text <> '' then
        qry_lista_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unidade.Text;
      if str_filtro <> '' then
      begin
        qry_lista_.ParamByName('DT_INICIO').AsDateTime := StrToDate( msk_dt_inicio.Text );
        qry_lista_.ParamByName('DT_FIM').AsDateTime    := StrToDate( msk_dt_fim.Text );
      end;
      qry_lista_.Prepare;
      qry_lista_.Open;

      (* qry_lista_.Close;
      qry_lista_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unidade.Text;
      qry_lista_.ParamByName('DT_INICIO').AsDate     := StrToDate( msk_dt_inicio.Text );
      qry_lista_.ParamByName('DT_FIM').AsDate        := StrToDate( msk_dt_fim.Text );
      qry_lista_.Prepare;
      qry_lista_.Open; *)

      // MontaSqlLista;
    end;

    Screen.Cursor      := crDefault;
    Application.ProcessMessages;
  end;
end;


procedure Tfrm_ctaapagar.btn_incluirClick(Sender: TObject);
begin
  // Distribuição Gerencial
  if ( pgctrl_ctaapagar.ActivePage = ts_distr_gerencial ) then
  begin
    with datm_ctaapagar do
    begin
      if qry_ctaapagar_IN_LIBERADO.AsString = '1' THEN
       begin
        BoxMensagem('Este Lançamento já liberado!Proibido alteração.',2);
        exit;
       end;
      qry_ct_distr_gerencial_.Close;
      qry_ct_distr_gerencial_.ParamByName('CD_COLIGADA').AsString := msk_cd_unidade.Text;
      qry_ct_distr_gerencial_.Prepare;
      qry_ct_distr_gerencial_.Open;
      ts_distr_gerencial.TabVisible             := True;
      pgctrl_ctaapagar.ActivePage               := ts_distr_gerencial;
      qry_ctaapagar_ger_.DisableControls;
      qry_ctaapagar_ger_.Cancel;
      qry_ctaapagar_ger_.Append;
      qry_ctaapagar_ger_.EnableControls;
      qry_ctaapagar_ger_CD_UNID_NEG.AsString    := qry_ctaapagar_CD_UNID_NEG.AsString;
      qry_ctaapagar_ger_DT_CTAAPAGAR.AsDateTime := qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
      qry_ctaapagar_ger_NR_CTAAPAGAR.AsString   := qry_ctaapagar_NR_CTAAPAGAR.AsString;
      qry_ctaapagar_ger_CD_CT_CONTABIL.AsString := qry_ctaapagar_lanc_CD_CT_CONTABIL.AsString;
      qry_ctaapagar_ger_CD_FILIAL.AsString      := qry_ctaapagar_lanc_CD_FILIAL.AsString;
      qry_ctaapagar_ger_CD_CT_CUSTO.AsString    := qry_ctaapagar_lanc_CD_CT_CUSTO.AsString;
      qry_ctaapagar_ger_VL_LANCAMENTO.AsFloat   := 0;
      qry_ctaapagar_ger_CD_CT_CONTABIL.AsString := 'Financeiro';
    end;
    linsere_distr_ger                           := True;
    pnl_distr_gerencial.Enabled                 := Not lPesq;
    dbedt_cd_ct_gerencial.SetFocus;
    linsere_distr_ger                           := False;
  end;

  // Lançamentos
  if ( pgctrl_ctaapagar.ActivePage = ts_lancamentos ) then
  begin
    with datm_ctaapagar do
    begin
      if qry_ctaapagar_IN_LIBERADO.AsString = '1' THEN
      begin
        BoxMensagem('Este Lançamento já liberado!Proibido alteração.',2);
        exit;
      end;
      // 22/11/2006
      AtualizaValDisp;
      If StrToFloat( TiraPic ( EditValDisponivel.Text ) ) > 0 then
      Begin
        btn_mi(false,true, true, false);
        qry_unid_neg_.Close;
        qry_unid_neg_.Prepare;
        qry_unid_neg_.Open;
        pgctrl_lancamentos.ActivePage              := ts_dados_lanc;
        qry_ctaapagar_lanc_.DisableControls;
        qry_ctaapagar_lanc_.Cancel;
        qry_ctaapagar_lanc_.Append;
        qry_ctaapagar_lanc_.EnableControls;
        qry_ctaapagar_lanc_CD_UNID_NEG.AsString    := qry_ctaapagar_CD_UNID_NEG.AsString;
        qry_ctaapagar_lanc_DT_CTAAPAGAR.AsDateTime := qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
        qry_ctaapagar_lanc_NR_CTAAPAGAR.AsString   := qry_ctaapagar_NR_CTAAPAGAR.AsString;
        qry_ctaapagar_lanc_CD_RATEIO.AsString      := ConsultaLookUP('TFAVORECIDO_CONTAS','CD_FAVORECIDO',qry_ctaapagar_CD_FAVORECIDO.AsString,'CD_RATEIO');
        qry_ctaapagar_lanc_VL_LANCAMENTO.AsFloat   := 0;
      end
      else
      begin
        BoxMensagem( 'Não há mais saldo disponível !', 3 );
        exit;
      end;
    end;
    pnl_ctaapagar_lanc.Enabled                   := True;
    dbedt_cd_ct_contabil.SetFocus;
  end;

  // Contas
  if ( pgctrl_ctaapagar.ActivePage = ts_dados_basicos ) or
     ( pgctrl_ctaapagar.ActivePage = ts_lista ) then
  begin
    with datm_ctaapagar do
    begin
      if Not( ( dt_server >= StrToDate( msk_dt_inicio.Text ) ) and
              ( dt_server <= StrToDate( msk_dt_fim.Text ) ) ) then
      begin
        BoxMensagem( 'Período não considera a data atual!', 2 );
        btn_incluir.Enabled := st_incluir;
        mi_incluir.Enabled  := st_incluir;
        msk_dt_inicio.Text;
        Exit;
      end;

      pgctrl_ctaapagar.ActivePage             := ts_dados_basicos;
      if Not qry_ctaapagar_.Active then
      begin
        qry_ctaapagar_.Prepare;
        qry_ctaapagar_.Open;
      end;
      btn_mi(false,true, true, false);
      qry_ctaapagar_.Cancel;
      qry_ctaapagar_.Append;
      qry_ctaapagar_CD_UNID_NEG.AsString      := msk_cd_unidade.Text;
      qry_ctaapagar_DT_CTAAPAGAR.AsDateTime   := dt_server;
      qry_ctaapagar_NR_CTAAPAGAR.AsString     := '***';
      qry_ctaapagar_CD_FORNECEDOR.AsString    := '';
      qry_ctaapagar_TP_PAGAMENTO.AsString     := '$';
      qry_ctaapagar_IN_DISTRIBUICAO.AsString  := '0';
      qry_ctaapagar_IN_TRANSFERIDO.AsString   := '0';
      qry_ctaapagar_IN_LIBERADO.AsString      := '0';
      qry_ctaapagar_IN_CANCELADO.AsString     := '0';
      qry_ctaapagar_IN_CONTABILIZADO.AsString := '0';
      qry_ctaapagar_TP_CD_BARRAS.AsString     := '0';
      qry_ctaapagar_IN_PISCOFINS.AsString     := '0';
      qry_ctaapagar_VL_DESPESA.AsFloat        := 0;
      qry_ctaapagar_VL_ACRESCIMO.AsFloat      := 0;
      qry_ctaapagar_VL_DESCONTO.AsFloat       := 0;
      qry_ctaapagar_VL_INSS.AsFloat           := 0;
      qry_ctaapagar_VL_IR.AsFloat             := 0;
      qry_ctaapagar_CD_USUARIO.AsString       := str_cd_usuario;
      qry_ctaapagar_CD_USUARIO_GER.AsString   := str_cd_usuario;
      qry_ctaapagar_CD_COLIGADA.AsString      := '01';
      qry_ctaapagar_STATUS.AsString           := '0';
      qry_ctaapagar_IN_LANC_PROVISIONADO.AsString := '1';
      dbedt_cd_usuario_gerExit(nil);
      msk_qtde.Enabled                        := True;
      msk_qtde.Color                          := clWindow;
      msk_qtde.Text                           := '1';
      PnlDados.Enabled               := (datm_ctaapagar.qry_ctaapagar_.state in [dsInsert,dsEdit]) or ( datm_ctaapagar.qry_lista_.FieldByName('DT_MONTAGEM').AsDateTime = 0 );
      pnl_dados_basicos_lanc.Enabled := (datm_ctaapagar.qry_ctaapagar_.state in [dsInsert,dsEdit]) or ( datm_ctaapagar.qry_lista_.FieldByName('DT_MONTAGEM').AsDateTime = 0 );
    end;
    lbl_cancelado.Visible                     := False;
    lbl_liberado.Visible                      := False;
    pnl_ctaapagar.Enabled                     := Not lPesq;
    dbedt_nr_titulo.SetFocus;
  end;
end;


function Tfrm_ctaapagar.Grava : Boolean;
var
  insere_distr_gerencial, FlagInsert : Boolean;
  nr_identificador : Integer;
  vValorLanc       : Real;
  PrimNrCtaaPagar, vContaContabil, vCentroCusto, vCdRateio : String;
  vUnicaConta      : Integer;

  procedure CriaLancamentos(const pNR_LANCAMENTO : string);
  var
    FlagLancExiste : Boolean;
  begin
    vUnicaConta := 0;
    datm_ctaapagar.SqlContasFornecedor.Close;
    datm_ctaapagar.SqlContasFornecedor.ParamByName('CD_FAVORECIDO').AsString := datm_ctaapagar.qry_ctaapagar_CD_FORNECEDOR.AsString;
    datm_ctaapagar.SqlContasFornecedor.Open;

    vCdRateio := datm_ctaapagar.SqlContasFornecedor.FieldByName('CD_RATEIO').AsString;

    if datm_ctaapagar.SqlContasFornecedor.RecordCount < 2 then
      //vValorLanc := datm_ctaapagar.qry_ctaapagar_CalcPagamento.AsFloat;  //Alterado em 03/03/2008 por Rodrigo Capra - Rateio terá que ser feito pelo Valor Bruto
      vValorLanc := datm_ctaapagar.qry_ctaapagar_VL_DESPESA.AsFloat;

    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      Close;
      if datm_ctaapagar.qry_ctaapagar_CD_FORNECEDOR.AsString <> Str_Cd_FornAnterior then
      begin
        //apaga se o fornecedor for diferente do que já foi escolhido
        Close;
        SQl.Clear;
        SQL.Add('DELETE FROM TCTAAPAGAR_LANC');
        SQL.Add('WHERE DT_CTAAPAGAR =:DT_CTAAPAGAR and');
        SQL.Add('NR_CTAAPAGAR =:NR_CTAAPAGAR');
        SQL.Add(' and CD_UNID_NEG =:CD_UNID_NEG');
        ParamByName('DT_CTAAPAGAR').AsDateTime := datm_ctaapagar.qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
        ParamByName('NR_CTAAPAGAR').AsString   := pNR_LANCAMENTO;
        ParamByName('CD_UNID_NEG').AsString   := msk_cd_unidade.text;
        ExecSql;
        FlagLancExiste := False;
      end
      else
        FlagLancExiste := True;
      Free;
    end;
    if not FlagLancExiste then
    begin
      while not datm_ctaapagar.SqlContasFornecedor.Eof do
      begin
        with TQuery.Create(Application) do
        begin
          DatabaseName := 'DBBROKER';
          Close;
          SQl.Clear;
          SQL.Add('SELECT VL_LANCAMENTO FROM TCTAAPAGAR_LANC');
          SQL.Add('where');
          SQL.Add('DT_CTAAPAGAR =:DT_CTAAPAGAR and NR_CTAAPAGAR =:NR_CTAAPAGAR and CD_CT_CONTABIL =:CD_CT_CONTABIL');
          SQL.Add(' and CD_UNID_NEG = :CD_UNID_NEG');
          ParamByName('DT_CTAAPAGAR').AsDateTime := datm_ctaapagar.qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
          ParamByName('NR_CTAAPAGAR').AsString   := datm_ctaapagar.qry_ctaapagar_NR_CTAAPAGAR.AsString;
          ParamByName('CD_CT_CONTABIL').AsString := datm_ctaapagar.SqlContasFornecedor.FieldByName('CD_CT_CONTABIL').AsString;
          ParamByName('CD_UNID_NEG').AsString    := datm_ctaapagar.qry_ctaapagar_CD_UNID_NEG.AsString;
          Open;
          if not IsEmpty then
            vValorLanc := FieldByName('VL_LANCAMENTO').AsFloat;

          Close;
          SQl.Clear;
          SQL.Add('INSERT INTO TCTAAPAGAR_LANC');
          SQL.Add('(DT_CTAAPAGAR, NR_CTAAPAGAR, CD_UNID_NEG, VL_LANCAMENTO, CD_FILIAL, CD_CT_CONTABIL,CD_CT_CUSTO, CD_RATEIO)');
          SQL.Add('values');
          SQL.Add('(:DT_CTAAPAGAR,:nr_ctaapagar, :cd_unid_neg, :VALOR, :cd_unid_neg, :CD_CT_CONTABIL,:CD_CT_CUSTO, :CD_RATEIO)');
          ParamByName('DT_CTAAPAGAR').AsDateTime := datm_ctaapagar.qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
          ParamByName('NR_CTAAPAGAR').AsString   := pNR_LANCAMENTO;
          ParamByName('VALOR').AsFloat           := vValorLanc;
          ParamByName('CD_UNID_NEG').AsString    := datm_ctaapagar.qry_ctaapagar_CD_UNID_NEG.AsString;
          ParamByName('CD_CT_CONTABIL').AsString := datm_ctaapagar.SqlContasFornecedor.FieldByName('CD_CT_CONTABIL').AsString;
          ParamByName('CD_CT_CUSTO').AsString    := IIF(vCentroCusto <> '',vCentroCusto, '');

          if datm_ctaapagar.SqlContasFornecedor.FieldByName('CD_RATEIO').AsString = '' then //se o rateio estiver vazio, então vai pegar o rateio que está vinculado a conta contabil
          begin
            vCdRateio :=  ConsultaLookUP('TCT_CONTABIL','CD_CT_CONTABIL',datm_ctaapagar.SqlContasFornecedor.FieldByName('CD_CT_CONTABIL').AsString,'CD_RATEIO');
            ParamByName('CD_RATEIO').AsString := vCdRateio;
          end
          else
          begin
            ParamByName('CD_RATEIO').AsString := datm_ctaapagar.SqlContasFornecedor.FieldByName('CD_RATEIO').AsString;
            vCdRateio                         := datm_ctaapagar.SqlContasFornecedor.FieldByName('CD_RATEIO').AsString;
          end;
          ExecSql;

          GeraRateio( datm_ctaapagar.qry_ctaapagar_DT_CTAAPAGAR.AsDateTime, pNR_LANCAMENTO,
                      datm_ctaapagar.qry_ctaapagar_CD_UNID_NEG.AsString, vCdRateio, vValorLanc);

          vUnicaConta := vUnicaConta + 1;
        end;
        datm_ctaapagar.SqlContasFornecedor.Next;
      end;  //while

      if datm_ctaapagar.qry_ctaapagar_CD_FORNECEDOR.AsString = '' then
      begin
        with TQuery.Create(Application) do
        begin
          DatabaseName := 'DBBROKER';
          Close;
          SQl.Clear;
          SQL.Add('INSERT INTO TCTAAPAGAR_LANC');
          SQL.Add('(DT_CTAAPAGAR, NR_CTAAPAGAR, CD_UNID_NEG, VL_LANCAMENTO, CD_FILIAL, CD_CT_CONTABIL,CD_CT_CUSTO, CD_RATEIO)');
          SQL.Add('values');
          SQL.Add('(:DT_CTAAPAGAR,:nr_ctaapagar, :cd_unid_neg, :VALOR, :cd_unid_neg, :CD_CT_CONTABIL, :CD_CT_CUSTO, :CD_RATEIO)');
          ParamByName('DT_CTAAPAGAR').AsDateTime := datm_ctaapagar.qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
          ParamByName('nr_ctaapagar').AsString   := pNR_LANCAMENTO;
          ParamByName('VALOR').AsFloat           := vValorLanc;
          ParamByName('CD_UNID_NEG').AsString    := datm_ctaapagar.qry_ctaapagar_CD_UNID_NEG.AsString;
          if vContaContabil <> '' then
          begin
            ParamByName('CD_CT_CONTABIL').AsString := vContaContabil;
            ParamByName('CD_RATEIO').AsString      := ConsultaLookUP('TCT_CONTABIL','CD_CT_CONTABIL',datm_ctaapagar.SqlContasFornecedor.FieldByName('CD_CT_CONTABIL').AsString,'CD_RATEIO');
          end
          else
          begin
            ParamByName('CD_CT_CONTABIL').AsString := '0';
            ParamByName('CD_RATEIO').AsString      := '';
          end;
          ParamByName('CD_CT_CUSTO').AsString    := vCentroCusto;
          ExecSql;
          ////
        end;
      end;
    End;
  End;
begin
  Grava := False;

  // Fornecedor e Favorecido devem estar preenchidos
  if ( dbedt_cd_fornecedor.Text = '' ) and ( datm_ctaapagar.qry_ctaapagar_IN_LANC_PROVISIONADO.AsString = '1' ) then
  begin
    BoxMensagem('O Fornecedor deve ser informado!',2);
    pgctrl_ctaapagar.ActivePage := ts_dados_basicos;
    dbedt_cd_fornecedor.SetFocus;
    Grava := False;
    Exit;
  end;
  if dbedt_cd_favorecido.Text = '' then
  begin
    BoxMensagem('O Favorecido deve ser informado!',2);
    pgctrl_ctaapagar.ActivePage := ts_dados_basicos;
    dbedt_cd_favorecido.SetFocus;
    Grava := False;
    Exit;
  end;

  // Verifica se fornecedor é pessoa jurídica
  if ( datm_ctaapagar.qry_ctaapagar_TP_PAGAMENTO.AsString = 'D' ) OR ( datm_ctaapagar.qry_ctaapagar_TP_PAGAMENTO.AsString = 'T' ) then
  begin
    with datm_ctaapagar do
    begin
      qry_fav_.Close;
      qry_fav_.Prepare;
      qry_fav_.Open;
      if ( qry_fav_CD_TIPO_PESSOA.AsString = '1' ) and
         ( qry_fav_CGC_EMPRESA.AsString = '' ) then
      begin
        BoxMensagem('O Fornecedor é pessoa jurídica mas o CNPJ não foi informado!',2);
        pgctrl_ctaapagar.ActivePage :=  ts_dados_basicos;
        dbedt_cd_fornecedor.SetFocus;
        Grava := False;
        Exit;
      end;
      if ( qry_fav_CD_TIPO_PESSOA.AsString = '2' ) and
         ( qry_fav_CPF_EMPRESA.AsString = '' ) then
      begin
        BoxMensagem('O Fornecedor é pessoa física mas o CPF não foi informado!',2);
        pgctrl_ctaapagar.ActivePage := ts_dados_basicos;
        dbedt_cd_fornecedor.SetFocus;
        Grava := False;
        Exit;
      end;
    end;
  end;

  with datm_ctaapagar do
  begin
    if qry_ctaapagar_ger_.State in [dsInsert, dsEdit] then
    begin
      try
        datm_main.db_broker.StartTransaction;
        if qry_ctaapagar_lanc_.State in [dsEdit] then qry_ctaapagar_lanc_.Post;

        dt_ctaapagar    := qry_ctaapagar_ger_DT_CTAAPAGAR.AsDateTime;
        cd_ct_contabil  := qry_ctaapagar_ger_CD_CT_CONTABIL.AsString;
        cd_ct_gerencial := qry_ctaapagar_ger_CD_CT_GERENCIAL.AsString;
        nr_ctaapagar    := qry_ctaapagar_ger_NR_CTAAPAGAR.AsString;
        cd_filial       := qry_ctaapagar_ger_CD_FILIAL.AsString;
        cd_ct_custo     := qry_ctaapagar_ger_CD_CT_CUSTO.AsString;
        qry_ctaapagar_ger_.Post;

        VerDistribuicao;

        datm_main.db_broker.Commit;
        Grava := True;

        AbreConta( StrToDateDef( msk_dt_inicio.Text,0 ) , StrToDatedef( msk_dt_fim.Text,0 ), msk_cd_unidade.Text );

        qry_lista_.Locate('CD_UNID_NEG;DT_CTAAPAGAR;NR_CTAAPAGAR',
           VarArrayOf([msk_cd_unidade.Text, dt_ctaapagar, nr_ctaapagar]), [loCaseInsensitive,loPartialKey]);

        qry_ctaapagar_lanc_.Locate('CD_UNID_NEG;DT_CTAAPAGAR;NR_CTAAPAGAR;CD_CT_CONTABIL;CD_FILIAL',
           VarArrayOf([msk_cd_unidade.Text, dt_ctaapagar, nr_ctaapagar, cd_ct_contabil, cd_filial]), [loCaseInsensitive,loPartialKey]);

        qry_ctaapagar_ger_.Locate('CD_UNID_NEG;DT_CTAAPAGAR;NR_CTAAPAGAR;CD_CT_CONTABIL;CD_FILIAL;CD_CT_CUSTO;CD_CT_GERENCIAL',
           VarArrayOf([msk_cd_unidade.Text, dt_ctaapagar, nr_ctaapagar, cd_ct_contabil, cd_filial, cd_ct_custo, cd_ct_gerencial]), [loCaseInsensitive,loPartialKey]);

      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
          qry_ctaapagar_ger_.Cancel;
          Grava := False;
        end;
      end;
    end;

    if qry_ctaapagar_lanc_.State in [dsInsert, dsEdit] then
    begin
      try
        if qry_ctaapagar_lanc_.State = dsInsert then
          FlagInsert := True;  //Guarda que está em inserção pois ao salvar, sai do estado de insert

        datm_main.db_broker.StartTransaction;
        insere_distr_gerencial := False;

        dt_ctaapagar   := qry_ctaapagar_lanc_DT_CTAAPAGAR.AsDateTime;
        cd_ct_contabil := qry_ctaapagar_lanc_CD_CT_CONTABIL.AsString;
        nr_ctaapagar   := qry_ctaapagar_lanc_NR_CTAAPAGAR.AsString;
        cd_filial      := qry_ctaapagar_lanc_CD_FILIAL.AsString;
        // datm_ctaapagar.qry_ctaapagar_lanc_CD_unid_neg.AsString;
        qry_ctaapagar_lanc_.Post;


{        //Abre query que tem o Fornecedor com sua respectivo Codigo de Rateio
        datm_ctaapagar.SqlContasFornecedor.Close;
        datm_ctaapagar.SqlContasFornecedor.ParamByName('CD_FAVORECIDO').AsString := datm_ctaapagar.qry_ctaapagar_CD_FORNECEDOR.AsString;
        datm_ctaapagar.SqlContasFornecedor.Open;

        //Pega o código do rateio para ser utilizado na geração dos rateios
        vCdRateio := datm_ctaapagar.SqlContasFornecedor.FieldByName('CD_RATEIO').AsString;
        ConsultaLookUP('TCT_CONTABIL','CD_CT_CONTABIL', cd_ct_contabil, 'CD_RATEIO');
        if vCdRateio = '' then //se o rateio estiver vazio, então vai pegar o rateio que está vinculado a conta contabil
          vCdRateio :=  ConsultaLookUP('TCT_CONTABIL','CD_CT_CONTABIL', cd_ct_contabil, 'CD_RATEIO');}

        vCdRateio := datm_ctaapagar.qry_ctaapagar_lanc_CD_RATEIO.AsString;

        if vCdRateio <> '' then
        begin
          if FlagInsert then  //se for inclusão, efetuar os rateios
          begin
            GeraRateio( dt_ctaapagar, nr_ctaapagar, datm_ctaapagar.qry_ctaapagar_CD_UNID_NEG.AsString,
                        datm_ctaapagar.qry_ctaapagar_lanc_CD_RATEIO.AsString,
                        qry_ctaapagar_lanc_VL_LANCAMENTO.AsFloat, 0);
          end
          else
            GeraRateio( dt_ctaapagar, nr_ctaapagar, datm_ctaapagar.qry_ctaapagar_CD_UNID_NEG.AsString,
                        vCdRateio,
                        qry_ctaapagar_lanc_VL_LANCAMENTO.AsFloat, qry_ctaapagar_lanc_CODIGO.AsInteger);
        end
        else  //se o código do rateio estiver vazio então apagar os rateios já gravados anteriormente
        begin
          datm_ctaapagar.qry_ctaapagar_rateio.First;
          while not datm_ctaapagar.qry_ctaapagar_rateio.Eof do
          begin
            datm_ctaapagar.qry_ctaapagar_rateio.Delete;
            Next;
          end;
        end;

        // Inserir Distribuição Gerencial Automática
        if insere_distr_gerencial then
        begin
          qry_ctaapagar_ger_.Close;
          CloseStoredProc(sp_atz_distr_ger_ctaapagar);
          sp_atz_distr_ger_ctaapagar.ParamByName('@CD_UNID_NEG').AsString    :=
            qry_ctaapagar_lanc_CD_UNID_NEG.AsString;
          sp_atz_distr_ger_ctaapagar.ParamByName('@DT_CTAAPAGAR').AsDateTime :=
            qry_ctaapagar_lanc_DT_CTAAPAGAR.AsDateTime;
          sp_atz_distr_ger_ctaapagar.ParamByName('@NR_CTAAPAGAR').AsString   :=
            qry_ctaapagar_lanc_NR_CTAAPAGAR.AsString;
          sp_atz_distr_ger_ctaapagar.ParamByName('@CD_CT_CONTABIL').AsString :=
            qry_ctaapagar_lanc_CD_CT_CONTABIL.AsString;
          sp_atz_distr_ger_ctaapagar.ParamByName('@CD_FILIAL').AsString :=
            qry_ctaapagar_lanc_CD_FILIAL.AsString;
          sp_atz_distr_ger_ctaapagar.ParamByName('@CD_CT_CUSTO').AsString :=
            qry_ctaapagar_lanc_CD_CT_CUSTO.AsString;
          ExecStoredProc(sp_atz_distr_ger_ctaapagar);
          CloseStoredProc(sp_atz_distr_ger_ctaapagar);
        end;
        VerDistribuicao;
        datm_main.db_broker.Commit;
        Grava := True;

        Salvando := True;

        AbreConta( StrToDateDef( msk_dt_inicio.Text,0 ) , StrToDateDef( msk_dt_fim.Text,0 ), msk_cd_unidade.Text );

        qry_lista_.Locate('CD_UNID_NEG;DT_CTAAPAGAR;NR_CTAAPAGAR',
           VarArrayOf([msk_cd_unidade.Text, dt_ctaapagar, nr_ctaapagar]), [loCaseInsensitive,loPartialKey]);

        qry_ctaapagar_lanc_.Locate('CD_UNID_NEG;DT_CTAAPAGAR;NR_CTAAPAGAR;CD_CT_CONTABIL;CD_FILIAL',
           VarArrayOf([msk_cd_unidade.Text, dt_ctaapagar, nr_ctaapagar, cd_ct_contabil, cd_filial]), [loCaseInsensitive,loPartialKey]);

        AtualizaValDisp;
        Salvando := False;
        btn_mi(st_incluir, false, false, st_excluir);

      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          qry_ctaapagar_lanc_.Cancel;
          Grava := False;
          TrataErro(E);
        end;
      end;
    end;

    nr_identificador := 0;
    if qry_ctaapagar_.State in [dsInsert, dsEdit] then
    begin
      try
        datm_main.db_broker.StartTransaction;

        // Gravando o campo IN_OPERACIONAL
        if qry_ctaapagar_.State in [dsInsert] then
        begin
          in_salva := 1;
          qry_ctaapagar_IN_OPERACIONAL.AsString := '0';
          // Coloca IN_DISTRIBUICAO como padrão 1
          qry_ctaapagar_IN_DISTRIBUICAO.AsString := '1';
        end;

        try
          qry_ctaapagar_.Post;
        except
          on e:exception do
            showmessage(e.message);
        end;

        dt_ctaapagar    := qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
        nr_ctaapagar    := qry_ctaapagar_NR_CTAAPAGAR.AsString;
        PrimNrCtaaPagar := nr_ctaapagar;
        CriaLancamentos(nr_ctaapagar);  //cria os lançamentos referente ao Favorecido

        (* if vUnicaConta = 1 then
        begin
          if Not ( datm_ctaapagar.qry_ctaapagar_.State in [dsEdit] ) then
          begin
            datm_ctaapagar.qry_ctaapagar_.Edit;
            datm_ctaapagar.qry_ctaapagar_IN_DISTRIBUICAO.AsString := '1';
            datm_ctaapagar.qry_ctaapagar_.Post;
          end;
        end; *)

        AbreConta( StrToDatedef( msk_dt_inicio.Text,0 ), StrToDateDef( msk_dt_fim.Text,0 ), msk_cd_unidade.Text );
        qry_lista_.Locate('CD_UNID_NEG;DT_CTAAPAGAR;NR_CTAAPAGAR',
           VarArrayOf([msk_cd_unidade.Text,dt_ctaapagar,nr_ctaapagar]), [loCaseInsensitive]);

        if Trim( msk_qtde.Text ) = '' then msk_qtde.Text := '1';

        if StrToInt( Trim( msk_qtde.Text ) ) > 1 then
        begin
          nr_ctaapagar := StrZero( StrToInt( qry_ctaapagar_NR_CTAAPAGAR.AsString ) +
                          StrToInt( Trim( msk_qtde.Text ) ) - 1 , 3 );

          // Cria Vencimentos
          CloseStoredProc( sp_cria_ctaapagar );

          sp_cria_ctaapagar.ParamByName( '@CD_UNID_NEG' ).AsString   := qry_ctaapagar_CD_UNID_NEG.AsString;
          sp_cria_ctaapagar.ParamByName( '@NR_CTAAPAGAR' ).AsString  := qry_ctaapagar_NR_CTAAPAGAR.AsString;
          sp_cria_ctaapagar.ParamByName( '@DT_CTAAPAGAR').AsDateTime := qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
          sp_cria_ctaapagar.ParamByName( '@QTDE' ).AsInteger         := StrToInt( Trim( msk_qtde.Text ) );

          ExecStoredProc( sp_cria_ctaapagar );

          nr_identificador := sp_cria_ctaapagar.ParamByName( '@NR_IDENTIFICADOR' ).AsInteger;

          CloseStoredProc( sp_cria_ctaapagar );
        end;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          qry_ctaapagar_.Cancel;
          Grava := False;
          TrataErro(E);
          Exit;
        end;
      end;

      // Abre Form para Edição das Datas de Vencimento
      Application.CreateForm( Tdatm_ctaapagar_vencto,datm_ctaapagar_vencto );
      Application.CreateForm( Tfrm_ctaapagar_vencto, frm_ctaapagar_vencto);
      if StrToInt(msk_qtde.text) > 1 then
      begin
        datm_ctaapagar_vencto.qry_ctaapagar_vencto_.Close;
        datm_ctaapagar_vencto.qry_ctaapagar_vencto_.ParamByName( 'NR_IDENTIFICADOR' ).AsInteger := nr_identificador;
        datm_ctaapagar_vencto.qry_ctaapagar_vencto_.ParamByName( 'CD_USUARIO' ).AsString        := str_cd_usuario;
        datm_ctaapagar_vencto.qry_ctaapagar_vencto_.Open;

        if (StrToInt( Trim( msk_qtde.Text ) ) > 1)  and (nr_identificador <> 0)then
        begin
          try
            datm_main.db_broker.StartTransaction;
            qry_ctaapagar_vencto_.Close;
            qry_ctaapagar_vencto_.ParamByName( 'NR_IDENTIFICADOR' ).AsInteger := nr_identificador;
            qry_ctaapagar_vencto_.ParamByName( 'CD_USUARIO' ).AsString        := str_cd_usuario;
            qry_ctaapagar_vencto_.Prepare;
            qry_ctaapagar_vencto_.Open;

            qry_ctaapagar_vencto_.First;
            while not qry_ctaapagar_vencto_.EOF do
            begin
              qry_upd_ctaapagar_.Close;
              qry_upd_ctaapagar_.ParamByName( 'CD_UNID_NEG' ).AsString     := qry_ctaapagar_CD_UNID_NEG.AsString;
              qry_upd_ctaapagar_.ParamByName( 'DT_CTAAPAGAR' ).AsDateTime  := datm_ctaapagar.qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
              qry_upd_ctaapagar_.ParamByName( 'NR_CTAAPAGAR' ).AsString    := datm_ctaapagar.qry_ctaapagar_vencto_NR_CTAAPAGAR.AsString;
              qry_upd_ctaapagar_.ParamByName( 'DT_VENCIMENTO' ).AsDateTime := qry_ctaapagar_vencto_DT_VENCTO.AsDateTime;
              qry_upd_ctaapagar_.Prepare;
              qry_upd_ctaapagar_.ExecSQL;
              CriaLancamentos(datm_ctaapagar.qry_ctaapagar_vencto_NR_CTAAPAGAR.AsString);  //cria os lançamentos referente ao Favorecido
              qry_ctaapagar_vencto_.Next;     //
            end;

            datm_main.db_broker.Commit;
          except
            on E: Exception do
            begin
              if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
              Grava := False;
              TrataErro(E);
            end;
          end;
        end;

        frm_ctaapagar_vencto.SqlLancamentos.Close;
        frm_ctaapagar_vencto.SqlLancamentos.ParamByName('CD_UNID_NEG').AsString    := qry_ctaapagar_CD_UNID_NEG.AsString;
        frm_ctaapagar_vencto.SqlLancamentos.ParamByName('DT_CTAAPAGAR').AsDateTime := qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
        frm_ctaapagar_vencto.SqlLancamentos.ParamByName('NR_CTAAPAGAR').AsString   := qry_ctaapagar_NR_CTAAPAGAR.AsString;
        frm_ctaapagar_vencto.SqlLancamentos.Open;
        frm_ctaapagar_vencto.vValDisponivel      := datm_ctaapagar.qry_ctaapagar_CalcPagamento.AsFloat;
        frm_ctaapagar_vencto.EditDisponivel.Text := FormatFloat('#,##0.00',datm_ctaapagar.qry_ctaapagar_CalcPagamento.AsFloat);
        If frm_ctaapagar_vencto.SqlLancamentos.RecordCount = 1 Then
          frm_ctaapagar_vencto.AtualizaValDisp;
        frm_ctaapagar_vencto.ShowModal;
      end;
      vContaContabil := frm_ctaapagar_vencto.SqlLancamentosCD_CT_CONTABIL.AsString;
      //vCentroCusto := frm_ctaapagar_vencto.SqlLancamentosCD_CT_CUSTO.AsString;
      vCDRateio     := frm_ctaapagar_vencto.SqlLancamentosCD_RATEIO.AsString;
      frm_ctaapagar_vencto.Release;

      //Refazer os rateios pois agora os lançamentos já possuem valores**********************************************

      while not frm_ctaapagar_vencto.SqlLancamentos.Eof do
      begin
        //seta o dataset correto para ser utilizado na função GeraRateio na hora de substituir os antigos lançamentos
        datm_ctaapagar.qry_ctaapagar_lanc_.Locate('CODIGO', frm_ctaapagar_vencto.SqlLancamentosCODIGO.AsInteger, []);
        GeraRateio( frm_ctaapagar_vencto.SqlLancamentosDT_CTAAPAGAR.AsDateTime,
                    frm_ctaapagar_vencto.SqlLancamentosNR_CTAAPAGAR.AsString,
                    frm_ctaapagar_vencto.SqlLancamentosCD_UNID_NEG.AsString,
                    frm_ctaapagar_vencto.SqlLancamentosCD_RATEIO.AsString,
                    frm_ctaapagar_vencto.SqlLancamentosVL_LANCAMENTO.AsFloat,
                    frm_ctaapagar_vencto.SqlLancamentosCODIGO.AsInteger);
        frm_ctaapagar_vencto.SqlLancamentos.Next;
      end;

      if (StrToInt( Trim( msk_qtde.Text ) ) > 1)  and (nr_identificador <> 0)then
      begin
        try
          datm_main.db_broker.StartTransaction;
          qry_ctaapagar_vencto_.Close;
          qry_ctaapagar_vencto_.ParamByName( 'NR_IDENTIFICADOR' ).AsInteger := nr_identificador;
          qry_ctaapagar_vencto_.ParamByName( 'CD_USUARIO' ).AsString        := str_cd_usuario;
          qry_ctaapagar_vencto_.Prepare;
          qry_ctaapagar_vencto_.Open;

          qry_ctaapagar_vencto_.First;
          while not qry_ctaapagar_vencto_.EOF do
          begin
            qry_upd_ctaapagar_.Close;
            qry_upd_ctaapagar_.ParamByName( 'CD_UNID_NEG' ).AsString     := qry_ctaapagar_CD_UNID_NEG.AsString;
            qry_upd_ctaapagar_.ParamByName( 'DT_CTAAPAGAR' ).AsDateTime  := datm_ctaapagar.qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
            qry_upd_ctaapagar_.ParamByName( 'NR_CTAAPAGAR' ).AsString    := datm_ctaapagar.qry_ctaapagar_vencto_NR_CTAAPAGAR.AsString;
            qry_upd_ctaapagar_.ParamByName( 'DT_VENCIMENTO' ).AsDateTime := qry_ctaapagar_vencto_DT_VENCTO.AsDateTime;
            qry_upd_ctaapagar_.Prepare;
            qry_upd_ctaapagar_.ExecSQL;
            //CriaLancamentos(datm_ctaapagar.qry_ctaapagar_vencto_NR_CTAAPAGAR.AsString);  //cria os lançamentos referente ao Favorecido
            qry_ctaapagar_vencto_.Next;     //
          end;

          vContaContabil := '';
          vCentroCusto := '';

          qry_ctaapagar_vencto_.Close;
          qry_ctaapagar_vencto_.UnPrepare;

          qry_del_ctaapagar_vencto_.Close;
          qry_del_ctaapagar_vencto_.ParamByName( 'CD_USUARIO' ).AsString := str_cd_usuario;
          qry_del_ctaapagar_vencto_.Prepare;
          qry_del_ctaapagar_vencto_.ExecSQL;

          // else nr_ctaapagar := StrZero( StrToInt( qry_ctaapagar_NR_CTAAPAGAR.AsString ), 3 );

          VerDistribuicao;

          msk_qtde.Enabled := False;
          msk_qtde.Color   := clMenu;
          msk_qtde.Text    := '';

          datm_main.db_broker.Commit;

          Grava := True;

          AbreConta( StrToDateDef( msk_dt_inicio.Text,0 ), StrToDateDef( msk_dt_fim.Text,0 ), msk_cd_unidade.Text );

          qry_lista_.Locate('CD_UNID_NEG;DT_CTAAPAGAR;NR_CTAAPAGAR',
           VarArrayOf([msk_cd_unidade.Text,dt_ctaapagar,PrimNrCtaaPagar]), [loCaseInsensitive])

        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            Grava := False;
            TrataErro(E);
          end;
        end;

      end;

      if ( pgctrl_ctaapagar.ActivePage <> ts_distr_gerencial ) or
        ( ( pgctrl_ctaapagar.ActivePage = ts_distr_gerencial ) and
          ( Not ( qry_ctaapagar_ger_.State in [dsEdit, dsInsert] ) ) )then
            btn_mi(st_incluir, False, False, st_excluir);
    end;
  end;
  Str_Cd_FornAnterior := 'X';
end;


function Tfrm_ctaapagar.VerAlt;
begin
  VerAlt := True;

  if ( ( datm_ctaapagar.qry_ctaapagar_ger_.State in [dsEdit] ) and st_modificar ) or
      ( datm_ctaapagar.qry_ctaapagar_ger_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Lançamentos de Contas Gerenciais foi alterado.' + #13#10 +
       'Deseja salvar as alterações?', 1) then
    begin
      in_salva := 0;
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
      if ( pgctrl_ctaapagar.ActivePage = ts_dados_basicos ) and ( in_salva = 1 ) then
        pgctrl_ctaapagar.ActivePage := ts_lancamentos;
    end
    else
      Cancelar;
  end;

  if ( ( datm_ctaapagar.qry_ctaapagar_lanc_.State in [dsEdit] ) and st_modificar ) or
      ( datm_ctaapagar.qry_ctaapagar_lanc_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Lançamentos foi alterado.' + #13#10 +
       'Deseja salvar as alterações?', 1) then
    begin
      in_salva := 0;
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
      if ( pgctrl_ctaapagar.ActivePage = ts_dados_basicos ) and ( in_salva = 1 ) then
        pgctrl_ctaapagar.ActivePage := ts_lancamentos;
    end
    else
      Cancelar;
  end;

  if ( ( datm_ctaapagar.qry_ctaapagar_.State in [dsEdit] ) and st_modificar ) or
     ( datm_ctaapagar.qry_ctaapagar_.State in [dsInsert] ) then
  begin
    if BoxMensagem( 'Cadastro de Contas a Pagar foi alterado.' + #13#10 +
       'Deseja salvar as alterações?', 1 ) then
    begin
      in_salva := 0;
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
      if ( pgctrl_ctaapagar.ActivePage = ts_dados_basicos ) and ( in_salva = 1 ) then
        pgctrl_ctaapagar.ActivePage := ts_lancamentos;
    end
    else
      Cancelar;
  end;

  if pgctrl_ctaapagar.ActivePage = ts_pesq then VerAlt := Consiste;
end;


procedure Tfrm_ctaapagar.Cancelar;
begin
  try
    with datm_ctaapagar do
    begin
      if qry_ctaapagar_ger_.State in [dsInsert, dsEdit] then
      begin
        qry_ctaapagar_ger_.Cancel;
        pgctrl_ctaapagar.ActivePage := ts_distr_gerencial;
        pnl_distr_gerencial.Enabled := ( qry_ctaapagar_ger_.RecordCount > 0 )           and
                                       ( qry_ctaapagar_IN_CANCELADO.AsString = '0' )    and
                                       ( qry_ctaapagar_IN_LIBERADO.AsString = '0' )     and
                                       ( qry_ctaapagar_CD_LT_CONTAB.AsString = '' )     and
                                       ( qry_ctaapagar_CD_LT_CONTAB_EXT.AsString = '' ) and
                                       ( qry_ctaapagar_CD_USUARIO_GER.AsString = str_cd_usuario ) and
                                       ( Not lPesq );
        if pnl_distr_gerencial.Enabled then dbedt_cd_ct_gerencial.SetFocus;
      end;

      if datm_ctaapagar.qry_ctaapagar_lanc_.State in [dsInsert, dsEdit] then
      begin
        datm_ctaapagar.qry_ctaapagar_lanc_.Cancel;
        pgctrl_ctaapagar.ActivePage    := ts_lancamentos;
        pgctrl_lancamentos.ActivePage  := ts_dados_lanc;
        (* pnl_dados_basicos_lanc.Enabled := ( qry_ctaapagar_lanc_.RecordCount > 0 )          and
                                          ( qry_ctaapagar_IN_CANCELADO.AsString = '0' )    and
                                          ( qry_ctaapagar_IN_LIBERADO.AsString = '0' )     and
                                          ( qry_ctaapagar_CD_LT_CONTAB.AsString = '' )     and
                                          ( qry_ctaapagar_CD_LT_CONTAB_EXT.AsString = '' ) and
                                          ( Not lPesq ); *)

        If dbedt_cd_ct_contabil.CanFocus Then
          dbedt_cd_ct_contabil.SetFocus;
      end;

      if datm_ctaapagar.qry_ctaapagar_.State in [dsInsert, dsEdit] then
      begin
        datm_ctaapagar.qry_ctaapagar_.Cancel;
        pgctrl_ctaapagar.ActivePage := ts_dados_basicos;
        pnl_ctaapagar.Enabled       := ( qry_ctaapagar_.RecordCount > 0 )                and
                                       ( qry_ctaapagar_IN_CANCELADO.AsString = '0' )     and
                                       ( qry_ctaapagar_IN_LIBERADO.AsString = '0' )      and
                                       ( qry_ctaapagar_CD_LT_CONTAB.AsString = '' )      and
                                       ( qry_ctaapagar_CD_LT_CONTAB_EXT.AsString = '' )  and
                                       ( Not lPesq );
        if pnl_ctaapagar.Enabled then dbedt_cd_fornecedor.SetFocus;
        msk_qtde.Enabled            := False;
        msk_qtde.Color              := clMenu;
        msk_qtde.Text               := '';
      end;
    end;
    btn_mi( st_incluir, False, False, False );
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
end;

procedure Tfrm_ctaapagar.btn_cancelarClick(Sender: TObject);
begin
  ActiveControl := nil;
  Cancelar;
end;


Procedure Tfrm_ctaapagar.AtualizaValDisp;
VAR
   VALOR:DOUBLE;
Begin
  With TQuery.Create(Application) Do
  Begin
    DatabaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add('select ISNULL(SUM(VL_LANCAMENTO),0) VALOR from TCTAAPAGAR_LANC');
    SQL.Add('where DT_CTAAPAGAR =:DT_CTAAPAGAR and NR_CTAAPAGAR =:NR_CTAAPAGAR');
    SQL.Add(' and CD_UNID_NEG =:CD_UNID_NEG');
    ParamByName('DT_CTAAPAGAR').AsDateTime := datm_ctaapagar.qry_lista_DT_CTAAPAGAR.AsDateTime;
    ParamByName('NR_CTAAPAGAR').AsString   := datm_ctaapagar.qry_lista_NR_CTAAPAGAR.AsString;
    ParamByName('CD_UNID_NEG').AsString   := datm_ctaapagar.qry_lista_CD_UNID_NEG.AsString;
    Open;
    EditValDisponivel.Text := FormatFloat('#,##0.00',datm_ctaapagar.qry_ctaapagar_CalcPagamento.AsFloat - FieldByname('VALOR').AsFloat);
  End;
End;

procedure Tfrm_ctaapagar.pgctrl_ctaapagarChange(Sender: TObject);
begin
  PnlDados.Enabled               := (datm_ctaapagar.qry_ctaapagar_.state in [dsInsert,dsEdit]) or ( datm_ctaapagar.qry_lista_.FieldByName('DT_MONTAGEM').AsDateTime = 0 );
  pnl_dados_basicos_lanc.Enabled := (datm_ctaapagar.qry_ctaapagar_.state in [dsInsert,dsEdit]) or ( datm_ctaapagar.qry_lista_.FieldByName('DT_MONTAGEM').AsDateTime = 0 );

  with datm_ctaapagar do
  begin
    if ( pgctrl_ctaapagar.ActivePage = ts_lista ) and
       ( qry_ctaapagar_ger_.State in [dsInsert] ) and
       lts_distr_gerencial then
    begin
      pgctrl_ctaapagar.ActivePage := ts_distr_gerencial;
    end;

    if ( pgctrl_ctaapagar.ActivePage = ts_distr_gerencial ) then
    begin
      If qry_ctaapagar_ger_.Active Then
      Begin
        btn_excluir.Enabled := ( qry_ctaapagar_ger_.RecordCount > 0 )           and
                               ( qry_ctaapagar_IN_CANCELADO.AsString = '0' )    and
                               ( qry_ctaapagar_IN_LIBERADO.AsString = '0' )     and
                               ( qry_ctaapagar_CD_LT_CONTAB.AsString = '' )     and
                               ( qry_ctaapagar_CD_LT_CONTAB_EXT.AsString = '' ) and
                               ( qry_ctaapagar_CD_USUARIO_GER.AsString = str_cd_usuario ) and
                               st_excluir;
      End
      Else
        btn_excluir.Enabled := False;
      mi_excluir.Enabled  := btn_excluir.Enabled;
      If qry_ctaapagar_ger_.Active Then
      Begin
        btn_incluir.Enabled := ( qry_ctaapagar_lanc_.RecordCount > 0 )          and
                               ( qry_ctaapagar_IN_CANCELADO.AsString = '0' )    and
                               ( qry_ctaapagar_IN_LIBERADO.AsString = '0' )     and
                               ( qry_ctaapagar_CD_LT_CONTAB.AsString = '' )     and
                               ( qry_ctaapagar_CD_LT_CONTAB_EXT.AsString = '' ) and
                               ( qry_ctaapagar_CD_USUARIO_GER.AsString = str_cd_usuario ) and
                               st_incluir;
      End
      Else
        btn_incluir.Enabled := False;
      mi_incluir.Enabled  := btn_incluir.Enabled;
    end
    else if ( pgctrl_ctaapagar.ActivePage = ts_lancamentos ) then
    begin
      AtualizaValDisp;
      If (Sender as TPageControl).Name = pgctrl_ctaapagar.Name Then
        pgctrl_lancamentos.ActivePage := ts_lista_lanc;
      If qry_ctaapagar_lanc_.Active Then
      Begin
        btn_excluir.Enabled := ( qry_ctaapagar_lanc_.RecordCount > 0 )          and
                               ( qry_ctaapagar_IN_CANCELADO.AsString = '0' )    and
                               ( qry_ctaapagar_IN_LIBERADO.AsString = '0' )     and
                               ( qry_ctaapagar_CD_LT_CONTAB.AsString = '' )     and
                               ( qry_ctaapagar_CD_LT_CONTAB_EXT.AsString = '' ) and
                               ( qry_lista_.FieldByName('DT_MONTAGEM').AsDateTime = 0) and
                               st_excluir;
      End
      Else
        btn_excluir.Enabled := False;
      mi_excluir.Enabled  := btn_excluir.Enabled;
      If qry_ctaapagar_lanc_.Active Then
      Begin
        btn_incluir.Enabled := ( datm_ctaapagar.qry_ctaapagar_.RecordCount > 0 )               and
                               ( datm_ctaapagar.qry_ctaapagar_IN_CANCELADO.AsString = '0' )    and
                               ( datm_ctaapagar.qry_ctaapagar_IN_LIBERADO.AsString = '0' )     and
                               ( datm_ctaapagar.qry_ctaapagar_CD_LT_CONTAB.AsString = '' )     and
                               ( datm_ctaapagar.qry_ctaapagar_CD_LT_CONTAB_EXT.AsString = '' ) and
                               ( qry_lista_.FieldByName('DT_MONTAGEM').AsDateTime = 0)         and
                               st_incluir;
      End
      Else
        btn_incluir.Enabled := False;
      mi_incluir.Enabled  := btn_incluir.Enabled;
    end
    else
    begin
      btn_excluir.Enabled := False;
      mi_excluir.Enabled  := False;
      btn_incluir.Enabled := st_incluir;
      mi_incluir.Enabled  := st_incluir;
    end;

    BtnMonta.Enabled := pgctrl_ctaapagar.ActivePage = ts_lista;
    btn_canc_lanc.Enabled          := ( qry_ctaapagar_IN_CANCELADO.AsString = '0' ) and
                                      ( ( pgctrl_ctaapagar.ActivePage = ts_lista )    or
                                        ( pgctrl_ctaapagar.ActivePage = ts_dados_basicos ) );
    mi_canc_lanc.Enabled           := btn_canc_lanc.Enabled;

    if ( pgctrl_ctaapagar.ActivePage = ts_lista ) or
       ( pgctrl_ctaapagar.ActivePage = ts_dados_basicos ) then
      dbnvg.DataSource := ds_lista;

    if pgctrl_ctaapagar.ActivePage = ts_lancamentos then
      dbnvg.DataSource := ds_ctaapagar_lanc;

    if pgctrl_ctaapagar.ActivePage = ts_distr_gerencial then
      dbnvg.DataSource := ds_ctaapagar_ger_;

    if ( pgctrl_ctaapagar.ActivePage     = ts_lista )         or
       ( ( pgctrl_ctaapagar.ActivePage   = ts_lancamentos )   and
         ( pgctrl_lancamentos.ActivePage = ts_lista_lanc  ) ) or
       ( pgctrl_ctaapagar.ActivePage     = ts_distr_gerencial ) then
      dbnvg.Enabled := True
    else
      dbnvg.Enabled := False;

    //if ( pgctrl_ctaapagar.ActivePage = ts_dados_basicos ) {and (dbedt_cd_fornecedor.Text='04172')} then
    begin
      dbedt_vl_ir.ReadOnly:=False;
      dbedt_vl_inss.ReadOnly:=False;
      DBEdit1.ReadOnly:=False;
      DBEdit2.ReadOnly:=False;
    end
    {else
    begin
      dbedt_vl_ir.ReadOnly:=true;
      dbedt_vl_inss.ReadOnly:=true;
      DBEdit1.ReadOnly:=true;
      DBEdit2.ReadOnly:=true;
    end};

    pnl_ctaapagar.Enabled          := datm_ctaapagar.qry_ctaapagar_IN_CANCELADO.AsString = '0';
    pnl_dados_basicos_lanc.Enabled := pnl_ctaapagar.Enabled;
  end;
end;

procedure Tfrm_ctaapagar.pgctrl_ctaapagarChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if VerAlt then AllowChange := True
  else AllowChange := False;
  if pgctrl_ctaapagar.ActivePage = ts_pesq then btn_pesqClick(nil);
end;

procedure Tfrm_ctaapagar.btn_salvarClick(Sender: TObject);
begin
  in_salva := 0;
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava    then lbl_fornec.Caption := 'Fornecedor' ;
  if ( pgctrl_ctaapagar.ActivePage = ts_dados_basicos ) and ( in_salva = 1 ) then
    pgctrl_ctaapagar.ActivePage := ts_lancamentos;
end;

procedure Tfrm_ctaapagar.dbrdgrp_forma_pagtoChange(Sender: TObject);
begin
  //  dbedt_cd_fornecedorChange(nil);
  if ( dbrdgrp_forma_pagto.Value = 'D' ) or
     ( dbrdgrp_forma_pagto.Value = 'C' ) or
     ( dbrdgrp_forma_pagto.Value = 'T' ) then
  begin
    dbedt_cd_banco.Color     := clWindow;
    dbedt_cd_banco.ReadOnly  := False;
    dbedt_cd_banco.TabStop   := True;
    btn_co_banco.Enabled     := True;

    //dbedt_nr_cheque.Color    := clWindow;
    //dbedt_nr_cheque.Readonly := False;
    //dbedt_nr_cheque.TabStop  := True;
  end
  else
  begin
    dbedt_cd_banco.Color     := clMenu;
    dbedt_cd_banco.ReadOnly  := True;
    dbedt_cd_banco.TabStop   := False;
    btn_co_banco.Enabled     := False;
    if datm_ctaapagar.qry_ctaapagar_.State in [dsInsert, dsEdit] then
    begin
      datm_ctaapagar.qry_ctaapagar_CD_BANCO.AsString  := '';
      datm_ctaapagar.qry_ctaapagar_NR_CHEQUE.AsString := '';
    end;
  end;
end;

procedure Tfrm_ctaapagar.dbedt_cd_ct_custoExit(Sender: TObject);
begin
//  CodExits;
end;

procedure Tfrm_ctaapagar.dbedt_cd_ct_gerencialExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_ctaapagar.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este Lançamento será excluído! Confirma exclusão?', 1 ) then
  try
    datm_main.db_broker.StartTransaction;
    with datm_ctaapagar do
    begin
      if ( pgctrl_ctaapagar.ActivePage = ts_distr_gerencial ) then
      begin
        qry_ctaapagar_ger_.Delete;
        qry_ctaapagar_ger_.Close;
        qry_ctaapagar_ger_.Prepare;
        qry_ctaapagar_ger_.Open;
      end;

      if ( pgctrl_ctaapagar.ActivePage = ts_lancamentos ) then
      begin
        while not qry_ctaapagar_rateio.Eof do
          qry_ctaapagar_rateio.Delete;

        qry_ctaapagar_lanc_.Delete;
        qry_ctaapagar_lanc_.Close;
        qry_ctaapagar_lanc_.Prepare;
        qry_ctaapagar_lanc_.Open;
      end;
    end;
    VerDistribuicao;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;
      TrataErro(E);
      if ( pgctrl_ctaapagar.ActivePage = ts_lancamentos ) then
        datm_ctaapagar.qry_ctaapagar_lanc_.Cancel;
      if ( pgctrl_ctaapagar.ActivePage = ts_distr_gerencial ) then
        datm_ctaapagar.qry_ctaapagar_ger_.Cancel;
    end;
  End
end;

procedure Tfrm_ctaapagar.cb_ordemClick(Sender: TObject);
begin
  with datm_ctaapagar do
  begin
    cd_unidade_contas  := qry_lista_CD_UNID_NEG.AsString;
    dt_ctaapagar       := qry_lista_DT_CTAAPAGAR.AsDateTime;
    nr_ctaapagar       := qry_lista_NR_CTAAPAGAR.AsString;

    qry_lista_.Close;
    qry_lista_.SQL[12] := a_str_indices[cb_ordem.ItemIndex];
    qry_lista_.Prepare;
    qry_lista_.Open;
    qry_lista_.Locate('CD_UNID_NEG;DT_CTAAPAGAR;NR_CTAAPAGAR',
       VarArrayOf([cd_unidade_contas, dt_ctaapagar, nr_ctaapagar ]), [loCaseInsensitive]);
  end;
end;

procedure Tfrm_ctaapagar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_ctaapagar.dbedt_cd_favor_contabilKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unidade          then btn_co_coligadaClick(btn_co_coligada)                       else
    if Sender = dbedt_cd_fornecedor     then btn_co_fornecedorClick(btn_co_fornecedor)                   else
    if Sender = dbedt_cd_fornecedor     then btn_co_fornecedorClick(btn_co_fornecedor)                   else
    if Sender = dbedt_cd_favorecido     then btn_co_favorecidoClick(btn_co_favorecido)                   else
    if Sender = dbedt_cd_banco          then btn_co_bancoClick(btn_co_banco)                             else
    if Sender = dbedt_cd_usuario_ger    then btn_co_usuario_gerClick(btn_co_usuario_ger)                 else
    if Sender = dbedt_cd_ct_contabil    then btn_ContaContabilClick(btn_ContaContabil)                   else
    if Sender = dbedt_cd_ct_custo       then btn_co_ct_custoClick(btn_co_ct_custo)                       else
    if Sender = dbedt_cd_filial         then btn_co_filialClick(btn_co_filial)                           else
    if Sender = dbedt_cd_ct_gerencial   then btn_co_ct_gerencialClick(btn_co_ct_gerencial)               else
    if Sender = msk_cd_banco_pesq       then btn_co_banco_pesqClick(btn_co_banco_pesq)                   else
    if Sender = msk_cd_ct_contabil_pesq then btn_co_ct_ct_contabil_pesqClick(btn_co_ct_ct_contabil_pesq) else
    if Sender = msk_cd_forn_pesq        then btn_co_forn_pesqClick(btn_co_forn_pesq);
  end;
end;


procedure Tfrm_ctaapagar.FechaQRYConta;
begin
  with datm_ctaapagar do
  begin
    qry_ctaapagar_.Close;
    qry_ctaapagar_lanc_.Close;
    qry_ctaapagar_ger_.Close;
  end;
end;


procedure Tfrm_ctaapagar.VerDistribuicao;
var ldistribuicao : boolean;
begin
  with datm_ctaapagar do
  begin
    ldistribuicao := True;

    qry_tot_distr_lanc_.Close;
    qry_tot_distr_lanc_.ParamByName('CD_UNID_NEG').AsString    := msk_cd_unidade.Text;
    qry_tot_distr_lanc_.ParamByName('DT_CTAAPAGAR').AsDateTime := qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
    qry_tot_distr_lanc_.ParamByName('NR_CTAAPAGAR').AsString   := qry_ctaapagar_NR_CTAAPAGAR.AsString;
    qry_tot_distr_lanc_.Prepare;
    qry_tot_distr_lanc_.Open;

    if ( qry_tot_distr_lanc_ERRO_DISTR_LANC.AsCurrency = 0 ) then
    begin
      qry_tot_distr_lanc_.Close;

      if str_cd_sistema_contabil = '0' then
      begin
        qry_tot_distr_gerRM_.Close;
        qry_tot_distr_gerRM_.ParamByName('CD_UNID_NEG').AsString    := msk_cd_unidade.Text;
        qry_tot_distr_gerRM_.ParamByName('DT_CTAAPAGAR').AsDateTime := qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
        qry_tot_distr_gerRM_.ParamByName('NR_CTAAPAGAR').AsString   := qry_ctaapagar_NR_CTAAPAGAR.AsString;
        qry_tot_distr_gerRM_.Prepare;
        qry_tot_distr_gerRM_.Open;

        if qry_tot_distr_gerRM_.RecordCount = 0 then
          ldistribuicao := True
        else
        begin
          while ( Not qry_tot_distr_gerRM_.EOF ) and ldistribuicao do
          begin
            if ( qry_tot_distr_gerRM_ERRO_DISTR_GER.AsCurrency <> 0 ) then
              ldistribuicao := False;
            qry_tot_distr_gerRM_.Next;
          end;
        end;
        qry_tot_distr_gerRM_.Close;
      end
      else
      begin
        qry_tot_distr_ger_.Close;
        qry_tot_distr_ger_.ParamByName('CD_UNID_NEG').AsString    := msk_cd_unidade.Text;
        qry_tot_distr_ger_.ParamByName('DT_CTAAPAGAR').AsDateTime := qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
        qry_tot_distr_ger_.ParamByName('NR_CTAAPAGAR').AsString   := qry_ctaapagar_NR_CTAAPAGAR.AsString;
        qry_tot_distr_ger_.Prepare;
        qry_tot_distr_ger_.Open;

        if qry_tot_distr_ger_.RecordCount = 0 then
          ldistribuicao := True
        else
        begin
          while ( Not qry_tot_distr_ger_.EOF ) and ldistribuicao do
          begin
            if ( qry_tot_distr_ger_ERRO_DISTR_GER.AsCurrency <> 0 ) then
              ldistribuicao := False;
            qry_tot_distr_ger_.Next;
          end;
        end;
        qry_tot_distr_ger_.Close;
      end;
    end
    else
    begin
      qry_tot_distr_lanc_.Close;
      ldistribuicao := False;
    end;

    if Not ( qry_ctaapagar_.State in [dsEdit, dsInsert] ) then
      qry_ctaapagar_.Edit;

    if ldistribuicao then
    begin
      qry_ctaapagar_IN_DISTRIBUICAO.AsString := '1';
      qry_ctaapagar_.Post;
    end
    else
    begin
      qry_ctaapagar_IN_DISTRIBUICAO.AsString := '0';
      qry_ctaapagar_.Post;
    end;
  end;
end;


procedure Tfrm_ctaapagar.dbedt_cd_bancoExit(Sender: TObject);
begin
  CodExits;
end;


procedure Tfrm_ctaapagar.btn_co_fornecedorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_ctaapagar.qry_ctaapagar_) then exit;
      datm_ctaapagar.qry_ctaapagar_CD_FORNECEDOR.AsString := ConsultaOnLineEx('TFAVORECIDO','Fornecedor',['CD_FAVORECIDO','NM_FAVORECIDO','AP_FAVORECIDO','CGC_EMPRESA'],['Código','Nome','Apelido','CNPJ'],'CD_FAVORECIDO',frm_main.mi_cad_fin_fav)
  end
  else
    dbedt_nm_fornecedor.Text := ConsultaLookUP('TFAVORECIDO','CD_FAVORECIDO',dbedt_cd_fornecedor.Text,'NM_FAVORECIDO')
end;


procedure Tfrm_ctaapagar.dbedt_cd_fornecedorExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
  //if (dbedt_cd_fornecedor.Text='04172') then
  begin
    dbedt_vl_ir.ReadOnly:=False;
    dbedt_vl_inss.ReadOnly:=False;
    DBEdit1.ReadOnly:=False;
    DBEdit2.ReadOnly:=False;
  end
  {else
  begin
    dbedt_vl_ir.ReadOnly:=true;
    dbedt_vl_inss.ReadOnly:=true;
    DBEdit1.ReadOnly:=true;
    DBEdit2.ReadOnly:=true;
  end};
  If dbedt_nm_fornecedor.Text <> '' Then
    CalcImpostos;
end;

procedure Tfrm_ctaapagar.dbedt_cd_ct_contabilChange(Sender: TObject);
begin
  if ( datm_ctaapagar.qry_ctaapagar_lanc_.State in [ dsInsert, dsEdit ] ) then
     btn_mi(False, True, True, False);
end;

procedure Tfrm_ctaapagar.btn_co_usuario_gerClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_ctaapagar.qry_ctaapagar_) then exit;
      datm_ctaapagar.qry_ctaapagar_CD_USUARIO_GER.AsString := ConsultaOnLineEx('Tusuario','Usuário',['CD_USUARIO','NM_USUARIO'],['Código','Usuário'],'CD_USUARIO',frm_main.mi_cadastro_usuario)
  end
  else
    dbedt_nm_usuario_ger.Text := ConsultaLookUP('Tusuario','CD_USUARIO',dbedt_cd_usuario_ger.Text,'NM_USUARIO')
end;

procedure Tfrm_ctaapagar.dbedt_cd_usuario_gerExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_ctaapagar.btn_co_filialClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_ctaapagar.qry_ctaapagar_lanc_) then exit;
      datm_ctaapagar.qry_ctaapagar_lanc_CD_FILIAL.AsString := ConsultaOnLineEx('TUNID_NEG','Filial',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg)
  end
  else
    dbedt_nm_filial.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG',dbedt_cd_filial.Text,'NM_UNID_NEG')
end;


procedure Tfrm_ctaapagar.dbedt_cd_filialExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_ctaapagar.dbedt_cd_barrasExit(Sender: TObject);
begin
  if cd_barras <> dbedt_cd_barras.Text then CodExits;
end;

procedure Tfrm_ctaapagar.dbedt_cd_barrasEnter(Sender: TObject);
begin
  cd_barras := dbedt_cd_barras.Text;
end;

procedure Tfrm_ctaapagar.dbedt_vl_descontoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_ctaapagar.dbedt_vl_acrescimoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_ctaapagar.dbedt_vl_despesaExit(Sender: TObject);
begin
  CodExits;
  CalcImpostos;
end;

procedure Tfrm_ctaapagar.dbedt_vl_irExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_ctaapagar.dbedt_vl_inssExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_ctaapagar.dbedt_vl_despesaEnter(Sender: TObject);
begin
  if dbedt_vl_despesa.Color = clMenu then dbedt_vl_desconto.SetFocus;
end;

procedure Tfrm_ctaapagar.dbedt_vl_descontoEnter(Sender: TObject);
begin
  if dbedt_vl_desconto.Color = clMenu then dbedt_vl_despesa.SetFocus;
end;

procedure Tfrm_ctaapagar.btn_co_coligadaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_unidade.Text := ConsultaOnLineEx('TUNID_NEG','Filial',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg)
  else
    edt_nm_unidade.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG',msk_cd_unidade.Text,'NM_UNID_NEG')
end;

procedure Tfrm_ctaapagar.msk_cd_unidadeEnter(Sender: TObject);
begin
  cd_unidade_contas := msk_cd_unidade.Text;
end;

procedure Tfrm_ctaapagar.msk_cd_unidadeExit(Sender: TObject);
begin
  if linsere_distr_ger or ( cd_unidade_contas = msk_cd_unidade.Text ) then Exit;

  ValCodEdt( msk_cd_unidade );

  with datm_ctaapagar do
  begin
    if ( Not ( qry_ctaapagar_.State in [dsInsert, dsEdit] ) ) and
       ( Not ( qry_ctaapagar_lanc_.State in [dsInsert, dsEdit] ) ) and
       ( Not ( qry_ctaapagar_ger_.State in [dsInsert, dsEdit] ) ) then
    begin
      if msk_cd_unidade.Text <> '' then
      begin
        qry_unidade_.Close;
        qry_unidade_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unidade.Text + '"';
        qry_unidade_.Prepare;
        qry_unidade_.Open;
        if qry_unidade_.RecordCount > 0 then
        begin
          edt_nm_unidade.Text := qry_unidade_NM_UNID_NEG.AsString;
//          if ( msk_dt_inicio.Text <> '  /  /    ' ) and ( msk_dt_fim.Text <> '  /  /    ' ) then
            AbreConta( StrToDateDef( msk_dt_inicio.Text,0 ), StrToDateDef( msk_dt_fim.Text,0 ), msk_cd_unidade.Text );
//          else
//            AbreConta( dt_server, dt_server, msk_cd_unidade.Text );
          pgctrl_ctaapagar.ActivePage  := ts_lista;
        end
        else
        begin
          BoxMensagem('Empresa Coligada inválida!', 2);
          edt_nm_unidade.Text := '';
          msk_cd_unidade.SetFocus;
          Exit;
        end;
      end
      else
      begin
        edt_nm_unidade.Text := '';
      end;
    end;
  end;
end;


procedure Tfrm_ctaapagar.rdgrp_baseClick(Sender: TObject);
begin
  cd_unidade_contas := '';
  msk_cd_unidadeExit(nil);
end;


procedure Tfrm_ctaapagar.btn_canc_lancClick(Sender: TObject);
var
 tp_forma_pagto: String[1];
begin
  if datm_ctaapagar.qry_lista_DT_MONTAGEM.AsDateTime = 0 Then
  Begin
    If datm_ctaapagar.qry_lista_DT_PAGAMENTO.AsDateTime = 0 Then
    Begin
      case dbrdgrp_forma_pagto.ItemIndex of
       0: tp_forma_pagto := '$';
       1: tp_forma_pagto := 'C';
       2: tp_forma_pagto := 'D';
      end;
      with datm_ctaapagar do
      begin
        try
          Screen.Cursor := crHourGlass;
          Application.ProcessMessages;

          if ( Not qry_ctaapagar_DT_PAGAMENTO.IsNull ) and ( qry_ctaapagar_DT_PAGAMENTO.AsDateTime <= dt_server ) then
          begin
            qry_caixa_ctrl_.Close;
            qry_caixa_ctrl_.Prepare;
            qry_caixa_ctrl_.Open;
            if Not qry_caixa_ctrl_.EOF then
               if ( qry_ctaapagar_DT_PAGAMENTO.AsDateTime > dt_server ) or
                  ( qry_ctaapagar_DT_PAGAMENTO.AsDateTime < qry_caixa_ctrl_.FieldByName('DT_MOVIMENTO').AsDateTime ) then
            begin
              BoxMensagem( 'Movimento financeiro fechado, ou Data inválida', 2 );
              qry_caixa_ctrl_.Close;
              Screen.Cursor := crDefault;
              Application.ProcessMessages;
              Exit;
            end;
          end;
          If BoxMensagem('Deseja realmente cancelar a Conta ?', 1) then
          Begin
            datm_main.db_broker.StartTransaction;

            if Not ( qry_ctaapagar_.State in [dsInsert, dsEdit] ) then
              qry_ctaapagar_.Edit;

            if qry_ctaapagar_IN_TRANSFERIDO.AsString = '1' then
               qry_ctaapagar_IN_TRANSFERIDO.AsString := '0';

            qry_ctaapagar_IN_CANCELADO.AsString := '1';
            qry_ctaapagar_STATUS.AsString            := '4';   // cancelado pelo solicitante
            qry_ctaapagar_CD_CANCELADOR.AsString     := str_cd_usuario;
            qry_ctaapagar_DT_CANCELAMENTO.AsDateTime := dt_server;
            qry_ctaapagar_.Post;

            btn_canc_lanc.Enabled               := False;
            mi_canc_lanc.Enabled                := False;
            lbl_cancelado.Visible               := True;
            pnl_ctaapagar.Enabled               := False;
            pnl_distr_gerencial.Enabled         := False;

            sp_distribui_ctaapagar.StoredProcName := '';
              case strtoint(qry_ctaapagar_IN_OPERACIONAL.AsString) of
               0:
                begin
                  if qry_ctaapagar_IN_LIBERADO.AsString = '1' then
                  begin
                    sp_distribui_ctaapagar.StoredProcName := 'sp_distribui_ctaapagar';
                    sp_distribui_ctaapagar.Params.CreateParam( ftDate,   '@DT_MOVIMENTO', ptInput ).AsDateTime:= qry_ctaapagar_DT_PAGAMENTO.AsDateTime;;
                    sp_distribui_ctaapagar.Params.CreateParam( ftString, '@CD_UNID_NEG',  ptInput ).AsString  := msk_cd_unidade.Text;
                    sp_distribui_ctaapagar.Params.CreateParam( ftString, '@qt_imp',  ptOutPut ).AsInteger     := 0;
                    sp_distribui_ctaapagar.Params.CreateParam( ftInteger,'Result',       ptResult );
                    ExecStoredProc(sp_distribui_ctaapagar);
                    CloseStoredProc(sp_distribui_ctaapagar);
                  end
                end;
               1:
                begin
                 sp_distribui_ctaapagar.StoredProcName := 'sp_distribui_ctaapagar_ag';
                 sp_distribui_ctaapagar.Params.CreateParam( ftDate,  '@DT_MOVIMENTO', ptInput ).AsDateTime:= qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
                 sp_distribui_ctaapagar.Params.CreateParam( ftString,'@CD_UNID_NEG',  ptInput ).AsString  := msk_cd_unidade.Text;
                 sp_distribui_ctaapagar.Params.CreateParam( ftString,'@nr_cta_pagar', ptInput ).AsString  := qry_ctaapagar_NR_CTAAPAGAR.AsString;
                 sp_distribui_ctaapagar.Params.CreateParam( ftString,'@tp_pagamento',  ptInput ).AsString := tp_forma_pagto;
                 sp_distribui_ctaapagar.Params.CreateParam( ftString,'@cd_banco', ptInput ).AsString      := qry_ctaapagar_CD_BANCO.AsString;
                 sp_distribui_ctaapagar.Params.CreateParam( ftInteger,'Result',       ptResult );
                 ExecStoredProc(sp_distribui_ctaapagar);
                 CloseStoredProc(sp_distribui_ctaapagar);
                end;
             end;


            datm_main.db_broker.Commit;

            dt_ctaapagar   := qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
            nr_ctaapagar   := qry_ctaapagar_NR_CTAAPAGAR.AsString;

            AbreConta( StrToDateDef( msk_dt_inicio.Text,0 ), StrToDateDef( msk_dt_fim.Text,0 ), msk_cd_unidade.Text );

            qry_lista_.Locate('CD_UNID_NEG;DT_CTAAPAGAR;NR_CTAAPAGAR',
               VarArrayOf([msk_cd_unidade.Text,dt_ctaapagar,nr_ctaapagar]), [loCaseInsensitive]);

            Screen.Cursor := crDefault;
            Application.ProcessMessages;
          End;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            qry_ctaapagar_.Cancel;
            TrataErro(E);
          end;
        end;
      end;
    End
    Else
      BoxMensagem('Não será possível cancelar a Conta pois ela já está Paga !',2);
  End
  Else
    BoxMensagem('Não será possível cancelar a Conta pois ela foi montada !',2);
end;


procedure Tfrm_ctaapagar.btn_contabilizaClick(Sender: TObject);
begin
  if (in_integracao_contabil = '1')   then
  begin
    if (datm_ctaapagar.qry_ctaapagar_IN_CONTABILIZADO.AsString= '1') OR  (datm_ctaapagar.qry_ctaapagar_IN_OPERACIONAL.AsString= '1')then
    begin
      Boxmensagem('Lançamento já contabilizado',2);
      Exit;
    end;

    if not(boxmensagem('Estas informações serão contabilizadas. Deseja Continuar?',1)) then
      exit;

    if (dt_contabilizacao >= datm_ctaapagar.qry_ctaapagar_DT_CTAAPAGAR.AsDatetime) then
    begin
      Boxmensagem('Período Contabil Fechado',2);
      Exit;
    end;

    try
      datm_main.db_broker.StartTransaction;
      with  datm_ctaapagar do
      begin
        exec_contabiliza_pagto_adm(msk_cd_unidade.text, qry_ctaapagar_NR_CTAAPAGAR.AsString, qry_ctaapagar_CD_BANCO.AsString,
                                 qry_ctaapagar_NR_TITULO.AsString, qry_ctaapagar_DT_CTAAPAGAR.AsDatetime,
                                 qry_ctaapagar_DT_CTAAPAGAR.AsDatetime );
        if not(qry_ctaapagar_.State in [dsEdit, dsInsert]) then
          qry_ctaapagar_.Edit;
        qry_ctaapagar_IN_CONTABILIZADO.AsString := '1';
        qry_ctaapagar_.Post;

        datm_main.db_broker.Commit;
      end;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Exit;
      end;
    end;
    exit;
  end
  else
    exit;
  with datm_ctaapagar do
  begin
    try
      datm_main.db_broker.StartTransaction;
      CloseStoredProc(sp_contabiliza_ctaapagar);
      sp_contabiliza_ctaapagar.ParamByName('@CD_UNID_NEG').AsString := msk_cd_unidade.Text;
      ExecStoredProc(sp_contabiliza_ctaapagar);
      Contabiliza( qry_contab_, qry_contab_lanc_, qry_contab_gerencial_ ,
                   sp_contabiliza_ctaapagar.ParamByName('@NR_CONTAB').AsString,
                   msk_cd_unidade.Text );
      CloseStoredProc(sp_contabiliza_ctaapagar);
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_ctaapagar.btn_pesqClick(Sender: TObject);
begin
//  if msk_dt_inicio.Text = '  /  /    ' then msk_dt_inicio.Text := FormatDateTime( 'dd/mm/yyyy', dt_server );
//  if msk_dt_fim.Text = '  /  /    '    then msk_dt_fim.Text    := FormatDateTime( 'dd/mm/yyyy', dt_server );
  AbreConta( StrToDateDef( msk_dt_inicio.Text,0 ), StrToDateDef( msk_dt_fim.Text,0 ), msk_cd_unidade.Text );
  pgctrl_ctaapagar.ActivePage  := ts_lista;
end;


procedure Tfrm_ctaapagar.btn_co_forn_pesqClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_forn_pesq.Text := ConsultaOnLineEx('TFAVORECIDO','Favorecido',['CD_FAVORECIDO','NM_FAVORECIDO'],['Código','Nome'],'CD_FAVORECIDO',frm_main.mi_cad_fin_fav)
  else
    edt_nm_forn_pesq.Text := ConsultaLookUP('TFAVORECIDO','CD_FAVORECIDO',msk_cd_forn_pesq.Text,'NM_FAVORECIDO')
end;


procedure Tfrm_ctaapagar.btn_co_banco_pesqClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_banco_pesq.Text := ConsultaOnLineEx('TBANCO','Banco',['CD_BANCO','NM_BANCO'],['Código','Nome'],'CD_BANCO',frm_main.mi_cad_fin_conta_banc)
  else
    edt_nm_banco_pesq.Text := ConsultaLookUP('TBANCO','CD_BANCO',msk_cd_banco_pesq.Text,'NM_BANCO')
end;


procedure Tfrm_ctaapagar.btn_co_ct_ct_contabil_pesqClick(Sender: TObject);
begin
  if str_cd_sistema_contabil = '0' then
  begin
    if Sender is TSpeedButton then
      msk_cd_ct_contabil_pesq.Text := ConsultaOnLineEx('TCONTABIL_PLANO','Contas Contábeis',['CD_CT_CONTABIL','NM_CT_CONTABIL'],['Código','Descrição'],'CD_CT_CONTABIL')
    else
      edt_nm_ct_contabil_pesq.Text   := ConsultaLookUp('TCONTABIL_PLANO','CD_CT_CONTABIL',msk_cd_ct_contabil_pesq.Text,'NM_CT_CONTABIL');
  end
  else
  begin
    if Sender is TSpeedButton then
      msk_cd_ct_contabil_pesq.Text := ConsultaOnLineEx('TCT_CONTABIL','Contas Contábeis',['CD_CT_CONTABIL','NM_CT_CONTABIL'],['Código','Descrição'],'CD_CT_CONTABIL')
    else
      edt_nm_ct_contabil_pesq.Text   := ConsultaLookUp('TCT_CONTABIL','CD_CT_CONTABIL',msk_cd_ct_contabil_pesq.Text,'NM_CT_CONTABIL');
  end;
  msk_cd_ct_contabil_pesqExit(nil);
end;

procedure Tfrm_ctaapagar.msk_cd_forn_pesqExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_ctaapagar.msk_cd_banco_pesqExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_ctaapagar.msk_cd_ct_contabil_pesqExit(Sender: TObject);
begin
  Consiste;
end;


procedure Tfrm_ctaapagar.msk_vl_pagto_pesq_inicialExit(Sender: TObject);
begin
  if msk_vl_pagto_pesq_inicial.Text = '' then Exit;
  vl_pagto := StrToFloat( msk_vl_pagto_pesq_inicial.Text );
  msk_vl_pagto_pesq_inicial.Text := FormatFloat('0.00', vl_pagto);
end;


procedure Tfrm_ctaapagar.pnl_pesquisaEnter(Sender: TObject);
begin
  // Forma de Pagto
  if rdgrp_forma_pagto_pesq.ItemIndex = -1 then rdgrp_forma_pagto_pesq.ItemIndex := 3;
end;


procedure Tfrm_ctaapagar.msk_vl_pagto_pesq_finalExit(Sender: TObject);
begin
  if msk_vl_pagto_pesq_final.Text = '' then Exit;
  vl_pagto := StrToFloat( msk_vl_pagto_pesq_final.Text );
  msk_vl_pagto_pesq_final.Text := FormatFloat('0.00', vl_pagto);
end;

procedure Tfrm_ctaapagar.dbrdgrp_forma_pagtoExit(Sender: TObject);
begin
  CodExits;
end;

Procedure Tfrm_ctaapagar.CalcImpostos;
Var
  vAliqIR, vAliqINSS, vAliqPISCOFINS, vAliqISS, vTotalAcumulado : Real;
Begin
  If datm_ctaapagar.qry_ctaapagar_.State in [dsInsert, dsEdit] Then
  Begin
    vAliqIR        := StrToFloatDef( TiraPic ( ConsultaLookUP('TFAVORECIDO','CD_FAVORECIDO',dbedt_cd_fornecedor.Text,'ALIQ_IRFF')),0);
    vAliqINSS      := StrToFloatDef( TiraPic ( ConsultaLookUP('TFAVORECIDO','CD_FAVORECIDO',dbedt_cd_fornecedor.Text,'ALIQ_INSS')),0);
    vAliqPISCOFINS := StrToFloatDef( TiraPic ( ConsultaLookUP('TFAVORECIDO','CD_FAVORECIDO',dbedt_cd_fornecedor.Text,'ALIQ_PISCOFINS')),0);
    vAliqISS       := StrToFloatDef( TiraPic ( ConsultaLookUP('TFAVORECIDO','CD_FAVORECIDO',dbedt_cd_fornecedor.Text,'ALIQ_ISS')),0);
    datm_ctaapagar.qry_ctaapagar_VL_IR.AsFloat        := MyRound(((datm_ctaapagar.qry_ctaapagar_VL_DESPESA.AsFloat *( ifthen(msk_qtde.text='',1,strtoint(msk_qtde.text)))) * (vAliqIR/100)),2);
    datm_ctaapagar.qry_ctaapagar_VL_INSS.AsFloat      := MyRound(((datm_ctaapagar.qry_ctaapagar_VL_DESPESA.AsFloat*( ifthen(msk_qtde.text='',1,strtoint(msk_qtde.text)))) *  (vAliqINSS/100)),2);
    datm_ctaapagar.qry_ctaapagar_VL_ISS.AsFloat       := MyRound(((datm_ctaapagar.qry_ctaapagar_VL_DESPESA.AsFloat *( ifthen(msk_qtde.text='',1,strtoint(msk_qtde.text)))) *  (vAliqISS/100)) ,2);
    With TQuery.Create(Application) Do
    Begin
      DatabaseName := 'DBBROKER';
      Close;
      Sql.Clear;
      Sql.Add('SELECT sum(VL_DESPESA) TOTAL FROM TCTAAPAGAR');
      Sql.Add('where');
      Sql.Add('CD_FORNECEDOR =:CD_FORNECEDOR and month(DT_CTAAPAGAR) = month(:DT_CTAAPAGAR) and IN_PISCOFINS = ''0''');
      ParamByName('CD_FORNECEDOR').AsString  := datm_ctaapagar.qry_ctaapagar_CD_FORNECEDOR.AsString;
      ParamByName('DT_CTAAPAGAR').AsDateTime := datm_ctaapagar.qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
      Open;
      vTotalAcumulado := (FieldByName('TOTAL').AsFloat + datm_ctaapagar.qry_ctaapagar_VL_DESPESA.AsFloat) * ( ifthen(msk_qtde.text='',1,strtoint(msk_qtde.text))) ;
      If vTotalAcumulado >= 5000 Then
      Begin
        datm_ctaapagar.qry_ctaapagar_VL_PISCOFINS.AsFloat  := MyRound((vTotalAcumulado) * (vAliqPISCOFINS/100),2);
        datm_ctaapagar.qry_ctaapagar_IN_PISCOFINS.AsString := '1';
        Close;
        Sql.Clear;
        Sql.Add('update TCTAAPAGAR set IN_PISCOFINS = ''1''');
        Sql.Add('where');
        Sql.Add('CD_FORNECEDOR =:CD_FORNECEDOR and month(DT_CTAAPAGAR) = month(:DT_CTAAPAGAR) and IN_PISCOFINS = ''0''');
        ParamByName('CD_FORNECEDOR').AsString  := datm_ctaapagar.qry_ctaapagar_CD_FORNECEDOR.AsString;
        ParamByName('DT_CTAAPAGAR').AsDateTime := datm_ctaapagar.qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
        ExecSql;
        Free;
      End
      Else
      Begin
        datm_ctaapagar.qry_ctaapagar_VL_PISCOFINS.AsFloat := 0;
        datm_ctaapagar.qry_ctaapagar_IN_PISCOFINS.AsString := '0';
      End;
    End;
  End;
End;

procedure Tfrm_ctaapagar.dbedt_cd_favorecidoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_ctaapagar.btn_co_favorecidoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_ctaapagar.qry_ctaapagar_) then exit;
      datm_ctaapagar.qry_ctaapagar_CD_FAVORECIDO.AsString := ConsultaOnLineEx('TFAVORECIDO','Fornecedor',['CD_FAVORECIDO','NM_FAVORECIDO'],['Código','Nome'],'CD_FAVORECIDO',frm_main.mi_cad_fin_fav)
  end
  else
    dbedt_nm_favorecido.Text := ConsultaLookUP('TFAVORECIDO','CD_FAVORECIDO',dbedt_cd_favorecido.Text,'NM_FAVORECIDO')
end;


procedure Tfrm_ctaapagar.dbedt_cd_acessoEnter(Sender: TObject);
begin
  //  cd_acesso := dbedt_cd_acesso.Text;
end;


procedure Tfrm_ctaapagar.dbedt_cd_usuarioChange(Sender: TObject);
begin
  dbedt_nm_usuario.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO',dbedt_cd_usuario.Text,'AP_USUARIO');
end;

procedure Tfrm_ctaapagar.DateEdit1Enter(Sender: TObject);
begin
  dt_inicio := msk_dt_inicio.Text;
  dt_fim    := msk_dt_fim.Text;
end;


procedure Tfrm_ctaapagar.DateEdit1Exit(Sender: TObject);
begin
  if linsere_distr_ger or ( ( dt_inicio = msk_dt_inicio.Text ) and ( dt_fim = msk_dt_fim.Text ) ) then Exit;

  dt_inicio := msk_dt_inicio.Text;
  dt_fim    := msk_dt_fim.Text;

  with datm_ctaapagar do
  begin
    if ( Not ( qry_ctaapagar_.State in [dsInsert, dsEdit] ) ) and
       ( Not ( qry_ctaapagar_lanc_.State in [dsInsert, dsEdit] ) ) and
       ( Not ( qry_ctaapagar_ger_.State in [dsInsert, dsEdit] ) ) then
    begin
//      if ( msk_dt_inicio.Text <> '' ) and ( msk_dt_fim.Text <> '' ) then
        AbreConta( StrToDateDef( msk_dt_inicio.Text,0 ), StrToDateDef( msk_dt_fim.Text,0 ), msk_cd_unidade.Text );
      pgctrl_ctaapagar.ActivePage  := ts_lista;
    end;
  end;
end;


procedure Tfrm_ctaapagar.DateEdit2Enter(Sender: TObject);
begin
  dt_inicio := msk_dt_inicio.Text;
  dt_fim := msk_dt_fim.Text;
end;


procedure Tfrm_ctaapagar.msk_qtdeExit(Sender: TObject);
begin
  msk_qtde.Text := FStrZero(Msk_qtde.Text,3);
  dbedt_vl_despesa.text:='0';
end;


procedure Tfrm_ctaapagar.BtnMontaClick(Sender: TObject);
Var
  I, UltRef : Integer;
  Erro, ErroDtVenc : Boolean;
  vCodFavorecido, vCodBanco, vFormaPagto : String;
  vDtVenc : TDate;

  Procedure VerificaDtVenc;
  Var
    I : Integer;
  Begin
    vDtVenc := 0;
    For I := 0 to dbgrd_lista.SelectedRows.Count - 1 do
    begin
      If Not ErroDtVenc Then
      Begin
        If vDtVenc = 0 Then   // guarda o prmeiro valor e compara com as demais contas
          vDtVenc := datm_ctaapagar.qry_lista_DT_VENCIMENTO.AsDateTime;
        TTable(dbgrd_lista.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_lista.SelectedRows[I]));
        If vDtVenc <> datm_ctaapagar.qry_lista_DT_VENCIMENTO.AsDateTime Then
        Begin
          Erro := Not (BoxMensagem( 'Existem contas com datas de vencimento diferentes, Confirma Montagem ?', 1 ));
          ErroDtVenc := True;
        End;
      End;
    End;
  End;
begin
  ActiveControl := nil;
  Erro          := False;
  ErroDtVenc    := False;
  if dbgrd_lista.SelectedRows.Count = 0 then
  begin
    BoxMensagem( 'Selecione um Pagamento!', 2 );
    Erro := True;
    Exit;
  end;
  vCodFavorecido := '';
  vFormaPagto    := '';
  With datm_ctaapagar Do
  Begin
    For I := 0 to dbgrd_lista.SelectedRows.Count - 1 do
    begin
      If vCodFavorecido = '' Then   // guarda o prmeiro valor e compara com as demais contas
      Begin
        vCodFavorecido := datm_ctaapagar.qry_lista_CD_FAVORECIDO.AsString;
        vFormaPagto    := datm_ctaapagar.qry_lista_TP_PAGAMENTO.AsString;
        vDtVenc        := datm_ctaapagar.qry_lista_DT_VENCIMENTO.AsDateTime;
        vCodBanco      := datm_ctaapagar.qry_lista_CD_BANCO.AsString;
      End;
      TTable(dbgrd_lista.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_lista.SelectedRows[I]));
      if ( datm_ctaapagar.qry_lista_IN_CANCELADO.AsString = '1' ) then
      begin
        BoxMensagem( 'Conta Contábil: ' + Trim( qry_lista_NR_CTAAPAGAR.AsString ) + ' está cancelada!', 2 );
        Erro := True;
        Break;
      end;
      if ( datm_ctaapagar.qry_lista_NR_REF.AsString <> '' ) then
      begin
        BoxMensagem( 'Conta Contábil: ' + Trim( qry_lista_NR_CTAAPAGAR.AsString ) + ' já foi montada!', 2 );
        Erro := True;
        Break;
      end;
      If vCodFavorecido <> datm_ctaapagar.qry_lista_CD_FAVORECIDO.AsString Then
      begin
        BoxMensagem( 'Para efetuar a montagem, é necessário escolher contas com Favorecidos iguais !', 2 );
        Erro := True;
        Break;
      end;
      If vCodBanco <> datm_ctaapagar.qry_lista_CD_BANCO.AsString Then
      begin
        BoxMensagem( 'Para efetuar a montagem, é necessário escolher contas com Bancos iguais !', 2 );
        Erro := True;
        Break;
      end;
      If vFormaPagto <> datm_ctaapagar.qry_lista_TP_PAGAMENTO.AsString Then
      begin
        BoxMensagem( 'Para efetuar a montagem, é necessário escolher contas com Formas de Pagamento iguais !', 2 );
        Erro := True;
        Break;
      end;
      With TQuery.Create(Application) Do
      Begin
        DatabaseName := 'DBBROKER';
        Close;
        SQL.Clear;
        SQL.Add('select ISNULL(SUM(VL_LANCAMENTO),0) VALOR from TCTAAPAGAR_LANC');
        SQL.Add('where DT_CTAAPAGAR =:DT_CTAAPAGAR and NR_CTAAPAGAR =:NR_CTAAPAGAR');
        SQL.Add(' and CD_UNID_NEG = :CD_UNID_NEG');
        ParamByName('DT_CTAAPAGAR').AsDateTime := qry_lista_DT_CTAAPAGAR.AsDateTime;
        ParamByName('NR_CTAAPAGAR').AsString   := datm_ctaapagar.qry_lista_NR_CTAAPAGAR.AsString;
        ParamByName('CD_UNID_NEG').AsString   := datm_ctaapagar.qry_lista_CD_UNID_NEG.AsString;
        Open;
        If MyRound(FieldByName('VALOR').AsFloat,2) <> MyRound(datm_ctaapagar.qry_lista_VL_PAGAMENTO.AsFloat,2) Then
        Begin
          BoxMensagem( 'Para efetuar a montagem, é necessário fazer a distribuição ' + #13#10 +
                       'no lançamento de nº ' + Trim( qry_lista_NR_CTAAPAGAR.AsString ), 2 );
          Erro := True;
          Break;
        End;
        Close;
        SQL.Clear;
        SQL.Add('select VL_LANCAMENTO from TCTAAPAGAR_LANC');
        SQL.Add('where DT_CTAAPAGAR =:DT_CTAAPAGAR and NR_CTAAPAGAR =:NR_CTAAPAGAR and VL_LANCAMENTO = 0');
        SQL.Add(' and CD_UNID_NEG = :CD_UNID_NEG');
        ParamByName('DT_CTAAPAGAR').AsDateTime := qry_lista_DT_CTAAPAGAR.AsDateTime;
        ParamByName('NR_CTAAPAGAR').AsString   := datm_ctaapagar.qry_lista_NR_CTAAPAGAR.AsString;
        ParamByName('CD_UNID_NEG').AsString   := datm_ctaapagar.qry_lista_CD_UNID_NEG.AsString;
        Open;
        If Not IsEmpty Then
        Begin
          BoxMensagem( 'Existem contas zeradas no Lançamento, favor verificar !', 2 );
          Pgctrl_ctaapagar.ActivePage := ts_lancamentos;
          Erro := True;
          Break;
        End;
        Free;
      End;
    end;

    If Not Erro Then
      If Not ErroDtVenc Then  // pra msg não ficar aparecendo na tela toda hora
        VerificaDtVenc;

    If Not Erro Then
    Begin
      qry_ult_ref_.Close;
      qry_ult_ref_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unidade.Text;
      qry_ult_ref_.Prepare;
      qry_ult_ref_.Open;
      UltRef := qry_ult_ref_.FieldByName('ULT_REF').AsInteger;
      With TQuery.Create(Application) Do
      Begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQl.Add('SELECT RIGHT( 000 + CONVERT( varchar, ( CONVERT( int,');
        SQl.Add('ISNULL( MAX( NR_REF ), 000 ) ) + 1 ) ), 3 ) ULT_REF');
        SQl.Add('FROM   TCTAAPAGAR');
        SQl.Add('WHERE');
        SQl.Add('CD_UNID_NEG = :CD_UNID_NEG and');
        SQl.Add('DT_MONTAGEM = convert(datetime,convert(varchar,getdate(),103),103)');
        ParamByName('CD_UNID_NEG').AsString    := datm_ctaapagar.qry_lista_CD_UNID_NEG.AsString;
        Open;
        If datm_ctaapagar.qry_ult_ref_.FieldByName('ULT_REF').AsInteger < FieldByName('ULT_REF').AsInteger Then
          UltRef := FieldByName('ULT_REF').AsInteger
        Else
          UltRef := UltRef + 1;
        Free;
      End;

      For I := 0 To dbgrd_lista.SelectedRows.Count - 1 Do
      Begin
        TTable(dbgrd_lista.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_lista.SelectedRows[I]));
        With TQuery.Create(Application) Do
        Begin
          DatabaseName := 'DBBROKER';
          SQL.Clear;
          SQl.Add('UPDATE TCTAAPAGAR set');
          SQl.Add('NR_REF =:NR_REF, IN_DISTRIBUICAO =:IN_DISTRIB, DT_MONTAGEM =:DT_MONTAGEM, STATUS = ''6''');
          SQl.Add('where DT_CTAAPAGAR =:DT_CTAAPAGAR and NR_CTAAPAGAR =:NR_CTAAPAGAR and CD_UNID_NEG =:CD_UNID_NEG');
          ParamByName('NR_REF').AsString         := StrZero(UltRef,3);
          ParamByName('IN_DISTRIB').AsString     := '1';
          ParamByName('NR_CTAAPAGAR').AsString   := datm_ctaapagar.qry_lista_NR_CTAAPAGAR.AsString;
          ParamByName('DT_CTAAPAGAR').AsDateTime := datm_ctaapagar.qry_lista_DT_CTAAPAGAR.AsDateTime;
          ParamByName('CD_UNID_NEG').AsString    := msk_cd_unidade.Text;
          ParamByName('DT_MONTAGEM').AsDate      := date;
          ExecSql;
          Free;
        End;
      End;
      BoxMensagem('Montagem efetuada com sucesso !',3);
      dbgrd_lista.DataSource.DataSet.Close;
      dbgrd_lista.DataSource.DataSet.Open;
    End;
  End;
end;


procedure Tfrm_ctaapagar.BtnAutorizClick(Sender: TObject);
begin
  frm_main.mi_AutorizaodePagamentos.Click;
  datm_ctaapagar.qry_lista_.Close;
  datm_ctaapagar.qry_lista_.Open;
end;


procedure Tfrm_ctaapagar.btnFinanceiroClick(Sender: TObject);
begin
  frm_main.mi_fin_lanc.Click;
  datm_ctaapagar.qry_lista_.Close;
  datm_ctaapagar.qry_lista_.Open;
end;


procedure Tfrm_ctaapagar.DBDateEdit1Exit(Sender: TObject);
begin
  if DBDateEdit1.Text = '  /  /    ' then
  begin
    BoxMensagem('Campo Data de Emissão DOC deve ser preenchido!', 2);
    pgctrl_ctaapagar.ActivePage := ts_dados_basicos;
    DBDateEdit1.SetFocus;
    Exit;
  end;
end;

procedure Tfrm_ctaapagar.dblck_lanc_provisionadoClick(Sender: TObject);
begin
  if datm_ctaapagar.qry_ctaapagar_IN_LANC_PROVISIONADO.AsString = '0' then
  begin
    dbedt_cd_fornecedor.Text := '';
    datm_ctaapagar.qry_ctaapagar_CD_FORNECEDOR.AsString := '';
    dbedt_cd_fornecedor.Enabled := False;
    btn_co_fornecedor.Enabled := False;
  end
  else
  begin
    dbedt_cd_fornecedor.Enabled := True;
    btn_co_fornecedor.Enabled := True;
  end;
end;

procedure Tfrm_ctaapagar.dblck_lanc_provisionadoExit(Sender: TObject);
begin
  if datm_ctaapagar.qry_ctaapagar_IN_LANC_PROVISIONADO.AsString = '0' then
  begin
    dbedt_cd_fornecedor.Text := '';
    datm_ctaapagar.qry_ctaapagar_CD_FORNECEDOR.AsString := '';
    dbedt_cd_fornecedor.Enabled := False;
    btn_co_fornecedor.Enabled := False;
  end else begin
    dbedt_cd_fornecedor.Enabled := True;
    btn_co_fornecedor.Enabled := True;
    if dbedt_cd_fornecedor.CanFocus then
      dbedt_cd_fornecedor.SetFocus;
  end;
end;

procedure Tfrm_ctaapagar.MaskEdit7Exit(Sender: TObject);
begin
  if MaskEdit8.Text <> '' then
    MaskEdit8.Text := Copy('00000',1,5-Length(MaskEdit8.Text)) + MaskEdit8.Text;
  if (datm_ctaapagar.ds_ctaapagar.State <> dsInsert) and
     (datm_ctaapagar.ds_ctaapagar.State <> dsEdit)then
    btn_pesqClick(btn_Pesq);  //Fazer a pesquisa somente se não estiver em modo de inserção/edição
end;

procedure Tfrm_ctaapagar.SpeedButton1Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
    MaskEdit8.Text := ConsultaOnLineEx('TFAVORECIDO','Favorecido',['CD_FAVORECIDO','NM_FAVORECIDO'],['Código','Nome'],'CD_FAVORECIDO',frm_main.mi_cad_fin_fav)
  else
    Edit1.Text := ConsultaLookUP('TFAVORECIDO','CD_FAVORECIDO',MaskEdit8.Text,'NM_FAVORECIDO')
end;

procedure Tfrm_ctaapagar.dbgrd_listaDblClick(Sender: TObject);
var
  vDataOld : TDateTime;
  vNumeroOld, vChangeTo : string;
begin
  with datm_ctaapagar do
  begin
    if dbgrd_lista.SelectedField.Name = 'qry_lista_calcIN_SELECIONADO' then
    begin
      vDataOld   := qry_lista_DT_CTAAPAGAR.AsDateTime;
      vNumeroOld := qry_lista_NR_CTAAPAGAR.AsString;
      qry_lista_.DisableControls;
      if qry_lista_IN_SELECIONADO.AsString = '1' then
        vChangeTo := '0'
      else vChangeTo := '1';
      with TQuery.Create(application) do
      begin
        Databasename := 'DBBROKER';
        SQL.Clear;
        SQL.Add('UPDATE TCTAAPAGAR SET IN_SELECIONADO = ''' + vChangeTo + '''');
        SQL.Add(' WHERE DT_CTAAPAGAR = :DATA AND NR_CTAAPAGAR = :NUMERO');
        ParamByName('DATA').AsDateTime := qry_lista_DT_CTAAPAGAR.AsDateTime;
        ParamByName('NUMERO').AsString := qry_lista_NR_CTAAPAGAR.AsString;
        ExecSQL;
        Free;
      end;
      AbreConta( StrToDateDef( msk_dt_inicio.Text,0 ), StrToDateDef( msk_dt_fim.Text,0 ), msk_cd_unidade.Text );
      qry_lista_.Locate('CD_UNID_NEG;DT_CTAAPAGAR;NR_CTAAPAGAR',VarArrayOf([msk_cd_unidade.Text,vDataOld,vNumeroOld]),[loPartialKey]);
      qry_lista_.EnableControls;
    end;
  end;                                                       
end;

procedure Tfrm_ctaapagar.btn_rateioClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_ctaapagar.qry_ctaapagar_lanc_) then Exit;
    Btn_Mi( False, True, True, False );
    datm_ctaapagar.qry_ctaapagar_lanc_CD_RATEIO.AsString := ConsultaOnLineEx('TRATEIO','Rateios',['CD_RATEIO','NM_RATEIO'],['Código','Descrição'],'CD_RATEIO',frm_main.mi_cad_fin_conta_gerencial)
  end
  else
    dbedt_nm_rateio.Text := ConsultaLookUP('TRATEIO','CD_RATEIO',dbedt_cd_rateio.Text,'NM_RATEIO')
end;

procedure TFrm_ctaapagar.GeraRateio( const pDT_CTAAPAGAR : TDateTime;
  const pNrConta : string; const pCdUnidade : string; const pCd_Rateio : string;
  pValor : Real; pCodLancamento : Integer = 0);
var
  vCalcRegra3, vDesconto, vValorCalc, vValorAnterior, vValorTotalRateado, vDiferencaVal : Real;
  vGrauAtual, vGrauAnt : Integer;
  vCodLancamento, ContaFinal : string;

  procedure CorrigeArredondamento;
  begin
    vValorTotalRateado := 0;
    datm_ctaapagar.qry_ctaapagar_rateio.Close;
    datm_ctaapagar.qry_ctaapagar_rateio.Open;
    datm_ctaapagar.qry_ctaapagar_rateio.First;

    while not datm_ctaapagar.qry_ctaapagar_rateio.Eof do
    begin
      vValorTotalRateado := vValorTotalRateado + (Arredondar(datm_ctaapagar.qry_ctaapagar_rateio.FieldByName('VALOR_RATEIO').AsFloat,2));
      datm_ctaapagar.qry_ctaapagar_rateio.Next;
    end;

    if vValorTotalRateado > 0 then
    begin
      if vValorTotalRateado <> pValor then
      begin
        vDiferencaVal := IIF(vValorTotalRateado > pValor,vValorTotalRateado,pValor) - IIF(vValorTotalRateado < pValor,vValorTotalRateado,pValor);
        datm_ctaapagar.qry_ctaapagar_rateio.Edit;
        datm_ctaapagar.qry_ctaapagar_rateio.FieldByName('VALOR_RATEIO').AsFloat := datm_ctaapagar.qry_ctaapagar_rateio.FieldByName('VALOR_RATEIO').AsFloat - vDiferencaVal;
        datm_ctaapagar.qry_ctaapagar_rateio.Post;
      end;
    end;
  end;
begin
  if pCd_Rateio <> '' then
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      if pCodLancamento = 0 then
      begin
        //seleciona o código do lançamento para fazer o relacionamento com os rateios
        Close;
        SQl.Clear;
        SQL.Add('SELECT max(CODIGO) CODIGO FROM TCTAAPAGAR_LANC');
        SQL.Add('where');
        SQL.Add('  DT_CTAAPAGAR =:DT_CTAAPAGAR and NR_CTAAPAGAR =:NR_CTAAPAGAR AND');
        SQL.Add('  CD_UNID_NEG =:CD_UNID_NEG');

        ParamByName('DT_CTAAPAGAR').AsDateTime := pDT_CTAAPAGAR;
        ParamByName('NR_CTAAPAGAR').AsString   := pNrConta;
        ParamByName('CD_UNID_NEG').AsString    := pCdUnidade;
        Open;
        vCodLancamento := FieldByName('CODIGO').AsString;
      end  //modo de edição, o código já vai ser passado
      else
      begin
        //Apaga os rateios para serem re-calculados
        datm_ctaapagar.qry_ctaapagar_rateio.First;
        while not datm_ctaapagar.qry_ctaapagar_rateio.EOF do
          datm_ctaapagar.qry_ctaapagar_rateio.Delete;

        vCodLancamento := IntToStr(pCodLancamento);
      end;

//------------------------ Correção do Valor Bruto -----------------------------
//Rotina para fazer o rateio em cima do valor Bruto da Conta - 03/03/2008
      Close;
      SQL.Clear;
      SQL.Add('SELECT VL_DESPESA FROM TCTAAPAGAR');
      SQL.Add('where');
      SQL.Add('  DT_CTAAPAGAR =:DT_CTAAPAGAR and NR_CTAAPAGAR =:NR_CTAAPAGAR AND');
      SQL.Add('  CD_UNID_NEG =:CD_UNID_NEG');

      ParamByName('DT_CTAAPAGAR').AsDateTime := pDT_CTAAPAGAR;
      ParamByName('NR_CTAAPAGAR').AsString   := pNrConta;
      ParamByName('CD_UNID_NEG').AsString    := pCdUnidade;
      Open;
      vCalcRegra3 := (( FieldByName('VL_DESPESA').AsFloat * pValor) ) / datm_ctaapagar.qry_ctaapagar_CalcPagamento.AsFloat;

//------------------------------------------------------------------------------
      pValor := vCalcRegra3;

      //Seleciona as contas e percentagens do rateio selecionado
      Close;
      Sql.Clear;
      Sql.Add('select CD_CT_CUSTO, PERC from TRATEIO_CONTAS where CD_RATEIO =:CD_RATEIO');
      Sql.Add('order by CD_CT_CUSTO');
      ParamByName('CD_RATEIO').AsString := pCd_Rateio;
      Open;
      vValorCalc         := 0;
      vValorAnterior     := 0;

      with datm_ctaapagar do
      begin
        while not EOF do
        begin
          vGrauAtual := ContaOcorrencias(FieldByName('CD_CT_CUSTO').AsString,'.');
          if vGrauAtual = 1 then
          begin
            vValorCalc     := (pValor/100) * FieldByName('PERC').AsFloat;
            vValorAnterior := vValorCalc;
            vGrauAnt := vGrauAtual;
          end
          else
          begin
            if vGrauAtual > vGrauAnt then
            begin
              vValorAnterior := vValorCalc;
              vValorCalc     := (vValorAnterior/100) * FieldByName('PERC').AsFloat;
              vGrauAnt := vGrauAtual;
            end
            else
            begin
              if vGrauAtual = vGrauAnt then
              begin
                vValorCalc     := (vValorAnterior/100) * FieldByName('PERC').AsFloat;
                vGrauAnt := vGrauAtual;
              end
              else  //grauAtual é menor
              begin
                vValorCalc     := (pValor/100) * FieldByName('PERC').AsFloat;
                vGrauAnt := vGrauAtual;
              end;
            end;
          end;

          ContaFinal := ConsultaLookUPSQL('select max(CD_CT_CUSTO) CONTA from TRATEIO_CONTAS ' +
                                          'where CD_RATEIO = ''' + pCd_Rateio + ''' and ' +
                                          'CD_CT_CUSTO like ''' + FieldByName('CD_CT_CUSTO').AsString + '%''', 'CONTA');

          if FieldByName('CD_CT_CUSTO').AsString = ContaFinal then      //qdo a conta for a maior então, jogar o valor rateado
          begin
            qry_ctaapagar_rateio.Insert;
            qry_ctaapagar_rateio.FieldByName('DT_CTAAPAGAR').AsDateTime := pDT_CTAAPAGAR;
            qry_ctaapagar_rateio.FieldByName('NR_CTAAPAGAR').AsString   := pNrConta;
            qry_ctaapagar_rateio.FieldByName('CD_UNID_NEG').AsString    := pCdUnidade;
            qry_ctaapagar_rateio.FieldByName('CD_CT_CUSTO').AsString    := FieldByName('CD_CT_CUSTO').AsString;
            qry_ctaapagar_rateio.FieldByName('CODIGO').AsString         := vCodLancamento;
            qry_ctaapagar_rateio.FieldByName('CD_RATEIO').AsString      := pCd_Rateio;
            qry_ctaapagar_rateio.FieldByName('VALOR_RATEIO').AsFloat    := Arredondar(vValorCalc,2);
            qry_ctaapagar_rateio.Post;
          end;
          Next;
        end;
        //Correção do arredondamento
        CorrigeArredondamento;
      end;
      Free;
    end;
  end;
end;

procedure Tfrm_ctaapagar.dbedt_cd_rateioExit(Sender: TObject);
begin
  if Trim(dbedt_cd_rateio.Text) <> '' then
    dbedt_cd_rateio.Text := FStrZero(dbedt_cd_rateio.Text, 4);
end;

end.

