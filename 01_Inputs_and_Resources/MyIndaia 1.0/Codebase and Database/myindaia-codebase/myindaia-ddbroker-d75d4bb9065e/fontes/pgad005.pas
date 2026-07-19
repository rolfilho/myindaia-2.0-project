unit pgad005;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Mask, Db, DBCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  ComCtrls;

type
  Tfrm_pesq_solic_ch1 = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    menu_cadastro: TMainMenu;
    mi_sair: TMenuItem;
    btn_pesq_solic_ch: TSpeedButton;
    pgctrl_solic_ch: TPageControl;
    ts_lista: TTabSheet;
    lbl_dt_inicio: TLabel;
    lbl_dt_termino: TLabel;
    dbgrdSolicCheque: TDBGrid;
    msk_dt_inicio: TMaskEdit;
    msk_dt_termino: TMaskEdit;
    ts_solic_ch_: TTabSheet;
    pnl_solic_ch: TPanel;
    lbl_nr_solic_ch: TLabel;
    lbl_dt_solic_ch: TLabel;
    lbl_hm_solic_ch: TLabel;
    lbl_vl_solic_ch: TLabel;
    lbl_nr_cheque2: TLabel;
    lbl_status_cheque: TLabel;
    lbl_banco2: TLabel;
    lbl_favorecido2: TLabel;
    dbedt_nr_solic_ch: TDBEdit;
    dbedt_dt_solic_ch: TDBEdit;
    dbedt_hm_solic_ch: TDBEdit;
    dbedt_vl_solic_ch: TDBEdit;
    dbedt_nr_cheque: TDBEdit;
    dblckbox_status_solic_ch: TDBLookupComboBox;
    dbedt_cd_banco: TDBEdit;
    dbedt_nm_banco: TDBEdit;
    dbedt_cd_favorecido: TDBEdit;
    dbedt_nm_favorecido: TDBEdit;
    pnl_solic_ch_itens: TPanel;
    pgctrl_solic_ch_itens: TPageControl;
    ts_lista2: TTabSheet;
    dbg_contatos: TDBGrid;
    ts_solic_ch_itens: TTabSheet;
    lbl_unid_neg: TLabel;
    lbl_produto: TLabel;
    lbl_processo: TLabel;
    lbl_cliente3: TLabel;
    lbl_servico: TLabel;
    lbl_item2: TLabel;
    lbl_vl_item2: TLabel;
    lbl_vl_ir: TLabel;
    lbl_vl_assist: TLabel;
    lbl_despachante: TLabel;
    lbl_status2: TLabel;
    dbedt_vl_item: TDBEdit;
    dbedt_vl_ir: TDBEdit;
    dbedt_vl_assist: TDBEdit;
    dbedt_cd_item: TDBEdit;
    dbedt_nm_item: TDBEdit;
    dbedt_cd_despachante: TDBEdit;
    dbedt_nm_despachante: TDBEdit;
    dblckbox_st_solic_ch_itens: TDBLookupComboBox;
    lbl_favorecido: TLabel;
    btn_co_favorecido: TSpeedButton;
    msk_cd_favorecido: TMaskEdit;
    edt_nm_favorecido: TEdit;
    dbedt_nr_processo: TDBEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    edt_nm_produto: TEdit;
    msk_cd_produto: TMaskEdit;
    lbl_nr_processo: TLabel;
    msk_nr_processo: TMaskEdit;
    mi_pesq_solic: TMenuItem;
    dbnvg: TDBNavigator;
    msk_cd_cliente2: TMaskEdit;
    edt_nm_cliente2: TEdit;
    msk_cd_servico: TMaskEdit;
    edt_nm_servico: TEdit;
    btn_cancela: TSpeedButton;
    mi_cancela: TMenuItem;
    procedure msk_dt_inicioExit(Sender: TObject);
    procedure msk_dt_terminoExit(Sender: TObject);
    procedure msk_dt_terminoEnter(Sender: TObject);
    procedure msk_cd_usuarioExit(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure msk_cd_itemExit(Sender: TObject);
    procedure msk_cd_bancoExit(Sender: TObject);
    procedure msk_cd_favorecidoExit(Sender: TObject);
    procedure btn_co_usuarioClick(Sender: TObject);
    procedure btn_co_cliente2Click(Sender: TObject);
    procedure btn_co_item2Click(Sender: TObject);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure btn_co_favorecidoClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_pesq_solic_chClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure msk_vl_solic_chExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblckbox_cd_statusClick(Sender: TObject);
    procedure dbedt_nr_processoChange(Sender: TObject);
    procedure btn_cancelaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_clienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_unidadeExit(Sender: TObject);
    procedure msk_cd_prodExit(Sender: TObject);
    procedure btn_co_unidadeClick(Sender: TObject);
    procedure btn_co_prodClick(Sender: TObject);
    function Consiste : Boolean;
    procedure pgctrl_solic_chChanging(Sender: TObject;
      var AllowChange: Boolean);
  private
    dt_inicio, dt_termino : TDate;
    vl_item : Double;
    str_status : String;
    lCancela_Cheque : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pesq_solic_ch1: Tfrm_pesq_solic_ch1;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGCH003, PGSM016, PGSM041, PGSM059, PGSM090, PGSM104,
  PGSM018, PGSM010;

procedure Tfrm_pesq_solic_ch1.msk_dt_inicioExit(Sender: TObject);
begin
  try
    if msk_dt_inicio.Text <> '  /  /    ' then
    begin
      dt_inicio := StrToDate(msk_dt_inicio.Text);
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

procedure Tfrm_pesq_solic_ch1.msk_dt_terminoExit(Sender: TObject);
begin
  try
    if msk_dt_termino.Text <> '  /  /    ' then
    begin
      dt_termino := StrToDate(msk_dt_termino.Text);
    end;
  except
    on E: Exception do
    begin
      TrataErro(E);
      msk_dt_termino.SetFocus;
      Exit;
    end;
  end;

  if ( msk_dt_inicio.Text <> '  /  /    ' ) and ( msk_dt_termino.Text <> '  /  /    ' ) then
  begin
    if dt_inicio > dt_termino then
    begin
      BoxMensagem('Data de início maior que data de término!', 2);
      msk_dt_inicio.Text := '  /  /    ';
      msk_dt_inicio.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_pesq_solic_ch1.msk_dt_terminoEnter(Sender: TObject);
begin
  if msk_dt_termino.Text <> '  /  /    ' then
  begin
    if dt_inicio > dt_termino then
    begin
      BoxMensagem('Data de início maior que data de término!', 2);
      msk_dt_inicio.Text := '  /  /   ';
      msk_dt_inicio.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_pesq_solic_ch1.msk_cd_usuarioExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_solic_ch1.msk_cd_clienteExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_solic_ch1.msk_cd_itemExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_solic_ch1.msk_cd_bancoExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_solic_ch1.msk_cd_favorecidoExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_solic_ch1.btn_co_usuarioClick(Sender: TObject);
begin
  with datm_pesq_solic_ch Do
  begin
    Application.CreateForm(Tfrm_usuario, frm_usuario );
    With frm_usuario Do
    Begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_usuario.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_usuario.Text := frm_usuario.Cons_OnLine_Texto;
      msk_cd_usuarioExit(nil);
    end;
  end;
end;

procedure Tfrm_pesq_solic_ch1.btn_co_cliente2Click(Sender: TObject);
begin
  with datm_pesq_solic_ch Do
  begin
    Application.CreateForm(Tfrm_cliente_co, frm_cliente_co );
    With frm_cliente_co Do
    Begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_cliente_co.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_cliente.Text := frm_cliente_co.Cons_OnLine_Texto;
      msk_cd_clienteExit(nil);
    end;
  end;
end;

procedure Tfrm_pesq_solic_ch1.btn_co_item2Click(Sender: TObject);
begin
  with datm_pesq_solic_ch Do
  begin
    Application.CreateForm(Tfrm_item, frm_item );
    With frm_item Do
    Begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_item.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_item.Text := frm_item.Cons_OnLine_Texto;
      msk_cd_itemExit(nil);
    end;
  end;
end;

procedure Tfrm_pesq_solic_ch1.btn_co_bancoClick(Sender: TObject);
begin
  with datm_pesq_solic_ch Do
  begin
    Application.CreateForm(Tfrm_banco, frm_banco );
    With frm_banco Do
    Begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_banco.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_banco.Text := frm_banco.Cons_OnLine_Texto;
      msk_cd_bancoExit(nil);
    end;
  end;
end;

procedure Tfrm_pesq_solic_ch1.btn_co_favorecidoClick(Sender: TObject);
begin
  with datm_pesq_solic_ch Do
  begin
    Application.CreateForm(Tfrm_Favor, frm_Favor );
    With frm_Favor Do
    Begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_Favor.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_favorecido.Text := frm_Favor.Cons_OnLine_Texto;
      msk_cd_favorecidoExit(nil);
    end;
  end;
end;

procedure Tfrm_pesq_solic_ch1.btn_sairClick(Sender: TObject);
begin
  Close;
end;

{$HINTS OFF}
procedure Tfrm_pesq_solic_ch1.btn_pesq_solic_chClick(Sender: TObject);
var
   numCondicoes : Integer;
   str_valor, my_sql : String;
   lSimples : Boolean;
begin
  {Possui Término mas não Início}
  if ( msk_dt_inicio.Text = '  /  /    ' ) and ( msk_dt_termino.Text <> '  /  /    ' ) then
  begin
    BoxMensagem('Selecione a data de início!', 2);
    msk_dt_inicio.SetFocus;
    Exit;
  end;

  { Possui Início mas não Término }
  if ( msk_dt_inicio.Text <> '  /  /    ' ) and ( msk_dt_termino.Text = '  /  /    ' ) then
  begin
    BoxMensagem('Selecione a data de término!', 2);
    msk_dt_termino.SetFocus;
    Exit;
  end;

  { Data de Início maior que a Data de Término }
  if ( msk_dt_inicio.Text <> '  /  /    ' ) and ( msk_dt_termino.Text <> '  /  /    ' ) then
  begin
    if dt_inicio > dt_termino then
    begin
      BoxMensagem('Data de início maior que data de término!', 2);
      msk_dt_inicio.Text := '  /  /    ';
      msk_dt_inicio.SetFocus;
      Exit;
    end;
  end;

  numCondicoes := 0;
  my_sql       := '';
  lSimples     := True;

  datm_pesq_solic_ch.qry_solic_ch_.Close;

  {Por período}
  if msk_dt_inicio.Text <> '  /  /    ' then
  begin
    if numCondicoes = 0 then my_sql := 'WHERE '
    else my_sql := my_sql + 'AND ';
    my_sql := my_sql +
    'CONVERT(datetime, SC.DT_SOLIC_CH, 103 ) >= CONVERT(datetime, "' + msk_dt_inicio.Text + '", 103 ) AND ' +
    'CONVERT(datetime, SC.DT_SOLIC_CH, 103 ) <= CONVERT(datetime, "' + msk_dt_termino.Text + '", 103 ) ';
    numCondicoes := numCondicoes + 1;
  end;

  {Por processo}
  if msk_nr_processo.Text <> '' then
  begin
    if numCondicoes = 0 then my_sql := 'WHERE '
    else my_sql := my_sql + 'AND ';
    datm_pesq_solic_ch.qry_solic_ch_.SQL[4] :=
       'FROM TSOLIC_CHEQUE SC, TSOLIC_CHEQUE_ITENS SCI, TUSUARIO U';
    my_sql := my_sql +
       'SC.DT_SOLIC_CH  = SCI.DT_SOLIC_CH AND SC.NR_SOLIC_CH = SCI.NR_SOLIC_CH AND ' +
       'SCI.NR_PROCESSO LIKE "%' + msk_nr_processo.Text + '"';
    lSimples     := False;
    numCondicoes := numCondicoes + 1;
  end;

  {Por item}
  if msk_cd_item.Text <> '' then
  begin
    if numCondicoes = 0 then my_sql := 'WHERE '
    else my_sql := my_sql + 'AND ';
    datm_pesq_solic_ch.qry_solic_ch_.SQL[4] :=
       'FROM TSOLIC_CHEQUE SC, TSOLIC_CHEQUE_ITENS SCI, TUSUARIO U';
    my_sql := my_sql +
       'SC.DT_SOLIC_CH  = SCI.DT_SOLIC_CH AND SC.NR_SOLIC_CH = SCI.NR_SOLIC_CH AND ' +
       'SCI.CD_ITEM = "' + msk_cd_item.Text + '" ';
    lSimples     := False;
    numCondicoes := numCondicoes + 1;
  end;

  {Por Unidade de Negócio}
  if msk_cd_unidade.Text <> '' then
  begin
    if numCondicoes = 0 then my_sql := 'WHERE '
    else my_sql := my_sql + 'AND ';
    datm_pesq_solic_ch.qry_solic_ch_.SQL[4] :=
       'FROM TSOLIC_CHEQUE SC, TSOLIC_CHEQUE_ITENS SCI, TPROCESSO P, TUSUARIO U';
    my_sql := my_sql +
       'SC.DT_SOLIC_CH  = SCI.DT_SOLIC_CH AND SC.NR_SOLIC_CH = SCI.NR_SOLIC_CH AND ' +
       'SCI.NR_PROCESSO = P.NR_PROCESSO AND P.CD_UNID_NEG = "' + msk_cd_unidade.Text + '"';
    lSimples     := False;
    numCondicoes := numCondicoes + 1;
  end;

  {Por Produto}
  if msk_cd_prod.Text <> '' then
  begin
    if numCondicoes = 0 then my_sql := 'WHERE '
    else my_sql := my_sql + 'AND ';
    datm_pesq_solic_ch.qry_solic_ch_.SQL[4] :=
       'FROM TSOLIC_CHEQUE SC, TSOLIC_CHEQUE_ITENS SCI, TPROCESSO P, TUSUARIO U';
    my_sql := my_sql +
       'SC.DT_SOLIC_CH  = SCI.DT_SOLIC_CH AND SC.NR_SOLIC_CH = SCI.NR_SOLIC_CH AND ' +
       'SCI.NR_PROCESSO = P.NR_PROCESSO AND P.CD_PRODUTO = "' + msk_cd_prod.Text + '"';
    lSimples     := False;
    numCondicoes := numCondicoes + 1;
  end;

  {Por usuário}
  if msk_cd_usuario.Text <> '' then
  begin
    if numCondicoes = 0 then my_sql := 'WHERE '
    else my_sql := my_sql + 'AND ';
    my_sql := my_sql +
    'SC.CD_USUARIO = "' + msk_cd_usuario.Text + '"';
    numCondicoes := numCondicoes + 1;
  end;

  {Por cliente}
  if msk_cd_cliente.Text <> '' then
  begin
    if numCondicoes = 0 then my_sql := 'WHERE '
    else my_sql := my_sql + 'AND ';
    datm_pesq_solic_ch.qry_solic_ch_.SQL[4] :=
       'FROM TSOLIC_CHEQUE SC, TSOLIC_CHEQUE_ITENS SCI, TPROCESSO P, TUSUARIO U';
    my_sql := my_sql +
       'SC.DT_SOLIC_CH  = SCI.DT_SOLIC_CH AND SC.NR_SOLIC_CH = SCI.NR_SOLIC_CH AND ' +
       'SCI.NR_PROCESSO = P.NR_PROCESSO AND P.CD_CLIENTE = "' + msk_cd_cliente.Text + '"';
    lSimples     := False;
    numCondicoes := numCondicoes + 1;
  end;

  {Por Valor da Solicitação}
  if msk_vl_solic_ch.Text <> '' then
  begin
    if numCondicoes = 0 then my_sql := 'WHERE '
    else my_sql := my_sql + 'AND ';
    str_valor := msk_vl_solic_ch.Text;
    if Pos(',', str_valor) > 0 Then str_valor[Pos(',', str_valor)] := '.';
    my_sql := my_sql + 'SC.VL_SOLIC_CH = ' + str_valor;
    numCondicoes := numCondicoes + 1;
  end;

  {Por banco}
  if msk_cd_banco.Text <> '' then
  begin
    if numCondicoes = 0 then my_sql := 'WHERE '
    else my_sql := my_sql + 'AND ';
    my_sql := my_sql +
    'SC.CD_BANCO = "' + msk_cd_banco.Text + '"';
    numCondicoes := numCondicoes + 1;
  end;

  {Por Favorecido}
  if msk_cd_favorecido.Text <> '' then
  begin
    if numCondicoes = 0 then my_sql := 'WHERE '
    else my_sql := my_sql + 'AND ';
    my_sql := my_sql +
    'SC.CD_FAVORECIDO = "' + msk_cd_favorecido.Text + '"';
    numCondicoes := numCondicoes + 1;
  end;

  {Por Status}
  if ( str_status <> 'X' ) and ( str_status <> '' ) then
  begin
    if numCondicoes = 0 then my_sql := 'WHERE '
    else my_sql := my_sql + 'AND ';
    my_sql := my_sql +
    'SC.CD_STATUS_SOLIC_CH = "' + str_status + '"';
    numCondicoes := numCondicoes + 1;
  end;

  {Por Nº Cheque}
  if msk_nr_cheque.Text <> '' then
  begin
    if numCondicoes = 0 then my_sql := 'WHERE '
    else my_sql := my_sql + 'AND ';
    my_sql := my_sql +
    'SC.NR_CHEQUE = "' + msk_nr_cheque.Text + '"';
    numCondicoes := numCondicoes + 1;
  end;

  if lCancela_Cheque then
  begin
    if numCondicoes = 0 then my_sql := 'WHERE '
    else my_sql := my_sql + 'AND ';
    my_sql := my_sql + '(SC.CD_STATUS_CHEQUE = "1" OR SC.CD_STATUS_CHEQUE = "2") ';
  end;

  {Cheque/Débito em Conta}
  if numCondicoes = 0 then
    my_sql := my_sql +' WHERE SC.DT_SOLIC_CH <> "" AND SC.CD_TIPO_LANC = "' + str_cd_tipo_lanc + '" '
  else
    my_sql := my_sql + 'AND SC.CD_TIPO_LANC = "' + str_cd_tipo_lanc + '" ';
  {Usuário}
  my_sql := my_sql + 'AND SC.CD_USUARIO = U.CD_USUARIO AND ' +
                     '( U.CD_CARGO IN ( SELECT CD_DESCENDENTE ' +
                      ' FROM TCARGO_DESCENDENTE ' +
                      ' WHERE CD_CARGO = "' + str_cd_cargo + '" AND ' +
                      ' CD_CARGO <> CD_DESCENDENTE  ) OR ' +
                      ' SC.CD_USUARIO = "' + str_cd_usuario + '")';

  datm_pesq_solic_ch.qry_solic_ch_.SQL[5] := my_sql;

  if lSimples then datm_pesq_solic_ch.qry_solic_ch_.SQL[4] := 'FROM TSOLIC_CHEQUE SC, TUSUARIO U';

  datm_pesq_solic_ch.qry_solic_ch_.Prepare;
  datm_pesq_solic_ch.qry_solic_ch_.Open;
end;
{$HINTS ON}

procedure Tfrm_pesq_solic_ch1.FormCreate(Sender: TObject);
begin
  lCancela_Cheque := False;
  { Cria o DataModule de Dados de Solicitação de Cheque }
  Application.CreateForm(Tdatm_pesq_solic_ch, datm_pesq_solic_ch );

  with datm_pesq_solic_ch do
  begin
    tbl_status_solic_ch_.Open;

    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;

    qry_banco_.Close;
    qry_banco_.Prepare;
    qry_banco_.Open;

    qry_emp_nac_.Close;
    qry_emp_nac_.Prepare;
    qry_emp_nac_.Open;

    qry_favorecido_.Close;
    qry_favorecido_.Prepare;
    qry_favorecido_.Open;

    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;

    qry_usuario_.Close;
    qry_usuario_.Prepare;
    qry_usuario_.Open;
  end;

end;

procedure Tfrm_pesq_solic_ch1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  with datm_pesq_solic_ch do
  begin
    tbl_status_solic_ch_.Close;

    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_banco_.Close;
    qry_emp_nac_.Close;
    qry_favorecido_.Close;
    qry_item_.Close;
    qry_usuario_.Close;
    qry_solic_ch_.Close;
    qry_solic_ch_itens_.Close;
    Destroy;
  end;
  Action := caFree;
end;

procedure Tfrm_pesq_solic_ch1.msk_vl_solic_chExit(Sender: TObject);
begin
  if msk_vl_solic_ch.Text = '' then Exit;
  vl_item := StrToFloat( msk_vl_solic_ch.Text );
  msk_vl_solic_ch.Text := FormatFloat('0.00', vl_item);
end;

procedure Tfrm_pesq_solic_ch1.FormShow(Sender: TObject);
begin
  if str_cd_tipo_lanc = '1' Then
  begin
    Caption            := 'Pesquisa Solicitação de Cheque';
    mi_cancela.Caption := '&Cancela Cheque';
    btn_cancela.Hint   := 'Cancela Cheque';
  end
  else
  begin
    Caption            := 'Pesquisa Solicitação de Autorização para Débito em Conta';
    mi_cancela.Caption := '&Cancela Débito em Conta';
    btn_cancela.Hint   := 'Cancela Débito em Conta';
  end;
  pgctrl_solic_ch.ActivePage := ts_lista;
  msk_cd_unidade.Text        := str_cd_unid_neg;
  msk_cd_prod.Text           := str_cd_produto;
  msk_dt_inicio.SetFocus;
  Consiste;
end;

procedure Tfrm_pesq_solic_ch1.dblckbox_cd_statusClick(Sender: TObject);
begin
  str_status := datm_pesq_solic_ch.tbl_status_solic_ch_CODIGO.AsString;
end;

procedure Tfrm_pesq_solic_ch1.dbedt_nr_processoChange(Sender: TObject);
begin
  if dbedt_nr_processo.Text <> '' then
  begin
    with datm_pesq_solic_ch do
    begin
      qry_proc_co_.Close;
      qry_proc_co_.ParamByName('NR_PROCESSO').AsString := qry_solic_ch_itens_NR_PROCESSO.AsString;
      qry_proc_co_.Prepare;
      qry_proc_co_.Open;
      if ( qry_proc_co_.Locate('NR_PROCESSO', qry_solic_ch_itens_NR_PROCESSO.AsString, [loCaseInsensitive]) ) then
      begin
        msk_cd_unid_neg.Text := qry_proc_co_CD_UNID_NEG.AsString;
        edt_nm_unid_neg.Text := qry_proc_co_LookUnidade.AsString;
        msk_cd_produto.Text  := qry_proc_co_CD_PRODUTO.AsString;
        edt_nm_produto.Text  := qry_proc_co_LookProduto.AsString;
        msk_cd_cliente2.Text := qry_proc_co_CD_CLIENTE.AsString;
        edt_nm_cliente2.Text := qry_proc_co_LookCliente.AsString;
        msk_cd_servico.Text  := qry_proc_co_CD_SERVICO.AsString;
        edt_nm_servico.Text  := qry_proc_co_LookServico.AsString;
      end
      else
      begin
        BoxMensagem('Processo não cadastrado ou não liberado!', 2);
        msk_nr_processo.SetFocus;
      end
    end;
  end;
end;

procedure Tfrm_pesq_solic_ch1.btn_cancelaClick(Sender: TObject);
var
  str_operador : String;
begin
  if str_cd_tipo_lanc = '1' then str_operador := 'Cheque '
  else str_operador := 'Débito em C/C ';
  if datm_pesq_solic_ch.qry_solic_ch_.State in [dsInactive] then Exit;
  if ( ( ( str_cd_tipo_lanc = '1' ) and  {Cheque}
         ( ( datm_pesq_solic_ch.qry_solic_ch_CD_STATUS_CHEQUE.AsString = '1' ) or {Emitido}
           ( datm_pesq_solic_ch.qry_solic_ch_CD_STATUS_CHEQUE.AsString = '2' ) ) ) or {Reemitido}
       ( ( str_cd_tipo_lanc = '2' ) ) ) and
     ( ( datm_pesq_solic_ch.qry_solic_ch_CD_STATUS_SOLIC_CH.AsString <> '6' ) and {Cancelado pelo Solicitante}
     ( datm_pesq_solic_ch.qry_solic_ch_CD_STATUS_SOLIC_CH.AsString <> '7' ) ) then {Cancelado pelo Sistema}
  begin
    if BoxMensagem( str_operador + 'será cancelado!' + #13#10 +
       'Confirma Cancelamento?', 1) then
    begin
      with datm_pesq_solic_ch do
      begin
        try
          datm_main.db_broker.StartTransaction;

          CloseStoredProc(sp_cancela_solic_ch);
          sp_cancela_solic_ch.ParamByName('@DT_SOLIC_CH').AsString := qry_solic_ch_DT_SOLIC_CH.AsString;
          sp_cancela_solic_ch.ParamByName('@NR_SOLIC_CH').AsString := qry_solic_ch_NR_SOLIC_CH.AsString;
          sp_cancela_solic_ch.ParamByName('@CD_USUARIO').AsString  := str_cd_usuario;
          qry_solic_ch_.Close;
          qry_solic_ch_itens_.Close;
          ExecStoredProc(sp_cancela_solic_ch);
          btn_pesq_solic_chClick(nil);
          CloseStoredProc(sp_cancela_solic_ch);
          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            TrataErro(E);
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          end;
        end;
      end;
    end;
  end
  else
  begin
    BoxMensagem(str_operador + 'não pode ser cancelado!', 2);
  end;
end;

procedure Tfrm_pesq_solic_ch1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #27 then Close;
end;

procedure Tfrm_pesq_solic_ch1.msk_cd_clienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = VK_F5 then
  begin
    if Sender = msk_cd_unidade    then btn_co_unidadeClick(nil);
    if Sender = msk_cd_prod       then btn_co_prodClick(nil);
    if Sender = msk_cd_cliente    then btn_co_cliente2Click(nil);
    if Sender = msk_cd_banco      then btn_co_bancoClick(nil);
    if Sender = msk_cd_usuario    then btn_co_usuarioClick(nil);
    if Sender = msk_cd_item       then btn_co_item2Click(nil);
    if Sender = msk_cd_favorecido then btn_co_favorecidoClick(nil);
  end;
end;

procedure Tfrm_pesq_solic_ch1.msk_cd_unidadeExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_solic_ch1.msk_cd_prodExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_solic_ch1.btn_co_unidadeClick(Sender: TObject);
begin
  str_cd_modulo := '23';
  str_cd_rotina := '2301';

  Application.CreateForm(Tfrm_unidade, frm_unidade);

  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_unidade.Text := frm_unidade.Cons_OnLine_Texto;

  msk_cd_unidadeExit(nil);

end;

procedure Tfrm_pesq_solic_ch1.btn_co_prodClick(Sender: TObject);
begin
  str_cd_modulo := '23';
  str_cd_rotina := '2302';

  Application.CreateForm(Tfrm_produto, frm_produto);

  with frm_produto do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_prod.Text := frm_produto.Cons_OnLine_Texto;
  msk_cd_prodExit(nil);
end;

function Tfrm_pesq_solic_ch1.Consiste : Boolean;
begin
  Consiste := True;
  {Usuário}
  if msk_cd_usuario.Text <> '' then
  begin
    ValCodEdt( msk_cd_usuario );
    with datm_pesq_solic_ch do
    begin
      qry_usuario_.Close;
      qry_usuario_.SQL[2] := 'WHERE CD_USUARIO = "' + msk_cd_usuario.Text + '"';
      qry_usuario_.Prepare;
      qry_usuario_.Open;
      if ( qry_usuario_.Locate('CD_USUARIO', msk_cd_usuario.Text, [loCaseInsensitive]) ) then
      begin
        edt_nm_usuario.Text := qry_usuario_NM_USUARIO.AsString;
      end
      else
      begin
        BoxMensagem('Usuário não cadastrado!', 2);
        msk_cd_usuario.SetFocus;
        Consiste := False;
        Exit;
      end;
      qry_usuario_.Close;
      qry_usuario_.SQL[2] := 'WHERE CD_USUARIO <> ""';
      qry_usuario_.Prepare;
      qry_usuario_.Open;
    end;
  end
  else
  begin
    edt_nm_usuario.Text := '';
  end;

  {Unidade}
  if msk_cd_unidade.Text <> '' then
  begin
    ValCodEdt( msk_cd_unidade);
    with datm_pesq_solic_ch do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if ( qry_unid_neg_.Locate('CD_UNID_NEG', msk_cd_unidade.Text, [loCaseInsensitive]) ) then
      begin
        edt_nm_unidade.Text := qry_unid_neg_NM_UNID_NEG.AsString;
      end
      else
      begin
        BoxMensagem('Unidade de Negócio não cadastrada!', 2);
        msk_cd_unidade.SetFocus;
        Consiste := False;
        Exit;
      end
    end;
  end
  else
  begin
    edt_nm_unidade.Text := '';
  end;

  {Produto}
  if msk_cd_prod.Text <> '' then
  begin
    ValCodEdt( msk_cd_prod );
    with datm_pesq_solic_ch do
    begin
      qry_produto_.Close;
      qry_produto_.SQL[2] := 'WHERE CD_PRODUTO = "' + msk_cd_prod.Text + '"';
      qry_produto_.Prepare;
      qry_produto_.Open;
      if ( qry_produto_.Locate('CD_PRODUTO', msk_cd_prod.Text, [loCaseInsensitive]) ) then
      begin
        edt_nm_prod.Text := qry_produto_NM_PRODUTO.AsString;
      end
      else
      begin
        BoxMensagem('Produto não cadastrado!', 2);
        msk_cd_prod.SetFocus;
        Consiste := False;
        Exit;
      end;
      qry_produto_.Close;
      qry_produto_.SQL[2] := 'WHERE CD_PRODUTO <> ""';
      qry_produto_.Prepare;
      qry_produto_.Open;
    end;
  end
  else
  begin
    edt_nm_prod.Text := '';
  end;

  {Cliente}
  if msk_cd_cliente.Text <> '' then
  begin
    ValCodEdt( msk_cd_cliente );
    with datm_pesq_solic_ch do
    begin
      qry_emp_nac_.Close;
      qry_emp_nac_.SQL[2] := 'WHERE CD_EMPRESA = "' + msk_cd_cliente.Text + '"';
      qry_emp_nac_.Prepare;
      qry_emp_nac_.Open;
      if ( qry_emp_nac_.Locate('CD_EMPRESA', msk_cd_cliente.Text, [loCaseInsensitive]) ) then
      begin
        edt_nm_cliente.Text := qry_emp_nac_NM_EMPRESA.AsString;
      end
      else
      begin
        BoxMensagem('Cliente não cadastrado!', 2);
        msk_cd_cliente.SetFocus;
        Consiste := False;
        Exit;
      end;
      qry_emp_nac_.Close;
      qry_emp_nac_.SQL[2] := 'WHERE CD_EMPRESA <> ""';
      qry_emp_nac_.Prepare;
      qry_emp_nac_.Open;
    end;
  end
  else
  begin
    edt_nm_cliente.Text := '';
  end;

  {Item}
  if msk_cd_item.Text <> '' then
  begin
    ValCodEdt( msk_cd_item );
    with datm_pesq_solic_ch do
    begin
      qry_item_.Close;
      qry_item_.SQL[2] := 'WHERE CD_ITEM = "' + msk_cd_item.Text + '"';
      qry_item_.Prepare;
      qry_item_.Open;
      if ( qry_item_.Locate('CD_ITEM', msk_cd_item.Text, [loCaseInsensitive]) ) then
      begin
        edt_nm_item.Text := qry_item_NM_ITEM.AsString;
      end
      else
      begin
        BoxMensagem('Item não cadastrado!', 2);
        msk_cd_item.SetFocus;
        Consiste := False;
        Exit;
      end;
      qry_item_.Close;
      qry_item_.SQL[2] := 'WHERE CD_ITEM <> ""';
      qry_item_.Prepare;
      qry_item_.Open;
    end;
  end
  else
  begin
    edt_nm_item.Text := '';
  end;

  {Banco}
  if msk_cd_banco.Text <> '' then
  begin
    ValCodEdt( msk_cd_banco );
    with datm_pesq_solic_ch do
    begin
      qry_banco_.Close;
      qry_banco_.SQL[2] := 'WHERE CD_BANCO = "' + msk_cd_banco.Text + '"';
      qry_banco_.Prepare;
      qry_banco_.Open;
      if ( qry_banco_.Locate('CD_BANCO', msk_cd_banco.Text, [loCaseInsensitive]) ) then
      begin
        edt_nm_banco.Text := qry_banco_NM_BANCO.AsString;
      end
      else
      begin
        BoxMensagem('Banco não cadastrado!', 2);
        msk_cd_banco.SetFocus;
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
    edt_nm_banco.Text := '';
  end;

  {Favorecido}
  if msk_cd_favorecido.Text <> '' then
  begin
    ValCodEdt( msk_cd_favorecido );
    with datm_pesq_solic_ch do
    begin
      qry_favorecido_.Close;
      qry_favorecido_.SQL[2] := 'WHERE CD_FAVORECIDO = "' + msk_cd_favorecido.Text + '"';
      qry_favorecido_.Prepare;
      qry_favorecido_.Open;
      if ( qry_favorecido_.Locate('CD_FAVORECIDO', msk_cd_favorecido.Text, [loCaseInsensitive]) ) then
      begin
        edt_nm_favorecido.Text := qry_favorecido_NM_FAVORECIDO.AsString;
      end
      else
      begin
        BoxMensagem('Favorecido não cadastrado!', 2);
        msk_cd_favorecido.SetFocus;
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
    edt_nm_favorecido.Text := '';
  end;
end;

procedure Tfrm_pesq_solic_ch1.pgctrl_solic_chChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange :=  Consiste;
end;



end.
