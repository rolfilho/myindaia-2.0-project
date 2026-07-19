unit uConciliacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, StdCtrls, Buttons, ExtCtrls, Mask, Grids,
  DBGrids, ToolEdit, DBTables, DBCtrls, FileText, Funcoes, ConsOnLineEx, DB,
  RXDBCtrl;

type
  Tfrm_conciliacao = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_conciliar: TSpeedButton;
    MainMenu1: TMainMenu;
    mi_conciliar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    mi_le: TMenuItem;
    open_file: TOpenDialog;
    btn_le: TSpeedButton;
    btn_lanc: TSpeedButton;
    mi_lanc: TMenuItem;
    btn_saltar: TSpeedButton;
    btn_conciliar_txt: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_buscar: TSpeedButton;
    btn_compor: TSpeedButton;
    mi_saltar: TMenuItem;
    mi_conciliar_txt: TMenuItem;
    mi_salvar: TMenuItem;
    btn_retorna: TSpeedButton;
    mi_retorna: TMenuItem;
    mi_compor: TMenuItem;
    ntb_conc: TNotebook;
    Panel1: TPanel;
    Shape2: TShape;
    Label19: TLabel;
    btn_co_banco: TSpeedButton;
    Label31: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label33: TLabel;
    btn_co_unidade: TSpeedButton;
    Label34: TLabel;
    edit_nm_banco: TEdit;
    rdgp_tp_pesquisa: TRadioGroup;
    msk_cd_banco: TMaskEdit;
    msk_valor: TMaskEdit;
    msk_n_docto: TMaskEdit;
    msk_dt_inicio: TDateEdit;
    msk_dt_fim: TDateEdit;
    msk_cd_unidade: TMaskEdit;
    edit_nm_unidade: TEdit;
    Panel2: TPanel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    msk_conciliado: TMaskEdit;
    msk_nao_conciliado: TMaskEdit;
    msk_total: TMaskEdit;
    pgctrl_lancamentos: TPageControl;
    TabSheet1: TTabSheet;
    dbgrid_pes_recebimento: TDBGrid;
    pnl_hint: TPanel;
    shp_hint: TShape;
    lbl_emitidos: TLabel;
    btn_encolhe: TSpeedButton;
    lbl_hint: TLabel;
    pnl_dt_conciliacao: TPanel;
    Label37: TLabel;
    btn_ok: TSpeedButton;
    btn_sair_dt: TSpeedButton;
    msk_dt_conciliacao: TMaskEdit;
    ts_dados_basicos: TTabSheet;
    Label113: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label32: TLabel;
    dbedt_banco: TDBEdit;
    dbedt_dt_movimento: TDBEdit;
    dbedt_lancamento: TDBEdit;
    dbm_historico: TDBMemo;
    dbedt_vl_lancamento: TDBEdit;
    dbedt_cheque: TDBEdit;
    dbedt_favorecido: TDBEdit;
    dbedt_item: TDBEdit;
    edt_nm_favorecido: TEdit;
    edt_nm_banco: TEdit;
    edt_nm_item: TEdit;
    dbedt_processo: TDBEdit;
    Panel5: TPanel;
    Shape3: TShape;
    Shape1: TShape;
    Label35: TLabel;
    Label36: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    edit_nm_banco_c: TEdit;
    rdgp_pag_c: TRadioGroup;
    msk_cd_banco_c: TMaskEdit;
    msk_nr_docto: TMaskEdit;
    dt_inicial_c: TDateEdit;
    dt_final_c: TDateEdit;
    msk_cd_unidade_c: TMaskEdit;
    edit_nm_unidade_c: TEdit;
    Panel3: TPanel;
    Shape4: TShape;
    lbl_banco: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    dbedt_dt_lanc: TDBEdit;
    dbedt_docto: TDBEdit;
    dbedt_vl_lan: TDBEdit;
    dbedt_historico: TDBEdit;
    dbedt_tp_natur: TDBEdit;
    Panel4: TPanel;
    Shape5: TShape;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    dbedt_dt_lancamento: TDBEdit;
    dbedt_nr_docto: TDBEdit;
    dbedt_vl_lanc: TDBEdit;
    dbedt_natur: TDBEdit;
    dbedt_hist: TDBEdit;
    dbgrd_caixa: TDBGrid;
    ed_valor_lancamentos: TEdit;
    pnl_aviso: TPanel;
    Label17: TLabel;
    dbedt_nr_processo: TDBEdit;
    rdgp_pag: TRadioGroup;
    msk_dt_conciliacao_pe: TDateEdit;
    ed_conta: TEdit;
    Label38: TLabel;
    Label42: TLabel;
    ed_obs: TEdit;
    dbedt_cta_partida: TDBEdit;
    Label43: TLabel;
    edt_nm_cta_partida: TEdit;
    dbrdgrp_forma_pagto_contabil: TDBRadioGroup;
    dbrdgrp_natureza: TDBRadioGroup;
    Label10: TLabel;
    dbedt_vl_ir_contabil: TDBEdit;
    Label44: TLabel;
    dbedt_vl_inss: TDBEdit;
    Label45: TLabel;
    dbedt_vl_pis_cofins: TDBEdit;
    Label46: TLabel;
    dbedt_vl_iss: TDBEdit;
    lbl_contabiliza: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    dbedt_contabiliza: TDBEdit;
    dbedt_conciliacao: TDBEdit;
    dbedt_dt_conciliacao: TDBEdit;
    ed_nm_conta: TEdit;
    btn_conta: TSpeedButton;
    btn_retornar: TSpeedButton;
    mi_retornar: TMenuItem;
    mi_ignorar: TMenuItem;
    edt_dt_lanc: TEdit;
    edt_docto: TEdit;
    edt_vl_lan: TEdit;
    edt_tp_natur: TEdit;
    edt_historico: TEdit;
    edt_dt_lancamento: TEdit;
    edt_nr_docto: TEdit;
    edt_vl_lanc: TEdit;
    edt_natur: TEdit;
    edt_hist: TEdit;
    edt_nr_processo: TEdit;
    ed_custo: TEdit;
    Label15: TLabel;
    ed_nm_custo: TEdit;
    btn_custo: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_encolheClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_conciliarClick(Sender: TObject);
    procedure rdgp_tp_pesquisaClick(Sender: TObject);
    procedure dbgrid_pes_recebimentoDblClick(Sender: TObject);
    function  TrazRegistros : Boolean;
    procedure btn_co_bancoClick(Sender: TObject);
    procedure msk_cd_bancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_bancoExit(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure msk_cd_bancoChange(Sender: TObject);
    procedure msk_dt_inicioExit(Sender: TObject);
    procedure msk_dt_fimExit(Sender: TObject);
    procedure pgctrl_lancamentosChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_leClick(Sender: TObject);
    procedure btn_buscar1Click(Sender: TObject);
    procedure btn_lancClick(Sender: TObject);
    procedure msk_cd_unidadeChange(Sender: TObject);
    procedure msk_cd_unidadeExit(Sender: TObject);
    procedure btn_co_unidadeClick(Sender: TObject);
    procedure btn_saltarClick(Sender: TObject);
    procedure btn_conciliar_txtClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_buscarClick(Sender: TObject);
    procedure btn_retornaClick(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure btn_sair_dtClick(Sender: TObject);
    procedure rdgp_pag_cClick(Sender: TObject);
    procedure msk_nr_doctoExit(Sender: TObject);
    procedure rdgp_pagClick(Sender: TObject);
    procedure msk_n_doctoExit(Sender: TObject);
    procedure msk_valorExit(Sender: TObject);
    procedure msk_dt_conciliacao_peExit(Sender: TObject);
    procedure dt_inicial_cExit(Sender: TObject);
    procedure dt_final_cExit(Sender: TObject);
    procedure ed_contaExit(Sender: TObject);
    procedure btn_contaClick(Sender: TObject);
    procedure btn_retornarClick(Sender: TObject);
    procedure mi_ignorarClick(Sender: TObject);
    procedure btn_custoClick(Sender: TObject);
    procedure ed_custoExit(Sender: TObject);
  private
    nr_lancamento, lancamentos, arquivo_concil, tp_pag, dt_inicio_txt, dt_fim_txt, vEnt : String;
    dt_inicial, dt_final, dt_darf : TDateTime;
    function LerLinha( nInicio : Integer; nTamanho : Integer; cTipo : String ) : String;
    procedure mostra_btn( v:Boolean);
    procedure pnl_extrato( b:Boolean);
    procedure LeArquivo;
    procedure ListaLanc;
    procedure ListaCaixa;
  public
    Arquivo : TFileText;
    vTotal : Double;
  end;

var
  frm_conciliacao: Tfrm_conciliacao;

implementation

uses GSMLIB, PGGP001, PGGP017, dConciliacao;


{$R *.dfm}

procedure Tfrm_conciliacao.FormCreate(Sender: TObject);
begin
  msk_dt_inicio.Text         := FormatDateTime('dd/mm/yyyy', dt_server);
  msk_dt_fim.Text            := FormatDateTime('dd/mm/yyyy', dt_server);

  // Cria o DataModule de Dados do módulo Conciliação
  Application.CreateForm( Tdatm_conciliacao, datm_conciliacao );
end;


procedure Tfrm_conciliacao.btn_sairClick(Sender: TObject);
begin
  Close;
end;


procedure Tfrm_conciliacao.btn_encolheClick(Sender: TObject);
begin
  if pnl_hint.Width = 400 then
  begin
    btn_encolhe.Left     := 0;
    btn_encolhe.Caption  := '>>';
    pnl_hint.Width       := 20;
    shp_hint.Visible     := False;
    lbl_hint.Visible     := False;
    lbl_emitidos.Visible := False;
  end
  else
  begin
    btn_encolhe.Left     := 377;
    btn_encolhe.Caption  := '<<';
    pnl_hint.Width       := 400;
    shp_hint.Visible     := True;
    lbl_hint.Visible     := True;
    lbl_emitidos.Visible := True;
  end;
end;


procedure Tfrm_conciliacao.FormShow(Sender: TObject);
begin
  // Unidade padrão do usuário
  msk_cd_unidade.Text := str_cd_unid_neg;
  edit_nm_unidade.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unidade.Text,'AP_UNID_NEG');

  // Inicia variáveis
  msk_valor.Text := '0';
  tp_pag := '';
  vEnt := '';
  dt_inicio_txt := '01/01/1990';
  dt_fim_txt := '01/01/2200';

  // Seleciona o banco padrão da Unidade padrão do usuário
  datm_conciliacao.qry_banco_padrao_.Close;
  datm_conciliacao.qry_banco_padrao_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
  datm_conciliacao.qry_banco_padrao_.Prepare;
  datm_conciliacao.qry_banco_padrao_.Open;

  if Not datm_conciliacao.qry_banco_padrao_.EOF then
    msk_cd_banco.text := datm_conciliacao.qry_banco_padrao_CD_BANCO_CONCILIACAO.AsString;

  ntb_conc.ActivePage := 'conc_manual';
  // Traz lançamentos não conciliados - Padrão quando abre a tela
  lancamentos := '0';
  nr_lancamento := '0007';
  edit_nm_banco.Text := ConsultaLookUP('TBANCO','CD_BANCO', msk_cd_banco.Text,'NM_BANCO');

  TrazRegistros;
end;


procedure Tfrm_conciliacao.btn_conciliarClick(Sender: TObject);
begin
  pnl_dt_conciliacao.Visible := True;
  msk_dt_conciliacao.Text := '  /  /    ';
  msk_dt_conciliacao.SetFocus;
end;


function Tfrm_conciliacao.TrazRegistros : Boolean;
var
  conc, nao_conc : Double;
begin
  TrazRegistros := True;

  if msk_cd_unidade.Text = '' then
  begin
    BoxMensagem( 'Código da Unidade deve ser preenchido',2 );
    TrazRegistros := False;
    msk_cd_unidade.SetFocus;
    Exit;
  end;

  if msk_cd_banco.Text = '' then
  begin
    BoxMensagem( 'Código do Banco deve ser preenchido',2 );
    TrazRegistros := False;
    msk_cd_banco.SetFocus;
    Exit;
  end;

  try
    msk_dt_inicio.Text := DateToStr( StrToDate( msk_dt_inicio.Text ) );
  except
    BoxMensagem( 'Data Inicial Inválida',2 );
    TrazRegistros := False;
    msk_dt_inicio.SetFocus;
    Exit;
  end;

  try
    msk_dt_fim.Text := DateToStr( StrToDate( msk_dt_fim.Text ) );
  except
    BoxMensagem( 'Data Final Inválida',2 );
    TrazRegistros := False;
    msk_dt_fim.SetFocus;
    Exit;
  end;

  with datm_conciliacao do
  begin
    qry_caixa_.Close;
    qry_caixa_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unidade.Text;
    qry_caixa_.ParamByName('CD_BANCO').AsString := msk_cd_banco.Text;
    qry_caixa_.ParamByName('DT_INICIO').AsString := msk_dt_inicio.Text;
    qry_caixa_.ParamByName('DT_FIM').AsString := msk_dt_fim.Text;
    qry_caixa_.ParamByName('IN_CONCILIACAO').AsString := lancamentos;
    qry_caixa_.ParamByName('NR_CHEQUE').AsString := msk_n_docto.Text;
    qry_caixa_.ParamByName('DT_CONCILIACAO').AsString := msk_dt_conciliacao_pe.Text;
    qry_caixa_.ParamByName('VL_LANCAMENTO').AsFloat := StrToFloat( msk_valor.Text );
    qry_caixa_.ParamByName('TP_PAGAMENTO').AsString := tp_pag;
    qry_caixa_.Prepare;
    qry_caixa_.Open;

    if qry_caixa_.RecordCount > 0 then
    begin
      TrazRegistros := True;
      btn_conciliar.Enabled := True;
      btn_cancelar.Enabled := True;
      mi_conciliar.Enabled := True;
      mi_cancelar.Enabled := True;
    end
    else
    begin
      btn_conciliar.Enabled := False;
      btn_cancelar.Enabled := False;
      mi_conciliar.Enabled := False;
      mi_cancelar.Enabled := False;
    end;

    if lancamentos <> '0' then
    begin
      qry_conciliado_.Close;
      qry_conciliado_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unidade.Text;
      qry_conciliado_.ParamByName('CD_BANCO').AsString := msk_cd_banco.Text;
      qry_conciliado_.ParamByName('DT_INICIO').AsString := msk_dt_inicio.Text;
      qry_conciliado_.ParamByName('DT_FIM').AsString := msk_dt_fim.Text;
      qry_conciliado_.Prepare;
      qry_conciliado_.Open;
      conc := qry_conciliado_.FieldByName('CONCILIADO').AsFloat;
      msk_conciliado.Text := FormatFloat( '###,###,##0.00', qry_conciliado_.FieldByName('CONCILIADO').AsFloat );
    end
    else
    begin
      conc := 0;
      msk_conciliado.Text := FormatFloat( '###,###,##0.00', conc );
    end;

    if lancamentos <> '2' then
    begin
      qry_nao_conciliado_.Close;
      qry_nao_conciliado_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unidade.Text;
      qry_nao_conciliado_.ParamByName('CD_BANCO').AsString := msk_cd_banco.Text;
      qry_nao_conciliado_.ParamByName('DT_INICIO').AsString := msk_dt_inicio.Text;
      qry_nao_conciliado_.ParamByName('DT_FIM').AsString := msk_dt_fim.Text;
      qry_nao_conciliado_.Prepare;
      qry_nao_conciliado_.Open;
      nao_conc := qry_nao_conciliado_.FieldByName('CONCILIADO').AsFloat;
      msk_nao_conciliado.Text := FormatFloat( '###,###,##0.00', qry_nao_conciliado_.FieldByName('CONCILIADO').AsFloat ) ;
    end
    else
    begin
      nao_conc := 0;
      msk_nao_conciliado.Text := FormatFloat( '###,###,##0.00', nao_conc ) ;
    end;

    msk_total.Text :=FormatFloat( '###,###,##0.00', ( conc + nao_conc ) );
  end;
end;


procedure Tfrm_conciliacao.rdgp_tp_pesquisaClick(Sender: TObject);
begin
  if rdgp_tp_pesquisa.ItemIndex = 0 then
    lancamentos := '0'
  else if rdgp_tp_pesquisa.ItemIndex = 1 then
    lancamentos := '2'
  else if rdgp_tp_pesquisa.ItemIndex = 2 then
    lancamentos := '3';

  TrazRegistros;
end;


procedure Tfrm_conciliacao.dbgrid_pes_recebimentoDblClick(Sender: TObject);
var
   status, lancamento, cheque : String;
begin
  with TQuery.Create(application) do
  begin
    if ( datm_conciliacao.qry_caixa_.FieldByName('IN_CONCILIACAO').AsString = '1' ) then
    begin
      if ( datm_conciliacao.qry_caixa_.FieldByName('DT_CONCILIACAO').AsDateTime = 0 ) then
        status := '0'
      else
        status := '2'
    end
    else
      status := '1';

    cheque := '';
    lancamento := '';
    DatabaseName := 'DBBROKER';
    SQL.CLear;
    if length( trim( datm_conciliacao.qry_caixa_.FieldByName('NR_CHEQUE').AsString ) ) <> 0 then
      SQL.Add('UPDATE TCAIXA SET IN_CONCILIACAO = ''' + status + ''' WHERE CD_COLIGADA = ''01'' AND DT_MOVIMENTO = :DT_MOVIMENTO  AND NR_CHEQUE = ''' +  datm_conciliacao.qry_caixa_.FieldByName('NR_CHEQUE').AsString + '''')
    else
      SQL.Add('UPDATE TCAIXA SET IN_CONCILIACAO = ''' + status + ''' WHERE CD_COLIGADA = ''01'' AND DT_MOVIMENTO = :DT_MOVIMENTO  AND NR_LANCAMENTO = ''' +  datm_conciliacao.qry_caixa_.FieldByName('NR_LANCAMENTO').AsString + '''');
    ParamByName('DT_MOVIMENTO').AsDateTime := datm_conciliacao.qry_caixa_.FieldByName('DT_MOVIMENTO').AsDateTime;
    ExecSQL;
    Free;
  end;

  if length( trim( datm_conciliacao.qry_caixa_.FieldByName('NR_CHEQUE').AsString ) ) <> 0 then
    cheque := datm_conciliacao.qry_caixa_.FieldByName('NR_CHEQUE').AsString
  else
    lancamento := datm_conciliacao.qry_caixa_.FieldByName('NR_LANCAMENTO').AsString;

  TrazRegistros;

  if cheque <> '' then
    datm_conciliacao.qry_caixa_.Locate( 'NR_CHEQUE', cheque, [] )
  else
    datm_conciliacao.qry_caixa_.Locate( 'NR_LANCAMENTO', lancamento, [] );
end;


procedure Tfrm_conciliacao.btn_co_bancoClick(Sender: TObject);
begin
  if Sender Is TSpeedButton then
  begin
    msk_cd_banco.Text := ConsultaOnLineEx('TBANCO','Banco',['CD_BANCO','NM_BANCO'],['Código','Descrição'],'CD_BANCO',nil);
    edit_nm_banco.Text := ConsultaLookUP('TBANCO','CD_BANCO', msk_cd_banco.Text,'NM_BANCO');
    TrazRegistros;
  end;
end;


procedure Tfrm_conciliacao.msk_cd_bancoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_cd_banco   then btn_co_bancoClick(btn_co_banco);
    if Sender = msk_cd_unidade then btn_co_unidadeClick(btn_co_unidade);
  end;
end;


procedure Tfrm_conciliacao.msk_cd_bancoExit(Sender: TObject);
begin
  if ( edit_nm_banco.Text = '' ) and ( msk_cd_banco.Text <> '' ) then
    edit_nm_banco.Text := ConsultaLookUP('TBANCO','CD_BANCO', msk_cd_banco.Text,'NM_BANCO');

  TrazRegistros;
end;


procedure Tfrm_conciliacao.btn_cancelarClick(Sender: TObject);
begin
  // Cancela lançamentos conciliados da TCAIXA  - Grava DT_CONCILIACAO = NULL e IN_CONCILIACAO = '0'
  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('UPDATE TCONCILIACAO SET IN_CONCILIADO = ''0''');
    SQL.Add(' WHERE NR_SEQ IN ( SELECT NR_SEQ_CONCILIACAO FROM TCAIXA WHERE CD_COLIGADA = ''01'' AND IN_CONCILIACAO = ''1'') ');
    ExecSQL;

    SQL.Clear;
    SQL.Add('UPDATE TCAIXA SET DT_CONCILIACAO = NULL, IN_CONCILIACAO = ''0''');
    SQL.Add(', CD_USUARIO_CONCILIACAO = NULL, IN_CONCILIACAO_AUTOM = ''0''');
    SQL.Add(', NR_SEQ_CONCILIACAO = ''0''');
    SQL.Add(' WHERE CD_COLIGADA = ''01'' AND IN_CONCILIACAO = ''1''');
    ExecSQL;

    Free;
  end;

  TrazRegistros;

  BoxMensagem('Lançamento(s) cancelado(s) !', 2) ;
end;


procedure Tfrm_conciliacao.msk_cd_bancoChange(Sender: TObject);
begin
  if ( msk_cd_banco.Text = '' ) or ( length( msk_cd_banco.Text ) < 2 ) then
    edit_nm_banco.Text := '';
end;


procedure Tfrm_conciliacao.msk_dt_inicioExit(Sender: TObject);
begin
  TrazRegistros;
end;


procedure Tfrm_conciliacao.msk_dt_fimExit(Sender: TObject);
begin
  TrazRegistros;
end;


procedure Tfrm_conciliacao.pgctrl_lancamentosChange(Sender: TObject);
begin
  if ( pgctrl_lancamentos.ActivePage = ts_dados_basicos ) then
  begin
    edt_nm_banco.Text := ConsultaLookUP('TBANCO','CD_BANCO', dbedt_banco.Text,'NM_BANCO');
    edt_nm_favorecido.Text := ConsultaLookUP('TFAVORECIDO','CD_FAVORECIDO', dbedt_favorecido.Text,'NM_FAVORECIDO');
    edt_nm_item.Text := ConsultaLookUP('TITEM','CD_ITEM', dbedt_item.Text,'NM_ITEM');
    edt_nm_cta_partida.Text := ConsultaLookUP('TCT_CONTABIL','CD_CT_CONTABIL', dbedt_cta_partida.Text,'NM_CT_CONTABIL');
  end;
end;


procedure Tfrm_conciliacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_conciliacao do
  begin
    qry_caixa_.Close;
    qry_conciliado_.Close;
    qry_nao_conciliado_.Close;
    Free;
  end;
  Action := caFree;
end;


procedure Tfrm_conciliacao.btn_leClick(Sender: TObject);
begin
  vEnt := '1';
  if open_file.Execute then
  begin
    arquivo_concil := open_file.FileName;
    LeArquivo;
  end;
end;


procedure Tfrm_conciliacao.LeArquivo;     // Lê arquivo .TXT do banco
var NovoNome : String;
    cInicio, cTipo, cNatureza, cArq : String[1];
    qry_conc : TQuery;
    vIdent : Integer;
    dt_arquivo : TDateTime;
begin
  // Verifica se está tudo correto com o arquivo
  if not FileExists(arquivo_concil) then
  begin
    BoxMensagem ('O arquivo não está disponível. Tente novamente.', 2 );
    Exit;
  end
  else
  begin
    Arquivo := TFileText.Create;
    Arquivo.Name := arquivo_concil;
  end;
  Arquivo.Open;

  try
    // Verifica número do identificador
    qry_conc := TQuery.Create(nil);
    with qry_conc do
    begin
      Close;
      DataBaseName := 'DBBroker';
      RequestLive := False;
      Sql.Clear;
      Sql.Add('SELECT ISNULL( MAX( NR_IDENTIFICADOR) + 1, 1 ) AS IDENT FROM TCONCILIACAO ');
      Prepare;
      Open;
      vIdent := qry_conc.FieldByName('IDENT').AsInteger;
      Close;
    end;

    with datm_conciliacao do
    begin
      qry_conc_.Close;
      qry_conc_.Open;
      dt_inicial := 0;
      cArq := '0';
      dt_final := 40000;

      while not ( Arquivo.EOF ) do
      begin
        Arquivo.Read(202);

        cInicio := LerLinha( 001, 001, 'C' );
        cTipo := LerLinha( 042, 001, 'C' );
        cNatureza := LerLinha( 105, 001, 'C' );

        if ( cInicio = '1' ) and ( cTipo = '1' ) and ( cNatureza = 'D' ) then
        begin
          if cArq = '0' then
          begin
            with TQuery.Create(Application) do
            begin
              DataBaseName := 'DBBROKER';
              Sql.Clear;
              Sql.Add('SELECT * FROM TCONCILIACAO ');
              Sql.Add('WHERE DT_LANCAMENTO = :DT_LANCAMENTO');
              ParamByName('DT_LANCAMENTO').AsDateTime := StrToDate( LerLinha( 081, 002, 'C' ) + '/'+ LerLinha( 083, 002, 'C' ) + '/20' + LerLinha( 085, 002, 'C' ) );
              Prepare;
              Open;
              if RecordCount = 0 then
                cArq := '1'
              else
              begin
                Free;
                Break;
              end;
            end;
          end;
          if cArq = '1' then
          begin
            // Quando já existir o registro não gravar
            dt_arquivo := StrToDate( LerLinha( 081, 002, 'C' ) + '/'+ LerLinha( 083, 002, 'C' ) + '/20' + LerLinha( 085, 002, 'C' ) );
            qry_le_arq_txt_.Close;
            qry_le_arq_txt_.ParamByName('DT_LANCAMENTO').AsDateTime := StrToDate( LerLinha( 081, 002, 'C' ) + '/'+ LerLinha( 083, 002, 'C' ) + '/20' + LerLinha( 085, 002, 'C' ) );
            qry_le_arq_txt_.ParamByName('VL_LANCAMENTO').AsFloat := StrToFloat( LerLinha( 087, 018, 'V' ) );
            qry_le_arq_txt_.ParamByName('NR_DOCUMENTO').AsString := LerLinha( 075, 006, 'C' );
            qry_le_arq_txt_.Prepare;
            qry_le_arq_txt_.Open;
            if qry_le_arq_txt_.RecordCount = 0 then
            begin
              qry_conc_.Insert;
              qry_conc_NR_IDENTIFICADOR.AsInteger := vIdent;
              qry_conc_NM_CATEGORIA.AsInteger   := StrToInt( LerLinha( 043, 003, 'N' ) );
              qry_conc_NR_LANCAMENTO.AsString   := LerLinha( 046, 004, 'C' );
              qry_conc_NM_HISTORICO.AsString    := LerLinha( 050, 025, 'C' );
              qry_conc_NR_DOCUMENTO.AsString    := LerLinha( 075, 006, 'C' );
              qry_conc_DT_LANCAMENTO.AsDateTime := StrToDate( LerLinha( 081, 002, 'C' ) + '/'+ LerLinha( 083, 002, 'C' ) + '/20' + LerLinha( 085, 002, 'C' ) );

              if dt_inicial < StrToDate( LerLinha( 081, 002, 'C' ) + '/'+ LerLinha( 083, 002, 'C' ) + '/20' + LerLinha( 085, 002, 'C' ) ) then
                dt_inicial := StrToDate( LerLinha( 081, 002, 'C' ) + '/'+ LerLinha( 083, 002, 'C' ) + '/20' + LerLinha( 085, 002, 'C' ) );

              if dt_final > StrToDate( LerLinha( 081, 002, 'C' ) + '/'+ LerLinha( 083, 002, 'C' ) + '/20' + LerLinha( 085, 002, 'C' ) ) then
                dt_final := StrToDate( LerLinha( 081, 002, 'C' ) + '/'+ LerLinha( 083, 002, 'C' ) + '/20' + LerLinha( 085, 002, 'C' ) );

              qry_conc_VL_LANCAMENTO.AsFloat    := StrToFloat( LerLinha( 087, 018, 'V' ) );
              qry_conc_TP_NATUREZA.AsString     := LerLinha( 105, 001, 'C' );
              if LerLinha( 106, 001, 'C' ) = '*' then
                qry_conc_IN_CPMF.AsString       := 'S'
              else
                qry_conc_IN_CPMF.AsString       := 'N';
              qry_conc_IN_CONCILIADO.AsString   := '0';
              qry_conc_CD_UNID_NEG.AsString     := msk_cd_unidade.Text;
              qry_conc_CD_BANCO.AsString        := msk_cd_banco.Text;

              qry_conc_.Post;
            end;
          end;

        end;
      end;
      Application.ProcessMessages;

    end;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  Arquivo.Close;
  Arquivo.Free;

  if cArq = '1' then
  begin
    NovoNome := Copy( arquivo_concil, 1, Length( arquivo_concil ) - 4 ) + '_' + Copy( DateToStr( dt_arquivo ), 1, 2 ) + Copy( DateToStr( dt_arquivo ), 4, 2 ) + Copy( DateToStr( dt_arquivo ), 9, 2 ) + '.txt';
    RenameFile( arquivo_concil, NovoNome );

    with datm_conciliacao do
    begin
      CloseStoredProc(sp_concilia);
      sp_concilia.ParamByName('@CD_UNID_NEG').AsString := msk_cd_unidade.Text;
      sp_concilia.ParamByName('@CD_BANCO').AsString := msk_cd_banco.Text;
      sp_concilia.ParamByName('@CD_USUARIO').AsString := str_cd_usuario;
      sp_concilia.ParamByName('@DT_CONCILIACAO').AsDateTime := date();
      sp_concilia.ParamByName('@DT_ARQUIVO').AsDateTime := dt_arquivo;
      ExecStoredProc(sp_concilia);
    end;
  end;

  ListaLanc;
end;


function Tfrm_conciliacao.LerLinha( nInicio : Integer; nTamanho : Integer; cTipo : String ) : String;
var
   cTexto : String;
   i : Integer;
begin
   cTexto := '';
   nInicio := nInicio - 1;

   for i := nInicio to nTamanho+nInicio-1 do
   begin
     cTexto := cTexto + Arquivo.Buffer[i];
   end;

   if cTipo = 'D' then
   begin
     if alltrim(cTexto) <> '' then
     begin
       cTexto := FormatDateTime('YYYYMMDD',Strtodate(cTexto));
     end;
   end
   else if cTipo = 'N' then
   begin
     if alltrim(cTexto) <> '' then
     begin
       for i := 0 to length(cTexto ) do
       begin
         if ( cTexto[i] = ',' ) then
         begin
           cTexto[i] := ' ';
         end
         else
         begin
           cTexto[i] := cTexto[i];
         end;
       end;
       cTexto := alltrim(cTexto);
     end;
   end
   else if cTipo = 'V' then
   begin
     if alltrim(cTexto) <> '' then
     begin
       for i := 0 to length(cTexto ) do
       begin
         if ( cTexto[i] = '.' ) then
         begin
           cTexto[i] := ',' ;
         end
         else if (cTexto[i] = ',') then
         begin
           cTexto[i] := '.';
         end
         else
         if (cTexto[i] = 'R') or (cTexto[i] = '$') then
         begin
           cTexto[i] := ' ' ;
         end
         else
         begin
           cTexto[i] := cTexto[i];
         end;
       end;
       cTexto := alltrim(cTexto);
     end;
   end;
   if cTipo = 'V' then
   begin
     if Trim( cTexto ) = '' then
       cTexto := '0'
     else
       cTexto := Copy( cTexto, 1, length( cTexto ) - 2 ) + ',' + Copy( cTexto, length( cTexto ) - 1, 2 );
   end;

   LerLinha := cTexto ;
end;


procedure Tfrm_conciliacao.ListaLanc;
begin
  with datm_conciliacao do
  begin
    if nr_lancamento = '0007' then    // CHEQUE
    begin
      qry_conc_lanc_.Close;
      qry_conc_lanc_.SQL.Clear;
      qry_conc_lanc_.SQL.Add('SELECT * FROM TCONCILIACAO (NOLOCK) WHERE IN_CONCILIADO = ''0'' ');
      qry_conc_lanc_.SQL.Add(' AND CD_UNID_NEG = :CD_UNID_NEG AND CD_BANCO = :CD_BANCO ');
      qry_conc_lanc_.SQL.Add(' AND DT_LANCAMENTO BETWEEN CONVERT(DATETIME, :DT_INICIO_TXT ,103) AND CONVERT(DATETIME, :DT_FIM_TXT ,103) ');
      qry_conc_lanc_.SQL.Add(' AND ( ( NR_DOCUMENTO = :NR_DOCUMENTO ) OR ( '''' = :NR_DOCUMENTO ) ) ');
      qry_conc_lanc_.SQL.Add(' AND ( SUBSTRING(NM_HISTORICO, 1, 2 ) = ''CH'' )');
      qry_conc_lanc_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unidade.Text;
      qry_conc_lanc_.ParamByName('CD_BANCO').AsString := msk_cd_banco.Text;
      qry_conc_lanc_.ParamByName('DT_INICIO_TXT').AsString := dt_inicio_txt;
      qry_conc_lanc_.ParamByName('DT_FIM_TXT').AsString := dt_fim_txt;
      qry_conc_lanc_.ParamByName('NR_DOCUMENTO').AsString := msk_nr_docto.Text;
      qry_conc_lanc_.Prepare;
      qry_conc_lanc_.Open;
    end
    else
    begin
      if nr_lancamento = '0031' then     // DARF / DOC
      begin
        qry_conc_lanc_.Close;
        qry_conc_lanc_.SQL.Clear;
        qry_conc_lanc_.SQL.Add('SELECT * FROM TCONCILIACAO (NOLOCK) WHERE IN_CONCILIADO = ''0'' ');
        qry_conc_lanc_.SQL.Add(' AND CD_UNID_NEG = :CD_UNID_NEG AND CD_BANCO = :CD_BANCO ');
        qry_conc_lanc_.SQL.Add(' AND DT_LANCAMENTO BETWEEN CONVERT(DATETIME, :DT_INICIO_TXT ,103) AND CONVERT(DATETIME, :DT_FIM_TXT ,103) ');
        qry_conc_lanc_.SQL.Add(' AND ( ( NR_DOCUMENTO = :NR_DOCUMENTO ) OR ( '''' = :NR_DOCUMENTO ) ) ');
        qry_conc_lanc_.SQL.Add(' AND ( ( SUBSTRING(NM_HISTORICO, 1, 6 ) = ''DARF E'' ) OR ( SUBSTRING(NM_HISTORICO, 1, 12 ) = ''PAGSAFRA DOC'' ) )');
        qry_conc_lanc_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unidade.Text;
        qry_conc_lanc_.ParamByName('CD_BANCO').AsString := msk_cd_banco.Text;
        qry_conc_lanc_.ParamByName('DT_INICIO_TXT').AsString := dt_inicio_txt;
        qry_conc_lanc_.ParamByName('DT_FIM_TXT').AsString := dt_fim_txt;
        qry_conc_lanc_.ParamByName('NR_DOCUMENTO').AsString := msk_nr_docto.Text;
        qry_conc_lanc_.Prepare;
        qry_conc_lanc_.Open;
      end
      else
      begin
        if nr_lancamento = '0191' then     // TED
        begin
          qry_conc_lanc_.Close;
          qry_conc_lanc_.SQL.Clear;
          qry_conc_lanc_.SQL.Add('SELECT * FROM TCONCILIACAO (NOLOCK) WHERE IN_CONCILIADO = ''0'' ');
          qry_conc_lanc_.SQL.Add(' AND CD_UNID_NEG = :CD_UNID_NEG AND CD_BANCO = :CD_BANCO ');
          qry_conc_lanc_.SQL.Add(' AND DT_LANCAMENTO BETWEEN CONVERT(DATETIME, :DT_INICIO_TXT ,103) AND CONVERT(DATETIME, :DT_FIM_TXT ,103) ');
          qry_conc_lanc_.SQL.Add(' AND ( ( NR_DOCUMENTO = :NR_DOCUMENTO ) OR ( '''' = :NR_DOCUMENTO ) ) ');
          qry_conc_lanc_.SQL.Add(' AND ( ( SUBSTRING(NM_HISTORICO, 1, 8 ) = ''PAGSAFRA'' ) )');
          qry_conc_lanc_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unidade.Text;
          qry_conc_lanc_.ParamByName('CD_BANCO').AsString := msk_cd_banco.Text;
          qry_conc_lanc_.ParamByName('DT_INICIO_TXT').AsString := dt_inicio_txt;
          qry_conc_lanc_.ParamByName('DT_FIM_TXT').AsString := dt_fim_txt;
          qry_conc_lanc_.ParamByName('NR_DOCUMENTO').AsString := msk_nr_docto.Text;
          qry_conc_lanc_.Prepare;
          qry_conc_lanc_.Open;
        end
        else
        begin
          if nr_lancamento = '0359' then     // Taxas
          begin
            qry_conc_lanc_.Close;
            qry_conc_lanc_.SQL.Clear;
            qry_conc_lanc_.SQL.Add('SELECT * FROM TCONCILIACAO (NOLOCK) WHERE IN_CONCILIADO = ''0'' ');
            qry_conc_lanc_.SQL.Add(' AND CD_UNID_NEG = :CD_UNID_NEG AND CD_BANCO = :CD_BANCO ');
            qry_conc_lanc_.SQL.Add(' AND DT_LANCAMENTO BETWEEN CONVERT(DATETIME, :DT_INICIO_TXT ,103) AND CONVERT(DATETIME, :DT_FIM_TXT ,103) ');
            qry_conc_lanc_.SQL.Add(' AND ( ( NR_DOCUMENTO = :NR_DOCUMENTO ) OR ( '''' = :NR_DOCUMENTO ) ) ');
            qry_conc_lanc_.SQL.Add(' AND ( SUBSTRING(NM_HISTORICO, 1, 2 ) NOT IN ( ''PA'', ''CH'', ''DA'', ''CT'' ) )');
            qry_conc_lanc_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unidade.Text;
            qry_conc_lanc_.ParamByName('CD_BANCO').AsString := msk_cd_banco.Text;
            qry_conc_lanc_.ParamByName('DT_INICIO_TXT').AsString := dt_inicio_txt;
            qry_conc_lanc_.ParamByName('DT_FIM_TXT').AsString := dt_fim_txt;
            qry_conc_lanc_.ParamByName('NR_DOCUMENTO').AsString := msk_nr_docto.Text;
            qry_conc_lanc_.Prepare;
            qry_conc_lanc_.Open;
          end;
        end;
      end;
    end;

    if qry_conc_lanc_.IsEmpty then
    begin
      if vEnt = '1' then    // Verifica se todos foram conciliados - somente na abertura da tela
      begin
        if nr_lancamento = '0007' then
        begin
          nr_lancamento := '0031';
          rdgp_pag_c.ItemIndex := 1;
        end
        else if nr_lancamento = '0031' then
          begin
            nr_lancamento := '0191';
            rdgp_pag_c.ItemIndex := 2;
          end
        else if nr_lancamento = '0191' then
          begin
            nr_lancamento := '0359';
            rdgp_pag_c.ItemIndex := 3;
          end;
        ListaLanc;
      end
      else
      begin
        qry_conc_lanc_.Close;

        // Limpa painél - Panel4
        qry_caixa_docto_.Close;
        dbgrd_caixa.Visible := False;
        ed_valor_lancamentos.Visible := False;
        Label30.Visible := False;
        Exit;
      end;
    end
    else
    begin
      vEnt := '';
      // Em virtude de não aparecer nos dbedt da tela
      edt_dt_lanc.Text := DateToStr( qry_conc_lanc_.FieldByName('DT_LANCAMENTO').AsDateTime );
      edt_docto.Text := qry_conc_lanc_.FieldByName('NR_DOCUMENTO').AsString;
      edt_tp_natur.Text := qry_conc_lanc_.FieldByName('TP_NATUREZA').AsString;
      edt_historico.Text := qry_conc_lanc_.FieldByName('NM_HISTORICO').AsString;
      edt_vl_lan.Text := FloatToStr( qry_conc_lanc_.FieldByName('VL_LANCAMENTO').AsFloat );
    end;

    // Exibe painel para conciliar
    if ed_obs.Visible then
      ed_obs.Text := qry_conc_lanc_.FieldByName('NM_HISTORICO').AsString;

    qry_conc_lanc_.First;
    ntb_conc.ActivePage := 'conc_txt';
    mostra_btn( True );
    ListaCaixa;
  end;
end;


procedure Tfrm_conciliacao.ListaCaixa;
var
   vl_lanc, vl_lanc1, vl_lanc2 : Double;
begin
  with datm_conciliacao do
  begin
    if nr_lancamento = '0007' then    // CHEQUE
    begin
      // Procura lançamento do arquivo TXT na TCAIXA
      qry_caixa_docto_.Close;
      qry_caixa_docto_.Close;
      qry_caixa_docto_.RequestLive := False;
      qry_caixa_docto_.SQL.Clear;
      qry_caixa_docto_.SQL.Add('SELECT * FROM TCAIXA (NOLOCK) ');
      qry_caixa_docto_.SQL.Add('WHERE NR_CHEQUE = :NR_CHEQUE AND CD_UNID_NEG = :CD_UNID_NEG AND CD_BANCO = :CD_BANCO ');
      qry_caixa_docto_.SQL.Add(' AND IN_CANCELADO = ''0'' AND TP_PROCEDENCIA <> ''0'' AND TP_NATUREZA = ''D'' AND TP_PAGAMENTO = ''C'' AND IN_CONCILIACAO= ''0''');
      qry_caixa_docto_.SQL.Add(' AND VL_LANCAMENTO NOT IN ( SELECT VL_LANCAMENTO FROM TCAIXA (NOLOCK) ' );
      qry_caixa_docto_.SQL.Add(' WHERE NR_CHEQUE = :NR_CHEQUE AND CD_UNID_NEG = :CD_UNID_NEG AND CD_BANCO = :CD_BANCO ');
      qry_caixa_docto_.SQL.Add(' AND IN_CANCELADO = ''0'' AND TP_PROCEDENCIA <> ''0'' AND TP_NATUREZA = ''C'' AND TP_PAGAMENTO = ''C'' AND IN_CONCILIACAO= ''0'' )');
      qry_caixa_docto_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unidade.Text;
      qry_caixa_docto_.ParamByName('CD_BANCO').AsString := msk_cd_banco.Text;
      qry_caixa_docto_.ParamByName('NR_CHEQUE').AsString := qry_conc_lanc_.FieldByName('NR_DOCUMENTO').AsString;
      qry_caixa_docto_.Prepare;
      qry_caixa_docto_.Open;

      if qry_caixa_docto_.RecordCount > 1 then
      begin
        // Devido a mudança de dbedt para edt
        edt_dt_lancamento.Text := DateToStr( qry_caixa_docto_.FieldByName('DT_MOVIMENTO').AsDateTime );
        edt_nr_docto.Text := qry_caixa_docto_.FieldByName('NR_CHEQUE').AsString;
        edt_nr_processo.Text := qry_caixa_docto_.FieldByName('NR_PROCESSO').AsString;
        edt_vl_lanc.Text := FloatToStr( qry_caixa_docto_.FieldByName('VL_LANCAMENTO').AsFloat );
        edt_natur.Text := qry_caixa_docto_.FieldByName('TP_NATUREZA').AsString;
        edt_hist.Text := qry_caixa_docto_.FieldByName('NM_HISTORICO').AsString;

        dbgrd_caixa.Visible := True;
        ed_valor_lancamentos.Visible := True;
        Label30.Visible := True;

        vTotal := 0;
        qry_caixa_docto_.First;
        While not qry_caixa_docto_.EOF do
        begin
          vTotal := vTotal + qry_caixa_docto_.FieldByName('VL_LANCAMENTO').AsFloat;
          qry_caixa_docto_.Next;
        end;
        ed_valor_lancamentos.Text := FormatFloat( '#0,.00',vTotal );

        // Devido a mudança de dbedt para edt
        dbgrd_caixa.Visible := False;
        ed_valor_lancamentos.Visible := False;
        Label30.Visible := False;
        pnl_aviso.Visible := False;
      end
      else if qry_caixa_docto_.RecordCount = 1 then
      begin
        // Código abaixo existe em virtude de não aparecer valor nos dbedt da tela
        edt_dt_lancamento.Text := DateToStr( qry_caixa_docto_.FieldByName('DT_MOVIMENTO').AsDateTime );
        edt_nr_docto.Text := qry_caixa_docto_.FieldByName('NR_CHEQUE').AsString;
        edt_nr_processo.Text := qry_caixa_docto_.FieldByName('NR_PROCESSO').AsString;
        edt_vl_lanc.Text := FloatToStr( qry_caixa_docto_.FieldByName('VL_LANCAMENTO').AsFloat );
        edt_natur.Text := qry_caixa_docto_.FieldByName('TP_NATUREZA').AsString;
        edt_hist.Text := qry_caixa_docto_.FieldByName('NM_HISTORICO').AsString;

        dbgrd_caixa.Visible := False;
        ed_valor_lancamentos.Visible := False;
        Label30.Visible := False;
        pnl_aviso.Visible := False;
      end
      else
      begin
        pnl_aviso.Visible := True;
      end;
    end
    else if nr_lancamento = '0031' then     // DARF
    begin
      vl_lanc := qry_conc_lanc_.FieldByName('VL_LANCAMENTO').AsFloat;
      vl_lanc1 := vl_lanc - 0.02;
      vl_lanc2 := vl_lanc + 0.02;

      dt_darf := qry_conc_lanc_.FieldByName('DT_LANCAMENTO').AsDateTime;
      qry_caixa_docto_.Close;
      qry_caixa_docto_.RequestLive := False;
      qry_caixa_docto_.SQL.Clear;
      qry_caixa_docto_.SQL.Add('SELECT NR_PROCESSO, DT_MOVIMENTO, VL_LANCAMENTO, NR_CHEQUE, NR_LANCAMENTO, TP_NATUREZA, ');
      qry_caixa_docto_.SQL.Add('NR_SEQ_CONCILIACAO, CD_BANCO, NM_HISTORICO, CD_COLIGADA, CD_UNID_NEG, CD_CT_CONTABIL, IN_CONCILIACAO, ');
      qry_caixa_docto_.SQL.Add('DT_CONCILIACAO, CD_USUARIO_CONCILIACAO, IN_CONCILIACAO_AUTOM, NR_SEQ_CONCILIACAO FROM TCAIXA (NOLOCK) ');
      qry_caixa_docto_.SQL.Add('WHERE NR_PROCESSO IN ( SELECT NR_PROCESSO FROM TFOLLOWUP (NOLOCK) WHERE DT_REALIZACAO BETWEEN :DT_REGISTRO_DI AND :DT_REGISTRO_DI_FINAL ) ');
      qry_caixa_docto_.SQL.Add(' AND IN_CANCELADO = ''0'' AND TP_PROCEDENCIA = ''1'' AND TP_NATUREZA = ''D'' AND TP_PAGAMENTO = ''D'' AND IN_CONCILIACAO= ''0''');
      qry_caixa_docto_.SQL.Add(' AND CD_UNID_NEG = :CD_UNID_NEG AND CD_BANCO = :CD_BANCO ');
      qry_caixa_docto_.SQL.Add(' AND ( ( VL_LANCAMENTO = :VL_LANC ) OR ( VL_LANCAMENTO BETWEEN :VL_LANC1 AND :VL_LANC2 ) ) ');
      qry_caixa_docto_.ParamByName('DT_REGISTRO_DI').AsDateTime := dt_darf;
      qry_caixa_docto_.ParamByName('DT_REGISTRO_DI_FINAL').AsDateTime := qry_conc_lanc_.FieldByName('DT_LANCAMENTO').AsDateTime;
      qry_caixa_docto_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unidade.Text;
      qry_caixa_docto_.ParamByName('CD_BANCO').AsString := msk_cd_banco.Text;
      qry_caixa_docto_.ParamByName('VL_LANC').AsFloat := vl_lanc;
      qry_caixa_docto_.ParamByName('VL_LANC1').AsFloat := vl_lanc1;
      qry_caixa_docto_.ParamByName('VL_LANC2').AsFloat := vl_lanc2;
      qry_caixa_docto_.Prepare;
      qry_caixa_docto_.Open;

      if qry_caixa_docto_.EOF then
      begin
        //
      end
      else
      begin
        // Código abaixo existe em virtude de não aparecer valor nos dbedt da tela
        edt_dt_lancamento.Text := DateToStr( qry_caixa_docto_.FieldByName('DT_MOVIMENTO').AsDateTime );
        edt_nr_docto.Text := qry_caixa_docto_.FieldByName('NR_CHEQUE').AsString;
        edt_nr_processo.Text := qry_caixa_docto_.FieldByName('NR_PROCESSO').AsString;
        edt_vl_lanc.Text := FloatToStr( qry_caixa_docto_.FieldByName('VL_LANCAMENTO').AsFloat );
        edt_natur.Text := qry_caixa_docto_.FieldByName('TP_NATUREZA').AsString;
        edt_hist.Text := qry_caixa_docto_.FieldByName('NM_HISTORICO').AsString;

        dbgrd_caixa.Visible := False;
        ed_valor_lancamentos.Visible := False;
        Label30.Visible := False;
        pnl_aviso.Visible := False;
      end;

    end
    else if  nr_lancamento = '0191' then  // TED
    begin
      vl_lanc := qry_conc_lanc_.FieldByName('VL_LANCAMENTO').AsFloat;
      vl_lanc1 := vl_lanc - 0.02;
      vl_lanc2 := vl_lanc + 0.02;

      qry_caixa_docto_.Close;
      qry_caixa_docto_.RequestLive := False;
      qry_caixa_docto_.SQL.Clear;
      qry_caixa_docto_.SQL.Add('SELECT NR_PROCESSO, CD_UNID_NEG, DT_MOVIMENTO, VL_LANCAMENTO, NR_CHEQUE, NR_LANCAMENTO, TP_NATUREZA, ');
      qry_caixa_docto_.SQL.Add('NR_SEQ_CONCILIACAO, CD_BANCO, NM_HISTORICO, CD_COLIGADA, CD_CT_CONTABIL, IN_CONCILIACAO, ' );
      qry_caixa_docto_.SQL.Add('DT_CONCILIACAO, CD_USUARIO_CONCILIACAO, IN_CONCILIACAO_AUTOM, NR_SEQ_CONCILIACAO FROM TCAIXA (NOLOCK) ');
      qry_caixa_docto_.SQL.Add('WHERE IN_CANCELADO = ''0'' AND TP_PROCEDENCIA = ''1'' AND TP_NATUREZA = ''D'' AND TP_PAGAMENTO = ''T'' AND IN_CONCILIACAO= ''0''');
      qry_caixa_docto_.SQL.Add(' AND CD_UNID_NEG = :CD_UNID_NEG AND CD_BANCO = :CD_BANCO ');
      qry_caixa_docto_.SQL.Add(' AND ( ( VL_LANCAMENTO = :VL_LANC ) OR ( VL_LANCAMENTO BETWEEN :VL_LANC1 AND :VL_LANC2 ) ) ');
      qry_caixa_docto_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unidade.Text;
      qry_caixa_docto_.ParamByName('CD_BANCO').AsString := msk_cd_banco.Text;
      qry_caixa_docto_.ParamByName('VL_LANC').AsFloat := vl_lanc;
      qry_caixa_docto_.ParamByName('VL_LANC1').AsFloat := vl_lanc1;
      qry_caixa_docto_.ParamByName('VL_LANC2').AsFloat := vl_lanc2;
      qry_caixa_docto_.Prepare;
      qry_caixa_docto_.Open;

      if qry_caixa_docto_.EOF then
      begin
        pnl_aviso.Visible := True;
      end
      else
      begin
        // Código abaixo existe em virtude de não aparecer valor nos dbedt da tela
        edt_dt_lancamento.Text := DateToStr( qry_caixa_docto_.FieldByName('DT_MOVIMENTO').AsDateTime );
        edt_nr_docto.Text := qry_caixa_docto_.FieldByName('NR_CHEQUE').AsString;
        edt_nr_processo.Text := qry_caixa_docto_.FieldByName('NR_PROCESSO').AsString;
        edt_vl_lanc.Text := FloatToStr( qry_caixa_docto_.FieldByName('VL_LANCAMENTO').AsFloat );
        edt_natur.Text := qry_caixa_docto_.FieldByName('TP_NATUREZA').AsString;
        edt_hist.Text := qry_caixa_docto_.FieldByName('NM_HISTORICO').AsString;

        dbgrd_caixa.Visible := False;
        ed_valor_lancamentos.Visible := False;
        Label30.Visible := False;
        pnl_aviso.Visible := False;
      end;
    end;
  end;
end;


procedure Tfrm_conciliacao.btn_buscar1Click(Sender: TObject);
begin
  pnl_aviso.Visible := False;
end;

procedure Tfrm_conciliacao.btn_lancClick(Sender: TObject);
begin
  vEnt := '1';
  ListaLanc;
end;

procedure Tfrm_conciliacao.msk_cd_unidadeChange(Sender: TObject);
begin
  if ( msk_cd_unidade.Text = '' ) or ( length( msk_cd_unidade.Text ) < 1 ) then
    edit_nm_unidade.Text := '';
end;

procedure Tfrm_conciliacao.msk_cd_unidadeExit(Sender: TObject);
begin
  if edit_nm_unidade.Text <> ''  then
    edit_nm_unidade.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unidade.Text,'AP_UNID_NEG');
end;

procedure Tfrm_conciliacao.btn_co_unidadeClick(Sender: TObject);
begin
  if Sender Is TSpeedButton then
  begin
    msk_cd_unidade.Text := ConsultaOnLineEx('TUNID_NEG','Unidade',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',nil);
    edit_nm_unidade.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unidade.Text,'AP_UNID_NEG');
  end;
end;


procedure Tfrm_conciliacao.btn_saltarClick(Sender: TObject);
begin
  pnl_aviso.Visible := False;
  with datm_conciliacao do
  begin
    dbgrd_caixa.Visible := False;           ed_valor_lancamentos.Visible := False;
    Label30.Visible := False;

    try
      qry_conc_lanc_.Next;
      // Código abaixo existe em virtude de não aparecer valor nos dbedt da tela
      edt_dt_lancamento.Text := ' ';
      edt_nr_docto.Text := ' ';
      edt_nr_processo.Text := ' ';
       edt_vl_lanc.Text := ' ';
      edt_natur.Text := ' ';
      edt_hist.Text := ' ';

      edt_dt_lanc.Text := DateToStr( qry_conc_lanc_.FieldByName('DT_LANCAMENTO').AsDateTime );
      edt_docto.Text := qry_conc_lanc_.FieldByName('NR_DOCUMENTO').AsString;
      edt_tp_natur.Text := qry_conc_lanc_.FieldByName('TP_NATUREZA').AsString;
      edt_historico.Text := qry_conc_lanc_.FieldByName('NM_HISTORICO').AsString;
      edt_vl_lan.Text := FloatToStr( qry_conc_lanc_.FieldByName('VL_LANCAMENTO').AsFloat );
    except
      btn_saltar.Enabled := False;
      btn_retornar.Enabled := True;
      Exit;
    end;
    if qry_conc_lanc_.EOF then
      qry_conc_lanc_.First;

    if ed_obs.Visible = True then
      ed_obs.Text := qry_conc_lanc_.FieldByName('NM_HISTORICO').AsString;

    ListaCaixa;

  end;
end;


procedure Tfrm_conciliacao.btn_conciliar_txtClick(Sender: TObject);
begin
  pnl_aviso.Visible := False;

  // Grava na TCAIXA a conciliação do lançamento
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    Sql.Clear;
    Sql.Add('UPDATE TCAIXA SET IN_CONCILIACAO_AUTOM = ''2'',');
    Sql.Add(' CD_USUARIO_CONCILIACAO = :CD_USUARIO_CONCILIACAO,');
    Sql.Add('IN_CONCILIACAO = ''2'', DT_CONCILIACAO = :DT_CONCILIACAO, NR_SEQ_CONCILIACAO = :NR_SEQ_CONCILIACAO ');

    // Atualiza tabela TCAIXA - um ou vários lançamentos
    if ed_valor_lancamentos.Visible = False then
    begin
      Sql.Add('WHERE CD_COLIGADA = ''01'' AND DT_MOVIMENTO = :DT_MOVIMENTO AND NR_LANCAMENTO = :NR_LANCAMENTO' );
      Sql.Add(' AND CD_UNID_NEG = :CD_UNID_NEG AND CD_BANCO = :CD_BANCO' );
      ParamByName('NR_SEQ_CONCILIACAO').AsInteger := datm_conciliacao.qry_conc_lanc_.FieldByName('NR_SEQ').AsInteger;
      ParamByName('NR_LANCAMENTO').AsString := datm_conciliacao.qry_caixa_docto_.FieldByName('NR_LANCAMENTO').AsString;
    end
    else
    begin
      Sql.Add('WHERE CD_COLIGADA = ''01'' AND DT_MOVIMENTO = :DT_MOVIMENTO AND NR_CHEQUE = :NR_CHEQUE' );
      Sql.Add(' AND CD_UNID_NEG = :CD_UNID_NEG AND CD_BANCO = :CD_BANCO' );
      ParamByName('NR_SEQ_CONCILIACAO').AsInteger := datm_conciliacao.qry_conc_lanc_.FieldByName('NR_SEQ').AsInteger;
      ParamByName('NR_CHEQUE').AsString := datm_conciliacao.qry_conc_lanc_.FieldByName('NR_DOCUMENTO').AsString;
    end;
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unidade.Text;
    ParamByName('CD_BANCO').AsString := msk_cd_banco.Text;
    ParamByName('CD_USUARIO_CONCILIACAO').AsString := str_cd_usuario;
    ParamByName('DT_CONCILIACAO').AsDateTime := datm_conciliacao.qry_conc_lanc_.FieldByName('DT_LANCAMENTO').AsDateTime;
    ParamByName('DT_MOVIMENTO').AsDateTime := datm_conciliacao.qry_caixa_docto_.FieldByName('DT_MOVIMENTO').AsDateTime;
    ExecSql;

    // Grava na TCONCILIACAO a conciliação do lançamento
    Sql.Clear;
    Sql.Add('UPDATE TCONCILIACAO SET IN_CONCILIADO = ''1''');
    if nr_lancamento = '0007' then  // CHEQUE
    begin
      Sql.Add('WHERE DT_LANCAMENTO = :DT_LANCAMENTO AND NR_DOCUMENTO = :NR_DOCUMENTO' );
      Sql.Add(' AND CD_UNID_NEG = :CD_UNID_NEG AND CD_BANCO = :CD_BANCO' );
      ParamByName('NR_DOCUMENTO').AsString := datm_conciliacao.qry_caixa_docto_.FieldByName('NR_CHEQUE').AsString;
      ParamByName('DT_LANCAMENTO').AsDateTime := datm_conciliacao.qry_conc_lanc_.FieldByName('DT_LANCAMENTO').AsDateTime;
    end
    else if ( nr_lancamento = '0031' ) or ( nr_lancamento = '0191' ) then  // DARF
    begin
      Sql.Add('WHERE VL_LANCAMENTO = :VL_LANCAMENTO ');
      Sql.Add(' AND CD_UNID_NEG = :CD_UNID_NEG AND CD_BANCO = :CD_BANCO' );
      ParamByName('VL_LANCAMENTO').AsFloat := datm_conciliacao.qry_conc_lanc_.FieldByName('VL_LANCAMENTO').AsFloat;
    end;
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unidade.Text;
    ParamByName('CD_BANCO').AsString := msk_cd_banco.Text;
    ExecSql;
    Free;
  end;

  btn_saltarClick(nil);
end;


procedure Tfrm_conciliacao.btn_salvarClick(Sender: TObject);
var NumMax : Integer;
begin
  with datm_conciliacao do
  begin
    if nr_lancamento = '0359' then // Taxa
    begin
      if ( ed_nm_conta.Text = '' ) then
      begin
        BoxMensagem( 'Conta Contábil não cadastrada',2 );
        ed_conta.SetFocus;
        Exit;
      end;
      if ( ed_nm_custo.Text = '' ) then
      begin
        BoxMensagem( 'Centro de Custo não cadastrado',2 );
        ed_custo.SetFocus;
        Exit;
      end;

      with TQuery.Create(application) do
      begin
        DatabaseName := 'DBBROKER';
        RequestLive := False;
        SQL.CLear;
        SQL.Add('SELECT MAX( NR_LANCAMENTO ) AS LANC FROM TCAIXA (NOLOCK) ');
        SQL.Add('WHERE CD_COLIGADA = ''01'' AND DT_MOVIMENTO = :DT_MOVIMENTO ');
        ParamByName('DT_MOVIMENTO').AsDateTime := qry_conc_lanc_.FieldByName('DT_LANCAMENTO').AsDateTime;
        Prepare;
        Open;
        NumMax := ( FieldByName('LANC').AsInteger + 1 );
        Close;
        
        Free;
      end;

      with TQuery.Create(application) do
      begin
        DatabaseName := 'DBBROKER';
        RequestLive := True;
        SQL.CLear;
        SQL.Add('INSERT INTO TCAIXA (CD_COLIGADA, DT_MOVIMENTO, NR_LANCAMENTO, CD_UNID_NEG, NR_CHEQUE, CD_BANCO, CD_CT_CONTABIL, VL_LANCAMENTO, ');
        SQL.Add('TP_NATUREZA, NM_HISTORICO, IN_CONCILIACAO, DT_CONCILIACAO, CD_USUARIO_CONCILIACAO, IN_CONCILIACAO_AUTOM, NR_SEQ_CONCILIACAO, ');
        SQL.Add('TP_LANCAMENTO, TP_PROCEDENCIA, TP_PAGAMENTO, CD_CT_CUSTO ) ');
        SQL.Add('VALUES (:CD_COLIGADA, :DT_MOVIMENTO, :NR_LANCAMENTO, :CD_UNID_NEG, :NR_CHEQUE, :CD_BANCO, :CD_CT_CONTABIL, :VL_LANCAMENTO, ');
        SQL.Add(':TP_NATUREZA, :NM_HISTORICO, :IN_CONCILIACAO, :DT_CONCILIACAO, :CD_USUARIO_CONCILIACAO, :IN_CONCILIACAO_AUTOM, :NR_SEQ_CONCILIACAO, ');
        SQL.Add(':TP_LANCAMENTO, :TP_PROCEDENCIA, :TP_PAGAMENTO, :CD_CT_CUSTO )');
        ParamByName('CD_COLIGADA').AsString            := '01';
        ParamByName('DT_MOVIMENTO').AsDateTime         := qry_conc_lanc_.FieldByName('DT_LANCAMENTO').AsDateTime;
        ParamByName('NR_LANCAMENTO').AsString          := Copy( '000000', 1, ( 6 - length( IntToStr( NumMax ) ) ) ) + IntToStr( NumMax );
        ParamByName('CD_UNID_NEG').AsString            := qry_conc_lanc_.FieldByName('CD_UNID_NEG').AsString;
        ParamByName('NR_CHEQUE').AsString              := qry_conc_lanc_.FieldByName('NR_DOCUMENTO').AsString;
        ParamByName('CD_BANCO').AsString               := qry_conc_lanc_.FieldByName('CD_BANCO').AsString;
        ParamByName('CD_CT_CONTABIL').AsString         := ed_conta.Text;
        ParamByName('VL_LANCAMENTO').AsFloat           := qry_conc_lanc_.FieldByName('VL_LANCAMENTO').AsFloat;
        ParamByName('TP_NATUREZA').AsString            := qry_conc_lanc_.FieldByName('TP_NATUREZA').AsString;
        ParamByName('NM_HISTORICO').AsString           := ed_obs.Text;;
        ParamByName('IN_CONCILIACAO').AsString         := '2';
        ParamByName('DT_CONCILIACAO').AsDateTime       := qry_conc_lanc_.FieldByName('DT_LANCAMENTO').AsDateTime;
        ParamByName('CD_USUARIO_CONCILIACAO').AsString := str_cd_usuario;
        ParamByName('IN_CONCILIACAO_AUTOM').AsString   := '2';
        ParamByName('NR_SEQ_CONCILIACAO').AsInteger    := qry_conc_lanc_.FieldByName('NR_SEQ').AsInteger;
        ParamByName('TP_LANCAMENTO').AsString          := 'C';
        ParamByName('TP_PROCEDENCIA').AsString         := '0';
        ParamByName('TP_PAGAMENTO').AsString           := 'D';
        ParamByName('CD_CT_CUSTO').AsString            := ed_custo.Text;
        ExecSQL;
        Free;
      end;

      with TQuery.Create(application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.CLear;
        SQL.Add('UPDATE TCONCILIACAO SET IN_CONCILIADO = ''1''');
        SQL.Add(' WHERE NR_SEQ = :NR_SEQ');
        ParamByName('NR_SEQ').AsInteger := qry_conc_lanc_.FieldByName('NR_SEQ').AsInteger;
        ExecSQL;
        Free;
      end;

      ed_obs.Text := '';
      ed_conta.Text := '';
      ed_nm_conta.Text := '';
      ed_custo.Text := '';
      ed_nm_custo.Text := '';

      // Salta para próximo registro
      ListaLanc;
      btn_saltarClick(nil);
      if nr_lancamento = '0359' then
        btn_salvar.Visible := True;         mi_salvar.Visible := True;
    end
    else
    begin
      qry_caixa_docto_.Post;
      ListaCaixa;
      btn_salvar.Visible := False;      mi_salvar.Visible := False;
    end;
  end;
end;

procedure Tfrm_conciliacao.btn_buscarClick(Sender: TObject);
begin
  pnl_aviso.Visible := False;
end;


procedure Tfrm_conciliacao.mostra_btn( v :Boolean);
begin
  btn_conciliar.Visible := Not( v );    mi_conciliar.Visible := Not( v );
  btn_cancelar.Visible := Not( v );     mi_cancelar.Visible := Not( v );
  btn_le.Visible := Not( v );           mi_le.Visible := Not( v );
  btn_lanc.Visible := Not( v );         mi_lanc.Visible := Not( v );
  btn_retornar.Visible := v;            mi_retornar.Visible := v;
  btn_saltar.Visible := v;              mi_saltar.Visible := v;
  mi_ignorar.Visible := v;
  if nr_lancamento = '0359' then
  begin
    btn_conciliar_txt.Visible := Not( v );
    mi_conciliar_txt.Visible := Not( v );
  end
  else
  begin
    btn_conciliar_txt.Visible := v;
    mi_conciliar_txt.Visible := v;
  end;
  btn_retorna.Visible := v;             mi_retorna.Visible := v;

  btn_retornar.Left := 4;
  btn_saltar.Left := 46;
  btn_conciliar_txt.Left := 88;
  btn_salvar.Left := 130;

  msk_cd_unidade_c.Text := msk_cd_unidade.Text;
  msk_cd_banco_c.Text := msk_cd_banco.Text;
  edit_nm_unidade_c.Text := edit_nm_unidade.Text;
  edit_nm_banco_c.Text := edit_nm_banco.Text;
  lbl_banco.Caption := 'Arquivo de Conciliação - ' + edit_nm_banco_c.Text;
end;

procedure Tfrm_conciliacao.btn_retornaClick(Sender: TObject);
begin
  with datm_conciliacao do
  begin
    qry_caixa_docto_.Close;
    qry_conc_.Close;
    qry_le_arq_txt_.Close;
  end;
  ntb_conc.ActivePage := 'conc_manual';
  mostra_btn( False );
  pgctrl_lancamentos.ActivePage := TabSheet1;
end;


procedure Tfrm_conciliacao.btn_okClick(Sender: TObject);
begin
  if msk_dt_conciliacao.Text = '  /  /    ' then
  begin
    BoxMensagem( 'Data de Conciliação deve ser preenchida',2 );
    msk_dt_conciliacao.SetFocus;
    Exit;
  end;

  try
    msk_dt_conciliacao.Text := DateToStr( StrToDate( msk_dt_conciliacao.Text ) );
  except
    BoxMensagem( 'Data de Conciliação Inválida',2 );
    msk_dt_conciliacao.SetFocus;
    Exit;
  end;

  // Concilia lançamentos da TCAIXA  ( quando campo IN_CONCILIACAO = 1 )
  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.CLear;
    SQL.Add('UPDATE TCAIXA SET DT_CONCILIACAO = :DT_CONCILIACAO, IN_CONCILIACAO = ''2'', IN_CONCILIACAO_AUTOM = ''4'', CD_USUARIO_CONCILIACAO = :CD_USUARIO_CONCILIACAO WHERE CD_COLIGADA = ''01''');
    SQL.Add(' AND CD_UNID_NEG = :CD_UNID_NEG AND CD_BANCO = :CD_BANCO AND DT_MOVIMENTO = :DT_MOVIMENTO  AND IN_CONCILIACAO = ''1''');
    ParamByName('CD_UNID_NEG').AsString := datm_conciliacao.qry_caixa_.FieldByName('CD_UNID_NEG').AsString;
    ParamByName('CD_BANCO').AsString := datm_conciliacao.qry_caixa_.FieldByName('CD_BANCO').AsString;
    ParamByName('DT_MOVIMENTO').AsDateTime := datm_conciliacao.qry_caixa_.FieldByName('DT_MOVIMENTO').AsDateTime;
    ParamByName('DT_CONCILIACAO').AsDateTime := StrToDate( msk_dt_conciliacao.Text );
    ParamByName('CD_USUARIO_CONCILIACAO').AsString := str_cd_usuario;
    ExecSQL;
    Free;
  end;

  TrazRegistros;

  pnl_dt_conciliacao.Visible := False;
  BoxMensagem('Lançamento(s) conciliado(s) !', 2) ;
end;


procedure Tfrm_conciliacao.btn_sair_dtClick(Sender: TObject);
begin
  pnl_dt_conciliacao.Visible := False;
end;


procedure Tfrm_conciliacao.rdgp_pag_cClick(Sender: TObject);
begin
  // Limpa objetos TXT
  edt_dt_lancamento.Text := ' ';
  edt_nr_docto.Text := ' ';
  edt_nr_processo.Text := ' ';
  edt_vl_lanc.Text := ' ';
  edt_natur.Text := ' ';
  edt_hist.Text := ' ';

  case rdgp_pag_c.ItemIndex of
    0 : nr_lancamento := '0007';
    1 : nr_lancamento := '0031';
    2 : nr_lancamento := '0191';
    3 : nr_lancamento := '0359';
  end;

  if nr_lancamento = '0031' then   // DARF/DOC
  begin
    // dbedt_nr_processo.Visible := True;
    edt_nr_processo.Visible := True;
    Label17.Visible := True;
    pnl_extrato( True );
  end
  else
  begin
    if nr_lancamento = '0359' then  // TAXAS
    begin
      pnl_extrato( False );
      btn_conciliar_txt.Visible := False;
      pnl_aviso.Visible := False;
    end
    else
    begin
      dbedt_nr_processo.Visible := False;
      Label17.Visible := False;
      pnl_extrato( True );
    end;
  end;

  dbgrd_caixa.Visible := False;
  Label30.Visible := False;
  ed_valor_lancamentos.Visible := False;

  ListaLanc;
end;

procedure Tfrm_conciliacao.msk_nr_doctoExit(Sender: TObject);
begin
  ListaLanc;
end;

procedure Tfrm_conciliacao.rdgp_pagClick(Sender: TObject);
begin
  case rdgp_pag.ItemIndex of
    0 : tp_pag := 'C';
    1 : tp_pag := 'D';
    2 : tp_pag := 'T';
  end;

  TrazRegistros;
end;


procedure Tfrm_conciliacao.msk_n_doctoExit(Sender: TObject);
begin
  TrazRegistros;
end;


procedure Tfrm_conciliacao.msk_valorExit(Sender: TObject);
begin
  if msk_valor.Text = '' then
    msk_valor.Text := '0';

  TrazRegistros;
end;


procedure Tfrm_conciliacao.msk_dt_conciliacao_peExit(Sender: TObject);
begin
  if msk_dt_conciliacao_pe.Text <> '  /  /    ' then
  begin
    try
      msk_dt_conciliacao_pe.Text := DateToStr( StrToDate( msk_dt_conciliacao_pe.Text ) );
    except
      BoxMensagem( 'Data Conciliação Inválida',2 );
      msk_dt_conciliacao_pe.SetFocus;
      Exit;
    end;
    rdgp_tp_pesquisa.ItemIndex := 1;
    rdgp_tp_pesquisaClick(nil);
  end;
end;


procedure Tfrm_conciliacao.dt_inicial_cExit(Sender: TObject);
begin
  if dt_inicial_c.Text = '  /  /    ' then
  begin
    dt_final_c.Text := '  /  /    ';
    dt_inicio_txt := '01/01/1990';
    dt_fim_txt := '01/01/2200';
  end
  else
  begin
    try
      dt_inicial_c.Text := DateToStr( StrToDate( dt_inicial_c.Text ) );
    except
      BoxMensagem( 'Data Inicial Inválida',2 );
      dt_inicial_c.SetFocus;
      Exit;
    end;

    dt_inicio_txt := dt_inicial_c.Text;
  end;

  ListaLanc;
end;


procedure Tfrm_conciliacao.dt_final_cExit(Sender: TObject);
begin
  dt_fim_txt := dt_final_c.Text;
  ListaLanc;
end;


procedure Tfrm_conciliacao.pnl_extrato( b :Boolean);
begin
  // Código abaixo existe em virtude de não aparecer valor nos dbedt da tela
  Label25.Visible := b;              edt_dt_lancamento.Visible := b;
  Label26.Visible := b;              edt_nr_docto.Visible := b;
  Label17.Visible := b;              edt_nr_processo.Visible := b;
  Label27.Visible := b;              edt_vl_lanc.Visible := b;
  Label28.Visible := b;              edt_natur.Visible := b;
  Label29.Visible := b;              edt_hist.Visible := b;

  (* Label25.Visible := b;              dbedt_dt_lancamento.Visible := b;
  Label26.Visible := b;              dbedt_nr_docto.Visible := b;
  Label17.Visible := b;              dbedt_nr_processo.Visible := b;
  Label27.Visible := b;              dbedt_vl_lanc.Visible := b;
  Label28.Visible := b;              dbedt_natur.Visible := b;
  Label29.Visible := b;              dbedt_hist.Visible := b; *)

  dbgrd_caixa.Visible := b;          Label30.Visible := b;
  ed_valor_lancamentos.Visible := b;

  ed_conta.Visible := Not( b );      ed_nm_conta.Visible := Not( b );
  btn_conta.Visible := Not( b );
  ed_custo.Visible := Not( b );      ed_nm_custo.Visible := Not( b );
  btn_custo.Visible := Not( b );
  Label38.Visible := Not( b );       btn_conta.Visible := Not( b );
  Label15.Visible := Not( b );       
  Label42.Visible := Not( b );       ed_obs.Visible := Not( b );
  btn_salvar.Visible := Not( b );    mi_salvar.Visible := Not( b );
  btn_conciliar_txt.Visible := Not( b );
end;


procedure Tfrm_conciliacao.ed_contaExit(Sender: TObject);
begin
  if ed_conta.Text <> '' then
    ed_nm_conta.Text := ConsultaLookUP('TCT_CONTABIL','CD_CT_CONTABIL', ed_conta.Text,'NM_CT_CONTABIL');

  if ( ed_conta.Text <> '' ) AND ( ed_nm_conta.Text = '' ) then
  begin
    BoxMensagem( 'Conta Contábil não cadastrada',2 );
    ed_conta.SetFocus;
    Exit;
  end;
end;

procedure Tfrm_conciliacao.btn_contaClick(Sender: TObject);
begin
  if Sender Is TSpeedButton then
  begin
    ed_conta.Text := ConsultaOnLineEx('TCT_CONTABIL','Conta Contábil',['CD_CT_CONTABIL','NM_CT_CONTABIL'],['Código','Descrição'],'CD_CT_CONTABIL',nil);
    ed_nm_conta.Text := ConsultaLookUP('TCT_CONTABIL','CD_CT_CONTABIL', ed_conta.Text,'NM_CT_CONTABIL');
  end;
end;


procedure Tfrm_conciliacao.btn_retornarClick(Sender: TObject);
begin
  pnl_aviso.Visible := False;
  with datm_conciliacao do
  begin
    dbgrd_caixa.Visible := False;           ed_valor_lancamentos.Visible := False;
    Label30.Visible := False;

    try
      qry_conc_lanc_.Prior;

      // Código abaixo existe em virtude de não aparecer valor nos dbedt da tela
      edt_dt_lancamento.Text := ' ';
      edt_nr_docto.Text := ' ';
      edt_nr_processo.Text := ' ';
      edt_vl_lanc.Text := ' ';
      edt_natur.Text := ' ';
      edt_hist.Text := ' ';

      edt_dt_lanc.Text := DateToStr( qry_conc_lanc_.FieldByName('DT_LANCAMENTO').AsDateTime );
      edt_docto.Text := qry_conc_lanc_.FieldByName('NR_DOCUMENTO').AsString;
      edt_tp_natur.Text := qry_conc_lanc_.FieldByName('TP_NATUREZA').AsString;
      edt_historico.Text := qry_conc_lanc_.FieldByName('NM_HISTORICO').AsString;
      edt_vl_lan.Text := FloatToStr( qry_conc_lanc_.FieldByName('VL_LANCAMENTO').AsFloat );
    except
      btn_retornar.Enabled := False;
      btn_saltar.Enabled := True;
      Exit;
    end;

    if qry_conc_lanc_.BOF then
      qry_conc_lanc_.Last;

    if ed_obs.Visible = True then
      ed_obs.Text := qry_conc_lanc_.FieldByName('NM_HISTORICO').AsString;

    ListaCaixa;
  end;
end;

procedure Tfrm_conciliacao.mi_ignorarClick(Sender: TObject);
begin
  with datm_conciliacao do
  begin
    with TQuery.Create(application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.CLear;
      SQL.Add('UPDATE TCONCILIACAO SET IN_CONCILIADO = ''1''');
      SQL.Add(' WHERE NR_SEQ = :NR_SEQ');
      ParamByName('NR_SEQ').AsInteger := qry_conc_lanc_.FieldByName('NR_SEQ').AsInteger;
      ExecSQL;
      Free;
    end;

    // Próximo registro
    pnl_aviso.Visible := False;
    dbgrd_caixa.Visible := False;           ed_valor_lancamentos.Visible := False;
    Label30.Visible := False;

    try
      qry_conc_lanc_.Next;
    except
      btn_saltar.Enabled := False;
      btn_retornar.Enabled := True;
      Exit;
    end;
    if qry_conc_lanc_.EOF then
      qry_conc_lanc_.First;

    if ed_obs.Visible = True then
      ed_obs.Text := qry_conc_lanc_.FieldByName('NM_HISTORICO').AsString;

    ListaCaixa;

  end;
end;

procedure Tfrm_conciliacao.btn_custoClick(Sender: TObject);
begin
  if Sender Is TSpeedButton then
  begin
    ed_custo.Text := ConsultaOnLineEx('TCONTABIL_CUSTO','Centro de Custo',['CD_CT_CUSTO','NM_CT_CUSTO'],['Código','Descrição'],'CD_CT_CUSTO',nil);
    ed_nm_custo.Text := ConsultaLookUP('TCONTABIL_CUSTO','CD_CT_CUSTO', ed_custo.Text,'NM_CT_CUSTO');
  end;
end;

procedure Tfrm_conciliacao.ed_custoExit(Sender: TObject);
begin
  if ed_custo.Text <> '' then
    ed_nm_custo.Text := ConsultaLookUP('TCONTABIL_CUSTO','CD_CT_CUSTO', ed_custo.Text,'NM_CT_CUSTO');

  if ( ed_custo.Text <> '' ) AND ( ed_nm_custo.Text = '' ) then
  begin
    BoxMensagem( 'Centro de Custo não cadastrado',2 );
    ed_custo.SetFocus;
    Exit;
  end;
end;

end.

