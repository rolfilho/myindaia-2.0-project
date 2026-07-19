unit PGSM172;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls;

type
  Tfrm_ct_custo = class(TForm)
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_nm_item: TLabel;
    lbl_cd_item: TLabel;
    dbedt_nm_ct_custo: TDBEdit;
    dbedt_cd_ct_custo: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pgctrl_ct_custo: TPageControl;
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
    procedure dbedt_nm_ct_custoChange(Sender: TObject);
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
    procedure pgctrl_ct_custoChange(Sender: TObject);
    procedure pgctrl_ct_custoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_ct_custoChange(Sender: TObject);
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
  frm_ct_custo: Tfrm_ct_custo;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGSM173;

procedure Tfrm_ct_custo.dbedt_nm_ct_custoChange(Sender: TObject);
begin
  if ( datm_ct_custo.qry_ct_custo_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_ct_custo.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

 { Inicializa o Data Module para Contas Gerenciais}
  Application.CreateForm( Tdatm_ct_custo, datm_ct_custo );

  with datm_ct_custo do
  begin
    ds_ct_custo.AutoEdit := st_modificar;

    qry_ct_custo_.Close;
    qry_ct_custo_.SQL[3] := 'NM_CT_CUSTO';
    qry_ct_custo_.Prepare;
    qry_ct_custo_.Open;
  end;

  a_str_indices[0] := 'CD_CT_CUSTO';
  a_str_indices[1] := 'NM_CT_CUSTO';

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

procedure Tfrm_ct_custo.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_ct_custo.ActivePage := ts_lista;
  edt_chave.SetFocus;
  with datm_ct_custo do
  begin
    qry_ct_custo_.Close;
    qry_ct_custo_.SQL[3] := 'NM_CT_CUSTO';
    qry_ct_custo_.Prepare;
    qry_ct_custo_.Open;
  end;
end;

procedure Tfrm_ct_custo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_ct_custo do
    begin
      qry_ct_custo_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_ct_custo.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_ct_custo.qry_ct_custo_CD_CT_CUSTO.AsString;
    except
      try
        Cons_OnLine_Texto := datm_ct_custo.qry_ct_custo_CD_CT_CUSTO.AsString;
      except
        BoxMensagem('Não consegui retornar Código da Conta Custo!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_ct_custo.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_ct_custo.btn_incluirClick(Sender: TObject);
begin
  ActiveControl := nil;
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  with datm_ct_custo do
  begin
    qry_ct_custo_.DisableControls;
    qry_ct_custo_.Cancel;
    qry_ct_custo_.Append;
    qry_ct_custo_.EnableControls;
  end;
  pgctrl_ct_custo.ActivePage := ts_dados_basicos;
  dbedt_cd_ct_custo.SetFocus;
end;

procedure Tfrm_ct_custo.btn_salvarClick(Sender: TObject);
begin
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_ct_custo.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_ct_custo.Cancelar;
begin
  try
    if datm_ct_custo.qry_ct_custo_.State in [dsInsert, dsEdit] then
    begin
      datm_ct_custo.qry_ct_custo_.Cancel;
      pgctrl_ct_custo.ActivePage := ts_dados_basicos;
      dbedt_nm_ct_custo.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_ct_custo.btn_excluirClick(Sender: TObject);
var
  cd_ct_custo : String[3];
begin
  if BoxMensagem( 'Esta Conta Custo será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    cd_ct_custo := datm_ct_custo.qry_ct_custo_CD_CT_CUSTO.AsString;
    datm_ct_custo.qry_ct_custo_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_ct_custo.qry_ct_custo_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  pgctrl_ct_custo.ActivePage := ts_lista;
end;

procedure Tfrm_ct_custo.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ct_custo.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_ct_custo.qry_ct_custo_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_ct_custo.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_ct_custo.qry_ct_custo_CD_CT_CUSTO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_ct_custo.qry_ct_custo_.Close;
  datm_ct_custo.qry_ct_custo_.SQL[3] := a_str_indices[cb_ordem.ItemIndex];
  datm_ct_custo.qry_ct_custo_.Prepare;
  datm_ct_custo.qry_ct_custo_.Open;
  Localiza(datm_ct_custo.qry_ct_custo_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

function Tfrm_ct_custo.Consiste : Boolean;
begin
  Consiste := True;
  {Código}
  if dbedt_cd_ct_custo.Text = '' then
  begin
    BoxMensagem('Campo Código deve ser preenchido!', 2);
    pgctrl_ct_custo.ActivePage := ts_dados_basicos;
    dbedt_cd_ct_custo.SetFocus;
    Consiste := False;
    Exit;
  end;

  {Descrição}
  if dbedt_nm_ct_custo.Text = '' then
  begin
    BoxMensagem('Campo Descrição deve ser preenchido!', 2);
    pgctrl_ct_custo.ActivePage := ts_dados_basicos;
    dbedt_nm_ct_custo.SetFocus;
    Consiste := False;
    Exit;
  end;
end;

function Tfrm_ct_custo.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_ct_custo.qry_ct_custo_.State in [dsInsert, dsEdit] ) then
    begin
      datm_ct_custo.qry_ct_custo_.Post;
      Pesquisa := datm_ct_custo.qry_ct_custo_CD_CT_CUSTO.AsString;
      datm_ct_custo.qry_ct_custo_.Close;
      datm_ct_custo.qry_ct_custo_.Prepare;
      datm_ct_custo.qry_ct_custo_.Open;
      Localiza(datm_ct_custo.qry_ct_custo_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_ct_custo.qry_ct_custo_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  btn_mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_ct_custo.pgctrl_ct_custoChange(Sender: TObject);
begin
  if (pgctrl_ct_custo.ActivePage = ts_lista ) then
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

procedure Tfrm_ct_custo.pgctrl_ct_custoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_ct_custo.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_ct_custo.qry_ct_custo_.State in [dsEdit] ) and st_modificar ) or
     ( datm_ct_custo.qry_ct_custo_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Contas Gerenciais foi alterado.' + #13#10 +
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

procedure Tfrm_ct_custo.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_ct_custo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_ct_custo.dbedt_cd_ct_custoChange(Sender: TObject);
begin
  if ( datm_ct_custo.qry_ct_custo_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

end.
