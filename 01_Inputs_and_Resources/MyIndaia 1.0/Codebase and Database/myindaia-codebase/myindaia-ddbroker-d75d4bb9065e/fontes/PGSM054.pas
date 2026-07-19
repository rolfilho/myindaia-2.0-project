unit PGSM054;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, Funcoes;

type
  Tfrm_expurgo = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pgctrl_expurgo: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    lbl_unidade: TLabel;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    btn_co_unid_neg: TSpeedButton;
    lbl_produto: TLabel;
    dbedt_cd_produto: TDBEdit;
    dbedt_nm_produto: TDBEdit;
    btn_co_produto: TSpeedButton;
    lbl_vl_cntr_20: TLabel;
    dbedt_vl_cntr_20: TDBEdit;
    lbl_vl_cntr_40: TLabel;
    dbedt_vl_cntr_40: TDBEdit;
    procedure dbedt_cd_unid_negExit(Sender: TObject);
    procedure dbedt_cd_produtoExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure dbedt_cd_unid_negChange(Sender: TObject);
    procedure pgctrl_expurgoChange(Sender: TObject);
    procedure pgctrl_expurgoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbedt_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    OnChanging : boolean;
    st_modificar, st_incluir, st_excluir : Boolean;
    lcd_unid_neg, lcd_produto : Boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
  end;

var
  frm_expurgo: Tfrm_expurgo;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGSM010, PGSM018, PGSM055;

procedure Tfrm_expurgo.dbedt_cd_unid_negExit(Sender: TObject);
begin
  if Not OnChanging then
  begin
    Consiste;
    lcd_unid_neg := False;
  end;
end;

procedure Tfrm_expurgo.dbedt_cd_produtoExit(Sender: TObject);
begin
  if Not OnChanging then
  begin
    Consiste;
    lcd_produto := False;
  end;
end;

procedure Tfrm_expurgo.btn_co_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';

  Application.CreateForm(Tfrm_unidade, frm_unidade);
  frm_unidade.Cons_OnLine := datm_expurgo.qry_expurgo_CD_UNID_NEG;
  With frm_unidade Do Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_expurgo.qry_expurgo_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_expurgo.qry_expurgo_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2219';

  with datm_expurgo do
  begin
    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;
  end;
  dbedt_cd_unid_negExit(Sender);
end;

procedure Tfrm_expurgo.btn_co_produtoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';

  Application.CreateForm(Tfrm_produto, frm_produto);
  frm_produto.Cons_OnLine := datm_expurgo.qry_expurgo_CD_PRODUTO;
  With frm_produto Do Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_expurgo.qry_expurgo_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_expurgo.qry_expurgo_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2219';

  with datm_expurgo do
  begin
    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;
  end;
  dbedt_cd_produtoExit(Sender);
end;

procedure Tfrm_expurgo.btn_incluirClick(Sender: TObject);
begin

  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  with datm_expurgo do
  begin
    qry_expurgo_.DisableControls;
    qry_expurgo_.Cancel;
    qry_expurgo_.Append;
    qry_expurgo_.EnableControls;
    qry_expurgo_VL_CNTR_20.AsFloat := 0;
    qry_expurgo_VL_CNTR_40.AsFloat := 0;
  end;
  pgctrl_expurgo.ActivePage := ts_dados_basicos;
  dbedt_cd_unid_neg.SetFocus;
end;

procedure Tfrm_expurgo.btn_salvarClick(Sender: TObject);
begin
  if Trim(dbedt_cd_unid_neg.Text) = '' then
  begin
    BoxMensagem('Código da Unidade de Negócio deve ser preenchido !!',2);
    ActiveControl := nil;
    dbedt_cd_unid_neg.SetFocus;
    exit;
  end;

  if Trim(dbedt_cd_produto.Text) = '' then
  begin
    BoxMensagem('Código do Produto deve ser preenchido !!',2);
    dbedt_cd_produto.SetFocus;
    exit;
  end;

  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_expurgo.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_expurgo.Cancelar;
begin
  try
    if datm_expurgo.qry_expurgo_.State in [dsInsert, dsEdit] then
    begin
      datm_expurgo.qry_expurgo_.Cancel;
      pgctrl_expurgo.ActivePage := ts_dados_basicos;
      dbedt_cd_unid_neg.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_expurgo.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Esta Taxa de Expurgo será excluída! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_expurgo.qry_expurgo_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_expurgo.qry_expurgo_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  pgctrl_expurgo.ActivePage := ts_lista;
end;

procedure Tfrm_expurgo.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  { Inicializa o Data Module para Expurgo}
  Application.CreateForm( Tdatm_expurgo, datm_expurgo );

  with datm_expurgo do
  begin
    ds_expurgo.AutoEdit := st_modificar;
    if qry_unid_neg_.Active then qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    if qry_produto_.Active then qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;

    if qry_expurgo_.Active then qry_expurgo_.Close;
    qry_expurgo_.Prepare;
    qry_expurgo_.Open;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

end;

procedure Tfrm_expurgo.FormShow(Sender: TObject);
begin
  pgctrl_expurgo.ActivePage := ts_lista;
  dbg_cadastro.SetFocus;
end;

procedure Tfrm_expurgo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_expurgo do
  begin
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_expurgo_.Close;
    qry_usuario_hab_.Close;
//    Destroy;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_expurgo.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

function Tfrm_expurgo.Consiste : Boolean;
begin
  Consiste := False;

  {Unidade de negócio}
  if dbedt_cd_unid_neg.Text = '' then
  begin
    BoxMensagem('Campo Unidade deve ser preenchido!', 2);
    pgctrl_expurgo.ActivePage := ts_dados_basicos;
    dbedt_cd_unid_neg.SetFocus;
    lcd_unid_neg := True;
    Consiste := False;
    Exit;
  end;

  If Not ( datm_expurgo.qry_expurgo_.State in [dsEdit, dsInsert] ) then Exit;
  ValidCodigo( dbedt_cd_unid_neg );
  if dbedt_cd_unid_neg.Text <> '' Then
  begin
    if dbedt_nm_unid_neg.Text = '' Then
    begin
      BoxMensagem('Código da Unidade de Negócio inválido!',2);
      pgctrl_expurgo.ActivePage := ts_dados_basicos;
      dbedt_cd_unid_neg.SetFocus;
      lcd_unid_neg := True;
      Consiste := False;
      Exit;
    end;
  end;

  if dbedt_cd_produto.Text = '' Then
     EXIT;

  If Not ( datm_expurgo.qry_expurgo_.State in [dsEdit, dsInsert] ) then Exit;
  ValidCodigo( dbedt_cd_produto );
  if dbedt_cd_produto.Text <> '' Then
  begin
    if dbedt_nm_produto.Text = '' Then
    begin
      BoxMensagem('Código do Produto inválido!',2);
      pgctrl_expurgo.ActivePage := ts_dados_basicos;
      dbedt_cd_produto.SetFocus;
      lcd_produto := True;
      Consiste := False;
      Exit;
    end;
  end;

  with datm_expurgo do
  begin
    if qry_usuario_hab_.Active then qry_usuario_hab_.Close;
    qry_usuario_hab_.ParamByName('CD_UNID_NEG').AsString := dbedt_cd_unid_neg.Text;
    qry_usuario_hab_.ParamByName('CD_PRODUTO').AsString := dbedt_cd_produto.Text;
    qry_usuario_hab_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_usuario_hab_.Prepare;
    qry_usuario_hab_.Open;
    if ( qry_usuario_hab_.RecordCount = 0 ) or
       ( qry_usuario_hab_IN_ATIVO.AsString = '0' ) then
    begin
      BoxMensagem( 'Unidade de Negócio X Produto não habilitada para este usuário!', 2);
      pgctrl_expurgo.ActivePage := ts_dados_basicos;
      dbedt_cd_unid_neg.SetFocus;
      lcd_unid_neg := True;
      Consiste := False;
      qry_usuario_hab_.Close;
      Exit;
    end;
    qry_usuario_hab_.Close;
  end;
  Consiste := True;
end;

function Tfrm_expurgo.Grava : Boolean;
var Unidade, Produto : String;
begin
  try
    datm_main.db_broker.StartTransaction;
    If ( datm_expurgo.qry_expurgo_.State in [dsInsert, dsEdit] ) then
    begin
      datm_expurgo.qry_expurgo_.Post;
      Unidade := datm_expurgo.qry_expurgo_.FieldByName('CD_UNID_NEG').asString;
      Produto := datm_expurgo.qry_expurgo_.FieldByName('CD_PRODUTO').asString;
      datm_expurgo.qry_expurgo_.Close;
      datm_expurgo.qry_expurgo_.Prepare;
      datm_expurgo.qry_expurgo_.Open;
      datm_expurgo.qry_expurgo_.Locate('CD_UNID_NEG;CD_PRODUTO', VarArrayOf([ Unidade, Produto ]), [] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_expurgo.qry_expurgo_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_expurgo.dbedt_cd_unid_negChange(Sender: TObject);
begin
  If ( datm_expurgo.qry_expurgo_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_expurgo.pgctrl_expurgoChange(Sender: TObject);
begin
  OnChanging := False;

  if lcd_unid_neg then
  begin
    lcd_unid_neg := False;
    pgctrl_expurgo.ActivePage := ts_dados_basicos;
    dbedt_cd_unid_neg.SetFocus;
    Exit;
  end;

  if lcd_produto then
  begin
    lcd_produto := False;
    pgctrl_expurgo.ActivePage := ts_dados_basicos;
    dbedt_cd_produto.SetFocus;
    Exit;
  end;

  if (pgctrl_expurgo.ActivePage = ts_lista ) then
  begin
    dbnvg.Enabled := True;
  end
  else
  begin
    dbnvg.Enabled := False;
  end;
  
end;

procedure Tfrm_expurgo.pgctrl_expurgoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  OnChanging := True;
  VerAlt;
end;

function Tfrm_expurgo.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_expurgo.qry_expurgo_.State in [dsEdit] ) and st_modificar ) or
     ( datm_expurgo.qry_expurgo_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Taxa de Expurgo foi alterada.' + #13#10 +
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

procedure Tfrm_expurgo.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_expurgo.dbedt_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key = VK_F5 then
  begin
    if Sender = dbedt_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = dbedt_cd_produto then btn_co_produtoClick(nil);
  end;
end;

procedure Tfrm_expurgo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;

end;

end.
