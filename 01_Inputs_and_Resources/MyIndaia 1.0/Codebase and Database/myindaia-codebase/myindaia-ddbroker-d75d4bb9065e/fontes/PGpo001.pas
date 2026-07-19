unit PGpo001;

interface

uses
  Variants, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, dbTables, UCRPE32, Gauges, Funcoes;

type
  Tfrm_po = class(TForm)
    pagPO: TPageControl;
    tabLista: TTabSheet;
    grdLista: TDBGrid;
    tabDados: TTabSheet;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    tabItens: TTabSheet;
    mi_imprimir: TMenuItem;
    tabNVE: TTabSheet;
    tabAdicionais: TTabSheet;
    DataSource1: TDataSource;
    Label53: TLabel;
    lblLookTermoPagto: TLabel;
    btn_co_termo_pagto: TSpeedButton;
    lbl_nr_processo: TLabel;
    lblLookImportador: TLabel;
    btn_co_importador: TSpeedButton;
    lblLookExportador: TLabel;
    btn_co_exportador: TSpeedButton;
    lblLookFabricante: TLabel;
    btn_co_fabricante: TSpeedButton;
    lblLookPaisAquisicao: TLabel;
    btn_co_pais_aquis: TSpeedButton;
    lblLookPaisOrigem: TLabel;
    btn_co_pais_orig: TSpeedButton;
    btn_co_local_desembarque: TSpeedButton;
    lblLookLocalDesembarque: TLabel;
    lblLookArea: TLabel;
    btn_co_area: TSpeedButton;
    Label4: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    Label35: TLabel;
    Bevel5: TBevel;
    imgCalc: TImage;
    imgMontado: TImage;
    lblNCM: TLabel;
    lblLookNivelNVE: TLabel;
    sp_nivel: TSpeedButton;
    lblLookAtributo: TLabel;
    sp_atrib: TSpeedButton;
    lblLookEspecificacao: TLabel;
    sp_espec: TSpeedButton;
    lbl_obs: TLabel;
    edt_nr_processo: TDBEdit;
    dbedt_dt_abertura: TDBEdit;
    dbgrid1: TDBGrid;
    DBedtLookImportador: TDBEdit;
    edtLookImportador: TEdit;
    dbrgrp_fabr_expo: TDBRadioGroup;
    DBedtLookExportador: TDBEdit;
    edtLookExportador: TEdit;
    DBedtLookFabricante: TDBEdit;
    edtLookFabricante: TEdit;
    DBedtLookLocalDesembarque: TDBEdit;
    edtLookLocalDesembarque: TEdit;
    DBedtLookArea: TDBEdit;
    edtLookArea: TEdit;
    DBedtLookPaisAquisicao: TDBEdit;
    edtLookPaisAquisicao: TEdit;
    DBedtLookPaisOrigem: TDBEdit;
    edtLookPaisOrigem: TEdit;
    dbm_obs: TDBMemo;
    edt_nr_processo2: TDBEdit;
    edtLookTermoPagto: TEdit;
    dbedt_nr_processo: TDBEdit;
    DBedtLookNivelNVE: TDBEdit;
    edtLookNivelNVE: TEdit;
    DBedtLookAtributo: TDBEdit;
    edtLookAtributo: TEdit;
    DBedtLookEspecificacao: TDBEdit;
    edtLookEspecificacao: TEdit;
    DBGrid2: TDBGrid;
    Label6: TLabel;
    Label8: TLabel;
    DBRadioGroup5: TDBRadioGroup;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    lblLookMoedaNegociada: TLabel;
    DBedtLookMoedaNegociada: TDBEdit;
    lblLookMoedaFrete: TLabel;
    DBedtLookMoedaFrete: TDBEdit;
    lblLookTipoFrete: TLabel;
    DBedtLookTipoFrete: TDBEdit;
    edtLookTipoFrete: TEdit;
    btn_co_moeda: TSpeedButton;
    btn_co_moeda_frete: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label16: TLabel;
    dbedt_vl_merc: TDBEdit;
    Label15: TLabel;
    dbedt_vl_pl: TDBEdit;
    Label19: TLabel;
    dbedt_vl_frete_prep: TDBEdit;
    Label22: TLabel;
    dbedt_vl_despesa: TDBEdit;
    lbl_peso_bruto: TLabel;
    dbedt_pb_po: TDBEdit;
    Label18: TLabel;
    dbedt_vl_frete_col: TDBEdit;
    Label23: TLabel;
    dbedt_vl_desconto: TDBEdit;
    Label20: TLabel;
    dbedt_vl_frete_nac: TDBEdit;
    Label17: TLabel;
    dbedt_vl_seguro: TDBEdit;
    dbedt_vl_frete_interno: TDBEdit;
    Label24: TLabel;
    edtLookMoedaNegociada: TEdit;
    edtLookMoedaFrete: TEdit;
    Label52: TLabel;
    DBEdit13: TDBEdit;
    Label54: TLabel;
    DBEdit14: TDBEdit;
    Bevel4: TBevel;
    Bevel6: TBevel;
    crp_po: TCRPE;
    DBedtLookTermoPagto: TDBEdit;
    dbrdgrp_cobert_cambio: TDBRadioGroup;
    dbedt_nr_fatura: TDBEdit;
    dbedt_dt_fatura: TDBEdit;
    DBRadioGroup4: TDBRadioGroup;
    Shape1: TShape;
    Shape4: TShape;
    Panel3: TPanel;
    Shape5: TShape;
    Panel4: TPanel;
    Panel5: TPanel;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    Panel2: TPanel;
    btn_sair: TSpeedButton;
    Panel1: TPanel;
    lbl_servico: TLabel;
    dbedt_cd_servico: TDBEdit;
    btn_co_servico: TSpeedButton;
    Label11: TLabel;
    dbedt_cd_pais_proc: TDBEdit;
    SpeedButton2: TSpeedButton;
    lblLookViaTransp: TLabel;
    SpeedButton6: TSpeedButton;
    Label33: TLabel;
    SpeedButton5: TSpeedButton;
    edtLookViaTransp: TEdit;
    edt_cd_local_embarque: TEdit;
    DBedtLookViaTransp: TDBEdit;
    dbedt_cd_local_embarque: TDBEdit;
    lblLookIncoterm: TLabel;
    DBedtLookIncoterm: TDBEdit;
    edtLookIncoterm: TEdit;
    btn_co_incoterm: TSpeedButton;
    dbedt_nm_servico: TEdit;
    dbedt_nm_pais_proc: TEdit;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lblOrdem: TLabel;
    edtChave: TEdit;
    cmbOrdem: TComboBox;
    pnl_Calc: TPanel;
    Label1: TLabel;
    grfCalc: TGauge;
    shp2: TShape;
    shp3: TShape;
    btnProcRealiza: TSpeedButton;
    btnGestaoPedido: TSpeedButton;
    mniGestaoPedido: TMenuItem;
    mniProcRealiza: TMenuItem;
    dbedtNrIParcial: TDBEdit;
    Label21: TLabel;
    dbedtNrItemCliente: TDBEdit;
    navPO: TDBNavigator;
    PnlDados: TPanel;
    Label26: TLabel;
    lblLookUnMed: TLabel;
    btn_co_unid_med: TSpeedButton;
    Label27: TLabel;
    Label2: TLabel;
    Label36: TLabel;
    Label30: TLabel;
    lbl_Destaque: TLabel;
    Label31: TLabel;
    lblLookFabric_Prod: TLabel;
    btn_co_fabr_item: TSpeedButton;
    btn_co_pais_origem: TSpeedButton;
    lblLookPaisOrigemItem: TLabel;
    Label38: TLabel;
    lbl_numero: TLabel;
    Label5: TLabel;
    Label14: TLabel;
    btn_co_naladi_sh: TSpeedButton;
    Label34: TLabel;
    Label32: TLabel;
    btn_co_naladi_ncca: TSpeedButton;
    btn_co_ncm: TSpeedButton;
    lbl_pc_com_item: TLabel;
    lbl_pc_desc_item: TLabel;
    lbl_vl_desc_item: TLabel;
    Label12: TLabel;
    btn_co_pais_aquisicao2: TSpeedButton;
    lbl_pais_aquisicao2: TLabel;
    lbl_exportador2: TLabel;
    btn_co_exportador2: TSpeedButton;
    edtLookUnMed: TEdit;
    edtLookFabric_Prod: TEdit;
    edtLookPaisOrigemItem: TEdit;
    edt_nm_unid_est: TEdit;
    dbedt_qt_mercadoria: TDBEdit;
    DBedtLookUnMed: TDBEdit;
    dbedt_vl_unitario: TDBEdit;
    dblkcbox_calc_item: TDBLookupComboBox;
    dbedt_peso_liq: TDBEdit;
    dbedt_cd_ncm: TDBEdit;
    dbedt_cd_naladi_ncca: TDBEdit;
    dbedt_cd_naladi_sh: TDBEdit;
    dbedt_qt_unid_estat: TDBEdit;
    dbedt_vl_item: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    dbm_nm_mercadoria: TDBMemo;
    dblckpbox_tp_modalidade: TDBLookupComboBox;
    dbedt_cd_numero_ato: TDBEdit;
    DBedtLookPaisOrigemItem: TDBEdit;
    DBedtLookFabric_Prod: TDBEdit;
    dbedt_pc_com_item: TDBEdit;
    dbedt_pc_desc_item: TDBEdit;
    dbedt_vl_desc_item: TDBEdit;
    dbrdgrp_in_fabr_expo_item: TDBRadioGroup;
    dbedt_nm_exportador2: TEdit;
    dbedt_nm_pais_aquisicao2: TEdit;
    dbedt_cd_pais_aquisicao2: TDBEdit;
    dbedt_cd_exportador2: TDBEdit;
    Panel7: TPanel;
    btn_co_produto: TSpeedButton;
    Label10: TLabel;
    Label13: TLabel;
    BtnArea: TSpeedButton;
    edtLookMercadoria: TEdit;
    Edit1: TEdit;
    EditArea: TDBEdit;
    DBedtLookMercadoria: TDBEdit;
    Label9: TLabel;
    dbedt_cd_cliente: TDBEdit;
    edt_nm_cliente: TEdit;
    btn_co_cliente: TSpeedButton;
    procedure SincronizarMenu;
    procedure IniciarCadastro(Sender: TObject);
    procedure PO_MudancaDePagina(Sender: TObject);
    procedure Procurar(Sender: TObject);
    procedure TrocarOrdem(Sender: TObject);
    procedure Incluir(Sender: TObject);
    procedure Sair(Sender: TObject);
    procedure Salvar(Sender: TObject);
    procedure Cancelar(Sender: TObject);
    procedure Excluir(Sender: TObject);
    procedure LookImportador(Sender: TObject);
    procedure LookExportador(Sender: TObject);
    procedure LookFabricante(Sender: TObject);
    procedure LookMercadoria(Sender: TObject);
    procedure LookArea(Sender: TObject);
    procedure LookPaisAquisicao(Sender: TObject);
    procedure LookPaisOrigem(Sender: TObject);
    procedure LookShipTo(Sender: TObject);
    procedure LookUrgencia(Sender: TObject);
    procedure ChangeTipoFabricante(Sender: TObject);
    procedure LookIncoterm(Sender: TObject);
    procedure LookTermoPagto(Sender: TObject);
    procedure LookMoedaNegociada(Sender: TObject);
    procedure LookMoedaFrete(Sender: TObject);
    procedure LookViaTransp(Sender: TObject);
    procedure LookTipoFrete(Sender: TObject);
//    procedure LookMoedaNeg(Sender: TObject);
//    procedure LookPais(Sender: TObject);
//    procedure LookFornecaixa(Sender: TObject);
//    procedure LookTpEmbalagem(Sender: TObject);
//    procedure LookPaisCxMae(Sender: TObject);
//    procedure LookFornecxmae(Sender: TObject);
//    procedure LookCaixa(Sender: TObject);
    procedure LookNcm(Sender: TObject);
    procedure LookNaladiNCCA(Sender: TObject);
    procedure LookNaladiSH(Sender: TObject);
    procedure LookUnidMed(Sender: TObject);
    procedure LookFabric_Prod(Sender: TObject);
    procedure LookPaisOrigemItem(Sender: TObject);
//    procedure LookMoedaNegItem(Sender: TObject);
    procedure Calcular(Sender: TObject);
    procedure CalcularValorDoItem(Sender: TObject);
    procedure CalcularQtdInicialDoItem(Sender: TObject);
    procedure CalcEmbalagemVolume(Sender: TObject);
    procedure LookNivelNVE(Sender: TObject);
    procedure LookAtributo(Sender: TObject);
    procedure LookEspecificacao(Sender: TObject);
    procedure FiltrarNivel(Sender: TObject);
    procedure FiltrarAtrib(Sender: TObject);
    procedure EscSai(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CarregarMercadoria(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure btn_co_local_desembarqueClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edt_nr_processoExit(Sender: TObject);
    procedure DBedtLookMercadoriaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBedtLookImportadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_servicoClick(Sender: TObject);
    procedure btn_co_exportador2Click(Sender: TObject);
    procedure btn_co_pais_aquisicao2Click(Sender: TObject);
    procedure dbrdgrp_in_fabr_expo_itemChange(Sender: TObject);
    procedure DBedtLookExportadorExit(Sender: TObject);
    procedure dblkcbox_calc_itemClick(Sender: TObject);
    procedure dbedt_vl_itemEnter(Sender: TObject);
    procedure dbedt_qt_mercadoriaExit(Sender: TObject);
    procedure BtnAreaClick(Sender: TObject);
    procedure dbedtNrItemClienteExit(Sender: TObject);
    procedure dbedtNrItemClienteKeyPress(Sender: TObject; var Key: Char);
    procedure btnGestaoPedidoClick(Sender: TObject);
    procedure btnProcRealizaClick(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure dbedt_cd_clienteExit(Sender: TObject);
  public
    pesq_nr_po: String;
    NCM, NR_PROCESSO, CD_EMPRESA, NR_ITEM: String;
    OldTag: Integer;
    DisplayNR_ITEM, DisplayQT_ITEM: Integer;
    cd_atributo,SQL: String;
    SQL_ATR, SQL_ESP: String;
    function HabilitaCampos(const vHab: Boolean): Boolean;
  private
    function ItemJaUtilizado(const pRef : string; const pCliente : string;
      const pNrItem : string; const pNrParcial : Integer) : Boolean;
  end;

var
  frm_po: Tfrm_po;

implementation

uses ConsOnLineEx, PGSM117, GSMLIB, PGPO002, PGSM103, PGSM104, PGSM014, PGSM051,
     PGGP001, PGSM210, PGSM022, PGGP017;

// Indentificador dos tags de cada nivel
const LISTA         = 0;
const PO            = 1;
const DESPESAS      = 2;
const EMBALAGEM     = 3;
const ITENS         = 4;
const DESPESAS_ITEM = 5;
const NVE           = 6;

{$R *.DFM}

// =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= //
//  30.08.2002                                                               //
//  Reconstruido e otimizado por Eduardo Faraco e Vítor Zanin                //
// =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= //

function FindControl(Control: TWinControl; Name: String): TControl;
var c: Integer;
begin
  Result := nil;
  for c := 0 to Control.ControlCount-1 do
  begin
    if Control.Controls[c].Name = Name then
    begin
       Result := Control.Controls[c];
       Break;
    end;
  end;
end;

function CheckLooks(Control: TWinControl): Boolean;
var
  c: Integer;
begin
  Result := True;
  for c := 0 to Control.ControlCount-1 do
  begin
    if (Pos('DBedtLook',Control.Controls[c].Name) > 0) and
       (TEdit(Control.Controls[c]).Text <> '')         and
       (TEdit(FindControl(Control,Copy(Control.Controls[c].Name,3,100))).Text = '') then
       begin
       frm_po.pagPo.ActivePage := TTabSheet(Control);
       MessageDlg('Código inválido especificado no campo ' + TLabel(FindControl(Control,'lbl' + Copy(Control.Controls[c].Name,6,100))).Caption,mtError,[MbOK],0);
       TEdit(Control.Controls[c]).SetFocus;
       Result := False;
       Exit;
    end;
  end;
end;

procedure CleanLooks(Control: TwinControl);
var
  c: Integer;
begin
  for c := 0 to Control.ControlCount-1 do
  begin
    if (Pos('DBedtLook',Control.Controls[c].Name) > 0) and
       (TEdit(Control.Controls[c]).Text = '')          then
       TEdit(FindControl(Control,Copy(Control.Controls[c].Name,3,100))).Text := ''
  end;
end;

procedure Tfrm_po.SincronizarMenu;
begin
  // Este método simplesmente iguala os estados dos botôes e menus
  mi_incluir.Enabled  := btn_incluir.Enabled;
  mi_salvar.Enabled   := btn_salvar.Enabled;
  mi_cancelar.Enabled := btn_cancelar.Enabled;
  mi_excluir.Enabled  := btn_excluir.Enabled;
  //mi_imprimir.Enabled := btn_imprimir.Enabled;
  mi_sair.Enabled     := btn_sair.Enabled
end;

procedure Tfrm_po.IniciarCadastro(Sender: TObject);
begin
  // Cria o data module
  datm_po := Tdatm_po.Create(nil);

  datm_po.qry_po_lista_.Close;
 { datm_po.qry_po_lista_.SQL.Clear;
  datm_po.qry_po_lista_.SQL.ADD('SELECT NR_PROCESSO, CD_IMPORTADOR, EN.NM_EMPRESA, IN_CALCULADO, PO.CD_EMPRESA, ENC.NM_EMPRESA AS NM_CLIENTE');
  datm_po.qry_po_lista_.SQL.ADD('FROM TPO PO, TEMPRESA_NAC EN, TEMPRESA_NAC ENC');
  datm_po.qry_po_lista_.SQL.ADD('WHERE EN.CD_EMPRESA = PO.CD_IMPORTADOR');
  datm_po.qry_po_lista_.SQL.ADD('  AND ENC.CD_EMPRESA = PO.CD_EMPRESA');
  datm_po.qry_po_lista_.SQL.ADD('ORDER BY NR_PROCESSO');    }
  datm_po.qry_po_lista_.Prepare;
  datm_po.qry_po_lista_.Open;

  // Abrir lookups
  datm_po.tbl_tp_calc_item_.Open;
  datm_po.qry_tp_modalidade_.Open;

  // Iniciar o formulario
  cmbOrdem.ItemIndex := 0;
  pagPO.ActivePage := tabLista;
  PO_MudancaDePagina(nil);
  NR_PROCESSO := datm_po.qry_po_lista_.FieldByname('NR_PROCESSO').AsString;
  CD_EMPRESA  := datm_po.qry_po_lista_.FieldByname('CD_EMPRESA').AsString;
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.ADD('SELECT COUNT(NR_PROCESSO) FROM TPO_ITEM  (NOLOCK) WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO) + ' AND CD_EMPRESA = ' + QuotedStr(CD_EMPRESA));
    Open;
    if Fields[0].AsInteger > 0 then
      NR_ITEM := '001'
    else
      NR_ITEM := '';
    Free;
  end;
end;

procedure Tfrm_po.Sair(Sender: TObject);
begin
  // Fechar lookups
  datm_po.tbl_tp_calc_item_.Close;
  datm_po.qry_tp_modalidade_.Close;

  // Fechar a po e limpa rotina de atalho
  Close;
  str_cd_rotina_atalho := '';
  nr_po_gestao         := '';
  cd_cliente_gestao    := '';
  nr_processo_gestao   := '';
end;

procedure Tfrm_po.PO_MudancaDePagina(Sender: TObject);
var N: String;
begin
  if pagPO.ActivePage = tabLista then
  begin
    btnGestaoPedido.Enabled := False;
    btnProcRealiza.Enabled  := False;
    mniGestaoPedido.Enabled := False;
    mniProcRealiza.Enabled  := False;
  end
  else
  begin
    btnGestaoPedido.Enabled := True;
    btnProcRealiza.Enabled  := True;
    mniGestaoPedido.Enabled := True;
    mniProcRealiza.Enabled  := True;
  end;  

  // Verificar se o usuário deseja cancelar as alterações, se houver
  if (OldTag = PO) and (pagPO.ActivePage.Tag <> PO) and (datm_po.qry_po_.State in [dsEdit, dsInsert]) then
  begin
     if MessageDlg('Cancela alterações na PO?',mtConfirmation,[mbYes,mbNo],0) = mrYes then datm_po.qry_po_.Cancel
     else begin
        pagPo.ActivePage := tabDados;
        Exit;
     end;
  end;

  if (OldTag = ITENS) and (datm_po.qry_po_itens_.State in [dsEdit, dsInsert]) then
  begin
     if MessageDlg('Cancela alterações no Item?',mtConfirmation,[mbYes,mbNo],0) = mrYes then datm_po.qry_po_itens_.Cancel
     else begin
        pagPo.ActivePage := tabItens;
        Exit;
     end;
  end;

  // Atualizar o ponteiro geral
  if OldTag = PO then
  begin
    NR_PROCESSO := datm_po.qry_po_.FieldByName('NR_PROCESSO').AsString;
    CD_EMPRESA  := datm_po.qry_po_.FieldByName('CD_EMPRESA').AsString;
  end
  else
  begin
    NR_PROCESSO := datm_po.qry_po_lista_.FieldByName('NR_PROCESSO').AsString;
    CD_EMPRESA  := datm_po.qry_po_lista_.FieldByName('CD_EMPRESA').AsString;
  end;
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.ADD('SELECT COUNT(NR_PROCESSO) FROM TPO_ITEM (NOLOCK) WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO) + ' AND CD_EMPRESA = ' + QuotedStr(CD_EMPRESA));
    Open;
    if Fields[0].AsInteger > 0 then
      NR_ITEM := '001'
    else
      NR_ITEM := '';
    Free;
  end;
  N := NR_ITEM;

  // Procura deve estar habilitada apenas na lista das P.O.s
  lbl_Pesquisa.Enabled := (pagPO.ActivePage.Tag = LISTA);
  edtChave.Enabled     := (pagPO.ActivePage.Tag = LISTA);
  lblOrdem.Enabled     := (pagPO.ActivePage.Tag = LISTA);
  cmbOrdem.Enabled     := (pagPO.ActivePage.Tag = LISTA);
  if edtChave.Enabled then
    edtChave.Color := clWindow
  else
    edtChave.Color := clBtnFace;
  if cmbOrdem.Enabled then
    cmbOrdem.Color := clWindow
  else
    cmbOrdem.Color := clBtnFace;

  if (pagPO.ActivePage.Tag <> ITENS) then
    datm_po.qry_po_itens_.Close;

  // Entrada na página da lista
  if (pagPO.ActivePage.Tag = LISTA) then
  begin
     navPO.Enabled := True;
     navPO.DataSource := datm_po.ds_po_lista;
     datm_po.qry_po_Lista_.Open;
//     datm_po.qry_po_Lista_.Locate('NR_PROCESSO',NR_PROCESSO,[]);
     btn_incluir.Enabled  := true;
     btn_excluir.Enabled  := (not datm_po.qry_po_lista_.IsEmpty);
     SincronizarMenu;
  end;

  // Entrada nas paginas da PO
  if (pagPO.ActivePage.Tag = PO) and (OldTag <> PO) then
  begin
     navPO.Enabled := False;
     datm_po.qry_po_.Close;
     datm_po.qry_po_.Params[0].AsString := NR_PROCESSO;
     datm_po.qry_po_.Params[1].AsString := CD_EMPRESA;
     datm_po.qry_po_.Prepare;
     datm_po.qry_po_.Open;
     datm_po.ds_po.AutoEdit := not datm_po.qry_po_.IsEmpty;
     CleanLooks(tabDados);
     CleanLooks(tabAdicionais);
  end;

  // Entrada na pagina de itens
  if (pagPO.ActivePage.Tag = ITENS)then
  begin
     navPO.Enabled := True;
     navPO.DataSource := datm_po.ds_po_itens;
     datm_po.qry_po_itens_.Close;
     datm_po.qry_po_itens_.Params[0].AsString := NR_PROCESSO;
     datm_po.qry_po_itens_.Params[1].AsString := CD_EMPRESA;
     datm_po.qry_po_itens_.Prepare;
     datm_po.qry_po_itens_.Open;

//     datm_po.qry_po_itens_.Locate('NR_ITEM',N,[]);
     datm_po.ds_po_itens.AutoEdit := not datm_po.qry_po_itens_.IsEmpty;
     CleanLooks(tabItens);
  end;

  // Gravar a pagina que foi mudada para uso posterior
  OldTag := pagPO.ActivePage.Tag;
end;

procedure Tfrm_po.Procurar(Sender: TObject);
begin
  // Não procurar em outra pagina que nao seja a lista
  if pagPO.ActivePage.Tag <> LISTA then
    Exit;

  // Procurar conforme chave escolhida
  case cmbOrdem.ItemIndex of
    0: datm_po.qry_po_lista_.Locate('NR_PROCESSO', edtChave.Text, [loPartialKey, loCaseInsensitive]);
    1: datm_po.qry_po_lista_.Locate('NM_CLIENTE', edtChave.Text, [loPartialKey, loCaseInsensitive]);
    2: datm_po.qry_po_lista_.Locate('NM_EMPRESA', edtChave.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure Tfrm_po.TrocarOrdem(Sender: TObject);
begin
  // Trocar para a ordem selecionada
  case cmbOrdem.ItemIndex of
    0: datm_po.qry_po_lista_.SQL[datm_po.qry_po_lista_.SQL.Count-1] := 'ORDER BY NR_PROCESSO';
    1: datm_po.qry_po_lista_.SQL[datm_po.qry_po_lista_.SQL.Count-1] := 'ORDER BY ENC.NM_EMPRESA';
    2: datm_po.qry_po_lista_.SQL[datm_po.qry_po_lista_.SQL.Count-1] := 'ORDER BY EN.NM_EMPRESA';
  end;

  // Voltar para onde estava posicionada
  datm_po.qry_po_lista_.Open;
  datm_po.qry_po_Lista_.Locate('NR_PROCESSO', NR_PROCESSO, []);
end;

procedure Tfrm_po.Incluir(Sender: TObject);
begin
  // Inclui uma nova PO a partir da lista
  if pagPO.ActivePage.Tag = LISTA then
  begin
    pagPO.ActivePage := tabDados;
    PO_MudancaDePagina(nil);
  end;

  // Inclui uma nova PO
  if pagPO.ActivePage.Tag = PO then
  begin
    datm_po.qry_po_.Insert;
    pagPO.ActivePage := tabDados;
    edt_nr_processo.SetFocus;

    datm_po.qry_ref_cli_.Close;
    if edt_nr_processo.Text <> '' then
    begin
      datm_po.qry_ref_cli_.Params[0].AsString := frm_po.edt_nr_processo.Text;
      datm_po.qry_ref_cli_.Open;
    end;

    // Auto preenchimentos para a P.O.
    datm_po.qry_po_.FieldByName('DT_ABERTURA').AsDateTime     := Now;
    datm_po.qry_po_.FieldByName('IN_FABR_EXPOR_IMP').AsString := '1';
    datm_po.qry_po_.FieldByName('TP_COBERT_CAMBIO').AsString  := '1';
    datm_po.qry_po_.FieldByName('IN_ENTREPOSTO').AsString     := '0';
    datm_po.qry_po_.FieldByName('IN_FATURADO').AsString       := '0';
    datm_po.qry_po_.FieldByName('IN_IMEDIATO').AsString       := '0';
  end;

  // Incluir uma nova despesa
  if pagPO.ActivePage.Tag = DESPESAS then
  begin
    if NR_PROCESSO = '' then
    begin
      MessageDlg('Nenhum processo para criar despesa.',mtError,[mbOK],0);
      Abort; Exit;
    end;
  end;

  // Incluir uma nova embalagem
  if pagPO.ActivePage.Tag = EMBALAGEM then
  begin
    if NR_PROCESSO = '' then
    begin
      MessageDlg('Nenhum processo para criar embalagem.',mtError,[mbOK],0);
      Abort; Exit;
    end;
  end;

  // Inclui uma novo Item
  if pagPO.ActivePage.Tag = ITENS then
  begin
    if NR_PROCESSO = '' then
    begin
      MessageDlg('Nenhum processo para criar item.',mtError,[mbOK],0);
      Abort; Exit;
    end;
    dbedtNrItemCliente.Color    := clWindow;
    dbedtNrItemCliente.ReadOnly := False;
    datm_po.qry_po_itens_.Insert;
//     edtPedCliente.SetFocus;

     // Auto preenchimentos para o Item
    datm_po.qry_po_itens_.FieldByName('NR_PROCESSO').AsString := NR_PROCESSO;
    datm_po.qry_po_itens_.FieldByName('CD_EMPRESA').AsString  := CD_EMPRESA;
    with TQuery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      SQL.ADD('SELECT MAX(NR_ITEM) FROM TPO_ITEM WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO) + ' AND CD_EMPRESA = ' + QuotedStr(CD_EMPRESA));
      Open;
      if Fields[0].AsString = '' then
        datm_po.qry_po_itens_.FieldByName('NR_ITEM').AsString := '001'
      else
        datm_po.qry_po_itens_.FieldByName('NR_ITEM').AsString := FormatFloat('000', Fields[0].AsInteger + 1);
      Free;
    end;
    datm_po.qry_po_itens_.FieldByName('IN_REEIMPORTACAO').AsString := 'N';
    datm_po.qry_po_itens_.FieldByName('IN_NECESSITA_LI').AsBoolean := False;
    datm_po.qry_po_itens_.FieldByName('QT_BAIXADA_DI').AsString    := '0';
    datm_po.qry_po_itens_.FieldByName('QT_BAIXADA_LI').AsString    := '0';
    datm_po.qry_po_itens_.FieldByName('IN_MONTADO').AsBoolean      := False;
    datm_po.qry_po_itens_.FieldByName('IN_REEIMPORTACAO').AsString := 'N';

    datm_po.qry_po_itens_.FieldByName('PL_ITEM').AsFloat       := 0;
    datm_po.qry_po_itens_.FieldByName('QT_INICIAL').AsFloat    := 0;
    datm_po.qry_po_itens_.FieldByName('VL_UNITARIO').AsFloat   := 0;
    datm_po.qry_po_itens_.FieldByName('VL_TOTAL').AsFloat      := 0;

    datm_po.qry_po_itens_.FieldByName('CD_EXPORTADOR').AsString     := datm_po.qry_po_.FieldByName('CD_EXPORTADOR').AsString;
    datm_po.qry_po_itens_.FieldByName('CD_PAIS_AQUISICAO').AsString := datm_po.qry_po_.FieldByName('CD_PAIS_AQUISICAO').AsString;
    datm_po.qry_po_itens_.FieldByName('CD_FABRICANTE').AsString     := datm_po.qry_po_.FieldByName('CD_FABRICANTE').AsString;
    datm_po.qry_po_itens_.FieldByName('CD_PAIS_ORIGEM').AsString    := datm_po.qry_po_.FieldByName('CD_PAIS_ORIGEM').AsString;
    datm_po.qry_po_itens_.FieldByName('IN_FABR_EXP_PROD').AsString  := datm_po.qry_po_.FieldByName('IN_FABR_EXPOR_IMP').AsString;

    datm_po.qry_po_itens_.FieldByName('TP_CALCULO').AsInteger := 1;

    datm_po.qry_po_itens_.FieldByName('CD_AREA').AsString := datm_po.qry_po_.FieldByName('CD_AREA').AsString;

    dblkcbox_calc_item.KeyValue := 1;
    dblckpbox_tp_modalidade.KeyValue := 0;
    dbedtNrItemCliente.SetFocus;
  end;

  // Inclui uma nova despesa de item
  if pagPO.ActivePage.Tag = DESPESAS_ITEM then
  begin
     if NR_ITEM = '' then
     begin
        MessageDlg('Nenhum item para criar despesa.',mtError,[mbOK],0);
        Abort; Exit;
     end;
  end;

  // Inclui um novo N.V.E.
  if pagPO.ActivePage.Tag = NVE then
  begin
    if NR_ITEM = '' then
    begin
      MessageDlg('Nenhum item para criar N.V.E..',mtError,[mbOK],0);
      Abort; Exit;
    end;
    datm_po.qry_po_nve_.Insert;
    DBedtLookNivelNVE.SetFocus;

    // Auto preenchimentos para o Item
    datm_po.qry_po_nve_.FieldByName('NR_PROCESSO').AsString := NR_PROCESSO;
    datm_po.qry_po_nve_.FieldByName('CD_EMPRESA').AsString  := CD_EMPRESA;
    datm_po.qry_po_nve_.FieldByName('NR_ITEM').AsString     := NR_ITEM;
  end;
end;

procedure Tfrm_po.Salvar(Sender: TObject);
var
  CHAVE: Integer;
begin
  ActiveControl := nil;
  // Salvar as alterações de uma po
  if pagPO.ActivePage.Tag = PO then
  begin
     // Consistencias para a PO
    if edt_nr_processo.Text = '' then
    begin
      MessageDlg('É necessário informar o número do pedido antes de salvar a P.O.',mtError,[mbOK],0);
      edt_nr_processo.SetFocus;
      Abort; Exit;
    end;
    if dbedt_cd_cliente.Text = '' then
    begin
      MessageDlg('É necessário informar o código do cliente antes de salvar a P.O.',mtError,[mbOK],0);
      dbedt_cd_cliente.SetFocus;
      Abort; Exit;
    end;
    if DBedtLookImportador.Text = '' then
    begin
      MessageDlg('É necessário informar o código do importador antes de salvar a P.O.',mtError,[mbOK],0);
      DBedtLookImportador.SetFocus;
      Abort; Exit;
    end;
    if not CheckLooks(tabDados     ) then
      Exit;
    if not CheckLooks(tabAdicionais) then
      Exit;
//     if not CheckLooks(tabTotais    ) then Exit;

    datm_po.qry_po_.Post;

    NR_PROCESSO := datm_po.qry_po_.FieldByName('NR_PROCESSO').AsString;
    CD_EMPRESA  := datm_po.qry_po_.FieldByName('CD_EMPRESA').AsString;

    datm_po.qry_ref_cli_.Close;
    if edt_nr_processo.Text <> '' then
    begin
      datm_po.qry_ref_cli_.Params[0].AsString := frm_po.edt_nr_processo.Text;
      datm_po.qry_ref_cli_.Open;
    end;

    with TQuery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      SQL.ADD('UPDATE TPO_ITEM SET QT_DISPONIVEL = QT_INICIAL WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO) + ' AND CD_EMPRESA = ' + QuotedStr(CD_EMPRESA));
      ExecSQL;
      Free;
    end;

    with TQuery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      SQL.ADD('UPDATE TPO');
      SQL.Add('SET QT_TOTAL_DISPONIVEL = (SELECT SUM(QT_DISPONIVEL)');
      SQL.Add('                           FROM TPO_ITEM');
      SQL.Add('                           WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
      SQL.Add('                             AND CD_EMPRESA  = ' + QuotedStr(CD_EMPRESA) + ')');
      SQL.Add('WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
      SQL.Add('  AND CD_EMPRESA  = ' + QuotedStr(CD_EMPRESA));
      ExecSQL;
      Free;
    end;

    with TQuery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      SQL.ADD('UPDATE TPO SET IN_CALCULADO = ''1'' WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO) + 'AND CD_EMPRESA  = ' + QuotedStr(CD_EMPRESA));
      ExecSQL;
      Free;
    end;

     // evitando o lock de registro e por consequencia, o couldnt
    datm_po.qry_po_.Close;
    datm_po.qry_po_.Params[0].AsString := NR_PROCESSO;
    datm_po.qry_po_.Params[1].AsString := CD_EMPRESA;
    datm_po.qry_po_.Open;
    datm_po.ds_po.AutoEdit := not datm_po.qry_po_.IsEmpty;
  end;
  // Salvar as alterações de um Item

  if pagPO.ActivePage.Tag = ITENS then
  begin
     // Consistencias para o Item
     with TQuery.Create(Application) do
     begin
       DatabaseName := 'DBBROKER';
       SQL.Clear;

       SQL.Add('SELECT COUNT(NR_ITEM) FROM TPO_ITEM (NOLOCK) WHERE ' +
               'NR_ITEM_CLIENTE = ''' + dbedtNrItemCliente.Text + ''' AND ' +
               'NR_PROCESSO     = ''' + dbedt_nr_processo.Text  + ''' AND ' +
               'CD_EMPRESA      = ''' + dbedt_cd_cliente.Text   + ''' AND ' +
               'NR_PARCIAL      = ''' + datm_po.qry_po_itens_NR_PARCIAL.AsString  + ''' AND ' +
               'NR_ITEM        <> ''' + datm_po.qry_po_itens_NR_ITEM.AsString      + '''');
       Open;
       if Fields[0].AsInteger > 0 then
       begin
         MessageDlg('Já existe um Item com esse número de Item Cliente nesse pedido.', mtError, [mbOK], 0);
         dbedtNrItemCliente.Clear;
         dbedtNrItemCliente.SetFocus;
         Exit;
       end;
       Close;
       Free;
     end;
     if (EditArea.Text = '') then
     begin
        MessageDlg('É necessário informar uma ÁREA antes de salvar o Item.',mtError,[mbOK],0);
        EditArea.SetFocus;
        Abort; Exit;
     end;
     if (dbedt_cd_ncm.Text = '') then
     begin
        MessageDlg('É necessário informar um NCM/SH antes de salvar o Item.',mtError,[mbOK],0);
        dbedt_cd_ncm.SetFocus;
        Abort; Exit;
     end;
     if (dbedt_qt_mercadoria.Text = '') then
     begin
        MessageDlg('É necessário informar a quantidade antes de salvar o Item.',mtError,[mbOK],0);
        dbedt_qt_mercadoria.SetFocus;
        Abort; Exit;
     end;
     if (dbedt_vl_unitario.Text = '') then
     begin
        MessageDlg('É necessário informar o valor unitário antes de salvar o Item.',mtError,[mbOK],0);
        dbedt_vl_unitario.SetFocus;
        Abort; Exit;
     end;
     if (dbedtNrItemCliente.Text = '') then
     begin
        MessageDlg('É necessário informar o número do Item Cliente.',mtError,[mbOK],0);
        dbedtNrItemCliente.SetFocus;
        Abort; Exit;
     end;

     if not CheckLooks(tabItens) then
       Exit;

     NR_PROCESSO := datm_po.qry_po_Itens_.FieldByName('NR_PROCESSO').AsString;
     CD_EMPRESA  := datm_po.qry_po_Itens_.FieldByName('CD_EMPRESA').AsString;
     datm_po.qry_po_Itens_.Post;

     with TQuery.Create(Application) do
     begin
       DataBaseName := 'DBBROKER';
       SQL.ADD('UPDATE TPO_ITEM SET QT_DISPONIVEL = QT_INICIAL WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO) + ' AND CD_EMPRESA = ' + QuotedStr(CD_EMPRESA));
       ExecSQL;
       Free;
     end;

     with TQuery.Create(Application) do
     begin
       DataBaseName := 'DBBROKER';
       SQL.ADD('UPDATE TPO');
       SQL.ADD('SET QT_TOTAL_DISPONIVEL = (SELECT SUM(QT_DISPONIVEL)');
       SQL.ADD('                           FROM TPO_ITEM');
       SQL.ADD('                           WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
       SQL.ADD('                             AND CD_EMPRESA  = ' + QuotedStr(CD_EMPRESA) + ')');
       SQL.ADD('WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
       SQL.ADD('  AND CD_EMPRESA  = ' + QuotedStr(CD_EMPRESA));
       ExecSQL;
       Free;
     end;

     // evitando o lock de registro e por consequencia, o couldnt
     if datm_po.qry_po_itens_.FieldByName('NR_ITEM').AsString = '' then
       CHAVE := 1
     else
       CHAVE := datm_po.qry_po_itens_.FieldByName('NR_ITEM').AsInteger;
     datm_po.qry_po_itens_.Close;
     datm_po.qry_po_itens_.ParamByName('NR_PROCESSO').AsString := NR_PROCESSO;
     datm_po.qry_po_itens_.ParamByName('CD_EMPRESA').AsString  := CD_EMPRESA;
     datm_po.qry_po_itens_.Open;
     datm_po.qry_po_itens_.Locate('NR_ITEM',FormatFloat('000',CHAVE),[]);
     datm_po.ds_po_itens.AutoEdit := not datm_po.qry_po_itens_.IsEmpty;
     datm_po.AtualizarDisplayItens(nil);

     dbedtNrItemCliente.Color    := clMenu;
     dbedtNrItemCliente.ReadOnly := True;
  end;
  // Salvar as alterações de um N.V.E.
  if pagPO.ActivePage.Tag = NVE then
  begin
     if DBedtLookNivelNVE.Text = '' then
     begin
        MessageDlg('É necessário informar Nivel',mtError,[mbOK],0);
        Abort; Exit;
     end;
     if DBedtLookAtributo.Text = '' then
     begin
        MessageDlg('É necessário informar o Código do Atributo',mtError,[mbOK],0);
        Abort; Exit;
     end;
     if DBedtLookEspecificacao.Text = '' then
     begin
        MessageDlg('É necessário informar o Código da Especificação ',mtError,[mbOK],0);
        Abort; Exit;
     end;
  end;

  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('UPDATE TPO');
    SQL.Add('SET VL_TOTAL = (SELECT SUM(VL_TOTAL)');
    SQL.Add('                FROM TPO_ITEM (NOLOCK)');
    SQL.Add('                WHERE NR_PROCESSO = ''' + NR_PROCESSO + '''');
    SQL.Add('                  AND CD_EMPRESA  = ''' + CD_EMPRESA + ''')');
    SQL.Add('WHERE NR_PROCESSO = ''' + NR_PROCESSO + '''');
    SQL.Add('  AND CD_EMPRESA  = ''' + CD_EMPRESA + '''');
    ExecSQL;
    Free;
  end;

  // evitando o lock de registro e por consequencia, o couldnt
  datm_po.qry_po_.Close;
  datm_po.qry_po_.Params[0].AsString := NR_PROCESSO;
  datm_po.qry_po_.Params[1].AsString := CD_EMPRESA;
  datm_po.qry_po_.Open;
  datm_po.ds_po.AutoEdit := not datm_po.qry_po_.IsEmpty;
end;

procedure Tfrm_po.Cancelar(Sender: TObject);
begin
  ActiveControl := nil;
  // Cancelar as alterações de uma po
  if pagPO.ActivePage.Tag = PO then
  begin
     datm_po.qry_po_.Cancel;
     datm_po.qry_ref_cli_.Close;
     if edt_nr_processo.Text <> '' then
     begin
       datm_po.qry_ref_cli_.Params[0].AsString := frm_po.edt_nr_processo.Text;
       datm_po.qry_ref_cli_.Open;
     end;
  end;

  // Cancelar as alterações de uma despesa
  if pagPO.ActivePage.Tag = DESPESAS then
  begin

  end;

  // Cancelar as alterações de uma embalagem
  if pagPO.ActivePage.Tag = EMBALAGEM then
  begin

  end;

  // Cancelar as alterações de um item
  if pagPO.ActivePage.Tag = ITENS then
  begin
    datm_po.qry_po_itens_.Cancel;
    datm_po.AtualizarDisplayItens(nil);
    dbedtNrItemCliente.Color    := clMenu;
    dbedtNrItemCliente.ReadOnly := True;
  end;

  // Cancelar as alterações da despesae de um item
  if pagPO.ActivePage.Tag = DESPESAS_ITEM then
  begin

  end;

  // Cancelar as alterações do N.V.E. de um item
  if pagPO.ActivePage.Tag = NVE then
  begin
     datm_po.qry_po_nve_.Cancel;
  end;
end;

procedure Tfrm_po.Excluir(Sender: TObject);
begin
  // Excluir uma PO a partir da lista
  if pagPO.ActivePage.Tag = LISTA then
  begin
     pagPO.ActivePage := tabDados;
     PO_MudancaDePagina(nil);
  end;

  // Excluir uma PO
  if pagPO.ActivePage.Tag = PO then
  begin
     if MessageDlg('Confirma a exclusão da P.O.?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
     begin
        NR_PROCESSO := datm_po.qry_po_.FieldByName('NR_PROCESSO').AsString;
        // Integridade referencial - excluir os registros linkados
        with TQuery.Create(Application) do
        begin
          DataBaseName := 'DBBROKER';
          SQL.Clear;
          SQL.ADD('DELETE FROM TPO_ITEM WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO) + ' AND CD_EMPRESA = ' + QuotedStr(CD_EMPRESA));
          ExecSQL;
          SQL.Clear;
          SQL.ADD('DELETE FROM TPO_NVE      WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO) + ' AND CD_EMPRESA = ' + QuotedStr(CD_EMPRESA));
          ExecSQL;
          SQL.Clear;
          SQL.ADD('DELETE FROM TREF_CLIENTE WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO) + ' AND CD_EMPRESA = ' + QuotedStr(CD_EMPRESA));
          ExecSQL;
          Free;
        end;
        datm_po.qry_po_.Delete;
        pagPO.ActivePage := tabLista;
        PO_MudancaDePagina(nil);
        datm_po.ds_po.AutoEdit := not datm_po.qry_po_lista_.IsEmpty;
        btn_excluir.Enabled    := not datm_po.qry_po_lista_.IsEmpty;
     end;
  end;

  // Excluir um item
  if pagPO.ActivePage.Tag = ITENS then
  begin
    if ConsultaLookUPSQL('select count(*) CONT from TPO_ITEM (NOLOCK)' +
                         'where ' +
                         'NR_PROCESSO     = ''' + datm_po.qry_po_itens_NR_PROCESSO.AsString     + ''' and ' +
                         'CD_EMPRESA      = ''' + datm_po.qry_po_itens_CD_EMPRESA.AsString      + ''' and ' +
                         'NR_ITEM_CLIENTE = ''' + datm_po.qry_po_itens_NR_ITEM_CLIENTE.AsString + ''' and ' +
                         'NR_PARCIAL <> 0', 'CONT') = '0' then
    begin
      if MessageDlg('Confirma a exclusão do item ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      begin
        if not ItemJaUtilizado( datm_po.qry_po_itens_NR_PROCESSO.AsString,
                                datm_po.qry_po_itens_CD_EMPRESA.AsString,
                                datm_po.qry_po_itens_NR_ITEM_CLIENTE.AsString,
                                datm_po.qry_po_itens_NR_PARCIAL.AsInteger) then
        begin                                                             
          datm_main.db_broker.StartTransaction;

          try
            //Apaga e renumera itens
            datm_po.sp_po_apaga_renum_itens.ParamByName('@NR_PROCESSO').AsString := NR_PROCESSO;
            datm_po.sp_po_apaga_renum_itens.ParamByName('@CD_EMPRESA').AsString  := CD_EMPRESA;
            datm_po.sp_po_apaga_renum_itens.ParamByName('@NR_ITEM').AsString     := datm_po.qry_po_itens_NR_ITEM.AsString;
            ExecStoredProc( datm_po.sp_po_apaga_renum_itens );
            CloseStoredProc( datm_po.sp_po_apaga_renum_itens );

            datm_main.db_broker.Commit;

            datm_po.qry_po_itens_.Close;
            datm_po.qry_po_itens_.ParamByName('NR_PROCESSO').AsString := NR_PROCESSO;
            datm_po.qry_po_itens_.ParamByName('CD_EMPRESA').AsString  := CD_EMPRESA;
            datm_po.qry_po_itens_.Prepare;
            datm_po.qry_po_itens_.Open;

            datm_po.AtualizarDisplayItens(nil);

            datm_po.ds_po_itens.AutoEdit := not datm_po.qry_po_itens_.IsEmpty;
            btn_excluir.Enabled          := not datm_po.qry_po_itens_.IsEmpty;
          except
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback; // Try...Except incluido por michel para evitar transação travada - Michel - 19/04/2010
          end;
        end
        else
          BoxMensagem('Existe um embarque utilizando este item ! ',2);
      end;
    end
    else
      BoxMensagem('Este item não pode ser excluído pois existem parciais criadas para ele! ',2);
  end;

  // Excluir um nve
  if pagPO.ActivePage.Tag = NVE then
  begin                                             
    if MessageDlg('Confirma a exclusão do N.V.E. ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      datm_po.qry_po_nve_.Delete;
      datm_po.ds_po_nve.AutoEdit := not datm_po.qry_po_nve_.IsEmpty;
      btn_excluir.Enabled        := not datm_po.qry_po_nve_.IsEmpty;
    end;
  end;
end;

procedure Tfrm_po.ChangeTipoFabricante(Sender: TObject);
begin
  if dbrgrp_fabr_expo.Value = '1' then
  begin
     DBedtLookExportador.Enabled    := True;
     DBedtLookFabricante.Enabled    := False;
     DBedtLookPaisAquisicao.Enabled := True;
     DBedtLookPaisOrigem.Enabled    := False;
  end
  else if dbrgrp_fabr_expo.Value = '2' then
  begin
     DBedtLookExportador.Enabled    := True;
     DBedtLookFabricante.Enabled    := True;
     DBedtLookPaisAquisicao.Enabled := True;
     DBedtLookPaisOrigem.Enabled    := True;
  end
  else if dbrgrp_fabr_expo.Value = '3' then
  begin
     DBedtLookExportador.Enabled    := True;
     DBedtLookFabricante.Enabled    := False;
     DBedtLookPaisAquisicao.Enabled := True;
     DBedtLookPaisOrigem.Enabled    := True;
  end;
  if not DBedtLookExportador.Enabled    then
    DBedtLookExportador.Text := '';
  if not DBedtLookFabricante.Enabled    then
    DBedtLookFabricante.Text := '';
  if not DBedtLookPaisAquisicao.Enabled then
    DBedtLookPaisAquisicao.Text := '';
  if not DBedtLookPaisOrigem.Enabled    then
    DBedtLookPaisOrigem.Text := '';

  lblLookExportador.Enabled    := DBedtLookExportador.Enabled;
  btn_co_exportador.Enabled    := DBedtLookExportador.Enabled;
  lblLookFabricante.Enabled    := DBedtLookFabricante.Enabled;
  btn_co_fabricante.Enabled    := DBedtLookFabricante.Enabled;
  lblLookPaisAquisicao.Enabled := DBedtLookPaisAquisicao.Enabled;
  btn_co_pais_aquis.Enabled    := DBedtLookPaisAquisicao.Enabled;
  lblLookPaisOrigem.Enabled    := DBedtLookPaisOrigem.Enabled;
  btn_co_pais_orig.Enabled     := DBedtLookPaisOrigem.Enabled;
end;

procedure Tfrm_po.LookImportador(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_PO.qry_po_) then
      Exit;
    datm_PO.qry_po_CD_IMPORTADOR.AsString := ConsultaOnLineEx('TEMPRESA_NAC','Importador',
      ['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'END_EMPRESA'],
      ['Código', 'Descrição', 'Apelido', 'CNPJ', 'Endereço'],'CD_EMPRESA',nil)
  end
  else
    edtLookImportador.Text   := ConsultaLookUp('TEMPRESA_NAC','CD_EMPRESA',DBedtLookImportador.Text,'NM_EMPRESA');
end;

procedure Tfrm_po.LookExportador(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_PO.qry_po_) then
      Exit;
//    datm_po.qry_po_CD_EXPORTADOR.AsString := ConsultaOnLineEx('TEMPRESA_EST','Exportador',['CD_EMPRESA','NM_EMPRESA'],['Código','Empresa'],'CD_EMPRESA',nil)
    datm_po.qry_po_CD_EXPORTADOR.AsString := ConsultaOnLineExSQL('SELECT CD_EMPRESA, NR_CLIENTE, NM_EMPRESA, SUBSTRING(P.NM_PAIS,1,35), RTRIM(END_EMPRESA) + '', '' + END_NUMERO ENDERECO ' +
    ' FROM TEMPRESA_EST E, TPAIS_BROKER P WHERE P.CD_PAIS = E.CD_PAIS AND IN_EXPORTADOR = ''1''','Exportadores',['CD_EMPRESA', 'NR_CLIENTE', 'NM_EMPRESA', 'NM_PAIS', 'ENDERECO'],['Código', 'Cod. no Cliente', 'Nome', 'País', 'Endereço'],'CD_EMPRESA',nil)
  end
  else
    EdtLookExportador.Text := ConsultaLookUP('TEMPRESA_EST', 'CD_EMPRESA', DBedtLookExportador.Text, 'NM_EMPRESA');
end;


procedure Tfrm_po.LookFabricante(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_PO.qry_po_) then exit;
      //datm_po.qry_po_CD_FABRICANTE.AsString := ConsultaOnLineEx('TEMPRESA_EST','Exportador',['CD_EMPRESA','NM_EMPRESA'],['Código','Empresa'],'CD_EMPRESA',nil)
      datm_po.qry_po_CD_FABRICANTE.AsString :=  ConsultaOnLineExSQL('SELECT CD_EMPRESA, NR_CLIENTE, NM_EMPRESA, SUBSTRING(P.NM_PAIS,1,35), RTRIM(END_EMPRESA) + '', '' + END_NUMERO ENDERECO ' +
    ' FROM TEMPRESA_EST E (NOLOCK), TPAIS_BROKER P (NOLOCK) WHERE P.CD_PAIS = E.CD_PAIS AND IN_EXPORTADOR = ''1''','Exportadores',['CD_EMPRESA', 'NR_CLIENTE', 'NM_EMPRESA', 'NM_PAIS', 'ENDERECO'],['Código', 'Cod. no Cliente', 'Nome', 'País', 'Endereço'],'CD_EMPRESA',nil)
  end
  else
    edtLookFabricante.Text := ConsultaLookUP('TEMPRESA_EST', 'CD_EMPRESA', dbEDTLookFabricante.Text, 'NM_EMPRESA');
end;

procedure Tfrm_po.LookArea(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
     if not (datm_po.qry_po_.State in [dsEdit, dsInsert]) then
       datm_po.qry_po_.Edit;
     datm_po.qry_po_CD_AREA.AsString := ConsultaOnLineEx('TAREA','Áreas',['CD_AREA','NM_AREA'],['Código','Área'],'CD_AREA',nil);
     DBedtLookArea.Text := datm_po.qry_PO_CD_AREA.AsString;
  end
  else
     edtLookArea.Text   := ConsultaLookUp('TAREA','CD_AREA',DBedtLookArea.Text,'NM_AREA');
end;

procedure Tfrm_po.LookPaisAquisicao(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
     if not (datm_po.qry_po_.State in [dsEdit, dsInsert]) then
       datm_po.qry_po_.Edit;
     datm_po.qry_po_CD_PAIS_AQUISICAO.AsString := ConsultaOnLineEx('TPAIS','Paises',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',nil);
     DBedtLookPaisAquisicao.Text := datm_po.qry_PO_CD_PAIS_AQUISICAO.AsString;
  end
  else
     edtLookPaisAquisicao.Text   := ConsultaLookUp('TPAIS','CODIGO',DBedtLookPaisAquisicao.Text,'DESCRICAO');
end;

procedure Tfrm_po.LookPaisOrigem(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not (datm_po.qry_po_.State in [dsEdit, dsInsert]) then
      datm_po.qry_po_.Edit;
    datm_po.qry_po_CD_PAIS_ORIGEM.AsString := ConsultaOnLineEx('TPAIS','Paises',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',nil);
    DBedtLookPaisOrigem.Text := datm_po.qry_PO_CD_PAIS_ORIGEM.AsString;
  end
  else
    edtLookPaisOrigem.Text   := ConsultaLookUp('TPAIS','CODIGO',DBedtLookPaisOrigem.Text,'DESCRICAO');
end;

procedure Tfrm_po.LookShipTo(Sender: TObject);
begin
  if not (datm_po.qry_po_.State in [dsEdit, dsInsert]) then
    Exit;
//  datm_po.qry_po_CD_SHIP_TO.AsString := ConsultaOnLineEx('TSHIP','Ship To',['CD_SHIP_TO_FROM','CD_LOCAL_ENTR_MERC'],['Código','Local'],'CD_LOCAL_ENTR_MERC');
end;

procedure Tfrm_po.LookUrgencia(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not (datm_po.qry_po_.State in [dsEdit, dsInsert]) then
      datm_po.qry_po_.Edit;
//     datm_po.qry_po_CD_URGENCIA.AsString := ConsultaOnLineEx('TTP_URGENCIA','Urgências',['CD_URGENCIA','NM_DESCRICAO'],['Código','Descrição'],'CD_URGENCIA');
  end;
end;

procedure Tfrm_po.LookIncoterm(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not (datm_po.qry_po_.State in [dsEdit, dsInsert]) then
      datm_po.qry_po_.Edit;
    datm_po.qry_po_CD_INCOTERM.AsString := ConsultaOnLineEx('TINCOTERMS_VENDA','Incoterms',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',nil);
    DBedtLookIncoterm.Text := datm_po.qry_PO_CD_INCOTERM.AsString;
  end
  else
    edtLookIncoterm.Text   := ConsultaLookUp('TINCOTERMS_VENDA','CODIGO',DBedtLookIncoterm.Text,'DESCRICAO');
end;

procedure Tfrm_po.LookTermoPagto(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not (datm_po.qry_po_.State in [dsEdit, dsInsert]) then
      datm_po.qry_po_.Edit;
    datm_po.qry_po_CD_TERMO_PAGTO.AsString := ConsultaOnLineEx('TMODALID_PAGAMENTO','Modalidades de Pagamento',['CODIGO','DESCRICAO'],['Código','Termo de Pagamento'],'CODIGO',nil);
    DBedtLooKTermoPagto.Text := datm_po.qry_PO_CD_TERMO_PAGTO.AsString;
  end
  else
    edtLookTermoPagto.Text   := ConsultaLookUp('TMODALID_PAGAMENTO','CODIGO',DBedtLooKTermoPagto.Text,'DESCRICAO');
end;

procedure Tfrm_po.LookMoedaNegociada(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not (datm_po.qry_po_.State in [dsEdit, dsInsert]) then
      datm_po.qry_po_.Edit;
    datm_po.qry_po_CD_MOEDA_NEG.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moedas',['CD_MOEDA','NM_MOEDA'],['Código','Moeda'],'CD_MOEDA',nil);
    DBedtLookMoedaNegociada.Text := datm_po.qry_PO_CD_MOEDA_NEG.AsString;
  end
  else
    edtLookMoedaNegociada.Text   := ConsultaLookUp('TMOEDA_BROKER','CD_MOEDA',DBedtLookMoedaNegociada.Text,'NM_MOEDA');
end;

procedure Tfrm_po.LookMoedaFrete(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not (datm_po.qry_po_.State in [dsEdit, dsInsert]) then
      datm_po.qry_po_.Edit;
    datm_po.qry_po_CD_MOEDA_FRETE.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moedas',['CD_MOEDA','NM_MOEDA'],['Código','Moeda'],'CD_MOEDA',nil);
    DBedtLookMoedaFrete.Text := datm_po.qry_PO_CD_MOEDA_FRETE.AsString;
  end
  else
    edtLookMoedaFrete.Text   := ConsultaLookUp('TMOEDA_BROKER','CD_MOEDA',DBedtLookMoedaFrete.Text,'NM_MOEDA');
end;

procedure Tfrm_po.LookViaTransp(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not (datm_po.qry_po_.State in [dsEdit, dsInsert]) then
      datm_po.qry_po_.Edit;
    datm_po.qry_po_CD_VIA_TRANSP.AsString := ConsultaOnLineEx('TVIA_TRANSPORTE','Vias de Transporte',['CD_VIA_TRANSPORTE','NM_VIA_TRANSPORTE'],['Código','Via de Transporte'],'CD_VIA_TRANSPORTE',nil);
    DBedtLookViaTransp.Text := datm_po.qry_po_CD_VIA_TRANSP.AsString;
  end
  else
    edtLookViaTransp.Text   := ConsultaLookUp('TVIA_TRANSPORTE','CD_VIA_TRANSPORTE',DBedtLookViaTransp.Text,'NM_VIA_TRANSPORTE');
end;

procedure Tfrm_po.LookTipoFrete(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not (datm_po.qry_po_.State in [dsEdit, dsInsert]) then
      datm_po.qry_po_.Edit;
    datm_po.qry_po_CD_TIPO_FRETE.AsString := ConsultaOnLineEx('TTP_FRETE','Tipos de Frete',['CODIGO','DESCRICAO'],['Código','Frete'],'CODIGO',nil);
    DBedtLookTipoFrete.Text := datm_po.qry_po_CD_TIPO_FRETE.AsString;
  end
  else
  begin
    edtLookTipoFrete.Text   := ConsultaLookUp('TTP_FRETE','CODIGO',DBedtLookTipoFrete.Text,'DESCRICAO');
    dbedt_vl_frete_col.Enabled  := DBedtLookTipoFrete.Text = '0';
    dbedt_vl_frete_prep.Enabled := DBedtLookTipoFrete.Text = '1';
    if dbedt_vl_frete_col.Enabled  then
      dbedt_vl_frete_col.Color := clWindow
    else
      dbedt_vl_frete_col.Color := clBtnFace;
    if dbedt_vl_frete_prep.Enabled then
      dbedt_vl_frete_prep.Color := clWindow
    else
      dbedt_vl_frete_prep.Color := clBtnFace;
  end;
end;


procedure Tfrm_po.LookNcm(Sender: TObject);
begin
  if not (datm_po.qry_po_itens_.State in [dsEdit, dsInsert]) then
    Exit;
  datm_po.qry_po_itens_CD_NCM_SH.AsString := ConsultaOnLineEx('TNCM','NCM/SH',['CODIGO','DESCRICAO'],['Código','NCM'],'CODIGO',nil);
  dbedt_cd_ncm.Text := datm_po.qry_po_itens_CD_NCM_SH.AsString;
end;

procedure Tfrm_po.LookNaladiNCCA(Sender: TObject);
begin
  if not (datm_po.qry_po_itens_.State in [dsEdit, dsInsert]) then
    Exit;
  datm_po.qry_po_itens_CD_NALADI_NCCA.AsString := ConsultaOnLineEx('TNALADINCCA','NALADI/NCCA',['CODIGO','DESCRICAO'],['Código','NALADI/NCCA'],'CODIGO',nil);
  dbedt_cd_naladi_ncca.Text := datm_po.qry_po_itens_CD_NALADI_NCCA.AsString;
end;

procedure Tfrm_po.LookNaladiSH(Sender: TObject);
begin
  if not (datm_po.qry_po_itens_.State in [dsEdit, dsInsert]) then
    Exit;
  datm_po.qry_po_itens_CD_NALADI_SH.AsString := ConsultaOnLineEx('TNALADISH','NALADI/SH',['CODIGO','DESCRICAO'],['Código','NALADI/SH'],'CODIGO',nil);
  dbedt_cd_naladi_sh.Text := datm_po.qry_po_itens_CD_NALADI_SH.AsString;
end;

procedure Tfrm_po.LookMercadoria(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_po.qry_po_itens_) then
      Exit;
    datm_po.qry_po_itens_CD_MERCADORIA.AsString := ConsultaOnLineExSQL('SELECT CD_MERCADORIA,AP_MERCADORIA,CD_NCM_SH,CD_AREA,VL_UNITARIO FROM TMERCADORIA WHERE ( ( CD_IMPORTADOR = ''' + datm_po.qry_po_lista_CD_IMPORTADOR.AsString + ''' AND ''' + datm_po.qry_po_lista_CD_IMPORTADOR.AsString + ''' <> '''' ) OR ( CD_GRUPO = ''' + ConsultaLookUp('TEMPRESA_NAC','CD_EMPRESA',datm_po.qry_po_lista_CD_IMPORTADOR.AsString,'CD_GRUPO') + ''' AND ''' + ConsultaLookUp('TEMPRESA_NAC','CD_EMPRESA',datm_po.qry_po_lista_CD_IMPORTADOR.AsString,'CD_GRUPO') + ''' <> '''' ) )','Mercadorias',['CD_MERCADORIA','AP_MERCADORIA', 'CD_NCM_SH', 'CD_AREA', 'VL_UNITARIO'],['Código','Nome', 'NCM', 'Área', 'Valor Unitário'],'CD_MERCADORIA',frm_main.mi_cad_merc);
    CarregarMercadoria(DBedtLookMercadoria);
  end
  else
    edtLookMercadoria.Text := ConsultaLookUP('TMERCADORIA','CD_MERCADORIA',DBedtLookMercadoria.text,'AP_MERCADORIA')
end;

procedure Tfrm_po.LookUnidMed(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not (datm_po.qry_po_itens_.State in [dsEdit, dsInsert]) then
      datm_po.qry_po_itens_.Edit;
    datm_po.qry_po_itens_CD_UNID_MEDIDA.AsString := ConsultaOnLineEx('TUNID_MEDIDA_BROKER','Unidades de Medida',['CD_UNID_MEDIDA','NM_UNID_MEDIDA'],['Código','Descrição'],'CD_UNID_MEDIDA',nil);
    DBedtLookUnMed.Text := datm_po.qry_po_itens_CD_UNID_MEDIDA.AsString;
  end
  else
    edtLookUnMed.Text   := ConsultaLookUp('TUNID_MEDIDA_BROKER','CD_UNID_MEDIDA',DBedtLookUnMed.Text,'NM_UNID_MEDIDA');
end;

procedure Tfrm_po.LookFabric_Prod(Sender: TObject);
begin
{  if Sender is TSpeedButton then
  begin
    Application.CreateForm(Tfrm_emp_est, frm_emp_est);
    frm_emp_est.Cons_OnLine := datm_po.qry_po_itens_CD_FABRICANTE;
    with frm_emp_est do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
  end
  else
  begin
    edtLookFabric_Prod.Text      := ConsultaLookUP('TEMPRESA_EST', 'CD_EMPRESA', dbedtLookFabric_Prod.Text, 'NM_EMPRESA');
    DBedtLookPaisOrigemItem.Text := ConsultaLookup('TEMPRESA_EST', 'CD_EMPRESA', dbedtLookFabric_Prod.Text, 'CD_PAIS');
  end;}
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_PO.qry_po_itens_) then exit;
    datm_po.qry_po_itens_CD_FABRICANTE.AsString := ConsultaOnLineExSQL('SELECT CD_EMPRESA, NR_CLIENTE, NM_EMPRESA, SUBSTRING(P.NM_PAIS,1,35), RTRIM(END_EMPRESA) + '', '' + END_NUMERO ENDERECO ' +
    ' FROM TEMPRESA_EST E, TPAIS_BROKER P WHERE P.CD_PAIS = E.CD_PAIS AND IN_EXPORTADOR = ''1''','Exportadores',['CD_EMPRESA', 'NR_CLIENTE', 'NM_EMPRESA', 'NM_PAIS', 'ENDERECO'],['Código', 'Cod. no Cliente', 'Nome', 'País', 'Endereço'],'CD_EMPRESA',nil)
  end
  else
  begin
    edtLookFabric_Prod.Text      := ConsultaLookUP('TEMPRESA_EST', 'CD_EMPRESA', dbedtLookFabric_Prod.Text, 'NM_EMPRESA');
  end;
end;

procedure Tfrm_po.LookPaisOrigemItem(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not (datm_po.qry_po_itens_.State in [dsEdit, dsInsert]) then
      datm_po.qry_po_itens_.Edit;
    datm_po.qry_po_itens_CD_PAIS_ORIGEM.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',nil);
    DBedtLookPaisOrigemItem.Text := datm_po.qry_po_itens_CD_PAIS_ORIGEM.AsString;
  end
  else
    edtLookPaisOrigemItem.Text   := ConsultaLookUp('TPAIS', 'CODIGO', DBedtLookPaisOrigemItem.Text, 'DESCRICAO');
end;

procedure Tfrm_po.Calcular(Sender: TObject);
var
  VALOR, SUM_ITEM, PERC, PL_ITENS, PL_CAIXA: Double;
  CAIXA, ITEM, DESP, ITEM_DESP: TQuery;
  MAX_ITEM: Integer;
  F : String;
begin
  NR_PROCESSO := datm_po.qry_po_lista_.FieldByName('NR_PROCESSO').AsString;
  CD_EMPRESA  := datm_po.qry_po_lista_.FieldByName('CD_EMPRESA').AsString;
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQl.ADD('SELECT NR_ITEM');
    SQl.ADD('FROM TPO_ITEM (NOLOCK)');
    SQl.ADD('WHERE ((QT_INICIAL = 0)');
    SQl.ADD('   OR (QT_INICIAL IS NULL)');
    SQl.ADD('   OR (QT_INICIAL_EST = 0)');
    SQl.ADD('   OR (QT_INICIAL_EST IS NULL)');
    SQl.ADD('   OR (PL_ITEM = 0)');
    SQl.ADD('   OR (PL_ITEM IS NULL))');
    SQl.ADD('  AND NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
    SQl.ADD('  AND CD_EMPRESA = ' + QuotedStr(CD_EMPRESA));
    Open;
    iF not IsEmpty then
    begin
      F := 'Os seguintes itens possuem valores de quantidade inicial, ou peso líquido, ou quantidade estatistica inválidos, impossibilitando o cálculo:';
      while not EOF do
      begin
        F := F + Fields[0].AsString + ', ';
        NEXT;
      end;
      MessageDlg(F,mtWarning,[mbOk],0);
      Exit;
    end;
  end;

  try
    grfCalc.Progress := 0;
    pnl_Calc.Visible := True;
    pnl_Calc.BringToFront;
    Application.ProcessMessages;

    // Calcula o valor da despesa
    with TQuery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      SQL.ADD('UPDATE TPO_ITEM');
      SQL.ADD('SET TPO_ITEM.VL_UNITARIO = CONVERT( numeric(15,5), ROUND((SELECT SUM(TPO_ITEM_DESP.VL_DESP_ITEM) ');
      SQL.ADD('                                                          FROM TPO_ITEM_DESP (NOLOCK)');
      SQL.ADD('                                                          WHERE TPO_ITEM_DESP.NR_DESP_ITEM = ' + QuotedStr('UI'));
      SQL.ADD('                                                            AND TPO_ITEM_DESP.NR_PROCESSO = TPO_ITEM.NR_PROCESSO');
      SQL.ADD('                                                            AND TPO_ITEM_DESP.NR_ITEM = TPO_ITEM.NR_ITEM ),5))');
      SQL.ADD('WHERE TPO_ITEM.NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
      SQL.ADD('  AND TPO_ITEM.CD_EMPRESA  = ' + QuotedStr(CD_EMPRESA));
      ExecSQL;
      Free;
    end;

  // Calcula o valor total
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.ADD('UPDATE TPO_ITEM');
    SQL.ADD('SET VL_TOTAL = CONVERT( numeric(15,5), ROUND(VL_UNITARIO * QT_INICIAL,5))');
    SQL.ADD('WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
    SQL.ADD('  AND CD_EMPRESA  = ' + QuotedStr(CD_EMPRESA));
    ExecSQL;
    Free;
  end;

  // Soma o vl_total de todos os itens no vl_total da PO
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.Add('UPDATE TPO');
    SQL.Add('SET VL_TOTAL = (SELECT CONVERT( numeric( 15, 2 ), SUM( ROUND( VL_TOTAL, 2 ) ) )');
    SQL.Add('                FROM TPO_ITEM (NOLOCK)');
    SQL.Add('                WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
    SQL.Add('                  AND CD_EMPRESA  = ' + QuotedStr(CD_EMPRESA) + ')');
    SQL.Add('WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
    SQL.Add('  AND CD_EMPRESA  = ' + QuotedStr(CD_EMPRESA));
    ExecSQL;
    Free;
  end;
  grfCalc.AddProgress(1);

  // Soma o pl_item de todos os itens no pl_po da PO
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.Add('UPDATE TPO');
    SQL.Add('SET PL_PO = (SELECT CONVERT( numeric( 15, 5 ), SUM( ROUND( PL_ITEM, 5 ) ) )');
    SQL.Add('             FROM TPO_ITEM');
    SQL.Add('             WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
    SQL.Add('               AND CD_EMPRESA  = ' + QuotedStr(CD_EMPRESA) + ')');
    SQL.Add('WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
    SQL.Add('  AND CD_EMPRESA  = ' + QuotedStr(CD_EMPRESA) + ')');
    ExecSQL;
    Free;
  end;

  ITEM := TQuery.Create(Application);
  ITEM.DataBaseName := 'DBBROKER';
  ITEM.SQL.ADD('SELECT * FROM TPO_ITEM WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO) + ' AND CD_EMPRESA  = ' + QuotedStr(CD_EMPRESA));
  ITEM.Open;
  while not ITEM.EOF do
  begin
    F := ConsultaLookUp('TUNID_MEDIDA_BROKER','CD_UNID_MEDIDA',ConsultaLookUp('TNCM','CODIGO',ITEM.FieldByName('CD_NCM_SH').AsString,'UNIDADE_MEDIDA'),'NM_UNID_MEDIDA');
    if (F = 'QUILOGRAMA LIQUIDO') then
    begin
       with TQuery.Create(Application) do
       begin
         DataBaseName := 'DBBROKER';
         SQL.ADD('UPDATE TPO_ITEM');
         SQL.ADD('SET QT_INICIAL_EST = CONVERT(numeric(15,7),ROUND(PL_ITEM,7))');
         SQL.ADD('WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
         SQL.ADD('  AND CD_EMPESA   = ' + QuotedStr(CD_EMPRESA));
         SQL.ADD('  AND NR_ITEM     = ' + QuotedStr(ITEM.FieldByName('NR_ITEM').AsString));
         ExecSQL;
         Free;
       end;
    end else begin
       with TQuery.Create(Application) do
       begin
         DataBaseName := 'DBBROKER';
         SQL.ADD('UPDATE TPO_ITEM');
         SQL.ADD('SET QT_INICIAL_EST = CONVERT(numeric(15,7),ROUND(QT_INICIAL,7))');
         SQL.ADD('WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
         SQL.ADD('  AND CD_EMPESA   = ' + QuotedStr(CD_EMPRESA));
         SQL.ADD('  AND NR_ITEM = ' + QuotedStr(ITEM.FieldByName('NR_ITEM').AsString));
         ExecSQL;
         Free;
       end;
    end;
    ITEM.Next;
  end;
  ITEM.Free;

  grfCalc.AddProgress(1);

  // Soma todas as despesas do tipo 'C' para o campo VL_DESPESAS na PO
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.Add('SELECT SUM(VL_DESP_FAT) FROM TPO_DESP (NOLOCK) WHERE TP_NOCH = ' + QuotedStr('C') +  ' AND NR_PROCESSO = ' + QuotedStr(NR_PROCESSO) +
        ' AND CD_EMPRESA = ' + QuotedStr(CD_EMPRESA) + ' AND CD_ITEM <> ' + QuotedStr('IF')  + ' AND CD_ITEM <> ' + QuotedStr('IT')  + ' AND CD_ITEM <> ' + QuotedStr('VG')   + ' AND CD_ITEM <> ' + QuotedStr('UI'));
    Open;
    SUM_ITEM := Fields[0].AsFloat;
    SQL.Clear;
    SQL.Add('UPDATE TPO SET VL_DESPESAS = CONVERT(numeric(15,2),ROUND(:VL,2)) WHERE NR_PROCESSO = ' +  QuotedStr(NR_PROCESSO) + ' AND CD_EMPRESA = ' + QuotedStr(CD_EMPRESA));
    Params[0].AsFloat := SUM_ITEM;
    ExecSQL;
    Free;
  end;
  grfCalc.AddProgress(1);

  // Faz o rateio das depesas da despesa do item no item
  DESP := TQuery.Create(Application);
  DESP.DataBaseName := 'DBBROKER';
  DESP.SQL.ADD('SELECT * FROM TPO_DESP WHERE TP_NOCH = ' + QuotedStr('C') + ' AND NR_PROCESSO = ' + QuotedStr(NR_PROCESSO) + ' AND CD_EMPRESA = ' + QuotedStr(CD_EMPRESA) + ' AND CD_ITEM <> ' + QuotedStr('IF')  + ' AND CD_ITEM <> ' + QuotedStr('IT')  + ' AND CD_ITEM <> ' + QuotedStr('VG')  + ' AND CD_ITEM <> ' + QuotedStr('UI'));
  DESP.Open;
  ITEM := TQuery.Create(Application);
  ITEM.DataBaseName := 'DBBROKER';
  ITEM.SQL.ADD(' SELECT * FROM TPO_ITEM WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO) + ' AND CD_EMPRESA = ' + QuotedStr(CD_EMPRESA));
  ITEM.Open;
  ITEM_DESP := TQuery.Create(Application);
  ITEM_DESP.DataBaseName := 'DBBROKER';
  ITEM_DESP.SQL.Add('SELECT SUM( ROUND( VL_TOTAL, 2 ) ) FROM TPO_ITEM WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO) + ' AND CD_EMPRESA = ' + QuotedStr(CD_EMPRESA));
  ITEM_DESP.Open;
  if ITEM_DESP.Fields[0].AsString <> '' then
  begin
    SUM_ITEM := StrToFloat(ITEM_DESP.Fields[0].AsString);
    ITEM_DESP.SQL.Clear;
    ITEM_DESP.SQL.Add('DELETE FROM TPO_ITEM_DESP WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO) + ' AND CD_EMPRESA = ' + QuotedStr(CD_EMPRESA) + ' AND NR_DESP_ITEM <> ' + QuotedStr('VG') + ' AND NR_DESP_ITEM <> ' + QuotedStr('UI'));
    ITEM_DESP.ExecSQL;
    ITEM_DESP.SQL.Clear;
    ITEM_DESP.SQL.Add('INSERT INTO TPO_ITEM_DESP (NR_PROCESSO, CD_EMPRESA, NR_ITEM, CD_ITEM_DESP, NR_DESP_ITEM, NR_SEQ, CD_MOEDA, TP_NOCH, DT_INPUT_DESP, VL_DESP_ITEM, IN_INDICADOR_CONTABIL, DT_PGTO_DESP_EMB, VL_TAXA_CAMBIO) ' +
                       'VALUES (:NR_PROCESSO, :CD_EMPRESA, :NR_ITEM, :CD_ITEM_DESP, :NR_DESP_ITEM, :NR_SEQ, :CD_MOEDA, :TP_NOCH, :DT_INPUT_DESP, CONVERT(numeric(15,5),ROUND(:VL_DESP_ITEM,5)), :IN_INDICADOR_CONTABIL, :DT_PGTO_DESP_EMB, :VL_TAXA_CAMBIO)');
    ITEM.First;
    while not ITEM.EOF do
    begin
      with TQuery.Create(Application) do
      begin
        DataBaseName := 'DBBROKER';
        SQL.Add('SELECT MAX(CD_ITEM_DESP) FROM TPO_ITEM_DESP WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO) + ' AND CD_EMPRESA = ' + QuotedStr(CD_EMPRESA) + ' AND NR_ITEM = ' + QuotedStr(ITEM.FieldByName('NR_ITEM').AsString));
        Open;
        try
          MAX_ITEM := Fields[0].AsInteger + 1;
        except
          MAX_ITEM := 0;
        end;
        Free;
      end;
      DESP.First;
      while not DESP.EOF do
      begin
        ITEM_DESP.ParamByName('NR_PROCESSO').AsString := NR_PROCESSO;
        ITEM_DESP.ParamByName('CD_EMPRESA').AsString  := CD_EMPRESA;
        ITEM_DESP.ParamByName('NR_ITEM').AsString := ITEM.FieldByName('NR_ITEM').AsString;
        ITEM_DESP.ParamByName('CD_ITEM_DESP').AsInteger := MAX_ITEM;
        ITEM_DESP.ParamByName('NR_DESP_ITEM').AsString := DESP.FieldByName('CD_ITEM').AsString;
        ITEM_DESP.ParamByName('NR_SEQ').AsString := DESP.FieldByName('NR_SEQ_DESPESA').AsString;
        ITEM_DESP.ParamByName('CD_MOEDA').AsString := DESP.FieldByName('CD_MOEDA').AsString;
        ITEM_DESP.ParamByName('TP_NOCH').AsString := DESP.FieldByName('TP_NOCH').AsString;
        ITEM_DESP.ParamByName('DT_INPUT_DESP').AsString := DESP.FieldByName('DT_INPUT_DESP').AsString;
        ITEM_DESP.ParamByName('VL_DESP_ITEM').AsFloat := (DESP.FieldByName('VL_DESP_FAT').AsFloat / SUM_ITEM) * ITEM.FieldByName('VL_TOTAL').AsFloat;
        ITEM_DESP.ParamByName('IN_INDICADOR_CONTABIL').AsString := DESP.FieldByName('IN_INDICADOR_CONTABIL').AsString;
        ITEM_DESP.ParamByName('DT_PGTO_DESP_EMB').AsString := DESP.FieldByName('DT_PGTO_DESP').AsString;
        ITEM_DESP.ParamByName('VL_TAXA_CAMBIO').AsFloat := DESP.FieldByName('VL_TAXA_CAMBIO').AsFloat;
        ITEM_DESP.ExecSQL;
        DESP.Next;
        Inc(MAX_ITEM);
      end;
      ITEM.Next;
    end;
  end;
  ITEM_DESP.Free;
  grfCalc.AddProgress(1);

  // Soma todas as despesas do tipo para o item
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.ADD('UPDATE TPO_ITEM ');
    SQL.ADD('SET    VL_UNITARIO = ');
    SQL.ADD('         CONVERT( numeric( 15, 5 ), ');
    SQL.ADD('         ROUND( ( SELECT ROUND( SUM( ROUND( D.VL_DESP_ITEM, 7 ) ), 7 ) ');
    SQL.ADD('                  FROM   TPO_ITEM_DESP D (NOLOCK)');
    SQL.ADD('                  WHERE  D.NR_DESP_ITEM = "UI" AND ');
    SQL.ADD('                         D.NR_PROCESSO = P.NR_PROCESSO AND ');
    SQL.ADD('                         D.NR_ITEM = P.NR_ITEM ), 7 ) ) ');
    SQL.ADD('FROM   TPO_ITEM P ');
    SQL.ADD('WHERE  P.NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
    SQL.ADD('  AND CD_EMPRESA = ' + QuotedStr(CD_EMPRESA));
    ExecSQL;
    Free;
  end;
  grfCalc.AddProgress(1);

  // Calcula o volume da caixa
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.ADD('UPDATE TPO_EMBALAGEM SET VL_VOLUME_CAIXA = CONVERT( numeric( 5, 2), ROUND( VL_LARGURA_CAIXA, 2 ) * ROUND( VL_ALTURA, 2 ) * ROUND( VL_COMPRIMENTO_CAIXA, 2 ) )  WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
    ExecSQL;
    Free;
  end;
  grfCalc.AddProgress(1);

  // Calcula o peso volumetrico
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.ADD('SELECT SUM( VL_VOLUME_CAIXA ) FROM TPO_EMBALAGEM (NOLOCK) WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
    Open;
    F := Format('%.4f',[Fields[0].AsFloat]);
    SQL.Clear;
    SQL.ADD('UPDATE TPO SET VL_PESO_VOLUMETRICO = CONVERT( numeric( 14, 7 ), :PL_VOLUMETRICO ) WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
    Params[0].AsFloat := StrToFloat(F);
    ExecSQL;
    Free;
  end;
  grfCalc.AddProgress(1);

  // Rateia o frete da po para os itens
  ITEM := TQuery.Create(Application);
  ITEM.DataBaseName := 'DBBROKER';
  ITEM.RequestLive := True;
  ITEM.SQL.ADD('Select * FROM TPO_ITEM WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
  ITEM.Open;
  ITEM.First;
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.ADD('SELECT ((VL_FRETE_COLLECT + VL_FRETE_PREPAID) - VL_FRETE_TERRIT_NAC) FROM TPO WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
    Open;
    VALOR := Fields[0].AsFloat;
    SQL.Clear;
    SQL.ADD('SELECT SUM(PL_ITEM) FROM TPO_ITEM WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
    Open;
    SUM_ITEM := Fields[0].AsFloat;
    if SUM_ITEM > 0 then
    begin
       SQL.ADD('UPDATE TPO_ITEM SET VL_FRETE_ITEM = CONVERT(numeric(15,2),ROUND(:FRETE,2)) WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO) + ' and NR_ITEM = :ITEM');
       while not ITEM.EOF do
       begin
         Params[0].AsFloat := (VALOR/SUM_ITEM) * ITEM.FieldByName('PL_ITEM').AsFloat;
         Params[1].AsString := ITEM.FieldByName('NR_ITEM').AsString;
         ExecSQL;
         ITEM.NEXT;
       end;
    end;
  end;
  ITEM.Free;
  grfCalc.AddProgress(1);

  // Faz o rateio do peso liquido
  CAIXA := TQuery.Create(Application);
  CAIXA.DataBaseName := 'DBBROKER';
  CAIXA.SQL.ADD('Select * FROM TPO_EMBALAGEM WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
  CAIXA.Open;
  ITEM := TQuery.Create(Application);
  ITEM.DataBaseName := 'DBBROKER';
  ITEM.RequestLive := True;
  ITEM.SQL.ADD('Select * FROM TPO_ITEM WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO) + ' AND CD_CAIXA = :CD_CAIXA');

  while not CAIXA.EOF do
  begin
    PL_CAIXA := CAIXA.FieldByName('VL_PESO_LIQUIDO').AsFloat;
    with TQuery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      SQL.ADD('SELECT SUM(PL_ITEM) FROM TPO_ITEM WHERE NR_PROCESSO = '  + QuotedStr(NR_PROCESSO) + ' AND CD_CAIXA = ' + QuotedStr(CAIXA.FieldByName('NR_CAIXA').AsString));
      Open;
      PL_ITENS := Fields[0].AsFloat;
      Free;
    end;
    ITEM.Close;
    ITEM.Params[0].AsString := CAIXA.FieldByName('NR_CAIXA').AsString;
    ITEM.Open;
    while not ITEM.EOF do
    begin
      with TQuery.Create(Application) do
      begin
        DataBaseName := 'DBBROKER';
        SQL.ADD('UPDATE TPO_ITEM SET PL_ITEM = CONVERT( numeric( 15, 5 ), ROUND(:PL, 5 ) ) WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO) + ' AND NR_ITEM = ' + QuotedStr(ITEM.FieldByName('NR_ITEM').AsString));
        PERC := (ITEM.FieldByName('PL_ITEM').AsFloat / PL_ITENS) * 100;
        Params[0].AsFloat := (PL_CAIXA / 100) * PERC;
        ExecSQL;
        Free;
      end;
      ITEM.Next;
    end;
    CAIXA.Next;
  end;
  ITEM.Free;
  CAIXA.Free;
  grfCalc.AddProgress(1);

  // Fixa exponenciais
  with Tquery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    RequestLive := True;
    SQL.ADD('SELECT * FROM TPO_ITEM_DESP WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
    Open;
    while not EOF do
    begin
      VALOR := FieldByName('VL_DESP_ITEM').AsFloat;
      if VALOR < 0.0001 then Valor := 0;

      Edit;
      FieldByName('VL_DESP_ITEM').AsFloat := VALOR;
      Post;
      Next;
    end;
    Free;
  end;

  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.ADD('UPDATE TPO_ITEM SET QT_DISPONIVEL = QT_INICIAL');
    ExecSQL;
    Free;
  end;

  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.ADD('UPDATE TPO SET QT_TOTAL_DISPONIVEL = (SELECT SUM(QT_DISPONIVEL) FROM TPO_ITEM WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO) + ') WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
    ExecSQL;
    Free;
  end;

  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.ADD('UPDATE TPO SET IN_CALCULADO = ' + QuotedStr('1') + ' WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
    ExecSQL;
    Free;
  end;

  datm_po.qry_po_Lista_.Close;
  datm_po.qry_po_Lista_.Open;
  datm_po.qry_po_Lista_.Locate('NR_PROCESSO',NR_PROCESSO,[]);

  ShowMessage('Cálculos realizados com sucesso');
  except
    ShowMessage('Não foi possível concluir o cálculo');
    pnl_Calc.SendToBack;
    pnl_Calc.Visible := False;
  end;
  pnl_Calc.SendToBack;
  pnl_Calc.Visible := False;
end;

procedure Tfrm_po.CalcularValorDoItem(Sender: TObject);
begin
//  dbedt_vl_itemEnter(nil);
(*  // Valor do Item
  if datm_po.qry_po_itens_.State in [dsEdit, dsInsert] then
  begin
     case datm_po.qry_po_itens_TP_CALCULO.AsInteger of
       1: datm_po.qry_po_itens_VL_TOTAL.AsFloat := datm_po.qry_po_itens_QT_INICIAL.AsFloat  * datm_po.qry_po_itens_VL_UNITARIO.AsFloat;
       2: datm_po.qry_po_itens_VL_TOTAL.AsFloat := (datm_po.qry_po_itens_QT_INICIAL.AsFloat * datm_po.qry_po_itens_VL_UNITARIO.AsFloat) / 100;
       3: datm_po.qry_po_itens_VL_TOTAL.AsFloat := (datm_po.qry_po_itens_QT_INICIAL.AsFloat * datm_po.qry_po_itens_VL_UNITARIO.AsFloat) / 1000;
       4: datm_po.qry_po_itens_VL_TOTAL.AsFloat := datm_po.qry_po_itens_PL_ITEM.AsFloat     * datm_po.qry_po_itens_VL_UNITARIO.AsFloat;
     end;
  end;*)
end;

procedure Tfrm_po.CalcularQtdInicialDoItem(Sender: TObject);
var
  UN: String;
begin
  UN                   := ConsultaLookUp('TNCM','CODIGO',dbedt_cd_ncm.Text,'UNIDADE_MEDIDA');
  edt_nm_unid_est.Text := ConsultaLookUp('TUNID_MEDIDA_BROKER','CD_UNID_MEDIDA',UN,'NM_UNID_MEDIDA');
  if datm_po.qry_po_itens_.State in [dsEdit, dsInsert] then
  begin
     if ( edt_nm_unid_est.Text = 'QUILOGRAMA LIQUIDO' ) then
       datm_po.qry_po_itens_QT_INICIAL_EST.AsFloat := datm_po.qry_po_itens_PL_ITEM.AsFloat
     else
       datm_po.qry_po_itens_QT_INICIAL_EST.AsFloat := datm_po.qry_po_itens_QT_INICIAL.AsFloat
  end;
end;

procedure Tfrm_po.CalcEmbalagemVolume(Sender: TObject);
//var LARGURA, COMPRIMENTO, ALTURA: Double;
begin
{  if datm_po.qry_po_emb.State in [dsEdit, dsInsert] then
begin
     try LARGURA     := datm_po.qry_po_embVL_LARGURA_CAIXA.AsFloat     except LARGURA     := 0; end;
     try COMPRIMENTO := datm_po.qry_po_embVL_COMPRIMENTO_CAIXA.AsFloat except COMPRIMENTO := 0; end;
     try ALTURA      := datm_po.qry_po_embVL_ALTURA.AsFloat            except ALTURA      := 0; end;
     datm_po.qry_po_embVL_VOLUME_CAIXA.AsFloat := LARGURA * COMPRIMENTO * ALTURA;
  end;}
end;

procedure Tfrm_po.LookNivelNVE(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
     if not (datm_po.qry_po_nve_.State in [dsEdit, dsInsert]) then datm_po.qry_po_nve_.Edit;
     datm_po.qry_po_nve_CD_NIVEL_NVE.AsString := ConsultaOnLineEx('TAB_NIVEL','Níveis NVE',['CD_NIVEL_NVE','NM_NIVEL'],['Código','Nivel'],'CD_NIVEL_NVE',nil);
     DBedtLookNivelNVE.Text := datm_po.qry_po_nve_CD_NIVEL_NVE.AsString;
  end else
     edtLookNivelNVE.Text   := ConsultaLookUp('TAB_NIVEL','CD_NIVEL_NVE',DBedtLookNivelNVE.Text,'NM_NIVEL');
//  if DBedtLookNivelNVE = 
//  vNumeroNivel =
end;

procedure Tfrm_po.LookAtributo(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
     if not (datm_po.qry_po_nve_.State in [dsEdit, dsInsert]) then datm_po.qry_po_nve_.Edit;
     datm_po.qry_po_nve_CD_ATRIBUTO_NCM.AsString := ConsultaOnLineExFiltro('TATRIB_VALORACAO_NVE','Atributo',['CD_ATRIBUTO_NCM','NM_ATRIBUTO'],['Código','Atributo'],'CD_ATRIBUTO_NCM','CD_NOMENC_NCM = "' + str_cd_nomenc_ncm + '" AND CD_NIVEL_NCM = "' + DBedtLookNivelNVE.Text + '"',nil);
     DBedtLookAtributo.Text := datm_po.qry_po_nve_CD_ATRIBUTO_NCM.AsString;
  end else
     edtLookAtributo.Text   := ConsultaLookUp('TATRIB_VALORACAO_NVE','CD_ATRIBUTO_NCM',DBedtLookAtributo.Text,'NM_ATRIBUTO');
end;

procedure Tfrm_po.LookEspecificacao(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
     if not (datm_po.qry_po_nve_.State in [dsEdit, dsInsert]) then datm_po.qry_po_nve_.Edit;
     datm_po.qry_po_nve_CD_ESPECIF_NCM.AsString := ConsultaOnLineExFiltro('TAB_ESPECIF_VALORACAO_NVE','Especificações',['CD_ESPECIF_NCM','NM_ESPECIF_NCM'],['Código','Especificação'],'CD_ESPECIF_NCM','CD_NOMENC_NCM = "' + str_cd_nomenc_ncm + '" AND CD_ATRIBUTO_NCM = "' + DBedtLookAtributo.Text + '"',nil);
     DBedtLookEspecificacao.Text := datm_po.qry_po_nve_CD_ESPECIF_NCM.AsString;
  end else
     edtLookEspecificacao.Text   := ConsultaLookUp('TAB_ESPECIF_VALORACAO_NVE','CD_ESPECIF_NCM',DBedtLookEspecificacao.Text,'NM_ESPECIF_NCM');
end;

procedure Tfrm_po.FiltrarNivel(Sender: TObject);
begin
  DBedtLookNivelNVE.Text := datm_po.qry_po_nve_CD_NIVEL_NVE.AsString;
  if      Trim(DBedtLookNivelNVE.Text) = 'C'  then SQL_ATR := ' WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,2) + '%" '
  else if Trim(DBedtLookNivelNVE.Text) = 'P'  then SQL_ATR := ' WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,4) + '%" '
  else if Trim(DBedtLookNivelNVE.Text) = 'SA' then SQL_ATR := ' WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,5) + '%" '
  else if Trim(DBedtLookNivelNVE.Text) = 'SB' then SQL_ATR := ' WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,6) + '%" '
  else if Trim(DBedtLookNivelNVE.Text) = 'N'  then SQL_ATR := ' WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,7) + '%" '
  else if Trim(DBedtLookNivelNVE.Text) = 'U'  then SQL_ATR := ' WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,8) + '%" ';
end;

procedure Tfrm_po.FiltrarAtrib(Sender: TObject);
begin
  DBedtLookAtributo.Text := datm_po.qry_po_nve_CD_ATRIBUTO_NCM.AsString;
  if      Trim(DBedtLookAtributo.Text) = 'C'  then SQL_ESP := ' WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,2) + '%" '
  else if Trim(DBedtLookAtributo.Text) = 'P'  then SQL_ESP := ' WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,4) + '%" '
  else if Trim(DBedtLookAtributo.Text) = 'SA' then SQL_ESP := ' WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,5) + '%" '
  else if Trim(DBedtLookAtributo.Text) = 'SB' then SQL_ESP := ' WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,6) + '%" '
  else if Trim(DBedtLookAtributo.Text) = 'N'  then SQL_ESP := ' WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,7) + '%" '
  else if Trim(DBedtLookAtributo.Text) = 'U'  then SQL_ESP := ' WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,8) + '%" ';
end;

procedure Tfrm_po.EscSai(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_escape then Close;
end;

procedure Tfrm_po.CarregarMercadoria(Sender: TObject);
var qry_mercadoria: TQuery;
    texto: TStringList;
begin
  //if not datm_po.ds_po_itens.AutoEdit then Exit;
  if not (datm_po.qry_po_itens_.State in [dsEdit, dsInsert]) then Exit;
  qry_mercadoria := TQuery.Create(Application);
  qry_mercadoria.DataBaseName := 'DBBROKER';
  qry_mercadoria.SQL.Add('SELECT * FROM TMERCADORIA WHERE CD_MERCADORIA = ' + QuotedStr(DBedtLookMercadoria.Text));
  qry_mercadoria.Open;
  if qry_mercadoria.IsEmpty then
  begin
     MessageDlg('Mercadoria "' + DBedtLookMercadoria.Text + '" não cadastrada',mtError,[mbOk],0);
     Exit;
  end;
  datm_po.qry_po_itens_VL_UNITARIO.AsFloat := qry_mercadoria.FieldByName('VL_UNITARIO').AsFloat;
  if ( datm_po.qry_po_itens_PL_ITEM.AsFloat = 0 ) and ( datm_po.qry_po_itens_QT_INICIAL.AsFloat > 0 ) then
    datm_po.qry_po_itens_PL_ITEM.AsFloat := datm_po.qry_po_itens_QT_INICIAL.AsFloat * qry_mercadoria.FieldByName('PL_MERCADORIA').AsFloat;

  if qry_mercadoria.FieldByName('CD_TIPO_CALCULO').AsString <> '' then
    datm_po.qry_po_itens_TP_CALCULO.AsString      := qry_mercadoria.FieldByName('CD_TIPO_CALCULO').AsString //dblkcbox_calc_itemExit(Sender);
  else
    datm_po.qry_po_itens_TP_CALCULO.AsString      := '1';

  datm_po.qry_po_itens_CD_UNID_MEDIDA.AsString  := qry_mercadoria.FieldByName('CD_UN_MED_COMERC').AsString;
  datm_po.qry_po_itens_CD_NCM_SH.AsString       := qry_mercadoria.FieldByName('CD_NCM_SH').AsString;
  datm_po.qry_po_itens_CD_NALADI_SH.AsString    := qry_mercadoria.FieldByName('CD_NALADI_SH').AsString;
  datm_po.qry_po_itens_CD_NALADI_NCCA.AsString  := qry_mercadoria.FieldByName('CD_NALADI_NCCA').AsString;
  datm_po.qry_po_itens_IN_NECESSITA_LI.AsString := qry_mercadoria.FieldByName('IN_NECESSITA_LI').AsString;
  if qry_mercadoria.FieldByName('CD_FABR_EXPO').AsString = '1' then
  begin
    if Trim( qry_mercadoria.FieldByName('CD_EXPORTADOR').AsString )     <> '' then datm_po.qry_po_itens_CD_FABRICANTE.AsString  := qry_mercadoria.FieldByName('CD_EXPORTADOR').AsString;
    if Trim( qry_mercadoria.FieldByName('CD_PAIS_AQUISICAO').AsString ) <> '' then datm_po.qry_po_itens_CD_PAIS_ORIGEM.AsString := qry_mercadoria.FieldByName('CD_PAIS_AQUISICAO').AsString;
  end else if qry_mercadoria.FieldByName('CD_FABR_EXPO').AsString = '2' then
  begin
    if Trim( qry_mercadoria.FieldByName('CD_EXPORTADOR').AsString )     <> '' then datm_po.qry_po_itens_CD_FABRICANTE.AsString  := qry_mercadoria.FieldByName('CD_FABRICANTE').AsString;
    datm_po.qry_po_itens_CD_PAIS_ORIGEM.AsString := qry_mercadoria.FieldByName('CD_PAIS_ORIGEM').AsString;
  end else if qry_mercadoria.FieldByName('CD_FABR_EXPO').AsString = '3' then
  begin
    datm_po.qry_po_itens_CD_FABRICANTE.AsString  := '';
    if Trim( qry_mercadoria.FieldByName('CD_PAIS_AQUISICAO').AsString ) <> '' then datm_po.qry_po_itens_CD_PAIS_ORIGEM.AsString := qry_mercadoria.FieldByName('CD_PAIS_ORIGEM').AsString;
  end;
  Application.ProcessMessages;
  texto := TStringList.Create;
//  if Trim(datm_po.qry_po_itens_TX_MERCADORIA.AsString) = '' thenbegin
     texto.Add(qry_mercadoria.FieldByName('NM_MERCADORIA').asString);
     datm_po.qry_po_itens_.FieldByName('TX_MERCADORIA').asString := Texto.text;
//  end;
  texto.Free;
  DBedtLookMercadoria.taBsTOP := false;
  Application.ProcessMessages;
  CalcularQtdInicialDoItem(nil);
  //Copia_NVE;
end;

procedure Tfrm_po.SpeedButton4Click(Sender: TObject);
begin
//    Application.CreateForm(Tfrm_local_embarque, frm_local_embarque);
//    frm_local_embarque.Cons_OnLine := datm_PO.qry_po_CD_LOCAL_DESTINO;
(*    with frm_local_embarque do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if Not ( datm_PO.qry_po_.State in [dsEdit, dsInsert] ) then datm_PO.qry_po_.Edit;
      ShowModal;
      lCons_OnLine := False;*)
//    end;
end;

procedure Tfrm_po.btn_co_local_desembarqueClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
   if not PoeEmEdicao(datm_PO.qry_po_) then exit;
    datm_PO.qry_po_CD_LOCAL_DESEMBARQUE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Locais de Desembarque',['CODIGO','DESCRICAO'],['Código','Local de Desembarque'],'CODIGO')
  end
  else
    edtLookLocalDesembarque.Text   := ConsultaLookUp('TLOCAL_EMBARQUE','CODIGO',DBedtLookLocalDesembarque.Text,'DESCRICAO');
end;

procedure Tfrm_po.SpeedButton5Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
   if not PoeEmEdicao(datm_PO.qry_po_) then exit;
    datm_PO.qry_po_CD_LOCAL_EMBARQUE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Locais de Embarque',['CODIGO','DESCRICAO'],['Código','Local de Desembarque'],'CODIGO')
  end
  else
    edt_cd_local_embarque.Text   := ConsultaLookUp('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_embarque.Text,'DESCRICAO');
end;

procedure Tfrm_po.SpeedButton2Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_PO.qry_po_) then exit;
    datm_PO.qry_po_CD_PAIS_PROCEDENCIA.AsString := ConsultaOnLineEx('TPAIS','Paises',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',nil);
  end else
    dbedt_nm_pais_proc.Text := ConsultaLookUP('TPAIS','CODIGO',dbedt_cd_pais_proc.Text,'DESCRICAO')
end;

procedure Tfrm_po.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if str_cd_rotina = '1801' then
    str_cd_rotina := '';
  datm_po.Free;
  crp_po.Free;
  action := caFree;
end;

procedure Tfrm_po.edt_nr_processoExit(Sender: TObject);
begin
  datm_po.qry_ref_cli_.Close;
  if edt_nr_processo.Text <> '' then
  begin
    datm_po.qry_ref_cli_.Params[0].AsString := frm_po.edt_nr_processo.Text;
    datm_po.qry_ref_cli_.Open;
  end;
end;

procedure Tfrm_po.DBedtLookMercadoriaClick(Sender: TObject);
begin
  DBedtLookMercadoria.taBsTOP := true;
end;

procedure Tfrm_po.FormShow(Sender: TObject);
begin
  if nr_po_gestao <> '' then
  begin
    if cd_cliente_gestao <> '' then
      datm_po.qry_po_lista_.Locate('NR_PROCESSO;CD_EMPRESA', VarArrayOf([nr_po_gestao, cd_cliente_gestao]), [])
    else
      datm_po.qry_po_lista_.Locate('NR_PROCESSO', VarArrayOf([nr_po_gestao]), []);
  end;
  pnl_cadastro.Color := clMenuBroker;
  Shape1.Brush.Color := clpnlClaroBroker;
  Shape5.Brush.Color := clpnlClaroBroker;
end;

procedure Tfrm_po.DBedtLookImportadorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_pais_proc         then SpeedButton2Click(SpeedButton2);
    if Sender = dbedt_cd_servico           then btn_co_servicoClick(btn_co_servico);
    if Sender = DBedtLookImportador        then LookImportador(btn_co_importador);
    if Sender = DBedtLookExportador        then LookExportador(btn_co_exportador);
    if Sender = DBedtLookFabricante        then LookFabricante(btn_co_fabricante);
    if Sender = DBedtLookLocalDesembarque  then btn_co_local_desembarqueClick(btn_co_local_desembarque);
    if Sender = DBedtLookPaisAquisicao     then LookPaisAquisicao(btn_co_pais_aquis);
    if Sender = DBedtLookPaisOrigem        then LookPaisOrigem(btn_co_pais_orig);
    if Sender = DBedtLookArea              then LookArea(btn_co_area);
    if Sender = DBedtLookTermoPagto        then LookTermoPagto(btn_co_termo_pagto);
    if Sender = DBedtLookIncoterm          then LookIncoterm(btn_co_incoterm);
    if Sender = DBedtLookViaTransp         then LookViaTransp(SpeedButton6);
//    if Sender = dbedt_cd_transp_internac   then SpeedButton2Click(SpeedButton2);
    if Sender = dbedt_cd_local_embarque    then SpeedButton5Click(SpeedButton5);
    if Sender = DBedtLookMoedaNegociada    then LookMoedaNegociada(btn_co_moeda);
    if Sender = DBedtLookTipoFrete         then LookTipoFrete(SpeedButton7);
    if Sender = DBedtLookMoedaFrete        then LookMoedaFrete(btn_co_moeda_frete);
    if Sender = DBedtLookMercadoria        then LookMercadoria(btn_co_produto);
    if Sender = DBedtLookUnMed             then LookUnidMed(btn_co_unid_med);
    if Sender = dbedt_cd_ncm               then LookNcm(btn_co_ncm);
    if Sender = dbedt_cd_naladi_ncca       then LookNaladiNCCA(btn_co_naladi_ncca);
    if Sender = dbedt_cd_naladi_sh         then LookNaladiSH(btn_co_naladi_sh);
    if Sender = DBedtLookFabric_Prod       then LookFabric_Prod(btn_co_fabr_item);
    if Sender = DBedtLookPaisOrigemItem    then LookPaisOrigemItem(btn_co_pais_origem);
    if Sender = EditArea                   then BtnAreaClick(BtnArea);
    if Sender = dbedt_cd_cliente           then btn_co_clienteClick(btn_co_cliente);
  end;
end;

procedure Tfrm_po.btn_co_servicoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_PO.qry_po_) then exit;
    datm_PO.qry_po_CD_SERVICO.AsString := ConsultaOnLineEx('TSERVICO','Serviços',['CD_SERVICO','NM_SERVICO'],['Código','Nome'],'CD_SERVICO',nil)
  end else
    dbedt_nm_servico.Text := ConsultaLookUP('TSERVICO','CD_SERVICO',datm_PO.qry_po_CD_SERVICO.AsString,'NM_SERVICO')
end;

procedure Tfrm_po.btn_co_exportador2Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_PO.qry_po_itens_) then exit;
//    datm_PO.qry_po_itens_CD_EXPORTADOR.AsString := ConsultaOnLineEx('TEMPRESA_EST','Exportadores',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA',nil)
    datm_PO.qry_po_itens_CD_EXPORTADOR.AsString := ConsultaOnLineExSQL('SELECT CD_EMPRESA, NR_CLIENTE, NM_EMPRESA, SUBSTRING(P.NM_PAIS,1,35), RTRIM(END_EMPRESA) + '', '' + END_NUMERO ENDERECO ' +
    ' FROM TEMPRESA_EST E, TPAIS_BROKER P WHERE P.CD_PAIS = E.CD_PAIS AND IN_EXPORTADOR = ''1''','Exportadores',['CD_EMPRESA', 'NR_CLIENTE', 'NM_EMPRESA', 'NM_PAIS', 'ENDERECO'],['Código', 'Cod. no Cliente', 'Nome', 'País', 'Endereço'],'CD_EMPRESA',nil)
  end else
    dbedt_nm_exportador2.Text := ConsultaLookUP('TEMPRESA_EST','CD_EMPRESA',datm_PO.qry_po_itens_CD_EXPORTADOR.AsString,'NM_EMPRESA')
end;

procedure Tfrm_po.btn_co_pais_aquisicao2Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
     if not (datm_po.qry_po_itens_.State in [dsEdit, dsInsert]) then datm_po.qry_po_itens_.Edit;
     datm_po.qry_po_itens_CD_PAIS_AQUISICAO.AsString := ConsultaOnLineEx('TPAIS','Paises',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',nil);
  end else
     dbedt_nm_pais_aquisicao2.Text   := ConsultaLookUp('TPAIS','CODIGO',datm_po.qry_po_itens_CD_PAIS_AQUISICAO.AsString,'DESCRICAO');
end;

procedure Tfrm_po.dbrdgrp_in_fabr_expo_itemChange(Sender: TObject);
begin
  if dbrdgrp_in_fabr_expo_item.Value = '1' then
  begin
     dbedt_cd_exportador2.Enabled       := True;
     DBedtLookFabric_Prod.Enabled       := False;
     dbedt_cd_pais_aquisicao2.Enabled   := True;
     DBedtLookPaisOrigemItem.Enabled    := False;
  end
  else if dbrdgrp_in_fabr_expo_item.Value = '2' then
  begin
     dbedt_cd_exportador2.Enabled       := True;
     DBedtLookFabric_Prod.Enabled       := True;
     dbedt_cd_pais_aquisicao2.Enabled   := True;
     DBedtLookPaisOrigemItem.Enabled    := True;
  end
  else if dbrdgrp_in_fabr_expo_item.Value = '3' then
  begin
     dbedt_cd_exportador2.Enabled       := True;
     DBedtLookFabric_Prod.Enabled       := False;
     dbedt_cd_pais_aquisicao2.Enabled   := True;
     DBedtLookPaisOrigemItem.Enabled    := True;
  end;
  if not dbedt_cd_exportador2.Enabled     then dbedt_cd_exportador2.Text := '';
  if not DBedtLookFabric_Prod.Enabled     then DBedtLookFabric_Prod.Text := '';
  if not dbedt_cd_pais_aquisicao2.Enabled then dbedt_cd_pais_aquisicao2.Text := '';
  if not DBedtLookPaisOrigemItem.Enabled  then DBedtLookPaisOrigemItem.Text := '';
  lbl_exportador2.Enabled        := dbedt_cd_exportador2.Enabled;
  btn_co_exportador2.Enabled     := dbedt_cd_exportador2.Enabled;
  lblLookFabric_Prod.Enabled     := DBedtLookFabric_Prod.Enabled;
  btn_co_fabr_item.Enabled       := DBedtLookFabric_Prod.Enabled;
  lbl_pais_aquisicao2.Enabled    := dbedt_cd_pais_aquisicao2.Enabled;
  btn_co_pais_aquisicao2.Enabled := dbedt_cd_pais_aquisicao2.Enabled;
  lblLookPaisOrigemItem.Enabled  := DBedtLookPaisOrigemItem.Enabled;
  btn_co_pais_origem.Enabled     := DBedtLookPaisOrigemItem.Enabled;
end;

procedure Tfrm_po.DBedtLookExportadorExit(Sender: TObject);
begin
  if (DBedtLookPaisAquisicao.Text = '') and (datm_po.qry_po_.State in [dsEdit, dsInsert]) then
    datm_po.qry_po_CD_PAIS_AQUISICAO.AsString := ConsultaLookUP('TEMPRESA_EST', 'CD_EMPRESA', DBedtLookExportador.Text, 'CD_PAIS');
end;

procedure Tfrm_po.dblkcbox_calc_itemClick(Sender: TObject);
begin
  datm_po.qry_po_itens_VL_TOTAL.AsFloat := 0;
  dbedt_vl_itemEnter(nil);
//  dbedt_cd_mercadoriaChange(nil);
end;

procedure Tfrm_po.dbedt_vl_itemEnter(Sender: TObject);
var
  iCod_Tipo_Calculo : Integer;
begin
  with datm_po do
  begin
    if ( qry_po_itens_.State in [dsEdit, dsInsert] ) then
    begin
      //qry_po_itens_.Edit;
      iCod_Tipo_Calculo := qry_po_itens_TP_CALCULO.AsInteger;
      case iCod_Tipo_Calculo of
      1 : datm_po.qry_po_itens_VL_TOTAL.AsFloat := Arredondar( qry_po_itens_QT_INICIAL.AsFloat * qry_po_itens_VL_UNITARIO.AsFloat, 2 );
      2 : qry_po_itens_VL_TOTAL.AsFloat := Arredondar( qry_po_itens_QT_INICIAL.AsFloat * qry_po_itens_VL_UNITARIO.AsFloat / 100, 2 );
      3 : qry_po_itens_VL_TOTAL.AsFloat := Arredondar( qry_po_itens_QT_INICIAL.AsFloat * qry_po_itens_VL_UNITARIO.AsFloat / 1000, 2 );
      4 : qry_po_itens_VL_TOTAL.AsFloat := Arredondar( qry_po_itens_PL_ITEM.AsFloat    * qry_po_itens_VL_UNITARIO.AsFloat, 2 );
      5 : begin // Valor será digitado pelo usuário

          end;
      else
        qry_po_itens_VL_TOTAL.AsFloat := Arredondar( qry_po_itens_QT_INICIAL.AsFloat * qry_po_itens_VL_UNITARIO.AsFloat, 2 );
      end;

      if qry_po_itens_PC_DESCONTO.AsFloat > 0 then
      begin
         qry_po_itens_VL_DESCONTO.AsFloat := Arredondar( qry_po_itens_VL_TOTAL.AsFloat * qry_po_itens_PC_DESCONTO.AsFloat /100, 2 );
      end;

      qry_po_itens_VL_TOTAL.AsFloat := qry_po_itens_VL_TOTAL.AsFloat - qry_po_itens_VL_DESCONTO.AsFloat;
    end;
  end;
end;

procedure Tfrm_po.dbedt_qt_mercadoriaExit(Sender: TObject);
begin
//  dbedt_vl_itemEnter(nil);
end;

procedure Tfrm_po.BtnAreaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
     if not (datm_po.qry_po_itens_.State in [dsEdit, dsInsert]) then
       datm_po.qry_po_itens_.Edit;
     datm_po.qry_po_itens_CD_AREA.AsString := ConsultaOnLineEx('TAREA','Áreas',['CD_AREA','NM_AREA'],['Código','Área'],'CD_AREA',nil);
     EditArea.Text := datm_po.qry_po_itens_CD_AREA.AsString;
  end
  else
     Edit1.Text   := ConsultaLookUp('TAREA','CD_AREA',EditArea.Text,'NM_AREA');
end;

procedure Tfrm_po.dbedtNrItemClienteExit(Sender: TObject);
begin
  ValidCodigo(dbedtNrItemCliente);
  //verifica se o item do pedido existe na PO
  with TQuery.Create(Application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) FROM TPO_ITEM (NOLOCK)');
    SQL.Add('WHERE NR_PROCESSO     = ''' + edt_nr_processo.Text    + '''');
    SQL.Add('  AND CD_EMPRESA      = ''' + dbedt_cd_cliente.Text + '''');
    SQL.Add('  AND NR_ITEM_CLIENTE = ''' + dbedtNrItemCliente.Text + '''');
    SQL.Add('  AND NR_PARCIAL      = ''' + datm_po.qry_po_itens_NR_PARCIAL.AsString + '''');
    SQL.Add('  AND NR_ITEM        <> ''' + datm_po.qry_po_itens_NR_ITEM.AsString      + '''');
    Open;

    if Fields[0].AsInteger > 0 then
    begin
      Application.MessageBox('Este item cliente já esta cadastrado para esse pedido!',
        'Informação', MB_OK + MB_ICONSTOP);
      dbedtNrItemCliente.SelectAll;
      dbedtNrItemCliente.SetFocus;
    end;
    Close;
    Free;
  end;
end;

procedure Tfrm_po.dbedtNrItemClienteKeyPress(Sender: TObject; var Key: Char);
begin
  if not ( IsNumeric(Key) ) and ( Key <> chr(VK_RETURN) ) and ( Key <> chr(VK_BACK) ) then
    Key := #0;
end;

procedure Tfrm_po.btnGestaoPedidoClick(Sender: TObject);
begin
  //Botão gestão do Pedido
  nr_po_gestao         := Trim(datm_po.qry_po_NR_PROCESSO.AsString);
  cd_cliente_gestao    := Trim(datm_po.qry_po_CD_EMPRESA.AsString);
  str_cd_rotina_atalho := '1820';
  Close;
end;

procedure Tfrm_po.btnProcRealizaClick(Sender: TObject);
begin
  // Botão Realização do Processo
  nr_po_gestao         := Trim(datm_po.qry_po_NR_PROCESSO.AsString);  
  cd_cliente_gestao    := Trim(datm_po.qry_po_CD_EMPRESA.AsString);
  str_cd_rotina_atalho := '1807';
  Close;
end;


function Tfrm_po.ItemJaUtilizado(const pRef : string; const pCliente : string; const pNrItem : string;
  const pNrParcial : Integer) : Boolean;
{Rodrigo Capra - 15/07/2008 - 03919/08}
begin
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT Count(*) Cont');
    SQL.Add('FROM TESTAGIO_PROCESSO');
    SQL.Add('WHERE NR_REFERENCIA   = :NR_REFERENCIA');
    SQL.Add('  AND CD_EMPRESA      = :CD_EMPRESA');
    SQL.Add('  AND NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE');
    SQL.Add('  AND NR_PARCIAL      = :NR_PARCIAL');
    SQL.Add('  AND ISNULL(NR_PROCESSO_DES,'''') <> ''''');
    ParamByName('NR_REFERENCIA').AsString   := pRef;
    ParamByName('CD_EMPRESA').AsString      := pCliente;
    ParamByName('NR_ITEM_CLIENTE').AsString := pNrItem;
    ParamByName('NR_PARCIAL').AsInteger     := pNrParcial;
    Open;
    Result := FieldByName('Cont').AsInteger <> 0; //se for Zero, então nenhum processo está utilizando a referencia
    Free;
  end;
end;

function Tfrm_po.HabilitaCampos(const vHab : Boolean) : Boolean;
var
  vCor : TColor;
begin
  if vHab then
    vCor := clWindow
  else
    vCor := clBtnFace;

  DBedtLookMercadoria.Color       := vCor;
  EditArea.Color                  := vCor;
  dbedt_qt_mercadoria.Color       := vCor;
  DBedtLookUnMed.Color            := vCor;
  dbedt_vl_unitario.Color         := vCor;
  dbedt_pc_desc_item.Color        := vCor;
  dbedt_vl_desc_item.Color        := vCor;
  dbedt_pc_com_item.Color         := vCor;
  dbedt_vl_item.Color             := vCor;
  dblkcbox_calc_item.Color        := vCor;
  dbm_nm_mercadoria.Color         := vCor;
  dbedt_cd_exportador2.Color      := vCor;
  DBedtLookFabric_Prod.Color      := vCor;
  dbedt_cd_ncm.Color              := vCor;
  dbedt_cd_naladi_ncca.Color      := vCor;
  dbedt_cd_naladi_sh.Color        := vCor;
  edt_nm_unid_est.Color           := vCor;
  dbedt_qt_unid_estat.Color       := vCor;
  dbedt_peso_liq.Color            := vCor;
  dblckpbox_tp_modalidade.Color   := vCor;
  dbedt_cd_numero_ato.Color       := vCor;
  dbedt_cd_pais_aquisicao2.Color  := vCor;
  DBedtLookPaisOrigemItem.Color   := vCor;
  dbedt_cd_cliente.Color          := vCor;

  btn_co_produto.Enabled         := vHab;
  BtnArea.Enabled                := vHab;
  btn_co_unid_med.Enabled        := vHab;
  btn_co_exportador2.Enabled     := vHab;
  btn_co_fabr_item.Enabled       := vHab;
  btn_co_ncm.Enabled             := vHab;
  btn_co_naladi_ncca.Enabled     := vHab;
  btn_co_naladi_sh.Enabled       := vHab;
  btn_co_pais_aquisicao2.Enabled := vHab;
  btn_co_pais_origem.Enabled     := vHab;
  btn_co_cliente.Enabled         := vHab;


  DBedtLookMercadoria.ReadOnly       := not vHab;
  EditArea.ReadOnly                  := not vHab;
  dbedt_qt_mercadoria.ReadOnly       := not vHab;
  DBedtLookUnMed.ReadOnly            := not vHab;
  dbedt_vl_unitario.ReadOnly         := not vHab;
  dbedt_pc_desc_item.ReadOnly        := not vHab;
  dbedt_vl_desc_item.ReadOnly        := not vHab;
  dbedt_pc_com_item.ReadOnly         := not vHab;
  dbedt_vl_item.ReadOnly             := not vHab;
  dblkcbox_calc_item.ReadOnly        := not vHab;
  dbm_nm_mercadoria.ReadOnly         := not vHab;
  dbedt_cd_exportador2.ReadOnly      := not vHab;
  DBedtLookFabric_Prod.ReadOnly      := not vHab;
  dbedt_cd_ncm.ReadOnly              := not vHab;
  dbedt_cd_naladi_ncca.ReadOnly      := not vHab;
  dbedt_cd_naladi_sh.ReadOnly        := not vHab;
  edt_nm_unid_est.ReadOnly           := not vHab;
  dbedt_qt_unid_estat.ReadOnly       := not vHab;
  dbedt_peso_liq.ReadOnly            := not vHab;
  dblckpbox_tp_modalidade.ReadOnly   := not vHab;
  dbedt_cd_numero_ato.ReadOnly       := not vHab;
  dbedt_cd_pais_aquisicao2.ReadOnly  := not vHab;
  DBedtLookPaisOrigemItem.ReadOnly   := not vHab;
  DBRadioGroup1.ReadOnly             := not vHab;
  dbrdgrp_in_fabr_expo_item.ReadOnly := not vHab;
  dbedt_cd_cliente.ReadOnly          := not vHab;
end;

procedure Tfrm_po.btn_co_clienteClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_PO.qry_po_) then
      Exit;
    datm_PO.qry_po_CD_EMPRESA.AsString := ConsultaOnLineEx('TEMPRESA_NAC','Cliente',
      ['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'END_EMPRESA'],
      ['Código', 'Descrição', 'Apelido', 'CNPJ', 'Endereço'], 'CD_EMPRESA', nil);
  end
  else
    edt_nm_cliente.Text := ConsultaLookUp('TEMPRESA_NAC', 'CD_EMPRESA', dbedt_cd_cliente.Text, 'NM_EMPRESA');
end;

procedure Tfrm_po.dbedt_cd_clienteExit(Sender: TObject);
begin
  if (datm_po.qry_po_.State in [dsEdit, dsInsert]) and (Length(dbedt_cd_cliente.Text) in [1..4]) then
  begin
    dbedt_cd_cliente.Text := Copy('0000', 1, 5 - Length(dbedt_cd_cliente.Text)) + dbedt_cd_cliente.Text;
    btn_co_clienteClick(dbedt_cd_cliente);
  end;
end;

end.

