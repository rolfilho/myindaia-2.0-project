unit PGSM174;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DbTables, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls;

type
  Tfrm_hist_padrao = class(TForm)
    pgctrl_hist_padrao: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_nm_historico: TLabel;
    lbl_cd_historico: TLabel;
    dbedt_nm_historico: TDBEdit;
    dbedt_cd_historico: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    lbl_historico: TLabel;
    dbm_tx_historico: TDBMemo;
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
    procedure dbedt_nm_historicoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_hist_padraoChange(Sender: TObject);
    procedure pgctrl_hist_padraoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;

    lCons_OnLineMemo : Boolean;
    Cons_OnLineMemo : TMemoField;
    Cons_OnLineMemo_Texto : TStrings;
  end;

var
  frm_hist_padrao: Tfrm_hist_padrao;

implementation

uses PGSM175, GSMLIB, PGGP001, PGGP017;

{$R *.DFM}

procedure Tfrm_hist_padrao.dbedt_nm_historicoChange(Sender: TObject);
begin
  if ( datm_hist_padrao.qry_hist_padrao_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_hist_padrao.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

 { Inicializa o Data Module para Históricos}
  Application.CreateForm( Tdatm_hist_padrao, datm_hist_padrao );

  with datm_hist_padrao do
  begin
    ds_hist_padrao.AutoEdit := st_modificar;

    qry_hist_lista_.Close;
    qry_hist_lista_.SQL[3] := 'NM_HISTORICO';
    qry_hist_lista_.Prepare;
    qry_hist_lista_.Open;
  end;

  a_str_indices[0] := 'CD_HISTORICO';
  a_str_indices[1] := 'NM_HISTORICO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

end;

procedure Tfrm_hist_padrao.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_hist_padrao.ActivePage := ts_lista;
  edt_chave.SetFocus;
  with datm_hist_padrao do
  begin
    qry_hist_lista_.Close;
    qry_hist_lista_.SQL[3] := 'NM_HISTORICO';
    qry_hist_lista_.Prepare;
    qry_hist_lista_.Open;
  end;
end;

procedure Tfrm_hist_padrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_hist_padrao do
    begin
      qry_hist_padrao_.Close;
      qry_hist_lista_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_hist_padrao.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_hist_padrao.qry_hist_padrao_CD_HISTORICO.AsString;
    except
      try
        Cons_OnLine_Texto := datm_hist_padrao.qry_hist_padrao_CD_HISTORICO.AsString;
      except
        BoxMensagem( 'Não consegui retornar Código do Histórico!', 2 );
      end;
    end;
    Close;
  end;
  if lCons_OnLineMemo then
  begin
    try
      if Not ( TTable( Cons_OnLineMemo.DataSet ).State in [ dsEdit, dsInsert ] ) then
         TTable( Cons_OnLineMemo.DataSet ).Edit;
      if Cons_OnLineMemo.AsString <> '' then
         Cons_OnLineMemo.AsString := Cons_OnLineMemo.AsString + #13 + datm_hist_padrao.qry_hist_padrao_TX_HISTORICO.AsString
      else
         Cons_OnLineMemo.AsString := datm_hist_padrao.qry_hist_padrao_TX_HISTORICO.AsString;

    except
      try
        Cons_OnLineMemo_Texto.Clear;
        Cons_OnLineMemo_Texto.Add( datm_hist_padrao.qry_hist_padrao_TX_HISTORICO.AsString );
      except
        BoxMensagem( 'Não consegui retornar Histórico Padrão!', 2 );
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_hist_padrao.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_hist_padrao.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  with datm_hist_padrao do
  begin
    qry_hist_padrao_.DisableControls;
    qry_hist_padrao_.Cancel;
    qry_hist_padrao_.Append;
    qry_hist_padrao_CD_HISTORICO.AsString  := UltCod( qry_ult_historico_, qry_ult_historico_ULTIMO );
    qry_hist_padrao_.EnableControls;
  end;
  pgctrl_hist_padrao.ActivePage := ts_dados_basicos;
  dbedt_nm_historico.SetFocus;
end;

procedure Tfrm_hist_padrao.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_hist_padrao.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_hist_padrao.Cancelar;
begin
  try
    if datm_hist_padrao.qry_hist_padrao_.State in [dsInsert, dsEdit] then
    begin
      datm_hist_padrao.qry_hist_padrao_.Cancel;
      pgctrl_hist_padrao.ActivePage := ts_dados_basicos;
      dbedt_nm_historico.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_hist_padrao.btn_excluirClick(Sender: TObject);
var
  cd_historico : String[3];
begin
  if BoxMensagem( 'Este Histórico será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    cd_historico := datm_hist_padrao.qry_hist_padrao_CD_HISTORICO.AsString;
    datm_hist_padrao.qry_hist_padrao_.Delete;
    datm_hist_padrao.qry_hist_lista_.Close;
    datm_hist_padrao.qry_hist_lista_.Prepare;
    datm_hist_padrao.qry_hist_lista_.Open;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_hist_padrao.qry_hist_padrao_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  pgctrl_hist_padrao.ActivePage := ts_lista;
end;

procedure Tfrm_hist_padrao.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_hist_padrao.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_hist_padrao.qry_hist_lista_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_hist_padrao.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_hist_padrao.qry_hist_lista_CD_HISTORICO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_hist_padrao.qry_hist_lista_.Close;
  datm_hist_padrao.qry_hist_lista_.SQL[3] := a_str_indices[cb_ordem.ItemIndex];
  datm_hist_padrao.qry_hist_lista_.Prepare;
  datm_hist_padrao.qry_hist_lista_.Open;
  Localiza(datm_hist_padrao.qry_hist_lista_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

function Tfrm_hist_padrao.Consiste : Boolean;
begin
  Consiste := True;

  {Descrição}
  if dbedt_nm_historico.Text = '' then
  begin
    BoxMensagem('Campo Descrição deve ser preenchido!', 2);
    pgctrl_hist_padrao.ActivePage := ts_dados_basicos;
    dbedt_nm_historico.SetFocus;
    Consiste := False;
    Exit;
  end;
end;

function Tfrm_hist_padrao.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_hist_padrao.qry_hist_padrao_.State in [dsInsert, dsEdit] ) then
    begin
      datm_hist_padrao.qry_hist_padrao_.Post;
      Pesquisa := datm_hist_padrao.qry_hist_padrao_CD_HISTORICO.AsString;
      datm_hist_padrao.qry_hist_lista_.Close;
      datm_hist_padrao.qry_hist_lista_.Prepare;
      datm_hist_padrao.qry_hist_lista_.Open;
      Localiza(datm_hist_padrao.qry_hist_lista_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_hist_padrao.qry_hist_padrao_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  btn_mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_hist_padrao.pgctrl_hist_padraoChange(Sender: TObject);
begin
  if (pgctrl_hist_padrao.ActivePage = ts_lista ) then
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
end;

procedure Tfrm_hist_padrao.pgctrl_hist_padraoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_hist_padrao.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_hist_padrao.qry_hist_padrao_.State in [dsEdit] ) and st_modificar ) or
     ( datm_hist_padrao.qry_hist_padrao_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Histórico Padrão foi alterado.' + #13#10 +
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

procedure Tfrm_hist_padrao.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_hist_padrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_hist_padrao.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbg_cadastroDblClick(nil);
end;

end.
