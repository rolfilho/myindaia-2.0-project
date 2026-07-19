unit PGSM029;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, DBCtrls, Menus, Grids, DBGrids, ComCtrls, StdCtrls, Buttons, Db,
  ExtCtrls, Funcoes;

type
  Tfrm_hab_desp = class(TForm)
    pgctrl_hab_desp: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lblAtivo: TLabel;
    dblkpcbox_ativo: TDBLookupComboBox;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    lbl_unidade2: TLabel;
    lbl_produto2: TLabel;
    btn_co_unidade2: TSpeedButton;
    btn_co_produto2: TSpeedButton;
    lbl_despachante: TLabel;
    btn_co_despachante: TSpeedButton;
    dbedt_cd_unidade2: TDBEdit;
    dbedt_nm_unidade2: TDBEdit;
    dbedt_cd_produto2: TDBEdit;
    dbedt_nm_produto2: TDBEdit;
    dbedt_cd_despachante: TDBEdit;
    dbedt_nm_despachante: TDBEdit;
    lbl_unidade: TLabel;
    lbl_produto: TLabel;
    dbedt_cd_produto: TDBEdit;
    dbedt_nm_produto: TDBEdit;
    dbedt_nm_unidade: TDBEdit;
    btn_co_unidade: TSpeedButton;
    btn_co_produto: TSpeedButton;
    dbedt_cd_unidade: TDBEdit;
    pnl_cadastro: TPanel;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedt_cd_unidadeExit(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure dbedt_cd_produtoExit(Sender: TObject);
    procedure btn_co_unidadeClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure dbedt_cd_unidade2Exit(Sender: TObject);
    procedure dbedt_cd_produto2Exit(Sender: TObject);
    procedure btn_co_unidade2Click(Sender: TObject);
    procedure btn_co_produto2Click(Sender: TObject);
    procedure dbedt_cd_despachanteExit(Sender: TObject);
    procedure btn_co_despachanteClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbedt_cd_unidade2Change(Sender: TObject);
    procedure dbedt_cd_unidadeEnter(Sender: TObject);
    procedure dbedt_cd_produtoEnter(Sender: TObject);
    procedure pgctrl_hab_despChange(Sender: TObject);
    procedure pgctrl_hab_despChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_unidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    OnChanging : boolean;
    a_str_indices : Array[0..1] Of String[60];
    st_modificar, st_incluir, st_excluir : Boolean;
    lcd_unid_neg2, lcd_produto2, lcd_despachante : Boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    Pesquisa : String;
  end;

var
  frm_hab_desp: Tfrm_hab_desp;

implementation

uses GSMLIB, PGGP001, PGGP017, PGSM010, PGSM018, PGSM032, PGSM046;

{$R *.DFM}

procedure Tfrm_hab_desp.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  { Inicializa o Data Module para Habilitações de Despachantes}
  Application.CreateForm( Tdatm_hab_desp, datm_hab_desp );

  with datm_hab_desp do
  begin
    ds_hab_desp.AutoEdit := st_modificar;

    tbl_yesno_.Open;
    if qry_despachante_.Active then qry_despachante_.Close;
    qry_despachante_.Prepare;
    qry_despachante_.Open;
    if qry_produto_.Active then qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;
    if qry_unid_neg_.Active then qry_unid_neg_.Close;
    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    if qry_hab_desp_.Active then qry_hab_desp_.Close;
    qry_hab_desp_.Close;
    qry_hab_desp_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
    qry_hab_desp_.ParamByName('CD_PRODUTO').AsString := str_cd_produto;
    qry_hab_desp_.Prepare;
    qry_hab_desp_.Open;
  end;

  a_str_indices[0] := 'CD_DESPACHANTE';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    ItemIndex := 0;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

end;

procedure Tfrm_hab_desp.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_hab_desp.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_hab_desp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_hab_desp do
  begin
    tbl_yesno_.Close;
    qry_despachante_.Close;
    qry_produto_.Close;
    qry_unid_neg_.Close;
    qry_hab_desp_.Close;
//    Destroy;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_hab_desp.dbedt_cd_unidadeExit(Sender: TObject);
var
  cd_unid, cd_prod : String;
begin
  If Not ( datm_hab_desp.qry_hab_desp_.State in [dsEdit] )
         and ( st_modificar ) then datm_hab_desp.qry_hab_desp_.Edit
  else
  If Not ( datm_hab_desp.qry_hab_desp_.State in [dsEdit, dsInsert] ) then
  begin
    if st_modificar then datm_hab_desp.ds_hab_desp.AutoEdit := True
    else
    begin
      datm_hab_desp.ds_hab_desp.AutoEdit := False;
      datm_hab_desp.qry_hab_desp_.Cancel;
      btn_salvar.Enabled := False;
      btn_cancelar.Enabled := False;
    end;
    Exit;
  end;
  ValidCodigo( dbedt_cd_unidade );
  if dbedt_cd_unidade.Text <> '' Then
  begin
    if dbedt_nm_unidade.Text = '' Then
    begin
      BoxMensagem('Código da Unidade de Negócio inválido!',2);
      pgctrl_hab_desp.ActivePage := ts_lista;
      dbedt_cd_unidade.SetFocus;
      Exit;
    end;
  end;

  cd_unid := dbedt_cd_unidade.Text;
  cd_prod := dbedt_cd_produto.Text;

  if dbedt_cd_produto.Text <> '' then
  begin
    with datm_hab_desp do
    begin
      {VERIFICAR SE O USUÁRIO TEM ACESSO A UNIDADExPRODUTO }
      qry_usuario_hab_.Close;
      qry_usuario_hab_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_usuario_hab_.ParamByName('CD_UNID_NEG').AsString := cd_unid;
      qry_usuario_hab_.ParamByName('CD_PRODUTO').AsString := cd_prod;
      qry_usuario_hab_.Open;
      if qry_usuario_hab_OK.AsInteger <= 0 then {NÃO TEM ACESSO}
      begin
        BoxMensagem('Usuário não possui permissão para esta unidade/produto!', 2);
        qry_hab_desp_.Cancel;
        pgctrl_hab_desp.ActivePage := ts_lista;
        dbedt_cd_unidade.SetFocus;
        Exit;
      end;

      qry_hab_desp_.Close;
      qry_hab_desp_.ParamByName('CD_UNID_NEG').AsString := cd_unid;
      qry_hab_desp_.ParamByName('CD_PRODUTO').AsString := cd_prod;
      qry_hab_desp_.Prepare;
      qry_hab_desp_.Open;
      if qry_hab_desp_.RecordCount = 0 then
      begin
        BoxMensagem('Não existem despachantes para esta unidade/produto!', 2);
        qry_hab_desp_.Cancel;
        pgctrl_hab_desp.ActivePage := ts_lista;
        dbedt_cd_unidade.SetFocus;
        Exit;
      end;
    end;
  end;

  if st_modificar then datm_hab_desp.ds_hab_desp.AutoEdit := True
  else
  begin
    if dbedt_cd_produto.Text = '' then
    begin
      pgctrl_hab_desp.ActivePage := ts_lista;
      dbedt_cd_produto.SetFocus;
    end
    else
    begin
      datm_hab_desp.ds_hab_desp.AutoEdit := False;
      datm_hab_desp.qry_hab_desp_.Cancel;
      btn_salvar.Enabled := False;
      btn_cancelar.Enabled := False;
    end;
  end;
end;

procedure Tfrm_hab_desp.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_hab_desp.dbedt_cd_produtoExit(Sender: TObject);
var
  cd_unid, cd_prod : String;
begin
  If Not ( datm_hab_desp.qry_hab_desp_.State in [dsEdit] )
         and ( st_modificar ) then datm_hab_desp.qry_hab_desp_.Edit
  else
  If Not ( datm_hab_desp.qry_hab_desp_.State in [dsEdit, dsInsert] ) then
  begin
    if st_modificar then datm_hab_desp.ds_hab_desp.AutoEdit := True
    else
    begin
      datm_hab_desp.ds_hab_desp.AutoEdit := False;
      datm_hab_desp.qry_hab_desp_.Cancel;
      btn_salvar.Enabled := False;
      btn_cancelar.Enabled := False;
    end;
    Exit;
  end;
  ValidCodigo( dbedt_cd_produto );
  if dbedt_cd_produto.Text <> '' Then
  begin
    if dbedt_nm_produto.Text = '' Then
    begin
      BoxMensagem('Código do Produto inválido!',2);
      pgctrl_hab_desp.ActivePage := ts_lista;
      dbedt_cd_produto.SetFocus;
      Exit;
    end;
  end;

  cd_unid := dbedt_cd_unidade.Text;
  cd_prod := dbedt_cd_produto.Text;

  if dbedt_cd_unidade.Text <> '' then
  begin
    with datm_hab_desp do
    begin
      {VERIFICAR SE O USUÁRIO TEM ACESSO A UNIDADE x PRODUTO }
      qry_usuario_hab_.Close;
      qry_usuario_hab_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_usuario_hab_.ParamByName('CD_UNID_NEG').AsString := cd_unid;
      qry_usuario_hab_.ParamByName('CD_PRODUTO').AsString := cd_prod;
      qry_usuario_hab_.Open;
      if qry_usuario_hab_OK.AsInteger <= 0 then {NÃO TEM ACESSO}
      begin
        BoxMensagem('Usuário não possui permissão para esta unidade/produto!', 2);
        qry_hab_desp_.Cancel;
        pgctrl_hab_desp.ActivePage := ts_lista;
        dbedt_cd_produto.SetFocus;
        Exit;
      end;

      qry_hab_desp_.Close;
      qry_hab_desp_.ParamByName('CD_UNID_NEG').AsString := cd_unid;
      qry_hab_desp_.ParamByName('CD_PRODUTO').AsString := cd_prod;
      qry_hab_desp_.Prepare;
      qry_hab_desp_.Open;
      if qry_hab_desp_.RecordCount = 0 then
      begin
        BoxMensagem('Não existem despachantes para esta unidade/produto!', 2);
        qry_hab_desp_.Cancel;
        pgctrl_hab_desp.ActivePage := ts_lista;
        dbedt_cd_produto.SetFocus;
        Exit;
      end;
    end;
  end;

  if st_modificar then datm_hab_desp.ds_hab_desp.AutoEdit := True
  else
  begin
    if dbedt_cd_unidade.Text = '' then
    begin
      pgctrl_hab_desp.ActivePage := ts_lista;
      dbedt_cd_unidade.SetFocus;
    end
    else
    begin
      datm_hab_desp.ds_hab_desp.AutoEdit := False;
      datm_hab_desp.qry_hab_desp_.Cancel;
      btn_salvar.Enabled := False;
      btn_cancelar.Enabled := False;
    end;
  end;
end;

procedure Tfrm_hab_desp.btn_co_unidadeClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';

  datm_hab_desp.ds_hab_desp.AutoEdit := True;

  Application.CreateForm(Tfrm_unidade, frm_unidade);
  frm_unidade.Cons_OnLine := datm_hab_desp.qry_hab_desp_CD_UNID_NEG;
  With frm_unidade Do Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_hab_desp.qry_hab_desp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_hab_desp.qry_hab_desp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2213';

  with datm_hab_desp do
  begin
    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;
  end;
  dbedt_cd_unidadeExit(Sender);

  if st_modificar then datm_hab_desp.ds_hab_desp.AutoEdit := True
  else
  begin
    datm_hab_desp.ds_hab_desp.AutoEdit := False;
    datm_hab_desp.qry_hab_desp_.Cancel;
    btn_salvar.Enabled := False;
    btn_cancelar.Enabled := False;
  end;
end;

procedure Tfrm_hab_desp.btn_co_produtoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';

  datm_hab_desp.ds_hab_desp.AutoEdit := True;

  Application.CreateForm(Tfrm_produto, frm_produto);
  frm_produto.Cons_OnLine := datm_hab_desp.qry_hab_desp_CD_PRODUTO;
  With frm_produto Do Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_hab_desp.qry_hab_desp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_hab_desp.qry_hab_desp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2213';

  with datm_hab_desp do
  begin
    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;
  end;
  dbedt_cd_produtoExit(Sender);

  if st_modificar then datm_hab_desp.ds_hab_desp.AutoEdit := True
  else
  begin
    datm_hab_desp.ds_hab_desp.AutoEdit := False;
    datm_hab_desp.qry_hab_desp_.Cancel;
    btn_salvar.Enabled := False;
    btn_cancelar.Enabled := False;
  end;

end;

procedure Tfrm_hab_desp.dbedt_cd_unidade2Exit(Sender: TObject);
begin
  if Not OnChanging then
  begin
    Consiste;
    lcd_unid_neg2 := False;
  end;
end;

procedure Tfrm_hab_desp.dbedt_cd_produto2Exit(Sender: TObject);
begin
  if Not OnChanging then
  begin
    Consiste;
    lcd_produto2 := False;
  end;
end;

procedure Tfrm_hab_desp.btn_co_unidade2Click(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';

  Application.CreateForm(Tfrm_unidade, frm_unidade);
  frm_unidade.Cons_OnLine := datm_hab_desp.qry_hab_desp_CD_UNID_NEG;
  With frm_unidade Do Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_hab_desp.qry_hab_desp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_hab_desp.qry_hab_desp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2213';

  with datm_hab_desp do
  begin
    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;
  end;
  dbedt_cd_unidade2Exit(Sender);
end;

procedure Tfrm_hab_desp.btn_co_produto2Click(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';

  Application.CreateForm(Tfrm_produto, frm_produto);
  frm_produto.Cons_OnLine := datm_hab_desp.qry_hab_desp_CD_PRODUTO;
  With frm_produto Do Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_hab_desp.qry_hab_desp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_hab_desp.qry_hab_desp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2213';

  with datm_hab_desp do
  begin
    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;
  end;
  dbedt_cd_produto2Exit(Sender);
end;

procedure Tfrm_hab_desp.dbedt_cd_despachanteExit(Sender: TObject);
begin
  if Not OnChanging then
  begin
    Consiste;
    lcd_despachante := False;
  end;
end;

procedure Tfrm_hab_desp.btn_co_despachanteClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2204';

  Application.CreateForm(Tfrm_despachante, frm_despachante);
  frm_despachante.Cons_OnLine := datm_hab_desp.qry_hab_desp_CD_DESPACHANTE;
  With frm_despachante Do
  Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_hab_desp.qry_hab_desp_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
      datm_hab_desp.qry_hab_desp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2213';

  with datm_hab_desp do
  begin
    qry_despachante_.Close;
    qry_despachante_.Prepare;
    qry_despachante_.Open;
  end;
  dbedt_cd_despachanteExit(Sender);
end;

procedure Tfrm_hab_desp.btn_incluirClick(Sender: TObject);
var
  cd_unid, cd_prod : String;
begin

  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;
  pgctrl_hab_desp.ActivePage := ts_dados_basicos;

  with datm_hab_desp do
  begin
    qry_hab_desp_.DisableControls;
    if qry_hab_desp_.RecordCount > 0 then
    begin
      cd_unid := qry_hab_desp_CD_UNID_NEG.AsString;
      cd_prod := qry_hab_desp_CD_PRODUTO.AsString;
    end
    else
    begin
      cd_unid := str_cd_unid_neg;
      cd_prod := str_cd_produto;
    end;
    qry_hab_desp_.Cancel;
    qry_hab_desp_.Append;
    qry_hab_desp_.EnableControls;
    qry_hab_desp_CD_UNID_NEG.AsString := cd_unid;
    qry_hab_desp_CD_PRODUTO.AsString := cd_prod;
    qry_hab_desp_CD_DESPACHANTE.AsString := '';
    qry_hab_desp_IN_ATIVO.AsString  := '1';
  end;
  pgctrl_hab_desp.ActivePage := ts_dados_basicos;
  dbedt_cd_despachante.SetFocus;
end;

procedure Tfrm_hab_desp.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_hab_desp.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_hab_desp.Cancelar;
begin
  try
    if datm_hab_desp.qry_hab_desp_.State in [dsInsert, dsEdit] then
    begin
      datm_hab_desp.qry_hab_desp_.Cancel;
      pgctrl_hab_desp.ActivePage := ts_dados_basicos;
      dbedt_cd_unidade2.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_hab_desp.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'A Habilitação deste Despachante será excluída! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_hab_desp.qry_hab_desp_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_hab_desp.qry_hab_desp_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  pgctrl_hab_desp.ActivePage := ts_lista;
end;

procedure Tfrm_hab_desp.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_hab_desp.qry_hab_desp_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_hab_desp.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_hab_desp.qry_hab_desp_CD_DESPACHANTE.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_hab_desp.qry_hab_desp_.Close;
  datm_hab_desp.qry_hab_desp_.SQL[5] := a_str_indices[cb_ordem.ItemIndex];
  datm_hab_desp.qry_hab_desp_.Open;
  Localiza(datm_hab_desp.qry_hab_desp_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_hab_desp.dbedt_cd_unidade2Change(Sender: TObject);
begin
  If ( datm_hab_desp.qry_hab_desp_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_hab_desp.dbedt_cd_unidadeEnter(Sender: TObject);
begin
  datm_hab_desp.ds_hab_desp.AutoEdit := True;
end;

procedure Tfrm_hab_desp.dbedt_cd_produtoEnter(Sender: TObject);
begin
  datm_hab_desp.ds_hab_desp.AutoEdit := True;
end;

function Tfrm_hab_desp.Consiste : Boolean;
begin
  Consiste := False;
  if dbedt_cd_unidade2.Text = '' then
  begin
    BoxMensagem('Campo Unidade deve ser preenchido!', 2);
    pgctrl_hab_desp.ActivePage := ts_lista;
    dbedt_cd_unidade.SetFocus;
    lcd_unid_neg2 := True;
    Consiste := False;
    Exit;
  end;

  If Not ( datm_hab_desp.qry_hab_desp_.State in [dsEdit, dsInsert] ) then Exit;
  ValidCodigo( dbedt_cd_unidade2 );
  if dbedt_cd_unidade2.Text <> '' Then
  begin
    if dbedt_nm_unidade2.Text = '' Then
    begin
      BoxMensagem('Código da Unidade de Negócio inválido!',2);
      pgctrl_hab_desp.ActivePage := ts_dados_basicos;
      dbedt_cd_unidade2.SetFocus;
      lcd_unid_neg2 := True;
      Consiste := False;
      Exit;
    end;
  end;

  if dbedt_cd_produto2.Text = '' then
  begin
    BoxMensagem('Campo Produto deve ser preenchido!', 2);
    pgctrl_hab_desp.ActivePage := ts_dados_basicos;
    dbedt_cd_produto2.SetFocus;
    lcd_produto2 := True;
    Consiste := False;
    Exit;
  end;

  If Not ( datm_hab_desp.qry_hab_desp_.State in [dsEdit, dsInsert] ) then Exit;
  ValidCodigo( dbedt_cd_produto2 );
  if dbedt_cd_produto2.Text <> '' Then
  begin
    if dbedt_nm_produto2.Text = '' Then
    begin
      BoxMensagem('Código do Produto inválido!',2);
      pgctrl_hab_desp.ActivePage := ts_dados_basicos;
      dbedt_cd_produto2.SetFocus;
      lcd_produto2 := True;
      Consiste := False;
      Exit;
    end;
  end;

  if dbedt_cd_despachante.Text = '' then
  begin
    BoxMensagem('Campo Despachante deve ser preenchido!', 2);
    pgctrl_hab_desp.ActivePage := ts_dados_basicos;
    dbedt_cd_despachante.SetFocus;
    lcd_despachante := True;
    Consiste := False;
    Exit;
  end;

  If Not ( datm_hab_desp.qry_hab_desp_.State in [dsEdit, dsInsert] ) then Exit;
  ValidCodigo( dbedt_cd_despachante );
  if dbedt_cd_despachante.Text <> '' Then
  begin
    if dbedt_nm_despachante.Text = '' Then
    begin
      BoxMensagem('Código do Despachante inválido!',2);
      pgctrl_hab_desp.ActivePage := ts_dados_basicos;
      dbedt_cd_despachante.SetFocus;
      lcd_despachante := True;
      Consiste := False;
      Exit;
    end;
  end;

  with datm_hab_desp do
  begin
    {VERIFICAR SE O USUÁRIO TEM ACESSO A UNIDADExPRODUTO }
    qry_usuario_hab_.Close;
    qry_usuario_hab_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_usuario_hab_.ParamByName('CD_UNID_NEG').AsString := dbedt_cd_unidade2.Text;
    qry_usuario_hab_.ParamByName('CD_PRODUTO').AsString := dbedt_cd_produto2.Text;
    qry_usuario_hab_.Open;
    if qry_usuario_hab_OK.AsInteger <= 0 then {NÃO TEM ACESSO}
    begin
      BoxMensagem('Usuário não possui permissão para esta unidade/produto!', 2);
      qry_hab_desp_.Cancel;
      pgctrl_hab_desp.ActivePage := ts_dados_basicos;
      dbedt_cd_unidade2.SetFocus;
      lcd_unid_neg2 := True;
      Consiste := False;
      Exit;
    end;
  end;
  Consiste := True;
end;

function Tfrm_hab_desp.Grava : Boolean;
var
  cd_unid, cd_prod, cd_desp : String;
begin
  try
    datm_main.db_broker.StartTransaction;
    If ( datm_hab_desp.qry_hab_desp_.State in [dsInsert, dsEdit] ) then
    begin
      cd_unid := datm_hab_desp.qry_hab_desp_CD_UNID_NEG.AsString;
      cd_prod := datm_hab_desp.qry_hab_desp_CD_PRODUTO.AsString;
      cd_desp := datm_hab_desp.qry_hab_desp_CD_DESPACHANTE.asString;
      datm_hab_desp.qry_hab_desp_.Post;
      Pesquisa := datm_hab_desp.qry_hab_desp_CD_DESPACHANTE.AsString;
      datm_hab_desp.qry_hab_desp_.Close;
      datm_hab_desp.qry_hab_desp_.Prepare;
      datm_hab_desp.qry_hab_desp_.Open;
      //Localiza(datm_hab_desp.qry_hab_desp_, Pesquisa, a_str_indices[0] );
      datm_hab_desp.qry_hab_desp_.Locate('CD_UNID_NEG;CD_PRODUTO;CD_DESPACHANTE', VarArrayOf([ cd_unid, cd_prod, cd_desp ]), []); 
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_hab_desp.qry_hab_desp_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  with datm_hab_desp do
  begin
    qry_hab_desp_.Close;
    qry_hab_desp_.ParamByName('CD_UNID_NEG').AsString := cd_unid;
    qry_hab_desp_.ParamByName('CD_PRODUTO').AsString := cd_prod;
    qry_hab_desp_.Prepare;
    qry_hab_desp_.Open;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_hab_desp.pgctrl_hab_despChange(Sender: TObject);
begin
  OnChanging := False;

  if lcd_unid_neg2 then
  begin
    lcd_unid_neg2 := False;
    pgctrl_hab_desp.ActivePage := ts_dados_basicos;
    dbedt_cd_unidade2.SetFocus;
    Exit;
  end;

  if lcd_produto2 then
  begin
    lcd_produto2 := False;
    pgctrl_hab_desp.ActivePage := ts_dados_basicos;
    dbedt_cd_produto2.SetFocus;
    Exit;
  end;

  if lcd_despachante then
  begin
    lcd_despachante := False;
    pgctrl_hab_desp.ActivePage := ts_dados_basicos;
    dbedt_cd_despachante.SetFocus;
    Exit;
  end;

  if (pgctrl_hab_desp.ActivePage = ts_lista ) then
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

procedure Tfrm_hab_desp.pgctrl_hab_despChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  OnChanging := True;
  VerAlt;
end;

function Tfrm_hab_desp.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_hab_desp.qry_hab_desp_.State in [dsEdit] ) and st_modificar ) or
     ( datm_hab_desp.qry_hab_desp_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Tabela de Habilitações de Despachantes foi alterada.' + #13#10 +
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

procedure Tfrm_hab_desp.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_hab_desp.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_hab_desp.dbedt_cd_unidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = dbedt_cd_unidade then btn_co_unidadeClick(nil);
    if Sender = dbedt_cd_produto then btn_co_produtoClick(nil);
    if Sender = dbedt_cd_unidade2 then btn_co_unidade2Click(nil);
    if Sender = dbedt_cd_produto2 then btn_co_produto2Click(nil);
    if Sender = dbedt_cd_despachante then btn_co_despachanteClick(nil);
  end;
end;

end.
