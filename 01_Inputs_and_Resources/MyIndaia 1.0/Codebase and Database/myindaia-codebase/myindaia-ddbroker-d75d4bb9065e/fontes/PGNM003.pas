(*************************************************************************************************

//Sistema: DD Broker - Indaiá Logística

//PROGRAMA: PGNM003.PAS - Recebimento de numerários

//AUTOR: Leandro Stipanich

//DATA: dd/mm/yyyy

//Manutenção: Leandro Stipanich

//Data: 12/09/2001

*************************************************************************************************)

unit PGNM003;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, PGGP001, ComCtrls, Funcoes;

Type
  TSolicNum = record
              nr_solic : string[3];
              nr_Lanc  : string[3];
              vl_lanc  : Double
  end;

type
  Tfrm_recebimento = class(TForm)
    pnl_cadastro: TPanel;
    pnl_selecao: TPanel;
    lbl_cd_cliente: TLabel;
    Label1: TLabel;
    btn_cd_produto: TSpeedButton;
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    pgctrl_receb: TPageControl;
    ts_processos: TTabSheet;
    ts_numerario_pendente: TTabSheet;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_saida: TMenuItem;
    btn_incluir: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_Cancelar: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_co_cliente: TSpeedButton;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    ts_receb: TTabSheet;
    ts_distribuicao_receb: TTabSheet;
    pnl_recebimento: TPanel;
    Label3: TLabel;
    Label2: TLabel;
    btn_co_banco: TSpeedButton;
    dbedt_vl_recebimento: TDBEdit;
    dbedt_cd_banco: TDBEdit;
    dbedt_nm_banco: TDBEdit;
    dbg_recebimento: TDBGrid;
    dbg_numerario: TDBGrid;
    dbg_numerario_item: TDBGrid;
    dbg_processo: TDBGrid;
    dbg_ref_cli: TDBGrid;
    dbg_receb: TDBGrid;
    dbg_receb_item: TDBGrid;
    dbedt_nr_recebimento: TDBEdit;
    Label7: TLabel;
    mi_recombinar: TMenuItem;
    mi_prioridade: TMenuItem;
    pnl_item_receb: TPanel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dbedt_nr_lanc_receb: TDBEdit;
    dbedt_vl_solicitado: TDBEdit;
    dbedt_vl_recebido_item: TDBEdit;
    dbedt_LK_NM_ITEM: TDBEdit;
    Label11: TLabel;
    dbedt_dt_recebimento: TDBEdit;
    mi_baixar: TMenuItem;
    btn_cancela_recebimento: TSpeedButton;
    mi_cancela_recebimento: TMenuItem;
    ts_receb_autom: TTabSheet;
    dbg_receb_autom_s: TDBGrid;
    Label12: TLabel;
    dbcbox_banco: TDBComboBox;
    dbg_receb_autom_d: TDBGrid;
    Label13: TLabel;
    Label14: TLabel;
    dbedt_vl_rec2: TDBEdit;
    lbl_vl_rec2: TLabel;
    btn_imprimir: TSpeedButton;
    mi_imprimir: TMenuItem;
    lbl_fp: TLabel;
    dbedt_nm_fp: TDBEdit;
    lbl_processo3: TLabel;
    dbedt_nr_processo3: TDBEdit;
    lbl_servico3: TLabel;
    dbedt_nm_servico3: TDBEdit;
    lbl_processo2: TLabel;
    dbedt_nr_processo2: TDBEdit;
    lbl_servico2: TLabel;
    dbedt_nm_servico2: TDBEdit;
    lbl_processo1: TLabel;
    dbedt_nr_processo1: TDBEdit;
    lbl_servico1: TLabel;
    dbedt_nm_servico1: TDBEdit;
    lbl_cliente1: TLabel;
    dbedt_nm_cliente1: TDBEdit;
    lbl_cliente2: TLabel;
    dbedt_nm_cliente2: TDBEdit;
    lbl_cliente3: TLabel;
    dbedt_nm_cliente3: TDBEdit;
    lbl_nr_processo: TLabel;
    lbl_grupo: TLabel;
    btn_co_grupo: TSpeedButton;
    msk_cd_grupo: TMaskEdit;
    edt_nm_grupo: TEdit;
    msk_nr_processo: TMaskEdit;
    btn_co_processo: TSpeedButton;
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure mi_novoClick(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_cd_produtoClick(Sender: TObject);
    procedure btn_mi(i:Boolean; s:Boolean; c:Boolean; e:Boolean);
    procedure dbedt_vl_recebimentoChange(Sender: TObject);
    procedure dbedt_cd_bancoChange(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure pnl_recebimentoExit(Sender: TObject);
    procedure Cancelar;
    procedure btn_CancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_cd_bancoExit(Sender: TObject);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure pgctrl_recebChange(Sender: TObject);
    procedure pgctrl_recebChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure Distribui;
    function Combinacao : Boolean;
    Function Prioridade : Boolean;
    procedure mi_recombinarClick(Sender: TObject);
    procedure mi_prioridadeClick(Sender: TObject);
    procedure mi_baixarClick(Sender: TObject);
    procedure dbg_numerario_itemEnter(Sender: TObject);
    procedure dbg_numerario_itemExit(Sender: TObject);
    procedure dbedt_vl_recebido_itemExit(Sender: TObject);
    procedure dbg_recebimentoDblClick(Sender: TObject);
    procedure btn_cancela_recebimentoClick(Sender: TObject);
    procedure AbreProc;
    procedure FechaProc;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbg_receb_autom_sDblClick(Sender: TObject);
    procedure dbg_receb_autom_dDblClick(Sender: TObject);
    procedure dbedt_vl_rec2Exit(Sender: TObject);
    procedure msk_cd_clienteEnter(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure msk_cd_grupoEnter(Sender: TObject);
    procedure msk_nr_processoEnter(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure dbedt_dt_recebimentoExit(Sender: TObject);
  private
    { Private declarations }
    st_unid_neg  : String[2];
    st_produto   : String[2];
    st_grupo     : String[3];
    st_cliente   : String[5];
    st_processo  : String[14];
    lcd_modulo   : String[2];
    lcd_rotina   : String[4];
    chave        : String;
    OnChanging, lcd_banco, lvl_receb, ldif_distr : boolean;

    function habilitacao : Boolean;
    function Consiste    : Boolean;
    function Grava       : Boolean;
    function VerAlt      : Boolean;

  public
    cState : String[1];
    Cons_OnLine : TStringField;
    nr_recebimento : String[3];
    nr_lancamento  : String[3];
    st_modificar, st_incluir, st_excluir, lincluindo, ldistribuindo,
    lCombinacao, lPrioridade, lProcManual, lCons_OnLine : Boolean;
    j, c, k, nTrabalho, nElementos : Integer;
    nTotal : Double;
    aPonteiro : array[0..99] of integer;
    aCombinacao : array[1..99] of String;
    nCombinacao : integer;
    aTrabalho  : array[1..99] of Integer;
    procedure ProcCombinacao;
    procedure InitCombinacao;
    function  ExecCombinacao: Boolean;
    { Public declarations }
  end;

var
  frm_recebimento: Tfrm_recebimento;
  aSolicNum : array[1..99] of TSolicNum;

implementation

uses GSMLIB,  PGNM004, PGNM025, PGGP017, PGSM010, PGSM018, PGSM024, PGSM041,
     PGSM119, PGSM136, PGGP015, PGNM025_old;

{$R *.DFM}

type
  EOperacaoCancelada = class(Exception);

procedure Tfrm_recebimento.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_recebimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Not VerAlt then Exit;
  with datm_recebimento do
  begin
    qry_cliente_.Close;
    qry_processo_.Close;
    qry_solinum_.Close;
    qry_itens_solinum_.Close;
    qry_receb_.Close;
    qry_itens_receb_.Close;
    qry_ref_cli_.Close;
    qry_itens_pendentes_.Close;
    qry_autom_s_.Close;
    qry_autom_d_.Close;
    qry_banco_liberado_.Close;
    qry_tp_destino_.Close;
//    destroy;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_recebimento.FormCreate(Sender: TObject);
begin
  { Cria o DataModule de Dados de Recebimento de Numerario }
  Application.CreateForm(Tdatm_recebimento, datm_recebimento );

  lcd_modulo := vStr_cd_modulo;
  lcd_rotina := str_cd_rotina;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_unid_negExit(nil);
  msk_cd_produtoExit(nil);

  datm_recebimento.qry_tp_destino_.Close;
  datm_recebimento.qry_tp_destino_.Prepare;
  datm_recebimento.qry_tp_destino_.Open;

  datm_recebimento.ds_receb.AutoEdit       := st_modificar;
  datm_recebimento.ds_itens_receb.AutoEdit := st_modificar;
  mi_recombinar.Visible := False;
  mi_prioridade.Visible := False;
  mi_baixar.Visible     := False;
  ts_distribuicao_receb.TabVisible := False;
end;

procedure Tfrm_recebimento.msk_cd_clienteExit(Sender: TObject);
var foco : boolean;
begin
  if lincluindo or ( st_cliente = Trim( msk_cd_cliente.Text ) ) then Exit;
  if Trim ( msk_cd_cliente.Text ) = '' then
  begin
    edt_nm_cliente.Text := 'Todos';
  end
  else
  begin
    ValCodEdt( msk_cd_cliente );
    with datm_recebimento do
    begin
      qry_cliente_.Close;
      qry_cliente_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_cliente_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
      qry_cliente_.ParamByName('CD_CLIENTE').AsString  := msk_cd_cliente.Text;
      qry_cliente_.Prepare;
      qry_cliente_.Open;
      if Not qry_cliente_.EOF then
      begin
        edt_nm_cliente.Text := qry_cliente_AP_EMPRESA.AsString;
        foco := Not Habilitacao;
      end
      else
      begin
        edt_nm_cliente.clear;
        BoxMensagem( 'Cliente não cadastrado/ativo!', 2 );
        foco := True;
      end;
      qry_cliente_.Close;
    end;
    if foco then
    begin
      pgctrl_receb.ActivePage := ts_processos;
      msk_cd_cliente.SetFocus;
    end;
  end;
  FechaProc;
  AbreProc;
end;

procedure Tfrm_recebimento.msk_cd_unid_negExit(Sender: TObject);
var foco : boolean;
begin
  if lincluindo or ( st_unid_neg = Trim( msk_cd_unid_neg.Text ) ) then Exit;
  if Trim ( msk_cd_unid_neg.Text ) = '' then
  begin
    edt_nm_unid_neg.Text := 'Todas';
  end
  else
  begin
    ValCodEdt( msk_cd_unid_neg );
    with datm_recebimento do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_unid_neg_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if Not qry_unid_neg_.EOF then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_AP_UNID_NEG.AsString;
        foco := Not Habilitacao;
      end
      else
      begin
        edt_nm_unid_neg.clear;
        BoxMensagem( 'Unidade não habilitada/ativa!', 2 );
        foco := True;
      end;
      qry_unid_neg_.Close;
    end;
    if foco then
    begin
      pgctrl_receb.ActivePage := ts_processos;
      msk_cd_unid_neg.SetFocus;
    end;
  end;
  FechaProc;
  AbreProc;
end;

procedure Tfrm_recebimento.msk_cd_produtoExit(Sender: TObject);
var foco : boolean;
begin
  if lincluindo or ( st_produto = Trim( msk_cd_produto.Text ) ) then Exit;
  if Trim ( msk_cd_produto.Text ) = '' then
  begin
    edt_nm_produto.Text := 'Todas';
  end
  else
  begin
    ValCodEdt( msk_cd_produto );
    with datm_recebimento do
    begin
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
      qry_produto_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_produto_.Prepare;
      qry_produto_.Open;
      if Not qry_produto_.EOF then
      begin
        edt_nm_produto.Text := qry_produto_AP_PRODUTO.AsString;
        foco := Not Habilitacao;
      end
      else
      begin
        edt_nm_produto.clear;
        BoxMensagem('Produto não habilitado/ativo!', 2);
        foco := True;
      end;
      qry_produto_.Close;
    end;
    if foco then
    begin
      pgctrl_receb.ActivePage := ts_processos;
      msk_cd_produto.SetFocus;
    end;
  end;
  FechaProc;
  AbreProc;
end;

function Tfrm_recebimento.Habilitacao : Boolean;
begin
  Habilitacao := True;
  if (msk_cd_unid_neg.Text <> '') and
     (msk_cd_produto.Text <> '') then
  with datm_recebimento do
  begin
    qry_usuario_habilitacao_.Close;
    qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
    qry_usuario_habilitacao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_usuario_habilitacao_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
    qry_usuario_habilitacao_.Prepare;
    qry_usuario_habilitacao_.Open;
    if qry_usuario_habilitacao_IN_ATIVO.AsString <> '1' then
    begin
      BoxMensagem('A habilitação não está ativa!', 2);
      Habilitacao := False;
    end;
    qry_usuario_habilitacao_.Close;
  end;
end;

procedure Tfrm_recebimento.mi_novoClick(Sender: TObject);
begin
  with datm_recebimento do
  begin
    try
      datm_main.db_broker.StartTransaction;
      if msk_cd_unid_neg.Text = '' then
      begin
        BoxMensagem( 'Forneça o código da Unidade de Negócio!', 2 );
        msk_cd_unid_neg.SetFocus;
        Exit
      end;
      if msk_cd_produto.Text = '' then
      begin
        BoxMensagem( 'Forneça o código do Produto!', 2 );
        msk_cd_produto.SetFocus;
        Exit
      end;
      if msk_cd_cliente.Text = '' then
      begin
        BoxMensagem( 'Forneça o código do cliente!', 2 );
        msk_cd_cliente.SetFocus;
        Exit
      end;
    except
      begin
        datm_main.db_broker.Rollback;
      end
    end;
  end;
end;

procedure Tfrm_recebimento.btn_co_clienteClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cliente, frm_cliente);
  with frm_cliente do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_cliente.Cons_OnLine_Texto := msk_cd_cliente.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_cliente.Text := frm_cliente.Cons_OnLine_Texto;
  end;
  msk_cd_clienteExit(nil);
end;

procedure Tfrm_recebimento.btn_co_produtoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_produto, frm_produto);
 { frm_produto.msk_Cons_OnLine := msk_cd_produto;}
  with frm_produto do
  begin
  Caption := Caption + ' [Consulta On-Line]';
  lCons_OnLine := True;
  ShowModal;
  lCons_OnLine := False;
  end;
  msk_cd_produtoExit(nil);
end;

procedure Tfrm_recebimento.btn_co_unid_negClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_unidade.Cons_OnLine_Texto := msk_cd_unid_neg.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_recebimento.msk_cd_unid_negEnter(Sender: TObject);
begin
  st_unid_neg := msk_cd_unid_neg.Text;
end;

procedure Tfrm_recebimento.msk_cd_produtoEnter(Sender: TObject);
begin
  st_produto := msk_cd_produto.Text;
end;

procedure Tfrm_recebimento.btn_cd_unid_negClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_unidade.Cons_OnLine_Texto := msk_cd_unid_neg.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    frm_recebimento.msk_cd_unid_negExit(nil);
  end;
end;

procedure Tfrm_recebimento.btn_cd_produtoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_produto, frm_produto);
  with frm_produto do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_produto.Cons_OnLine_Texto := msk_cd_produto.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
    frm_recebimento.msk_cd_produtoExit(nil);
  end;
end;

procedure Tfrm_recebimento.btn_mi(i:Boolean; s:Boolean; c:Boolean; e:Boolean);
begin
  btn_salvar.Enabled   := s;
  mi_salvar.Enabled    := s;
  btn_Cancelar.Enabled := c;
  mi_Cancelar.Enabled  := c;

  if datm_recebimento.qry_solinum_.Active then
  begin
    if ( datm_recebimento.qry_solinum_.RecordCount > 0 ) and
       ( ( pgctrl_receb.ActivePage = ts_numerario_pendente ) or
         ( pgctrl_receb.ActivePage = ts_receb ) ) then
    begin
      mi_incluir.Enabled  := i;
      btn_incluir.Enabled := i;
    end
    else
    begin
      mi_incluir.Enabled  := False;
      btn_incluir.Enabled := False;
    end;
  end;

  if datm_recebimento.qry_processo_.Active then
  begin
    if datm_recebimento.qry_processo_.RecordCount > 0 then
    begin
      mi_incluir.Enabled  := i;
      btn_incluir.Enabled := i;
    end
    else
    begin
      mi_incluir.Enabled  := False;
      btn_incluir.Enabled := False;
    end;
  end;
end;

procedure Tfrm_recebimento.dbedt_vl_recebimentoChange(Sender: TObject);
begin
  if (datm_recebimento.qry_receb_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_mi (False, True, True, False);
  end;
end;

procedure Tfrm_recebimento.dbedt_cd_bancoChange(Sender: TObject);
begin
  if (datm_recebimento.qry_receb_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_mi (False, True, True, False);
  end;
end;

procedure Tfrm_recebimento.btn_incluirClick(Sender: TObject);
begin
  if pgctrl_receb.ActivePage = ts_processos then
  begin
    try
      with datm_recebimento do
      begin
        qry_receb_.Close;
        qry_receb_.Prepare;
        qry_receb_.Open;
        qry_receb_.Append;
      end;
    except
      on E: Exception do
      begin
        datm_recebimento.qry_receb_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Exit;
      end;
    end;
    //posiciona registro

    lbl_vl_rec2.Visible   := True;
    dbedt_vl_rec2.Visible := True;
    dbedt_vl_rec2.SetFocus;
    pgctrl_receb.Enabled  := False;
    pgctrl_receb.TabStop  := False;
  end
  else
  begin
    lincluindo := True;
    try
      with datm_recebimento do
      begin
        qry_tot_pend_.Close;
        qry_tot_pend_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
        qry_tot_pend_.Prepare;
        qry_tot_pend_.Open;
        if qry_tot_pend_TOT_PEND.AsCurrency = 0 then
        begin
          BoxMensagem( 'Não existe numerários pendentes.', 2 );
          qry_tot_pend_.Close;
          Exit;
        end;
        qry_tot_pend_.Close;

        qry_receb_.Last;
        nr_recebimento := qry_receb_NR_RECEBIMENTO.AsString;
        if nr_recebimento = '' then
          nr_recebimento := '001'
        else
          nr_recebimento := StrZero(StrToInt(nr_recebimento)+1,3);
        qry_receb_.Append;
        qry_receb_NR_PROCESSO.AsString        := qry_processo_NR_PROCESSO.AsString;
        qry_receb_NR_RECEBIMENTO.AsString     := nr_recebimento;
        qry_caixa_ctrl_.Close;
        qry_caixa_ctrl_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
        qry_caixa_ctrl_.Prepare;
        qry_caixa_ctrl_.Open;
        if Not qry_caixa_ctrl_.EOF then
           qry_receb_DT_RECEBIMENTO.AsDateTime := qry_caixa_ctrl_.FieldByName('DT_MOVIMENTO').AsDateTime
        else
           qry_receb_DT_RECEBIMENTO.AsDateTime := dt_server;
        qry_caixa_ctrl_.Close;
        qry_receb_CD_USUARIO.AsString          := str_cd_usuario;
      end;
    except
      on E: Exception do
      begin
        datm_recebimento.qry_receb_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        exit;
      end;
    end;
    //posiciona registro

    pnl_selecao.Enabled              := False;
    pnl_item_receb.Enabled           := False;
    pnl_item_receb.Visible           := False;

    ts_distribuicao_receb.TabVisible := True;
    pgctrl_receb.ActivePage          := ts_distribuicao_receb;
    pnl_recebimento.Enabled          := True;
    dbedt_vl_recebimento.SetFocus;
    btn_mi (False, True, True, False);
    btn_cancela_recebimento.Enabled  := False;
    mi_cancela_recebimento.Enabled   := False;
    ldistribuindo                    := False;
    lincluindo                       := False;
  end;
end;

procedure Tfrm_recebimento.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava    then Exit;
  pnl_recebimentoExit(nil);
end;

function Tfrm_recebimento.Consiste : Boolean;
begin
  if ldistribuindo then
  begin
    datm_recebimento.qry_tot_receb_.Close;
    datm_recebimento.qry_tot_receb_.Prepare;
    datm_recebimento.qry_tot_receb_.Open;
    if datm_recebimento.qry_receb_VL_RECEBIMENTO.AsCurrency <>
       datm_recebimento.qry_tot_receb_TOT_RECEB.AsCurrency then
    begin
      BoxMensagem('A distribuição não confere com o recebimento informado!', 2);
      pgctrl_receb.ActivePage := ts_distribuicao_receb;
      ldif_distr := True;
      Consiste := False;
    end
    else
      Consiste := True;
    datm_recebimento.qry_tot_receb_.Close;
    Exit;
  end;
  if dbedt_vl_recebimento.Text = '' then
  begin
    BoxMensagem('Campo Valor deve ser preenchido!', 2);
    pgctrl_receb.ActivePage := ts_distribuicao_receb;
    dbedt_vl_recebimento.SetFocus;
    lvl_receb := True;
    Consiste := False;
    Exit;
  end;
  if dbedt_cd_banco.Text = '' then
  begin
    BoxMensagem('Campo Banco deve ser preenchido!', 2);
    pgctrl_receb.ActivePage := ts_distribuicao_receb;
    dbedt_cd_banco.SetFocus;
    lcd_banco := True;
    Consiste := False;
    Exit;
  end;
  if dbedt_nm_banco.Text = '' then
  begin
    BoxMensagem('Banco não encontrado!', 2);
    pgctrl_receb.ActivePage := ts_distribuicao_receb;
    dbedt_cd_banco.SetFocus;
    lcd_banco := True;
    Consiste := False;
    Exit;
  end;
  Consiste := True;
end;

function Tfrm_recebimento.Grava : Boolean;
begin
  with datm_recebimento do
  begin
    qry_caixa_ctrl_.Close;
    qry_caixa_ctrl_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
    qry_caixa_ctrl_.Prepare;
    qry_caixa_ctrl_.Open;
    if Not qry_caixa_ctrl_.EOF then
       if ( qry_receb_DT_RECEBIMENTO.AsDateTime > dt_server ) or
          ( qry_receb_DT_RECEBIMENTO.AsDateTime < qry_caixa_ctrl_.FieldByName('DT_MOVIMENTO').AsDateTime ) then
    begin
      BoxMensagem( 'Movimento financeiro fechado, ou Data inválida', 2 );
      Grava := False;
      qry_caixa_ctrl_.Close;
      Exit;
    end;

    if ldistribuindo then
    begin
      try
        datm_main.db_broker.StartTransaction;

        CloseStoredProc(sp_atz_receb);
        sp_atz_receb.ParamByName('@nr_processo').AsString    := qry_receb_NR_PROCESSO.AsString;
        sp_atz_receb.ParamByName('@nr_recebimento').AsString := qry_receb_NR_RECEBIMENTO.AsString;
        ExecStoredProc(sp_atz_receb);
        CloseStoredProc(sp_atz_receb);

        CloseStoredProc(sp_distribui_numerario);

        qry_caixa_ctrl_.Close;
        qry_caixa_ctrl_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
        qry_caixa_ctrl_.Prepare;
        qry_caixa_ctrl_.Open;
        if Not qry_caixa_ctrl_.EOF then
//           sp_distribui_numerario.ParamByName('@dt_movimento').AsDateTime := qry_caixa_ctrl_.FieldByName('DT_MOVIMENTO').AsDateTime
           sp_distribui_numerario.ParamByName('@dt_movimento').AsDateTime := qry_receb_DT_RECEBIMENTO.AsDateTime
        else
           sp_distribui_numerario.ParamByName('@dt_movimento').AsDateTime := dt_server;
        qry_caixa_ctrl_.Close;

        sp_distribui_numerario.ParamByName('@cd_unid_neg').AsString    := msk_cd_unid_neg.Text;
        sp_distribui_numerario.ParamByName('@cd_coligada').AsString    := '01';
        ExecStoredProc(sp_distribui_numerario);
        CloseStoredProc(sp_distribui_numerario);

        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;

      Grava := True;
      ldistribuindo         := False;
      mi_recombinar.Visible := False;
      mi_prioridade.Visible := False;
      qry_solinum_.Close;
      qry_solinum_.Prepare;
      qry_solinum_.Open;
      qry_itens_solinum_.Close;
      qry_itens_solinum_.Prepare;
      qry_itens_solinum_.Open;
      qry_itens_receb_.Close;
      qry_itens_receb_.Prepare;
      qry_itens_receb_.Open;
      ts_distribuicao_receb.TabVisible := False;
      pnl_selecao.Enabled              := True;
      pgctrl_receb.ActivePage          := ts_receb;
      btn_cancela_recebimento.Enabled  := True;
      mi_cancela_recebimento.Enabled   := True;
    end
    else
    begin
      try
        datm_main.db_broker.StartTransaction;
        if ( qry_receb_.State in [dsInsert, dsEdit] ) then
        begin
          chave := qry_receb_NR_PROCESSO.AsString + qry_receb_NR_RECEBIMENTO.AsString;
          //grava recebimento
          qry_receb_.Post;

          chave := qry_receb_NR_RECEBIMENTO.Asstring;
          qry_receb_.Close;
          qry_receb_.Prepare;
          qry_receb_.Open;
          qry_receb_.Locate('NR_RECEBIMENTO', chave, [loPartialKey]);
        end;
        datm_main.db_broker.Commit;
        pnl_recebimento.Enabled := False;
        {Distribuição}
        Distribui;
        Grava := True;
      except
        on E: Exception do
        begin
          qry_receb_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
          Grava := False;
        end;
      end;
    end;
    if not ldistribuindo then btn_mi (st_incluir, False, False, st_excluir)
  end;
end;

procedure Tfrm_recebimento.Cancelar;
begin
  if ldistribuindo then
  begin
    with datm_recebimento do
    begin
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(sp_apaga_receb);
        sp_apaga_receb.ParamByName('@nr_processo').AsString    := qry_receb_NR_PROCESSO.AsString;
        sp_apaga_receb.ParamByName('@nr_recebimento').AsString := qry_receb_NR_RECEBIMENTO.AsString;
        sp_apaga_receb.ParamByName('@escopo').AsString         := 'R';
        ExecStoredProc(sp_apaga_receb);
        CloseStoredProc(sp_apaga_receb);
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      ldistribuindo         := False;
      mi_recombinar.Visible := False;
      mi_prioridade.Visible := False;
      qry_receb_.Close;
      qry_receb_.Prepare;
      qry_receb_.Open;
      qry_itens_receb_.Close;
      qry_itens_receb_.Prepare;
      qry_itens_receb_.Open;
    end
  end
  else
  begin
    try
      if datm_recebimento.qry_receb_.State in [dsInsert, dsEdit] then
        datm_recebimento.qry_receb_.Cancel;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
  end;
  ts_distribuicao_receb.TabVisible := False;
  pnl_selecao.Enabled              := True;
  btn_mi (st_incluir, False, False, st_excluir);
  pgctrl_receb.ActivePage          := ts_receb;
  btn_cancela_recebimento.Enabled  := True;
  mi_cancela_recebimento.Enabled   := True;
end;

function Tfrm_recebimento.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( datm_recebimento.qry_receb_.State in [dsEdit, dsInsert] ) or
     ( ldistribuindo ) then
  begin
    if BoxMensagem('Recebimento foi alterado' + #13#10 +
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

procedure Tfrm_recebimento.pnl_recebimentoExit(Sender: TObject);
var nr_processo, nr_recebimento: String;
begin
  with datm_recebimento do
  begin
    if qry_receb_.State in [dsinsert, dsedit] then
      dbg_recebimento.Enabled := False
    else
    begin
      dbg_recebimento.Enabled := True;
      nr_processo := qry_processo_NR_PROCESSO.AsString;
      nr_recebimento := qry_receb_NR_RECEBIMENTO.AsString;
      qry_processo_.Close;
      qry_processo_.Prepare;
      qry_processo_.Open;
      qry_processo_.Locate('NR_PROCESSO', nr_processo, [loCaseInsensitive]);
      qry_solinum_.Close;
      qry_solinum_.Prepare;
      qry_solinum_.Open;
      qry_receb_.Close;
      qry_receb_.Prepare;
      qry_receb_.Open;
      qry_receb_.Locate('NR_PROCESSO;NR_RECEBIMENTO', VarArrayOf([nr_processo, nr_recebimento]), [loCaseInsensitive]);
      qry_itens_receb_.Close;
      qry_itens_receb_.Prepare;
      qry_itens_receb_.Open;
      qry_itens_receb_.Locate('NR_PROCESSO;NR_RECEBIMENTO', VarArrayOf([nr_processo, nr_recebimento]), [loCaseInsensitive]);
    end;
  end;
end;

procedure Tfrm_recebimento.btn_CancelarClick(Sender: TObject);
begin
  Cancelar;
  pgctrl_receb.Enabled             := True;
  pgctrl_receb.TabStop             := True;
  pgctrl_receb.ActivePage          := ts_receb;
  ts_distribuicao_receb.TabVisible := False;
  btn_cancela_recebimento.Enabled  := True;
  mi_cancela_recebimento.Enabled   := True;
  pnl_recebimentoExit(nil);
  lbl_vl_rec2.Visible              := False;
  dbedt_vl_rec2.Visible            := False;
end;

procedure Tfrm_recebimento.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  lincluindo              := False;
  pgctrl_receb.Enabled    := False;
  pgctrl_receb.TabStop    := False;
  pgctrl_receb.ActivePage := ts_processos;
  msk_cd_grupo.SetFocus;
end;

procedure Tfrm_recebimento.dbedt_cd_bancoExit(Sender: TObject);
begin
  if datm_recebimento.qry_receb_.State in [dsEdit, dsInsert] then
    ValidCodigo(dbedt_cd_banco);
  if Not OnChanging then
  begin
    Consiste;
    lcd_banco := False;
  end;
end;

procedure Tfrm_recebimento.btn_co_bancoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2216';
  Application.CreateForm(Tfrm_banco, frm_banco);
  frm_banco.Cons_OnLine := datm_recebimento.qry_receb_CD_BANCO;
  with frm_banco do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_recebimento.qry_receb_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
      datm_recebimento.qry_receb_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  vStr_cd_modulo := lcd_modulo;
  str_cd_rotina := lcd_rotina;
end;

procedure Tfrm_recebimento.pgctrl_recebChange(Sender: TObject);
begin
  OnChanging := False;

  if datm_recebimento.qry_receb_.RecordCount > 0 then
  begin
    if pgctrl_receb.ActivePage = ts_receb then
    begin
      mi_cancela_recebimento.Enabled  := True;
      btn_cancela_recebimento.Enabled := True;
    end
    else
    begin
      mi_cancela_recebimento.Enabled  := False;
      btn_cancela_recebimento.Enabled := False;
    end;
  end;

  if ldistribuindo or ldif_distr then
  begin
    ldif_distr                      := True;
    pgctrl_receb.ActivePage         := ts_distribuicao_receb;
    btn_cancela_recebimento.Enabled := False;
    mi_cancela_recebimento.Enabled  := False;
    Exit;
  end;
  if lvl_receb then
  begin
    lvl_receb                       := False;
    pgctrl_receb.ActivePage         := ts_distribuicao_receb;
    dbedt_vl_recebimento.SetFocus;
    btn_cancela_recebimento.Enabled := False;
    mi_cancela_recebimento.Enabled  := False;
    Exit;
  end;
  if lcd_banco then
  begin
    lcd_banco := False;
    pgctrl_receb.ActivePage         := ts_distribuicao_receb;
    dbedt_cd_banco.SetFocus;
    btn_cancela_recebimento.Enabled := False;
    mi_cancela_recebimento.Enabled  := False;
    Exit;
  end;

  if pgctrl_receb.ActivePage = ts_distribuicao_receb then
  begin
    pnl_selecao.Enabled             := False;
    if datm_recebimento.qry_receb_.State in [dsEdit, dsInsert ] then
       btn_mi (False, True, True, False)
    else
       btn_mi (st_incluir, False, False, st_excluir);
  end
  else
  begin
    pnl_selecao.Enabled             := True;
    btn_mi (st_incluir, False, False, st_excluir);
  end;
end;

procedure Tfrm_recebimento.pgctrl_recebChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  OnChanging := True;
  if Not VerAlt then Exit;
end;

procedure Tfrm_recebimento.Distribui;
begin
  ldistribuindo         := True;
  mi_recombinar.Visible := True;
  mi_prioridade.Visible := True;
  with datm_recebimento do
  begin
    qry_itens_pendentes_.Close;
    qry_itens_pendentes_.Prepare;
    qry_itens_pendentes_.Open;
    if Not (qry_itens_pendentes_.RecordCount = 0) then
    begin
      lCombinacao := Combinacao; { Processa Combinacoes }
      if Not (lCombinacao) then lPrioridade := Prioridade;
    end
    else
      lPrioridade := Prioridade;

    qry_itens_receb_.Close;
    qry_itens_receb_.Prepare;
    qry_itens_receb_.Open;
  end;
end;

procedure Tfrm_recebimento.InitCombinacao;
var
  i : integer;
begin
  { Inicializa variaveis de Controle }
  j            := 1;
  c            := 0;
  nTotal       := 0;
  nCombinacao  := 0;
  nTrabalho    := 0;
  aPonteiro[0] := 0;
  { Apaga o vetor de combinacoes }
  For i := 1 to 99 do
  begin
    aPonteiro[i] := 0;
    aTrabalho[i] := 0;
    aCombinacao[i] := '';
  end;
end;

procedure Tfrm_recebimento.ProcCombinacao;
var
  i : Integer;
begin
  aPonteiro[ j ] := aPonteiro[ j - 1 ];
  while True do
  begin
    aPonteiro[ j ] := aPonteiro[ j ] + 1;
    if aPonteiro[ j ] > nElementos then
    begin
      Exit;  {Fim}
    end;
    nTotal := 0;
    k := 1 ;
    while k <= j do
    begin
      nTotal := nTotal + aSolicNum[ aPonteiro[ k ] ].vl_lanc;
      k := k + 1;
    end;
    if nTotal = dbedt_vl_recebimento.Field.AsCurrency then
    begin
      nCombinacao := nCombinacao + 1;
      For i := 1 to j do aCombinacao[nCombinacao] := aCombinacao[nCombinacao] + StrZero( aPonteiro[i], 2 ) + ',';
      if nCombinacao = 10 then
         Exit
      else
         Continue;
    end;
    if ( nTotal > dbedt_vl_recebimento.Field.AsCurrency) then
    begin
      Continue;
    end;
    if ( aPonteiro[j] = nElementos ) then
    begin
      Exit;
    end;
    nTrabalho := nTrabalho + 1;
    aTrabalho[ nTrabalho ] := j;
    j := j + 1;
    ProcCombinacao;
    j := aTrabalho[ nTrabalho ];
    aTrabalho[ nTrabalho ] := 0;
    nTrabalho := nTrabalho - 1;
    Continue;
  end;
end;

function Tfrm_recebimento.Combinacao : Boolean;
var
  i, nRows : Integer;
  nVl_Saldo : Double;
begin
  with datm_recebimento do
  begin
    Result := False; { default }
    { Variável auxiliar para controle dos indices  }
    nElementos :=0;
    nRows := qry_itens_pendentes_.RecordCount;
    i := 1;
    while ( i <= nRows ) do
    begin
      nVl_Saldo := qry_itens_pendentes_VL_SOLICITADO.AsCurrency -
                   qry_itens_pendentes_VL_RECEBIDO.AsCurrency;
      if ( nVl_Saldo <= dbedt_vl_recebimento.Field.AsCurrency ) and ( nVl_Saldo > 0 ) then
      begin
        nElementos := nElementos + 1;
        aSolicNum[ nElementos ].nr_solic := datm_recebimento.qry_itens_pendentes_NR_SOLICITACAO.AsString;
        aSolicNum[ nElementos ].nr_lanc  := datm_recebimento.qry_itens_pendentes_NR_LANCAMENTO.AsString;
        aSolicNum[ nElementos ].vl_lanc  := nVl_Saldo;
      end;
      i := i + 1;
      if ( i <= nRows ) then qry_itens_pendentes_.Next;
    end;
    InitCombinacao;
    ProcCombinacao;
    if nCombinacao > 0 then { Encontrou uma combinacao caso > Zero }
    begin
      c := 1;
      Result := ExecCombinacao;
    end;
  end;
end;

function Tfrm_recebimento.ExecCombinacao : Boolean;
var
  i : integer;
  r : integer;
  n : integer;
  nRows : integer;
  nVl_Saldo : Double;
begin
  with datm_recebimento do
  begin
    nr_lancamento := '000';
    qry_itens_pendentes_.First;
    r := 0;
    aCombinacao[c] := aCombinacao[c] + '00,';
    nRows := qry_itens_pendentes_.RecordCount;
    For i := 1 to nRows do
    begin
      nr_lancamento := StrZero(StrToInt(nr_lancamento)+1,3);
      nVl_Saldo := qry_itens_pendentes_VL_SOLICITADO.AsCurrency - qry_itens_pendentes_VL_RECEBIDO.AsCurrency;
      qry_itens_receb_.Append;
      qry_itens_receb_NR_PROCESSO.AsString     := qry_itens_pendentes_NR_PROCESSO.AsString;
      qry_itens_receb_NR_RECEBIMENTO.AsString  := qry_receb_NR_RECEBIMENTO.AsString;
      qry_itens_receb_NR_LANC_RECEB.AsString   := nr_lancamento;
      qry_itens_receb_NR_SOLICITACAO.AsString  := qry_itens_pendentes_NR_SOLICITACAO.AsString;
      qry_itens_receb_NR_LANCAMENTO.AsString   := qry_itens_pendentes_NR_LANCAMENTO.AsString;
      qry_itens_receb_CD_ITEM.AsString         := qry_itens_pendentes_CD_ITEM.AsString;
      qry_itens_receb_VL_SOLICITADO.AsCurrency    := nVl_Saldo;
      n := StrToInt( Copy(aCombinacao[c], ((r*3)+1) ,2 ) );
      if ( n > 0 ) and
         ( qry_itens_pendentes_NR_SOLICITACAO.AsString = aSolicNum[n].nr_solic ) and
         ( qry_itens_pendentes_NR_LANCAMENTO.AsString  = aSolicNum[n].nr_lanc  ) then
      begin
        qry_itens_receb_VL_RECEBIDO.AsCurrency := nVl_Saldo;
        r := r + 1;
      end
      else
        qry_itens_receb_VL_RECEBIDO.AsCurrency := 0;
      qry_itens_receb_.post;
      if ( i <= nRows ) then qry_itens_pendentes_.Next;
    end;
    { Equivale ao refresh }
//      qry_itens_solinum_.Close;
//      qry_itens_solinum_.Open;
    qry_itens_receb_.Close;
    qry_itens_receb_.Prepare;
    qry_itens_receb_.Open;
    Result := True;
  end;
end;

Function Tfrm_recebimento.Prioridade : Boolean;
Var
  i : integer;
  nRows : integer;
  nValor : Currency;
  nSaldo_recebimento : Currency;
  nr_solicitacao : string[3];
begin
  with datm_recebimento do
  begin
    qry_itens_por_prioridade_.Close;
    qry_itens_por_prioridade_.Prepare;
    qry_itens_por_prioridade_.Open;
    nRows := qry_itens_por_prioridade_.RecordCount;
    if (nRows = 0) then
    begin
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(sp_numerario_999);
        sp_numerario_999.ParamByName('@nr_processo').AsString    := qry_receb_NR_PROCESSO.AsString;
        sp_numerario_999.ParamByName('@nr_solicitacao').AsString := '999';
        sp_numerario_999.ParamByName('@cd_usuario').AsString     := str_cd_usuario;
        sp_numerario_999.ParamByName('@vl_saldo_receb').AsFloat  := 0;
        ExecStoredProc(sp_numerario_999);
        CloseStoredProc(sp_numerario_999);
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;

      qry_itens_por_prioridade_.Close;
      qry_itens_por_prioridade_.Prepare;
      qry_itens_por_prioridade_.Open;
      nRows := qry_itens_por_prioridade_.RecordCount;
    end;
    if (nRows > 0) then
    begin
      nr_lancamento := '000';
      nSaldo_recebimento := qry_receb_VL_RECEBIMENTO.AsCurrency;
      qry_itens_solinum_.First;
      i := 1;
      While ( i <= nRows ) do
      begin
        nValor := datm_recebimento.qry_itens_por_prioridade_VL_SOLICITADO.AsCurrency -
                  datm_recebimento.qry_itens_por_prioridade_VL_RECEBIDO.AsCurrency;
        if ( nValor > 0 ) then
        begin
          nr_lancamento := StrZero(StrToInt(nr_lancamento)+1,3);
          qry_itens_receb_.Append;
          qry_itens_receb_NR_PROCESSO.AsString     := qry_processo_NR_PROCESSO.AsString;
          qry_itens_receb_NR_RECEBIMENTO.AsString  := qry_receb_NR_RECEBIMENTO.AsString;
          qry_itens_receb_NR_LANC_RECEB.AsString   := nr_lancamento;
          qry_itens_receb_NR_SOLICITACAO.AsString  := qry_itens_por_prioridade_NR_SOLICITACAO.AsString;
          qry_itens_receb_NR_LANCAMENTO.AsString   := qry_itens_por_prioridade_NR_LANCAMENTO.AsString;
          qry_itens_receb_CD_ITEM.AsString         := qry_itens_por_prioridade_CD_ITEM.AsString;
          qry_itens_receb_VL_SOLICITADO.AsCurrency := nValor;
          if nSaldo_Recebimento > 0 then
          begin
            if ( nValor <= nSaldo_Recebimento ) then
            begin
              qry_itens_receb_VL_RECEBIDO.AsCurrency := nValor;
              if nSaldo_Recebimento = nValor then
                nSaldo_Recebimento := 0
              else
                nSaldo_Recebimento := nSaldo_Recebimento - nValor;
            end
            else
            begin
              qry_itens_receb_VL_RECEBIDO.AsCurrency := nSaldo_Recebimento;
              nSaldo_Recebimento := 0;
            end;
          end
          else
          begin
            qry_itens_receb_VL_RECEBIDO.AsCurrency := 0;
          end;
          qry_itens_receb_.Post;
        end;
        i := i + 1;
        nr_solicitacao := qry_itens_por_prioridade_NR_SOLICITACAO.AsString;
        if ( i <= nRows ) then
          qry_itens_por_prioridade_.Next
        else
          if nSaldo_Recebimento > 0 then   { Se restou saldo do recebimento joga como item 999 - Saldo no Processo }
          begin
            try
              datm_main.db_broker.StartTransaction;
              CloseStoredProc(sp_numerario_999);
              sp_numerario_999.ParamByName('@nr_processo').AsString    := qry_receb_NR_PROCESSO.AsString;
              sp_numerario_999.ParamByName('@nr_solicitacao').AsString := qry_itens_por_prioridade_NR_SOLICITACAO.AsString;
              sp_numerario_999.ParamByName('@cd_usuario').AsString     := str_cd_usuario;
              sp_numerario_999.ParamByName('@vl_saldo_receb').AsFloat  := nSaldo_recebimento;
              ExecStoredProc(sp_numerario_999);
              CloseStoredProc(sp_numerario_999);
              datm_main.db_broker.Commit;
            except
              on E: Exception do
              begin
                if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                TrataErro(E);
              end;
            end;

            nr_lancamento := StrZero(StrToInt(nr_lancamento)+1,3);
            qry_itens_receb_.Append;
            qry_itens_receb_NR_PROCESSO.AsString     := qry_processo_NR_PROCESSO.AsString;
            qry_itens_receb_NR_RECEBIMENTO.AsString  := qry_receb_NR_RECEBIMENTO.AsString;
            qry_itens_receb_NR_LANC_RECEB.AsString   := nr_lancamento;
            qry_itens_receb_NR_SOLICITACAO.AsString  := qry_itens_por_prioridade_NR_SOLICITACAO.AsString;
            qry_itens_receb_NR_LANCAMENTO.AsString   := '999';
            qry_itens_receb_CD_ITEM.AsString         := '999';
            qry_itens_receb_VL_SOLICITADO.AsCurrency := 0;
            qry_itens_receb_VL_RECEBIDO.AsCurrency   := nSaldo_Recebimento;
            qry_itens_receb_.post;
          end;
      end;
    end;
    qry_itens_receb_.Close;
    qry_itens_receb_.Prepare;
    qry_itens_receb_.Open;
    Result := True;
  end;
end;

procedure Tfrm_recebimento.mi_recombinarClick(Sender: TObject);
begin
  with datm_recebimento do
  begin
    c := c + 1;
    if c > nCombinacao then
    begin
       BoxMensagem( 'Atenção! Não existem outras combinações possíveis!', 3);
       c := 0;
       Exit;
    end;
    qry_itens_receb_.Close;
    try
      datm_main.db_broker.StartTransaction;
      CloseStoredProc(sp_apaga_receb);
      sp_apaga_receb.ParamByName('@nr_processo').AsString    := qry_receb_NR_PROCESSO.AsString;
      sp_apaga_receb.ParamByName('@nr_recebimento').AsString := qry_receb_NR_RECEBIMENTO.AsString;
      sp_apaga_receb.ParamByName('@escopo').AsString         := 'I';
      ExecStoredProc(sp_apaga_receb);
      CloseStoredProc(sp_apaga_receb);
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    qry_itens_receb_.Open;

    ExecCombinacao;
  end;
end;

procedure Tfrm_recebimento.mi_prioridadeClick(Sender: TObject);
begin
  with datm_recebimento do
  begin
    qry_itens_receb_.Close;
    try
      datm_main.db_broker.StartTransaction;
      CloseStoredProc(sp_apaga_receb);
      sp_apaga_receb.ParamByName('@nr_processo').AsString    := qry_receb_NR_PROCESSO.AsString;
      sp_apaga_receb.ParamByName('@nr_recebimento').AsString := qry_receb_NR_RECEBIMENTO.AsString;
      sp_apaga_receb.ParamByName('@escopo').AsString         := 'I';
      ExecStoredProc(sp_apaga_receb);
      CloseStoredProc(sp_apaga_receb);
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    qry_itens_receb_.Open;
  end;
  Prioridade;
end;

procedure Tfrm_recebimento.mi_baixarClick(Sender: TObject);
begin
  with datm_recebimento do
  begin
    if not ( qry_itens_solinum_.State = dsEdit ) then qry_itens_solinum_.Edit;
    if qry_itens_solinum_CD_STATUS.AsString = 'A' then
       qry_itens_solinum_CD_STATUS.AsString := 'B'
    else
      if qry_itens_solinum_CD_STATUS.AsString = 'B' then
        if qry_itens_solinum_VL_RECEBIDO.AsCurrency < qry_itens_solinum_VL_SOLICITADO.AsCurrency then
           qry_itens_solinum_CD_STATUS.AsString := 'A'
        else
           BoxMensagem('Esse Item não pode ser reativado', 2);
     qry_itens_solinum_.post;
  end;
end;

procedure Tfrm_recebimento.dbg_numerario_itemEnter(Sender: TObject);
begin
  mi_baixar.Visible := True;
end;

procedure Tfrm_recebimento.dbg_numerario_itemExit(Sender: TObject);
begin
  mi_baixar.Visible := False;
end;

procedure Tfrm_recebimento.dbedt_vl_recebido_itemExit(Sender: TObject);
begin
  with datm_recebimento do
  begin
{    if ( qry_itens_receb_NR_LANCAMENTO.AsString <> '999' ) and
       ( qry_itens_receb_VL_RECEBIDO.AsCurrency > qry_itens_receb_VL_SOLICITADO.AsCurrency ) then
    begin
      BoxMensagem('Valor Recebido não pode exceder a Solicitação', 2);
      qry_itens_receb_VL_RECEBIDO.AsCurrency := qry_itens_receb_VL_SOLICITADO.AsCurrency;
    end;}
    qry_itens_receb_.Post;
    pnl_item_receb.Enabled := False;
    pnl_item_receb.Visible := False;
  end;
end;

procedure Tfrm_recebimento.dbg_recebimentoDblClick(Sender: TObject);
begin
  pnl_item_receb.Visible := True;
  pnl_item_receb.Enabled := True;
  datm_recebimento.qry_itens_receb_.Edit;
  dbedt_vl_recebido_item.SetFocus;
end;

procedure Tfrm_recebimento.btn_cancela_recebimentoClick(Sender: TObject);
var
  Mensagem : String;
begin
  with datm_recebimento do
  begin
    if qry_receb_IN_CANCELADO.AsString = '0' then
      mensagem := 'Confirma Cancelamento deste Recebimento?'
    else
      mensagem := 'Desfaz Cancelamento deste Recebimento?';

    if BoxMensagem(mensagem, 1) then
    begin
      qry_caixa_ctrl_.Close;
      qry_caixa_ctrl_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
      qry_caixa_ctrl_.Prepare;
      qry_caixa_ctrl_.Open;
      if Not qry_caixa_ctrl_.EOF then
      begin
        if ( qry_receb_DT_RECEBIMENTO.AsDateTime > dt_server ) or
           ( qry_receb_DT_RECEBIMENTO.AsDateTime < qry_caixa_ctrl_.FieldByName('DT_MOVIMENTO').AsDateTime ) then
        begin
          BoxMensagem( 'Movimento financeiro fechado, ou Data inválida', 2 );
          qry_caixa_ctrl_.Close;
          Exit;
        end;
      end;
      qry_caixa_ctrl_.Close;

      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(sp_cancela_recebimento);
        sp_cancela_recebimento.ParamByName('@nr_processo').AsString    := qry_receb_NR_PROCESSO.AsString;
        sp_cancela_recebimento.ParamByName('@nr_recebimento').AsString := qry_receb_NR_RECEBIMENTO.AsString;
        sp_cancela_recebimento.ParamByName('@cd_usuario').AsString     := str_cd_usuario;
        ExecStoredProc(sp_cancela_recebimento);
        CloseStoredProc(sp_cancela_recebimento);
        qry_solinum_.Close;
        qry_solinum_.Prepare;
        qry_solinum_.Open;
        qry_itens_solinum_.Close;
        qry_itens_solinum_.Prepare;
        qry_itens_solinum_.Open;
        qry_receb_.Close;
        qry_receb_.Prepare;
        qry_receb_.Open;
        qry_itens_receb_.Close;
        qry_itens_receb_.Prepare;
        qry_itens_receb_.Open;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;
  end;
end;

procedure Tfrm_recebimento.AbreProc;
begin
  with datm_recebimento do
  begin
    if ( ( ( Trim( msk_cd_grupo.Text ) <> '') or ( Trim( msk_cd_cliente.Text ) <> '') ) and
         ( Trim( msk_cd_unid_neg.Text ) <> '' ) and
         ( Trim( msk_cd_produto.Text ) <> '' ) ) or
         ( Trim( msk_nr_processo.Text ) <> '' ) then
    begin
      qry_processo_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_processo_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
      qry_processo_.ParamByName('CD_GRUPO').AsString    := msk_cd_grupo.Text;
      qry_processo_.ParamByName('CD_CLIENTE').AsString  := msk_cd_cliente.Text;
      if Trim( msk_nr_processo.Text ) = '' then
         qry_processo_.ParamByName('NR_PROCESSO').AsString := ''
      else
        qry_processo_.ParamByName('NR_PROCESSO').AsString :=
           Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
      qry_processo_.Prepare;
      qry_processo_.Open;
      qry_ref_cli_.Prepare;
      qry_ref_cli_.Open;
      qry_solinum_.Prepare;
      qry_solinum_.Open;
      qry_itens_solinum_.Prepare;
      qry_itens_solinum_.Open;
      qry_receb_.Prepare;
      qry_receb_.Open;
      qry_itens_receb_.Prepare;
      qry_itens_receb_.Open;
      pgctrl_receb.ActivePage := ts_processos;
      pgctrl_receb.Enabled := True;
      pgctrl_receb.TabStop := True;
      dbg_processo.SetFocus;

      if qry_cliente_BANCO_LIBERADO.AsInteger = 0 then
      begin
        ts_receb_autom.TabVisible := False;
      end
      else
      begin
        ts_receb_autom.TabVisible := True;
      end;
    end;
  end;
end;

procedure Tfrm_recebimento.FechaProc;
begin
  with datm_recebimento do
  begin
    qry_processo_.Close;
    qry_ref_cli_.Close;
    qry_solinum_.Close;
    qry_itens_solinum_.Close;
    qry_receb_.Close;
    qry_itens_receb_.Close;
    qry_autom_s_.Close;
    qry_autom_d_.Close;
    qry_banco_liberado_.Close;
  end;
end;

procedure Tfrm_recebimento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_recebimento.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_cd_produtoClick(nil);
    if Sender = msk_cd_grupo    then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente  then btn_co_clienteClick(nil);
    if Sender = msk_nr_processo then btn_co_processoClick(nil);
    if Sender = dbedt_cd_banco  then btn_co_bancoClick(nil);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_cd_unid_neg.Text := Copy( frm_pesq_proc.PesqNrProcesso, 1, 2 );
      msk_cd_unid_negExit(nil);
      msk_cd_produto.Text := Copy( frm_pesq_proc.PesqNrProcesso, 3, 2 );
      msk_cd_produtoExit(nil);
      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;
end;

procedure Tfrm_recebimento.dbg_receb_autom_sDblClick(Sender: TObject);
begin
  if BoxMensagem('Confirma o Recebimento?', 1) then
  begin
    with datm_recebimento do
    begin
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(sp_receb_autom);
        sp_receb_autom.ParamByName('@nr_processo').AsString      := qry_autom_s_NR_PROCESSO.AsString;
        sp_receb_autom.ParamByName('@dt_solicitacao').AsDateTime := qry_autom_s_DT_SOLICITACAO.AsDateTime;
        sp_receb_autom.ParamByName('@nr_lanc').AsString          := '';
        sp_receb_autom.ParamByName('@cd_usuario').AsString       := str_cd_usuario;
        sp_receb_autom.ParamByName('@cd_banco').AsString         := qry_banco_liberado_CD_BANCO.AsString;
        sp_receb_autom.ParamByName('@tipo').AsString             := '1';
        ExecStoredProc(sp_receb_autom);
        CloseStoredProc(sp_receb_autom);
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      qry_solinum_.Close;
      qry_solinum_.Prepare;
      qry_solinum_.Open;
      qry_itens_solinum_.Close;
      qry_itens_solinum_.Prepare;
      qry_itens_solinum_.Open;
      qry_itens_receb_.Close;
      qry_itens_receb_.Prepare;
      qry_itens_receb_.Open;
      qry_receb_.Close;
      qry_receb_.Prepare;
      qry_receb_.Open;
      qry_autom_s_.Close;
      qry_autom_s_.Prepare;
      qry_autom_s_.Open;
      qry_autom_d_.Close;
      qry_autom_d_.Prepare;
      qry_autom_d_.Open;
      btn_cancela_recebimento.Enabled := True;
      mi_cancela_recebimento.Enabled  := True;
    end;
  end;
end;

procedure Tfrm_recebimento.dbg_receb_autom_dDblClick(Sender: TObject);
begin
  if BoxMensagem('Confirma o Recebimento?', 1) then
  begin
    with datm_recebimento do
    begin
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(sp_receb_autom);
        sp_receb_autom.ParamByName('@nr_processo').AsString      := qry_autom_d_NR_PROCESSO.AsString;
        sp_receb_autom.ParamByName('@dt_solicitacao').AsDateTime := Time;
        sp_receb_autom.ParamByName('@nr_lanc').AsString          := qry_autom_d_NR_LANCAMENTO.AsString;
        sp_receb_autom.ParamByName('@cd_usuario').AsString       := str_cd_usuario;
        sp_receb_autom.ParamByName('@cd_banco').AsString         := qry_banco_liberado_CD_BANCO.AsString;
        sp_receb_autom.ParamByName('@tipo').AsString             := '2';
        ExecStoredProc(sp_receb_autom);
        CloseStoredProc(sp_receb_autom);
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      qry_solinum_.Close;
      qry_solinum_.Prepare;
      qry_solinum_.Open;

      qry_itens_solinum_.Close;
      qry_itens_solinum_.Prepare;
      qry_itens_solinum_.Open;

      qry_itens_receb_.Close;
      qry_itens_receb_.Prepare;
      qry_itens_receb_.Open;

      qry_receb_.Close;
      qry_receb_.Prepare;
      qry_receb_.Open;

      qry_autom_s_.Close;
      qry_autom_s_.Prepare;
      qry_autom_s_.Open;

      qry_autom_d_.Close;
      qry_autom_d_.Prepare;
      qry_autom_d_.Open;

      btn_cancela_recebimento.Enabled := True;
      mi_cancela_recebimento.Enabled  := True;
    end;
  end;
end;

procedure Tfrm_recebimento.dbedt_vl_rec2Exit(Sender: TObject);
var
vl_solicitacao : Double;
begin
  with datm_recebimento do
  begin
    if ( qry_receb_.State in [dsEdit, dsInsert] ) then
    begin
      vl_solicitacao := qry_receb_VL_RECEBIMENTO.AsFloat;
      qry_solic_pend_.Close;
      if Trim( msk_nr_processo.Text ) <> '' then
      begin
        qry_solic_pend_.ParamByName('CD_CLIENTE').AsString  := qry_processo_CD_CLIENTE.AsString;
        qry_solic_pend_.ParamByName('CD_UNID_NEG').AsString := qry_processo_CD_UNID_NEG.AsString;
        qry_solic_pend_.ParamByName('CD_PRODUTO').AsString  := qry_processo_CD_PRODUTO.AsString;
      end
      else
      begin
        qry_solic_pend_.ParamByName('CD_CLIENTE').AsString  := Trim( msk_cd_cliente.Text );
        qry_solic_pend_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
        qry_solic_pend_.ParamByName('CD_PRODUTO').AsString  := Trim( msk_cd_produto.Text );
      end;
      qry_solic_pend_.ParamByName('VL_SOLICITADO').AsFloat := vl_solicitacao;
      qry_solic_pend_.Prepare;
      qry_solic_pend_.Open;
      if qry_solic_pend_.RecordCount > 0 then
      begin
        qry_receb_.Cancel;
        qry_processo_.Locate('NR_PROCESSO', qry_solic_pend_.FieldByName('NR_PROCESSO').AsString, [loCaseInsensitive] );
        qry_solinum_.Locate('NR_PROCESSO' , qry_solic_pend_.FieldByName('NR_PROCESSO').AsString, [loCaseInsensitive] );
        qry_receb_.Close;
        qry_receb_.Prepare;
        qry_receb_.Open;
        qry_receb_.Last;
        nr_recebimento := qry_receb_NR_RECEBIMENTO.AsString;
        if nr_recebimento = '' then
          nr_recebimento := '001'
        else
          nr_recebimento := StrZero(StrToInt(nr_recebimento)+1,3);

        qry_receb_.Append;
        qry_receb_NR_PROCESSO.AsString        := qry_processo_NR_PROCESSO.AsString;
        qry_receb_NR_RECEBIMENTO.AsString     := nr_recebimento;
        qry_receb_DT_RECEBIMENTO.AsDateTime   := dt_server;
        qry_receb_CD_USUARIO.AsString         := str_cd_usuario;
        qry_receb_VL_RECEBIMENTO.AsFloat      := vl_solicitacao;

        pnl_selecao.Enabled                   := False;
        pnl_item_receb.Enabled                := False;
        pnl_item_receb.Visible                := False;

        pgctrl_receb.Enabled                  := True;
        pgctrl_receb.TabStop                  := True;
        ts_distribuicao_receb.TabVisible      := True;
        pgctrl_receb.ActivePage               := ts_distribuicao_receb;
        pnl_recebimento.Enabled               := True;
        dbedt_vl_recebimento.SetFocus;
        btn_mi (False, True, True, False);
        btn_cancela_recebimento.Enabled       := False;
        mi_cancela_recebimento.Enabled        := False;

        lbl_vl_rec2.Visible   := False;
        dbedt_vl_rec2.Visible := False;

      end
      else
      begin
        BoxMensagem('Não existem solicitações de numerário pendentes neste valor!', 2);
        qry_receb_VL_RECEBIMENTO.AsFloat      := 0;
        dbedt_vl_rec2.SetFocus;
      end;
    end;
  end;
end;
procedure Tfrm_recebimento.msk_cd_clienteEnter(Sender: TObject);
begin
  st_cliente := msk_cd_cliente.Text;
end;

procedure Tfrm_recebimento.btn_imprimirClick(Sender: TObject);
var str_data, str_mes: String;
begin
  Str_Data := FormatDateTime('dd/mm/yyyy', datm_recebimento.qry_receb_DT_RECEBIMENTO.AsDateTime );
  case StrtoInt( Copy( Str_Data, 4, 2 ) ) of
       1    : str_mes := 'Janeiro';
       2    : str_mes := 'Fevereiro';
       3    : str_mes := 'Março';
       4    : str_mes := 'Abril';
       5    : str_mes := 'Maio';
       6    : str_mes := 'Junho';
       7    : str_mes := 'Julho';
       8    : str_mes := 'Agosto';
       9    : str_mes := 'Setembro';
       10   : str_mes := 'Outubro';
       11   : str_mes := 'Novembro';
       12   : str_mes := 'Dezembro';
  end;

  Application.CreateForm(Tfrm_print_recibo_old, frm_print_recibo_old);
  frm_print_recibo_old.lbl_cliente.Caption := dbedt_nm_cliente2.Text;
  frm_print_recibo_old.lbl_quantia.Caption := Extenso( datm_recebimento.qry_receb_VL_RECEBIMENTO.AsFloat );
  frm_print_recibo_old.lbl_valor.Caption   := FormatFloat('#0,.00', datm_recebimento.qry_receb_VL_RECEBIMENTO.AsFloat );
  frm_print_recibo_old.vl_recibo           := datm_recebimento.qry_receb_VL_RECEBIMENTO.AsFloat;
  frm_print_recibo_old.lbl_data.Caption    := Copy( Str_Data, 1,2 ) + ' de ' + str_mes + ' de ' + Copy( Str_Data, 7,4 );
  frm_print_recibo_old.nr_proc             := datm_recebimento.qry_receb_NR_PROCESSO.asString;
  frm_print_recibo_old.ShowModal;
end;

procedure Tfrm_recebimento.msk_cd_grupoEnter(Sender: TObject);
begin
  st_grupo := msk_cd_grupo.Text;
end;

procedure Tfrm_recebimento.msk_nr_processoEnter(Sender: TObject);
begin
  st_processo := msk_nr_processo.Text;
end;

procedure Tfrm_recebimento.msk_cd_grupoExit(Sender: TObject);
var foco : boolean;
begin
  if lincluindo or ( st_grupo = Trim( msk_cd_grupo.Text ) ) then Exit;
  if Trim ( msk_cd_grupo.Text ) = '' then
  begin
    edt_nm_grupo.Text := 'Todos';
  end
  else
  begin
    ValCodEdt( msk_cd_grupo );
    with datm_recebimento do
    begin
      qry_grupo_.Close;
      qry_grupo_.ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
      qry_grupo_.Prepare;
      qry_grupo_.Open;
      if Not qry_grupo_.EOF then
      begin
        edt_nm_grupo.Text := qry_grupo_NM_GRUPO.AsString;
        foco := Not Habilitacao;
      end
      else
      begin
        edt_nm_grupo.clear;
        BoxMensagem( 'Grupo não cadastrado/ativo!', 2 );
        foco := True;
      end;
      qry_grupo_.Close;
    end;
    if foco then
    begin
      pgctrl_receb.ActivePage := ts_processos;
      msk_cd_grupo.SetFocus;
    end;
  end;
  FechaProc;
  AbreProc;
end;

procedure Tfrm_recebimento.msk_nr_processoExit(Sender: TObject);
var foco : boolean;
begin
  if lincluindo or ( st_processo = Trim( msk_nr_processo.Text ) ) then Exit;
  if Trim( msk_nr_processo.Text ) <> '' then
  begin
    with datm_recebimento do
    begin
      qry_proc_pesq_.Close;
      qry_proc_pesq_.ParamByName('NR_PROCESSO').AsString :=
         Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
      qry_proc_pesq_.Prepare;
      qry_proc_pesq_.Open;
      if Not qry_proc_pesq_.EOF then
      begin
        foco := Not Habilitacao;
      end
      else
      begin
        BoxMensagem( 'Processo não cadastrado/Cancelado/Liberado/Em Produção!', 2 );
        foco := True;
      end;
      qry_proc_pesq_.Close;
    end;
    if foco then
    begin
      pgctrl_receb.ActivePage := ts_processos;
      msk_nr_processo.SetFocus;
    end;
  end;
  FechaProc;
  AbreProc;
end;

procedure Tfrm_recebimento.btn_co_grupoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_grupo, frm_grupo);
  with frm_grupo do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_grupo.Cons_OnLine_Texto := msk_cd_grupo.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_grupo.Text := frm_grupo.Cons_OnLine_Texto;
    frm_recebimento.msk_cd_grupoExit(nil);
  end;
end;

procedure Tfrm_recebimento.btn_co_processoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_consulta_processo, frm_consulta_processo);
  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := msk_cd_produto.Text;
  frm_consulta_processo.ShowModal;
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  if (frm_consulta_processo.Nr_Processo <> '') then
  begin
    msk_nr_processo.Text := Copy( frm_consulta_processo.Nr_Processo, 5, 14 );
    msk_nr_processoExit (nil);
  end;
end;

procedure Tfrm_recebimento.msk_cd_grupoChange(Sender: TObject);
begin
  if msk_cd_grupo.Text <> '' then
  begin
    msk_cd_cliente.Text    := '';
    msk_cd_cliente.Color   := clMenu;
    edt_nm_cliente.Text    := '';
    msk_cd_cliente.Enabled := False;
    btn_co_cliente.Enabled := False;
  end
  else
  begin
    msk_cd_cliente.Color   := clWindow;
    msk_cd_cliente.Enabled := True;
    btn_co_cliente.Enabled := True;
  end;
end;

procedure Tfrm_recebimento.msk_cd_clienteChange(Sender: TObject);
begin
  if msk_cd_cliente.Text <> '' then
  begin
    msk_cd_grupo.Text     := '';
    msk_cd_grupo.Color    := clMenu;
    edt_nm_grupo.Text     := '';
    msk_cd_grupo.Enabled  := False;
    btn_co_grupo.Enabled  := False;
  end
  else
  begin
    msk_cd_grupo.Color    := clWindow;
    msk_cd_grupo.Enabled  := True;
    btn_co_grupo.Enabled  := True;
  end;
end;

procedure Tfrm_recebimento.dbedt_dt_recebimentoExit(Sender: TObject);
begin
  with datm_recebimento do
  begin
    qry_caixa_ctrl_.Close;
    qry_caixa_ctrl_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
    qry_caixa_ctrl_.Prepare;
    qry_caixa_ctrl_.Open;
    if Not qry_caixa_ctrl_.EOF then
       if ( qry_receb_DT_RECEBIMENTO.AsDateTime > dt_server ) or
          ( qry_receb_DT_RECEBIMENTO.AsDateTime < qry_caixa_ctrl_.FieldByName('DT_MOVIMENTO').AsDateTime ) then
       BoxMensagem( 'Movimento financeiro fechado, ou Data inválida', 2 );
    qry_caixa_ctrl_.Close;
  end;
end;

end.
