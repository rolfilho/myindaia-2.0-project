unit uAcesso_Externo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Mask, Db, DBCtrls, StdCtrls, Grids, DBGrids, ComCtrls, Buttons,
  ExtCtrls, Funcoes, uDatm_acesso_externo;

type
  Tfrm_acesso_externo = class(TForm)
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
    pgctrl_acesso_externo: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    lbl_Cliente: TLabel;
    dbedt_cd_cliente: TDBEdit;
    dbedt_nm_cliente: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    dbedt_cd_unid_neg: TDBEdit;
    lbl_unid_neg: TLabel;
    lbl_produto: TLabel;
    dbedt_cd_produto: TDBEdit;
    dbedt_nm_produto: TDBEdit;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    pnl_entrada_de_dados: TPanel;
    lbl_cliente2: TLabel;
    lbl_unid_neg2: TLabel;
    lbl_produto2: TLabel;
    lbl_transp_rod: TLabel;
    dbedt_cd_cliente2: TDBEdit;
    dbedt_nm_cliente2: TDBEdit;
    dbedt_cd_unid_neg2: TDBEdit;
    dbedt_nm_unid_neg2: TDBEdit;
    dbedt_cd_produto2: TDBEdit;
    dbedt_nm_produto2: TDBEdit;
    dbedt_site: TDBEdit;
    dbedt_login: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbedt_senha: TDBEdit;
    dbedt_emails: TDBMemo;
    lbl_emails: TLabel;
    lblemail: TLabel;
    lbl_txt_obrigatorios: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure pgctrl_acesso_externoChange(Sender: TObject);
    procedure pgctrl_acesso_externoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_siteChange(Sender: TObject);
  private
    OnChanging : boolean;
    a_str_indices : Array[0..1] Of String[60];
    st_modificar, st_incluir, st_excluir : Boolean;
    lcd_transp_rod, lcd_taxa : Boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    { Private declarations }
  public
    str_cliente, str_unid, str_produto : String;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_acesso_externo: Tfrm_acesso_externo;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGSM051;

procedure Tfrm_acesso_externo.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  Application.CreateForm( Tdatm_acesso_externo, datm_acesso_externo );

  with datm_acesso_externo do
  begin
    ds_acesso_externo.AutoEdit := st_modificar;

    tbl_yesno_.Open;

    qry_empresa_nac_.Prepare;
    qry_empresa_nac_.Open;

    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    qry_produto_.Prepare;
    qry_produto_.Open;

    qry_acesso_externo_.Close;
    qry_acesso_externo_.ParamByName('CD_CLIENTE').AsString := str_cliente;
    qry_acesso_externo_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_acesso_externo_.ParamByName('CD_PRODUTO').AsString := str_produto;
    qry_acesso_externo_.Prepare;
    qry_acesso_externo_.Open;

  end;

  a_str_indices[0] := 'NM_LOGIN';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Login');
    ItemIndex := 0;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

end;

procedure Tfrm_acesso_externo.FormShow(Sender: TObject);
begin
  with datm_acesso_externo do
  begin
    qry_acesso_externo_.Close;
    qry_acesso_externo_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
    qry_acesso_externo_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_acesso_externo_.ParamByName('CD_PRODUTO').AsString  := str_produto;
    qry_acesso_externo_.Prepare;
    qry_acesso_externo_.Open;
  end;

  pgctrl_acesso_externo.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_acesso_externo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_acesso_externo do
  begin
    tbl_yesno_.Close;
    qry_empresa_nac_.Close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_acesso_externo_.Close;
//    Destroy;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_acesso_externo.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  with datm_acesso_externo do
  begin
    qry_acesso_externo_.DisableControls;
    qry_acesso_externo_.Cancel;
    qry_acesso_externo_.Append;
    qry_acesso_externo_.EnableControls;
    qry_acesso_externo_CD_CLIENTE.AsString  := str_cliente;
    qry_acesso_externo_CD_UNID_NEG.AsString := str_unid;
    qry_acesso_externo_CD_PRODUTO.AsString  := str_produto;
  end;
  pgctrl_acesso_externo.ActivePage := ts_dados_basicos;
  dbedt_site.SetFocus;
end;

procedure Tfrm_acesso_externo.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_acesso_externo.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_acesso_externo.Cancelar;
begin
  try
    if datm_acesso_externo.qry_acesso_externo_.State in [dsInsert, dsEdit] then
    begin
      datm_acesso_externo.qry_acesso_externo_.Cancel;
      pgctrl_acesso_externo.ActivePage := ts_dados_basicos;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_acesso_externo.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este acesso será excluído! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_acesso_externo.qry_acesso_externo_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_acesso_externo.qry_acesso_externo_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  pgctrl_acesso_externo.ActivePage := ts_lista;
end;

procedure Tfrm_acesso_externo.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_acesso_externo.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_acesso_externo.qry_acesso_externo_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

function Tfrm_acesso_externo.Consiste : Boolean;
begin
  Consiste := False;
  If Not ( datm_acesso_externo.qry_acesso_externo_.State in [dsEdit, dsInsert] ) then Exit;

  if (dbedt_site.Text = '') or (dbedt_login.Text = '') or
     (dbedt_senha.Text = '') or (dbedt_emails.Text = '') Then
  begin
    BoxMensagem('Favor preencher todos os campos obrigatórios!', 2);
    pgctrl_acesso_externo.ActivePage := ts_dados_basicos;
    Consiste := False;
    Exit;
  end;

  Consiste := True;
end;

function Tfrm_acesso_externo.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    If ( datm_acesso_externo.qry_acesso_externo_.State in [dsInsert, dsEdit] ) then
    begin
      datm_acesso_externo.qry_acesso_externo_.Post;
      datm_acesso_externo.qry_acesso_externo_.Close;
      datm_acesso_externo.qry_acesso_externo_.Prepare;
      datm_acesso_externo.qry_acesso_externo_.Open;
      datm_acesso_externo.qry_acesso_externo_.Last;      
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_acesso_externo.qry_acesso_externo_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_acesso_externo.pgctrl_acesso_externoChange(Sender: TObject);
begin
  OnChanging := False;

  if (pgctrl_acesso_externo.ActivePage = ts_lista ) then
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

procedure Tfrm_acesso_externo.pgctrl_acesso_externoChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  OnChanging := True;
  VerAlt;
end;

function Tfrm_acesso_externo.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_acesso_externo.qry_acesso_externo_.State in [dsEdit] ) and st_modificar ) or
     ( datm_acesso_externo.qry_acesso_externo_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de acesso foi alterado.' + #13#10 +
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

procedure Tfrm_acesso_externo.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_acesso_externo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_acesso_externo.dbedt_siteChange(Sender: TObject);
begin
  if ( datm_acesso_externo.qry_acesso_externo_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

end.
