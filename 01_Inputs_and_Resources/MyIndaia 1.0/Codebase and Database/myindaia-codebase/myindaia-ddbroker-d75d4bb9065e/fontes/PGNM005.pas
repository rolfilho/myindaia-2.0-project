unit PGNM005;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ComCtrls, Menus, StdCtrls, DBCtrls, Mask, Buttons, Db,
  ExtCtrls, Funcoes;

type
  Tfrm_devolucao = class(TForm)
    pnl_selecao: TPanel;
    lbl_cd_cliente: TLabel;
    lbl_nr_processo: TLabel;
    btn_processo: TSpeedButton;
    Label3: TLabel;
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
    btn_incluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    pgctrl_devolucao: TPageControl;
    ts_recebimento: TTabSheet;
    ts_devolucoes: TTabSheet;
    ts_distribuicao: TTabSheet;
    dbg_devolucao: TDBGrid;
    dbg_receb: TDBGrid;
    dbg_receb_item: TDBGrid;
    btn_cancela_devolucao: TSpeedButton;
    mi_cancela_devolucao: TMenuItem;
    pnl_devolucao: TPanel;
    Label4: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    dbedt_nr_recebimento: TDBEdit;
    dbedt_dt_recebimento: TDBEdit;
    pnl_devol_item: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dbedt_nr_lanc_receb: TDBEdit;
    dbedt_vl_devolucao_item: TDBEdit;
    dbedt_LK_NM_ITEM: TDBEdit;
    dbg_distribuicao: TDBGrid;
    Label5: TLabel;
    Label12: TLabel;
    dbedt_vl_devolucao: TDBEdit;
    msk_vl_recebido: TMaskEdit;
    msk_vl_utilizado: TMaskEdit;
    Label13: TLabel;
    msk_tot_distr: TMaskEdit;
    Label14: TLabel;
    msk_vl_disponivel: TMaskEdit;
    dbg_devolucao_item: TDBGrid;
    dbedt_vl_disponivel_item: TDBEdit;
    pnl_menu: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure msk_cd_unid_negChange(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_cd_produtoClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure btn_processoClick(Sender: TObject);
    procedure btn_mi(i:Boolean; s:Boolean; c:Boolean; e:Boolean);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure Cancelar;
    function Distribui : Boolean;
    procedure btn_cancelarClick(Sender: TObject);
    procedure pgctrl_devolucaoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancela_devolucaoClick(Sender: TObject);
    procedure dbg_distribuicaoDblClick(Sender: TObject);
    procedure dbedt_vl_devolucao_itemExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_dt_recebimentoExit(Sender: TObject);

  private
    { Private declarations }
    st_unid_neg  : String[2];
    st_produto   : String[2];
    lcd_modulo   : String[2];
    lcd_rotina   : String[4];
    chave        : String;
    ldif_distr, ltrava  : Boolean;

    function habilitacao : Boolean;
    function Consiste    : Boolean;
    function Grava       : Boolean;
    function VerAlt      : Boolean;

  public
    { Public declarations }
    lCons_OnLine  : Boolean;
    Cons_OnLine   : TStringField;
    st_modificar, st_incluir, st_excluir, ldistribuindo : Boolean;
    nr_devolucao  : String[3];
    vl_disponivel : Currency;
  end;

var
  frm_devolucao: Tfrm_devolucao;

implementation

{$R *.DFM}

uses GSMLIB, PGNM006, PGGP017, PGGP001, PGSM010, PGSM018, PGSM136, PGGP015;

procedure Tfrm_devolucao.FormCreate(Sender: TObject);
begin
  { Cria o DataModule de Dados de Numerario }
  Application.CreateForm(Tdatm_devolucao, datm_devolucao );

  lcd_modulo := vStr_cd_modulo;
  lcd_rotina := str_cd_rotina;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_unid_negExit(nil);
  msk_cd_produtoExit(nil);
  if str_nr_processo <> str_proc_zeros then
     msk_nr_processo.Text := Copy( str_nr_processo, 5, 14);

  datm_devolucao.ds_devolucao.AutoEdit       := st_modificar;
  datm_devolucao.ds_itens_devolucao.AutoEdit := st_modificar;

  ts_distribuicao.TabVisible := False;
  ltrava := False;
end;

procedure Tfrm_devolucao.FormShow(Sender: TObject);
begin
  pgctrl_devolucao.ActivePage := ts_recebimento;
  msk_nr_processo.setfocus;
end;

procedure Tfrm_devolucao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Not VerAlt then Exit;
  with datm_devolucao do
  begin
    qry_devolucao_.Close;
    qry_itens_devol_lista_.Close;
    qry_itens_devolucao_.Close;
    qry_item_.Close;
    qry_banco_.Close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_usuario_habilitacao_.Close;
    qry_processo_.Close;
    qry_itens_receb_.Close;
    qry_receb_.Close;
    qry_usuario_.Close;
    tbl_yesno_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_devolucao.msk_cd_unid_negChange(Sender: TObject);
begin
  msk_nr_processo.Text := '';
end;

procedure Tfrm_devolucao.msk_cd_unid_negEnter(Sender: TObject);
begin
  st_unid_neg := msk_cd_unid_neg.Text;
end;

procedure Tfrm_devolucao.msk_cd_produtoEnter(Sender: TObject);
begin
  st_produto := msk_cd_produto.Text;
end;

procedure Tfrm_devolucao.msk_cd_unid_negExit(Sender: TObject);
var foco : Boolean;
begin
  if Not (st_unid_neg = msk_cd_unid_neg.Text) then
  begin
    with datm_devolucao do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.Locate('CD_UNID_NEG', msk_cd_unid_neg.Text, [loCaseInsensitive, loPartialKey]) then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_AP_UNID_NEG.AsString;
        foco := Not Habilitacao;
      end
      else
      begin
        edt_nm_unid_neg.Clear;
        BoxMensagem('Unidade não habilitada/ativa!', 2);
        foco := True;
      end;
      qry_unid_neg_.Close;
    end;
    msk_nr_processo.Text := '';
    msk_nr_processoExit(nil);
    if foco then
    begin
      pgctrl_devolucao.ActivePage := ts_recebimento;
      msk_cd_unid_neg.SetFocus;
    end;
  end
end;

procedure Tfrm_devolucao.msk_cd_produtoExit(Sender: TObject);
var foco : boolean;
begin
  if Not (st_produto = msk_cd_produto.Text) then
  begin
    with datm_devolucao do
    begin
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_produto_.Open;
      if qry_produto_.Locate('CD_PRODUTO', msk_cd_produto.text, [loCaseInsensitive, loPartialKey]) then
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
    msk_nr_processo.Text := '';
    msk_nr_processoExit(nil);
    if foco then
    begin
      pgctrl_devolucao.ActivePage := ts_recebimento;
      msk_cd_produto.SetFocus;
    end;
  end;
end;

function Tfrm_devolucao.Habilitacao : Boolean;
begin
  Habilitacao := True;
  if (msk_cd_unid_neg.Text <> '') and
     (msk_cd_produto.Text <> '') then
  with datm_devolucao do
  begin
    qry_usuario_habilitacao_.Close;
    qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
    qry_usuario_habilitacao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_usuario_habilitacao_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
    qry_usuario_habilitacao_.Open;
    if qry_usuario_habilitacao_IN_ATIVO.AsString <> '1' then
    begin
      BoxMensagem('A habilitação não está ativa!', 2);
      Habilitacao := False;
    end;
    qry_usuario_habilitacao_.Close;
  end;
end;

procedure Tfrm_devolucao.btn_cd_unid_negClick(Sender: TObject);
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
    frm_devolucao.msk_cd_unid_negExit(Sender);
  end;
end;

procedure Tfrm_devolucao.btn_cd_produtoClick(Sender: TObject);
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
    frm_devolucao.msk_cd_produtoExit(nil);
  end;
end;

procedure Tfrm_devolucao.msk_nr_processoExit(Sender: TObject);
begin
  with datm_devolucao do
  begin
    if qry_devolucao_.State in [dsEdit, dsInsert] then Exit;
    qry_processo_.Close;
    if Not processo_nulo( msk_nr_processo.Text ) then
    begin
        qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
        qry_processo_.Open;
        qry_receb_.Close;
        qry_receb_.Open;
        qry_itens_receb_.Close;
        qry_itens_receb_.Open;
        qry_devolucao_.Close;
        qry_devolucao_.Open;
        qry_itens_devol_lista_.Close;
        qry_itens_devol_lista_.Open;
        qry_itens_devolucao_.Close;
        qry_itens_devolucao_.Open;
        if qry_processo_.RecordCount = 0 then
        begin
          MessageDlg('Processo não encontrado!', mtError, [mbOk], 0);
          btn_mi (False, False, False, False);
        end
        else
        begin
          if datm_devolucao.qry_receb_.RecordCount > 0 then
            if datm_devolucao.qry_devolucao_.RecordCount > 0 then
            begin
              btn_mi (st_incluir, False, False, st_excluir);
              if ( datm_devolucao.qry_devolucao_IN_CANCELADO.AsString = '0' ) and
                 ( datm_devolucao.qry_devolucao_IN_TRANSFERIDO.AsString = '0' ) then
              begin
                btn_cancela_devolucao.Enabled := True;
                mi_cancela_devolucao.Enabled  := True;
              end
              else
              begin
                btn_cancela_devolucao.Enabled := False;
                mi_cancela_devolucao.Enabled  := False;
              end;
            end
            else
            begin
              btn_mi (st_incluir, False, False, False);
              btn_cancela_devolucao.Enabled   := False;
              mi_cancela_devolucao.Enabled    := False;
            end
          else
          begin
            btn_mi (False, False, False, False);
            btn_cancela_devolucao.Enabled := False;
            mi_cancela_devolucao.Enabled  := False;
          end
        end;
        if qry_processo_IN_LIBERADO.AsString <> '1' then
        begin
          MessageDlg('Processo não esta liberado!', mtError, [mbOk], 0);
          msk_nr_processo.SetFocus;
        end;
      end;
    //end;
   pgctrl_devolucao.ActivePage := ts_devolucoes;
  end;
end;

procedure Tfrm_devolucao.btn_processoClick(Sender: TObject);
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
    msk_nr_processo.Text := Copy(frm_consulta_processo.Nr_Processo, 5, 14 );
    msk_nr_processoExit (Sender);
  end;
end;

procedure Tfrm_devolucao.btn_mi(i:Boolean; s:Boolean; c:Boolean; e:Boolean);
begin
  btn_incluir.Enabled  := i;
  mi_incluir.Enabled   := i;
  btn_salvar.Enabled   := s;
  mi_salvar.Enabled    := s;
  btn_Cancelar.Enabled := c;
  mi_Cancelar.Enabled  := c;
//  btn_excluir.Enabled  := e;
//  mi_excluir.Enabled   := e;
end;

procedure Tfrm_devolucao.btn_incluirClick(Sender: TObject);
begin
  try
    with datm_devolucao do
    begin
      qry_existe_fav_cli_.Close;
      qry_existe_fav_cli_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
      qry_existe_fav_cli_.Prepare;
      qry_existe_fav_cli_.Open;
      if qry_existe_fav_cli_CD_FAVORECIDO.AsString = '' then
      begin
        BoxMensagem( 'Devolução não pode ser paga sem Favorecido cadastrado!!!!', 2 );
        qry_existe_fav_cli_.Close;
        Exit;
      end;
      qry_existe_fav_cli_.Close;

      qry_devolucao_.Last;
      nr_devolucao := qry_devolucao_NR_DEVOLUCAO.AsString;
      if nr_devolucao = '' then
        nr_devolucao := '001'
      else
        nr_devolucao := StrZero(StrToInt(nr_devolucao)+1,3);
      qry_devolucao_.Append;
      qry_devolucao_NR_PROCESSO.AsString    := qry_processo_NR_PROCESSO.AsString;
      qry_devolucao_NR_DEVOLUCAO.AsString   := nr_devolucao;
      qry_devolucao_DT_DEVOLUCAO.AsDateTime := Date;
      qry_devolucao_CD_USUARIO.AsString     := str_cd_usuario;
    end;
  except
    on E: Exception do
    begin
      datm_devolucao.qry_devolucao_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  //posiciona registro

  pgctrl_devolucao.ActivePage   := ts_distribuicao;
  ts_distribuicao.TabVisible    := True;
  pnl_selecao.Enabled           := False;
  pnl_devolucao.Enabled         := True;
  pnl_devol_item.Enabled        := False;
  pnl_devol_item.Visible        := False;
  dbedt_vl_devolucao.SetFocus;
  btn_mi (False, True, True, False);
  btn_cancela_devolucao.Enabled := False;
  mi_cancela_devolucao.Enabled  := False;
  ldistribuindo                 := False;
  ltrava                        := True;

  with datm_devolucao do
  begin
    qry_saldo_proc_.Close;
    qry_saldo_proc_.ParamByName('NR_PROCESSO').AsString := qry_devolucao_NR_PROCESSO.AsString;
    qry_saldo_proc_.Prepare;
    qry_saldo_proc_.Open;

    msk_vl_recebido.Text   := FormatFloat('#0,.00', qry_saldo_proc_VL_RECEBIDO.AsCurrency);
    msk_vl_utilizado.Text  := FormatFloat('#0,.00', qry_saldo_proc_VL_UTILIZADO.AsCurrency);
    vl_disponivel          := qry_saldo_proc_VL_RECEBIDO.AsCurrency - qry_saldo_proc_VL_UTILIZADO.AsCurrency;
    msk_vl_disponivel.Text := FormatFloat('#0,.00', vl_disponivel);
    qry_saldo_proc_.Close;
  end
end;

function Tfrm_devolucao.Consiste : Boolean;
begin
  if ldistribuindo then
  begin
    datm_devolucao.qry_tot_devolucao_.Close;
    datm_devolucao.qry_tot_devolucao_.Prepare;
    datm_devolucao.qry_tot_devolucao_.Open;
    if datm_devolucao.qry_devolucao_VL_DEVOLUCAO.AsCurrency <>
       datm_devolucao.qry_tot_devolucao_TOT_DEVOLVIDO.AsCurrency then
    begin
      BoxMensagem('A distribuição não confere com a devolução informada!', 2);
      pgctrl_devolucao.ActivePage := ts_distribuicao;
      ldif_distr := True;
      Consiste   := False;
    end
    else
      Consiste   := True;
    datm_devolucao.qry_tot_devolucao_.Close;
    exit;
  end;
  if dbedt_vl_devolucao.Text = '' then
  begin
    BoxMensagem('Campo Valor deve ser preenchido!', 2);
    pgctrl_devolucao.ActivePage := ts_distribuicao;
    dbedt_vl_devolucao.SetFocus;
    Consiste := False;
    exit;
  end
  else
  begin
    if datm_devolucao.qry_devolucao_VL_DEVOLUCAO.AsCurrency > vl_disponivel then
    begin
      BoxMensagem('A devolução não pode exceder ao valor disponível!', 2);
      pgctrl_devolucao.ActivePage := ts_distribuicao;
      dbedt_vl_devolucao.SetFocus;
      Consiste := False;
      exit;
    end
  end;
  Consiste := True;
end;

function Tfrm_devolucao.Grava : Boolean;
begin
  with datm_devolucao do
  begin
    qry_caixa_ctrl_.Close;
    qry_caixa_ctrl_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
    qry_caixa_ctrl_.Prepare;
    qry_caixa_ctrl_.Open;
    if Not qry_caixa_ctrl_.EOF then
       if ( qry_devolucao_DT_DEVOLUCAO.AsDateTime > Date ) or
          ( qry_devolucao_DT_DEVOLUCAO.AsDateTime < qry_caixa_ctrl_.FieldByName('DT_MOVIMENTO').AsDateTime ) then
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
        CloseStoredProc(sp_atz_devolucao);
        sp_atz_devolucao.ParamByName('@nr_processo').AsString  := qry_devolucao_NR_PROCESSO.AsString;
        sp_atz_devolucao.ParamByName('@nr_devolucao').AsString := qry_devolucao_NR_DEVOLUCAO.AsString;
        ExecStoredProc(sp_atz_devolucao);
        case sp_atz_devolucao.ParamByName('Result').AsInteger of
          1: begin
               BoxMensagem( 'Favorecido não cadastrado para este cliente', 2 );
               if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
               Grava := False;
               Exit;
             end;
        else datm_main.db_broker.Commit;
        end;
        CloseStoredProc(sp_atz_devolucao);
        Grava := True;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
          Grava := False;
        end;
      end;
      ldistribuindo := False;
      qry_devolucao_.Close;
      qry_devolucao_.Open;
      qry_itens_devol_lista_.Close;
      qry_itens_devol_lista_.Open;
      qry_itens_devolucao_.Close;
      qry_itens_devolucao_.Open;
      ts_distribuicao.TabVisible    := False;
      pnl_selecao.Enabled           := True;
      pgctrl_devolucao.ActivePage   := ts_devolucoes;
      btn_cancela_devolucao.Enabled := True;
      mi_cancela_devolucao.Enabled  := True;
    end
    else
    begin
      try
        datm_main.db_broker.StartTransaction;
        if ( qry_devolucao_.State in [dsInsert, dsEdit] ) then
        begin
          chave := qry_devolucao_NR_PROCESSO.Asstring +
                   qry_devolucao_NR_DEVOLUCAO.Asstring;
          //grava recebimento
          qry_devolucao_.Post;

          chave := qry_devolucao_NR_DEVOLUCAO.Asstring;

          qry_devolucao_.Close;
          qry_devolucao_.Prepare;
          qry_devolucao_.Open;
          qry_devolucao_.Locate('NR_DEVOLUCAO', chave, [loPartialKey]);
        end;
        datm_main.db_broker.Commit;
        pnl_devolucao.Enabled  := False;
        Distribui;
        ldistribuindo          := True;
        pnl_devol_item.Enabled := True;
        Grava                  := True;
      except
        on E: Exception do
        begin
          qry_devolucao_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
          Grava := False;
        end;
      end;
    end;
    if Not ldistribuindo then btn_mi (st_incluir, False, False, st_excluir)
  end;
end;

function Tfrm_devolucao.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( datm_devolucao.qry_devolucao_.State in [dsEdit, dsInsert] ) or
     ( ldistribuindo ) then
  begin
    if BoxMensagem('Devolucao foi alterado' + #13#10 +
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

procedure Tfrm_devolucao.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  close;
end;

procedure Tfrm_devolucao.Cancelar;
begin
  if ldistribuindo then
  begin
    with datm_devolucao do
    begin
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(sp_apaga_devol);
        sp_apaga_devol.ParamByName('@nr_processo').AsString  := qry_devolucao_NR_PROCESSO.AsString;
        sp_apaga_devol.ParamByName('@nr_devolucao').AsString := qry_devolucao_NR_DEVOLUCAO.AsString;
        ExecStoredProc(sp_apaga_devol);
        CloseStoredProc(sp_apaga_devol);
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;

      ldistribuindo := False;
      qry_devolucao_.Close;
      qry_devolucao_.Open;
      qry_itens_devol_lista_.Close;
      qry_itens_devol_lista_.Open;
      qry_itens_devolucao_.Close;
      qry_itens_devolucao_.Open;
    end
  end
  else
  begin
    try
      if datm_devolucao.qry_devolucao_.State in [dsInsert, dsEdit] then
         datm_devolucao.qry_devolucao_.Cancel;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
  end;
  ts_distribuicao.TabVisible    := False;
  pnl_selecao.Enabled           := True;
  btn_mi (st_incluir, False, False, st_excluir);
  pgctrl_devolucao.ActivePage   := ts_devolucoes;
  btn_cancela_devolucao.Enabled := True;
  mi_cancela_devolucao.Enabled  := True;
end;

Function Tfrm_devolucao.Distribui : Boolean;
Var
  nValor : Currency;
  nSaldo_devolucao : Currency;
  nr_lancamento : string[3];
begin
  with datm_devolucao do
  begin
    qry_saldo_receb_.Close;
    qry_saldo_receb_.Prepare;
    qry_saldo_receb_.Open;
    if qry_saldo_receb_.RecordCount > 0 then
    begin
      nr_lancamento := '000';
      nSaldo_devolucao := qry_devolucao_VL_DEVOLUCAO.AsCurrency;
      qry_saldo_receb_.First;
      while Not ( qry_saldo_receb_.eof ) do
      begin
        nValor := qry_saldo_receb_VL_RECEBIDO.AsCurrency -
                  qry_saldo_receb_VL_DEVOLUCAO.AsCurrency -
                  qry_saldo_receb_VL_UTILIZADO.AsCurrency;
        if ( nValor > 0 ) then
        begin
          nr_lancamento := StrZero(StrToInt(nr_lancamento)+1,3);
          qry_itens_devolucao_.Append;
          qry_itens_devolucao_NR_PROCESSO.AsString    := qry_processo_NR_PROCESSO.AsString;
          qry_itens_devolucao_NR_DEVOLUCAO.AsString   := qry_devolucao_NR_DEVOLUCAO.AsString;
          qry_itens_devolucao_NR_LANC_DEVOL.AsString  := nr_lancamento;
          qry_itens_devolucao_NR_RECEBIMENTO.AsString := qry_saldo_receb_NR_RECEBIMENTO.AsString;
          qry_itens_devolucao_NR_LANC_RECEB.AsString  := qry_saldo_receb_NR_LANC_RECEB.AsString;
          qry_itens_devolucao_CD_ITEM.AsString        := qry_saldo_receb_CD_ITEM.AsString;
          if nSaldo_devolucao > 0 then
          begin
            if ( nValor <= nSaldo_devolucao ) then
            begin
              qry_itens_devolucao_VL_DEVOLVIDO.AsCurrency := nValor;
              nSaldo_devolucao := nSaldo_devolucao - nValor;
            end
            else
            begin
              qry_itens_devolucao_VL_DEVOLVIDO.AsCurrency := nSaldo_devolucao;
              nSaldo_devolucao := 0;
            end;
          end
          else
          begin
            qry_itens_devolucao_VL_DEVOLVIDO.AsCurrency := 0;
          end;
          qry_itens_devolucao_.post;
        end;
        qry_saldo_receb_.Next;
      end;
    end;
    qry_itens_devol_lista_.Close;
    qry_itens_devol_lista_.Open;
    qry_itens_devolucao_.Close;
    qry_itens_devolucao_.Open;
    Result := True;
  end;
end;

procedure Tfrm_devolucao.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
  ts_distribuicao.TabVisible    := False;
  pgctrl_devolucao.ActivePage   := ts_devolucoes;
  btn_cancela_devolucao.Enabled := True;
  mi_cancela_devolucao.Enabled  := True;
  ltrava                        := False;
end;

procedure Tfrm_devolucao.pgctrl_devolucaoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := Not ltrava;
end;

procedure Tfrm_devolucao.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava    then Exit;
  ltrava := False;
end;

procedure Tfrm_devolucao.btn_cancela_devolucaoClick(Sender: TObject);
begin
  if datm_devolucao.qry_devolucao_IN_CANCELADO.AsString = '1' then
  begin
    BoxMensagem( 'Processo já cancelado!', 2 );
  end
  else
  begin
    with datm_devolucao do
    begin
      qry_existe_ch_devol_.Close;
      qry_existe_ch_devol_.ParamByName('NR_PROCESSO').AsString   := qry_devolucao_NR_PROCESSO.AsString;
      qry_existe_ch_devol_.ParamByName('NR_LANCAMENTO').AsString := qry_devolucao_NR_SOLIC_CH.AsString;
      qry_existe_ch_devol_.Prepare;
      qry_existe_ch_devol_.Open;
      if ( qry_existe_ch_devol_CD_STATUS_CHEQUE.AsString = '1' ) or
         ( qry_existe_ch_devol_CD_STATUS_CHEQUE.AsString = '2' ) then
      begin
        BoxMensagem( 'Existe Cheque Emitido para esta devolução!' + #13#10 + 'Cancele-o primeiro!', 2 );
        Exit;
      end;
      qry_existe_ch_devol_.Close;

      try
        datm_main.db_broker.StartTransaction;

        if Not (qry_devolucao_.State in [dsInsert, dsEdit]) then
           qry_devolucao_.Edit;

        qry_devolucao_IN_CANCELADO.AsString      := '1';
        qry_devolucao_DT_CANCELAMENTO.AsDateTime := Date;
        qry_devolucao_CD_USUARIO_CANC.AsString   := str_cd_usuario;
        qry_devolucao_.Post;


        CloseStoredProc(sp_atz_devolucao);
        sp_atz_devolucao.ParamByName('@nr_processo').AsString  := qry_devolucao_NR_PROCESSO.AsString;
        sp_atz_devolucao.ParamByName('@nr_devolucao').AsString := qry_devolucao_NR_DEVOLUCAO.AsString;
        ExecStoredProc(sp_atz_devolucao);
        CloseStoredProc(sp_atz_devolucao);
        datm_main.db_broker.Commit;

      except
        on E: Exception do
        begin
          datm_devolucao.qry_devolucao_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;
  end;
end;

procedure Tfrm_devolucao.dbg_distribuicaoDblClick(Sender: TObject);
begin
  pnl_devol_item.Visible := True;
  pnl_devol_item.Enabled := True;
  datm_devolucao.qry_itens_devolucao_.Edit;
  dbedt_vl_devolucao_item.SetFocus;
  with datm_devolucao do
  begin
    qry_tot_devolucao_.Close;
    qry_tot_devolucao_.Prepare;
    qry_tot_devolucao_.Open;
    msk_tot_distr.Text := FormatFloat('#0,.00', qry_tot_devolucao_TOT_DEVOLVIDO.AsCurrency);
    qry_tot_devolucao_.Close;
  end
end;

procedure Tfrm_devolucao.dbedt_vl_devolucao_itemExit(Sender: TObject);
begin
  with datm_devolucao do
  begin
    if qry_itens_devolucao_.State in [dsEdit] then
      qry_itens_devolucao_.Post;
    qry_itens_devol_lista_.Close;
    qry_itens_devol_lista_.Open;  
  end
end;

procedure Tfrm_devolucao.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_cd_produtoClick(nil);
    if Sender = msk_nr_processo then btn_processoClick(nil);
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

procedure Tfrm_devolucao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_devolucao.dbedt_dt_recebimentoExit(Sender: TObject);
begin
  with datm_devolucao do
  begin
    qry_caixa_ctrl_.Close;
    qry_caixa_ctrl_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
    qry_caixa_ctrl_.Prepare;
    qry_caixa_ctrl_.Open;
    if Not qry_caixa_ctrl_.EOF then
       if ( qry_devolucao_DT_DEVOLUCAO.AsDateTime > Date ) or
          ( qry_devolucao_DT_DEVOLUCAO.AsDateTime < qry_caixa_ctrl_.FieldByName('DT_MOVIMENTO').AsDateTime ) then
       BoxMensagem( 'Movimento financeiro fechado, ou Data inválida', 2 );
    qry_caixa_ctrl_.Close;
  end;
end;

end.
