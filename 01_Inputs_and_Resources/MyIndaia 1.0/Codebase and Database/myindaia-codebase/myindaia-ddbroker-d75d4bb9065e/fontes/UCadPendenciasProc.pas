unit UCadPendenciasProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, DBTables;

type
  TfrmCadPendenciasProc = class(TForm)
    pgctrl_Pendencia: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_nm_descr: TLabel;
    lbl_dt_feriado: TLabel;
    dbedtDS_PENDENCIA: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    dbedtNM_PENDENCIA: TDBEdit;
    dbedtCD_TP_PENDENCIA: TDBEdit;
    Label1: TLabel;
    dsTpPendencias: TDataSource;
    qryTpPendencias: TQuery;
    upTpPendencias: TUpdateSQL;
    qryTpPendenciasCD_TP_PENDENCIA: TAutoIncField;
    qryTpPendenciasNM_PENDENCIA: TStringField;
    qryTpPendenciasDS_PENDENCIA: TStringField;
    procedure dbedtDS_PENDENCIAChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_PendenciaChange(Sender: TObject);
    procedure pgctrl_PendenciaChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    lRecDesp, lRec : Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frmCadPendenciasProc: TfrmCadPendenciasProc;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017;

procedure TfrmCadPendenciasProc.dbedtDS_PENDENCIAChange(Sender: TObject);
begin
  if ( qryTpPendencias.State in [ dsInsert, dsEdit ] ) then
     btn_Mi( False, True, True, False );
end;

procedure TfrmCadPendenciasProc.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
  lRecDesp     := False;
  lRec         := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  dsTpPendencias.AutoEdit := st_modificar;
  qryTpPendencias.Prepare;
  qryTpPendencias.Open;

  a_str_indices[0] := 'CD_TP_PENDENCIA';
  a_str_indices[1] := 'NM_PENDENCIA';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Cod. Pendência');
    Items.Add('Pendência');
    ItemIndex := 1;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;
end;

procedure TfrmCadPendenciasProc.FormShow(Sender: TObject);
begin
  pgctrl_Pendencia.ActivePage := ts_lista;
  edt_chave.SetFocus;

  qryTpPendencias.Close;
  qryTpPendencias.Prepare;
  qryTpPendencias.Open;

  btn_excluir.Enabled := True;
  mi_excluir.Enabled  := True;
  if qryTpPendencias.RecordCount = 0 then
  begin
     btn_excluir.Enabled := False;
     mi_excluir.Enabled  := False;
  end;
end;

procedure TfrmCadPendenciasProc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  VerAlt;
  qryTpPendencias.Close;
end;

procedure TfrmCadPendenciasProc.btn_incluirClick(Sender: TObject);
begin
  btn_Mi( False, True, True, False );
  qryTpPendencias.DisableControls;
  qryTpPendencias.Cancel;
  qryTpPendencias.Append;
  qryTpPendencias.EnableControls;

  pgctrl_Pendencia.ActivePage := ts_dados_basicos;
  ts_dados_basicos.Enabled     := True;
  pnl_entrada_de_dados.Enabled := True;
end;

procedure TfrmCadPendenciasProc.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure TfrmCadPendenciasProc.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TfrmCadPendenciasProc.Cancelar;
begin
  try
    if qryTpPendencias.State in [dsInsert, dsEdit] then
    begin
      Btn_Mi(st_incluir, False, False, st_excluir );

      qryTpPendencias.Cancel;
      pgctrl_Pendencia.ActivePage := ts_dados_basicos;
      pgctrl_Pendencia.SetFocus;

      pnl_entrada_de_dados.Enabled := False;
      btn_excluir.Enabled := True;
      mi_excluir.Enabled := True;

      if qryTpPendencias.RecordCount = 0 then
      begin
        pnl_entrada_de_dados.Enabled := False;
        btn_excluir.Enabled := False;
        mi_excluir.Enabled := False;
      end;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
end;

procedure TfrmCadPendenciasProc.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Esta data será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    qryTpPendencias.Delete;
    qryTpPendencias.ApplyUpdates;
    datm_main.db_broker.Commit;

  {  qryTpPendencias.DisableControls;
    qryTpPendencias.close;
    qryTpPendencias.Prepare;
    qryTpPendencias.open;
    qryTpPendencias.EnableControls;}
  except
    on E: Exception do
    begin
      qryTpPendencias.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  pgctrl_Pendencia.ActivePage := ts_lista;
end;

procedure TfrmCadPendenciasProc.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadPendenciasProc.edt_chaveChange(Sender: TObject);
begin
  Localiza( qryTpPendencias, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure TfrmCadPendenciasProc.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := qryTpPendenciasCD_TP_PENDENCIA.AsString;
  edt_chave.Text := '';
  qryTpPendencias.Close;
  qryTpPendencias.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  qryTpPendencias.Prepare;
  qryTpPendencias.Open;
  Localiza( qryTpPendencias, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

function TfrmCadPendenciasProc.Consiste : Boolean;
begin
  Consiste := True;
end;

function TfrmCadPendenciasProc.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    If ( qryTpPendencias.State in [dsInsert, dsEdit] ) then
    begin
      qryTpPendencias.Post;
      qryTpPendencias.ApplyUpdates;
      Pesquisa   := qryTpPendenciasNM_PENDENCIA.AsString;

      qryTpPendencias.Close;
      qryTpPendencias.Prepare;
      qryTpPendencias.Open;

      qryTpPendencias.Locate('NM_PENDENCIA', Pesquisa, [] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      qryTpPendencias.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure TfrmCadPendenciasProc.pgctrl_PendenciaChange(Sender: TObject);
begin
  if (pgctrl_Pendencia.ActivePage = ts_lista ) then
  begin
    dbnvg.Enabled     := True;
    edt_chave.Enabled := True;
    cb_ordem.Enabled  := True;
  end
  else
  begin
    dbnvg.Enabled     := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled  := False;
  end;

  If pgctrl_Pendencia.ActivePage = ts_dados_basicos then
  begin
    pnl_entrada_de_dados.Enabled := True;

    If qryTpPendencias.RecordCount = 0 then
       pnl_entrada_de_dados.Enabled := False;
  end;
end;

procedure TfrmCadPendenciasProc.pgctrl_PendenciaChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function TfrmCadPendenciasProc.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( qryTpPendencias.State in [dsEdit] ) and st_modificar ) and (btn_salvar.Enabled = True) or
     ( qryTpPendencias.State in [dsInsert] ) then
  begin
    if BoxMensagem('O cadastro foi alterado.' + #13#10 +
       'Deseja salvar as alterações?', 1) then
    begin
      if Not Consiste then
      begin
        VerAlt := False;
        abort;
      end;
      if Not Grava then
      begin
        VerAlt := False;
        abort;
      end;
    end
    else
      Cancelar;
  end;
end;

procedure TfrmCadPendenciasProc.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;
  mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;
  mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;
  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;
  mi_Cancelar.Enabled  := Canc;
end;

procedure TfrmCadPendenciasProc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;



end.
