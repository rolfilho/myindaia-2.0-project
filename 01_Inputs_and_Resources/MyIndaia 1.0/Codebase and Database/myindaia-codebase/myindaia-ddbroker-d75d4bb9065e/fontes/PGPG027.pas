unit PGPG027;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Db, StdCtrls, Mask, ExtCtrls, UCRPE32, ComCtrls, Funcoes;

type
  Tfrm_sel_pagtos = class(TForm)
    Panel1: TPanel;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    btn_imprimir: TButton;
    btn_sair: TButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    crp_unid_prod: TCrpe;
    lbl_periodo: TLabel;
    lbl_a: TLabel;
    lbl_cliente: TLabel;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    btn_co_cliente: TSpeedButton;
    lbl_grupo: TLabel;
    btn_co_grupo: TSpeedButton;
    edt_nm_grupo: TEdit;
    msk_cd_grupo: TMaskEdit;
    lbl_fav: TLabel;
    btn_co_favorecido: TSpeedButton;
    msk_cd_favorecido: TMaskEdit;
    edt_nm_favorecido: TEdit;
    lbl_grupo_item: TLabel;
    btn_co_grupo_item: TSpeedButton;
    msk_cd_grupo_item: TMaskEdit;
    edt_nm_grupo_item: TEdit;
    lbl_item: TLabel;
    btn_co_item: TSpeedButton;
    msk_cd_item: TMaskEdit;
    edt_nm_item: TEdit;
    msk_dt_inicio: TDateTimePicker;
    msk_dt_fim: TDateTimePicker;
    lbl_usuario: TLabel;
    btn_co_usuario: TSpeedButton;
    msk_cd_usuario: TMaskEdit;
    edt_nm_usuario: TEdit;
    procedure btn_sairClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure btn_co_favorecidoClick(Sender: TObject);
    procedure msk_cd_favorecidoExit(Sender: TObject);
    procedure btn_co_grupo_itemClick(Sender: TObject);
    procedure msk_cd_grupo_itemExit(Sender: TObject);
    procedure msk_cd_itemExit(Sender: TObject);
    procedure btn_co_itemClick(Sender: TObject);
    procedure msk_cd_grupo_itemChange(Sender: TObject);
    procedure msk_cd_itemChange(Sender: TObject);
    procedure msk_cd_usuarioExit(Sender: TObject);
    procedure btn_co_usuarioClick(Sender: TObject);
  private
  public
    tp_rel : Byte;
    ComPeriodo : Boolean;
    { 1 - Relação de Pagamentos }
  end;

var
  frm_sel_pagtos: Tfrm_sel_pagtos;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGPG028, PGSM010, PGSM016, PGSM018, PGSM024, PGSM059, PGSM090, PGSM119, PGSM238;

procedure Tfrm_sel_pagtos.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sel_pagtos.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = '' then
  begin
    if tp_rel in [1] then edt_nm_unid_neg.Text := 'Todas'
    else edt_nm_unid_neg.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_unid_neg );
  if msk_cd_unid_neg.Text <> '' then
  begin
    with datm_sel_pagtos do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.RecordCount > 0 then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_.FieldByName('NM_UNID_NEG').AsString;
      end
      else
      begin
        BoxMensagem( 'Unidade de Negócio não cadastrada!', 2 );
        msk_cd_unid_neg.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_unid_neg.Text := '';
  end;
end;

procedure Tfrm_sel_pagtos.msk_cd_produtoExit(Sender: TObject);
begin
  if msk_cd_produto.Text = '' then
  begin
    if tp_rel in [1] then edt_nm_produto.Text := 'Todos'
    else edt_nm_produto.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_produto );
  if msk_cd_produto.Text <> '' then
  begin
    with datm_sel_pagtos do
    begin
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
      qry_produto_.Prepare;
      qry_produto_.Open;
      if qry_produto_.RecordCount > 0 then
      begin
        edt_nm_produto.Text := qry_produto_.FieldByName('NM_PRODUTO').AsString;
      end
      else
      begin
        BoxMensagem( 'Produto não cadastrado!', 2 );
        msk_cd_produto.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_produto.Text := '';
  end;
end;

procedure Tfrm_sel_pagtos.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_sel_pagtos do
  begin
    Application.CreateForm( Tfrm_unidade, frm_unidade );
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

procedure Tfrm_sel_pagtos.btn_co_produtoClick(Sender: TObject);
begin
  with datm_sel_pagtos do
  begin
    Application.CreateForm( Tfrm_produto, frm_produto );
    with frm_produto do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_produto.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
      msk_cd_produtoExit(nil);
    end;
  end;
end;

procedure Tfrm_sel_pagtos.btn_imprimirClick(Sender: TObject);
var
  nr_identificador: integer;
begin
  nr_identificador := 0;

  if ( Trim( msk_cd_unid_neg.Text ) = '' ) and Not ( tp_rel in [9] ) then
  begin
    BoxMensagem( 'Informe uma Unidade de Negócio!', 2 );
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;

  if ( Trim( msk_cd_produto.Text ) = '' ) and Not ( tp_rel in [1] )  then
  begin
    BoxMensagem( 'Informe um Produto!', 2 );
    msk_cd_produto.SetFocus;
    Exit;
  end;

  if ( ( Trim( msk_cd_cliente.Text ) = '' ) and ( Trim( msk_cd_grupo.Text ) = '' ) ) and ( Not ( tp_rel in [1] ) ) then
  begin
    BoxMensagem( 'Informe um Cliente ou Grupo!', 2 );
    msk_cd_cliente.SetFocus;
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  with crp_unid_prod do
  begin
    //Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
    // Comentado acima e utilizando abaixo porque dava erro quando havia PONTO no login do usuário - Michel - 17/09/2010
    Connect := 'DSN=BROKER; UID=sa; PWD=123; DSQ=BROKER';

    case tp_rel of
      1: begin
           with datm_sel_pagtos do
           begin
             ReportName  := cDir_Rpt + '\CRPG008.RPT';
             CloseStoredProc( sp_rel_pagto );
             if Trim( msk_cd_unid_neg.Text ) = '' then
               sp_rel_pagto.ParamByName('@cd_unid_neg').AsString   := 'X'
             else
               sp_rel_pagto.ParamByName('@cd_unid_neg').AsString   := msk_cd_unid_neg.Text;
             if Trim( msk_cd_produto.Text ) = '' then
               sp_rel_pagto.ParamByName('@cd_produto').AsString    := 'X'
             else
               sp_rel_pagto.ParamByName('@cd_produto').AsString    := msk_cd_produto.Text;
             if Trim( msk_cd_grupo.Text ) = '' then
               sp_rel_pagto.ParamByName('@cd_grupo').AsString      := 'X'
             else
               sp_rel_pagto.ParamByName('@cd_grupo').AsString      := msk_cd_grupo.Text;
             if Trim( msk_cd_cliente.Text ) = '' then
               sp_rel_pagto.ParamByName('@cd_cliente').AsString    := 'X'
             else
               sp_rel_pagto.ParamByName('@cd_cliente').AsString    := msk_cd_cliente.Text;
             if Trim( msk_cd_favorecido.Text ) = '' then
               sp_rel_pagto.ParamByName('@cd_favorecido').AsString := 'X'
             else
               sp_rel_pagto.ParamByName('@cd_favorecido').AsString := msk_cd_favorecido.Text;
             if Trim( msk_cd_grupo_item.Text ) = '' then
               sp_rel_pagto.ParamByName('@cd_grupo_item').AsString := 'X'
             else
               sp_rel_pagto.ParamByName('@cd_grupo_item').AsString := msk_cd_grupo_item.Text;
             if Trim( msk_cd_item.Text ) = '' then
               sp_rel_pagto.ParamByName('@cd_item').AsString       := 'X'
             else
               sp_rel_pagto.ParamByName('@cd_item').AsString       := msk_cd_item.Text;
             if Trim( msk_cd_usuario.Text ) = '' then
               sp_rel_pagto.ParamByName('@cd_usuario').AsString    := 'X'
             else
               sp_rel_pagto.ParamByName('@cd_usuario').AsString    := msk_cd_usuario.Text;
             sp_rel_pagto.ParamByName('@dt_inicio').AsDate         := msk_dt_inicio.Date;
             sp_rel_pagto.ParamByName('@dt_fim').AsDate            := msk_dt_fim.Date;

             ExecStoredProc( sp_rel_pagto );
             nr_identificador := sp_rel_pagto.ParamByName('@nr_identificador').AsInteger;
             CloseStoredProc( sp_rel_pagto );

             if msk_dt_inicio.Date = msk_dt_fim.Date then
               ReportTitle := Caption + ' - ' + FormatDateTime( FData, msk_dt_inicio.Date )
             else
               ReportTitle := Caption + ' - ' + FormatDateTime( FData, msk_dt_inicio.Date ) + ' a ' +
                              FormatDateTime( FData, msk_dt_fim.Date );
           end;
         end;
    end; {end case}

    if tp_rel in [1] then Formulas[0] := 'NrIdentificador = ' + Trim( IntToStr( nr_identificador ) );

    Execute;

    with datm_sel_pagtos.qry_apaga_dados do
    begin
      if tp_rel = 1 then
        SQL.Add( 'DELETE FROM TREL_PAGTO WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR ' );
      ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
      Prepare;
      ExecSQL;
    end;

  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_sel_pagtos.FormShow(Sender: TObject);
begin
  if ComPeriodo then
  begin
    lbl_periodo.Caption    := 'Selecione um período:';
    msk_dt_inicio.Date     := dt_server;
    msk_dt_fim.Date        := dt_server;
    msk_dt_inicio.TabOrder := msk_cd_usuario.TabOrder + 1;
    msk_dt_fim.TabOrder    := msk_dt_inicio.TabOrder + 1;
  end
  else
  begin
    if tp_rel in [1] then
    begin
      lbl_periodo.Caption := 'Selecione uma data:';
      msk_dt_inicio.Date  := dt_server;
    end;
  end;

  case tp_rel of
    1 : begin
          Caption := 'Relação de Pagamentos';
        end;
  end;

  with datm_sel_pagtos do
  begin
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_unid_neg_.Prepare;
    qry_produto_.Prepare;
    qry_unid_neg_.Open;
    qry_produto_.Open;
  end;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_produtoExit(nil);

  msk_cd_grupo.SetFocus;

  lbl_a.Visible        := ComPeriodo;
  msk_dt_fim.Visible   := ComPeriodo;
end;

procedure Tfrm_sel_pagtos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  crp_unid_prod.Free;
  with datm_sel_pagtos do
  begin
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_grupo_.Close;
    qry_cliente_.Close;
    qry_favorecido_.Close;
    qry_grupo_item_.Close;
    qry_item_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_sel_pagtos.FormCreate(Sender: TObject);
begin
 { Inicializa o Data Module para Seleção de Recebimento}
  Application.CreateForm( Tdatm_sel_pagtos, datm_sel_pagtos );
end;

procedure Tfrm_sel_pagtos.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.Text = '' then
  begin
    if tp_rel in [1] then edt_nm_cliente.Text := 'Todos'
    else edt_nm_cliente.Text := '';
    Exit;
  end;
  ValCodEdt(msk_cd_cliente);
  with datm_sel_pagtos.qry_cliente_ do
  begin
    Close;
    ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    Prepare;
    Open;
    if Eof then
    begin
      BoxMensagem('Cliente não encontrado!',2);
      msk_cd_cliente.Clear;
      edt_nm_cliente.Clear;
      msk_cd_cliente.SetFocus;
    end
    else edt_nm_cliente.Text := FieldByName('AP_EMPRESA').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_pagtos.btn_co_clienteClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cliente, frm_cliente);
  with frm_cliente do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_cliente.Cons_OnLine_Texto := msk_cd_cliente.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_cliente.Text := frm_cliente.Cons_OnLine_Texto;
  end;
  msk_cd_clienteExit(nil);
  msk_cd_cliente.SetFocus;
end;

procedure Tfrm_sel_pagtos.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg   then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto    then btn_co_produtoClick(nil);
    if Sender = msk_cd_grupo      then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente    then btn_co_clienteClick(nil);
    if Sender = msk_cd_favorecido then btn_co_favorecidoClick(nil);
    if Sender = msk_cd_grupo_item then btn_co_grupo_itemClick(nil);
    if Sender = msk_cd_item       then btn_co_itemClick(nil);
    if Sender = msk_cd_usuario    then btn_co_usuarioClick(nil);
  end;
end;

procedure Tfrm_sel_pagtos.btn_co_grupoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_grupo, frm_grupo);
  with frm_grupo do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    if frm_grupo.Cons_OnLine_Texto <> '' then msk_cd_grupo.Text := frm_grupo.Cons_OnLine_Texto;
  end;
  msk_cd_grupoExit(nil);
end;

procedure Tfrm_sel_pagtos.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.Text = '' then
  begin
    if tp_rel in [1] then edt_nm_grupo.Text := 'Todos'
    else edt_nm_grupo.Text := '';
    Exit;
  end;
  ValCodEdt(msk_cd_grupo);
  with datm_sel_pagtos.qry_grupo_ do
  begin
    Close;
    ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Grupo de Clientes não encontrado!',2);
      msk_cd_grupo.Clear;
      msk_cd_grupo.SetFocus;
    end
    else edt_nm_grupo.Text:= FieldByName('NM_GRUPO').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_pagtos.msk_cd_grupoChange(Sender: TObject);
begin
  if msk_cd_grupo.Text = '' then
  begin
    msk_cd_cliente.Color   := clWindow;
    msk_cd_cliente.Enabled := True;
    msk_cd_cliente.TabStop := True;
    btn_co_cliente.Enabled := True;
  end
  else
  begin
    edt_nm_cliente.Text    := '';
    msk_cd_cliente.Color   := clMenu;
    msk_cd_cliente.Enabled := False;
    msk_cd_cliente.TabStop := False;
    btn_co_cliente.Enabled := False;
  end;
end;

procedure Tfrm_sel_pagtos.msk_cd_clienteChange(Sender: TObject);
begin
  if msk_cd_cliente.Text = '' then
  begin
    msk_cd_grupo.Color   := clWindow;
    msk_cd_grupo.Enabled := True;
    msk_cd_grupo.TabStop := True;
    btn_co_grupo.Enabled := True;
  end
  else
  begin
    edt_nm_grupo.Text    := '';
    msk_cd_grupo.Color   := clMenu;
    msk_cd_grupo.Enabled := False;
    msk_cd_grupo.TabStop := False;
    btn_co_grupo.Enabled := False;
  end;
end;

procedure Tfrm_sel_pagtos.btn_co_favorecidoClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_Favor, frm_Favor );
  with frm_Favor do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_Favor.Cons_OnLine_Texto := msk_cd_favorecido.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_favorecido.Text := frm_Favor.Cons_OnLine_Texto;
  end;
  msk_cd_favorecidoExit(nil);
  msk_cd_favorecido.SetFocus;
end;

procedure Tfrm_sel_pagtos.msk_cd_favorecidoExit(Sender: TObject);
begin
  edt_nm_favorecido.Clear;
  if msk_cd_favorecido.Text = '' then
  begin
    if tp_rel in [1] then edt_nm_favorecido.Text := 'Todos'
    else edt_nm_favorecido.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_favorecido );
  with datm_sel_pagtos.qry_favorecido_ do
  begin
    Close;
    ParamByName('CD_FAVORECIDO').AsString := msk_cd_favorecido.Text;
    Prepare;
    Open;
    if Eof then
    begin
      BoxMensagem( 'Favorecido não encontrado!', 2 );
      msk_cd_favorecido.Clear;
      edt_nm_favorecido.Clear;
      msk_cd_favorecido.SetFocus;
    end
    else edt_nm_favorecido.Text := FieldByName('NM_FAVORECIDO').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_pagtos.btn_co_grupo_itemClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_grupo_item, frm_grupo_item );
  with frm_grupo_item do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_grupo_item.Cons_OnLine_Texto := msk_cd_grupo_item.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_grupo_item.Text := frm_grupo_item.Cons_OnLine_Texto;
  end;
  msk_cd_grupo_itemExit(nil);
  msk_cd_grupo_item.SetFocus;
end;

procedure Tfrm_sel_pagtos.msk_cd_grupo_itemExit(Sender: TObject);
begin
  edt_nm_grupo_item.Clear;
  if msk_cd_grupo_item.Text = '' then
  begin
    if tp_rel in [1] then edt_nm_grupo_item.Text := 'Todos'
    else edt_nm_grupo_item.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_grupo_item );
  with datm_sel_pagtos.qry_grupo_item_ do
  begin
    Close;
    ParamByName('CD_GRUPO_ITEM').AsString := msk_cd_grupo_item.Text;
    Prepare;
    Open;
    if Eof then
    begin
      BoxMensagem( 'Grupo de Item não encontrado!', 2 );
      msk_cd_grupo_item.Clear;
      edt_nm_grupo_item.Clear;
      msk_cd_grupo_item.SetFocus;
    end
    else edt_nm_grupo_item.Text := FieldByName('NM_GRUPO_ITEM').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_pagtos.msk_cd_itemExit(
  Sender: TObject);
begin
  edt_nm_item.Clear;
  if msk_cd_item.Text = '' then
  begin
    if tp_rel in [1] then edt_nm_item.Text := 'Todos'
    else edt_nm_item.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_item );
  with datm_sel_pagtos.qry_item_ do
  begin
    Close;
    ParamByName('CD_ITEM').AsString := msk_cd_item.Text;
    Prepare;
    Open;
    if Eof then
    begin
      BoxMensagem( 'Item não encontrado!', 2 );
      msk_cd_item.Clear;
      edt_nm_item.Clear;
      msk_cd_item.SetFocus;
    end
    else edt_nm_item.Text := FieldByName('NM_ITEM').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_pagtos.btn_co_itemClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_item, frm_item );
  with frm_item do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_item.Cons_OnLine_Texto := msk_cd_item.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_item.Text := frm_item.Cons_OnLine_Texto;
  end;
  msk_cd_itemExit(nil);
  msk_cd_item.SetFocus;
end;

procedure Tfrm_sel_pagtos.msk_cd_grupo_itemChange(Sender: TObject);
begin
  if msk_cd_grupo_item.Text = '' then
  begin
    msk_cd_item.Color   := clWindow;
    msk_cd_item.Enabled := True;
    msk_cd_item.TabStop := True;
    btn_co_item.Enabled := True;
  end
  else
  begin
    edt_nm_item.Text    := '';
    msk_cd_item.Color   := clMenu;
    msk_cd_item.Enabled := False;
    msk_cd_item.TabStop := False;
    btn_co_item.Enabled := False;
  end;
end;

procedure Tfrm_sel_pagtos.msk_cd_itemChange(Sender: TObject);
begin
  if msk_cd_item.Text = '' then
  begin
    msk_cd_grupo_item.Color   := clWindow;
    msk_cd_grupo_item.Enabled := True;
    msk_cd_grupo_item.TabStop := True;
    btn_co_grupo_item.Enabled := True;
  end
  else
  begin
    edt_nm_grupo_item.Text    := '';
    msk_cd_grupo_item.Color   := clMenu;
    msk_cd_grupo_item.Enabled := False;
    msk_cd_grupo_item.TabStop := False;
    btn_co_grupo_item.Enabled := False;
  end;
end;


procedure Tfrm_sel_pagtos.msk_cd_usuarioExit(Sender: TObject);
begin
  edt_nm_usuario.Clear;
  if msk_cd_usuario.Text = '' then
  begin
    if tp_rel in [1] then edt_nm_usuario.Text := 'Todos'
    else edt_nm_usuario.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_usuario );
  with datm_sel_pagtos.qry_usuario_ do
  begin
    Close;
    ParamByName('CD_USUARIO').AsString := msk_cd_usuario.Text;
    Prepare;
    Open;
    if Eof then
    begin
      BoxMensagem( 'Usuário não encontrado!', 2 );
      msk_cd_usuario.Clear;
      edt_nm_usuario.Clear;
      msk_cd_usuario.SetFocus;
    end
    else edt_nm_usuario.Text := FieldByName('NM_USUARIO').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_pagtos.btn_co_usuarioClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_usuario, frm_usuario );
  with frm_usuario do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_usuario.Cons_OnLine_Texto := msk_cd_usuario.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_usuario.Text := frm_usuario.Cons_OnLine_Texto;
  end;
  msk_cd_usuarioExit(nil);
  msk_cd_usuario.SetFocus;
end;

end.
