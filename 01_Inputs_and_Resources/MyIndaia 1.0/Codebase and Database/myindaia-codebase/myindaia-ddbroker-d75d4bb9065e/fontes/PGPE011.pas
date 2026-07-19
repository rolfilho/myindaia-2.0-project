unit PGPE011;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCGrids, ExtCtrls, Buttons, Mask, Db, DBCtrls, Grids, DBGrids,
  DbTables, Menus, Funcoes;

type
  Tfrm_pe_estorno = class(TForm)
    menu_estorno: TMainMenu;
    mi_estornar: TMenuItem;
    mi_sair: TMenuItem;
    mi_marca: TMenuItem;
    mi_desmarca: TMenuItem;
    pnl_pe_estorno: TPanel;
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    lbl_nr_processo: TLabel;
    btn_nr_processo: TSpeedButton;
    mskedt_nr_processo: TMaskEdit;
    mskedt_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    dbgrd_pe: TDBGrid;
    panel1: TPanel;
    btn_sair: TSpeedButton;
    btn_estornar: TSpeedButton;
    btn_desmarca_todas: TSpeedButton;
    btn_marca_todas: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure mskedt_cd_unid_negExit(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure mskedt_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_nr_processoClick(Sender: TObject);
    procedure mskedt_nr_processoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_estornarClick(Sender: TObject);
    procedure btn_marca_todasClick(Sender: TObject);
    procedure btn_desmarca_todasClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pe_estorno: Tfrm_pe_estorno;

implementation

uses PGSM018, PGSM010, PGGP015, GSMLIB, PGGP017, PGGP001, PGPE012, PGSM136;

{$R *.DFM}


procedure Tfrm_pe_estorno.FormShow(Sender: TObject);
begin
  mskedt_cd_unid_neg.Text := str_cd_unid_neg;
  mskedt_cd_unid_negExit(nil);

  mskedt_nr_processo.SetFocus;
  btn_estornar.Enabled       := False;
  mi_estornar.Enabled        := False;
  mi_marca.Enabled           := False;
  mi_desmarca.Enabled        := False;
  btn_desmarca_todas.Enabled := False;
  btn_marca_todas.Enabled    := False;

end;

procedure Tfrm_pe_estorno.mskedt_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if mskedt_cd_unid_neg.text = '' then Exit;
  ValCodEdt(mskedt_cd_unid_neg);
  with datm_pe_estorno do
  begin
    qry_unid_neg_.Close;
    qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := mskedt_cd_unid_neg.Text;
    qry_unid_neg_.Open;
    if Trim(qry_unid_neg_CD_UNID_NEG.AsString) = '' then
    begin
      BoxMensagem('Unidade não encontrada!',2);
      mskedt_cd_unid_neg.Clear;
      edt_nm_unid_neg.Clear;
    end
    else edt_nm_unid_neg.Text:= qry_unid_neg_.FieldByName('AP_UNID_NEG').AsString;
  end;
end;


procedure Tfrm_pe_estorno.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_pe_estorno.btn_cd_unid_negClick(Sender: TObject);
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
    mskedt_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    mskedt_cd_unid_negExit(nil);
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      mskedt_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    end;
  end;
  mskedt_cd_unid_negExit(nil);

end;

procedure Tfrm_pe_estorno.mskedt_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = mskedt_cd_unid_neg then btn_cd_unid_negClick(nil);
    if Sender = mskedt_nr_processo then btn_nr_processoClick(nil);
  end
  else if Key = 27 then Close;
  if ( Key = VK_F8 ) and ( Sender = mskedt_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      mskedt_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      mskedt_nr_processoExit(nil);
    end;
  end;
end;

procedure Tfrm_pe_estorno.btn_nr_processoClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_consulta_processo,frm_consulta_processo);
  frm_consulta_processo.str_cd_unid := mskedt_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := '02';
  frm_consulta_processo.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if (frm_consulta_processo.Nr_Processo <> '') then
  begin
    mskedt_nr_processo.Text := Copy( frm_consulta_processo.Nr_Processo, 5, 14 );
    mskedt_nr_processoExit(nil);
  end;
end;

procedure Tfrm_pe_estorno.mskedt_nr_processoExit(Sender: TObject);
begin

  with datm_pe_estorno do
  begin
    if mskedt_nr_processo.Text <> '' then
    begin
      qry_exp_.Close;
      qry_exp_.ParamByName('NR_PROCESSO').AsString := mskedt_cd_unid_neg.Text+'02'+mskedt_nr_processo.Text;
      qry_exp_.Prepare;
      qry_exp_.Open;
      if qry_exp_.EOF then
      begin
        qry_exp_.Close;
        MessageDlg('Não há nenhum PE baixado para este Processo !!', mtError, [mbOk], 0);
        mskedt_nr_processo.Text      := '';
        mskedt_nr_processo.Setfocus;
        btn_estornar.Enabled         := False;
        mi_estornar.Enabled          := False;
        mi_marca.Enabled             := False;
        mi_desmarca.Enabled          := False;
        btn_desmarca_todas.Enabled   := False;
        btn_marca_todas.Enabled      := False;
        Exit;
      end;
    end
    else
    begin
      dbgrd_pe.Enabled := False;
      Exit;
    end;
  end;

  str_nr_processo := mskedt_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text;

  with datm_pe_estorno do
  begin
    dbgrd_pe.DataSource := ds_ret_pe_exp;

    qry_ret_pe_exp_.Close;
    qry_ret_pe_exp_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_ret_pe_exp_.ParamByName('CD_UNID_NEG').AsString := mskedt_cd_unid_neg.Text;
    qry_ret_pe_exp_.Prepare;
    qry_ret_pe_exp_.Open;
  end;

  dbgrd_pe.Enabled           := True;
  btn_estornar.Enabled       := True;
  mi_estornar.Enabled        := True;
  mi_marca.Enabled           := True;
  mi_desmarca.Enabled        := True;
  btn_desmarca_todas.Enabled := True;
  btn_marca_todas.Enabled    := True;

end;



procedure Tfrm_pe_estorno.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_pe_Estorno, datm_pe_Estorno );
end;


procedure Tfrm_pe_estorno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_pe_estorno do
  begin
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_exp_.Close;
    qry_ret_pe_exp_.Close;

    Free;
  end;
  Action := caFree

end;


procedure Tfrm_pe_estorno.btn_estornarClick(Sender: TObject);
var
  i : integer;

begin

  if dbgrd_pe.SelectedRows.Count = 0 then
  begin
    BoxMensagem('Nenhum PE foi selecionado !!', 2);
    Exit;
  end;

  try
    datm_main.db_broker.StartTransaction;

    for i := 0 to dbgrd_pe.SelectedRows.Count - 1 do
    begin

      if dbgrd_pe.SelectedRows.Count > 0 then
      begin
        datm_pe_estorno.qry_exec_sp_.SQL.Clear;
        datm_pe_estorno.qry_exec_sp_.SQL.Add( 'EXEC sp_pe_estorno_exp "' + str_nr_processo + '","' +
                                                                           datm_pe_estorno.qry_ret_pe_exp_NR_PROCESSO.AsString + '","' +
                                                                           mskedt_cd_unid_neg.Text + '"' );
        datm_pe_estorno.qry_exec_sp_.ExecSQL;

        TTable(dbgrd_pe.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_pe.SelectedRows[0]));
        dbgrd_pe.SelectedRows.CurrentRowSelected := False;
      end
      else
        exit;
    end;

    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  Application.ProcessMessages;

  with datm_pe_estorno do
  begin
    qry_ret_pe_exp_.Close;
    qry_ret_pe_exp_.Prepare;
    qry_ret_pe_exp_.Open;
  end;
end;


procedure Tfrm_pe_estorno.btn_marca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Enabled    := False;
  btn_desmarca_todas.Enabled := True;

  datm_pe_estorno.qry_ret_pe_exp_.First;
  for i := 0 to datm_pe_estorno.qry_ret_pe_exp_.RecordCount - 1 do
  begin
    dbgrd_pe.SelectedRows.CurrentRowSelected := True;
    datm_pe_estorno.qry_ret_pe_exp_.Next;
  end;
end;

procedure Tfrm_pe_estorno.btn_desmarca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Enabled    := True;
  btn_desmarca_todas.Enabled := False;

  if dbgrd_pe.SelectedRows.Count > 0 then
  begin
    TTable(dbgrd_pe.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_pe.SelectedRows[0]));
    for i := 0 to datm_pe_estorno.qry_ret_pe_exp_.RecordCount - 1 do
    begin
      dbgrd_pe.SelectedRows.CurrentRowSelected := False;
      if dbgrd_pe.SelectedRows.Count > 0 then
         TTable(dbgrd_pe.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_pe.SelectedRows[0]))
      else Break;
    end;
  end;
end;

procedure Tfrm_pe_estorno.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
end;

end.


