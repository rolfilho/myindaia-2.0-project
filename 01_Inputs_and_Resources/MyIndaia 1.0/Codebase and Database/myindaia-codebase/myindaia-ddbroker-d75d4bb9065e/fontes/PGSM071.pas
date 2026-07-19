unit PGSM071;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, Funcoes ;

type
  Tfrm_cliente_repres = class(TForm)
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
    pgctrl_cliente_repres: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_representante: TLabel;
    lbl_in_ativo: TLabel;
    dbedt_nm_representante: TDBEdit;
    dbedt_cd_representante: TDBEdit;
    dblkpcbox_ativo: TDBLookupComboBox;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    ts_repasse: TTabSheet;
    pgctrl_cliente_repasse: TPageControl;
    ts_lista2: TTabSheet;
    dbg_contatos: TDBGrid;
    ts_dados_basicos2: TTabSheet;
    Panel1: TPanel;
    btn_co_item: TSpeedButton;
    dbedt_cd_item: TDBEdit;
    dbedt_nm_item: TDBEdit;
    lbl_Cliente: TLabel;
    dbedt_cd_cliente: TDBEdit;
    dbedt_nm_cliente: TDBEdit;
    lbl_unid_neg: TLabel;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    lbl_produto: TLabel;
    dbedt_cd_produto: TDBEdit;
    dbedt_nm_produto: TDBEdit;
    Label1: TLabel;
    dbedt_cd_cliente3: TDBEdit;
    dbedt_nm_cliente3: TDBEdit;
    Label2: TLabel;
    dbedt_cd_unid_neg3: TDBEdit;
    dbedt_nm_unid_neg3: TDBEdit;
    Label3: TLabel;
    dbedt_cd_produto3: TDBEdit;
    dbedt_nm_produto3: TDBEdit;
    lblRepresentante: TLabel;
    dbedt_cd_representante2: TDBEdit;
    dbedt_nm_representante2: TDBEdit;
    Label4: TLabel;
    dbedt_cd_cliente2: TDBEdit;
    dbedt_nm_cliente2: TDBEdit;
    Label5: TLabel;
    dbedt_cd_unid_neg2: TDBEdit;
    dbedt_nm_unid_neg2: TDBEdit;
    Label6: TLabel;
    dbedt_cd_produto2: TDBEdit;
    dbedt_nm_produto2: TDBEdit;
    btn_co_representante: TSpeedButton;
    Label7: TLabel;
    dbedt_cd_cliente4: TDBEdit;
    dbedt_nm_cliente4: TDBEdit;
    Label8: TLabel;
    dbedt_cd_unid_neg4: TDBEdit;
    dbedt_nm_unid_neg4: TDBEdit;
    Label9: TLabel;
    dbedt_cd_produto4: TDBEdit;
    dbedt_nm_produto4: TDBEdit;
    Label10: TLabel;
    dbedt_cd_representante3: TDBEdit;
    dbedt_nm_representante3: TDBEdit;
    lbl_item: TLabel;
    dbedt_pc_repasse: TDBEdit;
    lbl_pc_repasse: TLabel;
    lbl_in_ativo2: TLabel;
    dblckboc_in_ativo2: TDBLookupComboBox;
    Label11: TLabel;
    dbedt_cd_servico: TDBEdit;
    dbedt_nm_servico: TDBEdit;
    Label12: TLabel;
    dbedt_cd_servico2: TDBEdit;
    dbedt_nm_servico2: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    dblkpcbox_numerario: TDBLookupComboBox;
    dblkpcbox_fatura: TDBLookupComboBox;
    dblkpcbox_nota: TDBLookupComboBox;
    dbedt_cd_servico3: TDBEdit;
    dbedt_nm_servico3: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    dbedt_cd_servico4: TDBEdit;
    dbedt_nm_servico4: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure dbnvgBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure dbedt_cd_representanteChange(Sender: TObject);
    procedure dbedt_cd_itemChange(Sender: TObject);
    procedure dbedt_cd_representanteExit(Sender: TObject);
    procedure dbedt_cd_itemExit(Sender: TObject);
    procedure btn_co_representanteClick(Sender: TObject);
    procedure btn_co_itemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrl_cliente_represChange(Sender: TObject);
    procedure pgctrl_cliente_represChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_representanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cb_ordemClick(Sender: TObject);
  private
    Pesquisa : String;
    OnChanging, lNaoConsiste: Boolean;
    a_str_indices : Array[0..1] Of String[60];
    st_modificar, st_incluir, st_excluir : Boolean;
    lcd_representante, lcd_item, lpc_repasse : Boolean;
    function Consiste : Boolean;
    function Grava    : Boolean;
    function VerAlt   : Boolean;
    procedure Cancelar;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
  public
    str_cliente, str_unid, str_produto, str_servico : String;
  end;
var
  frm_cliente_repres: Tfrm_cliente_repres;

implementation

uses GSMLIB, PGGP001, PGGP017, PGSM059, PGSM072, PGSM104;
{$R *.DFM}

procedure Tfrm_cliente_repres.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  lcd_representante := False;
  lcd_item          := False;
  lpc_repasse       := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  { Inicializa o Data Module para Representantes}
  Application.CreateForm( Tdatm_cliente_repres, datm_cliente_repres );

  with datm_cliente_repres do
  begin
    ds_cliente_repres.AutoEdit := st_modificar;
    ds_cliente_repasse.AutoEdit := st_modificar;

    tbl_yesno_.Open;

    qry_empresa_nac_.Close;
    qry_empresa_nac_.Prepare;
    qry_empresa_nac_.Open;

    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;

    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;

    qry_cliente_repres_.Close;
    qry_cliente_repres_.ParamByName('CD_CLIENTE').AsString := str_cliente;
    qry_cliente_repres_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_cliente_repres_.ParamByName('CD_PRODUTO').AsString := str_produto;
    qry_cliente_repres_.ParamByName('CD_SERVICO').AsString := str_servico;
    qry_cliente_repres_.Prepare;
    qry_cliente_repres_.Open;

    if qry_cliente_repres_.RecordCount > 0  then
    begin
      qry_cliente_repasse_.Close;
      qry_cliente_repasse_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
      qry_cliente_repasse_.ParamByName('CD_UNID_NEG').AsString := str_unid;
      qry_cliente_repasse_.ParamByName('CD_PRODUTO').AsString  := str_produto;
      qry_cliente_repasse_.ParamByName('CD_SERVICO').AsString  := str_servico;
      qry_cliente_repasse_.ParamByName('CD_REPRESENTANTE').AsString  := qry_cliente_repres_CD_REPRESENTANTE.AsString;
      qry_cliente_repasse_.Prepare;
      qry_cliente_repasse_.Open;
    end;

  end;

  a_str_indices[0] := 'CD_REPRESENTANTE';

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

procedure Tfrm_cliente_repres.FormShow(Sender: TObject);
begin
  lNaoConsiste := False;
  with datm_cliente_repres do
  begin
    qry_cliente_repres_.Close;
    qry_cliente_repres_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
    qry_cliente_repres_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_cliente_repres_.ParamByName('CD_PRODUTO').AsString  := str_produto;
    qry_cliente_repres_.ParamByName('CD_SERVICO').AsString := str_servico;
    qry_cliente_repres_.Prepare;
    qry_cliente_repres_.Open;

    if qry_cliente_repres_.RecordCount > 0  then
    begin
      qry_cliente_repasse_.Close;
      qry_cliente_repasse_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
      qry_cliente_repasse_.ParamByName('CD_UNID_NEG').AsString := str_unid;
      qry_cliente_repasse_.ParamByName('CD_PRODUTO').AsString  := str_produto;
      qry_cliente_repasse_.ParamByName('CD_SERVICO').AsString  := str_servico;
      qry_cliente_repasse_.ParamByName('CD_REPRESENTANTE').AsString  := qry_cliente_repres_CD_REPRESENTANTE.AsString;
      qry_cliente_repasse_.Prepare;
      qry_cliente_repasse_.Open;
    end;
  end;

  pgctrl_cliente_repres.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_cliente_repres.btn_incluirClick(Sender: TObject);
begin
  if ( pgctrl_cliente_repres.ActivePage = ts_dados_basicos ) or
     ( pgctrl_cliente_repres.ActivePage = ts_lista ) then
  begin
    btn_incluir.Enabled := False;
    mi_incluir.Enabled  := False;
    btn_excluir.Enabled := False;
    mi_excluir.Enabled  := False;

    with datm_cliente_repres do
    begin
      qry_cliente_repres_.DisableControls;
      qry_cliente_repres_.Cancel;
      qry_cliente_repres_.Append;
      qry_cliente_repres_.EnableControls;
      qry_cliente_repres_CD_CLIENTE.AsString  := str_cliente;
      qry_cliente_repres_CD_UNID_NEG.AsString := str_unid;
      qry_cliente_repres_CD_PRODUTO.AsString  := str_produto;
      qry_cliente_repres_CD_SERVICO.AsString  := str_servico;
      qry_cliente_repres_IN_ATIVO.AsString    := '1';
      qry_cliente_repres_IN_DEST_NF.AsString  := '1';
      qry_cliente_repres_IN_DEST_FAT.AsString := '1';
      qry_cliente_repres_IN_DEST_NUM.AsString := '1';
    end;
    pgctrl_cliente_repres.ActivePage := ts_dados_basicos;
    dbedt_cd_representante.SetFocus;
  end
  else
  begin
    btn_incluir.Enabled := False;
    mi_incluir.Enabled  := False;
    btn_excluir.Enabled := False;
    mi_excluir.Enabled  := False;

    with datm_cliente_repres do
    begin
      if qry_cliente_repres_.RecordCount = 0  then
      begin
         BoxMensagem('Selecione um Representante!', 2);
         pgctrl_cliente_repres.ActivePage := ts_lista;
         Cancelar;
         Exit;
      end;
      qry_cliente_repasse_.DisableControls;
      qry_cliente_repasse_.Cancel;
      qry_cliente_repasse_.Append;
      qry_cliente_repasse_.EnableControls;
      qry_cliente_repasse_CD_CLIENTE.AsString  := str_cliente;
      qry_cliente_repasse_CD_UNID_NEG.AsString := str_unid;
      qry_cliente_repasse_CD_PRODUTO.AsString  := str_produto;
      qry_cliente_repasse_CD_SERVICO.AsString  := str_servico;
      qry_cliente_repasse_CD_REPRESENTANTE.AsString := qry_cliente_repres_CD_REPRESENTANTE.AsString;
      qry_cliente_repasse_PC_REPASSE.AsFloat := 0;
      qry_cliente_repasse_IN_ATIVO.AsString  := '1';
    end;
    pgctrl_cliente_repasse.ActivePage := ts_dados_basicos2;
    dbedt_cd_item.SetFocus;
  end
end;

procedure Tfrm_cliente_repres.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_cliente_repres.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_cliente_repres.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_cliente_repres.Cancelar;
begin
  try
    if ( pgctrl_cliente_repres.ActivePage = ts_dados_basicos ) or
       ( pgctrl_cliente_repres.ActivePage = ts_lista ) then
    begin
      {Representante}
      if datm_cliente_repres.qry_cliente_repres_.State in [dsInsert, dsEdit] then
         datm_cliente_repres.qry_cliente_repres_.Cancel;
      pgctrl_cliente_repres.ActivePage := ts_dados_basicos;
      dbedt_cd_representante.SetFocus;
    end
    else
    begin
      {Representante X Repasse}
      if datm_cliente_repres.qry_cliente_repasse_.State in [dsInsert, dsEdit] then
         datm_cliente_repres.qry_cliente_repasse_.Cancel;
      pgctrl_cliente_repasse.ActivePage := ts_dados_basicos2;
      dbedt_cd_item.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_cliente_repres.btn_excluirClick(Sender: TObject);
begin
  if ( pgctrl_cliente_repres.ActivePage = ts_dados_basicos ) or
     ( pgctrl_cliente_repres.ActivePage = ts_lista ) then
  begin
    if BoxMensagem( 'Este Representante será excluído! Confirma exclusão?', 1 ) Then
    try
      datm_main.db_broker.StartTransaction;
      datm_cliente_repres.qry_cliente_repres_.Delete;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_cliente_repres.qry_cliente_repres_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    pgctrl_cliente_repres.ActivePage := ts_lista;
  end
  else
  begin
    if datm_cliente_repres.qry_cliente_repasse_.RecordCount = 0 then Exit;
    if BoxMensagem( 'Este Repasse será excluído! Confirma exclusão?', 1 ) Then
    try
      datm_main.db_broker.StartTransaction;
      datm_cliente_repres.qry_cliente_repasse_.Delete;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_cliente_repres.qry_cliente_repasse_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    pgctrl_cliente_repasse.ActivePage := ts_lista2;
  end;
end;

procedure Tfrm_cliente_repres.dbnvgBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if ( pgctrl_cliente_repres.ActivePage = ts_dados_basicos ) or
     ( pgctrl_cliente_repres.ActivePage = ts_lista ) then
    datm_cliente_repres.qry_cliente_repres_.Cancel
  else
    datm_cliente_repres.qry_cliente_repasse_.Cancel;
end;

procedure Tfrm_cliente_repres.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_cliente_repres.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_cliente_repres.qry_cliente_repres_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

function Tfrm_cliente_repres.Consiste : Boolean;
begin
  Consiste := True;

  if pgctrl_cliente_repres.ActivePage = ts_dados_basicos then
  begin
    {Representante}
    if Not lNaoConsiste then
    begin
      if dbedt_cd_representante.Text = '' then
      begin
        BoxMensagem('Campo Representante deve ser preenchido!', 2);
        pgctrl_cliente_repres.ActivePage := ts_dados_basicos;
        dbedt_cd_representante.SetFocus;
        lcd_representante := True;
        Consiste := False;
        Exit;
      end;
    end;

    If Not ( datm_cliente_repres.qry_cliente_repres_.State in [dsEdit, dsInsert] ) then Exit;
    ValidCodigo( dbedt_cd_representante );
    if dbedt_cd_representante.Text <> '' Then
    begin
      if dbedt_nm_representante.Text = '' Then
      begin
        BoxMensagem('Código do Representante inválido!',2);
        dbedt_cd_representante.SetFocus;
        lcd_representante := True;
        Consiste := False;
        Exit;
      end;
    end;
  end
  else
  if ( pgctrl_cliente_repres.ActivePage = ts_repasse ) and
     ( pgctrl_cliente_repasse.ActivePage = ts_dados_basicos2) then
  begin
    {Item}
    if Not lNaoConsiste then
    begin
      if dbedt_cd_item.Text = '' then
      begin
        BoxMensagem('Campo Item deve ser preenchido!', 2);
        pgctrl_cliente_repres.ActivePage := ts_repasse;
        pgctrl_cliente_repres.ActivePage := ts_dados_basicos2;
        dbedt_cd_item.SetFocus;
        lcd_item := True;
        Consiste := False;
        Exit;
      end;
    end;

    If Not ( datm_cliente_repres.qry_cliente_repasse_.State in [dsEdit, dsInsert] ) then Exit;
    ValidCodigo( dbedt_cd_item );
    if dbedt_cd_item.Text <> '' Then
    begin
      if dbedt_nm_item.Text = '' Then
      begin
        BoxMensagem('Código do Item inválido!', 2);
        dbedt_cd_item.SetFocus;
        lcd_item := True;
        Consiste := False;
        Exit;
      end;
    end;

    {Percentual de Repasse}
    if dbedt_pc_repasse.Text = '' then
    begin
      BoxMensagem('Campo % Repasse deve ser preenchido!', 2);
      pgctrl_cliente_repres.ActivePage := ts_repasse;
      pgctrl_cliente_repres.ActivePage := ts_dados_basicos2;
      dbedt_pc_repasse.SetFocus;
      lpc_repasse := True;
      Consiste := False;
      Exit;
    end;
  end;
end;

function Tfrm_cliente_repres.Grava : Boolean;
begin
  if ( pgctrl_cliente_repres.ActivePage = ts_dados_basicos ) or
     ( pgctrl_cliente_repres.ActivePage = ts_lista ) then
  begin
    try
      datm_main.db_broker.StartTransaction;
      If ( datm_cliente_repres.qry_cliente_repres_.State in [dsInsert, dsEdit] ) then
      begin
        datm_cliente_repres.qry_cliente_repres_.Post;
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        datm_cliente_repres.qry_cliente_repres_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end
  else {Representante X Repasse}
  begin
    try
      datm_main.db_broker.StartTransaction;
      If ( datm_cliente_repres.qry_cliente_repasse_.State in [dsInsert, dsEdit] ) then
      begin
        datm_cliente_repres.qry_cliente_repasse_.Post;
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        datm_cliente_repres.qry_cliente_repasse_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;

  with datm_cliente_repres do
  begin
    qry_cliente_repres_.Close;
    qry_cliente_repres_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
    qry_cliente_repres_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_cliente_repres_.ParamByName('CD_PRODUTO').AsString  := str_produto;
    qry_cliente_repres_.ParamByName('CD_SERVICO').AsString := str_servico;
    qry_cliente_repres_.Prepare;
    qry_cliente_repres_.Open;

    if qry_cliente_repres_.RecordCount > 0 then
    begin
      qry_cliente_repasse_.Close;
      qry_cliente_repasse_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
      qry_cliente_repasse_.ParamByName('CD_UNID_NEG').AsString := str_unid;
      qry_cliente_repasse_.ParamByName('CD_PRODUTO').AsString  := str_produto;
      qry_cliente_repasse_.ParamByName('CD_SERVICO').AsString  := str_servico;
      qry_cliente_repasse_.ParamByName('CD_REPRESENTANTE').AsString  := qry_cliente_repres_CD_REPRESENTANTE.AsString;
      qry_cliente_repasse_.Prepare;
      qry_cliente_repasse_.Open;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_cliente_repres.dbedt_cd_representanteChange(Sender: TObject);
begin
 If ( datm_cliente_repres.qry_cliente_repres_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_cliente_repres.dbedt_cd_itemChange(Sender: TObject);
begin
 If ( datm_cliente_repres.qry_cliente_repasse_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_cliente_repres.dbedt_cd_representanteExit(Sender: TObject);
begin
  if Not OnChanging then
  begin
    lNaoConsiste := True;
    Consiste;
    lNaoConsiste := False;
    lcd_representante := False;
  end;
end;

procedure Tfrm_cliente_repres.dbedt_cd_itemExit(Sender: TObject);
begin
  if Not OnChanging then
  begin
    lNaoConsiste := True;
    Consiste;
    lNaoConsiste := False;
    lcd_item := False;
  end;
end;

procedure Tfrm_cliente_repres.btn_co_representanteClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  Application.CreateForm(Tfrm_cliente_co, frm_cliente_co);
  frm_cliente_co.Cons_OnLine := datm_cliente_repres.qry_cliente_repres_CD_REPRESENTANTE;
  With frm_cliente_co Do Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    lRepresentante := True;
    If Not ( datm_cliente_repres.qry_cliente_repres_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_repres.qry_cliente_repres_.Edit;
    ShowModal;
    lCons_OnLine := False;
    lRepresentante := False;
  end;
  with datm_cliente_repres do
  begin
    qry_empresa_nac_.Close;
    qry_empresa_nac_.Prepare;
    qry_empresa_nac_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_representanteExit(Sender);
end;

procedure Tfrm_cliente_repres.btn_co_itemClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2214';
  Application.CreateForm(Tfrm_item, frm_item);
  frm_item.Cons_OnLine := datm_cliente_repres.qry_cliente_repasse_CD_ITEM;
  With frm_item Do Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_cliente_repres.qry_cliente_repasse_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_repres.qry_cliente_repasse_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_repres do
  begin
    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_itemExit(Sender);
end;

procedure Tfrm_cliente_repres.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_cliente_repres do
  begin
    tbl_yesno_.Close;
    qry_empresa_nac_.Close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_item_.Close;
    qry_cliente_repres_.Close;
    qry_cliente_repasse_.Close;
//    Destroy;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_cliente_repres.pgctrl_cliente_represChange(Sender: TObject);
begin
  OnChanging := False;

  if lcd_item then
  begin
    lcd_item := False;
    pgctrl_cliente_repres.ActivePage := ts_repasse;
    pgctrl_cliente_repasse.ActivePage := ts_dados_basicos2;
    dbedt_cd_item.SetFocus;
    Exit;
  end;

  if lpc_repasse then
  begin
    lpc_repasse := False;
    pgctrl_cliente_repres.ActivePage := ts_repasse;
    pgctrl_cliente_repasse.ActivePage := ts_dados_basicos2;
    dbedt_pc_repasse.SetFocus;
    Exit;
  end;

  if lcd_representante then
  begin
    lcd_representante := False;
    pgctrl_cliente_repres.ActivePage := ts_dados_basicos;
    dbedt_cd_representante.SetFocus;
    Exit;
  end;

  if (pgctrl_cliente_repres.ActivePage=ts_lista) or
     (pgctrl_cliente_repres.ActivePage=ts_dados_basicos) then
     dbnvg.DataSource := datm_cliente_repres.ds_cliente_repres
  else
     dbnvg.DataSource := datm_cliente_repres.ds_cliente_repasse;

  if (pgctrl_cliente_repres.ActivePage = ts_lista ) or
     ((pgctrl_cliente_repres.ActivePage = ts_repasse ) and
      (pgctrl_cliente_repasse.ActivePage = ts_lista2 ) ) then
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

procedure Tfrm_cliente_repres.pgctrl_cliente_represChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  OnChanging := True;
  VerAlt;
end;

function Tfrm_cliente_repres.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( pgctrl_cliente_repres.ActivePage = ts_dados_basicos ) then
  begin
    if ( ( datm_cliente_repres.qry_cliente_repres_.State in [dsEdit] ) and st_modificar ) or
       ( datm_cliente_repres.qry_cliente_repres_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Representantes foi alterado.' + #13#10 +
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
  end
  else {Representante X Repasse}
  begin
    if ( ( datm_cliente_repres.qry_cliente_repasse_.State in [dsEdit] ) and st_modificar ) or
         ( datm_cliente_repres.qry_cliente_repasse_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Repasses foi alterado.' + #13#10 +
         'Deseja salvar as alterações?', 1) then
      begin
        if Not Consiste then Exit;
        if Not Grava then Exit;
      end
      else
        Cancelar;
    end;
  end;
end;

procedure Tfrm_cliente_repres.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_cliente_repres.dbedt_cd_representanteKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if key = VK_F5 then
  begin
    if Sender = dbedt_cd_representante then btn_co_representanteClick(nil);
    if Sender = dbedt_cd_item then btn_co_itemClick(nil);
  end;
end;

procedure Tfrm_cliente_repres.cb_ordemClick(Sender: TObject);
begin
  with datm_cliente_repres do
  begin
    Pesquisa := qry_cliente_repres_.FieldByName('CD_REPRESENTANTE').AsString;
    { Apaga o campo de pesquisa }
    edt_chave.Text := '';
    qry_cliente_repres_.Close;
    qry_cliente_repres_.SQL[6] := a_str_indices[cb_ordem.ItemIndex];
    qry_cliente_repres_.Open;
    Localiza( qry_cliente_repres_, Pesquisa, a_str_indices[0] );
    edt_chave.SetFocus;
  end;
end;

end.
