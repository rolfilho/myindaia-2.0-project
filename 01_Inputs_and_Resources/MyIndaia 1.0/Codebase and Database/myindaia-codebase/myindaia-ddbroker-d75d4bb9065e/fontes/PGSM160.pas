unit PGSM160;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB;

type
  Tfrm_acesso_scx = class(TForm)
    pgctrl_acesso: TPageControl;
    ts_lista: TTabSheet;
    dbg_acesso_scx: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_cnt: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    lbl_ativo: TLabel;
    Label5: TLabel;
    dbedt_cpf_usuario: TDBEdit;
    dbedt_nm_usuario: TDBEdit;
    dblkpcbox_ativo: TDBLookupComboBox;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    Label6: TLabel;
    dbedt_cd_senha_scx: TDBEdit;
    dbedt_cnpj_repres: TDBEdit;
    dbedt_cd_acesso_scx: TDBEdit;
    Label10: TLabel;
    Label7: TLabel;
    dbedt_cpf_repres: TDBEdit;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_acessoChange(Sender: TObject);
    procedure dbg_acesso_scxDblClick(Sender: TObject);
    procedure dbg_acesso_scxKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedt_nm_usuarioChange(Sender: TObject);
    procedure dbedt_cnpj_represExit(Sender: TObject);
    procedure pgctrl_acessoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbedt_cd_senha_scxExit(Sender: TObject);
    procedure dbedt_cpf_usuarioExit(Sender: TObject);
    procedure dbedt_nm_usuarioExit(Sender: TObject);
    procedure dblkpcbox_ativoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    a_str_indices : Array[0..2] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir   : boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    lNaoConsiste : Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_acesso_scx: Tfrm_acesso_scx;

implementation

uses PGSM159, GSMLIB, PGGP001, PGGP017;

{$R *.DFM}

procedure Tfrm_acesso_scx.btn_incluirClick(Sender: TObject);
begin
   btn_incluir.Enabled := False;
   mi_incluir.Enabled  := False;
   btn_excluir.Enabled := False;
   mi_excluir.Enabled  := False;
   with datm_acesso_scx do
   begin
     qry_acesso_scx_.DisableControls;
     qry_acesso_scx_.Cancel;
     qry_acesso_scx_.Append;
     qry_acesso_scx_.EnableControls;
     qry_acesso_scx_IN_ATIVO.AsString  := '1';

   end;
   pgctrl_acesso.ActivePage := ts_dados_basicos;
   dbedt_cd_acesso_scx.SetFocus;
   pgctrl_acessoChange(nil);
end;

procedure Tfrm_acesso_scx.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_acesso_scx.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_acesso_scx.Cancelar;
begin
  try
    if datm_acesso_scx.qry_acesso_scx_.State in [dsInsert, dsEdit] then
    begin
      datm_acesso_scx.qry_acesso_scx_.Cancel;
      pgctrl_acesso.ActivePage := ts_dados_basicos;
      dbedt_cd_Acesso_scx.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_acesso_scx.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este Acesso será excluído!' + #13#10 +
                  'Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_acesso_scx.qry_acesso_scx_.Delete;
    datm_main.db_broker.Commit;
    pgctrl_acesso.ActivePage:=ts_lista;
  except
    on E: Exception do
    begin
      datm_acesso_scx.qry_acesso_scx_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
end;

procedure Tfrm_acesso_scx.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_acesso_scx.edt_chaveChange(Sender: TObject);
begin
   Localiza(datm_acesso_scx.qry_acesso_scx_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_acesso_scx.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_acesso_scx.qry_acesso_scx_CD_ACESSO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_acesso_scx.qry_acesso_scx_.Close;
  datm_acesso_scx.qry_acesso_scx_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_acesso_scx.qry_acesso_scx_.Open;
  Localiza( datm_acesso_scx.qry_acesso_scx_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_acesso_scx.pgctrl_acessoChange(Sender: TObject);
begin
  if (pgctrl_acesso.ActivePage = ts_lista ) then
  begin
    dbnvg.Enabled := True;
    edt_chave.Enabled := True;
    cb_ordem.Enabled := True;
  end
  else
  begin
    dbnvg.Enabled := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled := False;
  end;
end;

procedure Tfrm_acesso_scx.dbg_acesso_scxDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_acesso_scx.qry_acesso_scx_CD_ACESSO.AsString;
    except
      try
        Cons_Online_Texto := datm_acesso_scx.qry_acesso_scx_CD_ACESSO.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código de Acesso!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_acesso_scx.dbg_acesso_scxKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then dbg_acesso_scxDblClick(Sender);
end;

procedure Tfrm_acesso_scx.FormCreate(Sender: TObject);
begin
  { Cria o DataModule do Acesso ao Siscomex }

  Application.CreateForm(Tdatm_acesso_scx, datm_acesso_scx );

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  with datm_acesso_scx do
  begin
    tbl_yesno_.Open;
    qry_acesso_scx_.Close;
    qry_acesso_scx_.SQL[2] := 'NM_USUARIO';
    qry_acesso_scx_.Prepare;
    qry_acesso_scx_.Open;
  end;

  a_str_indices[0] := 'CD_ACESSO';
  a_str_indices[1] := 'NM_USUARIO';
  a_str_indices[2] := 'CPF_USUARIO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código de Acesso');
    Items.Add('Nome do Usuário');
    Items.Add('C.P.F. do Usuário');
    ItemIndex := 1;
  end;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  datm_acesso_scx.ds_acesso_scx.AutoEdit     := st_modificar;

  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;
end;

procedure Tfrm_acesso_scx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_acesso_scx do
    begin
      qry_acesso_scx_.Close;
      tbl_yesno_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

function Tfrm_acesso_scx.Grava;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_acesso_scx.qry_acesso_scx_.State in [dsInsert, dsEdit] ) then
    begin
      Pesquisa := datm_acesso_scx.qry_acesso_scx_CD_ACESSO.AsString;
      datm_acesso_scx.qry_acesso_scx_.Post;
      datm_acesso_scx.qry_acesso_scx_.Locate( 'CD_ACESSO', Pesquisa, [loCaseInsensitive] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_acesso_scx.qry_acesso_scx_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_acesso_scx.Consiste : Boolean;
begin
  Consiste := True;

  {Código de Acesso}
  if Not lNaoConsiste then
  begin
    if dbedt_cd_acesso_scx.Text = '' then
    begin
      BoxMensagem('Campo ''Código de Acesso'' deve ser preenchido!', 2);
      dbedt_cd_acesso_scx.SetFocus;
      Consiste := False;
      exit;
    end;
  end;

  {Descrição}
  if Not lNaoConsiste then
  begin
    if dbedt_nm_usuario.Text = '' then
    begin
      BoxMensagem('Campo ''Nome do Usuário'' deve ser preenchido!', 2);
      dbedt_nm_usuario.SetFocus;
      Consiste := False;
      exit;
    end;

    if dbedt_cd_senha_scx.Text = '' then
    begin
      BoxMensagem('Código da Senha do Siscomex deve ser preenchido!', 2);
      dbedt_cd_senha_scx.SetFocus;
      Consiste := False;
      exit;
    end;
  end;

  {C.N.P.J. do Representante}
  if Not CNPJ(dbedt_cnpj_repres.Text) then
  begin
    pgctrl_acesso.ActivePage := ts_dados_basicos;
    dbedt_cnpj_repres.SetFocus;
    Consiste := False;
    Exit;
  end;

  {C.P.F. do Representante}
  if Not CPF(dbedt_cpf_repres.Text) then
  begin
    pgctrl_acesso.ActivePage := ts_dados_basicos;
    dbedt_cpf_repres.SetFocus;
    Consiste := False;
    Exit;
  end;

  {C.P.F. do Usuário}
  if Not CPF(dbedt_cpf_usuario.Text) then
  begin
    pgctrl_acesso.ActivePage := ts_dados_basicos;
    dbedt_cpf_usuario.SetFocus;
    Consiste := False;
    Exit;
  end;

end;

procedure Tfrm_acesso_scx.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_acesso_scx.dbedt_nm_usuarioChange(Sender: TObject);
begin
  if ( datm_acesso_scx.qry_acesso_scx_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_acesso_scx.dbedt_cnpj_represExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_acesso_scx.pgctrl_acessoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_acesso_scx.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_acesso_scx.qry_acesso_scx_.State in [dsEdit] ) and st_modificar ) or
     ( datm_acesso_scx.qry_acesso_scx_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Acesso ao Siscomex foi alterado.' + #13#10 +
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

procedure Tfrm_acesso_scx.dbedt_cd_senha_scxExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_acesso_scx.dbedt_cpf_usuarioExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_acesso_scx.dbedt_nm_usuarioExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_acesso_scx.dblkpcbox_ativoExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_acesso_scx.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then close;
end;

procedure Tfrm_acesso_scx.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_acesso.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

end.

