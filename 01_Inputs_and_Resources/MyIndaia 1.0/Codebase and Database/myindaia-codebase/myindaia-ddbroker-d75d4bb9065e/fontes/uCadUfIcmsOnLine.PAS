unit uCadUfIcmsOnLine;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Mask, Db, DBCtrls, StdCtrls, Grids, DBGrids, ComCtrls, Buttons,
  ExtCtrls, Funcoes, DBTables;

type
  Tfrm_CadUfIcmsOnLine = class(TForm)
    pgctrl_Cadastro: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    SpeedButton1: TSpeedButton;
    pnl_entrada_de_dados: TPanel;
    lbl_transp_rod: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    pnl1: TPanel;
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
    dts_CadFfIcmsOnline: TDataSource;
    qry_CadUfIcmsOnline: TQuery;
    cmbUfCliente: TDBLookupComboBox;
    cmbSite: TDBComboBox;
    dts_estado_cliente: TDataSource;
    qry_estado_cliente: TQuery;
    qry_CadUfIcmsOnlineUF_CLIENTE: TStringField;
    qry_CadUfIcmsOnlineUF_DESPACHO: TStringField;
    qry_CadUfIcmsOnlineSITE_DESC: TStringField;
    cmbUfDespacho: TDBLookupComboBox;
    dts_estado_despacho: TDataSource;
    qry_estado_despacho: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure pgctrl_CadastroChange(Sender: TObject);
    procedure pgctrl_CadastroChanging(Sender: TObject;
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
  frm_CadUfIcmsOnLine: Tfrm_CadUfIcmsOnLine;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGSM051;

procedure Tfrm_CadUfIcmsOnLine.FormCreate(Sender: TObject);
begin
  st_modificar := True;
  st_incluir   := st_modificar;
  st_excluir   := st_modificar;

//  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  qry_CadUfIcmsOnline.Close;
  qry_CadUfIcmsOnline.Prepare;
  qry_CadUfIcmsOnline.Open;

  a_str_indices[0] := 'NM_LOGIN';

  With cb_ordem do
  begin
    Clear;
    Items.Add('UF_Cliente');
    Items.Add('UF_Despacho');
    Items.Add('Site');
    ItemIndex := 0;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

end;

procedure Tfrm_CadUfIcmsOnLine.FormShow(Sender: TObject);
begin
  qry_CadUfIcmsOnline.Close;
  qry_CadUfIcmsOnline.Prepare;
  qry_CadUfIcmsOnline.Open;
  pgctrl_cadastro.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_CadUfIcmsOnLine.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  qry_CadUfIcmsOnline.DisableControls;
  qry_CadUfIcmsOnline.Cancel;
  qry_CadUfIcmsOnline.Append;
  qry_CadUfIcmsOnline.EnableControls;

  qry_estado_cliente.Open;
  qry_estado_despacho.Open;

  pgctrl_cadastro.ActivePage := ts_dados_basicos;
  cmbUfCliente.SetFocus;
  Btn_Mi( False, True, True, False );
end;

procedure Tfrm_CadUfIcmsOnLine.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_CadUfIcmsOnLine.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
  qry_estado_cliente.Close;
  qry_estado_despacho.Close;
end;

procedure Tfrm_CadUfIcmsOnLine.Cancelar;
begin
  try
    if qry_CadUfIcmsOnline.State in [dsInsert, dsEdit] then
    begin
      qry_CadUfIcmsOnline.Cancel;
      pgctrl_Cadastro.ActivePage := ts_dados_basicos;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_CadUfIcmsOnLine.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este cadastro será excluído! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    qry_CadUfIcmsOnline.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      qry_CadUfIcmsOnline.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  pgctrl_Cadastro.ActivePage := ts_lista;
end;

procedure Tfrm_CadUfIcmsOnLine.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_CadUfIcmsOnLine.edt_chaveChange(Sender: TObject);
begin
  Localiza(qry_CadUfIcmsOnline, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

function Tfrm_CadUfIcmsOnLine.Consiste : Boolean;
begin
  Consiste := False;
  If Not ( qry_CadUfIcmsOnline.State in [dsEdit, dsInsert] ) then Exit;

  if (cmbUfCliente.Text = '') or (cmbUfDespacho.Text = '') or
     (cmbSite.Text = '') Then
  begin
    BoxMensagem('Favor preencher todos os campos obrigatórios!', 2);
    pgctrl_Cadastro.ActivePage := ts_dados_basicos;
    Consiste := False;
    Exit;
  end;

  Consiste := True;
end;

function Tfrm_CadUfIcmsOnLine.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    If ( qry_CadUfIcmsOnline.State in [dsInsert, dsEdit] ) then
    begin
      qry_CadUfIcmsOnline.Post;
      qry_CadUfIcmsOnline.Close;
      qry_CadUfIcmsOnline.Prepare;
      qry_CadUfIcmsOnline.Open;
      qry_CadUfIcmsOnline.Last;
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      qry_CadUfIcmsOnline.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_CadUfIcmsOnLine.pgctrl_CadastroChange(Sender: TObject);
begin
  OnChanging := False;

  if (pgctrl_Cadastro.ActivePage = ts_lista ) then
  begin
    dbnvg.Enabled := True;
    edt_chave.Enabled := True;
    cb_ordem.Enabled := True;
    qry_estado_cliente.Close;
    qry_estado_despacho.Close;
  end
  else
  begin
    dbnvg.Enabled := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled := False;
    qry_estado_cliente.Open;
    qry_estado_despacho.Open;
  end;
end;

procedure Tfrm_CadUfIcmsOnLine.pgctrl_CadastroChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  OnChanging := True;
  VerAlt;
end;

function Tfrm_CadUfIcmsOnLine.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( qry_CadUfIcmsOnline.State in [dsEdit] ) and st_modificar ) or
     ( qry_CadUfIcmsOnline.State in [dsInsert] ) then
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

procedure Tfrm_CadUfIcmsOnLine.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_CadUfIcmsOnLine.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_CadUfIcmsOnLine.dbedt_siteChange(Sender: TObject);
begin
  if ( qry_CadUfIcmsOnline.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

end.
