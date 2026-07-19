unit PGSM006;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, DBCGrids, PGGP001, Funcoes;

type
  Tfrm_observacoes = class(TForm)
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
    lbl_codigo: TLabel;
    lbl_descricao: TLabel;
    lbl_texto: TLabel;
    pgctrl: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_lin: TLabel;
    lbl_col: TLabel;
    lbl_dois_pontos: TLabel;
    dbedt_cd_obs: TDBEdit;
    dbedt_tx_obs: TDBEdit;
    dbmemo_texto: TDBMemo;
    dbg_cadastro: TDBGrid;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    lbl_cd_produto: TLabel;
    edt_nm_produto: TEdit;
    dbedt_cd_produto: TDBEdit;
    btn_co_produto: TSpeedButton;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_tx_obsChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pgctrlChanging(Sender: TObject; var AllowChange: Boolean);
    procedure dbedt_cd_produtoChange(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
  private
    Pesquisa, st_modulo, st_rotina : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    function Veralt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
  public
    { Public declarations }
    lCons_OnLine : Boolean;
    Cons_OnLine : TMemoField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_observacoes: Tfrm_observacoes;

implementation

uses GSMLIB, PGGP017, PGSM009, ConsOnlineEx;

{$R *.DFM}

procedure alterna( Status: Boolean );
var i : Integer;
begin
  With frm_observacoes do
  begin
    if Status then
    begin
      for i := 0 to ComponentCount - 1 do
        if ( Components[i] is TSpeedButton ) then ( Components[i] as TSpeedButton ).Enabled := Not ( Components[i] as TSpeedButton ).Enabled
           else if ( Components[i] is TMenuItem ) then ( Components[i] as TMenuItem ).Enabled := Not ( Components[i] as TMenuItem ).Enabled;
    end
    else
    begin
       btn_incluir.Enabled := false;
       btn_excluir.Enabled := false;
       btn_sair.Enabled := false;
       btn_salvar.Enabled := true;
       btn_cancelar.Enabled := true;
       mi_incluir.Enabled := false;
       mi_excluir.Enabled := false;
       mi_salvar.Enabled := true;
       mi_cancelar.Enabled := true;
       mi_sair.Enabled := false;
    end;
  end;
end;

procedure Tfrm_observacoes.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  with datm_obs do
  begin
    qry_obs_.DisableControls;
    qry_obs_.Cancel;
    qry_obs_.Append;
    qry_obs_CD_PRODUTO.AsString := str_cd_produto;
    qry_obs_.EnableControls;
    qry_obs_CD_OBS.AsString  := UltCod( datm_obs.qry_ult_obs_, datm_obs.qry_ult_obs_ULTIMO );
  end;
  PgCtrl.ActivePage := ts_dados_basicos;
  dbedt_tx_obs.SetFocus;
end;

procedure Tfrm_observacoes.btn_salvarClick(Sender: TObject);
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_obs.qry_obs_.State in [dsInsert, dsEdit] ) then
    begin
       datm_obs.qry_obs_.Post;
       //alterna( true );
    end;
    datm_main.db_broker.Commit;
  except
    if datm_main.db_broker.InTransaction then
       datm_main.db_broker.Rollback;
    ActiveControl := nil;
    BoxMensagem( 'Erro - operação de atualização. Tente gravar novamente.', 2 );
    datm_obs.qry_obs_.Cancel;
  end;

  btn_mi(st_incluir, False, False, st_excluir );
end;


procedure Tfrm_observacoes.btn_cancelarClick(Sender: TObject);
begin
  datm_obs.qry_obs_.Cancel;
  btn_mi( st_incluir, False, False, st_excluir );
  //alterna( true );
end;

procedure Tfrm_observacoes.btn_excluirClick(Sender: TObject);
begin
  if MessageDlg('Esta observação será excluída! Confirma exclusão?',
     mtConfirmation,
     [mbYes, mbNo], 0) = mrYes then
  begin
    try
      datm_obs.qry_obs_.delete;
      PgCtrl.ActivePage := ts_lista;
    except
      MessageDlg('Exclusão não pode ser realizada.', mtError, [mbOk], 0)
    end;
  end;
end;

procedure Tfrm_observacoes.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_observacoes.edt_chaveChange(Sender: TObject);
begin
  Localiza( datm_obs.qry_obs_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_observacoes.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_observacoes.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_obs.qry_obs_CD_OBS.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_obs.qry_obs_.Close;
  datm_obs.qry_obs_.SQL[3] := a_str_indices[cb_ordem.ItemIndex];
  datm_obs.qry_obs_.DisableControls;
  datm_obs.qry_obs_.Open;
  datm_obs.qry_obs_.EnableControls;
  Localiza( datm_obs.qry_obs_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_observacoes.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      if Not (TTable(Cons_OnLine.DataSet).State in [dsEdit, dsInsert]) then
         TTable(Cons_OnLine.DataSet).Edit;
      if Cons_OnLine.AsString = '' then
         Cons_OnLine.AsString := datm_obs.qry_obs_TX_OBS.AsString
      else
         Cons_OnLine.AsString := Cons_OnLine.AsString + #13 + datm_obs.qry_obs_TX_OBS.AsString;
    except
      BoxMensagem('Não consegui retornar Observação!', 2);
    end;
    Close;
  end;
end;

procedure Tfrm_observacoes.dbg_cadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_observacoes.dbedt_tx_obsChange(Sender: TObject);
begin
  if ( datm_obs.qry_obs_.State in [ dsInsert, dsEdit ] ) then
  begin
   //alterna( false );
   btn_mi( False, True, True, False );
  end;
end;

procedure Tfrm_observacoes.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  st_modulo    := vStr_cd_modulo;
  st_rotina    := str_cd_rotina;

 { Inicializa o Data Module para Obervações}
  Application.CreateForm(Tdatm_obs, datm_obs);

  with datm_obs do
  begin
    ds_obs.AutoEdit := st_modificar;

    qry_obs_.Close;
    qry_obs_.Prepare;
    qry_obs_.Open;
  end;

  a_str_indices[0] := 'CD_OBS';
  a_str_indices[1] := 'TX_DESCRICAO';
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

procedure Tfrm_observacoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_observacoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_obs.qry_obs_.Close;
  datm_obs.Free;
  Action := caFree;
end;

procedure Tfrm_observacoes.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbg_cadastroDblClick(nil);
end;

procedure Tfrm_observacoes.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_observacoes.pgctrlChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  VerAlt;
end;

function Tfrm_observacoes.Veralt;
begin
  Veralt := True;
  if ( pgctrl.ActivePage = ts_dados_basicos ) then
  begin
    if ( ( datm_obs.qry_obs_.State in [dsEdit] ) and st_modificar ) or
       ( datm_obs.qry_obs_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Observações foi alterado.' + #13#10 +
         'Deseja salvar as alterações?', 1) then
      begin
        btn_salvarClick(nil);
      end
      else
        btn_cancelarClick(nil);
    end;
  end;
end;

procedure Tfrm_observacoes.dbedt_cd_produtoChange(Sender: TObject);
begin
  if datm_obs.qry_obs_.State in [dsEdit, dsInsert] then
  begin
    btn_mi(False, True, True, False);
    btn_co_produtoClick(Sender);
  end;
end;

procedure Tfrm_observacoes.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    dbedt_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto', ['CD_PRODUTO','AP_PRODUTO'], ['Código','Descrição'], 'CD_PRODUTO', nil, 1, dbedt_cd_produto.Text)
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', dbedt_cd_produto.Text, 'AP_PRODUTO');
end;

end.

