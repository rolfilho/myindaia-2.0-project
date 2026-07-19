unit PGPG003;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, ComCtrls, Funcoes;

type
  Tfrm_monta_pagto = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    btnMontagem: TSpeedButton;
    pgctrl_monta_pagto: TPageControl;
    ts_processo: TTabSheet;
    ts_favorecido: TTabSheet;
    lbl_unid_neg: TLabel;
    lbl_produto: TLabel;
    btn_co_unid_neg_proc: TSpeedButton;
    btn_co_produto: TSpeedButton;
    lbl_processo: TLabel;
    btn_co_processo2: TSpeedButton;
    lbl_cliente: TLabel;
    lbl_servico: TLabel;
    msk_cd_unid_neg_proc: TMaskEdit;
    edt_nm_unid_neg_proc: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_nr_processo: TMaskEdit;
    edt_cd_cliente: TEdit;
    edt_nm_cliente: TEdit;
    edt_cd_servico: TEdit;
    edt_nm_servico: TEdit;
    lbl_favorecido: TLabel;
    msk_cd_favorecido: TMaskEdit;
    edt_nm_favorecido: TEdit;
    btn_co_favorecido: TSpeedButton;
    dbgrdMontaPagto: TDBGrid;
    dbgrdMontaFav: TDBGrid;
    pnl_por_processo: TPanel;
    lbl_item: TLabel;
    lbl_vl_item: TLabel;
    lbl_status: TLabel;
    btn_co_item: TSpeedButton;
    lbl_banco2: TLabel;
    btn_co_banco: TSpeedButton;
    lbl_favorecido2: TLabel;
    btn_co_favorecido2: TSpeedButton;
    dbedt_vl_pagto_proc: TDBEdit;
    dbedt_nm_item: TDBEdit;
    dbedt_cd_item: TDBEdit;
    dbedt_cd_banco: TDBEdit;
    dbedt_nm_banco: TDBEdit;
    dbedt_cd_favorecido: TDBEdit;
    dbedt_nm_favorecido: TDBEdit;
    pnl_por_favorecido: TPanel;
    lbl_item2: TLabel;
    lbl_valor2: TLabel;
    btn_co_item2: TSpeedButton;
    lbl_dt_pagto2: TLabel;
    lbl_nr_docto2: TLabel;
    dbedt_vl_pagto_fav: TDBEdit;
    dbedt_nm_item2: TDBEdit;
    dbedt_cd_item2: TDBEdit;
    dbedt_dt_pagto2: TDBEdit;
    dbedt_nr_docto2: TDBEdit;
    dbedt_cd_status: TDBEdit;
    btn_desmarca_todas: TSpeedButton;
    btn_marca_todas: TSpeedButton;
    ts_ref: TTabSheet;
    dbgrdRef: TDBGrid;
    dbgrdRefItens: TDBGrid;
    msk_dt_pagto: TMaskEdit;
    lbl_pagto: TLabel;
    dbedt_tp_destino: TDBEdit;
    lbl_tp_destino: TLabel;
    lbl_dt_pagto: TLabel;
    lbl_nr_docto: TLabel;
    dbedt_dt_pagto: TDBEdit;
    dbedt_cd_calculo: TDBEdit;
    lbl_processo2: TLabel;
    dbedt_nr_processo: TDBEdit;
    btn_canc_lanc: TSpeedButton;
    mi_montar: TMenuItem;
    lbl_desconto: TLabel;
    dbedt_vl_desc_proc: TDBEdit;
    lbl_perc_desconto: TLabel;
    dbedt_vl_perc_desc_proc: TDBEdit;
    lbl_vl_total: TLabel;
    dbedt_vl_total: TDBEdit;
    Label1: TLabel;
    dbedt_vl_desc_fav: TDBEdit;
    Label2: TLabel;
    dbedt_vl_perc_desc_fav: TDBEdit;
    Label3: TLabel;
    dbedt_vl_total2: TDBEdit;
    Label4: TLabel;
    dbedt_nr_lanc: TDBEdit;
    Label5: TLabel;
    dbedt_nr_lanc2: TDBEdit;
    lbl_banco: TLabel;
    btn_co_banco2: TSpeedButton;
    msk_cd_banco: TMaskEdit;
    edt_nm_banco: TEdit;
    mi_canc_lanc: TMenuItem;
    mi_desmarca: TMenuItem;
    mi_marca: TMenuItem;
    ts_datapagto: TTabSheet;
    Bevel1: TBevel;
    msk_dt_pagamento: TMaskEdit;
    Label6: TLabel;
    dbgrd_DataPagto: TDBGrid;
    lbl_dt_solic_fav: TLabel;
    dbedt_dt_solic_pagto_fav: TDBEdit;
    Label7: TLabel;
    dbedt_dt_solic_pagto_proc: TDBEdit;
    lbl_total: TLabel;
    lbl_tot_selecionado: TLabel;
    lbl_unid_neg_fav: TLabel;
    btn_co_unid_neg_fav: TSpeedButton;
    lbl_usuario: TLabel;
    btn_co_usuario: TSpeedButton;
    msk_cd_unid_neg_fav: TMaskEdit;
    edt_nm_unid_neg_fav: TEdit;
    msk_cd_usuario: TMaskEdit;
    edt_nm_usuario: TEdit;
    lbl_produto_fav: TLabel;
    btn_co_produto_fav: TSpeedButton;
    msk_cd_produto_fav: TMaskEdit;
    edt_nm_produto_fav: TEdit;
    dbtxt_vl_total: TDBText;
    lbl_vl_tot_selec: TLabel;
    Label8: TLabel;
    lbl_vl_tot_selec_proc: TLabel;
    Label9: TLabel;
    dbedt_vl_tot_selec_proc: TDBText;
    Label10: TLabel;
    msk_cd_unid_neg_data: TMaskEdit;
    edt_nm_unid_neg_data: TEdit;
    btn_co_unid_neg_data: TSpeedButton;
    Label11: TLabel;
    msk_cd_unid_neg_pagto: TMaskEdit;
    btn_co_unid_neg_pagto: TSpeedButton;
    edt_nm_unid_neg_pagto: TEdit;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    msk_nr_doc: TMaskEdit;
    Label12: TLabel;
    msk_nr_doc_proc: TMaskEdit;
    Label13: TLabel;
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure dbnvgBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure dbedt_cd_bancoExit(Sender: TObject);
    procedure dbedt_cd_favorecidoExit(Sender: TObject);
    procedure dbedt_cd_despachanteExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_unid_neg_procClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_itemClick(Sender: TObject);
    procedure btn_co_processo2Click(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure msk_cd_unid_neg_procExit(Sender: TObject);
    procedure Abre_Proc;
    procedure Abre_Fav;
    procedure Abre_Pagtos;
    procedure Abre_Data;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_bancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_itemExit(Sender: TObject);
    procedure dbedt_cd_itemChange(Sender: TObject);
    procedure msk_cd_unid_neg_procEnter(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure btn_co_calculoClick(Sender: TObject);
    procedure dbedt_cd_calculoExit(Sender: TObject);
    procedure msk_nr_processoEnter(Sender: TObject);
    procedure btnMontagemClick(Sender: TObject);
    procedure btn_co_favorecido2Click(Sender: TObject);
    procedure msk_cd_bancoExit(Sender: TObject);
    procedure msk_cd_bancoEnter(Sender: TObject);
    procedure msk_cd_favorecidoEnter(Sender: TObject);
    procedure msk_cd_favorecidoExit(Sender: TObject);
    procedure btn_co_favorecidoClick(Sender: TObject);
    procedure btn_marca_todasClick(Sender: TObject);
    procedure btn_desmarca_todasClick(Sender: TObject);
    procedure msk_dt_pagtoEnter(Sender: TObject);
    procedure msk_dt_pagtoExit(Sender: TObject);
    procedure dbedt_cd_item2Change(Sender: TObject);
    procedure pgctrl_monta_pagtoChange(Sender: TObject);
    procedure btn_canc_lancClick(Sender: TObject);
    procedure dbedt_vl_desc_procEnter(Sender: TObject);
    procedure dbedt_vl_perc_desc_procEnter(Sender: TObject);
    procedure dbedt_vl_desc_favEnter(Sender: TObject);
    procedure dbedt_vl_perc_desc_favEnter(Sender: TObject);
    procedure dbedt_vl_desc_procExit(Sender: TObject);
    procedure dbedt_vl_desc_favExit(Sender: TObject);
    procedure dbedt_vl_perc_desc_procExit(Sender: TObject);
    procedure dbedt_vl_perc_desc_favExit(Sender: TObject);
    procedure dbedt_vl_pagto_procEnter(Sender: TObject);
    procedure dbedt_vl_pagto_favEnter(Sender: TObject);
    procedure dbedt_vl_pagto_procExit(Sender: TObject);
    procedure dbedt_vl_pagto_favExit(Sender: TObject);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure dbedt_cd_banco2Exit(Sender: TObject);
    procedure btn_co_banco3Click(Sender: TObject);
    procedure btn_co_banco2Click(Sender: TObject);
    procedure msk_dt_pagamentoExit(Sender: TObject);
    procedure msk_dt_pagamentoEnter(Sender: TObject);
    procedure msk_cd_unid_neg_favEnter(Sender: TObject);
    procedure msk_cd_produto_favEnter(Sender: TObject);
    procedure msk_cd_usuarioEnter(Sender: TObject);
    procedure msk_cd_unid_neg_favExit(Sender: TObject);
    procedure btn_co_unid_neg_favClick(Sender: TObject);
    procedure msk_cd_produto_favExit(Sender: TObject);
    procedure msk_cd_usuarioExit(Sender: TObject);
    procedure btn_co_usuarioClick(Sender: TObject);
    procedure btn_co_produto_favClick(Sender: TObject);
    procedure dbgrdMontaFavCellClick(Column: TColumn);
    procedure dbgrdMontaFavKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdMontaFavKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdMontaPagtoCellClick(Column: TColumn);
    procedure dbgrdMontaPagtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdMontaPagtoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_unid_neg_dataEnter(Sender: TObject);
    procedure msk_cd_unid_neg_dataExit(Sender: TObject);
    procedure btn_co_unid_neg_dataClick(Sender: TObject);
    procedure msk_cd_unid_neg_pagtoEnter(Sender: TObject);
    procedure msk_cd_unid_neg_pagtoExit(Sender: TObject);
    procedure btn_co_unid_neg_pagtoClick(Sender: TObject);
    procedure dbgrdMontaFavDblClick(Sender: TObject);
    procedure dbgrdMontaPagtoDblClick(Sender: TObject);
    procedure dbgrdRefItensDblClick(Sender: TObject);
    procedure pgctrl_monta_pagtoChanging(Sender: TObject;
      var AllowChange: Boolean);
  private
    str_vl_pagto_proc, str_vl_desc_proc, str_vl_perc_desc_proc,
    str_vl_pagto_fav,  str_vl_desc_fav,  str_vl_perc_desc_fav : String;
    tot_item_sda : Byte;
    str_nr_proc_monta_pagto, str_nr_proc_sda : String[18];
    function Consiste : Boolean;
    function Grava    : Boolean;
    function VerAlt   : Boolean;
    procedure Cancelar;
    procedure TotSelecFav;
    procedure TotSelecProc;
    procedure Nr_DOC;
    procedure Nr_DOC_Fav;
  public
    vl_tot_selec, vl_tot_selec_proc : Double;
    lNaoConsiste, st_modificar, st_incluir, st_excluir : Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    dt_solic_ch : String[10];
    nr_proc : String[18];
    hm_para_solic_ch : String[5];
    cd_produto : String[2];
    cd_unid_neg_data, cd_unid_neg_proc, cd_unid_neg_fav, cd_unid_neg_pagto, cd_produto_fav : String[2];
    cd_favorecido : String[5];
    cd_usuario : String[4];
    dt_pagto : String;
    cd_banco : String[3];
    dt_pagamento : String;
  end;

var
  frm_monta_pagto : Tfrm_monta_pagto;
  CancelaOperacao, Cancelado, Marcando : Boolean;

implementation

uses GSMLIB,  PGGP001, PGGP017, PGSM010, PGSM016, PGSM018, PGSM041, PGSM059,
     PGSM090, PGGP015, PGPG004, PGSM136, PGGA004, PGGA012, ConsOnLineEx;

{$R *.DFM}

procedure Tfrm_monta_pagto.btn_sairClick(Sender: TObject);
begin
  btn_desmarca_todasClick(nil);
  Close;
end;

procedure Tfrm_monta_pagto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_monta_pagto do
    begin
      qry_status_solic_pagto_.Close;
      tbl_yesno_.Close;

      qry_param_.Close;
      qry_item_.Close;
      qry_processo_.Close;
      qry_unid_neg_.Close;
      qry_produto_.Close;
      qry_favorecido_.Close;
      qry_banco_.Close;
      qry_servico_.Close;
      qry_emp_nac_.Close;
      qry_grd_pagto_.Close;
      qry_solic_pagto_.Close;
      Free;
    end;
    Action := caFree;
  end
  else
    Action := caNone;
end;

procedure Tfrm_monta_pagto.FormCreate(Sender: TObject);
begin
  CancelaOperacao := False;
  Cancelado       := False;

  st_modificar    := False;
  st_incluir      := False;
  st_excluir      := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir );

  // Cria o DataModule de Dados de Solicitação de Cheque
  Application.CreateForm(Tdatm_monta_pagto, datm_monta_pagto );

  msk_dt_pagto.Text := DateToStr( dt_server );

  with datm_monta_pagto do
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

    qry_grd_pagto_.Close;
    qry_solic_pagto_.Close;
    Abre_Proc;
  end;

  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_monta_pagto.FormShow(Sender: TObject);
begin
  lNaoConsiste := False;
  pgctrl_monta_pagto.ActivePage := ts_datapagto;
  dt_pagamento := '';
  msk_cd_unid_neg_data.Text := str_cd_unid_neg;
  msk_cd_unid_neg_dataExit(nil);
  msk_cd_unid_neg_proc.Text := str_cd_unid_neg;
  msk_cd_unid_neg_procExit(nil);
  msk_cd_unid_neg_pagto.Text := str_cd_unid_neg;
  msk_cd_unid_neg_pagtoExit(nil);
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_produtoExit(nil);
  msk_dt_pagamento.Text := FormatDateTime( 'dd/mm/yyyy', dt_server );
  msk_dt_pagamentoExit(nil);
  msk_dt_pagamento.SetFocus;

  // Cancelar Cheque
{  with datm_monta_pagto do
  begin
    qry_param_.Close;
    qry_param_.Prepare;
    qry_param_.Open;
    if qry_param_IN_CANC_CH_OP.Value = '0' then
    begin
      btn_cancelar.Visible := False;
      mi_cancelar.Visible  := False;
    end;
    qry_param_.Close;
  end; }
end;

procedure Tfrm_monta_pagto.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
  btn_salvar.Enabled   := False;
  mi_salvar.Enabled    := False;
  btn_cancelar.Enabled := False;
  mi_cancelar.Enabled  := False;
  if Marcando then CancelaOperacao := True;
end;

procedure Tfrm_monta_pagto.Cancelar;
begin
  try
    if datm_monta_pagto.qry_solic_pagto_.State in [dsInsert, dsEdit] then
    begin
      datm_monta_pagto.qry_solic_pagto_.Cancel;
      msk_nr_processo.SetFocus;
    end;
    if datm_monta_pagto.qry_solic_fav_.State in [dsInsert, dsEdit] then
    begin
      datm_monta_pagto.qry_solic_fav_.Cancel;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
end;

procedure Tfrm_monta_pagto.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  pnl_cadastro.SetFocus;
  if Not Consiste then Exit;
  if Not Grava then Exit;
  btn_desmarca_todasClick(nil);
end;

function Tfrm_monta_pagto.Consiste : Boolean;
begin
  Consiste := True;

  if pgctrl_monta_pagto.ActivePage = ts_processo then
  begin
    if datm_monta_pagto.qry_solic_pagto_.State in [dsInsert, dsEdit] then // Por Processo
    begin
      // Item
      if Not lNaoConsiste then
      begin
        if dbedt_cd_item.Text = '' then
        begin
          BoxMensagem('Campo Item deve ser preenchido!', 2);
          dbedt_cd_item.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      if Not ( datm_monta_pagto.qry_solic_pagto_.State in [dsEdit, dsInsert] ) then Exit;
      ValidCodigo( dbedt_cd_item );
      if dbedt_cd_item.Text <> '' then
      begin
        if ( dbedt_nm_item.Text = '' ) then
        begin
          BoxMensagem( 'Código do Item inválido!', 2 );
          dbedt_cd_item.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      if Not lNaoConsiste then
      begin
        // Favorecido
        if dbedt_cd_favorecido.Text = '' then
        begin
          BoxMensagem( 'Campo Favorecido deve ser preenchido!', 2 );
          dbedt_cd_favorecido.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      if Not ( datm_monta_pagto.qry_solic_pagto_.State in [dsEdit, dsInsert] ) then Exit;
      ValidCodigo( dbedt_cd_favorecido );
      if dbedt_cd_favorecido.Text <> '' then
      begin
        if dbedt_nm_favorecido.Text = '' then
        begin
          BoxMensagem( 'Código do Favorecido inválido!', 2 );
          dbedt_cd_favorecido.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      if Not lNaoConsiste then
      begin
        // Banco
        if dbedt_cd_banco.Text = '' then
        begin
          BoxMensagem( 'Campo Banco deve ser preenchido!', 2 );
          dbedt_cd_banco.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      if Not ( datm_monta_pagto.qry_solic_pagto_.State in [dsEdit, dsInsert] ) then Exit;
      ValidCodigo( dbedt_cd_banco );
      if dbedt_cd_banco.Text <> '' then
      begin
        if dbedt_nm_banco.Text = '' then
        begin
          BoxMensagem( 'Código do Banco inválido!', 2 );
          dbedt_cd_banco.SetFocus;
          Consiste := False;
          Exit;
        end
        else
        begin
          Nr_DOC;
        end;
      end;
    end;
  end
  else if pgctrl_monta_pagto.ActivePage = ts_favorecido then
  begin
    if datm_monta_pagto.qry_solic_fav_.State in [dsInsert, dsEdit] then // Por Favorecido
    begin
      // Item
      if Not lNaoConsiste then
      begin
        if dbedt_cd_item2.Text = '' then
        begin
          BoxMensagem( 'Campo Item deve ser preenchido!', 2 );
          dbedt_cd_item2.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      if Not ( datm_monta_pagto.qry_solic_fav_.State in [dsEdit, dsInsert] ) then Exit;
      ValidCodigo( dbedt_cd_item2 );
      if dbedt_cd_item2.Text <> '' then
      begin
        if ( dbedt_nm_item2.Text = '' ) then
        begin
          BoxMensagem( 'Código do Item inválido!', 2 );
          dbedt_cd_item2.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end;
end;

function Tfrm_monta_pagto.Grava : Boolean;
var
  Falha : Boolean;
begin
  Falha := False;
  Grava := False;
  if datm_monta_pagto.qry_solic_pagto_.State in [dsInsert, dsEdit] then // Montagem por Processo
  begin
    try
      datm_main.db_broker.StartTransaction;
      with datm_monta_pagto do
      begin
        try
          StrToTime( Trim(hm_para_solic_ch) );
        except
          BoxMensagem('Erro ao converter a seguinte hora do parâmetro: ' +
                      Trim(hm_para_solic_ch) + #13#10 +
                      'Contate o CPD!', 2)
        end;

        if ( StrToTime( FormatDateTime( 'hh:mm', Now ) ) >
             StrToTime( Trim(hm_para_solic_ch) ) ) then
           qry_solic_pagto_CD_STATUS.AsString := '5';  // Solicitado fora do horário

        qry_solic_pagto_.Post;
        Abre_Proc;
      end;
      if Not Falha then
      begin
        datm_main.db_broker.Commit;
        Grava := True;
      end;
    except
      on E: Exception do
      begin
        datm_monta_pagto.qry_solic_pagto_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
    btn_mi( st_incluir, False, False, st_excluir );
  end;

  if datm_monta_pagto.qry_solic_fav_.State in [dsInsert, dsEdit] then // Montagem por Favorecido
  begin
    try
      datm_main.db_broker.StartTransaction;
      with datm_monta_pagto do
      begin
        try
          StrToTime( Trim(hm_para_solic_ch) );
        except
          BoxMensagem('Erro ao converter a seguinte hora do parâmetro: ' +
                      Trim(hm_para_solic_ch) + #13#10 +
                      'Contate o CPD!', 2)
        end;

        if ( StrToTime( FormatDateTime( 'hh:mm', Now ) ) >
             StrToTime( Trim(hm_para_solic_ch) ) ) then
           qry_solic_fav_CD_STATUS.AsString := '5';  // Solicitado fora do horário

        qry_solic_fav_.Post;
        Abre_Fav;
      end;
      if Not Falha then
      begin
        datm_main.db_broker.Commit;
        Grava := True;
      end;
    except
      on E: Exception do
      begin
        datm_monta_pagto.qry_solic_fav_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
    btn_mi( st_incluir, False, False, st_excluir );
  end;

end;

procedure Tfrm_monta_pagto.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled   := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled := Canc;
end;

procedure Tfrm_monta_pagto.dbnvgBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if datm_monta_pagto.qry_solic_pagto_.State in [dsInsert, dsEdit] then
     datm_monta_pagto.qry_solic_pagto_.Cancel;
end;

procedure Tfrm_monta_pagto.dbedt_cd_bancoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_monta_pagto.dbedt_cd_favorecidoExit(Sender: TObject);
begin
  with datm_monta_pagto do
  begin
    qry_favorecido_.Close;
    qry_favorecido_.SQL[2] := 'WHERE CD_FAVORECIDO <> ""';
    qry_favorecido_.Prepare;
    qry_favorecido_.Open;
  end;
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_monta_pagto.dbedt_cd_despachanteExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_monta_pagto.msk_cd_unid_neg_procExit(Sender: TObject);
begin
  if Trim( msk_cd_unid_neg_proc.Text ) = cd_unid_neg_proc then Exit;
  if Trim( msk_cd_unid_neg_proc.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_unid_neg_proc );
    with datm_monta_pagto do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_unid_neg_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg_proc.Text + '" AND ';
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if Not qry_unid_neg_.EOF then
      begin
        edt_nm_unid_neg_proc.Text := qry_unid_neg_NM_UNID_NEG.AsString;
        btn_desmarca_todasClick(nil);
        Abre_Proc;
      end
      else
      begin
        BoxMensagem('Unidade de Negócio não cadastrada ou não' + #13#10 +
                    'habilitada para este Usuário nesta Unidade/Produto', 2);
        edt_nm_unid_neg_proc.Text := '';
        msk_cd_unid_neg_proc.SetFocus;
        Exit;
      end;
    end
  end
  else
  begin
    edt_nm_unid_neg_proc.Text := '';
  end;
end;

procedure Tfrm_monta_pagto.msk_cd_produtoExit(Sender: TObject);
begin
  if Trim( msk_cd_produto.Text ) = cd_produto then Exit;
  if Trim( msk_cd_produto.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_produto );
    with datm_monta_pagto do
    begin
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg_proc.Text;
      qry_produto_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
      qry_produto_.SQL[2] := 'WHERE CD_PRODUTO = "' + msk_cd_produto.Text + '" AND';
      qry_produto_.Prepare;
      qry_produto_.Open;
      if Not qry_produto_.EOF then
      begin
        edt_nm_produto.Text := qry_produto_NM_PRODUTO.AsString;
        btn_desmarca_todasClick(nil);
        Abre_Proc;
      end
      else
      begin
        BoxMensagem('Produto não cadastrada ou não' + #13#10 +
                    'habilitado para este Usuário nesta Unidade/Produto', 2);
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

procedure Tfrm_monta_pagto.btn_co_unid_neg_procClick(Sender: TObject);
begin
  with datm_monta_pagto do
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
      msk_cd_unid_neg_proc.Text := frm_unidade.Cons_OnLine_Texto;
      msk_cd_unid_neg_procExit(nil);
    end;
  end;
end;

procedure Tfrm_monta_pagto.btn_co_produtoClick(Sender: TObject);
begin
  with datm_monta_pagto do
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

procedure Tfrm_monta_pagto.btn_co_itemClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2214';
  Application.CreateForm(Tfrm_item, frm_item);
  frm_item.Cons_OnLine := datm_monta_pagto.qry_solic_pagto_CD_ITEM;
  frm_item.lRecDesp := True;
  with frm_item do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_monta_pagto.qry_solic_pagto_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_monta_pagto.qry_solic_pagto_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_monta_pagto do
  begin
    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;
  end;
  vStr_cd_modulo := '26';
  str_cd_rotina := '2602';
  dbedt_cd_itemExit(nil);
end;

procedure Tfrm_monta_pagto.btn_co_processo2Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_consulta_processo,frm_consulta_processo);
  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg_proc.Text;
  frm_consulta_processo.str_cd_prod := msk_cd_produto.Text;
  frm_consulta_processo.ShowModal;

  Screen.Cursor := crHourGlass;

  if (frm_consulta_processo.Nr_Processo <> '') then
  begin
    msk_nr_processo.Text := Copy( frm_consulta_processo.Nr_Processo, 5, 14) ;
    msk_nr_processoExit(nil);
  end;
end;

procedure Tfrm_monta_pagto.msk_nr_processoExit(Sender: TObject);
begin
  if ( nr_proc = msk_nr_processo.Text ) then Exit;

  if VerAlt then
  begin
    if msk_nr_processo.Text <> '' then
    begin
      with datm_monta_pagto do
      begin
        qry_processo_.Close;
        qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg_proc.Text + msk_cd_produto.Text + msk_nr_processo.Text;
        qry_processo_.Prepare;
        qry_processo_.Open;
        if qry_processo_.RecordCount > 0 then
        begin
          edt_cd_cliente.Text  := qry_processo_CD_CLIENTE.AsString;
          edt_nm_cliente.Text  := qry_processo_LookCliente.AsString;
          edt_cd_servico.Text  := qry_processo_CD_SERVICO.AsString;
          edt_nm_servico.Text  := qry_processo_LookServico.AsString;
          // Procurar DI
          btn_desmarca_todasClick(nil);
          Abre_Proc;
        end
        else
        begin
          edt_cd_cliente.Text  := '';
          edt_cd_servico.Text  := '';
          msk_nr_processo.Text := '';
          BoxMensagem('Processo não cadastrado ou não liberado para esta Unidade/Produto!', 2);
          msk_nr_processo.SetFocus;
          Exit;
        end
      end;
    end;
  end;
end;

function Tfrm_monta_pagto.VerAlt;
begin
  VerAlt := True;
  if datm_monta_pagto.qry_solic_pagto_.State in [dsInsert, dsEdit] then
  begin
   if ( ( datm_monta_pagto.qry_solic_pagto_.State in [dsEdit] ) and st_modificar ) or
       ( datm_monta_pagto.qry_solic_pagto_.State in [dsInsert] ) then
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

procedure Tfrm_monta_pagto.Abre_Proc;
var nr_lancamento, cd_item : String[3];
begin
  with datm_monta_pagto do
  begin
    nr_lancamento := qry_solic_pagto_NR_LANCAMENTO.AsString;
    cd_item       := qry_solic_pagto_CD_ITEM.AsString;
    qry_grd_pagto_.Close;
    qry_grd_pagto_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg_proc.Text + msk_cd_produto.Text + msk_nr_processo.Text;
    qry_grd_pagto_.Prepare;
    qry_grd_pagto_.Open;
    qry_grd_pagto_.Locate('NR_LANCAMENTO;CD_ITEM', VarArrayOf ([nr_lancamento, cd_item]), [loCaseInsensitive]);

    qry_soma_proc_.Close;
    qry_soma_proc_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg_proc.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
    qry_soma_proc_.Prepare;
    qry_soma_proc_.Open;

    qry_solic_pagto_.Close;
    qry_solic_pagto_.Prepare;
    qry_solic_pagto_.Open;

    qry_favorecido_.Close;
    qry_favorecido_.SQL[2] := 'WHERE IN_ATIVO = "1" AND CD_FAVORECIDO <> ""';
    qry_favorecido_.Prepare;
    qry_favorecido_.Open;
    //Abre_Pagtos;
  end;
end;

procedure Tfrm_monta_pagto.Abre_Fav;
var nr_lancamento, cd_item : String[3];
begin
  if ( Trim( msk_cd_unid_neg_fav.Text ) = '' ) or
     ( Trim( msk_cd_produto_fav.Text ) = '' ) or
     ( Trim( msk_cd_favorecido.Text ) = '' ) then Exit;
  with datm_monta_pagto do
  begin
    nr_lancamento := qry_solic_fav_NR_LANCAMENTO.AsString;
    cd_item       := qry_solic_fav_CD_ITEM.AsString;
    qry_grd_fav_.Close;
    qry_grd_fav_.ParamByName('CD_UNID_NEG').AsString   := Trim( msk_cd_unid_neg_fav.Text );
    qry_grd_fav_.ParamByName('CD_PRODUTO').AsString    := Trim( msk_cd_produto_fav.Text );
    qry_grd_fav_.ParamByName('CD_USUARIO').AsString    := Trim( msk_cd_usuario.Text );
    qry_grd_fav_.ParamByName('CD_FAVORECIDO').AsString := Trim( msk_cd_favorecido.Text );
    qry_grd_fav_.Prepare;
    qry_grd_fav_.Open;
    qry_grd_fav_.Locate('NR_LANCAMENTO;CD_ITEM', VarArrayOf ([nr_lancamento, cd_item]), [loCaseInsensitive]);

    qry_soma_fav_.Close;
    qry_soma_fav_.ParamByName('CD_UNID_NEG').AsString   := Trim( msk_cd_unid_neg_fav.Text );
    qry_soma_fav_.ParamByName('CD_PRODUTO').AsString    := Trim( msk_cd_produto_fav.Text );
    qry_soma_fav_.ParamByName('CD_USUARIO').AsString    := Trim( msk_cd_usuario.Text );
    qry_soma_fav_.ParamByName('CD_FAVORECIDO').AsString := Trim( msk_cd_favorecido.Text );
    qry_soma_fav_.Prepare;
    qry_soma_fav_.Open;

    qry_solic_fav_.Close;
    qry_solic_fav_.Prepare;
    qry_solic_fav_.Open;
    //Abre_Pagtos;
  end;
end;

procedure Tfrm_monta_pagto.Abre_Pagtos;
var nr_ref : String[10];
    nr_lancamento, cd_item : String[3];
begin
  with datm_monta_pagto do
  begin
    if ( Trim( msk_dt_pagto.Text ) = '/  /' ) or ( Trim( msk_cd_unid_neg_pagto.Text ) = '' ) then
      Exit;

    nr_ref  := qry_ref_NR_REF.AsString;
    cd_item := qry_ref_itens_CD_ITEM.AsString;
    qry_ref_.Close;
    qry_ref_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg_pagto.Text );
    qry_ref_.ParamByName('DT_PAGTO').AsDate := StrToDate( msk_dt_pagto.Text );
    qry_ref_.Prepare;
    qry_ref_.Open;
    qry_ref_.Locate( 'NR_REF', nr_ref, [loCaseInsensitive] );
    qry_ref_itens_.Close;
    qry_ref_itens_.Prepare;
    qry_ref_itens_.Open;
    qry_ref_itens_.Locate('NR_LANCAMENTO;CD_ITEM', VarArrayOf ([nr_lancamento, cd_item]), [loCaseInsensitive]);
    qry_ref_itens_.Locate( 'CD_ITEM', cd_item, [loCaseInsensitive] );
    qry_solic_item_.Close;
    qry_solic_item_.Prepare;
    qry_solic_item_.Open;
    qry_solic_item_.Locate('NR_LANCAMENTO;CD_ITEM', VarArrayOf ([nr_lancamento, cd_item]), [loCaseInsensitive]);
  end;
end;

procedure Tfrm_monta_pagto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_monta_pagto.dbedt_cd_bancoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg_proc  then btn_co_unid_neg_procClick(nil);
    if Sender = msk_cd_unid_neg_fav   then btn_co_unid_neg_favClick(nil);
    if Sender = msk_cd_unid_neg_data  then btn_co_unid_neg_dataClick(nil);
    if Sender = msk_cd_unid_neg_pagto then btn_co_unid_neg_pagtoClick(nil);
    if Sender = msk_cd_produto        then btn_co_produtoClick(nil);
    if Sender = msk_cd_produto_fav    then btn_co_produto_favClick(nil);
    if Sender = msk_nr_processo       then btn_co_processo2Click(nil);
    if Sender = msk_cd_banco          then btn_co_banco2Click(nil);
    if Sender = msk_cd_favorecido     then btn_co_favorecidoClick(nil);
    if Sender = msk_cd_usuario        then btn_co_usuarioClick(nil);
    if Sender = dbedt_cd_item         then btn_co_itemClick(nil);
    if Sender = dbedt_cd_banco        then btn_co_bancoClick(nil);
    if Sender = dbedt_cd_calculo      then btn_co_calculoClick(nil);
    if Sender = dbedt_cd_favorecido   then btn_co_favorecido2Click(nil);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_cd_unid_neg_proc.Text := Copy( frm_pesq_proc.PesqNrProcesso, 1, 2 );
      msk_cd_unid_neg_procExit(nil);
      msk_cd_produto.Text       := Copy( frm_pesq_proc.PesqNrProcesso, 3, 2 );
      msk_cd_produtoExit(nil);
      msk_nr_processo.Text      := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;
end;

procedure Tfrm_monta_pagto.dbedt_cd_itemExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_monta_pagto.dbedt_cd_itemChange(Sender: TObject);
begin
  if datm_monta_pagto.qry_solic_pagto_.State in [ dsInsert, dsEdit ] then
  begin
    btn_salvar.Enabled   := True;
    mi_salvar.Enabled    := True;
    btn_cancelar.Enabled := True;
    mi_cancelar.Enabled  := True;
  end;
end;

procedure Tfrm_monta_pagto.msk_cd_unid_neg_procEnter(Sender: TObject);
begin
  cd_unid_neg_proc := msk_cd_unid_neg_proc.Text;
end;

procedure Tfrm_monta_pagto.msk_cd_produtoEnter(Sender: TObject);
begin
  cd_produto := msk_cd_produto.Text;
end;

procedure Tfrm_monta_pagto.btn_co_calculoClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TCALCULO',
                datm_monta_pagto.qry_solic_pagto_CD_CALCULO,
                'Tipo de Cálculo', 7, '','TTable');
end;

procedure Tfrm_monta_pagto.dbedt_cd_calculoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_monta_pagto.msk_nr_processoEnter(Sender: TObject);
begin
  nr_proc := msk_nr_processo.Text;
end;

procedure Tfrm_monta_pagto.btnMontagemClick(Sender: TObject);
var
  i : Integer;
  Erro: Boolean;
  cd_banco, nrRefAux: String[3];
  cd_favorecido: String[5];
  str_tp_destino : String;
  in_ted: String[1];
  vQryAux: TQuery;
begin
  ActiveControl := nil;
  with datm_monta_pagto do
  begin
    vQryAux := TQuery.Create(application);
    vQryAux.DataBaseName := 'DBBROKER';
    if pgctrl_monta_pagto.ActivePage = ts_processo then     // Processo
    begin

      try
        vQryAux.Close;
        vQryAux.SQL.Clear;
        vQryAux.SQL.Add('SELECT S.NR_PROCESSO, S.NR_LANCAMENTO, S.CD_ITEM FROM TSOLIC_PAGTO S (NOLOCK) WHERE S.IN_MONTAR = ''1'' AND S.CD_MONTADOR = ''' + str_cd_usuario + ''' ');
        vQryAux.Open;
        if vQryAux.IsEmpty then begin
          Application.MessageBox('Selecione um Pagamento para Montar!', 'Erro - Montagem', MB_OK + MB_ICONERROR);
          Exit;
        end else begin
          TotSelecProc;
          Erro := False;
          str_nr_proc_sda := '';
          str_nr_proc_monta_pagto := '';

          //verificações!
          while not vQryAux.Eof do begin
            qry_grd_pagto_.Locate('NR_PROCESSO;NR_LANCAMENTO;CD_ITEM;', VarArrayof([vQryAux.Fields[0].AsString,vQryAux.Fields[1].AsString,vQryAux.Fields[2].AsString]), [loCaseInsensitive, loPartialKey]);

            if qry_solic_pagto_CD_FAVORECIDO.AsString = '' then
            begin
              BoxMensagem( 'Item: ' + Trim( qry_solic_pagto_LookItem.AsString ) + #13#10 +
                           'Campo Favorecido deve ser informado', 2 );
              Erro := True;
              Break;
            end;

            if qry_solic_pagto_CD_BANCO.AsString = '' then
            begin
              BoxMensagem( 'Item: ' + Trim( qry_solic_pagto_LookItem.AsString ) + #13#10 +
                           'Campo Banco deve ser informado', 2 );
              Erro := True;
              Break;
            end;

            // S.D.A.
            if str_nr_proc_monta_pagto <> qry_solic_pagto_NR_PROCESSO.AsString then
              tot_item_sda := 0;
            if qry_solic_pagto_CD_ITEM.AsString = str_cd_item_sda then
            begin
              tot_item_sda := tot_item_sda + 1;
              if tot_item_sda > 1 then
                str_nr_proc_sda := qry_solic_pagto_NR_PROCESSO.AsString;
            end;
            vQryAux.Next;
            str_nr_proc_monta_pagto := qry_solic_pagto_NR_PROCESSO.AsString;
          end;

          if Trim( str_nr_proc_sda ) <> '' then
          begin
            BoxMensagem( 'Existe 2 ou mais solicitações de Pagto de S.D.A. para o processo ' +
                         Copy( str_nr_proc_sda, 5, 14 ) + '!', 2 );
            Erro := True;
          end;

          if Erro then
          begin
            btn_desmarca_todasClick(nil);
            Exit;
          end;

          // Verificar se existe mais de um Favorecido X Banco
          cd_banco      := '';
          cd_favorecido := '';

          vQryAux.First;
          while not vQryAux.Eof do begin
            qry_grd_pagto_.Locate('NR_PROCESSO;NR_LANCAMENTO;CD_ITEM;', VarArrayof([vQryAux.Fields[0].AsString,vQryAux.Fields[1].AsString,vQryAux.Fields[2].AsString]), [loCaseInsensitive, loPartialKey]);

            cd_banco      := qry_solic_pagto_CD_BANCO.AsString;
            cd_favorecido := qry_solic_pagto_CD_FAVORECIDO.AsString;

            if ( cd_banco      <> qry_solic_pagto_CD_BANCO.AsString ) or
               ( cd_favorecido <> qry_solic_pagto_CD_FAVORECIDO.AsString ) then
            begin
              BoxMensagem('Existe mais de um Banco X Favorecido!' + #13#10 +
                          'Não será possível gerar Pagamento', 2);
              btn_desmarca_todasClick(nil);
              Exit;
            end;
            vQryAux.Next;
          end;

          in_ted := '0';

          // Verificar se pagamento irá gerar TED
          if vl_tot_selec_proc >= vl_minimo_ted then begin
            if Not BoxMensagem( 'Valor maior ou igual a R$ ' + FormatFloat( '#0,.00', vl_minimo_ted ) + #13#10 +
                                'O sistema irá gerar Pagamento em TED. Confirma? ', 1 ) then
            begin
              if Not BoxMensagem( 'Deseja então gerar Cheque?' + #13#10 +
                                  'Atenção pois serão geradas tarifas sobre o valor!', 1 ) then
              begin
                btn_desmarca_todasClick(nil);
                Exit;
              end
              else
              begin
                in_ted := '0';
              end;
            end
            else
            begin
              in_ted := '1';
            end;
          end;

          Marcando             := True;
          btn_cancelar.Enabled := True;
          mi_cancelar.Enabled  := True;

          // gera nr. de lote
          try
            datm_main.db_broker.StartTransaction;
            tblLote.SQL.Clear;
            //soma um ao lote
            tblLote.SQL.Add('INSERT INTO TSOLIC_PAGTO(NR_PROCESSO, NR_LANCAMENTO, CD_ITEM, NR_REF, DT_PAGTO) VALUES(''0'', ''0'', ''0'', ''000'', CONVERT(DATETIME,CONVERT(VARCHAR,GETDATE(),103),103) ) ');
            tblLote.ExecSQL;
            tblLote.SQL.Clear;
            tblLote.SQL.Add(' SELECT RIGHT( ''000'' + CONVERT( varchar, CONVERT( int,  MAX( S.NR_REF )) + 1 ), 3 ) AS REF ' +
                            '   FROM TSOLIC_PAGTO S ' +
                            '  WHERE CONVERT( datetime, S.DT_PAGTO, 103) = CONVERT( datetime, CONVERT( char(10), GETDATE(), 103 ), 103) AND ' +
                            '        S.NR_REF NOT IN (''T'', ''D'', ''C'') ' );
            tblLote.Open;
            NrRefAux := tblLote.FieldByName('REF').AsString;
            tblLote.Close;
            tblLote.SQL.Add('DELETE FROM TSOLIC_PAGTO WHERE DT_PAGTO = CONVERT(DATETIME,CONVERT(VARCHAR,GETDATE(),103),103) AND NR_REF = ''000'' ');
            tblLote.ExecSQL;
            tblLote.Close;



            vQryAux.First;
            while not vQryAux.Eof do begin
              qry_grd_pagto_.Locate('NR_PROCESSO;NR_LANCAMENTO;CD_ITEM;', VarArrayof([vQryAux.Fields[0].AsString,vQryAux.Fields[1].AsString,vQryAux.Fields[2].AsString]), [loCaseInsensitive, loPartialKey]);

              if Not ( qry_solic_pagto_.State in [dsEdit, dsInsert] ) then
                 qry_solic_pagto_.Edit;

              qry_solic_pagto_IN_TED.AsString            := in_ted;
              qry_solic_pagto_CD_USUARIO_MONTA.AsString  := str_cd_usuario;
              if (( qry_solic_pagto_TP_DESTINO.AsString <> '3' ) or
                  (qry_solic_pagto_DT_PAGTO.IsNull)) and
                  (qry_solic_pagto_TP_DESTINO.AsString <> '5') then
                 qry_solic_pagto_DT_PAGTO.AsDateTime     := dt_server;
              if qry_solic_pagto_TP_DESTINO.AsString      = '0' then  // Terceiros
              begin
                qry_solic_pagto_CD_STATUS.AsString       := '7';      // Pago
                qry_solic_pagto_NR_REF.AsString          := 'T';
              end
              else if qry_solic_pagto_TP_DESTINO.AsString = '1' then  // Débito em Conta
              begin
                qry_solic_pagto_NR_REF.AsString          := 'D';
              end
              else if qry_solic_pagto_TP_DESTINO.AsString = '2' then  // Comissária
              begin
                qry_solic_pagto_NR_REF.AsString          := nrRefAux;
              end
              else if qry_solic_pagto_TP_DESTINO.AsString = '3' then  // Débito em Conta da Comissária
              begin
                qry_solic_pagto_NR_REF.AsString          := 'C';
              end
              else if qry_solic_pagto_TP_DESTINO.AsString = '4' then  // Contas a Pagar
              begin
                qry_solic_pagto_NR_REF.AsString          := NrRefAux;
              end
              else if qry_solic_pagto_TP_DESTINO.AsString = '5' then  // Borderô
              begin
                qry_solic_pagto_NR_REF.AsString          := 'D';
              end;
              qry_solic_pagto_.Post;

              str_tp_destino := qry_solic_pagto_TP_DESTINO.AsString;

              CloseStoredProc( sp_proc_itens_monta_pagto );
              sp_proc_itens_monta_pagto.ParamByName('@nr_processo').AsString   :=
                  msk_cd_unid_neg_proc.Text + msk_cd_produto.Text + msk_nr_processo.Text;
              sp_proc_itens_monta_pagto.ParamByName('@nr_lancamento').AsString :=
                  dbedt_nr_lanc.Text;
              sp_proc_itens_monta_pagto.ParamByName('@cd_item').AsString       :=
                  dbedt_cd_item.Text;
              sp_proc_itens_monta_pagto.ParamByName('@nr_doc').AsString       :=
                  msk_nr_doc_proc.Text;
              ExecStoredProc( sp_proc_itens_monta_pagto );
              CloseStoredProc( sp_proc_itens_monta_pagto );

              if CancelaOperacao then
              begin
                if BoxMensagem( 'Cancela a operação?', 1 ) then
                begin
                  Cancelado            := True;
                  CancelaOperacao      := False;
                  Marcando             := False;
                  btn_cancelar.Enabled := False;
                  mi_cancelar.Enabled  := False;
                  Close;
                  btn_desmarca_todasClick(nil);
                  Exit;
                end
                else CancelaOperacao   := False;
              end;
              vQryAux.Next;
            end;


            if str_tp_destino = '3' then
            begin
              // Grava na TBANCO nº do DOC gerado - 02/10/2006
              with TQuery.Create(Application) do
              begin
                DataBaseName := 'DBBROKER';
                Close;
                Sql.Clear;
                Sql.Add('UPDATE TBANCO ');
                Sql.Add('SET NR_DOC = ''' + msk_nr_doc_proc.Text + '''');
                Sql.Add('WHERE CD_BANCO = :CD_BANCO ');
                ParamByName('CD_BANCO').AsString := dbedt_cd_banco.Text;
                ExecSql;
                Free;
              end;
            end;

            datm_main.db_broker.Commit;
            FastExecSQL(' UPDATE TSOLIC_PAGTO SET IN_MONTAR = ''0'' WHERE CD_MONTADOR = ''' + str_cd_usuario + ''' AND IN_MONTAR = ''1'' ');

          except
            on e:exception do begin
            ShowMEssage(e.Message);
            if datm_main.db_broker.InTransaction then
              datm_main.db_broker.Rollback;
            Application.MessageBox('Erro na Montagem - Tente Novamente', 'Montagem de Pagamento', MB_OK + MB_ICONERROR);
            end;
          end;
          Marcando             := False;
          CancelaOperacao      := False;
          Cancelado            := False;
          btn_cancelar.Enabled := False;
          mi_cancelar.Enabled  := False;
          Abre_Proc;
          msk_nr_doc_proc.Text := '';
        end;
      finally
        vQryAux.Close;
        vQryAux.Free;
      end;
    end else  
    if pgctrl_monta_pagto.ActivePage = ts_favorecido then      // Favorecido
    begin
      if msk_cd_banco.Text = '' then
      begin
          BoxMensagem( 'Selecione um banco!', 2 );
        msk_cd_banco.SetFocus;
        Exit;
      end;

      try
        vQryAux.Close;
        vQryAux.SQL.Clear;
        vQryAux.SQL.Add('SELECT S.NR_PROCESSO, S.NR_LANCAMENTO, S.CD_ITEM FROM TSOLIC_PAGTO S (NOLOCK) WHERE S.IN_MONTAR = ''1'' AND S.CD_MONTADOR = ''' + str_cd_usuario + ''' ');
        vQryAux.Open;
        if vQryAux.IsEmpty then begin
          Application.MessageBox('Selecione um Pagamento para Montar!', 'Erro - Montagem', MB_OK + MB_ICONERROR);
          Exit;
        end else begin

          str_nr_proc_sda := '';
          str_nr_proc_monta_pagto := '';

          while not vQryAux.Eof do begin
            qry_grd_fav_.Locate('NR_PROCESSO;NR_LANCAMENTO;CD_ITEM;', VarArrayof([vQryAux.Fields[0].AsString,vQryAux.Fields[1].AsString,vQryAux.Fields[2].AsString]), [loCaseInsensitive, loPartialKey]);
            // S.D.A.
            if str_nr_proc_monta_pagto <> qry_solic_fav_NR_PROCESSO.AsString then
              tot_item_sda := 0;
            str_nr_proc_monta_pagto := qry_solic_fav_NR_PROCESSO.AsString;
            if qry_solic_fav_CD_ITEM.AsString = str_cd_item_sda then
            begin
              tot_item_sda := tot_item_sda + 1;
              if tot_item_sda > 1 then
                str_nr_proc_sda := qry_solic_fav_NR_PROCESSO.AsString;
            end;

            vQryAux.Next;
          end;

          if Trim( str_nr_proc_sda ) <> '' then
          begin
            BoxMensagem( 'Existem 2 ou mais solicitações de Pagto de S.D.A. para o processo ' +
                         Copy( str_nr_proc_sda, 5, 14 ) + '!', 2 );
            btn_desmarca_todasClick(nil);
            Exit;
          end;

          TotSelecFav;
          in_ted := '0';

          //  Verificar se pagamento irá gerar TED
          if vl_tot_selec >= vl_minimo_ted then
          begin
            if Not BoxMensagem( 'Valor maior ou igual a R$ ' + FormatFloat( '#0,.00', vl_minimo_ted ) + #13#10 +
                                'O sistema irá gerar Pagamento em TED. Confirma? ', 1 ) then
            begin
              if Not BoxMensagem( 'Deseja então gerar Cheque?' +  #13#10 +
                                  'Atenção pois serão geradas tarifas sobre o valor!', 1 ) then
              begin
                btn_desmarca_todasClick(nil);
                Exit;
              end
              else
              begin
                in_ted := '0';
              end;
            end
            else
            begin
              in_ted := '1';
            end;
          end;

          Marcando             := True;
          btn_cancelar.Enabled := True;
          mi_cancelar.Enabled  := True;

          // gera nr. de lote
          try
            datm_main.db_broker.StartTransaction;
            tblLote.SQL.Clear;
            //soma um ao lote
            tblLote.SQL.Add('INSERT INTO TSOLIC_PAGTO(NR_PROCESSO, NR_LANCAMENTO, CD_ITEM, NR_REF, DT_PAGTO) VALUES(''0'', ''0'', ''0'', ''000'', CONVERT(DATETIME,CONVERT(VARCHAR,GETDATE(),103),103) ) ');
            tblLote.ExecSQL;
            tblLote.SQL.Clear;
            tblLote.SQL.Add(' SELECT RIGHT( ''000'' + CONVERT( varchar, CONVERT( int,  MAX( S.NR_REF )) + 1 ), 3 ) AS REF ' +
                            '   FROM TSOLIC_PAGTO S ' +
                            '  WHERE CONVERT( datetime, S.DT_PAGTO, 103) = CONVERT( datetime, CONVERT( char(10), GETDATE(), 103 ), 103) AND ' +
                            '        S.NR_REF NOT IN (''T'', ''D'', ''C'') ' );
            tblLote.Open;
            NrRefAux := tblLote.FieldByName('REF').AsString;
            tblLote.Close;
            tblLote.SQL.Add('DELETE FROM TSOLIC_PAGTO WHERE DT_PAGTO = CONVERT(DATETIME,CONVERT(VARCHAR,GETDATE(),103),103) AND NR_REF = ''000'' ');
            tblLote.ExecSQL;
            tblLote.Close;

            vQryAux.First;
            while not vQryAux.Eof do begin
              qry_grd_fav_.Locate('NR_PROCESSO;NR_LANCAMENTO;CD_ITEM;', VarArrayof([vQryAux.Fields[0].AsString,vQryAux.Fields[1].AsString,vQryAux.Fields[2].AsString]), [loCaseInsensitive, loPartialKey]);

              if Not ( qry_solic_fav_.State in [dsEdit, dsInsert] ) then
                 qry_solic_fav_.Edit;
              qry_solic_fav_IN_TED.AsString            := in_ted;
              qry_solic_fav_CD_BANCO.AsString          := msk_cd_banco.Text;
              qry_solic_fav_CD_USUARIO_MONTA.AsString  := str_cd_usuario;
              if (( qry_solic_fav_TP_DESTINO.AsString <> '3' ) or
                 (qry_solic_fav_DT_PAGTO.IsNull)) and (qry_solic_fav_TP_DESTINO.AsString <> '5') then
                 qry_solic_fav_DT_PAGTO.AsDateTime     := dt_server;
              if qry_solic_fav_TP_DESTINO.AsString = '0' then  // Terceiros
              begin
                qry_solic_fav_NR_REF.AsString          := 'T';
              end
              else if qry_solic_fav_TP_DESTINO.AsString = '1' then // Débito em Conta
              begin
                qry_solic_fav_NR_REF.AsString          := 'D';
              end
              else if qry_solic_fav_TP_DESTINO.AsString = '2' then     // Comissária
              begin
                qry_solic_fav_NR_REF.AsString          := nrRefAux;
              end
              else if qry_solic_fav_TP_DESTINO.AsString = '3' then // Débito em Conta da Comissária
              begin
                qry_solic_fav_NR_REF.AsString          := 'C';
              end
              else if qry_solic_fav_TP_DESTINO.AsString = '4' then // Contas a Pagar
              begin
                qry_solic_fav_NR_REF.AsString          := nrRefAux;
              end
              else if qry_solic_fav_TP_DESTINO.AsString = '5' then // Borderô
              begin
                qry_solic_fav_NR_REF.AsString          := 'D';
              end;
              qry_solic_fav_.Post;

              str_tp_destino := qry_solic_fav_TP_DESTINO.AsString;

              CloseStoredProc( sp_proc_itens_monta_pagto );
              sp_proc_itens_monta_pagto.ParamByName('@nr_processo').AsString   :=
                  msk_cd_unid_neg_fav.Text + msk_cd_produto_fav.Text + dbedt_nr_processo.Text;
              sp_proc_itens_monta_pagto.ParamByName('@nr_lancamento').AsString :=
                  dbedt_nr_lanc2.Text;
              sp_proc_itens_monta_pagto.ParamByName('@cd_item').AsString       :=
                  dbedt_cd_item2.Text;
              sp_proc_itens_monta_pagto.ParamByName('@nr_doc').AsString       :=
                  msk_nr_doc.Text;
              ExecStoredProc( sp_proc_itens_monta_pagto );
              CloseStoredProc( sp_proc_itens_monta_pagto );

              if CancelaOperacao then
              begin
                if BoxMensagem( 'Cancela a operação?', 1 ) then
                begin
                  Cancelado            := True;
                  CancelaOperacao      := False;
                  Marcando             := False;
                  btn_cancelar.Enabled := False;
                  mi_cancelar.Enabled  := False;
                  btn_desmarca_todasClick(nil);
                  Close;
                  Exit;
                end
                else CancelaOperacao   := False;
              end;

              vQryAux.Next;

            end;

            if str_tp_destino = '3' then
            begin
              // Grava na TBANCO nº do DOC gerado - 02/10/2006
              with TQuery.Create(Application) do
              begin
                DataBaseName := 'DBBROKER';
                Close;
                Sql.Clear;
                Sql.Add('UPDATE TBANCO ');
                Sql.Add('SET NR_DOC = ''' + msk_nr_doc.Text + '''');
                Sql.Add('WHERE CD_BANCO = :CD_BANCO ');
                ParamByName('CD_BANCO').AsString := msk_cd_banco.Text;
                ExecSql;
                Free;
              end;
            end;

            Nr_DOC_Fav;

            datm_main.db_broker.Commit;
            FastExecSQL(' UPDATE TSOLIC_PAGTO SET IN_MONTAR = ''0'' WHERE CD_MONTADOR = ''' + str_cd_usuario + ''' AND IN_MONTAR = ''1'' ');
          except
            on e:exception do
            begin
              ShowMEssage(e.Message);
              if datm_main.db_broker.InTransaction then
                datm_main.db_broker.Rollback;
              Application.MessageBox('Erro na Montagem - Tente Novamente', 'Montagem de Pagamento', MB_OK + MB_ICONERROR);
            end;

          end;
          Marcando             := False;
          CancelaOperacao      := False;
          Cancelado            := False;
          btn_cancelar.Enabled := False;
          mi_cancelar.Enabled  := False;
          Abre_Fav;
        end;
      finally
        vQryAux.Close;
        vQryAux.Free;
      end;
    end;
  end;
end;

procedure Tfrm_monta_pagto.btn_co_favorecido2Click(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2208';
  Application.CreateForm(Tfrm_Favor, frm_Favor);
  frm_Favor.Cons_OnLine := datm_monta_pagto.qry_solic_pagto_CD_FAVORECIDO;
  with frm_Favor do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_monta_pagto.qry_solic_pagto_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_monta_pagto.qry_solic_pagto_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_monta_pagto do
  begin
    qry_favorecido_.Close;
    qry_favorecido_.Prepare;
    qry_favorecido_.Open;
  end;
  vStr_cd_modulo := '26';
  str_cd_rotina := '2602';
  dbedt_cd_favorecidoExit(nil);
end;

procedure Tfrm_monta_pagto.msk_cd_bancoExit(Sender: TObject);
begin
  if Trim( msk_cd_banco.Text ) = cd_banco then Exit;
  if VerAlt then
  begin
    if Trim( msk_cd_banco.Text ) <> '' then
    begin
      ValCodEdt( msk_cd_banco );
      with datm_monta_pagto do
      begin
        if qry_banco_.Locate('CD_BANCO', msk_cd_banco.Text, [loCaseInsensitive]) then
        begin
          edt_nm_banco.Text := qry_banco_NM_BANCO.AsString;
          Nr_DOC_Fav;
        end
        else
        begin
          BoxMensagem('Banco não cadastrado!', 2);
          edt_nm_banco.Text := '';
          msk_cd_banco.SetFocus;
          Exit;
        end;
      end
    end
    else
    begin
      edt_nm_banco.Text := '';
    end;
  end;
end;

procedure Tfrm_monta_pagto.msk_cd_bancoEnter(Sender: TObject);
begin
  cd_banco := msk_cd_banco.Text;
end;

procedure Tfrm_monta_pagto.msk_cd_favorecidoEnter(Sender: TObject);
begin
  cd_favorecido := msk_cd_favorecido.Text;
end;

procedure Tfrm_monta_pagto.msk_cd_favorecidoExit(Sender: TObject);
begin
  if Trim( msk_cd_favorecido.Text ) = cd_favorecido then Exit;
  if Trim( msk_cd_favorecido.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_favorecido );
    with datm_monta_pagto do
    begin
      qry_favorecido_.Close;
      qry_favorecido_.SQL[2] := 'WHERE CD_FAVORECIDO = "' + msk_cd_favorecido.Text + '"';
      qry_favorecido_.Prepare;
      qry_favorecido_.Open;
      if qry_favorecido_.RecordCount > 0 then
      begin
        edt_nm_favorecido.Text := qry_favorecido_NM_FAVORECIDO.AsString;
        if ( Trim( msk_cd_favorecido.Text ) <>  '' ) then
        begin
          btn_desmarca_todasClick(nil);
          Abre_Fav;
        end;
      end
      else
      begin
        BoxMensagem('Favorecido não cadastrado!', 2);
        edt_nm_favorecido.Text := '';
        msk_cd_favorecido.SetFocus;
        qry_favorecido_.Close;
        qry_favorecido_.SQL[2] := 'WHERE CD_FAVORECIDO <> ""';
        qry_favorecido_.Prepare;
        qry_favorecido_.Open;
        Exit;
      end;
    end
  end
  else
  begin
    edt_nm_favorecido.Text := '';
  end;
end;

procedure Tfrm_monta_pagto.btn_co_favorecidoClick(Sender: TObject);
begin
  with datm_monta_pagto do
  begin
    Application.CreateForm(Tfrm_Favor, frm_Favor );
    with frm_Favor do
    begin
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

procedure Tfrm_monta_pagto.btn_marca_todasClick(Sender: TObject);
var i : Integer;
    nr_lancamento, cd_item : String[3];
begin
  with datm_monta_pagto do
  begin
    vl_tot_selec := 0;
    vl_tot_selec_proc := 0;
    btn_marca_todas.Visible    := False;
    btn_desmarca_todas.Visible := True;
    mi_desmarca.Visible        := True;
    mi_marca.Visible           := False;
    btn_desmarca_todas.Left    := btn_marca_todas.Left;
    if pgctrl_monta_pagto.ActivePage = ts_processo then
    begin
      FastExecSQL(' UPDATE S SET IN_MONTAR = ''1'', CD_MONTADOR = ''' + str_cd_usuario + ''' ' +
                  '   FROM   TSOLIC_PAGTO S (NOLOCK) ' +
                  '   LEFT JOIN TNUMERARIO_NOTIFICA_ITEM N (NOLOCK) ON ( S.NR_PROCESSO = N.NR_PROCESSO AND S.CD_ITEM = N.CD_ITEM ) ' +
                  '  WHERE S.CD_STATUS NOT IN ( ''4'', ''7'', ''17'', ''18'' ) AND ' +
                  '        S.NR_PROCESSO = ''' + Trim(msk_cd_unid_neg_proc.Text) + Trim(msk_cd_produto.Text) + Trim(msk_nr_processo.Text) + ''' AND ' +
                  '        S.IN_SOLICITADO = ''1'' AND ( S.NR_REF = '''' OR S.NR_REF IS NULL ) AND ' +
                  '        ISNULL( S.NR_REF, '''' ) NOT IN (''D'', ''C'', ''T'')' );
       TotSelecFav;
       Abre_Proc;
    end else
    if pgctrl_monta_pagto.ActivePage = ts_favorecido then
    begin
      FastExecSQL(' UPDATE S SET IN_MONTAR = ''1'', CD_MONTADOR = ''' + str_cd_usuario + ''' ' +
                  '   FROM   TSOLIC_PAGTO S (NOLOCK), TNUMERARIO_SALDO_POR_ITEM N (NOLOCK), TPROCESSO P (NOLOCK) ' +
                  '  WHERE S.NR_PROCESSO *= N.NR_PROCESSO AND ' +
                  '        S.CD_ITEM *= N.CD_ITEM AND ' +
                  '        S.NR_PROCESSO = P.NR_PROCESSO AND ' +
                  '        S.CD_STATUS NOT IN ( ''4'', ''7'', ''17'', ''18'' ) AND ' +
                  '        S.CD_FAVORECIDO = ''' + Trim(msk_cd_favorecido.Text) + ''' AND ' +
                  '        P.CD_UNID_NEG = ''' + Trim(msk_cd_unid_neg_fav.Text) + ''' AND ' +
                  '        P.CD_PRODUTO = ''' + Trim(msk_cd_produto_fav.Text) + ''' AND ' +
                  '        ( ( S.CD_USUARIO_SOLIC = ''' + Trim(msk_cd_usuario.Text) + ''' ) OR ( ''' + Trim(msk_cd_usuario.Text) + ''' = '''' ) ) AND ' +
                  '        S.IN_SOLICITADO = ''1'' AND ( S.NR_REF = '''' OR S.NR_REF IS NULL ) ');

       TotSelecFav;
       Abre_Fav;
    end else
    if pgctrl_monta_pagto.ActivePage = ts_ref then
    begin
      FastExecSQL(' UPDATE S SET IN_MONTAR = ''1'', CD_MONTADOR = ''' + str_cd_usuario + ''' ' +
                  '   FROM TSOLIC_PAGTO S (NOLOCK), TPROCESSO P (NOLOCK) ' +
                  '  WHERE S.NR_PROCESSO = P.NR_PROCESSO AND ' +
                  '       P.CD_UNID_NEG = ''' + Trim(qry_ref_CD_UNID_NEG.AsString) + ''' AND ' +
                  '       DT_PAGTO = CONVERT(DATETIME, ''' + Trim(qry_ref_DT_PAGTO.AsString) + ''', 103) AND ' +
                  '       NR_REF = ''' + Trim(qry_ref_NR_REF.AsString) + ''' AND ' +
                  '       CD_BANCO = ''' + Trim(qry_ref_CD_BANCO.AsString) + ''' AND ' +
                  '       CD_FAVORECIDO = ''' + Trim(qry_ref_CD_FAVORECIDO.AsString) + ''' AND ' +
                //  '       NR_DOCTO = ''' + Trim(qry_ref_NR_DOCTO.AsString)  + ''' AND ' +
                  '       ISNULL( NR_REF, '''' ) <> '''' AND ' +
                  '       ISNULL( CD_FAVORECIDO, '''' ) <> '''' ');
      nr_lancamento  := datm_monta_pagto.qry_ref_itens_NR_LANCAMENTO.AsString;
      cd_item := datm_monta_pagto.qry_ref_itens_CD_ITEM.AsString;
      datm_monta_pagto.qry_ref_itens_.Close;
      datm_monta_pagto.qry_ref_itens_.Open;
      qry_ref_itens_.Locate('NR_LANCAMENTO;CD_ITEM', VarArrayOf ([nr_lancamento, cd_item]), [loCaseInsensitive]);
    end;
  end;
end;

procedure Tfrm_monta_pagto.btn_desmarca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Visible    := True;
  btn_desmarca_todas.Visible := False;
  mi_marca.Visible           := True;
  mi_desmarca.Visible        := False;

  FastExecSQL(' UPDATE TSOLIC_PAGTO SET IN_MONTAR = ''0'' , CD_MONTADOR = Null ' +
              ' WHERE CD_MONTADOR = ''' + str_cd_usuario + ''' AND IN_MONTAR = ''1'' ');

  vl_tot_selec_proc := 0;
  lbl_vl_tot_selec_proc.Caption := FormatFloat( '#0,.00', vl_tot_selec_proc );
  vl_tot_selec := 0;
  lbl_vl_tot_selec.Caption := FormatFloat( '#0,.00', vl_tot_selec );

  if Sender = btn_desmarca_todas then begin
    if (pgctrl_monta_pagto.ActivePage = ts_Processo)   then  Abre_Proc;
    if (pgctrl_monta_pagto.ActivePage = ts_Favorecido) then  Abre_Fav;
    if (pgctrl_monta_pagto.ActivePage = ts_ref)        then begin
      datm_monta_pagto.qry_ref_itens_.Close;
      datm_monta_pagto.qry_ref_itens_.Open;
    end;
  end;
end;

procedure Tfrm_monta_pagto.msk_dt_pagtoEnter(Sender: TObject);
begin
  dt_pagamento := msk_dt_pagto.Text;
end;

procedure Tfrm_monta_pagto.msk_dt_pagtoExit(Sender: TObject);
begin
  if msk_dt_pagto.Text = dt_pagamento then Exit;
  Abre_Pagtos;
end;

procedure Tfrm_monta_pagto.dbedt_cd_item2Change(Sender: TObject);
begin
  if datm_monta_pagto.qry_solic_fav_.State in [ dsInsert, dsEdit ] then
  begin
    btn_salvar.Enabled   := True;
    mi_salvar.Enabled    := True;
    btn_cancelar.Enabled := True;
    mi_cancelar.Enabled  := True;
  end;
end;

procedure Tfrm_monta_pagto.pgctrl_monta_pagtoChange(Sender: TObject);
begin
  //visualização dos botões
  btnMontagem.Enabled := ((pgctrl_monta_pagto.ActivePage = ts_Processo) or (pgctrl_monta_pagto.ActivePage = ts_favorecido));
  mi_montar.Enabled := btnMontagem.Enabled;
  btn_canc_lanc.Enabled := (pgctrl_monta_pagto.ActivePage = ts_ref) and st_excluir;
  mi_canc_lanc.Enabled  := btn_canc_lanc.Enabled;




  if pgctrl_monta_pagto.ActivePage = ts_datapagto then
  begin
    dt_pagto := '';
    msk_dt_pagtoExit(nil);
  end;

  if pgctrl_monta_pagto.ActivePage = ts_processo then
  begin
    btn_canc_lanc.Enabled := False;
    mi_canc_lanc.Enabled  := False;
    vl_tot_selec_proc     := 0;
    lbl_vl_tot_selec_proc.Caption := '0,00';
    with datm_monta_pagto do
    begin
      qry_favorecido_.Close;
      qry_favorecido_.SQL[2] := 'WHERE IN_ATIVO = "1" AND CD_FAVORECIDO <> ""';
      qry_favorecido_.Prepare;
      qry_favorecido_.Open;
    end;
    Abre_Proc;
  end else
  if pgctrl_monta_pagto.ActivePage = ts_favorecido then
  begin
    btn_canc_lanc.Enabled := False;
    mi_canc_lanc.Enabled  := False;
    vl_tot_selec          := 0;
    lbl_vl_tot_selec.Caption := '0,00';
    if Trim( msk_cd_unid_neg_fav.Text ) = '' then
       msk_cd_unid_neg_fav.Text := str_cd_unid_neg;
    msk_cd_unid_neg_favExit(nil);
    if Trim( msk_cd_produto_fav.Text ) = '' then
       msk_cd_produto_fav.Text := str_cd_produto;
    msk_cd_produto_favExit(nil);
    msk_cd_usuario.Text := str_cd_usuario;
    msk_cd_usuarioExit(nil);
    msk_cd_favorecido.SetFocus;

    Nr_DOC_Fav;
    Abre_Fav;
  end else
  if pgctrl_monta_pagto.ActivePage = ts_ref then
    Abre_Pagtos;


end;

procedure Tfrm_monta_pagto.btn_canc_lancClick(Sender: TObject);
var i : Integer;
    dt_movimento : TDateTime;
    vQryAux: TQuery;
    //vCancelaLote: Boolean;
begin
  with datm_monta_pagto do
  begin
    // Verifica se o movimento está fechado antes de cancelar - 09/2006
    with TQuery.Create(Application)do
    begin
      DataBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT MAX(DT_MOVIMENTO) + 1 DT_MOVIMENTO ');
      Sql.Add('FROM TCAIXA_CONTROLE (NOLOCK) ');
      Open;
      dt_movimento := Fields[0].AsDateTime;
      Free;
    end;
    if StrToDate( msk_dt_pagto.Text ) < dt_movimento then
    begin
      BoxMensagem('Movimento Financeiro fechado!', 2);
      Exit;
    end;

    //verifica se todos os itens do lote estão selecionados e a partir daí cancela por item ou por lote
   { vCancelaLote := true;
    qry_ref_itens_.First;
    while not qry_ref_itens_.Eof do begin
      if (qry_ref_itens_IN_MONTAR.IsNull) or (qry_ref_itens_IN_MONTAR.AsString = '0') then begin
        vCancelaLote := False;
        Break;
      end;
      qry_ref_itens_.Next;
    end;
    //se só tem 1 item o cancelamento é sempre por item
    vCancelaLote := (qry_ref_itens_.RecordCount > 1); 

    if vCancelaLote then begin
      //cancelando o lote todo!
      if qry_ref_CD_STATUS_CHEQUE.AsString <> '' then
      begin
        if StrToInt( qry_ref_CD_STATUS_CHEQUE.AsString ) in [1, 2] then
        begin
          BoxMensagem( 'Lote não pode ser cancelado! Cheque emitido!', 3 );
          Exit;
        end;
      end;

      if Trim( qry_ref_NR_REF.AsString ) = 'C' then
      begin
        BoxMensagem( 'Atenção! Não é permitido cancelar o lote. Favor cancelar por item!', 3 );
      end
      else
      begin
        if BoxMensagem( 'Confirma cancelamento da Ref. nº ' + qry_ref_NR_REF.AsString + '?', 1) then
        begin
          try
            datm_main.db_broker.StartTransaction;

            CloseStoredProc(sp_cancela_solic_pagto);
            sp_cancela_solic_pagto.ParamByName('@dt_pagto').AsDateTime := qry_ref_DT_PAGTO.AsDateTime;
            sp_cancela_solic_pagto.ParamByName('@nr_ref').AsString     := qry_ref_NR_REF.AsString;
            ExecStoredProc(sp_cancela_solic_pagto);
            CloseStoredProc(sp_cancela_solic_pagto);

            datm_main.db_broker.Commit;
          except
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          end;
        end;
        //limpa selecionados
        FastExecSQL(' UPDATE TSOLIC_PAGTO SET IN_MONTAR = ''0'' WHERE CD_MONTADOR = ''' + str_cd_usuario + ''' AND IN_MONTAR = ''1'' ');
      end;

    end else begin  }
    try
      vQryAux := TQuery.Create(application);
      vQryAux.DataBaseName := 'DBBROKER';
      vQryAux.Close;
      vQryAux.SQL.Clear;
      vQryAux.SQL.Add('SELECT S.NR_PROCESSO, S.NR_LANCAMENTO, S.CD_ITEM FROM TSOLIC_PAGTO S (NOLOCK) WHERE S.IN_MONTAR = ''1'' AND S.CD_MONTADOR = ''' + str_cd_usuario + ''' ');
      vQryAux.Open;
      if vQryAux.IsEmpty then begin
        Application.MessageBox('Selecione um Pagamento para cancelar!', 'Erro - Cancelamento', MB_OK + MB_ICONERROR);
        Exit;
      end else begin
        if Application.MessageBox('Deseja realmente cancelar este(s) item(ns) selecionado(s)?', 'Confirmação de Cancelamento', MB_YESNO + MB_ICONQUESTION) = mrYes then begin
          while not vQryAux.Eof do begin

            qry_ref_itens_.Locate('NR_PROCESSO;NR_LANCAMENTO;CD_ITEM;', VarArrayof([vQryAux.Fields[0].AsString,vQryAux.Fields[1].AsString,vQryAux.Fields[2].AsString]), [loCaseInsensitive, loPartialKey]);

            if ( qry_solic_item_CD_STATUS.AsString = '7' ) and ( qry_ref_itens_NR_REF.AsString <> 'C' ) then begin
              BoxMensagem('Item pago!', 2);
              Exit;
            end;
            if ( qry_solic_item_CD_STATUS.AsString = '4' ) or ( qry_solic_item_CD_STATUS.AsString = '17' ) then begin
              BoxMensagem('Item cancelado!', 2);
              Exit;
            end;

            try
              datm_main.db_broker.StartTransaction;

              // Nova sp de cancelamento
              CloseStoredProc(sp_cancela_item_solic_pagamento);
              sp_cancela_item_solic_pagamento.ParamByName('@nr_processo').AsString   := qry_solic_item_NR_PROCESSO.AsString;
              sp_cancela_item_solic_pagamento.ParamByName('@nr_lancamento').AsString := qry_solic_item_NR_LANCAMENTO.AsString;
              sp_cancela_item_solic_pagamento.ParamByName('@cd_item').AsString       := qry_solic_item_CD_ITEM.AsString;
              ExecStoredProc(sp_cancela_item_solic_pagamento);
              CloseStoredProc(sp_cancela_item_solic_pagamento);

              (* Antiga sp de cancelamento
              CloseStoredProc(sp_cancela_item_solic_pagto);
              sp_cancela_item_solic_pagto.ParamByName('@nr_processo').AsString   := qry_solic_item_NR_PROCESSO.AsString;
              sp_cancela_item_solic_pagto.ParamByName('@nr_lancamento').AsString := qry_solic_item_NR_LANCAMENTO.AsString;
              sp_cancela_item_solic_pagto.ParamByName('@cd_item').AsString       := qry_solic_item_CD_ITEM.AsString;
              ExecStoredProc(sp_cancela_item_solic_pagto);
              CloseStoredProc(sp_cancela_item_solic_pagto);
              *)
              datm_main.db_broker.Commit;

            except
              if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
              qry_solic_item_.Cancel;
            end;

            vQryAux.Next;
          end;
          //limpa selecionados!
          FastExecSQL(' UPDATE TSOLIC_PAGTO SET IN_MONTAR = ''0'' WHERE CD_MONTADOR = ''' + str_cd_usuario + ''' AND IN_MONTAR = ''1'' ');
        end;
      end;
    finally
      vQryAux.Close;
      vQryAux.Free;
    end;
    //end;

    Abre_Pagtos;

  end;
end;

procedure Tfrm_monta_pagto.dbedt_vl_desc_procEnter(Sender: TObject);
begin
  str_vl_desc_proc := dbedt_vl_desc_proc.Text;
end;

procedure Tfrm_monta_pagto.dbedt_vl_perc_desc_procEnter(Sender: TObject);
begin
  str_vl_perc_desc_proc := dbedt_vl_perc_desc_proc.Text;
end;

procedure Tfrm_monta_pagto.dbedt_vl_desc_favEnter(Sender: TObject);
begin
  str_vl_desc_fav := dbedt_vl_desc_fav.Text;
end;

procedure Tfrm_monta_pagto.dbedt_vl_perc_desc_favEnter(Sender: TObject);
begin
  str_vl_perc_desc_fav := dbedt_vl_perc_desc_fav.Text;
end;

procedure Tfrm_monta_pagto.dbedt_vl_desc_procExit(Sender: TObject);
begin
  with datm_monta_pagto do
  begin
    if str_vl_desc_proc <> dbedt_vl_desc_proc.Text then
    begin
      if Not ( qry_solic_pagto_.State in [dsInsert, dsEdit] ) then
         qry_solic_pagto_.Edit;
      qry_solic_pagto_VL_PERC_DESCONTO.AsFloat := 0;
    end;
  end;
end;

procedure Tfrm_monta_pagto.dbedt_vl_desc_favExit(Sender: TObject);
begin
  with datm_monta_pagto do
  begin
    if str_vl_desc_fav <> dbedt_vl_desc_fav.Text then
    begin
      if Not ( qry_solic_fav_.State in [dsInsert, dsEdit] ) then
         qry_solic_fav_.Edit;
      qry_solic_fav_VL_PERC_DESCONTO.AsFloat := 0;
    end;
  end;
end;

procedure Tfrm_monta_pagto.dbedt_vl_perc_desc_procExit(Sender: TObject);
begin
  with datm_monta_pagto do
  begin
    if ( str_vl_perc_desc_proc <> dbedt_vl_perc_desc_proc.Text ) and
       ( qry_solic_pagto_VL_PERC_DESCONTO.AsFloat > 0 ) then
    begin
      if Not ( qry_solic_pagto_.State in [dsInsert, dsEdit] ) then
         qry_solic_pagto_.Edit;
      qry_solic_pagto_VL_DESCONTO.AsFloat :=
         Arredondar( ( ( qry_solic_pagto_VL_PAGTO.AsFloat * qry_solic_pagto_VL_PERC_DESCONTO.AsFloat  ) / 100 ), 2 );
    end;
  end;
end;

procedure Tfrm_monta_pagto.dbedt_vl_perc_desc_favExit(Sender: TObject);
begin
  with datm_monta_pagto do
  begin
    if ( str_vl_perc_desc_fav <> dbedt_vl_perc_desc_fav.Text ) and
       ( qry_solic_fav_VL_PERC_DESCONTO.AsFloat > 0 ) then
    begin
      if Not ( qry_solic_fav_.State in [dsInsert, dsEdit] ) then
         qry_solic_fav_.Edit;
      qry_solic_fav_VL_DESCONTO.AsFloat :=
         Arredondar( ( ( qry_solic_fav_VL_PAGTO.AsFloat * qry_solic_fav_VL_PERC_DESCONTO.AsFloat  ) / 100 ), 2 );
    end;
  end;
end;

procedure Tfrm_monta_pagto.dbedt_vl_pagto_procEnter(Sender: TObject);
begin
  str_vl_pagto_proc := dbedt_vl_pagto_proc.Text;
end;

procedure Tfrm_monta_pagto.dbedt_vl_pagto_favEnter(Sender: TObject);
begin
  str_vl_pagto_fav := dbedt_vl_pagto_fav.Text;
end;

procedure Tfrm_monta_pagto.dbedt_vl_pagto_procExit(Sender: TObject);
begin
  with datm_monta_pagto do
  begin
    if str_vl_pagto_proc <> dbedt_vl_pagto_proc.Text then
    begin
      if ( qry_solic_pagto_VL_DESCONTO.AsFloat > 0 ) then
      begin
        if Not ( qry_solic_pagto_.State in [dsInsert, dsEdit] ) then
          qry_solic_pagto_.Edit;
        if ( qry_solic_pagto_VL_PERC_DESCONTO.AsFloat > 0 ) then
          qry_solic_pagto_VL_DESCONTO.AsFloat :=
             Arredondar( ( ( qry_solic_pagto_VL_PAGTO.AsFloat * qry_solic_pagto_VL_PERC_DESCONTO.AsFloat  ) / 100 ), 2 );
      end;
    end;
  end;
end;

procedure Tfrm_monta_pagto.dbedt_vl_pagto_favExit(Sender: TObject);
begin
  with datm_monta_pagto do
  begin
    if str_vl_pagto_fav <> dbedt_vl_pagto_fav.Text then
    begin
      if ( qry_solic_fav_VL_DESCONTO.AsFloat > 0 ) then
      begin
        if Not ( qry_solic_fav_.State in [dsInsert, dsEdit] ) then
          qry_solic_fav_.Edit;
        if ( qry_solic_fav_VL_PERC_DESCONTO.AsFloat > 0 ) then
          qry_solic_fav_VL_DESCONTO.AsFloat :=
             Arredondar( ( ( qry_solic_fav_VL_PAGTO.AsFloat * qry_solic_fav_VL_PERC_DESCONTO.AsFloat  ) / 100 ), 2 );
      end;
    end;
  end;
end;

procedure Tfrm_monta_pagto.btn_co_bancoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2216';
  Application.CreateForm(Tfrm_banco, frm_banco);
  frm_banco.Cons_OnLine := datm_monta_pagto.qry_solic_pagto_CD_BANCO;
  with frm_banco do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_monta_pagto.qry_solic_pagto_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_monta_pagto.qry_solic_pagto_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_monta_pagto do
  begin
    qry_banco_.Close;
    qry_banco_.Prepare;
    qry_banco_.Open;
  end;
  vStr_cd_modulo := '26';
  str_cd_rotina := '2602';
  dbedt_cd_bancoExit(nil);
end;

procedure Tfrm_monta_pagto.dbedt_cd_banco2Exit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_monta_pagto.btn_co_banco3Click(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2216';
  Application.CreateForm(Tfrm_banco, frm_banco);
  frm_banco.Cons_OnLine := datm_monta_pagto.qry_solic_fav_CD_BANCO;
  with frm_banco do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_monta_pagto.qry_solic_fav_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_monta_pagto.qry_solic_fav_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_monta_pagto do
  begin
    qry_banco_.Close;
    qry_banco_.Prepare;
    qry_banco_.Open;
  end;
  vStr_cd_modulo := '26';
  str_cd_rotina := '2602';
  dbedt_cd_banco2Exit(nil);
end;


procedure Tfrm_monta_pagto.btn_co_banco2Click(Sender: TObject);
begin
  with datm_monta_pagto do
  begin
    Application.CreateForm(Tfrm_banco, frm_banco );
    with frm_banco do
    begin
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


procedure Tfrm_monta_pagto.msk_dt_pagamentoExit(Sender: TObject);
begin
  try
    if msk_dt_pagamento.Text <> '  /  /    ' then StrToDate(msk_dt_pagamento.Text);
  except
    on EConvertError do
    begin
      BoxMensagem('Data Inválida!',2);
      msk_dt_pagamento.Clear;
      msk_dt_pagamento.SetFocus;
    end;
  end;

  if msk_dt_pagamento.Text = dt_pagto then
  begin
    Exit;
  end
  else
  begin
    Abre_Data;
  end;
end;

procedure Tfrm_monta_pagto.msk_dt_pagamentoEnter(Sender: TObject);
begin
  dt_pagto := msk_dt_pagamento.Text;
end;

procedure Tfrm_monta_pagto.msk_cd_unid_neg_favEnter(Sender: TObject);
begin
  cd_unid_neg_fav := msk_cd_unid_neg_fav.Text;
end;

procedure Tfrm_monta_pagto.msk_cd_produto_favEnter(Sender: TObject);
begin
  cd_produto_fav := msk_cd_produto_fav.Text;
end;

procedure Tfrm_monta_pagto.msk_cd_usuarioEnter(Sender: TObject);
begin
  cd_usuario := msk_cd_usuario.Text;
end;

procedure Tfrm_monta_pagto.msk_cd_unid_neg_favExit(Sender: TObject);
begin
  if Trim( msk_cd_unid_neg_fav.Text ) = cd_unid_neg_fav then Exit;
  if Trim( msk_cd_unid_neg_fav.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_unid_neg_fav );
    with datm_monta_pagto do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_unid_neg_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg_fav.Text + '" AND ';
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if Not qry_unid_neg_.EOF then
      begin
        edt_nm_unid_neg_fav.Text := qry_unid_neg_NM_UNID_NEG.AsString;
        btn_desmarca_todasClick(nil);
        Abre_Fav;
      end
      else
      begin
        BoxMensagem( 'Unidade de Negócio não cadastrada ou não' + #13#10 +
                     'habilitada para este Usuário nesta Unidade/Produto', 2 );
        edt_nm_unid_neg_fav.Text := '';
        msk_cd_unid_neg_fav.SetFocus;
        Exit;
      end;
    end
  end
  else
  begin
    edt_nm_unid_neg_fav.Text := '';
  end;
end;

procedure Tfrm_monta_pagto.btn_co_unid_neg_favClick(Sender: TObject);
begin
  with datm_monta_pagto do
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
      msk_cd_unid_neg_fav.Text := frm_unidade.Cons_OnLine_Texto;
      msk_cd_unid_neg_favExit(nil);
    end;
  end;
end;

procedure Tfrm_monta_pagto.msk_cd_produto_favExit(Sender: TObject);
begin
  if Trim( msk_cd_produto_fav.Text ) = cd_produto_fav then Exit;
  if Trim( msk_cd_produto_fav.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_produto_fav );
    with datm_monta_pagto do
    begin
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg_fav.Text;
      qry_produto_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
      qry_produto_.SQL[2] := 'WHERE CD_PRODUTO = "' + msk_cd_produto_fav.Text + '" AND';
      qry_produto_.Prepare;
      qry_produto_.Open;
      if Not qry_produto_.EOF then
      begin
        edt_nm_produto_fav.Text := qry_produto_NM_PRODUTO.AsString;
        btn_desmarca_todasClick(nil);
        Abre_Fav;
      end
      else
      begin
        BoxMensagem( 'Produto não cadastrada ou não' + #13#10 +
                     'habilitado para este Usuário nesta Unidade/Produto', 2 );
        edt_nm_produto_fav.Text              := '';
        msk_cd_produto_fav.SetFocus;
        Exit;
      end
    end;
  end
  else
  begin
    edt_nm_produto_fav.Text := '';
  end;
end;

procedure Tfrm_monta_pagto.msk_cd_usuarioExit(Sender: TObject);
begin
  if Trim( msk_cd_usuario.Text ) = cd_usuario then Exit;
  if Trim( msk_cd_usuario.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_usuario );
    with datm_monta_pagto do
    begin
      qry_usuario_.Close;
      qry_usuario_.SQL[2] := 'WHERE IN_ATIVO = "1" AND CD_USUARIO = "' + msk_cd_usuario.Text + '"';
      qry_usuario_.Prepare;
      qry_usuario_.Open;
      if Not qry_usuario_.EOF then
      begin
        edt_nm_usuario.Text := qry_usuario_AP_USUARIO.AsString;
        btn_desmarca_todasClick(nil);
        Abre_Fav;
      end
      else
      begin
        BoxMensagem('Usuário não cadastrado!', 2);
        edt_nm_usuario.Text := '';
        msk_cd_usuario.SetFocus;
        qry_usuario_.Close;
        qry_usuario_.SQL[2] := 'WHERE IN_ATIVO = "1" AND CD_USUARIO <> ""';
        qry_usuario_.Prepare;
        qry_usuario_.Open;
        Exit;
      end;
    end
  end
  else
  begin
    edt_nm_usuario.Text := '';
    Abre_Fav;
  end;
end;

procedure Tfrm_monta_pagto.btn_co_usuarioClick(Sender: TObject);
begin
  with datm_monta_pagto do
  begin
    Application.CreateForm(Tfrm_usuario, frm_usuario );
    with frm_usuario do
    begin
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

procedure Tfrm_monta_pagto.btn_co_produto_favClick(Sender: TObject);
begin
  with datm_monta_pagto do
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
      msk_cd_produto_fav.Text := frm_produto.Cons_OnLine_Texto;
      msk_cd_produto_favExit(nil);
    end;
  end;
end;

procedure Tfrm_monta_pagto.dbgrdMontaFavCellClick(Column: TColumn);
begin
  TotSelecFav;
end;

procedure Tfrm_monta_pagto.dbgrdMontaFavKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  TotSelecFav;
end;

procedure Tfrm_monta_pagto.dbgrdMontaFavKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  TotSelecFav;
end;

procedure Tfrm_monta_pagto.dbgrdMontaPagtoCellClick(Column: TColumn);
begin
  TotSelecProc;
end;

procedure Tfrm_monta_pagto.dbgrdMontaPagtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  TotSelecProc;
end;

procedure Tfrm_monta_pagto.dbgrdMontaPagtoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  TotSelecProc;
end;

procedure Tfrm_monta_pagto.TotSelecFav;
var vQryAux: TQuery;
begin
  vl_tot_selec := 0;
  vl_tot_selec_proc := 0;
  vQryAux := TQuery.Create(application);
  vQryAux.DataBaseName := 'DBBROKER';
  vQryAux.Close;
  vQryAux.SQL.Clear;
  vQryAux.SQL.Add('SELECT SUM(ISNULL(VL_PAGTO, 0)) FROM TSOLIC_PAGTO WHERE IN_MONTAR = ''1'' AND CD_MONTADOR = ''' + str_cd_usuario + ''' ');
  vQryAux.Open;
  vl_tot_selec := vQryAux.Fields[0].AsFloat;
  vl_tot_selec_proc := vl_tot_selec;
  lbl_vl_tot_selec.Caption := FormatFloat( '#0,.00', vl_tot_selec );
  lbl_vl_tot_selec_proc.Caption := lbl_vl_tot_selec.Caption;
  vQryAux.Free;
end;

procedure Tfrm_monta_pagto.TotSelecProc;
begin
  TotSelecFav;
end;

procedure Tfrm_monta_pagto.msk_cd_unid_neg_dataEnter(Sender: TObject);
begin
  cd_unid_neg_data := msk_cd_unid_neg_data.Text;
end;

procedure Tfrm_monta_pagto.msk_cd_unid_neg_dataExit(Sender: TObject);
begin
  if Trim( msk_cd_unid_neg_data.Text ) = cd_unid_neg_data then Exit;
  if Trim( msk_cd_unid_neg_data.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_unid_neg_data );
    with datm_monta_pagto do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_unid_neg_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg_data.Text + '" AND ';
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if Not qry_unid_neg_.EOF then
      begin
        edt_nm_unid_neg_data.Text := qry_unid_neg_NM_UNID_NEG.AsString;
        Abre_Data;
      end
      else
      begin
        BoxMensagem( 'Unidade de Negócio não cadastrada ou não' + #13#10 +
                     'habilitada para este Usuário nesta Unidade/Produto', 2 );
        edt_nm_unid_neg_data.Text := '';
        msk_cd_unid_neg_data.SetFocus;
        Exit;
      end;
    end
  end
  else
  begin
    edt_nm_unid_neg_data.Text := '';
  end;
end;

procedure Tfrm_monta_pagto.btn_co_unid_neg_dataClick(Sender: TObject);
begin
  with datm_monta_pagto do
  begin
    Application.CreateForm( Tfrm_unidade, frm_unidade );
    with frm_unidade do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg_data.Text := frm_unidade.Cons_OnLine_Texto;
      msk_cd_unid_neg_dataExit(nil);
    end;
  end;
end;

procedure Tfrm_monta_pagto.Abre_Data;
begin
  if ( Trim( msk_dt_pagamento.Text ) = '/  /' ) or ( Trim( msk_cd_unid_neg_data.Text ) = '' ) then
    Exit;

  with datm_monta_pagto do
  begin
    qry_pagtoData_.Close;
    qry_pagtoData_.ParamByName('CD_UNID_NEG').AsString      := Trim( msk_cd_unid_neg_data.Text );
    qry_pagtoData_.ParamByName('DT_SOLIC_PAGTO').AsDateTime := StrtoDateTime( msk_dt_pagamento.Text );
    qry_pagtoData_.Prepare;
    qry_pagtoData_.Open;
  end;
end;

procedure Tfrm_monta_pagto.msk_cd_unid_neg_pagtoEnter(Sender: TObject);
begin
  cd_unid_neg_pagto := msk_cd_unid_neg_pagto.Text;
end;

procedure Tfrm_monta_pagto.msk_cd_unid_neg_pagtoExit(Sender: TObject);
begin
  if Trim( msk_cd_unid_neg_pagto.Text ) = cd_unid_neg_pagto then Exit;
  if Trim( msk_cd_unid_neg_pagto.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_unid_neg_pagto );
    with datm_monta_pagto do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_unid_neg_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg_pagto.Text + '" AND ';
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if Not qry_unid_neg_.EOF then
      begin
        edt_nm_unid_neg_pagto.Text := qry_unid_neg_NM_UNID_NEG.AsString;
        Abre_Pagtos;
      end
      else
      begin
        BoxMensagem( 'Unidade de Negócio não cadastrada ou não' + #13#10 +
                     'habilitada para este Usuário nesta Unidade/Produto', 2 );
        edt_nm_unid_neg_pagto.Text := '';
        msk_cd_unid_neg_pagto.SetFocus;
        Exit;
      end;
    end
  end
  else
  begin
    edt_nm_unid_neg_pagto.Text := '';
  end;
end;

procedure Tfrm_monta_pagto.btn_co_unid_neg_pagtoClick(Sender: TObject);
begin
  with datm_monta_pagto do
  begin
    Application.CreateForm( Tfrm_unidade, frm_unidade );
    with frm_unidade do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg_pagto.Text := frm_unidade.Cons_OnLine_Texto;
      msk_cd_unid_neg_pagtoExit(nil);
    end;
  end;
end;

procedure Tfrm_monta_pagto.Nr_DOC;
begin
  msk_nr_doc_proc.Text := '';
  // Verifica próximo nr do DOC do Banco  - 04/10/2006
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    Sql.Clear;
    Sql.Add( ' SELECT NR_DOC FROM TBANCO (NOLOCK) ');
    Sql.Add( ' WHERE CD_BANCO = :CD_BANCO ');
    ParamByName('CD_BANCO').AsString := dbedt_cd_banco.Text;
    Open;
    if Not Eof then
    begin
      if Trim( Fields[0].AsString ) <> '' then
      begin
        msk_nr_doc_proc.Text := StrZero( ( StrToInt( Fields[0].AsString ) + 1 ), 6 );
      end
      else
      begin
        msk_nr_doc_proc.Text := '000001';
      end;
    end;
    Close;
    Free;
  end;
end;

procedure Tfrm_monta_pagto.Nr_DOC_Fav;
begin
  msk_nr_doc.Text := '';
  // Verifica próximo nr do DOC do Banco - 04/10/2006
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    Sql.Clear;
    Sql.Add( ' SELECT NR_DOC FROM TBANCO (NOLOCK) ');
    Sql.Add( ' WHERE CD_BANCO = :CD_BANCO ');
    ParamByName('CD_BANCO').AsString := msk_cd_banco.Text;
    Open;
    if Not Eof then
    begin
      if Trim( Fields[0].AsString ) <> '' then
      begin
        msk_nr_doc.Text := StrZero( ( StrToInt( Fields[0].AsString ) + 1 ), 6 );
      end
      else
      begin
        msk_nr_doc.Text := '000001';
      end;
    end;
    Close;
    Free;
  end;
end;

procedure Tfrm_monta_pagto.dbgrdMontaFavDblClick(Sender: TObject);
begin
  if dbgrdMontaFav.SelectedIndex = 0  then begin
    if datm_monta_pagto.qry_grd_fav_IN_MONTAR.AsString = '1' then
      FastExecSQL(' UPDATE TSOLIC_PAGTO SET IN_MONTAR = ''0'', CD_MONTADOR = Null ' +
                  ' WHERE NR_PROCESSO = ''' + Trim(datm_monta_pagto.qry_grd_fav_NR_PROCESSO.AsString) + ''' ' +
                  '   AND NR_LANCAMENTO = ''' + Trim(datm_monta_pagto.qry_grd_fav_NR_LANCAMENTO.AsString) + ''' ' +
                  '   AND CD_ITEM = ''' + Trim(datm_monta_pagto.qry_grd_fav_CD_ITEM.AsString) + ''' ' )
    else

      FastExecSQL(' UPDATE TSOLIC_PAGTO SET IN_MONTAR = ''1'', CD_MONTADOR = ''' + str_cd_usuario + ''' ' +
                  ' WHERE NR_PROCESSO = ''' + Trim(datm_monta_pagto.qry_grd_fav_NR_PROCESSO.AsString) + ''' ' +
                  '   AND NR_LANCAMENTO = ''' + Trim(datm_monta_pagto.qry_grd_fav_NR_LANCAMENTO.AsString) + ''' ' +
                  '   AND CD_ITEM = ''' + Trim(datm_monta_pagto.qry_grd_fav_CD_ITEM.AsString) + ''' ' );


    Abre_Fav;
  end;
end;

procedure Tfrm_monta_pagto.dbgrdMontaPagtoDblClick(Sender: TObject);
begin
  if dbgrdMontaPagto.SelectedIndex = 0  then begin
    if datm_monta_pagto.qry_grd_pagto_IN_MONTAR.AsString = '1' then
      FastExecSQL(' UPDATE TSOLIC_PAGTO SET IN_MONTAR = ''0'', CD_MONTADOR = Null ' +
                  ' WHERE NR_PROCESSO = ''' + Trim(datm_monta_pagto.qry_grd_pagto_NR_PROCESSO.AsString) + ''' ' +
                  '   AND NR_LANCAMENTO = ''' + Trim(datm_monta_pagto.qry_grd_pagto_NR_LANCAMENTO.AsString) + ''' ' +
                  '   AND CD_ITEM = ''' + Trim(datm_monta_pagto.qry_grd_pagto_CD_ITEM.AsString) + ''' ' )
    else

      FastExecSQL(' UPDATE TSOLIC_PAGTO SET IN_MONTAR = ''1'', CD_MONTADOR = ''' + str_cd_usuario + ''' ' +
                  ' WHERE NR_PROCESSO = ''' + Trim(datm_monta_pagto.qry_grd_pagto_NR_PROCESSO.AsString) + ''' ' +
                  '   AND NR_LANCAMENTO = ''' + Trim(datm_monta_pagto.qry_grd_pagto_NR_LANCAMENTO.AsString) + ''' ' +
                  '   AND CD_ITEM = ''' + Trim(datm_monta_pagto.qry_grd_pagto_CD_ITEM.AsString) + ''' ' );


    Abre_Proc;
  end;
end;

procedure Tfrm_monta_pagto.dbgrdRefItensDblClick(Sender: TObject);
var nr_lancamento, cd_item : String[3];
begin
if dbgrdRefItens.SelectedIndex = 0  then begin
    if datm_monta_pagto.qry_ref_itens_IN_MONTAR.AsString = '1' then
      FastExecSQL(' UPDATE TSOLIC_PAGTO SET IN_MONTAR = ''0'', CD_MONTADOR = Null ' +
                  ' WHERE NR_PROCESSO = ''' + Trim(datm_monta_pagto.qry_ref_itens_NR_PROCESSO.AsString) + ''' ' +
                  '   AND NR_LANCAMENTO = ''' + Trim(datm_monta_pagto.qry_ref_itens_NR_LANCAMENTO.AsString) + ''' ' +
                  '   AND CD_ITEM = ''' + Trim(datm_monta_pagto.qry_ref_itens_CD_ITEM.AsString) + ''' ' )

    else

      FastExecSQL(' UPDATE TSOLIC_PAGTO SET IN_MONTAR = ''1'', CD_MONTADOR = ''' + str_cd_usuario + ''' ' +
                  ' WHERE NR_PROCESSO = ''' + Trim(datm_monta_pagto.qry_ref_itens_NR_PROCESSO.AsString) + ''' ' +
                  '   AND NR_LANCAMENTO = ''' + Trim(datm_monta_pagto.qry_ref_itens_NR_LANCAMENTO.AsString) + ''' ' +
                  '   AND CD_ITEM = ''' + Trim(datm_monta_pagto.qry_ref_itens_CD_ITEM.AsString) + ''' ' );


    nr_lancamento  := datm_monta_pagto.qry_ref_itens_NR_LANCAMENTO.AsString;
    cd_item := datm_monta_pagto.qry_ref_itens_CD_ITEM.AsString;
    datm_monta_pagto.qry_ref_itens_.Close;
    datm_monta_pagto.qry_ref_itens_.Open;
    datm_monta_pagto.qry_ref_itens_.Locate('NR_LANCAMENTO;CD_ITEM', VarArrayOf ([nr_lancamento, cd_item]), [loCaseInsensitive]);
  end;

end;

procedure Tfrm_monta_pagto.pgctrl_monta_pagtoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := (datm_monta_pagto.qry_solic_pagto_.State in [dsBrowse, dsInactive]) and (datm_monta_pagto.qry_solic_fav_.State in [dsBrowse, dsInactive]);
  if AllowChange then begin
    btn_desmarca_todasClick(btn_desmarca_todas);
  end else begin
    if Application.MessageBox('Tabela em Edição/Inserção! Deseja salvar as alterações?', 'Montagem - Alterações', MB_YESNO + MB_ICONQUESTION) = mrYes then
      btn_salvarClick(nil)
    else
      btn_cancelarClick(nil);
  end;
end;

end.
