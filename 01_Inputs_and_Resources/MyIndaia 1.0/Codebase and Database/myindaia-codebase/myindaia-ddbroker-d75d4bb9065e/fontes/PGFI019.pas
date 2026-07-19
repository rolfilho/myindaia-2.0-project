unit PGFI019;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Grids, DBGrids, ComCtrls, Menus, Buttons,
  ExtCtrls, Db, DBTables, ToolEdit, Funcoes, PGGP017, ConsOnlineEx, Variants;

type
  Tfrm_pesq_fin = class(TForm)
    pnl_pesq_adm: TPanel;
    btn_sair: TSpeedButton;
    menu_cadastro: TMainMenu;
    mi_sair: TMenuItem;
    pgctrl_pesq_fin: TPageControl;
    ts_filtros: TTabSheet;
    ts_adm: TTabSheet;
    lbl_favorecido: TLabel;
    btn_co_favorecido: TSpeedButton;
    msk_cd_favorecido: TMaskEdit;
    edt_nm_favorecido: TEdit;
    Label12: TLabel;
    dbedt_nm_unid_neg_adm: TDBEdit;
    dbedt_cd_unid_neg_adm: TDBEdit;
    mi_manut_proc: TMenuItem;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    lbl_banco: TLabel;
    btn_co_banco: TSpeedButton;
    msk_cd_banco: TMaskEdit;
    edt_nm_banco: TEdit;
    lbl_valor: TLabel;
    msk_valor: TMaskEdit;
    lbl_nr_docto: TLabel;
    msk_nr_docto: TMaskEdit;
    btn_pesquisa: TSpeedButton;
    lbl_historico: TLabel;
    btn_co_historico: TSpeedButton;
    msk_cd_historico: TMaskEdit;
    edt_nm_historico: TEdit;
    btn_co_ct_contabil: TSpeedButton;
    lbl_ct_contabil: TLabel;
    edt_nm_ct_contabil: TEdit;
    msk_cd_ct_contabil: TMaskEdit;
    rdgrp_tp_natureza: TRadioGroup;
    lbl_inicio: TLabel;
    lbl_fim: TLabel;
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    lbl_item: TLabel;
    btn_co_item: TSpeedButton;
    msk_cd_item: TMaskEdit;
    edt_nm_item: TEdit;
    lbl_processo: TLabel;
    btn_co_processo: TSpeedButton;
    msk_nr_processo: TMaskEdit;
    rdgrp_tp_lancamento: TRadioGroup;
    rdgrp_tp_forma_pagto: TRadioGroup;
    msk_dt_inicio: TDateEdit;
    msk_dt_fim: TDateEdit;
    ts_fat: TTabSheet;
    Label4: TLabel;
    dbedt_nm_unid_neg_fat: TDBEdit;
    dbedt_cd_unid_neg_fat: TDBEdit;
    pgctrl_contabil: TPageControl;
    ts_lista_contabil: TTabSheet;
    dbg_contabil: TDBGrid;
    ts_dados_contabil: TTabSheet;
    pnl_caixa_contabil: TPanel;
    lbl_nr_lanc_contabil: TLabel;
    Label1: TLabel;
    lbl_historico_contabil: TLabel;
    lbl_vl_lanc_contabil: TLabel;
    lbl_cd_ct_custo: TLabel;
    lbl_banco_contabil: TLabel;
    lbl_nr_cheque_contabil: TLabel;
    lbl_favorecido_adm: TLabel;
    Label8: TLabel;
    lbl_acesso: TLabel;
    lbl_aux: TLabel;
    lbl_contabiliza: TLabel;
    dbedt_nr_lanc_contabil: TDBEdit;
    dbedt_cd_ct_contabil: TDBEdit;
    dbedt_nm_ct_contabil: TDBEdit;
    dbedt_nm_historico: TDBEdit;
    dbedt_cd_historico: TDBEdit;
    dbedt_vl_lanc_contabil: TDBEdit;
    dbrdgrp_natureza: TDBRadioGroup;
    dbedt_cd_ct_custo: TDBEdit;
    dbedt_nm_ct_custo: TDBEdit;
    dbedt_nm_banco_contabil: TDBEdit;
    dbedt_cd_banco_contabil: TDBEdit;
    dbedt_nr_cheque_contabil: TDBEdit;
    dbrdgrp_forma_pagto_contabil: TDBRadioGroup;
    dbedt_nm_favorecido_adm: TDBEdit;
    dbedt_vl_ir_contabil: TDBEdit;
    dbedt_cd_favorecido_adm: TDBEdit;
    dbedt_cd_acesso: TDBEdit;
    dbedt_cd_aux: TDBEdit;
    dbm_nm_hist_contabil: TDBMemo;
    pgctrl_fatur: TPageControl;
    ts_lista_fatur: TTabSheet;
    dbg_fatur: TDBGrid;
    ts_dados_fatur: TTabSheet;
    pnl_caixa_fatur: TPanel;
    lbl_nr_lanc_fatur: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    lbl_cliente: TLabel;
    Label11: TLabel;
    lbl_vl_lanc_fatur: TLabel;
    lbl_vl_ir: TLabel;
    lbl_despachante: TLabel;
    lbl_vl_assist: TLabel;
    lbl_banco_fatur: TLabel;
    lbl_nr_cheque_fatur: TLabel;
    Label13: TLabel;
    lblAtivo: TLabel;
    dbedt_nr_lanc_fatur: TDBEdit;
    dbedt_cd_favorecido: TDBEdit;
    dbedt_nm_favorecido: TDBEdit;
    dbedt_cd_item: TDBEdit;
    dbedt_nm_item: TDBEdit;
    dbedt_nm_hist_fatur: TDBEdit;
    dbedt_vl_lanc_fatur: TDBEdit;
    dbedt_vl_ir: TDBEdit;
    dbedt_cd_despachante: TDBEdit;
    dbedt_nm_despachante: TDBEdit;
    dbedt_vl_assist: TDBEdit;
    dbrdgrp_forma_pagto_fatur: TDBRadioGroup;
    dbedt_cd_banco_fatur: TDBEdit;
    dbedt_nm_banco_fatur: TDBEdit;
    dbedt_nr_cheque_fatur: TDBEdit;
    lbl_cancelado: TLabel;
    lbl_cancelado_fat: TLabel;
    Label7: TLabel;
    dbedt_cd_unid_neg: TDBEdit;
    dbedtr_nm_unid_neg: TDBEdit;
    lbl_produto_fat: TLabel;
    dbedt_cd_produto: TDBEdit;
    dbedt_nm_produto: TDBEdit;
    dbedt_nr_processo: TDBEdit;
    dbedt_cd_cliente: TDBEdit;
    dbedt_nm_cliente: TDBEdit;
    dbcbo_fat_cancelado: TDBComboBox;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBComboBox3: TDBComboBox;
    dbedt_cd_ct_contabilF: TDBEdit;
    dbedt_nm_ct_contabilF: TDBEdit;
    Label2: TLabel;
    dbedtDtConc: TDBEdit;
    lbl1: TLabel;
    dbedt_dt_conc: TDBEdit;
    Label3: TLabel;
    shp1: TShape;
    pnl1: TPanel;
    shp2: TShape;
    pnl2: TPanel;
    qry_adm_: TQuery;
    qry_adm_DT_MOVIMENTO: TDateTimeField;
    qry_adm_NR_LANCAMENTO: TStringField;
    qry_adm_CD_FAVORECIDO: TStringField;
    qry_adm_CD_UNID_NEG: TStringField;
    qry_adm_IN_CANCELADO: TStringField;
    qry_adm_IN_TRANSFERIDO: TStringField;
    qry_adm_NM_HISTORICO: TStringField;
    qry_adm_VL_LANCAMENTO: TFloatField;
    qry_adm_TP_NATUREZA: TStringField;
    qry_adm_TP_PAGAMENTO: TStringField;
    qry_adm_CD_BANCO: TStringField;
    qry_adm_NR_CHEQUE: TStringField;
    qry_adm_CD_ACESSO: TStringField;
    qry_adm_CD_AUX: TStringField;
    qry_adm_CD_CT_CONTABIL: TStringField;
    qry_adm_CD_CT_CUSTO: TStringField;
    qry_adm_TP_LANCAMENTO: TStringField;
    qry_adm_VL_IR: TFloatField;
    qry_adm_TP_PROCEDENCIA: TStringField;
    qry_adm_CD_HIST_PADRAO: TStringField;
    qry_adm_DT_CANCELADO: TDateTimeField;
    qry_adm_IN_CONTABILIZA: TStringField;
    qry_adm_LookCtContabil: TStringField;
    qry_adm_LookNatureza: TStringField;
    qry_adm_LookContabiliza: TStringField;
    qry_adm_LookCancelado: TStringField;
    qry_adm_LookFavorecido: TStringField;
    qry_adm_LookHistorico: TStringField;
    qry_adm_LookBanco: TStringField;
    qry_adm_LookCtCusto: TStringField;
    qry_adm_LookUnidNeg: TStringField;
    qry_adm_DT_CONCILIACAO: TDateTimeField;
    qry_fat_: TQuery;
    qry_fat_DT_MOVIMENTO: TDateTimeField;
    qry_fat_NR_LANCAMENTO: TStringField;
    qry_fat_CD_UNID_NEG: TStringField;
    qry_fat_TP_LANCAMENTO: TStringField;
    qry_fat_TP_PROCEDENCIA: TStringField;
    qry_fat_IN_CANCELADO: TStringField;
    qry_fat_IN_TRANSFERIDO: TStringField;
    qry_fat_NM_HISTORICO: TStringField;
    qry_fat_VL_LANCAMENTO: TFloatField;
    qry_fat_TP_NATUREZA: TStringField;
    qry_fat_TP_PAGAMENTO: TStringField;
    qry_fat_CD_BANCO: TStringField;
    qry_fat_NR_CHEQUE: TStringField;
    qry_fat_CD_FAVORECIDO: TStringField;
    qry_fat_NR_PROCESSO: TStringField;
    qry_fat_CD_ITEM: TStringField;
    qry_fat_VL_IR: TFloatField;
    qry_fat_VL_ASSIST: TFloatField;
    qry_fat_CD_DESPACHANTE: TStringField;
    qry_fat_IN_RESTITUI: TStringField;
    qry_fat_LookUnidNeg: TStringField;
    qry_fat_LookCdProduto: TStringField;
    qry_fat_LookProduto: TStringField;
    qry_fat_LookFavorecido: TStringField;
    qry_fat_LookBanco: TStringField;
    qry_fat_LookCancelado: TStringField;
    qry_fat_LookItem: TStringField;
    qry_fat_LookDespachante: TStringField;
    qry_fat_CalcNrProcesso: TStringField;
    qry_fat_LookRestitui: TStringField;
    qry_fat_LookCdCliente: TStringField;
    qry_fat_LookCliente: TStringField;
    qry_fat_CD_CT_CONTABIL: TStringField;
    qry_fat_LookContabil: TStringField;
    qry_fat_DT_CONCILIACAO: TDateTimeField;
    ds_fat: TDataSource;
    ds_adm: TDataSource;
    qry_adm_IN_SELECIONADO: TStringField;
    qry_fat_IN_SELECIONADO: TStringField;
    qry_adm_calcIN_SELECIONADO: TStringField;
    qry_fat_calcIN_SELECIONADO: TStringField;
    qry_fat_CD_COLIGADA: TStringField;
    qry_adm_CD_COLIGADA: TStringField;
    qry_fat_NR_LANCAMENTO_SELECIONADO: TStringField;
    qry_adm_NR_LANCAMENTO_SELECIONADO: TStringField;
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pgctrl_pesq_finChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure msk_dt_inicio2Exit(Sender: TObject);
    procedure msk_dt_fim2Enter(Sender: TObject);
    procedure msk_dt_fim2Exit(Sender: TObject);
    procedure btn_co_favorecidoClick(Sender: TObject);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure btn_pesquisaClick(Sender: TObject);
    procedure msk_valorExit(Sender: TObject);
    procedure msk_cd_ct_contabilEnter(Sender: TObject);
    procedure btn_co_ct_contabilClick(Sender: TObject);
    procedure btn_co_historicoClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_itemClick(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure msk_dt_inicioExit(Sender: TObject);
    procedure msk_dt_fimEnter(Sender: TObject);
    procedure msk_dt_fimExit(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure msk_cd_itemEnter(Sender: TObject);
    procedure msk_nr_processoEnter(Sender: TObject);
    procedure msk_cd_bancoEnter(Sender: TObject);
    procedure msk_cd_favorecidoEnter(Sender: TObject);
    procedure msk_cd_historicoEnter(Sender: TObject);
    procedure ts_admEnter(Sender: TObject);
    procedure ts_fatEnter(Sender: TObject);
    procedure qry_adm_CalcFields(DataSet: TDataSet);
    procedure qry_fat_CalcFields(DataSet: TDataSet);
    procedure dbg_faturDblClick(Sender: TObject);
    procedure dbg_contabilDblClick(Sender: TObject);
  private
    str_valor : String;
    dt_inicio, dt_fim: TDate;
    cd_ct_contabil_pesq : String[10];
    cd_unid_neg_pesq, cd_produto_pesq : String[2];
    cd_item_pesq, cd_banco_pesq, cd_hist_pesq : String[3];
    cd_favorecido_pesq : String[5];
    nr_processo_pesq : String[18];
    verSelec: string[1];
    vl_lancto : Double;
    procedure GeraSqlStr;
    function Consiste : Boolean;
  public
  end;

var
  frm_pesq_fin: Tfrm_pesq_fin;

implementation

uses PGGP001;


{$R *.DFM}

procedure Tfrm_pesq_fin.msk_cd_unid_negExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_fin.btn_co_unid_negClick(Sender: TObject);
begin

  if Sender is TSpeedButton then
    msk_cd_unid_neg.Text := ConsultaOnLineExSQL('SELECT (U.CD_UNID_NEG) AS UNID, U.NM_UNID_NEG FROM TUNID_NEG U (NOLOCK) ' +
                                                '  INNER JOIN TUSUARIO_HABILITACAO H (NOLOCK) ON H.CD_UNID_NEG = U.CD_UNID_NEG ' +
                                                '  WHERE H.CD_USUARIO = ''' + str_cd_usuario + ''' ' +
                                                'GROUP BY U.CD_UNID_NEG, U.NM_UNID_NEG '  ,
                                                'Unidades de Negócio', ['UNID', 'NM_UNID_NEG'], ['Código', 'Unidade'], 'UNID', nil, msk_cd_unid_neg.text )
  else
    edt_nm_unid_neg.Text := ConsultaLookUPSQL('SELECT U.AP_UNID_NEG FROM TUNID_NEG U (NOLOCK) ' +
                                              '  INNER JOIN TUSUARIO_HABILITACAO H (NOLOCK) ON H.CD_UNID_NEG = U.CD_UNID_NEG ' +
                                              ' WHERE H.CD_USUARIO = ''' + str_cd_usuario + ''' ' +
                                              '   AND U.CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' ' +
                                              'GROUP BY U.AP_UNID_NEG',
                                              'AP_UNID_NEG');


end;

function Tfrm_pesq_fin.Consiste : Boolean;
begin
  Consiste := True;

  // Unidade
  if (Trim( msk_cd_unid_neg.Text ) <> cd_unid_neg_pesq) and (Trim(msk_cd_unid_neg.text) <> '') then begin
    msk_cd_unid_neg.Text :=  Copy('00' , 1, 2- Length(Trim(msk_cd_unid_neg.Text))) + Trim(msk_cd_unid_neg.Text);
    edt_nm_unid_neg.Text := ConsultaLookUPSQL('SELECT U.AP_UNID_NEG FROM TUNID_NEG U (NOLOCK) ' +
                                              '  INNER JOIN TUSUARIO_HABILITACAO H (NOLOCK) ON H.CD_UNID_NEG = U.CD_UNID_NEG ' +
                                              ' WHERE H.CD_USUARIO = ''' + str_cd_usuario + ''' ' +
                                              '   AND U.CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' ' +
                                              'GROUP BY U.CD_UNID_NEG, U.AP_UNID_NEG',
                                              'AP_UNID_NEG');

    if edt_nm_unid_neg.text = '' then begin
      ShowMessage('Unidade de Negócio não cadastrada ou Usuário sem direitos de acesso!');
      msk_cd_unid_neg.Text := '';
      edt_nm_unid_neg.Text := '';
      Consiste         := False;
      msk_cd_unid_neg.SetFocus;
      Exit;
    end;

  end;

  // Produto
  if (Trim( msk_cd_produto.Text ) <> cd_produto_pesq) and (Trim(msk_cd_produto.text) <> '') then begin
    msk_cd_produto.Text :=  Copy('00' , 1, 2- Length(Trim(msk_cd_produto.Text))) + Trim(msk_cd_produto.Text);
    edt_nm_produto.Text := ConsultaLookUPSQL('SELECT P.AP_PRODUTO FROM TPRODUTO P (NOLOCK) ' +
                                             '  INNER JOIN TUSUARIO_HABILITACAO H (NOLOCK) ON (H.CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''') ' +
                                             ' WHERE H.CD_USUARIO = ''' + str_cd_usuario + ''' ' +
                                             '   AND P.CD_PRODUTO = ''' + msk_cd_produto.Text + ''' ' +
                                             ' GROUP BY P.AP_PRODUTO',
                                             'AP_PRODUTO');

    if edt_nm_produto.Text = '' then begin
      ShowMessage( 'Produto não cadastrado ou Usuário sem direitos de acesso!');
      msk_cd_produto.Text := '';
      edt_nm_produto.Text := '';
      Consiste            := False;
      msk_cd_produto.SetFocus;
      Exit;
    end;
  end;

  // Conta Contábil
  if (Trim( msk_cd_ct_contabil.Text ) <> cd_ct_contabil_pesq) and (Trim(msk_cd_ct_contabil.text) <> '') then begin
    edt_nm_ct_contabil.Text := ConsultaLookUpSQL('SELECT NM_CT_CONTABIL FROM TCT_CONTABIL (NOLOCK) ' +
                                                 ' WHERE CD_CT_CONTABIL = ''' + msk_cd_ct_contabil.text + '''  AND CD_IDENTIFICADOR = ''A'' ',
                                                 'NM_CT_CONTABIL');
    if edt_nm_ct_contabil.text = '' then begin
      ShowMessage('Conta Contábil Sintética ou não cadastrada!');
      msk_cd_ct_contabil.Text := '';
      edt_nm_ct_contabil.Text := '';
      Consiste         := False;
      msk_cd_ct_contabil.SetFocus;
      Exit;
    end;
  end;


  // Item
  if (Trim(msk_cd_item.Text) <> cd_item_pesq) and (Trim(msk_cd_item.text) <> '') then  begin
    msk_cd_item.Text :=  Copy('000' , 1, 3- Length(Trim(msk_cd_item.Text))) + Trim(msk_cd_item.Text);
    edt_nm_item.Text := ConsultaLookUp('TITEM', 'CD_ITEM', msk_cd_item.text, 'NM_ITEM');
    if edt_nm_item.text = '' then begin
      ShowMessage('Item não cadastrado!');
      msk_cd_item.Text := '';
      edt_nm_item.Text := '';
      Consiste         := False;
      msk_cd_item.SetFocus;
      Exit;
    end;
  end;

  // Processo
  if (Trim( msk_nr_processo.Text ) <> nr_processo_pesq) and (Trim(msk_nr_processo.text) <> '') then begin
    msk_nr_processo.Text := ConsultaLookUPSQL('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ' +
                                             '       FROM   TPROCESSO PR ( NOLOCK ) ' +
                                             '       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE' +
                                             ' WHERE NR_PROCESSO = ''' + msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text + ''' ' +
                                             '  AND PR.IN_CANCELADO = ''0'' ', 'NR_PROCESSO');

    if msk_nr_processo.Text = '' then begin
      ShowMessage( 'Processo inexistente ou cancelado!');
      msk_nr_processo.SetFocus;
      Exit;
    end;

  end;

  // Banco
  if (Trim( msk_cd_banco.Text ) <> cd_banco_pesq) and (Trim(msk_cd_banco.text) <> '') then begin
    msk_cd_banco.Text :=  Copy('000' , 1, 3- Length(Trim(msk_cd_banco.Text))) + Trim(msk_cd_banco.Text);
    edt_nm_banco.Text := ConsultaLookUp('TBANCO', 'CD_BANCO', msk_cd_banco.text, 'NM_BANCO');

    if edt_nm_banco.Text = '' then begin
      ShowMessage( 'Banco não cadastrado!');
      msk_cd_banco.Text := '';
      edt_nm_banco.Text := '';
      Consiste          := False;
      msk_cd_banco.SetFocus;
      Exit;
    end;
  end;

  // Favorecido
  if (Trim( msk_cd_favorecido.Text ) <> cd_favorecido_pesq) and (Trim(msk_cd_favorecido.Text) <> '') then begin
    msk_cd_favorecido.Text :=  Copy('00000' , 1, 5 - Length(Trim(msk_cd_favorecido.Text))) + Trim(msk_cd_favorecido.Text);
    edt_nm_favorecido.Text := ConsultaLookUP('TFAVORECIDO','CD_FAVORECIDO', msk_cd_favorecido.Text,'NM_FAVORECIDO');

    if edt_nm_favorecido.Text = '' then begin
      BoxMensagem( 'Favorecido não cadastrado!', 2 );
      msk_cd_favorecido.Text := '';
      edt_nm_favorecido.Text := '';
      Consiste               := False;
      msk_cd_favorecido.SetFocus;
      Exit;
    end;
  end;

  // Histórico
  if (Trim( msk_cd_historico.Text ) <> cd_hist_pesq) and (Trim(msk_cd_historico.Text) <> '')  then begin
    msk_cd_historico.Text :=  Copy('000' , 1, 3- Length(Trim(msk_cd_historico.Text))) + Trim(msk_cd_historico.Text);
    edt_nm_historico.Text := ConsultaLookUP('THIST_PADRAO','CD_HISTORICO', msk_cd_historico.Text,'NM_HISTORICO');

    if edt_nm_historico.Text = '' then begin
      BoxMensagem( 'Histórico não cadastrado!', 2 );
      msk_cd_historico.Text := '';
      edt_nm_historico.Text := '';
      Consiste              := False;
      msk_cd_historico.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_pesq_fin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_pesq_fin.FormShow(Sender: TObject);
begin
  pgctrl_pesq_fin.ActivePage     := ts_filtros;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);

  msk_cd_produto.Text := str_cd_produto;
  msk_cd_unid_negExit(nil);

  rdgrp_tp_natureza.ItemIndex    := 0;
  rdgrp_tp_lancamento.ItemIndex  := 0;
  rdgrp_tp_forma_pagto.ItemIndex := 0;

  //verifica permissão odo Cargo para ver tudo ou apenas os selecionados
  VerSelec := ConsultaLookUp('TCARGO', 'CD_CARGO', str_cd_cargo, 'IN_SELECIONADO');
  dbg_fatur.Columns[0].Visible := (VerSelec = '0');
  dbg_fatur.Columns[1].Visible := (VerSelec = '1');
  dbg_contabil.Columns[0].Visible := (VerSelec = '0');
  dbg_contabil.Columns[1].Visible := (VerSelec = '1');
  if VerSelec = '0' then  begin
    dbedt_nr_lanc_contabil.DataField := 'NR_LANCAMENTO';
    dbedt_nr_lanc_fatur.DataField := 'NR_LANCAMENTO';
  end else begin
    dbedt_nr_lanc_contabil.DataField := 'NR_LANCAMENTO_SELECIONADO';
    dbedt_nr_lanc_fatur.DataField := 'NR_LANCAMENTO_SELECIONADO';
  end;

end;

procedure Tfrm_pesq_fin.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_pesq_fin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_pesq_fin.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg    then btn_co_unid_negClick(btn_co_unid_neg);
    if Sender = msk_cd_produto     then btn_co_produtoClick(btn_co_produto);
    if Sender = msk_cd_ct_contabil then btn_co_ct_contabilClick(btn_co_ct_contabil);
    if Sender = msk_cd_item        then btn_co_itemClick(btn_co_item);
    if Sender = msk_nr_processo    then btn_co_processoClick(btn_co_processo);
    if Sender = msk_cd_banco       then btn_co_bancoClick(btn_co_banco);
    if Sender = msk_cd_favorecido  then btn_co_favorecidoClick(btn_co_favorecido);
    if Sender = msk_cd_historico   then btn_co_historicoClick(btn_co_historico);
  end;
end;

procedure Tfrm_pesq_fin.pgctrl_pesq_finChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := Consiste;
  if AllowChange and ( pgctrl_pesq_fin.ActivePage = ts_filtros ) then
     btn_pesquisaClick(nil);
end;

procedure Tfrm_pesq_fin.msk_dt_inicio2Exit(Sender: TObject);
begin
  try
    if msk_dt_inicio.Text <> '  /  /    ' then
    begin
      dt_inicio := StrToDate( msk_dt_inicio.Text );
    end;
  except
    on E: Exception do
    begin
      TrataErro(E);
      msk_dt_inicio.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_pesq_fin.msk_dt_fim2Enter(Sender: TObject);
begin
  if msk_dt_fim.Text <> '  /  /    ' then
  begin
    if dt_inicio > dt_fim then
    begin
      BoxMensagem( 'Data de Vencimento inícial maior que data de Vencimento final!', 2 );
      msk_dt_inicio.Text := '  /  /   ';
      msk_dt_inicio.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_pesq_fin.msk_dt_fim2Exit(Sender: TObject);
begin
  try
    if msk_dt_fim.Text <> '  /  /    ' then
    begin
      dt_fim := StrToDate( msk_dt_fim.Text );
    end;
  except
    on E: Exception do
    begin
      TrataErro(E);
      msk_dt_fim.SetFocus;
      Exit;
    end;
  end;

  if ( msk_dt_inicio.Text <> '  /  /    ' ) and ( msk_dt_fim.Text <> '  /  /    ' ) then
  begin
    if dt_inicio > dt_fim then
    begin
      BoxMensagem( 'Data de Vencimento inicial maior que data de Vencimento final!', 2 );
      msk_dt_inicio.Text := '  /  /    ';
      msk_dt_inicio.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_pesq_fin.btn_co_favorecidoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    msk_cd_favorecido.Text := ConsultaOnLineEx('TFAVORECIDO','Favorecidos',['CD_FAVORECIDO','NM_FAVORECIDO'],['Código','Descrição'],'CD_FAVORECIDO', nil, 1, msk_cd_favorecido.text);
  end else
    edt_nm_favorecido.Text := ConsultaLookUP('TFAVORECIDO','CD_FAVORECIDO', msk_cd_favorecido.Text,'NM_FAVORECIDO');
end;

procedure Tfrm_pesq_fin.btn_co_bancoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    msk_cd_banco.Text := ConsultaOnLineEx('TBANCO','Bancos',['CD_BANCO','NM_BANCO'],['Código','Descrição'],'CD_BANCO', nil, 1, msk_cd_banco.text);
  end else
    edt_nm_banco.Text := ConsultaLookUP('TBANCO','CD_BANCO', msk_cd_banco.Text,'NM_BANCO');
end;

procedure Tfrm_pesq_fin.btn_pesquisaClick(Sender: TObject);
begin
  GeraSqlStr;

  if pgctrl_pesq_fin.ActivePage = ts_filtros then
  begin
    if rdgrp_tp_lancamento.ItemIndex in [0, 1] then
      pgctrl_pesq_fin.ActivePage := ts_adm
    else
      pgctrl_pesq_fin.ActivePage := ts_fat;
  end;
end;

procedure Tfrm_pesq_fin.msk_valorExit(Sender: TObject);
begin
  if msk_valor.Text = '' then Exit;
  vl_lancto := StrToFloat( msk_valor.Text );
  msk_valor.Text := FormatFloat( '0.00', vl_lancto );
end;

procedure Tfrm_pesq_fin.msk_cd_ct_contabilEnter(Sender: TObject);
begin
  cd_ct_contabil_pesq := msk_cd_ct_contabil.Text;
end;

procedure Tfrm_pesq_fin.btn_co_ct_contabilClick(Sender: TObject);
begin
   if Sender is TSpeedButton then
   begin
    msk_cd_ct_contabil.Text := ConsultaOnLineExFiltro('TCT_CONTABIL','Conta Contábil',['CD_CT_CONTABIL','NM_CT_CONTABIL', 'ANO_CONTA'],['Código','Descrição', 'Ano'],'CD_CT_CONTABIL',
                                                      'CD_IDENTIFICADOR = "A" AND ANO_CONTA = YEAR(GETDATE())',  nil, msk_cd_ct_contabil.text);
  end
  else
    edt_nm_ct_contabil.Text := ConsultaLookUpSQL('SELECT NM_CT_CONTABIL FROM TCT_CONTABIL (NOLOCK) ' +
                                                 ' WHERE CD_CT_CONTABIL = ''' + msk_cd_ct_contabil.text + '''  AND CD_IDENTIFICADOR = ''A'' AND ANO_CONTA = YEAR(GETDATE()) ',
                                                 'NM_CT_CONTABIL');
end;

procedure Tfrm_pesq_fin.btn_co_historicoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    msk_cd_historico.Text := ConsultaOnLineEx('THIST_PADRAO','Bancos',['CD_HISTORICO','NM_HISTORICO'],['Código','Descrição'],'CD_HISTORICO', nil, 1, msk_cd_historico.text);
  end else
    edt_nm_historico.Text := ConsultaLookUP('THIST_PADRAO','CD_HISTORICO', msk_cd_historico.Text,'NM_HISTORICO');

end;

procedure Tfrm_pesq_fin.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    msk_cd_produto.Text := ConsultaOnLineExSQL('SELECT (P.CD_PRODUTO) AS PROD, P.AP_PRODUTO FROM TPRODUTO P (NOLOCK) ' +
                                               '  INNER JOIN TUSUARIO_HABILITACAO H (NOLOCK) ON (H.CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''') ' +
                                               ' WHERE H.CD_USUARIO = ''' + str_cd_usuario + ''' ' +
                                               ' GROUP BY P.CD_PRODUTO, P.AP_PRODUTO ',
                                               'Produto',['PROD','AP_PRODUTO'],['Código','Descrição'],'PROD',frm_main.mi_tabela_produto, msk_cd_produto.Text);

  End Else
    edt_nm_produto.Text := ConsultaLookUPSQL('SELECT P.AP_PRODUTO FROM TPRODUTO P (NOLOCK) ' +
                                             '  INNER JOIN TUSUARIO_HABILITACAO H (NOLOCK) ON (H.CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''') ' +
                                             ' WHERE H.CD_USUARIO = ''' + str_cd_usuario + ''' ' +
                                             '   AND P.CD_PRODUTO = ''' + msk_cd_produto.Text + ''' ' +
                                             ' GROUP BY P.AP_PRODUTO',
                                             'AP_PRODUTO');
end;

procedure Tfrm_pesq_fin.btn_co_itemClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    msk_cd_item.Text := ConsultaOnLineEx('TITEM','Itens',['CD_ITEM','NM_ITEM'],['Código','Descrição'],'CD_ITEM', nil, 1, msk_cd_item.text);
  end else
    edt_nm_item.Text := ConsultaLookUP('TITEM','CD_ITEM', msk_cd_item.Text,'NM_ITEM');
end;

procedure Tfrm_pesq_fin.btn_co_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''' + msk_cd_produto.Text  + '''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  msk_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil, msk_nr_processo.Text);
  vListAux.Free;
  Application.ProcessMessages;
end;

procedure Tfrm_pesq_fin.msk_dt_inicioExit(Sender: TObject);
begin
  try
    if msk_dt_inicio.Text <> '  /  /    ' then
    begin
      dt_inicio := StrToDate( msk_dt_inicio.Text );
    end;
  except
    on E: Exception do
    begin
      TrataErro(E);
      msk_dt_inicio.SetFocus;
      Exit;
    end;
  end;
end;


procedure Tfrm_pesq_fin.msk_dt_fimEnter(Sender: TObject);
begin
  if msk_dt_fim.Text <> '  /  /    ' then
  begin
    if dt_inicio > dt_fim then
    begin
      BoxMensagem( 'Data de Vencimento inícial maior que data de Vencimento final!', 2 );
      msk_dt_inicio.Text := '  /  /   ';
      msk_dt_inicio.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_pesq_fin.msk_dt_fimExit(Sender: TObject);
begin
  try
    if msk_dt_fim.Text <> '  /  /    ' then
    begin
      dt_fim := StrToDate( msk_dt_fim.Text );
    end;
  except
    on E: Exception do
    begin
      TrataErro(E);
      msk_dt_fim.SetFocus;
      Exit;
    end;
  end;

  if ( msk_dt_inicio.Text <> '  /  /    ' ) and ( msk_dt_fim.Text <> '  /  /    ' ) then
  begin
    if dt_inicio > dt_fim then
    begin
      BoxMensagem( 'Data de Vencimento inicial maior que data de Vencimento final!', 2 );
      msk_dt_inicio.Text := '  /  /    ';
      msk_dt_inicio.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_pesq_fin.msk_cd_unid_negEnter(Sender: TObject);
begin
  cd_unid_neg_pesq := Trim( msk_cd_unid_neg.Text );
end;

procedure Tfrm_pesq_fin.msk_cd_produtoEnter(Sender: TObject);
begin
  cd_produto_pesq := Trim( msk_cd_produto.Text );
end;

procedure Tfrm_pesq_fin.msk_cd_itemEnter(Sender: TObject);
begin
  cd_item_pesq := Trim( msk_cd_item.Text );
end;

procedure Tfrm_pesq_fin.msk_nr_processoEnter(Sender: TObject);
begin
  nr_processo_pesq := Trim( msk_nr_processo.Text );
end;

procedure Tfrm_pesq_fin.msk_cd_bancoEnter(Sender: TObject);
begin
  cd_banco_pesq := Trim( msk_cd_banco.Text );
end;

procedure Tfrm_pesq_fin.msk_cd_favorecidoEnter(Sender: TObject);
begin
  cd_favorecido_pesq := Trim( msk_cd_favorecido.Text );
end;

procedure Tfrm_pesq_fin.msk_cd_historicoEnter(Sender: TObject);
begin
  cd_hist_pesq := Trim( msk_cd_historico.Text );
end;

procedure Tfrm_pesq_fin.GeraSqlStr;
var
  sqlstr_adm : String;
  sqlstr_fat : String;
begin
  sqlstr_adm := '';
  sqlstr_fat := '';

  // Administrativo 
  if rdgrp_tp_lancamento.ItemIndex in [0, 1] then
  begin
    sqlstr_adm := sqlstr_adm + 'SELECT C.DT_MOVIMENTO, C.NR_LANCAMENTO, C.NR_LANCAMENTO_SELECIONADO, C.CD_UNID_NEG, C.IN_CANCELADO, ' +
                               'C.IN_TRANSFERIDO, C.CD_HIST_PADRAO, C.NM_HISTORICO, C.VL_LANCAMENTO, ' +
                               'C.TP_NATUREZA, C.TP_PAGAMENTO, C.CD_BANCO, C.NR_CHEQUE, C.CD_CT_CONTABIL, ' +
                               'C.CD_FAVORECIDO, C.CD_CT_CUSTO, C.TP_LANCAMENTO, C.IN_CONTABILIZA, ' +
                               'C.TP_PROCEDENCIA, C.CD_FAVORECIDO, C.VL_IR, C.CD_ACESSO, C.CD_AUX, ' +
                               'C.DT_CANCELADO, C.DT_CONCILIACAO, C.IN_SELECIONADO, C.CD_COLIGADA ';
    sqlstr_adm := sqlstr_adm + 'FROM  TCAIXA C (NOLOCK), TUNID_NEG U (NOLOCK)';
    sqlstr_adm := sqlstr_adm + 'WHERE C.CD_UNID_NEG = U.CD_UNID_NEG AND C.TP_LANCAMENTO = "C" ';
    if verSelec = '1' then
      sqlstr_adm := sqlstr_adm + 'AND ISNULL(C.IN_SELECIONADO, "0") = "1" ';


    // Unidade 
    if ( Trim( msk_cd_unid_neg.Text ) <> '' ) then
    begin
      sqlstr_adm := sqlstr_adm + ' AND C.CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '" ';
    end;

    // Conta Contábil 
    if ( Trim( msk_cd_ct_contabil.Text ) <> '' ) then
    begin
      sqlstr_adm := sqlstr_adm + ' AND C.CD_CT_CONTABIL = "' + msk_cd_ct_contabil.Text + '" ';
    end;

    // Valor 
    if ( Trim( msk_valor.Text ) <> '' ) then
    begin
      str_valor := msk_valor.Text;
      if Pos(',', str_valor) > 0 then str_valor[Pos(',', str_valor)] := '.';
      sqlstr_adm := sqlstr_adm + 'AND C.VL_LANCAMENTO = ' + str_valor;
    end;

    // Nº Docto 
    if ( Trim( msk_nr_docto.Text ) <> '' ) then
    begin
      sqlstr_adm := sqlstr_adm + ' AND C.NR_CHEQUE = "' + msk_nr_docto.Text + '" ';
    end;

    // Item 
    if ( Trim( msk_cd_item.Text ) <> '' ) then
    begin
      sqlstr_adm := sqlstr_adm + ' AND C.CD_ITEM = "' + msk_cd_item.Text + '" ';
    end;

    // Por período 
    if msk_dt_inicio.Text <> '  /  /    ' then
    begin
      sqlstr_adm := sqlstr_adm + 'AND CONVERT( datetime, C.DT_MOVIMENTO, 103 ) >= CONVERT( datetime, "' + msk_dt_inicio.Text + '", 103 ) AND ' +
                                 'CONVERT( datetime, C.DT_MOVIMENTO, 103 ) <= CONVERT( datetime, "' + msk_dt_fim.Text + '", 103 ) ';
    end;

    // Banco 
    if ( Trim( msk_cd_banco.Text ) <> '' ) then
    begin
      sqlstr_adm := sqlstr_adm + ' AND C.CD_BANCO = "' + msk_cd_banco.Text + '" ';
    end;

    // Favorecido 
    if ( Trim( msk_cd_favorecido.Text ) <> '' ) then
    begin
      sqlstr_adm := sqlstr_adm + ' AND C.CD_FAVORECIDO = "' + msk_cd_favorecido.Text + '" ';
    end;

    // Histórico 
    if ( Trim( msk_cd_historico.Text ) <> '' ) then
    begin
      sqlstr_adm := sqlstr_adm + ' AND C.CD_HIST_PADRAO = "' + msk_cd_historico.Text + '" ';
    end;

    // Natureza 
    case rdgrp_tp_natureza.ItemIndex of
      1 : sqlstr_adm := sqlstr_adm + ' AND C.TP_NATUREZA = "C" ';
      2 : sqlstr_adm := sqlstr_adm + ' AND C.TP_NATUREZA = "D" ';
    end;

    // Tipo de Pagamento 
    case rdgrp_tp_forma_pagto.ItemIndex of
      1 : sqlstr_adm := sqlstr_adm + ' AND C.TP_PAGAMENTO = "$" ';
      2 : sqlstr_adm := sqlstr_adm + ' AND C.TP_PAGAMENTO = "C" ';
      3 : sqlstr_adm := sqlstr_adm + ' AND C.TP_PAGAMENTO = "T" ';
      4 : sqlstr_adm := sqlstr_adm + ' AND C.TP_PAGAMENTO = "D" ';
      5 : sqlstr_adm := sqlstr_adm + ' AND C.TP_PAGAMENTO = "L" ';
      6 : sqlstr_adm := sqlstr_adm + ' AND C.TP_PAGAMENTO = "O" ';
    end;
    sqlstr_adm := sqlstr_adm + ' ORDER BY C.DT_MOVIMENTO';
  end;

  // ************************************************************************** 
  if rdgrp_tp_lancamento.ItemIndex in [0, 2] then
  begin
    // Faturamento 
    sqlstr_fat := sqlstr_fat + 'SELECT C.DT_MOVIMENTO, C.NR_LANCAMENTO, C.NR_LANCAMENTO_SELECIONADO, C.CD_UNID_NEG, ' +
                               'C.TP_PROCEDENCIA, C.IN_CANCELADO, C.IN_TRANSFERIDO, ' +
                               'C.NM_HISTORICO, C.VL_LANCAMENTO, C.TP_NATUREZA, C.TP_PAGAMENTO, ' +
                               'C.CD_BANCO, C.NR_CHEQUE, C.CD_FAVORECIDO, C.NR_PROCESSO, C.CD_ITEM, C.CD_COLIGADA, ' +
                               'C.VL_IR, C.VL_ASSIST, C.CD_DESPACHANTE, C.TP_LANCAMENTO, C.IN_RESTITUI, C.CD_CT_CONTABIL, C.DT_CONCILIACAO, C.IN_SELECIONADO ';
    sqlstr_fat := sqlstr_fat + 'FROM  TCAIXA C (NOLOCK), TPROCESSO P (NOLOCK), TUNID_NEG U (NOLOCK), TPRODUTO PR (NOLOCK)';
    sqlstr_fat := sqlstr_fat + 'WHERE C.NR_PROCESSO = P.NR_PROCESSO ';
    sqlstr_fat := sqlstr_fat + 'AND C.CD_UNID_NEG = U.CD_UNID_NEG ';
    sqlstr_fat := sqlstr_fat + 'AND P.CD_PRODUTO = PR.CD_PRODUTO ';
    sqlstr_fat := sqlstr_fat + 'AND C.TP_LANCAMENTO = "F" ';
    if verSelec = '1' then
      sqlstr_fat := sqlstr_fat + 'AND ISNULL(C.IN_SELECIONADO, "0") = "1" ';

    // Unidade 
    if ( Trim( msk_cd_unid_neg.Text ) <> '' ) then
    begin
      sqlstr_fat := sqlstr_fat + ' AND C.CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '" ';
    end;

    // Produto 
    if ( Trim( msk_cd_produto.Text ) <> '' ) then
    begin
      sqlstr_fat := sqlstr_fat + ' AND P.CD_PRODUTO = "' + msk_cd_produto.Text + '" ';
    end;

    // Valor 
    if ( Trim( msk_valor.Text ) <> '' ) then
    begin
      str_valor := msk_valor.Text;
      if Pos(',', str_valor) > 0 then str_valor[Pos(',', str_valor)] := '.';
      sqlstr_fat := sqlstr_fat + 'AND C.VL_LANCAMENTO = ' + str_valor;
    end;

    // Nº Docto 
    if ( Trim( msk_nr_docto.Text ) <> '' ) then
    begin
      sqlstr_fat := sqlstr_fat + ' AND C.NR_CHEQUE = "' + msk_nr_docto.Text + '" ';
    end;

    // Item 
    if ( Trim( msk_cd_item.Text ) <> '' ) then
    begin
      sqlstr_fat := sqlstr_fat + ' AND C.CD_ITEM = "' + msk_cd_item.Text + '" ';
    end;

    // Por período 
    if msk_dt_inicio.Text <> '  /  /    ' then
    begin
      sqlstr_fat := sqlstr_fat + 'AND CONVERT( datetime, C.DT_MOVIMENTO, 103 ) >= CONVERT( datetime, "' + msk_dt_inicio.Text + '", 103 ) AND ' +
                                 'CONVERT( datetime, C.DT_MOVIMENTO, 103 ) <= CONVERT( datetime, "' + msk_dt_fim.Text + '", 103 ) ';
    end;

    // Processo 
    if Trim( msk_nr_processo.Text ) <> '' then
    begin
      sqlstr_fat := sqlstr_fat + 'AND C.NR_PROCESSO = "' + Trim( msk_cd_unid_neg.Text ) +
                                                           Trim( msk_cd_produto.Text ) +
                                                           Trim( msk_nr_processo.Text ) + '"';
    end;

    // Banco 
    if ( Trim( msk_cd_banco.Text ) <> '' ) then
    begin
      sqlstr_fat := sqlstr_fat + ' AND C.CD_BANCO = "' + msk_cd_banco.Text + '" ';
    end;

    // Favorecido
    if ( Trim( msk_cd_favorecido.Text ) <> '' ) then
    begin
      sqlstr_fat := sqlstr_fat + ' AND C.CD_FAVORECIDO = "' + msk_cd_favorecido.Text + '" ';
    end;

    // Tipo de Pagamento
    case rdgrp_tp_forma_pagto.ItemIndex of
      1 : sqlstr_fat := sqlstr_fat + ' AND C.TP_PAGAMENTO = "$" ';
      2 : sqlstr_fat := sqlstr_fat + ' AND C.TP_PAGAMENTO = "C" ';
      3 : sqlstr_fat := sqlstr_fat + ' AND C.TP_PAGAMENTO = "T" ';
      4 : sqlstr_fat := sqlstr_fat + ' AND C.TP_PAGAMENTO = "D" ';
      5 : sqlstr_fat := sqlstr_fat + ' AND C.TP_PAGAMENTO = "L" ';
      6 : sqlstr_fat := sqlstr_fat + ' AND C.TP_PAGAMENTO = "O" ';
    end;
    sqlstr_fat := sqlstr_fat + ' ORDER BY C.DT_MOVIMENTO';
  end;

  qry_adm_.Close;
  qry_fat_.Close;

  if sqlstr_adm <> '' then
  begin
    qry_adm_.Close;
    qry_adm_.Sql.Clear;
    qry_adm_.Sql.Add( sqlstr_adm );
    qry_adm_.Prepare;
    qry_adm_.Open;
  end;

  if sqlstr_fat <> '' then
  begin
    qry_fat_.Close;
    qry_fat_.Sql.Clear;
    qry_fat_.Sql.Add( sqlstr_fat );
    qry_fat_.Prepare;
    qry_fat_.Open;
  end;

end;

procedure Tfrm_pesq_fin.ts_admEnter(Sender: TObject);
begin
  pgctrl_contabil.ActivePage := ts_lista_contabil;
end;

procedure Tfrm_pesq_fin.ts_fatEnter(Sender: TObject);
begin
  pgctrl_fatur.ActivePage := ts_lista_fatur;
end;


procedure Tfrm_pesq_fin.qry_adm_CalcFields(DataSet: TDataSet);
begin
  // Unidade de Negócio
  qry_adm_LookUnidNeg.AsString := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', qry_adm_CD_UNID_NEG.AsString ,  'NM_UNID_NEG');
  // Natureza
  qry_adm_LookNatureza.AsString := ConsultaLookUP('TTP_NATUREZA', 'CD_NATUREZA', qry_adm_TP_NATUREZA.AsString, 'NM_NATUREZA' );
  // Cancelado
  if qry_adm_IN_CANCELADO.Text = '1' then qry_adm_LookCancelado.Text := 'Sim'
  else qry_adm_LookCancelado.Text := 'Não';
  // Contabiliza
  if qry_adm_IN_CONTABILIZA.Text = '1' then qry_adm_LookContabiliza.Text := 'Sim'
  else qry_adm_LookContabiliza.Text := 'Não';
  // Favorecido
  qry_adm_LookFavorecido.AsString := ConsultaLookUP('TFAVORECIDO', 'CD_FAVORECIDO', qry_adm_CD_FAVORECIDO.AsString, 'NM_FAVORECIDO');
  // Histórico
  qry_adm_LookHistorico.AsString := ConsultaLookUP('THIST_PADRAO', 'CD_HISTORICO', qry_adm_CD_HIST_PADRAO.AsString, 'NM_HISTORICO' );
  // Banco
  qry_adm_LookBanco.AsString := ConsultaLookUP('TBANCO', 'CD_BANCO', qry_adm_CD_BANCO.AsString , 'NM_BANCO');
  // Conta Custo
  qry_adm_LookCtCusto.AsString := ConsultaLookUP( 'TCT_CUSTO', 'CD_CT_CUSTO', qry_adm_CD_CT_CUSTO.AsString,'NM_CT_CUSTO' );
  // Conta Contábil
  qry_adm_LookCtContabil.AsString :=ConsultaLookUP('TCT_CONTABIL','CD_CT_CONTABIL', qry_adm_CD_CT_CONTABIL.AsString,'NM_CT_CONTABIL');
  //Selecionado
  if qry_adm_IN_SELECIONADO.AsString = '1' then
    qry_adm_calcIN_SELECIONADO.AsString := 'ü'
  else qry_adm_calcIN_SELECIONADO.AsString := '';
end;

procedure Tfrm_pesq_fin.qry_fat_CalcFields(DataSet: TDataSet);
begin
  //Unidade de negócio
  qry_fat_LookUnidNeg.AsString := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', qry_fat_CD_UNID_NEG.AsString ,  'NM_UNID_NEG');
  //Cód Poduto
  qry_fat_LookCdProduto.AsString := ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', qry_fat_NR_PROCESSO.AsString ,  'CD_PRODUTO');
  //Nome Produto
  qry_fat_LookProduto.AsString := ConsultaLookUP('TPRODUTO', 'CD_PRODUTO', qry_fat_LookCdProduto.AsString, 'NM_PRODUTO');
  //Favorecido
  qry_fat_LookFavorecido.AsString := ConsultaLookUP('TFAVORECIDO', 'CD_FAVORECIDO', qry_fat_CD_FAVORECIDO.AsString, 'NM_FAVORECIDO');
  //Banco
  qry_fat_LookBanco.AsString := ConsultaLookUP('TBANCO', 'CD_BANCO', qry_fat_CD_BANCO.AsString , 'NM_BANCO');
  //Cancelado
  if qry_fat_IN_CANCELADO.Text = '1' then qry_fat_LookCancelado.Text := 'Sim'
  else qry_fat_LookCancelado.Text := 'Não';
  //item
  qry_fat_LookItem.AsString := ConsultaLookUP('TITEM', 'CD_ITEM',qry_fat_CD_ITEM.AsString ,'NM_ITEM');
  //Despachante
  qry_fat_LookDespachante.AsString := ConsultaLookUP('TDESPACHANTE','CD_DESPACHANTE', qry_fat_CD_DESPACHANTE.AsString,'NM_DESPACHANTE');
  //Restitui
  if qry_fat_IN_RESTITUI.Text = '1' then qry_fat_LookRestitui.Text := 'Sim'
  else qry_fat_LookRestitui.Text := 'Não';
  //Cód Cliente
  qry_fat_LookCdCliente.AsString := ConsultaLookUP('TPROCESSO','NR_PROCESSO', qry_fat_NR_PROCESSO.AsString,'CD_CLIENTE');
  //Cliente
  qry_fat_LookCliente.AsString   := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA', qry_fat_LookCdCliente.AsString,'NM_EMPRESA');
  //Nr. Processo
  qry_fat_CalcNrProcesso.AsString := Copy( qry_fat_NR_PROCESSO.AsString, 5, 14 );
  //Contra Partida
  qry_fat_LookContabil.AsString := ConsultaLookUP('TCT_CONTABIL','CD_CT_CONTABIL', qry_fat_CD_CT_CONTABIL.AsString,'NM_CT_CONTABIL');
  //Selecionado
  if qry_fat_IN_SELECIONADO.AsString = '1' then
    qry_fat_calcIN_SELECIONADO.AsString := 'ü'
  else qry_fat_calcIN_SELECIONADO.AsString := '';


end;

procedure Tfrm_pesq_fin.dbg_faturDblClick(Sender: TObject);
var
  vDataOld : TDateTime;
  vColigadaOld, vLanctoOld, vChangeTo: string;
begin
  if dbg_fatur.SelectedField.Name = 'qry_fat_calcIN_SELECIONADO' then
  begin
    vDataOld       := qry_fat_DT_MOVIMENTO.AsDateTime;
    vLanctoOld     := qry_fat_NR_LANCAMENTO.AsString;
    vColigadaOld := qry_fat_CD_COLIGADA.AsString;
    qry_fat_.DisableControls;
    if qry_fat_IN_SELECIONADO.AsString = '1' then
      vChangeTo := '0'
    else vChangeTo := '1';
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('UPDATE TCAIXA SET IN_SELECIONADO = ''' + vChangeTo + '''');
      SQL.Add(' WHERE DT_MOVIMENTO = :MOV AND NR_LANCAMENTO = :LANCTO ');
      SQL.Add('   AND CD_COLIGADA = :COLIG ');
      ParamByName('MOV').AsString    := qry_fat_DT_MOVIMENTO.AsString;
      ParamByName('LANCTO').AsString  := qry_fat_NR_LANCAMENTO.AsString;
      ParamByName('COLIG').AsString := qry_fat_CD_COLIGADA.AsString;
      ExecSQL;
      Free;
    end;
    GeraSqlStr;
    qry_fat_.Locate('DT_MOVIMENTO;NR_LANCAMENTO;CD_COLIGADA', VarArrayOf([vDataOld, vlanctoOld, vColigadaOld]), [loPartialKey]);
    qry_fat_.EnableControls;
  end;

end;

procedure Tfrm_pesq_fin.dbg_contabilDblClick(Sender: TObject);
var
  vDataOld : TDateTime;
  vColigadaOld, vLanctoOld, vChangeTo: string;
begin
  if dbg_contabil.SelectedField.Name = 'qry_adm_calcIN_SELECIONADO' then
  begin
    vDataOld       := qry_adm_DT_MOVIMENTO.AsDateTime;
    vLanctoOld     := qry_adm_NR_LANCAMENTO.AsString;
    vColigadaOld   := qry_adm_CD_COLIGADA.AsString;
    qry_adm_.DisableControls;
    if qry_adm_IN_SELECIONADO.AsString = '1' then
      vChangeTo := '0'
    else vChangeTo := '1';
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('UPDATE TCAIXA SET IN_SELECIONADO = ''' + vChangeTo + '''');
      SQL.Add(' WHERE DT_MOVIMENTO = :MOV AND NR_LANCAMENTO = :LANCTO ');
      SQL.Add('   AND CD_COLIGADA = :COLIG ');
      ParamByName('MOV').AsString    := qry_adm_DT_MOVIMENTO.AsString;
      ParamByName('LANCTO').AsString  := qry_adm_NR_LANCAMENTO.AsString;
      ParamByName('COLIG').AsString := qry_adm_CD_COLIGADA.AsString;
      ExecSQL;
      Free;
    end;
    GeraSqlStr;
    qry_adm_.Locate('DT_MOVIMENTO;NR_LANCAMENTO;CD_COLIGADA', VarArrayOf([vDataOld, vlanctoOld, vColigadaOld]), [loPartialKey]);
    qry_adm_.EnableControls;
  end;


end;

end.
