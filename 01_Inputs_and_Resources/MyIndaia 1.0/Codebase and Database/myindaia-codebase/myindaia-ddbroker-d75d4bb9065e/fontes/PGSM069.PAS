unit PGSM069;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Mask, Db, DBCtrls, StdCtrls, Grids, DBGrids, ComCtrls, Buttons,
  ExtCtrls, Funcoes;

type
  Tfrm_cliente_transp = class(TForm)
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
    pgctrl_cliente_transp: TPageControl;
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
    lblAtivo: TLabel;
    lbl_cliente2: TLabel;
    lbl_unid_neg2: TLabel;
    lbl_produto2: TLabel;
    lbl_taxa_transp_rod: TLabel;
    btn_co_transp_rod: TSpeedButton;
    lbl_transp_rod: TLabel;
    btn_co_taxa: TSpeedButton;
    dblkpcbox_ativo: TDBLookupComboBox;
    dbedt_cd_cliente2: TDBEdit;
    dbedt_nm_cliente2: TDBEdit;
    dbedt_cd_unid_neg2: TDBEdit;
    dbedt_nm_unid_neg2: TDBEdit;
    dbedt_cd_produto2: TDBEdit;
    dbedt_nm_produto2: TDBEdit;
    dbedt_cd_taxa: TDBEdit;
    dbedt_nm_taxa: TDBEdit;
    dbedt_cd_transp_rod: TDBEdit;
    dbedt_nm_transp_rod: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure dbedt_cd_transp_rodChange(Sender: TObject);
    procedure dbedt_cd_transp_rodExit(Sender: TObject);
    procedure dbedt_cd_taxaExit(Sender: TObject);
    procedure btn_co_transp_rodClick(Sender: TObject);
    procedure btn_co_taxaClick(Sender: TObject);
    procedure pgctrl_cliente_transpChange(Sender: TObject);
    procedure pgctrl_cliente_transpChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_transp_rodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
  frm_cliente_transp: Tfrm_cliente_transp;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGSM051, PGSM070;








procedure Tfrm_cliente_transp.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  { Inicializa o Data Module para Cliente X Transportador}
  Application.CreateForm( Tdatm_cliente_transp, datm_cliente_transp );

  with datm_cliente_transp do
  begin
    ds_cliente_transp.AutoEdit := st_modificar;

    tbl_yesno_.Open;

    qry_empresa_nac_.Prepare;
    qry_empresa_nac_.Open;

    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    qry_produto_.Prepare;
    qry_produto_.Open;

    qry_transp_rod_.Prepare;
    qry_transp_rod_.Open;

    qry_taxa_.Prepare;
    qry_taxa_.Open;

    qry_cliente_transp_.Close;
    qry_cliente_transp_.ParamByName('CD_CLIENTE').AsString := str_cliente;
    qry_cliente_transp_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_cliente_transp_.ParamByName('CD_PRODUTO').AsString := str_produto;
    qry_cliente_transp_.Prepare;
    qry_cliente_transp_.Open;

  end;

  a_str_indices[0] := 'CD_ITEM';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código Item');
    ItemIndex := 0;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

end;

procedure Tfrm_cliente_transp.FormShow(Sender: TObject);
begin
  with datm_cliente_transp do
  begin
    qry_cliente_transp_.Close;
    qry_cliente_transp_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
    qry_cliente_transp_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_cliente_transp_.ParamByName('CD_PRODUTO').AsString  := str_produto;
    qry_cliente_transp_.Prepare;
    qry_cliente_transp_.Open;
  end;

  pgctrl_cliente_transp.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_cliente_transp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_cliente_transp do
  begin
    tbl_yesno_.Close;
    qry_empresa_nac_.Close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_taxa_.Close;
    qry_transp_rod_.Close;
    qry_cliente_transp_.Close;
//    Destroy;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_cliente_transp.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  with datm_cliente_transp do
  begin
    qry_cliente_transp_.DisableControls;
    qry_cliente_transp_.Cancel;
    qry_cliente_transp_.Append;
    qry_cliente_transp_.EnableControls;
    qry_cliente_transp_CD_CLIENTE.AsString  := str_cliente;
    qry_cliente_transp_CD_UNID_NEG.AsString := str_unid;
    qry_cliente_transp_CD_PRODUTO.AsString  := str_produto;
    qry_cliente_transp_IN_ATIVO.AsString  := '1';
  end;
  pgctrl_cliente_transp.ActivePage := ts_dados_basicos;
  dbedt_cd_transp_rod.SetFocus;
end;

procedure Tfrm_cliente_transp.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_cliente_transp.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_cliente_transp.Cancelar;
begin
  try
    if datm_cliente_transp.qry_cliente_transp_.State in [dsInsert, dsEdit] then
    begin
      datm_cliente_transp.qry_cliente_transp_.Cancel;
      pgctrl_cliente_transp.ActivePage := ts_dados_basicos;
      dbedt_cd_transp_rod.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_cliente_transp.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este Transportador será excluído! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_cliente_transp.qry_cliente_transp_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_cliente_transp.qry_cliente_transp_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  pgctrl_cliente_transp.ActivePage := ts_lista;
end;

procedure Tfrm_cliente_transp.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_cliente_transp.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_cliente_transp.qry_cliente_transp_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_cliente_transp.dbedt_cd_transp_rodChange(Sender: TObject);
begin
  If ( datm_cliente_transp.qry_cliente_transp_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
  if datm_cliente_transp.qry_transp_rod_.State <> dsInactive then datm_cliente_transp.qry_transp_rod_.Locate('CD_TRANSP_ROD', dbedt_cd_transp_rod.text, []);
end;

procedure Tfrm_cliente_transp.dbedt_cd_transp_rodExit(Sender: TObject);
begin
  if Not OnChanging then
  begin
    Consiste;  
    lcd_transp_rod := False;
  end;
end;

procedure Tfrm_cliente_transp.dbedt_cd_taxaExit(Sender: TObject);
begin
  if Not OnChanging then
  begin
    Consiste;
    lcd_taxa := False;
  end;
end;

procedure Tfrm_cliente_transp.btn_co_transp_rodClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2211';
  Application.CreateForm(Tfrm_transp_rod, frm_transp_rod);
  frm_transp_rod.Cons_OnLine := datm_cliente_transp.qry_cliente_transp_CD_TRANSP;
  With frm_transp_rod Do Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine  := True;
    lCons_OnLine2 := False;
    If Not ( datm_cliente_transp.qry_cliente_transp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_transp.qry_cliente_transp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_transp do
  begin
    qry_transp_rod_.Close;
    qry_transp_rod_.Prepare;
    qry_transp_rod_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_transp_rodExit(Sender);
end;

procedure Tfrm_cliente_transp.btn_co_taxaClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2211';
  Application.CreateForm(Tfrm_transp_rod, frm_transp_rod);
  frm_transp_rod.Cons_OnLine  := datm_cliente_transp.qry_cliente_transp_CD_TRANSP;
  frm_transp_rod.Cons_OnLine2 := datm_cliente_transp.qry_cliente_transp_CD_TARIFA;
  With frm_transp_rod Do Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine  := True;
    lCons_OnLine2 := True;
    if frm_cliente_transp.dbedt_cd_transp_rod.Text <> '' then
       str_cd_transp_rod := frm_cliente_transp.dbedt_cd_transp_rod.Text;
    If Not ( datm_cliente_transp.qry_cliente_transp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_transp.qry_cliente_transp_.Edit;
    ShowModal;
    lCons_OnLine  := False;
    lCons_OnLine2 := False;
  end;
  {with datm_cliente_transp do
  begin
    qry_transp_rod_.Close;
    qry_transp_rod_.Prepare;
    qry_transp_rod_.Open;

    qry_taxa_.Close;
    qry_taxa_.Prepare;
    qry_taxa_.Open;
  end;}
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_taxaExit(Sender);
end;

function Tfrm_cliente_transp.Consiste : Boolean;
begin
  Consiste := False;
  if dbedt_cd_transp_rod.Text = '' then
  begin
    BoxMensagem('Campo Transportador deve ser preenchido!', 2);
    pgctrl_cliente_transp.ActivePage := ts_dados_basicos;
    dbedt_cd_transp_rod.SetFocus;
    lcd_transp_rod := True;
    Consiste := False;
    Exit;
  end;
  If Not ( datm_cliente_transp.qry_cliente_transp_.State in [dsEdit, dsInsert] ) then Exit;
  ValidCodigo( dbedt_cd_transp_rod );
  if dbedt_cd_transp_rod.Text <> '' Then
  begin
    if dbedt_nm_transp_rod.Text = '' Then
    begin
      BoxMensagem('Código do Transportador inválido!', 2);
      pgctrl_cliente_transp.ActivePage := ts_dados_basicos;
      dbedt_cd_transp_rod.SetFocus;
      lcd_transp_rod := True;
      Consiste := False;
      Exit;
    end;
  end;

  If Not ( datm_cliente_transp.qry_cliente_transp_.State in [dsEdit, dsInsert] ) then Exit;
  ValidCodigo( dbedt_cd_taxa );
  if dbedt_cd_taxa.Text <> '' Then
  begin
    if dbedt_nm_taxa.Text = '' Then
    begin
      BoxMensagem('Código da Taxa inválido!', 2);
      pgctrl_cliente_transp.ActivePage := ts_dados_basicos;
      dbedt_cd_taxa.SetFocus;
      lcd_taxa := True;
      Consiste := False;
      Exit;
    end;
  end;

  Consiste := True;
end;

function Tfrm_cliente_transp.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    If ( datm_cliente_transp.qry_cliente_transp_.State in [dsInsert, dsEdit] ) then
    begin
      datm_cliente_transp.qry_cliente_transp_.Post;
      datm_cliente_transp.qry_cliente_transp_.Close;
      datm_cliente_transp.qry_cliente_transp_.Prepare;
      datm_cliente_transp.qry_cliente_transp_.Open;
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_cliente_transp.qry_cliente_transp_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_cliente_transp.pgctrl_cliente_transpChange(Sender: TObject);
begin
  OnChanging := False;

  if lcd_transp_rod then
  begin
    lcd_transp_rod := False;
    pgctrl_cliente_transp.ActivePage := ts_dados_basicos;
    dbedt_cd_transp_rod.SetFocus;
    Exit;
  end;

  if lcd_taxa then
  begin
    lcd_taxa := False;
    pgctrl_cliente_transp.ActivePage := ts_dados_basicos;
    dbedt_cd_taxa.SetFocus;
    Exit;
  end;

  if (pgctrl_cliente_transp.ActivePage = ts_lista ) then
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

procedure Tfrm_cliente_transp.pgctrl_cliente_transpChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  OnChanging := True;
  VerAlt;
end;

function Tfrm_cliente_transp.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_cliente_transp.qry_cliente_transp_.State in [dsEdit] ) and st_modificar ) or
     ( datm_cliente_transp.qry_cliente_transp_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Cliente X Transportadores foi alterado.' + #13#10 +
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

procedure Tfrm_cliente_transp.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_cliente_transp.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_cliente_transp.dbedt_cd_transp_rodKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key = VK_F5 then
  begin
    if Sender = dbedt_cd_transp_rod then btn_co_transp_rodClick(nil);
    if Sender = dbedt_cd_taxa then btn_co_taxaClick(nil);
  end;
end;

end.
