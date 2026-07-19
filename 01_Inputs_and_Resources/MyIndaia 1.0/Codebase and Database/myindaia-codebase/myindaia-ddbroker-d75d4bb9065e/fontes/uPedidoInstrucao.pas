unit uPedidoInstrucao;

interface

uses
  Variants, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, DBCtrls, RxDBComb, Mask, Grids, DBGrids, DB, Menus,DBTables, Math, ppBands, ppCache, ppClass, ppEndUsr,
  ppComm, ppRelatv, ppProd, ppReport, Funcoes, RxGIF, ppCtrls, ppRegion,
  ppVar, ppStrtch, ppMemo, ppPrnabl, ppParameter, ppSubRpt;

type
  Tfrm_pedido_instrucao = class(TForm)
    pnl_manut_proc: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    pgctrl_pedido_instrucao: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    dbgrid_aereo: TDBGrid;
    MainMenu1: TMainMenu;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    Label58: TLabel;
    dbnavg: TDBNavigator;
    btn_imprimir: TSpeedButton;
    mi_sair: TMenuItem;
    Panel2: TPanel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label24: TLabel;
    btn_co_exportador: TSpeedButton;
    lb_agente: TLabel;
    Label20: TLabel;
    btn_co_moeda: TSpeedButton;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    dbedt_cd_origem: TDBEdit;
    Label27: TLabel;
    Label6: TLabel;
    btn_liberar: TSpeedButton;
    pnl_master_direto: TPanel;
    dbedt_nr_master_direto: TDBEdit;
    Label3: TLabel;
    btn_master: TSpeedButton;
    ts_dados_maritimos: TTabSheet;
    dbgrid_maritimo: TDBGrid;
    mi_aprova_pedido: TMenuItem;
    mi_gera_conhec: TMenuItem;
    Label42: TLabel;
    pp_pedido: TppReport;
    ppDesigner: TppDesigner;
    btn_pre_alerta: TSpeedButton;
    mi_Imprimir: TMenuItem;
    edt_chave: TEdit;
    Label1: TLabel;
    cb_ordem: TComboBox;
    Label2: TLabel;
    Panel1: TPanel;
    Label62: TLabel;
    btn_unid: TSpeedButton;
    Label21: TLabel;
    btn_co_produto: TSpeedButton;
    edt_nm_unid: TEdit;
    msk_cd_unid: TMaskEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    GroupBox1: TGroupBox;
    dbgrid_carga: TDBGrid;
    Panel3: TPanel;
    dbedcheck_in_cubagem: TDBCheckBox;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Panel4: TPanel;
    Label15: TLabel;
    Label17: TLabel;
    Label22: TLabel;
    btn_co_imp_marit: TSpeedButton;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    btn_co_moeda_marit: TSpeedButton;
    lb_ag_marit: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label38: TLabel;
    Label43: TLabel;
    pnl_book_conso: TPanel;
    Label34: TLabel;
    Label35: TLabel;
    dbedt_nr_book_conso: TDBEdit;
    dbedt_nr_house_maritimo: TDBEdit;
    Label46: TLabel;
    Panel5: TPanel;
    Label44: TLabel;
    btn_co_navio: TSpeedButton;
    lb_retirada: TLabel;
    btn_co_arm_retirada: TSpeedButton;
    Label47: TLabel;
    btn_co_descarga: TSpeedButton;
    Panel8: TPanel;
    Label36: TLabel;
    Label37: TLabel;
    Label45: TLabel;
    btn_co_notificador: TSpeedButton;
    Label50: TLabel;
    ts_conso_aerea: TTabSheet;
    DBGrid1: TDBGrid;
    Panel9: TPanel;
    DBGrid2: TDBGrid;
    Label51: TLabel;
    btn_co_conso: TSpeedButton;
    btn_liberar_comerc: TSpeedButton;
    ts_conso_maritimo: TTabSheet;
    DBGrid3: TDBGrid;
    Label52: TLabel;
    DBGrid4: TDBGrid;
    mi_pre_alerta: TMenuItem;
    mi_house: TMenuItem;
    mi_transp: TMenuItem;
    dbedt_cd_imp_marit: TDBEdit;
    dbedt_cd_moeda_marit: TDBEdit;
    DBEdit20: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    rxcombo_tp_estufagem: TRxDBComboBox;
    RxDBComboBox2: TRxDBComboBox;
    DBEdit21: TDBEdit;
    DBEdit2: TDBEdit;
    pnl_book_direto: TPanel;
    Label39: TLabel;
    dbedt_nr_book_direto: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    dbedt_nm_imp_marit: TDBEdit;
    dbedt_cd_armador: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit12: TDBEdit;
    dbedt_nm_moeda_marit: TDBEdit;
    dbedt_cd_ag_marit: TDBEdit;
    dbedt_nm_ag_marit: TDBEdit;
    dblk_tp_frete_marit: TDBLookupComboBox;
    dbedt_cd_veiculo: TDBEdit;
    dbedt_cd_notificador: TDBEdit;
    dbedt_cd_descarga: TDBEdit;
    dbedt_cd_atracacao: TDBEdit;
    dbedt_nm_veiculo: TDBEdit;
    dbedt_nm_descarga: TDBEdit;
    dbedt_nm_notificador: TDBEdit;
    dbedt_nm_atracacao: TDBEdit;
    dbedt_nr_viagem: TDBEdit;
    dbedt_dt_viagem: TDBEdit;
    dbedt_dead_line: TDBEdit;
    dbedt_cd_importador: TDBEdit;
    dbedt_cd_moeda: TDBEdit;
    DBEdit10: TDBEdit;
    dbLookCB_incoterm: TDBLookupComboBox;
    RxDBComboBox1: TRxDBComboBox;
    pnl_dados_direto: TPanel;
    Label9: TLabel;
    Label12: TLabel;
    dbedt_nr_voo: TDBEdit;
    dbedt_dt_voo: TDBEdit;
    DBEdit1: TDBEdit;
    pn_bc_bc: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    dbedt_nr_master: TDBEdit;
    dbedt_nr_house: TDBEdit;
    dbedt_cd_cliente: TDBEdit;
    dbedt_nm_cliente: TDBEdit;
    dbedt_nm_importador: TDBEdit;
    dbedt_cd_companhia: TDBEdit;
    dbedt_nm_companhia: TDBEdit;
    dbedt_nm_origem: TDBEdit;
    dbedt_cd_destino: TDBEdit;
    dbet_nm_destino: TDBEdit;
    dbedt_nm_moeda: TDBEdit;
    dbedt_cd_agente: TDBEdit;
    dbedt_nm_agente: TDBEdit;
    dblk_tp_frete_aereo: TDBLookupComboBox;
    Label53: TLabel;
    DBEdit18: TDBEdit;
    shp1: TShape;
    nbEstufagem: TNotebook;
    pnl_fcl: TGroupBox;
    dbgrid_fcl: TDBGrid;
    Panel6: TPanel;
    Label40: TLabel;
    Label41: TLabel;
    Label48: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit22: TDBEdit;
    pnl_lcl: TGroupBox;
    dbgrid_lcl: TDBGrid;
    Panel7: TPanel;
    Label29: TLabel;
    Label33: TLabel;
    Label49: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit23: TDBEdit;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppShape14: TppShape;
    ppLabel5: TppLabel;
    ppReferencia: TppLabel;
    ppDBText9: TppDBText;
    ppDBText20: TppDBText;
    ppInstrucao: TppLabel;
    ppDespachante: TppLabel;
    ppDBText3: TppDBText;
    ppDBText18: TppDBText;
    ppLabel3: TppLabel;
    ppShape15: TppShape;
    ppLabel1: TppLabel;
    ppLabel10: TppLabel;
    ppDBText37: TppDBText;
    ppLabel12: TppLabel;
    ppDBText7: TppDBText;
    ppLabel22: TppLabel;
    ppDBText15: TppDBText;
    ppLabel23: TppLabel;
    ppDBText25: TppDBText;
    ppDBText6: TppDBText;
    ppDBText2: TppDBText;
    ppDBText1: TppDBText;
    ppDBText4: TppDBText;
    ppNumPagina: TppSystemVariable;
    ppDBText39: TppDBText;
    ppPagina: TppSystemVariable;
    ppRegPag1: TppRegion;
    ppShape5: TppShape;
    ppShape1: TppShape;
    ppShape19: TppShape;
    ppShape17: TppShape;
    ppShape4: TppShape;
    ppDBMemo1: TppDBMemo;
    ppShape9: TppShape;
    ppShape2: TppShape;
    ppPesoLiq: TppLabel;
    ppDBText33: TppDBText;
    ppViaTransp: TppLabel;
    ppDBText36: TppDBText;
    ppMarcas: TppLabel;
    ppLocalOrigem: TppLabel;
    ppDBText42: TppDBText;
    ppDBText59: TppDBText;
    ppDBText63: TppDBText;
    ppDBText67: TppDBText;
    ppNotificado2: TppLabel;
    ppDBText38: TppDBText;
    ppShape16: TppShape;
    ppImportador: TppLabel;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppConsignatario: TppLabel;
    ppDBText61: TppDBText;
    ppNotificado1: TppLabel;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText49: TppDBText;
    ppShpShip: TppShape;
    pp: TppLabel;
    ppDBText8: TppDBText;
    ppDBText11: TppDBText;
    ppDBText17: TppDBText;
    ppLabel6: TppLabel;
    ppAgente: TppLabel;
    ppDBText16: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppPaisOrigem: TppLabel;
    ppDBText19: TppDBText;
    ppDBText10: TppDBText;
    ppDBText30: TppDBText;
    ppLabel4: TppLabel;
    ppDBText13: TppDBText;
    ppFrete: TppDBText;
    ppDBText34: TppDBText;
    ppPesoBruto: TppLabel;
    ppLabel21: TppLabel;
    ppCubagem: TppLabel;
    ppLocalDestino: TppLabel;
    ppDBText43: TppDBText;
    ppDBText14: TppDBText;
    ppDBText29: TppDBText;
    ppLine12: TppLine;
    ppDBMemo4: TppDBMemo;
    ppDBText12: TppDBText;
    ppDBText5: TppDBText;
    ppRegDetail: TppRegion;
    ppQtde: TppLabel;
    ppCod: TppLabel;
    ppDesc: TppLabel;
    pppeso_liq: TppLabel;
    ppLabel8: TppLabel;
    pppeso_brut: TppLabel;
    ppLabel7: TppLabel;
    pppreco_unit: TppLabel;
    ppDBMRefCli: TppDBMemo;
    pptotal_valor: TppLabel;
    ppLine4: TppLine;
    ppLine8: TppLine;
    ppLine15: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppDBText26: TppDBText;
    ppRegEmbSup: TppRegion;
    ppRegEmb: TppRegion;
    ppLabel13: TppLabel;
    ppDBText28: TppDBText;
    SubRE: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppDBText21: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppDBText22: TppDBText;
    ppDBText41: TppDBText;
    ppimg_logo_instemb: TppImage;
    ppDetailBand1: TppDetailBand;
    ppQtd: TppDBText;
    ppCodigo: TppDBText;
    ppDBMemo3: TppDBMemo;
    pppeso_liquido: TppDBText;
    pppeso_bruto: TppDBText;
    pppreco_unitario: TppDBText;
    ppDBText31: TppDBText;
    pptotal: TppDBText;
    ppLine5: TppLine;
    ppRegMerc: TppRegion;
    ppDBText32: TppDBText;
    ppLine14: TppLine;
    ppLine16: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppRegion1: TppRegion;
    ppDBText27: TppDBText;
    ppDBText35: TppDBText;
    ppDBText40: TppDBText;
    ppDBMDeclAdic: TppDBMemo;
    ppDBMDeclAdicInstEmb: TppDBMemo;
    ppPageStyle1: TppPageStyle;
    ppLine2: TppLine;
    ppLine7: TppLine;
    ppLine6: TppLine;
    ppLine3: TppLine;
    ppLine11: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine13: TppLine;
    ppLine1: TppLine;
    shp2: TShape;
    procedure FormCreate(Sender: TObject);
    procedure dbedt_cd_importadorExit(Sender: TObject);
    procedure dbedt_cd_moedaExit(Sender: TObject);
    procedure btn_co_exportadorClick(Sender: TObject);
    procedure btn_co_moedaClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure pgctrl_pedido_instrucaoChange(Sender: TObject);
    procedure dbedt_cd_clienteChange(Sender: TObject);
    procedure dbedt_cd_agenteChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbedt_cd_unid_negKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pgctrl_pedido_instrucaoChanging(Sender: TObject; var AllowChange: Boolean);
    procedure cb_ordemChange(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unidExit(Sender: TObject);
    procedure btn_unidClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_liberarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_masterClick(Sender: TObject);
    procedure dbedt_nr_vooChange(Sender: TObject);
    procedure insere_master;
    function proximo_conhecimento(conhecimento:String):String;
    function digitto_iata( Conhecimento:string):String;
    procedure rxcombo_tp_estufagemChange(Sender: TObject);
    procedure master_aerea;
    procedure master_maritimo;
    procedure dbgrid_lclDblClick(Sender: TObject);
    procedure dbgrid_lclKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_nr_book_diretoExit(Sender: TObject);
    procedure dbedt_nr_book_consoExit(Sender: TObject);
    procedure dbLookCB_incotermClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure btn_pre_alertaClick(Sender: TObject);
    function sel_tp_frete(incoterm, origem:String):String;
    procedure btn_co_navioClick(Sender: TObject);
    procedure dbedt_cd_veiculoExit(Sender: TObject);
    procedure btn_co_descargaClick(Sender: TObject);
    procedure dbedt_cd_descargaExit(Sender: TObject);
    procedure btn_co_arm_retiradaClick(Sender: TObject);
    procedure dbedt_cd_atracacaoExit(Sender: TObject);
    procedure btn_co_imp_maritClick(Sender: TObject);
    procedure dbedt_cd_imp_maritExit(Sender: TObject);
    procedure btn_co_notificadorClick(Sender: TObject);
    procedure dbedt_cd_notificadorExit(Sender: TObject);
    procedure btn_co_moeda_maritClick(Sender: TObject);
    procedure btn_co_consoClick(Sender: TObject);
    procedure btn_liberar_comercClick(Sender: TObject);
    procedure Habiliata_campo_conhec(qtde:integer);
    procedure dbgrid_cargaExit(Sender: TObject);
    procedure dbgrid_cargaEnter(Sender: TObject);
    procedure dbgrid_fclKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_fclDblClick(Sender: TObject);
    procedure dbgrid_lclKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_fclExit(Sender: TObject);
    procedure dbgrid_fclColExit(Sender: TObject);
  private
    a_str_indices : Array[0..6] Of String[60];

    st_modificar, st_incluir, st_excluir : Boolean;

    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;

    { Private declarations }
  public
    { Public declarations }
    flag_change_frete, via_transp:string;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
    Pesquisa, str_nm_unid, str_cd_unid, str_nm_prod, str_cd_prod: String;
    in_comerc :Boolean;
    function busca_conhec_master(cd_cia:string):string;
    function busca_conhec_house(unid_neg:string):string;
    // antigo procedure insere_tarifa_despesas(nr_processo, tp_estufagem, tp_comercial,nr_prop_cot, cd_prod, cd_serv, cd_tab:string);
    procedure insere_tarifa_despesas(nr_processo, tp_estufagem, cd_incoterm, nr_prop_cot, cd_prod, cd_serv, cd_tab:string);
    function  calc_tp_base(tp_base, nr_processo:string; vl_base:real; time:Boolean) :real;
  end;

var
  frm_pedido_instrucao : Tfrm_pedido_instrucao;
  fl_cd_instrucao      : real;
  st_cd_instrucao      : string;

implementation

uses GSMLIB, PGGP001, dPedidoInstrucao, PGGP017, ConsOnLineEx, uGerarConsolidada, PGSM091, PGSM990, uExpCalcProfit, uExpProfitMarit;

{$R *.DFM}

procedure Tfrm_pedido_instrucao.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_salvar.Enabled   := Salv;
  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;
  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_pedido_instrucao.Cancelar;
begin
  with datm_pedido_instrucao do
  begin
    if qry_processo_.State in [dsInsert, dsEdit] then
      qry_processo_.Cancel;
    if qry_conhecimento_.State in [dsInsert, dsEdit] then
      qry_conhecimento_.Cancel;
  end;
  btn_mi(st_incluir,false,false,st_excluir);
end;

function Tfrm_pedido_instrucao.Consiste: Boolean;
begin
  if datm_pedido_instrucao.qry_conhecimento_.state in [dsEdit,dsInsert] then
    if datm_pedido_instrucao.qry_conhecimento_CD_VIA_TRANSP.IsNull then
      datm_pedido_instrucao.qry_conhecimento_CD_VIA_TRANSP.AsString := via_transp;
  Consiste := true;
end;

procedure Tfrm_pedido_instrucao.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_pedido_instrucao, datm_pedido_instrucao );
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
  in_comerc    := False;
  Pesquisa     :='';
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
  with datm_pedido_instrucao do
  begin
    qry_traz_default_.Close;
    qry_traz_default_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_traz_default_.Open;
    msk_cd_unid.text:= qry_traz_default_CD_UNID_NEG.AsString;
    edt_nm_unid.text:=qry_traz_default_NM_UNID_NEG.AsString;
    msk_cd_produto.text:=qry_traz_default_CD_PRODUTO.AsString;
    edt_nm_produto.text:=qry_traz_default_NM_PRODUTO.AsString;
    qry_via_transp_.Close;
    qry_via_transp_.ParamByName('CD_VIA_TRANSP').AsString:='04';
    qry_via_transp_.Open;
    qry_tp_frete_.Close;
    qry_tp_frete_.Prepare;
    qry_tp_frete_.Open;
    qry_incoterm_.Close;
    qry_incoterm_.Prepare;
    qry_incoterm_.Open;
  end;
  a_str_indices[0] := 'NR_PROCESSO';
  a_str_indices[1] := 'NM_CLIENTE';
  a_str_indices[2] := 'AP_ORIGEM';
  a_str_indices[3] := 'AP_DESTINO';
  With cb_ordem do
  begin
    Clear;
    Items.Add('Processo');
    Items.Add('Cliente');
    Items.Add('Origem');
    Items.Add('Destino');
    ItemIndex := 0;
  end;
  pgctrl_pedido_instrucao.ActivePage:=ts_lista;
  btn_mi(st_incluir,false,false,st_excluir);
//  mi_aprova_pedido.Visible:=st_incluir;
//  btn_liberar.Visible:=st_incluir;
  mi_aprova_pedido.Visible:=True;
  btn_liberar.Visible:=True;
end;

function Tfrm_pedido_instrucao.Grava: Boolean;
begin
  try
    with datm_pedido_instrucao do
    begin
      if not datm_main.db_broker.InTransaction then
        datm_main.db_broker.StartTransaction;
      if qry_processo_.State in [dsInsert,dsEdit]then
      begin
        qry_processo_.Post;
      end;
      if qry_conhecimento_.State in [dsInsert,dsEdit]then
      begin
        qry_conhecimento_.Post;
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    end;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  btn_mi(st_incluir,false,false,st_excluir);
end;

function Tfrm_pedido_instrucao.VerAlt: Boolean;
begin
  VerAlt := True;
  if datm_pedido_instrucao.qry_processo_.State in[dsEdit,dsInsert] then
  begin
    if BoxMensagem('O Processo foi alterada.' + #13#10 + 'Deseja salvar as alterações?', 1) then
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

  if datm_pedido_instrucao.qry_conhecimento_.State in[dsEdit,dsInsert] then
  begin
    if BoxMensagem('Os Dados do Conhecimento não foram salvos.' + #13#10 + 'Deseja salvar as alterações?', 1) then
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

procedure Tfrm_pedido_instrucao.dbedt_cd_importadorExit( Sender: TObject);
begin
  with datm_pedido_instrucao do
  begin
    if Not ( qry_processo_.State in [dsEdit, dsInsert] ) then
      exit;
    if dbedt_cd_importador.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_importador );
      qry_pesquisa_.Active:=false;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_EMPRESA FROM TEMPRESA_EST WHERE CD_EMPRESA ="'+dbedt_cd_importador.Text+'"');
      qry_pesquisa_.Active:=true;
      if qry_pesquisa_.RecordCount > 0 then
      begin
        qry_processo_NM_IMP.AsString:=qry_pesquisa_.Fields[0].AsString;
        qry_pesquisa_.Close;
      end
      else
      begin
        qry_pesquisa_.Close;
        dbedt_nm_importador.Text := '';
        BoxMensagem('Código do Importador inválido!', 2);
        dbedt_cd_importador.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_pedido_instrucao.dbedt_cd_moedaExit(Sender: TObject);
begin
  with datm_pedido_instrucao do
  begin
    if Not ( qry_processo_.State in [dsEdit, dsInsert] ) then Exit;
    if dbedt_cd_moeda.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_moeda );
      qry_pesquisa_.Active:=false;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT  AP_MOEDA FROM TMOEDA_BROKER');
      qry_pesquisa_.Sql.Add('WHERE CD_MOEDA = "'+dbedt_cd_moeda.Text+'"');
      qry_pesquisa_.Active:=true;
      if qry_pesquisa_.RecordCount > 0 then
      begin
        qry_processo_NM_MOEDA.AsString := qry_pesquisa_.Fields[0].AsString;
        qry_pesquisa_.Close;
      end
      else
      begin
        qry_pesquisa_.Close;
        dbedt_nm_moeda.Text := '';
        BoxMensagem('Código da Moeda inválido!', 2);
        dbedt_cd_moeda.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_pedido_instrucao.btn_co_exportadorClick(Sender: TObject);
var
vGrupo:String[3];
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_pedido_instrucao.qry_processo_) then exit;

//    datm_pedido_instrucao.qry_processo_CD_EMP_EST.Value := ConsultaOnLineEx('TEMPRESA_EST','Importador',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA',nil, 1, datm_pedido_instrucao.qry_processo_CD_EMP_EST.Text)  BY CARLOS 18/06/2010
    vGrupo := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', datm_pedido_instrucao.qry_processo_NR_PROCESSO.AsString, 'CD_GRUPO');
    datm_pedido_instrucao.qry_processo_CD_EMP_EST.Value := ConsultaOnLineExSQL(
        'SELECT CD_EMPRESA, NM_EMPRESA, END_CIDADE, END_EMPRESA, END_NUMERO FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = ''1'' ' +
        ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ',
        'Cadastro de Importadores',['CD_EMPRESA', 'NM_EMPRESA', 'END_CIDADE','END_EMPRESA', 'END_NUMERO' ],['Código','Importador','Cidade','Endereço','Numero'],'CD_EMPRESA',nil,datm_pedido_instrucao.qry_processo_CD_EMP_EST.Value);


  end;
  dbedt_cd_importadorExit(sender);

{  vStr_cd_modulo := '22';
  str_cd_rotina := '2203';
  Application.CreateForm(Tfrm_emp_est, frm_emp_est);
  with frm_emp_est Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_emp_est.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_pedido_instrucao.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_pedido_instrucao.qry_processo_.Edit;
    datm_pedido_instrucao.qry_processo_CD_EMP_EST.Value:=frm_emp_est.Cons_OnLine_Texto;
  end;
  dbedt_cd_importadorExit(sender);}
end;

procedure Tfrm_pedido_instrucao.btn_co_moedaClick(Sender: TObject);
var
  moeda:string;
begin
  moeda := ConsultaOnLineEx('TMOEDA_BROKER','Moedas',['CD_MOEDA','NM_MOEDA','AP_MOEDA'],['Código','Moeda','Sigla'],'CD_MOEDA',nil,1, dbedt_cd_moeda.Text);
  if moeda <> '' then
  begin
    if not(datm_pedido_instrucao.qry_processo_.State in [dsEdit]) then datm_pedido_instrucao.qry_processo_.Edit;
    datm_pedido_instrucao.qry_processo_CD_MOEDA_FRETE.AsString:=  moeda;
    dbedt_cd_moedaExit(sender);
  end;
end;

procedure Tfrm_pedido_instrucao.btn_sairClick(Sender: TObject);
begin
  datm_pedido_instrucao.Free;
  close;
end;

procedure Tfrm_pedido_instrucao.btn_salvarClick(Sender: TObject);
begin
  if not Consiste then exit;
  if not Grava then exit;
end;

procedure Tfrm_pedido_instrucao.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_pedido_instrucao.pgctrl_pedido_instrucaoChange(Sender: TObject);
begin
//  btn_liberar.Enabled     := false;
//  mi_aprova_pedido.Enabled:= false;
  if pgctrl_pedido_instrucao.ActivePage = ts_lista then
  begin
    btn_master.Enabled         := false;
    btn_liberar_comerc.Enabled := true;
    mi_transp.Enabled          := true;
    mi_gera_conhec.Enabled     := false;
    dbnavg.Enabled             := true;
    edt_chave.Enabled          := true;
    cb_ordem.Enabled           := true;
    mi_Imprimir.Enabled        := false;
    btn_imprimir.Enabled       := false;
  end
  else
  begin
    btn_master.Enabled          := true;
    btn_liberar_comerc.Enabled  := false;
    mi_transp.Enabled           := false;
    mi_gera_conhec.Enabled      := true;
    dbnavg.Enabled              := false;
    edt_chave.Enabled           := false;
    cb_ordem.Enabled            := false;
    mi_Imprimir.Enabled         := true;
    btn_imprimir.Enabled        := true;
    btn_co_conso.Enabled        := false;
    mi_house.Enabled            := false;
  end;

  with datm_pedido_instrucao do
  begin
    if pgctrl_pedido_instrucao.ActivePage = ts_dados_basicos then
    begin
      qry_processo_carga_.Close;
      qry_processo_carga_.ParamByName('NR_PROCESSO').AsString:=qry_processo_NR_PROCESSO.AsString;
      qry_processo_carga_.Prepare;
      qry_processo_carga_.Open;
      if qry_processo_IN_ROUTING.AsString = '1' then
      begin
        qry_tab_frete_.Close;
        qry_tab_frete_.ParamByName('CD_TAB_FRETE').AsString:=qry_processo_CD_TAB_FRETE_VENDA.AsString;
        qry_tab_frete_.ParamByName('CD_SERVICO').AsString  :=qry_processo_CD_SERVICO.AsString;
        qry_tab_frete_.ParamByName('CD_PRODUTO').AsString  :=qry_processo_CD_PRODUTO.AsString;
        qry_tab_frete_.ParamByName('NR_PROPOSTA').AsString :=qry_processo_NR_PROPOSTA.AsString;
        qry_tab_frete_.Prepare;
        qry_tab_frete_.Open;
      end;
      qry_conhecimento_.close;
      qry_conhecimento_.ParamByName('NR_PROCESSO').AsString:=qry_processo_NR_PROCESSO.AsString;
      qry_conhecimento_.Prepare;
      qry_conhecimento_.Open;
      Habiliata_campo_conhec(qry_conhecimento_.RecordCount);
    end;

    if (pgctrl_pedido_instrucao.ActivePage = ts_conso_aerea) or (pgctrl_pedido_instrucao.ActivePage = ts_conso_maritimo) then
    begin
      qry_consolidadas_.Close;
      qry_consolidadas_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid.text;
      qry_consolidadas_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.text;
      qry_consolidadas_.ParamByName('CD_VIA_TRANSP').AsString  := via_transp;
      qry_consolidadas_.Prepare;
      qry_consolidadas_.Open;
      qry_consolidadas_.Locate('CD_MASTER', qry_conhecimento_CD_MASTER.AsString,[]);
      btn_co_conso.Enabled     := true;
      mi_house.Enabled         := true;
      btn_liberar.Enabled     := true;
      mi_aprova_pedido.Enabled:= true;
      btn_master.Enabled      := false;
      btn_imprimir.Enabled    := false;
    end;

    if pgctrl_pedido_instrucao.ActivePage = ts_dados_maritimos then
    begin
      qry_conhecimento_.close;
      qry_conhecimento_.ParamByName('NR_PROCESSO').AsString:=qry_processo_NR_PROCESSO.AsString;
      qry_conhecimento_.Prepare;
      qry_conhecimento_.Open;
      Habiliata_campo_conhec(qry_conhecimento_.RecordCount);
      if qry_processo_TP_ESTUFAGEM.AsString = '1' then
      begin
        qry_proc_cntr_.Close;
        qry_proc_cntr_.ParamByName('NR_PROCESSO').AsString:=qry_processo_NR_PROCESSO.AsString;
        qry_proc_cntr_.Prepare;
        qry_proc_cntr_.Open;
      end;
      if (qry_processo_TP_ESTUFAGEM.AsString = '0') or (qry_processo_TP_ESTUFAGEM.AsString = '2')then
      begin
        qry_processo_carga_.Close;
        qry_processo_carga_.ParamByName('NR_PROCESSO').AsString:=qry_processo_NR_PROCESSO.AsString;
        qry_processo_carga_.Prepare;
        qry_processo_carga_.Open;
      end;
    end;
  end;
end;

procedure Tfrm_pedido_instrucao.dbedt_cd_clienteChange(Sender: TObject);
begin
  if ( datm_pedido_instrucao.qry_processo_.State in [ dsInsert, dsEdit ] ) then
    Btn_Mi( False, st_modificar, st_modificar, False );
end;

procedure Tfrm_pedido_instrucao.dbedt_cd_agenteChange(Sender: TObject);
begin
  if ( datm_pedido_instrucao.qry_processo_.State in [ dsInsert, dsEdit ] ) then
    Btn_Mi( False, st_modificar, st_modificar, False );
end;

procedure Tfrm_pedido_instrucao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 27 then
  begin
    if Not VerAlt then Exit;
    Close;
  end;
end;

procedure Tfrm_pedido_instrucao.dbedt_cd_unid_negKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_produto       then btn_co_produtoClick(btn_co_produto);
    if Sender = msk_cd_unid          then btn_unidClick(btn_unid);
    if Sender = dbedt_cd_importador  then btn_co_exportadorClick(btn_co_exportador);
    if Sender = dbedt_cd_moeda       then btn_co_moedaClick(btn_co_moeda);
    if Sender = dbedt_cd_moeda_marit then btn_co_moeda_maritClick(btn_co_moeda_marit);
    if Sender = dbedt_cd_imp_marit   then btn_co_imp_maritClick(btn_co_imp_marit);
    if Sender = dbedt_cd_notificador then btn_co_notificadorClick(btn_co_notificador);
    if Sender = dbedt_cd_veiculo     then btn_co_navioClick(btn_co_navio);
    if Sender = dbedt_cd_descarga    then btn_co_descargaClick(btn_co_descarga);
    if Sender = dbedt_cd_atracacao   then btn_co_arm_retiradaClick(btn_co_arm_retirada);
  end;
end;

procedure Tfrm_pedido_instrucao.pgctrl_pedido_instrucaoChanging(Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange:=VerAlt;
end;

procedure Tfrm_pedido_instrucao.cb_ordemChange(Sender: TObject);
begin
  edt_chave.Text := '';
  edt_chave.SetFocus;
  datm_pedido_instrucao.qry_processo_.Close;
  datm_pedido_instrucao.qry_processo_.ParamByName('CD_UNID_NEG').AsString:=msk_cd_unid.text;
  datm_pedido_instrucao.qry_processo_.ParamByName('CD_PRODUTO').AsString:=msk_cd_produto.Text;

  if cb_ordem.itemindex = 0 then
  begin
    datm_pedido_instrucao.qry_processo_.Sql[20]:=' TP.NR_PROCESSO';
  end;

  if cb_ordem.itemindex = 1 then
  begin
    datm_pedido_instrucao.qry_processo_.Sql[20]:='NM_CLIENTE';
  end;

  if cb_ordem.itemindex = 2 then
  begin
    datm_pedido_instrucao.qry_processo_.Sql[20]:='AP_ORIGEM';
  end;

  if cb_ordem.itemindex = 3 then
  begin
    datm_pedido_instrucao.qry_processo_.Sql[20]:='AP_DESTINO';
  end;

  datm_pedido_instrucao.qry_processo_.Prepare;
  datm_pedido_instrucao.qry_processo_.Open;
end;

procedure Tfrm_pedido_instrucao.edt_chaveChange(Sender: TObject);
begin
  if cb_ordem.ItemIndex = 0 then
    Localiza(datm_pedido_instrucao.qry_processo_,msk_cd_unid.text + msk_cd_produto.text +  edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )
  else Localiza(datm_pedido_instrucao.qry_processo_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_pedido_instrucao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
  if Key = #27 then
  begin
    if Not VerAlt then Exit;
    Close;
  end;
end;

procedure Tfrm_pedido_instrucao.msk_cd_unidExit(Sender: TObject);
begin
  if msk_cd_unid.Text <> '' then
  begin
    ValCodEdt( msk_cd_unid );
    datm_pedido_instrucao.qry_pesquisa_.Active:=false;
    datm_pedido_instrucao.qry_pesquisa_.Sql.Clear;
    datm_pedido_instrucao.qry_pesquisa_.Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_cd_unid.Text+'"');
    datm_pedido_instrucao.qry_pesquisa_.Sql.Add('AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG from TUSUARIO_HABILITACAO');
    datm_pedido_instrucao.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_pedido_instrucao.qry_pesquisa_.Active:=true;
    if datm_pedido_instrucao.qry_pesquisa_.RecordCount > 0 then
    begin
      edt_nm_unid.text:= datm_pedido_instrucao.qry_pesquisa_.Fields[0].AsString;
      datm_pedido_instrucao.qry_pesquisa_.Close;

      datm_pedido_instrucao.qry_processo_.Close;
      datm_pedido_instrucao.qry_processo_.ParamByName('CD_UNID_NEG').AsString:=msk_cd_unid.Text;
      datm_pedido_instrucao.qry_processo_.ParamByName('CD_PRODUTO').AsString:=msk_cd_produto.text;
      datm_pedido_instrucao.qry_processo_.ParamByName('CD_VIA_TRANSP').AsString:=via_transp;
      //verifica se o modulo esta sendo aberto pelo comercial
      if in_comerc then
        datm_pedido_instrucao.qry_processo_.ParamByName('IN_PEDIDO').AsString:='2'
      else datm_pedido_instrucao.qry_processo_.ParamByName('IN_PEDIDO').AsString:='0';

      datm_pedido_instrucao.qry_processo_.Prepare;
      datm_pedido_instrucao.qry_processo_.Open;
    end
    else
    begin
      datm_pedido_instrucao.qry_pesquisa_.Close;
      edt_nm_unid.Text := '';
      BoxMensagem('Código da Unidade de Negócio inválido!', 2);
      msk_cd_unid.SetFocus;
      Exit;
    end;
  end
  else
  begin
    Boxmensagem('A Unidade de Negócio deve ser informado!',2);
    msk_cd_unid.SetFocus;
  end;
end;

procedure Tfrm_pedido_instrucao.btn_unidClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_unid.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil, 1, msk_cd_unid.Text)
  else edt_nm_unid.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid.Text,'NM_UNID_NEG');
  msk_cd_unidExit(nil);
end;

procedure Tfrm_pedido_instrucao.btn_co_produtoClick(Sender: TObject);
begin
  msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Unidade'],'CD_PRODUTO',nil, 1, msk_cd_produto.text);
  msk_cd_produtoExit(Sender);
end;

procedure Tfrm_pedido_instrucao.msk_cd_produtoExit(Sender: TObject);
begin
  if msk_cd_produto.Text <> '' then
  begin
    ValCodEdt( msk_cd_produto );
    datm_pedido_instrucao.qry_pesquisa_.Active:=false;
    datm_pedido_instrucao.qry_pesquisa_.Sql.Clear;
    datm_pedido_instrucao.qry_pesquisa_.Sql.Add('SELECT NM_PRODUTO FROM TPRODUTO WHERE CD_PRODUTO="'+msk_cd_produto.Text+'"');
    datm_pedido_instrucao.qry_pesquisa_.Sql.Add('AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO from TUSUARIO_HABILITACAO');
    datm_pedido_instrucao.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_pedido_instrucao.qry_pesquisa_.Active:=true;
    if not datm_pedido_instrucao.qry_pesquisa_.IsEmpty then
    begin
      edt_nm_produto.text:= datm_pedido_instrucao.qry_pesquisa_.Fields[0].AsString;
      datm_pedido_instrucao.qry_pesquisa_.Close;
      datm_pedido_instrucao.qry_processo_.Close;
      datm_pedido_instrucao.qry_processo_.ParamByName('CD_UNID_NEG').AsString:=msk_cd_unid.Text;
      datm_pedido_instrucao.qry_processo_.ParamByName('CD_PRODUTO').AsString:=msk_cd_produto.text;
      datm_pedido_instrucao.qry_processo_.ParamByName('CD_VIA_TRANSP').AsString:=via_transp;
      if in_comerc then
        datm_pedido_instrucao.qry_processo_.ParamByName('IN_PEDIDO').AsString:='2'
      else
        datm_pedido_instrucao.qry_processo_.ParamByName('IN_PEDIDO').AsString:='0';
      datm_pedido_instrucao.qry_processo_.Prepare;
      datm_pedido_instrucao.qry_processo_.Open;
    end
    else
    begin
      datm_pedido_instrucao.qry_pesquisa_.Close;
      edt_nm_produto.Text := '';
      BoxMensagem('Código do Produto inválido ou não habilidado!', 2);
      msk_cd_produto.SetFocus;
      Exit;
    end;
  end
  else
  begin
    Boxmensagem('O Produto deve ser informado!',2);
    msk_cd_produto.SetFocus;
  end;
end;

procedure Tfrm_pedido_instrucao.btn_liberarClick(Sender: TObject);
var
  APROVACAO : TQuery;
begin
  if (pgctrl_pedido_instrucao.ActivePage = ts_conso_aerea) or (pgctrl_pedido_instrucao.ActivePage = ts_conso_maritimo) then
  begin
    APROVACAO:=  TQuery.Create(Application);
    APROVACAO.DataBaseName:= 'DBBROKER';
    APROVACAO.Sql.Add('UPDATE TPROCESSO SET IN_PEDIDO = "1" ');
    APROVACAO.Sql.Add(' WHERE NR_PROCESSO IN (SELECT NR_PROCESSO FROM THOUSE WHERE CD_MASTER = "'+datm_pedido_instrucao.qry_consolidadas_CD_MASTER.AsString+'" )');
    APROVACAO.ExecSql;

    datm_pedido_instrucao.qry_consolidadas_.Close;
    datm_pedido_instrucao.qry_consolidadas_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid.text;
    datm_pedido_instrucao.qry_consolidadas_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.text;
    datm_pedido_instrucao.qry_consolidadas_.ParamByName('CD_VIA_TRANSP').AsString  := via_transp;
    datm_pedido_instrucao.qry_consolidadas_.Prepare;
    datm_pedido_instrucao.qry_consolidadas_.Open;
    BoxMensagem( 'Consolidada Aprovada! Tranfência para Pré - Alerta', 3);
  end;

  if (pgctrl_pedido_instrucao.ActivePage = ts_lista)  then
  begin
    try
      datm_pedido_instrucao.qry_conhecimento_.close;
      datm_pedido_instrucao.qry_conhecimento_.ParamByName('NR_PROCESSO').AsString:=datm_pedido_instrucao.qry_processo_NR_PROCESSO.AsString;
      datm_pedido_instrucao.qry_conhecimento_.Prepare;
      datm_pedido_instrucao.qry_conhecimento_.Open;

      if datm_pedido_instrucao.qry_conhecimento_.RecordCount = 0 then
      begin
        Boxmensagem('Não foi Gerado um Numero de Conhecimento para este Processo',2);
        Exit;
      end;
      if ( datm_pedido_instrucao.qry_processo_IN_PEDIDO.AsString = '0' ) then
      begin
        datm_pedido_instrucao.qry_processo_.Edit;

        datm_pedido_instrucao.qry_processo_IN_PEDIDO.AsString    := '1';

        datm_pedido_instrucao.qry_processo_.Post;

        datm_pedido_instrucao.qry_processo_.Close;
        datm_pedido_instrucao.qry_processo_.ParamByName('CD_UNID_NEG').AsString   :=msk_cd_unid.text;
        datm_pedido_instrucao.qry_processo_.ParamByName('CD_PRODUTO').AsString    :=msk_cd_produto.text;
        datm_pedido_instrucao.qry_processo_.ParamByName('CD_VIA_TRANSP').AsString :=via_transp;
        datm_pedido_instrucao.qry_processo_.ParamByName('IN_PEDIDO').AsString     :='0';
        datm_pedido_instrucao.qry_processo_.Prepare;
        datm_pedido_instrucao.qry_processo_.Open;

        BoxMensagem( 'Processo Direto Aprovado! Tranferido para Pré - Alerta', 3);
      end
    except
      on E:Exception do
      begin
        datm_pedido_instrucao.qry_processo_.Cancel;
        TrataErro(E);
      end;
    end;
  end;
end;

procedure Tfrm_pedido_instrucao.FormShow(Sender: TObject);
begin
  pnl_manut_proc.Color := clMenuBroker;
  shp2.Brush.Color := clPnlClaroBroker;
  if in_comerc then
  begin
    ts_conso_aerea.Tabvisible := false;
    ts_conso_maritimo.Tabvisible := false;
    btn_pre_alerta.Visible    := false;
    mi_pre_alerta.Visible     := false;
    btn_liberar_comerc.Visible:= true;
    mi_transp.Visible         := true;
    btn_liberar.Visible       := false;
    btn_liberar_comerc.left   := btn_liberar.left;
    btn_liberar.Visible       := false;
  end;
  if via_transp = '04' then
  begin
    ts_dados_basicos.TAbVisible   := true;
    ts_dados_maritimos.TAbVisible := false;
    ts_conso_aerea.Tabvisible     := TRUE;
    ts_conso_maritimo.Tabvisible  := false;
    dbgrid_maritimo.SendToBack;
    dbgrid_aereo.BringToFront;
  end;
  if via_transp = '01' then
  begin
    ts_dados_basicos.TAbVisible   := false;
    ts_dados_maritimos.TAbVisible := true;
    ts_conso_aerea.Tabvisible     := FALSE;
    ts_conso_maritimo.Tabvisible  := TRUE;
    dbgrid_maritimo.BringToFront;
    dbgrid_aereo.SendToBack;
    ts_conso_aerea.Tabvisible     := false;
  end;
  with datm_pedido_instrucao do
  begin
    qry_processo_.Close;
    if Pesquisa =  '' then
    begin
      qry_processo_.ParamByName('CD_UNID_NEG').AsString   := msk_cd_unid.Text;
      qry_processo_.ParamByName('CD_PRODUTO').AsString    := msk_cd_produto.text;
      qry_processo_.ParamByName('CD_VIA_TRANSP').AsString := via_transp;
      if in_comerc then
        qry_processo_.ParamByName('IN_PEDIDO').AsString   := '2'
      else qry_processo_.ParamByName('IN_PEDIDO').AsString := '0';
      qry_processo_.Prepare;
      qry_processo_.Open;
    end
    else
    begin
      qry_processo_.ParamByName('CD_UNID_NEG').AsString:=copy(pesquisa, 1,2);//msk_cd_unid.Text;
      qry_processo_.ParamByName('CD_PRODUTO').AsString:=copy(pesquisa, 3,2);//msk_cd_produto.text;
      qry_processo_.ParamByName('CD_VIA_TRANSP').AsString:=via_transp;
      if in_comerc then
        qry_processo_.ParamByName('IN_PEDIDO').AsString:='2'
      else qry_processo_.ParamByName('IN_PEDIDO').AsString:='0';
      qry_processo_.Prepare;
      qry_processo_.Open;
      qry_processo_.Locate('NR_PROCESSO',pesquisa,[loCaseInsensitive, loPartialKey] );
    end;
  end;
end;

procedure Tfrm_pedido_instrucao.btn_masterClick(Sender: TObject);
begin
  if via_transp = '04' then
    master_aerea;//criação para master aereos
  if via_transp = '01' then //criação para master maritimos
    master_maritimo;
end;

function Tfrm_pedido_instrucao.busca_conhec_master(cd_cia: string): string;
var
  cd_serie, nr_conhecimento : string;
begin
  with TQuery.Create(Application) do
  begin
    Databasename:='DBBROKER';
    Sql.Clear;
    Sql.Add(' SELECT  MIN(TS.CD_SERIE) FROM TCIA_SERIE TS ');
    Sql.Add(' WHERE (SELECT COUNT(TC.NR_CONHECIMENTO) ');
    Sql.Add('FROM TCIA_CONHECIMENTOS TC WHERE TC.CODIGO = TS.CODIGO AND');
    Sql.Add(' TC.CD_SERIE = TS.CD_SERIE AND TC.IN_DISPONIVEL ="1") > 0 AND CODIGO="'+cd_cia+'"');
    Open;
    if Fields[0].AsString = '' then
    begin
    //  BoxMensagem('Não existe Conhecimentos armazenados para esta Companhia',2);
      busca_conhec_master:='';
      Exit;
    end
    else
    begin
      cd_serie:=Fields[0].AsString;
      Close;
      Sql.Clear;
      Sql.Add('SELECT MIN(NR_CONHECIMENTO) FROM TCIA_CONHECIMENTOS');
      Sql.Add(' WHERE CD_SERIE = "'+cd_serie+'" AND CODIGO = "'+cd_cia+'" AND IN_DISPONIVEL = "1"');
      Open;
      nr_conhecimento:=Fields[0].AsString;
      if nr_conhecimento <> '' then
      begin
        Close;
        Sql.Clear;
        Sql.Add(' UPDATE TCIA_CONHECIMENTOS SET IN_DISPONIVEL = "0", CD_USUARIO_RETIRADA ="'+str_cd_usuario+'",');
        Sql.Add(' DT_RETIRADA = CONVERT(DATETIME,:DT_RETIRADA,103) WHERE CD_SERIE = "'+cd_serie+'" AND CODIGO = "'+cd_cia+'"');
        Sql.Add(' AND NR_CONHECIMENTO = "'+nr_conhecimento+'"');
        Params[0].AsString:=datetimetostr(dt_server);
        ExecSql;
        Free;
      end;
    end;
  end;
  busca_conhec_master:=nr_conhecimento;
end;

procedure Tfrm_pedido_instrucao.dbedt_nr_vooChange(Sender: TObject);
begin
  try
    if ( datm_pedido_instrucao.qry_processo_.State in [ dsInsert, dsEdit ] ) then
      Btn_Mi( False, st_modificar, st_modificar, False );

    if datm_pedido_instrucao.qry_conhecimento_.State in [dsEdit] then
      btn_mi(false,st_modificar,st_modificar,false);
  except
  end;    
end;

procedure Tfrm_pedido_instrucao.insere_master;
var
  nr_conhec_house, st_cd_master, PREFIXO, nr_conhecimento : string;
  fl_cd_master : real;
begin
  nr_conhecimento:='';
  if via_transp = '04' then
  begin
    prefixo := 'EAM';
    nr_conhecimento:=busca_conhec_master(datm_pedido_instrucao.qry_processo_CD_CIA_TRANSP.ASsTRING);
  end
  else
    prefixo := 'EMM';
  if (datm_pedido_instrucao.qry_processo_TP_PROCESSO.AsString = '0') and (via_transp = '04') then
    nr_conhec_house:= ' '//nr_conhecimento
  else nr_conhec_house:=busca_conhec_house(datm_pedido_instrucao.qry_processo_CD_UNID_NEG.ASsTRING);
  if (trim(nr_conhecimento) = '') and (via_transp = '04') then
  begin
    Boxmensagem('Não existe conhecimento para esta companhia! Operação cancelada.',2);
    exit;
  end;
  with TQuery.Create(Application) do
  begin
    DataBaseName:='DBBROKER';
    Sql.Clear;  //buscar numero de registro do master
    Sql.Add(' SELECT ISNULL(MAX(SUBSTRING(cd_master,8,4)), "0000") FROM TMASTER ');
    Sql.Add(' WHERE CD_UNID_NEG =  "'+msk_cd_unid.text+'"');
    Sql.Add('  AND CD_PRODUTO  =  "'+msk_cd_produto.text+'"');
    Sql.Add('  AND CD_VIA_TRANSP = "'+ via_transp+'"');
    Open;
    If Fields[0].AsString = '' then
      st_cd_master:=msk_cd_unid.text + msk_cd_produto.text + prefixo +'0001/'+ copy(DateToStr(dt_server),9,2)
    else
    begin
      fl_cd_master:= (strtofloat(Fields[0].AsString)) + 1;//(strtofloat(copy(Fields[0].AsString,2,6))) + 1;
      st_cd_master:= msk_cd_unid.text + msk_cd_produto.text + prefixo + formatfloat('0000',fl_cd_master)+'/'+copy(DateToStr(dt_server),9,2);
    end;

   {Open;
   if Fields[0].AsString = '' then
      st_cd_master:='M000001/'+ copy(DateToStr(Now),7,10)
   else
   begin
    fl_cd_master:= (strtofloat(copy(Fields[0].AsString,2,6))) + 1;
    st_cd_master:='M'+formatfloat('000000',fl_cd_master)+'/'+copy(DateToStr(Now),7,10);
   end;  }
    if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;
    Close;
    Sql.Clear;
    Sql.Add('INSERT INTO TMASTER(CD_MASTER,CD_UNID_NEG, CD_PRODUTO,  NR_MASTER, CD_VIA_TRANSP, TP_MASTER, ');
    Sql.Add('CD_AGENTE, CD_MOEDA, CD_CIA_TRANSP, CD_ORIGEM, CD_DESTINO, TP_FRETE_MASTER, CD_ARMADOR, TP_ESTUFAGEM)');
    Sql.Add(' VALUES (:CD_MASTER,:CD_UNID_NEG, :CD_PRODUTO,  :NR_MASTER, :CD_VIA_TRANSP, :TP_MASTER,');
    Sql.Add(':CD_AGENTE, :CD_MOEDA, :CD_CIA_TRANSP, :CD_ORIGEM, :CD_DESTINO, :TP_FRETE_MASTER, :CD_ARMADOR, :TP_ESTUFAGEM)');
    Params[0].AsString:= st_cd_master;
    Params[1].AsString:= datm_pedido_instrucao.qry_processo_CD_UNID_NEG.AsString;
    Params[2].AsString:= datm_pedido_instrucao.qry_processo_CD_PRODUTO.AsString;
    Params[3].AsString:= nr_conhecimento;
    Params[4].AsString:= via_transp;
    Params[5].AsString:= datm_pedido_instrucao.qry_processo_TP_PROCESSO.AsString;
    Params[6].AsString:= datm_pedido_instrucao.qry_processo_CD_AGENTE.AsString;
    Params[7].AsString:= datm_pedido_instrucao.qry_processo_CD_MOEDA_FRETE.AsString;
    Params[8].AsString:= datm_pedido_instrucao.qry_processo_CD_CIA_TRANSP.AsString;
    Params[9].AsString:= datm_pedido_instrucao.qry_processo_CD_ORIGEM.AsString;
    Params[10].AsString:=datm_pedido_instrucao.qry_processo_CD_DESTINO.AsString;
    Params[11].AsString:= '1';
    Params[12].AsString:=datm_pedido_instrucao.qry_processo_CD_ARMADOR.AsString;
    Params[13].AsString:=datm_pedido_instrucao.qry_processo_TP_ESTUFAGEM.AsString;
    ExecSql;

    Close;
    Sql.Clear;
    Sql.Add('INSERT INTO THOUSE (CD_MASTER, NR_MASTER, NR_HOUSE, CD_HOUSE, NR_PROCESSO)');
    Sql.Add('VALUES (:CD_MASTER, :NR_MASTER, :NR_HOUSE, :CD_HOUSE, :NR_PROCESSO)');
    Params[0].AsString:=st_cd_master;
    Params[1].AsString:=nr_conhecimento;
    Params[2].AsString:=nr_conhec_house;
    Params[3].AsString:=st_cd_master + '/' + formatfloat('00',1);
    Params[4].AsString:=datm_pedido_instrucao.qry_processo_NR_PROCESSO.AsString;
    ExecSql;
    Free;
  end;
  insere_tarifa_despesas(datm_pedido_instrucao.qry_processo_NR_PROCESSO.AsString,
                         datm_pedido_instrucao.qry_processo_TP_ESTUFAGEM.AsString,
                         datm_pedido_instrucao.qry_processo_CD_INCOTERM.AsString,
                         datm_pedido_instrucao.qry_processo_NR_PROPOSTA.AsString,
                         datm_pedido_instrucao.qry_processo_CD_PRODUTO.AsString,
                         datm_pedido_instrucao.qry_processo_CD_SERVICO.AsString,
                         datm_pedido_instrucao.qry_processo_CD_TAB_FRETE_VENDA.AsString);

  datm_main.db_broker.Commit;

  datm_pedido_instrucao.qry_conhecimento_.close;
  datm_pedido_instrucao.qry_conhecimento_.ParamByName('NR_PROCESSO').AsString:=datm_pedido_instrucao.qry_processo_NR_PROCESSO.AsString;
  datm_pedido_instrucao.qry_conhecimento_.Prepare;
  datm_pedido_instrucao.qry_conhecimento_.Open;
end;

function Tfrm_pedido_instrucao.busca_conhec_house(unid_neg: string): string;
var
  DAC, NR_CONHEC, digito : String;
   // nr_conhec:real;
begin
  with TQuery.Create(Application) do
  begin
    DataBaseName:='DBBROKER';
    Sql.Clear;
    Sql.Add('SELECT CD_DAC FROM TUNID_NEG WHERE CD_UNID_NEG="'+unid_neg+'"');
     Open;
    DAC:=Fields[0].AsString;
    if DAC = '' then
    begin
      busca_conhec_house:='';
  //    Boxmensagem('Não existe um Numero de DAC para esta Unidade. Não será possível Originar um Conhecimento!',2);
      Exit;
    end;

    Close;
    Sql.Clear;
    Sql.Add('SELECT MAX(NR_CONHEC_HOUSE) FROM THOUSE_CONHECIMENTOS WHERE DAC = "'+DAC+'"');
    Open;

    NR_CONHEC:= proximo_conhecimento(Fields[0].AsString);
    digito   := digitto_iata(NR_CONHEC);

    Close;
    Sql.Clear;
    Sql.Add('INSERT INTO THOUSE_CONHECIMENTOS (NR_CONHEC_HOUSE, DIG_FINAL, CD_USUARIO, DT_RETIRADA, DAC)');
    Sql.Add('VALUES (:NR_CONHEC_HOUSE, :DIG_FINAL, :CD_USUARIO, :DT_RETIRADA, :DAC)');
    Params[0].AsString  := NR_CONHEC;
    Params[1].AsString  := digito;
    Params[2].AsString  := str_cd_usuario;
    Params[3].AsDatetime:= dt_server;
    Params[4].AsString  := DAC;
    ExecSql;
    busca_conhec_house:= NR_CONHEC + digito;
    Free;
  end;
end;

function Tfrm_pedido_instrucao.proximo_conhecimento(conhecimento: String): String;
var
  digito:string;
  numero:real;
begin
  digito:= copy(conhecimento,11,2);
  numero:=strtofloat(digito) + 1;
  if (numero > 99)  then
  begin
    proximo_conhecimento:= copy(conhecimento,1,4)+ '-'+  formatfloat('0000',(strtofloat(copy(conhecimento,6,4))+1)) +'-00';
    exit;
  end;
  proximo_conhecimento:= copy(conhecimento,1,9) + '-'+formatfloat('00',numero)
end;

function Tfrm_pedido_instrucao.digitto_iata(Conhecimento: string): String;
var
  digitos : string;
  numero : real;
  i : integer;
begin
  numero:=strtofloat(copy(conhecimento,4,1) + copy(conhecimento,6,4) + copy(conhecimento,11,2));
  digitos:=formatfloat('0.00000000000000000000',(numero / 7 ));
  i:=0;
  while digitos[i] <> ',' do
    i:=i+1;
  digitos:='0,' + copy(digitos, i + 1 ,20);
  digitto_iata:=floatToStr(Round(strtofloat(digitos) * 7));
end;

procedure Tfrm_pedido_instrucao.insere_tarifa_despesas(nr_processo, tp_estufagem,cd_incoterm, nr_prop_cot, cd_prod, cd_serv, cd_tab: string);
var
  i, qtde_processo:integer; j, Chargeable, other_charge : real;
  insert, in_taxa_pais, in_taxa_ext : string[1]; //verifica se as taxa são collect ouprepaid conforme incoterm
  DESPESA : TQuery;
  vl_prepaid, vl_collect, vl_pais, vl_exterior : real;
begin
  insert:='1';
  DESPESA:=TQuery.Create(Application);
  DESPESA.DataBaseName:='DBBROKER';
  DESPESA.Sql.Clear;
  DESPESA.Sql.Add(' SELECT CD_ITEM, TP_BASE_CALCULO, CD_MOEDA,  TP_ORIGEM_DESPESA, ');
  DESPESA.Sql.Add(' VL_BASE_DESPESA, VL_BASE_AG, VL_COMPRA_CIA, VL_VENDA, ');
  DESPESA.Sql.Add(' IN_DESPESA, IN_MENCIONADO,CD_TAB_REF, TP_FRETE, TP_ESTUFAGEM, ');
  DESPESA.Sql.Add('  VL_INTERVALO_INICIAL, VL_INTERVALO_FINAL, IN_PROFIT');
  DESPESA.Sql.Add(' FROM TPROPOSTA_FRETE_DESPESA  ');
  DESPESA.Sql.Add('WHERE CD_TAB_FRETE= "'+cd_tab+'" AND ');
  DESPESA.Sql.Add('NR_PROPOSTA= "'+nr_prop_cot+'" AND TP_ESTUFAGEM="'+tp_estufagem+'"');
  DESPESA.Sql.Add(' AND CD_SERVICO= "'+cd_serv+'" ');
  DESPESA.Sql.Add(' AND CD_PRODUTO ="'+cd_prod+'" ');
  DESPESA.Prepare;
  DESPESA.Open;
  j:=0;
  while not(DESPESA.EOF)do
  begin
    insert:='1';
    if DESPESA.Fields[1].AsString = '08' then
    begin
      with TQuery.Create(Application) do
      begin
        DAtabasename:='DBBROKER';
        Sql.Clear;
        Sql.Add('SELECT CHARGEABLE FROM TPROCESSO WHERE NR_PROCESSO = "'+nr_processo+'"');
        Open;
        Chargeable:=Fields[0].Asfloat;
        Free;
      end;
      if ((DESPESA.Fields[13].AsFloat < Chargeable) and ( Chargeable < DESPESA.Fields[14].AsFloat))then
        insert:='1'
      else insert:='0';
    end;
    if insert='1'then
    begin
      with TQuery.Create(Application) do
      begin
        j:=j+1;
        Databasename:='DBBROKER';
        Sql.Clear;
        Sql.Add(' INSERT INTO TPROCESSO_DESPESAS(NR_PROCESSO, CD_ITEM, TP_BASE_CALCULO, CD_MOEDA,TP_ORIGEM_DESPESA, ');
        Sql.Add('VL_BASE_DESPESA, VL_COMPRA_AG, VL_COMPRA_CIA,');
        Sql.Add(' VL_VENDA, IN_DESPESA, IN_MENCIONADO, CD_TAB_REF, TP_FRETE, TP_ESTUFAGEM, CD_DESP, IN_REPASSA, ');
        Sql.Add('VL_INTERVALO_INICIAL, VL_INTERVALO_FINAL, VL_BASE_AG, VL_BASE_CLI, IN_PROFIT, TP_DUE, CD_FRETE,CD_MOEDA_VENDA) ');
        Sql.Add(' VALUES(:NR_PROCESSO, :CD_ITEM, :TP_BASE_CALCULO, :CD_MOEDA, :TP_ORIGEM_DESPESA,:VL_BASE_DESPESA, ');
        Sql.Add(':VL_COMPRA_AG, :VL_COMPRA_CIA,  :VL_VENDA, :IN_DESPESA,');
        Sql.Add(' :IN_MENCIONADO, :CD_TAB_REF, :TP_FRETE, :TP_ESTUFAGEM,:CD_DESP, :IN_REPASSA, :VL_INTERVALO_INICIAL, ');
        Sql.Add(' :VL_INTERVALO_FINAL, :VL_BASE_AG, :VL_BASE_CLI,:IN_PROFIT, :TP_DUE, :CD_FRETE, :CD_MOEDA_VENDA) ');
        Params[0].AsString:=nr_processo;
        Params[1].AsString:=DESPESA.Fields[0].AsString;
        Params[2].AsString:=DESPESA.Fields[1].AsString;
        Params[3].AsString:=DESPESA.Fields[2].AsString;
        Params[4].AsString:=DESPESA.Fields[3].AsString;
        Params[5].AsFloat :=DESPESA.Fields[4].AsFloat;
        Params[6].AsFloat :=calc_tp_base(DESPESA.Fields[1].AsString,nr_processo, DESPESA.Fields[5].AsFloat, true);
        Params[7].AsFloat :=calc_tp_base(DESPESA.Fields[1].AsString,nr_processo, DESPESA.Fields[6].AsFloat, true);
        if DESPESA.Fields[1].AsString = '09' then //despesa com base no valor da mercadoria
        Params[8].AsFloat := 0          //despesa com base no intervalo de peso de mercadoria
        else if DESPESA.Fields[1].AsString = '08' then Params[8].AsFloat :=DESPESA.Fields[7].AsFloat
                 //demais despesas
        else Params[8].AsFloat := calc_tp_base(DESPESA.Fields[1].AsString, nr_processo,  DESPESA.Fields[7].AsFloat, true);
        Params[9].AsString:=DESPESA.Fields[8].AsString;
        Params[10].AsString:=DESPESA.Fields[9].AsString;
        Params[11].AsString:=DESPESA.Fields[10].AsString;
        Params[12].AsString:=DESPESA.Fields[11].AsString;
        Params[13].AsString:=DESPESA.Fields[12].AsString;
        Params[14].AsString:=FormatFloat('0000',j);
        Params[15].AsString:='6';//valor que é repassado para o cliente
        Params[16].Asfloat:=DESPESA.Fields[13].AsFloat;
        Params[17].AsFloat:=DESPESA.Fields[14].AsFloat;
        Params[18].AsFloat:=DESPESA.Fields[5].AsFloat;
        Params[19].AsFloat:=DESPESA.Fields[7].AsFloat;
        Params[20].AsString:=DESPESA.Fields[15].AsString;
        Params[21].AsString:='A';
        Params[22].AsString:=sel_tp_frete(cd_incoterm, DESPESA.Fields[3].AsString);
        Params[23].AsString:= DESPESA.Fields[2].AsString;
        ExecSql;
        Free;
      end;
    end;
    DESPESA.Next;
  end;
  DESPESA.CLOSE; //busca o total de ohter charge do processo
  if (cd_incoterm = 'FOB') or (cd_incoterm = 'CIF') or (cd_incoterm = 'CFR') or (cd_incoterm = 'FCA') or
     (cd_incoterm = 'FAS') or (cd_incoterm = 'DES') or (cd_incoterm = 'DAF') or (cd_incoterm = 'DEQ')then
  begin
    in_taxa_pais:='1';//prepaid
    in_taxa_ext := '0';//collect
    DESPESA.Sql.Clear;
    DESPESA.Sql.Add('SELECT SUM (VL_VENDA), SUM(VL_COMPRA_AG) FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO = "'+nr_processo+'"');
    DESPESA.Sql.Add(' AND   IN_MENCIONADO="1" AND IN_PROFIT = "1" ');
    DESPESA.Sql.Add(' AND  TP_ORIGEM_DESPESA = "8"  ');
    DESPESA.Open;

    vl_prepaid := DESPESA.Fields[0].AsFloat;
    //vl_pais := DESPESA.Fields[1].AsFloat;

    DESPESA.Sql.Clear;
    DESPESA.Sql.Add('SELECT SUM (VL_VENDA), SUM(VL_COMPRA_AG) FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO = "'+nr_processo+'"');
    DESPESA.Sql.Add(' AND   IN_MENCIONADO="1" AND IN_PROFIT = "1" ');
    DESPESA.Sql.Add(' AND  TP_ORIGEM_DESPESA = "7"  ');
    DESPESA.Open;

    vl_collect  := DESPESA.Fields[0].AsFloat;
    //vl_exterior := DESPESA.Fields[1].AsFloat;
  end;
  if (cd_incoterm = 'EXW') then
  begin
    in_taxa_pais:='0';//collect
    in_taxa_ext := '0';//collect
    DESPESA.Sql.Clear;
    DESPESA.Sql.Add('SELECT SUM(VL_VENDA)FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO = "'+nr_processo+'"');
    DESPESA.Sql.Add(' AND   IN_MENCIONADO="1" AND IN_PROFIT = "1" ');
    DESPESA.Open;
    vl_collect:= DESPESA.Fields[0].AsFloat;

    {DESPESA.Sql.Clear;
    DESPESA.Sql.Add('SELECT  SUM(VL_COMPRA_AG) FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO = "'+nr_processo+'"');
    DESPESA.Sql.Add(' AND   IN_MENCIONADO="1" AND IN_PROFIT = "1" ');
    DESPESA.Sql.Add(' AND  TP_ORIGEM_DESPESA = "7"  ');
    DESPESA.Open;

    vl_pais  := DESPESA.Fields[0].AsFloat;

    DESPESA.Sql.Clear;
    DESPESA.Sql.Add('SELECT  SUM(VL_COMPRA_AG) FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO = "'+nr_processo+'"');
    DESPESA.Sql.Add(' AND   IN_MENCIONADO="1" AND IN_PROFIT = "1" ');
    DESPESA.Sql.Add(' AND  TP_ORIGEM_DESPESA = "8"  ');
    DESPESA.Open;

    vl_exterior := DESPESA.Fields[0].AsFloat;
    }
  end;
  if (cd_incoterm = 'DDU') or (cd_incoterm = 'DDP')then
  begin
    in_taxa_pais:='1';//prepaid
    in_taxa_ext := '1';//prepaid
    DESPESA.Sql.Clear;
    DESPESA.Sql.Add('SELECT SUM(VL_VENDA)FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO = "'+nr_processo+'"');
    DESPESA.Sql.Add(' AND   IN_MENCIONADO="1" AND IN_PROFIT = "1" ');
    DESPESA.Open;
    vl_prepaid:= DESPESA.Fields[0].AsFloat;

{    DESPESA.Sql.Clear;
    DESPESA.Sql.Add('SELECT  SUM(VL_COMPRA_AG) FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO = "'+nr_processo+'"');
    DESPESA.Sql.Add(' AND   IN_MENCIONADO="1" AND IN_PROFIT = "1" ');
    DESPESA.Sql.Add(' AND  TP_ORIGEM_DESPESA = "7"  ');
    DESPESA.Open;

    vl_pais  := DESPESA.Fields[0].AsFloat;

    DESPESA.Sql.Clear;
    DESPESA.Sql.Add('SELECT  SUM(VL_COMPRA_AG) FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO = "'+nr_processo+'"');
    DESPESA.Sql.Add(' AND   IN_MENCIONADO="1" AND IN_PROFIT = "1" ');
    DESPESA.Sql.Add(' AND  TP_ORIGEM_DESPESA = "8"  ');
    DESPESA.Open;

    vl_exterior := DESPESA.Fields[0].AsFloat;
    }
  end;

  if (cd_incoterm = 'CPT') or (cd_incoterm = 'CIP') then
  begin
    DESPESA.Sql.Clear;
    DESPESA.Sql.Add('SELECT SUM (VL_VENDA), SUM(VL_COMPRA_AG) FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO = "'+nr_processo+'"');
    DESPESA.Sql.Add(' AND   IN_MENCIONADO="1" AND IN_PROFIT = "1" ');
    DESPESA.Sql.Add(' AND  TP_ORIGEM_DESPESA = "8" AND CD_FRETE = "0" ');
    DESPESA.Open;
    vl_prepaid := DESPESA.Fields[0].AsFloat;
    // vl_pais := DESPESA.Fields[1].AsFloat;
    DESPESA.Sql.Clear;
    DESPESA.Sql.Add('SELECT SUM (VL_VENDA), SUM(VL_COMPRA_AG) FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO = "'+nr_processo+'"');
    DESPESA.Sql.Add(' AND   IN_MENCIONADO="1" AND IN_PROFIT = "1" ');
    DESPESA.Sql.Add(' AND  TP_ORIGEM_DESPESA = "7" AND CD_FRETE = "1" ');
    DESPESA.Open;
    vl_collect := DESPESA.Fields[0].AsFloat;
    // vl_exterior := DESPESA.Fields[1].AsFloat;
  end;

 { DESPESA.Sql.Add('SELECT SUM (VL_VENDA)FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO = "'+nr_processo+'"');
  DESPESA.Sql.Add(' AND   IN_MENCIONADO="1" AND IN_DESPESA = "4" AND IN_PROFIT = "1" ');
  DESPESA.Sql.Add(' AND
  DESPESA.Open;
  other_charge:=DESPESA.Fields[0].AsFloat;}
  DESPESA.Close;
  DESPESA.Sql.Clear;
  DESPESA.Sql.Add('UPDATE TPROCESSO SET VL_OTHER_CHARGE=:VL_OTHER_CHARGE, VL_HOUSE=:VL_HOUSE + VL_FRETE, ');
  DESPESA.Sql.Add('VL_OTHER_CHARGE_CC=:VL_OTHER_CHARGE_CC WHERE NR_PROCESSO = :NR_PROCESSO');
  DESPESA.Params[0].AsFloat :=vl_prepaid;
  DESPESA.Params[1].AsFloat :=vl_prepaid + vl_collect;
  DESPESA.Params[2].AsFloat :=vl_collect;
  DESPESA.Params[3].AsString:=nr_processo;
  DESPESA.ExecSql;
  DESPESA.Free;
end;

function Tfrm_pedido_instrucao.calc_tp_base(tp_base, nr_processo: string; vl_base: real; time: Boolean): real;
var
  valor, chargeable, vl_frete, vl_house, cubagem,peso, qtde : real;
  tp_estufagem : string;
begin
  calc_tp_base:=0;
  with TQuery.Create(Application) do
  begin
    DataBaseName:='DBBROKER';
    Sql.Clear;
    Sql.Add(' SELECT VL_FRETE, VL_HOUSE, CHARGEABLE, CUBAGEM, VL_PESO_BRUTO, QTD_VOLUME, TP_ESTUFAGEM FROM TPROCESSO WHERE NR_PROCESSO="'+nr_processo+'"');
    Open;
    chargeable:= Fields[2].AsFloat;
    vl_frete  := Fields[0].AsFloat;
    vl_house  := Fields[1].AsFloat;
    cubagem   := Fields[3].AsFloat;
    peso      := Fields[4].AsFloat;
    qtde      := Fields[5].AsFloat;
    tp_estufagem:= Fields[6].AsString;
    Free;
  end;
  if tp_base = '01' then
  begin
    valor:=(vl_frete * vl_base)/100;
    calc_tp_base:=valor;
  end;
  if tp_base = '02' then
  begin
    valor:=(vl_house * vl_base)/100;
    calc_tp_base:=valor;
  end;
  if tp_base = '03' then
  begin
    valor := vl_base;
    calc_tp_base:=valor;
  end;
  if tp_base = '04' then
  begin
    // valor :=(datm_pedido_instrucao.qry_master_CHARG_MASTER.AsFloat * vl_base);
    calc_tp_base:=valor;
  end;
  if tp_base = '05' then
  begin
    valor :=(chargeable * vl_base);
    calc_tp_base:=valor;
  end;
  if tp_base = '06' then
  begin
    valor:=(cubagem * vl_base);
    calc_tp_base:=valor;
  end;
  if tp_base = '07' then
  begin
    valor:=(peso)/1000 * vl_base;
    calc_tp_base:=valor;
  end;
  if (tp_base = '10') and (tp_estufagem = '1')then   // POR CNTR
  begin
    valor:= qtde * vl_base;
    calc_tp_base:=valor;
  end;
  if (tp_base = '11')and (tp_estufagem = '1') then   // POR CNTR 20
  begin
    With Tquery.Create(Application) do
    begin
      DataBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT ISNULL(COUNT(TP.NR_PROCESSO),0) FROM TPROCESSO_CNTR TP ');
      Sql.Add(' WHERE TP.NR_PROCESSO = "'+nr_processo+'"');
      Sql.Add('AND TP.TP_CNTR IN(SELECT TC.TP_CNTR FROM TTP_CNTR TC WHERE TC.TP_PESO = "1")');
      Open;
      calc_tp_base := vl_base * Fields[0].AsFloat;
      Free;
    end;
  end;
  if (tp_base = '12')and (tp_estufagem = '1') then   //POR CNTR 40
  begin
    with Tquery.Create(Application) do
    begin
      DataBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT ISNULL(COUNT(TP.NR_PROCESSO),0) FROM TPROCESSO_CNTR TP ');
      Sql.Add(' WHERE TP.NR_PROCESSO = "'+nr_processo+'"');
      Sql.Add('AND TP.TP_CNTR IN(SELECT TC.TP_CNTR FROM TTP_CNTR TC WHERE TC.TP_PESO = "2")');
      Open;
      calc_tp_base := vl_base * Fields[0].AsFloat;
      Free;
    end;
  end;
  if (tp_base = '14') then
  begin
    calc_tp_base := vl_base * Max(peso,cubagem);
  end;
  if tp_base = '16' then
  begin
    valor:=(peso) * vl_base;
    calc_tp_base:=valor;
  end;
end;

procedure Tfrm_pedido_instrucao.rxcombo_tp_estufagemChange(Sender: TObject);
begin
  if not(datm_pedido_instrucao.qry_processo_.State in [dsEdit,dsInsert]) then exit;
  if (rxcombo_tp_estufagem.ItemIndex = 0 ) or (rxcombo_tp_estufagem.ItemIndex = 2) then
  begin
    //pnl_fcl.Visible:=false;
    //pnl_lcl.Visible:=True;
    nbEstufagem.ActivePage := 'LCL';
    lb_retirada.Visible:=false;
    dbedt_cd_atracacao.Visible:=false;
    dbedt_nm_atracacao.Visible:=false;
    btn_co_arm_retirada.Visible:=false;
     //   datm_Instrucao_Embarque.qry_instrucao_lcl_.close;
    datm_pedido_instrucao.qry_processo_carga_.Close;
    datm_pedido_instrucao.qry_processo_carga_.ParamByName('NR_PROCESSO').AsString := datm_pedido_instrucao.qry_processo_NR_PROCESSO.AsString;
    datm_pedido_instrucao.qry_processo_carga_.Prepare;
    datm_pedido_instrucao.qry_processo_carga_.Open;
  end
  else
  begin
    //    datm_Instrucao_Embarque.qry_instrucao_fcl_.close;
    //pnl_fcl.Visible:=true;
    //pnl_lcl.Visible:=False;
    nbEstufagem.ActivePage := 'FCL';
    lb_retirada.Visible:=true;
    dbedt_cd_atracacao.Visible:=true;
    dbedt_nm_atracacao.Visible:=true;
    btn_co_arm_retirada.Visible:=true;
    datm_pedido_instrucao.qry_proc_cntr_.Close;
    datm_pedido_instrucao.qry_proc_cntr_.ParamByName('NR_PROCESSO').AsString := datm_pedido_instrucao.qry_processo_NR_PROCESSO.AsString;
    datm_pedido_instrucao.qry_proc_cntr_.Prepare;
    datm_pedido_instrucao.qry_proc_cntr_.Open;
  end;
  btn_mi(false, st_modificar, st_modificar, false);
end;

procedure Tfrm_pedido_instrucao.master_aerea;
var
  nr_processo : String[20];
begin
  with datm_pedido_instrucao do
  begin
    if qry_processo_TP_PROCESSO.AsString = '0' then //direto
    begin
      if dbedt_nr_master_direto.text = '' then
      begin
        if qry_processo_CHARGEABLE.AsFloat =0 then
        begin
          BoxMensagem('Deve ser inserido as dimensões da carga!',2);
          exit;
        end;
        insere_master;
        dbedt_nr_voo.Color:=clWindow;
        dbedt_nr_voo.ReadOnly:=false;
        dbedt_dt_voo.Color:=clWindow;
        dbedt_dt_voo.ReadOnly:=false;
      end
      else
        BOxmensagem('Já existe um master para este Processo!',2);
      Exit;
    end;
    if (qry_processo_TP_PROCESSO.AsString = '2') or (qry_processo_TP_PROCESSO.AsString = '1') then //consolidado
    begin
      if dbedt_nr_house.text <> '' then
      begin
        BOxmensagem('Já existe um master para este Processo Consolidado!',2) ;
        Exit;
      end;
      if qry_processo_CHARGEABLE.AsFloat = 0 then
      begin
        BoxMensagem('Deve ser inserido as dimensões da carga!',2);
        exit;
      end;
      Application.CreateForm(Tfrm_gerar_consolidada, frm_gerar_consolidada);
      if datm_pedido_instrucao.qry_processo_CD_VIA_TRANSPORTE.AsString = '04' then
      begin
        frm_gerar_consolidada.cd_via_transp:= '04';
        frm_gerar_consolidada.msk_cd_unid_aerea.text   := datm_pedido_instrucao.qry_processo_CD_UNID_NEG.AsString;
        frm_gerar_consolidada.msk_cd_prod_aerea.text   := datm_pedido_instrucao.qry_processo_CD_PRODUTO.AsString;
        frm_gerar_consolidada.msk_cd_agente_aerea.text := datm_pedido_instrucao.qry_processo_CD_AGENTE.AsString;
        frm_gerar_consolidada.msk_cd_cia_aerea.text    := datm_pedido_instrucao.qry_processo_CD_CIA_TRANSP.AsString;
        frm_gerar_consolidada.msk_cd_orig_aerea.text   := datm_pedido_instrucao.qry_processo_CD_ORIGEM.AsString;
        frm_gerar_consolidada.msk_cd_dest_aerea.text   := datm_pedido_instrucao.qry_processo_CD_DESTINO.AsString;
        frm_gerar_consolidada.msk_cd_moeda_aerea.text  := datm_pedido_instrucao.qry_processo_CD_MOEDA_FRETE.AsString;
        frm_gerar_consolidada.edt_nm_unid_aerea.text   := frm_pedido_instrucao.edt_nm_unid.text;
        frm_gerar_consolidada.edt_nm_prod_aerea.text   := frm_pedido_instrucao.edt_nm_produto.text;
        frm_gerar_consolidada.edt_nm_agente_aerea.text := datm_pedido_instrucao.qry_processo_NM_AGENTE.AsString;
        frm_gerar_consolidada.edt_nm_cia_aerea.text    := datm_pedido_instrucao.qry_processo_NM_CIA.AsString;
        frm_gerar_consolidada.edt_nm_orig_aerea.text   := datm_pedido_instrucao.qry_processo_NM_ORIGEM.AsString;
        frm_gerar_consolidada.edt_nm_dest_aerea.text   := datm_pedido_instrucao.qry_processo_NM_DESTINO.AsString;
        frm_gerar_consolidada.edt_nm_moeda_aerea.text  := datm_pedido_instrucao.qry_processo_NM_MOEDA.AsString;
      end;

      frm_gerar_consolidada.ShowModal;

      nr_processo:=datm_pedido_instrucao.qry_processo_NR_PROCESSO.AsString;
      datm_pedido_instrucao.qry_processo_.Close;
      datm_pedido_instrucao.qry_processo_.ParamByName('CD_UNID_NEG').AsString   := msk_cd_unid.Text;
      datm_pedido_instrucao.qry_processo_.ParamByName('CD_PRODUTO').AsString    := msk_cd_produto.text;
      datm_pedido_instrucao.qry_processo_.ParamByName('CD_VIA_TRANSP').AsString := via_transp;

      if in_comerc then
          datm_pedido_instrucao.qry_processo_.ParamByName('IN_PEDIDO').AsString  := '2'
      else datm_pedido_instrucao.qry_processo_.ParamByName('IN_PEDIDO').AsString := '0';

      datm_pedido_instrucao.qry_processo_.Prepare;
      datm_pedido_instrucao.qry_processo_.Open;
      datm_pedido_instrucao.qry_processo_.locate('NR_PROCESSO', nr_processo, [loCaseInsensitive, loPartialKey]);

      datm_pedido_instrucao.qry_conhecimento_.close;
      datm_pedido_instrucao.qry_conhecimento_.ParamByName('NR_PROCESSO').AsString:=nr_processo;
      datm_pedido_instrucao.qry_conhecimento_.Prepare;
      datm_pedido_instrucao.qry_conhecimento_.Open;
      if datm_pedido_instrucao.qry_conhecimento_.Recordcount = 0 then
      begin
        dbedt_nr_voo.Color   := clMenu;
        dbedt_nr_voo.ReadOnly := true;
        dbedt_dt_voo.Color    := clmenu;
        dbedt_dt_voo.ReadOnly := true;
      end
      else
      begin
        dbedt_nr_voo.Color   := clWindow;
        dbedt_nr_voo.ReadOnly := false;
        dbedt_dt_voo.Color    := clWindow;
        dbedt_dt_voo.ReadOnly := false;
      end;
    end;
  end;
end;

procedure Tfrm_pedido_instrucao.master_maritimo;
var
  nr_processo : String[20];
begin
  with datm_pedido_instrucao do
  begin
    if qry_processo_TP_PROCESSO.AsString = '0' then //direto
    begin
      if qry_conhecimento_CD_MASTER.AsString = '' then
      begin
        if qry_processo_CHARGEABLE.AsFloat = 0 then
        begin
          BoxMensagem('Deve ser inserido as dimensões da carga!',2);
          exit;
        end;
        insere_master;

        dbedt_nr_book_direto.SetFocus;
        dbedt_nr_book_direto.Color    := clWindow;
        dbedt_nr_book_direto.ReadOnly := false;

        dbedt_nr_viagem.Color         := clWindow;
        dbedt_nr_viagem.ReadOnly      := false;
        dbedt_dt_viagem.Color         := clWindow;
        dbedt_dt_viagem.ReadOnly      := false;

        dbedt_cd_veiculo.Color        := clWindow;
        dbedt_cd_veiculo.ReadOnly     := false;
        btn_co_navio.Enabled          := true;

        dbedt_cd_descarga.Color       := clWindow;
        dbedt_cd_descarga.ReadOnly    := false;
        dbedt_cd_atracacao.Color      := clWindow;
        dbedt_cd_atracacao.ReadOnly   := false;
        btn_co_descarga.Enabled       := true;
        dbedt_dead_line.Color         := clWindow;
        dbedt_dead_line.ReadOnly      := false;
        btn_co_arm_retirada.Enabled   := true;

        dbedt_cd_notificador.Color    := clWindow;
        dbedt_cd_notificador.ReadOnly := false;
        btn_co_notificador.Enabled    := true;
      end
      else
        BOxmensagem('Já existe um master para este Processo!',2);
      Exit;
    end;
    if (qry_processo_TP_PROCESSO.AsString = '2') or(qry_processo_TP_PROCESSO.AsString = '1') then //consolidado
    begin
      if qry_processo_CHARGEABLE.AsFloat = 0 then
      begin
        BoxMensagem('Deve ser inserido as dimensões da carga!',2);
        exit;
      end;
      if dbedt_nr_house.text <> '' then
      begin
        BOxmensagem('Já existe um master para este Processo Consolidado!',2) ;
        Exit;
      end;
      Application.CreateForm(Tfrm_gerar_consolidada, frm_gerar_consolidada);
      if datm_pedido_instrucao.qry_processo_CD_VIA_TRANSPORTE.AsString = '01'then
      begin
        frm_gerar_consolidada.cd_via_transp:= '01';
        frm_gerar_consolidada.msk_cd_unid_aerea.text   := datm_pedido_instrucao.qry_processo_CD_UNID_NEG.AsString;
        frm_gerar_consolidada.msk_cd_prod_aerea.text   := datm_pedido_instrucao.qry_processo_CD_PRODUTO.AsString;
        frm_gerar_consolidada.msk_cd_agente_aerea.text := datm_pedido_instrucao.qry_processo_CD_AGENTE.AsString;
        frm_gerar_consolidada.msk_cd_cia_aerea.text    := datm_pedido_instrucao.qry_processo_CD_ARMADOR.AsString;
        frm_gerar_consolidada.msk_cd_orig_aerea.text   := datm_pedido_instrucao.qry_processo_CD_ORIGEM.AsString;
        frm_gerar_consolidada.msk_cd_dest_aerea.text   := datm_pedido_instrucao.qry_processo_CD_DESTINO.AsString;
        frm_gerar_consolidada.msk_cd_moeda_aerea.text  := datm_pedido_instrucao.qry_processo_CD_MOEDA_FRETE.AsString;
        frm_gerar_consolidada.edt_nm_unid_aerea.text   := frm_pedido_instrucao.edt_nm_unid.text;
        frm_gerar_consolidada.edt_nm_prod_aerea.text   := frm_pedido_instrucao.edt_nm_produto.text;
        frm_gerar_consolidada.edt_nm_agente_aerea.text := datm_pedido_instrucao.qry_processo_NM_AGENTE.AsString;
        frm_gerar_consolidada.edt_nm_cia_aerea.text    := datm_pedido_instrucao.qry_processo_NM_ARMADOR.AsString;
        frm_gerar_consolidada.edt_nm_orig_aerea.text   := datm_pedido_instrucao.qry_processo_NM_ORIGEM.AsString;
        frm_gerar_consolidada.edt_nm_dest_aerea.text   := datm_pedido_instrucao.qry_processo_NM_DESTINO.AsString;
        frm_gerar_consolidada.edt_nm_moeda_aerea.text  := datm_pedido_instrucao.qry_processo_NM_MOEDA.AsString;
      end;
      frm_gerar_consolidada.ShowModal;
      nr_processo:=datm_pedido_instrucao.qry_processo_NR_PROCESSO.AsString;
      datm_pedido_instrucao.qry_processo_.Close;
      datm_pedido_instrucao.qry_processo_.ParamByName('CD_UNID_NEG').AsString   := msk_cd_unid.Text;
      datm_pedido_instrucao.qry_processo_.ParamByName('CD_PRODUTO').AsString    := msk_cd_produto.text;
      datm_pedido_instrucao.qry_processo_.ParamByName('CD_VIA_TRANSP').AsString := via_transp;
      if in_comerc then
        datm_pedido_instrucao.qry_processo_.ParamByName('IN_PEDIDO').AsString:='2'
      else datm_pedido_instrucao.qry_processo_.ParamByName('IN_PEDIDO').AsString:='0';
      datm_pedido_instrucao.qry_processo_.Prepare;
      datm_pedido_instrucao.qry_processo_.Open;
      datm_pedido_instrucao.qry_processo_.locate('NR_PROCESSO', nr_processo, [loCaseInsensitive, loPartialKey]);
      datm_pedido_instrucao.qry_conhecimento_.close;
      datm_pedido_instrucao.qry_conhecimento_.ParamByName('NR_PROCESSO').AsString:=datm_pedido_instrucao.qry_processo_NR_PROCESSO.AsString;
      datm_pedido_instrucao.qry_conhecimento_.Prepare;
      datm_pedido_instrucao.qry_conhecimento_.Open;
      if datm_pedido_instrucao.qry_conhecimento_.Recordcount = 0 then
      begin
        dbedt_nr_viagem.Color         := clMenu;
        dbedt_nr_viagem.ReadOnly      := true;
        dbedt_dt_viagem.Color         := clMenu;
        dbedt_dt_viagem.ReadOnly      := true;
        dbedt_cd_veiculo.Color        := clMenu;
        dbedt_cd_veiculo.ReadOnly     := true;
        btn_co_navio.Enabled          := false;
        dbedt_cd_descarga.Color       := clMenu;
        dbedt_cd_descarga.ReadOnly    := true;
        dbedt_cd_atracacao.Color      := clMenu;
        dbedt_cd_atracacao.ReadOnly   := true;
        btn_co_descarga.Enabled       := false;
        dbedt_dead_line.Color         := clMenu;
        dbedt_dead_line.ReadOnly      := true;
        btn_co_arm_retirada.Enabled   := false;
        dbedt_cd_notificador.Color    := clmenu;
        dbedt_cd_notificador.ReadOnly := true;
        btn_co_notificador.Enabled    := false;
      end
      else
      begin
        dbedt_nr_viagem.Color         := clWindow;
        dbedt_nr_viagem.ReadOnly      := false;
        dbedt_dt_viagem.Color         := clWindow;
        dbedt_dt_viagem.ReadOnly      := false;
        dbedt_cd_veiculo.Color        := clWindow;
        dbedt_cd_veiculo.ReadOnly     := false;
        btn_co_navio.Enabled          := true;
        dbedt_cd_descarga.Color       := clWindow;
        dbedt_cd_descarga.ReadOnly    := false;
        dbedt_cd_atracacao.Color      := clWindow;
        dbedt_cd_atracacao.ReadOnly   := false;
        btn_co_descarga.Enabled       := true;
        dbedt_dead_line.Color         := clWindow;
        dbedt_dead_line.ReadOnly      := false;
        btn_co_arm_retirada.Enabled   := true;
        dbedt_cd_notificador.Color    := clWindow;
        dbedt_cd_notificador.ReadOnly := false;
        btn_co_notificador.Enabled    := true;
      end;
    end;
  end;
end;

procedure Tfrm_pedido_instrucao.dbgrid_lclDblClick(Sender: TObject);
begin

  if TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'NM_EMBALAGEM' then begin

{    Application.CreateForm(Tfrm_embal, frm_embal);
    with frm_embal Do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
       // ConsOnLine:=true;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_embal.Cons_Online_Texto <> '' ) then
    begin
      If ( st_modificar ) then
      begin
        if not(datm_pedido_Instrucao.qry_processo_carga_.State in [dsEdit,dsInsert]) then
          datm_pedido_Instrucao.qry_processo_carga_.Edit;
        datm_pedido_Instrucao.qry_processo_carga_TP_EMBALAGEM.Value:=frm_embal.Cons_Online_Texto;
      end;
   end;}
    if not(datm_pedido_Instrucao.qry_processo_carga_.State in [dsEdit,dsInsert]) then
      datm_pedido_Instrucao.qry_processo_carga_.Edit;
    datm_pedido_Instrucao.qry_processo_carga_TP_EMBALAGEM.AsString := ConsultaOnLineEx('TEMBALAGEM', 'Embalagens',
                                                                      ['CD_EMBALAGEM', 'NM_EMBALAGEM_S', 'NM_EMBALAGEM_P'],
                                                                      ['Código',       'Nome Singular',  'Nome Plural'   ],
                                                                      'CD_EMBALAGEM', nil, 1,
                                                                      datm_pedido_Instrucao.qry_processo_carga_TP_EMBALAGEM.AsString);


  end;
end;

procedure Tfrm_pedido_instrucao.dbgrid_lclKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #13 then dbgrid_lclDblClick(Sender);
end;

procedure Tfrm_pedido_instrucao.dbedt_nr_book_diretoExit(Sender: TObject);
begin
//  if dbedt_nr_book_direto.text = '' then
//  begin
//    Boxmensagem('Deve ser preenchido o numero de Booking!',3);
//    dbedt_nr_book_direto.SetFocus;
//  end;
end;

procedure Tfrm_pedido_instrucao.dbedt_nr_book_consoExit(Sender: TObject);
begin
//  if dbedt_nr_book_conso.text = '' then
//  begin
//    Boxmensagem('Deve ser preenchido o numero de Booking!',3);
//    dbedt_nr_book_conso.SetFocus;
//  end;
end;

procedure Tfrm_pedido_instrucao.dbLookCB_incotermClick(Sender: TObject);
begin
  if (datm_pedido_instrucao.qry_processo_CD_INCOTERM.AsString ='INI') then
  begin
    dblk_tp_frete_aereo.ReadOnly := false;
    dblk_tp_frete_aereo.Color    := clWindow;
    dblk_tp_frete_marit.ReadOnly := false;
    dblk_tp_frete_marit.Color    := clWindow;
  end
  else
  begin
    dblk_tp_frete_aereo.ReadOnly := true;
    dblk_tp_frete_aereo.Color    := clMenu;
    dblk_tp_frete_marit.ReadOnly := false;
    dblk_tp_frete_marit.Color    := clWindow;
  end;

  if not(datm_pedido_instrucao.qry_processo_.State in [dsEdit]) then exit;
  with datm_pedido_instrucao do
  begin
    if (qry_processo_CD_INCOTERM.AsString ='CIP') or(qry_processo_CD_INCOTERM.AsString ='CIF')or
       (qry_processo_CD_INCOTERM.AsString ='CPT')or (qry_processo_CD_INCOTERM.AsString ='DDP')or
       (qry_processo_CD_INCOTERM.AsString ='DDU') or (qry_processo_CD_INCOTERM.AsString ='DEQ')or
       (qry_processo_CD_INCOTERM.AsString ='DES')or (qry_processo_CD_INCOTERM.AsString ='CFR')then //prepaid
      qry_processo_TP_FRETE.AsString:='1'
    else
      qry_processo_TP_FRETE.AsString:='0';
  end;
  btn_mi(false,st_modificar,st_modificar, false);
end;

procedure Tfrm_pedido_instrucao.btn_imprimirClick(Sender: TObject);
begin
  with datm_pedido_instrucao do
  begin
    qry_rel_pedido_instr_.Close;
    qry_rel_pedido_instr_.ParamByName('NR_PROCESSO').AsString:=qry_processo_NR_PROCESSO.AsString;
    qry_rel_pedido_instr_.Prepare;
    qry_rel_pedido_instr_.Open;


    if pgctrl_pedido_instrucao.ActivePage = ts_dados_basicos then
    begin
      qry_processo_carga_.Close;
      qry_processo_carga_.ParamByName('NR_PROCESSO').AsString:=qry_processo_NR_PROCESSO.AsString;
      qry_processo_carga_.Prepare;
      qry_processo_carga_.Open;
      Application.CreateForm(TFrm_impressao, Frm_impressao );
      Frm_impressao.cd_agente     := datm_pedido_instrucao.qry_processo_CD_AGENTE.AsString;
      Frm_impressao.cd_unid_neg   := datm_pedido_instrucao.qry_processo_CD_UNID_NEG.AsString;
      Frm_impressao.cd_cia        := datm_pedido_instrucao.qry_processo_CD_CIA_TRANSP.AsString;
      Frm_impressao.cd_via_transp := '04';
      Frm_impressao.cd_produto    := datm_pedido_instrucao.qry_processo_CD_PRODUTO.AsString;
      Frm_impressao.cd_modulo     :='3201';
      Frm_impressao.ShowModal;
    end;

    if pgctrl_pedido_instrucao.ActivePage = ts_dados_maritimos then
    begin
      if qry_processo_TP_ESTUFAGEM.AsString = '1' then
      begin
        qry_proc_cntr_.Close;
        qry_proc_cntr_.ParamByName('NR_PROCESSO').AsString:=qry_processo_NR_PROCESSO.AsString;
        qry_proc_cntr_.Prepare;
        qry_proc_cntr_.Open;
      end;
      if (qry_processo_TP_ESTUFAGEM.AsString = '0') or (qry_processo_TP_ESTUFAGEM.AsString = '2')then
      begin
        qry_processo_carga_.Close;
        qry_processo_carga_.ParamByName('NR_PROCESSO').AsString:=qry_processo_NR_PROCESSO.AsString;
        qry_processo_carga_.Prepare;
        qry_processo_carga_.Open;
      end;
      Application.CreateForm(TFrm_impressao, Frm_impressao );
      Frm_impressao.cd_agente     := datm_pedido_instrucao.qry_processo_CD_AGENTE.AsString;
      Frm_impressao.cd_unid_neg   := datm_pedido_instrucao.qry_processo_CD_UNID_NEG.AsString;
      Frm_impressao.cd_armador    := datm_pedido_instrucao.qry_processo_CD_ARMADOR.AsString;
      Frm_impressao.cd_via_transp := '01';
      Frm_impressao.cd_produto    := datm_pedido_instrucao.qry_processo_CD_PRODUTO.AsString;
      Frm_impressao.cd_modulo     := '3203';
      Frm_impressao.ShowModal;
    end; 
  end;

end;

procedure Tfrm_pedido_instrucao.btn_pre_alertaClick(Sender: TObject);
var
  Pesquisa : String[20];
begin
  if via_transp = '04' then
  begin
    vStr_cd_modulo := '32';
    str_cd_rotina := '3202';
    Application.CreateForm( Tfrm_exp_calc_profit, frm_exp_calc_profit );
    frm_exp_calc_profit.ShowModal;
  end;
  if via_transp = '01' then
  begin
    vStr_cd_modulo := '32';
    str_cd_rotina := '3204';
    Application.CreateForm( Tfrm_exp_profit_marit, frm_exp_profit_marit );
    frm_exp_profit_marit.ShowModal;
  end;

  Pesquisa := datm_pedido_instrucao.qry_processo_NR_PROCESSO.AsString;

  datm_pedido_instrucao.qry_processo_.Close;
  datm_pedido_instrucao.qry_processo_.ParamByName('CD_UNID_NEG').AsString:=msk_cd_unid.Text;
  datm_pedido_instrucao.qry_processo_.ParamByName('CD_PRODUTO').AsString:=msk_cd_produto.text;
  datm_pedido_instrucao.qry_processo_.ParamByName('CD_VIA_TRANSP').AsString:=via_transp;
  datm_pedido_instrucao.qry_processo_.ParamByName('IN_PEDIDO').AsString:='0';
  datm_pedido_instrucao.qry_processo_.Prepare;
  datm_pedido_instrucao.qry_processo_.Open;

  datm_pedido_instrucao.qry_processo_.Locate('NR_PROCESSO',Pesquisa,[loCaseInsensitive, loPartialKey]);

  datm_pedido_instrucao.qry_conhecimento_.close;
  datm_pedido_instrucao.qry_conhecimento_.ParamByName('NR_PROCESSO').AsString:=datm_pedido_instrucao.qry_processo_NR_PROCESSO.AsString;
  datm_pedido_instrucao.qry_conhecimento_.Prepare;
  datm_pedido_instrucao.qry_conhecimento_.Open;
  Habiliata_campo_conhec(datm_pedido_instrucao.qry_conhecimento_.RecordCount);
end;

function Tfrm_pedido_instrucao.sel_tp_frete(incoterm, origem: String): String;
begin
  if (incoterm = 'FOB') or (incoterm = 'CIF') or (incoterm = 'CFR') or (incoterm = 'FCA') or
     (incoterm = 'FAS') or (incoterm = 'DES') or (incoterm = 'DAF') or (incoterm = 'DEQ')then
  begin
    if origem = '7' then //exterior
      sel_tp_frete:= '0'
    else sel_tp_frete:='1';
  end;

  if (incoterm = 'EXW') then
    sel_tp_frete:= '0';
  if (incoterm = 'DDU') or (incoterm = 'DDP')then
    sel_tp_frete:= '1';
  if (incoterm = 'CPT') or (incoterm = 'CIP') then
  begin
    if origem = '8' then
      sel_tp_frete:= '1'
    else
      sel_tp_frete:= '0';
  end;
end;

procedure Tfrm_pedido_instrucao.btn_co_navioClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_pedido_instrucao.qry_conhecimento_) then exit;
      datm_pedido_instrucao.qry_conhecimento_CD_VEICULO.Value := ConsultaOnLineEx('TEMBARCACAO','Navios',['CD_EMBARCACAO','NM_EMBARCACAO'],['Código','Nome'],'CD_EMBARCACAO',nil, 1, dbedt_cd_veiculo.text)
  end;
  dbedt_cd_veiculoExit(Sender);

{  vStr_cd_modulo := '22';
  str_cd_rotina := '2269';
  Application.CreateForm(Tfrm_veiculo, frm_veiculo);
  with frm_veiculo Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_veiculo.Cons_OnLine_Texto <> '' ) then
  begin
    if Not ( datm_pedido_instrucao.qry_conhecimento_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_pedido_instrucao.qry_conhecimento_.Edit;
    datm_pedido_instrucao.qry_conhecimento_CD_VEICULO.Value:=frm_veiculo.Cons_OnLine_Texto;
  end;
  dbedt_cd_veiculoExit(Sender);}
end;

procedure Tfrm_pedido_instrucao.dbedt_cd_veiculoExit(Sender: TObject);
begin
  with datm_pedido_instrucao do
  begin
    if Not ( qry_conhecimento_.State in [dsEdit, dsInsert] ) then
      exit;
    if dbedt_cd_veiculo.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_veiculo );
      qry_pesquisa_.Active:=false;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT TVA.CD_VEICULO, TV.NM_EMBARCACAO FROM TVEICULO_ARMADOR TVA,' );
      qry_pesquisa_.Sql.Add(' TEMBARCACAO TV WHERE TV.CD_EMBARCACAO = TVA.CD_VEICULO');
      qry_pesquisa_.Sql.Add(' AND TVA.CD_VEICULO="'+dbedt_cd_veiculo.Text+'" AND TVA.CD_ARMADOR="'+dbedt_cd_armador.Text+'"');
      qry_pesquisa_.Active:=true;
      if qry_pesquisa_.RecordCount > 0  then
      begin
        qry_conhecimento_NM_VEICULO.AsString := qry_pesquisa_.Fields[1].AsString;
        qry_pesquisa_.Close;
      end
      else
      begin
        qry_pesquisa_.Close;
        dbedt_nm_veiculo.Text := '';
        BoxMensagem('Navio inválido ou não relacionado com Armador!', 2);
        dbedt_cd_veiculo.SetFocus;
        Exit;
      end;
    end
    else  dbedt_nm_veiculo.Text := '';
  end;
end;

procedure Tfrm_pedido_instrucao.btn_co_descargaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_pedido_instrucao.qry_conhecimento_) then exit;
      datm_pedido_instrucao.qry_conhecimento_CD_ARMAZEM_DESCARGA.Value := ConsultaOnLineEx('TARMAZEM','Terminais de Entrega',['CD_ARMAZEM','NM_ARMAZEM'],['Código','Nome'],'CD_ARMAZEM',nil, 1, dbedt_cd_descarga.text)
  end;
  dbedt_cd_descargaExit(Sender);

{  vStr_cd_modulo := '22';
  str_cd_rotina := '2209';
  Application.CreateForm(Tfrm_amz, frm_amz);
  with frm_amz Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_amz.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_pedido_instrucao.qry_conhecimento_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
    datm_pedido_instrucao.qry_conhecimento_.Edit;
    datm_pedido_instrucao.qry_conhecimento_CD_ARMAZEM_DESCARGA.Value:=frm_amz.Cons_OnLine_Texto;
  end;
  dbedt_cd_descargaExit(Sender);}
end;

procedure Tfrm_pedido_instrucao.dbedt_cd_descargaExit(Sender: TObject);
begin
  with datm_pedido_instrucao do
  begin
    if Not ( qry_conhecimento_.State in [dsEdit, dsInsert] ) then Exit;
    if dbedt_cd_descarga.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_descarga );
      qry_pesquisa_.Active:=false;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT  NM_ARMAZEM');
      qry_pesquisa_.Sql.Add('FROM TARMAZEM');
      qry_pesquisa_.Sql.Add('WHERE CD_ARMAZEM="'+dbedt_cd_descarga.text+'"');
      qry_pesquisa_.Active:=true;
      if qry_pesquisa_.RecordCount > 0  then
      begin
        qry_conhecimento_NM_ARMAZEM_DESCARGA.AsString := qry_pesquisa_.Fields[0].AsString;
        qry_pesquisa_.Close;
      end
      else
      begin
        qry_pesquisa_.Close;
        dbedt_nm_descarga.Text := '';
        BoxMensagem('Código do Armazém de Descarga inválido!', 2);
        dbedt_cd_descarga.SetFocus;
        Exit;
      end;
    end else dbedt_nm_descarga.Text := '';
  end;
end;

procedure Tfrm_pedido_instrucao.btn_co_arm_retiradaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_pedido_instrucao.qry_conhecimento_) then exit;
      datm_pedido_instrucao.qry_conhecimento_CD_ARMAZEM_ATRACACAO.Value := ConsultaOnLineEx('TARMAZEM','Terminais de Entrega',['CD_ARMAZEM','NM_ARMAZEM'],['Código','Nome'],'CD_ARMAZEM',nil, 1, dbedt_cd_atracacao.text)
  end;
  dbedt_cd_atracacaoExit(Sender);

{  vStr_cd_modulo := '22';
  str_cd_rotina := '2209';
  Application.CreateForm(Tfrm_amz, frm_amz);
  with frm_amz Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_amz.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_pedido_instrucao.qry_conhecimento_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_pedido_instrucao.qry_conhecimento_.Edit;
    datm_pedido_instrucao.qry_conhecimento_CD_ARMAZEM_ATRACACAO.AsString:=frm_amz.Cons_OnLine_Texto;
  end;
  dbedt_cd_atracacaoExit(Sender);}
end;

procedure Tfrm_pedido_instrucao.dbedt_cd_atracacaoExit(Sender: TObject);
begin
  with datm_pedido_instrucao do
  begin
    if Not ( qry_conhecimento_.State in [dsEdit, dsInsert] ) then Exit;
    if dbedt_cd_atracacao.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_atracacao );
      qry_pesquisa_.Active:=false;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT  NM_ARMAZEM');
      qry_pesquisa_.Sql.Add('FROM TARMAZEM');
      qry_pesquisa_.Sql.Add('WHERE CD_ARMAZEM="'+dbedt_cd_atracacao.text+'"');
      qry_pesquisa_.Active:=true;
      if qry_pesquisa_.RecordCount > 0  then
      begin
        qry_conhecimento_NM_ARMAZEM_RETIRADA.AsString := qry_pesquisa_.Fields[0].AsString;
        qry_pesquisa_.Close;
      end
      else
      begin
        qry_pesquisa_.Close;
        dbedt_nm_atracacao.Text := '';
        BoxMensagem('Código do Armazém de Atracação inválido!', 2);
        dbedt_cd_atracacao.SetFocus;
        Exit;
      end;
    end
    else dbedt_nm_atracacao.Text := '';
  end;
end;

procedure Tfrm_pedido_instrucao.btn_co_imp_maritClick(Sender: TObject);
var
vGrupo:String[3];
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_pedido_instrucao.qry_processo_) then exit;
//    datm_pedido_instrucao.qry_processo_CD_EMP_EST.Value := ConsultaOnLineEx('TEMPRESA_EST','Importador',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA',nil, 1, dbedt_cd_importador.text) BY CARLOS

    vGrupo := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', datm_pedido_instrucao.qry_processo_NR_PROCESSO.AsString, 'CD_GRUPO');
    datm_pedido_instrucao.qry_processo_CD_EMP_EST.Value := ConsultaOnLineExSQL(
      'SELECT CD_EMPRESA, NM_EMPRESA, END_CIDADE, END_EMPRESA, END_NUMERO FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = ''1'' ' +
      ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ',
      'Cadastro de Importadores',['CD_EMPRESA', 'NM_EMPRESA', 'END_CIDADE','END_EMPRESA', 'END_NUMERO' ],['Código','Importador','Cidade','Endereço','Numero'],'CD_EMPRESA',nil,datm_pedido_instrucao.qry_processo_CD_EMP_EST.Value);



  end;
  dbedt_cd_importadorExit(sender);

{  vStr_cd_modulo := '22';
  str_cd_rotina := '2203';
  Application.CreateForm(Tfrm_emp_est, frm_emp_est);
  with frm_emp_est Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_emp_est.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_pedido_instrucao.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_pedido_instrucao.qry_processo_.Edit;
    datm_pedido_instrucao.qry_processo_CD_EMP_EST.Value:=frm_emp_est.Cons_OnLine_Texto;
  end;
  dbedt_cd_importadorExit(sender);}
end;

procedure Tfrm_pedido_instrucao.dbedt_cd_imp_maritExit(Sender: TObject);
begin
  with datm_pedido_instrucao do
  begin
    if Not ( qry_processo_.State in [dsEdit, dsInsert] ) then
      exit;
    if dbedt_cd_imp_marit.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_imp_marit );
      qry_pesquisa_.Active:=false;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_EMPRESA FROM TEMPRESA_EST WHERE CD_EMPRESA ="'+dbedt_cd_imp_marit.Text+'"');
      qry_pesquisa_.Active:=true;

      if qry_pesquisa_.RecordCount > 0 then
      begin
        qry_processo_NM_IMP.AsString:=qry_pesquisa_.Fields[0].AsString;
        qry_pesquisa_.Close;
      end
      else
      begin
        qry_pesquisa_.Close;
        dbedt_nm_imp_marit.Text := '';
        BoxMensagem('Código do Importador inválido!', 2);
        dbedt_cd_imp_marit.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_pedido_instrucao.btn_co_notificadorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_pedido_instrucao.qry_conhecimento_) then exit;
      datm_pedido_instrucao.qry_conhecimento_CD_NOTIFICADOR.Value := ConsultaOnLineEx('TNOTIFICADOR ','Notificadores',['CD_NOTIFICADOR','NM_NOTIFICADOR'],['Código','Nome'],'CD_NOTIFICADOR',nil, 1, dbedt_cd_notificador.text)
  end;
  dbedt_cd_notificadorExit(Sender);

{  vStr_cd_modulo := '22';
  str_cd_rotina := '2279';
  Application.CreateForm(Tfrm_notificador, frm_notificador);
  with frm_notificador Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;

  if (frm_notificador.Cons_OnLine_Texto <> '' ) then
  begin
    if Not ( datm_pedido_instrucao.qry_conhecimento_.State in [dsEdit, dsInsert]) and ( st_modificar ) then
      datm_pedido_instrucao.qry_conhecimento_.Edit;
    datm_pedido_instrucao.qry_conhecimento_CD_NOTIFICADOR.Value:=frm_notificador.Cons_OnLine_Texto;
  end;
  dbedt_cd_notificadorExit(Sender);}
end;

procedure Tfrm_pedido_instrucao.dbedt_cd_notificadorExit(Sender: TObject);
begin
  with datm_pedido_instrucao do
  begin
    if Not ( qry_conhecimento_.State in [dsEdit, dsInsert] ) then
      exit;
    if dbedt_cd_notificador.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_notificador );
      qry_pesquisa_.Active:=false;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT TNA.CD_NOTIFICADOR, TN.NM_NOTIFICADOR FROM TARMADOR_NOTIFICADOR TNA,' );
      qry_pesquisa_.Sql.Add(' TNOTIFICADOR TN WHERE TN.CD_NOTIFICADOR = TNA.CD_NOTIFICADOR');
      qry_pesquisa_.Sql.Add(' AND TNA.CD_NOTIFICADOR="'+dbedt_cd_notificador.Text+'" AND TNA.CD_ARMADOR="'+dbedt_cd_armador.Text+'"');
      qry_pesquisa_.Active:=true;

      if qry_pesquisa_.RecordCount > 0  then
      begin
        qry_conhecimento_NM_NOTIFICADOR.AsString := qry_pesquisa_.Fields[1].AsString;
        qry_pesquisa_.Close;
      end
      else
      begin
        qry_pesquisa_.Close;
        dbedt_nm_notificador.Text := '';
        BoxMensagem('Notificador inválido ou não relacionado com Armador!', 2);
        dbedt_cd_notificador.SetFocus;
        Exit;
      end;
    end
    else dbedt_nm_notificador.Text := '';
  end;
end;

procedure Tfrm_pedido_instrucao.btn_co_moeda_maritClick(Sender: TObject);
var
  moeda : string;
begin
  moeda := ConsultaOnLineEx('TMOEDA_BROKER','Moedas', ['CD_MOEDA','NM_MOEDA','AP_MOEDA'], ['Código','Moeda','Sigla'],'CD_MOEDA',nil, 1 ,dbedt_cd_moeda.text);
  if moeda <> '' then
  begin
    if not(datm_pedido_instrucao.qry_processo_.State in [dsEdit]) then datm_pedido_instrucao.qry_processo_.Edit;
    datm_pedido_instrucao.qry_processo_CD_MOEDA_FRETE.AsString := moeda;
    dbedt_cd_moedaExit(sender);
  end;
end;

procedure Tfrm_pedido_instrucao.btn_co_consoClick(Sender: TObject);
var
  pesquisa : String[20];
begin
  Application.CreateForm(Tfrm_gerar_consolidada, frm_gerar_consolidada);
  frm_gerar_consolidada.cd_via_transp:=via_transp;

  frm_gerar_consolidada.msk_cd_unid_aerea.text   := datm_pedido_instrucao.qry_consolidadas_CD_UNID_NEG.AsString;
  frm_gerar_consolidada.msk_cd_prod_aerea.text   := datm_pedido_instrucao.qry_consolidadas_CD_PRODUTO.AsString;
  frm_gerar_consolidada.msk_cd_agente_aerea.text := datm_pedido_instrucao.qry_consolidadas_CD_AGENTE.AsString;
  frm_gerar_consolidada.msk_cd_orig_aerea.text   := datm_pedido_instrucao.qry_consolidadas_CD_ORIGEM.AsString;
  frm_gerar_consolidada.msk_cd_dest_aerea.text   := datm_pedido_instrucao.qry_consolidadas_CD_DESTINO.AsString;
  frm_gerar_consolidada.msk_cd_moeda_aerea.text  := datm_pedido_instrucao.qry_consolidadas_CD_MOEDA.AsString;
  frm_gerar_consolidada.edt_nm_unid_aerea.text   := frm_pedido_instrucao.edt_nm_unid.text;
  frm_gerar_consolidada.edt_nm_prod_aerea.text   := frm_pedido_instrucao.edt_nm_produto.text;
  frm_gerar_consolidada.edt_nm_agente_aerea.text := datm_pedido_instrucao.qry_consolidadas_NM_AGENTE.AsString;

  frm_gerar_consolidada.edt_nm_moeda_aerea.text    := datm_pedido_instrucao.qry_consolidadas_NM_MOEDA.AsString;
  frm_gerar_consolidada.edt_nr_voo.text            := datm_pedido_instrucao.qry_consolidadas_NR_VOO.AsString;
  frm_gerar_consolidada.msk_dt_voo.text            := datm_pedido_instrucao.qry_consolidadas_DT_PREV_SAIDA.AsString;
  frm_gerar_consolidada.edt_master.text            := datm_pedido_instrucao.qry_consolidadas_NR_MASTER.AsString;
  frm_gerar_consolidada.edt_nr_book.text           := datm_pedido_instrucao.qry_consolidadas_NR_BOOKING.AsString;
  frm_gerar_consolidada.cd_master                  := datm_pedido_instrucao.qry_consolidadas_CD_MASTER.AsString;
  frm_gerar_consolidada.msk_cd_navio.text           := datm_pedido_instrucao.qry_consolidadas_CD_VEICULO.AsString;
  frm_gerar_consolidada.edt_nm_navio.text           := datm_pedido_instrucao.qry_consolidadas_NM_EMBARCACAO.AsString;
  if via_transp = '01' then
  begin
    frm_gerar_consolidada.msk_cd_cia_aerea.text    := datm_pedido_instrucao.qry_consolidadas_CD_ARMADOR.AsString;
    frm_gerar_consolidada.edt_nm_cia_aerea.text    := datm_pedido_instrucao.qry_consolidadas_NM_ARMADOR.AsString;
    frm_gerar_consolidada.edt_nm_orig_aerea.text   := datm_pedido_instrucao.qry_consolidadas_NM_ORIGEM_CID.AsString;
    frm_gerar_consolidada.edt_nm_dest_aerea.text   := datm_pedido_instrucao.qry_consolidadas_NM_DESTINO_CID.AsString;
    try
      frm_gerar_consolidada.rdgroup_estufagem.ItemIndex:= strtoint(datm_pedido_instrucao.qry_consolidadas_TP_ESTUFAGEM.AsString);
    except
      frm_gerar_consolidada.rdgroup_estufagem.ItemIndex := 0;
    end;
  end
  else
  begin
    frm_gerar_consolidada.msk_cd_cia_aerea.text    := datm_pedido_instrucao.qry_consolidadas_CD_CIA_TRANSP.AsString;
    frm_gerar_consolidada.edt_nm_cia_aerea.text    := datm_pedido_instrucao.qry_consolidadas_NM_CIA_TRANSP.AsString;
    frm_gerar_consolidada.edt_nm_orig_aerea.text   := datm_pedido_instrucao.qry_consolidadas_NM_ORIGEM.AsString;
    frm_gerar_consolidada.edt_nm_dest_aerea.text   := datm_pedido_instrucao.qry_consolidadas_NM_DESTINO.AsString;
  end;
  frm_gerar_consolidada.in_only_house := true;
  frm_gerar_consolidada.ShowModal;

  pesquisa  :=  datm_pedido_instrucao.qry_consolidadas_CD_MASTER.AsString;

  datm_pedido_instrucao.qry_consolidadas_.Close;
  datm_pedido_instrucao.qry_consolidadas_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid.text;
  datm_pedido_instrucao.qry_consolidadas_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.text;
  datm_pedido_instrucao.qry_consolidadas_.ParamByName('CD_VIA_TRANSP').AsString  := via_transp;
  datm_pedido_instrucao.qry_consolidadas_.Prepare;
  datm_pedido_instrucao.qry_consolidadas_.Open;

  datm_pedido_instrucao.qry_consolidadas_.Locate('CD_MASTER', pesquisa, [loCaseInsensitive]);

end;

procedure Tfrm_pedido_instrucao.btn_liberar_comercClick(Sender: TObject);
begin
  with datm_pedido_instrucao do
  begin
    try
      if ( qry_processo_IN_PEDIDO.AsString = '2' ) then
      begin
        qry_processo_.Edit;
        qry_processo_IN_PEDIDO.AsString    := '0';
        qry_processo_.Post;

        qry_processo_.Close;
        qry_processo_.ParamByName('CD_UNID_NEG').AsString   := msk_cd_unid.text;
        qry_processo_.ParamByName('CD_PRODUTO').AsString    := msk_cd_produto.text;
        qry_processo_.ParamByName('CD_VIA_TRANSP').AsString := via_transp;
        qry_processo_.ParamByName('IN_PEDIDO').AsString     := '2';
        qry_processo_.Prepare;
        qry_processo_.Open;

        BoxMensagem( 'Processo foi Tranferido para Operacional!', 3);
      end
    except
      on E:Exception do
      begin
        qry_processo_.Cancel;
        TrataErro(E);
      end;
    end;
  end;
end;

procedure Tfrm_pedido_instrucao.Habiliata_campo_conhec(qtde: integer);
begin
  if qtde = 0 then
  begin
    dbedt_nr_voo.Color            := clMenu;
    dbedt_nr_voo.ReadOnly         := true;
    dbedt_dt_voo.Color            := clMenu;
    dbedt_dt_voo.ReadOnly         := true;
    dbedt_nr_viagem.Color         := clMenu;
    dbedt_nr_viagem.ReadOnly      := true;
    dbedt_dt_viagem.Color         := clMenu;
    dbedt_dt_viagem.ReadOnly      := true;
    dbedt_nr_book_direto.Color    := clMenu;
    dbedt_nr_book_direto.ReadOnly := true;

//    dbedt_nr_book_conso.Color     := clMenu;
//    dbedt_nr_book_conso.ReadOnly  := true;

    dbedt_cd_veiculo.Color        := clMenu;
    dbedt_cd_veiculo.ReadOnly     := true;
    btn_co_navio.Enabled          := false;

    dbedt_cd_descarga.Color       := clMenu;
    dbedt_cd_descarga.ReadOnly    := true;
    dbedt_cd_atracacao.Color      := clMenu;
    dbedt_cd_atracacao.ReadOnly   := true;

    btn_co_descarga.Enabled       := false;
    dbedt_dead_line.Color         := clMenu;
    dbedt_dead_line.ReadOnly      := true;
    btn_co_arm_retirada.Enabled   := false;

    dbedt_cd_notificador.Color    := clMenu;
    dbedt_cd_notificador.ReadOnly := true;
    btn_co_notificador.Enabled    := false;
  end
  else
  begin
    dbedt_nr_voo.Color            := clWindow;
    dbedt_nr_voo.ReadOnly         := false;
    dbedt_dt_voo.Color            := clWindow;
    dbedt_dt_voo.ReadOnly         := false;
    dbedt_nr_viagem.Color         := clWindow;
    dbedt_nr_viagem.ReadOnly      := false;
    dbedt_dt_viagem.Color         := clWindow;
    dbedt_dt_viagem.ReadOnly      := false;

    dbedt_nr_book_direto.Color    := clWindow;
    dbedt_nr_book_direto.ReadOnly := false;
    dbedt_nr_book_conso.Color     := clWindow;
    dbedt_nr_book_conso.ReadOnly  := false;

    dbedt_cd_veiculo.Color        := clWindow;
    dbedt_cd_veiculo.ReadOnly     := false;
    btn_co_navio.Enabled          := true;

    dbedt_cd_descarga.Color       := clWindow;
    dbedt_cd_descarga.ReadOnly    := false;
    dbedt_cd_atracacao.Color      := clWindow;
    dbedt_cd_atracacao.ReadOnly   := false;
    btn_co_descarga.Enabled       := true;
    dbedt_dead_line.Color         := clWindow;
    dbedt_dead_line.ReadOnly      := false;
    btn_co_arm_retirada.Enabled   := true;

    dbedt_cd_notificador.Color    := clWindow;
    dbedt_cd_notificador.ReadOnly := false;
    btn_co_notificador.Enabled    := true;
  end;
end;

procedure Tfrm_pedido_instrucao.dbgrid_cargaExit(Sender: TObject);
begin
  if TDBGrid(Sender).DataSource.DataSet.State in [dsInsert,dsEdit] then
  begin
    TDBGrid(Sender).DataSource.DataSet.Post;
    TDBGrid(Sender).DataSource.DataSet.Edit;
  end;
end;

procedure Tfrm_pedido_instrucao.dbgrid_cargaEnter(Sender: TObject);
begin
  if datm_pedido_instrucao.qry_processo_NR_PROCESSO.AsString = '' then
    ShowMessage('Escolha um processo antes de inserir Características da Carga');
end;

procedure Tfrm_pedido_instrucao.dbgrid_fclKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then  dbgrid_fclDblClick(Sender);
end;

procedure Tfrm_pedido_instrucao.dbgrid_fclDblClick(Sender: TObject);
begin
  if (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'TP_CNTR')  or
     (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'calcNomeCNTR') then begin
    if TDBGrid(Sender).dataSource.DataSet.State in [dsBrowse, dsInactive] then
      TDBGrid(Sender).dataSource.DataSet.Edit;
      TDBGrid(Sender).dataSource.DataSet.FieldByname('TP_CNTR').AsString := ConsultaOnLineEx('TTP_CNTR', 'Tipo de Contâiner',['TP_CNTR', 'NM_TP_CNTR'], ['Código','Tipo'],'TP_CNTR', nil, 1, TDBGrid(Sender).dataSource.DataSet.FieldByname('TP_CNTR').AsString);
  end;
end;

procedure Tfrm_pedido_instrucao.dbgrid_lclKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If key = VK_F5 then dbgrid_lclDblClick(Sender);
end;

procedure Tfrm_pedido_instrucao.dbgrid_fclExit(Sender: TObject);
begin
{  if TDBGrid(Sender).DataSource.DataSet.State in [dsInsert,dsEdit] then
  begin
    TDBGrid(Sender).DataSource.DataSet.Post;
    TDBGrid(Sender).DataSource.DataSet.Edit;
  end;   }
end;

procedure Tfrm_pedido_instrucao.dbgrid_fclColExit(Sender: TObject);
begin
  if TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'NR_CNTR' then
    if (Length(TDBGrid(Sender).DataSource.DataSet.FieldByName('NR_CNTR').AsString) <> 11) and (TDBGrid(Sender).DataSource.DataSet.FieldByName('NR_CNTR').AsString <> '')  then begin
      ShowMessage('Nr. de Cntr inválido ou imcompleto!');
      TDBGrid(Sender).DataSource.DataSet.Cancel;
    end;
  if TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'TP_CNTR' then
    if (ConsultaLookUP('TTP_CNTR', 'TP_CNTR',TDBGrid(Sender).DataSource.DataSet.FieldbyName('TP_CNTR').AsString , 'NM_TP_CNTR') = '')  then begin
      ShowMessage('Tipo de Cntr inválido ou inexistente!');
      TDBGrid(Sender).DataSource.DataSet.Cancel;
    end;

end;

end.

