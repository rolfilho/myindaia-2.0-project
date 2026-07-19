unit PGPG005;

interface

uses                                                                                         
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, ComCtrls, Funcoes;

type
  Tfrm_lib_pagto = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_sair: TMenuItem;
    dbgrdItensPendentes: TDBGrid;
    btn_marca_todas: TSpeedButton;
    btn_desmarca_todas: TSpeedButton;
    dbgrdPagtos: TDBGrid;
    lbl_pagtos: TLabel;
    Label1: TLabel;
    btn_liberar: TSpeedButton;
    btn_nao_liberar: TSpeedButton;
    mi_liberar: TMenuItem;
    mi_nao_liberar: TMenuItem;
    lbl_pagto: TLabel;
    msk_dt_pagto: TMaskEdit;
    lbl_itens_ok: TLabel;
    dbgrdItensLiberados: TDBGrid;
    Label10: TLabel;
    msk_cd_unid_neg_lib: TMaskEdit;
    edt_nm_unid_neg_lib: TEdit;
    btn_co_unid_neg_lib: TSpeedButton;
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure Abre_Pagtos;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_marca_todasClick(Sender: TObject);
    procedure btn_desmarca_todasClick(Sender: TObject);
    procedure msk_dt_pagtoEnter(Sender: TObject);
    procedure msk_dt_pagtoExit(Sender: TObject);
    procedure btn_liberarClick(Sender: TObject);
    procedure btn_nao_liberarClick(Sender: TObject);
    procedure msk_cd_unid_neg_libEnter(Sender: TObject);
    procedure msk_cd_unid_neg_libExit(Sender: TObject);
    procedure btn_co_unid_neg_libClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_unid_neg_libKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    cd_unid_neg_lib : String[2];
    procedure Liberacao(Operacao : String);
  public
    st_modificar, st_incluir, st_excluir : Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    dt_solic_ch : String[10];
    nr_proc : String[18];
    hm_para_solic_ch : String[5];
    dt_pagamento : String;
    in_ted : String[1];
  end;

var
  frm_lib_pagto : Tfrm_lib_pagto;
  CancelaOperacao, Cancelado, Solicitando : Boolean;

implementation

uses GSMLIB,  PGGP001, PGGP017, PGSM010, PGSM018, PGSM041, PGSM059, PGSM090,
     PGGP015, PGPG006;

{$R *.DFM}

procedure Tfrm_lib_pagto.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_lib_pagto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_lib_pagto do
  begin
    qry_status_solic_pagto_.Close;
    tbl_yesno_.Close;
    qry_param_.Close;
    qry_item_.Close;
    qry_processo_.Close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_servico_.Close;
    qry_emp_nac_.Close;
    qry_lib_pagto_.Close;
    qry_lib_pagto_item_.Close;
    qry_itens_liberados_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_lib_pagto.FormCreate(Sender: TObject);
begin
  CancelaOperacao := False;
  Cancelado       := False;

  st_modificar    := False;
  st_incluir      := False;
  st_excluir      := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir );

  // Cria o DataModule de Dados de Solicitação de Cheque 
  Application.CreateForm(Tdatm_lib_pagto, datm_lib_pagto );

  mi_liberar.Enabled      := st_incluir;
  mi_nao_liberar.Enabled  := st_incluir;
  btn_liberar.Enabled     := st_incluir;
  btn_nao_liberar.Enabled := st_incluir;

  msk_dt_pagto.Text := DateToStr( dt_server );

  with datm_lib_pagto do
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

    qry_lib_pagto_.Close;
    Abre_Pagtos;
  end;
end;

procedure Tfrm_lib_pagto.btn_cancelarClick(Sender: TObject);
begin
  if Solicitando then CancelaOperacao := True;
  btn_desmarca_todasClick(nil);
end;

procedure Tfrm_lib_pagto.Abre_Pagtos;
begin
  with datm_lib_pagto do
  begin
    if ( msk_dt_pagto.Text = '  /  /    ' ) or ( Trim( msk_cd_unid_neg_lib.Text ) = '' ) then Exit;

    qry_lib_pagto_.Close;
    qry_lib_pagto_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg_lib.Text );
    qry_lib_pagto_.ParamByName('DT_PAGTO').AsDate      := StrToDate( msk_dt_pagto.Text );
    qry_lib_pagto_.ParamByName('IN_TED').AsString      := in_ted;
    qry_lib_pagto_.Prepare;
    qry_lib_pagto_.Open;

    qry_lib_pagto_item_.Close;
    qry_lib_pagto_item_.Prepare;
    qry_lib_pagto_item_.Open;

    qry_itens_liberados_.Close;
    qry_itens_liberados_.Prepare;
    qry_itens_liberados_.Open;
  end;
end;

procedure Tfrm_lib_pagto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_lib_pagto.btn_marca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Visible    := False;
  btn_desmarca_todas.Visible := True;
  btn_desmarca_todas.Left    := btn_marca_todas.Left;
  datm_lib_pagto.qry_lib_pagto_.First;
  for i := 0 to datm_lib_pagto.qry_lib_pagto_.RecordCount - 1 do
  begin
    dbgrdPagtos.SelectedRows.CurrentRowSelected := True;
    datm_lib_pagto.qry_lib_pagto_.Next;
  end;
end;

procedure Tfrm_lib_pagto.btn_desmarca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Visible    := True;
  btn_desmarca_todas.Visible := False;
  if dbgrdPagtos.SelectedRows.Count > 0 then
     TTable(dbgrdPagtos.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdPagtos.SelectedRows[0]));
  for i := 0 to dbgrdPagtos.SelectedRows.Count - 1 do
  begin
    dbgrdPagtos.SelectedRows.CurrentRowSelected := False;
    if dbgrdPagtos.SelectedRows.Count > 0 then
      TTable(dbgrdPagtos.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdPagtos.SelectedRows[0]))
    else Break;
  end;
end;

procedure Tfrm_lib_pagto.msk_dt_pagtoEnter(Sender: TObject);
begin
  dt_pagamento := msk_dt_pagto.Text;
end;

procedure Tfrm_lib_pagto.msk_dt_pagtoExit(Sender: TObject);
begin
  if msk_dt_pagto.Text = dt_pagamento then Exit;
  Abre_Pagtos;
end;

procedure Tfrm_lib_pagto.btn_liberarClick(Sender: TObject);
begin
  Liberacao('+');
end;

procedure Tfrm_lib_pagto.Liberacao(Operacao : String);
var
  i : Integer;
begin
  with datm_lib_pagto do
  begin
    // Itens
    if dbgrdItensPendentes.SelectedRows.Count > 0 then
       TTable(dbgrdItensPendentes.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdItensPendentes.SelectedRows[0]));
    for i:= 0 to dbgrdItensPendentes.SelectedRows.Count - 1 do
    begin
      try
        datm_main.db_broker.StartTransaction;
        if ( in_ted = '0' ) or ( ( in_ted = '1' ) and ( Operacao = '+' ) ) then
        begin
          CloseStoredProc( sp_liberar_solic_pagto );
          sp_liberar_solic_pagto.ParamByName('@NR_PROCESSO').AsString :=
              qry_lib_pagto_item_NR_PROCESSO.AsString;
          sp_liberar_solic_pagto.ParamByName('@NR_LANCAMENTO').AsString :=
              qry_lib_pagto_item_NR_LANCAMENTO.AsString;
          sp_liberar_solic_pagto.ParamByName('@CD_ITEM').AsString     :=
              qry_lib_pagto_item_CD_ITEM.AsString;
          sp_liberar_solic_pagto.ParamByName('@OPERACAO').AsString    := Operacao;
          ExecStoredProc( sp_liberar_solic_pagto );
          CloseStoredProc( sp_liberar_solic_pagto );
        end;

        if ( in_ted = '1' ) and ( Operacao = '-' ) then
        begin
          if BoxMensagem( 'Confirma cancelamento do item ' + qry_solic_item_LookItem.AsString + '?', 1) then
          begin
            if ( qry_solic_item_CD_STATUS.AsString = '7' ) and
               ( qry_lib_pagto_item_NR_REF.AsString <> 'C' ) then
            begin
              BoxMensagem('Item pago!', 2);
              Exit;
            end;

            if ( qry_solic_item_CD_STATUS.AsString = '4' ) or  ( qry_solic_item_CD_STATUS.AsString = '17' ) then
            begin
              BoxMensagem('Item cancelado!', 2);
              Exit;
            end;

            CloseStoredProc(sp_cancela_item_solic_pagto);
            sp_cancela_item_solic_pagto.ParamByName('@nr_processo').AsString   := qry_lib_pagto_item_NR_PROCESSO.AsString;
            sp_cancela_item_solic_pagto.ParamByName('@nr_lancamento').AsString := qry_lib_pagto_item_NR_LANCAMENTO.AsString;
            sp_cancela_item_solic_pagto.ParamByName('@cd_item').AsString       := qry_lib_pagto_item_CD_ITEM.AsString;
            ExecStoredProc(sp_cancela_item_solic_pagto);
            CloseStoredProc(sp_cancela_item_solic_pagto);
          end;

        end;
        datm_main.db_broker.Commit;
      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      end;

      dbgrdItensPendentes.SelectedRows.CurrentRowSelected := False;
      if dbgrdItensPendentes.SelectedRows.Count > 0 then
        TTable(dbgrdItensPendentes.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdItensPendentes.SelectedRows[0]))
      else Break;
    end;

    // Pagamentos Inteiros
    if dbgrdPagtos.SelectedRows.Count > 0 then
       TTable(dbgrdPagtos.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdPagtos.SelectedRows[0]));
    for i:= 0 to dbgrdPagtos.SelectedRows.Count - 1 do
    begin
      try
        datm_main.db_broker.StartTransaction;
        qry_lib_pagto_item_.First;
        while Not qry_lib_pagto_item_.EOF do
        begin
          if ( in_ted = '0' ) or ( ( in_ted = '1' ) and ( Operacao = '+' ) ) then
          begin
            CloseStoredProc( sp_liberar_solic_pagto );
            sp_liberar_solic_pagto.ParamByName('@NR_PROCESSO').AsString   :=
                qry_lib_pagto_item_NR_PROCESSO.AsString;
            sp_liberar_solic_pagto.ParamByName('@NR_LANCAMENTO').AsString :=
                qry_lib_pagto_item_NR_LANCAMENTO.AsString;
            sp_liberar_solic_pagto.ParamByName('@CD_ITEM').AsString       :=
                qry_lib_pagto_item_CD_ITEM.AsString;
            sp_liberar_solic_pagto.ParamByName('@OPERACAO').AsString      := Operacao;
            ExecStoredProc( sp_liberar_solic_pagto );
            CloseStoredProc( sp_liberar_solic_pagto );
          end;

          if ( in_ted = '1' ) and ( Operacao = '-' ) then
          begin
            if BoxMensagem( 'Confirma cancelamento da Ref. nº ' + qry_lib_pagto_NR_REF.AsString + '?', 1) then
            begin
              CloseStoredProc(sp_cancela_solic_pagto);
              sp_cancela_solic_pagto.ParamByName('@dt_pagto').AsDateTime := qry_lib_pagto_DT_PAGTO.AsDateTime;
              sp_cancela_solic_pagto.ParamByName('@nr_ref').AsString     := qry_lib_pagto_NR_REF.AsString;
              sp_cancela_solic_pagto.ParamByName('@in_ted').AsString     := 'X';
              ExecStoredProc(sp_cancela_solic_pagto);
              CloseStoredProc(sp_cancela_solic_pagto);
            end;
          end;

          qry_lib_pagto_item_.Next;
        end;

        datm_main.db_broker.Commit;
      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      end;

      dbgrdPagtos.SelectedRows.CurrentRowSelected := False;
      if dbgrdPagtos.SelectedRows.Count > 0 then
        TTable(dbgrdPagtos.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdPagtos.SelectedRows[0]))
      else Break;
    end;
    Abre_Pagtos;
  end;
end;

procedure Tfrm_lib_pagto.btn_nao_liberarClick(Sender: TObject);
begin
  Liberacao( '-' );
end;

procedure Tfrm_lib_pagto.msk_cd_unid_neg_libEnter(Sender: TObject);
begin
  cd_unid_neg_lib := msk_cd_unid_neg_lib.Text;
end;

procedure Tfrm_lib_pagto.msk_cd_unid_neg_libExit(Sender: TObject);
begin
  if Trim( msk_cd_unid_neg_lib.Text ) = cd_unid_neg_lib then Exit;
  if Trim( msk_cd_unid_neg_lib.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_unid_neg_lib );
    with datm_lib_pagto do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_unid_neg_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg_lib.Text + '" AND ';
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if Not qry_unid_neg_.EOF then
      begin
        edt_nm_unid_neg_lib.Text := qry_unid_neg_NM_UNID_NEG.AsString;
        Abre_Pagtos;
      end
      else
      begin
        BoxMensagem( 'Unidade de Negócio não cadastrada ou não' + #13#10 +
                     'habilitada para este Usuário nesta Unidade/Produto', 2 );
        edt_nm_unid_neg_lib.Text := '';
        msk_cd_unid_neg_lib.SetFocus;
        Exit;
      end;
    end
  end
  else
  begin
    edt_nm_unid_neg_lib.Text := '';
  end;
end;

procedure Tfrm_lib_pagto.btn_co_unid_neg_libClick(Sender: TObject);
begin
  with datm_lib_pagto do
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
      msk_cd_unid_neg_lib.Text := frm_unidade.Cons_OnLine_Texto;
      msk_cd_unid_neg_libExit(nil);
    end;
  end;
end;

procedure Tfrm_lib_pagto.FormShow(Sender: TObject);
begin
  if in_ted = '0' then
    Caption := 'Liberação de Pagamentos'
  else
    Caption := 'Liberação de TED´s';
  msk_cd_unid_neg_lib.Text := str_cd_unid_neg;
  msk_cd_unid_neg_libExit(nil);
end;

procedure Tfrm_lib_pagto.msk_cd_unid_neg_libKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg_lib then btn_co_unid_neg_libClick(nil);
  end;
end;

end.
