unit PGNM001;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, ComCtrls, Funcoes ;

type
  Tfrm_numerario = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_sair: TSpeedButton;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    btn_cancela_numerario: TSpeedButton;
    mi_saida: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_salvar: TMenuItem;
    pgctrl_numerario: TPageControl;
    ts_solicitacao: TTabSheet;
    dbg_solicitacao: TDBGrid;
    ts_item: TTabSheet;
    dbg_itens: TDBGrid;
    pnl_item: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    btn_co_banco: TSpeedButton;
    dbedt_vl_solicitado: TDBEdit;
    dbedt_cd_banco: TDBEdit;
    dbedt_nm_banco: TDBEdit;
    Label6: TLabel;
    dbedt_vl_calculado: TDBEdit;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_excluir: TSpeedButton;
    mi_excluir: TMenuItem;
    dbedt_cd_item: TDBEdit;
    dbedt_nm_item: TDBEdit;
    btn_co_item: TSpeedButton;
    pnl_selecao: TPanel;
    lbl_cd_cliente: TLabel;
    lbl_nr_processo: TLabel;
    btn_processo: TSpeedButton;
    Label1: TLabel;
    btn_cd_produto: TSpeedButton;
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    lbl_cd_servico: TLabel;
    msk_nr_processo: TMaskEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    dbedt_cd_cliente: TDBEdit;
    dbedt_cd_servico: TDBEdit;
    dbedt_nm_cliente: TDBEdit;
    dbedt_nm_servico: TDBEdit;
    mi_cancela_numerario: TMenuItem;
    btn_cambio: TSpeedButton;
    btn_duplica: TSpeedButton;
    mi_duplicar: TMenuItem;
    dbrdgrp_base_calculo: TDBRadioGroup;
    lbl_favorecido: TLabel;
    btn_co_favorecido: TSpeedButton;
    dbedt_cd_favorecido: TDBEdit;
    dbedt_nm_favorecido: TDBEdit;
    dblckpbox_tp_destino: TDBLookupComboBox;
    Label4: TLabel;
    btn_print_: TSpeedButton;
    mi_print_: TMenuItem;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_cancela_numerarioClick(Sender: TObject);
    procedure btn_processoClick(Sender: TObject);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_cd_produtoClick(Sender: TObject);
    procedure pnl_selecaoExit(Sender: TObject);
    procedure msk_cd_unid_negChange(Sender: TObject);
    procedure msk_cd_produtoChange(Sender: TObject);
    procedure pgctrl_numerarioChange(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure dbedt_cd_bancoChange(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure Cancelar;
    procedure btn_cancelarClick(Sender: TObject);
    procedure pgctrl_numerarioChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pnl_itemExit(Sender: TObject);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure btn_co_itemClick(Sender: TObject);
    procedure dbedt_cd_bancoExit(Sender: TObject);
    procedure dbedt_cd_itemExit(Sender: TObject);
    procedure btn_mi(i:Boolean; s:Boolean; c:Boolean; e:Boolean);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_cambioClick(Sender: TObject);
    procedure btn_duplicaClick(Sender: TObject);
    procedure dbrdgrp_base_calculoChange(Sender: TObject);
    procedure msk_nr_processoEnter(Sender: TObject);
    procedure dblckpbox_tp_destinoClick(Sender: TObject);
    procedure btn_co_favorecidoClick(Sender: TObject);
    procedure dbedt_cd_favorecidoExit(Sender: TObject);
    procedure btn_print_Click(Sender: TObject);
  private
    { Private declarations }
    st_unid_neg  : String[2];
    st_produto   : String[2];
    chave        : String;
    lcd_modulo   : String[2];
    lcd_rotina   : String[4];
    function habilitacao : Boolean;
    function Consiste    : Boolean;
    function Grava       : Boolean;
    function VerAlt      : Boolean;

  public
    cState : String[1];
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    nr_solicitacao : String[3];
    nr_lancamento  : String[3];
    st_modificar : Boolean;
    st_incluir   : Boolean;
    st_excluir   : Boolean;
    str_proc_msk : String;
    { Public declarations }
  end;

var
  frm_numerario: Tfrm_numerario;

implementation

uses GSMLIB,  PGGP001, PGGP015, PGGP017, PGNM002, PGNM021, PGSM010, PGSM018,
     PGSM041, PGSM048, PGSM059, PGSM090, PGSM136, PGSM146;

{$R *.DFM}

procedure Tfrm_numerario.btn_sairClick(Sender: TObject);
begin
  if ( Not VerAlt ) and ( Trim( msk_nr_processo.Text ) <> '' ) then Exit;
  Close;
end;

procedure Tfrm_numerario.btn_incluirClick(Sender: TObject);
begin
  if pgctrl_numerario.ActivePage = ts_solicitacao then
  begin
    with datm_numerario do
    begin
      qry_cliente_servico_.Close;
      qry_cliente_servico_.ParamByName('CD_CLIENTE').AsString  := qry_processo_.FieldByName('CD_CLIENTE').AsString;
      qry_cliente_servico_.ParamByName('CD_UNID_NEG').AsString := qry_processo_.FieldByName('CD_UNID_NEG').AsString;
      qry_cliente_servico_.ParamByName('CD_PRODUTO').AsString  := qry_processo_.FieldByName('CD_PRODUTO').AsString;
      qry_cliente_servico_.ParamByName('CD_SERVICO').AsString  := qry_processo_.FieldByName('CD_SERVICO').AsString;
      qry_cliente_servico_.Prepare;
      qry_cliente_servico_.Open;
      if qry_cliente_servico_.RecordCount > 0 then
      begin
        if Trim( qry_cliente_servico_.FieldByName('CD_BANCO_DEB_CC').AsString ) = '' then
        begin
          BoxMensagem('Banco para Débito em Conta Corrente não cadastrado para este Cliente X Serviço!', 2);
          Exit;
        end;
        if Trim( qry_cliente_servico_.FieldByName('CD_BANCO_COM').AsString ) = '' then
        begin
          BoxMensagem('Banco da Comissária não cadastrado para este Cliente X Serviço!', 2);
          Exit;
        end;
      end
      else
      begin
        BoxMensagem('Parâmetros não cadastro para este Cliente X Serviço!', 2);
        Exit;
      end;

      qry_solinum_.Last;
      nr_solicitacao   := qry_solinum_.FieldByName('NR_SOLICITACAO').AsString;
      if nr_solicitacao = '' then
        nr_solicitacao := '001'
      else
        nr_solicitacao := StrZero( StrToInt( nr_solicitacao ) + 1, 3 );
      qry_solinum_.Append;
      qry_solinum_.FieldByName('NR_PROCESSO').AsString      := qry_processo_.FieldByName('NR_PROCESSO').AsString;
      qry_solinum_.FieldByName('NR_SOLICITACAO').AsString   := nr_solicitacao;
      qry_solinum_.FieldByName('DT_SOLICITACAO').AsDateTime := Date;
      qry_solinum_.FieldByName('CD_USUARIO').AsString       := str_cd_usuario;
      qry_solinum_.FieldByName('CD_STATUS').AsString        := 'A';
      qry_solinum_.FieldByName('CD_BASE_CALCULO').AsString  := '0';
      dbg_solicitacao.SetFocus;
    end;
  end
  else
  begin
    with datm_numerario do
    begin
      qry_itens_solinum_.Last;
      nr_lancamento   := qry_itens_solinum_.FieldByName('NR_LANCAMENTO').AsString;
      if nr_lancamento = '' then
        nr_lancamento := '001'
      else
        nr_lancamento := StrZero(StrToInt(nr_lancamento)+1,3);
      qry_itens_solinum_.Append;
      qry_itens_solinum_.FieldByName('NR_PROCESSO').AsString      := qry_solinum_.FieldByName('NR_PROCESSO').AsString;
      qry_itens_solinum_.FieldByName('NR_SOLICITACAO').AsString   := qry_solinum_.FieldByName('NR_SOLICITACAO').AsString;
      qry_itens_solinum_.FieldByName('NR_LANCAMENTO').AsString    := nr_lancamento;
      qry_itens_solinum_.FieldByName('CD_STATUS').AsString        := 'A';
      qry_itens_solinum_.FieldByName('IN_CANCELADO').AsString     := '0';
      qry_itens_solinum_.FieldByName('VL_SOLICITADO').AsFloat     := 0;
    end;
    pnl_item.Enabled := True;
    dblckpbox_tp_destino.SetFocus;
  end;
end;

procedure Tfrm_numerario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_numerario do
  begin
    qry_tp_destino_.Close;
    qry_favorecido_.Close;
    qry_banco_.Close;
    qry_itens_solinum_.Close;
    qry_processo_.Close;
    qry_produto_.Close;
    qry_solinum_.Close;
    qry_status_numer_.Close;
    qry_unid_neg_.Close;
     qry_usuario_habilitacao_.Close;
    qry_usuario_.Close;
    qry_yesno_.Close;
    qry_item_.Close;
  end;
//  datm_numerario.Destroy;
  datm_numerario.Free;
  Action := caFree;
end;

procedure Tfrm_numerario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_numerario.FormCreate(Sender: TObject);
begin
  { Cria o DataModule de Dados de Numerario }
  Application.CreateForm(Tdatm_numerario, datm_numerario );

  lcd_modulo := vStr_cd_modulo;
  lcd_rotina := str_cd_rotina;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_unid_negExit(nil);
  msk_cd_produtoExit(nil);
  msk_nr_processo.Text := '';

  with datm_numerario do
  begin
    qry_tp_destino_.Close;
    qry_tp_destino_.Prepare;
    qry_tp_destino_.Open;

    qry_favorecido_.Close;
    qry_favorecido_.Prepare;
    qry_favorecido_.Open;
  end;
end;

procedure Tfrm_numerario.msk_nr_processoExit(Sender: TObject);
begin
  if Trim( msk_nr_processo.Text ) = Trim( str_proc_msk ) then Exit;
  str_proc_msk := Trim( msk_nr_processo.Text );
  if msk_nr_processo.Enabled then msk_nr_processo.Text := msk_nr_processo.Text;
  with datm_numerario do
  begin
    qry_processo_.Close;
    qry_solinum_.Close;
    qry_itens_solinum_.Close;
    if Not processo_nulo( msk_nr_processo.Text ) then
    begin
      qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text +
                                                           msk_cd_produto.Text  +
                                                           msk_nr_processo.Text;
      qry_processo_.Open;
      qry_solinum_.Close;
      qry_solinum_.Prepare;
      qry_solinum_.Open;
      qry_itens_solinum_.Close;
      qry_itens_solinum_.Prepare;
      qry_itens_solinum_.Open;
      if qry_processo_.RecordCount = 0 then
      begin
        BoxMensagem('Processo não encontrado!', 2);
        btn_duplica.Enabled := False;
        btn_print_.Enabled := False;
        mi_print_.Enabled := False;
        mi_duplicar.Enabled := False;
        btn_mi (False, False, False, False);
        msk_nr_processo.SetFocus;
      end
      else
      begin
        if datm_numerario.qry_solinum_.RecordCount > 0 then
          btn_mi (st_incluir, False, False, st_excluir)
        else
          btn_mi (st_incluir, False, False, False)
      end;
      if qry_processo_.FieldByName('IN_CANCELADO').AsString <> '0' then
      begin
        BoxMensagem('Processo está cancelado!', 2);
        btn_incluir.Enabled := False;
        mi_incluir.Enabled  := False;
        btn_duplica.Enabled := False;
        btn_print_.Enabled := False;
        mi_print_.Enabled := False; 
        mi_duplicar.Enabled := False;
        msk_nr_processo.SetFocus;
      end
      else
      if qry_processo_.FieldByName('IN_PRODUCAO').AsString <> '1' then
      begin
        BoxMensagem('Processo não está na Produção!', 2);
        btn_incluir.Enabled := False;
        mi_incluir.Enabled  := False;
        btn_duplica.Enabled := False;
        btn_print_.Enabled := False;
        mi_print_.Enabled := False;
        mi_duplicar.Enabled := False;
        msk_nr_processo.SetFocus;
      end
      else
      if qry_processo_.FieldByName('IN_LIBERADO').AsString <> '1' then
      begin
        BoxMensagem( 'Processo não está liberado!', 2 );
        btn_incluir.Enabled := False;
        mi_incluir.Enabled  := False;
        btn_duplica.Enabled := False;
        btn_print_.Enabled := False;
        mi_print_.Enabled := False;
        mi_duplicar.Enabled := False;
        msk_nr_processo.SetFocus;
      end
      else
      begin
        btn_incluir.Enabled := True;
        mi_incluir.Enabled  := True;
        btn_duplica.Enabled := True;
        btn_print_.Enabled := True;
        mi_print_.Enabled := True;
        mi_duplicar.Enabled := True;
      end;
    end;
    pgctrl_numerario.Enabled    := True;
    pgctrl_numerario.ActivePage := ts_solicitacao;
  end;
end;

procedure Tfrm_numerario.FormShow(Sender: TObject);
begin
  pgctrl_numerario.ActivePage := ts_solicitacao;
  msk_nr_processo.SetFocus;
end;

procedure Tfrm_numerario.msk_cd_unid_negExit(Sender: TObject);
var foco : boolean;
begin
  if Not (st_unid_neg = msk_cd_unid_neg.Text) then
  begin
    with datm_numerario do
    begin
      if msk_cd_unid_neg.Text <> '' then
        ValCodEdt( msk_cd_unid_neg );
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.Locate('CD_UNID_NEG', msk_cd_unid_neg.Text, [loCaseInsensitive, loPartialKey]) then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_.FieldByName('AP_UNID_NEG').AsString;
        foco := Not Habilitacao;
      end
      else
      begin
        edt_nm_unid_neg.clear;
        BoxMensagem('Unidade não habilitada/ativa!', 2);
        foco := True;
      end;
      qry_unid_neg_.Close;
    end;
    msk_nr_processo.Text := '';
    msk_nr_processoExit(nil);
    if foco then
    begin
      pgctrl_numerario.ActivePage := ts_solicitacao;
      msk_cd_unid_neg.SetFocus;
    end;
  end
end;

procedure Tfrm_numerario.msk_cd_produtoExit(Sender: TObject);
var foco : boolean;
begin
  if Not (st_produto = msk_cd_produto.Text ) then
  begin
    with datm_numerario do
    begin
      if msk_cd_produto.Text <> '' then
        ValCodEdt( msk_cd_produto );
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_produto_.Prepare;
      qry_produto_.Open;
      if qry_produto_.Locate('CD_PRODUTO', msk_cd_produto.Text, [loCaseInsensitive, loPartialKey]) then
      begin
        edt_nm_produto.Text := qry_produto_.FieldByName('AP_PRODUTO').AsString;
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
    dbrdgrp_base_calculo.Visible := ( msk_cd_produto.Text = '01' );
    msk_nr_processo.Text := '';
    msk_nr_processoExit(nil);
    if foco then
    begin
      pgctrl_numerario.ActivePage := ts_solicitacao;
      msk_cd_produto.SetFocus;
    end;
  end;
end;

procedure Tfrm_numerario.btn_cancela_numerarioClick(Sender: TObject);
begin
  with datm_numerario do
  begin
    if (qry_itens_solinum_.RecordCount > 0) and ( qry_solinum_.FieldByName('VL_RECEBIDO').AsFloat > 0 ) then
    begin
      MessageDlg('Esta solicitação não pode ser cancelada pois foi recebida total/parcialmente.', mtError, [mbOk], 0);
      Exit;
    end
    else
    begin
      if BoxMensagem('Esta solicitação será cancelada!' + #13#10 + 'Confirma cancelamento?', 1) then
      begin
        try
          try
            datm_main.db_broker.StartTransaction;
            CloseStoredProc(sp_cancela_numerario);
            sp_cancela_numerario.ParamByName('@NR_PROCESSO').AsString    := qry_solinum_.FieldByName('NR_PROCESSO').AsString;
            sp_cancela_numerario.ParamByName('@NR_SOLICITACAO').AsString := qry_solinum_.FieldByName('NR_SOLICITACAO').AsString;
            ExecStoredProc(sp_cancela_numerario);
            CloseStoredProc(sp_cancela_numerario);
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
        except
          BoxMensagem('Cancelamento não foi bem sucedido!', 2);
          Exit;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_numerario.btn_processoClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_consulta_processo, frm_consulta_processo);
  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := msk_cd_produto.Text;
  frm_consulta_processo.ShowModal;
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  if (frm_consulta_processo.Nr_Processo <> '') then
  begin
    msk_nr_processo.Text := Copy (frm_consulta_processo.Nr_Processo, 5, 14);
    msk_nr_processoExit(nil);
  end;
end;

procedure Tfrm_numerario.btn_cd_unid_negClick(Sender: TObject);
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
    frm_numerario.msk_cd_unid_negExit(nil);
  end;
end;

procedure Tfrm_numerario.btn_cd_produtoClick(Sender: TObject);
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
    frm_numerario.msk_cd_produtoExit(nil);
  end;
end;

function Tfrm_numerario.Habilitacao : Boolean;
begin
  Habilitacao := True;
  if ( msk_cd_unid_neg.Text <> '') and
     ( msk_cd_produto.Text <> '') then
  with datm_numerario do
  begin
    qry_usuario_habilitacao_.Close;
    qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
    qry_usuario_habilitacao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_usuario_habilitacao_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
    qry_usuario_habilitacao_.Prepare;
    qry_usuario_habilitacao_.Open;
    if qry_usuario_habilitacao_.FieldByName('IN_ATIVO').AsString <> '1' then
    begin
      BoxMensagem('A habilitação não esta ativa!', 2);
      Habilitacao := False;
    end;
    qry_usuario_habilitacao_.Close;
  end;
end;

procedure Tfrm_numerario.pnl_selecaoExit(Sender: TObject);
begin
  if msk_nr_processo.Text = '' then
  begin
    pgctrl_numerario.ActivePage := ts_solicitacao;
  end
end;

procedure Tfrm_numerario.msk_cd_unid_negChange(Sender: TObject);
begin
  msk_nr_processo.Text := '';
end;

procedure Tfrm_numerario.msk_cd_produtoChange(Sender: TObject);
begin
  msk_cd_unid_negChange(nil);
end;

procedure Tfrm_numerario.btn_mi(i:Boolean; s:Boolean; c:Boolean; e:Boolean);
begin
  btn_incluir.Enabled  := i;
  mi_incluir.Enabled   := i;
  btn_salvar.Enabled   := s;
  mi_salvar.Enabled    := s;
  btn_Cancelar.Enabled := c;
  mi_Cancelar.Enabled  := c;
  btn_excluir.Enabled  := e;
  mi_excluir.Enabled   := e;
end;

procedure Tfrm_numerario.pgctrl_numerarioChange(Sender: TObject);
begin
  if pgctrl_numerario.ActivePage = ts_solicitacao then
  begin
    pnl_selecao.Enabled := True;
    if datm_numerario.ds_solinum.AutoEdit then
      if datm_numerario.qry_solinum_.RecordCount > 0 then
        btn_mi (st_incluir, False, False, st_excluir)
      else
        btn_mi (st_incluir, False, False, False)
    else
      btn_mi (st_incluir, False, False, False);
  end
  else
  begin
    pnl_selecao.Enabled := False;
    if datm_numerario.qry_itens_solinum_.State in [dsEdit, dsInsert ] then
       btn_mi (False, True, True, False)
    else
      if datm_numerario.ds_itens_solinum.AutoEdit then
        if datm_numerario.qry_itens_solinum_.RecordCount > 0 then
          if datm_numerario.qry_solinum_.FieldByName('CD_STATUS').AsString = 'B' then
             btn_mi (False, False, False, st_excluir)
          else
             btn_mi (st_incluir, False, False, st_excluir)
        else
          btn_mi (st_incluir, False, False, False)
      else
        btn_mi (False, False, False, False);
    if datm_numerario.qry_itens_solinum_.RecordCount > 0 then
      pnl_item.Enabled := True
    else
      pnl_item.Enabled := False;
  end;
end;

procedure Tfrm_numerario.btn_excluirClick(Sender: TObject);
var str_cd_item : string;
begin
  if pgctrl_numerario.ActivePage = ts_solicitacao then
  begin
    if datm_numerario.qry_itens_solinum_.RecordCount = 0 then
    begin
      if (datm_numerario.qry_solinum_.FieldByName('NR_SOLICITACAO').AsInteger = datm_numerario.qry_solinum_.RecordCount) and
         (datm_numerario.qry_solinum_.FieldByName('CD_STATUS').AsString = 'A') then
      begin
        if BoxMensagem( 'Esta Solicitação será excluída! ' + #13#10 + 'Confirma exclusão?', 1 ) then
        try
          chave := datm_numerario.qry_solinum_.FieldByName('NR_PROCESSO').AsString +
                   datm_numerario.qry_solinum_.FieldByName('NR_SOLICITACAO').AsString;
          datm_main.db_broker.StartTransaction;
          datm_numerario.qry_solinum_.Delete;
          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            datm_numerario.qry_solinum_.Cancel;
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
        chave := datm_numerario.qry_solinum_.FieldByName('NR_SOLICITACAO').AsString;
        datm_numerario.qry_solinum_.Close;
        datm_numerario.qry_solinum_.Prepare;
        datm_numerario.qry_solinum_.Open;
        datm_numerario.qry_solinum_.Locate('NR_SOLICITACAO', chave, [loPartialKey]);
      end
      else
        BoxMensagem( 'Só é permitido excluir a última solicitação do processo!', 2 );
    end
    else
      BoxMensagem( 'Esta Solicitação não pode ser excluída!', 2 );
  end
  else
  begin
    if (datm_numerario.qry_solinum_.FieldByName('CD_STATUS').AsString = 'A' ) and
       (datm_numerario.qry_itens_solinum_.FieldByName('CD_STATUS').AsString = 'A') then
    begin
      if BoxMensagem( 'Este Item da Solicitação será excluído! ' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        str_cd_item := datm_numerario.qry_itens_solinum_.FieldByName('CD_ITEM').AsString;
        chave := datm_numerario.qry_itens_solinum_.FieldByName('NR_PROCESSO').Asstring +
                 datm_numerario.qry_itens_solinum_.FieldByName('NR_SOLICITACAO').Asstring +
                 datm_numerario.qry_itens_solinum_.FieldByName('NR_LANCAMENTO').Asstring;
        datm_main.db_broker.StartTransaction;
        datm_numerario.qry_itens_solinum_.Delete;
        //Atualiza total solicitado
        CloseStoredProc(datm_numerario.sp_atz_numerario);
        datm_numerario.sp_atz_numerario.ParamByName('@NR_PROCESSO').AsString    := datm_numerario.qry_solinum_.FieldByName('NR_PROCESSO').Asstring;
        datm_numerario.sp_atz_numerario.ParamByName('@NR_SOLICITACAO').AsString := datm_numerario.qry_solinum_.FieldByName('NR_SOLICITACAO').Asstring;
        datm_numerario.sp_atz_numerario.ParamByName('@CD_ITEM').AsString        := str_cd_item;
        ExecStoredProc(datm_numerario.sp_atz_numerario);
        CloseStoredProc(datm_numerario.sp_atz_numerario);

        with datm_numerario do
        begin
          if qry_cliente_servico_IN_CPMF_NUM.AsString = '1' then  { Atualiza Item CPMF no Numerário }
          begin
            CloseStoredProc( sp_atz_num_cpmf );
            sp_atz_num_cpmf.ParamByName( '@NR_PROCESSO' ).AsString    := qry_solinum_.FieldByName('NR_PROCESSO').AsString;
            sp_atz_num_cpmf.ParamByName( '@NR_SOLIC' ).AsString       := qry_solinum_.FieldByName('NR_SOLICITACAO').AsString;
            ExecStoredProc( sp_atz_num_cpmf );
            CloseStoredProc( sp_atz_num_cpmf );
          end;
        end;

        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          datm_numerario.qry_itens_solinum_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      chave := datm_numerario.qry_solinum_.FieldByName('NR_SOLICITACAO').AsString;
      datm_numerario.qry_solinum_.Close;
      datm_numerario.qry_solinum_.Prepare;
      datm_numerario.qry_solinum_.Open;
      datm_numerario.qry_solinum_.Locate('NR_SOLICITACAO', chave, [loPartialKey]);

      chave := datm_numerario.qry_itens_solinum_.FieldByName('NR_LANCAMENTO').AsString;
      datm_numerario.qry_itens_solinum_.Close;
      datm_numerario.qry_itens_solinum_.Prepare;
      datm_numerario.qry_itens_solinum_.Open;
      datm_numerario.qry_itens_solinum_.Locate('NR_SOLICITACAO', chave, [loPartialKey]);
    end
    else
      BoxMensagem( 'Este Lançamento não pode ser excluído!', 2 );
  end;
  pnl_itemExit(nil);
end;

procedure Tfrm_numerario.msk_cd_unid_negEnter(Sender: TObject);
begin
  st_unid_neg := msk_cd_unid_neg.Text;
end;

procedure Tfrm_numerario.msk_cd_produtoEnter(Sender: TObject);
begin
  st_produto := msk_cd_produto.Text;
end;

procedure Tfrm_numerario.dbedt_cd_bancoChange(Sender: TObject);
begin
  if ( datm_numerario.qry_itens_solinum_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_mi( False, True, True, False )
  end;
end;

procedure Tfrm_numerario.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava    then Exit;
  pnl_itemExit(nil);
end;

function Tfrm_numerario.Consiste : Boolean;
begin
  if pgctrl_numerario.ActivePage = ts_solicitacao then
  begin
    if ( datm_numerario.qry_solinum_.FieldByName('CD_BASE_CALCULO').AsString <> '0' ) and
       ( datm_numerario.qry_solinum_.FieldByName('CD_BASE_CALCULO').AsString <> '1' ) then
    begin
      BoxMensagem('Informe a base de Cálculo para a Solicitação de Numerário (Previsão/D.I.)!', 2);
      dbrdgrp_base_calculo.SetFocus;
      Consiste  := False;
      Exit;
    end;
  end
  else
  begin
    if datm_numerario.qry_cliente_servico_.State in [ dsInsert ] then
    begin
      datm_main.tbl_parametro_.Open;
      { Verifica se é Item CPMF }
      if ( Trim( dbedt_cd_item.Text ) = datm_main.tbl_parametro_CD_ITEM_CPMF.AsString ) and
         ( datm_numerario.qry_cliente_servico_IN_CPMF_NUM.AsString = '1' ) then
      begin
        BoxMensagem('Não é Permitida a Inclusão desse Item para esse Cliente!', 2);
        pgctrl_numerario.ActivePage := ts_item;
        dbedt_cd_banco.SetFocus;
        Consiste  := False;
        Exit;
      end;
    end;
    if ( dbedt_cd_banco.Text = '' ) and ( datm_numerario.qry_itens_solinum_.FieldByName('TP_DESTINO').AsString = '1' ) then {Déb. Conta}
    begin
      BoxMensagem('Campo Banco deve ser preenchido!', 2);
      pgctrl_numerario.ActivePage := ts_item;
      dbedt_cd_banco.SetFocus;
      Consiste  := False;
      Exit;
    end;
    if ( dbedt_nm_banco.Text = '' ) and ( datm_numerario.qry_itens_solinum_.FieldByName('TP_DESTINO').AsString = '1' ) then {Déb. Conta}
    begin
      BoxMensagem('Banco não encontrado!', 2);
      pgctrl_numerario.ActivePage := ts_item;
      dbedt_cd_banco.SetFocus;
      Consiste  := False;
      Exit;
    end;
    if dbedt_cd_item.Text = '' then
    begin
      BoxMensagem('Campo Item deve ser preenchido!', 2);
      pgctrl_numerario.ActivePage := ts_item;
      dbedt_cd_item.SetFocus;
      Consiste := False;
      Exit;
    end;
    if dbedt_nm_item.Text = '' then
    begin
      BoxMensagem('Item não encontrado!', 2);
      pgctrl_numerario.ActivePage := ts_item;
      dbedt_cd_item.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;
  Consiste := True;
end;

function Tfrm_numerario.Grava : Boolean;
var str_nr_processo, str_nr_solic, str_nr_lanc : String;
begin
  Grava := False;
  with datm_numerario do
  begin
    qry_cliente_servico_.Close;
    qry_cliente_servico_.ParamByName('CD_CLIENTE').AsString  := qry_processo_.FieldByName('CD_CLIENTE').AsString;
    qry_cliente_servico_.ParamByName('CD_UNID_NEG').AsString := qry_processo_.FieldByName('CD_UNID_NEG').AsString;
    qry_cliente_servico_.ParamByName('CD_PRODUTO').AsString  := qry_processo_.FieldByName('CD_PRODUTO').AsString;
    qry_cliente_servico_.ParamByName('CD_SERVICO').AsString  := qry_processo_.FieldByName('CD_SERVICO').AsString;
    qry_cliente_servico_.Prepare;
    qry_cliente_servico_.Open;

    if pgctrl_numerario.ActivePage = ts_solicitacao then
    begin
      try
        datm_main.db_broker.StartTransaction;
        //Grava Numerario
        qry_solinum_.Post;
        str_nr_processo := qry_solinum_.FieldByName('NR_PROCESSO').AsString;
        str_nr_solic    := qry_solinum_.FieldByName('NR_SOLICITACAO').AsString;
        qry_solinum_.Close;
        qry_itens_solinum_.Close;

        //Grava itens padrão do Cliente
        CloseStoredProc( sp_calc_padrao );
        sp_calc_padrao.ParamByName('@NR_PROCESSO').AsString    := str_nr_processo;
        sp_calc_padrao.ParamByName('@NR_SOLICITACAO').AsString := str_nr_solic;
        ExecStoredProc(sp_calc_padrao);
        CloseStoredProc( sp_calc_padrao );

        //Exibir registros de erro de calculo
        qry_tot_erro_.Close;
        qry_tot_erro_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
        qry_tot_erro_.Prepare;
        qry_tot_erro_.Open;
        if qry_tot_erro_.FieldByName('TOT_ERRO').AsInteger > 0 then
        begin
          Application.CreateForm( Tfrm_log_erro_calculo, frm_log_erro_calculo );
          frm_log_erro_calculo.ShowModal;
        end;

        ///limpar registros de erro de calculo
        qry_log_erro_calculo_.Close;
        qry_log_erro_calculo_.ParamByName('CD_USUARIO').AsString          := str_cd_usuario;
        qry_log_erro_calculo_.Prepare;
        qry_log_erro_calculo_.ExecSQL;
        qry_log_erro_calculo_.Close;

        if qry_cliente_servico_IN_CPMF_NUM.AsString = '1' then  { Inclui ou Atualiza Item CPMF }
        begin
          CloseStoredProc( sp_atz_num_cpmf );
          sp_atz_num_cpmf.ParamByName( '@NR_PROCESSO' ).AsString    := str_nr_processo;
          sp_atz_num_cpmf.ParamByName( '@NR_SOLIC' ).AsString       := str_nr_solic;
          ExecStoredProc( sp_atz_num_cpmf );
          CloseStoredProc( sp_atz_num_cpmf );
        end;

        datm_main.db_broker.Commit;

        //Posiciona registro
        qry_solinum_.Prepare;
        qry_solinum_.Open;
        qry_solinum_.Last;

        qry_itens_solinum_.Prepare;
        qry_itens_solinum_.Open;
        Grava := True;
      except
        on E: Exception do
        begin
          datm_numerario.qry_solinum_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end
    else
    begin
      try
        datm_main.db_broker.StartTransaction;
        if ( qry_itens_solinum_.State in [dsInsert, dsEdit] ) then
        begin
          chave := qry_itens_solinum_.FieldByName('NR_PROCESSO').AsString +
                   qry_itens_solinum_.FieldByName('NR_SOLICITACAO').AsString +
                   qry_itens_solinum_.FieldByName('NR_LANCAMENTO').AsString;
          //grava item do numerario
          qry_itens_solinum_.Post;

          //Atualiza total solicitado
          CloseStoredProc(sp_atz_numerario);
          sp_atz_numerario.ParamByName('@NR_PROCESSO').AsString    := qry_itens_solinum_.FieldByName('NR_PROCESSO').AsString;
          sp_atz_numerario.ParamByName('@NR_SOLICITACAO').AsString := qry_itens_solinum_.FieldByName('NR_SOLICITACAO').AsString;
          sp_atz_numerario.ParamByName('@CD_ITEM').AsString        := qry_itens_solinum_.FieldByName('CD_ITEM').AsString;
          ExecStoredProc(sp_atz_numerario);
          CloseStoredProc(sp_atz_numerario);

          CloseStoredProc(sp_soma_solinum);
          sp_soma_solinum.ParamByName('@NR_PROCESSO').AsString := qry_itens_solinum_.FieldByName('NR_PROCESSO').AsString;
          sp_soma_solinum.ParamByName('@NR_SOLINUM').AsString  := qry_itens_solinum_.FieldByName('NR_SOLICITACAO').AsString;
          ExecStoredProc(sp_soma_solinum);
          CloseStoredProc(sp_soma_solinum);

          //Atualizar Pagamentos
          CloseStoredProc( sp_atz_pagto );
          sp_atz_pagto.ParamByName('@NR_PROCESSO').AsString        := qry_itens_solinum_.FieldByName('NR_PROCESSO').AsString;
          sp_atz_pagto.ParamByName('@CD_ITEM').AsString            := qry_itens_solinum_.FieldByName('CD_ITEM').AsString;
          ExecStoredProc( sp_atz_pagto );
          CloseStoredProc( sp_atz_pagto );

          if qry_cliente_servico_IN_CPMF_NUM.AsString = '1' then  { Inclui ou Atualiza Item CPMF }
          begin
            CloseStoredProc( sp_atz_num_cpmf );
            sp_atz_num_cpmf.ParamByName( '@NR_PROCESSO' ).AsString    := qry_itens_solinum_.FieldByName('NR_PROCESSO').AsString;
            sp_atz_num_cpmf.ParamByName( '@NR_SOLIC' ).AsString       := qry_itens_solinum_.FieldByName('NR_SOLICITACAO').AsString;
            ExecStoredProc( sp_atz_num_cpmf );
            CloseStoredProc( sp_atz_num_cpmf );
          end;

          //posiciona registro
          chave       := qry_solinum_.FieldByName('NR_SOLICITACAO').AsString;
          str_nr_lanc := qry_itens_solinum_.FieldByName('NR_LANCAMENTO').AsString;

          qry_solinum_.Close;
          qry_solinum_.Prepare;
          qry_solinum_.Open;
          qry_solinum_.Locate('NR_SOLICITACAO', chave, [loPartialKey]);

          qry_itens_solinum_.Close;
          qry_itens_solinum_.Prepare;
          qry_itens_solinum_.Open;
          qry_itens_solinum_.Locate('NR_LANCAMENTO', str_nr_lanc, [loPartialKey]);

        end;

        datm_main.db_broker.Commit;
        Grava := True;
        if qry_itens_solinum_.RecordCount > 0 then
           btn_mi (st_incluir, False, False, st_excluir)
        else
           btn_mi (st_incluir, False, False, False);
      except
        on E: Exception do
        begin
          qry_itens_solinum_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
          Grava := False;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_numerario.Cancelar;
begin
  try
    if datm_numerario.qry_solinum_.State in [dsInsert, dsEdit] then
      datm_numerario.qry_solinum_.Cancel;
    if datm_numerario.qry_itens_solinum_.State in [dsInsert, dsEdit] then
      datm_numerario.qry_itens_solinum_.Cancel;
    if datm_numerario.qry_itens_solinum_.RecordCount > 0 then
      btn_mi (st_incluir, False, False, st_excluir)
    else
      btn_mi (st_incluir, False, False, False);
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
end;

function Tfrm_numerario.VerAlt : Boolean;
begin
  VerAlt := True;
  if pgctrl_numerario.ActivePage = ts_solicitacao then
  begin
    if Trim( msk_nr_processo.Text ) = '' then
    begin
      VerAlt := False;
      Exit;
    end;
    if ( datm_numerario.qry_solinum_.State in [dsEdit, dsInsert] ) then
    begin
      if BoxMensagem('Solicitação de Numerário foi alterada.' + #13#10 +
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
  end
  else
  begin
    if ( datm_numerario.qry_itens_solinum_.State in [dsEdit, dsInsert] ) then
    begin
      if BoxMensagem('Itens da Solicitação foi alterado.' + #13#10 +
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
end;

procedure Tfrm_numerario.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
  pnl_itemExit(nil);
end;

procedure Tfrm_numerario.pgctrl_numerarioChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_numerario.pnl_itemExit(Sender: TObject);
begin
  if datm_numerario.qry_itens_solinum_.State in [dsinsert, dsedit] then
    dbg_itens.Enabled := False
  else
    dbg_itens.Enabled := True;

  if ( datm_numerario.qry_itens_solinum_.RecordCount <= 0 ) and
     Not( datm_numerario.qry_itens_solinum_.State in [dsInsert] ) then
    pnl_item.Enabled := False
  else
    pnl_item.Enabled := True;
end;

procedure Tfrm_numerario.btn_co_bancoClick(Sender: TObject);
begin
  if ( datm_numerario.ds_itens_solinum.AutoEdit ) and
     Not ( datm_numerario.qry_itens_solinum_.State in [dsInsert, dsEdit] ) then
     datm_numerario.qry_itens_solinum_.Edit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2216';
  Application.CreateForm(Tfrm_banco, frm_banco);
  frm_banco.Cons_OnLine := datm_numerario.qry_itens_solinum_CD_BANCO;
  with frm_banco do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  vStr_cd_modulo := lcd_modulo;
  str_cd_rotina := lcd_rotina;
  datm_numerario.qry_banco_.Close;
  datm_numerario.qry_banco_.Prepare;
  datm_numerario.qry_banco_.Open;
end;

procedure Tfrm_numerario.btn_co_itemClick(Sender: TObject);
begin
  if ( datm_numerario.ds_itens_solinum.AutoEdit ) and
     Not( datm_numerario.qry_itens_solinum_.State in [dsInsert, dsEdit] ) then
     datm_numerario.qry_itens_solinum_.Edit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2214';
  Application.CreateForm(Tfrm_item, frm_item);
  frm_item.Cons_OnLine := datm_numerario.qry_itens_solinum_CD_ITEM;
  frm_item.lRecDesp    := True;
  with frm_item do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  vStr_cd_modulo := lcd_modulo;
  str_cd_rotina := lcd_rotina;
  datm_numerario.qry_item_.Close;
  datm_numerario.qry_item_.Prepare;
  datm_numerario.qry_item_.Open;
end;

procedure Tfrm_numerario.dbedt_cd_bancoExit(Sender: TObject);
begin
  if datm_numerario.qry_itens_solinum_.State in [dsEdit, dsInsert] then
  begin
    ValidCodigo(dbedt_cd_banco);
    if dbedt_cd_banco.Text <> '' then
    begin
      if dbedt_nm_banco.Text = '' then
      begin
        BoxMensagem('Código do Banco inválido!',2);
        pgctrl_numerario.ActivePage := ts_item;
        dbedt_cd_banco.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_numerario.dbedt_cd_itemExit(Sender: TObject);
begin
  if datm_numerario.qry_itens_solinum_.State in [dsEdit, dsInsert] then
  begin
    ValidCodigo(dbedt_cd_item);
    if dbedt_cd_item.Text <> '' then
    begin
      if dbedt_nm_item.Text = '' then
      begin
        BoxMensagem('Código do Item inválido!',2);
        pgctrl_numerario.ActivePage := ts_item;
        dbedt_cd_item.SetFocus;
        Exit;
      end
      else
      begin
        if datm_numerario.qry_itens_solinum_LK_ITEM_ATIVO.AsString = '0' then
        begin
          BoxMensagem('Item Inativo!',2);
          pgctrl_numerario.ActivePage := ts_item;
          dbedt_cd_item.SetFocus;
          Exit;
        end;
      end;
    end;
    // Verifica se ítem já existe para a solicitação corrente
    with datm_numerario do
    begin
    qry_item_lanc_.Close;
    qry_item_lanc_.ParamByName('NR_PROCESSO').AsString  := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
    qry_item_lanc_.ParamByName('NR_SOLICITACAO').AsString := qry_solinum_.FieldByName('NR_SOLICITACAO').AsString;
    qry_item_lanc_.ParamByName('CD_ITEM').AsString  := dbedt_cd_item.Text;
    qry_item_lanc_.Prepare;
    qry_item_lanc_.Open;
    if qry_item_lanc_.RecordCount > 0 then
    begin
      BoxMensagem('Item já lançado para essa solicitação!',2);
      pgctrl_numerario.ActivePage := ts_item;
      dbedt_cd_item.SetFocus;
      qry_item_lanc_.Close;
      Exit;
    end;
    qry_item_lanc_.Close;
    end;

    with datm_numerario do
    begin
      qry_cliente_numerario_.Prepare;
      qry_cliente_numerario_.Open;
      if qry_cliente_numerario_.Locate('CD_ITEM', datm_numerario.qry_itens_solinum_.FieldByName('CD_ITEM').AsString, [loCaseInsensitive, loPartialKey]) then
      begin
        try
          datm_main.db_broker.StartTransaction;
          CloseStoredProc(sp_calculo);
          sp_calculo.StoredProcName := '';
          sp_calculo.StoredProcName := qry_cliente_numerario_.FieldByName('NM_STORED_PROCEDURE').AsString;
          sp_calculo.Params.CreateParam( ftString,  '@NR_PROCESSO', ptInput ).AsString      := qry_processo_.FieldByName('NR_PROCESSO').AsString;
          sp_calculo.Params.CreateParam( ftString,  '@CD_ITEM',     ptInput ).AsString      := qry_itens_solinum_.FieldByName('CD_ITEM').AsString;
          sp_calculo.Params.CreateParam( ftFloat,   '@RESULTADO',   ptInputOutput ).AsFloat := StrToInt( Trim( qry_solinum_.FieldByName('CD_BASE_CALCULO').AsString ) );
          sp_calculo.Params.CreateParam( ftInteger, 'Result',       ptResult );
          ExecStoredProc(sp_calculo);
          if sp_calculo.ParamByName('Result').AsInteger = 0 then
          begin
            qry_itens_solinum_.FieldByName('VL_ITEM_CALCULADO').AsFloat := sp_calculo.ParamByName('@RESULTADO').AsFloat;
            qry_itens_solinum_.FieldByName('CD_TIPO_CALCULO').AsString  := 'A';
            if qry_itens_solinum_.FieldByName('VL_SOLICITADO').AsFloat = 0 then
              qry_itens_solinum_.FieldByName('VL_SOLICITADO').AsFloat   := sp_calculo.ParamByName('@RESULTADO').AsFloat;
          end
          else
          begin
            ExibeErro( qry_cliente_numerario_.FieldByName('NM_STORED_PROCEDURE').AsString,
                       sp_calculo.ParamByName('Result').AsInteger,
                       dbedt_nm_item.Text, 0 );
          end;
          CloseStoredProc(sp_calculo);
          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
      end
      else
      begin
        qry_itens_solinum_.FieldByName('CD_TIPO_CALCULO').AsString := 'M';
      end;
      qry_cliente_numerario_.Close;
    end;
  end;
end;

procedure Tfrm_numerario.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg     then btn_cd_unid_negClick(nil);
    if Sender = msk_cd_produto      then btn_cd_produtoClick(nil);
    if Sender = msk_nr_processo     then btn_processoClick(nil);
    if Sender = dbedt_cd_banco      then btn_co_bancoClick(nil);
    if Sender = dbedt_cd_favorecido then btn_co_favorecidoClick(nil);
    if Sender = dbedt_cd_item       then btn_co_itemClick(nil);
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

procedure Tfrm_numerario.btn_cambioClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda );
  frm_moeda.ShowModal;
  vStr_cd_modulo := lcd_modulo;
  str_cd_rotina := lcd_rotina;
end;


procedure Tfrm_numerario.btn_duplicaClick(Sender: TObject);
begin
  if BoxMensagem( 'Você deseja duplicar a ' + #13#10 +
                  'solicitação nº ' + datm_numerario.qry_solinum_.FieldByName('NR_SOLICITACAO').AsString + '?', 1 ) then
  begin
    with datm_numerario do
    begin
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(sp_duplica_numerario);
        sp_duplica_numerario.ParamByName('@NR_PROCESSO').AsString    := qry_solinum_.FieldByName('NR_PROCESSO').AsString;
        sp_duplica_numerario.ParamByName('@NR_SOLICITACAO').AsString := qry_solinum_.FieldByName('NR_SOLICITACAO').AsString;
        ExecStoredProc(sp_duplica_numerario);
        CloseStoredProc(sp_duplica_numerario);
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
      qry_solinum_.Last;

      qry_itens_solinum_.Close;
      qry_itens_solinum_.Prepare;
      qry_itens_solinum_.Open;
    end;
  end;
end;

procedure Tfrm_numerario.dbrdgrp_base_calculoChange(Sender: TObject);
begin
  if ( datm_numerario.qry_solinum_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_mi( False, True, True, False )
  end;
end;

procedure Tfrm_numerario.msk_nr_processoEnter(Sender: TObject);
begin
  str_proc_msk := Trim( msk_nr_processo.Text );
end;

procedure Tfrm_numerario.dblckpbox_tp_destinoClick(Sender: TObject);
begin
  if ( datm_numerario.qry_itens_solinum_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_mi( False, True, True, False )
  end;

  with datm_numerario do
  begin
    qry_cliente_servico_.Close;
    qry_cliente_servico_.ParamByName('CD_CLIENTE').AsString  := qry_processo_.FieldByName('CD_CLIENTE').AsString;
    qry_cliente_servico_.ParamByName('CD_UNID_NEG').AsString := qry_processo_.FieldByName('CD_UNID_NEG').AsString;
    qry_cliente_servico_.ParamByName('CD_PRODUTO').AsString  := qry_processo_.FieldByName('CD_PRODUTO').AsString;
    qry_cliente_servico_.ParamByName('CD_SERVICO').AsString  := qry_processo_.FieldByName('CD_SERVICO').AsString;
    qry_cliente_servico_.Prepare;
    qry_cliente_servico_.Open;
  end;

  if datm_numerario.qry_itens_solinum_.FieldByName('TP_DESTINO').AsString = '0' then {Terceiros}
  begin
    dbedt_cd_favorecido.Color    := clWindow;
    dbedt_cd_favorecido.ReadOnly := False;
    dbedt_cd_favorecido.TabStop  := True;
    btn_co_favorecido.Enabled    := True;
  end
  else
  begin
    if datm_numerario.qry_itens_solinum_.State in [dsedit, dsInsert] then
    begin
      datm_numerario.qry_itens_solinum_.FieldByName('CD_FAVORECIDO').AsString  := '';
      if datm_numerario.qry_itens_solinum_.FieldByName('TP_DESTINO').AsString = '1' then {Déb. Conta}
         datm_numerario.qry_itens_solinum_.FieldByName('CD_BANCO').AsString :=
            datm_numerario.qry_cliente_servico_.FieldByName('CD_BANCO_DEB_CC').AsString;

      if datm_numerario.qry_itens_solinum_.FieldByName('TP_DESTINO').AsString = '2' then {Comissária}
         datm_numerario.qry_itens_solinum_.FieldByName('CD_BANCO').AsString :=
            datm_numerario.qry_cliente_servico_.FieldByName('CD_BANCO_COM').AsString;

      if datm_numerario.qry_itens_solinum_.FieldByName('TP_DESTINO').AsString = '3' then {Déb Conta da Comissária}
         datm_numerario.qry_itens_solinum_.FieldByName('CD_BANCO').AsString :=
            datm_numerario.qry_cliente_servico_.FieldByName('CD_BANCO_DEB_COM').AsString;

    end;
    dbedt_cd_favorecido.Color    := clMenu;
    dbedt_cd_favorecido.ReadOnly := True;
    dbedt_cd_favorecido.TabStop  := False;
    btn_co_favorecido.Enabled    := False;
  end;
end;

procedure Tfrm_numerario.btn_co_favorecidoClick(Sender: TObject);
begin
  if ( datm_numerario.ds_itens_solinum.AutoEdit ) and
     Not ( datm_numerario.qry_itens_solinum_.State in [dsInsert, dsEdit] ) then
     datm_numerario.qry_itens_solinum_.Edit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2208';
  Application.CreateForm(Tfrm_Favor, frm_Favor);
  frm_Favor.Cons_OnLine := datm_numerario.qry_itens_solinum_CD_FAVORECIDO;
  with frm_Favor do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  vStr_cd_modulo  := lcd_modulo;
  str_cd_rotina  := lcd_rotina;
  datm_numerario.qry_favorecido_.Close;
  datm_numerario.qry_favorecido_.Prepare;
  datm_numerario.qry_favorecido_.Open;
end;

procedure Tfrm_numerario.dbedt_cd_favorecidoExit(Sender: TObject);
begin
  if datm_numerario.qry_itens_solinum_.State in [dsEdit, dsInsert] then
  begin
    ValidCodigo(dbedt_cd_favorecido);
    if dbedt_cd_favorecido.Text <> '' then
    begin
      if dbedt_nm_favorecido.Text = '' then
      begin
        BoxMensagem('Código do Favorecido inválido!',2);
        pgctrl_numerario.ActivePage := ts_item;
        dbedt_cd_favorecido.SetFocus;
        Exit;
      end
      else
      begin
        if Trim( datm_numerario.qry_itens_solinum_.FieldByName('CD_BANCO').AsString ) = '' then
        begin
          datm_numerario.qry_itens_solinum_.FieldByName('CD_BANCO').AsString := datm_numerario.qry_itens_solinum_LookBancoFav.AsString;
          dbedt_cd_bancoExit(nil);
        end;
      end;
    end;
  end;
end;

procedure Tfrm_numerario.btn_print_Click(Sender: TObject);
begin
  if datm_numerario.qry_solinum_.RecordCount > 0 then
  begin
    if Not VerIntegridade then Exit;
    vStr_cd_modulo := '05';
    str_cd_rotina := '0502';
    str_cd_mod    := vStr_cd_modulo;
    str_cd_rot    := str_cd_rotina;
    Application.CreateForm( Tfrm_Impressao_Numerario, frm_Impressao_Numerario );
    frm_impressao_Numerario.msk_cd_unid_neg.Text := msk_cd_unid_neg.Text;
    frm_impressao_Numerario.msk_cd_produto.Text := msk_cd_produto.Text;
    frm_impressao_Numerario.msk_cd_cliente.Text := dbedt_cd_cliente.Text;
    frm_Impressao_Numerario.msk_cd_clienteExit( nil );
    frm_Impressao_Numerario.ShowModal;
    datm_numerario.qry_solinum_.Close;
    datm_numerario.qry_solinum_.Prepare;
    datm_numerario.qry_solinum_.Open;
    datm_numerario.qry_itens_solinum_.Close;
    datm_numerario.qry_itens_solinum_.Prepare;
    datm_numerario.qry_itens_solinum_.Open;
  end
  else BoxMensagem('Não há solicitações registradas para este cliente.',2);
end;

end.
