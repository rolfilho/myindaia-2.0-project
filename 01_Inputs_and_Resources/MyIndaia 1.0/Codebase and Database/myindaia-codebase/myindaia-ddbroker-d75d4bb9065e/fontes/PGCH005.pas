unit PGCH005;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Mask, ComCtrls, Grids, DBGrids, Db, DBTables,
  Buttons, Menus;

type
  Tfrm_liberacao = class(TForm)
    pgctrl_solic_: TPageControl; 
    ts_lista: TTabSheet;
    dbgrd_solic: TDBGrid;
    ts_liberacao: TTabSheet;
    pnl_liberacao: TPanel;
    StaticText3: TStaticText;
    StaticText2: TStaticText;
    StaticText1: TStaticText;
    dbgrd_itens: TDBGrid;
    DBGrid4: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DBText1: TDBText;
    StaticText4: TStaticText;
    Panel2: TPanel;
    DBText2: TDBText;
    StaticText5: TStaticText;
    Panel3: TPanel;
    DBText3: TDBText;
    StaticText6: TStaticText;
    Panel5: TPanel;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText7: TStaticText;
    StaticText10: TStaticText;
    stext_liberador: TStaticText;
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_liberar: TSpeedButton;
    btn_nao_liberar: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_liberar: TMenuItem;
    mi_nao_liberar: TMenuItem;
    mi_sair: TMenuItem;
    lbl_dt_inicio: TLabel;
    lbl_dt_termino: TLabel;
    msk_dt_termino: TMaskEdit;
    msk_dt_inicio: TMaskEdit;
    mi_pesq_liberacao: TMenuItem;
    btn_pesq_solic: TSpeedButton;
    DBText7: TDBText;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    DBText8: TDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btn_nao_liberarClick(Sender: TObject);
    procedure btn_liberarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure msk_dt_inicioExit(Sender: TObject);
    procedure msk_dt_terminoExit(Sender: TObject);
    procedure msk_dt_terminoEnter(Sender: TObject);
    procedure btn_pesq_solicClick(Sender: TObject);
    procedure AbreTabelas;
    procedure FechaTabelas;
    procedure AtualizaGeral;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    dt_inicio, dt_termino : TDate;
  public
    nr_solicitacao : String[3];
    nr_lancamento : Double;
    cState : String[1];
    lPesquisa : Boolean;
  end;

var
  frm_liberacao: Tfrm_liberacao;

implementation

uses GSMLIB, PGCH004, PGGP001, PGGP017;

{$R *.DFM}

procedure Tfrm_liberacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_liberacao do
  begin
    FechaTabelas;
//    datm_liberacao.Destroy;
    datm_liberacao.Free;
    Action := caFree;
  end;
end;

procedure Tfrm_liberacao.FormShow(Sender: TObject);
begin
  stext_liberador.Caption  := str_ap_usuario;
  pgctrl_solic_.ActivePage := ts_lista;
  if lPesquisa then
  begin
    with datm_liberacao do
    begin
      FechaTabelas;
    end;
    btn_pesq_solic.Visible    := True;
    lbl_dt_inicio.Visible     := True;
    lbl_dt_termino.Visible    := True;
    msk_dt_inicio.Visible     := True;
    msk_dt_termino.Visible    := True;
    mi_pesq_liberacao.Visible := True;
    msk_dt_inicio.SetFocus;
  end
  else
  begin
    btn_liberar.Visible := True;
    btn_nao_liberar.Visible := True;
    mi_liberar.Visible := True;
    mi_nao_liberar.Visible := True;
  end;
end;

procedure Tfrm_liberacao.btn_nao_liberarClick(Sender: TObject);
var
  nr_solic : String;
begin
  with datm_liberacao do
  begin
    try
      {Transação para os itens da solicitação}
      datm_main.db_broker.StartTransaction;
      if ( pgctrl_solic_.ActivePage = ts_lista ) then
      begin
        qry_solic_ch_.Open;
        if ( qry_solic_ch_CD_STATUS_SOLIC_CH.AsString = '8' ) then
        begin
          qry_solic_ch_.Edit;
          qry_solic_ch_CD_STATUS_SOLIC_CH.AsString := '5';
          qry_solic_ch_.Post;
        end;
        qry_solic_ch_.Close;
      end
      else
      begin
        If not (qry_itens_solic_.State in [dsEdit, dsInsert] ) Then
          qry_itens_solic_.Edit;
        if qry_itens_solic_CD_STATUS.AsString <> '' then
        case qry_itens_solic_CD_STATUS.AsInteger of
          1: qry_itens_solic_CD_STATUS.AsString := '5';
          2: qry_itens_solic_CD_STATUS.AsString := '7';
          3: qry_itens_solic_CD_STATUS.AsString := '9';
        end;
        qry_itens_solic_.Post;

        CloseStoredProc(sp_liberar_solic_ch);
        sp_liberar_solic_ch.ParamByName('@DT_SOLIC_CH').AsString :=
           qry_itens_solic_DT_SOLIC_CH.AsString;
        sp_liberar_solic_ch.ParamByName('@NR_SOLIC_CH').AsString :=
           qry_itens_solic_NR_SOLIC_CH.AsString;
        ExecStoredProc(sp_liberar_solic_ch);
        CloseStoredProc(sp_liberar_solic_ch);

        AtualizaGeral;

      end;
      nr_solic := qry_itens_solic_NR_SOLIC_CH.AsString;
      datm_main.db_broker.Commit;
    except
      begin
        BoxMensagem('Sistema não conseguiu concluir a operação! Tente novamente!', 2);
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      end;
    end;

    qry_solic_.Close;
    qry_solic_.ParamByName('DT_HOJE').AsString := FormatDateTime('dd/mm/yyyy', dt_server);
    qry_solic_.Open;
    Localiza( qry_solic_, nr_solic, 'NR_SOLIC_CH' );
    qry_itens_solic_.Close;
    qry_itens_solic_.Open;
    AtualizaGeral;

  end;
end;

procedure Tfrm_liberacao.btn_liberarClick(Sender: TObject);
var
  nr_solic : String;
begin
  with datm_liberacao do
  begin
    try
      {Transação para os itens da solicitação}
      datm_main.db_broker.StartTransaction;
      if ( pgctrl_solic_.ActivePage = ts_lista ) then
      begin
        qry_solic_ch_.Open;
        if ( datm_liberacao.qry_solic_ch_CD_STATUS_SOLIC_CH.AsString = '8' ) then
        begin
          qry_solic_ch_.Edit;
          qry_solic_ch_CD_STATUS_SOLIC_CH.AsString := '0';
          qry_solic_ch_.Post;
        end;
        qry_solic_ch_.Close;
      end
      else
      begin
        If not (qry_itens_solic_.State in [dsEdit, dsInsert] ) Then
          qry_itens_solic_.Edit;
        if qry_itens_solic_CD_STATUS.AsString <> '' then
        case qry_itens_solic_CD_STATUS.AsInteger of
          1: qry_itens_solic_CD_STATUS.AsString := '4';
          2: qry_itens_solic_CD_STATUS.AsString := '6';
          3: qry_itens_solic_CD_STATUS.AsString := '8';
        end;
        qry_itens_solic_.Post;
        CloseStoredProc(sp_proc_item_solic_ch);
        sp_proc_item_solic_ch.ParamByName('@DT_SOLIC_CH').AsString :=
           qry_itens_solic_DT_SOLIC_CH.AsString;
        sp_proc_item_solic_ch.ParamByName('@NR_SOLIC_CH').AsString :=
           qry_itens_solic_NR_SOLIC_CH.AsString;
        sp_proc_item_solic_ch.ParamByName('@NR_LANCAMENTO').AsString :=
           qry_itens_solic_NR_LANCAMENTO.AsString;
        sp_proc_item_solic_ch.ParamByName('@OPERACAO').AsString := '+';
        ExecStoredProc(sp_proc_item_solic_ch);
        CloseStoredProc(sp_proc_item_solic_ch);
      end;
      nr_solic := qry_itens_solic_NR_SOLIC_CH.AsString;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        TrataErro(E);
        BoxMensagem('Sistema não conseguiu concluir a operação! Tente novamente!', 2);
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      end;
    end;
    qry_solic_.Close;
    qry_solic_.ParamByName('DT_HOJE').AsString := FormatDateTime('dd/mm/yyyy', dt_server);
    qry_solic_.Open;
    Localiza( qry_solic_, nr_solic, 'NR_SOLIC_CH' );
    qry_itens_solic_.Close;
    qry_itens_solic_.Open;
    AtualizaGeral;
  end;
end;

procedure Tfrm_liberacao.FormCreate(Sender: TObject);
begin
  { Cria o DataModule p/ Liberação de Solicitações }
  Application.CreateForm(Tdatm_liberacao, datm_liberacao );
  with datm_liberacao do
  begin
    AbreTabelas;

    qry_solic_.Close;
    qry_solic_.ParamByName('DT_HOJE').AsString := FormatDateTime('dd/mm/yyyy', dt_server );
    qry_solic_.Prepare;
    qry_solic_.Open;
    qry_itens_solic_.Close;
    qry_itens_solic_.Open;
    AtualizaGeral;

  end;
end;

procedure Tfrm_liberacao.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_liberacao.msk_dt_inicioExit(Sender: TObject);
begin
  try
    if msk_dt_inicio.Text <> '  /  /    ' then
    begin
      dt_inicio := StrToDate(msk_dt_inicio.Text);
      if dt_inicio > Date then
      begin
        BoxMensagem('A data de inicio não pode ser maior do que a data atual', 2);
        msk_dt_inicio.SetFocus;
        Exit;
      end;
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

procedure Tfrm_liberacao.msk_dt_terminoExit(Sender: TObject);
begin
  try
    if msk_dt_termino.Text <> '  /  /    ' then
    begin
      dt_termino := StrToDate(msk_dt_termino.Text);
      if dt_termino > Date then
      begin
        BoxMensagem('A data de término no máximo poderá ser igual à data atual', 2);
        msk_dt_termino.SetFocus;
        Exit;
      end;
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

procedure Tfrm_liberacao.msk_dt_terminoEnter(Sender: TObject);
begin
  if msk_dt_termino.Text <> '  /  /    ' then
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


procedure Tfrm_liberacao.btn_pesq_solicClick(Sender: TObject);
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

  with datm_liberacao do
  begin
    FechaTabelas;

    qry_solic_.Close;
    qry_solic_.SQL[4] :=
      'CONVERT(datetime, DT_SOLIC_CH, 103 ) >= CONVERT(datetime, "' + msk_dt_inicio.Text + '", 103 ) AND ' +
      'CONVERT(datetime, DT_SOLIC_CH, 103 ) <= CONVERT(datetime, "' + msk_dt_termino.Text + '", 103 ) AND ';
    qry_solic_.SQL[5] := '( CD_STATUS_SOLIC_CH = "3" OR CD_STATUS_SOLIC_CH = "4" OR CD_STATUS_SOLIC_CH = "5" ) ';
    qry_solic_.Prepare;
    qry_solic_.Open;
    if qry_solic_.RecordCount <= 0 then
    begin
      FechaTabelas;
    end;
  end;
end;

procedure Tfrm_liberacao.FechaTabelas;
begin
  with datm_liberacao do
  begin
    qry_solic_.Close;
    qry_itens_solic_.Close;
    tbl_status_item_solic_ch_.Close;
    tbl_status_solic_ch_.Close;
    qry_emp_nac_.Close;
    qry_item_.Close;
    qry_favorecido_.Close;
    qry_banco_.Close;
    qry_solic_.Close;
    qry_utilizado_.Close;
  end;
end;

procedure Tfrm_liberacao.AbreTabelas;
begin
  with datm_liberacao do
  begin
    tbl_status_item_solic_ch_.Open;
    tbl_status_solic_ch_.Open;

    qry_emp_nac_.Close;
    qry_emp_nac_.Prepare;
    qry_emp_nac_.Open;

    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;

    qry_favorecido_.Close;
    qry_favorecido_.Prepare;
    qry_favorecido_.Open;

    qry_banco_.Close;
    qry_banco_.Prepare;
    qry_banco_.Open;
  end;
end;

procedure Tfrm_liberacao.AtualizaGeral;
begin
 with datm_liberacao do
 begin
   qry_solicitado_.Close;
   qry_recebimento_.Close;
   qry_utilizado_.Close;
   qry_totaliza_.Close;

   qry_solicitado_.Open;
   qry_recebimento_.Open;
   qry_utilizado_.Open;
   qry_totaliza_.Open;
 end;
end;

procedure Tfrm_liberacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;





end.
