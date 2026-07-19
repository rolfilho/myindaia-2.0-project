unit PGPG001;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, ComCtrls, Funcoes;

type
  Tfrm_solic_pagto = class(TForm)
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
    btn_solicitar: TSpeedButton;
    btn_marca_todas: TSpeedButton;
    btn_desmarca_todas: TSpeedButton;
    btn_canc_lanc: TSpeedButton;
    mi_solicitar: TMenuItem;
    mi_canc_lanc: TMenuItem;
    mi_desmarca: TMenuItem;
    mi_marca: TMenuItem;
    btn_monta_pagto: TSpeedButton;
    mi_monta_pagto: TMenuItem;
    Panel1: TPanel;
    lbl_unid_neg: TLabel;
    lbl_produto: TLabel;
    btn_co_unid_neg: TSpeedButton;
    btn_co_produto: TSpeedButton;
    lbl_processo: TLabel;
    btn_co_processo: TSpeedButton;
    lbl_cliente: TLabel;
    lbl_servico: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_nr_processo: TMaskEdit;
    edt_cd_cliente: TEdit;
    edt_nm_cliente: TEdit;
    edt_cd_servico: TEdit;
    edt_nm_servico: TEdit;
    btnDespesasArmazem: TSpeedButton;
    pnlDespesasArmazem: TPanel;
    pnl3: TPanel;
    lbl4: TLabel;
    pnl2: TPanel;
    btnConfirmaCancelamento: TSpeedButton;
    btnCancelaCancelamento: TSpeedButton;
    scbDespesasArmazem: TScrollBox;
    shp1: TShape;
    lbl1: TLabel;
    nbClassificacao: TNotebook;
    dbgrdSolicPagto: TDBGrid;
    pnl_solic_pagto: TPanel;
    lbl_item: TLabel;
    lbl_status: TLabel;
    btn_co_item: TSpeedButton;
    lbl_favorecido: TLabel;
    btn_co_favorecido: TSpeedButton;
    lbl_dt_pagto: TLabel;
    lbl_calculo: TLabel;
    btn_co_calculo: TSpeedButton;
    Label1: TLabel;
    lbl_vl_item: TLabel;
    lbl_desconto: TLabel;
    lbl_perc_desconto: TLabel;
    lbl_vl_total: TLabel;
    Label2: TLabel;
    lbl_rd: TLabel;
    Label3: TLabel;
    dbedt_nm_item: TDBEdit;
    dblckbox_st_solic_ch_itens: TDBLookupComboBox;
    dbedt_cd_item: TDBEdit;
    dbedt_nm_favorecido: TDBEdit;
    dbedt_dt_pagto: TDBEdit;
    dbedt_nm_calculo: TDBEdit;
    dblckpbox_tp_destino: TDBLookupComboBox;
    dbedt_vl_pagto: TDBEdit;
    dbedt_vl_desconto: TDBEdit;
    dbedt_perc_desconto: TDBEdit;
    dbedt_vl_total: TDBEdit;
    dbedt_nr_lanc: TDBEdit;
    dbedt_cd_favorecido: TDBEdit;
    dbedt_cd_calculo: TDBEdit;
    dbedt_dt_solic_pagto: TDBEdit;
    dbgrid_solic_pagto: TDBGrid;
    Panel2: TPanel;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    lb_paridade: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    SpeedButton2: TSpeedButton;
    Label7: TLabel;
    lb_dt_vencto: TLabel;
    lb_nr_docto_fav: TLabel;
    edtNomeFavorecido: TEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    look_tp_destino: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    dbradgrop_tp_convert: TDBRadioGroup;
    dbedt_dt_paridade: TDBEdit;
    dbedt_vl_paridade: TDBEdit;
    edtDescricaoItem: TEdit;
    DBEdit8: TDBEdit;
    dbedt_dt_vencto: TDBEdit;
    edt_nr_docto_fav: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit5: TDBEdit;
    shp2: TShape;
    shp3: TShape;
    Label8: TLabel;
    SpeedButton3: TSpeedButton;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    shp4: TShape;
    lbl2: TLabel;
    btnDespesasFrete: TSpeedButton;
    pnlFrete: TPanel;
    pnlMoeda: TPanel;
    lbl3: TLabel;
    pnlbotaoFrete: TPanel;
    btnConfirmaFrete: TSpeedButton;
    btnCancelaFrete: TSpeedButton;
    sbFrete: TScrollBox;
    pnlTituloFrete: TPanel;
    lbl5: TLabel;
    pnlDadosFrete: TPanel;
    lbl6: TLabel;
    dbedtParidade: TDBEdit;
    lbl7: TLabel;
    dbedtApMoeda: TDBEdit;
    sbMoeda: TScrollBox;
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure dbnvgBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure pgctrl_solic_pagtoChange(Sender: TObject);
    procedure dbedt_cd_favorecidoExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_itemClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure Abre_ch;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_co_processoClick(Sender: TObject);
    procedure btn_co_favorecidoClick(Sender: TObject);
    procedure dbedt_cd_itemExit(Sender: TObject);
    procedure dbedt_cd_itemChange(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure btn_co_calculoClick(Sender: TObject);
    procedure dbedt_cd_calculoExit(Sender: TObject);
    procedure msk_nr_processoEnter(Sender: TObject);
    procedure btn_marca_todasClick(Sender: TObject);
    procedure btn_desmarca_todasClick(Sender: TObject);
    procedure btn_solicitarClick(Sender: TObject);
    procedure btn_canc_lancClick(Sender: TObject);
    procedure dbedt_cd_itemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_monta_pagtoClick(Sender: TObject);
    procedure dbgrdSolicPagtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Verif_Serv;
    procedure btnDespesasArmazemClick(Sender: TObject);
    procedure btnCancelaCancelamentoClick(Sender: TObject);
    procedure btnConfirmaCancelamentoClick(Sender: TObject);
    procedure dbradgrop_tp_convertChange(Sender: TObject);
    procedure dbgrid_solic_pagtoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgrid_solic_pagtoCellClick(Column: TColumn);
    procedure DBEdit6Change(Sender: TObject);
    procedure DBEdit5Change(Sender: TObject);
    procedure btnDespesasFreteClick(Sender: TObject);
    procedure btnConfirmaFreteClick(Sender: TObject);
    procedure btnCancelaFreteClick(Sender: TObject);
  private
    function Consiste : Boolean;
    function Grava    : Boolean;
    function VerAlt   : Boolean;
    procedure Cancelar;
    procedure busca_item_pre_alerta;
    procedure SaveBoolean(hab: Boolean);
    procedure solicita_item_agenciamento;
  public
    lNaoConsiste, st_modificar, st_incluir, st_excluir : Boolean;
    lCons_OnLine, ProcDuPont : Boolean;
    Cons_OnLine : TStringField;
    dt_solic_ch : String[10];
    nr_proc : String[18];
    hm_para_solic_ch : String[5];
    cd_unid_neg, cd_produto : String[2];
    vArrayImpostos: array of string[3];
    vDataPagto, vDataRD, vDataUpdate: TDateTime;
  end;

var
  frm_solic_pagto : Tfrm_solic_pagto;
  CancelaOperacao, Cancelado, Solicitando : Boolean;
  vLanca : String[1];
  in_ctrl_grid :Boolean;

implementation

uses GSMLIB,  PGGP001, PGGP017, PGSM010, PGSM018, PGSM041, PGSM059, PGSM090,
     PGGP015, PGPG002, PGSM136, PGPG003, uArmazenagem, ConsOnLineEx,
  PGSM296;

{$R *.DFM}

procedure Tfrm_solic_pagto.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_solic_pagto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_solic_pagto do
    begin
      qry_status_solic_pagto_.Close;
      tbl_yesno_.Close;

      qry_tp_item_.Close;
      qry_param_.Close;
      qry_item_.Close;
      qry_processo_.Close;
      qry_unid_neg_.Close;
      qry_produto_.Close;
      qry_servico_.Close;
      qry_emp_nac_.Close;
      qry_solic_pagto_.Close;
      Free;
    end;
    Action := caFree;
  end
  else
  begin
    Action := caNone;
  end;
end;

procedure Tfrm_solic_pagto.FormCreate(Sender: TObject);
var i: byte;
begin
  CancelaOperacao := False;
  Cancelado       := False;

  st_modificar    := False;
  st_incluir      := False;
  st_excluir      := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir );

  // Cria o DataModule de Dados de Solicitação de Cheque
  Application.CreateForm(Tdatm_solic_pagto, datm_solic_pagto );

  with datm_solic_pagto do
  begin
    qry_status_solic_pagto_.Close;
    qry_status_solic_pagto_.Prepare;
    qry_status_solic_pagto_.Open;
    tbl_yesno_.Open;

    qry_param_.Close;
    qry_param_.Prepare;
    qry_param_.Open;
    hm_para_solic_ch := qry_param_HM_PARA_SOLIC_CH.AsString;
    if Trim(hm_para_solic_ch) = '' then
    begin
      BoxMensagem('Atenção! Problemas com tabela de parâmetros!' + #13#10 +
                  'Não tente incluir Solicitação de Pagamento. Contate o CPD!', 2);
    end;

    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;

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

    qry_solic_pagto_.Close;
    qry_solic_pagto_.DisableControls;
    Abre_ch;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );

 (* verificação dos itens para saber quais são impostos (kleber - 01/03/2006) *)
  with TQuery.Create(application) do
  begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Add('SELECT CD_ITEM FROM TITEM WHERE IN_ITEM_DI = ''1'' ');
    Prepare;
    Open;
    SetLength(vArrayImpostos, RecordCount);
    i := 0;
    for i := 0 to RecordCount - 1 do
    begin
      vArrayImpostos[i] := Fields[0].AsString;
      Next;
    end;
    Free;
  end;
end;

procedure Tfrm_solic_pagto.FormShow(Sender: TObject);
begin
//lNaoConsiste := False;
  nbClassificacao.ActivePage := 'vazio';
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_produtoExit(nil);
  msk_nr_processo.SetFocus;
  datm_solic_pagto.qry_solic_pagto_.EnableControls;
  with datm_main do
  begin
    try
      CloseStoredProc(sp_data_hora_server);
      ExecStoredProc(sp_data_hora_server);
      dt_server := sp_data_hora_server.ParamByName('@dt_nt_server').AsDateTime;
      hr_server := dt_server;
      dt_server := StrToDate(DateToStr(dt_server));
      CloseStoredProc(sp_data_hora_server);
    except
      on E: Exception do
      begin
        TrataErro(E);
        dt_server := Date;
        hr_server := Time;
      end;
    end;
  end;
end;


procedure Tfrm_solic_pagto.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
  btn_incluir.Enabled                 := True;
  mi_incluir.Enabled                  := True;
  btn_salvar.Enabled                  := False;
  mi_salvar.Enabled                   := False;
  btn_cancelar.Enabled                := False;
  mi_cancelar.Enabled                 := False;
  if Solicitando then CancelaOperacao := True;
  btn_desmarca_todasClick(nil);
  dblckpbox_tp_destino.ReadOnly       := True;
end;


procedure Tfrm_solic_pagto.Cancelar;
begin
  try
    if datm_solic_pagto.qry_solic_pagto_.State in [dsInsert, dsEdit] then
    begin
      datm_solic_pagto.qry_solic_pagto_.Cancel;
      msk_nr_processo.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
end;


procedure Tfrm_solic_pagto.btn_incluirClick(Sender: TObject);
begin
  if ConsultaLookUPSQL('SELECT COUNT(*) CONTADOR FROM TPROCESSO_NOT_MONEY WHERE NR_PROCESSO = '''+msk_cd_unid_neg.Text+msk_cd_produto.Text+msk_nr_processo.Text+ '''',  'CONTADOR') = '0' then
  begin
    ShowMessage('Para esse processo, deve ser utilizado o myIndaia Money');
    Exit;
  end;
  if msk_nr_processo.Text = '' then
  begin
    BoxMensagem('Informe o nº do Processo', 3);
    Exit;
  end;
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  dblckpbox_tp_destino.ReadOnly := False;

  with datm_solic_pagto do
  begin
    btn_desmarca_todasClick(nil);
    qry_solic_pagto_.DisableControls;
    qry_solic_pagto_.Cancel;
    qry_solic_pagto_.Append;
    qry_solic_pagto_.EnableControls;

    qry_ult_lanc_.Close;
    qry_ult_lanc_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
    qry_ult_lanc_.Prepare;
    qry_ult_lanc_.Open;

    qry_solic_pagto_NR_PROCESSO.AsString      := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
    if qry_ult_lanc_NR_LANCAMENTO.AsString = '000' then
       qry_solic_pagto_NR_LANCAMENTO.AsString := '001'
    else
       qry_solic_pagto_NR_LANCAMENTO.AsString := qry_ult_lanc_NR_LANCAMENTO.AsString;
    qry_solic_pagto_DT_SOLIC_PAGTO.AsString   := FormatDateTime( 'dd/mm/yyyy', dt_server );
    qry_solic_pagto_DT_PAGTO.AsString   := FormatDateTime( 'dd/mm/yyyy', dt_server );
    qry_ult_lanc_.Close;

    try
      qry_solic_pagto_HM_SOLIC_PAGTO.AsString := FormatDateTime( 'hh:mm', Now );
    except
      BoxMensagem('Erro ao converter a seguinte hora:' + TimeToStr(Time), 2)
    end;
    //qry_solic_pagto_VL_PAGTO.AsFloat          := 0;
    qry_solic_pagto_CD_STATUS.AsString        := '0'; // Em processamento
    qry_solic_pagto_IN_SOLICITADO.AsString    := '0';
    pnl_solic_pagto.Enabled := True;
    if dbedt_cd_item.CanFocus then
      dbedt_cd_item.SetFocus
    else if DBEdit6.CanFocus then
      DBEdit6.SetFocus;
  end;
end;

procedure Tfrm_solic_pagto.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit
  else if dbgrdSolicPagto.CanFocus then
    dbgrdSolicPagto.SetFocus;
end;

function Tfrm_solic_pagto.Consiste : Boolean;
begin
  Consiste := True;
  if ( datm_solic_pagto.qry_solic_pagto_CD_STATUS.AsString = '7' ) or
     ( datm_solic_pagto.qry_solic_pagto_CD_STATUS.AsString = '4' ) or
     ( datm_solic_pagto.qry_solic_pagto_CD_STATUS.AsString = '17' ) then Exit;

  if datm_solic_pagto.qry_solic_pagto_.State in [dsInsert, dsEdit] then // Solicitação
  begin
    //if Not lNaoConsiste then
    //begin

    // Favorecido
    if dbedt_cd_favorecido.Text = '' then
    begin
      BoxMensagem('Campo Favorecido deve ser preenchido!', 2);
      dbedt_cd_favorecido.SetFocus;
      Consiste := False;
      Exit;
    end;

    // Tipo de Destino
    if dblckpbox_tp_destino.Text = '' then
    begin
      BoxMensagem('Campo Tipo de Destino deve ser preenchido!', 2);
      dblckpbox_tp_destino.SetFocus;
      Consiste := False;
      Exit;
    end;
    //end;

    if Not ( datm_solic_pagto.qry_solic_pagto_.State in [dsEdit, dsInsert] ) then Exit;
    ValidCodigo( dbedt_cd_favorecido );
    if dbedt_cd_favorecido.Text <> '' then
    begin
      if dbedt_nm_favorecido.Text = '' then
      begin
        BoxMensagem('Código do Favorecido inválido!',2);
        dbedt_cd_favorecido.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    // Cálculo
    if Not ( datm_solic_pagto.qry_solic_pagto_.State in [dsEdit, dsInsert] ) then Exit;
    ValidCodigo( dbedt_cd_calculo );

    if ( dbedt_cd_calculo.Text <> '' ) then
    begin
      if dbedt_nm_calculo.Text = '' then
      begin
        BoxMensagem('Código do Cálculo inválido!',2);
        dbedt_cd_calculo.SetFocus;
        Consiste := False;
        Exit;
      end;

      if datm_solic_pagto.qry_solic_pagto_.State in [dsInsert] then
      begin
        CloseStoredProc( datm_solic_pagto.sp_proc_pagto );
        datm_solic_pagto.sp_proc_pagto.ParamByName('@NR_PROCESSO').AsString   := datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString;
        datm_solic_pagto.sp_proc_pagto.ParamByName('@NR_LANCAMENTO').AsString := datm_solic_pagto.qry_solic_pagto_NR_LANCAMENTO.AsString;
        datm_solic_pagto.sp_proc_pagto.ParamByName('@CD_ITEM').AsString       := datm_solic_pagto.qry_solic_pagto_CD_ITEM.AsString;
        datm_solic_pagto.sp_proc_pagto.ParamByName('@CD_CALCULO').AsString    := datm_solic_pagto.qry_solic_pagto_CD_CALCULO.AsString;
        ExecStoredProc( datm_solic_pagto.sp_proc_pagto );
        if ( datm_solic_pagto.sp_proc_pagto.ParamByName('Result').AsString <> '' ) then
        begin
          case StrToInt( datm_solic_pagto.sp_proc_pagto.ParamByName('Result').AsString ) of
            1: BoxMensagem( 'Processo D.I. inexistente!', 2 );
            2: BoxMensagem( 'Processo D.I. registrado!', 2 );
            3: BoxMensagem( 'Processo D.I. não calculado!', 2 );
            4: BoxMensagem( 'Processo D.I. não calculado na data de hoje!', 2 );
          end;
          if datm_solic_pagto.sp_proc_pagto.ParamByName('Result').AsString <> '0' then
          begin
            CloseStoredProc( datm_solic_pagto.sp_proc_pagto );
            Consiste := False;
            Exit;
          end;
          datm_solic_pagto.qry_solic_pagto_VL_PAGTO.AsFloat :=
             datm_solic_pagto.sp_proc_pagto.ParamByName('@vl_calculado').AsFloat;
        end;
        CloseStoredProc( datm_solic_pagto.sp_proc_pagto );
      end;
    end;

    // Item
    //if Not lNaoConsiste then
    //begin
    if dbedt_cd_item.Text = '' then
    begin
      BoxMensagem('Campo Item deve ser preenchido!', 2);
      dbedt_cd_item.SetFocus;
      Consiste := False;
      Exit;
    end;
    //end;

    if Not ( datm_solic_pagto.qry_solic_pagto_.State in [dsEdit, dsInsert] ) then Exit;
    ValidCodigo( dbedt_cd_item );
    if dbedt_cd_item.Text <> '' then
    begin
      if ( dbedt_nm_item.Text = '' ) then
      begin
        BoxMensagem('Código do Item inválido!',2);
        dbedt_cd_item.SetFocus;
        Consiste := False;
        Exit;
      end
      else
      begin
        with datm_solic_pagto do
        begin
          qry_tp_item_.Close;
          qry_tp_item_.ParamByName('CD_ITEM').AsString := dbedt_cd_item.Text;
          qry_tp_item_.Prepare;
          qry_tp_item_.Open;
          if qry_tp_item_CD_TIPO_ITEM.AsString <> 'D' then
          begin
            BoxMensagem('Ítem digitado não é uma despesa!',2);
            dbedt_nm_item.Text := '';
            Consiste := False;
            Exit;
          end;
          if ( qry_tp_item_IN_ITEM_DI.AsString = '1' ) and ( vLanca = '1' ) then
          begin
            BoxMensagem('Ítem é um imposto. Não pode ser solicitado para esse tipo de serviço!',2);
            dbedt_nm_item.Text := '';
            Consiste := False;
            Exit;
          end;
        end;
      end;
    end;

    // Solic. Pagto
    with datm_solic_pagto do
    begin
      if qry_solic_pagto_LookSolicPagto.AsString = '0' then
      begin
        BoxMensagem( 'Não é permitido solicitar pagamento para este item!', 2 );
        dbedt_cd_item.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    // Quando Item com Débito Automático pela D.I., tipo de destino = 5 (Borderô)
    if (datm_solic_pagto.qry_solic_pagto_LookItemDI.AsString = '1') and (ProcDuPont) then
    begin
      datm_solic_pagto.qry_solic_pagto_.FieldByName('TP_DESTINO').AsString := '5';
      dblckpbox_tp_destino.Enabled := False;
      dbedt_vl_pagto.Enabled    := True;
      dbedt_vl_pagto.Color      := clWindow;
      dbedt_vl_pagto.ReadOnly   := False;
      dbedt_vl_pagto.TabStop    := True;
    end;
  end;
end;


function Tfrm_solic_pagto.Grava : Boolean;
var
  Falha : Boolean;
begin
  Falha := False;
  Grava := False;
  if datm_solic_pagto.qry_solic_pagto_.State in [dsInsert, dsEdit] then // Solicitação
  begin
    try
      datm_main.db_broker.StartTransaction;
      with datm_solic_pagto do
      begin
        if qry_favorecido_.Locate('CD_FAVORECIDO', qry_solic_pagto_CD_FAVORECIDO.AsString, [loCaseInsensitive] ) then
           qry_solic_pagto_CD_BANCO.AsString := qry_favorecido_CD_BANCO.AsString;
        qry_solic_pagto_CD_USUARIO_SOLIC.AsString := str_cd_usuario;
        qry_solic_pagto_.Post;
        Abre_ch;
      end;
      if Not Falha then
      begin
        datm_main.db_broker.Commit;
        Grava := True;
      end;
    except
      on E: Exception do
      begin
        datm_solic_pagto.qry_solic_pagto_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
    Btn_Mi( st_incluir, False, False, st_excluir );
  end;
  dblckpbox_tp_destino.Enabled := True;
//  dblckpbox_tp_destino.ReadOnly := True;
end;


procedure Tfrm_solic_pagto.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled   := Inc;   mi_incluir.Enabled  := Inc;
  btn_salvar.Enabled    := Salv;  mi_salvar.Enabled   := Salv;
  btn_Cancelar.Enabled  := Canc;  mi_Cancelar.Enabled := Canc;
  btn_solicitar.Enabled := Not Salv;
end;

procedure Tfrm_solic_pagto.dbnvgBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if datm_solic_pagto.qry_solic_pagto_.State in [dsInsert, dsEdit] then
     datm_solic_pagto.qry_solic_pagto_.Cancel;
end;

procedure Tfrm_solic_pagto.pgctrl_solic_pagtoChange(Sender: TObject);
begin
  btn_incluir.Enabled := True;
  mi_incluir.Enabled  := True;
end;

procedure Tfrm_solic_pagto.dbedt_cd_favorecidoExit(Sender: TObject);
begin
(* lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False; *)

  if Not ( datm_solic_pagto.qry_solic_pagto_.State in [dsEdit, dsInsert] ) then Exit;
  ValidCodigo( dbedt_cd_favorecido );

  if dbedt_cd_favorecido.Text <> '' then
  begin
    if dbedt_nm_favorecido.Text = '' then
    begin
      BoxMensagem('Código do Favorecido inválido!',2);
      dbedt_cd_favorecido.SetFocus;
      Exit;
    end
    else
    begin
      if (datm_solic_pagto.qry_solic_pagto_TP_DESTINO.AsString = '5') then
      begin
        with Tquery.Create(application) do
        begin
          DataBaseName := 'DBBROKER';
          Close;
          SQL.Clear;
          SQL.Add('SELECT ISNULL(CGC_EMPRESA, '''') FROM TFAVORECIDO WHERE CD_FAVORECIDO = ''' + dbedt_cd_favorecido.Text + ''' ');
          Prepare;
          Open;

            if Fields[0].AsString = '' then
            begin
              BoxMensagem('Não é possível incluir Favorecido sem CNPJ!' + chr(13) + 'Inclua o CNPJ no Cadastro de Favorecido e tente novamente!' ,2);
              dbedt_cd_favorecido.SetFocus;
              Free;
              Exit;
            end;

          Free;
        end;
      end;
    end;
  end;
end;


procedure Tfrm_solic_pagto.msk_cd_unid_negExit(Sender: TObject);
begin
  if Trim( msk_cd_unid_neg.Text ) = cd_unid_neg then Exit;
  if Trim( msk_cd_unid_neg.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_unid_neg );
    with datm_solic_pagto do
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
        edt_nm_unid_neg.Text := '';
        msk_cd_unid_neg.SetFocus;
        Exit;
      end;
    end
  end
  else
  begin
    edt_nm_unid_neg.Text := '';
  end;
end;

procedure Tfrm_solic_pagto.msk_cd_produtoExit(Sender: TObject);
begin
  if Trim( msk_cd_produto.Text ) = cd_produto then Exit;
  if Trim( msk_cd_produto.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_produto );
    with datm_solic_pagto do
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
        msk_cd_produto.SetFocus;
        Exit;
      end
    end;
  end
  else
  begin
    edt_nm_produto.Text := '';
  end;
end;


procedure Tfrm_solic_pagto.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_solic_pagto do
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


procedure Tfrm_solic_pagto.btn_co_produtoClick(Sender: TObject);
begin
  with datm_solic_pagto do
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

procedure Tfrm_solic_pagto.btn_co_itemClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2214';
  Application.CreateForm(Tfrm_item, frm_item);
  frm_item.Cons_OnLine := datm_solic_pagto.qry_solic_pagto_CD_ITEM;
  frm_item.lRecDesp := True;
  with frm_item do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_solic_pagto.qry_solic_pagto_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_solic_pagto.qry_solic_pagto_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_solic_pagto do
  begin
    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;
  end;
  vStr_cd_modulo := '26';
  str_cd_rotina := '2601';
  dbedt_cd_itemExit(nil);
end;

procedure Tfrm_solic_pagto.busca_item_pre_alerta;
var
  SOLIC_PAGTO:TQuery;
  nr_lanc:String[3];
begin
  SOLIC_PAGTO:=TQuery.Create(Application);
  SOLIC_PAGTO.DAtaBaseName:='DBBROKER';
  SOLIC_PAGTO.Sql.Add('SELECT MAX(NR_LANCAMENTO) FROM TSOLIC_PAGTO WHERE NR_PROCESSO =:NR_PROCESSO');
  SOLIC_PAGTO.params[0].AsString:= datm_solic_pagto.qry_processo_NR_PROCESSO.AsString;
  SOLIC_PAGTO.open;

  if SOLIC_PAGTO.fields[0].AsString = '' then
    nr_lanc:='000'
  else nr_lanc := SOLIC_PAGTO.fields[0].AsString;

  datm_main.db_broker.StartTransaction;

  try
    CloseStoredProc(datm_solic_pagto.sp_solic_pagto_ag);
    datm_solic_pagto.sp_solic_pagto_ag.ParamByName('@nr_processo').AsString   := datm_solic_pagto.qry_processo_NR_PROCESSO.AsString;
    datm_solic_pagto.sp_solic_pagto_ag.ParamByName('@NR_LANC').AsString       := nr_lanc;
    datm_solic_pagto.sp_solic_pagto_ag.ParamByName('@tp_processo').AsString   := ConsultaLookup('TPROCESSO','NR_PROCESSO',datm_solic_pagto.qry_processo_NR_PROCESSO.AsString,'TP_PROCESSO');
    ExecStoredProc(datm_solic_pagto.sp_solic_pagto_ag);
    CloseStoredProc(datm_solic_pagto.sp_solic_pagto_ag);

    datm_main.db_broker.Commit;
  except
    if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback; // Try...Except incluido por michel para evitar transação travada - Michel - 19/04/2010
  end;

  datm_solic_pagto.qry_solic_pagto_.Close;
  datm_solic_pagto.qry_solic_pagto_.ParamByName('NR_PROCESSO').AsString:= datm_solic_pagto.qry_processo_NR_PROCESSO.AsString;
  datm_solic_pagto.qry_solic_pagto_.prepare;
  datm_solic_pagto.qry_solic_pagto_.Open;

  nbClassificacao.ActivePage := 'agenc';
end;


procedure Tfrm_solic_pagto.msk_nr_processoExit(Sender: TObject);
begin
  if Copy( msk_nr_processo.Text, 1, 1 ) = 'Ì' then
  begin
    BoxMensagem('Atenção! Processo inválido! Favor informar ao Administrador do sistema urgente!', 2);
    msk_nr_processo.SetFocus;
    nbClassificacao.ActivePage := 'vazio';
    Exit;
  end;

  if (( nr_proc = msk_nr_processo.Text ) or ( datm_solic_pagto.qry_solic_pagto_.State in [dsInsert] )) then
  begin
    pnl_solic_pagto.Enabled := false;
    Exit;
  end else pnl_solic_pagto.Enabled := true;

  if msk_nr_processo.Text <> '' then
  begin
    with datm_solic_pagto do
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;
      if qry_processo_.RecordCount > 0 then
      begin
        in_ctrl_grid:=false;
        edt_cd_cliente.Text := qry_processo_CD_CLIENTE.AsString;
        edt_nm_cliente.Text := qry_processo_LookCliente.AsString;
        edt_cd_servico.Text := qry_processo_CD_SERVICO.AsString;
        edt_nm_servico.Text := qry_processo_LookServico.AsString;
        nbClassificacao.ActivePage := 'desemb';
        //busca todos os itens do pre alerta
        if ConsultaLookup('TSERVICO','CD_SERVICO',qry_processo_CD_SERVICO.AsString,'TP_SERVICO') = '1' then
//        if 0 = 1 then
        begin

          //pnl_agenciamento
          busca_item_pre_alerta;
          btnDespesasArmazem.Visible := False;
          btn_canc_lanc.Visible := False;
//          lb_classificacao.Visible  := true;
//          edt_classificacao.Visible := true;
//          edt_classificacao.text    := qry_processo_calc_tp_processo.AsString;

        end else begin


          btnDespesasArmazem.Visible := True;
          btn_canc_lanc.Visible := True;
          CloseStoredProc( sp_atz_solic_pagto );
          sp_atz_solic_pagto.ParamByName('@NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
          ExecStoredProc( sp_atz_solic_pagto );
          if sp_atz_solic_pagto.ParamByName('Result').AsString <> '' then
          begin
            case StrToInt( sp_atz_solic_pagto.ParamByName('Result').AsString ) of
              1: BoxMensagem( 'Processo D.I. inexistente!', 2 );
              2: BoxMensagem( 'Processo D.I. registrado!', 2 );
              3: BoxMensagem( 'Processo D.I. não calculado!', 2 );
              4: BoxMensagem( 'Processo D.I. não calculado na data de hoje!', 2 );
            end;
          end;
          CloseStoredProc( sp_atz_solic_pagto );
          Verif_Serv;
          Abre_ch;
          //Verifica se vai mostrar Dados do Frete (kleber - 24/11/2006)

            pnlDadosFrete.Visible :=  (ConsultaLookUpSQL('SELECT ISNULL(CD_TAB_FRETE, "") TAB_FRETE ' +
                                                        ' FROM TPROCESSO (NOLOCK)' +
                                                        ' WHERE NR_PROCESSO = "' + msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text + '"  AND ' +
                                                        '   CD_PRODUTO IN ("02", "10") ', 'TAB_FRETE') <> '' );
        end;

      end
      else
      begin
        edt_cd_cliente.Text  := '';
        edt_cd_servico.Text  := '';
        msk_nr_processo.Text := '';
        BoxMensagem('Processo não cadastrado ou não liberado para esta Unidade/Produto!', 2);
        nbClassificacao.ActivePage := 'vazio';
        msk_cd_unid_neg.SetFocus;
        Exit;
      end
    end;

    (*  ----- mostra Nr. RD no Grid para Processos Du Pont (kleber - 01/03/2006) *)
    (*  ----- mostra Data de Impressão do TXT para Processos Du Pont (kleber 08/03/2006) *)
    with TQuery.Create(application) do
    begin
      DatabaseName := 'DBBROKER';
      Close;
      SQL.Add('SELECT CH.IN_BORDERO FROM TCLIENTE_HABILITACAO CH (NOLOCK)');
      SQL.Add('                    INNER JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = CH.CD_CLIENTE');
      SQL.Add('                    INNER JOIN TPROCESSO P     ON  P.CD_CLIENTE = EN.CD_EMPRESA');
      SQL.Add('WHERE CH.CD_UNID_NEG = SUBSTRING(P.NR_PROCESSO, 1, 2) AND');
      SQL.Add('      CH.CD_PRODUTO  = SUBSTRING(P.NR_PROCESSO, 3, 2) AND');
      SQL.Add('      P.NR_PROCESSO  = ''' + Trim(msk_cd_unid_neg.Text) + Trim(msk_cd_produto.Text) + Trim(msk_nr_processo.Text) + ''' ');
      Prepare;
      Open;
      if Fields[0].AsInteger = 1 then
      begin
        dbgrdSolicPagto.Columns[7].Width := 52;
        dbgrdSolicPagto.Columns[8].Width := 130;
        dbgrdSolicPagto.Columns[9].Width := 112;
        ProcDuPont := true;
      end
      else
      begin
        dbgrdSolicPagto.Columns[7].Width := 0;
        dbgrdSolicPagto.Columns[8].Width := 0;
        dbgrdSolicPagto.Columns[9].Width := 0;
        ProcDuPont := false;
      end;
      Free;
    end;
  end
  else
  begin
    BoxMensagem('Digite um Processo Válido!', 2);
    nbClassificacao.ActivePage := 'vazio';
    msk_nr_processo.SetFocus;
    Exit;
  end;

end;


function Tfrm_solic_pagto.VerAlt;
begin
  VerAlt := True;
  if datm_solic_pagto.qry_solic_pagto_.State in [dsInsert, dsEdit] then
  begin
   if ( ( datm_solic_pagto.qry_solic_pagto_.State in [dsEdit] ) and st_modificar ) or
       ( datm_solic_pagto.qry_solic_pagto_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Solicitação de Pagamento foi alterada.' + #13#10 +
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

procedure Tfrm_solic_pagto.Abre_ch;
var nr_lancamento, cd_item : String[3];
begin
  with datm_solic_pagto do
  begin
    nr_lancamento := qry_solic_pagto_NR_LANCAMENTO.AsString;
    cd_item       := qry_solic_pagto_CD_ITEM.AsString;
    qry_solic_pagto_.Close;
    qry_solic_pagto_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
    qry_solic_pagto_.Prepare;
    qry_solic_pagto_.Open;
    qry_solic_pagto_.Locate('NR_LANCAMENTO;CD_ITEM', VarArrayOf ([nr_lancamento, cd_item]), [loCaseInsensitive]);
  end;
end;

procedure Tfrm_solic_pagto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_solic_pagto.btn_co_processoClick(Sender: TObject);
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
    msk_nr_processo.Text := Copy( frm_consulta_processo.Nr_Processo, 5, 14) ;
    msk_nr_processoExit(nil);
  end;
end;


procedure Tfrm_solic_pagto.btn_co_favorecidoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2208';
  Application.CreateForm(Tfrm_Favor, frm_Favor);
  frm_Favor.Cons_OnLine := datm_solic_pagto.qry_solic_pagto_CD_FAVORECIDO;
  with frm_Favor do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_solic_pagto.qry_solic_pagto_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_solic_pagto.qry_solic_pagto_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_solic_pagto do
  begin
    qry_favorecido_.Close;
    qry_favorecido_.Prepare;
    qry_favorecido_.Open;
  end;
  vStr_cd_modulo := '26';
  str_cd_rotina := '2601';
  dbedt_cd_favorecidoExit(nil);
end;

procedure Tfrm_solic_pagto.dbedt_cd_itemExit(Sender: TObject);
begin

  if (datm_solic_pagto.qry_solic_pagto_LookItemDI.AsString <> '1') or ((ProcDuPont) and (datm_solic_pagto.qry_solic_pagto_LookItemDI.AsString = '1')) then
  begin //no consiste é determinado a habilitação do valor quando tp_destino borderô
    dbedt_vl_pagto.Enabled    := True;
    dbedt_vl_pagto.Color      := clWindow;
    dbedt_vl_pagto.ReadOnly   := False;
    dbedt_vl_pagto.TabStop    := True;
    dblckpbox_tp_destino.SetFocus;
  end
  else
  begin
    dbedt_vl_pagto.Enabled    := False;
    dbedt_vl_pagto.Color      := clMenu;
    dbedt_vl_pagto.ReadOnly   := True;
    dbedt_vl_pagto.TabStop    := False;
  end;

  (*lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;  *)

  if dbedt_cd_item.Text = '' then
  begin
    BoxMensagem('Campo Item deve ser preenchido!', 2);
    dbedt_cd_item.SetFocus;
    Exit;
  end;

  (*if Not ( datm_solic_pagto.qry_solic_pagto_.State in [dsEdit, dsInsert] ) then
  begin
    if dbedt_cd_item.Text <> '' then Application.MessageBox('Clique em Incluir antes de Solicitar Pagamento!', 'Inclusão de Solicitação', MB_OK + MB_ICONERROR);
    Exit;
  end; *)
  ValidCodigo( dbedt_cd_item );
  if dbedt_cd_item.Text <> '' then
  begin
    if ( dbedt_nm_item.Text = '' ) then
    begin
      BoxMensagem('Código do Item inválido!',2);
      dbedt_cd_item.SetFocus;
      Exit;
    end
    else
    begin
      with datm_solic_pagto do
      begin
        qry_tp_item_.Close;
        qry_tp_item_.ParamByName('CD_ITEM').AsString := dbedt_cd_item.Text;
        qry_tp_item_.Prepare;
        qry_tp_item_.Open;
        if qry_tp_item_CD_TIPO_ITEM.AsString <> 'D' then
        begin
          BoxMensagem('Ítem digitado não é uma despesa!',2);
          dbedt_nm_item.Text := '';
          dbedt_cd_item.SetFocus;
          Exit;
        end;
        if ( qry_tp_item_IN_ITEM_DI.AsString = '1' ) and ( vLanca = '1' ) then
        begin
          BoxMensagem('Ítem é um imposto. Não pode ser solicitado para esse tipo de serviço!',2);
          dbedt_nm_item.Text := '';
          dbedt_cd_item.SetFocus;
          Exit;
        end;
      end;
    end;
  end;
end;


procedure Tfrm_solic_pagto.dbedt_cd_itemChange(Sender: TObject);
begin
  if datm_solic_pagto.qry_solic_pagto_.State in [ dsInsert, dsEdit ] then
  begin
    btn_incluir.Enabled  := False;
    mi_incluir.Enabled   := False;
    btn_Salvar.Enabled   := True;
    mi_Salvar.Enabled    := True;
    btn_Cancelar.Enabled := True;
    mi_Cancelar.Enabled  := True;
  end
end;

procedure Tfrm_solic_pagto.msk_cd_unid_negEnter(Sender: TObject);
begin
  cd_unid_neg := msk_cd_unid_neg.Text;
end;

procedure Tfrm_solic_pagto.msk_cd_produtoEnter(Sender: TObject);
begin
  cd_produto := msk_cd_produto.Text;
end;

procedure Tfrm_solic_pagto.btn_co_calculoClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TCALCULO',
                datm_solic_pagto.qry_solic_pagto_CD_CALCULO,
                'Tipo de Cálculo', 7, '','TTable');
end;

procedure Tfrm_solic_pagto.dbedt_cd_calculoExit(Sender: TObject);
begin
 (*lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;  *)

  // Cálculo
  if Not ( datm_solic_pagto.qry_solic_pagto_.State in [dsEdit, dsInsert] ) then Exit;
  ValidCodigo( dbedt_cd_calculo );

  if ( dbedt_cd_calculo.Text <> '' ) then
  begin
    if dbedt_nm_calculo.Text = '' then
    begin
      BoxMensagem('Código do Cálculo inválido!',2);
      dbedt_cd_calculo.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_solic_pagto.msk_nr_processoEnter(Sender: TObject);
begin
  nr_proc := msk_nr_processo.Text;
end;

procedure Tfrm_solic_pagto.btn_marca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Visible    := False;
  mi_marca.Visible           := False;
  btn_desmarca_todas.Visible := True;
  mi_desmarca.Visible        := True;
  btn_desmarca_todas.Left    := btn_marca_todas.Left;
  datm_solic_pagto.qry_solic_pagto_.First;
  for i := 0 to datm_solic_pagto.qry_solic_pagto_.RecordCount - 1 do
  begin
    dbgrdSolicPagto.SelectedRows.CurrentRowSelected := True;
    datm_solic_pagto.qry_solic_pagto_.Next;
  end;
end;


procedure Tfrm_solic_pagto.btn_desmarca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Visible    := True;
  mi_marca.Visible           := True;
  mi_desmarca.Visible        := False;
  btn_desmarca_todas.Visible := False;
  if dbgrdSolicPagto.SelectedRows.Count > 0 then
     TTable(dbgrdSolicPagto.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSolicPagto.SelectedRows[0]));
  for i := 0 to dbgrdSolicPagto.SelectedRows.Count - 1 do
  begin
    dbgrdSolicPagto.SelectedRows.CurrentRowSelected := False;
    if dbgrdSolicPagto.SelectedRows.Count > 0 then
      TTable(dbgrdSolicPagto.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSolicPagto.SelectedRows[0]))
    else Break;
  end;
end;

procedure Tfrm_solic_pagto.solicita_item_agenciamento;
var
  cont : integer;
begin
  //verifica se existe alguma item do tipo conta a pagar com a data de vencto não preenchida
//  cont := 0;
  with datm_solic_pagto do
  begin
//    qry_solic_pagto_.First;
//    while qry_solic_pagto_.Eof do
//    begin
//      if (qry_solic_pagto_TP_DESTINO.AsString = '04') and ((qry_solic_pagto_NR_DOCTO_FAV.AsString = '') or (qry_solic_pagto_DT_VENCTO.AsString = '')) then
//        cont := cont + 1 ;
//      qry_solic_pagto_.Next;
//    end;
//    if cont > 0 then
//    begin
//      Boxmensagem('Existe Item do Tipo de Destino Conta a Pagar com Data de Vencto ou Nr Docto não preenchida',2);
//      Exit;
//    end;
    try

      datm_main.db_broker.StartTransaction;
      CloseStoredProc(  sp_pagto_faturamento);
      sp_pagto_faturamento.ParamByName('@nr_processo').AsString   := qry_processo_NR_PROCESSO.AsString;
      ExecStoredProc(  sp_pagto_faturamento);
      CloseStoredProc(  sp_pagto_faturamento);

      CloseStoredProc(sp_proc_solic_pagto_ag);
      sp_proc_solic_pagto_ag.ParamByName('@nr_processo').AsString   := qry_processo_NR_PROCESSO.AsString;
      ExecStoredProc(sp_proc_solic_pagto_ag);
      CloseStoredProc(sp_proc_solic_pagto_ag);

//      if in_integracao_contabil = '1' then
//        executa_sp_contabiliza_pagto( qry_processo_NR_PROCESSO.AsString );
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;

    qry_solic_pagto_.Close;
    qry_solic_pagto_.ParamByName('NR_PROCESSO').AsString:=  qry_processo_NR_PROCESSO.AsString;
    qry_solic_pagto_.prepare;
    qry_solic_pagto_.Open;
  end;
end;


procedure Tfrm_solic_pagto.btn_solicitarClick(Sender: TObject);
var
  i, j, vPosicao : Integer;
  vRDForcaData, vRDMantemData : string;
begin

  if ConsultaLookup('TSERVICO','CD_SERVICO',datm_solic_pagto.qry_processo_CD_SERVICO.AsString,'TP_SERVICO') = '1' then
//  if 1=0 then
    solicita_item_agenciamento
  else begin
    Solicitando          := True;
    btn_cancelar.Enabled := True;
    mi_cancelar.Enabled  := True;

    with datm_solic_pagto do
    begin
      if qry_solic_pagto_.State in [dsInsert, dsEdit] then
      begin
        pnl_cadastro.SetFocus;
        if Not Consiste then
        begin
          btn_desmarca_todasClick(nil);
          Exit;
        end;
        if Not Grava then
        begin
          btn_desmarca_todasClick(nil);
          Exit;
        end;
      end;

      qry_solic_pagto_.First;
      while Not qry_solic_pagto_.EOF do
      begin
        if dbgrdSolicPagto.SelectedRows.CurrentRowSelected then
        begin
          if ( datm_solic_pagto.qry_solic_pagto_CD_STATUS.AsString <> '7' ) and
             ( datm_solic_pagto.qry_solic_pagto_CD_STATUS.AsString <> '4' ) and
             ( datm_solic_pagto.qry_solic_pagto_CD_STATUS.AsString <> '17' ) then
          begin
            (*  ----- bloqueia solicitação de impostos quando tipo de destino borderô (kleber - 01/03/2006) *)
            if (datm_solic_pagto.qry_solic_pagto_TP_DESTINO.AsString = '5') then
            begin
              for i := 0 to Length(vArrayImpostos) - 1 do
              begin
                if datm_solic_pagto.qry_solic_pagto_CD_ITEM.AsString = vArrayImpostos[i] then
                begin
                  BoxMensagem('Este item não pode ser solicitado no tipo de Destino borderô,' + chr(13) + 'pois trata-se de um item com registro automático pela DI!', 2);
                  btn_desmarca_todasClick(nil);
                  Exit;
                end;
              end;

              (*  ------- bloqueia solicitação de despesa com tipo Borderô sem nr. do RD (kleber - 01/03/2006) *)
              if ((datm_solic_pagto.qry_solic_pagto_NR_RD.IsNull) or (datm_solic_pagto.qry_solic_pagto_NR_RD.AsString = '')) then
              begin
                BoxMensagem('Existem campos sem nr. do RD preenchido!' + chr(13) + 'Favor gerar borderô antes de solictar pagamento!', 2);
                btn_desmarca_todasClick(nil);
                Exit;
              end;
            end;

            (*  ----- não solicita itens Débito em COnta ou Débito em Conta Comissária para processos da Du Pont, exceto SDAs (kleber - 01/03/2006) *)
            if ((datm_solic_pagto.qry_solic_pagto_CD_ITEM.AsString <> '505') and (datm_solic_pagto.qry_solic_pagto_CD_ITEM.AsString <> '008')) then
            begin
              if (ProcDuPont) and (StrToInt(datm_solic_pagto.qry_solic_pagto_TP_DESTINO.AsString) in [1,2,3]) then
              begin
                BoxMensagem( 'Itens com Tipo de Destino "Comissária", "Débito em Conta" ou "Débito em Conta Comissária"' + chr(13)
                           + 'não podem ser solicitados e/ou Pagos para Processos do Cliente Du Pont!' + chr(13)
                           + 'Exceto Item SDA!!', 2);
                btn_desmarca_todasClick(nil);
                Exit;
              end;
            end;

            if dbedt_cd_favorecido.Text = '' then
            begin
              BoxMensagem('Campo Favorecido deve ser preenchido!', 2);
              btn_desmarca_todasClick(nil);
              dbedt_cd_favorecido.SetFocus;
              Exit;
            end;
          end;
        end;
        qry_solic_pagto_.Next;
      end;

      (* -- forçar data de Pagamento na hora da soicitação para TIpo de Destino Borderô (kleber - 03/03/2006) *)
      qry_solic_pagto_.First;
      while Not qry_solic_pagto_.EOF do
      begin
        if (dbgrdSolicPagto.SelectedRows.CurrentRowSelected) and
           (datm_solic_pagto.qry_solic_pagto_TP_DESTINO.AsString = '5') then
        begin
          repeat
            try
              if (vDataPagto > now) and (vDataPagto <> 0) then BoxMensagem('A Data deve ser menor que a atual', 2);
              vDataPagto := StrToDate(InputBox('Data de Pagamento', 'Digite a data desejada: ', ''));
            except
              BoxMensagem('Data Inválida!', 2);
              vDataPagto := 0;
            end;
          until (vDataPagto <> 0) and (vDataPagto <= now);
          Break;
        end;
        qry_solic_pagto_.Next;
      end;
    end;

    if dbgrdSolicPagto.SelectedRows.Count > 0 then
       TTable(dbgrdSolicPagto.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSolicPagto.SelectedRows[0]));

    // inicia variáveis para atualização de RD (Kleber)
    vRDMantemData := '';
    vRDForcaData  := '';

    for i:= 0 to dbgrdSolicPagto.SelectedRows.Count - 1 do
    begin
      try
        datm_main.db_broker.StartTransaction;

        try
          StrToTime( Trim(hm_para_solic_ch) );
        except
          BoxMensagem('Erro ao converter a seguinte hora do parâmetro: ' +
                      Trim(hm_para_solic_ch) + #13#10 +
                      'Contate o CPD!', 2);
          btn_desmarca_todasClick(nil);
          Exit;
        end;

        if Not ( datm_solic_pagto.qry_solic_pagto_.State in [dsEdit, dsInsert] ) then
          datm_solic_pagto.qry_solic_pagto_.Edit;


        if ( StrToTime( FormatDateTime( 'hh:mm', Now ) ) > StrToTime( Trim(hm_para_solic_ch) ) ) then
           datm_solic_pagto.qry_solic_pagto_CD_STATUS.AsString := '5';  // Solicitado fora do horário

        (* -- atualiza data De Pagamento de acordo com a escolha do usuário (kleber - 03/03/2006) *)
        if (datm_solic_pagto.qry_solic_pagto_TP_DESTINO.AsString = '5') then
        begin
          with TQuery.Create(application) do
          begin
            DataBaseName := 'DBBROKER';
            Close;
            SQL.Clear;
            SQL.Add(' SELECT ISNULL(DT_PAGTO, '''') FROM TSOLIC_PAGTO WHERE NR_RD = ''' + datm_solic_pagto.qry_solic_pagto_NR_RD.AsString + ''' ');
            Prepare;
            Open;
            if Fields[0].AsString = '' then vDataRD := 0
            else vDataRD := Fields[0].AsDateTime;
            Free;

            if  (vDataPagto <> vDataRd) and (vDataRD <> 0) then
            begin
              if Application.MessageBox(Pchar('O item ''' + dbedt_nm_item.Text + ''' está contido no RD n.º ''' + datm_solic_pagto.qry_solic_pagto_NR_RD.AsString  + '''' + chr(13) +
                                        'que possui a seguinte Data de Pagamento: ' + DateToStr(vDataRD) + '! ' + chr(13) +
                                        'Clique em SIM para manter a Data do Pagamento do RD para este item ou' + chr(13) +
                                        'clique em NÃO para forçar a Data de Pagamento desejada para todos os itens do RD!!'),
                                        'Erro na Data de Pagamento',MB_YESNO + MB_ICONQUESTION) = mryes then
                 vRDMantemData := vRDMantemData + '"' + datm_solic_pagto.qry_solic_pagto_NR_RD.AsString + '", '
               else
                 vRDForcaData  := vRDForcaData  + '"' + datm_solic_pagto.qry_solic_pagto_NR_RD.AsString + '", ';
            end
            else
              vRDForcaData  := vRDForcaData  + '"' + datm_solic_pagto.qry_solic_pagto_NR_RD.AsString + '", ';

          end;
        end;

        datm_solic_pagto.qry_solic_pagto_.Post;

        CloseStoredProc( datm_solic_pagto.sp_proc_itens_solic_pagto );
        datm_solic_pagto.sp_proc_itens_solic_pagto.ParamByName('@NR_PROCESSO').AsString :=
            msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
        datm_solic_pagto.sp_proc_itens_solic_pagto.ParamByName('@NR_LANCAMENTO').AsString     :=
            dbedt_nr_lanc.Text;
        datm_solic_pagto.sp_proc_itens_solic_pagto.ParamByName('@CD_ITEM').AsString     :=
            dbedt_cd_item.Text;
        ExecStoredProc( datm_solic_pagto.sp_proc_itens_solic_pagto );
        CloseStoredProc( datm_solic_pagto.sp_proc_itens_solic_pagto );
        datm_main.db_broker.Commit;
      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      end;

      if CancelaOperacao then
      begin
        if BoxMensagem('Cancela a operação?', 1) then
        begin
          Cancelado            := True;
          CancelaOperacao      := False;
          Solicitando          := False;
          btn_cancelar.Enabled := False;
          mi_cancelar.Enabled  := False;
          btn_desmarca_todasClick(nil);
          Close;
          Exit;
        end
        else CancelaOperacao := False;
      end;

      dbgrdSolicPagto.SelectedRows.CurrentRowSelected := False;
      if dbgrdSolicPagto.SelectedRows.Count > 0 then
        TTable(dbgrdSolicPagto.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSolicPagto.SelectedRows[0]))
      else Break;
    end;

    // atualiza a Data de Pagamento de acordo com o escolhido pelo usuário (kleber - 20/03/2006)
    if (vRDForcaData <> '') or (vRDMantemData <> '') then
    begin
      with TQuery.Create(application) do
      begin
        DataBaseName := 'DBBROKER';
        if vRDForcaData <> '' then
        begin
          //  Forçando nova data escolhida pelo usuário
          Close;
          SQL.Clear;
          SQL.Add('UPDATE TSOLIC_PAGTO SET DT_PAGTO = CONVERT(DATETIME, ''' + DateToStr(vDataPagto) + ''', 103)');
          SQL.Add('WHERE  NR_RD IN (' + Copy(vRDForcaData, 1, Length(vRDForcaData) - 2 ) + ') ');
          try
            ExecSQL;
          except
            BoxMensagem('Erro ao atualizar Data de Pagamento! Se o problema persistir contate o suporte!', 2);
            btn_desmarca_todasClick(nil);
            Free;
            Exit;
          end;
        end;

        if vRDMantemData <> '' then
        begin
          j := 1;
          vPosicao := 0;
          for j := 1 to (Length(vRDMantemData) div 12) do
          begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT TOP 1 (DT_PAGTO) FROM TSOLIC_PAGTO WHERE NR_RD = ' + Copy(vRDMantemData, vPosicao + 1, 10));
            Prepare;
            Open;
            vDataUpdate := Fields[0].AsDateTime;
            Close;
            SQL.Clear;
            SQL.Add('UPDATE TSOLIC_PAGTO SET DT_PAGTO = CONVERT(DATETIME, ''' + DateToStr(vDataUpdate) + ''', 103)');
            SQL.Add('WHERE  NR_RD = ' + Copy(vRDMantemData, vPosicao + 1, 10 ) );
            try
              ExecSQL;
            except
              BoxMensagem('Erro ao atualizar Data de Pagamento! Se o problema persistir contate o suporte!', 2);
              btn_desmarca_todasClick(nil);
              Free;
              Exit;
            end;
            vPosicao := j * 12;
          end;
        end;
        Free;
      end;
    end;

    Solicitando          := False;
    CancelaOperacao      := False;
    Cancelado            := False;
    btn_cancelar.Enabled := False;
    mi_cancelar.Enabled  := False;
    Abre_ch;
  end;
end;

procedure Tfrm_solic_pagto.btn_canc_lancClick(Sender: TObject);
begin
  with datm_solic_pagto do
  begin
    if qry_solic_pagto_CD_STATUS.AsString <> '' then
    begin
      if StrToInt( qry_solic_pagto_CD_STATUS.AsString ) in [7, 8, 9, 10, 11, 16, 18 ] then
      begin
        BoxMensagem('Item não pode ser cancelado!', 3);
        Exit;
      end;
      if ( qry_solic_pagto_CD_STATUS.AsString = '4' ) or ( qry_solic_pagto_CD_STATUS.AsString = '17' ) then
      begin
        BoxMensagem('Item cancelado!', 3);
        Exit;
      end;
    end;

    if Not BoxMensagem( 'Confirma cancelamento do item ' + qry_solic_pagto_LookItem.AsString + '?', 1) then Exit;

    try
      datm_main.db_broker.StartTransaction;
      if Not ( qry_solic_pagto_.State in [dsEdit, dsInsert] ) then qry_solic_pagto_.Edit;
      if ( StrToInt( qry_solic_pagto_CD_STATUS.AsString ) in [ 1, 2, 3, 5, 12, 13, 14, 15 ] ) then
      begin
        qry_solic_pagto_NR_REF.AsString := '';
      end;
      qry_solic_pagto_CD_STATUS.AsString := '4';
      qry_solic_pagto_.Post;
      if (( not datm_solic_pagto.qry_solic_pagto_NR_RD.IsNull) or (datm_solic_pagto.qry_solic_pagto_NR_RD.AsString <> '')) then
        BoxMensagem('Item cancelado!' + chr(13) + 'Ele possuía o RD de número: ' + datm_solic_pagto.qry_solic_pagto_NR_RD.AsString + '! ' + chr(13) + 'Reimprima este RD pois ele foi alterado!' , 0);

      CloseStoredProc(sp_cancela_item_solic_pagto);
      sp_cancela_item_solic_pagto.ParamByName('@nr_processo').AsString   := qry_solic_pagto_NR_PROCESSO.AsString;
      sp_cancela_item_solic_pagto.ParamByName('@nr_lancamento').AsString := qry_solic_pagto_NR_LANCAMENTO.AsString;
      sp_cancela_item_solic_pagto.ParamByName('@cd_item').AsString       := qry_solic_pagto_CD_ITEM.AsString;
      ExecStoredProc(sp_cancela_item_solic_pagto);
      CloseStoredProc(sp_cancela_item_solic_pagto);

      datm_main.db_broker.Commit;
      pnl_solic_pagto.Enabled := False;
    except
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      qry_solic_pagto_.Cancel;
    end;
  Btn_Mi( st_incluir, False, False, st_excluir );
  end;
end;


procedure Tfrm_solic_pagto.dbedt_cd_itemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg     then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto      then btn_co_produtoClick(nil);
    if Sender = msk_nr_processo     then btn_co_processoClick(nil);
    if Sender = dbedt_cd_favorecido then btn_co_favorecidoClick(nil);
    if Sender = dbedt_cd_item       then btn_co_itemClick(nil);
    if Sender = dbedt_cd_calculo    then btn_co_calculoClick(nil);
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

procedure Tfrm_solic_pagto.btn_monta_pagtoClick(Sender: TObject);
begin
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '26';
  str_cd_rotina := '2602';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_monta_pagto, frm_monta_pagto);
  frm_monta_pagto.ShowModal;
  msk_nr_processoExit(msk_nr_processo);
end;

procedure Tfrm_solic_pagto.dbgrdSolicPagtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F2 then
  begin
    if dbgrdSolicPagto.SelectedRows.CurrentRowSelected then
       dbgrdSolicPagto.SelectedRows.CurrentRowSelected := False
    else
       dbgrdSolicPagto.SelectedRows.CurrentRowSelected := True;
  end;
end;

procedure Tfrm_solic_pagto.Verif_Serv;
var
  vQryServ : TQuery;
begin
  vLanca := '0';

  vQryServ := TQuery.Create(Application);
  vQryServ.DatabaseName := 'DBBROKER';
  vQryServ.Close;
  vQryServ.SQL.Clear;
  vQryServ.SQL.Add('SELECT IN_LANCA_SOLIC FROM TCLIENTE_SERVICO (NOLOCK) ');
  vQryServ.SQL.Add('WHERE CD_CLIENTE = :CD_CLIENTE AND CD_UNID_NEG = :CD_UNID_NEG ');
  vQryServ.SQL.Add('AND CD_PRODUTO = :CD_PRODUTO AND CD_SERVICO = :CD_SERVICO ');
  vQryServ.Params[0].AsString := edt_cd_cliente.Text;
  vQryServ.Params[1].AsString := msk_cd_unid_neg.Text;
  vQryServ.Params[2].AsString := msk_cd_produto.Text;
  vQryServ.Params[3].AsString := edt_cd_servico.Text;
  vQryServ.Prepare;
  vQryServ.Open;

  if vQryServ.RecordCount <> 0 then
    vLanca :=  vQryServ.Fields[0].AsString;

  vQryServ.Close;
  vQryServ.Free;
end;

procedure Tfrm_solic_pagto.btnDespesasArmazemClick(Sender: TObject);
var
  i, j, vTopAux, vQtdeContainer, vQtdeCargaSolta, vTabelaAtiva : Integer;
  vCntr : string;
  vTotalGeralProcesso : Real;
  vCliente, vServico, vArmazemDescarga : String;
  vValorCIF : Real;
  vDataValidade : TDateTime;

begin
  with TQuery.Create(application) do
  begin
    try
     pnlDespesasArmazem.Visible := True;
      // Libera da memória o scroll
      if scbDespesasArmazem <> nil then
        FreeAndNil(scbDespesasArmazem);
      // cria-o novamente
      with TScrollBox.Create(frm_solic_pagto) do
      begin
        Name        := 'scbDespesasArmazem';
        Parent      := pnlDespesasArmazem;
        Align       := alClient;
        BorderStyle := bsNone;
        Ctl3D       := False;
        Visible     := True;
      end;
      // verifica o processo, retornando o cliente, o servico e o armazem, para definir a tabela a ser usada
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT CD_CLIENTE, CD_SERVICO, CD_ARMAZEM_DESCARGA');
      SQL.Add('  FROM TPROCESSO ( NOLOCK )');
      SQL.Add(' WHERE NR_PROCESSO = ''' + datm_solic_pagto.qry_solic_pagto_.FieldByName('NR_PROCESSO').AsString + '''');
      Open;
      vCliente         := Fields[0].AsString;
      vServico         := Fields[1].AsString;
      vArmazemDescarga := Fields[2].AsString;
      Close;
      // verifica a tabela ativa nesse cliente
      SQL.Clear;
      SQL.Add('SELECT TOP 1 CD_TABELA, DT_VALIDADE FROM TARMAZEM_TABELAS_CLIENTE ( NOLOCK )');
      SQL.Add(' WHERE CD_ARMAZEM = ''' + vArmazemDescarga + ''' AND CD_CLIENTE = ''' + vCliente + ''' AND IN_ATIVO = ''1''');
      Open;
      vTabelaAtiva  := StrToIntDef( Fields[0].AsString, 0);
      vDataValidade := Fields[1].AsDateTime;
      Close;
      // se não tem tabela ativa, PAU !
      if vTabelaAtiva = 0 then
        raise Exception.Create('Não existe uma tabela definida ou ativa para este cliente/armazem/serviço.');
      // se ela venceu, PAU !!!!!!!!!!!!!
      if vDataValidade < now then
        raise Exception.Create('A tabela ativa está vencida. Favor verificar !');
      // retorna as despesas da tabela indicada
      SQL.Clear;
      SQL.Add('SELECT CD_ITEM, TX_DESCRICAO_DESPESA');
      SQL.Add('  FROM TARMAZEM_DESPESAS_CLIENTE ( NOLOCK )');
      SQL.Add(' WHERE CD_ARMAZEM = ''' + vArmazemDescarga + ''' AND CD_CLIENTE = ''' + vCliente + '''');
      SQL.Add('   AND CD_TABELA = ''' + IntToStr(vTabelaAtiva) + '''');
      SQL.Add('   AND CD_ITEM NOT IN (SELECT CD_ITEM FROM TSOLIC_PAGTO WHERE NR_PROCESSO = ''' + datm_solic_pagto.qry_solic_pagto_.FieldByName('NR_PROCESSO').AsString + ''')');
      SQL.Add(' GROUP BY CD_ITEM, TX_DESCRICAO_DESPESA');
      Open;
      vTopAux := 5;
      while not EOF do
      begin
        with TCheckBox.Create(frm_solic_pagto.FindComponent('scbDespesasArmazem')) do
        begin
          Name    := 'chkIncluir' + Fields[0].AsString + '_' + Stringreplace(Fields[1].AsString,' ','',[rfReplaceAll]);
          Parent  := TScrollBox(frm_solic_pagto.FindComponent('scbDespesasArmazem'));
          Caption := Fields[1].AsString;
          Top     := vTopAux;
          Left    := 5;
          Width   := 300;
          Visible := True;
          if ( ConsultaLookupSQL('SELECT COUNT(*) BLA FROM TPROCESSO_ARMAZEM_DESPESAS_CANCELADAS WHERE NR_PROCESSO = ''' + datm_solic_pagto.qry_solic_pagto_.FieldByName('NR_PROCESSO').AsString + ''' AND CD_ITEM = ''' + Fields[0].AsString + '''','BLA') = '1' ) then
            Font.Color := clRed;
          vTopAux := vTopAux + 20;
        end;
        Next;
      end;
    finally
      Close;
      Free;
    end;
  end;
end;

procedure Tfrm_solic_pagto.btnCancelaCancelamentoClick(Sender: TObject);
begin
  // Libera da memória o scroll
  if scbDespesasArmazem <> nil then
    FreeAndNil(scbDespesasArmazem);
  // deixa o painel invisivel
  pnlDespesasArmazem.Visible := False;
end;

procedure Tfrm_solic_pagto.btnConfirmaCancelamentoClick(Sender: TObject);
var
  vQryArmazenagem : TQuery;
  vCntr, vLancamentoAux : string;
  i : Integer;
  vItensSelecionados : string;

  function fExecSQL(const pSQL : String) : Boolean;
  begin
    with TQuery.Create(application) do
    begin
      try
        try
          Result := True;
          Databasename := 'DBBROKER';
          SQL.Clear;
          SQL.Add(pSQL);
          ParamByName('VALOR').AsFloat := vDespesasNoArmazem[i].ValorTotalDespesa;
          ExecSQL;
        except
          On e:Exception do
          begin
            Result := False;
            ShowMessage('Ocorreu o seguinte erro na aplicação :' + #13#10 + e.message + #10#13 + 'Informe o departamento de TI.');
          end;
        end;
      finally
        Free;
      end;
    end;
  end;

begin

  vQryArmazenagem := TQuery.Create(Application);
  with vQryArmazenagem do
  begin
    try
      Databasename := 'DBBROKER';
      // verificando os checkbox selecionados
      for i := 0 to TScrollBox(frm_solic_pagto.FindComponent('scbDespesasArmazem')).ComponentCount-1 do
        if ( TScrollBox(frm_solic_pagto.FindComponent('scbDespesasArmazem')).Components[i] is TCheckBox ) then
          if ( TCheckBox(TScrollBox(frm_solic_pagto.FindComponent('scbDespesasArmazem')).Components[i]).Checked ) then
            vItensSelecionados := vItensSelecionados + ' ' + Copy(TCheckBox(TScrollBox(frm_solic_pagto.FindComponent('scbDespesasArmazem')).Components[i]).Name,11,3);
      // CALCULANDO PRIMEIRO POR CONTAINER //
      SQL.Clear;
      SQL.Add('SELECT TP.TP_PESO, PC.*');
      SQL.Add('  FROM TPROCESSO_CNTR PC, TTP_CNTR TP');
      SQL.Add(' WHERE PC.NR_PROCESSO = ''' + datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString + '''');
      SQL.Add('   AND TP.TP_CNTR = PC.TP_CNTR');
      Open;
      while not EOF do
      begin
        vCntr := FieldByName('NR_CNTR').AsString;
        // Verificando e calculando despesas
        if not DespesasNoArmazem(datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString, vCntr, 'CO', Fields[0].AsString, 0, True, false) then
          Exit;
        // A função joga os calculos para o array "vDespesasNoArmazem", e agora vou fazer um loop para mostrar na tela
        for i := 0 to Length(vDespesasNoArmazem) - 1 do  // roda despesa a despesa calculada
        begin
          vLancamentoAux := ConsultaLookUpSQL('SELECT ( SUBSTRING(''000'',1,3-LEN(ISNULL(MAX(NR_LANCAMENTO),0)+1)) + CAST(ISNULL(MAX(NR_LANCAMENTO),0)+1 AS CHAR) ) BLA ' +
                                              ' FROM TSOLIC_PAGTO WHERE NR_PROCESSO = ''' + datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString + '''', 'BLA');
          if Pos(vDespesasNoArmazem[i].Item ,vItensSelecionados) > 0 then // verifica se elas estao configuradas para o cliente
          begin
            if StrToInt(ConsultaLookupSQL('SELECT COUNT(*) BLA FROM TSOLIC_PAGTO' +
                                          ' WHERE NR_PROCESSO    = ''' + datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString + '''' +
                                          '   AND CD_ITEM        = ''' + vDespesasNoArmazem[i].Item + '''', 'BLA')) > 0 then
            begin
              if not fExecSQL('UPDATE TSOLIC_PAGTO SET VL_PAGTO = VL_PAGTO + :VALOR' +
                                 ' WHERE NR_PROCESSO    = ''' + datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString + '''' +
                                 '   AND CD_ITEM        = ''' + vDespesasNoArmazem[i].Item + '''') then
                ShowMessage('Ocorreu um erro ao acumular valores nas despesas do armazém. Informe o departamento de TI.');
            end else begin
              if not fExecSQL('INSERT TSOLIC_PAGTO (NR_PROCESSO, NR_LANCAMENTO, CD_ITEM, VL_PAGTO, CD_USUARIO_SOLIC, DT_SOLIC_PAGTO, DT_PAGTO, CD_STATUS, IN_SOLICITADO, HM_SOLIC_PAGTO) ' +
                                                                  ' VALUES ( ''' + datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString + ''',''' + vLancamentoAux + ''',''' + vDespesasNoArmazem[i].Item + ''',:VALOR,''' + str_cd_usuario + ''',' +
                                                                  ' ''' + FormatDateTime('dd"/"mm"/"yyyy',dt_server) + ''',''' + FormatDateTime('dd"/"mm"/"yyyy',dt_server) + ''',''0'',''0'',''' + FormatDateTime( 'hh:mm', Now ) + ''')') then
                ShowMessage('Ocorreu um erro ao inserir as despesas do armazém. Informe o departamento de TI.');
            end;
          end;
        end;
        Next;
      end;
      // CALCULANDO POR CARGA SOLTA //
      SQL.Clear;
      SQL.Add('SELECT * FROM TPROCESSO_CARGA_SOLTA');
      SQL.Add(' WHERE NR_PROCESSO = ''' + datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString + '''');
      Open;
      while not EOF do
      begin
        vCntr := FieldByName('NR_CNTR').AsString;
        // Verificando e calculando despesas
        if not DespesasNoArmazem(datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString, vCntr, 'CO', '', 0, True) then
          Exit;
        // A função joga os calculos para o array "vDespesasNoArmazem", e agora vou fazer um loop para mostrar na tela
        for i := 0 to Length(vDespesasNoArmazem) - 1 do  // roda despesa a despesa calculada
        begin
          vLancamentoAux := ConsultaLookUpSQL('SELECT ( SUBSTRING(''000'',1,3-LEN(ISNULL(MAX(NR_LANCAMENTO),0)+1)) + CAST(ISNULL(MAX(NR_LANCAMENTO),0)+1 AS CHAR) ) BLA ' +
                                              ' FROM TSOLIC_PAGTO WHERE NR_PROCESSO = ''' + datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString + '''', 'BLA');
          if Pos(vDespesasNoArmazem[i].Item ,vItensSelecionados) > 0 then // verifica se elas estao configuradas para o cliente
          begin
            if StrToInt(ConsultaLookupSQL('SELECT COUNT(*) BLA FROM TSOLIC_PAGTO' +
                                          ' WHERE NR_PROCESSO    = ''' + datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString + '''' +
                                          '   AND CD_ITEM        = ''' + vDespesasNoArmazem[i].Item + '''', 'BLA')) > 0 then
            begin
              if not FastExecSQL('UPDATE TSOLIC_PAGTO SET VL_PAGTO = VL_PAGTO + ' + FormatFloat('########0,00',vDespesasNoArmazem[i].ValorTotalDespesa) + '' +
                                 ' WHERE NR_PROCESSO    = ''' + datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString + '''' +
                                 '   AND CD_ITEM        = ''' + vDespesasNoArmazem[i].Item + '''') then
                ShowMessage('Ocorreu um erro ao acumular valores nas despesas do armazém. Informe o departamento de TI.');
            end else begin
              if not FastExecSQL('INSERT TSOLIC_PAGTO (NR_PROCESSO, NR_LANCAMENTO, CD_ITEM, VL_PAGTO, CD_USUARIO_SOLIC, DT_SOLIC_PAGTO, DT_PAGTO, CD_STATUS, IN_SOLICITADO, HM_SOLIC_PAGTO) ' +
                                                                  ' VALUES ( ''' + datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString + ''',''' + vLancamentoAux + ''',''' + vDespesasNoArmazem[i].Item + ''','+FormatFloat('########0,00',vDespesasNoArmazem[i].ValorTotalDespesa)+',''' + str_cd_usuario + ''',' +
                                                                  ' ''' + FormatDateTime('dd"/"mm"/"yyyy',dt_server) + ''',''' + FormatDateTime('dd"/"mm"/"yyyy',dt_server) + ''',''0'',''0'',''' + FormatDateTime( 'hh:mm', Now ) + ''')') then
                ShowMessage('Ocorreu um erro ao inserir as despesas do armazém. Informe o departamento de TI.');
            end;
          end;
        end;
        Next;
      end;
    finally
      Close;
      Free;
      // Libera da memória o scroll
      if scbDespesasArmazem <> nil then
        FreeAndNil(scbDespesasArmazem);
      // deixa o painel invisivel
      pnlDespesasArmazem.Visible := False;
      msk_nr_processoExit(nil);
    end;
  end;

end;

procedure Tfrm_solic_pagto.dbradgrop_tp_convertChange(Sender: TObject);
begin
  if not(datm_solic_pagto.qry_solic_pagto_.State in [dsEdit]) then
    exit;
  dbedt_dt_paridade.Visible:=(dbradgrop_tp_convert.ItemIndex = 1);
  dbedt_dt_paridade.Enabled:=(dbradgrop_tp_convert.ItemIndex = 1);
  dbedt_vl_paridade.Visible:=(dbradgrop_tp_convert.ItemIndex = 0);
  dbedt_vl_paridade.Enabled:=(dbradgrop_tp_convert.ItemIndex = 0);
  if dbradgrop_tp_convert.ItemIndex = 0 then
    lb_paridade.Caption:='Valor Manual'
  else lb_paridade.Caption:='Data do Tarifário';
  dbedt_cd_itemChange(nil);
end;

procedure Tfrm_solic_pagto.dbgrid_solic_pagtoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Const

 CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,

     DFCS_BUTTONCHECK or DFCS_CHECKED);

var

 CheckBoxRectangle : TRect;
 ctrl_booleano :Boolean;

begin

 if  Column.FieldName = 'IN_SELECIONADO' then

// if Column.Field.DataType = ftBoolean then

 begin
 if datm_solic_pagto.qry_solic_pagto_IN_SELECIONADO.AsString = '0' then
   ctrl_booleano :=false
 else ctrl_booleano:= true;



 dbgrid_solic_pagto.Canvas.FillRect(Rect);

 CheckBoxRectangle.Left := Rect.Left + 2;

 CheckBoxRectangle.Right := Rect.Right - 2;

 CheckBoxRectangle.Top := Rect.Top + 2;

 CheckBoxRectangle.Bottom := Rect.Bottom - 2;

 DrawFrameControl(dbgrid_solic_pagto.Canvas.Handle,

      CheckBoxRectangle,

      DFC_BUTTON,

      CtrlState[ctrl_booleano]);

end;

end;

procedure Tfrm_solic_pagto.dbgrid_solic_pagtoCellClick(Column: TColumn);
begin
 if dbgrid_solic_pagto.SelectedIndex = 0  then

 //if grid_remessa.SelectedField.DataType = ftBoolean then
     SaveBoolean(in_ctrl_grid);
 dbgrid_solic_pagto.Repaint;
end;

procedure Tfrm_solic_pagto.SaveBoolean(hab:Boolean);
begin
 //grid_remessa.SelectedField.Dataset.Edit;
// if not hab then exit;

 if not(datm_solic_pagto.qry_solic_pagto_.State in [dsEdit])then
   datm_solic_pagto.qry_solic_pagto_.Edit;

 if datm_solic_pagto.qry_solic_pagto_IN_SELECIONADO.AsString = '0' then
  begin
    if datm_solic_pagto.qry_solic_pagto_CD_FAVORECIDO.AsString ='' THEN
      begin
       datm_solic_pagto.qry_solic_pagto_.cancel;
       Boxmensagem('Deve ser informado um Favorecido!',2);
       exit;
      end;
  if (datm_solic_pagto.qry_solic_pagto_VL_PAGTO.AsFloat <= 0)  THEN
      begin
       datm_solic_pagto.qry_solic_pagto_.cancel;
       Boxmensagem('Deve ser informado um Valor a Ser Solicitado!',2);
       exit;
      end;

  if (strtoint(datm_solic_pagto.qry_solic_pagto_CD_STATUS.AsString) in[1,4,5,6,7,8,11,19,12,15,17])  THEN
      begin
       datm_solic_pagto.qry_solic_pagto_.cancel;
       Boxmensagem('Item não pode ser Referenciado!',2);
       exit;
      end;


   datm_solic_pagto.qry_solic_pagto_IN_SELECIONADO.AsString :='1';
  end
 else
  begin
   if (datm_solic_pagto.qry_solic_pagto_CD_STATUS.AsString <>'0')  THEN
      begin
       datm_solic_pagto.qry_solic_pagto_.cancel;
       exit;
      end;
   datm_solic_pagto.qry_solic_pagto_IN_SELECIONADO.AsString := '0' ;
  end;
 //datm_gerar_remessa.qry_processo_IN_SELECIONADO.AsString := not datm_gerar_remessa.qry_processo_IN_SELECIONADO.AsBoolean;
 //grid_remessa.SelectedField.AsBoolean :=
 datm_main.db_broker.StartTransaction;
 try
   datm_solic_pagto.qry_solic_pagto_.Post;
   datm_main.db_broker.Commit;
 except
   if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback; // Try...Except incluido por michel para evitar transação travada - Michel - 19/04/2010
 end;
end;


procedure Tfrm_solic_pagto.DBEdit6Change(Sender: TObject);
begin
  edtDescricaoItem.Text := ConsultaLookUp('TITEM','CD_ITEM',DBEdit6.Text,'NM_ITEM');
end;

procedure Tfrm_solic_pagto.DBEdit5Change(Sender: TObject);
begin
  edtNomeFavorecido.Text := ConsultaLookUp('TFAVORECIDO','CD_FAVORECIDO',DBEdit5.Text,'NM_FAVORECIDO');
  dbedt_cd_itemChange(nil);
end;

procedure Tfrm_solic_pagto.btnDespesasFreteClick(Sender: TObject);
var vTopAux : integer;
    vQryMoeda1, vQryMoeda2: TQuery;
begin
  with TQuery.Create(application) do
  begin
    try
      btnCancelaFreteClick(nil);
      pnlFrete.Visible := True;
      // Libera da memória o scroll
{      if frm_solic_pagto.pnlFrete.FindComponent('sbFrete') <> nil then
      begin
        TScrollBox(frm_solic_pagto.pnlFrete.FindComponent('sbFrete')).Free;
      end;
      // cria-o novamente
      with TScrollBox.Create(pnlFrete) do
      begin
        Name        := 'sbFrete';
        Parent      := pnlFrete;
        Align       := alClient;
        BorderStyle := bsNone;
        Ctl3D       := False;
        Visible     := True;
      end; }
      DatabaseName :='DBBROKER';
      Close;
      SQL.Clear;
      SQL.Add('SELECT ISNULL(P.CD_TAB_FRETE, "") FROM TPROCESSO P (NOLOCK) WHERE P.NR_PROCESSO = "' + datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString  + '" ');
      Open;
      if Fields[0].AsString = '' then
        raise Exception.Create('Não existe uma tabela de Frete definida para este processo.');
      Close;
      SQL.Clear;
      SQL.Add('SELECT DISTINCT TFD.CD_ITEM, (SELECT I.NM_ITEM FROM TITEM I (NOLOCK) WHERE I.CD_ITEM = TFD.CD_ITEM) NM_ITEM, TFD.CD_MOEDA ');
      SQL.Add('  FROM TTAB_FRETE_DESPESA TFD (NOLOCK), TPROCESSO P (NOLOCK) ');
      SQL.Add(' WHERE P.NR_PROCESSO = "' + datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString + '" ');
      SQL.Add('   AND TFD.CD_TAB_FRETE = P.CD_TAB_FRETE ');
      SQL.Add('   AND TFD.TP_ESTUFAGEM = P.TP_ESTUFAGEM ');
      Open;
      vTopAux := 5;
      while not EOF do
      begin
        try
         // não traz itens que existam que estejam solicitados ou pagos
         if ConsultaLookUpSQL('SELECT CASE IN_SOLICITADO + CD_STATUS WHEN "17" THEN "1" ELSE "0" END AS ITEM_SOLICITADO_OU_PAGO ' +
                               ' FROM TSOLIC_PAGTO (NOLOCK) WHERE NR_PROCESSO = "' + datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString + '" ' +
                               'AND CD_ITEM = "' + Fields[0].AsString + '" ','ITEM_SOLICITADO_OU_PAGO') <> '1' then begin

            with TCheckBox.Create(frm_solic_pagto.FindComponent('sbFrete')) do
            begin
              Name    := 'chkIncluir' + Fields[0].AsString + '_' + Fields[2].AsString;
              Parent  := TScrollBox(frm_solic_pagto.FindComponent('sbFrete'));
              Caption := Fields[1].AsString;
              Top     := vTopAux;
              Left    := 5;
              Width   := 300;
              Visible := True;
              vTopAux := vTopAux + 20;
            end;
           end;
        except
          ShowMessage('Existem itens com as mesmas configurações na tabela de Frete');
        end;
        Next;
      end;
      Close;
      SQL.Clear;
      SQL.Add('SELECT CASE S.CD_VIA_TRANSPORTE ');
      SQL.Add('         WHEN "01" THEN (SELECT CD_ITEM_FRETE_MAR   FROM TPARAMETROS) ');
      SQL.Add('         WHEN "04" THEN (SELECT CD_ITEM_FRETE_AEREO FROM TPARAMETROS) ');
      SQL.Add('         ELSE "" ');
      SQL.Add('       END AS CD_ITEM, ');
      SQL.Add('       CASE S.CD_VIA_TRANSPORTE ');
      SQL.Add('         WHEN "01" THEN (SELECT NM_ITEM FROM TITEM WHERE CD_ITEM IN (SELECT CD_ITEM_FRETE_MAR   FROM TPARAMETROS)) ');
      SQL.Add('         WHEN "04" THEN (SELECT NM_ITEM FROM TITEM WHERE CD_ITEM IN (SELECT CD_ITEM_FRETE_AEREO FROM TPARAMETROS)) ');
      SQL.Add('         ELSE "" ');
      SQL.Add('       END AS NM_ITEM, ');
      SQL.Add('       TF.CD_MOEDA_TAB_FRETE ');
      SQL.Add('  FROM TPROCESSO P (NOLOCK) ');
      SQL.Add(' INNER JOIN TSERVICO S (NOLOCK) ON P.CD_SERVICO = S.CD_SERVICO ');
      SQL.Add(' INNER JOIN TTAB_FRETE TF (NOLOCK) ON P.CD_TAB_FRETE = TF.CD_TAB_FRETE ');
      SQL.Add(' WHERE NR_PROCESSO =  "' + datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString + '" ');
      Open;
      if not IsEmpty then begin
        try
          with TCheckBox.Create(frm_solic_pagto.FindComponent('sbFrete')) do
          begin
            Name    := 'chkIncluir' + Fields[0].AsString + '_' + Fields[2].AsString;
            Parent  := TScrollBox(frm_solic_pagto.FindComponent('sbFrete'));
            Caption := Fields[1].AsString;
            Top     := vTopAux;
            Left    := 5;
            Width   := 300;
            Visible := True;
            vTopAux := vTopAux + 20;
          end;
        except
          ShowMessage('Existem itens com as mesmas configurações na tabela de Frete');
        end;
      end;

    finally
      Close;
      Free;
    end;
  end;
  {lista as moedas do processo para a taxa de Conversão das mesmas}
  try
    vTopAux := 10;
    vQryMoeda1 := TQuery.Create(application);
    vQryMoeda2 := TQuery.Create(application);

    vQryMoeda1.DataBaseName := 'DBBROKER';
    vQryMoeda1.Close;
    vQryMoeda1.SQL.Clear;
    vQryMoeda1.SQL.Add('SELECT DISTINCT TFD.CD_MOEDA, (SELECT M.NM_MOEDA FROM TMOEDA_BROKER M (NOLOCK) WHERE M.CD_MOEDA = TFD.CD_MOEDA) AS NM_MOEDA, ');
    vQryMoeda1.SQL.Add('      (SELECT ISNULL(T.TX_CAMBIO, 1) FROM TTAXA_CAMBIO T (NOLOCK) WHERE T.CD_MOEDA = TFD.CD_MOEDA AND GETDATE() BETWEEN T.DT_INICIO_VIGENCIA AND T.DT_TERMINO_VIGENCIA) AS TAXA ');
    vQryMoeda1.SQL.Add('  FROM TTAB_FRETE_DESPESA TFD (NOLOCK), TPROCESSO P (NOLOCK)  ');
    vQryMoeda1.SQL.Add(' WHERE P.NR_PROCESSO = "' + datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString + '" ');
    vQryMoeda1.SQL.Add(' AND TFD.CD_TAB_FRETE = P.CD_TAB_FRETE ');
    vQryMoeda1.SQL.Add(' AND TFD.TP_ESTUFAGEM = P.TP_ESTUFAGEM ');
    vQryMoeda1.SQL.Add(' AND TFD.CD_MOEDA <> "790" ');
    vQryMoeda1.Open;

    vQryMoeda2.DataBaseName := 'DBBROKER';
    vQryMoeda2.Close;
    vQryMoeda2.SQL.Clear;
    vQryMoeda2.SQL.Add('SELECT TF.CD_MOEDA_TAB_FRETE, (SELECT M.NM_MOEDA FROM TMOEDA_BROKER M (NOLOCK) WHERE M.CD_MOEDA = TF.CD_MOEDA_TAB_FRETE) AS NM_MOEDA, ');
    vQryMoeda2.SQL.Add('      (SELECT ISNULL(T.TX_CAMBIO, 1) FROM TTAXA_CAMBIO T (NOLOCK) WHERE TF.CD_MOEDA_TAB_FRETE = T.CD_MOEDA AND GETDATE() BETWEEN T.DT_INICIO_VIGENCIA AND T.DT_TERMINO_VIGENCIA) AS TAXA ');
    vQryMoeda2.SQL.Add('  FROM TTAB_FRETE TF (NOLOCK) , TPROCESSO P (NOLOCK) ');
    vQryMoeda2.SQL.Add(' WHERE P.NR_PROCESSO = "' + datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString + '" ');
    vQryMoeda2.SQL.Add(' AND TF.CD_TAB_FRETE = P.CD_TAB_FRETE ');
    vQryMoeda2.SQL.Add(' AND TF.CD_MOEDA_TAB_FRETE <> "790" ');
    vQryMoeda2.SQL.Add(' AND TF.CD_MOEDA_TAB_FRETE NOT IN (SELECT DISTINCT TFD.CD_MOEDA ');
    vQryMoeda2.SQL.Add('                                  FROM TTAB_FRETE_DESPESA TFD (NOLOCK) ');
    vQryMoeda2.SQL.Add('                                  WHERE TFD.CD_TAB_FRETE = TF.CD_TAB_FRETE) ');
    vQryMoeda2.Open;


    // verifica se existe moeda para converter
    if (vQryMoeda1.IsEmpty) and (vQryMoeda2.IsEmpty) then begin
      pnlMoeda.Visible := false;
      Exit;
    end; 
    if not (vQryMoeda1.IsEmpty) then begin
      while not vQryMoeda1.Eof do begin
        try
          //cria label
          with TLabel.Create(frm_solic_pagto.FindComponent('sbMoeda')) do
          begin
            Name    := 'lblTaxa' + vQryMoeda1.Fields[0].AsString;
            Parent  := TScrollBox(frm_solic_pagto.FindComponent('sbMoeda'));
            Caption := vQryMoeda1.Fields[1].AsString;
            Top     := vTopAux;
            Left    := 5;
            Width   := 190;
            Visible := True;
          end;

          //cria edit
          with TEdit.Create(frm_solic_pagto.FindComponent('sbMoeda')) do
          begin
            Name    := 'edtTaxa' + vQryMoeda1.Fields[0].AsString;
            Parent  := TScrollBox(frm_solic_pagto.FindComponent('sbMoeda'));
            Text    := FormatFloat('0.00', vQryMoeda1.Fields[2].AsFloat);
            ctl3d  := False;
            Top     := vTopAux;
            Left    := 200;
            Width   := 50;
            Visible := True;
            vTopAux := vTopAux + 22;
          end;
          vQryMoeda1.Next;
        except
          ShowMessage('Erro ao gerar Moedas!');
        end;

      end;
    end;
    if not (vQryMoeda2.IsEmpty) then begin
      while not vQryMoeda2.Eof do begin
        try
          //cria label
          with TLabel.Create(frm_solic_pagto.FindComponent('sbMoeda')) do
          begin
            Name    := 'lblTaxa' + vQryMoeda2.Fields[0].AsString;
            Parent  := TScrollBox(frm_solic_pagto.FindComponent('sbMoeda'));
            Caption := vQryMoeda2.Fields[1].AsString;
            Top     := vTopAux;
            Left    := 5;
            Width   := 190;
            Visible := True;
          end;

          //cria edit
          with TEdit.Create(frm_solic_pagto.FindComponent('sbMoeda')) do
          begin
            Name    := 'edtTaxa' + vQryMoeda2.Fields[0].AsString;
            Parent  := TScrollBox(frm_solic_pagto.FindComponent('sbMoeda'));
            Text    := FormatFloat('0.00', vQryMoeda2.Fields[2].AsFloat);
            ctl3d  := False;
            Top     := vTopAux;
            Left    := 200;
            Width   := 50;
            Visible := True;
            vTopAux := vTopAux + 22;
          end;
          vQryMoeda2.Next;
        except
          ShowMessage('Erro ao gerar Moedas!');
        end;
      end;
    end;

  finally
    vQryMoeda1.Close;
    vQryMoeda2.Close;
    vQryMoeda1.Free;
    vQryMoeda2.Free;
  end;                              

end;

procedure Tfrm_solic_pagto.btnConfirmaFreteClick(Sender: TObject);
const
    txErro: array[1..11] of string = ('Erro Interno. Problema na Consulta ao Banco de Dados. Informe o Depto. de TI.',
                                     'Não existem todos os tipos de cntrs do Processo na Tabela de Fretes!',
                                     'Não existe "Tarifa LCL" cadastrada em Tarifas na Tabela de Frete!',
                                     'Não existe Tarifa cadastrada com Simbolo "-" na Tabela de Frete!',
                                     'Não existe Tarifa cadastrada com símbolo "+" na tabela de Frete!',
                                     'Não foi possível encontrar Tarifa correta na Tabela de Frete. Informe o Depto. de TI.',
                                     'Não existe via de Transporte válida na tabela de Frete!',
                                     'Não existe Tipo de Estufagem válida na tabela de Frete!',
                                     'Não existe Taxa de Moeda cadastrada para o dia de Hoje!',
                                     'Moeda de Frete do Processo diferente da Moeda da Tabela de Frete!',
                                     'Não existe Cntrs cadastrados no Processo. Impossível calcular!');
var i, j: integer;
    vProcesso, vTabela, vItem, vMoeda, vErros, vLancamentoAux: string;
    vResultado: real;
    vCdErro: string [2];
    vTaxa: real;
    vMensagem: TStringList;
begin
    try
      vProcesso := datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString;
      vTabela := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', vProcesso, 'CD_TAB_FRETE');

      for i := 0 to sbFrete.ComponentCount-1 do begin
        if ( sbFrete.Components[i] is TCheckBox ) then begin
          if ( TCheckBox(sbFrete.Components[i]).Checked ) then begin
            // lancto Aux
            vLancamentoAux := ConsultaLookUpSQL('SELECT ( SUBSTRING(''000'',1,3-LEN(ISNULL(MAX(NR_LANCAMENTO),0)+1)) + CAST(ISNULL(MAX(NR_LANCAMENTO),0)+1 AS CHAR) ) BLA ' +
                                                ' FROM TSOLIC_PAGTO WHERE NR_PROCESSO = ''' + datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString + '''', 'BLA');
            //calcula frete

            vItem :=  Copy(TCheckBox(sbFrete.Components[i]).Name,11,3);
            vMoeda := Copy(TCheckBox(sbFrete.Components[i]).Name,15,3);
            vResultado := CalculaFrete(vProcesso, vTabela, vItem, false);
            if vResultado < 0 then begin
              vCdErro := Copy('00' , 1, 2- Length(FloatToStr(Abs(vResultado)))) + FloatToStr(Abs(vResultado));
              vResultado := 0;
              if Pos(vCdErro, vErros) = 0 then
                vErros := vErros + '/' + vCdErro;
            end;

            if vMoeda = '790' then vTaxa := 1;
            for j := 0 to sbMoeda.ComponentCount-1  do
              if (Copy(TEdit(sbMoeda.Components[j]).Name, 8, 3) = vMoeda) and (sbMoeda.Components[j] is TEdit) then
                vTaxa := strToFloat( TEdit(sbMoeda.Components[j]).Text);

            vResultado := vResultado * vTaxa;

            //dá um insert ou um update dependendo da existência do item
            if StrToInt(ConsultaLookupSQL('SELECT COUNT(*) BLA FROM TSOLIC_PAGTO' +
                                          ' WHERE NR_PROCESSO    = ''' + datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString + '''' +
                                          '   AND CD_ITEM        = ''' + vItem + '''', 'BLA')) > 0 then
            begin
              with TQuery.Create(application) do begin
                DataBaseName := 'DBBROKER';
                Close;
                SQL.Clear;
                SQL.Add('UPDATE TSOLIC_PAGTO SET VL_PAGTO = :VL_PAGTO, VL_PARIDADE = :VL_PARIDADE, CD_MOEDA = "' + vMoeda + '" ');
                SQL.Add('  WHERE NR_PROCESSO    = ''' + datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString + ''' ');
                SQL.Add('  AND CD_ITEM        = ''' + vItem + ''' ');
                ParamByName('VL_PAGTO').AsFloat := vResultado;
                ParamByName('VL_PARIDADE').AsFloat := vTaxa;
                try
                  ExecSQL;
                except
                  ShowMessage('Ocorreu um erro ao acumular valores nas despesas do Frete. Informe o departamento de TI.');
                  Free;
                end;
                Free;
              end;
            end else begin
              with TQuery.Create(application) do begin
                DataBaseName := 'DBBROKER';
                Close;
                SQL.Clear;
                SQL.Add(' INSERT TSOLIC_PAGTO (NR_PROCESSO, NR_LANCAMENTO, CD_ITEM, VL_PAGTO, VL_PARIDADE, CD_MOEDA, CD_USUARIO_SOLIC, DT_SOLIC_PAGTO, DT_PAGTO, CD_STATUS, IN_SOLICITADO, HM_SOLIC_PAGTO) ');
                SQL.Add(' VALUES ( ''' + datm_solic_pagto.qry_solic_pagto_NR_PROCESSO.AsString + ''',''' + vLancamentoAux + ''',''' + vItem + ''', :VL_PAGTO ,:VL_PARIDADE,''' + vMoeda + ''',''' + str_cd_usuario + ''',');
                SQL.Add(' ''' + FormatDateTime('dd"/"mm"/"yyyy',dt_server) + ''',''' + FormatDateTime('dd"/"mm"/"yyyy',dt_server) + ''',''0'',''0'',''' + FormatDateTime( 'hh:mm', Now ) + ''') ');
                ParamByName('VL_PAGTO').AsFloat := vResultado;
                ParamByName('VL_PARIDADE').AsFloat := vTaxa;
                try
                  ExecSQL;
                except
                  ShowMessage('Ocorreu um erro ao inserir as despesas do Frete. Informe o departamento de TI.');
                  Free;
                end;
                Free;
              end;
            end;
          end;
        end;
      end;


    if vErros <> '' then begin
      vMensagem := TStringList.Create;
      vMensagem.Add('Algum(ns) item(ns) não foram calculados corretamente...');
      i := 2;
      repeat
        vMensagem.Add(txErro[StrToInt(Copy(vErros, i, 2))]);
        i := i + 3;
      until i > Length(vErros);
      Application.MessageBox(Pchar(vMensagem.Text), 'Erro(s) no cálculo de Frete...', MB_OK + MB_ICONERROR);
      vMensagem.Free;
   end;

  finally
    msk_nr_processoExit(nil);
    btnCancelaFreteClick(nil);
  end;
end;

procedure Tfrm_solic_pagto.btnCancelaFreteClick(Sender: TObject);
var i: Integer;
begin
  // Libera da memória o scroll
  for i := sbFrete.ComponentCount -1 downto 0 do
    sbFrete.Components[i].Free;
  for i := sbMoeda.ComponentCount -1 downto 0 do
    sbMoeda.Components[i].Free;
  // deixa o painel invisivel
  pnlFrete.Visible := False;
end;

end.
