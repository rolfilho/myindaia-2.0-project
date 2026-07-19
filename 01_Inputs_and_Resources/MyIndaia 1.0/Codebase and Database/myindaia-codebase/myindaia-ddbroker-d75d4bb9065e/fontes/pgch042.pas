unit PGCH042;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Db, StdCtrls, Mask, ExtCtrls, UCRPE32;

type
  Tfrm_rel_desp_pag = class(TForm)
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
    procedure btn_sairClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_dt_inicioExit(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure msk_dt_fimExit(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
  private
    c1:  String;
    p1: Array[0..1024] of Char;
  public
    tp_rel : Byte;
    ComPeriodo : Boolean;
  end;

var
  frm_rel_desp_pag: Tfrm_rel_desp_pag;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGCH015, PGSM010, PGSM018, PGSM024, FILETEXT,
  PGSM119;

var
   Arquivo : TFileText;

procedure Tfrm_rel_desp_pag.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_rel_desp_pag.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = '' then
  begin
    if tp_rel in [2,3,5,6,7,8,9] then edt_nm_unid_neg.Text := 'Todas'
    else edt_nm_unid_neg.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_unid_neg );
  if msk_cd_unid_neg.Text <> '' then
  begin
    with datm_sel_unid_prod do
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
        msk_cd_unid_neg.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_unid_neg.Text := '';
  end;
end;

procedure Tfrm_rel_desp_pag.msk_cd_produtoExit(Sender: TObject);
begin
  if msk_cd_produto.text = '' then
  begin
    if tp_rel in [2,5,6,7,8,9] then edt_nm_produto.Text := 'Todos'
    else edt_nm_produto.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_produto );
  if msk_cd_produto.Text <> '' then
  begin
    with datm_sel_unid_prod do
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
        msk_cd_produto.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_produto.Text := '';
  end;
end;

procedure Tfrm_rel_desp_pag.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_sel_unid_prod Do
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

procedure Tfrm_rel_desp_pag.btn_co_produtoClick(Sender: TObject);
begin
  with datm_sel_unid_prod Do
  begin
    Application.CreateForm(Tfrm_produto, frm_produto );
    With frm_produto Do
    Begin
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

{$HINTS OFF}
procedure Tfrm_rel_desp_pag.msk_dt_inicioExit(Sender: TObject);
begin
  try
    if msk_dt_inicio.Text <> '  /  /    ' then StrToDate(msk_dt_inicio.Text);
  except
    on EConvertError do
    begin
      BoxMensagem('Data Inválida!',2);
      msk_dt_inicio.Clear;
    end;
  end;
end;
{$HINTS ON}

procedure Tfrm_rel_desp_pag.btn_imprimirClick(Sender: TObject);
var
  Linha, Cont: Byte;
  MemoMatList, MemoObsList : TStringList;
  nr_identificador: integer;
begin
  nr_identificador := 0;

  if ( Trim(msk_cd_unid_neg.Text) = '' ) and ( tp_rel in [1,10] ) then
  begin
    BoxMensagem('Informe uma Unidade de Negócio!', 2);
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;

  if ( Trim(msk_cd_produto.Text) = '' ) and ( tp_rel in [1,4,10] )  then
  begin
    BoxMensagem('Informe um Produto!', 2);
    msk_cd_produto.SetFocus;
    Exit;
  end;

  if ( ( Trim(msk_cd_cliente.Text) = '' ) and ( Trim(msk_cd_grupo.Text) = '' ) ) and ( tp_rel in [5,10] ) then
  begin
    BoxMensagem('Informe um Cliente ou Grupo!', 2);
    msk_cd_cliente.SetFocus;
    Exit;
  end;

  if not tp_rel in [5,10] then
  begin
    if not tp_rel in [8,9] then
    begin
      if msk_dt_inicio.Text = '  /  /    ' then
      begin
        if ComPeriodo then BoxMensagem('Informe uma data de início para seleção!', 2)
        else BoxMensagem('Informe uma data para seleção!', 2);
        msk_dt_inicio.SetFocus;
        Exit;
      end;
    end;

    if ComPeriodo then
    begin
      if ( msk_dt_fim.Text = '  /  /    ' ) then
      begin
        BoxMensagem('Informe uma data final para seleção!', 2);
        msk_dt_fim.SetFocus;
        Exit;
      end;

      if StrToDate( msk_dt_inicio.Text ) > StrToDate( msk_dt_fim.Text ) then
      begin
        BoxMensagem('Data final deve ser maior ou igual a data inicial!', 2);
        msk_dt_fim.Clear;
        msk_dt_inicio.SetFocus;
        Exit;
      end;
    end;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  with crp_unid_prod do
  begin
    Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
    Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

    with datm_sel_unid_prod do
    begin
      ReportName  := cDir_Rpt + '\CRGI017.RPT';
      CloseStoredProc( sp_rel_desp_pagto );
      if Trim( msk_cd_cliente.Text ) = '' then
        sp_rel_desp_pagto.ParamByName('@cd_unid_neg').AsString   := 'X'
      else
        sp_rel_desp_pagto.ParamByName('@cd_unid_neg').AsString   := msk_cd_unid_neg.Text;
      if Trim( msk_cd_cliente.Text ) = '' then
        sp_rel_desp_pagto.ParamByName('@cd_produto').AsString    := 'X'
      else
        sp_rel_desp_pagto.ParamByName('@cd_produto').AsString    := msk_cd_produto.Text;
      ExecStoredProc( sp_rel_desp_pagto );
      nr_identificador := sp_rel_desp_pagto.ParamByName('@nr_identificador').AsInteger;
      CloseStoredProc( sp_rel_desp_pagto );
    end;

    if tp_rel in [8,9] then Formulas[0] := 'NrIdentificador = ' + Trim( IntToStr( nr_identificador ) );

    if tp_rel <> 5 then Execute;

    if tp_rel in [8] then
    begin
      with datm_sel_unid_prod do
      begin

        qry_apaga_dados_.SQL.Clear;
        qry_apaga_dados_.SQL.Add('DELETE TREL_NAO_DESEMB_DI WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR ' );
        qry_apaga_dados_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_apaga_dados_.Prepare;
        qry_apaga_dados_.ExecSQL;

        qry_apaga_dados_.SQL.Clear;
        qry_apaga_dados_.SQL.Add('DELETE TREL_NAO_DESEMB_DI_EV WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR ' );
        qry_apaga_dados_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_apaga_dados_.Prepare;
        qry_apaga_dados_.ExecSQL;

      end;
    end;
    if tp_rel in [9] then
    begin
      with datm_sel_unid_prod do
      begin
        qry_apaga_dados_.SQL.Clear;
        qry_apaga_dados_.SQL.Add('DELETE FROM TREL_DESP_PAGTO WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR ' );
        qry_apaga_dados_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_apaga_dados_.Prepare;
        qry_apaga_dados_.ExecSQL;
      end;
    end;
    if tp_rel in [10] then
    begin
      with datm_sel_unid_prod do
      begin
        qry_apaga_dados_.SQL.Clear;
        qry_apaga_dados_.SQL.Add('DELETE FROM TAUX_ANDAMENTO WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR ' );
        qry_apaga_dados_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_apaga_dados_.Prepare;
        qry_apaga_dados_.ExecSQL;
      end;
    end;
  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_rel_desp_pag.FormShow(Sender: TObject);
begin
  if ComPeriodo then
    lbl_periodo.Caption := 'Selecione um período:'
  else
  begin
    if tp_rel in [8,9,10] then
    begin
      lbl_periodo.Visible   := False;
      msk_dt_inicio.Visible := False;
    end
    else
    begin
      if tp_rel <> 5 then
      begin
        lbl_periodo.Caption := 'Selecione uma data:';
        msk_dt_inicio.Text := FormatDateTime('dd/mm/yyyy', dt_server);
      end;
    end;
  end;

  case tp_rel of
    1 : Caption := 'Relação de Recebimentos de Numerário';
    2 : begin
          Caption := 'Movimento Estatístico';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
        end;
    3 : begin
          Caption := 'Comissão por Processo (FATURA) ';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
        end;
    4 : begin
          Caption := 'Comparativo Comissão por Fatura ';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
        end;
    5 : begin
          Caption := 'Follow-Up - Planilha';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
          msk_dt_inicio.Visible  := False;
          lbl_periodo.Visible    := False;
        end;
    6 : Caption := 'Totais de Tipo de Serviço por Cliente';
    7 : Caption := 'Totais de Tipo de Serviço por Cliente - Analítico';
    8 : begin
          Caption := 'Despachos Não Desembaraçados - D.I.';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
          msk_cd_grupo.SetFocus;
        end;
    9 : Caption := 'Despachos para Pagamento';
    10: begin
          Caption := 'Andamento por último evento realizado';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
          msk_cd_grupo.SetFocus;
        end;
  end;

  with datm_sel_unid_prod do
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

  lbl_a.Visible        := ComPeriodo;
  msk_dt_fim.Visible   := ComPeriodo;

end;

procedure Tfrm_rel_desp_pag.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_sel_unid_prod do
  begin
    qry_grupo_.Close;
    qry_cliente_.Close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
//    Destroy;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_rel_desp_pag.FormCreate(Sender: TObject);
begin
 { Inicializa o Data Module para Seleção de Recebimento}
  Application.CreateForm( Tdatm_sel_unid_prod, datm_sel_unid_prod );
end;

procedure Tfrm_rel_desp_pag.msk_dt_fimExit(Sender: TObject);
begin
  try
    if msk_dt_fim.Text <> '  /  /    ' then StrToDate(msk_dt_fim.Text);
  except
    on EConvertError do
    begin
      BoxMensagem('Data Inválida!',2);
      msk_dt_fim.Clear;
    end;
  end;
end;

procedure Tfrm_rel_desp_pag.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.text = '' then
  begin
    if tp_rel = 5 then edt_nm_cliente.Text := ''
    else edt_nm_cliente.Text := 'Todos';
    Exit;
  end;
  ValCodEdt(msk_cd_cliente);
  with datm_sel_unid_prod.qry_cliente_ do
  begin
    ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Cliente não encontrado!',2);
      msk_cd_cliente.Clear;
      edt_nm_cliente.Clear;
      msk_cd_cliente.SetFocus;
    end
    else edt_nm_cliente.Text:= FieldByName('AP_EMPRESA').AsString;
    Close;
  end;
end;

procedure Tfrm_rel_desp_pag.btn_co_clienteClick(Sender: TObject);
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


procedure Tfrm_rel_desp_pag.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_co_produtoClick(nil);
    if Sender = msk_cd_grupo    then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente  then btn_co_clienteClick(nil);
  end;
end;

procedure Tfrm_rel_desp_pag.btn_co_grupoClick(Sender: TObject);
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

procedure Tfrm_rel_desp_pag.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.Text = '' then
  begin
    if tp_rel = 5 then edt_nm_grupo.Text := ''
    else edt_nm_grupo.Text := 'Todos';
    Exit;
  end;
  ValCodEdt(msk_cd_grupo);
  with datm_sel_unid_prod.qry_grupo_ do
  begin
    ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
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

procedure Tfrm_rel_desp_pag.msk_cd_grupoChange(Sender: TObject);
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

procedure Tfrm_rel_desp_pag.msk_cd_clienteChange(Sender: TObject);
begin
  if msk_cd_cliente.text = '' then
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

end.
