unit PGFI017;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, DBCtrls, StdCtrls, ToolEdit, Mask, Buttons, ExtCtrls, Grids, DBGrids, Funcoes;

type
  Tfrm_fin_transf_pagto = class(TForm)
    menu_cadastro: TMainMenu;
    mi_transferir: TMenuItem;
    mi_sair: TMenuItem;
    Label4: TLabel;
    Shape1: TShape;
    dbnvg: TDBNavigator;
    btn_sair: TSpeedButton;
    Shape3: TShape;
    Panel1: TPanel;
    lbl_processo: TLabel;
    btn_co_processo_origem: TSpeedButton;
    Label1: TLabel;
    lbl_item: TLabel;
    btn_co_item: TSpeedButton;
    btn_co_unid_neg: TSpeedButton;
    lbl_cd_unid_neg: TLabel;
    Label6: TLabel;
    btn_co_produto: TSpeedButton;
    msk_nr_processo_origem: TMaskEdit;
    msk_dt_pagamento: TDateEdit;
    msk_cd_item: TMaskEdit;
    edt_nm_item: TEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    Shape2: TShape;
    dbgrd_pagto: TDBGrid;
    Label5: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Panel2: TPanel;
    Label8: TLabel;
    msk_dest_cd_unid_neg: TMaskEdit;
    edt_dest_nm_unid_neg: TEdit;
    btn_dest_co_unid_neg: TSpeedButton;
    btn_dest_co_produto: TSpeedButton;
    edt_dest_nm_produto: TEdit;
    msk_dest_cd_produto: TMaskEdit;
    Label9: TLabel;
    Label2: TLabel;
    msk_nr_processo_dest: TMaskEdit;
    btn_co_processo_dest: TSpeedButton;
    btn_transferir: TSpeedButton;
    procedure btn_co_processo_origemClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_nr_processo_origemExit(Sender: TObject);
    procedure msk_nr_processo_destExit(Sender: TObject);
    procedure btn_co_processo_destClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_itemExit(Sender: TObject);
    procedure btn_co_itemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_transferirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure msk_nr_processo_origemEnter(Sender: TObject);
    procedure msk_dt_pagamentoEnter(Sender: TObject);
    procedure msk_dt_pagamentoExit(Sender: TObject);
    procedure msk_cd_itemEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_dest_co_unid_negClick(Sender: TObject);
    procedure btn_dest_co_produtoClick(Sender: TObject);
    procedure msk_dest_cd_unid_negExit(Sender: TObject);
    procedure msk_dest_cd_produtoExit(Sender: TObject);
  private
    { Private declarations }
    cd_unid_neg_fin, cd_produto_fin, nr_processo_origem_fin, cd_item_fin, dt_pagamento_fin, lanc : String;
    procedure AbrePagto;
  public
    { Public declarations }
  end;

var
  frm_fin_transf_pagto: Tfrm_fin_transf_pagto;

implementation

{$R *.DFM}

uses
  PGGP001, PGGP015, PGFI018, PGSM010, PGSM018, GSMLIB, PGSM136, PGSM059,
  PGGP017, ConsOnLineEx;

procedure Tfrm_fin_transf_pagto.btn_co_processo_origemClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, EN.AP_EMPRESA, EN.CGC_EMPRESA, DT_ABERTURA ');
  vListAux.Add('FROM TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('  INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''' + msk_cd_produto.Text  + '''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  msk_nr_processo_origem.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Apelido', 'CNPJ', 'Data de Abertura'],'NR_PROCESSO',nil, msk_nr_processo_origem.Text);
  msk_nr_processo_origemExit(nil);
  vListAux.Free;
{  Screen.Cursor := crHourGlass;
  Application.CreateForm( Tfrm_consulta_processo, frm_consulta_processo );
  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := msk_cd_produto.Text;
  frm_consulta_processo.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if ( frm_consulta_processo.Nr_Processo <> '' ) then
  begin
    msk_nr_processo_origem.Text := Copy( frm_consulta_processo.Nr_Processo, 5, 14 );
    msk_nr_processo_origemExit(nil);
  end;}
end;

procedure Tfrm_fin_transf_pagto.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_fin_transf_pagto do
  begin
  if Sender is TSpeedButton then
    ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  else
    ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', edt_nm_unid_neg.Text,'NM_UNID_NEG');
  end;
end;

procedure Tfrm_fin_transf_pagto.btn_co_produtoClick(Sender: TObject);
begin
  with datm_fin_transf_pagto do
  begin
  if Sender is TSpeedButton then
    ConsultaOnLineEx('TPRODUTO', 'Produtos', ['CD_PRODUTO', 'NM_PRODUTO'], ['Código', 'Nome'], 'CD_PRODUTO', nil)
  else
    ConsultaLookUP('TPRODUTO','CD_PRODUTO', edt_nm_produto.Text,'NM_PRODUTO');
  end;
end;

procedure Tfrm_fin_transf_pagto.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text <> '' then
  begin
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');
    cd_unid_neg_fin := Trim( msk_cd_unid_neg.Text );
    AbrePagto;
  end
  else
  begin
    BoxMensagem( 'Unidade de Negócio não cadastrada!', 2 );
    msk_cd_unid_neg.SetFocus;
  end
end;

procedure Tfrm_fin_transf_pagto.msk_nr_processo_origemExit(
  Sender: TObject);
begin
  if Trim( msk_nr_processo_origem.Text ) = nr_processo_origem_fin then Exit;
  if msk_nr_processo_origem.Text <> '' then
  begin
    with datm_fin_transf_pagto do
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text +  msk_cd_produto.Text +
                                                           msk_nr_processo_origem.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;
      if qry_processo_.RecordCount = 0 then
      begin
        msk_nr_processo_origem.Text := '';
        BoxMensagem( 'Processo não cadastrado ou não liberado para esta Unidade/Produto!', 2 );
        msk_nr_processo_origem.SetFocus;
        Exit;
      end;
      AbrePagto;
    end;
  end;
end;

procedure Tfrm_fin_transf_pagto.msk_nr_processo_destExit(Sender: TObject);
begin
  if msk_nr_processo_dest.Text <> '' then
  begin
    with datm_fin_transf_pagto do
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_dest_cd_unid_neg.Text +  msk_dest_cd_produto.Text +
                                                           msk_nr_processo_dest.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;
      if qry_processo_.RecordCount = 0 then
      begin
        msk_nr_processo_dest.Text := '';
        BoxMensagem( 'Processo não cadastrado ou não liberado para esta Unidade/Produto!', 2 );
        msk_nr_processo_dest.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_fin_transf_pagto.btn_co_processo_destClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, EN.AP_EMPRESA, EN.CGC_EMPRESA, DT_ABERTURA ');
  vListAux.Add('FROM TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('  INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''' + msk_dest_cd_produto.Text  + '''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + msk_dest_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  msk_nr_processo_dest.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Apelido', 'CNPJ', 'Data de Abertura'],'NR_PROCESSO',nil, msk_nr_processo_dest.Text);
  msk_nr_processo_destExit(nil);
  vListAux.Free;
{begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm( Tfrm_consulta_processo,frm_consulta_processo );
  frm_consulta_processo.str_cd_unid := msk_dest_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := msk_dest_cd_produto.Text;
  frm_consulta_processo.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if ( frm_consulta_processo.Nr_Processo <> '' ) then
  begin
    msk_nr_processo_dest.Text := Copy( frm_consulta_processo.Nr_Processo, 5, 14 );
    msk_nr_processo_destExit(nil);
  end;}
end;

procedure Tfrm_fin_transf_pagto.msk_cd_produtoExit(Sender: TObject);
begin
  if Trim( msk_cd_produto.Text ) = cd_produto_fin then Exit;
  ValCodEdt( msk_cd_produto );
  if msk_cd_produto.Text <> '' then
  begin
    with datm_fin_transf_pagto do
    begin
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
      qry_produto_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_produto_.Prepare;
      qry_produto_.Open;
      if qry_produto_.RecordCount > 0 then
      begin
        edt_nm_produto.Text := qry_produto_.FieldByName('NM_PRODUTO').AsString;
        AbrePagto;
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

procedure Tfrm_fin_transf_pagto.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg        then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto         then btn_co_produtoClick(nil);
    if Sender = msk_cd_item            then btn_co_itemClick(nil);
    if Sender = msk_nr_processo_origem then btn_co_processo_origemClick(nil);
    if Sender = msk_nr_processo_dest   then btn_co_processo_destClick(nil);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo_origem ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_cd_unid_neg.Text := Copy( frm_pesq_proc.PesqNrProcesso, 1, 2 );
      msk_cd_unid_negExit(nil);
      msk_cd_produto.Text := Copy( frm_pesq_proc.PesqNrProcesso, 3, 2 );
      msk_cd_produtoExit(nil);
      msk_nr_processo_origem.Text := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processo_origemExit(nil);
    end;
  end;
end;

procedure Tfrm_fin_transf_pagto.msk_cd_itemExit(Sender: TObject);
begin
  if Trim( msk_cd_item.Text ) = cd_item_fin then Exit;
  edt_nm_item.Clear;
  if msk_cd_item.Text = '' then
  begin
    edt_nm_item.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_item );
  with datm_fin_transf_pagto.qry_item_ do
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
      Exit;
    end
    else
    begin
      edt_nm_item.Text := FieldByName('NM_ITEM').AsString;
      AbrePagto;
    end;
    Close;
  end;
end;

procedure Tfrm_fin_transf_pagto.btn_co_itemClick(Sender: TObject);
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

procedure Tfrm_fin_transf_pagto.FormShow(Sender: TObject);
begin
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_produtoExit(nil);
  msk_nr_processo_origem.SetFocus;
  msk_dest_cd_unid_neg.Text := str_cd_unid_neg;
  msk_dest_cd_produto.Text  := str_cd_produto;
end;

procedure Tfrm_fin_transf_pagto.AbrePagto;
begin
  with datm_fin_transf_pagto do
  begin
    btn_transferir.Visible := False;
    mi_transferir.Enabled   := False;
    if ( Trim( msk_cd_unid_neg.Text ) = '' ) or
       ( Trim( msk_cd_produto.Text ) = '' ) or
       ( Trim( msk_nr_processo_origem.Text ) = '' ) or
       ( Trim( msk_dt_pagamento.Text ) = '  /  /    ' ) or
       ( Trim( msk_cd_item.Text ) = '' ) then
    begin
      qry_caixa_.Close;
      Exit;
    end
    else
    begin
      qry_caixa_.Close;
      qry_caixa_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                        Trim( msk_cd_produto.Text ) +
                                                        Trim( msk_nr_processo_origem.Text );
      qry_caixa_.ParamByName('DT_MOVIMENTO').AsDate  := StrToDate( msk_dt_pagamento.Text );
      qry_caixa_.ParamByName('CD_ITEM').AsString     := Trim( msk_cd_item.Text );
      qry_caixa_.Prepare;
      qry_caixa_.Open;
      if Not qry_caixa_.EOF then
      begin
        lanc := '';
        if qry_caixa_.RecordCount = 1 then
          lanc := qry_caixa_NR_LANCAMENTO.AsString;
        btn_transferir.Visible := True;
        mi_transferir.Enabled   := True;
      end;
    end;
  end;
end;

procedure Tfrm_fin_transf_pagto.btn_transferirClick(Sender: TObject);
begin
  if ( Trim( msk_cd_unid_neg.Text ) = '' ) then
  begin
    BoxMensagem( 'Informe uma Unidade de Negócio!', 2 );
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;
  if ( Trim( msk_cd_produto.Text ) = '' ) then
  begin
    BoxMensagem( 'Informe um Produto!', 2 );
    msk_cd_produto.SetFocus;
    Exit;
  end;
  if ( Trim( msk_nr_processo_origem.Text ) = '' ) then
  begin
    BoxMensagem( 'Informe um Processo de Origem!', 2 );
    msk_nr_processo_origem.SetFocus;
    Exit;
  end;
  if ( Trim( msk_dt_pagamento.Text ) = '  /  /    ' ) then
  begin
    BoxMensagem( 'Informe uma Data de Pagamento!', 2 );
    msk_dt_pagamento.SetFocus;
    Exit;
  end;
  if ( Trim( msk_cd_item.Text ) = '' ) then
  begin
    BoxMensagem( 'Informe um Item!', 2 );
    msk_cd_item.SetFocus;
    Exit;
  end;
  if ( Trim( msk_nr_processo_dest.Text ) = '' ) then
  begin
    BoxMensagem( 'Informe um Processo de Destino!', 2 );
    msk_nr_processo_dest.SetFocus;
    Exit;
  end;
  // Quando há vários itens, exige que o usuário selecione um
  if ( dbgrd_pagto.SelectedRows.Count <= 0 ) and ( lanc = '' ) then
  begin
    BoxMensagem('Selecione um item!', 2);
    Exit;
  end
  else
  begin
    if lanc = '' then
      lanc := datm_fin_transf_pagto.qry_caixa_NR_LANCAMENTO.AsString;
  end;

  try
    Screen.Cursor := crHourGlass;
    datm_main.db_broker.StartTransaction;
    with datm_fin_transf_pagto do
    begin
      CloseStoredProc( sp_fin_transf_pagto );
      sp_fin_transf_pagto.ParamByName('@nr_processo_orig').AsString  := Trim( msk_cd_unid_neg.Text ) +
                                                                        Trim( msk_cd_produto.Text ) +
                                                                        Trim( msk_nr_processo_origem.Text );
      sp_fin_transf_pagto.ParamByName('@nr_processo_dest').AsString  := Trim( msk_dest_cd_unid_neg.Text ) +
                                                                        Trim( msk_dest_cd_produto.Text ) +
                                                                        Trim( msk_nr_processo_dest.Text );
      sp_fin_transf_pagto.ParamByName('@cd_item').AsString            := Trim( msk_cd_item.Text );
      sp_fin_transf_pagto.ParamByName('@dt_pagamento').AsDate         := StrToDate( msk_dt_pagamento.Text );
      sp_fin_transf_pagto.ParamByName('@nr_lanc').AsString            := lanc;
      sp_fin_transf_pagto.ParamByName('@vl_pagamento').AsFloat        := datm_fin_transf_pagto.qry_caixa_VL_LANCAMENTO.AsFloat;      
      ExecStoredProc( sp_fin_transf_pagto );
      CloseStoredProc( sp_fin_transf_pagto );
    end;
    datm_main.db_broker.Commit;
    Screen.Cursor := crDefault;
    BoxMensagem( 'Transferência executada com sucesso!', 3 );
    AbrePagto;
  except
    if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_fin_transf_pagto.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_fin_transf_pagto, datm_fin_transf_pagto );
  Shape1.brush.color := clMenuBroker;
  Shape3.brush.color := clPnlClaroBroker;
  Panel1.Color := clPnlClaroBroker;
  Panel2.Color := clPnlClaroBroker;
  Label3.color := clPnlClaroBroker;
  Label7.color := clPnlClaroBroker;
  edt_nm_unid_neg.Color := clPnlClaroBroker;
  edt_dest_nm_unid_neg.Color := clPnlClaroBroker;
  edt_nm_produto.Color := clPnlClaroBroker;
  edt_dest_nm_produto.Color := clPnlClaroBroker;
  edt_nm_item.Color := clPnlClaroBroker;
end;

procedure Tfrm_fin_transf_pagto.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_fin_transf_pagto.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_fin_transf_pagto.msk_cd_produtoEnter(Sender: TObject);
begin
  cd_produto_fin := Trim( msk_cd_produto.Text );
end;

procedure Tfrm_fin_transf_pagto.msk_nr_processo_origemEnter(
  Sender: TObject);
begin
  nr_processo_origem_fin := Trim( msk_nr_processo_origem.Text );
end;

procedure Tfrm_fin_transf_pagto.msk_dt_pagamentoEnter(Sender: TObject);
begin
  dt_pagamento_fin := Trim( msk_dt_pagamento.Text );
end;

procedure Tfrm_fin_transf_pagto.msk_dt_pagamentoExit(Sender: TObject);
begin
  if Trim( msk_dt_pagamento.Text ) = dt_pagamento_fin then Exit;
  try
    StrToDate( msk_dt_pagamento.Text );
  except
    BoxMensagem( 'Data inválida!', 2 );
    msk_dt_pagamento.SetFocus;
    Exit;
  end;
  AbrePagto;
end;

procedure Tfrm_fin_transf_pagto.msk_cd_itemEnter(Sender: TObject);
begin
  cd_item_fin := Trim( msk_cd_item.Text );
end;

procedure Tfrm_fin_transf_pagto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_fin_transf_pagto do
  begin
    qry_caixa_.Close;
    
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_fin_transf_pagto.btn_dest_co_unid_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  else
    ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', edt_dest_nm_unid_neg.Text,'NM_UNID_NEG');
  msk_dest_cd_unid_negExit(nil);
end;

procedure Tfrm_fin_transf_pagto.btn_dest_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    ConsultaOnLineEx('TPRODUTO', 'Produtos', ['CD_PRODUTO', 'NM_PRODUTO'], ['Código', 'Nome'], 'CD_PRODUTO', nil)
  else
    ConsultaLookUP('TPRODUTO','CD_PRODUTO', edt_dest_nm_produto.Text,'NM_PRODUTO');
  msk_dest_cd_produtoExit(nil);
end;

procedure Tfrm_fin_transf_pagto.msk_dest_cd_unid_negExit(Sender: TObject);
begin
   edt_dest_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_dest_cd_unid_neg.Text,'AP_UNID_NEG')
end;

procedure Tfrm_fin_transf_pagto.msk_dest_cd_produtoExit(Sender: TObject);
begin
  edt_dest_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_dest_cd_produto.Text,'NM_PRODUTO')
end;

end.
