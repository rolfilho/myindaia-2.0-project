unit pgad003;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, ComCtrls;

type
  Tfrm_lib_pagto1 = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_sair: TMenuItem;
    btn_marca_todas: TSpeedButton;
    btn_desmarca_todas: TSpeedButton;
    btn_liberar: TSpeedButton;
    btn_nao_liberar: TSpeedButton;
    mi_liberar: TMenuItem;
    mi_nao_liberar: TMenuItem;
    lbl_pagto: TLabel;
    msk_dt_pagto: TMaskEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    lbl_itens_ok: TLabel;
    dbgrdItensPendentes: TDBGrid;
    dbgrdPagtos: TDBGrid;
    dbgrdItensLiberados: TDBGrid;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    DBGrid2: TDBGrid;
    Label3: TLabel;
    DBGrid3: TDBGrid;
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
  private
    procedure Liberacao(Operacao : String);
  public
    st_modificar, st_incluir, st_excluir : Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    dt_solic_ch : String[10];
    nr_proc : String[18];
    hm_para_solic_ch : String[5];
    cd_unid_neg, cd_produto : String[2];
    dt_pagamento : String;
  end;

var
  frm_lib_pagto1 : Tfrm_lib_pagto1;
  CancelaOperacao, Cancelado, Solicitando : Boolean;

implementation

uses GSMLIB, PGGP001, PGGP017, PGSM010, PGSM018, PGSM041, PGSM059, PGSM090,
     PGGP015, PGPG006, PGSM111;

{$R *.DFM}

procedure Tfrm_lib_pagto1.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_lib_pagto1.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure Tfrm_lib_pagto1.FormCreate(Sender: TObject);
begin
  CancelaOperacao := False;
  Cancelado       := False;

  st_modificar    := False;
  st_incluir      := False;
  st_excluir      := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir );

  { Cria o DataModule de Dados de Solicitação de Cheque }
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

procedure Tfrm_lib_pagto1.btn_cancelarClick(Sender: TObject);
begin
  if Solicitando then CancelaOperacao := True;
  btn_desmarca_todasClick(nil);
end;

procedure Tfrm_lib_pagto1.Abre_Pagtos;
begin
  with datm_lib_pagto do
  begin
    if msk_dt_pagto.Text = '  /  /    ' then Exit;

    qry_lib_pagto_.Close;
    qry_lib_pagto_.ParamByName('DT_PAGTO').AsDate := StrToDate( msk_dt_pagto.Text );
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

procedure Tfrm_lib_pagto1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_lib_pagto1.btn_marca_todasClick(Sender: TObject);
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

procedure Tfrm_lib_pagto1.btn_desmarca_todasClick(Sender: TObject);
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

procedure Tfrm_lib_pagto1.msk_dt_pagtoEnter(Sender: TObject);
begin
  dt_pagamento := msk_dt_pagto.Text;
end;

procedure Tfrm_lib_pagto1.msk_dt_pagtoExit(Sender: TObject);
begin
  if msk_dt_pagto.Text = dt_pagamento then Exit;
  Abre_Pagtos;
end;

procedure Tfrm_lib_pagto1.btn_liberarClick(Sender: TObject);
begin
  Liberacao('+');
end;

procedure Tfrm_lib_pagto1.Liberacao(Operacao : String);
var
  i : Integer;
begin
  with datm_lib_pagto do
  begin
    {Itens}
    if dbgrdItensPendentes.SelectedRows.Count > 0 then
       TTable(dbgrdItensPendentes.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdItensPendentes.SelectedRows[0]));
    for i:= 0 to dbgrdItensPendentes.SelectedRows.Count - 1 do
    begin
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc( sp_liberar_solic_pagto );
        sp_liberar_solic_pagto.ParamByName('@NR_PROCESSO').AsString :=
            qry_lib_pagto_item_NR_PROCESSO.AsString;
        sp_liberar_solic_pagto.ParamByName('@CD_ITEM').AsString     :=
            qry_lib_pagto_item_CD_ITEM.AsString;
        sp_liberar_solic_pagto.ParamByName('@OPERACAO').AsString    := Operacao;
        ExecStoredProc( sp_liberar_solic_pagto );
        CloseStoredProc( sp_liberar_solic_pagto );
        datm_main.db_broker.Commit;
      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      end;

      dbgrdPagtos.SelectedRows.CurrentRowSelected := False;
      if dbgrdPagtos.SelectedRows.Count > 0 then
        TTable(dbgrdPagtos.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdPagtos.SelectedRows[0]))
      else Break;
    end;

    {Pagamentos Inteiros}
    if dbgrdPagtos.SelectedRows.Count > 0 then
       TTable(dbgrdPagtos.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdPagtos.SelectedRows[0]));
    for i:= 0 to dbgrdPagtos.SelectedRows.Count - 1 do
    begin
      try
        datm_main.db_broker.StartTransaction;
        qry_lib_pagto_item_.First;
        while Not qry_lib_pagto_item_.EOF do
        begin
          CloseStoredProc( sp_liberar_solic_pagto );
          sp_liberar_solic_pagto.ParamByName('@NR_PROCESSO').AsString :=
              qry_lib_pagto_item_NR_PROCESSO.AsString;
          sp_liberar_solic_pagto.ParamByName('@CD_ITEM').AsString     :=
              qry_lib_pagto_item_CD_ITEM.AsString;
          sp_liberar_solic_pagto.ParamByName('@OPERACAO').AsString    := Operacao;
          ExecStoredProc( sp_liberar_solic_pagto );
          CloseStoredProc( sp_liberar_solic_pagto );
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

procedure Tfrm_lib_pagto1.btn_nao_liberarClick(Sender: TObject);
begin
  Liberacao('-');
end;




end.
