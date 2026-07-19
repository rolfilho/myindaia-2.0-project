unit pgad002;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, ComCtrls;

type
  Tfrm_autoriza_pagto1 = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    btn_fechar: TSpeedButton;
    btn_desmarca_todas: TSpeedButton;
    btn_marca_todas: TSpeedButton;
    btn_canc_lanc: TSpeedButton;
    pgctrl_monta_pagto: TPageControl;
    ts_destino: TTabSheet;
    lbl_banco: TLabel;
    btn_co_banco: TSpeedButton;
    lbl_favorecido: TLabel;
    btn_co_favorecido: TSpeedButton;
    msk_cd_banco: TMaskEdit;
    edt_nm_banco: TEdit;
    msk_cd_favorecido: TMaskEdit;
    edt_nm_favorecido: TEdit;
    dbgrdMontaDest: TDBGrid;
    pnl_por_destino: TPanel;
    lbl_item2: TLabel;
    lbl_valor2: TLabel;
    lbl_status2: TLabel;
    btn_co_item2: TSpeedButton;
    lbl_dt_pagto2: TLabel;
    lbl_nr_docto2: TLabel;
    dbedt_vl_pagto2: TDBEdit;
    dbedt_nm_item2: TDBEdit;
    dbedt_cd_item2: TDBEdit;
    dbedt_dt_pagto2: TDBEdit;
    dbedt_nr_docto2: TDBEdit;
    dbedt_cd_status2: TDBEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
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
    procedure dbedt_cd_destinoExit(Sender: TObject);
    procedure dbedt_cd_despachanteExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_itemClick(Sender: TObject);
    procedure btn_co_processo2Click(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure Abre_ch;
    procedure Abre_Destino;
    procedure Abre_Pagtos;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_bancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_destinoClick(Sender: TObject);
    procedure dbedt_cd_itemExit(Sender: TObject);
    procedure dbedt_cd_itemChange(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure btn_co_calculoClick(Sender: TObject);
    procedure dbedt_cd_calculoExit(Sender: TObject);
    procedure msk_nr_processoEnter(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_co_destino2Click(Sender: TObject);
    procedure btn_co_favorecido2Click(Sender: TObject);
    procedure msk_cd_destinoExit(Sender: TObject);
    procedure msk_cd_destinoEnter(Sender: TObject);
    procedure msk_cd_bancoEnter(Sender: TObject);
    procedure msk_cd_favorecidoEnter(Sender: TObject);
    procedure msk_cd_bancoExit(Sender: TObject);
    procedure msk_cd_favorecidoExit(Sender: TObject);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure btn_co_favorecidoClick(Sender: TObject);
    procedure btn_marca_todasClick(Sender: TObject);
    procedure btn_desmarca_todasClick(Sender: TObject);
    procedure msk_dt_pagtoEnter(Sender: TObject);
    procedure msk_dt_pagtoExit(Sender: TObject);
    procedure dbedt_cd_item2Change(Sender: TObject);
    procedure pgctrl_monta_pagtoChange(Sender: TObject);
    procedure btn_canc_lancClick(Sender: TObject);
  private
    function Consiste : Boolean;
    function Grava    : Boolean;
    function VerAlt   : Boolean;
    procedure Cancelar;
  public
    lNaoConsiste, st_modificar, st_incluir, st_excluir : Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    dt_solic_ch : String[10];
    nr_proc : String[18];
    hm_para_solic_ch : String[5];
    cd_unid_neg, cd_produto : String[2];
    cd_destino : String[4];
    cd_banco : String[3];
    cd_favorecido : String[5];
    dt_pagamento : String;
  end;

var
  frm_autoriza_pagto1 : Tfrm_autoriza_pagto1;
  CancelaOperacao, Cancelado, Marcando : Boolean;

implementation

uses GSMLIB, PGGP001, PGGP017, PGSM010, PGSM018, PGSM041, PGSM059, PGSM090,
     PGGP015, PGPG004, PGSM111;

{$R *.DFM}

procedure Tfrm_autoriza_pagto1.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_autoriza_pagto1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_autoriza_pagto do
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
      qry_destino_.Close;
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

procedure Tfrm_autoriza_pagto1.FormCreate(Sender: TObject);
begin
  CancelaOperacao := False;
  Cancelado       := False;

  st_modificar    := False;
  st_incluir      := False;
  st_excluir      := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir );

  { Cria o DataModule de Dados de Solicitação de Cheque }
  Application.CreateForm(Tdatm_autoriza_pagto, datm_autoriza_pagto );

  msk_dt_pagto.Text := DateToStr( dt_server );

  with datm_autoriza_pagto do
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
    Abre_ch;
  end;

  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_autoriza_pagto1.FormShow(Sender: TObject);
begin
  lNaoConsiste := False;
  pgctrl_monta_pagto.ActivePage := ts_processo;
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_produtoExit(nil);
  pgctrl_monta_pagto.SetFocus;
end;

procedure Tfrm_autoriza_pagto1.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
  btn_salvar.Enabled   := False;
  mi_salvar.Enabled    := False;
  btn_cancelar.Enabled := False;
  mi_cancelar.Enabled  := False;
  if Marcando then CancelaOperacao := True;
end;

procedure Tfrm_autoriza_pagto1.Cancelar;
begin
  try
    if datm_autoriza_pagto.qry_solic_pagto_.State in [dsInsert, dsEdit] then
    begin
      datm_autoriza_pagto.qry_solic_pagto_.Cancel;
      msk_nr_processo.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
end;

procedure Tfrm_autoriza_pagto1.btn_salvarClick(Sender: TObject);
begin
  pnl_cadastro.SetFocus;
  if Not Consiste then Exit;
  if Not Grava then Exit;
  btn_desmarca_todasClick(nil);
end;

function Tfrm_autoriza_pagto1.Consiste : Boolean;
begin
  Consiste := True;

  if pgctrl_monta_pagto.ActivePage = ts_processo then
  begin
    if datm_autoriza_pagto.qry_solic_pagto_.State in [dsInsert, dsEdit] then {Solicitação}
    begin
      if Not lNaoConsiste then
      begin
        {Destino}
        if dbedt_cd_destino.Text = '' then
        begin
          BoxMensagem('Campo Destino deve ser preenchido!', 2);
          dbedt_cd_destino.SetFocus;
          Consiste := False;
          Exit;
        end;
      end
      else
      begin
        datm_autoriza_pagto.qry_destino_.Close;
        datm_autoriza_pagto.qry_destino_.SQL[2] := 'WHERE CD_DESTINO <> ""';
        datm_autoriza_pagto.qry_destino_.Prepare;
        datm_autoriza_pagto.qry_destino_.Open;
      end;
      if Not ( datm_autoriza_pagto.qry_solic_pagto_.State in [dsEdit, dsInsert] ) then Exit;
      ValidCodigo( dbedt_cd_destino );
      if dbedt_cd_destino.Text <> '' then
      begin
        if dbedt_nm_destino.Text = '' then
        begin
          BoxMensagem('Código do Destino inválido!',2);
          dbedt_cd_destino.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      {Item}
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

      if Not ( datm_autoriza_pagto.qry_solic_pagto_.State in [dsEdit, dsInsert] ) then Exit;
      ValidCodigo( dbedt_cd_item );
      if dbedt_cd_item.Text <> '' then
      begin
        if ( dbedt_nm_item.Text = '' ) then
//           ( datm_autoriza_pagto.qry_solic_pagto_Look_IN_SOLIC_CHQ.AsString <> '1' ) then
        begin
          BoxMensagem('Código do Item inválido!',2);
          dbedt_cd_item.SetFocus;
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
          dbedt_cd_favorecido.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      if Not ( datm_autoriza_pagto.qry_solic_pagto_.State in [dsEdit, dsInsert] ) then Exit;
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

      if Not lNaoConsiste then
      begin
        {Banco}
        if dbedt_cd_banco.Text = '' then
        begin
          BoxMensagem('Campo Banco deve ser preenchido!', 2);
          dbedt_cd_banco.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      if Not ( datm_autoriza_pagto.qry_solic_pagto_.State in [dsEdit, dsInsert] ) then Exit;
      ValidCodigo( dbedt_cd_banco );
      if dbedt_cd_banco.Text <> '' then
      begin
        if dbedt_nm_banco.Text = '' then
        begin
          BoxMensagem('Código do Banco inválido!',2);
          dbedt_cd_banco.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end;
  if pgctrl_monta_pagto.ActivePage = ts_processo then
  begin
  end;
end;

function Tfrm_autoriza_pagto1.Grava : Boolean;
var
  Falha : Boolean;
begin
  Falha := False;
  Grava := False;
  if datm_autoriza_pagto.qry_solic_pagto_.State in [dsInsert, dsEdit] then {Montagem por Processo}
  begin
    try
      datm_main.db_broker.StartTransaction;
      with datm_autoriza_pagto do
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
        TrataErro(E);
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_autoriza_pagto.qry_solic_pagto_.Cancel;
        Grava := False;
      end;
    end;
    btn_mi( st_incluir, False, False, st_excluir );
  end;

  if datm_autoriza_pagto.qry_solic_dest_.State in [dsInsert, dsEdit] then {Montagem por Destino}
  begin
    try
      datm_main.db_broker.StartTransaction;
      with datm_autoriza_pagto do
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
           qry_solic_dest_CD_STATUS.AsString := '5';  // Solicitado fora do horário

        qry_solic_dest_.Post;
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
        TrataErro(E);
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_autoriza_pagto.qry_solic_dest_.Cancel;
        Grava := False;
      end;
    end;
    btn_mi( st_incluir, False, False, st_excluir );
  end;

end;

procedure Tfrm_autoriza_pagto1.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled   := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled := Canc;
end;

procedure Tfrm_autoriza_pagto1.dbnvgBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if datm_autoriza_pagto.qry_solic_pagto_.State in [dsInsert, dsEdit] then
     datm_autoriza_pagto.qry_solic_pagto_.Cancel;
end;

procedure Tfrm_autoriza_pagto1.dbedt_cd_bancoExit(Sender: TObject);
begin
  with datm_autoriza_pagto do
  begin
    qry_banco_.Close;
    qry_banco_.SQL[2] := 'WHERE CD_BANCO <> ""';
    qry_banco_.Prepare;
    qry_banco_.Open;
  end;
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_autoriza_pagto1.dbedt_cd_favorecidoExit(Sender: TObject);
begin
  with datm_autoriza_pagto do
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

procedure Tfrm_autoriza_pagto1.dbedt_cd_destinoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_autoriza_pagto1.dbedt_cd_despachanteExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_autoriza_pagto1.msk_cd_unid_negExit(Sender: TObject);
begin
  if Trim( msk_cd_unid_neg.Text ) = cd_unid_neg then Exit;
  if Trim( msk_cd_unid_neg.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_unid_neg );
    with datm_autoriza_pagto do
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

procedure Tfrm_autoriza_pagto1.msk_cd_produtoExit(Sender: TObject);
begin
  if Trim( msk_cd_produto.Text ) = cd_produto then Exit;
  if Trim( msk_cd_produto.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_produto );
    with datm_autoriza_pagto do
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

procedure Tfrm_autoriza_pagto1.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_autoriza_pagto do
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

procedure Tfrm_autoriza_pagto1.btn_co_produtoClick(Sender: TObject);
begin
  with datm_autoriza_pagto do
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

procedure Tfrm_autoriza_pagto1.btn_co_itemClick(Sender: TObject);
begin
  str_cd_modulo := '22';
  str_cd_rotina := '2214';
  Application.CreateForm(Tfrm_item, frm_item);
  frm_item.Cons_OnLine := datm_autoriza_pagto.qry_solic_pagto_CD_ITEM;
  frm_item.lRecDesp := True;
  with frm_item do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_autoriza_pagto.qry_solic_pagto_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_autoriza_pagto.qry_solic_pagto_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_autoriza_pagto do
  begin
    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;
  end;
  str_cd_modulo := '26';
  str_cd_rotina := '2602';
  dbedt_cd_itemExit(nil);
end;

procedure Tfrm_autoriza_pagto1.btn_co_processo2Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_consulta_processo,frm_consulta_processo);
  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := msk_cd_produto.Text;
  frm_consulta_processo.lLiberado   := True;

  frm_consulta_processo.ShowModal;

  Screen.Cursor := crHourGlass;

//  Application.ProcessMessages;

  if (frm_consulta_processo.Nr_Processo <> '') then
  begin
    msk_nr_processo.Text := Copy( frm_consulta_processo.Nr_Processo, 5, 14) ;
    msk_nr_processoExit(nil);
  end;
end;

procedure Tfrm_autoriza_pagto1.msk_nr_processoExit(Sender: TObject);
begin
  if ( nr_proc = msk_nr_processo.Text ) or ( datm_autoriza_pagto.qry_solic_pagto_.State in [dsInsert] ) then Exit;

  if msk_nr_processo.Text <> '' then
  begin
    with datm_autoriza_pagto do
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;
      if qry_processo_.RecordCount > 0 then
      begin
        edt_cd_cliente.Text  := qry_processo_CD_CLIENTE.AsString;
        edt_nm_cliente.Text  := qry_processo_LookCliente.AsString;
        edt_cd_servico.Text  := qry_processo_CD_SERVICO.AsString;
        edt_nm_servico.Text  := qry_processo_LookServico.AsString;
{        CloseStoredProc( sp_atz_solic_pagto );
        sp_atz_solic_pagto.ParamByName('@NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
        ExecStoredProc( sp_atz_solic_pagto );
        CloseStoredProc( sp_atz_solic_pagto );
        {Procurar DI}
        Abre_ch;
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

function Tfrm_autoriza_pagto1.VerAlt;
begin
  VerAlt := True;
  if datm_autoriza_pagto.qry_solic_pagto_.State in [dsInsert, dsEdit] then
  begin
   if ( ( datm_autoriza_pagto.qry_solic_pagto_.State in [dsEdit] ) and st_modificar ) or
       ( datm_autoriza_pagto.qry_solic_pagto_.State in [dsInsert] ) then
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

procedure Tfrm_autoriza_pagto1.Abre_ch;
var cd_item : String[3];
begin
  with datm_autoriza_pagto do
  begin
    cd_item := qry_solic_pagto_CD_ITEM.AsString;
    qry_grd_pagto_.Close;
    qry_grd_pagto_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
    qry_grd_pagto_.Prepare;
    qry_grd_pagto_.Open;
    qry_grd_pagto_.Locate( 'CD_ITEM', cd_item, [loCaseInsensitive] );

    qry_solic_pagto_.Close;
    qry_solic_pagto_.Prepare;
    qry_solic_pagto_.Open;

    qry_destino_.Close;
    qry_destino_.SQL[2] := 'WHERE CD_DESTINO <> ""';
    qry_destino_.Prepare;
    qry_destino_.Open;
    Abre_Pagtos;
  end;
end;

procedure Tfrm_autoriza_pagto1.Abre_Destino;
var cd_item : String[3];
begin
  with datm_autoriza_pagto do
  begin
    cd_item := qry_solic_dest_CD_ITEM.AsString;
    qry_grd_dest_.Close;
    qry_grd_dest_.ParamByName('CD_DESTINO').AsString    := msk_cd_destino.Text;
    qry_grd_dest_.ParamByName('CD_FAVORECIDO').AsString := msk_cd_favorecido.Text;
    qry_grd_dest_.ParamByName('CD_BANCO').AsString      := msk_cd_banco.Text;
    qry_grd_dest_.Prepare;
    qry_grd_dest_.Open;
    qry_grd_dest_.Locate( 'CD_ITEM', cd_item, [loCaseInsensitive] );

    qry_solic_dest_.Close;
    qry_solic_dest_.Prepare;
    qry_solic_dest_.Open;
    Abre_Pagtos;
  end;
end;

procedure Tfrm_autoriza_pagto1.Abre_Pagtos;
var nr_ref : String[10];
    cd_item : String[3];
begin
  with datm_autoriza_pagto do
  begin
    if msk_dt_pagto.Text = '  /  /    ' then Exit;
    nr_ref  := qry_ref_NR_REF.AsString;
    cd_item := qry_ref_itens_CD_ITEM.AsString;
    qry_ref_.Close;
    qry_ref_.ParamByName('DT_PAGTO').AsDate := StrToDate( msk_dt_pagto.Text );
    qry_ref_.Prepare;
    qry_ref_.Open;
    qry_ref_.Locate( 'NR_REF', nr_ref, [loCaseInsensitive] );
    qry_ref_itens_.Close;
    qry_ref_itens_.Prepare;
    qry_ref_itens_.Open;
    qry_ref_itens_.Locate( 'CD_ITEM', cd_item, [loCaseInsensitive] );
    qry_solic_item_.Close;
    qry_solic_item_.Prepare;
    qry_solic_item_.Open;
    qry_solic_item_.Locate( 'CD_ITEM', cd_item, [loCaseInsensitive] );
  end;
end;

procedure Tfrm_autoriza_pagto1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_autoriza_pagto1.dbedt_cd_bancoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg     then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto      then btn_co_produtoClick(nil);
    if Sender = msk_nr_processo     then btn_co_processo2Click(nil);
    if Sender = msk_cd_destino      then btn_co_destino2Click(nil);
    if Sender = msk_cd_banco        then btn_co_bancoClick(nil);
    if Sender = msk_cd_favorecido   then btn_co_favorecidoClick(nil);
    if Sender = dbedt_cd_destino    then btn_co_destinoClick(nil);
    if Sender = dbedt_cd_item       then btn_co_itemClick(nil);
    if Sender = dbedt_cd_item       then btn_co_itemClick(nil);
    if Sender = dbedt_cd_calculo    then btn_co_calculoClick(nil);
    if Sender = dbedt_cd_favorecido then btn_co_favorecido2Click(nil);
  end;
end;

procedure Tfrm_autoriza_pagto1.btn_co_destinoClick(Sender: TObject);
begin
  str_cd_modulo := '22';
  str_cd_rotina := '2234';
  Application.CreateForm(Tfrm_destino, frm_destino);
  frm_destino.Cons_OnLine := datm_autoriza_pagto.qry_solic_pagto_CD_DESTINO;
  with frm_destino do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_autoriza_pagto.qry_solic_pagto_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_autoriza_pagto.qry_solic_pagto_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_autoriza_pagto do
  begin
    qry_destino_.Close;
    qry_destino_.Prepare;
    qry_destino_.Open;
  end;
  str_cd_modulo := '26';
  str_cd_rotina := '2602';
  dbedt_cd_destinoExit(nil);
end;

procedure Tfrm_autoriza_pagto1.dbedt_cd_itemExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_autoriza_pagto1.dbedt_cd_itemChange(Sender: TObject);
begin
  if datm_autoriza_pagto.qry_solic_pagto_.State in [ dsInsert, dsEdit ] then
  begin
    btn_salvar.Enabled   := True;
    mi_salvar.Enabled    := True;
    btn_cancelar.Enabled := True;
    mi_cancelar.Enabled  := True;
  end;
end;

procedure Tfrm_autoriza_pagto1.msk_cd_unid_negEnter(Sender: TObject);
begin
  cd_unid_neg := msk_cd_unid_neg.Text;
end;

procedure Tfrm_autoriza_pagto1.msk_cd_produtoEnter(Sender: TObject);
begin
  cd_produto := msk_cd_produto.Text;
end;

procedure Tfrm_autoriza_pagto1.btn_co_calculoClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TCALCULO',
                datm_autoriza_pagto.qry_solic_pagto_CD_CALCULO,
                'Tipo de Cálculo', 7, '','TTable');
end;

procedure Tfrm_autoriza_pagto1.dbedt_cd_calculoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;


procedure Tfrm_autoriza_pagto1.msk_nr_processoEnter(Sender: TObject);
begin
  nr_proc := msk_nr_processo.Text;
end;

procedure Tfrm_autoriza_pagto1.btn_fecharClick(Sender: TObject);
var
  i : Integer;
  Erro: Boolean;
  cd_banco: String[3];
  cd_favorecido: String[5];
begin
  with datm_autoriza_pagto do
  begin
    if pgctrl_monta_pagto.ActivePage = ts_processo then
    begin
      Erro := False;
      for i := 0 to dbgrdMontaPagto.SelectedRows.Count - 1 do
      begin
        TTable(dbgrdMontaPagto.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdMontaPagto.SelectedRows[i]));
        if qry_solic_pagto_CD_DESTINO.AsString = '' then
        begin
          BoxMensagem('Item: ' + Trim( qry_solic_pagto_LookItem.AsString ) + #13#10 +
                      'Campo Destino deve ser informado', 2);
          Erro := True;
          Break;
        end;
        if qry_solic_pagto_CD_FAVORECIDO.AsString = '' then
        begin
          BoxMensagem('Item: ' + Trim( qry_solic_pagto_LookItem.AsString ) + #13#10 +
                      'Campo Favorecido deve ser informado', 2);
          Erro := True;
          Break;
        end;
        if qry_solic_pagto_CD_BANCO.AsString = '' then
        begin
          BoxMensagem('Item: ' + Trim( qry_solic_pagto_LookItem.AsString ) + #13#10 +
                      'Campo Banco deve ser informado', 2);
          Erro := True;
          Break;
        end;
      end;
      if Erro then Exit;

      { Verificar se existe mais de um Favorecido X Banco }
      cd_banco      := '';
      cd_favorecido := '';
      for i := 0 to dbgrdMontaPagto.SelectedRows.Count - 1 do
      begin
        cd_banco      := qry_solic_pagto_CD_BANCO.AsString;
        cd_favorecido := qry_solic_pagto_CD_FAVORECIDO.AsString;
        TTable(dbgrdMontaPagto.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdMontaPagto.SelectedRows[i]));
        if ( cd_banco      <> qry_solic_pagto_CD_BANCO.AsString ) or
           ( cd_favorecido <> qry_solic_pagto_CD_FAVORECIDO.AsString ) then
        begin
          BoxMensagem('Existem mais de um Banco X Favorecido!' + #13#10 +
                      'Não será possível gerar Pagamento', 2);
          Exit;
        end;
      end;

      Marcando             := True;
      btn_cancelar.Enabled := True;
      mi_cancelar.Enabled  := True;

      try
        datm_main.db_broker.StartTransaction;
        qry_ult_ref_.Close;
        qry_ult_ref_.Prepare;
        qry_ult_ref_.Open;

        if dbgrdMontaPagto.SelectedRows.Count > 0 then
           TTable(dbgrdMontaPagto.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdMontaPagto.SelectedRows[0]));
        for i := 0 to dbgrdMontaPagto.SelectedRows.Count - 1 do
        begin
          if Not ( qry_solic_pagto_.State in [dsEdit, dsInsert] ) then
             qry_solic_pagto_.Edit;
          qry_solic_pagto_CD_USUARIO_MONTA.AsString := str_cd_usuario;
          qry_solic_pagto_DT_PAGTO.AsDateTime       := Date;
          if qry_solic_pagto_TP_DESTINO.AsString = '0' then  {Terceiros}
          begin
            qry_solic_pagto_CD_STATUS.AsString      := '7'; {Pago}
            qry_solic_pagto_DT_PAGTO.AsDateTime     := Date;
            qry_solic_pagto_NR_REF.AsString         := 'T';
          end;
          if qry_solic_pagto_TP_DESTINO.AsString = '1' then {Débito em Conta}
          begin
            qry_solic_pagto_NR_REF.AsString           := 'D';
          end;
          if qry_solic_pagto_TP_DESTINO.AsString = '2' then     {Comissária}
          begin
            qry_solic_pagto_NR_REF.AsString           := qry_ult_ref_ULT_REF.AsString;
          end;
          if qry_solic_pagto_TP_DESTINO.AsString = '3' then
          begin
            qry_solic_pagto_NR_REF.AsString           := 'C'; {Débito em Conta da Comissária}
          end;
          qry_solic_pagto_.Post;

          CloseStoredProc( datm_autoriza_pagto.sp_proc_itens_monta_pagto );
          datm_autoriza_pagto.sp_proc_itens_monta_pagto.ParamByName('@NR_PROCESSO').AsString :=
              msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
          datm_autoriza_pagto.sp_proc_itens_monta_pagto.ParamByName('@CD_ITEM').AsString     :=
              dbedt_cd_item.Text;
          ExecStoredProc( datm_autoriza_pagto.sp_proc_itens_monta_pagto );
          CloseStoredProc( datm_autoriza_pagto.sp_proc_itens_monta_pagto );

          if CancelaOperacao then
          begin
            if BoxMensagem('Cancela a operação?', 1) then
            begin
              Cancelado            := True;
              CancelaOperacao      := False;
              Marcando             := False;
              btn_cancelar.Enabled := False;
              mi_cancelar.Enabled  := False;
              Close;
              Exit;
            end
            else CancelaOperacao   := False;
          end;

          dbgrdMontaPagto.SelectedRows.CurrentRowSelected := False;
          if dbgrdMontaPagto.SelectedRows.Count > 0 then
            TTable(dbgrdMontaPagto.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdMontaPagto.SelectedRows[0]))
          else Break;
        end;
        datm_main.db_broker.Commit;
      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      end;
      Marcando             := False;
      CancelaOperacao      := False;
      Cancelado            := False;
      btn_cancelar.Enabled := False;
      mi_cancelar.Enabled  := False;
      Abre_ch;
    end;

    if pgctrl_monta_pagto.ActivePage = ts_destino then
    begin
      Marcando             := True;
      btn_cancelar.Enabled := True;
      mi_cancelar.Enabled  := True;

      try
        datm_main.db_broker.StartTransaction;
        qry_ult_ref_.Close;
        qry_ult_ref_.Prepare;
        qry_ult_ref_.Open;

        if dbgrdMontaDest.SelectedRows.Count > 0 then
           TTable(dbgrdMontaDest.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdMontaDest.SelectedRows[0]));
        for i := 0 to dbgrdMontaDest.SelectedRows.Count - 1 do
        begin
          if Not ( qry_solic_dest_.State in [dsEdit, dsInsert] ) then
             qry_solic_dest_.Edit;
          qry_solic_dest_CD_USUARIO_MONTA.AsString := str_cd_usuario;
          qry_solic_dest_DT_PAGTO.AsDateTime       := Date;
          if qry_solic_dest_TP_DESTINO.AsString = '0' then  {Terceiros}
          begin
            qry_solic_dest_NR_REF.AsString         := 'T';
          end;
          if qry_solic_dest_TP_DESTINO.AsString = '1' then {Débito em Conta}
          begin
            qry_solic_dest_NR_REF.AsString         := 'D';
          end;
          if qry_solic_dest_TP_DESTINO.AsString = '2' then     {Comissária}
          begin
            qry_solic_dest_NR_REF.AsString         := qry_ult_ref_ULT_REF.AsString;
          end;
          if qry_solic_dest_TP_DESTINO.AsString = '3' then {Débito em Conta da Comissária}
          begin
            qry_solic_dest_NR_REF.AsString         := 'C';
          end;
          qry_solic_dest_.Post;

          CloseStoredProc( datm_autoriza_pagto.sp_proc_itens_monta_pagto );
          datm_autoriza_pagto.sp_proc_itens_monta_pagto.ParamByName('@NR_PROCESSO').AsString :=
              msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
          datm_autoriza_pagto.sp_proc_itens_monta_pagto.ParamByName('@CD_ITEM').AsString     :=
              dbedt_cd_item.Text;
          ExecStoredProc( datm_autoriza_pagto.sp_proc_itens_monta_pagto );
          CloseStoredProc( datm_autoriza_pagto.sp_proc_itens_monta_pagto );

          if CancelaOperacao then
          begin
            if BoxMensagem('Cancela a operação?', 1) then
            begin
              Cancelado            := True;
              CancelaOperacao      := False;
              Marcando             := False;
              btn_cancelar.Enabled := False;
              mi_cancelar.Enabled  := False;
              Close;
              Exit;
            end
            else CancelaOperacao   := False;
          end;

          dbgrdMontaDest.SelectedRows.CurrentRowSelected := False;
          if dbgrdMontaDest.SelectedRows.Count > 0 then
            TTable(dbgrdMontaDest.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdMontaDest.SelectedRows[0]))
          else Break;
        end;
        datm_main.db_broker.Commit;
      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      end;
      Marcando             := False;
      CancelaOperacao      := False;
      Cancelado            := False;
      btn_cancelar.Enabled := False;
      mi_cancelar.Enabled  := False;
      Abre_Destino;
    end;
  end;
end;

procedure Tfrm_autoriza_pagto1.btn_co_destino2Click(Sender: TObject);
begin
  with datm_autoriza_pagto do
  begin
    Application.CreateForm(Tfrm_destino, frm_destino );
    with frm_destino do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_destino.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_destino.Text := frm_destino.Cons_OnLine_Texto;
      msk_cd_destinoExit(nil);
    end;
  end;
end;

procedure Tfrm_autoriza_pagto1.btn_co_favorecido2Click(Sender: TObject);
begin
  str_cd_modulo := '22';
  str_cd_rotina := '2208';
  Application.CreateForm(Tfrm_Favor, frm_Favor);
  frm_Favor.Cons_OnLine := datm_autoriza_pagto.qry_solic_pagto_CD_FAVORECIDO;
  with frm_Favor do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_autoriza_pagto.qry_solic_pagto_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_autoriza_pagto.qry_solic_pagto_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_autoriza_pagto do
  begin
    qry_favorecido_.Close;
    qry_favorecido_.Prepare;
    qry_favorecido_.Open;
  end;
  str_cd_modulo := '26';
  str_cd_rotina := '2602';
  dbedt_cd_favorecidoExit(nil);
end;

procedure Tfrm_autoriza_pagto1.msk_cd_destinoExit(Sender: TObject);
begin
  if Trim( msk_cd_destino.Text ) = cd_destino then Exit;
  if Trim( msk_cd_destino.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_destino );
    with datm_autoriza_pagto do
    begin
      qry_destino_.Close;
      qry_destino_.SQL[2] := 'WHERE D.CD_FAVORECIDO *= F.CD_FAVORECIDO AND CD_DESTINO = "' + msk_cd_destino.Text + '"';
      qry_destino_.Prepare;
      qry_destino_.Open;
      if qry_destino_.RecordCount > 0 then
      begin
        edt_nm_destino.Text := qry_destino_NM_DESTINO.AsString;
        if Trim( qry_destino_CD_BANCO.AsString ) <> '' then
        begin
          msk_cd_banco.Text      := qry_destino_CD_BANCO.AsString;
          msk_cd_bancoExit(nil);
        end;
        if Trim( qry_destino_CD_FAVORECIDO.AsString ) <> '' then
        begin
          msk_cd_favorecido.Text := qry_destino_CD_FAVORECIDO.AsString;
          msk_cd_favorecidoExit(nil);
        end;
        if ( Trim( msk_cd_destino.Text ) <>  '' )    and
           ( Trim( msk_cd_favorecido.Text ) <>  '' ) and
           ( Trim( msk_cd_banco.Text ) <>  '' )      then
        begin
          Abre_Destino;
        end;
      end
      else
      begin
        BoxMensagem('Destino não cadastrado!', 2);
        edt_nm_destino.Text := '';
        msk_cd_destino.SetFocus;
        Exit;
      end;
    end
  end
  else
  begin
    edt_nm_destino.Text := '';
  end;
end;

procedure Tfrm_autoriza_pagto1.msk_cd_destinoEnter(Sender: TObject);
begin
  cd_destino := msk_cd_destino.Text;
end;

procedure Tfrm_autoriza_pagto1.msk_cd_bancoEnter(Sender: TObject);
begin
  cd_banco := msk_cd_banco.Text;
end;

procedure Tfrm_autoriza_pagto1.msk_cd_favorecidoEnter(Sender: TObject);
begin
  cd_favorecido := msk_cd_favorecido.Text;
end;

procedure Tfrm_autoriza_pagto1.msk_cd_bancoExit(Sender: TObject);
begin
  if Trim( msk_cd_banco.Text ) = cd_banco then Exit;
  if Trim( msk_cd_banco.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_banco );
    with datm_autoriza_pagto do
    begin
      qry_banco_.Close;
      qry_banco_.SQL[2] := 'WHERE CD_BANCO = "' + msk_cd_banco.Text + '"';
      qry_banco_.Prepare;
      qry_banco_.Open;
      if qry_banco_.RecordCount > 0 then
      begin
        edt_nm_banco.Text := qry_banco_NM_BANCO.AsString;
        if ( Trim( msk_cd_destino.Text ) <>  '' )    and
           ( Trim( msk_cd_favorecido.Text ) <>  '' ) and
           ( Trim( msk_cd_banco.Text ) <>  '' )      then
        begin
          Abre_Destino;
        end;
        qry_banco_.Close;
        qry_banco_.SQL[2] := 'WHERE CD_BANCO = "' + msk_cd_banco.Text + '"';
        qry_banco_.Prepare;
        qry_banco_.Open;
      end
      else
      begin
        BoxMensagem('Banco não cadastrado!', 2);
        edt_nm_banco.Text := '';
        msk_cd_banco.SetFocus;
        qry_banco_.Close;
        qry_banco_.SQL[2] := 'WHERE CD_BANCO <> ""';
        qry_banco_.Prepare;
        qry_banco_.Open;
        Exit;
      end;
    end
  end
  else
  begin
    edt_nm_banco.Text := '';
  end;
end;

procedure Tfrm_autoriza_pagto1.msk_cd_favorecidoExit(Sender: TObject);
begin
  if Trim( msk_cd_favorecido.Text ) = cd_favorecido then Exit;
  if Trim( msk_cd_favorecido.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_favorecido );
    with datm_autoriza_pagto do
    begin
      qry_favorecido_.Close;
      qry_favorecido_.SQL[2] := 'WHERE CD_FAVORECIDO = "' + msk_cd_favorecido.Text + '"';
      qry_favorecido_.Prepare;
      qry_favorecido_.Open;
      if qry_favorecido_.RecordCount > 0 then
      begin
        edt_nm_favorecido.Text := qry_favorecido_NM_FAVORECIDO.AsString;
        if Trim( qry_destino_CD_BANCO.AsString ) <> '' then
        begin
          msk_cd_banco.Text      := qry_destino_CD_BANCO.AsString;
          msk_cd_bancoExit(nil);
        end;
        if ( Trim( msk_cd_destino.Text ) <>  '' )    and
           ( Trim( msk_cd_favorecido.Text ) <>  '' ) and
           ( Trim( msk_cd_banco.Text ) <>  '' )      then
        begin
          Abre_Destino;
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

procedure Tfrm_autoriza_pagto1.btn_co_bancoClick(Sender: TObject);
begin
  with datm_autoriza_pagto do
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

procedure Tfrm_autoriza_pagto1.btn_co_favorecidoClick(Sender: TObject);
begin
  with datm_autoriza_pagto do
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

procedure Tfrm_autoriza_pagto1.btn_marca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Visible    := False;
  btn_desmarca_todas.Visible := True;
  btn_desmarca_todas.Left    := btn_marca_todas.Left;
  if pgctrl_monta_pagto.ActivePage = ts_processo then
  begin
    if Not ( datm_autoriza_pagto.qry_grd_pagto_.RecordCount > 0 ) then Exit;
    datm_autoriza_pagto.qry_grd_pagto_.First;
    for i := 0 to datm_autoriza_pagto.qry_grd_pagto_.RecordCount - 1 do
    begin
      dbgrdMontaPagto.SelectedRows.CurrentRowSelected := True;
      datm_autoriza_pagto.qry_grd_pagto_.Next;
    end;
  end;
  if pgctrl_monta_pagto.ActivePage = ts_destino then
  begin
    if Not ( datm_autoriza_pagto.qry_grd_dest_.RecordCount > 0 ) then Exit;
    datm_autoriza_pagto.qry_grd_dest_.First;
    for i := 0 to datm_autoriza_pagto.qry_grd_dest_.RecordCount - 1 do
    begin
      dbgrdMontaDest.SelectedRows.CurrentRowSelected := True;
      datm_autoriza_pagto.qry_grd_dest_.Next;
    end;
  end;
end;

procedure Tfrm_autoriza_pagto1.btn_desmarca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Visible    := True;
  btn_desmarca_todas.Visible := False;
  if pgctrl_monta_pagto.ActivePage = ts_processo then
  begin
    if dbgrdMontaPagto.SelectedRows.Count > 0 then
       TTable(dbgrdMontaPagto.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdMontaPagto.SelectedRows[0]));
    for i := 0 to dbgrdMontaPagto.SelectedRows.Count - 1 do
    begin
      dbgrdMontaPagto.SelectedRows.CurrentRowSelected := False;
      if dbgrdMontaPagto.SelectedRows.Count > 0 then
        TTable(dbgrdMontaPagto.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdMontaPagto.SelectedRows[0]))
      else Break;
    end;
  end;
  if pgctrl_monta_pagto.ActivePage = ts_destino then
  begin
    if dbgrdMontaPagto.SelectedRows.Count > 0 then
       TTable(dbgrdMontaDest.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdMontaDest.SelectedRows[0]));
    for i := 0 to dbgrdMontaDest.SelectedRows.Count - 1 do
    begin
      dbgrdMontaDest.SelectedRows.CurrentRowSelected := False;
      if dbgrdMontaDest.SelectedRows.Count > 0 then
        TTable(dbgrdMontaDest.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdMontaDest.SelectedRows[0]))
      else Break;
    end;
  end;
end;

procedure Tfrm_autoriza_pagto1.msk_dt_pagtoEnter(Sender: TObject);
begin
  dt_pagamento := msk_dt_pagto.Text;
end;

procedure Tfrm_autoriza_pagto1.msk_dt_pagtoExit(Sender: TObject);
begin
  if msk_dt_pagto.Text = dt_pagamento then Exit;
  Abre_Pagtos;
end;

procedure Tfrm_autoriza_pagto1.dbedt_cd_item2Change(Sender: TObject);
begin
  if datm_autoriza_pagto.qry_solic_dest_.State in [ dsInsert, dsEdit ] then
  begin
    btn_salvar.Enabled   := True;
    mi_salvar.Enabled    := True;
    btn_cancelar.Enabled := True;
    mi_cancelar.Enabled  := True;
  end;
end;

procedure Tfrm_autoriza_pagto1.pgctrl_monta_pagtoChange(Sender: TObject);
begin
  if pgctrl_monta_pagto.ActivePage = ts_processo then
  begin
    btn_canc_lanc.Enabled := False;
    with datm_autoriza_pagto do
    begin
      qry_destino_.Close;
      qry_destino_.SQL[2] := 'WHERE CD_DESTINO <> ""';
      qry_destino_.Prepare;
      qry_destino_.Open;
    end;
  end;

  if pgctrl_monta_pagto.ActivePage = ts_destino then
  begin
    btn_canc_lanc.Enabled := False;
  end;

  if pgctrl_monta_pagto.ActivePage = ts_ref then
  begin
    btn_canc_lanc.Enabled := True;
  end;
end;

procedure Tfrm_autoriza_pagto1.btn_canc_lancClick(Sender: TObject);
begin
  with datm_autoriza_pagto do
  begin
    if Not BoxMensagem( 'Confirma cancelamento do item ' + qry_ref_itens_LookItem.AsString + '?', 1) then Exit;

    if qry_solic_item_CD_STATUS.AsString = '7' then
    begin
      BoxMensagem('Item pago!', 2);
      Exit;
    end;

    if ( qry_solic_item_CD_STATUS.AsString = '4' ) or  ( qry_solic_item_CD_STATUS.AsString = '17' ) then
    begin
      BoxMensagem('Item cancelado!', 2);
      Exit;
    end;

    try
      datm_main.db_broker.StartTransaction;
      if Not ( qry_solic_item_.State in [dsedit, dsInsert] ) then qry_solic_item_.Edit;
      begin
        qry_solic_item_CD_STATUS.AsString := '4';
        qry_solic_item_.Post;
      end;
      CloseStoredProc(sp_atualiza_utilizado);
      sp_atualiza_utilizado.ParamByName('@nr_processo').AsString := qry_solic_item_NR_PROCESSO.AsString;
      sp_atualiza_utilizado.ParamByName('@cd_item').AsString     := qry_solic_item_CD_ITEM.AsString;
      sp_atualiza_utilizado.ParamByName('@vl_valor').AsFloat     := qry_solic_item_VL_PAGTO.AsFloat;
      sp_atualiza_utilizado.ParamByName('@operacao').AsString    := '-';
      ExecStoredProc(sp_atualiza_utilizado);
      CloseStoredProc(sp_atualiza_utilizado);
      datm_main.db_broker.Commit;
    except
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      qry_solic_item_.Cancel;
    end;

    Abre_Pagtos;

  end;
end;





end.
