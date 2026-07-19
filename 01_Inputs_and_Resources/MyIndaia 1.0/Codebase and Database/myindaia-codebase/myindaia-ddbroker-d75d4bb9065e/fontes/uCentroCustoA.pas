unit uCentroCustoA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls;

type
  Tfrm_centro_custoA = class(TForm)
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_nm_item: TLabel;
    lbl_cd_item: TLabel;
    dbedt_nm_centro_custo: TDBEdit;
    dbedt_cd_coligada: TDBEdit;
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
    Label1: TLabel;
    dbedt_cd_centro_custo: TDBEdit;
    procedure dbedt_nm_centro_custoChange(Sender: TObject);
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
    //aqui
  //  procedure dbedt_cd_coligadaChange(Sender: TObject);
  private
    a_str_indices : Array[0..2] Of String[60];
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
  frm_centro_custoA: Tfrm_centro_custoA;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, dCentroCusto, PGSM173;

procedure Tfrm_centro_custoA.dbedt_nm_centro_custoChange(Sender: TObject);
begin
  if ( datm_centro_custo.qry_centro_custo_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_centro_custoA.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  // Habilita menu conforme direitos do cargo do usuário
  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  // Inicializa o Data Module para Contas Gerenciais
  Application.CreateForm( Tdatm_centro_custo, datm_centro_custo );

  with datm_centro_custo do
  begin
    ds_centro_custo.AutoEdit := st_modificar;

    qry_centro_custo_.Close;
    qry_centro_custo_.SQL[3] := 'NM_CT_CUSTO';
    qry_centro_custo_.Prepare;
    qry_centro_custo_.Open;
  end;

  a_str_indices[0] := 'CD_COLIGADA';
  a_str_indices[1] := 'CD_CT_CUSTO';
  a_str_indices[2] := 'NM_CT_CUSTO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Coligada');
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;
end;

procedure Tfrm_centro_custoA.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_ct_custo.ActivePage := ts_lista;
  edt_chave.SetFocus;
  with datm_centro_custo do
  begin
    qry_centro_custo_.Close;
    qry_centro_custo_.SQL[3] := 'NM_CT_CUSTO';
    qry_centro_custo_.Prepare;
    qry_centro_custo_.Open;
  end;
end;

procedure Tfrm_centro_custoA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_centro_custo do
    begin
      qry_centro_custo_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_centro_custoA.dbg_cadastroDblClick(Sender: TObject);
begin
//aqui
  if lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_centro_custo.qry_centro_custo_CD_COLIGADA.AsString;
      Cons_OnLine.AsString := datm_centro_custo.qry_centro_custo_CD_CT_CUSTO.AsString;
    except
      try
        Cons_OnLine_Texto := datm_centro_custo.qry_centro_custo_CD_COLIGADA.AsString;
        Cons_OnLine_Texto := datm_centro_custo.qry_centro_custo_CD_CT_CUSTO.AsString;
      except
        BoxMensagem('Não consegui retornar Código da Conta Custo!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_centro_custoA.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_centro_custoA.btn_incluirClick(Sender: TObject);
begin
  ActiveControl := nil;
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  with datm_centro_custo do
  begin
    qry_centro_custo_.DisableControls;
    qry_centro_custo_.Cancel;
    qry_centro_custo_.Append;
    qry_centro_custo_.EnableControls;
  end;
  pgctrl_ct_custo.ActivePage := ts_dados_basicos;
  dbedt_cd_coligada.SetFocus;
end;

procedure Tfrm_centro_custoA.btn_salvarClick(Sender: TObject);
begin
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_centro_custoA.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_centro_custoA.Cancelar;
begin
  try
    if datm_centro_custo.qry_centro_custo_.State in [dsInsert, dsEdit] then
    begin
      datm_centro_custo.qry_centro_custo_.Cancel;
      pgctrl_ct_custo.ActivePage := ts_dados_basicos;
      dbedt_nm_centro_custo.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_centro_custoA.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Esta Conta Custo será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_centro_custo.qry_centro_custo_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_centro_custo.qry_centro_custo_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  pgctrl_ct_custo.ActivePage := ts_lista;
end;

procedure Tfrm_centro_custoA.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_centro_custoA.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_centro_custo.qry_centro_custo_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_centro_custoA.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_centro_custo.qry_centro_custo_CD_CT_CUSTO.AsString;
  //  Apaga o campo de pesquisa
  edt_chave.Text := '';

  datm_centro_custo.qry_centro_custo_.Close;
  datm_centro_custo.qry_centro_custo_.SQL[3] := a_str_indices[cb_ordem.ItemIndex];
  datm_centro_custo.qry_centro_custo_.Prepare;
  datm_centro_custo.qry_centro_custo_.Open;
  Localiza(datm_centro_custo.qry_centro_custo_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

function Tfrm_centro_custoA.Consiste : Boolean;
begin
  Consiste := True;
  // Coligada
  if dbedt_cd_coligada.Text = '' then
  begin
    BoxMensagem('Campo Coligada deve ser preenchido!', 2);
    pgctrl_ct_custo.ActivePage := ts_dados_basicos;
    dbedt_cd_coligada.SetFocus;
    Consiste := False;
    Exit;
  end;

  // Código
  if dbedt_cd_centro_custo.Text = '' then
  begin
    BoxMensagem('Campo Código deve ser preenchido!', 2);
    pgctrl_ct_custo.ActivePage := ts_dados_basicos;
    dbedt_cd_centro_custo.SetFocus;
    Consiste := False;
    Exit;
  end;

  // Descrição
  if dbedt_nm_centro_custo.Text = '' then
  begin
    BoxMensagem('Campo Descrição deve ser preenchido!', 2);
    pgctrl_ct_custo.ActivePage := ts_dados_basicos;
    dbedt_nm_centro_custo.SetFocus;
    Consiste := False;
    Exit;
  end;
end;

function Tfrm_centro_custoA.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_centro_custo.qry_centro_custo_.State in [dsInsert, dsEdit] ) then
    begin
      datm_centro_custo.qry_centro_custo_.Post;
      Pesquisa := datm_centro_custo.qry_centro_custo_CD_CT_CUSTO.AsString;
      datm_centro_custo.qry_centro_custo_.Close;
      datm_centro_custo.qry_centro_custo_.Prepare;
      datm_centro_custo.qry_centro_custo_.Open;
      Localiza(datm_centro_custo.qry_centro_custo_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_centro_custo.qry_centro_custo_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  btn_mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_centro_custoA.pgctrl_ct_custoChange(Sender: TObject);
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

procedure Tfrm_centro_custoA.pgctrl_ct_custoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_centro_custoA.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_centro_custo.qry_centro_custo_.State in [dsEdit] ) and st_modificar ) or
     ( datm_centro_custo.qry_centro_custo_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Centro de Custo foi alterado.' + #13#10 +
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

procedure Tfrm_centro_custoA.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_centro_custoA.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;
            {
procedure Tfrm_centro_custo.dbedt_cd_centro_custoChange(Sender: TObject);
begin
  if ( datm_centro_custo.qry_centro_custo_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;
             }
end.
