unit PGCH001;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, ComCtrls;

type
  Tfrm_solic_ch = class(TForm)
    pgctrl_solic_ch: TPageControl;
    ts_lista: TTabSheet;
    ts_solic_ch: TTabSheet;
    dbgrdSolicCheque: TDBGrid;
    pnl_cadastro: TPanel;
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
    pnl_solic_ch: TPanel;
    lbl_nr_solic_ch: TLabel;
    dbedt_nr_solic_ch: TDBEdit;
    dbedt_dt_solic_ch: TDBEdit;
    lbl_dt_solic_ch: TLabel;
    lbl_hm_solic_ch: TLabel;
    dbedt_hm_solic_ch: TDBEdit;
    dbedt_vl_solic_ch: TDBEdit;
    lbl_vl_solic_ch: TLabel;
    dbedt_nr_cheque: TDBEdit;
    lbl_nr_cheque: TLabel;
    lbl_status_cheque: TLabel;
    dblckbox_status_solic_ch: TDBLookupComboBox;
    lbl_banco: TLabel;
    dbedt_cd_banco: TDBEdit;
    dbedt_nm_banco: TDBEdit;
    dbedt_cd_favorecido: TDBEdit;
    lbl_favorecido: TLabel;
    dbedt_nm_favorecido: TDBEdit;
    pnl_solic_ch_itens: TPanel;
    pgctrl_solic_ch_itens: TPageControl;
    ts_lista2: TTabSheet;
    dbg_contatos: TDBGrid;
    ts_solic_ch_itens: TTabSheet;
    lbl_unid_neg: TLabel;
    lbl_produto: TLabel;
    lbl_processo: TLabel;
    lbl_cliente: TLabel;
    lbl_servico: TLabel;
    lbl_item: TLabel;
    lbl_vl_item: TLabel;
    lbl_vl_ir: TLabel;
    lbl_vl_assist: TLabel;
    lbl_despachante: TLabel;
    edt_nm_unid_neg: TEdit;
    edt_nm_produto: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_cd_cliente: TEdit;
    edt_nm_cliente: TEdit;
    edt_cd_servico: TEdit;
    edt_nm_servico: TEdit;
    dbedt_vl_item: TDBEdit;
    dbedt_vl_ir: TDBEdit;
    dbedt_vl_assist: TDBEdit;
    dbedt_cd_item: TDBEdit;
    dbedt_nm_item: TDBEdit;
    dbedt_cd_despachante: TDBEdit;
    dbedt_nm_despachante: TDBEdit;
    msk_nr_processo: TMaskEdit;
    Label1: TLabel;
    dblckbox_st_solic_ch_itens: TDBLookupComboBox;
    btn_canc_solic_ch: TSpeedButton;
    mi_can_solic_ch: TMenuItem;
    lbl_lancamento: TLabel;
    dbedt_nr_lancamento: TDBEdit;
    btn_co_banco: TSpeedButton;
    btn_co_despachante: TSpeedButton;
    btn_co_item: TSpeedButton;
    btn_co_favorecido: TSpeedButton;
    btn_co_unid_neg: TSpeedButton;
    btn_co_produto: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    btn_co_processo: TSpeedButton;
    mi_gerar: TMenuItem;
    mi_gerar_devolucao: TMenuItem;
    mi_liq: TMenuItem;
    Label2: TLabel;
    dbedt_cd_fornecedor: TDBEdit;
    dbedt_nm_fornecedor: TDBEdit;
    btn_co_fornecedor: TSpeedButton;
    mi_receb: TMenuItem;
    mi_sda: TMenuItem;
    lbl_restirui: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure dbnvgBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure pgctrl_solic_chChange(Sender: TObject);
    procedure pgctrl_solic_chChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbedt_cd_bancoChange(Sender: TObject);
    procedure dbedt_cd_bancoExit(Sender: TObject);
    procedure dbedt_cd_favorecidoExit(Sender: TObject);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure btn_co_favorecidoClick(Sender: TObject);
    procedure dbedt_cd_itemExit(Sender: TObject);
    procedure dbedt_cd_despachanteExit(Sender: TObject);
    procedure msk_cd_unid_negChange(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_itemClick(Sender: TObject);
    procedure btn_co_despachanteClick(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure dbnvgClick(Sender: TObject; Button: TNavigateBtn);
    procedure btn_canc_solic_chClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure mi_gerar_devolucaoClick(Sender: TObject);
    procedure Fecha_ch;
    procedure Abre_ch;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mi_liqClick(Sender: TObject);
    procedure dbedt_cd_fornecedorExit(Sender: TObject);
    procedure btn_co_fornecedorClick(Sender: TObject);
    procedure dbedt_cd_bancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mi_recebClick(Sender: TObject);
    procedure mi_sdaClick(Sender: TObject);
  private
    Code : Integer;
    function Consiste : Boolean;
    function Grava    : Boolean;
    function VerAlt   : Boolean;
    function SolicOK  : Boolean;
    procedure Cancelar;
  public
    lNaoConsiste, st_modificar, st_incluir, st_excluir : Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    dt_solic_ch : string[10];
    nr_solic_ch : string[3];
    hm_para_solic_ch : String[5];
  end;

var
  frm_solic_ch: Tfrm_solic_ch;

implementation

uses GSMLIB,  PGGP001, PGGP017, PGCH006, PGSM010, PGSM018, PGSM041, PGSM046, PGSM059, PGSM090,
     PGGP015, PGCH019, PGCH023, PGCH034, PGSD006, PGSM136;

{$R *.DFM}

procedure Tfrm_solic_ch.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_solic_ch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_solic_ch do
    begin
      tbl_status_solic_ch_.Close;
      tbl_status_item_solic_ch_.Close;
      tbl_status_ch_.Close;
      tbl_yesno_.Close;

      qry_param_.Close;
      qry_favorecido_.Close;
      qry_banco_.Close;
      qry_item_.Close;
      qry_desp_.Close;
      qry_processo_.Close;
      qry_unid_neg_.Close;
      qry_produto_.Close;
      qry_servico_.Close;
      qry_emp_nac_.Close;
      qry_solic_ch_.Close;
      qry_solic_ch_itens_.Close;
      qry_solic_ch_usuario_.Close;
      Free;
    end;
    Action := caFree;
  end
  else
    Action := caNone;
end;

procedure Tfrm_solic_ch.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  { Cria o DataModule de Dados de Solicitação de Cheque }
  Application.CreateForm(Tdatm_solic_ch, datm_solic_ch );

  with datm_solic_ch do
  begin
    tbl_status_solic_ch_.Open;
    tbl_status_item_solic_ch_.Open;
    tbl_status_ch_.Open;
    tbl_yesno_.Open;

    qry_param_.Close;
    qry_param_.Prepare;
    qry_param_.Open;
    hm_para_solic_ch := qry_param_HM_PARA_SOLIC_CH.AsString;
    if Trim(hm_para_solic_ch) = '' then
    begin
      BoxMensagem('Atenção! Problemas com tabela de parâmetros!' + #13#10 +
                  'Não tente incluir Solicitação de Cheque. Contate o CPD!', 2);
    end;

    qry_favorecido_.Close;
    qry_favorecido_.Prepare;
    qry_favorecido_.Open;

    qry_banco_.Close;
    qry_banco_.Prepare;
    qry_banco_.Open;

    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;

    qry_desp_.Close;
    qry_desp_.Prepare;
    qry_desp_.Open;

    qry_processo_.Close;
    qry_processo_.Prepare;
    qry_processo_.Open;

    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;

    qry_servico_.Close;
    qry_servico_.Prepare;
    qry_servico_.Open;

    qry_emp_nac_.Close;
    qry_emp_nac_.Prepare;
    qry_emp_nac_.Open;

    Fecha_ch;
    Abre_ch;

    if qry_solic_ch_.RecordCount > 0 then
       pgctrl_solic_ch_itens.Enabled := True
    else
       pgctrl_solic_ch_itens.Enabled := False;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_solic_ch.FormShow(Sender: TObject);
begin
  lNaoConsiste := False;
  if str_cd_tipo_lanc = '1' then
     Caption := 'Solicitação de Cheque'
  else
     Caption := 'Solicitação de Autorização para Débito em Conta';
  pgctrl_solic_ch.ActivePage       := ts_lista;
  pgctrl_solic_ch_itens.ActivePage := ts_lista2;
end;

procedure Tfrm_solic_ch.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
  if (pgctrl_solic_ch.ActivePage = ts_solic_ch) then
  begin
    if ( (datm_solic_ch.qry_solic_ch_CD_STATUS_CHEQUE.AsString = '0') and
         (datm_solic_ch.qry_solic_ch_CD_STATUS_SOLIC_CH.AsString <> '6') and
         (datm_solic_ch.qry_solic_ch_CD_STATUS_SOLIC_CH.AsString <> '7') and
         (datm_solic_ch.qry_solic_ch_CD_STATUS_SOLIC_CH.AsString <> '8') ) then
    begin
      btn_incluir.Enabled := True;
      mi_incluir.Enabled  := True;
    end
    else
    begin
      btn_incluir.Enabled := False;
      mi_incluir.Enabled  := False;
    end;
  end
  else
  begin
    btn_incluir.Enabled := True;
    mi_incluir.Enabled  := True;
  end;
end;

procedure Tfrm_solic_ch.Cancelar;
begin
  try
    if datm_solic_ch.qry_solic_ch_.State in [dsInsert, dsEdit] then
    begin
      datm_solic_ch.qry_solic_ch_.Cancel;
      pgctrl_solic_ch.ActivePage := ts_solic_ch;
      dbedt_cd_banco.SetFocus;
    end
    else
    if datm_solic_ch.qry_solic_ch_itens_.State in [dsInsert, dsEdit] then
    begin
      {Itens da Solicitação}
      datm_solic_ch.qry_solic_ch_itens_.Cancel;
      pgctrl_solic_ch.ActivePage       := ts_solic_ch;
      pgctrl_solic_ch_itens.ActivePage := ts_solic_ch_itens;
      msk_cd_unid_neg.SetFocus;
    end;

    if datm_solic_ch.qry_solic_ch_.RecordCount <= 0 then
    begin
      pgctrl_solic_ch_itens.Enabled := False;
      Btn_Mi(False, False, False, False );
    end
    else
    begin
      pgctrl_solic_ch_itens.Enabled := True;
      Btn_Mi(st_incluir, False, False, st_excluir );
   end;

  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
end;

procedure Tfrm_solic_ch.btn_incluirClick(Sender: TObject);
var
  nr_ult_lanc : String[3];
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;

  if ( pgctrl_solic_ch.ActivePage = ts_lista ) then {Solicitação}
  begin
    with datm_solic_ch do
    begin
      qry_solic_ch_.DisableControls;
      qry_solic_ch_.Cancel;
      qry_solic_ch_.Append;
      qry_solic_ch_.EnableControls;
      qry_solic_ch_CD_USUARIO.AsString         := str_cd_usuario;
      qry_solic_ch_CD_TIPO_LANC.AsString       := str_cd_tipo_lanc;
      qry_solic_ch_DT_SOLIC_CH.AsString        := FormatDateTime( 'dd/mm/yyyy', dt_server );
      try
        qry_solic_ch_HM_SOLIC_CH.AsString      := FormatDateTime( 'hh:mm', Now );
      except
        BoxMensagem('Erro ao converter a seguinte hora:' + TimeToStr(Time), 2)
      end;
      qry_solic_ch_VL_SOLIC_CH.AsFloat         := 0;
      qry_solic_ch_CD_STATUS_SOLIC_CH.AsString := '0'; {Em processamento}
      qry_solic_ch_CD_STATUS_CHEQUE.AsString   := '0'; {Solicitado}
      qry_solic_ch_IN_EMITIR.AsString          := '1'; {Não selecionado para impressão}
    end;
    datm_solic_ch.qry_solic_ch_AfterScroll(nil);
    pgctrl_solic_ch.ActivePage                 := ts_solic_ch;
    pgctrl_solic_ch_itens.Enabled              := False;
    dbedt_cd_banco.SetFocus;
  end
  else {Itens da Solicitação}
  begin
    with datm_solic_ch do
    begin
      qry_solic_ch_itens_.DisableControls;
      qry_solic_ch_itens_.Cancel;

      qry_ult_lanc_.Close;
      qry_ult_lanc_.ParamByName('DT_SOLIC_CH').AsString := FormatDateTime('dd/mm/yyyy', dt_server );
      qry_ult_lanc_.ParamByName('NR_SOLIC_CH').AsString := qry_solic_ch_NR_SOLIC_CH.AsString;
      nr_ult_lanc := UltCod( qry_ult_lanc_, qry_ult_lanc_ULTIMO );
      qry_ult_lanc_.Close;

      qry_solic_ch_itens_.Append;
      qry_solic_ch_itens_CD_FORNECEDOR.AsString := qry_solic_ch_CD_FAVORECIDO.AsString;
      qry_solic_ch_itens_.EnableControls;

      msk_cd_unid_neg.Text := str_cd_unid_neg;
      msk_cd_produto.Text  := str_cd_produto;

      msk_nr_processo.Text := '';

      msk_cd_unid_negExit(nil);
      msk_cd_produtoExit(nil);
      msk_nr_processoExit(nil);

      edt_cd_cliente.Text := '';
      edt_nm_cliente.Text := '';
      edt_cd_servico.Text := '';
      edt_nm_servico.Text := '';

      qry_solic_ch_itens_DT_SOLIC_CH.AsString   := qry_solic_ch_DT_SOLIC_CH.AsString;
      qry_solic_ch_itens_NR_SOLIC_CH.AsString   := qry_solic_ch_NR_SOLIC_CH.AsString;
      qry_solic_ch_itens_NR_LANCAMENTO.AsString := nr_ult_lanc;

      qry_solic_ch_itens_VL_ITEM.AsFloat        := 0;
      qry_solic_ch_itens_VL_IR.AsFloat          := 0;
      qry_solic_ch_itens_VL_ASSIST.AsFloat      := 0;
      qry_solic_ch_itens_IN_RESTITUI.AsString   := '0';

    end;
    datm_solic_ch.qry_solic_ch_itens_AfterScroll(nil);
    pgctrl_solic_ch.ActivePage       := ts_solic_ch;
    pgctrl_solic_ch_itens.ActivePage := ts_solic_ch_itens;
    pgctrl_solic_ch_itens.Enabled    := True;
    msk_cd_unid_neg.SetFocus;
  end;
end;

procedure Tfrm_solic_ch.btn_salvarClick(Sender: TObject);
begin
  pnl_cadastro.SetFocus;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

function Tfrm_solic_ch.Consiste : Boolean;
var
  vl_assist : Double;
begin
  Consiste := True;

  if datm_solic_ch.qry_solic_ch_.State in [dsInsert, dsEdit] then {Solicitação}
  begin
    if Not lNaoConsiste then
    begin
      {Banco}
      if dbedt_cd_banco.Text = '' then
      begin
        BoxMensagem('Campo Banco deve ser preenchido!', 2);
        pgctrl_solic_ch.ActivePage := ts_solic_ch;
        dbedt_cd_banco.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if Not ( datm_solic_ch.qry_solic_ch_.State in [dsEdit, dsInsert] ) then Exit;
    ValidCodigo( dbedt_cd_banco );
    if dbedt_cd_banco.Text <> '' then
    begin
      if dbedt_nm_banco.Text = '' then
      begin
        BoxMensagem('Código do Banco inválido!',2);
        pgctrl_solic_ch.ActivePage := ts_solic_ch;
        dbedt_cd_banco.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if Not lNaoConsiste then
    begin
      {Favorecido}
      if dbedt_cd_favorecido.Text = '' then
      begin
        BoxMensagem('Campo Favorecido deve ser preenchido!', 2);
        pgctrl_solic_ch.ActivePage := ts_solic_ch;
        dbedt_cd_favorecido.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if Not ( datm_solic_ch.qry_solic_ch_.State in [dsEdit, dsInsert] ) then Exit;
    ValidCodigo( dbedt_cd_favorecido );
    if dbedt_cd_favorecido.Text <> '' then
    begin
      if dbedt_nm_favorecido.Text = '' then
      begin
        BoxMensagem('Código do Favorecido inválido!',2);
        pgctrl_solic_ch.ActivePage := ts_solic_ch;
        dbedt_cd_favorecido.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end
  else
  if datm_solic_ch.qry_solic_ch_itens_.State in [dsInsert, dsEdit] then {Itens da Solicitação}
  begin
    {Unidade}
    if msk_cd_unid_neg.Text <> '' then
    begin
      ValCodEdt( msk_cd_unid_neg );
      with datm_solic_ch do
      begin
        qry_unid_neg_.Close;
        qry_unid_neg_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '"';
        qry_unid_neg_.Prepare;
        qry_unid_neg_.Open;
        if qry_unid_neg_.RecordCount > 0 then
        begin
          edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
        end
        else
        begin
          BoxMensagem('Unidade de Negócio não cadastrada!', 2);
          edt_nm_unid_neg.Text             := '';
          pgctrl_solic_ch.ActivePage       := ts_solic_ch;
          pgctrl_solic_ch_itens.ActivePage := ts_solic_ch_itens;
          msk_cd_unid_neg.SetFocus;
          Consiste := False;
          Exit;
        end;
      end
    end
    else
    begin
      edt_nm_unid_neg.Text := '';
    end;

    {Produto}
    if msk_cd_produto.Text <> '' then
    begin
      ValCodEdt( msk_cd_produto );
      with datm_solic_ch do
      begin
        qry_produto_.Close;
        qry_produto_.SQL[2] := 'WHERE CD_PRODUTO = "' + msk_cd_produto.Text + '"';
        qry_produto_.Prepare;
        qry_produto_.Open;
        if qry_produto_.RecordCount > 0 then
        begin
          edt_nm_produto.Text := qry_produto_NM_PRODUTO.AsString;
        end
        else
        begin
          BoxMensagem('Produto não cadastrado!', 2);
          edt_nm_produto.Text              := '';
          pgctrl_solic_ch.ActivePage       := ts_solic_ch;
          pgctrl_solic_ch_itens.ActivePage := ts_solic_ch_itens;
          msk_cd_produto.SetFocus;
          Consiste := False;
          Exit;
        end
      end;
    end
    else
    begin
      edt_nm_produto.Text := '';
    end;

    {Nº Processo}
    if Not lNaoConsiste then
    begin
      if msk_nr_processo.Text = '' then
      begin
        BoxMensagem('Campo Nº processo deve ser preenchido!', 2);
        pgctrl_solic_ch.ActivePage       := ts_solic_ch;
        pgctrl_solic_ch_itens.ActivePage := ts_solic_ch_itens;
        msk_nr_processo.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if msk_nr_processo.Text <> '' then
    begin
      with datm_solic_ch do
      begin
        qry_solic_ch_itens_NR_PROCESSO.AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;

        qry_processo_.Close;
        qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
        qry_processo_.Prepare;
        qry_processo_.Open;
        if qry_processo_.RecordCount > 0 then
        begin
          if Not (qry_solic_ch_itens_.State in [dsInsert, dsEdit]) then
          begin
            qry_solic_ch_itens_.Edit;
          end;
          qry_solic_ch_itens_CD_CLIENTE.AsString := qry_processo_CD_CLIENTE.AsString;
          edt_cd_cliente.Text  := qry_processo_CD_CLIENTE.AsString;
          edt_nm_cliente.Text  := qry_processo_LookCliente.AsString;
          edt_cd_servico.Text  := qry_processo_CD_SERVICO.AsString;
          edt_nm_servico.Text  := qry_processo_LookServico.AsString;
        end
        else
        begin
          edt_cd_cliente.Text  := '';
          edt_cd_servico.Text  := '';
          msk_nr_processo.Text := '';
          BoxMensagem('Processo não cadastrado ou não liberado para esta Unidade/Produto!', 2);
          pgctrl_solic_ch.ActivePage       := ts_solic_ch;
          pgctrl_solic_ch_itens.ActivePage := ts_solic_ch_itens;
          msk_nr_processo.SetFocus;
          Consiste := False;
          Exit;
        end
      end;
    end;

    if Not lNaoConsiste then
    begin
      {Fornecedor}
      if dbedt_cd_fornecedor.Text = '' then
      begin
        BoxMensagem('Campo Fornecedor deve ser preenchido!', 2);
        pgctrl_solic_ch.ActivePage := ts_solic_ch_itens;
        dbedt_cd_fornecedor.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if Not ( datm_solic_ch.qry_solic_ch_itens_.State in [dsEdit, dsInsert] ) then Exit;
    ValidCodigo( dbedt_cd_fornecedor );
    if dbedt_cd_fornecedor.Text <> '' then
    begin
      if dbedt_nm_fornecedor.Text = '' then
      begin
        BoxMensagem('Código do Fornecedor inválido!',2);
        pgctrl_solic_ch.ActivePage := ts_solic_ch_itens;
        dbedt_cd_fornecedor.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Valor IR}
    if datm_solic_ch.qry_solic_ch_itens_LookControlaIR.AsBoolean then
    begin
      dbedt_vl_ir.Color    := clWindow;
      dbedt_vl_ir.ReadOnly := False;
      dbedt_vl_ir.TabStop  := True;
    end
    else
    begin
      dbedt_vl_ir.Color    := clMenu;
      dbedt_vl_ir.ReadOnly := True;
      dbedt_vl_ir.TabStop  := False;
      if datm_solic_ch.qry_solic_ch_itens_.State in [dsInsert, dsEdit] then
      begin
        datm_solic_ch.qry_solic_ch_itens_VL_IR.AsFloat := 0;
      end;
    end;

    {Item}
    if Not lNaoConsiste then
    begin
      if dbedt_cd_item.Text = '' then
      begin
        BoxMensagem('Campo Item deve ser preenchido!', 2);
        pgctrl_solic_ch.ActivePage := ts_solic_ch;
        pgctrl_solic_ch_itens.ActivePage := ts_solic_ch_itens;
        dbedt_cd_item.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if Not ( datm_solic_ch.qry_solic_ch_itens_.State in [dsEdit, dsInsert] ) then Exit;
    ValidCodigo( dbedt_cd_item );
    if dbedt_cd_item.Text <> '' then
    begin
      if ( dbedt_nm_item.Text = '' ) or
         ( datm_solic_ch.qry_solic_ch_itens_Look_IN_SOLIC_CHQ.AsString <> '1' ) then
      begin
        BoxMensagem('Código do Item inválido!',2);
        pgctrl_solic_ch.ActivePage       := ts_solic_ch;
        pgctrl_solic_ch_itens.ActivePage := ts_solic_ch_itens;
        dbedt_cd_item.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Habilita Despachante}
    if datm_solic_ch.qry_solic_ch_itens_CD_ITEM.AsString = str_cd_sda then
    begin
      dbedt_cd_despachante.Color    := clWindow;
      dbedt_cd_despachante.ReadOnly := False;
      dbedt_cd_despachante.TabStop  := True;
      btn_co_despachante.Enabled    := True;
      dbedt_vl_assist.Color         := clWindow;
      dbedt_vl_assist.ReadOnly      := False;
      dbedt_vl_assist.TabStop       := True;

      {Despachante}
      if Not lNaoConsiste then
      begin
        if dbedt_cd_despachante.Text = '' then
        begin
          BoxMensagem('Código do Despachante inválido!',2);
          pgctrl_solic_ch.ActivePage       := ts_solic_ch;
          pgctrl_solic_ch_itens.ActivePage := ts_solic_ch_itens;
          dbedt_cd_despachante.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      ValidCodigo( dbedt_cd_despachante );
      if dbedt_cd_despachante.Text <> '' then
      begin
        if dbedt_nm_despachante.Text = '' then
        begin
          BoxMensagem('Código do Despachante inválido!', 2);
          pgctrl_solic_ch.ActivePage       := ts_solic_ch;
          pgctrl_solic_ch_itens.ActivePage := ts_solic_ch_itens;
          dbedt_cd_despachante.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      {Valor Assist}
      if Not lNaoConsiste then
      begin
        Val( dbedt_vl_assist.Text, vl_assist, Code );
        if vl_assist <= 0 then
        begin
          BoxMensagem('Campo Valor da C. Assist. deve ser maior que zero!', 2);
          pgctrl_solic_ch.ActivePage       := ts_solic_ch;
          pgctrl_solic_ch_itens.ActivePage := ts_solic_ch_itens;
          dbedt_vl_assist.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end
    else
    begin
      dbedt_cd_despachante.Color    := clMenu;
      dbedt_cd_despachante.ReadOnly := True;
      dbedt_cd_despachante.TabStop  := False;
      btn_co_despachante.Enabled    := False;

      dbedt_vl_assist.Color         := clMenu;
      dbedt_vl_assist.ReadOnly      := True;
      dbedt_vl_assist.TabStop       := False;

      if datm_solic_ch.qry_solic_ch_itens_.State in [dsInsert, dsEdit] then
      begin
        datm_solic_ch.qry_solic_ch_itens_CD_DESPACHANTE.AsString := '';
        datm_solic_ch.qry_solic_ch_itens_VL_ASSIST.AsFloat       := 0;
      end;
    end;
  end;
end;

function Tfrm_solic_ch.Grava : Boolean;
var
  nr_solic_ch, nr_lancamento : String;
  Falha : Boolean;
begin
  Falha := False;
  Grava := False;
  if datm_solic_ch.qry_solic_ch_.State in [dsInsert, dsEdit] then {Solicitação}
  begin
    try
      datm_main.db_broker.StartTransaction;
      with datm_solic_ch do
      begin
        try
          StrToTime( Trim(hm_para_solic_ch) );
        except
          BoxMensagem('Erro ao converter a seguinte hora do parâmetro: ' +
                      Trim(hm_para_solic_ch) + #13#10 +
                      'Contate o CPD!', 2)
        end;

        if ( StrToTime(qry_solic_ch_HM_SOLIC_CH.AsString) >
             StrToTime( Trim(hm_para_solic_ch) ) ) and
           ( str_cd_tipo_lanc = '1' ) then
           qry_solic_ch_CD_STATUS_SOLIC_CH.AsString := '8';  // Solicitado fora do horário

        if qry_solic_ch_.State in [dsInsert] then
        begin
          qry_ult_solic_ch_.Close;
          qry_ult_solic_ch_.ParamByName('DT_SOLIC_CH').AsString :=
             FormatDateTime( 'dd/mm/yyyy', dt_server );
          qry_solic_ch_NR_SOLIC_CH.AsString :=
             UltCod( qry_ult_solic_ch_, qry_ult_solic_ch_ULTIMO );
        end;

        nr_solic_ch := qry_solic_ch_NR_SOLIC_CH.AsString;

        qry_solic_ch_.Post;

        Fecha_ch;
        Abre_ch;

        Localiza( qry_solic_ch_usuario_, nr_solic_ch, 'NR_SOLIC_CH' );

      end;
      pgctrl_solic_ch_itens.Enabled := False;

      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        TrataErro(E);
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_solic_ch.qry_solic_ch_.Cancel;
        Grava := False;
      end;
    end;
  end
  else {Itens da Solicitação}
  if datm_solic_ch.qry_solic_ch_itens_.State in [dsInsert, dsEdit] then {Itens da Solicitação}
  begin
    try
      datm_main.db_broker.StartTransaction;
      with datm_solic_ch do
      begin
        nr_solic_ch   := qry_solic_ch_itens_NR_SOLIC_CH.AsString;
        nr_lancamento := qry_solic_ch_itens_NR_LANCAMENTO.AsString;
        datm_solic_ch.qry_solic_ch_itens_.Post;

        CloseStoredProc(sp_proc_item_solic_ch);
        sp_proc_item_solic_ch.ParamByName('@dt_solic_ch').AsString   := qry_solic_ch_itens_DT_SOLIC_CH.AsString;
        sp_proc_item_solic_ch.ParamByName('@nr_solic_ch').AsString   := qry_solic_ch_itens_NR_SOLIC_CH.AsString;
        sp_proc_item_solic_ch.ParamByName('@nr_lancamento').AsString := qry_solic_ch_itens_NR_LANCAMENTO.AsString;
        sp_proc_item_solic_ch.ParamByName('@operacao').AsString      := '+';
        Fecha_ch;
        ExecStoredProc(sp_proc_item_solic_ch);
        if sp_proc_item_solic_ch.ParamByName('Result').AsInteger > 0 then
        begin
          BoxMensagem('Não foi possível completar a operação!', 2);
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          Falha := True;
          Grava := False;
        end;
        CloseStoredProc(sp_proc_item_solic_ch);
        Abre_ch;
        Localiza( qry_solic_ch_usuario_, nr_solic_ch, 'NR_SOLIC_CH' );
        Localiza( qry_solic_ch_itens_, nr_lancamento, 'NR_LANCAMENTO' );
      end;
      if Not Falha then
      begin
        datm_main.db_broker.Commit;
        Grava := True;
      end;
    except
      on E: Exception do
      begin
        TrataErro(E);
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_solic_ch.qry_solic_ch_itens_.Cancel;
        Grava := False;
    end;
    end;
  end;

  Btn_Mi(st_incluir, False, False, st_excluir );

end;

procedure Tfrm_solic_ch.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_solic_ch.dbnvgBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if datm_solic_ch.qry_solic_ch_.State in [dsInsert, dsEdit] then
    datm_solic_ch.qry_solic_ch_.Cancel;
  if datm_solic_ch.qry_solic_ch_itens_.State in [dsInsert, dsEdit] then
    datm_solic_ch.qry_solic_ch_itens_.Cancel;
end;

procedure Tfrm_solic_ch.pgctrl_solic_chChange(Sender: TObject);
begin
  if pgctrl_solic_ch_itens.ActivePage = ts_solic_ch_itens then
  begin
    msk_cd_unid_neg.Text := Copy(datm_solic_ch.qry_solic_ch_itens_NR_PROCESSO.AsString, 1, 2 );
    msk_cd_produto.Text  := Copy(datm_solic_ch.qry_solic_ch_itens_NR_PROCESSO.AsString, 3, 2 );
    msk_nr_processo.Text := Copy( datm_solic_ch.qry_solic_ch_itens_NR_PROCESSO.AsString, 5, 14 );
  end;

  if pgctrl_solic_ch.ActivePage = ts_lista then
    dbnvg.DataSource := datm_solic_ch.ds_solic_ch_usuario_
  else {Itens da Solicitação}
    dbnvg.DataSource := datm_solic_ch.ds_solic_ch_itens;

  if (pgctrl_solic_ch.ActivePage = ts_lista ) or
     ((pgctrl_solic_ch.ActivePage = ts_solic_ch ) and
      (pgctrl_solic_ch_itens.ActivePage = ts_lista2 ) ) then
    dbnvg.Enabled := True
  else
    dbnvg.Enabled := False;

  if ( (pgctrl_solic_ch.ActivePage = ts_lista) and
       (datm_solic_ch.qry_solic_ch_CD_STATUS_CHEQUE.AsString = '0') and
       (datm_solic_ch.qry_solic_ch_CD_STATUS_SOLIC_CH.AsString <> '6') and
       (datm_solic_ch.qry_solic_ch_CD_STATUS_SOLIC_CH.AsString <> '7') ) or
     ( (pgctrl_solic_ch.ActivePage <> ts_lista) and
       (datm_solic_ch.qry_solic_ch_itens_.RecordCount > 0) and
       (datm_solic_ch.qry_solic_ch_itens_CD_STATUS.AsString <> 'C') and
       (datm_solic_ch.qry_solic_ch_CD_STATUS_CHEQUE.AsString = '0') ) then
    begin
      btn_canc_solic_ch.Enabled := True;
      mi_can_solic_ch.Enabled   := True;
    end
    else
    begin
      btn_canc_solic_ch.Enabled := False;
      mi_can_solic_ch.Enabled   := False;
    end;

  if (pgctrl_solic_ch.ActivePage = ts_solic_ch) then
  begin
    if ( (datm_solic_ch.qry_solic_ch_CD_STATUS_CHEQUE.AsString = '0') and
         (datm_solic_ch.qry_solic_ch_CD_STATUS_SOLIC_CH.AsString <> '6') and
         (datm_solic_ch.qry_solic_ch_CD_STATUS_SOLIC_CH.AsString <> '7') and
         (datm_solic_ch.qry_solic_ch_CD_STATUS_SOLIC_CH.AsString <> '8') ) then
    begin
      btn_incluir.Enabled := True;
      mi_incluir.Enabled  := True;
    end
    else
    begin
      btn_incluir.Enabled := False;
      mi_incluir.Enabled  := False;
    end;
  end
  else
  begin
    btn_incluir.Enabled := True;
    mi_incluir.Enabled  := True;
  end;
end;

procedure Tfrm_solic_ch.pgctrl_solic_chChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if pgctrl_solic_ch.ActivePage = ts_lista then
  begin
    if datm_solic_ch.qry_solic_ch_.RecordCount <= 0 then
    begin
      AllowChange := False;
      Exit;
    end;
  end;
  AllowChange := VerAlt;
end;

procedure Tfrm_solic_ch.dbedt_cd_bancoChange(Sender: TObject);
begin
  if datm_solic_ch.qry_solic_ch_.State in [ dsInsert, dsEdit ] then
  begin
    btn_incluir.Enabled  := False;
    mi_incluir.Enabled   := False;
    btn_Salvar.Enabled   := True;
    mi_Salvar.Enabled    := True;
    btn_Cancelar.Enabled := True;
    mi_Cancelar.Enabled  := True;
  end;
end;

procedure Tfrm_solic_ch.dbedt_cd_bancoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_solic_ch.dbedt_cd_favorecidoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_solic_ch.btn_co_bancoClick(Sender: TObject);
begin
  str_cd_modulo := '22';
  str_cd_rotina := '2216';
  Application.CreateForm(Tfrm_banco, frm_banco);
  frm_banco.Cons_OnLine := datm_solic_ch.qry_solic_ch_CD_BANCO;
  with frm_banco do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_solic_ch.qry_solic_ch_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
         datm_solic_ch.qry_solic_ch_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_solic_ch do
  begin
    qry_banco_.Close;
    qry_banco_.Prepare;
    qry_banco_.Open;
  end;
  if str_cd_tipo_lanc = '1' then
  begin
    str_cd_modulo := '07';
    str_cd_rotina := '0701';
  end
  else
  begin
    str_cd_modulo := '08';
    str_cd_rotina := '0801';
  end;
  dbedt_cd_bancoExit(nil);
end;

procedure Tfrm_solic_ch.btn_co_favorecidoClick(Sender: TObject);
begin
  str_cd_modulo := '22';
  str_cd_rotina := '2208';
  Application.CreateForm(Tfrm_favor, frm_favor);
  frm_favor.Cons_OnLine := datm_solic_ch.qry_solic_ch_CD_FAVORECIDO;
  with frm_favor do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_solic_ch.qry_solic_ch_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       begin
         datm_solic_ch.qry_solic_ch_.Edit;
       end;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_solic_ch do
  begin
    qry_favorecido_.Close;
    qry_favorecido_.Prepare;
    qry_favorecido_.Open;
  end;
  if str_cd_tipo_lanc = '1' then
  begin
    str_cd_modulo := '07';
    str_cd_rotina := '0701';
  end
  else
  begin
    str_cd_modulo := '08';
    str_cd_rotina := '0801';
  end;
  dbedt_cd_favorecidoExit(nil);
end;

procedure Tfrm_solic_ch.dbedt_cd_itemExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_solic_ch.dbedt_cd_despachanteExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_solic_ch.msk_cd_unid_negChange(Sender: TObject);
begin
  if datm_solic_ch.qry_solic_ch_itens_.State in [ dsInsert, dsEdit ] then
  begin
    btn_incluir.Enabled  := False;
    mi_incluir.Enabled   := False;
    btn_Salvar.Enabled   := True;
    mi_Salvar.Enabled    := True;
    btn_Cancelar.Enabled := True;
    mi_Cancelar.Enabled  := True;
  end;
end;

procedure Tfrm_solic_ch.msk_cd_unid_negExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_solic_ch.msk_cd_produtoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_solic_ch.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_solic_ch do
  begin
    Application.CreateForm(Tfrm_unidade, frm_unidade );
    with frm_unidade do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
      msk_cd_unid_negExit(nil);
    end;
  end;
end;

procedure Tfrm_solic_ch.btn_co_produtoClick(Sender: TObject);
begin
  with datm_solic_ch do
  begin
    Application.CreateForm(Tfrm_produto, frm_produto );
    with frm_produto do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_produto.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
      msk_cd_produtoExit(nil);
    end;
  end;
end;

procedure Tfrm_solic_ch.btn_co_itemClick(Sender: TObject);
begin
  str_cd_modulo := '22';
  str_cd_rotina := '2214';
  Application.CreateForm(Tfrm_item, frm_item);
  frm_item.Cons_OnLine := datm_solic_ch.qry_solic_ch_itens_CD_ITEM;
  frm_item.lRecDesp := True;
  with frm_item do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_solic_ch.qry_solic_ch_itens_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_solic_ch.qry_solic_ch_itens_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_solic_ch do
  begin
    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;
  end;
  if str_cd_tipo_lanc = '1' then
  begin
    str_cd_modulo := '07';
    str_cd_rotina := '0701';
  end
  else
  begin
    str_cd_modulo := '08';
    str_cd_rotina := '0801';
  end;
  dbedt_cd_itemExit(nil);
end;

procedure Tfrm_solic_ch.btn_co_despachanteClick(Sender: TObject);
begin
  str_cd_modulo := '22';
  str_cd_rotina := '2204';
  Application.CreateForm(Tfrm_despachante, frm_despachante);
  frm_despachante.Cons_OnLine := datm_solic_ch.qry_solic_ch_itens_CD_DESPACHANTE;
  with frm_despachante do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_solic_ch.qry_solic_ch_itens_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
      datm_solic_ch.qry_solic_ch_itens_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_solic_ch do
  begin
    qry_desp_.Close;
    qry_desp_.Prepare;
    qry_desp_.Open;
  end;
  if str_cd_tipo_lanc = '1' then
  begin
    str_cd_modulo := '07';
    str_cd_rotina := '0701';
  end
  else
  begin
    str_cd_modulo := '08';
    str_cd_rotina := '0801';
  end;
  dbedt_cd_despachanteExit(nil);
end;

procedure Tfrm_solic_ch.btn_co_processoClick(Sender: TObject);
begin

  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_consulta_processo,frm_consulta_processo);
  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := msk_cd_produto.Text;
  frm_consulta_processo.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if (frm_consulta_processo.Nr_Processo <> '') then
  begin
    datm_solic_ch.qry_solic_ch_itens_NR_PROCESSO.AsString := frm_consulta_processo.Nr_Processo;
    msk_nr_processo.Text := Copy( frm_consulta_processo.Nr_Processo, 5, 14) ;
    msk_nr_processoExit(nil);
  end;
end;


procedure Tfrm_solic_ch.msk_nr_processoExit(Sender: TObject);
begin
  if msk_nr_processo.Enabled then msk_nr_processo.Text := UpperCase( msk_nr_processo.Text );
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_solic_ch.dbnvgClick(Sender: TObject; Button: TNavigateBtn);
begin
    msk_nr_processo.Text := Copy(datm_solic_ch.qry_solic_ch_itens_NR_PROCESSO.AsString, 5, 14 );

    if msk_nr_processo.Text <> '' then
    begin
      with datm_solic_ch do
      begin
        qry_proc_co_.Close;
        datm_solic_ch.qry_proc_co_.ParamByName('NR_PROCESSO').AsString := Copy( datm_solic_ch.qry_solic_ch_itens_NR_PROCESSO.AsString, 5, 14 );
        qry_proc_co_.Prepare;
        qry_proc_co_.Open;
        if qry_proc_co_.RecordCount > 0 then
        begin
          msk_cd_unid_neg.Text := datm_solic_ch.qry_proc_co_CD_UNID_NEG.AsString;
          edt_nm_unid_neg.Text := datm_solic_ch.qry_proc_co_LookUnidade.AsString;
          msk_cd_produto.Text  := datm_solic_ch.qry_proc_co_CD_PRODUTO.AsString;
          edt_nm_produto.Text  := datm_solic_ch.qry_proc_co_LookProduto.AsString;
          edt_cd_cliente.Text  := qry_proc_co_CD_CLIENTE.AsString;
          edt_nm_cliente.Text  := qry_proc_co_LookCliente.AsString;
          edt_cd_servico.Text  := qry_proc_co_CD_SERVICO.AsString;
          edt_nm_servico.Text  := qry_proc_co_LookServico.AsString;
        end
        else
        begin
          BoxMensagem('Processo não cadastrado ou não liberado!', 2);
          pgctrl_solic_ch.ActivePage := ts_solic_ch;
          pgctrl_solic_ch_itens.ActivePage := ts_solic_ch_itens;
          msk_nr_processo.SetFocus;
        end
      end;
    end;
end;

procedure Tfrm_solic_ch.btn_canc_solic_chClick(Sender: TObject);
begin
  if pgctrl_solic_ch.ActivePage = ts_lista then
  begin
    if datm_solic_ch.qry_solic_ch_.State in [dsInactive] then Exit;
    if ( datm_solic_ch.qry_solic_ch_CD_STATUS_CHEQUE.AsString = '0' ) or {Não impresso nem cancelado}
       ( datm_solic_ch.qry_solic_ch_CD_STATUS_SOLIC_CH.AsString <> '6' ) or {Cancelado pelo Solicitante}
       ( datm_solic_ch.qry_solic_ch_CD_STATUS_SOLIC_CH.AsString <> '7' ) then {Cancelado pelo Sistema}
    begin
      if BoxMensagem('Solicitação será cancelada!' + #13#10 +
         'Confirma Cancelamento?', 1) then
      begin
        with datm_solic_ch do
        begin
          try
            datm_main.db_broker.StartTransaction;
            CloseStoredProc(sp_cancela_solic_ch);
            sp_cancela_solic_ch.ParamByName('@DT_SOLIC_CH').AsString := qry_solic_ch_DT_SOLIC_CH.AsString;
            sp_cancela_solic_ch.ParamByName('@NR_SOLIC_CH').AsString := qry_solic_ch_NR_SOLIC_CH.AsString;
            sp_cancela_solic_ch.ParamByName('@CD_USUARIO').AsString  := str_cd_usuario;
            Fecha_ch;
            ExecStoredProc(sp_cancela_solic_ch);
            CloseStoredProc(sp_cancela_solic_ch);
            Abre_ch;
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
      BoxMensagem('Solicitação não pode ser cancelada!', 2);
    end;
  end
  else
  begin
    if datm_solic_ch.qry_solic_ch_.State in [dsInactive] then Exit;
    if ( datm_solic_ch.qry_solic_ch_CD_STATUS_CHEQUE.AsString = '0' ) or {Não impresso nem cancelado}
       ( datm_solic_ch.qry_solic_ch_itens_CD_STATUS.AsString <> 'C' ) then {Cancelado}
    begin
      if BoxMensagem('Essa Discriminação da Solicitação será cancelada!' + #13#10 +
         'Confirma Cancelamento?', 1) then
      begin
        with datm_solic_ch do
        begin
          try
            datm_main.db_broker.StartTransaction;
            CloseStoredProc(sp_cancela_item_solic_ch);
            sp_cancela_item_solic_ch.ParamByName('@DT_SOLIC_CH').AsString   := qry_solic_ch_itens_DT_SOLIC_CH.AsString;
            sp_cancela_item_solic_ch.ParamByName('@NR_SOLIC_CH').AsString   := qry_solic_ch_itens_NR_SOLIC_CH.AsString;
            sp_cancela_item_solic_ch.ParamByName('@NR_LANCAMENTO').AsString := qry_solic_ch_itens_NR_LANCAMENTO.AsString;
            sp_cancela_item_solic_ch.ParamByName('@CD_USUARIO').AsString    := str_cd_usuario;
            Fecha_ch;
            ExecStoredProc(sp_cancela_item_solic_ch);
            CloseStoredProc(sp_cancela_item_solic_ch);
            Abre_ch;
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
      BoxMensagem('Essa Discriminação da Solicitação não pode ser cancelada!', 2);
    end;
  end;
end;

function Tfrm_solic_ch.VerAlt;
begin
  VerAlt := True;
  if datm_solic_ch.qry_solic_ch_.State in [dsInsert, dsEdit] then
  begin
   if ( ( datm_solic_ch.qry_solic_ch_.State in [dsEdit] ) and st_modificar ) or
       ( datm_solic_ch.qry_solic_ch_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Solicitação de Cheques foi alterada.' + #13#10 +
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
  else  {Itens da Solicitação}
  if datm_solic_ch.qry_solic_ch_itens_.State in [dsInsert, dsEdit] then
  begin
    if ( ( datm_solic_ch.qry_solic_ch_itens_.State in [dsEdit] ) and st_modificar ) or
       ( datm_solic_ch.qry_solic_ch_itens_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Discriminação foi alterada.' + #13#10 +
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

procedure Tfrm_solic_ch.Fecha_ch;
begin
  with datm_solic_ch do
  begin
    nr_solic_ch := qry_solic_ch_NR_SOLIC_CH.AsString;
    qry_solic_ch_usuario_.Close;
    qry_solic_ch_.Close;
    qry_solic_ch_itens_.Close;
  end;
end;

procedure Tfrm_solic_ch.Abre_ch;
begin
  with datm_solic_ch do
  begin
    qry_solic_ch_usuario_.Close;
    qry_solic_ch_usuario_.ParamByName('DT_SOLIC_CH').AsString  := FormatDateTime( 'dd/mm/yyyy', dt_server );
    qry_solic_ch_usuario_.ParamByName('CD_TIPO_LANC').AsString := str_cd_tipo_lanc;
    qry_solic_ch_usuario_.ParamByName('CD_CARGO').AsString     := str_cd_cargo;
    qry_solic_ch_usuario_.ParamByName('CD_USUARIO').AsString   := str_cd_usuario;
    qry_solic_ch_usuario_.Prepare;
    qry_solic_ch_usuario_.Open;
    dt_solic_ch := FormatDateTime( 'dd/mm/yyyy', dt_server );
    qry_solic_ch_usuario_.Locate('NR_SOLIC_CH;DT_SOLIC_CH',
           VarArrayOf([nr_solic_ch, dt_solic_ch]), [loCaseInsensitive]);
    qry_solic_ch_.Prepare;
    qry_solic_ch_.Open;
    qry_solic_ch_itens_.Prepare;
    qry_solic_ch_itens_.Open;
  end;
end;

procedure Tfrm_solic_ch.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_solic_ch.dbedt_cd_fornecedorExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_solic_ch.btn_co_fornecedorClick(Sender: TObject);
begin
  str_cd_modulo := '22';
  str_cd_rotina := '2208';
  Application.CreateForm(Tfrm_favor, frm_favor);
  frm_favor.Cons_OnLine := datm_solic_ch.qry_solic_ch_itens_CD_FORNECEDOR;
  with frm_favor do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_solic_ch.qry_solic_ch_itens_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
    begin
      datm_solic_ch.qry_solic_ch_itens_.Edit;
    end;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_solic_ch do
  begin
    qry_favorecido_.Close;
    qry_favorecido_.Prepare;
    qry_favorecido_.Open;
  end;
  if str_cd_tipo_lanc = '1' then
  begin
    str_cd_modulo := '07';
    str_cd_rotina := '0701';
  end
  else
  begin
    str_cd_modulo := '08';
    str_cd_rotina := '0801';
  end;
  dbedt_cd_fornecedorExit(nil);
end;

procedure Tfrm_solic_ch.dbedt_cd_bancoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = VK_F5 then
  begin
    if Sender = dbedt_cd_banco       then btn_co_bancoClick(nil);
    if Sender = dbedt_cd_favorecido  then btn_co_favorecidoClick(nil);
    if Sender = dbedt_cd_fornecedor  then btn_co_fornecedorClick(nil);
    if Sender = msk_cd_unid_neg      then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto       then btn_co_produtoClick(nil);
    if Sender = msk_nr_processo      then btn_co_processoClick(nil);
    if Sender = dbedt_cd_item        then btn_co_itemClick(nil);
    if Sender = dbedt_cd_despachante then btn_co_despachanteClick(nil);
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

procedure Tfrm_solic_ch.mi_gerar_devolucaoClick(Sender: TObject);
begin
  if SolicOK then
  begin
    Application.CreateForm(Tfrm_gera_ch_devol, frm_gera_ch_devol);
    frm_gera_ch_devol.ShowModal;
    Fecha_ch;
    Abre_ch;
  end;
end;

procedure Tfrm_solic_ch.mi_liqClick(Sender: TObject);
begin
  if SolicOK then
  begin
    Application.CreateForm(Tfrm_gera_ch_liq, frm_gera_ch_liq);
    frm_gera_ch_liq.ShowModal;
    Fecha_ch;
    Abre_ch;
  end;
end;

procedure Tfrm_solic_ch.mi_recebClick(Sender: TObject);
begin
  if SolicOK then
  begin
    Application.CreateForm(Tfrm_gera_ch_sm, frm_gera_ch_sm);
    frm_gera_ch_sm.ShowModal;
    Fecha_ch;
    Abre_ch;
  end;
end;

procedure Tfrm_solic_ch.mi_sdaClick(Sender: TObject);
begin
  if SolicOK then
  begin
    Application.CreateForm(Tfrm_gera_ch_SDA, frm_gera_ch_SDA);
    frm_gera_ch_SDA.ShowModal;
    Fecha_ch;
    Abre_ch;
  end;
end;

function Tfrm_solic_ch.SolicOK: Boolean;
begin
  SolicOK := False;
  if ( datm_solic_ch.qry_solic_ch_.RecordCount > 0 ) and
     ( datm_solic_ch.qry_solic_ch_itens_.RecordCount = 0 ) then
  begin
    if ( datm_solic_ch.qry_solic_ch_CD_STATUS_SOLIC_CH.AsString = '0') then
    begin
      SolicOK := True;
    end
    else
    begin
      BoxMensagem('A solicitação não está liberada!', 2);
    end;
  end
  else
  begin
    BoxMensagem('A solicitação tem que estar vazia!', 2);
  end;
end;
end.
