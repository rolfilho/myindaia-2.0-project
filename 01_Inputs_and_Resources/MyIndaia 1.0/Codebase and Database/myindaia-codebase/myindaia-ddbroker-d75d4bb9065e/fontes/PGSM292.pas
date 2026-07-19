unit PGSM292;

Interface

uses
  Variants, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, DBCtrls, Grids, DBGrids, ComCtrls, StdCtrls, Buttons, ExtCtrls, Db,
  DBTables, Menus, Funcoes;

type
  Tfrm_recebimento_ag = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    MainMenu1: TMainMenu;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    pgctrl_recebimento_ag: TPageControl;
    ts_lista: TTabSheet;
    dbgrid_pes_recebimento: TDBGrid;
    ts_rec_pendentes: TTabSheet;
    ts_rec_desemb: TTabSheet;
    dbg_numerario: TDBGrid;
    dbgrid_item_des: TDBGrid;
    pnl_recebimento: TPanel;         
    Label10: TLabel;
    Label11: TLabel;
    btn_co_banco: TSpeedButton;
    Label12: TLabel;
    Label13: TLabel;
    dbedt_vl_recebimento: TDBEdit;
    dbedt_cd_banco: TDBEdit;
    dbedt_nm_banco: TDBEdit;
    dbedt_nr_recebimento: TDBEdit;
    dbedt_dt_recebimento: TDBEdit;
    ts_rec_ag: TTabSheet;
    dbgrid_proc: TDBGrid;
    DBGrid3: TDBGrid;
    Panel2: TPanel;
    Label14: TLabel;
    btn_co_bco_ag: TSpeedButton;
    Label15: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    dbedt_cd_bco_ag: TDBEdit;
    dbedt_nm_bco_ag: TDBEdit;
    DBEdit4: TDBEdit;
    dbedt_dt_receb_ag: TDBEdit;
    DBEdit1: TDBEdit;
    btn_pesq: TSpeedButton;
    grid_remessa: TDBGrid;
    btn_receber: TSpeedButton;
    btn_efetuar: TSpeedButton;
    btn_aplic_tarifario: TSpeedButton;
    mi_receber: TMenuItem;
    mi_baixar_receb: TMenuItem;
    mi_Pesquisar: TMenuItem;
    mi_atz_tarifa: TMenuItem;
    mi_canc_receb: TMenuItem;
    btn_canc_receb: TSpeedButton;
    btn_co_grupo: TSpeedButton;
    Label6: TLabel;
    dbgrid_pes_numerario: TDBGrid;
    pnl_tarifariao_desembaraco: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    btn_imprimir: TSpeedButton;
    pnl_efetiva_receb_ag: TPanel;
    Panel3: TPanel;
    lb_demostrativo: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    Panel1: TPanel;
    Label30: TLabel;
    btn_list_cliente: TSpeedButton;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label16: TLabel;
    btn_co_bc: TSpeedButton;
    Label19: TLabel;
    btn_co_unid_neg: TSpeedButton;
    edt_list_cliente: TEdit;
    edt_list_bco: TEdit;
    edit_nm_unid_neg: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    msk_list_cliente: TMaskEdit;
    msk_list_bco: TMaskEdit;
    msk_dt_inicio: TMaskEdit;
    msk_dt_fim: TMaskEdit;
    msk_vl_receb: TMaskEdit;
    rdgrp_tp_status: TRadioGroup;
    rdgp_tp_pesquisa: TRadioGroup;
    Panel4: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btn_co_unidade: TSpeedButton;
    btn_co_produto: TSpeedButton;
    btn_co_cliente: TSpeedButton;
    btn_co_processo: TSpeedButton;
    edt_nm_unid_neg2: TEdit;
    edt_nm_produto2: TEdit;
    edt_nm_cliente: TEdit;
    msk_cd_unid_neg2: TMaskEdit;
    msk_cd_produto2: TMaskEdit;
    msk_cd_cliente: TMaskEdit;
    msk_processo: TMaskEdit;
    msk_valor: TMaskEdit;
    rdgp_tp_servico: TRadioGroup;
    Panel5: TPanel;
    Label9: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    lb_restante2: TLabel;
    Label37: TLabel;
    dbradgrp_in_maior2: TDBRadioGroup;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    Panel6: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    lb_restante: TLabel;
    dbradgrp_in_maior: TDBRadioGroup;
    DBEdit7: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    btn_lista_rel: TSpeedButton;
    popmenu_lista_rel: TPopupMenu;
    mi_fat: TMenuItem;
    mi_recibo: TMenuItem;
    DBEdit9: TDBEdit;
    Label22: TLabel;
    pnl_efetiva_receb_des: TPanel;
    Panel8: TPanel;
    lb_demostrativo_des: TLabel;
    dbedt_dt_fatura: TDBEdit;
    Label23: TLabel;
    Panel7: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label24: TLabel;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    MaskEdit1: TMaskEdit;
    Label25: TLabel;
    SpeedButton2: TSpeedButton;
    Edit2: TEdit;
    MaskEdit2: TMaskEdit;
    Shape5: TShape;
    pnlTodos: TPanel;
    btn_co_produto2: TSpeedButton;
    edit_nm_produto: TEdit;
    msk_cd_produto: TMaskEdit;
    Label26: TLabel;
    Label27: TLabel;
    DBEdit10: TDBEdit;
    Shape6: TShape;
    Shape10: TShape;
    Shape19: TShape;
    Shape16: TShape;
    btn_devolucao: TSpeedButton;
    dbgrid_pes_devolucao: TDBGrid;
    btn_pagto: TSpeedButton;
    pnlDevolucao: TPanel;
    Shape9: TShape;
    Shape11: TShape;
    Shape7: TShape;
    Shape8: TShape;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Bevel1: TBevel;
    Label36: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    edtProcesso: TEdit;
    edtValorRecebido: TEdit;
    edtValorDevolver: TEdit;
    lbl1: TLabel;
    medt1: TMaskEdit;
    lbl2: TLabel;
    dbgrd1: TDBGrid;
    popFinalizarRecebimento: TPopupMenu;
    FinalizarRecebimento1: TMenuItem;
    procedure btn_sairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_co_unidadeClick(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure msk_cd_produto2Exit(Sender: TObject);
    procedure msk_cd_unid_neg2Exit(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure pgctrl_recebimento_agChange(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure msk_processoExit(Sender: TObject);
    procedure grid_remessaCellClick(Column: TColumn);
    procedure grid_remessaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure SaveBoolean();
    procedure msk_valorExit(Sender: TObject);
    procedure btn_receberClick(Sender: TObject);
    function  calc_vl_receber(vl_venda, vl_solicitado: real; tp_produto, cd_via, moeda:string; var valor:real): real;
    procedure btn_aplic_tarifarioClick(Sender: TObject);
    procedure dbedt_dt_receb_agChange(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure dbedt_cd_bco_agExit(Sender: TObject);
    procedure dbedt_cd_bco_agKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pgctrl_recebimento_agChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure btn_efetuarClick(Sender: TObject);
    procedure btn_co_bco_agClick(Sender: TObject);
    procedure msk_list_clienteExit(Sender: TObject);
    procedure msk_list_bcoExit(Sender: TObject);
    procedure btn_list_clienteClick(Sender: TObject);
    procedure btn_co_bcClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_canc_recebClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure rdgp_tp_pesquisaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure mi_fatClick(Sender: TObject);
    procedure btn_lista_relClick(Sender: TObject);
    procedure mi_reciboClick(Sender: TObject);
    procedure dbedt_cd_bancoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dbgrid_pes_numerarioDblClick(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure rdgrp_tp_statusClick(Sender: TObject);
    procedure rdgp_tp_servicoClick(Sender: TObject);
    procedure dbgrid_pes_numerarioDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgrid_pes_recebimentoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btn_co_produto2Click(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_produtoChange(Sender: TObject);
    procedure msk_cd_unid_negChange(Sender: TObject);
    procedure msk_list_clienteChange(Sender: TObject);
    procedure msk_vl_recebChange(Sender: TObject);
    procedure msk_cd_unid_neg2Change(Sender: TObject);
    procedure msk_cd_produto2Change(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure msk_valorChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtValorDevolverExit(Sender: TObject);
    procedure btn_devolucaoClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure btn_pagtoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FinalizarRecebimento1Click(Sender: TObject);
  private
    { Private declarations }
     a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_incluir, st_excluir : Boolean;

    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    procedure atz_distribui_recebimento;
    procedure baixa_recebimento_ag;
    procedure baixa_recebimento_des;
    procedure ExecutaConsulta;
    procedure ConsStatusRecebUsuario;
  public
    { Public declarations }
    lCons_OnLine, st_modificar : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
    cd_banco_extra :String[3];
  end;

var
  frm_recebimento_ag: Tfrm_recebimento_ag;
  FOriginalOptions : TDBGridOptions;

implementation

uses PGGP017, GSMLIB, PGSM280, PGGP001, ConsOnLineEx, PGSM024, PGSM119,
  PGSM041, pgft005, PGSM990, PGNM004, PGNM025;

{$R *.DFM}

procedure Tfrm_recebimento_ag.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  // btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_efetuar.Enabled  := not Salv;   mi_baixar_receb.Enabled  := not Salv;
  btn_salvar.Enabled   := Salv;       mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;       mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_recebimento_ag.Cancelar;
begin
  if datm_recebimento_ag.qry_recebimento_.State in [dsEdit] then
    datm_recebimento_ag.qry_recebimento_.Cancel;
  btn_mi(st_incluir, false, false, st_excluir);
end;

function Tfrm_recebimento_ag.Consiste: Boolean;
begin
  Consiste:=true;
  if pgctrl_recebimento_ag.ActivePage = ts_rec_ag then
  begin
    if dbedt_dt_receb_ag.Text ='  /  /    ' then
    begin
      Boxmensagem('Deve ser Preenchido a Data do Recebimento!',2);
      Consiste :=false;
      dbedt_dt_receb_ag.SetFocus;
      Exit;
    end;
    if dbedt_cd_bco_ag.Text ='' then
    begin
      Boxmensagem('Deve ser Preenchido O Banco do Recebimento!',2);
      Consiste :=false;
      dbedt_cd_bco_ag.SetFocus;
      Exit;
    end;
  end;
end;

function Tfrm_recebimento_ag.Grava: Boolean;
begin
  if pgctrl_recebimento_ag.ActivePage = ts_rec_ag then
  begin
    try
      datm_main.db_broker.StartTransaction;
      if datm_recebimento_ag.qry_recebimento_.State in [dsEdit] then
        datm_recebimento_ag.qry_recebimento_.Post;
      with TQuery.Create(Application) do
      begin
        DataBaseName := 'DBBROKER';
        Sql.Add(' UPDATE TRECEBIMENTO_PROCESSO_ITEM ');
        Sql.Add(' SET CD_BANCO_ITEM    = "'+datm_recebimento_ag.qry_recebimento_CD_BANCO.AsString+'"');
        Sql.Add(' WHERE NR_RECEBIMENTO = "'+datm_recebimento_ag.qry_recebimento_NR_RECEBIMENTO.AsString+'"');
        Sql.Add('   AND CD_CLIENTE     = "'+datm_recebimento_ag.qry_recebimento_CD_CLIENTE.AsString+'"');
        Sql.Add('   AND CD_UNID_NEG    = "'+datm_recebimento_ag.qry_recebimento_CD_UNID_NEG.AsString+'"');
        ExecSql;
        Free;
      end;
      datm_main.db_broker.Commit;
      datm_recebimento_ag.qry_receb_proc_item_.Close;
      datm_recebimento_ag.qry_receb_proc_item_.prepare;
      datm_recebimento_ag.qry_receb_proc_item_.open;
      Grava:=true;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          cancelar;
        Grava:=false;
        TrataErro(E);
      end;
    end;
  end;
  if pgctrl_recebimento_ag.ActivePage = ts_rec_desemb then
  begin
    try
      datm_main.db_broker.StartTransaction;
      if datm_recebimento_ag.qry_recebimento_.State in [dsEdit] then
        datm_recebimento_ag.qry_recebimento_.Post;
      atz_distribui_recebimento;
      datm_main.db_broker.Commit;
      with datm_recebimento_ag do
      begin
        qry_recebimento_processo_.close;
        qry_recebimento_processo_.ParamByName('NR_RECEBIMENTO').AsString:= qry_recebimento_NR_RECEBIMENTO.AsString;
        qry_recebimento_processo_.ParamByName('CD_CLIENTE').AsString:= qry_recebimento_CD_CLIENTE.AsString;
        qry_recebimento_processo_.ParamByName('CD_UNID_NEG').AsString:=qry_recebimento_CD_UNID_NEG.AsString;
        qry_recebimento_processo_.Prepare;
        qry_recebimento_processo_.Open;
        qry_receb_proc_item_.Close;
        qry_receb_proc_item_.prepare;
        qry_receb_proc_item_.open;
        if (formatfloat('0.00',qry_recebimento_VL_RECEBIMENTO.AsFloat) > formatfloat('0.00',qry_recebimento_VL_TOT_RECEBIDO.AsFloat)) then
        begin
          dbradgrp_in_maior.Visible:=true;
          lb_restante.Caption := formatfloat('0.00',strtofloat(formatfloat('0.00',qry_recebimento_VL_RECEBIMENTO.AsFloat))-
                                 strtofloat(formatfloat('0.00',qry_recebimento_VL_TOT_RECEBIDO.AsFloat))+
                                 strtofloat(formatfloat('0.00',qry_recebimento_VL_TT_ADICIONAL.AsFloat)));
        end else begin
          dbradgrp_in_maior.Visible:=false;
        end;
      end;
      Grava:=true;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          cancelar;
        Grava:=false;
        TrataErro(E);
      end;
    end;
  end;
  btn_mi(st_incluir, false, false, st_excluir)
end;

function Tfrm_recebimento_ag.VerAlt: Boolean;
begin
  VerAlt := True;
  if ( datm_recebimento_ag.qry_recebimento_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
  begin
    if BoxMensagem('Recebimento foi alterado' + #13#10 + 'Deseja salvar as alterações?', 1) then
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
    end else
      Cancelar;
  end;
end;

procedure Tfrm_recebimento_ag.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_recebimento_ag.FormCreate(Sender: TObject);
begin
  msk_dt_fim.text   :=datetostr(dt_server);
  msk_dt_inicio.text:=datetostr(dt_server);

  pnl_cadastro.Color := clMenuBroker;
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
  Application.CreateForm(Tdatm_recebimento_ag, datm_recebimento_ag);
  With TQuery.Create(Application) do
  begin
    DataBaseName:= 'DBBROKER';
    Sql.Add('SELECT CD_BANCO FROM TBANCO (NOLOCK) WHERE IN_EXTRA_CAIXA = "1" ');
    Open;
    cd_banco_extra:= Fields[0].AsString;
    Free;
  end;
  with datm_recebimento_ag do
  begin
    qry_traz_default_.Close;
    qry_traz_default_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_traz_default_.Open;
    msk_cd_unid_neg2.text:= qry_traz_default_CD_UNID_NEG.AsString;
    edt_nm_unid_neg2.text:= qry_traz_default_NM_UNID_NEG.AsString;
    msk_cd_unid_neg.text := qry_traz_default_CD_UNID_NEG.AsString;
    edit_nm_unid_neg.text:= qry_traz_default_NM_UNID_NEG.AsString;
    msk_cd_produto2.text:=qry_traz_default_CD_PRODUTO.AsString;
    edt_nm_produto2.text:=qry_traz_default_NM_PRODUTO.AsString;
    msk_cd_produto.text:=qry_traz_default_CD_PRODUTO.AsString;
    edit_nm_produto.text:=qry_traz_default_NM_PRODUTO.AsString;
  end;
  ts_rec_desemb.tabVisible    := false;
  ts_rec_pendentes.tabVisible := True;
  ts_rec_ag.tabVisible        := false;
  pgctrl_recebimento_ag.ActivePage := ts_lista;
  pgctrl_recebimento_agChange(nil);
  a_str_indices[0] := 'NR_PROCESSO';
  with cb_ordem do
  begin
    Clear;
    Items.Add('Processo');
    ItemIndex := 0;
  end;
  ExecutaConsulta;
  ConsStatusRecebUsuario;  //Rodrigo Capra
end;
 
procedure TFrm_recebimento_ag.ConsStatusRecebUsuario;
begin
  with TQuery.Create(Self) do
  begin
    DatabaseName := 'DBBROKER';
    Sql.Clear;
    Sql.Add('select IN_ALT_STATUS_RECEB from TUSUARIO ');
    Sql.Add('where');
    Sql.Add('  CD_USUARIO = ''' + str_cd_usuario + '''');
    Open;
    FinalizarRecebimento1.Enabled := FieldByName('IN_ALT_STATUS_RECEB').AsString = '1';
    Free;
  end;
end;

procedure Tfrm_recebimento_ag.btn_co_unidadeClick(Sender: TObject);
begin
  Cons_On_line_Texto( 'DBBROKER', 'TUNID_NEG', msk_cd_unid_neg2, 'Unidades de Negócio', 52, 'IN_ATIVO = 1' );
  msk_cd_unid_neg2Exit(Sender);
end;

procedure Tfrm_recebimento_ag.SpeedButton8Click(Sender: TObject);
var
  produto : string;
begin
  produto:=ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Unidade'],'CD_PRODUTO',nil);
  if produto <>'' then
  begin
    msk_cd_produto2.text:=produto;
    msk_cd_produto2Exit(Sender);
  end;
end;

procedure Tfrm_recebimento_ag.msk_cd_produto2Exit(Sender: TObject);
begin
  if msk_cd_produto2.Text <> '' then
  begin
    ValCodEdt( msk_cd_produto2 );
    datm_recebimento_ag.qry_pesquisa_.Active:=false;
    datm_recebimento_ag.qry_pesquisa_.Sql.Clear;
    datm_recebimento_ag.qry_pesquisa_.Sql.Add('SELECT NM_PRODUTO FROM TPRODUTO (NOLOCK) WHERE CD_PRODUTO="'+msk_cd_produto2.Text+'"');
    datm_recebimento_ag.qry_pesquisa_.Sql.Add('AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO from TUSUARIO_HABILITACAO (NOLOCK)');
    datm_recebimento_ag.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_recebimento_ag.qry_pesquisa_.Active:=true;
    if datm_recebimento_ag.qry_pesquisa_.RecordCount > 0 then
    begin
      edt_nm_produto2.text:= datm_recebimento_ag.qry_pesquisa_.Fields[0].AsString;
      datm_recebimento_ag.qry_pesquisa_.Close;
    end
    else
    begin
      datm_recebimento_ag.qry_pesquisa_.Close;
      edt_nm_produto2.Text := '';
      BoxMensagem('Código do Produto inválido ou não habilidado!', 2);
      msk_cd_produto2.SetFocus;
      Exit;
    end;
  end
  else
  begin
    Boxmensagem('O Produto deve ser informado!',2);
    msk_cd_produto2.SetFocus;
  end;
  ExecutaConsulta;
end;

procedure Tfrm_recebimento_ag.msk_cd_unid_neg2Exit(Sender: TObject);
begin
  if msk_cd_unid_neg2.Text <> '' then
  begin
    ValCodEdt( msk_cd_unid_neg2 );
    datm_recebimento_ag.qry_pesquisa_.Active:=false;
    datm_recebimento_ag.qry_pesquisa_.Sql.Clear;
    datm_recebimento_ag.qry_pesquisa_.Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG (NOLOCK) WHERE CD_UNID_NEG="'+msk_cd_unid_neg2.Text+'"');
    datm_recebimento_ag.qry_pesquisa_.Sql.Add('AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG from TUSUARIO_HABILITACAO (NOLOCK)');
    datm_recebimento_ag.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_recebimento_ag.qry_pesquisa_.Active:=true;
    if datm_recebimento_ag.qry_pesquisa_.RecordCount > 0 then
    begin
      edt_nm_unid_neg2.text:= datm_recebimento_ag.qry_pesquisa_.Fields[0].AsString;
      datm_recebimento_ag.qry_pesquisa_.Close;
    end
    else
    begin
      datm_recebimento_ag.qry_pesquisa_.Close;
      edt_nm_unid_neg2.Text := '';
      BoxMensagem('Código da Unidade de Negócio inválido!', 2);
      msk_cd_unid_neg2.SetFocus;
      Exit;
    end;
  end else begin
    Boxmensagem('A Unidade de Negócio deve ser informado!',2);
    msk_cd_unid_neg2.SetFocus;
  end;
  ExecutaConsulta;
end;


procedure Tfrm_recebimento_ag.btn_co_clienteClick(Sender: TObject);
begin
  msk_cd_cliente.text:= ConsultaOnLineExSQL('SELECT NM_EMPRESA, CD_EMPRESA, CGC_EMPRESA  FROM TEMPRESA_NAC (NOLOCK)',
                                            'Cadastro de Clientes', ['NM_EMPRESA' ,'CD_EMPRESA', 'CGC_EMPRESA'],
                                            ['Nome', 'Código', 'CGC Empresa'],'CD_EMPRESA',nil);
  msk_cd_clienteExit(Sender);
end;

procedure Tfrm_recebimento_ag.msk_cd_clienteExit(Sender: TObject);
begin
  if msk_cd_cliente.Text <> '' then
  begin
    ValCodEdt( msk_cd_cliente );
    datm_recebimento_ag.qry_pesquisa_.Active:=false;
    datm_recebimento_ag.qry_pesquisa_.Sql.Clear;
    datm_recebimento_ag.qry_pesquisa_.Sql.Add('SELECT NM_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA="'+msk_cd_cliente.Text+'"');
    datm_recebimento_ag.qry_pesquisa_.Active:=true;
    if datm_recebimento_ag.qry_pesquisa_.RecordCount > 0 then
    begin
      edt_nm_cliente.text:= datm_recebimento_ag.qry_pesquisa_.Fields[0].AsString;
      datm_recebimento_ag.qry_pesquisa_.Close;
    end else begin
      datm_recebimento_ag.qry_pesquisa_.Close;
      edt_nm_cliente.Text := '';
      BoxMensagem('Código do Cliente inválido!', 2);
      msk_cd_cliente.SetFocus;
      Exit;
    end;
  end
  else edt_nm_cliente.Text := '';
  ExecutaConsulta;
end;

procedure Tfrm_recebimento_ag.pgctrl_recebimento_agChange(Sender: TObject);
begin
  btn_receber.Enabled        := (pgctrl_recebimento_ag.ActivePage = ts_rec_pendentes);
  mi_receber.Enabled         := (pgctrl_recebimento_ag.ActivePage = ts_rec_pendentes);
  btn_efetuar.Enabled        := (pgctrl_recebimento_ag.ActivePage = ts_rec_ag) or (pgctrl_recebimento_ag.ActivePage = ts_rec_desemb);
  mi_baixar_receb.Enabled    := (pgctrl_recebimento_ag.ActivePage = ts_rec_ag) or (pgctrl_recebimento_ag.ActivePage = ts_rec_desemb);
  btn_pesq.Enabled           := (pgctrl_recebimento_ag.ActivePage = ts_rec_pendentes) or (pgctrl_recebimento_ag.ActivePage = ts_lista);
  btn_aplic_tarifario.Enabled:= (pgctrl_recebimento_ag.ActivePage = ts_rec_ag);
  mi_atz_tarifa.Enabled      := (pgctrl_recebimento_ag.ActivePage = ts_rec_ag);
  btn_canc_receb.Enabled     := (pgctrl_recebimento_ag.ActivePage = ts_rec_ag) or (pgctrl_recebimento_ag.ActivePage = ts_rec_desemb);
  mi_canc_receb.Enabled      := (pgctrl_recebimento_ag.ActivePage = ts_rec_ag) or (pgctrl_recebimento_ag.ActivePage = ts_rec_desemb);
  btn_imprimir.Enabled       := (pgctrl_recebimento_ag.ActivePage = ts_rec_ag) or (pgctrl_recebimento_ag.ActivePage = ts_rec_desemb);
  btn_lista_rel.Enabled      := (pgctrl_recebimento_ag.ActivePage = ts_rec_ag) or (pgctrl_recebimento_ag.ActivePage = ts_rec_desemb);
  mi_fat.Visible             := (pgctrl_recebimento_ag.ActivePage = ts_rec_ag);
  cb_ordem.Enabled           := (pgctrl_recebimento_ag.ActivePage = ts_lista);
  edt_chave.Enabled          := (pgctrl_recebimento_ag.ActivePage = ts_lista);
  if (pgctrl_recebimento_ag.ActivePage = ts_rec_ag) then
  begin
    with datm_recebimento_ag do
    begin
      qry_recebimento_.close;
      qry_recebimento_.ParamByName('NR_RECEBIMENTO').AsString:= qry_list_receb_NR_RECEBIMENTO.AsString;
      qry_recebimento_.ParamByName('CD_CLIENTE').AsString    := qry_list_receb_CD_CLIENTE.AsString;
      qry_recebimento_.ParamByName('CD_UNID_NEG').AsString   := qry_list_receb_CD_UNID_NEG.AsString;
      qry_recebimento_.Prepare;
      qry_recebimento_.Open;
      qry_recebimento_processo_.close;
      qry_recebimento_processo_.ParamByName('NR_RECEBIMENTO').AsString:= qry_list_receb_NR_RECEBIMENTO.AsString;
      qry_recebimento_processo_.ParamByName('CD_CLIENTE').AsString    := qry_list_receb_CD_CLIENTE.AsString;
      qry_recebimento_processo_.ParamByName('CD_UNID_NEG').AsString   := qry_list_receb_CD_UNID_NEG.AsString;
      qry_recebimento_processo_.Prepare;
      qry_recebimento_processo_.Open;
      qry_receb_proc_item_.Close;
      qry_receb_proc_item_.prepare;
      qry_receb_proc_item_.open;
      qry_moeda_tarifario_.Close;
      qry_moeda_tarifario_.Prepare;
      qry_moeda_tarifario_.Open;
      if  (formatfloat('0.00',qry_recebimento_VL_RECEBIMENTO.AsFloat) > formatfloat('0.00',qry_recebimento_VL_TOT_RECEBIDO.AsFloat)) then
      begin
        dbradgrp_in_maior.Visible:=true;
        lb_restante.Caption := formatfloat('0.00',strtofloat(formatfloat('0.00',qry_recebimento_VL_RECEBIMENTO.AsFloat))-
                               strtofloat(formatfloat('0.00',qry_recebimento_VL_TOT_RECEBIDO.AsFloat))+
                               strtofloat(formatfloat('0.00',qry_recebimento_VL_TT_ADICIONAL.AsFloat)));
      end else begin
        dbradgrp_in_maior.Visible:=false;
      end;
//      if qry_recebimento_IN_CAMBIO.AsString = '0' then
//      begin
        btn_aplic_tarifario.Enabled:=true;
        mi_atz_tarifa.Enabled      :=true;
//      end else begin
//        btn_aplic_tarifario.Enabled:=false;
//        mi_atz_tarifa.Enabled      :=false;
//      end;
    end;
  end;
  if pgctrl_recebimento_ag.ActivePage = ts_rec_desemb then
  begin
    with datm_recebimento_ag do
    begin
      qry_recebimento_.close;
      qry_recebimento_.ParamByName('NR_RECEBIMENTO').AsString:= qry_list_receb_NR_RECEBIMENTO.AsString;
      qry_recebimento_.ParamByName('CD_CLIENTE').AsString    := qry_list_receb_CD_CLIENTE.AsString;
      qry_recebimento_.ParamByName('CD_UNID_NEG').AsString   := qry_list_receb_CD_UNID_NEG.AsString;
      qry_recebimento_.Prepare;
      qry_recebimento_.Open;
      qry_recebimento_processo_.close;
      qry_recebimento_processo_.ParamByName('NR_RECEBIMENTO').AsString:= qry_list_receb_NR_RECEBIMENTO.AsString;
      qry_recebimento_processo_.ParamByName('CD_CLIENTE').AsString    := qry_list_receb_CD_CLIENTE.AsString;
      qry_recebimento_processo_.ParamByName('CD_UNID_NEG').AsString   := qry_list_receb_CD_UNID_NEG.AsString;
      qry_recebimento_processo_.Prepare;
      qry_recebimento_processo_.Open;
      qry_receb_proc_item_.Close;
      qry_receb_proc_item_.prepare;
      qry_receb_proc_item_.open;
      if  (formatfloat('0.00',qry_recebimento_VL_RECEBIMENTO.AsFloat) > formatfloat('0.00',qry_recebimento_VL_TOT_UTILIZADO.AsFloat)) then
      begin
        dbradgrp_in_maior2.Visible:=true;
        lb_restante2.Caption := formatfloat('0.00',strtofloat(formatfloat('0.00',qry_recebimento_VL_RECEBIMENTO.AsFloat))-
                               (strtofloat(formatfloat('0.00',qry_recebimento_VL_TOT_UTILIZADO.AsFloat))+strtofloat(formatfloat('0.00',qry_recebimento_VL_TT_ADICIONAL.AsFloat))));
      end else begin
        dbradgrp_in_maior2.Visible:=false;
      end;
    end;
  end;
  ExecutaConsulta;
end;

procedure Tfrm_recebimento_ag.ExecutaConsulta;
var
  slq_text_proc, nr_processo : string;
begin
  if pgctrl_recebimento_ag.ActivePage = ts_rec_pendentes then
  begin
    if (msk_cd_unid_neg2.Text <> '') then     // Consiste se os campos obrigatórios estão preenchidos
    begin
      datm_recebimento_ag.qry_notificacao_pend_.close;
      if msk_processo.text <> '' then
      begin
        nr_processo := msk_cd_unid_neg2.text + msk_cd_produto2.text + msk_processo.text;
        with TQuery.Create(Application) do
        begin
          DatabaseName := 'DBBROKER';
          SQL.Clear;
          SQL.Add('SELECT COUNT(*) FROM TRECEBIMENTO_PROCESSO ( NOLOCK ) WHERE NR_PROCESSO = ' + quotedstr(nr_processo) + ' AND CD_STATUS = ''A''');
          Open;
          if Fields[0].AsInteger > 0 then
          begin
            BoxMensagem('Já existem recebimentos em aberto para este processo " ' + nr_processo + ' ".'+#10#13+'Procure por este recebimento na guia Pesquisa e utilize-o.',3);
            msk_processo.Clear;
            Exit;
          end;
          Close;
          Free;
        end;
        datm_recebimento_ag.qry_notificacao_pend_.Sql[4]:= 'TP.NR_PROCESSO ='+quotedstr(nr_processo)+ ' AND ';
      end else
        datm_recebimento_ag.qry_notificacao_pend_.Sql[4]:= '';
      if msk_cd_cliente.text <> '' then
        datm_recebimento_ag.qry_notificacao_pend_.Sql[5]:= ' TP.CD_CLIENTE = '+quotedstr(msk_cd_cliente.text)+ ' AND '
      else datm_recebimento_ag.qry_notificacao_pend_.Sql[5]:= '';
      IF msk_valor.Text <> '' then
      begin
        datm_recebimento_ag.qry_notificacao_pend_.Sql[12]:=' AND TN.VL_SOLICITADO = :VL_SOLICITADO ';
        datm_recebimento_ag.qry_notificacao_pend_.ParamByname('VL_SOLICITADO').AsFloat := strtofloat( msk_valor.TEXT);
      end else
        datm_recebimento_ag.qry_notificacao_pend_.Sql[12]:='';
      datm_recebimento_ag.qry_notificacao_pend_.ParamByname('CD_UNID_NEG').AsString:= msk_cd_unid_neg2.text;
      datm_recebimento_ag.qry_notificacao_pend_.ParamByname('CD_PRODUTO').AsString := msk_cd_produto2.text;
      datm_recebimento_ag.qry_notificacao_pend_.ParamByname('TP_SERVICO').AsString := inttostr(rdgp_tp_servico.ItemIndex);
      datm_recebimento_ag.qry_notificacao_pend_.Prepare;
      datm_recebimento_ag.qry_notificacao_pend_.Open;
      grid_remessa.SelectedIndex :=  2;
    end;
  end;
  if pgctrl_recebimento_ag.ActivePage = ts_lista then
  begin
    if (msk_cd_unid_neg.Text <> '') then    // Consiste se os campos obrigatórios estão preenchidos
    begin
      if rdgp_tp_pesquisa.ItemIndex = 1 then
      begin
        datm_recebimento_ag.qry_list_receb_.Close;
        if msk_list_bco.text <> '' then
          datm_recebimento_ag.qry_list_receb_.Sql[12]:= 'AND TR.CD_BANCO='+Quotedstr(msk_list_bco.text)
        else datm_recebimento_ag.qry_list_receb_.Sql[12]:= '';
        if msk_vl_receb.Text <> '' then
        begin
          datm_recebimento_ag.qry_list_receb_.Sql[13]:= 'AND TR.VL_RECEBIMENTO=:VL_RECEBIMENTO';
          datm_recebimento_ag.qry_list_receb_.ParamByName('VL_RECEBIMENTO').AsFloat:=strtofloat(msk_vl_receb.Text);
        end else
          datm_recebimento_ag.qry_list_receb_.Sql[13]:= '';
        if rdgrp_tp_status.Itemindex = 0 then
          datm_recebimento_ag.qry_list_receb_.Sql[14]:= 'AND TR.IN_ABERTO = "A"';
        if rdgrp_tp_status.Itemindex = 1 then
          datm_recebimento_ag.qry_list_receb_.Sql[14]:= 'AND TR.IN_ABERTO = "B"';
        if rdgrp_tp_status.Itemindex = 2 then
          datm_recebimento_ag.qry_list_receb_.Sql[14]:= 'AND TR.IN_ABERTO = "C"';
        if rdgrp_tp_status.Itemindex = 3 then
          datm_recebimento_ag.qry_list_receb_.Sql[14]:= 'AND TR.IN_ABERTO = "P"';
        if rdgrp_tp_status.Itemindex = 4 then
          datm_recebimento_ag.qry_list_receb_.Sql[14]:= 'AND TR.IN_ABERTO IN("A","B","C", "P" )';
        datm_recebimento_ag.qry_list_receb_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.text;
        datm_recebimento_ag.qry_list_receb_.ParamByName('CD_PRODUTO').AsString  := trim(msk_cd_produto.Text);
        datm_recebimento_ag.qry_list_receb_.ParamByName('CD_GRUPO').AsString    := MaskEdit1.text;
        datm_recebimento_ag.qry_list_receb_.ParamByName('CD_CLIENTE').AsString  := msk_list_cliente.text;
        datm_recebimento_ag.qry_list_receb_.ParamByName('DT_INICIO').AsString   := msk_dt_inicio.text;
        datm_recebimento_ag.qry_list_receb_.ParamByName('DT_FINAL').AsString    := msk_dt_fim.text;
        datm_recebimento_ag.qry_list_receb_.Open;
      end else if rdgp_tp_pesquisa.ItemIndex = 0 then
      begin
        datm_recebimento_ag.qry_pesq_notificacao_.Close;
        datm_recebimento_ag.qry_pesq_notificacao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.text;
        datm_recebimento_ag.qry_pesq_notificacao_.ParamByName('CD_PRODUTO').AsString  := trim(msk_cd_produto.Text);
        datm_recebimento_ag.qry_pesq_notificacao_.ParamByName('CD_GRUPO').AsString    := MaskEdit1.text;
        datm_recebimento_ag.qry_pesq_notificacao_.ParamByName('CD_CLIENTE').AsString  := msk_list_cliente.text;
        datm_recebimento_ag.qry_pesq_notificacao_.ParamByName('DT_INICIO').AsString   := msk_dt_inicio.text;
        datm_recebimento_ag.qry_pesq_notificacao_.ParamByName('DT_FIM').AsString      := msk_dt_fim.text;
        if rdgrp_tp_status.Itemindex = 0 then
          datm_recebimento_ag.qry_pesq_notificacao_.Sql[6]:= ' TN.CD_STATUS="A" ';
        if rdgrp_tp_status.Itemindex = 1 then
          datm_recebimento_ag.qry_pesq_notificacao_.Sql[6]:= ' TN.CD_STATUS="B" ';
        if rdgrp_tp_status.Itemindex = 2 then
          datm_recebimento_ag.qry_pesq_notificacao_.Sql[6]:= ' TN.CD_STATUS="C" ';
        if rdgrp_tp_status.Itemindex = 3 then
          datm_recebimento_ag.qry_pesq_notificacao_.Sql[6]:= ' TN.CD_STATUS="P" ';
        if rdgrp_tp_status.Itemindex = 4 then
          datm_recebimento_ag.qry_pesq_notificacao_.Sql[6]:= ' TN.CD_STATUS IN("A","B","C","P") ';
        if msk_vl_receb.Text <> '' then
        begin
          datm_recebimento_ag.qry_pesq_notificacao_.Sql[13]:= 'AND TN.VL_SOLICITADO=:VL_SOLICITADO';
          datm_recebimento_ag.qry_pesq_notificacao_.ParamByName('VL_SOLICITADO').AsFloat:=strtofloat(msk_vl_receb.Text);
        end else
          datm_recebimento_ag.qry_pesq_notificacao_.Sql[13]:= '';
        datm_recebimento_ag.qry_pesq_notificacao_.Prepare;
        datm_recebimento_ag.qry_pesq_notificacao_.Open;
      end else if rdgp_tp_pesquisa.ItemIndex = 2 then
      begin
        datm_recebimento_ag.qry_devolucao_.Close;
        if rdgrp_tp_status.Itemindex = 0 then
          datm_recebimento_ag.qry_devolucao_.SQL.Strings[4] := ' AND IN_TRANSFERIDO = ''0'''
        else if rdgrp_tp_status.Itemindex = 1 then
          datm_recebimento_ag.qry_devolucao_.SQL.Strings[4] := ' AND IN_TRANSFERIDO = ''1'''
        else datm_recebimento_ag.qry_devolucao_.SQL.Strings[4] := ' ';
        datm_recebimento_ag.qry_devolucao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.text;
        datm_recebimento_ag.qry_devolucao_.ParamByName('DT_INICIO').AsString  := msk_dt_inicio.text;
        datm_recebimento_ag.qry_devolucao_.ParamByName('DT_FIM').AsString   := msk_dt_fim.text;
        datm_recebimento_ag.qry_devolucao_.Prepare;
        datm_recebimento_ag.qry_devolucao_.Open;
      end;
    end;
  end;
end;

procedure Tfrm_recebimento_ag.btn_co_processoClick(Sender: TObject);
var
  processo : string;
begin
  processo := ConsultaOnLineExSql('SELECT SUBSTRING(NR_PROCESSO,5,14)AS NR_PROCESSO, TPR.CD_CLIENTE,' +
                                  ' (SELECT AP_EMPRESA FROM TEMPRESA_NAC (NOLOCK) CL WHERE CL.CD_EMPRESA = TPR.CD_CLIENTE) AS NM_CLIENTE,' +
                                  ' TPR.CD_SERVICO,(SELECT TS.NM_SERVICO FROM TSERVICO TS (NOLOCK) WHERE TS.CD_SERVICO =TPR.CD_SERVICO) NM_SERVICO'+
                                  ' FROM TPROCESSO TPR (NOLOCK) WHERE TPR.CD_PRODUTO = ' + QuotedStr(msk_cd_produto2.Text) +
                                  ' AND TPR.CD_UNID_NEG = '+ QuotedStr(msk_cd_unid_neg2.Text) +
                                  ' AND TPR.IN_LIBERADO = "1"  ',
                                  'Processos',['NR_PROCESSO','CD_CLIENTE','NM_CLIENTE','CD_SERVICO','NM_SERVICO'],
                                  ['Processo','Cód.','Cliente','Cód.','Serviço'],'NR_PROCESSO',nil);
  if processo <>'' then
  begin
    msk_processo.text:=processo;
    msk_processoExit(Sender);
  end;
end;

procedure Tfrm_recebimento_ag.msk_processoExit(Sender: TObject);
var
  processo : string[20];
begin
  if msk_processo.Text <> '' then
  begin
    processo:=msk_cd_unid_neg2.text + msk_cd_produto2.text + msk_processo.Text;
    datm_recebimento_ag.qry_pesquisa_.Active:=false;
    datm_recebimento_ag.qry_pesquisa_.Sql.Clear;
    datm_recebimento_ag.qry_pesquisa_.Sql.Add('SELECT NR_PROCESSO FROM TPROCESSO (NOLOCK)');
    datm_recebimento_ag.qry_pesquisa_.Sql.Add(' WHERE NR_PROCESSO="'+processo+'"');
    datm_recebimento_ag.qry_pesquisa_.Active:=true;
    datm_recebimento_ag.qry_pesquisa_.Close;
    if datm_recebimento_ag.qry_pesquisa_.RecordCount = 0 then
    begin
      msk_processo.Text := '';
      BoxMensagem('Código do Processo inválido!', 2);
      msk_processo.SetFocus;
      Exit;
    end;
  end;
  ExecutaConsulta;
end;

procedure Tfrm_recebimento_ag.grid_remessaCellClick(Column: TColumn);
begin
  if grid_remessa.SelectedIndex = 0  then
    SaveBoolean();
end;

procedure Tfrm_recebimento_ag.grid_remessaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;  State: TGridDrawState);
const
  CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,
  DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  CheckBoxRectangle : TRect;
  ctrl_booleano : Boolean;
begin
  if  Column.FieldName = 'IN_SELECIONADO' then
  begin
    if datm_recebimento_ag.qry_notificacao_pend_IN_SELECIONADO.AsString = '0' then
      ctrl_booleano :=false
    else ctrl_booleano:= true;
    grid_remessa.Canvas.FillRect(Rect);
    CheckBoxRectangle.Left := Rect.Left + 0;
    CheckBoxRectangle.Right := Rect.Right - 0;
    CheckBoxRectangle.Top := Rect.Top + 0;
    CheckBoxRectangle.Bottom := Rect.Bottom - 0;
    DrawFrameControl(grid_remessa.Canvas.Handle, CheckBoxRectangle, DFC_BUTTON, CtrlState[ctrl_booleano]);
  end;
end;

procedure Tfrm_recebimento_ag.SaveBoolean;
begin
  IF (datm_recebimento_ag.qry_notificacao_pend_NR_PROCESSO_VINC.AsString <> '') and
     (datm_recebimento_ag.qry_notificacao_pend_TP_SERVICO.AsString = '1') then
  begin
    With TQuery.Create(Application) do
    begin
      DataBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT COUNT(NR_PROCESSO) FROM TNUMERARIO_NOTIFICA (NOLOCK) WHERE ');
      Sql.Add(' NR_PROCESSO = "'+datm_recebimento_ag.qry_notificacao_pend_NR_PROCESSO_VINC.AsString+'"');
      Sql.Add(' AND CD_STATUS = "A" ');
      Open;
      if Fields[0].AsInteger > 0 then
      begin
        Boxmensagem('Este Processo de Agenciamento esta Vinculado ao Processo ' +
                     datm_recebimento_ag.qry_notificacao_pend_NR_PROCESSO_VINC.AsString + #13#10 +
                    ' Recebimento não permitido. ', 2);
        Free;
        Exit;
      end;
      Free;
    end;
  end;
  if not(datm_recebimento_ag.qry_notificacao_pend_.State in [dsEdit]) then
    datm_recebimento_ag.qry_notificacao_pend_.Edit;
  if datm_recebimento_ag.qry_notificacao_pend_IN_SELECIONADO.AsString = '0' then
    datm_recebimento_ag.qry_notificacao_pend_IN_SELECIONADO.AsString :='1'
  else datm_recebimento_ag.qry_notificacao_pend_IN_SELECIONADO.AsString := '0' ;
  datm_recebimento_ag.qry_notificacao_pend_.Post;
end;

procedure Tfrm_recebimento_ag.msk_valorExit(Sender: TObject);
var
  aux : real;
begin
  try
    if msk_valor.text <>'' then
      aux:= strtofloat(msk_valor.text);
  except
    Boxmensagem('Valor Invalído!',2);
    msk_valor.SetFocus;
  end;
  ExecutaConsulta;
end;

procedure Tfrm_recebimento_ag.btn_receberClick(Sender: TObject);
var
  PROCESSOS, RECEBIMENTO, ITEM, Atz_tarifario : TQuery;
  I, J, vl_receber, vl_utilizado, vl_tarifa, vl_tot_recebido : Real;
  st_cd_cliente : String[5];
  nr_recebimento : String[6];
  ds_item : TDataSource;
  cd_banco : string[4];
begin
  PROCESSOS := TQuery.Create(Application);
  PROCESSOS.DataBaseName:='DBBROKER';
  PROCESSOS.Sql.Clear;
  PROCESSOS.Sql.Text := datm_recebimento_ag.qry_notificacao_pend_.sql.Text;
  PROCESSOS.Sql.Add(' AND TN.IN_SELECIONADO = "1"');
  PROCESSOS.DataSource:= datm_recebimento_ag.ds_notif_pend;
  PROCESSOS.Open;
  if PROCESSOS.IsEmpty then
  begin
    Boxmensagem('Não existem processos selecionados!',2);
    Exit;
  end else if PROCESSOS.RecordCount > 1 then
  begin
    Boxmensagem('Selecione apenas um processo para a montagem!',2);
    Exit;
  end;
  try
    st_cd_cliente:=PROCESSOS.FieldByName('CD_CLIENTE').AsString;
    ds_item:= TDataSource.Create(Application);
    ds_item.DataSet:= PROCESSOS;
    with TQuery.Create(Application)do
    begin  //busca o bco cadastrado para o
      DataBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add(' SELECT CD_BANCO_COM FROM TCLIENTE_SERVICO (NOLOCK) ');
      Sql.Add(' WHERE CD_CLIENTE="'+st_cd_cliente+'"');
      Sql.Add('  AND CD_UNID_NEG = "'+msk_cd_unid_neg2.text+'"');
      Sql.Add('  AND CD_PRODUTO = "'+msk_cd_produto2.text+'"');
      Open;
      cd_banco:=Fields[0].AsString;
      Free;
    end;
    if not datm_main.db_broker.InTransaction then
      datm_main.db_broker.StartTransaction;
    RECEBIMENTO := TQuery.Create(Application);
    RECEBIMENTO.DataBaseName:='DBBROKER';
    RECEBIMENTO.Sql.Add('SELECT MAX(NR_RECEBIMENTO) FROM TRECEBIMENTO_AG (NOLOCK) WHERE ');
    RECEBIMENTO.Sql.Add(' CD_CLIENTE = "'+st_cd_cliente+'"');
    RECEBIMENTO.Sql.Add(' AND CD_UNID_NEG = "'+msk_cd_unid_neg2.text+'"');
    RECEBIMENTO.Open;
    if RECEBIMENTO.Fields[0].AsString = '' then
      nr_recebimento:='000001'
    else nr_recebimento := formatfloat('000000',strtofloat(RECEBIMENTO.fields[0].AsString) + 1);
    RECEBIMENTO.close;
    RECEBIMENTO.Sql.Clear; //incluir recebimento
    RECEBIMENTO.Sql.Add('INSERT INTO TRECEBIMENTO_AG (NR_RECEBIMENTO, CD_CLIENTE, CD_UNID_NEG, DT_RECEBIMENTO, CD_USUARIO,');
    RECEBIMENTO.Sql.Add(' IN_CANCELADO, IN_CAMBIO, IN_UNIFICADO, VL_RECEBIMENTO, QT_ITENS_RECEB, CD_BANCO, ');
    RECEBIMENTO.Sql.Add('IN_ABERTO, VL_TT_ADICIONAL, TP_RECEBIMENTO, VL_TOT_UTILIZADO)');
    RECEBIMENTO.Sql.Add('VALUES (:NR_RECEBIMENTO, :CD_CLIENTE, :CD_UNID_NEG, :DT_RECEBIMENTO, :CD_USUARIO,');
    RECEBIMENTO.Sql.Add(' :IN_CANCELADO, :IN_CAMBIO, :IN_UNIFICADO,:VL_RECEBIMENTO, :QT_ITENS_RECEB, ');
    RECEBIMENTO.Sql.Add(' :CD_BANCO,:IN_ABERTO, :VL_TT_ADICIONAL, :TP_RECEBIMENTO,:VL_TOT_UTILIZADO)');
    RECEBIMENTO.Params[0].AsString  := nr_recebimento;
    RECEBIMENTO.Params[1].AsString  := st_cd_cliente;
    RECEBIMENTO.Params[2].AsString  := msk_cd_unid_neg2.text;
    try
      RECEBIMENTO.Params[3].asdatetime:= PoeOuTiraDiasUteis(1,'-',dt_server)
    except
      RECEBIMENTO.Params[3].asdatetime:= dt_server;
    end;
    RECEBIMENTO.Params[4].AsString  := str_cd_usuario;
    RECEBIMENTO.Params[5].AsString  :='0';
    RECEBIMENTO.Params[6].AsString  :='1';
    RECEBIMENTO.Params[7].AsString  :='0';
    RECEBIMENTO.Params[8].AsFloat   := 0;
    RECEBIMENTO.Params[9].AsInteger := 0;
    RECEBIMENTO.Params[10].AsString  := cd_banco;
    RECEBIMENTO.Params[11].AsString :='A';
    RECEBIMENTO.Params[12].AsFloat  := 0;
    RECEBIMENTO.Params[13].AsString :=inttostr(rdgp_tp_servico.Itemindex);
    RECEBIMENTO.Params[14].AsFloat  := 0;
    RECEBIMENTO.ExecSql;
    I:=1;
    vl_tot_recebido:=0;
    while not(PROCESSOS.Eof) do
    begin
      RECEBIMENTO.Close;
      RECEBIMENTO.Sql.Clear;
      RECEBIMENTO.Sql.Add('INSERT INTO TRECEBIMENTO_PROCESSO(NR_PROCESSO, NR_RECEBIMENTO, CD_CLIENTE, CD_UNID_NEG, ');
      RECEBIMENTO.Sql.Add(' NR_LANC_RECEB, NR_SOLICITACAO, VL_SOLICITADO, VL_RECEBIDO,  ');
      RECEBIMENTO.Sql.Add(' IN_CANCELADO, CD_STATUS, DT_TARIFARIO, VL_ADICIONAL, VL_UTILIZADO, NR_PRIORIDADE)');
      RECEBIMENTO.Sql.Add(' VALUES(:NR_PROCESSO, :NR_RECEBIMENTO, :CD_CLIENTE, :CD_UNID_NEG, ');
      RECEBIMENTO.Sql.Add(' :NR_LANC_RECEB, :NR_SOLICITACAO,');
      RECEBIMENTO.Sql.Add(' :VL_SOLICITADO, :VL_RECEBIDO, :IN_CANCELADO, :CD_STATUS, :DT_TARIFARIO, :VL_ADICIONAL, ');
      RECEBIMENTO.Sql.Add(' :VL_UTILIZADO, :NR_PRIORIDADE)');
      RECEBIMENTO.Params[0].AsString:=PROCESSOS.FieldByName('NR_PROCESSO').AsString;
      RECEBIMENTO.Params[1].AsString:=nr_recebimento;
      RECEBIMENTO.Params[2].AsString:= st_cd_cliente;
      RECEBIMENTO.Params[3].AsString:= msk_cd_unid_neg2.text;
      RECEBIMENTO.Params[4].AsString:=formatfloat('0000',I);;
      RECEBIMENTO.Params[5].AsString:=PROCESSOS.FieldByName('NR_SOLICITACAO').AsString;
      RECEBIMENTO.Params[6].AsFloat :=PROCESSOS.FieldByName('VL_SOLICITADO').AsFloat;
      RECEBIMENTO.Params[7].AsFloat:= 0;
      RECEBIMENTO.Params[8].AsString:='0';
      RECEBIMENTO.Params[9].AsString:='A';//PROCESSOS.FieldByName('CD_STATUS').AsString;
      try
        RECEBIMENTO.Params[10].AsDateTime:= PoeOuTiraDiasUteis(1,'-',dt_server);
      except
        RECEBIMENTO.Params[10].AsDateTime:= dt_server;
      end;
      RECEBIMENTO.Params[11].AsFloat:= 0;
      RECEBIMENTO.Params[12].AsFloat:= 0;
      RECEBIMENTO.Params[13].AsInteger:= strtoint(formatfloat('00',I)) ;
      RECEBIMENTO.ExecSql;
      //inclusao dos itens notificados
      ITEM:=TQuery.Create(Application);
      ITEM.DataBaseName:='DBBROKER';
      ITEM.Sql.Clear;
      ITEM.Sql.Add(' SELECT NR_PROCESSO, NR_SOLICITACAO, NR_LANCAMENTO, CD_ITEM, VL_SOLICITADO, CD_STATUS, VL_RECEBIDO, ');
      ITEM.Sql.Add(' CD_MOEDA_COMPRA, CD_MOEDA_VENDA, VL_COMPRA, VL_VENDA, VL_UTILIZADO');
      ITEM.Sql.Add(' FROM TNUMERARIO_NOTIFICA_ITEM (NOLOCK)');
      ITEM.Sql.Add(' WHERE NR_PROCESSO =:NR_PROCESSO ');
      ITEM.Sql.Add(' AND NR_SOLICITACAO=:NR_SOLICITACAO AND CD_STATUS IN ("A","P") ');
      ITEM.Sql.Add(' AND TP_DESTINO IN ("2","3","4") AND VL_SOLICITADO > 0 ');     // Não insere itens com valor 0
      ITEM.DataSource:= ds_item;
      ITEM.Open;
      J:=1;
      vl_receber:=0;
      vl_utilizado:=0;
      while not(ITEM.Eof) do
      begin
        RECEBIMENTO.Close;
        RECEBIMENTO.Sql.Clear;
        RECEBIMENTO.Sql.Add(' INSERT INTO TRECEBIMENTO_PROCESSO_ITEM (NR_RECEBIMENTO, NR_PROCESSO,');
        RECEBIMENTO.Sql.Add(' CD_CLIENTE, CD_UNID_NEG, NR_SOLICITACAO, NR_LANC_RECEB, NR_LANCAMENTO, CD_ITEM, ');
        RECEBIMENTO.Sql.Add(' VL_SOLICITADO, VL_RECEBIDO, IN_CANCELADO, VL_UTILIZADO, CD_MOEDA_VENDA, VL_VENDA,');
        RECEBIMENTO.Sql.Add('  CD_MOEDA_COMPRA, VL_COMPRA, VL_TARIFARIO, CD_BANCO_ITEM, VL_ADICIONAL_ITEM)');
        RECEBIMENTO.Sql.Add(' VALUES (:NR_RECEBIMENTO, :NR_PROCESSO, :CD_CLIENTE ,');
        RECEBIMENTO.Sql.Add(' :CD_UNID_NEG, :NR_SOLICITACAO, :NR_LANC_RECEB, :NR_LANCAMENTO,:CD_ITEM,:VL_SOLICITADO,');
        RECEBIMENTO.Sql.Add(' :VL_RECEBIDO, :IN_CANCELADO, :VL_UTILIZADO,:CD_MOEDA_VENDA, :VL_VENDA, ');
        RECEBIMENTO.Sql.Add(' :CD_MOEDA_COMPRA, :VL_COMPRA, :VL_TARIFARIO,:CD_BANCO_ITEM,:VL_ADICIONAL_ITEM) ');
        RECEBIMENTO.Params[0].AsString:=nr_recebimento;
        RECEBIMENTO.Params[1].AsString:=ITEM.FieldByName('NR_PROCESSO').AsString;
        RECEBIMENTO.Params[2].AsString:= st_cd_cliente;
        RECEBIMENTO.Params[3].AsString:= msk_cd_unid_neg2.text;
        RECEBIMENTO.Params[4].AsString:=ITEM.FieldByName('NR_SOLICITACAO').AsString;
        RECEBIMENTO.Params[5].AsString:=formatfloat('0000',I);
        RECEBIMENTO.Params[6].AsString:=formatfloat('000',J);
        RECEBIMENTO.Params[7].AsString:=ITEM.FieldByName('CD_ITEM').AsString;;
        RECEBIMENTO.Params[8].AsFloat :=ITEM.FieldByName('VL_SOLICITADO').AsFloat - ITEM.FieldByName('VL_RECEBIDO').AsFloat;
        if rdgp_tp_servico.ItemIndex = 1 then
          RECEBIMENTO.Params[9].AsFloat := calc_vl_receber(ITEM.FieldByName('VL_VENDA').AsFloat,ITEM.FieldByName('VL_SOLICITADO').AsFloat,
                                                           PROCESSOS.FieldByName('TP_PRODUTO').AsString, PROCESSOS.FieldByName('CD_VIA_TRANSPORTE').AsString,
                                                           ITEM.FieldByName('CD_MOEDA_VENDA').AsString, vl_tarifa)
                                                           - ITEM.FieldByName('VL_RECEBIDO').AsFloat
        else RECEBIMENTO.Params[9].AsFloat := 0;
        RECEBIMENTO.Params[10].AsString:='0';
        RECEBIMENTO.Params[11].AsFloat := calc_vl_receber(ITEM.FieldByName('VL_VENDA').AsFloat,ITEM.FieldByName('VL_SOLICITADO').AsFloat,
                                                          PROCESSOS.FieldByName('TP_PRODUTO').AsString, PROCESSOS.FieldByName('CD_VIA_TRANSPORTE').AsString,
                                                          ITEM.FieldByName('CD_MOEDA_VENDA').AsString, vl_tarifa)
                                                          - ITEM.FieldByName('VL_RECEBIDO').AsFloat;//ITEM.FieldByName('VL_RECEBIDO').AsFloat;;
        RECEBIMENTO.Params[12].AsString := ITEM.FieldByName('CD_MOEDA_VENDA').AsString;
        RECEBIMENTO.Params[13].AsFloat  := ITEM.FieldByName('VL_VENDA').AsFloat;
        RECEBIMENTO.Params[14].AsString := ITEM.FieldByName('CD_MOEDA_COMPRA').AsString;
        RECEBIMENTO.Params[15].AsFloat  := ITEM.FieldByName('VL_COMPRA').AsFloat;
        RECEBIMENTO.Params[16].AsFloat  := vl_tarifa;
        //para o agenciamento quando for processo vinculado e para o processo vinc não tiver sido solicitado
        //numerario poderá ser feito o recebimento pelo agenciamento e o banco será o extra caixa
        if (PROCESSOS.FieldByName('NR_PROCESSO_VINC').AsString <> '') and
           (PROCESSOS.FieldByName('TP_SERVICO').AsString = '1' ) then
          RECEBIMENTO.Params[17].AsString:= cd_banco_extra
        else RECEBIMENTO.Params[17].AsString:= cd_banco;
        RECEBIMENTO.Params[18].AsFloat := 0;
        vl_receber:=vl_receber + RECEBIMENTO.Params[9].AsFloat;
        vl_utilizado:= vl_utilizado + RECEBIMENTO.Params[11].AsFloat;
        RECEBIMENTO.ExecSql;
        J:=J + 1;
        ITEM.Next;
      end;
      RECEBIMENTO.Sql.Clear;
      RECEBIMENTO.Sql.Add('UPDATE TRECEBIMENTO_PROCESSO ');
      RECEBIMENTO.Sql.Add('   SET VL_RECEBIDO = :VL_RECEBIDO, VL_UTILIZADO=:VL_UTILIZADO ');
      RECEBIMENTO.Sql.Add(' WHERE NR_RECEBIMENTO =:NR_RECEBIMENTO AND CD_CLIENTE =:CD_CLIENTE');
      RECEBIMENTO.Sql.Add(' AND NR_LANC_RECEB=:NR_LANC_RECEB AND CD_UNID_NEG=:CD_UNID_NEG ');
      RECEBIMENTO.Params[0].AsFloat := vl_receber;
      RECEBIMENTO.Params[1].AsFloat := vl_utilizado;
      RECEBIMENTO.Params[2].AsString:= nr_recebimento;
      RECEBIMENTO.Params[3].AsString:= st_cd_cliente;
      RECEBIMENTO.Params[4].AsString:= formatfloat('0000',I);;
      RECEBIMENTO.Params[5].AsString:= msk_cd_unid_neg2.text;
      RECEBIMENTO.ExecSql;
      //fim da inclusao
      PROCESSOS.Next;
      I:=I + 1;
      IF rdgp_tp_servico.itemindex = 0 then
        vl_tot_recebido:=vl_tot_recebido + strtofloat(formatfloat('0.00', vl_utilizado))
      else vl_tot_recebido:=vl_tot_recebido + strtofloat(formatfloat('0.00',vl_receber));
    end;
    RECEBIMENTO.Sql.Clear;
    RECEBIMENTO.Sql.Add(' UPDATE TRECEBIMENTO_AG ');
    RECEBIMENTO.Sql.Add(' SET VL_TOT_RECEBIDO = :VL_TOT_RECEBIDO,');
    RECEBIMENTO.Sql.Add(' VL_TOT_UTILIZADO    = :VL_TOT_UTILIZADO ');
    RECEBIMENTO.Sql.Add(' WHERE NR_RECEBIMENTO =:NR_RECEBIMENTO AND CD_CLIENTE =:CD_CLIENTE');
    RECEBIMENTO.Sql.Add(' AND CD_UNID_NEG=:CD_UNID_NEG');
    RECEBIMENTO.Params[0].AsFloat := vl_tot_recebido;
    RECEBIMENTO.Params[1].AsFloat := vl_tot_recebido;
    RECEBIMENTO.Params[2].AsString:= nr_recebimento;
    RECEBIMENTO.Params[3].AsString:= st_cd_cliente;
    RECEBIMENTO.Params[4].AsString:= msk_cd_unid_neg2.text;
    RECEBIMENTO.ExecSql;
    datm_main.db_broker.Commit;
    ITEM.FREE;
    RECEBIMENTO.FREE;
    PROCESSOS.FREE;
    datm_recebimento_ag.qry_recebimento_.close;
    datm_recebimento_ag.qry_recebimento_.ParamByName('NR_RECEBIMENTO').AsString:= nr_recebimento;
    datm_recebimento_ag.qry_recebimento_.ParamByName('CD_CLIENTE').AsString:= st_cd_cliente;
    datm_recebimento_ag.qry_recebimento_.ParamByName('CD_UNID_NEG').AsString:= msk_cd_unid_neg2.text;
    datm_recebimento_ag.qry_recebimento_.Prepare;
    datm_recebimento_ag.qry_recebimento_.Open;
    datm_recebimento_ag.qry_recebimento_processo_.close;
    datm_recebimento_ag.qry_recebimento_processo_.ParamByName('NR_RECEBIMENTO').AsString:= nr_recebimento;
    datm_recebimento_ag.qry_recebimento_processo_.ParamByName('CD_CLIENTE').AsString:= st_cd_cliente;
    datm_recebimento_ag.qry_recebimento_processo_.ParamByName('CD_UNID_NEG').AsString:= msk_cd_unid_neg2.text;;
    datm_recebimento_ag.qry_recebimento_processo_.Prepare;
    datm_recebimento_ag.qry_recebimento_processo_.Open;
    datm_recebimento_ag.qry_receb_proc_item_.Close;
    datm_recebimento_ag.qry_receb_proc_item_.prepare;
    datm_recebimento_ag.qry_receb_proc_item_.open;
    if rdgp_tp_servico.Itemindex = 1 then
//    if 0 = 1 then
    begin
      datm_recebimento_ag.qry_moeda_tarifario_.Close;
      datm_recebimento_ag.qry_moeda_tarifario_.prepare;
      datm_recebimento_ag.qry_moeda_tarifario_.open;
      ts_rec_ag.TAbVisible             := true;
      pgctrl_recebimento_ag.Activepage := ts_rec_ag;
      btn_imprimir.Enabled            := true;

      //BUSCA SE JÁ EXISTE TARIFARIO INSERIDO
      Atz_tarifario:=TQuery.Create(Application);
      Atz_tarifario.DataBaseName:='DBBROKER';
      Atz_tarifario.Sql.Add(' SELECT COUNT(*) FROM TRECEBIMENTO_TARIFARIO (NOLOCK) ');
      Atz_tarifario.Sql.Add(' WHERE NR_RECEBIMENTO = "'+datm_recebimento_ag.qry_recebimento_NR_RECEBIMENTO.AsString+'"');
      Atz_tarifario.Sql.Add(' AND CD_CLIENTE = "'+datm_recebimento_ag.qry_recebimento_CD_CLIENTE.AsString+'"');
      Atz_tarifario.Sql.Add('  AND CD_UNID_NEG = "'+datm_recebimento_ag.qry_recebimento_CD_UNID_NEG.AsString+'"');
      Atz_tarifario.Open;
      if Atz_tarifario.Fields[0].AsInteger = 0 then
      begin
       //SE NAO EXISTE LEVANTA TODAS AS MOEDAS DE VENDA QUE VEM DO AGENCIAMENTO
       //APENAS AS MOEDA DIFERENTE DE REAL E NULO
        Atz_tarifario.SQL.Clear;
        Atz_tarifario.SQL.Add(' SELECT DISTINCT CD_MOEDA_VENDA FROM TRECEBIMENTO_PROCESSO_ITEM (NOLOCK) ');
        Atz_tarifario.Sql.Add(' WHERE NR_RECEBIMENTO = "'+datm_recebimento_ag.qry_recebimento_NR_RECEBIMENTO.AsString+'"');
        Atz_tarifario.Sql.Add(' AND CD_CLIENTE = "'+datm_recebimento_ag.qry_recebimento_CD_CLIENTE.AsString+'"');
        Atz_tarifario.Sql.Add('  AND CD_UNID_NEG = "'+datm_recebimento_ag.qry_recebimento_CD_UNID_NEG.AsString+'"');
        Atz_tarifario.Sql.Add(' AND  (ISNULL(CD_MOEDA_VENDA,"") <> "" AND CD_MOEDA_VENDA <> "790")');
        Atz_tarifario.Open;
        while not(Atz_tarifario.Eof) do
        begin
          with TQuery.Create(Application) do
          begin
            DataBaseName:='DBBROKER';//INSERE NA TABELA DE TARIFARIO DO RECEBIMENTO COM A CONVERSAO DO VALOR PARA REAL
            Sql.Add('INSERT INTO TRECEBIMENTO_TARIFARIO(NR_RECEBIMENTO, CD_CLIENTE, CD_UNID_NEG, ');
            Sql.Add(' CD_MOEDA, VL_TARIFARIO, VL_MANUAL)');
            Sql.Add(' VALUES (:NR_RECEBIMENTO, :CD_CLIENTE, :CD_UNID_NEG, ');
            Sql.Add(' :CD_MOEDA, :VL_TARIFARIO, :VL_MANUAL)');
            Params[0].AsString:= datm_recebimento_ag.qry_recebimento_NR_RECEBIMENTO.AsString;
            Params[1].AsString:= datm_recebimento_ag.qry_recebimento_CD_CLIENTE.AsString;
            Params[2].AsString:= datm_recebimento_ag.qry_recebimento_CD_UNID_NEG.AsString;
            Params[3].AsString:= Atz_tarifario.Fields[0].AsString;
            Params[4].AsFloat := StrToFloat( ConsultaLookupSQL('SELECT VL_TAXA FROM TTAXA_FRETE (NOLOCK) WHERE CD_MOEDA = "'+Atz_tarifario.Fields[0].AsString+'" AND ' +
                                                   ' DT_INICIO = CONVERT(DATETIME, "'+datetimetostr(dt_server)+'",103)','VL_TAXA') );
            Params[5].AsFloat := 0;
            ExecSql;
            Free;
          end;
          Atz_tarifario.Next;
        end;
      end;
      Atz_tarifario.Free;
      datm_recebimento_ag.qry_moeda_tarifario_.Close;
      datm_recebimento_ag.qry_moeda_tarifario_.Prepare;
      datm_recebimento_ag.qry_moeda_tarifario_.Open;

    end;
    if rdgp_tp_servico.Itemindex = 0 then
    begin
      ts_rec_desemb.TAbVisible         := true;
      pgctrl_recebimento_ag.Activepage := ts_rec_desemb;
    end;
    datm_recebimento_ag.qry_notificacao_pend_.Close;
    btn_receber.Enabled        := (pgctrl_recebimento_ag.ActivePage = ts_rec_pendentes);
    mi_receber.Enabled         := (pgctrl_recebimento_ag.ActivePage = ts_rec_pendentes);
    btn_efetuar.Enabled        := (pgctrl_recebimento_ag.ActivePage = ts_rec_ag) or (pgctrl_recebimento_ag.ActivePage = ts_rec_desemb);
    mi_baixar_receb.Enabled    := (pgctrl_recebimento_ag.ActivePage = ts_rec_ag) or (pgctrl_recebimento_ag.ActivePage = ts_rec_desemb);
    btn_pesq.Enabled           := (pgctrl_recebimento_ag.ActivePage = ts_rec_pendentes) or (pgctrl_recebimento_ag.ActivePage = ts_lista);
    btn_aplic_tarifario.Enabled:= (pgctrl_recebimento_ag.ActivePage = ts_rec_ag);
    mi_atz_tarifa.Enabled      := (pgctrl_recebimento_ag.ActivePage = ts_rec_ag);
    btn_canc_receb.Enabled     := (pgctrl_recebimento_ag.ActivePage = ts_rec_ag) or (pgctrl_recebimento_ag.ActivePage = ts_rec_desemb);
    mi_canc_receb.Enabled      := (pgctrl_recebimento_ag.ActivePage = ts_rec_ag) or (pgctrl_recebimento_ag.ActivePage = ts_rec_desemb);
    btn_imprimir.Enabled       := (pgctrl_recebimento_ag.ActivePage = ts_rec_ag) or (pgctrl_recebimento_ag.ActivePage = ts_rec_desemb);
    btn_lista_rel.Enabled      := (pgctrl_recebimento_ag.ActivePage = ts_rec_ag) or (pgctrl_recebimento_ag.ActivePage = ts_rec_desemb);
    mi_fat.Visible             := (pgctrl_recebimento_ag.ActivePage = ts_rec_ag);
    cb_ordem.Enabled           := (pgctrl_recebimento_ag.ActivePage = ts_lista);
    edt_chave.Enabled          := (pgctrl_recebimento_ag.ActivePage = ts_lista);
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
    end;
  end;
end;

function Tfrm_recebimento_ag.calc_vl_receber(vl_venda, vl_solicitado: real; tp_produto, cd_via, moeda:string; var valor:real): real;
begin
  if (moeda = '') then
    calc_vl_receber:= vl_solicitado //conversao para o desembaraco
  else begin
    if (moeda<> '790')then
    begin        //conmversao para o agenciamento
      with TQuery.create(Application) do
      begin
        DatabaseName:='DBBROKER';
        Sql.Clear;
        if (tp_produto = '02') and   (cd_via = '04') then
          Sql.Add(' SELECT VL_TAXA FROM TTAXA_IATA (NOLOCK) WHERE CD_MOEDA = "'+moeda+'" AND ')
        else
          Sql.Add(' SELECT VL_TAXA_UTIL FROM TTAXA_FRETE (NOLOCK) WHERE CD_MOEDA = "'+moeda+'" AND ');
        Sql.Add(' DT_INICIO = CONVERT(DATETIME, "'+datetimetostr(dt_server)+'",103)');
        Open;
        valor:= Fields[0].AsFloat;
        calc_vl_receber := vl_venda * Fields[0].AsFloat;
      end;
    end else begin
      valor:=0;
      calc_vl_receber:=  vl_venda;
    end;
  end;
end;

procedure Tfrm_recebimento_ag.btn_aplic_tarifarioClick(Sender: TObject);
var
  vl_tarifario : real;
  BookMark, BookMark2 : TBookMark;
  Atz_vl_recebido, Atz_tarifario : TQuery;
begin
  if pgctrl_recebimento_ag.ActivePage = ts_rec_ag then
  begin
    if (in_integracao_contabil = '1') and (datm_recebimento_ag.qry_recebimento_IN_EMITIDO_FAT.AsString = '1') then
    begin
      BoxMensagem('Fatura já Emitida. Não é Permitido alterar os valores',2);
      Exit;
    end;
    BookMark2 := datm_recebimento_ag.qry_receb_proc_item_.GetBookmark;
    BookMark  := datm_recebimento_ag.qry_recebimento_processo_.GetBookmark;
    datm_recebimento_ag.qry_recebimento_processo_.First;
    while not(datm_recebimento_ag.qry_recebimento_processo_.EOF) do
    begin
      vl_tarifario := 0;
//      if dbgrid_proc.SelectedRows.CurrentRowSelected then
//      begin
      Atz_vl_recebido:=TQuery.Create(Application);
      Atz_vl_recebido.DataBaseName:='DBBROKER';
      Atz_vl_recebido.Sql.Add('UPDATE TRECEBIMENTO_PROCESSO_ITEM SET VL_RECEBIDO = ');
      Atz_vl_recebido.Sql.Add('       ( SELECT ISNULL( TT.VL_MANUAL,TT.VL_TARIFARIO ) ' );
      Atz_vl_recebido.Sql.Add('           FROM TRECEBIMENTO_TARIFARIO TT (NOLOCK) ' );
      Atz_vl_recebido.Sql.Add('          WHERE TT.CD_MOEDA = CD_MOEDA_VENDA ');
      Atz_vl_recebido.Sql.Add('            AND TT.NR_RECEBIMENTO = :NR_RECEBIMENTO AND TT.CD_CLIENTE = :CD_CLIENTE ) * VL_VENDA ');
      Atz_vl_recebido.Sql.Add(' WHERE NR_RECEBIMENTO = :NR_RECEBIMENTO AND NR_PROCESSO = :NR_PROCESSO ');
      Atz_vl_recebido.Sql.Add('   AND NR_SOLICITACAO = :NR_SOLICITACAO AND CD_CLIENTE  = :CD_CLIENTE ');
      Atz_vl_recebido.Sql.Add('   AND CD_UNID_NEG    = :CD_UNID_NEG    AND CD_MOEDA_VENDA <> "790" ');
      Atz_vl_recebido.Params[0].AsString := datm_recebimento_ag.qry_recebimento_processo_NR_RECEBIMENTO.AsString;
      Atz_vl_recebido.Params[1].AsString := datm_recebimento_ag.qry_recebimento_processo_CD_CLIENTE.AsString;
      Atz_vl_recebido.Params[2].AsString := datm_recebimento_ag.qry_recebimento_processo_NR_RECEBIMENTO.AsString;
      Atz_vl_recebido.Params[3].AsString := datm_recebimento_ag.qry_recebimento_processo_NR_PROCESSO.AsString;
      Atz_vl_recebido.Params[4].AsString := datm_recebimento_ag.qry_recebimento_processo_NR_SOLICITACAO.AsString;
      Atz_vl_recebido.Params[5].AsString := datm_recebimento_ag.qry_recebimento_processo_CD_CLIENTE.AsString;
      Atz_vl_recebido.Params[6].AsString := datm_recebimento_ag.qry_recebimento_processo_CD_UNID_NEG.AsString;
      Atz_vl_recebido.ExecSql;
      datm_recebimento_ag.atz_cpmf;
      Atz_vl_recebido.Sql.Clear;
      Atz_vl_recebido.Sql.Add('SELECT SUM(VL_RECEBIDO) ' );
      Atz_vl_recebido.Sql.Add('  FROM TRECEBIMENTO_PROCESSO_ITEM (NOLOCK) ');
      Atz_vl_recebido.Sql.Add(' WHERE NR_RECEBIMENTO = :NR_RECEBIMENTO AND NR_PROCESSO = :NR_PROCESSO ');
      Atz_vl_recebido.Sql.Add('   AND NR_SOLICITACAO = :NR_SOLICITACAO AND CD_CLIENTE  = :CD_CLIENTE ');
      Atz_vl_recebido.Sql.Add('   AND CD_UNID_NEG    = :CD_UNID_NEG ');
      Atz_vl_recebido.Params[0].AsString := datm_recebimento_ag.qry_recebimento_processo_NR_RECEBIMENTO.AsString;
      Atz_vl_recebido.Params[1].AsString := datm_recebimento_ag.qry_recebimento_processo_NR_PROCESSO.AsString;
      Atz_vl_recebido.Params[2].AsString := datm_recebimento_ag.qry_recebimento_processo_NR_SOLICITACAO.AsString;
      Atz_vl_recebido.Params[3].AsString := datm_recebimento_ag.qry_recebimento_processo_CD_CLIENTE.AsString;
      Atz_vl_recebido.Params[4].AsString := datm_recebimento_ag.qry_recebimento_processo_CD_UNID_NEG.AsString;
      Atz_vl_recebido.Open;
      if not (datm_recebimento_ag.qry_recebimento_processo_.State in [dsEdit]) then
        datm_recebimento_ag.qry_recebimento_processo_.Edit;
      datm_recebimento_ag.qry_recebimento_processo_VL_RECEBIDO.Asfloat:=Atz_vl_recebido.Fields[0].AsFloat;
//      end;
      datm_recebimento_ag.qry_recebimento_processo_.Next;
    end;
  end;
  if pgctrl_recebimento_ag.ActivePage = ts_rec_desemb then
  begin
    if datm_recebimento_ag.qry_recebimento_IN_ABERTO.AsString <> 'A' then
      exit;//só para o recebimento abertos
    //BUSCA SE JÁ EXISTE TARIFARIO INSERIDO
    Atz_tarifario:=TQuery.Create(Application);
    Atz_tarifario.DataBaseName:='DBBROKER';
    Atz_tarifario.Sql.Add(' SELECT COUNT(*) FROM TRECEBIMENTO_TARIFARIO (NOLOCK) ');
    Atz_tarifario.Sql.Add('  WHERE NR_RECEBIMENTO = "' + datm_recebimento_ag.qry_recebimento_NR_RECEBIMENTO.AsString +'"');
    Atz_tarifario.Sql.Add('    AND CD_CLIENTE     = "' + datm_recebimento_ag.qry_recebimento_CD_CLIENTE.AsString     +'"');
    Atz_tarifario.Sql.Add('    AND CD_UNID_NEG    = "' + datm_recebimento_ag.qry_recebimento_CD_UNID_NEG.AsString    +'"');
    Atz_tarifario.Open;
    if Atz_tarifario.Fields[0].AsInteger = 0 then
    begin
      // SE NAO EXISTE LEVANTA TODAS AS MOEDAS DE VENDA QUE VEM DO AGENCIAMENTO
      // APENAS AS MOEDA DIFERENTE DE REAL E NULO
      Atz_tarifario.SQL.Clear;
      Atz_tarifario.SQL.Add(' SELECT DISTINCT CD_MOEDA_VENDA FROM TRECEBIMENTO_PROCESSO_ITEM (NOLOCK) ');
      Atz_tarifario.Sql.Add('  WHERE NR_RECEBIMENTO = "' + datm_recebimento_ag.qry_recebimento_NR_RECEBIMENTO.AsString + '"');
      Atz_tarifario.Sql.Add('    AND CD_CLIENTE     = "' + datm_recebimento_ag.qry_recebimento_CD_CLIENTE.AsString     + '"');
      Atz_tarifario.Sql.Add('    AND CD_UNID_NEG    = "' + datm_recebimento_ag.qry_recebimento_CD_UNID_NEG.AsString    + '"');
      Atz_tarifario.Sql.Add('    AND (ISNULL(CD_MOEDA_VENDA,"") <> "" AND CD_MOEDA_VENDA <> "790")');
      Atz_tarifario.Open;
      while not(Atz_tarifario.Eof) do
      begin
        with TQuery.Create(Application) do
        begin
          DataBaseName:='DBBROKER';//INSERE NA TABELA DE TARIFARIO DO RECEBIMENTO COM A CONVERSAO DO VALOR PARA REAL
          Sql.Add('INSERT INTO TRECEBIMENTO_TARIFARIO(NR_RECEBIMENTO, CD_CLIENTE, CD_UNID_NEG, ');
          Sql.Add('                                   CD_MOEDA, VL_TARIFARIO, VL_MANUAL)');
          Sql.Add('                           VALUES (:NR_RECEBIMENTO, :CD_CLIENTE, :CD_UNID_NEG, ');
          Sql.Add('                                   :CD_MOEDA, :VL_TARIFARIO, :VL_MANUAL)');
          Params[0].AsString:= datm_recebimento_ag.qry_recebimento_NR_RECEBIMENTO.AsString;
          Params[1].AsString:= datm_recebimento_ag.qry_recebimento_CD_CLIENTE.AsString;
          Params[2].AsString:= datm_recebimento_ag.qry_recebimento_CD_UNID_NEG.AsString;
          Params[3].AsString:= Atz_tarifario.Fields[0].AsString;
          Params[4].AsFloat := calc_vl_receber(1,0, '','', Atz_tarifario.Fields[0].AsString, vl_tarifario);
          Params[5].AsFloat := vl_tarifario;
          ExecSql;
          Free;
        end;
        Atz_tarifario.Next;
      end;
    end;
    datm_recebimento_ag.qry_moeda_tarifario_.Close;
    datm_recebimento_ag.qry_moeda_tarifario_.Prepare;
    datm_recebimento_ag.qry_moeda_tarifario_.Open;
    pnl_tarifariao_desembaraco.BringToFront;
    pnl_cadastro.Enabled      :=false;
    dbg_numerario.ReadOnly    :=true;
    dbgrid_item_des.ReadOnly  :=true;
    dbradgrp_in_maior2.Enabled:=false;
    pnl_recebimento.Enabled   :=false;
  end;
end;

procedure Tfrm_recebimento_ag.dbedt_dt_receb_agChange(Sender: TObject);
begin
  if datm_recebimento_ag.qry_recebimento_.State in [dsEdit] then
    btn_mi(false, st_modificar, st_modificar, false);
end;

procedure Tfrm_recebimento_ag.btn_cancelarClick(Sender: TObject);
begin
  cancelar;
end;

procedure Tfrm_recebimento_ag.btn_salvarClick(Sender: TObject);
begin
  if not consiste then exit;
  if not grava then exit;
end;

procedure Tfrm_recebimento_ag.btn_co_bancoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2216';
  Application.CreateForm(Tfrm_banco, frm_banco);
  with frm_banco do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if frm_banco.Cons_OnLine_Texto <> '' then
  begin
    if Not ( datm_recebimento_ag.qry_recebimento_.State in [dsEdit, dsInsert] ) and  ( st_modificar ) then
      datm_recebimento_ag.qry_recebimento_.Edit;
    datm_recebimento_ag.qry_recebimento_CD_BANCO.AsString := frm_banco.Cons_OnLine_Texto;
    dbedt_cd_bancoExit(nil);
  end;
end;

procedure Tfrm_recebimento_ag.dbedt_cd_bco_agExit(Sender: TObject);
begin
  if not(datm_recebimento_ag.qry_recebimento_.State in [dsEdit]) then exit;
  if dbedt_cd_bco_ag.text <> '' then
  begin
    ValidCodigo(dbedt_cd_bco_ag);
    datm_recebimento_ag.qry_pesquisa_.Close;
    datm_recebimento_ag.qry_pesquisa_.Sql.Clear;
    datm_recebimento_ag.qry_pesquisa_.Sql.Add('SELECT NM_BANCO FROM TBANCO (NOLOCK) WHERE CD_BANCO = "'+dbedt_cd_bco_ag.text+'"');
    datm_recebimento_ag.qry_pesquisa_.Sql.Add('AND IN_IMPOSTOS = "0" ');
    datm_recebimento_ag.qry_pesquisa_.Open;
    if datm_recebimento_ag.qry_pesquisa_.recordcount > 0 then
    begin
      datm_recebimento_ag.qry_recebimento_NM_BANCO.AsString:=datm_recebimento_ag.qry_pesquisa_.Fields[0].AsString;
      datm_recebimento_ag.qry_pesquisa_.Close;
    end else begin
      BoxMensagem('Código do Banco Inválido!',2);
      dbedt_cd_bco_ag.SetFocus;
      dbedt_nm_bco_ag.text:='';
      datm_recebimento_ag.qry_pesquisa_.Close;
      exit;
    end;
  end else
    dbedt_nm_bco_ag.text:='';
end;

procedure Tfrm_recebimento_ag.dbedt_cd_bco_agKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_bco_ag  then btn_co_bco_agClick(btn_co_bco_ag);
    if Sender = msk_cd_unid_neg  then btn_co_unid_negClick(btn_co_unid_neg);
    if Sender = msk_cd_unid_neg2 then btn_co_unidadeClick(btn_co_unidade);
    if Sender = msk_cd_produto2  then btn_co_produtoClick(btn_co_produto);
    if Sender = msk_cd_cliente   then btn_co_clienteClick(btn_co_cliente);
    if Sender = msk_list_cliente then btn_list_clienteClick(btn_list_cliente);
    if Sender = msk_list_bco     then btn_co_bcClick(btn_co_bc);
    if Sender = msk_processo     then btn_co_processoClick(btn_co_processo);
    if Sender = MaskEdit1        then SpeedButton1Click(SpeedButton1);
    if Sender = MaskEdit2        then SpeedButton2Click(SpeedButton2);
  end;
end;

procedure Tfrm_recebimento_ag.pgctrl_recebimento_agChanging(Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_recebimento_ag.btn_efetuarClick(Sender: TObject);
begin
  if datm_recebimento_ag.qry_recebimento_IN_ABERTO.AsString = 'B' then
  begin
    Boxmensagem('Este Recebimento já Finalizado!',2);
    Exit;
  end;
  if datm_recebimento_ag.qry_recebimento_IN_ABERTO.AsString = 'P' then
  begin
    Boxmensagem('Este Recebimento está parcialmente baixado.'+#10#13+'Para receber o restante ou mais uma parte dessa solicitação, procure pela propria'+#10#13+'solicitação na guia "pesquisa / parcial".',2);
    Exit;
  end;
  if datm_recebimento_ag.qry_recebimento_IN_ABERTO.AsString = 'C' then
  begin
    Boxmensagem('Este Recebimento está Cancelado!',2);
    Exit;
  end;
  if dbedt_nm_banco.Text = '' then
  begin
    Boxmensagem('O Banco Deve ser preenchido!',2);
    Exit;
  end;
  if dbedt_dt_recebimento.Text = '' then
  begin
    Boxmensagem('A Data deve ser preenchida!',2);
    dbedt_dt_recebimento.SetFocus;
    Exit;
  end else if StrToDate(dbedt_dt_recebimento.Text) > now then
  begin
    Boxmensagem('Não é possível fazer um recebimento com data futura!',2);
    dbedt_dt_recebimento.SetFocus;
    Exit;
  end;
  if dbedt_vl_recebimento.Text <> '' then
  begin
    if StrToFloat(dbedt_vl_recebimento.Text) = 0 then
    begin
      Boxmensagem('Preencha corretamente o campo de valor a receber!',2);
      Exit;
    end;
  end;
  if (in_integracao_contabil = '1') and (dt_contabilizacao >= datm_recebimento_ag.qry_recebimento_DT_RECEBIMENTO.AsDAteTime) then
  begin
    Boxmensagem('Periodo Contabil Fechado!',2);
    Exit;
  end;
  if pgctrl_recebimento_ag.Activepage = ts_rec_ag then
    baixa_recebimento_ag;
  if pgctrl_recebimento_ag.Activepage = ts_rec_desemb then
    baixa_recebimento_des;
end;

procedure Tfrm_recebimento_ag.btn_co_bco_agClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2216';
  Application.CreateForm(Tfrm_banco, frm_banco);
  with frm_banco do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if frm_banco.Cons_OnLine_Texto <> '' then
  begin
    if Not ( datm_recebimento_ag.qry_recebimento_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_recebimento_ag.qry_recebimento_.Edit;
    datm_recebimento_ag.qry_recebimento_CD_BANCO.AsString := frm_banco.Cons_OnLine_Texto;
    dbedt_cd_bco_agExit(sender);
  end;
end;

procedure Tfrm_recebimento_ag.msk_list_clienteExit(Sender: TObject);
begin
  if msk_list_cliente.Text <> '' then
  begin
    ValCodEdt( msk_list_cliente );
    datm_recebimento_ag.qry_pesquisa_.Active:=false;
    datm_recebimento_ag.qry_pesquisa_.Sql.Clear;
    datm_recebimento_ag.qry_pesquisa_.Sql.Add('SELECT NM_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA="'+msk_list_cliente.Text+'"');
    datm_recebimento_ag.qry_pesquisa_.Active:=true;
    if datm_recebimento_ag.qry_pesquisa_.RecordCount > 0 then
    begin
      edt_list_cliente.text:= datm_recebimento_ag.qry_pesquisa_.Fields[0].AsString;
      datm_recebimento_ag.qry_pesquisa_.Close;
    end else begin
      datm_recebimento_ag.qry_pesquisa_.Close;
      edt_list_cliente.Text := '';
      BoxMensagem('Código do Cliente inválido!', 2);
      msk_list_cliente.SetFocus;
      Exit;
    end;
  end else edt_list_cliente.Text := '';
  ExecutaConsulta;
end;

procedure Tfrm_recebimento_ag.msk_list_bcoExit(Sender: TObject);
begin
  if msk_list_bco.Text <> '' then
  begin
    ValCodEdt( msk_list_bco );
    datm_recebimento_ag.qry_pesquisa_.Active:=false;
    datm_recebimento_ag.qry_pesquisa_.Sql.Clear;
    datm_recebimento_ag.qry_pesquisa_.Sql.Add('SELECT NM_BANCO FROM TBANCO (NOLOCK) WHERE CD_BANCO="'+msk_list_bco.Text+'"');
    datm_recebimento_ag.qry_pesquisa_.Active:=true;
    if datm_recebimento_ag.qry_pesquisa_.RecordCount > 0 then
    begin
      edt_list_bco.text:= datm_recebimento_ag.qry_pesquisa_.Fields[0].AsString;
      datm_recebimento_ag.qry_pesquisa_.Close;
    end else begin
      datm_recebimento_ag.qry_pesquisa_.Close;
      edt_list_bco.Text := '';
      BoxMensagem('Código do Banco inválido!', 2);
      msk_list_bco.SetFocus;
      Exit;
    end;
  end else edt_list_bco.Text := '';
  ExecutaConsulta;
end;

procedure Tfrm_recebimento_ag.btn_list_clienteClick(Sender: TObject);
begin
  msk_list_cliente.text:= ConsultaOnLineExSQL('SELECT NM_EMPRESA, CD_EMPRESA, CGC_EMPRESA  FROM TEMPRESA_NAC (NOLOCK)',
                                              'Cadastro de Clientes', ['NM_EMPRESA' ,'CD_EMPRESA', 'CGC_EMPRESA'],
                                              ['Nome', 'Código', 'CGC Empresa'],'CD_EMPRESA',nil);
  msk_list_clienteExit(Sender);
end;

procedure Tfrm_recebimento_ag.btn_co_bcClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2216';
  Application.CreateForm(Tfrm_banco, frm_banco);
  with frm_banco do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if frm_banco.Cons_OnLine_Texto <> '' then
  begin
    msk_list_bco.Text := frm_banco.Cons_OnLine_Texto;
    msk_list_bcoExit(nil);
  end;
end;

procedure Tfrm_recebimento_ag.btn_co_produtoClick(Sender: TObject);
var
  produto : string[2];
begin
  produto:=ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Unidade'],'CD_PRODUTO',nil);
  if produto <>'' then
  begin
    msk_cd_produto2.text:=produto;
    msk_cd_produto2Exit(Sender);
  end;
end;

procedure Tfrm_recebimento_ag.btn_canc_recebClick(Sender: TObject);
var
  BookMark : TBookMark;
  vDataFaturamento : string;
begin
  if rdgp_tp_pesquisa.ItemIndex < 2 then
  begin
    if datm_recebimento_ag.qry_recebimento_IN_ABERTO.AsString = 'C' then
    begin
      Boxmensagem('Recebimento já Cancelado!',2);
      Exit;
    end;
    if datm_recebimento_ag.qry_recebimento_TP_RECEBIMENTO.AsString = '2' then
    begin
      Boxmensagem('Cancelamento só pode ser feito pelo Desembaraço. Recebimento Vinculado!',2);
      Exit;
    end;
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT TOP 1 IN_FATURADO FROM TFATURAMENTO_CC (NOLOCK) WHERE NR_PROCESSO = :NR_PROCESSO AND CD_ITEM = :CD_ITEM AND VL_ITEM = :VL_ITEM');
      ParamByName('NR_PROCESSO').AsString := datm_recebimento_ag.qry_recebimento_processo_.FieldByName('NR_PROCESSO').AsString;
      ParamByName('CD_ITEM').AsString := '991';
      ParamByName('VL_ITEM').AsFloat := datm_recebimento_ag.qry_recebimento_processo_.FieldByName('VL_RECEBIDO').AsFloat;
      Open;
      vDataFaturamento := Fields[0].AsString;
      Close;
      Free;
    end;
    if vDataFaturamento = '1' then
    begin
      BoxMensagem('O cancelamento não pode ser feito. O Processo já foi faturado!',3);
      Exit;
    end;
    if not(boxmensagem('Deseja Cancelar este Recebimento',1)) then exit;
    datm_recebimento_ag.qry_caixa_ctrl_.Close;
    datm_recebimento_ag.qry_caixa_ctrl_.Prepare;
    datm_recebimento_ag.qry_caixa_ctrl_.Open;
    if Not datm_recebimento_ag.qry_caixa_ctrl_.EOF then
    begin
      if ( datm_recebimento_ag.qry_recebimento_DT_RECEBIMENTO.AsDateTime < datm_recebimento_ag.qry_caixa_ctrl_.FieldByName('DT_MOVIMENTO').AsDateTime ) then
      begin
        BoxMensagem( 'Movimento financeiro fechado, ou Data inválida', 2 );
        datm_recebimento_ag.qry_caixa_ctrl_.Close;
        Exit;
      end;
    end;
    datm_recebimento_ag.qry_caixa_ctrl_.Close;
    try
      datm_main.db_broker.StartTransaction;
      with datm_recebimento_ag do
      begin
        CloseStoredProc(sp_cancela_recebimento_ag);
        sp_cancela_recebimento_ag.ParamByName('@cd_cliente').AsString       := qry_recebimento_CD_CLIENTE.AsString;
        sp_cancela_recebimento_ag.ParamByName('@nr_recebimento').AsString   := qry_recebimento_NR_RECEBIMENTO.AsString;
        sp_cancela_recebimento_ag.ParamByName('@cd_usuario').AsString       := str_cd_usuario;
        sp_cancela_recebimento_ag.ParamByName('@cd_unid_neg').AsString      := qry_recebimento_CD_UNID_NEG.AsString;
        sp_cancela_recebimento_ag.ParamByName('@dt_cancelamento').AsDAtetime:= qry_recebimento_DT_RECEBIMENTO.AsDAtetime;
        ExecStoredProc(sp_cancela_recebimento_ag);
        CloseStoredProc(sp_cancela_recebimento_ag);
        if (pgctrl_recebimento_ag.ActivePage =  ts_rec_desemb) and ( datm_recebimento_ag.qry_recebimento_IN_ABERTO.AsString <> 'A') then
        begin
          CloseStoredProc(sp_canc_receb_vinc);
          sp_canc_receb_vinc.ParamByName('@dt_movimento').AsDatetime:= qry_recebimento_DT_RECEBIMENTO.AsDateTime;
          sp_canc_receb_vinc.ParamByName('@cd_unid_neg').AsString   := qry_recebimento_CD_UNID_NEG.AsString;
          sp_canc_receb_vinc.ParamByName('@nr_recebimento').AsString:= qry_recebimento_NR_RECEBIMENTO.AsString;
          sp_canc_receb_vinc.ParamByName('@cd_cliente').AsString    := qry_recebimento_CD_CLIENTE.AsString;
          if dbradgrp_in_maior2.Itemindex = 1 then
            sp_canc_receb_vinc.ParamByName('@in_maior').AsString    := '1'
          else sp_canc_receb_vinc.ParamByName('@in_maior').AsString := '0';
          ExecStoredProc( sp_canc_receb_vinc);
          CloseStoredProc(sp_canc_receb_vinc);
        end;
        if ( datm_recebimento_ag.qry_recebimento_IN_ABERTO.AsString <> 'A') and ( datm_recebimento_ag.qry_recebimento_IN_ABERTO.AsString <> 'C') then
        begin
          CloseStoredProc(sp_distribui_numerario_ag);
          sp_distribui_numerario_ag.ParamByName('@dt_movimento').AsDatetime:= qry_recebimento_DT_RECEBIMENTO.AsDateTime;
          sp_distribui_numerario_ag.ParamByName('@cd_unid_neg').AsString   := qry_recebimento_CD_UNID_NEG.AsString;
          sp_distribui_numerario_ag.ParamByName('@nr_recebimento').AsString:= qry_recebimento_NR_RECEBIMENTO.AsString;
          sp_distribui_numerario_ag.ParamByName('@cd_cliente').AsString    := qry_recebimento_CD_CLIENTE.AsString;
          if dbradgrp_in_maior.Itemindex = 1 then
            sp_distribui_numerario_ag.ParamByName('@in_maior').AsString    := '1'
          else sp_distribui_numerario_ag.ParamByName('@in_maior').AsString := '0';
          sp_distribui_numerario_ag.ParamByName('@in_cancelamento').AsString    := '1';
          ExecStoredProc( sp_distribui_numerario_ag);
          CloseStoredProc(sp_distribui_numerario_ag);
        end;
        CloseStoredProc(sp_atualiza_receb_num_ag);
        sp_atualiza_receb_num_ag.ParamByName('@cd_cliente').AsString       := qry_recebimento_CD_CLIENTE.AsString;
        sp_atualiza_receb_num_ag.ParamByName('@nr_recebimento').AsString   := qry_recebimento_NR_RECEBIMENTO.AsString;
        sp_atualiza_receb_num_ag.ParamByName('@cd_usuario').AsString       := str_cd_usuario;
        sp_atualiza_receb_num_ag.ParamByName('@cd_unid_neg').AsString      := qry_recebimento_CD_UNID_NEG.AsString;
        ExecStoredProc(sp_atualiza_receb_num_ag);
        CloseStoredProc(sp_atualiza_receb_num_ag);
        if ( datm_recebimento_ag.qry_recebimento_IN_ABERTO.AsString <> 'A') then
        begin
          CloseStoredProc(sp_canc_receb_filtro);
          sp_canc_receb_filtro.ParamByName('@cd_cliente').AsString       := qry_recebimento_CD_CLIENTE.AsString;
          sp_canc_receb_filtro.ParamByName('@nr_recebimento').AsString   := qry_recebimento_NR_RECEBIMENTO.AsString;
          sp_canc_receb_filtro.ParamByName('@cd_unid_neg').AsString      := qry_recebimento_CD_UNID_NEG.AsString;
          sp_canc_receb_filtro.ParamByName('@dt_recebimento').AsDatetime := qry_recebimento_DT_RECEBIMENTO.AsDateTime;
          ExecStoredProc(sp_canc_receb_filtro);
          CloseStoredProc(sp_canc_receb_filtro);
          // ATUALIZACAO DA SOLIC PAGTO
          if strtoint(qry_recebimento_TP_RECEBIMENTO.AsString ) in [1,2] then // agenciamento
          begin                     //para todos os processos
            qry_recebimento_processo_.First;
            while not(qry_recebimento_processo_.Eof) do
            begin
              CloseStoredProc(sp_atz_status_solic_pagto_ag);
              sp_atz_status_solic_pagto_ag.ParamByName('@nr_processo').AsString := qry_recebimento_processo_NR_PROCESSO.AsString;
              ExecStoredProc(sp_atz_status_solic_pagto_ag);
              CloseStoredProc(sp_atz_status_solic_pagto_ag);
              qry_recebimento_processo_.Next;
            end;
          end else begin // desembaraco
            qry_receb_proc_item_.First;
            while not(qry_receb_proc_item_.Eof) do
            begin
              CloseStoredProc(sp_atz_pagto_ag);
              sp_atz_pagto_ag.ParamByName('@nr_processo').AsString := qry_recebimento_processo_NR_PROCESSO.AsString;
              sp_atz_pagto_ag.ParamByName('@cd_item').AsString     := qry_receb_proc_item_CD_ITEM.AsString;
              ExecStoredProc(sp_atz_pagto_ag);
              CloseStoredProc(sp_atz_pagto_ag);
              qry_receb_proc_item_.Next;
            end;
          end;
        end;
        // FIM DA ATUALIZACAO DA SOLIC DE PAGTO
      end;
      datm_main.db_broker.Commit;
      datm_recebimento_ag.qry_recebimento_processo_.Close;
      datm_recebimento_ag.qry_recebimento_processo_.ParamByName('NR_RECEBIMENTO').AsString:= datm_recebimento_ag.qry_list_receb_NR_RECEBIMENTO.AsString;
      datm_recebimento_ag.qry_recebimento_processo_.ParamByName('CD_CLIENTE').AsString    := datm_recebimento_ag.qry_list_receb_CD_CLIENTE.AsString;
      datm_recebimento_ag.qry_recebimento_processo_.ParamByName('CD_UNID_NEG').AsString   := datm_recebimento_ag.qry_list_receb_CD_UNID_NEG.AsString;
      datm_recebimento_ag.qry_recebimento_processo_.Prepare;
      datm_recebimento_ag.qry_recebimento_processo_.Open;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end else begin
    try
      datm_main.db_broker.StartTransaction;
      with TQuery.Create(application) do
      begin
        Databasename := 'DBBROKER';
        SQL.Clear;
        SQL.Add('UPDATE TDEVOLUCAO SET IN_CANCELADO = ''1'', IN_TRANSFERIDO = ''2'', DT_CANCELAMENTO = GETDATE() WHERE NR_PROCESSO = ''' + msk_cd_unid_neg.Text + msk_cd_produto.Text + datm_recebimento_ag.qry_devolucao_.FieldByName('nr_processo').AsString + ''' AND NR_DEVOLUCAO = ''' + datm_recebimento_ag.qry_devolucao_.FieldByName('nr_devolucao').AsString + '''');
        ExecSQL;
        SQL.Clear;
        SQL.Add('UPDATE TSOLIC_PAGTO SET CD_STATUS = ''17'', DT_CANCELAMENTO = GETDATE() WHERE CD_ITEM = ''992'' AND NR_PROCESSO = ''' + msk_cd_unid_neg.Text + msk_cd_produto.Text + datm_recebimento_ag.qry_devolucao_.FieldByName('nr_processo').AsString + ''' AND NR_LANCAMENTO = ''' + datm_recebimento_ag.qry_devolucao_.FieldByName('nr_solic_ch').AsString + '''');
        ExecSQL;
        Free;
      end;
      datm_main.db_broker.Commit;
      datm_recebimento_ag.qry_devolucao_.Close;
      datm_recebimento_ag.qry_devolucao_.Prepare;
      datm_recebimento_ag.qry_devolucao_.Open;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;
end;

procedure Tfrm_recebimento_ag.btn_co_unid_negClick(Sender: TObject);
begin
  Cons_On_line_Texto( 'DBBROKER', 'TUNID_NEG', msk_cd_unid_neg2, 'Unidades de Negócio', 52, 'IN_ATIVO = 1' );
  msk_cd_unid_negExit(Sender);
end;

procedure Tfrm_recebimento_ag.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text <> '' then
  begin
    ValCodEdt( msk_cd_unid_neg );
    datm_recebimento_ag.qry_pesquisa_.Active:=false;
    datm_recebimento_ag.qry_pesquisa_.Sql.Clear;
    datm_recebimento_ag.qry_pesquisa_.Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG (NOLOCK) WHERE CD_UNID_NEG="'+msk_cd_unid_neg.Text+'"');
    datm_recebimento_ag.qry_pesquisa_.Sql.Add('AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG from TUSUARIO_HABILITACAO (NOLOCK)');
    datm_recebimento_ag.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_recebimento_ag.qry_pesquisa_.Active:=true;
    if datm_recebimento_ag.qry_pesquisa_.RecordCount > 0 then
    begin
      edit_nm_unid_neg.text:= datm_recebimento_ag.qry_pesquisa_.Fields[0].AsString;
      datm_recebimento_ag.qry_pesquisa_.Close;
    end else begin
      datm_recebimento_ag.qry_pesquisa_.Close;
      edit_nm_unid_neg.Text := '';
      BoxMensagem('Código da Unidade de Negócio inválido!', 2);
      msk_cd_unid_neg.SetFocus;
      Exit;
    end;
  end else begin
    Boxmensagem('A Unidade de Negócio deve ser informado!',2);
    msk_cd_unid_neg.SetFocus;
  end;
  ExecutaConsulta;
end;

procedure Tfrm_recebimento_ag.rdgp_tp_pesquisaClick(Sender: TObject);
begin
  pnlTodos.Visible := False;
  if rdgp_tp_pesquisa.itemindex = 0 then
  begin
    dbgrid_pes_numerario.Visible  :=true;
    dbgrid_pes_recebimento.Visible:=false;
    dbgrid_pes_devolucao.Visible:=False;
    msk_list_bco.visible          :=false;
    btn_co_bc.visible             :=false;
    label16.visible               :=false;
    edt_list_bco.visible          :=false;
    rdgrp_tp_status.Items.Clear;
    rdgrp_tp_status.Items.Add('Aberto');
    rdgrp_tp_status.Items.Add('Baixado');
    rdgrp_tp_status.Items.Add('Cancelado');
    rdgrp_tp_status.Items.Add('Parcial');
    rdgrp_tp_status.Items.Add('Todos');
    ts_rec_desemb.TabVisible      := false;
    ts_rec_ag.TabVisible          := false;
    ts_rec_pendentes.TabVisible   := True;
    Label31.Caption := 'Dt Inicial (emissão)';
    Label32.Caption := 'Dt Final (emissão)';
  end else if rdgp_tp_pesquisa.itemindex = 1 then
  begin
    dbgrid_pes_numerario.Visible  :=false;
    dbgrid_pes_recebimento.Visible:=true;
    dbgrid_pes_devolucao.Visible:=False;
    msk_list_bco.visible          :=true;
    btn_co_bc.visible             :=true;
    label16.visible               :=true;
    edt_list_bco.visible          :=true;
    rdgrp_tp_status.Items.Clear;
    rdgrp_tp_status.Items.Add('Montado');
    rdgrp_tp_status.Items.Add('Baixado');
    rdgrp_tp_status.Items.Add('Cancelado');
    rdgrp_tp_status.Items.Add('Parcial');
    rdgrp_tp_status.Items.Add('Todos');
    ts_rec_desemb.TabVisible      := True;
    ts_rec_ag.TabVisible          := false;
    ts_rec_pendentes.TabVisible   := False;
    Label31.Caption := 'Data Inicial';
    Label32.Caption := 'Data Final';
  end else if rdgp_tp_pesquisa.itemindex = 2 then
  begin
    dbgrid_pes_numerario.Visible  :=false;
    dbgrid_pes_recebimento.Visible:=false;
    dbgrid_pes_devolucao.Visible:=True;
    msk_list_bco.visible          :=False;
    btn_co_bc.visible             :=False;
    label16.visible               :=False;
    edt_list_bco.visible          :=False;
    rdgrp_tp_status.Items.Clear;
    rdgrp_tp_status.Items.Add('Aberto');
    rdgrp_tp_status.Items.Add('Solicitado');
    rdgrp_tp_status.Items.Add('Todos');
    ts_rec_desemb.TabVisible      := False;
    ts_rec_ag.TabVisible          := false;
    ts_rec_pendentes.TabVisible   := False;
    Label31.Caption := 'Data Inicial';
    Label32.Caption := 'Data Final';
  end;
  rdgrp_tp_status.ItemIndex := 0;
  ExecutaConsulta;
end;

procedure Tfrm_recebimento_ag.atz_distribui_recebimento;
begin
  try
    with datm_recebimento_ag do
    begin
      CloseStoredProc(sp_distribui_recebimento);
      sp_distribui_recebimento.ParamByName('@nr_recebimento').AsString:= qry_recebimento_NR_RECEBIMENTO.AsString;
      sp_distribui_recebimento.ParamByName('@cd_cliente').AsString    := qry_recebimento_CD_CLIENTE.AsString;
      sp_distribui_recebimento.ParamByName('@cd_unid_neg').AsString   := qry_recebimento_CD_UNID_NEG.AsString;
      sp_distribui_recebimento.ParamByName('@vl_recebimento').AsFloat := qry_recebimento_VL_RECEBIMENTO.AsFloat;
      sp_distribui_recebimento.ParamByName('@cd_banco').AsString      := qry_recebimento_CD_BANCO.AsString;
      ExecStoredProc(sp_distribui_recebimento);
      CloseStoredProc(sp_distribui_recebimento);
    end;
  except
    ON E: EXCEPTION DO SHOWMESSAGE( E.MESSAGE );
  end;
end;

procedure Tfrm_recebimento_ag.baixa_recebimento_ag;
var
  i,j : integer;
  vl_adicional, vl_calculado, vl_recebido : real;
  BookMark : TBookMark;
  RECIBO : Tquery;
begin
  vl_adicional := datm_recebimento_ag.qry_recebimento_VL_TT_ADICIONAL.AsFloat;
  vl_calculado := datm_recebimento_ag.qry_recebimento_VL_TOT_RECEBIDO.AsFloat;
  vl_recebido  := datm_recebimento_ag.qry_recebimento_VL_RECEBIMENTO.AsFloat;
  vl_calculado := vl_calculado +  vl_adicional;
  if (formatfloat('0.00',vl_calculado) <> formatfloat('0.00',vl_recebido)) then
  begin
    Boxmensagem('O Total Calculado com o Total Adicional não confere com o Valor Recebido!',2);
    Exit;
  end;
  if (datm_recebimento_ag.qry_recebimento_NR_FATURA.AsString = '') AND (in_integracao_contabil = '1') then
  begin
    BoxMensagem('Não foi emitido Fatura para este Recebimento!',2);
    Exit;
  end;
  if (datm_recebimento_ag.qry_recebimento_IN_EMITIDO_FAT.AsString <> '1') AND (in_integracao_contabil = '1') then
  begin
    BoxMensagem('Não foi confirmada Emissão da Fatura, Por favor Imprimir novamente!',2);
    Exit;
  end;
  if not(datm_recebimento_ag.qry_recebimento_.State in [dsEdit]) then
    datm_recebimento_ag.qry_recebimento_.edit;
  datm_recebimento_ag.qry_recebimento_IN_ABERTO.AsString:='B';
  if datm_recebimento_ag.qry_recebimento_NR_RECIBO.AsString = '' then
  begin
    RECIBO := TQuery.Create(Application);
    RECIBO.DataBaseName:= 'DBBROKER';
    RECIBO.Sql.Add(' SELECT ISNULL(MAX(NR_RECIBO),"000000") FROM TRECEBIMENTO_AG (NOLOCK) ');
    RECIBO.Open;
    datm_recebimento_ag.qry_recebimento_NR_RECIBO.AsString:= formatfloat('000000',strtofloat(RECIBO.Fields[0].AsString) + 1);
    RECIBO.Free;
  end;
  try
    datm_main.db_broker.StartTransaction;
    datm_recebimento_ag.qry_recebimento_.Post;
    lb_demostrativo.Caption:= 'Atualizando Notificação...';
    pnl_efetiva_receb_ag.Visible := true;
    Application.ProcessMessages;
    BookMark:=datm_recebimento_ag.qry_recebimento_processo_.GetBookmark;
    datm_recebimento_ag.qry_recebimento_processo_.First;
    while not(datm_recebimento_ag.qry_recebimento_processo_.Eof) do
    begin
      if not(datm_recebimento_ag.qry_recebimento_processo_.State in[dsEdit]) then
        datm_recebimento_ag.qry_recebimento_processo_.Edit;
      datm_recebimento_ag.qry_recebimento_processo_CD_STATUS.AsString:='B';
      datm_recebimento_ag.qry_recebimento_processo_.Post;
      with TQuery.Create(Application) do
      begin
        DAtaBaseName:='DBBROKER';
        Sql.Clear;
        Sql.Add(' UPDATE TPROCESSO SET DT_RECEBIMENTO =:DT_RECEBIMENTO WHERE ');
        Sql.Add(' NR_PROCESSO=:NR_PROCESSO AND DT_RECEBIMENTO IS NULL ');
        Params[0].AsDatetime:=datm_recebimento_ag.qry_recebimento_DT_RECEBIMENTO.AsDAtetime;
        Params[1].AsString:=datm_recebimento_ag.qry_recebimento_processo_NR_PROCESSO.AsString;
        ExecSql;
        Sql.Clear;
        Sql.Add(' UPDATE TNUMERARIO_NOTIFICA SET VL_RECEBIDO =:VL_RECEBIDO, CD_STATUS = "B" WHERE ');
        Sql.Add(' NR_SOLICITACAO=:NR_SOLICITACAO AND NR_PROCESSO=:NR_PROCESSO ');
        Params[0].AsFloat:=datm_recebimento_ag.qry_recebimento_processo_VL_RECEBIDO.AsFloat;
        Params[1].AsString:=datm_recebimento_ag.qry_recebimento_processo_NR_SOLICITACAO.AsString;
        Params[2].AsString:=datm_recebimento_ag.qry_recebimento_processo_NR_PROCESSO.AsString;
        ExecSql;
        Free;
      end;
      while not(datm_recebimento_ag.qry_receb_proc_item_.Eof)do
      begin
        with TQuery.Create(Application) do
        begin
          DAtaBaseName:='DBBROKER';
          Sql.Clear;
          Sql.Add(' UPDATE TNUMERARIO_NOTIFICA_ITEM SET VL_RECEBIDO =:VL_RECEBIDO, CD_STATUS = "B" WHERE ');
          Sql.Add(' NR_SOLICITACAO=:NR_SOLICITACAO AND NR_PROCESSO=:NR_PROCESSO ');
          Sql.Add(' AND  NR_LANCAMENTO = :NR_LANCAMENTO ');
          Params[0].AsFloat:=datm_recebimento_ag.qry_receb_proc_item_VL_RECEBIDO.AsFloat;
          Params[1].AsString:=datm_recebimento_ag.qry_receb_proc_item_NR_SOLICITACAO.AsString;
          Params[2].AsString:=datm_recebimento_ag.qry_receb_proc_item_NR_PROCESSO.AsString;
          Params[3].AsString:=datm_recebimento_ag.qry_receb_proc_item_NR_LANCAMENTO.AsString;
          ExecSql;
          Free;
        end;
        datm_recebimento_ag.qry_receb_proc_item_.next;
      end;
      with datm_recebimento_ag do
      begin
        lb_demostrativo.Caption:= 'Atualizando Pagamentos...';
        Application.ProcessMessages;
        CloseStoredProc(sp_atz_status_solic_pagto_ag);
        sp_atz_status_solic_pagto_ag.ParamByName('@nr_processo').AsString:= qry_recebimento_processo_NR_PROCESSO.AsString;
        ExecStoredProc( sp_atz_status_solic_pagto_ag);
        CloseStoredProc(sp_atz_status_solic_pagto_ag);
        CloseStoredProc(sp_solic_pagto_vinc_ag);
        sp_solic_pagto_vinc_ag.ParamByName('@nr_processo').AsString:= qry_recebimento_processo_NR_PROCESSO.AsString;
        sp_solic_pagto_vinc_ag.ParamByName('@nr_solic').AsString   := qry_recebimento_processo_NR_SOLICITACAO.AsString;
        sp_solic_pagto_vinc_ag.ParamByName('@dt_pagto').AsDateTime := qry_recebimento_DT_RECEBIMENTO.AsDatetime;
        ExecStoredProc( sp_solic_pagto_vinc_ag);
        CloseStoredProc(sp_solic_pagto_vinc_ag);
      end;
      datm_recebimento_ag.qry_recebimento_processo_.Next;
    end;
    datm_recebimento_ag.qry_recebimento_processo_.GotoBookmark(BookMark);
    datm_recebimento_ag.qry_recebimento_processo_.FreeBookmark(BookMark);
    with datm_recebimento_ag do
    begin
      lb_demostrativo.Caption:= 'Gerando Caixa...';
      Application.ProcessMessages;
      CloseStoredProc(sp_distribui_numerario_ag);
      sp_distribui_numerario_ag.ParamByName('@dt_movimento').AsDatetime:= qry_recebimento_DT_RECEBIMENTO.AsDateTime;
      sp_distribui_numerario_ag.ParamByName('@cd_unid_neg').AsString   := qry_recebimento_CD_UNID_NEG.AsString;
      sp_distribui_numerario_ag.ParamByName('@nr_recebimento').AsString:= qry_recebimento_NR_RECEBIMENTO.AsString;
      sp_distribui_numerario_ag.ParamByName('@cd_cliente').AsString    := qry_recebimento_CD_CLIENTE.AsString;
      if dbradgrp_in_maior.Itemindex = 1 then
        sp_distribui_numerario_ag.ParamByName('@in_maior').AsString     := '1'
      else sp_distribui_numerario_ag.ParamByName('@in_maior').AsString := '0';
      sp_distribui_numerario_ag.ParamByName('@in_cancelamento').AsString    := '0';
      ExecStoredProc( sp_distribui_numerario_ag);
      CloseStoredProc(sp_distribui_numerario_ag);
      lb_demostrativo.Caption:= 'Gerando Conta Corrente...';
      Application.ProcessMessages;
      CloseStoredProc(sp_recebimento_filtro);
      sp_recebimento_filtro.ParamByName('@dt_recebimento').AsDatetime:= qry_recebimento_DT_RECEBIMENTO.AsDateTime;
      sp_recebimento_filtro.ParamByName('@cd_unid_neg').AsString     := qry_recebimento_CD_UNID_NEG.AsString;
      sp_recebimento_filtro.ParamByName('@nr_recebimento').AsString  := qry_recebimento_NR_RECEBIMENTO.AsString;
      sp_recebimento_filtro.ParamByName('@cd_cliente').AsString      := qry_recebimento_CD_CLIENTE.AsString;
      if  dbradgrp_in_maior.Itemindex = 1 then
        sp_recebimento_filtro.ParamByName('@in_maior').AsString     := '1'
      else datm_recebimento_ag.sp_recebimento_filtro.ParamByName('@in_maior').AsString := '0';
      ExecStoredProc( sp_recebimento_filtro);
      CloseStoredProc(sp_recebimento_filtro);
      if in_integracao_contabil ='1' then
        exec_sp_conta_emis_recibo(qry_recebimento_CD_UNID_NEG.AsString,
                                  qry_recebimento_NR_RECEBIMENTO.AsString,
                                  qry_recebimento_CD_CLIENTE.AsString,
                                  qry_recebimento_NR_FATURA.AsString,
                                  qry_recebimento_CD_BANCO.AsString,
                                  qry_recebimento_DT_RECEBIMENTO.AsDateTime,'+');
    end;
    datm_main.db_broker.Commit;
    pnl_efetiva_receb_ag.Visible:= false;
    Application.ProcessMessages;
    datm_recebimento_ag.ds_recebimento.AutoEdit    :=false;
    datm_recebimento_ag.ds_recb_processo.AutoEdit  :=false;
//    datm_recebimento_ag.ds_moeda_tarifario.AutoEdit:=false;
    datm_recebimento_ag.DDS_RECB_PROC_ITEM.AutoEdit:=false;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      datm_recebimento_ag.qry_recebimento_.cancel;
      datm_recebimento_ag.qry_recebimento_processo_.cancel;
      pnl_efetiva_receb_ag.Visible:= false;
      Application.ProcessMessages;
      TrataErro(E);
    end;
  end;
end;

procedure Tfrm_recebimento_ag.baixa_recebimento_des;
var
  nr_recebimento_ag : string[6];
  RECIBO : Tquery;
  vl_resultado, vl_recebimento, vl_adc, vl_tt_util, vDiferenca : Real;

  procedure AtualizaEventos;
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      Sql.Clear;
      //Sql.Add('UPDATE TFOLLOWUP SET DT_REALIZACAO = CONVERT(datetime, ''' + DateToStr(dt_server) + ''' , 103), CD_RESP_REALIZACAO = ''' + str_cd_usuario + '''');

      // Comentado acima para utlizar a hora abaixo - Michel - 06/04/2010
      if ConsultaLookUPSQL(' SELECT ISNULL(CS.IN_HORA_EVENTOS, ''0'') AS IN_HORA_EVENTOS ' +
                           ' FROM TCLIENTE_SERVICO CS INNER JOIN TPROCESSO P ON P.CD_SERVICO = CS.CD_SERVICO ' +
                           '                                                AND P.CD_CLIENTE = CS.CD_CLIENTE ' +
                           '                                                AND P.CD_UNID_NEG = CS.CD_UNID_NEG ' +
                           '                                                AND P.CD_PRODUTO  = CS.CD_PRODUTO ' +
                           ' WHERE P.NR_PROCESSO = ' + QuotedStr(datm_recebimento_ag.qry_recebimento_processo_NR_PROCESSO.AsString), 'IN_HORA_EVENTOS') = '1' then
        Sql.Add('UPDATE TFOLLOWUP SET DT_REALIZACAO = GETDATE(), CD_RESP_REALIZACAO = ''' + str_cd_usuario + '''')
      else
        Sql.Add('UPDATE TFOLLOWUP SET DT_REALIZACAO = CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103), CD_RESP_REALIZACAO = ''' + str_cd_usuario + '''');
      Sql.Add('WHERE NR_PROCESSO = :NR_PROCESSO AND CD_EVENTO = :CD_EVENTO AND IN_APLICAVEL = ''1''');

      if ConsultaLookUPSQL('SELECT COUNT(*) CONT FROM TRECEBIMENTO_PROCESSO_ITEM (NOLOCK) ' +
                           ' WHERE NR_PROCESSO = "' + datm_recebimento_ag.qry_recebimento_processo_NR_PROCESSO.AsString +'" ' +
                           '  AND SUBSTRING(NR_PROCESSO, 3, 2) IN ("01", "03") ' +
                           '  AND CD_ITEM IN (SELECT CD_ITEM FROM TITEM (NOLOCK) WHERE IN_ITEM_DI = "0") ', 'CONT') > '0' then begin
        ParamByName('NR_PROCESSO').AsString    := datm_recebimento_ag.qry_recebimento_processo_NR_PROCESSO.AsString;
        ParamByName('CD_EVENTO').AsString      := '076';
        ExecSql;
      end;
      if ConsultaLookUPSQL('SELECT COUNT(*) CONT FROM TRECEBIMENTO_PROCESSO_ITEM (NOLOCK) ' +
                           ' WHERE NR_PROCESSO = "' + datm_recebimento_ag.qry_recebimento_processo_NR_PROCESSO.AsString +'" ' +
                           '  AND SUBSTRING(NR_PROCESSO, 3, 2) IN ("01", "03") ' +
                           '  AND CD_ITEM IN (SELECT CD_ITEM FROM TITEM (NOLOCK) WHERE IN_ITEM_DI = "1") ', 'CONT') > '0' then begin
        ParamByName('NR_PROCESSO').AsString    := datm_recebimento_ag.qry_recebimento_processo_NR_PROCESSO.AsString;
        ParamByName('CD_EVENTO').AsString      := '207';
        ExecSql;
      end;
      SQL.Clear;
      SQl.Add('Exec sp_atz_followup ''' + datm_recebimento_ag.qry_recebimento_processo_NR_PROCESSO.AsString + '''');
      ExecSQL;
      Free;
    end;
  end;
begin
  if datm_recebimento_ag.qry_recebimento_IN_ABERTO.AsString <> 'A' then
  Begin
    Boxmensagem('Este Recebimento não esta Aberto!',2);
    exit;
  end;
  vl_recebimento := datm_recebimento_ag.qry_recebimento_VL_RECEBIMENTO.AsFloat;
  vl_adc         := datm_recebimento_ag.qry_recebimento_VL_TT_ADICIONAL.AsFloat;
  vl_tt_util     := datm_recebimento_ag.qry_recebimento_VL_TOT_UTILIZADO.AsFloat;
  vl_resultado   := abs(vl_recebimento - (vl_adc + vl_tt_util));
  nr_recebimento_ag:='';
  if not(datm_recebimento_ag.qry_recebimento_.State in [dsEdit]) then
    datm_recebimento_ag.qry_recebimento_.edit;
  if datm_recebimento_ag.qry_recebimento_NR_RECIBO.AsString = '' then
  begin
    RECIBO := TQuery.Create(Application);
    RECIBO.DataBaseName:= 'DBBROKER';
    RECIBO.Sql.Add(' SELECT ISNULL(MAX(NR_RECIBO),"000000") FROM TRECEBIMENTO_AG (NOLOCK) ');
    RECIBO.Open;
    datm_recebimento_ag.qry_recebimento_NR_RECIBO.AsString:= formatfloat('000000',strtofloat(RECIBO.Fields[0].AsString) + 1);
    RECIBO.Free;
  end;
  vDiferenca := (datm_recebimento_ag.qry_recebimento_VL_TT_ADICIONAL.asFloat + datm_recebimento_ag.qry_recebimento_VL_TOT_RECEBIDO.asFloat) - datm_recebimento_ag.qry_recebimento_VL_RECEBIMENTO.asFloat;
  if ( vDiferenca > 0.02 )  then
    datm_recebimento_ag.qry_recebimento_IN_ABERTO.AsString := 'P'
  else datm_recebimento_ag.qry_recebimento_IN_ABERTO.AsString := 'B';
  try
    datm_main.db_broker.StartTransaction;
    datm_recebimento_ag.qry_recebimento_.Post;
    with datm_recebimento_ag do
    begin
      // atualiza o numerario do processos do desembaraço
      pnl_efetiva_receb_des.Visible := true;
      lb_demostrativo_des.Caption   := 'Atualizando Numerário...';
      Application.ProcessMessages;
      CloseStoredProc(sp_atz_numerario_ag);
      sp_atz_numerario_ag.ParamByName('@dt_recebimento').AsDatetime:= qry_recebimento_DT_RECEBIMENTO.AsDateTime;
      sp_atz_numerario_ag.ParamByName('@cd_unid_neg').AsString   := qry_recebimento_CD_UNID_NEG.AsString;
      sp_atz_numerario_ag.ParamByName('@nr_recebimento').AsString:= qry_recebimento_NR_RECEBIMENTO.AsString;
      sp_atz_numerario_ag.ParamByName('@cd_cliente').AsString    := qry_recebimento_CD_CLIENTE.AsString;
      ExecStoredProc( sp_atz_numerario_ag );
      CloseStoredProc( sp_atz_numerario_ag );
      lb_demostrativo_des.Caption   := 'Atualizando Processo Vinculado...';
      Application.ProcessMessages;
      //caso o existe um processo vinculado, cria um recebimento para o agenciamento
      //atualiza a notificacao e o solicitacao de pagto
      CloseStoredProc(sp_orig_receb_ag);
      sp_orig_receb_ag.ParamByName('@cd_unid_neg').AsString     := qry_recebimento_CD_UNID_NEG.AsString;
      sp_orig_receb_ag.ParamByName('@nr_recebimento').AsString  := qry_recebimento_NR_RECEBIMENTO.AsString;
      sp_orig_receb_ag.ParamByName('@cd_cliente').AsString      := qry_recebimento_CD_CLIENTE.AsString;
      sp_orig_receb_ag.ParamByName('@dt_recebimento').AsDatetime:= qry_recebimento_DT_RECEBIMENTO.AsDatetime;
      sp_orig_receb_ag.ParamByName('@nr_recebimento_ag').AsString:= '';
      ExecStoredProc( sp_orig_receb_ag );
      nr_recebimento_ag := ''; // datm_recebimento_ag.qry_recebimento_NR_RECEBIMENTO.AsString; //sp_orig_receb_ag.ParamByName('@nr_recebimento_ag').AsString;
      CloseStoredProc( sp_orig_receb_ag );
      if nr_recebimento_ag <> '' then
      begin
        lb_demostrativo_des.Caption   := 'Atualizando Pagamento...';
        Application.ProcessMessages;
        CloseStoredProc( sp_distribui_pagto );
        sp_distribui_pagto.ParamByName('@dt_pagto').AsDateTime := qry_recebimento_DT_RECEBIMENTO.AsDatetime;
        sp_distribui_pagto.ParamByName('@nr_ref').AsString     := 'C';
        sp_distribui_pagto.ParamByName('@tp_destino').AsString := 'S';
        sp_distribui_pagto.ParamByName('@nr_doc').AsString := '';
        ExecStoredProc(sp_distribui_pagto);
        CloseStoredProc( sp_distribui_pagto );
      end;
      lb_demostrativo_des.Caption   := 'Gerando Caixa e Faturamento...';
      Application.ProcessMessages;
     //lança os processo para o Caixa e faturamento CC
      CloseStoredProc(sp_distribui_numerario_ag);
      sp_distribui_numerario_ag.ParamByName('@dt_movimento').AsDatetime := qry_recebimento_DT_RECEBIMENTO.AsDateTime;
      sp_distribui_numerario_ag.ParamByName('@cd_unid_neg').AsString    := qry_recebimento_CD_UNID_NEG.AsString;
      sp_distribui_numerario_ag.ParamByName('@nr_recebimento').AsString := qry_recebimento_NR_RECEBIMENTO.AsString;
      sp_distribui_numerario_ag.ParamByName('@cd_cliente').AsString     := qry_recebimento_CD_CLIENTE.AsString;
      if dbradgrp_in_maior2.Itemindex = 1 then
        sp_distribui_numerario_ag.ParamByName('@in_maior').AsString     := '1'
      else sp_distribui_numerario_ag.ParamByName('@in_maior').AsString := '0';
      sp_distribui_numerario_ag.ParamByName('@in_cancelamento').AsString    := '0';
      ExecStoredProc( sp_distribui_numerario_ag);
      CloseStoredProc(sp_distribui_numerario_ag);
      // Lança no Tfaturamento CC
      CloseStoredProc(sp_atz_fat_cc_ag);
      sp_atz_fat_cc_ag.ParamByName('@cd_coligada').AsString := '01';
      sp_atz_fat_cc_ag.ParamByName('@dt_movimento').AsDatetime := qry_recebimento_DT_RECEBIMENTO.AsDateTime;
      ExecStoredProc(sp_atz_fat_cc_ag);
      CloseStoredProc(sp_atz_fat_cc_ag);
      if in_integracao_contabil = '1' then
      begin
        lb_demostrativo_des.Caption := 'Contabilizando Numerário...';
        Application.ProcessMessages;
        exec_sp_conta_receb_desemb(qry_recebimento_CD_UNID_NEG.AsString, qry_recebimento_NR_RECEBIMENTO.AsString,
                                   qry_recebimento_CD_CLIENTE.AsString, qry_recebimento_DT_RECEBIMENTO.AsDAtetime, '+');
      end;
      datm_main.db_broker.Commit;
      boxmensagem('Caixa e Faturamento gerados com sucesso.',3);

      // Atualiza os eventos 076 e 207 do followup - Michel - 05/05/2009
      lb_demostrativo_des.Caption := 'Atualizando eventos do Followup...';
      AtualizaEventos;

      qry_recebimento_processo_.close;
      qry_recebimento_processo_.ParamByName('NR_RECEBIMENTO').AsString:= qry_recebimento_NR_RECEBIMENTO.AsString;
      qry_recebimento_processo_.ParamByName('CD_CLIENTE').AsString    := qry_recebimento_CD_CLIENTE.AsString;
      qry_recebimento_processo_.ParamByName('CD_UNID_NEG').AsString   := qry_recebimento_CD_UNID_NEG.AsString;
      qry_recebimento_processo_.Prepare;
      qry_recebimento_processo_.Open;
      qry_receb_proc_item_.Close;
      qry_receb_proc_item_.prepare;
      qry_receb_proc_item_.open;
      ds_recebimento.AutoEdit    :=false;
      ds_recb_processo.AutoEdit  :=false;
      DDS_RECB_PROC_ITEM.AutoEdit:=false;
      pnl_efetiva_receb_des.Visible := false;
      Application.ProcessMessages;
      if nr_recebimento_ag <> '' then
        boxmensagem('Recebimento OK no Processo Vinculado : '+nr_recebimento_ag,3);
    end;
  except
    on E: Exception do
    begin
      pnl_efetiva_receb_des.Visible := false;
      Application.ProcessMessages;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      datm_recebimento_ag.qry_recebimento_.cancel;
      datm_recebimento_ag.qry_recebimento_processo_.cancel;
      TrataErro(E);
    end;
  end;
end;

procedure Tfrm_recebimento_ag.Button1Click(Sender: TObject);
begin
// Atualiza os valores do desembaraco com itens do agenciamento com o tarifario informado pelo usuario
  with datm_recebimento_ag do
  begin
    CloseStoredProc(sp_atz_tarifa_desemb);
    sp_atz_tarifa_desemb.ParamByName('@nr_recebimento').AsString:= qry_recebimento_NR_RECEBIMENTO.AsString;
    sp_atz_tarifa_desemb.ParamByName('@cd_cliente').AsString    := qry_recebimento_CD_CLIENTE.AsString;
    sp_atz_tarifa_desemb.ParamByName('@cd_unid_neg').AsString   := qry_recebimento_CD_UNID_NEG.AsString;
    ExecStoredProc(sp_atz_tarifa_desemb);
    CloseStoredProc(sp_atz_tarifa_desemb);
    qry_recebimento_.close;
    qry_recebimento_.ParamByName('NR_RECEBIMENTO').AsString:= qry_list_receb_NR_RECEBIMENTO.AsString;
    qry_recebimento_.ParamByName('CD_CLIENTE').AsString    := qry_list_receb_CD_CLIENTE.AsString;
    qry_recebimento_.ParamByName('CD_UNID_NEG').AsString   := qry_list_receb_CD_UNID_NEG.AsString;
    qry_recebimento_.Prepare;
    qry_recebimento_.Open;
    qry_recebimento_processo_.close;
    qry_recebimento_processo_.ParamByName('NR_RECEBIMENTO').AsString:= qry_list_receb_NR_RECEBIMENTO.AsString;
    qry_recebimento_processo_.ParamByName('CD_CLIENTE').AsString    := qry_list_receb_CD_CLIENTE.AsString;
    qry_recebimento_processo_.ParamByName('CD_UNID_NEG').AsString   := qry_list_receb_CD_UNID_NEG.AsString;
    qry_recebimento_processo_.Prepare;
    qry_recebimento_processo_.Open;
    qry_receb_proc_item_.Close;
    qry_receb_proc_item_.prepare;
    qry_receb_proc_item_.open;
    if (formatfloat('0.00',qry_recebimento_VL_RECEBIMENTO.AsFloat) >
        formatfloat('0.00',qry_recebimento_VL_TOT_UTILIZADO.AsFloat)) then
    begin
      dbradgrp_in_maior2.Visible:=true;
      lb_restante2.Caption:=formatfloat('0.00',strtofloat(formatfloat('0.00',qry_recebimento_VL_RECEBIMENTO.AsFloat))-
                            (strtofloat(formatfloat('0.00',qry_recebimento_VL_TOT_UTILIZADO.AsFloat))+
                            strtofloat(formatfloat('0.00',qry_recebimento_VL_TT_ADICIONAL.AsFloat))));
    end else begin
      lb_restante2.Caption:='0.00';
      dbradgrp_in_maior2.Visible:=false;
    end;
  end;
  pnl_tarifariao_desembaraco.SendToBack;
  pnl_cadastro.Enabled      :=TRUE;
  dbg_numerario.ReadOnly    :=false;
  dbgrid_item_des.ReadOnly  :=false;
  dbradgrp_in_maior2.Enabled:=TRUE;
  pnl_recebimento.Enabled   :=TRUE;
end;

procedure Tfrm_recebimento_ag.Button2Click(Sender: TObject);
begin
  pnl_tarifariao_desembaraco.SendToBack;
  pnl_cadastro.Enabled       := true;
  dbg_numerario.ReadOnly     := false;
  dbgrid_item_des.ReadOnly   := false;
  dbradgrp_in_maior2.Enabled := true;
  pnl_recebimento.Enabled    := true;
end;

procedure Tfrm_recebimento_ag.edt_chaveChange(Sender: TObject);
begin
  if rdgp_tp_pesquisa.ItemIndex = 1 then
  begin
    if datm_recebimento_ag.qry_list_receb_.State in[dsInactive] then
      exit;
    datm_recebimento_ag.qry_list_receb_.Locate('NR_PROCESSO', msk_cd_unid_neg.Text + msk_cd_produto.Text + edt_chave.Text,[loCaseInsensitive, loPartialKey]);
  end;

  if rdgp_tp_pesquisa.ItemIndex = 0 then
  begin
    if datm_recebimento_ag.qry_pesq_notificacao_.State in[dsInactive] then
      exit;
    datm_recebimento_ag.qry_pesq_notificacao_.Locate('NR_PROCESSO', msk_cd_unid_neg.Text + msk_cd_produto.Text + edt_chave.Text,[loCaseInsensitive, loPartialKey]);
  end;
end;

procedure Tfrm_recebimento_ag.mi_fatClick(Sender: TObject);
var
  FATURA : TQuery;
  nr_recebimento, cd_cliente, cd_unid_neg : String;
begin
  if (in_integracao_contabil = '1') and (dt_contabilizacao >=datm_recebimento_ag.qry_recebimento_DT_FATURA.AsDAteTime) then
  begin
    Boxmensagem('Periodo Contabil Fechado! Data de Faturamento Inválida',2);
    dbedt_dt_fatura.Setfocus;
    Exit;
  end;
  if datm_recebimento_ag.qry_recebimento_NR_FATURA.AsString = '' then
  begin
    nr_recebimento:= datm_recebimento_ag.qry_recebimento_NR_RECEBIMENTO.AsString ;
    cd_cliente    := datm_recebimento_ag.qry_recebimento_CD_CLIENTE.AsString ;
    cd_unid_neg   := datm_recebimento_ag.qry_recebimento_CD_UNID_NEG.AsString ;
    FATURA := TQuery.Create(Application);
    FATURA.DataBaseName:= 'DBBROKER';
    FATURA.Sql.Add(' SELECT ISNULL(MAX(NR_FATURA),"000000") FROM TNUMERO_FATURA (NOLOCK)');
    FATURA.Open;
    if not(datm_recebimento_ag.qry_recebimento_.State in [dsEdit, dsinsert]) then
      datm_recebimento_ag.qry_recebimento_.Edit;
    datm_recebimento_ag.qry_recebimento_NR_FATURA.AsString:= formatfloat('000000',strtofloat(FATURA.Fields[0].AsString) + 1);
    datm_recebimento_ag.qry_recebimento_.Post;
    FATURA.Sql.Clear;
    FATURA.Sql.Add(' INSERT INTO TNUMERO_FATURA(NR_FATURA, CD_USUARIO, DT_ABERTURA) ');
    FATURA.Sql.Add('VALUES(:NR_FATURA, :CD_USUARIO, :DT_ABERTURA)');
    FATURA.Params[0].AsString   := datm_recebimento_ag.qry_recebimento_NR_FATURA.AsString;
    FATURA.Params[1].AsString   := str_cd_usuario;
    FATURA.Params[2].AsDateTime := now();
    FATURA.ExecSql;
    FATURA.Free;
    with datm_recebimento_ag do
    begin
      qry_recebimento_.close;
      qry_recebimento_.ParamByName('NR_RECEBIMENTO').AsString:= nr_recebimento;
      qry_recebimento_.ParamByName('CD_CLIENTE').AsString    := cd_cliente;
      qry_recebimento_.ParamByName('CD_UNID_NEG').AsString   := cd_unid_neg;
      qry_recebimento_.Prepare;
      qry_recebimento_.Open;
      qry_recebimento_processo_.close;
      qry_recebimento_processo_.ParamByName('NR_RECEBIMENTO').AsString:= nr_recebimento;
      qry_recebimento_processo_.ParamByName('CD_CLIENTE').AsString    := cd_cliente;
      qry_recebimento_processo_.ParamByName('CD_UNID_NEG').AsString   := cd_unid_neg;
      qry_recebimento_processo_.Prepare;
      qry_recebimento_processo_.Open;
      qry_receb_proc_item_.Close;
      qry_receb_proc_item_.prepare;
      qry_receb_proc_item_.open;
    end;
  end;
  with datm_recebimento_ag do
  begin
    qry_fatura_.close;
    qry_fatura_.ParamByName('NR_RECEBIMENTO').AsString := qry_recebimento_NR_RECEBIMENTO.AsString;
    qry_fatura_.ParamByName('CD_CLIENTE').AsString     := qry_recebimento_CD_CLIENTE.AsString;
    qry_fatura_.ParamByName('CD_UNID_NEG').AsString    := qry_recebimento_CD_UNID_NEG.AsString;
    qry_fatura_.Prepare;
    qry_fatura_.Open;
  end;
  Application.CreateForm(TFrm_impressao, Frm_impressao );
  Frm_impressao.cd_emp_nac    := datm_recebimento_ag.qry_recebimento_CD_CLIENTE.AsString;
  Frm_impressao.cd_unid_neg   := datm_recebimento_ag.qry_recebimento_CD_UNID_NEG.AsString;
  Frm_impressao.cd_modulo     := '0608';
  Frm_impressao.ShowModal;
  try
    if datm_recebimento_ag.qry_recebimento_IN_EMITIDO_FAT.AsString <> '1' then
    begin
      if (in_integracao_contabil = '1') and (dt_contabilizacao >=datm_recebimento_ag.qry_recebimento_DT_FATURA.AsDAteTime) then
      begin
        Boxmensagem('Periodo Contabil Fechado. Esta Fatura não será Contabilizada!',2);
        Exit;
      end;
      If BoxMensagem('Esta Fatura será contabilizada. Confirma Fatura?',1) and (in_integracao_contabil = '1') then
      begin
        datm_main.db_broker.StartTransaction;
        if not(datm_recebimento_ag.qry_recebimento_.State in [dsEdit, dsinsert]) then
          datm_recebimento_ag.qry_recebimento_.Edit;
        datm_recebimento_ag.qry_recebimento_IN_EMITIDO_FAT.AsString:= '1';
        datm_recebimento_ag.qry_recebimento_.Post;
        datm_recebimento_ag.exec_sp_conta_emis_fat(datm_recebimento_ag.qry_recebimento_CD_UNID_NEG.AsString,
                                                     datm_recebimento_ag.qry_recebimento_NR_RECEBIMENTO.AsString,
                                                     datm_recebimento_ag.qry_recebimento_CD_CLIENTE.AsString,
                                                     datm_recebimento_ag.qry_recebimento_NR_FATURA.AsString,
                                                     datm_recebimento_ag.qry_recebimento_DT_FATURA.AsDAteTime, '+');
        datm_recebimento_ag.ds_recb_processo.AutoEdit    := false;
//          datm_recebimento_ag.ds_moeda_tarifario.AutoEdit  := false;
        datm_recebimento_ag.DDS_RECB_PROC_ITEM.AutoEdit  := false;
        datm_main.db_broker.commit;
        // A atualização do Followup era feita aqui, mas foi transferida para o
        // recebimento Des porque nem sempre utilizavam a impressão - Michel - 05/05/2009
      end;
    end;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
    end;
  end;
end;

procedure Tfrm_recebimento_ag.btn_lista_relClick(Sender: TObject);
begin
  if datm_recebimento_ag.qry_recebimento_TP_RECEBIMENTO.AsString = '0' then
    mi_fat.Visible := false
  else mi_fat.Visible := true;
  popmenu_lista_rel.Popup(frm_recebimento_ag.Left + btn_imprimir.Left + 3,frm_recebimento_ag.Top +  btn_lista_rel.top + btn_lista_rel.Height + 40 );
end;

procedure Tfrm_recebimento_ag.mi_reciboClick(Sender: TObject);
var
  RECIBO :TQuery;
  Str_Data, str_mes : string;
begin
  Str_Data := FormatDateTime('dd/mm/yyyy', datm_recebimento_ag.qry_recebimento_DT_RECEBIMENTO.AsDateTime );
  case StrtoInt( Copy( Str_Data, 4, 2 ) ) of
    1  : str_mes := 'Janeiro';
    2  : str_mes := 'Fevereiro';
    3  : str_mes := 'Março';
    4  : str_mes := 'Abril';
    5  : str_mes := 'Maio';
    6  : str_mes := 'Junho';
    7  : str_mes := 'Julho';
    8  : str_mes := 'Agosto';
    9  : str_mes := 'Setembro';
    10 : str_mes := 'Outubro';
    11 : str_mes := 'Novembro';
    12 : str_mes := 'Dezembro';
  end;
  Application.CreateForm(Tfrm_print_recibo, frm_print_recibo);
  frm_print_recibo.lbl_cliente.Caption := ConsultaLookUp('TEMPRESA_NAC','CD_EMPRESA',datm_recebimento_ag.qry_recebimento_processo_CD_CLIENTE.AsString,'NM_EMPRESA');
  frm_print_recibo.lbl_quantia.Caption := Extenso( datm_recebimento_ag.qry_recebimento_VL_RECEBIMENTO.AsFloat );
  frm_print_recibo.lbl_valor.Caption   := FormatFloat('#0,.00', datm_recebimento_ag.qry_recebimento_VL_RECEBIMENTO.AsFloat );
  frm_print_recibo.vl_recibo           := datm_recebimento_ag.qry_recebimento_VL_RECEBIMENTO.AsFloat;
  frm_print_recibo.lbl_data.Caption    := Copy( Str_Data, 1,2 ) + ' de ' + str_mes + ' de ' + Copy( Str_Data, 7,4 );
  frm_print_recibo.nr_proc             := datm_recebimento_ag.qry_recebimento_processo_NR_PROCESSO.asString;
  frm_print_recibo.nr_receb            := datm_recebimento_ag.qry_recebimento_NR_RECEBIMENTO.asString;
  frm_print_recibo.cd_cliente          := datm_recebimento_ag.qry_recebimento_processo_CD_CLIENTE.AsString;
  frm_print_recibo.nr_fp               := datm_recebimento_ag.qry_recebimento_NR_FP.asString;
  frm_print_recibo.ShowModal;
  frm_print_recibo.Free;
end;

procedure Tfrm_recebimento_ag.dbedt_cd_bancoExit(Sender: TObject);
begin
  if not(datm_recebimento_ag.qry_recebimento_.State in [dsEdit]) then
    exit;
  if dbedt_cd_banco.text <> '' then
  begin
    ValidCodigo( dbedt_cd_banco );
    with TQuery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      Sql.Add('SELECT NM_BANCO FROM TBANCO (NOLOCK) WHERE CD_BANCO = '+QuotedStr(dbedt_cd_banco.text));
      Open;
      if not IsEmpty then
      begin
        datm_recebimento_ag.qry_recebimento_NM_BANCO.AsString := Fields[0].AsString;
      end else begin
        Boxmensagem('Banco Inválido!',2);
        dbedt_cd_banco.SetFocus;
        Exit;
      end;
      Free;
    end;
  end else begin
    BoxMensagem('Deve ser Informado um Banco!!',2);
    dbedt_cd_banco.SetFocus;
  end;
end;

procedure Tfrm_recebimento_ag.SpeedButton1Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
    MaskEdit1.Text := ConsultaOnLineEx('TGRUPO','Grupos de Empresas',['CD_GRUPO','NM_GRUPO'],['Código','Nome do Grupo'],'CD_GRUPO')
  else Edit1.Text := ConsultaLookUp('TGRUPO','CD_GRUPO',MaskEdit1.Text,'NM_GRUPO');
  MaskEdit2.Text := MaskEdit1.Text;
end;

procedure Tfrm_recebimento_ag.dbgrid_pes_numerarioDblClick(
  Sender: TObject);
begin
  if rdgp_tp_pesquisa.ItemIndex = 0 then
  begin
    msk_cd_unid_neg2.Text := Copy(datm_recebimento_ag.qry_pesq_notificacao_.FieldByName('NR_PROCESSO').AsString,1,2);
    msk_cd_produto2.Text  := Copy(datm_recebimento_ag.qry_pesq_notificacao_.FieldByName('NR_PROCESSO').AsString,3,2);
    msk_processo.Text     := Trim(Copy(datm_recebimento_ag.qry_pesq_notificacao_.FieldByName('NR_PROCESSO').AsString,5,12));
    msk_cd_cliente.Text   := msk_list_cliente.Text;
    MaskEdit2.Text        := MaskEdit1.Text;
    rdgp_tp_servico.ItemIndex := StrToInt( ConsultaLookupSQL(' SELECT SE.TP_SERVICO ' +
                                                             '   FROM TSERVICO SE ( NOLOCK ), ' +
                                                             '        TPROCESSO PR ( NOLOCK ) ' +
                                                             '  WHERE SE.CD_SERVICO = PR.CD_SERVICO  ' +
                                                             '    AND PR.NR_PROCESSO = ''' + datm_recebimento_ag.qry_pesq_notificacao_.FieldByName('NR_PROCESSO').AsString + '''', 'TP_SERVICO') );
    msk_cd_unid_neg2Exit(nil);
    msk_cd_produto2Exit(nil);
    pgctrl_recebimento_ag.ActivePage := ts_rec_pendentes;
    pgctrl_recebimento_agChange(nil);
  end else
    BoxMensagem('Para montar um recebimento, selecione uma notificação.',3);
end;

procedure Tfrm_recebimento_ag.MaskEdit2Exit(Sender: TObject);
begin
  if MaskEdit2.Text <> '' then
    MaskEdit2.Text := Copy('000',1,3-Length(MaskEdit2.Text)) + MaskEdit2.Text;
  ExecutaConsulta;
end;

procedure Tfrm_recebimento_ag.MaskEdit1Exit(Sender: TObject);
begin
  if MaskEdit1.Text <> '' then
    MaskEdit1.Text := Copy('000',1,3-Length(MaskEdit1.Text)) + MaskEdit1.Text;
  ExecutaConsulta;
end;

procedure Tfrm_recebimento_ag.SpeedButton2Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
    MaskEdit2.Text := ConsultaOnLineEx('TGRUPO','Grupos de Empresas',['CD_GRUPO','NM_GRUPO'],['Código','Nome do Grupo'],'CD_GRUPO')
  else Edit2.Text := ConsultaLookUp('TGRUPO','CD_GRUPO',MaskEdit2.Text,'NM_GRUPO');
  MaskEdit1.Text := MaskEdit2.Text;
end;

procedure Tfrm_recebimento_ag.rdgrp_tp_statusClick(Sender: TObject);
begin
  if rdgrp_tp_status.Items.Count > 3 then
    pnlTodos.Visible := (rdgrp_tp_status.ItemIndex = 4);
  btn_devolucao.Visible := ( rdgrp_tp_status.ItemIndex = 1 ) and ( rdgp_tp_pesquisa.ItemIndex = 1 );
  ExecutaConsulta;
end;

procedure Tfrm_recebimento_ag.rdgp_tp_servicoClick(Sender: TObject);
begin
  ExecutaConsulta;
end;

procedure Tfrm_recebimento_ag.dbgrid_pes_numerarioDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if rdgrp_tp_status.ItemIndex = 4 then
  begin
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    if TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_STATUS').AsString = 'A' then
    begin
      TDBGrid(Sender).Canvas.FillRect(Rect);
      TDBGrid(Sender).Canvas.Brush.Color := $00E2E2C7;
    end else if TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_STATUS').AsString = 'B' then
    begin
      TDBGrid(Sender).Canvas.FillRect(Rect);
      TDBGrid(Sender).Canvas.Brush.Color := $00E6FFE6;
    end else if TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_STATUS').AsString = 'C' then
    begin
      TDBGrid(Sender).Canvas.FillRect(Rect);
      TDBGrid(Sender).Canvas.Brush.Color := $00A8C5FF;
    end else if TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_STATUS').AsString = 'P' then
    begin
      TDBGrid(Sender).Canvas.FillRect(Rect);
      TDBGrid(Sender).Canvas.Brush.Color := $00FFE7CE;
    end;
    TDBGrid(Sender).Canvas.TextOut(Rect.Left + 2 ,Rect.Top+2, Column.Field.Text );
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure Tfrm_recebimento_ag.dbgrid_pes_recebimentoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if rdgrp_tp_status.ItemIndex = 4 then
  begin
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    if TDBGrid(Sender).DataSource.DataSet.FieldByName('IN_ABERTO').AsString = 'A' then
    begin
      TDBGrid(Sender).Canvas.FillRect(Rect);
      TDBGrid(Sender).Canvas.Brush.Color := $00E2E2C7;
    end else if TDBGrid(Sender).DataSource.DataSet.FieldByName('IN_ABERTO').AsString = 'B' then
    begin
      TDBGrid(Sender).Canvas.FillRect(Rect);
      TDBGrid(Sender).Canvas.Brush.Color := $00E6FFE6;
    end else if TDBGrid(Sender).DataSource.DataSet.FieldByName('IN_ABERTO').AsString = 'C' then
    begin
      TDBGrid(Sender).Canvas.FillRect(Rect);
      TDBGrid(Sender).Canvas.Brush.Color := $00C6D9FF;
    end else if TDBGrid(Sender).DataSource.DataSet.FieldByName('IN_ABERTO').AsString = 'P' then
    begin
      TDBGrid(Sender).Canvas.FillRect(Rect);
      TDBGrid(Sender).Canvas.Brush.Color := $00FFE7CE;
    end;
    TDBGrid(Sender).Canvas.TextOut(Rect.Left + 2 ,Rect.Top+2, Column.Field.Text );
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure Tfrm_recebimento_ag.btn_co_produto2Click(Sender: TObject);
var
  produto : string;
begin
  produto := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Unidade'],'CD_PRODUTO',nil);
  if produto <>'' then
  begin
    msk_cd_produto.Text := produto;
    msk_cd_produtoExit(Sender);
  end;
end;

procedure Tfrm_recebimento_ag.msk_cd_produtoExit(Sender: TObject);
begin
  if msk_cd_produto.Text <> '' then
  begin
    ValCodEdt( msk_cd_produto );
    datm_recebimento_ag.qry_pesquisa_.Active := false;
    datm_recebimento_ag.qry_pesquisa_.Sql.Clear;
    datm_recebimento_ag.qry_pesquisa_.Sql.Add('SELECT NM_PRODUTO FROM TPRODUTO (NOLOCK) WHERE CD_PRODUTO="'+msk_cd_produto.Text+'"');
    datm_recebimento_ag.qry_pesquisa_.Sql.Add('AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO from TUSUARIO_HABILITACAO (NOLOCK)');
    datm_recebimento_ag.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_recebimento_ag.qry_pesquisa_.Active:=true;
    if not datm_recebimento_ag.qry_pesquisa_.IsEmpty then
    begin
      edit_nm_produto.Text := datm_recebimento_ag.qry_pesquisa_.Fields[0].AsString;
      datm_recebimento_ag.qry_pesquisa_.Close;
    end else begin
      datm_recebimento_ag.qry_pesquisa_.Close;
      edit_nm_produto.Text := '';
      BoxMensagem('Código do Produto inválido ou não habilidado!', 2);
      msk_cd_produto.SetFocus;
      Exit;
    end;
  end else begin
    BoxMensagem('Digite um código de produto.',3);
    msk_cd_produto.SetFocus;
  end;
  ExecutaConsulta;
end;

procedure Tfrm_recebimento_ag.msk_cd_produtoChange(Sender: TObject);
begin
  msk_cd_produto2.Text := msk_cd_produto.Text;
end;

procedure Tfrm_recebimento_ag.msk_cd_unid_negChange(Sender: TObject);
begin
  msk_cd_unid_neg2.Text := msk_cd_unid_neg.Text;
end;

procedure Tfrm_recebimento_ag.msk_list_clienteChange(Sender: TObject);
begin
  msk_cd_cliente.Text := msk_list_cliente.Text;
end;

procedure Tfrm_recebimento_ag.msk_vl_recebChange(Sender: TObject);
begin
  msk_valor.Text := msk_vl_receb.Text;
end;

procedure Tfrm_recebimento_ag.msk_cd_unid_neg2Change(Sender: TObject);
begin
  msk_cd_unid_neg.Text := msk_cd_unid_neg2.Text;
end;

procedure Tfrm_recebimento_ag.msk_cd_produto2Change(Sender: TObject);
begin
  msk_cd_produto.Text := msk_cd_produto2.Text;
end;

procedure Tfrm_recebimento_ag.msk_cd_clienteChange(Sender: TObject);
begin
  msk_list_cliente.Text := msk_cd_cliente.Text;
end;

procedure Tfrm_recebimento_ag.msk_valorChange(Sender: TObject);
begin
  msk_vl_receb.Text := msk_valor.Text;
end;

procedure Tfrm_recebimento_ag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_recebimento_ag.qry_notificacao_pend_.Close;
  datm_recebimento_ag.Free;
  Action := caFree;
end;

procedure Tfrm_recebimento_ag.edtValorDevolverExit(Sender: TObject);
begin
  edtValorDevolver.Text := FormatFloat('########.00', StrToFloat(edtValorDevolver.Text));
end;

procedure Tfrm_recebimento_ag.btn_devolucaoClick(Sender: TObject);
begin
  pgctrl_recebimento_ag.Enabled := False;
  pnl_cadastro.Enabled  := False;
  Panel1.Enabled        := False;
  pnlDevolucao.Visible  := True;
  edtProcesso.Text      := Copy(datm_recebimento_ag.qry_list_receb_.FieldByName('NR_PROCESSO').AsString,5,12);
  edtValorRecebido.Text := FormatFloat('########.00', datm_recebimento_ag.qry_list_receb_.FieldByName('VL_RECEBIMENTO').AsFloat);
end;

procedure Tfrm_recebimento_ag.SpeedButton3Click(Sender: TObject);
begin
  try
    pnldevolucao.Visible := False;
    edtProcesso.Clear;
    edtValorRecebido.Clear;
  finally
    pgctrl_recebimento_ag.Enabled := True;
    pnl_cadastro.Enabled := True;
    Panel1.Enabled := True;
  end;
end;

procedure Tfrm_recebimento_ag.SpeedButton4Click(Sender: TObject);
var
  vUltDevolucao : string;
begin
  if ( edtValorDevolver.Text = '' ) or ( medt1.Text = '  /  /    ' ) then
    Exit;
  try
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT CONVERT( int, ISNULL( MAX( NR_DEVOLUCAO), ''000''  ) ) + 1 FROM TDEVOLUCAO (NOLOCK) WHERE NR_PROCESSO = ''' + datm_recebimento_ag.qry_list_receb_.FieldByName('NR_PROCESSO').AsString + '''');
      Open;
      vUltDevolucao := Copy('000',1,3-Length(Fields[0].AsString)) + Fields[0].AsString;
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO TDEVOLUCAO VALUES (''' + datm_recebimento_ag.qry_list_receb_.FieldByName('NR_PROCESSO').AsString + ''',''' + vUltDevolucao + ''', :DATA_DEVOLUCAO,''' + datm_recebimento_ag.qry_list_receb_.FieldByName('CD_USUARIO').AsString + ''',:VALOR, 0, null, null, 0, null, null, null, null)');
      ParamByName('VALOR').AsFloat := StrToFloat(edtValorDevolver.Text);
      ParamByName('DATA_DEVOLUCAO').AsDateTime := StrToDate(medt1.Text);
      ExecSQL;
      Free;
    end;
    pnldevolucao.Visible := False;
    edtProcesso.Clear;
    edtValorRecebido.Clear;
    BoxMensagem('Registro de devolução gerado com sucesso.',3);
  finally
    pgctrl_recebimento_ag.Enabled := True;
    pnl_cadastro.Enabled := True;
    Panel1.Enabled := True;
  end;
end;

procedure Tfrm_recebimento_ag.btn_pagtoClick(Sender: TObject);
var
  vUltSolicPagto, vCodFavorecido : string;
begin
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT RIGHT( ''000'' + CONVERT( varchar, ISNULL ( CONVERT( int, MAX( ISNULL( NR_LANCAMENTO, ''000'' ) ) ) + 1, 1 ) ), 3 )');
    SQL.Add('  FROM TSOLIC_PAGTO (NOLOCK)');
    SQL.Add(' WHERE NR_PROCESSO = ''' + msk_cd_unid_neg.Text + msk_cd_produto.Text + datm_recebimento_ag.qry_devolucao_.FieldByName('NR_PROCESSO').AsString + '''');
    Open;
    vUltSolicPagto := Fields[0].AsString;
    Close;
    SQL.Clear;
    SQL.Add('SELECT F.CD_FAVORECIDO FROM TFAVORECIDO F (NOLOCK), TEMPRESA_NAC E (NOLOCK), TPROCESSO P (NOLOCK)');
    SQL.Add(' WHERE P.CD_CLIENTE = E.CD_EMPRESA and E.CGC_EMPRESA = F.CGC_EMPRESA and P.NR_PROCESSO = ''' + msk_cd_unid_neg.Text + msk_cd_produto.Text + datm_recebimento_ag.qry_devolucao_.FieldByName('NR_PROCESSO').AsString + '''');
    Open;
    vCodFavorecido := Fields[0].AsString;
    Close;
    SQL.Clear;
    SQL.Add(' INSERT TSOLIC_PAGTO ( NR_PROCESSO, CD_ITEM, VL_PAGTO, DT_PAGTO, CD_STATUS, IN_SOLICITADO, IN_RESTITUI, DT_SOLIC_PAGTO, HM_SOLIC_PAGTO, IN_CALCULADO, CD_FAVORECIDO, CD_BANCO, CD_USUARIO_SOLIC, CD_STATUS_CHEQUE, TP_DESTINO, IN_TRANSF_FIN, NR_LANCAMENTO )');
    SQL.Add(' VALUES(''' + msk_cd_unid_neg.Text + msk_cd_produto.Text + datm_recebimento_ag.qry_devolucao_.FieldByName('NR_PROCESSO').AsString + ''',''992'',:VL_PAGTO,null, ''0'',''0'',''0'',GETDATE(),GETDATE(),''0'',''' + vCodFavorecido + ''',null,''' + str_cd_usuario + ''',''0'',''2'',''0'',''' + vUltSolicPagto + ''')');
    ParamByname('VL_PAGTO').AsFloat := datm_recebimento_ag.qry_devolucao_.FieldByName('VL_DEVOLUCAO').AsFloat;
    ExecSQL;
    SQL.Clear;
    SQL.Add(' UPDATE TDEVOLUCAO SET DT_SOLIC_CH = GETDATE(), NR_SOLIC_CH = ''' + vUltSolicPagto + ''', IN_TRANSFERIDO = ''1''');
    SQL.Add(' WHERE NR_PROCESSO = ''' + msk_cd_unid_neg.Text + msk_cd_produto.Text + datm_recebimento_ag.qry_devolucao_.FieldByName('NR_PROCESSO').AsString + ''' AND NR_DEVOLUCAO = ''' + datm_recebimento_ag.qry_devolucao_.FieldByName('NR_DEVOLUCAO').AsString + '''');
    ExecSQL;
    Free;
    datm_recebimento_ag.qry_devolucao_.Close;
    datm_recebimento_ag.qry_devolucao_.Prepare;
    datm_recebimento_ag.qry_devolucao_.Open;
    BoxMensagem('Solicitação de Pagamento criada com sucesso.',3);
  end;
end;

procedure Tfrm_recebimento_ag.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    btn_sairClick(nil);
end;

procedure Tfrm_recebimento_ag.FinalizarRecebimento1Click(Sender: TObject);
var
  vNrRecebimento : string;
begin
  if BoxMensagem('Deseja realmente transformar este recebimento como Baixado ?', 1) then
  begin
    vNrRecebimento := datm_recebimento_ag.qry_list_receb_.FieldByName('NR_RECEBIMENTO').AsString;
    with TQuery.Create(Self) do
    begin
      DatabaseName := 'DBBROKER';
      Sql.Clear;
      Sql.Add('UPDATE TRECEBIMENTO_PROCESSO ');
      Sql.Add('SET');
      Sql.Add('   CD_STATUS = ''B'''); //status BAIXADO
      Sql.Add('WHERE');
      Sql.Add('   NR_RECEBIMENTO =:NR_RECEBIMENTO AND');
      Sql.Add('   CD_CLIENTE     =:CD_CLIENTE     AND');
      Sql.Add('   CD_UNID_NEG    =:CD_UNID_NEG');
      ParamByName('NR_RECEBIMENTO').AsString := datm_recebimento_ag.qry_list_receb_.FieldByName('NR_RECEBIMENTO').AsString;
      ParamByName('CD_CLIENTE').AsString     := datm_recebimento_ag.qry_list_receb_.FieldByName('CD_CLIENTE').AsString;
      ParamByName('CD_UNID_NEG').AsString    := datm_recebimento_ag.qry_list_receb_.FieldByName('CD_UNID_NEG').AsString;
      ExecSql;

      Sql.Clear;
      Sql.Add('UPDATE TRECEBIMENTO_AG ');
      Sql.Add('SET');
      Sql.Add('   IN_ABERTO = ''B''');  //status BAIXADO
      Sql.Add('WHERE');
      Sql.Add('   NR_RECEBIMENTO =:NR_RECEBIMENTO AND');
      Sql.Add('   CD_CLIENTE     =:CD_CLIENTE     AND');
      Sql.Add('   CD_UNID_NEG    =:CD_UNID_NEG');
      ParamByName('NR_RECEBIMENTO').AsString := datm_recebimento_ag.qry_list_receb_.FieldByName('NR_RECEBIMENTO').AsString;
      ParamByName('CD_CLIENTE').AsString     := datm_recebimento_ag.qry_list_receb_.FieldByName('CD_CLIENTE').AsString;
      ParamByName('CD_UNID_NEG').AsString    := datm_recebimento_ag.qry_list_receb_.FieldByName('CD_UNID_NEG').AsString;
      ExecSql;

      rdgrp_tp_status.ItemIndex := 4;        //Todos
      ExecutaConsulta;
      datm_recebimento_ag.qry_list_receb_.Locate('NR_RECEBIMENTO', vNrRecebimento, []);
      Free;
    end;
  end;
end;

end.


