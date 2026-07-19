(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGPO018.PAS - Realização por PO
AUTOR: Alexandre Gonçalves Neto
DATA: 08/09/2004
Manutenção:
Data:
*************************************************************************************************)
unit PGPO018;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Menus, StdCtrls, DBCtrls, Mask, DBCGrids, DBTables, Db,
  Variants, Funcoes, ConsOnLineEx, Grids, DBGrids, DateUtil, ImgList;

type
  Tfrm_po_flp = class(TForm)
    menu_manut: TMainMenu;
    mniManutPedido: TMenuItem;
    mi_sair: TMenuItem;
    pnl_ev_comum: TPanel;
    pnl_selecao: TPanel;
    lbl_nr_processo_po: TLabel;
    btn_po: TSpeedButton;
    lbl_produto: TLabel;
    btn_cd_produto: TSpeedButton;
    lbl_unidade: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    btn_processo: TSpeedButton;
    lbl_nr_processo: TLabel;
    msk_nr_po: TMaskEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_nr_processo: TMaskEdit;
    pnl_ev_espec: TPanel;
    pnlComandos: TPanel;
    pnl1: TPanel;
    chkRealizaLote: TCheckBox;
    chkUltimosProcessos: TCheckBox;
    mniGestaoPedido: TMenuItem;
    pnlEtapa: TPanel;
    lblCodigo: TLabel;
    lblEtapa: TLabel;
    btnConsultaEtapa: TSpeedButton;
    btnSalvarEtapa: TSpeedButton;
    btnCancelarEtapa: TSpeedButton;
    shp10: TShape;
    lbl35: TLabel;
    dbedtCodigo: TDBEdit;
    dbedtCodigoEtapa: TDBEdit;
    edtNomeEtapa: TEdit;
    shp11: TShape;
    dbgrdEventoComum: TDBGrid;
    pnlAguarde: TPanel;
    shp7: TShape;
    lbl20: TLabel;
    shp6: TShape;
    dbgrdEventoEspec: TDBGrid;
    dsFollowupPO: TDataSource;
    qryFollowupPO: TQuery;
    qryFollowupPONR_PROCESSO: TStringField;
    qryFollowupPOCD_EVENTO: TStringField;
    qryFollowupPONM_EVENTO: TStringField;
    qryFollowupPODT_REALIZACAO: TDateTimeField;
    qryFollowupPODT_PREVISTA: TDateTimeField;
    qryFollowupPOAP_USUARIO: TStringField;
    qryFollowupPOCD_RESP_REALIZACAO: TStringField;
    dsFollowupPOItem: TDataSource;
    qryFollowupPOItem: TQuery;
    qryFollowupPOItemNR_PROCESSO: TStringField;
    qryFollowupPOItemNR_ITEM: TStringField;
    qryFollowupPOItemNR_ITEM_CLIENTE: TStringField;
    qryFollowupPOItemCD_EVENTO: TStringField;
    qryFollowupPOItemNM_EVENTO: TStringField;
    qryFollowupPOItemDT_REALIZACAO: TDateTimeField;
    qryFollowupPOItemDT_PREVISTA: TDateTimeField;
    qryFollowupPOItemIN_APLICAVEL: TStringField;
    qryFollowupPOItemCD_RESP_REALIZACAO: TStringField;
    qryFollowupPOItemAP_USUARIO: TStringField;
    dsFlpPoItemEtapa: TDataSource;
    qryFlpPoItemEtapa: TQuery;
    qryFlpPoItemEtapaNR_PROCESSO: TStringField;
    qryFlpPoItemEtapaNR_ITEM: TStringField;
    qryFlpPoItemEtapaCD_FLP_PO_ITEM_ETAPA: TIntegerField;
    qryFlpPoItemEtapaCD_ETAPA: TIntegerField;
    qryFlpPoItemEtapaCD_USUARIO: TStringField;
    qryFlpPoItemEtapaDT_ALTERACAO: TDateTimeField;
    qryFlpPoItemEtapaNM_ETAPA: TStringField;
    qryFlpPoItemEtapaAP_USUARIO: TStringField;
    updFlpPoItemEtapa: TUpdateSQL;
    updFollowupPO: TUpdateSQL;
    updFollowupPOItem: TUpdateSQL;
    dsPoItem: TDataSource;
    qryPoItem: TQuery;
    qryPoItemNR_PROCESSO: TStringField;
    qryPoItemNR_ITEM: TStringField;
    qryPoItemNR_ITEM_CLIENTE: TStringField;
    qryFollowupPOcalcAtraso: TStringField;
    lblTituloComum: TLabel;
    lbl_02: TLabel;
    lbl_01: TLabel;
    lbl_04: TLabel;
    lbl_05: TLabel;
    lbl_07: TLabel;
    lbl_06: TLabel;
    shp5: TShape;
    pnlEtapaItem: TPanel;
    shp8: TShape;
    lbl_nr_item_cliente: TLabel;
    lblUltimaEtapa: TLabel;
    btnIncluirEtapa: TSpeedButton;
    btnFollowupEtapa: TSpeedButton;
    msk_item_cliente: TMaskEdit;
    edtUltimaEtapa: TEdit;
    lblTituloEspec: TLabel;
    lbl_08: TLabel;
    lbl_09: TLabel;
    lbl_11: TLabel;
    lbl_12: TLabel;
    lbl_13: TLabel;
    lbl_14: TLabel;
    shp9: TShape;
    qryFollowupPOItemcalcAtraso: TStringField;
    lbl_importador: TLabel;
    dbedt_cd_cliente: TDBEdit;
    dbedt_ap_empresa: TDBEdit;
    dbedt_cd_servico: TDBEdit;
    dbedt_nm_servico: TDBEdit;
    lbl_cd_servico: TLabel;
    btnManutPedido: TSpeedButton;
    btnGestaoPedido: TSpeedButton;
    btnAtzFup: TSpeedButton;
    btn_sair: TSpeedButton;
    lbl_proc_evento: TLabel;
    rbTipoBuscaComum: TRadioButton;
    rbTipoBuscaEspec: TRadioButton;
    edtBuscaEvento: TEdit;
    btn_obs_po: TSpeedButton;
    shp3: TShape;
    shp4: TShape;
    shp1: TShape;
    shp2: TShape;
    shp12: TShape;
    shp13: TShape;
    dsPo: TDataSource;
    qryPo: TQuery;
    qryPoCD_IMPORTADOR: TStringField;
    qryPoCD_SERVICO: TStringField;
    qryPoNM_IMPORTADOR: TStringField;
    qryPoNM_SERVICO: TStringField;
    qryFollowupPOIN_APLICAVEL: TStringField;
    lbl_item: TLabel;
    msk_item: TMaskEdit;
    lbl_00: TLabel;
    msk_total_item: TMaskEdit;
    Label1: TLabel;
    CmbParciais: TComboBox;
    Label2: TLabel;
    EditNR_PROCESSO_DES: TEdit;
    shp14: TShape;
    dbnav_item_po: TDBNavigator;
    qryPoItemNR_PARCIAL: TIntegerField;
    qryFollowupPOItemDT_LIMITE: TDateTimeField;
    qryFollowupPOItemQT_DISP: TFloatField;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    qryPoItemNR_FATURA: TStringField;
    ppmAtalhos: TPopupMenu;
    ManutenodosProcessos1: TMenuItem;
    FollowupDesembarao1: TMenuItem;
    N1: TMenuItem;
    ImageList1: TImageList;
    SpeedButton1: TSpeedButton;
    qryPoCD_EMPRESA: TStringField;
    qryPoItemCD_EMPRESA: TStringField;
    qryFollowupPODT_LIMITE: TDateTimeField;
    qryFollowupPOCD_EMPRESA: TStringField;
    qryFollowupPOItemCD_EMPRESA: TStringField;
    qryFlpPoItemEtapaCD_EMPRESA: TStringField;
    Label4: TLabel;
    edt_cd_cliente: TEdit;
    edt_nm_cliente: TEdit;
    pnl_info_pendencias: TPanel;
    lbl_pendencias1: TLabel;
    dbtxt_pendencias_total: TDBText;
    lbl_pendencias3: TLabel;
    dbtxt_pendencias_solicitadas: TDBText;
    lbl_pendencias2: TLabel;
    dbtxt_pendencias_finalizadas: TDBText;
    lbl_pendencias4: TLabel;
    dsPendencias: TDataSource;
    qryPendencias: TQuery;
    qryPendenciasCONTADOR_TOTAL: TIntegerField;
    qryPendenciasCONTADOR_ANDAMENTO: TIntegerField;
    qryPendenciasCONTADOR_FINALIZADA: TIntegerField;
    qryFollowupPOItemNR_PARCIAL: TIntegerField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_cd_produtoClick(Sender: TObject);
    procedure btn_processoClick(Sender: TObject);
    procedure btn_poClick(Sender: TObject);
    procedure msk_nr_processoEnter(Sender: TObject);
    procedure msk_nr_poEnter(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure msk_nr_poExit(Sender: TObject);
    procedure msk_item_clienteExit(Sender: TObject);
    procedure dbnav_item_poClick(Sender: TObject; Button: TNavigateBtn);
    procedure btn_sairClick(Sender: TObject);
    procedure btnManutPedidoClick(Sender: TObject);
    procedure btn_obs_poClick(Sender: TObject);
    procedure btnGestaoPedidoClick(Sender: TObject);
    procedure btnCancelarEtapaClick(Sender: TObject);
    procedure btnSalvarEtapaClick(Sender: TObject);
    procedure btnIncluirEtapaClick(Sender: TObject);
    procedure btnFollowupEtapaClick(Sender: TObject);
    procedure btnConsultaEtapaClick(Sender: TObject);
    procedure rbTipoBuscaComumClick(Sender: TObject);
    procedure rbTipoBuscaEspecClick(Sender: TObject);
    procedure edtBuscaEventoChange(Sender: TObject);
    procedure dbgrdEventoComumDblClick(Sender: TObject);
    procedure dbgrdEventoComumDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrdEventoComumDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure dbgrdEventoEspecDblClick(Sender: TObject);
    procedure dbgrdEventoEspecDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrdEventoEspecDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure dbgrdEventoEspecKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAtzFupClick(Sender: TObject);
    procedure qryFollowupPOAfterClose(DataSet: TDataSet);
    procedure qryFollowupPOAfterDelete(DataSet: TDataSet);
    procedure qryFollowupPOAfterEdit(DataSet: TDataSet);
    procedure qryFollowupPOAfterOpen(DataSet: TDataSet);
    procedure qryFollowupPOAfterPost(DataSet: TDataSet);
    procedure qryFollowupPOAfterScroll(DataSet: TDataSet);
    procedure qryFollowupPOBeforeClose(DataSet: TDataSet);
    procedure qryFollowupPOBeforePost(DataSet: TDataSet);
    procedure qryFollowupPOCalcFields(DataSet: TDataSet);
    procedure qryFollowupPOItemAfterClose(DataSet: TDataSet);
    procedure qryFollowupPOItemAfterDelete(DataSet: TDataSet);
    procedure qryFollowupPOItemAfterEdit(DataSet: TDataSet);
    procedure qryFollowupPOItemAfterOpen(DataSet: TDataSet);
    procedure qryFollowupPOItemAfterPost(DataSet: TDataSet);
    procedure qryFollowupPOItemAfterScroll(DataSet: TDataSet);
    procedure qryFollowupPOItemBeforeClose(DataSet: TDataSet);
    procedure qryFollowupPOItemBeforePost(DataSet: TDataSet);
    procedure qryFollowupPOItemCalcFields(DataSet: TDataSet);
    procedure qryFollowupPODT_REALIZACAOSetText(Sender: TField; const Text: string);
    procedure qryFollowupPOItemDT_REALIZACAOSetText(Sender: TField; const Text: string);
    procedure qryFlpPoItemEtapaAfterDelete(DataSet: TDataSet);
    procedure qryFlpPoItemEtapaAfterPost(DataSet: TDataSet);
    procedure CmbParciaisChange(Sender: TObject);
    procedure qryPoItemAfterScroll(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ManutenodosProcessos1Click(Sender: TObject);
    procedure FollowupDesembarao1Click(Sender: TObject);
    procedure edt_cd_clienteChange(Sender: TObject);
    procedure lbl_pendencias1Click(Sender: TObject);
  private
    st_modificar, st_excluir, st_incluir : Boolean;
    vPodeAtualizar, vAlterouPO, vAlterouItem, vAlterouLote : Boolean;
    vUnidadePadrao, vProdutoPadrao: string[2];
    nr_processo, nr_po : string[18];
    nr_item: Integer;
    aItens: array of string;
    in_abrindo: Boolean;
    function ValidaHabilitacao(vUnidade, vProduto : string): Boolean;
    function PrecisaAtualizar(pCdEvento : string) : Boolean;
    procedure ItemAlterado(pItem : string);
    function ValidaData(Data: string; var Sender: TField): Boolean;
    procedure AtualizaGridPoItens;
    procedure AtualizaCmbParcial;
    function EventoAutomatico(AEvento: String): Boolean;
    { Private declarations }
  public
    //pesq_nr_po, pesq_nr_proc : String[18];
    //pesq_cd_unid_neg, pesq_cd_prod : String[2];
    //nr_po_gestao, cd_unid_neg_gestao : String;
    pesq_nr_proc, pesq_cd_unid_neg, pesq_cd_prod : String;
    pesq_cd_evento, vCdEvento, vStrEvento : string[3];
    procedure AtualizaEtapaProcesso;
    { Public declarations }
  end;

var
  frm_po_flp: Tfrm_po_flp;

implementation

uses GSMLIB, PGGP001, PGGP017, PGPO020, PGPO027, uFollowUpEtapa,
  upendencias;

{$R *.DFM}

function Tfrm_po_flp.ValidaHabilitacao(vUnidade, vProduto : string): Boolean;
var
  vHabilitacao: Integer;
begin
  ValidaHabilitacao := False;
  //verifica se o usuário tem habilitação para a unidade/produto
  if (vUnidade <> '') and (vProduto <> '') then
  begin
    vHabilitacao := StrToInt(ConsultaLookUPSQL(
      'SELECT COUNT(*) AS VALIDO FROM TUSUARIO_HABILITACAO (NOLOCK) '+
      'WHERE CD_UNID_NEG = '''+ vUnidade +''' '+
      '  AND CD_PRODUTO  = '''+ vProduto +''' '+
      '  AND CD_USUARIO  = '''+ str_cd_usuario +''' '+
      '  AND IN_ATIVO    = ''1'' ','VALIDO'));
    if vHabilitacao > 0 then
      ValidaHabilitacao := True
    else
      MessageDlg('Usuário sem habilitação para esta Unidade/Produto!',mtError,[mbOK],0);
  end;
end;

function Tfrm_po_flp.PrecisaAtualizar(pCdEvento : string) : Boolean;
begin
  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      // verifica se ele é evento base de alguém
      SQL.Add('SELECT COUNT(*) FROM TSERVICO_EVENTO WHERE CD_SERVICO = ''' + dbedt_cd_servico.text + ''' AND CD_EV_BASICO = ''' + pCdEvento + '''');
      Open;
      Result := (Fields[0].AsInteger > 0);
      Close;
    finally
      Free;
    end;
  end;
end;

function Tfrm_po_flp.ValidaData(Data: string; var Sender: TField): Boolean;
begin
  Result := True;
  try
    Sender.AsDateTime := StrToDate(Data);
  except
    Sender.Clear;
    Result := False;
    Application.MessageBox('Data Inválida! Preencha novamente!', 'Erro no Preenchimento de Data', MB_OK + MB_ICONERROR);
  end;
end;

procedure Tfrm_po_flp.ItemAlterado(pItem : string);
var
  x, y : integer;
begin
  for x := Low(aItens) to High(aItens) do
    if aItens[x] = pItem then Exit;
  if High(aItens) = -1 then
    y := 1
  else
    y := High(aItens)+1;
  SetLength(aItens,y);
  aItens[y-1] := pItem;
end;

procedure Tfrm_po_flp.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //se ESC for pressionada, fecha o form
  if Key = #27 then
  begin
    Close;
    str_cd_rotina_atalho := '';
    nr_processo := '';
    nr_po       := '';
  end;
end;

procedure Tfrm_po_flp.FormCreate(Sender: TObject);
begin
  in_abrindo  := True;
  //procura a unidade e produto padrão do usuário
  vUnidadePadrao := ConsultaLookUPSQL('SELECT CD_UNID_NEG FROM TUSUARIO_HABILITACAO (NOLOCK) WHERE CD_USUARIO = '''+ str_cd_usuario +''' AND IN_DEFAULT = ''1'' ','CD_UNID_NEG');
  vProdutoPadrao := ConsultaLookUPSQL('SELECT CD_PRODUTO  FROM TUSUARIO_HABILITACAO (NOLOCK) WHERE CD_USUARIO = '''+ str_cd_usuario +''' AND IN_DEFAULT = ''1'' ','CD_PRODUTO');

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
  dsFollowupPO.AutoEdit := st_modificar;
  dsFollowupPOItem.AutoEdit := st_modificar;
  dsFlpPoItemEtapa.AutoEdit := st_modificar;
end;

procedure Tfrm_po_flp.FormShow(Sender: TObject);
begin
  vPodeAtualizar := True;
  shp1.Brush.Color := clMenuBroker;
  shp4.Brush.Color := clMenuBroker;
  shp5.Brush.Color := clMenuBroker;
  shp9.Brush.Color := clMenuBroker;
  shp8.Brush.Color := clPnlClaroBroker;
  rbTipoBuscaComum.Color := clMenuBroker;
  rbTipoBuscaEspec.Color := clMenuBroker;

  if cd_unid_neg_gestao <> '' then
    msk_cd_unid_neg.Text := cd_unid_neg_gestao
  else
    msk_cd_unid_neg.Text := vUnidadePadrao;
  msk_cd_produto.Text := '06';//vProdutoPadrao;

  if cd_cliente_gestao <> '' then
    edt_cd_cliente.Text := cd_cliente_gestao
  else
    edt_cd_cliente.Text := '';

  if Trim(nr_po_gestao) <> '' then
  begin
    msk_nr_po.Text := nr_po_gestao;
    msk_nr_poExit(nil);
  end
  else
  if Trim(nr_processo_po) <> '' then
  begin
    msk_nr_processo.Text := Copy(nr_processo_po, 5, 13);
    msk_nr_processoExit(nil);
  end;
  msk_cd_unid_neg.SetFocus;
  in_abrindo := False;
end;

procedure Tfrm_po_flp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsFlpPoItemEtapa.State in [dsInsert] then
    qryFlpPoItemEtapa.Cancel;
  if vAlterouPO then
    btnAtzFupClick(qryFollowupPO);
  if vAlterouItem then
    btnAtzFupClick(qryFollowupPOItem);
  qryPo.Close;
  qryPoItem.Close;
  qryFollowupPO.Close;
  qryFollowupPOItem.Close;
  qryFlpPoItemEtapa.Close;
  vPodeAtualizar := False;
  Action := cafree;
  if str_cd_rotina_atalho = '' then
  begin
    nr_po_gestao         := '';
    cd_cliente_gestao    := '';
    nr_processo_gestao   := '';
    cd_unid_neg_gestao   := '';
  end;
end;

procedure Tfrm_po_flp.msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_cd_produtoClick(nil);
    if Sender = msk_nr_processo then btn_processoClick(nil);
    if Sender = msk_nr_po       then btn_poClick(nil);
  end;
end;

procedure Tfrm_po_flp.btn_cd_unid_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidades',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG',msk_cd_unid_neg.Text,'AP_UNID_NEG');
end;

procedure Tfrm_po_flp.btn_cd_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Nome'],'CD_PRODUTO',nil)
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO',msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure Tfrm_po_flp.btn_processoClick(Sender: TObject);
var vUltimosProcesso: string;
begin
  if chkUltimosProcessos.Checked then
    vUltimosProcesso := '  AND DT_ABERTURA > GETDATE() - '+ IntToStr(vQtdeDiasConsProc)
  else
    vUltimosProcesso := '';

  msk_nr_processo.Text := ConsultaOnLineExSQL(
    'SELECT SUBSTRING(NR_PROCESSO,5,14) NR_PROCESSO, NR_REFERENCIA, '+
    '  (SELECT NM_EMPRESA FROM TEMPRESA_NAC WHERE CD_EMPRESA = CD_CLIENTE) NM_EMPRESA, DT_ABERTURA '+
    'FROM TPROCESSO (NOLOCK) '+
    'WHERE CD_UNID_NEG = '''+ msk_cd_unid_neg.Text +''' '+
    '  AND CD_PRODUTO  = '''+ msk_cd_produto.Text +''' '+
    '  AND ISNULL(NR_REFERENCIA, '''') <> '''' '+ vUltimosProcesso,'Pedidos',
    ['NR_PROCESSO','NR_REFERENCIA','NM_EMPRESA','DT_ABERTURA'],
    ['Processo','Pedido','Cliente','Dt. Abertura'],'NR_PROCESSO',nil);
  msk_nr_processoExit(nil);
end;

procedure Tfrm_po_flp.btn_poClick(Sender: TObject);
var
  vProc: String;
begin
  vProc := ConsultaOnLineExSQL(
    'SELECT NR_REFERENCIA, NR_PROCESSO, '+
    '  (SELECT NM_EMPRESA FROM TEMPRESA_NAC WHERE CD_EMPRESA = CD_CLIENTE) NM_EMPRESA, DT_ABERTURA ' +
    'FROM TPROCESSO (NOLOCK) ' +
    'WHERE CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' '+
    '  AND CD_PRODUTO  = ''' + msk_cd_produto.Text + ''' '+
    '  AND ISNULL(NR_REFERENCIA, '''') <> '''' ', 'Pedidos',
    ['NR_REFERENCIA', 'NR_PROCESSO', 'NM_EMPRESA', 'DT_ABERTURA'],
    ['Pedido', 'Processo', 'Cliente', 'Dt. Abertura'], 'NR_PROCESSO', nil);
  msk_cd_produto.Text := Copy(vProc, 3, 2);
  msk_cd_produtoExit(msk_cd_produto);
  edt_cd_cliente.Text := ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', vProc, 'CD_CLIENTE');
  msk_nr_processo.Text := Trim(Copy(vProc, 5, 14));
  msk_nr_processoExit(nil);
end;

procedure Tfrm_po_flp.msk_nr_processoEnter(Sender: TObject);
begin
  nr_processo := msk_nr_processo.Text;
end;

procedure Tfrm_po_flp.msk_nr_poEnter(Sender: TObject);
begin
  nr_po := msk_nr_po.Text;
end;

procedure Tfrm_po_flp.msk_cd_unid_negExit(Sender: TObject);
begin
  chkRealizaLote.Checked := False;
  ValCodEdt(msk_cd_unid_neg);
  if Trim(edt_nm_unid_neg.Text) = '' then
  begin
    MessageDlg('Unidade não encontrada, sem habilitação ou desativada!',mtError,[mbOK],0);
    msk_cd_unid_neg.SetFocus;
  end
  else
  if Trim(edt_nm_produto.Text) <> '' then
    if not ValidaHabilitacao(msk_cd_unid_neg.Text, msk_cd_produto.Text) then
      msk_cd_unid_neg.SetFocus
    else
      msk_nr_po.SetFocus;
end;

procedure Tfrm_po_flp.msk_cd_produtoExit(Sender: TObject);
begin
  chkRealizaLote.Checked := False;
 {ValCodEdt(msk_cd_produto);
  if Trim(edt_nm_produto.Text) = '' then
  begin
    MessageDlg('Produto não encontrado, sem habilitação ou desativado!',mtError,[mbOK],0);
    msk_cd_produto.SetFocus;
  end
  else
  if Trim(edt_nm_unid_neg.Text) <> '' then
    if not ValidaHabilitacao(msk_cd_unid_neg.Text, msk_cd_produto.Text) then
      msk_cd_produto.SetFocus
    else
      msk_nr_po.SetFocus; }
end;

procedure Tfrm_po_flp.msk_nr_processoExit(Sender: TObject);
begin
  if msk_nr_processo.Text = nr_processo then Exit;

  chkRealizaLote.Checked := False;
  msk_nr_processo.Text := UpperCase(msk_nr_processo.Text);

  msk_nr_po.Clear;
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT NR_REFERENCIA, CD_CLIENTE FROM TPROCESSO (NOLOCK)');
    SQL.Add('WHERE NR_PROCESSO = '''+ msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text +''' ');
    Open;
    msk_nr_po.Text      := Fields[0].AsString;
    edt_cd_cliente.Text := Fields[1].AsString;
    Close;
    Free;
  end;
  in_abrindo := True;
  nr_po := '';
  msk_nr_poExit(nil);
  in_abrindo := False;
end;

procedure Tfrm_po_flp.msk_nr_poExit(Sender: TObject);
begin
  // Incluido por Michel em 13/01/2010 para fechar tudo caso o pedido esteja em branco
  if (msk_nr_po.Text = '') then
  begin
    msk_nr_processo.Text := '';
    edt_cd_cliente.Text  := '';
    pnl_info_pendencias.Visible := False;
    qryPo.Close;
    qryPoItem.Close;
    qryFollowupPO.Close;
    qryFollowupPOItem.Close;
    qryFlpPoItemEtapa.Close;
    Exit;
  end
  else if (msk_nr_po.Text = nr_po) then
    Exit;

  // Incluido por Michel em 13/01/2010 para verificar se o pedido existe para mais de um cliente
  if (not in_abrindo) or (cd_cliente_gestao = '') then
  begin
    if StrToInt(ConsultaLookUPSQL(' SELECT COUNT(*) QTD ' +
                                  ' FROM TPO ' +
                                  ' WHERE NR_PROCESSO = ''' + msk_nr_po.Text + ''' ', 'QTD')) > 1 then
    begin
      edt_cd_cliente.Text := ConsultaOnLineExSQL(' SELECT PO.NR_PROCESSO, PO.CD_EMPRESA, EN.NM_EMPRESA ' +
                                                 ' FROM TPO PO INNER JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = PO.CD_EMPRESA ' +
                                                 ' WHERE PO.NR_PROCESSO = ''' + msk_nr_po.Text + ''' ', 'Selecione o pedido',
                                                 ['NR_PROCESSO', 'CD_EMPRESA', 'NM_EMPRESA'], ['Pedido', 'Cód Cliente', 'Nome Cliente'], 'CD_EMPRESA', nil, edt_cd_cliente.Text);
      if edt_cd_cliente.Text = '' then
      begin
        msk_nr_po.SetFocus;
        Exit;
      end;
    end
    else
      edt_cd_cliente.Text := ConsultaLookUP('TPO', 'NR_PROCESSO', msk_nr_po.Text, 'CD_EMPRESA');
  end;

  Caption := 'Realização de Pedido/Gestão';
  pnlAguarde.Visible := True;
  Application.ProcessMessages;
  edtBuscaEvento.ReadOnly := true;
  rbTipoBuscaComum.Enabled := false;
  rbTipoBuscaEspec.Enabled := false;
  chkRealizaLote.Checked := False;
  msk_nr_po.Text := UpperCase(msk_nr_po.Text);
  msk_nr_processo.Text := '';
  msk_item.Text := '';
  msk_total_item.Text := '000';
  msk_item_cliente.Text := '';
  edtUltimaEtapa.Text := '';
  qryPO.Close;
  qryFollowupPO.Close;
  qryPOItem.Close;
  qryFollowupPOItem.Close;
  qryFlpPoItemEtapa.Close;


  with TQuery.Create(Application) do
  begin
    try
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT NR_PROCESSO, IN_CANCELADO FROM TPROCESSO (NOLOCK) ');
      SQL.Add('WHERE CD_UNID_NEG   = ''' + Trim(msk_cd_unid_neg.Text) + '''');
      SQL.Add('  AND CD_PRODUTO    = ''' + Trim(msk_cd_produto.Text)  + '''');
      SQL.Add('  AND NR_REFERENCIA = ''' + Trim(msk_nr_po.Text)       + '''');
      SQL.Add('  AND CD_CLIENTE    = ''' + Trim(edt_cd_cliente.Text) + '''');
      Open;

      if IsEmpty then
      begin
        pnl_info_pendencias.Visible := False;
        MessageDlg('Processo não encontrado! Informe outro Nr. de Pedido.',mtError,[mbOK],0);
        msk_nr_po.SelectAll;
        msk_nr_po.SetFocus;
      end
      else if Fields[1].AsString = '1' then
      begin
        pnl_info_pendencias.Visible := False;
        MessageDlg('Processo cancelado! Informe outro Nr. de Pedido.',mtError,[mbOK],0);
        msk_nr_po.SelectAll;
        msk_nr_po.SetFocus;
      end
      else
      begin
        msk_nr_processo.Text := Copy(Fields[0].AsString, 5, 10);
        Caption := 'Realização de Pedido/Gestão - ['+msk_nr_po.Text+'/'+msk_nr_processo.Text+']';
        //atribui direitos para incluir etapa
        with datm_main.qry_direito_acesso_ do
        begin
          Close;
          ParamByName('cd_cargo').AsString  := str_cd_cargo;
          ParamByName('cd_modulo').AsString := '01';
          ParamByName('cd_rotina').AsString := '0136';
          Open;
        end;
        edtBuscaEvento.ReadOnly := false;
        rbTipoBuscaComum.Enabled := true;

        //abre tabelas
        qryPO.Close;
        qryPO.ParamByName('NR_PROCESSO').AsString := msk_nr_po.Text;
        qryPO.Open;

        qryPOItem.Close;
        qryPOItem.ParamByName('NR_PROCESSO').AsString := msk_nr_po.Text;
        qryPOItem.Open;

        qryFollowupPO.Close;
        qryFollowupPO.ParamByName('NR_PROCESSO').AsString  := msk_nr_po.Text;
        qryFollowupPO.Open;

        // Adicionado para ir para o item do Link do Followup do Desembaraço - Michel - 15/12/2008 - Ocorrência 06924/08
        qryPoItem.Locate('NR_ITEM_CLIENTE;NR_PARCIAL', VarArrayOf([nr_item_cliente_po, nr_parcial_po]), []);

        with TQuery.Create(application) do
        begin
            Databasename := 'DBBROKER';
            SQL.Clear;
            SQL.Clear;
            SQL.Add('SELECT G.IN_PENDENCIAS');
            SQL.Add(' FROM TPROCESSO P');
            SQL.Add(' INNER JOIN TGRUPO G ON G.CD_GRUPO = P.CD_GRUPO ');
            SQL.Add(' WHERE P.NR_REFERENCIA   = :NR_REFERENCIA');
            SQL.Add(' AND P.CD_CLIENTE      = :CD_EMPRESA');

            ParamByName('NR_REFERENCIA').AsString   := qryFollowupPOItemNR_PROCESSO.AsString;
            ParamByName('CD_EMPRESA').AsString      := qryFollowupPOItemCD_EMPRESA.AsString;
            Open;

            if (FieldByName('IN_PENDENCIAS').AsString = '1') then
            begin
              pnl_info_pendencias.Visible          := True;
              lbl_pendencias4.Visible              := True;
              dbtxt_pendencias_finalizadas.Visible := True;
              lbl_pendencias3.Visible              := True;
              dbtxt_pendencias_solicitadas.Visible := True;
              lbl_pendencias2.Visible              := True;
              lbl_pendencias1.Visible              := True;
              dbtxt_pendencias_total.Visible       := True;
            end
            else
            begin
              pnl_info_pendencias.Visible          := False;
            end;
            Close;
        end;

        if qryPOItem.IsEmpty then
        begin
          msk_item.Text         := '000';
          msk_total_item.Text   := '000';
          dbnav_item_po.Enabled := False;
        end
        else
        begin
          nr_item := 1;
          rbTipoBuscaEspec.Enabled := true;
          btnFollowupEtapa.Enabled := true;
          if qryPOItem.RecordCount = 1 then
          begin
            msk_item.Text         := '001';
            msk_total_item.Text   := '001';
            dbnav_item_po.Enabled := False;
          end
          else
          begin
            msk_item.Text         := '001';
            msk_total_item.Text   := IntToStr(qryPOItem.RecordCount);
            while Length(msk_total_item.Text) < 3 do
            begin
              msk_total_item.Text := '0' + msk_total_item.Text;
            end;
            dbnav_item_po.Enabled := True;
          end;
          // As linhas abaixo foram comentadas porque geravam problema com o Link do Followup do Desembaraço - Michel - 15/12/2008 - Ocorrência 06924/08
          //msk_item_cliente.Text := qryPOItem.FieldByName('NR_ITEM_CLIENTE').AsString;
          //msk_item_clienteExit(nil);
        end;
      end;
      Close;
    finally
      Free;
      pnlAguarde.Visible := false;
      Application.ProcessMessages;
    end;
  end;
end;

procedure Tfrm_po_flp.msk_item_clienteExit(Sender: TObject);
begin
  msk_item_cliente.Text := UpperCase(msk_item_cliente.Text);

  if msk_nr_po.Text <> '' then
  begin
    if qryPOItem.IsEmpty then
    begin
      edtUltimaEtapa.Text := '';
      btnIncluirEtapa.Enabled  := false;
      msk_item_cliente.Color   := clMenu;
      msk_item_cliente.Enabled := False;
      msk_item_cliente.TabStop := False;
      BoxMensagem( 'Item do Processo Cliente não encontrado!', 2 );
    end
    else
    begin
      AtualizaCmbParcial;
      AtualizaGridPoItens;

      qryFlpPoItemEtapa.Close;
      qryFlpPoItemEtapa.ParamByName('NR_PROCESSO').AsString := msk_nr_po.Text;
      qryFlpPoItemEtapa.ParamByName('NR_ITEM').AsString     := msk_item.Text;
      qryFlpPoItemEtapa.Open;

      btnIncluirEtapa.Enabled  := True;
      msk_item_cliente.Color   := clWhite;
      msk_item_cliente.Enabled := True;
      msk_item_cliente.TabStop := True;

      {nr_item := 1;
      qryPoItem.First;
      while not qryPoItem.EOF do begin
        if qryPoItem.FieldByName('NR_ITEM').AsString = msk_item.Text then
          Break
        else
          qryPoItem.Next;
        nr_item := nr_item + 1;
      end;

      msk_item.Text := IntToStr(nr_item);
      while Length(msk_item.Text) < 3 do begin
        msk_item.Text := '0' + msk_item.Text;
      end; }
      msk_item.Text := qryPoItem.FieldByName('NR_ITEM').AsString;
      AtualizaEtapaProcesso;
    end;
  end;
end;

procedure Tfrm_po_flp.dbnav_item_poClick(Sender: TObject; Button: TNavigateBtn);
begin

{  if Button = nbFirst Then nr_item := 1;
  if Button = nbPrior Then begin
    nr_item := nr_item - 1;
    if qryPOItem.BOF then nr_item := 1;
  end;
  if Button = nbNext Then begin
    nr_item := nr_item + 1;
    if qryPOItem.EOF then nr_item := qryPOItem.RecordCount;
  end;
  if Button = nbLast Then nr_item := qryPOItem.RecordCount;

  msk_item_cliente.Text := qryPOItem.FieldByName('NR_ITEM_CLIENTE').AsString;
  msk_item.Text         := qryPOItem.FieldByName('NR_ITEM').AsString;
  while Length(msk_item.Text) < 3 do begin
    msk_item.Text := '0' + msk_item.Text;
  end;
  msk_item_clienteExit(nil);}
end;

procedure Tfrm_po_flp.btn_sairClick(Sender: TObject);
begin
  //sai da tela e limpa variavel da rotina de atalho
  Close;
  str_cd_rotina_atalho := '';
  nr_po_gestao         := '';
  cd_cliente_gestao    := '';
  nr_processo_gestao   := '';
end;

procedure Tfrm_po_flp.btnManutPedidoClick(Sender: TObject);
begin
  str_cd_rotina_atalho := '1801';
  nr_po_gestao         := Trim(msk_nr_po.Text);
  cd_cliente_gestao    := Trim(edt_cd_cliente.Text);
  nr_processo_gestao   := Trim(msk_nr_processo.Text);
  Close;
end;

procedure Tfrm_po_flp.btn_obs_poClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_flp_po_obs, frm_flp_po_obs);
  with frm_flp_po_obs do
  begin
    lbl_nr_po.Caption  := msk_nr_po.Text;
    lbl_evento.Caption := qryFollowupPO.FieldByName('NM_EVENTO').AsString;
    qryAtzObsPO.Close;
    qryAtzObsPO.ParamByName('NR_PROCESSO').AsString := msk_nr_po.Text;
    qryAtzObsPO.ParamByName('CD_EMPRESA').AsString  := edt_cd_cliente.Text;
    qryAtzObsPO.ParamByName('CD_EVENTO').AsString   := qryFollowupPO.FieldByName('CD_EVENTO').AsString;
    qryAtzObsPO.Open;
    ShowModal;
  end;
end;

procedure Tfrm_po_flp.btnGestaoPedidoClick(Sender: TObject);
begin
  str_cd_rotina_atalho := '1820';
  cd_unid_neg_gestao   := Trim(msk_cd_unid_neg.Text);
  nr_po_gestao         := Trim(msk_nr_po.Text);
  cd_cliente_gestao    := Trim(edt_cd_cliente.Text);
  nr_processo_gestao   := Trim(msk_nr_processo.Text);
  Close;
end;

procedure Tfrm_po_flp.btnCancelarEtapaClick(Sender: TObject);
begin
  try
    qryFlpPoItemEtapa.Cancel;
    VerificaCamposTag(frm_po_flp,[pnlEtapa],False);
    //ativa botões atraves dos direitos de usuário
    pnlEtapa.Visible := False;
    pnl_selecao.Enabled := True;
//    dbgrdFup.Enabled := True;
    btnIncluirEtapa.Enabled := True;
    btnFollowupEtapa.Enabled := True;
  except
    Application.MessageBox('Falha ao tentar cancelar a edição dos dados!','Erro',0);
  end;
end;

procedure Tfrm_po_flp.btnSalvarEtapaClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Trim(edtNomeEtapa.Text) = '' then
  begin
    MessageDlg('Status não encontrado ou inválido!',mtError,[mbOK],0);
    dbedtCodigoEtapa.SetFocus;
    Exit;
  end;
  //grava a inclusão de etapa
  if pnlEtapa.Visible then
  begin
    try
      datm_main.db_broker.StartTransaction;
      if dsFlpPoItemEtapa.State in [dsInsert, dsEdit] then
      begin
        qryFlpPoItemEtapaDT_ALTERACAO.AsDateTime := Now;
        qryFlpPoItemEtapa.Post;
        //ativa botões atraves dos direitos de usuário
        pnlEtapa.Visible := False;
        pnl_selecao.Enabled := True;
//        dbgrdFup.Enabled := True;
        btnIncluirEtapa.Enabled := True;
        btnFollowupEtapa.Enabled := True;
        //busca pela ultima etapa do processo
        AtualizaEtapaProcesso;
      end;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if dsFlpPoItemEtapa.State in [dsInsert,dsEdit] then
          qryFlpPoItemEtapa.Cancel;
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;
end;

procedure Tfrm_po_flp.AtualizaEtapaProcesso;
begin
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT TOP 1 E.NM_ETAPA ');
    SQL.Add('FROM TFLP_PO_ITEM_ETAPA F (NOLOCK), TETAPA E(NOLOCK) ');
    SQL.Add('WHERE F.NR_PROCESSO = '''+ qryPOItem.FieldByName('NR_PROCESSO').AsString +''' ');
    SQL.Add('  AND F.CD_EMPRESA = ''' + qryPoItemCD_EMPRESA.AsString + '''');
    SQL.Add('  AND F.NR_ITEM     = '''+ qryPOItem.FieldByName('NR_ITEM').AsString +''' ');
    SQL.Add('  AND F.CD_ETAPA = E.CD_ETAPA ');
    SQL.Add('ORDER BY F.CD_FLP_PO_ITEM_ETAPA DESC ');
    Open;
    edtUltimaEtapa.Text := FieldByName('NM_ETAPA').AsString;
    Close;
    Free;
  end;
end;

procedure Tfrm_po_flp.btnIncluirEtapaClick(Sender: TObject);
begin
  pnlEtapa.Visible := True;
  qryFlpPoItemEtapa.Close;
  qryFlpPoItemEtapa.ParamByName('NR_PROCESSO').AsString := qryPOItem.FieldByName('NR_PROCESSO').AsString;
  qryFlpPoItemEtapa.ParamByName('CD_EMPRESA').AsString  := qryPOItem.FieldByName('CD_EMPRESA').AsString;
  qryFlpPoItemEtapa.ParamByName('NR_ITEM').AsString     := qryPOItem.FieldByName('NR_ITEM').AsString;
  qryFlpPoItemEtapa.Open;
  qryFlpPoItemEtapa.Insert;
  qryFlpPoItemEtapaNR_PROCESSO.AsString := qryPOItem.FieldByName('NR_PROCESSO').AsString;
  qryFlpPoItemEtapaCD_EMPRESA.AsString  := qryPOItem.FieldByName('CD_EMPRESA').AsString;
  qryFlpPoItemEtapaNR_ITEM.AsString     := qryPOItem.FieldByName('NR_ITEM').AsString;
  qryFlpPoItemEtapaCD_USUARIO.AsString  := str_cd_usuario;
  qryFlpPoItemEtapaCD_FLP_PO_ITEM_ETAPA.AsInteger := StrToIntDef(ConsultaLookupSQL('SELECT (ISNULL(MAX(CD_FLP_PO_ITEM_ETAPA),0) + 1) AS BLA FROM TFLP_PO_ITEM_ETAPA WHERE NR_PROCESSO = ''' + qryPOItem.FieldByName('NR_PROCESSO').AsString + ''' AND NR_ITEM = ''' + qryPOItem.FieldByName('NR_ITEM').AsString + '''','BLA'),1);
  pnl_selecao.Enabled := False;
//  dbgrdFup.Enabled := False;
  btnIncluirEtapa.Enabled := False;
  btnFollowupEtapa.Enabled := False;
  dbedtCodigoEtapa.SetFocus;
end;

procedure Tfrm_po_flp.btnFollowupEtapaClick(Sender: TObject);
begin
  vStr_cd_modulo := '01';
  str_cd_rotina := '0136';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(TfrmFollowUpEtapa, frmFollowUpEtapa);
  frmFollowUpEtapa.vTipoProcesso := tpPedido;
  frmFollowUpEtapa.vUnidade := msk_cd_unid_neg.text;
  frmFollowUpEtapa.vProduto := msk_cd_produto.text;
  frmFollowUpEtapa.ShowModal;
  AtualizaEtapaProcesso;
end;

procedure Tfrm_po_flp.btnConsultaEtapaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qryFlpPoItemEtapa) then Exit;
    qryFlpPoItemEtapaCD_ETAPA.AsString := ConsultaOnLineExSQL(
      'SELECT CD_ETAPA, NM_ETAPA '+
      'FROM TETAPA (NOLOCK) '+
      'WHERE (CD_UNID_NEG = '''+ msk_cd_unid_neg.Text +''' OR CD_UNID_NEG IS NULL) '+
      '  AND (CD_PRODUTO  = '''+ msk_cd_produto.Text +''' OR CD_PRODUTO  IS NULL) '+
      '  AND (CD_EVENTO  IN (SELECT SE.CD_EVENTO '+
      '                      FROM TSERVICO_EVENTO SE (NOLOCK), TEVENTO E (NOLOCK) '+
      '                      WHERE SE.CD_SERVICO = '''+ dbedt_cd_servico.Text +''' '+
      '                        AND SE.CD_EVENTO = E.CD_EVENTO '+
      '                        AND ISNULL(E.IN_ATIVO,''1'') = ''1'') '+
      '       OR CD_EVENTO IS NULL)',
      'Status do Processo',['CD_ETAPA','NM_ETAPA'],['Código','Nome'],'CD_ETAPA',nil);
  end
  else
    edtNomeEtapa.Text := ConsultaLookUPSQL(
      'SELECT CD_ETAPA, NM_ETAPA '+
      'FROM TETAPA (NOLOCK) '+
      'WHERE CD_ETAPA = '''+ dbedtCodigoEtapa.Text +''' '+
      '  AND (CD_UNID_NEG = '''+ msk_cd_unid_neg.Text +''' OR CD_UNID_NEG IS NULL) '+
      '  AND (CD_PRODUTO  = '''+ msk_cd_produto.Text +''' OR CD_PRODUTO  IS NULL) '+
      '  AND (CD_EVENTO  IN (SELECT SE.CD_EVENTO '+
      '                      FROM TSERVICO_EVENTO SE (NOLOCK), TEVENTO E (NOLOCK) '+
      '                      WHERE SE.CD_SERVICO = '''+ dbedt_cd_servico.Text +''' '+
      '                        AND SE.CD_EVENTO = E.CD_EVENTO '+
      '                        AND ISNULL(E.IN_ATIVO,''1'') = ''1'') '+
      '       OR CD_EVENTO IS NULL)','NM_ETAPA');
end;

procedure Tfrm_po_flp.rbTipoBuscaComumClick(Sender: TObject);
begin
  edtBuscaEvento.Text := '';
  if not rbTipoBuscaComum.Checked then
  begin
    rbTipoBuscaEspec.Checked := false;
    rbTipoBuscaComum.Checked := true;
  end;
end;

procedure Tfrm_po_flp.rbTipoBuscaEspecClick(Sender: TObject);
begin
  edtBuscaEvento.Text := '';
  if not rbTipoBuscaEspec.Checked then
  begin
    rbTipoBuscaEspec.Checked := true;
    rbTipoBuscaComum.Checked := false;
  end;
end;

procedure Tfrm_po_flp.edtBuscaEventoChange(Sender: TObject);
begin
  if rbTipoBuscaComum.Checked then
  begin
    //localiza os eventos comuns
    Localiza( qryFollowupPO, edtBuscaEvento.Text, 'NM_EVENTO' );
  end
  else if rbTipoBuscaEspec.Checked then
  begin
    //localiza os eventos especificos
    Localiza( qryFollowupPOItem, edtBuscaEvento.Text, 'NM_EVENTO' );
  end;
end;

procedure Tfrm_po_flp.dbgrdEventoComumDblClick(Sender: TObject);
begin
  try
    vPodeAtualizar := false;
    if dbgrdEventoComum.ReadOnly then Exit;
    qryFollowupPO.DisableControls;
    {if ( qryFollowUp.FieldByName('IN_BLOQUEADO').AsString = '1' ) then
    begin
      BoxMensagem('Este evento esta bloqueado. Não é possível a alteração manual de seus dados.',2);
      Exit;
    end;
    if ( EventoAutomatico(Copy(qryFollowUp.FieldByName('NR_PROCESSO').AsString,3,2),qryFollowUp.FieldByName('CD_EVENTO').AsString,Copy(qryFollowUp.FieldByName('NR_PROCESSO').AsString,5,2) ) ) then
    begin
      BoxMensagem('Este evento é automaticamente migrado para o FollowUp. Não é possível a alteração manual de seus dados.',2);
      Exit;
    end;}
    // Verificação de evento automático - Michel - 20/09/2011
    if EventoAutomatico(qryFollowupPOCD_EVENTO.AsString) then
    begin
      MessageDlg('Este evento é de preenchimento automático.'#13'Não é possível a alteração manual de seus dados.', mtInformation, [mbOk], 0);
      Exit;
    end;
    if (dbgrdEventoComum.SelectedField.FieldName = 'DT_REALIZACAO') or (dbgrdEventoComum.SelectedField.FieldName = 'IN_APLICAVEL') then begin
      {if (dbgrdEventoComum.SelectedField.FieldName = 'DT_REALIZACAO')    and
         (qryFollowUp.FieldByName('CD_EVENTO').AsString = '289') and
         (not PreencheuDadosObrigatorios(qryFollowUp.FieldByName('NR_PROCESSO').AsString)) then Exit;}
      pnlAguarde.Visible := True;
      Application.ProcessMessages;
      with TQuery.Create(application) do
      begin
        Databasename := 'DBBROKER';
        SQL.Clear;
        if dbgrdEventoComum.SelectedField.FieldName = 'DT_REALIZACAO' then
        begin
          if qryFollowupPO.FieldByName('IN_APLICAVEL').AsString = 'ü' then
          begin
            SQL.Add('UPDATE TFLP_PO SET');
            SQL.Add('  DT_REALIZACAO = CONVERT(DATETIME,CONVERT(VARCHAR,GETDATE(),103),103),');
          end
          else BoxMensagem('Este evento esta marcado como não aplicável, você não pode alterar a data de realização.',2);
        end
        else if dbgrdEventoComum.SelectedField.FieldName = 'IN_APLICAVEL' then
        begin
          SQL.Add('UPDATE TFLP_PO SET');
          if qryFollowupPO.FieldByName('IN_APLICAVEL').AsString = 'ü' then
            SQL.Add('  IN_APLICAVEL = ''0'',')
          else
            SQL.Add('  IN_APLICAVEL = ''1'',');
        end;
        if SQL.Text <> '' then
        begin
          SQL.Add('  CD_RESP_REALIZACAO = ''' + str_cd_usuario + '''');
          SQL.Add('WHERE NR_PROCESSO = ''' + qryFollowupPO.FieldByName('NR_PROCESSO').AsString + '''');
          SQL.Add('  AND CD_EMPRESA = ''' + qryFollowupPOCD_EMPRESA.AsString + '''');
          SQL.Add('  AND CD_EVENTO   = ''' + qryFollowupPO.FieldByName('CD_EVENTO').AsString + '''');
          ExecSQL;
          vStrEvento := qryFollowupPO.FieldByName('CD_EVENTO').AsString;
          qryFollowupPO.Close;
          qryFollowupPO.Open;
          qryFollowupPO.Locate('CD_EVENTO',vStrEvento,[]);
        end;
        Free;
      end;
      pnlAguarde.Visible := False;
      Application.ProcessMessages;
    end;
  finally
    qryFollowupPO.EnableControls;
    vPodeAtualizar := True;
    vAlterouPO := PrecisaAtualizar(vStrEvento);
    AtualizaEtapaProcesso;
  end;
end;

procedure Tfrm_po_flp.dbgrdEventoComumDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if TDBGrid(Sender).DataSource.DataSet.FieldByName('IN_APLICAVEL').AsString = '' then
  begin
    TDBGrid(Sender).Canvas.Font.Color := $00C1C1C1;
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := $00EFEFEF;
  end;
  if TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_EVENTO').AsString = '022' then
  begin
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := $00E9E9FE;
  end;
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tfrm_po_flp.dbgrdEventoComumDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  {if Copy(TDBGrid(Sender).DataSource.DataSet.FieldByName('calcAtraso').AsString,1,1) = '+' then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := clBlue;
  end else begin
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := clRed;
  end;
  TDBGrid(Sender).DefaultDrawDataCell(Rect, Field, State);}
end;

procedure Tfrm_po_flp.dbgrdEventoEspecDblClick(Sender: TObject);
begin
  try
    vPodeAtualizar := False;
    // Verificação de evento automático - Michel - 20/09/2011
    if EventoAutomatico(qryFollowupPOItemCD_EVENTO.AsString) then
    begin
      MessageDlg('Este evento é de preenchimento automático.'#13'Não é possível a alteração manual de seus dados.', mtInformation, [mbOk], 0);
      Exit;
    end;
    if dbgrdEventoEspec.ReadOnly then Exit;
    qryPOItem.DisableControls;
    qryFollowupPOItem.DisableControls;
    {if ( qryFollowupPOItem.FieldByName('IN_BLOQUEADO').AsString = '1' ) then
    begin
      BoxMensagem('Este evento esta bloqueado. Não é possível a alteração manual de seus dados.',2);
      Exit;
    end;
    if ( EventoAutomatico(Copy(qryFollowupPOItem.FieldByName('NR_PROCESSO').AsString,3,2),qryFollowupPOItem.FieldByName('CD_EVENTO').AsString,Copy(qryFollowupPOItem.FieldByName('NR_PROCESSO').AsString,5,2) ) ) then
    begin
      BoxMensagem('Este evento é automaticamente migrado para o FollowUp. Não é possível a alteração manual de seus dados.',2);
      Exit;
    end;}
    if (dbgrdEventoEspec.SelectedField.FieldName = 'DT_REALIZACAO') or (dbgrdEventoEspec.SelectedField.FieldName = 'IN_APLICAVEL') then begin
      {if (dbgrdEventoComum.SelectedField.FieldName = 'DT_REALIZACAO')    and
         (qryFollowupPOItem.FieldByName('CD_EVENTO').AsString = '289') and
         (not PreencheuDadosObrigatorios(qryFollowupPOItem.FieldByName('NR_PROCESSO').AsString)) then Exit;}
      pnlAguarde.Visible := True;
      Application.ProcessMessages;
      with TQuery.Create(application) do
      begin
        Databasename := 'DBBROKER';
        SQL.Clear;
        if dbgrdEventoEspec.SelectedField.FieldName = 'DT_REALIZACAO' then
        begin
          if qryFollowupPOItem.FieldByName('IN_APLICAVEL').AsString = 'ü' then
          begin
            SQL.Add('UPDATE TFLP_PO_ITEM SET');
            SQL.Add('DT_REALIZACAO = CONVERT(DATETIME,CONVERT(VARCHAR,GETDATE(),103),103),');
          end
          else
            BoxMensagem('Este evento esta marcado como não aplicável, você não pode alterar a data de realização.',2);
        end
        else if dbgrdEventoEspec.SelectedField.FieldName = 'IN_APLICAVEL' then
        begin
          SQL.Add('UPDATE TFLP_PO_ITEM SET');
          if qryFollowupPOItem.FieldByName('IN_APLICAVEL').AsString = 'ü' then
            SQL.Add('  IN_APLICAVEL = ''0'',')
          else
            SQL.Add('  IN_APLICAVEL = ''1'',');
        end;
        if SQL.Text <> '' then
        begin
          SQL.Add('  CD_RESP_REALIZACAO = '''+str_cd_usuario+'''');
          SQL.Add('WHERE NR_PROCESSO = '''+qryFollowupPOItem.FieldByName('NR_PROCESSO').AsString+'''');
          SQL.Add('  AND CD_EMPRESA = ''' + qryFollowupPOItemCD_EMPRESA.AsString + '''');
          if chkRealizaLote.checked then
            vAlterouLote := true
          else
          begin
            SQL.Add('  AND NR_ITEM     = '''+qryFollowupPOItem.FieldByName('NR_ITEM').AsString+'''')
            //ItemAlterado(qryFollowupPOItem.FieldByName('NR_ITEM').AsString);
          end;
          SQL.Add('  AND CD_EVENTO   = '''+qryFollowupPOItem.FieldByName('CD_EVENTO').AsString+'''');
          ExecSQL;
          vStrEvento := qryFollowupPOItem.FieldByName('CD_EVENTO').AsString;
          qryFollowupPOItem.Close;
          qryFollowupPOItem.Open;
          qryFollowupPOItem.Locate('CD_EVENTO',vStrEvento,[]);
        end;
        Free;
      end;
      pnlAguarde.Visible := False;
      Application.ProcessMessages;
    end;
  finally
    qryPOItem.EnableControls;
    qryFollowupPOItem.EnableControls;
    vPodeAtualizar := True;
    vAlterouItem   := PrecisaAtualizar(vStrEvento);
    AtualizaEtapaProcesso;
  end;
end;

procedure Tfrm_po_flp.dbgrdEventoEspecDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (TDBGrid(Sender).DataSource.DataSet.FieldByName('QT_DISP').AsString = '0') and
     (CmbParciais.Text = 'S') then
  begin
    TDBGrid(Sender).Canvas.Font.Color := $00C1C1C1;
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := $00EFEFEF;
    TDBGrid(Sender).ReadOnly           := True;
  end
  {else
    TDBGrid(Sender).ReadOnly             := False}; // Comentado por Michel, pois estava prejudicando o afterscroll para bloquear evento automático

  if TDBGrid(Sender).DataSource.DataSet.FieldByName('IN_APLICAVEL').AsString = '' then
  begin
    TDBGrid(Sender).Canvas.Font.Color    := $00C1C1C1;
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color   := $00EFEFEF;
  end;
  if TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_EVENTO').AsString = '022' then
  begin
    TDBGrid(Sender).Canvas.Font.Color    := clBlack;
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color   := $00E9E9FE;
  end;
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tfrm_po_flp.dbgrdEventoEspecDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  {if Copy(TDBGrid(Sender).DataSource.DataSet.FieldByName('calcAtraso').AsString,1,1) = '+' then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := clBlue;
  end else begin
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := clRed;
  end;
  TDBGrid(Sender).DefaultDrawDataCell(Rect, Field, State);}
end;

procedure Tfrm_po_flp.dbgrdEventoEspecKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // Inserido para não permitir exclusão de registro - Michel - 23/08/2010
  if (Key in [VK_DELETE]) and (ssCtrl in Shift) then
    Abort;

  if Key in [VK_RETURN, VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_ESCAPE] then
    Exit;
  // Verifica evento automático, tanto para o grid do pedido como para o grid dos itens - Michel - 20/09/2011
  if EventoAutomatico(TDbGrid(Sender).DataSource.DataSet.FieldByName('CD_EVENTO').AsString) then
  begin
    TDbGrid(Sender).DataSource.DataSet.Cancel;
    MessageDlg('Este evento é de preenchimento automático.'#13'Não é possível a alteração manual de seus dados.', mtInformation, [mbOk], 0);
    Exit;
  end;
end;

procedure Tfrm_po_flp.btnAtzFupClick(Sender: TObject);
var
  cItem : string[3];
  x : integer;
begin
  pnlAguarde.Visible := True;
  pnlAguarde.Caption := '        calculando previsões...';
  Application.ProcessMessages;
  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      {if vAlterouPO then
      begin
        SQL.Clear;
        SQL.Add('exec SP_ATZ_FLP_PO ''' + msk_nr_po.Text + '''');
        ExecSQL;
      end;}
      if vAlterouItem then
      begin
        cItem := qryPoItemNR_ITEM.AsString;
        if vAlterouLote then
        begin
          qryPoItem.First;
          while not qryPoItem.Eof do
          begin
            SQL.Clear;
            SQL.Add('exec SP_ATZ_FLP_PO_ITEM ''' + msk_nr_po.Text + ''', ''' + edt_cd_cliente.Text + ''', ''' + qryPoItemNR_ITEM.AsString + '''');
            ExecSQL;
            qryPoItem.Next;
          end;
        end
        else
        begin
          for x := Low(aItens) to High(aItens) do
          begin
            SQL.Clear;
            SQL.Add('exec SP_ATZ_FLP_PO_ITEM ''' + msk_nr_po.Text + ''', ''' + edt_cd_cliente.Text + ''', ''' + aItens[x] + '''');
            ExecSQL;
          end;
        end;
        qryPoItem.Locate('NR_ITEM', cItem, [loCaseInsensitive]);
      end;
    finally
      Free;
      vPodeAtualizar := False;
      Application.ProcessMessages;
      pnlAguarde.Visible := False;
      pnlAguarde.Caption := '        aguarde processamento...';
      if vAlterouPO then
      begin //move para o evento da po
        vStrEvento := qryFollowupPO.FieldByName('CD_EVENTO').AsString;
        qryFollowupPO.Close;
        qryFollowupPO.Prepare;
        qryFollowupPO.Open;
        qryFollowupPO.Locate('CD_EVENTO',vStrEvento,[]);
      end;
      if vAlterouItem then
      begin //move para o evento do item da po
        vStrEvento := qryFollowupPOItem.FieldByName('CD_EVENTO').AsString;
        qryFollowupPOItem.Close;
        qryFollowupPOItem.Prepare;
        qryFollowupPOItem.Open;
        qryFollowupPOItem.Locate('CD_EVENTO',vStrEvento,[]);
      end;
      vPodeAtualizar := True;
    end;
  end;
  vAlterouPO   := False;
  vAlterouItem := false;
end;

procedure Tfrm_po_flp.qryFollowupPOAfterClose(DataSet: TDataSet);
begin
  btnAtzFup.Enabled := False;
end;

procedure Tfrm_po_flp.qryFollowupPOAfterDelete(DataSet: TDataSet);
begin
  qryFollowupPO.ApplyUpdates;
end;

procedure Tfrm_po_flp.qryFollowupPOAfterEdit(DataSet: TDataSet);
begin
  if qryFollowupPO.FieldByName('IN_APLICAVEL').AsString = '' then
  begin
    BoxMensagem('Este evento esta marcado como não aplicável, você não pode alterar a data de realização.',2);
    qryFollowupPO.Cancel;
  end
  else
    qryFollowupPO.FieldByName('CD_RESP_REALIZACAO').AsString := str_cd_usuario;
end;

procedure Tfrm_po_flp.qryFollowupPOAfterOpen(DataSet: TDataSet);
begin
  btnAtzFup.Enabled := (not qryFollowupPO.IsEmpty);
  vAlterouPO := False;
end;

procedure Tfrm_po_flp.qryFollowupPOAfterPost(DataSet: TDataSet);
begin
  vPodeAtualizar := False;
  pnlAguarde.Visible := True;
  Application.ProcessMessages;
  qryFollowupPO.ApplyUpdates;
  vCdEvento := qryFollowupPO.FieldByName('CD_EVENTO').AsString;
  qryFollowupPO.Close;
  qryFollowupPO.Open;
  qryFollowupPO.Locate('CD_EVENTO', vCdEvento, []);
  pnlAguarde.Visible := False;
  Application.ProcessMessages;
  vAlterouPO := PrecisaAtualizar(vCdEvento);
  vPodeAtualizar := True;
  AtualizaEtapaProcesso;
end;

procedure Tfrm_po_flp.qryFollowupPOAfterScroll(DataSet: TDataSet);
begin
  btn_obs_po.Enabled := (qryFollowupPO.FieldByName('CD_EVENTO').AsString = '022');
  //vEventoProibido := False;
  dbgrdEventoComum.ReadOnly := EventoAutomatico(qryFollowupPOCD_EVENTO.AsString);
end;

procedure Tfrm_po_flp.qryFollowupPOBeforeClose(DataSet: TDataSet);
begin
  if vPodeAtualizar and vAlterouPO then btnAtzFupClick(qryFollowupPO);
end;

procedure Tfrm_po_flp.qryFollowupPOBeforePost(DataSet: TDataSet);
begin
  qryFollowupPO.FieldByName('CD_RESP_REALIZACAO').AsString := str_cd_usuario;
end;

procedure Tfrm_po_flp.qryFollowupPOCalcFields(DataSet: TDataSet);
begin
  if qryFollowupPO.FieldByName('IN_APLICAVEL').AsString = '' then Exit;
{  if ( qryFollowupPO.FieldByName('DT_REALIZACAO').AsDateTime = 0 ) and ( qryFollowupPO.FieldByName('DT_PREVISTA').AsDateTime > 0 ) then
  begin
    if Now > qryFollowupPO.FieldByName('DT_PREVISTA').AsDateTime then
      qryFollowupPO.FieldByName('calcAtraso').AsString := '+' + IntToStr(DaysBetween(now, qryFollowupPO.FieldByName('DT_PREVISTA').AsDateTime ))
    else if now < qryFollowupPO.FieldByName('DT_PREVISTA').AsDateTime then
      qryFollowupPO.FieldByName('calcAtraso').AsString := '-' + IntToStr(DaysBetween(now, qryFollowupPO.FieldByName('DT_PREVISTA').AsDateTime ))
    else qryFollowupPO.FieldByName('calcAtraso').AsString := '0';
  end else if ( qryFollowupPO.FieldByName('DT_REALIZACAO').AsDateTime > 0 ) and ( qryFollowupPO.FieldByName('DT_PREVISTA').AsDateTime > 0 ) then
  begin
    if qryFollowupPO.FieldByName('DT_REALIZACAO').AsDateTime > qryFollowupPO.FieldByName('DT_PREVISTA').AsDateTime then
      qryFollowupPO.FieldByName('calcAtraso').AsString := '+' + IntToStr(DaysBetween(qryFollowupPO.FieldByName('DT_REALIZACAO').AsDateTime, qryFollowupPO.FieldByName('DT_PREVISTA').AsDateTime ))
    else if qryFollowupPO.FieldByName('DT_REALIZACAO').AsDateTime < qryFollowupPO.FieldByName('DT_PREVISTA').AsDateTime then
      qryFollowupPO.FieldByName('calcAtraso').AsString := '-' + IntToStr(DaysBetween(qryFollowupPO.FieldByName('DT_REALIZACAO').AsDateTime, qryFollowupPO.FieldByName('DT_PREVISTA').AsDateTime ))
    else qryFollowupPO.FieldByName('calcAtraso').AsString := '0';
  end;}
end;

procedure Tfrm_po_flp.qryFollowupPOItemAfterClose(DataSet: TDataSet);
begin
  btnAtzFup.Enabled := False;
end;

procedure Tfrm_po_flp.qryFollowupPOItemAfterDelete(DataSet: TDataSet);
begin
  qryFollowupPOItem.ApplyUpdates;
end;

procedure Tfrm_po_flp.qryFollowupPOItemAfterEdit(DataSet: TDataSet);
begin
  if qryFollowupPOItem.FieldByName('IN_APLICAVEL').AsString = '' then
  begin
    BoxMensagem('Este evento esta marcado como não aplicável, você não pode alterar a data de realização.',2);
    qryFollowupPOItem.Cancel;
  end
  else
    qryFollowupPOItem.FieldByName('CD_RESP_REALIZACAO').AsString := str_cd_usuario;
end;

procedure Tfrm_po_flp.qryFollowupPOItemAfterOpen(DataSet: TDataSet);
begin
  btnAtzFup.Enabled := (not qryFollowupPOItem.IsEmpty);
  vAlterouItem := False;
  qryPendencias.Close;
  qryPendencias.ParamByName('NR_PROCESSO').AsString := 'X';
  qryPendencias.ParamByName('NR_REFERENCIA').AsString := qryFollowupPOItemNR_PROCESSO.AsString;
  qryPendencias.ParamByName('CD_EMPRESA').AsString  := qryFollowupPOItemCD_EMPRESA.AsString;
  qryPendencias.ParamByName('NR_ITEM_CLIENTE').AsString := qryFollowupPOItemNR_ITEM_CLIENTE.AsString;
  qryPendencias.ParamByName('NR_PARCIAL').AsInteger := qryFollowupPOItemNR_PARCIAL.AsInteger;
  qryPendencias.Open;
end;

procedure Tfrm_po_flp.qryFollowupPOItemAfterPost(DataSet: TDataSet);
var
  vDtRealizado : string;
begin
  vPodeAtualizar := False;
  pnlAguarde.Visible := True;
  Application.ProcessMessages;
  qryFollowupPOItem.ApplyUpdates;
  vCdEvento := qryFollowupPOItem.FieldByName('CD_EVENTO').AsString;
  vDtRealizado := qryFollowupPOItem.FieldByName('DT_REALIZACAO').AsString;
  if chkRealizaLote.checked then
  begin
    vAlterouLote := true;
    with TQuery.Create(Application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('UPDATE TFLP_PO_ITEM SET');
      if vDtRealizado = '' then
        SQL.Add('  DT_REALIZACAO = NULL,')
      else
        SQL.Add('  DT_REALIZACAO = CONVERT(datetime,'''+vDtRealizado+''',103),');
      SQL.Add('  CD_RESP_REALIZACAO = '''+str_cd_usuario+''',');
      SQL.Add('  IN_APLICAVEL = ''1''');
      SQL.Add('WHERE NR_PROCESSO = ''' + msk_nr_po.Text + ''' AND CD_EMPRESA = ''' + edt_cd_cliente.Text + ''' AND CD_EVENTO = ''' + vCdEvento + '''');
      ExecSQL;
      Free;
    end;
  end;
//  else
//    ItemAlterado(qryFollowupPOItem.FieldByName('NR_ITEM').AsString);

  qryFollowupPOItem.Close;
  qryFollowupPOItem.Open;
  qryFollowupPOItem.Locate('CD_EVENTO', vCdEvento, []);
  pnlAguarde.Visible := False;
  Application.ProcessMessages;
  vAlterouItem := PrecisaAtualizar(vCdEvento);
  vPodeAtualizar := True;
  AtualizaEtapaProcesso;
end;

procedure Tfrm_po_flp.qryFollowupPOItemAfterScroll(DataSet: TDataSet);
begin
  //btn_obs_po.Enabled := (qryFollowupPOItem.FieldByName('CD_EVENTO').AsString = '022');
  //vEventoProibido := False;
  dbgrdEventoEspec.ReadOnly := EventoAutomatico(qryFollowupPOItemCD_EVENTO.AsString);
end;

procedure Tfrm_po_flp.qryFollowupPOItemBeforeClose(DataSet: TDataSet);
begin
  //if vPodeAtualizar and vAlterouItem then btnAtzFupClick(qryFollowupPOItem);
end;

procedure Tfrm_po_flp.qryFollowupPOItemBeforePost(DataSet: TDataSet);
begin
  qryFollowupPOItem.FieldByName('CD_RESP_REALIZACAO').AsString := str_cd_usuario;
end;

procedure Tfrm_po_flp.qryFollowupPOItemCalcFields(DataSet: TDataSet);
begin
  if qryFollowupPOItem.FieldByName('IN_APLICAVEL').AsString = '' then Exit;
{  if ( qryFollowupPOItem.FieldByName('DT_REALIZACAO').AsDateTime = 0 ) and ( qryFollowupPOItem.FieldByName('DT_PREVISTA').AsDateTime > 0 ) then
  begin
    if Now > qryFollowupPOItem.FieldByName('DT_PREVISTA').AsDateTime then
      qryFollowupPOItem.FieldByName('calcAtraso').AsString := '+' + IntToStr(DaysBetween(now, qryFollowupPOItem.FieldByName('DT_PREVISTA').AsDateTime ))
    else if now < qryFollowupPOItem.FieldByName('DT_PREVISTA').AsDateTime then
      qryFollowupPOItem.FieldByName('calcAtraso').AsString := '-' + IntToStr(DaysBetween(now, qryFollowupPOItem.FieldByName('DT_PREVISTA').AsDateTime ))
    else qryFollowupPOItem.FieldByName('calcAtraso').AsString := '0';
  end else if ( qryFollowupPOItem.FieldByName('DT_REALIZACAO').AsDateTime > 0 ) and ( qryFollowupPOItem.FieldByName('DT_PREVISTA').AsDateTime > 0 ) then
  begin
    if qryFollowupPOItem.FieldByName('DT_REALIZACAO').AsDateTime > qryFollowupPOItem.FieldByName('DT_PREVISTA').AsDateTime then
      qryFollowupPOItem.FieldByName('calcAtraso').AsString := '+' + IntToStr(DaysBetween(qryFollowupPOItem.FieldByName('DT_REALIZACAO').AsDateTime, qryFollowupPOItem.FieldByName('DT_PREVISTA').AsDateTime ))
    else if qryFollowupPOItem.FieldByName('DT_REALIZACAO').AsDateTime < qryFollowupPOItem.FieldByName('DT_PREVISTA').AsDateTime then
      qryFollowupPOItem.FieldByName('calcAtraso').AsString := '-' + IntToStr(DaysBetween(qryFollowupPOItem.FieldByName('DT_REALIZACAO').AsDateTime, qryFollowupPOItem.FieldByName('DT_PREVISTA').AsDateTime ))
    else qryFollowupPOItem.FieldByName('calcAtraso').AsString := '0';
  end;}
end;

procedure Tfrm_po_flp.qryFollowupPODT_REALIZACAOSetText(Sender: TField; const Text: String);
begin
  if Text = '  /  /    ' then
    Sender.AsVariant := null
  else
    ValidaData(Text,Sender);
end;

procedure Tfrm_po_flp.qryFollowupPOItemDT_REALIZACAOSetText(Sender: TField; const Text: String);
begin
  if Text = '  /  /    ' then
    Sender.AsVariant := null
  else
    ValidaData(Text,Sender);
end;

procedure Tfrm_po_flp.qryFlpPoItemEtapaAfterDelete(DataSet: TDataSet);
begin
  qryFlpPoItemEtapa.ApplyUpdates;
end;

procedure Tfrm_po_flp.qryFlpPoItemEtapaAfterPost(DataSet: TDataSet);
begin
  qryFlpPoItemEtapa.ApplyUpdates;
end;

procedure Tfrm_po_flp.AtualizaGridPoItens;
begin
  qryFollowupPOItem.Close;
  qryFollowupPOItem.ParamByName('NR_PROCESSO').AsString     := msk_nr_po.Text;
  qryFollowupPOItem.ParamByName('CD_EMPRESA').AsString      := edt_cd_cliente.Text;
  qryFollowupPOItem.ParamByName('NR_ITEM_CLIENTE').AsString := msk_item_cliente.Text;
  if CmbParciais.ItemIndex = 0 then  //S = Saldo
    qryFollowupPOItem.ParamByName('NR_PARCIAL').AsInteger  := CmbParciais.ItemIndex
  else
    qryFollowupPOItem.ParamByName('NR_PARCIAL').AsString  := CmbParciais.Text;
  qryFollowupPOItem.Open;

  if qryFollowupPOItem.IsEmpty then
    BoxMensagem( 'Item do Processo Cliente não encontrado!', 2 );

//Atualiza campo NR_PROCESSO_DES
  with TQuery.Create(Application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT NR_PROCESSO_DES FROM TESTAGIO_PROCESSO');
      SQL.Add('where');
      SQL.Add('  NR_REFERENCIA =:NR_REFERENCIA AND ');
      SQL.Add('  CD_EMPRESA = :CD_EMPRESA AND');
      SQL.Add('  NR_ITEM_CLIENTE =:NR_ITEM_CLIENTE AND');
      SQL.Add('  NR_PARCIAL =:NR_PARCIAL');
      ParamByName('NR_REFERENCIA').AsString   := msk_nr_po.Text;
      ParamByName('NR_ITEM_CLIENTE').AsString := msk_item_cliente.Text;
      ParamByName('CD_EMPRESA').AsString      := qryPoItemCD_EMPRESA.AsString;

      if CmbParciais.ItemIndex = 0 then  //S = Saldo
        ParamByName('NR_PARCIAL').AsInteger      := 0
      else
        ParamByName('NR_PARCIAL').AsString      :=  CmbParciais.Text;

      Open;
      EditNR_PROCESSO_DES.Text := Copy(FieldByName('NR_PROCESSO_DES').AsString,5,13);
      Close;
    finally
      Free;
    end;
  end;
end;

procedure Tfrm_po_flp.CmbParciaisChange(Sender: TObject);
begin
  AtualizaGridPoItens;
end;

procedure Tfrm_po_flp.AtualizaCmbParcial;
begin
 //Atualiza Combo de Parciais
  with TQuery.Create(Application) do
  begin
    CmbParciais.Items.Clear;
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT NR_PARCIAL FROM TPO_ITEM');
      SQL.Add('where');
      SQL.Add('  NR_PROCESSO = :NR_PROCESSO AND ');
      SQL.Add('  CD_EMPRESA = :CD_EMPRESA AND');
      SQL.Add('  NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE');
      SQL.Add('Order by NR_PARCIAL');
      ParamByName('NR_PROCESSO').AsString     := msk_nr_po.Text;
      ParamByName('CD_EMPRESA').AsString      := edt_cd_cliente.Text;
      ParamByName('NR_ITEM_CLIENTE').AsString := qryPoItem.FieldByName('NR_ITEM_CLIENTE').AsString; //msk_item_cliente.Text;

      Open;
      while not Eof do
      begin
        if FieldByName('NR_PARCIAL').AsInteger = 0 then
          CmbParciais.Items.Add('S')
        else
          CmbParciais.Items.Add(FieldByName('NR_PARCIAL').AsString);
        Next;
      end;
      Close;
      CmbParciais.ItemIndex := 0;
    finally
      Free;
    end;
  end;
end;


procedure Tfrm_po_flp.qryPoItemAfterScroll(DataSet: TDataSet);
begin
  AtualizaCmbParcial;

  msk_item_cliente.Text := qryPoItemNR_ITEM_CLIENTE.AsString;
  if qryPoItemNR_PARCIAL.AsString <> '0' then
    CmbParciais.ItemIndex := CmbParciais.Items.IndexOf(qryPoItemNR_PARCIAL.AsString)
  else
    CmbParciais.ItemIndex := 0;

  AtualizaGridPoItens;

  ManutenodosProcessos1.Enabled := EditNR_PROCESSO_DES.Text <> '';
  FollowupDesembarao1.Enabled   := EditNR_PROCESSO_DES.Text <> '';
end;

procedure Tfrm_po_flp.SpeedButton1Click(Sender: TObject);
begin
//  ppmAtalhos.Popup(960,460);
  ppmAtalhos.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure Tfrm_po_flp.ManutenodosProcessos1Click(Sender: TObject);
var
  vNumPedido : string;
begin
  vNumPedido := msk_nr_po.Text;
  msk_nr_po.Text := '';
  nr_po := '';

  str_cd_rotina_atalho := '0102';
  nr_processo_gestao   := '0101' + EditNR_PROCESSO_DES.Text;
  frm_main.VerAtalho;

  msk_nr_po.Text := vNumPedido;
  msk_nr_poExit(nil);
end;

procedure Tfrm_po_flp.FollowupDesembarao1Click(Sender: TObject);
var
  vNumPedido : string;
begin
  vNumPedido := msk_nr_po.Text;
  msk_nr_po.Text := '';
  nr_po := '';

  str_cd_rotina_atalho := '0110';
  nr_processo_gestao   := '0101' + EditNR_PROCESSO_DES.Text;
  frm_main.VerAtalho;

  msk_nr_po.Text := vNumPedido;
  msk_nr_poExit(nil);
end;

procedure Tfrm_po_flp.edt_cd_clienteChange(Sender: TObject);
begin
  if edt_cd_cliente.Text = '' then
    edt_nm_cliente.Text := ''
  else
    edt_nm_cliente.Text := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', edt_cd_cliente.Text, 'NM_EMPRESA');
  cd_cliente_gestao := edt_cd_cliente.Text;
  qryPo.ParamByName('CD_EMPRESA').AsString             := edt_cd_cliente.Text;
  qryPoItem.ParamByName('CD_EMPRESA').AsString         := edt_cd_cliente.Text;
  qryFollowupPO.ParamByName('CD_EMPRESA').AsString     := edt_cd_cliente.Text;
  qryFollowupPOItem.ParamByName('CD_EMPRESA').AsString := edt_cd_cliente.Text;
end;

procedure Tfrm_po_flp.lbl_pendencias1Click(Sender: TObject);
var
  cd_analista : string;
begin
  cd_analista := '';
  with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add(' SELECT P.CD_ANALISTA_CLIENTE AS ANALISTA ');
      SQL.Add(' FROM TPROCESSO P (NOLOCK) ');
      SQL.Add(' WHERE P.NR_REFERENCIA = :NR_REFERENCIA');
      SQL.Add(' AND P.CD_CLIENTE      = :CD_EMPRESA');
      ParamByName('NR_REFERENCIA').AsString   := qryFollowupPOItemNR_PROCESSO.AsString;
      ParamByName('CD_EMPRESA').AsString      := qryFollowupPOItemCD_EMPRESA.AsString;
      Open;
      if not EOF then
        cd_analista := FieldByName('ANALISTA').AsString
      else
      begin
        ShowMessage('ATENÇÃO: Preencha o campo CONTATO na manutenção do processo!');
        Exit;
      end;
      Close;
      Free;
    end;
  if cd_analista <> '' then
  begin
  Application.CreateForm(Tfrm_pendencias, frm_pendencias);
  frm_pendencias.tp_origem := 2;
  frm_pendencias.ShowModal;
  end
  else
    ShowMessage('ATENÇÃO: O contato deste processo não está cadastrado como usuário no sistema myIndaiáWeb!'+#13+
    'Solicite o cadastro deste contato junto ao departamento de TI.');
end;

function Tfrm_po_flp.EventoAutomatico(AEvento: String): Boolean;
begin
  with TQuery.Create(nil) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT TX_PREFIXO, IN_BLOQUEAR, RTRIM(TX_DOCUMENTACAO) AS TX_DOCUMENTACAO');
      SQL.Add('FROM TEVENTO_AUTOMATICO (NOLOCK)');
      SQL.Add('WHERE CD_PRODUTO = :CD_PRODUTO');
      SQL.Add('  AND CD_EVENTO  = :CD_EVENTO');
      SQL.Add('  AND TX_PREFIXO IN (:TX_PREFIXO, "X")');
      ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
      ParamByName('CD_EVENTO').AsString  := AEvento;
      ParamByName('TX_PREFIXO').AsString := Copy(msk_nr_processo.Text, 1, 2);
      Open;
      
      // IF incluido para verificar primeiramente o prefixo e depois o X. Agora é possível bloquear todos com X e desbloquear apenas um
      if not Locate('TX_PREFIXO', Copy(msk_nr_processo.Text, 1, 2), []) then
        First;

      //by Carlos - 05/09/2011 - liberar para esses cargos
      {if (str_cd_cargo ='001') or (str_cd_cargo ='104') or (str_cd_cargo ='120') or (str_cd_cargo='092') or (str_cd_cargo='124') or (str_cd_cargo='111')  then
        Result := False
      else}
        Result := (FieldByName('IN_BLOQUEAR').AsString = '1');
      Close;
    finally
      Free;
    end;
  end;
end;

end.
