unit PGPO005;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCGrids, ExtCtrls, Buttons, Mask, Db, DBCtrls, Grids, DBGrids,
  DbTables, Menus, Funcoes;

type
  Tfrm_po_estorno = class(TForm)
    pnl_po_estorno: TPanel;
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    Label1: TLabel;
    btn_cd_produto: TSpeedButton;
    lbl_nr_processo: TLabel;
    msk_nr_processo: TMaskEdit;
    btn_nr_processo: TSpeedButton;
    rdgrp_prep_embarque: TRadioGroup;
    msk_cd_unid_neg: TMaskEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    edt_nm_produto: TEdit;
    dbgrd_po: TDBGrid;
    menu_estorno: TMainMenu;
    mi_estornar: TMenuItem;
    mi_sair: TMenuItem;
    Panel1: TPanel;
    btn_sair: TSpeedButton;
    btn_estornar: TSpeedButton;
    btn_desmarca_todas: TSpeedButton;
    btn_marca_todas: TSpeedButton;
    mi_marca: TMenuItem;
    mi_desmarca: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_cd_produtoClick(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_nr_processoClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_estornarClick(Sender: TObject);
    procedure dbchkbx_sel_poClick(Sender: TObject);
    procedure btn_marca_todasClick(Sender: TObject);
    procedure btn_desmarca_todasClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    tp_po : String[1];
    { Public declarations }
  end;

var
  frm_po_estorno: Tfrm_po_estorno;

implementation

uses PGSM018, PGSM010, PGSM136, PGGP015, PGPO006, GSMLIB, PGGP017, PGGP001;

{$R *.DFM}


procedure Tfrm_po_estorno.FormShow(Sender: TObject);
begin
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_produtoExit(nil);

  rdgrp_prep_embarque.ItemIndex := 1;

  msk_nr_processo.SetFocus;
  btn_estornar.Enabled       := False;
  mi_estornar.Enabled        := False;
  mi_marca.Enabled           := False;
  mi_desmarca.Enabled        := False;
  btn_desmarca_todas.Enabled := False;
  btn_marca_todas.Enabled    := False;

  if tp_po = '0' then {PO}
  begin
    Caption := 'Estorno / Exclusão de Embarques';
    rdgrp_prep_embarque.Visible := True;
  end
  else {Nacionalização}
  begin
    Caption := 'Estorno de Nacionalizações';
    rdgrp_prep_embarque.Visible := False;
  end;
  btn_estornar.Hint := Caption;
end;

procedure Tfrm_po_estorno.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.text = '' then Exit;
  ValCodEdt(msk_cd_unid_neg);
  with datm_po_estorno do
  begin
    qry_unid_neg_.Close;
    qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_unid_neg_.Open;
    if qry_unid_neg_.RecordCount = 0 then
    begin
      BoxMensagem('Unidade não encontrada!',2);
      msk_cd_unid_neg.Clear;
      edt_nm_unid_neg.Clear;
    end
    else edt_nm_unid_neg.Text:= qry_unid_neg_.FieldByName('AP_UNID_NEG').AsString;
  end;
end;


procedure Tfrm_po_estorno.msk_cd_produtoExit(Sender: TObject);
begin
  edt_nm_produto.Clear;
  if msk_cd_produto.text = '' then Exit;
  ValCodEdt(msk_cd_produto);
  with datm_po_estorno do
  begin
    qry_produto_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
    qry_produto_.Open;
    if qry_produto_.RecordCount = 0 then
    begin
      BoxMensagem('Produto não encontrado!',2);
      msk_cd_produto.Clear;
      edt_nm_Produto.Clear;
    end
    else edt_nm_produto.Text:= qry_produto_.FieldByName('AP_PRODUTO').AsString;
  end;

end;

procedure Tfrm_po_estorno.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_po_estorno.btn_cd_unid_negClick(Sender: TObject);
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
    end;
  end;
  msk_cd_unid_negExit(nil);

end;

procedure Tfrm_po_estorno.btn_cd_produtoClick(Sender: TObject);
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
  end;
  msk_cd_produtoExit(nil);
end;

procedure Tfrm_po_estorno.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_cd_produtoClick(nil);
    if Sender = msk_nr_processo then btn_nr_processoClick(nil);
  end
  else if Key = 27 then Close;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;
end;

procedure Tfrm_po_estorno.btn_nr_processoClick(Sender: TObject);
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
    msk_nr_processo.Text := Copy( frm_consulta_processo.Nr_Processo, 5, 14 );
    msk_nr_processoExit(nil);
  end;
end;

procedure Tfrm_po_estorno.msk_nr_processoExit(Sender: TObject);
begin
  with datm_po_estorno do
  begin
    if msk_nr_processo.Text <> '' then
    begin
      if rdgrp_prep_embarque.ItemIndex = 0 then  // LI
      begin
        qry_li_.Close;
        qry_li_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + Trim(msk_nr_processo.Text);
        qry_li_.Prepare;
        qry_li_.Open;
        if qry_li_.RecordCount = 0 then
        begin
          qry_li_.Close;
          MessageDlg('Não há nenhum PO baixado para este Processo !!', mtError, [mbOk], 0);
          msk_nr_processo.Text         := '';
          msk_nr_processo.Setfocus;
          btn_estornar.Enabled         := False;
          mi_estornar.Enabled          := False;
          mi_marca.Enabled             := False;
          mi_desmarca.Enabled          := False;
          btn_desmarca_todas.Enabled   := False;
          btn_marca_todas.Enabled      := False;
          Exit;
        end
        else
        begin
          if qry_li_NR_REGISTRO_LI.AsString <> '' then
          begin
          qry_li_.Close;
            BoxMensagem( 'LI já foi registrada. Não poderá haver estorno/exclusão.!!', 2 );
            msk_nr_processo.Text         := '';
            msk_nr_processo.SetFocus;
            btn_estornar.Enabled         := False;
            mi_estornar.Enabled          := False;
            mi_marca.Enabled             := False;
            mi_desmarca.Enabled          := False;
            btn_desmarca_todas.Enabled   := False;
            btn_marca_todas.Enabled      := False;
            Exit;
          end;
        end;
      end
      else if rdgrp_prep_embarque.ItemIndex = 1 then
      begin
        qry_di_.Close;
        qry_di_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
        qry_di_.Prepare;
        qry_di_.Open;
        if qry_di_.RecordCount = 0 then
        begin
          qry_di_.Close;
          if tp_po = '0' then  {PO}
            BoxMensagem( 'Não há nenhum PO baixado para este Processo !!', 2 )
          else {Nacionalização}
            BoxMensagem( 'Não há nenhum processo de Nacionalização para este processo D.A.!!', 2 );
          msk_nr_processo.Text         := '';
          msk_nr_processo.SetFocus;
          btn_estornar.Enabled         := False;
          mi_estornar.Enabled          := False;
          mi_marca.Enabled             := False;
          mi_desmarca.Enabled          := False;
          btn_desmarca_todas.Enabled   := False;
          btn_marca_todas.Enabled      := False;
          Exit;
        end
        else
        begin
          if qry_di_NR_DECLARACAO_IMP.AsString <> '' then
          begin
            BoxMensagem( 'DI já foi registrada. Não poderá haver estorno/exclusão.!!', 2 );
            msk_nr_processo.Text         := '';
            msk_nr_processo.SetFocus;
            btn_estornar.Enabled         := False;
            mi_estornar.Enabled          := False;
            mi_marca.Enabled             := False;
            mi_desmarca.Enabled          := False;
            btn_desmarca_todas.Enabled   := False;
            btn_marca_todas.Enabled      := False;
            Exit;
          end;
        end;
      end;
    end
    else
    begin
      dbgrd_po.Enabled := False;
      Exit;
    end;
  end;

  str_nr_processo := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;

  with datm_po_estorno do
  begin
    if rdgrp_prep_embarque.ItemIndex = 0 then    // LI
    begin
      dbgrd_po.DataSource := ds_ret_po_li;

      qry_ret_po_li_.Close;
      qry_ret_po_li_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qry_ret_po_li_.Prepare;
      qry_ret_po_li_.Open;
    end
    else if rdgrp_prep_embarque.ItemIndex = 1 then    // DI
    begin
      dbgrd_po.DataSource := ds_ret_po_di;

      qry_ret_po_di_.Close;
      qry_ret_po_di_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      if tp_po = '0' then {PO}
        qry_ret_po_di_.SQL[4] := ' ( ISNULL( A.NR_DA, "" ) = "" ) '
      else {Nacionalização}
        qry_ret_po_di_.SQL[4] := ' ( ISNULL( A.NR_DA, "" ) <> "" ) ';
      qry_ret_po_di_.Prepare;
      qry_ret_po_di_.Open;
      if qry_ret_po_di_.RecordCount = 0 then
      begin
        qry_ret_po_di_.Close;
        if tp_po = '0' then  {PO}
          BoxMensagem( 'Não há nenhum PO baixado para este Processo !!', 2 )
        else {Nacionalização}
          BoxMensagem( 'Não há nenhuma Nacionalização para esta D.A.!!', 2 );
        msk_nr_processo.Text         := '';
        msk_nr_processo.SetFocus;
        btn_estornar.Enabled         := False;
        mi_estornar.Enabled          := False;
        mi_marca.Enabled             := False;
        mi_desmarca.Enabled          := False;
        btn_desmarca_todas.Enabled   := False;
        btn_marca_todas.Enabled      := False;
        Exit;
      end;
    end;
  end;

  dbgrd_po.Enabled           := True;
  btn_estornar.Enabled       := True;
  mi_estornar.Enabled        := True;
  mi_marca.Enabled           := True;
  mi_desmarca.Enabled        := True;
  btn_desmarca_todas.Enabled := True;
  btn_marca_todas.Enabled    := True;

end;

procedure Tfrm_po_estorno.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_Po_Estorno, datm_Po_Estorno );
end;

procedure Tfrm_po_estorno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_po_estorno do
  begin
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_li_.Close;
    qry_di_.Close;
    qry_ret_po_li_.Close;
    qry_ret_po_di_.Close;
    qry_verif_marc_di_.Close;
    qry_verif_marc_li_.Close;

    tbl_empresa_nac_.Close;

    Free;
  end;
  Action := caFree
end;

procedure Tfrm_po_estorno.btn_estornarClick(Sender: TObject);
var
  i : integer;
begin
  with datm_po_estorno do
  begin
    if dbgrd_po.SelectedRows.Count = 0 then
    begin
      if tp_po = '0' then {PO}
        BoxMensagem( 'Nenhum PO foi selecionado !!', 2 )
      else {Nacionalização}
        BoxMensagem( 'Nenhum processo de Nacionalização foi selecionado!!', 2 );
      Exit;
    end;

    Screen.Cursor := crHourGlass;
    try
      datm_main.db_broker.StartTransaction;

      for i := 0 to dbgrd_po.SelectedRows.Count - 1 do
      begin
        if dbgrd_po.SelectedRows.Count > 0 then
        begin
          if rdgrp_prep_embarque.ItemIndex = 0 then  // LI
          begin
            qry_exec_sp_.SQL.Clear;
            qry_exec_sp_.SQL.Add( 'EXEC sp_po_estorno_li "' + str_nr_processo + '%","' + qry_ret_po_li_NR_PROCESSO.AsString + '"' );
            qry_exec_sp_.ExecSQL;
          end
          else if rdgrp_prep_embarque.ItemIndex = 1 then   // DI
          begin
            qry_exec_sp_.SQL.Clear;
            qry_exec_sp_.SQL.Add( 'EXEC sp_po_estorno_di "' + str_nr_processo + '","' + qry_ret_po_di_NR_PROCESSO.AsString + '"' );
            qry_exec_sp_.ExecSQL;
          end;

          TTable(dbgrd_po.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_po.SelectedRows[0]));
          dbgrd_po.SelectedRows.CurrentRowSelected := False;
        end
        else
          Exit;
      end;

      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    Screen.Cursor := crDefault;

    if tp_po = '0' then {PO}
      BoxMensagem( 'PO estornado com sucesso!!', 3 )
    else {Nacionalização}
      BoxMensagem( 'Nacionalização estornada com sucesso!!', 3 );

    Application.ProcessMessages;

    if rdgrp_prep_embarque.ItemIndex = 0 then    // LI
    begin
      qry_ret_po_li_.Close;
      qry_ret_po_li_.Prepare;
      qry_ret_po_li_.Open;
    end
    else if rdgrp_prep_embarque.ItemIndex = 1 then    // DI
    begin
      qry_ret_po_di_.Close;
      qry_ret_po_di_.Prepare;
      qry_ret_po_di_.Open;
    end;
  end;
end;

procedure Tfrm_po_estorno.dbchkbx_sel_poClick(Sender: TObject);
begin
{
  If not (datm_po_estorno.qry_ret_po_di_.State in [dsEdit,dsInsert]) then
     exit;

  with datm_po_estorno do
  begin
    try
      datm_main.db_broker.StartTransaction;

      If rdgrp_prep_embarque.ItemIndex = 1 then
         qry_ret_po_di_IN_MONTADO.AsString := '1';
      If rdgrp_prep_embarque.ItemIndex = 0 then
         qry_ret_po_li_IN_MONTADO.AsString := '1';

      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;

    If rdgrp_prep_embarque.ItemIndex = 0 then    // LI
    begin
      dbgrd_po.DataSource := ds_ret_po_li;

      qry_ret_po_li_.Close;
      qry_ret_po_li_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qry_ret_po_li_.Prepare;
      qry_ret_po_li_.Open;
    end
    Else If rdgrp_prep_embarque.ItemIndex = 1 then    // DI
    begin
      dbgrd_po.DataSource := ds_ret_po_di;

      qry_ret_po_di_.Close;
      qry_ret_po_di_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qry_ret_po_di_.Prepare;
      qry_ret_po_di_.Open;
    end;
  end;
}

end;


procedure Tfrm_po_estorno.btn_marca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Enabled    := False;
  btn_desmarca_todas.Enabled := True;

  if rdgrp_prep_embarque.ItemIndex = 0 then    // LI
  begin
    datm_po_estorno.qry_ret_po_li_.DisableControls;
    datm_po_estorno.qry_ret_po_li_.First;

    for i := 0 to datm_po_estorno.qry_ret_po_li_.RecordCount - 1 do
    begin
      dbgrd_po.SelectedRows.CurrentRowSelected := True;
      datm_po_estorno.qry_ret_po_li_.Next;
    end;
    datm_po_estorno.qry_ret_po_li_.EnableControls;
  end
  else
  if rdgrp_prep_embarque.ItemIndex = 1 then    // DI
  begin
    datm_po_estorno.qry_ret_po_di_.DisableControls;
    datm_po_estorno.qry_ret_po_di_.First;

    for i := 0 to datm_po_estorno.qry_ret_po_di_.RecordCount - 1 do
    begin
      dbgrd_po.SelectedRows.CurrentRowSelected := True;
      datm_po_estorno.qry_ret_po_di_.Next;
    end;
    datm_po_estorno.qry_ret_po_di_.EnableControls;
  end;
end;

procedure Tfrm_po_estorno.btn_desmarca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Enabled    := True;
  btn_desmarca_todas.Enabled := False;

  if dbgrd_po.SelectedRows.Count > 0 then
     TTable( dbgrd_po.DataSource.DataSet ).GotoBookMark( TBookMark( dbgrd_po.SelectedRows[0] ) );
  if rdgrp_prep_embarque.ItemIndex = 0 then    // LI
  begin
    datm_po_estorno.qry_ret_po_li_.DisableControls;
    for i := 0 to datm_po_estorno.qry_ret_po_li_.RecordCount - 1 do
    begin
      dbgrd_po.SelectedRows.CurrentRowSelected := False;
      if dbgrd_po.SelectedRows.Count > 0 then
         TTable( dbgrd_po.DataSource.DataSet ).GotoBookMark( TBookMark( dbgrd_po.SelectedRows[0] ) )
      else Break;
    end;
    datm_po_estorno.qry_ret_po_li_.EnableControls;
  end
  else
  if rdgrp_prep_embarque.ItemIndex = 1 then    // DI
  begin
    datm_po_estorno.qry_ret_po_di_.DisableControls;
    for i := 0 to datm_po_estorno.qry_ret_po_di_.RecordCount - 1 do
    begin
      dbgrd_po.SelectedRows.CurrentRowSelected := False;
      if dbgrd_po.SelectedRows.Count > 0 then
         TTable(dbgrd_po.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_po.SelectedRows[0]))
      else Break;
    end;
    datm_po_estorno.qry_ret_po_di_.EnableControls;
  end;
end;

procedure Tfrm_po_estorno.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

end.




