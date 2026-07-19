unit PGGA017;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, DBTables, Db, PGGP001,
  DBCtrls, Menus, DBCGrids, Funcoes;

type
  Tfrm_veiculo_realizacao = class(TForm)
    pnl_manut_cadastro: TPanel;
    btn_sair: TSpeedButton;
    Panel1: TPanel;
    lbl_nm_usuario: TLabel;
    pnl_selecao: TPanel;
    Label6: TLabel;
    btn_cd_produto: TSpeedButton;
    Label7: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    Label8: TLabel;
    msk_cd_evento: TMaskEdit;
    btn_co_evento: TSpeedButton;
    edt_nm_evento: TEdit;
    msk_dt_realizacao: TMaskEdit;
    Label2: TLabel;
    menu_cadastro: TMainMenu;
    mi_sair: TMenuItem;
    edt_nm_usuario: TEdit;
    btn_salvar: TSpeedButton;
    lbl_voo: TLabel;
    msk_nr_voo: TMaskEdit;
    btn_co_embarcacao: TSpeedButton;
    lbl_embarcacao: TLabel;
    msk_cd_embarcacao: TMaskEdit;
    edt_nm_embarcacao: TEdit;
    mi_salvar: TMenuItem;
    dbgrdProcVeic: TDBGrid;
    btn_marca_todas: TSpeedButton;
    btn_desmarca_todas: TSpeedButton;
    mi_desmarca: TMenuItem;
    mi_marca: TMenuItem;
    Label1: TLabel;
    msk_nr_viagem: TMaskEdit;
    btn_co_viagem: TSpeedButton;
    procedure btn_fecharClick(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    function habilitacao : Boolean;
    procedure btn_sairClick(Sender: TObject);
    procedure mi_sairClick(Sender: TObject);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_cd_produtoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btn_co_eventoClick(Sender: TObject);
    procedure msk_cd_eventoEnter(Sender: TObject);
    procedure msk_cd_eventoExit(Sender: TObject);
    procedure AbreProc;
    procedure msk_dt_realizacaoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_embarcacaoClick(Sender: TObject);
    procedure msk_cd_embarcacaoExit(Sender: TObject);
    procedure msk_cd_embarcacaoEnter(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure dbchkbox_in_por_veiculoClick(Sender: TObject);
    procedure btn_desmarca_todasClick(Sender: TObject);
    procedure btn_marca_todasClick(Sender: TObject);
    procedure dbgrdProcVeicCellClick(Column: TColumn);
    procedure btn_co_viagemClick(Sender: TObject);
    procedure msk_nr_viagemEnter(Sender: TObject);
    procedure msk_nr_viagemExit(Sender: TObject);
  private
    st_modificar, st_excluir, st_incluir: Boolean;
    st_produto, st_unid_neg, st_cd_modulo, st_cd_rotina, st_embarcacao, st_viagem, st_cd_evento : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_veiculo_realizacao: Tfrm_veiculo_realizacao;

implementation

uses PGSM039, PGSM018, PGSM010, PGGP015, PGSM036, GSMLIB, PGGP017, PGGA018, PGSM088,
     PGSM240;

{$R *.DFM}

procedure Tfrm_veiculo_realizacao.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_veiculo_realizacao.msk_cd_unid_negEnter(Sender: TObject);
begin
  st_unid_neg := msk_cd_unid_neg.Text;
end;

procedure Tfrm_veiculo_realizacao.msk_cd_unid_negExit(Sender: TObject);
begin
  ValCodEdt( msk_cd_unid_neg );
  if Not ( st_unid_neg = msk_cd_unid_neg.Text ) then
  begin
    with datm_veiculo_realizacao do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.Locate('CD_UNID_NEG', msk_cd_unid_neg.text, [loCaseInsensitive, loPartialKey]) then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_.FieldByName('AP_UNID_NEG').AsString;
      end
      else
      begin
        edt_nm_unid_neg.Clear;
        BoxMensagem('Unidade não habilitada/ativa!', 2);
      end;
      qry_unid_neg_.Close;
    end;
  end;
  AbreProc;
end;

procedure Tfrm_veiculo_realizacao.msk_cd_produtoEnter(Sender: TObject);
begin
  st_produto := msk_cd_produto.Text;
end;

procedure Tfrm_veiculo_realizacao.msk_cd_produtoExit(Sender: TObject);
var foco: Boolean;
begin
  ValCodEdt( msk_cd_produto );
  if Not ( st_produto = msk_cd_produto.Text ) then
  begin
    with datm_veiculo_realizacao do
    begin
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_produto_.Prepare;
      qry_produto_.Open;
      if qry_produto_.Locate('CD_PRODUTO', msk_cd_produto.Text, [loCaseInsensitive, loPartialKey]) then
      begin
        edt_nm_produto.Text := qry_produto_AP_PRODUTO.AsString;
        foco := Not Habilitacao;
      end
      else
      begin
        edt_nm_produto.Clear;
        BoxMensagem('Produto não habilitado/ativo!', 2);
        foco := True;
      end;
      qry_produto_.Close;
    end;
    if foco then msk_cd_produto.SetFocus;
  end;
  AbreProc;
end;

function Tfrm_veiculo_realizacao.Habilitacao : Boolean;
begin
  Habilitacao := True;
  if (msk_cd_unid_neg.Text <> '') and
     (msk_cd_produto.Text <> '') then
  with datm_veiculo_realizacao do
  begin
    qry_usuario_habilitacao_.Close;
    qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
    qry_usuario_habilitacao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_usuario_habilitacao_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
    qry_usuario_habilitacao_.Open;
    if qry_usuario_habilitacao_IN_ATIVO.AsString <> '1' then
    begin
      BoxMensagem('A habilitação não esta ativa!', 2);
      Habilitacao := False;
    end;
    qry_usuario_habilitacao_.Close;
  end;
end;

procedure Tfrm_veiculo_realizacao.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_veiculo_realizacao.mi_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_veiculo_realizacao.btn_cd_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    msk_cd_unid_negExit(nil);
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
      msk_cd_unid_negExit(nil);
    end;
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
end;

procedure Tfrm_veiculo_realizacao.btn_cd_produtoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';
  Application.CreateForm(Tfrm_produto, frm_produto);
  with frm_produto do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_produto.Cons_OnLine_Texto := msk_cd_produto.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
    msk_cd_produtoExit(nil);
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
end;

procedure Tfrm_veiculo_realizacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_veiculo_realizacao.Free;
  Action := cafree;
end;

procedure Tfrm_veiculo_realizacao.FormShow(Sender: TObject);
begin
  Application.CreateForm(Tdatm_veiculo_realizacao, datm_veiculo_realizacao );
  st_cd_modulo := vStr_cd_modulo;
  st_cd_rotina := vStr_cd_modulo;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  edt_nm_usuario.Text    := str_nm_usuario;
  msk_cd_unid_neg.Text   := str_cd_unid_neg;
  msk_cd_produto.Text    := str_cd_produto;
  msk_dt_realizacao.Text := Copy(DateToStr8(date),1,2)+'/'+Copy(DateToStr8(date),3,2)+'/'+Copy(DateToStr8(date),5,4);
  msk_cd_unid_negExit(nil);
  msk_cd_produtoExit(nil);
  msk_nr_voo.SetFocus;
end;

procedure Tfrm_veiculo_realizacao.btn_co_eventoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2304';
  Application.CreateForm(Tfrm_evento, frm_evento);
  with frm_evento do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_evento.Text := frm_evento.Cons_OnLine_Texto;
    msk_cd_eventoExit(nil);
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
end;

procedure Tfrm_veiculo_realizacao.msk_cd_eventoEnter(Sender: TObject);
begin
  st_cd_evento:= msk_cd_evento.Text;
end;

procedure Tfrm_veiculo_realizacao.msk_cd_eventoExit(Sender: TObject);
var st_cd_evento_l:String;
begin
  ValCodEdt( msk_cd_evento );
  if (st_cd_evento <> msk_cd_evento.Text) then
  begin
    with datm_veiculo_realizacao do
    begin
      qry_tevento_.Close;
      qry_tevento_.ParamByName('CD_EVENTO').AsString := msk_cd_evento.Text;
      qry_tevento_.Prepare;
      qry_tevento_.Open;
      if Not qry_tevento_.EOF then
      begin
        if qry_tevento_IN_INSPECIONAVEL.Value = '1' then
           edt_nm_evento.Text := qry_tevento_nm_evento.AsString
        else
        begin
          BoxMensagem('Evento não inspecionável.', 2);
          edt_nm_evento.Clear;
          msk_cd_evento.SetFocus;
          st_cd_evento := st_cd_evento_l;
        end;
      end;
      if qry_tevento_.EOF then
      begin
        BoxMensagem( 'Evento não encontrado', 2 );
        edt_nm_evento.clear;
        msk_cd_evento.setfocus;
        st_cd_evento:= st_cd_evento_l;
      end;
    end;
  end;
  AbreProc;
end;

procedure Tfrm_veiculo_realizacao.msk_dt_realizacaoExit(Sender: TObject);
begin
  if ( msk_dt_realizacao.Text = '  /  /    ' ) then Exit;
  try
    StrToDate(msk_dt_realizacao.Text);
  except
    on EConvertError do
    begin
      BoxMensagem('Data inválida.',2);
      Exit;
    end;
  end;
end;

procedure Tfrm_veiculo_realizacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_veiculo_realizacao.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg   then btn_cd_unid_negClick(nil);
    if Sender = msk_cd_produto    then btn_cd_produtoClick(nil);
    if Sender = msk_cd_evento     then btn_co_eventoClick(nil);
    if Sender = msk_cd_embarcacao then btn_co_embarcacaoClick(nil);
    if Sender = msk_nr_viagem     then btn_co_viagemClick(nil);
  end;
end;

procedure Tfrm_veiculo_realizacao.btn_co_embarcacaoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2225';
  Application.CreateForm(Tfrm_emb, frm_emb);
  with frm_emb do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_embarcacao.Text := frm_emb.Cons_OnLine_Texto;
    msk_cd_embarcacaoExit(nil);
    if ( frm_emb.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_embarcacao.Text := frm_emb.Cons_OnLine_Texto;
      msk_cd_embarcacaoExit(nil);
    end;
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
end;

procedure Tfrm_veiculo_realizacao.msk_cd_embarcacaoExit(Sender: TObject);
begin
  ValCodEdt( msk_cd_embarcacao );
  if Not ( st_embarcacao = msk_cd_embarcacao.Text ) then
  begin
    with datm_veiculo_realizacao do
    begin
      qry_embarcacao_.Close;
      qry_embarcacao_.ParamByName('CD_EMBARCACAO').AsString := msk_cd_embarcacao.Text;
      qry_embarcacao_.Prepare;
      qry_embarcacao_.Open;
      if Not qry_embarcacao_.EOF then
      begin
        edt_nm_embarcacao.Text := qry_embarcacao_.FieldByName('NM_EMBARCACAO').AsString;
      end
      else
      begin
        edt_nm_embarcacao.Clear;
        BoxMensagem('Embarcação não habilitada/ativa!', 2);
      end;
      qry_embarcacao_.Close;
    end;
  end;
  AbreProc;
end;

procedure Tfrm_veiculo_realizacao.msk_cd_embarcacaoEnter(Sender: TObject);
begin
  st_embarcacao := msk_cd_embarcacao.Text;
end;

procedure Tfrm_veiculo_realizacao.AbreProc;
var MySQL : String;
begin
  if ( Trim( msk_cd_unid_neg.Text ) <> '' ) and
     ( Trim( msk_cd_produto.Text ) <> '' ) and
     ( ( Trim( msk_nr_voo.Text ) <> '' ) or
       ( Trim( msk_cd_embarcacao.Text ) <> '' ) ) and
     ( Trim( msk_cd_evento.Text ) <> '' ) then
  begin

    with datm_veiculo_realizacao do
    begin
      try
        datm_main.db_broker.StartTransaction;

        MySQL := 'DELETE TPROCESSO_POR_VEICULO WHERE CD_USUARIO = "' + str_cd_usuario + '"';
        qry_exec_.Close;
        qry_exec_.SQL.Clear;
        qry_exec_.SQL.Add( MySQL );
        qry_exec_.ExecSQL;

        MySQL := 'INSERT TPROCESSO_POR_VEICULO ';
        MySQL := MySQL + 'SELECT P.NR_PROCESSO, E.NM_EMPRESA, S.NM_SERVICO, ISNULL( P.IN_POR_VEICULO, 0) , "' + str_cd_usuario + '" ';
        MySQL := MySQL + 'FROM TPROCESSO P, TFOLLOWUP F, TEMPRESA_NAC E, TSERVICO S ';
        MySQL := MySQL + 'WHERE P.NR_PROCESSO = F.NR_PROCESSO ' +
                         'AND P.CD_CLIENTE = E.CD_EMPRESA ' +
                         'AND P.CD_SERVICO = S.CD_SERVICO ' +
                         'AND P.CD_UNID_NEG = "' + msk_cd_unid_neg.Text +
                         '" AND P.CD_PRODUTO = "' + msk_cd_produto.Text +
                         '" AND F.CD_EVENTO = "' + msk_cd_evento.Text +
                         '" AND P.IN_CANCELADO = "0"' +
                         ' AND P.IN_PRODUCAO = "1"' +
                         ' AND P.IN_LIBERADO = "1"' +
                         ' AND F.IN_BLOQUEADO = "0"' +
                         ' AND F.IN_APLICAVEL = "1"' +
//                         ' AND ISNULL( F.DT_REALIZACAO, "" ) = "" ' +
                         ' AND ( P.NR_VOO = "' + msk_nr_voo.Text + '" OR ' +
                         '      P.CD_EMBARCACAO = "' + msk_cd_embarcacao.Text + '")' +
                         ' AND ISNULL( P.NR_VIAGEM, "" ) = "' + msk_nr_viagem.Text + '"';
        qry_exec_.Close;
        qry_exec_.SQL.Clear;
        qry_exec_.SQL.Add( MySQL );
        qry_exec_.ExecSQL;

        datm_main.db_broker.Commit;

        qry_processo_por_veiculo_.Close;
        qry_processo_por_veiculo_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
        qry_processo_por_veiculo_.Prepare;
        qry_processo_por_veiculo_.Open;

      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;
  end;
  mi_salvar.Enabled  := False;
  btn_salvar.Enabled := False;
end;

procedure Tfrm_veiculo_realizacao.btn_salvarClick(Sender: TObject);
var i : Integer;
    MySQL : String;
begin
  with datm_veiculo_realizacao do
  begin
    try
      datm_main.db_broker.StartTransaction;

      for i := 0 to dbgrdProcVeic.SelectedRows.Count - 1 do
      begin
        ActiveControl := nil;
        TTable(dbgrdProcVeic.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdProcVeic.SelectedRows[i]));

        MySQL := 'UPDATE TPROCESSO_POR_VEICULO SET IN_POR_VEICULO = "1" WHERE NR_PROCESSO = "' + qry_processo_por_veiculo_NR_PROCESSO.AsString + '"';
        qry_exec_.Close;
        qry_exec_.SQL.Clear;
        qry_exec_.SQL.Add( MySQL );
        qry_exec_.ExecSQL;
      end;

      CloseStoredProc( sp_atz_veiculo );
      sp_atz_veiculo.ParamByName('@CD_EVENTO').AsString       := msk_cd_evento.Text;
      sp_atz_veiculo.ParamByName('@DT_REALIZACAO').AsDateTime := StrToDate( msk_dt_realizacao.Text );
      sp_atz_veiculo.ParamByName('@CD_USUARIO').AsString      := str_cd_usuario;
      ExecStoredProc(sp_atz_veiculo);
      CloseStoredProc(sp_atz_veiculo);
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    AbreProc;
  end;
end;

procedure Tfrm_veiculo_realizacao.dbchkbox_in_por_veiculoClick(Sender: TObject);
begin
  mi_salvar.Enabled  := True;
  btn_salvar.Enabled := True;
end;


procedure Tfrm_veiculo_realizacao.btn_desmarca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  mi_salvar.Enabled          := False;
  btn_salvar.Enabled         := False;
  btn_marca_todas.Visible    := True;
  btn_desmarca_todas.Visible := False;
  mi_marca.Visible           := True;
  mi_desmarca.Visible        := False;
  if dbgrdProcVeic.SelectedRows.Count > 0 then
     TTable(dbgrdProcVeic.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdProcVeic.SelectedRows[0]));
  for i := 0 to dbgrdProcVeic.SelectedRows.Count - 1 do
  begin
    dbgrdProcVeic.SelectedRows.CurrentRowSelected := False;
    if dbgrdProcVeic.SelectedRows.Count > 0 then
      TTable(dbgrdProcVeic.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdProcVeic.SelectedRows[0]))
    else Break;
  end;
end;

procedure Tfrm_veiculo_realizacao.btn_marca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  mi_salvar.Enabled          := True;
  btn_salvar.Enabled         := True;
  btn_marca_todas.Visible    := False;
  btn_desmarca_todas.Visible := True;
  mi_desmarca.Visible        := True;
  mi_marca.Visible           := False;
  btn_desmarca_todas.Left    := btn_marca_todas.Left;
  if Not ( datm_veiculo_realizacao.qry_processo_por_veiculo_.RecordCount > 0 ) then Exit;
  datm_veiculo_realizacao.qry_processo_por_veiculo_.First;
  for i := 0 to datm_veiculo_realizacao.qry_processo_por_veiculo_.RecordCount - 1 do
  begin
    dbgrdProcVeic.SelectedRows.CurrentRowSelected := True;
    datm_veiculo_realizacao.qry_processo_por_veiculo_.Next;
  end;
end;

procedure Tfrm_veiculo_realizacao.dbgrdProcVeicCellClick(Column: TColumn);
begin
  if dbgrdProcVeic.SelectedRows.Count > 0 then
  begin
    btn_salvar.Enabled := True;
    mi_salvar.Enabled  := True;
  end
  else
  begin
    btn_salvar.Enabled := False;
    mi_salvar.Enabled  := False;
  end;
end;

procedure Tfrm_veiculo_realizacao.btn_co_viagemClick(Sender: TObject);
begin
  with datm_veiculo_realizacao do
  begin
    if Trim( msk_cd_embarcacao.Text ) = '' then
    begin
      BoxMensagem( 'Informe uma Embarcação', 3 );
      msk_cd_embarcacao.SetFocus;
      Exit;
    end;
    vStr_cd_modulo := '01';
    str_cd_rotina := '0124';
    Application.CreateForm( Tfrm_viagem, frm_viagem );
    with frm_viagem do
    begin
      co_cd_unid_neg    := frm_veiculo_realizacao.msk_cd_unid_neg.Text;
      co_cd_produto     := frm_veiculo_realizacao.msk_cd_produto.Text;
      co_cd_embarcacao  := frm_veiculo_realizacao.msk_cd_embarcacao.Text;
      lCons_OnLine      := True;
      ShowModal;
      lCons_OnLine      := False;
      if ( Cons_OnLine_Texto <> '' ) then
      begin
        msk_nr_viagem.Text := Cons_OnLine_Texto;
        msk_nr_viagemExit(nil);
      end;
    end;
    vStr_cd_modulo := st_cd_modulo;
    str_cd_rotina := st_cd_rotina;
  end;
end;

procedure Tfrm_veiculo_realizacao.msk_nr_viagemEnter(Sender: TObject);
begin
  st_viagem := msk_nr_viagem.Text;
end;

procedure Tfrm_veiculo_realizacao.msk_nr_viagemExit(Sender: TObject);
begin
  if ( Not ( st_viagem = msk_nr_viagem.Text ) ) and
     ( Trim( msk_nr_viagem.Text ) <> '' ) then
  begin
    with datm_veiculo_realizacao do
    begin
      qry_viagem_.Close;
      qry_viagem_.ParamByName('CD_UNID_NEG').AsString   := msk_cd_unid_neg.Text;
      qry_viagem_.ParamByName('CD_PRODUTO').AsString    := msk_cd_produto.Text;
      qry_viagem_.ParamByName('CD_EMBARCACAO').AsString := msk_cd_embarcacao.Text;
      qry_viagem_.ParamByName('NR_VIAGEM').AsString     := msk_nr_viagem.Text;
      qry_viagem_.Prepare;
      qry_viagem_.Open;
      if qry_viagem_.RecordCount = 0 then
      begin
        BoxMensagem( 'Nº da Viagem inválido!', 2 );
        msk_nr_viagem.SetFocus;
        Exit;
      end;
      qry_viagem_.Close;
    end;
  end;
  AbreProc;
end;

end.
