unit PGSM238;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls;

type
  Tfrm_grupo_item = class(TForm)
    pgctrl_grupo_item: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_descricao: TLabel;
    dbedt_nm_grupo_item: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    dbgrd_grupo_item: TDBGrid;
    ts_grupo_item_item: TTabSheet;
    pgctrl_grupo_item_item: TPageControl;
    ts_lista2: TTabSheet;
    dbgrd_grupo_item_item: TDBGrid;
    ts_dados_basicos2: TTabSheet;
    pnl_grupo_item_item: TPanel;
    lbl_item: TLabel;
    btn_co_item: TSpeedButton;
    lbl_grupo_item2: TLabel;
    dbedt_cd_item: TDBEdit;
    dbedt_nm_item: TDBEdit;
    dbedt_cd_grupo_item3: TDBEdit;
    dbedt_nm_grupo_item3: TDBEdit;
    lbl_grupo_item: TLabel;
    dbedt_cd_grupo_item2: TDBEdit;
    dbedt_nm_grupo_item2: TDBEdit;
    lbl_codigo: TLabel;
    dbedt_cd_grupo_item: TDBEdit;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pnl_pesquisa: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    lbl_acesso: TLabel;
    dbedt_cd_acesso_cre: TDBEdit;
    dbedt_cd_aux_cre: TDBEdit;
    lbl_aux: TLabel;
    dbedt_cd_ct_contabil_cre: TDBEdit;
    lbl_ct_contabil: TLabel;
    edt_nm_ct_contabil_cre: TEdit;
    btn_co_ct_contabil_cre: TSpeedButton;
    dbedt_cd_acesso_deb: TDBEdit;
    Label34: TLabel;
    dbedt_cd_aux_deb: TDBEdit;
    Label35: TLabel;
    dbedt_cd_ct_contabil_deb: TDBEdit;
    Label33: TLabel;
    btn_co_ct_contabil_deb: TSpeedButton;
    edt_nm_ct_contabil_deb: TEdit;
    dbedt_nm_desc_contabil: TDBEdit;
    Label3: TLabel;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrd_grupo_itemDblClick(Sender: TObject);
    procedure dbgrd_grupo_itemKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_nm_grupo_itemChange(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_grupo_itemChange(Sender: TObject);
    procedure dbedt_cd_itemChange(Sender: TObject);
    procedure dbedt_cd_itemExit(Sender: TObject);
    procedure btn_co_itemClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure pgctrl_grupo_itemChanging(Sender: TObject; var AllowChange: Boolean);
    procedure Cancelar;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_classifKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pgctrl_grupo_item_itemChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbedt_cd_grupo_itemExit(Sender: TObject);
    procedure dbedt_cd_acesso_creExit(Sender: TObject);
    procedure dbedt_cd_aux_creExit(Sender: TObject);
    procedure dbedt_cd_ct_contabil_creKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure btn_co_ct_contabil_creClick(Sender: TObject);
    procedure btn_co_ct_contabil_debClick(Sender: TObject);
    procedure dbedt_cd_acesso_debExit(Sender: TObject);
    procedure dbedt_cd_aux_debExit(Sender: TObject);
    procedure dbedt_cd_ct_contabil_creExit(Sender: TObject);
    procedure dbedt_cd_ct_contabil_debExit(Sender: TObject);
  private
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    function Consiste : Boolean;
    function Grava    : Boolean;
    function Veralt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_Online_Texto : String;
  end;

var
  frm_grupo_item: Tfrm_grupo_item;

implementation

uses GSMLIB, PGGP001, PGGP017, PGSM096, PGSM239, PGSM059, ConsOnLineEx;

{$R *.DFM}

procedure Tfrm_grupo_item.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_grupo_item.btn_incluirClick(Sender: TObject);
begin
  if ( pgctrl_grupo_item.ActivePage = ts_dados_basicos ) or
     ( pgctrl_grupo_item.ActivePage = ts_lista ) then
  begin
    with datm_grupo_item do
    begin
      qry_grupo_item_.DisableControls;
      qry_grupo_item_.Cancel;
      qry_grupo_item_.Append;

      qry_grupo_item_CD_GRUPO_ITEM.AsString := UltCod( qry_ult_grupo_item_, qry_ult_grupo_item_ULTIMO );
      qry_grupo_item_.EnableControls;
    end;
    pgctrl_grupo_item.ActivePage := ts_dados_basicos;
    dbedt_nm_grupo_item.SetFocus;
  end
  else if pgctrl_grupo_item.ActivePage = ts_grupo_item_item then  // Grupo X Itens
  begin
    with datm_grupo_item do
    begin
      if qry_grupo_item_.RecordCount = 0  then
      begin
        BoxMensagem('Selecione um Grupo de Itens!', 2);
        Cancelar;
        pgctrl_grupo_item.ActivePage := ts_lista;
        Exit;
      end;

      pgctrl_grupo_item_item.Enabled := True;
      qry_grupo_item_item_.DisableControls;
      qry_grupo_item_item_.Cancel;
      qry_grupo_item_item_.Append;
      qry_grupo_item_item_.EnableControls;

      qry_grupo_item_item_CD_GRUPO_ITEM.AsString := qry_grupo_item_CD_GRUPO_ITEM.AsString;
    end;
    pgctrl_grupo_item_item.ActivePage            := ts_dados_basicos2;
    pnl_grupo_item_item.Enabled                  := True;
    dbedt_cd_item.SetFocus;
  end;

  btn_mi( False, True, True, False );

  dbnvg.Enabled     := False;
  edt_chave.Enabled := False;
  cb_ordem.Enabled  := False;
end;

procedure Tfrm_grupo_item.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_grupo_item do
    begin
      qry_grupo_item_.Close;
      qry_grupo_item_item_.Close;
      qry_item_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_grupo_item.dbgrd_grupo_itemDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_grupo_item.qry_grupo_item_CD_GRUPO_ITEM.AsString;
    except
      try
         Cons_Online_Texto := datm_grupo_item.qry_grupo_item_CD_GRUPO_ITEM.AsString;
      except
         BoxMensagem('Não foi possível retornar o Código do Grupo de Itens!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_grupo_item.dbgrd_grupo_itemKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbgrd_grupo_itemDblClick(nil);
end;

procedure Tfrm_grupo_item.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  // Inicializa o Data Module para Grupo de Itens
  Application.CreateForm( Tdatm_grupo_item, datm_grupo_item );

  with datm_grupo_item do
  begin
    ds_grupo_item.AutoEdit      := st_modificar;
    ds_grupo_item_item.AutoEdit := st_modificar;

    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;

    qry_grupo_item_.Close;
    qry_grupo_item_.SQL[2] := 'NM_GRUPO_ITEM';
    qry_grupo_item_.Prepare;
    qry_grupo_item_.Open;

    qry_grupo_item_item_.Close;
    qry_grupo_item_item_.ParamByName('CD_GRUPO_ITEM').AsString := qry_grupo_item_CD_GRUPO_ITEM.AsString;
    qry_grupo_item_item_.Prepare;
    qry_grupo_item_item_.Open;
  end;

  a_str_indices[0] := 'CD_GRUPO_ITEM';
  a_str_indices[1] := 'NM_GRUPO_ITEM';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Nome');
    ItemIndex := 1;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;
end;

procedure Tfrm_grupo_item.btn_excluirClick(Sender: TObject);
begin
  with datm_grupo_item do
  begin
    if ( pgctrl_grupo_item.ActivePage = ts_dados_basicos ) or
       ( pgctrl_grupo_item.ActivePage = ts_lista ) then
    begin
      if BoxMensagem( 'Este Grupo de Itens será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        // Grupo X Item
        CloseStoredProc(sp_exclui_grupo_item);
        sp_exclui_grupo_item.ParamByName('@CD_GRUPO_ITEM').AsString := qry_grupo_item_CD_GRUPO_ITEM.AsString;
        ExecStoredProc(sp_exclui_grupo_item);
        CloseStoredProc(sp_exclui_grupo_item);
        // Grupo de Itens
        qry_grupo_item_.Delete;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          qry_grupo_item_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      pgctrl_grupo_item.ActivePage := ts_lista;
    end
    else if pgctrl_grupo_item.ActivePage = ts_grupo_item_item then
    begin
      if qry_grupo_item_item_.RecordCount = 0 then Exit;
      if BoxMensagem( 'Este Grupo X Item será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        qry_grupo_item_item_.Delete;
        datm_main.db_broker.Commit;
        qry_grupo_item_item_.Close;
        qry_grupo_item_item_.Prepare;
        qry_grupo_item_item_.Open;
      except
        on E: Exception do
        begin
          qry_grupo_item_item_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      pgctrl_grupo_item.ActivePage := ts_lista2;
    end;
  end;
end;

procedure Tfrm_grupo_item.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  lNaoConsiste                 := False;
  pgctrl_grupo_item.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_grupo_item.dbedt_nm_grupo_itemChange(Sender: TObject);
begin
 if ( datm_grupo_item.qry_grupo_item_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_grupo_item.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_grupo_item.edt_chaveChange(Sender: TObject);
begin
  Localiza( datm_grupo_item.qry_grupo_item_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_grupo_item.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_grupo_item.qry_grupo_item_CD_GRUPO_ITEM.AsString;
  // Apaga o campo de pesquisa
  edt_chave.Text := '';
  datm_grupo_item.qry_grupo_item_.Close;
  datm_grupo_item.qry_grupo_item_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_grupo_item.qry_grupo_item_.Prepare;
  datm_grupo_item.qry_grupo_item_.Open;
  Localiza( datm_grupo_item.qry_grupo_item_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_grupo_item.pgctrl_grupo_itemChange(Sender: TObject);
begin
  if ( pgctrl_grupo_item.ActivePage = ts_dados_basicos ) or
     ( pgctrl_grupo_item.ActivePage = ts_lista ) then
  begin
    dbnvg.DataSource     := datm_grupo_item.ds_grupo_item;
  end
  else if pgctrl_grupo_item.ActivePage = ts_grupo_item_item then
  begin
    dbnvg.DataSource := datm_grupo_item.ds_grupo_item_item;
  end;

  if (   pgctrl_grupo_item.ActivePage = ts_lista ) or
     ( ( pgctrl_grupo_item.ActivePage = ts_grupo_item_item ) and
       ( pgctrl_grupo_item.ActivePage = ts_lista2 ) ) then
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

  btn_mi( st_incluir, False, False, st_excluir );

  if ( pgctrl_grupo_item.ActivePage = ts_grupo_item_item ) and
     ( datm_grupo_item.qry_grupo_item_item_.RecordCount = 0 ) then
  begin
    pgctrl_grupo_item_item.Enabled := False;
  end
  else
  begin
    pgctrl_grupo_item_item.Enabled := True;
  end;
end;

procedure Tfrm_grupo_item.dbedt_cd_itemChange(Sender: TObject);
begin
  if ( datm_grupo_item.qry_grupo_item_item_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_grupo_item.dbedt_cd_itemExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_grupo_item.btn_co_itemClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_item, frm_item);
  frm_item.Cons_OnLine := datm_grupo_item.qry_grupo_item_item_CD_ITEM;
  with frm_item do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_grupo_item.qry_grupo_item_item_.State in [dsEdit, dsInsert] ) and
      ( st_modificar ) and
      ( datm_grupo_item.ds_grupo_item_item.AutoEdit ) then
       begin
         datm_grupo_item.qry_grupo_item_item_.Edit;
       end;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_grupo_item do
  begin
    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;
  end;
  if ( datm_grupo_item.ds_grupo_item_item.AutoEdit ) then
    dbedt_cd_itemExit(Sender);
end;

procedure Tfrm_grupo_item.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

function Tfrm_grupo_item.Consiste : Boolean;
begin
  if ( pgctrl_grupo_item.ActivePage = ts_dados_basicos ) or
     ( pgctrl_grupo_item.ActivePage = ts_lista ) then
  begin
    // Código do Grupo de Itens
    if datm_grupo_item.qry_grupo_item_.State in [dsEdit, dsInsert] then
    begin
      ValidCodigo( dbedt_cd_grupo_item );
    end;
    if Not lNaoConsiste then
    begin
      if dbedt_cd_grupo_item.Text = '' then
      begin
        BoxMensagem('Campo Código do Grupo de Itens deve ser preenchido!', 2);
        pgctrl_grupo_item.ActivePage := ts_dados_basicos;
        dbedt_cd_grupo_item.SetFocus;
        Consiste := False;
        Exit;
      end;

      // Nome do Grupo de Itens
      if dbedt_nm_grupo_item.Text = '' then
      begin
        BoxMensagem('Campo Nome deve ser preenchido!', 2);
        pgctrl_grupo_item.ActivePage := ts_dados_basicos;
        dbedt_nm_grupo_item.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    // Conta Contábel
    if edt_nm_ct_contabil_cre.Text <> '' then
    begin
      if edt_nm_ct_contabil_deb.Text = '' then
      begin
        BoxMensagem('Ambas contas contábeis devem ser preenchidas!', 2);
        pgctrl_grupo_item.ActivePage := ts_dados_basicos;
        dbedt_cd_acesso_cre.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if edt_nm_ct_contabil_deb.Text <> '' then
    begin
      if edt_nm_ct_contabil_cre.Text = '' then
      begin
        BoxMensagem('Ambas contas contábeis devem ser preenchidas!', 2);
        pgctrl_grupo_item.ActivePage := ts_dados_basicos;
        dbedt_cd_acesso_deb.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end
  else if pgctrl_grupo_item.ActivePage = ts_grupo_item_item then  // Grupo X Itens
  begin
    // Item
    if datm_grupo_item.qry_grupo_item_item_.State in [dsInsert, dsEdit] then
       ValidCodigo( dbedt_cd_item );

    if Not lNaoConsiste then
    begin
      if dbedt_cd_item.Text = '' then
      begin
        BoxMensagem( 'Campo Item deve ser preenchido!', 2 );
        pgctrl_grupo_item.ActivePage      := ts_grupo_item_item;
        pgctrl_grupo_item_item.ActivePage := ts_dados_basicos2;
        dbedt_cd_item.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if dbedt_cd_item.Text <> '' then
    begin
      if dbedt_nm_item.Text = '' then
      begin
        BoxMensagem( 'Código do Item inválido!', 2 );
        pgctrl_grupo_item.ActivePage      := ts_grupo_item_item;
        pgctrl_grupo_item_item.ActivePage := ts_dados_basicos2;
        dbedt_cd_item.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;
  Consiste := True;
end;

function Tfrm_grupo_item.Grava : Boolean;
begin
  Grava := True;
  if ( pgctrl_grupo_item.ActivePage = ts_dados_basicos ) or
     ( pgctrl_grupo_item.ActivePage = ts_lista ) then
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_grupo_item.qry_grupo_item_.State in [dsInsert, dsEdit] ) then
      begin
        datm_grupo_item.qry_grupo_item_.Post;
        Pesquisa := datm_grupo_item.qry_grupo_item_CD_GRUPO_ITEM.AsString;
        datm_grupo_item.qry_grupo_item_.Close;
        datm_grupo_item.qry_grupo_item_.Prepare;
        datm_grupo_item.qry_grupo_item_.Open;
        Localiza( datm_grupo_item.qry_grupo_item_, Pesquisa, a_str_indices[0] );
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        datm_grupo_item.qry_grupo_item_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
    end;
    end;
  end
  else if pgctrl_grupo_item.ActivePage = ts_grupo_item_item then  // Grupo X Item
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_grupo_item.qry_grupo_item_item_.State in [dsInsert, dsEdit] ) then
      begin
        datm_grupo_item.qry_grupo_item_item_.Post;
        Pesquisa := datm_grupo_item.qry_grupo_item_item_CD_ITEM.AsString;
        datm_grupo_item.qry_grupo_item_item_.Close;
        datm_grupo_item.qry_grupo_item_item_.ParamByName('CD_GRUPO_ITEM').AsString := datm_grupo_item.qry_grupo_item_CD_GRUPO_ITEM.AsString;
        datm_grupo_item.qry_grupo_item_item_.Prepare;
        datm_grupo_item.qry_grupo_item_item_.Open;
        datm_grupo_item.qry_grupo_item_item_.Locate( 'CD_ITEM', Pesquisa, [loCaseInsensitive] );
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        datm_grupo_item.qry_grupo_item_item_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;
  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_grupo_item.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava    then Exit;
end;

procedure Tfrm_grupo_item.pgctrl_grupo_itemChanging(Sender: TObject;
var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_grupo_item.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( pgctrl_grupo_item.ActivePage = ts_dados_basicos ) then
  begin
    if ( ( datm_grupo_item.qry_grupo_item_.State in [dsEdit] ) and st_modificar ) or
       ( datm_grupo_item.qry_grupo_item_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Grupo de Itens foi alterado.' + #13#10 +
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
  if ( pgctrl_grupo_item.ActivePage = ts_grupo_item_item ) and
     ( pgctrl_grupo_item.ActivePage = ts_dados_basicos2 ) then
  begin
    if ( ( datm_grupo_item.qry_grupo_item_item_.State in [dsEdit] ) and st_modificar ) or
       ( datm_grupo_item.qry_grupo_item_item_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Grupo X Item foi alterado.' + #13#10 +
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
end;

procedure Tfrm_grupo_item.Cancelar;
begin
  try
    if ( pgctrl_grupo_item.ActivePage = ts_dados_basicos ) or
       ( pgctrl_grupo_item.ActivePage = ts_lista ) then
    begin
      // Grupo de Item
      if datm_grupo_item.qry_grupo_item_.State in [dsInsert, dsEdit] then
        datm_grupo_item.qry_grupo_item_.Cancel;
      pgctrl_grupo_item.ActivePage := ts_dados_basicos;
      dbedt_nm_grupo_item.SetFocus;
    end
    else if ( pgctrl_grupo_item.ActivePage = ts_grupo_item_item ) then
    begin
      // Grupo X Item
      if datm_grupo_item.qry_grupo_item_item_.State in [dsInsert, dsEdit] then
        datm_grupo_item.qry_grupo_item_item_.Cancel;
      pgctrl_grupo_item_item.ActivePage := ts_dados_basicos2;
      dbedt_cd_item.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;

  if ( pgctrl_grupo_item.ActivePage = ts_grupo_item_item ) and
     ( datm_grupo_item.qry_grupo_item_item_.RecordCount = 0 ) then
  begin
    pgctrl_grupo_item_item.Enabled := False;
  end
  else
  begin
    pgctrl_grupo_item_item.Enabled := True;
  end;

  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_grupo_item.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_grupo_item.dbedt_cd_classifKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_item then btn_co_itemClick(nil);
  end;
end;

procedure Tfrm_grupo_item.pgctrl_grupo_item_itemChanging(
Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_grupo_item.dbedt_cd_grupo_itemExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_grupo_item.dbedt_cd_acesso_creExit(Sender: TObject);
begin
  with datm_grupo_item do
  begin
    if ( Trim( dbedt_cd_acesso_cre.Text ) <> '' ) and ( Trim( dbedt_cd_aux_cre.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_.Close;
      qry_ct_contabil_unica_.ParamByName('CD_ACESSO_AUX').AsString := Trim( dbedt_cd_acesso_cre.Text ) + Trim( dbedt_cd_aux_cre.Text );
      qry_ct_contabil_unica_.Prepare;
      qry_ct_contabil_unica_.Open;
      if qry_ct_contabil_unica_.RecordCount > 0 then
      begin
        if qry_grupo_item_.State in [dsEdit, dsInsert] then  qry_grupo_item_.FieldByName('CD_CT_CONTABIL_CRE').AsString := qry_ct_contabil_unica_.FieldByName('CD_CT_CONTABIL').AsString;
      end
      else
      begin
        BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2);
      end;
      qry_ct_contabil_unica_.Close;
    end;
  end;
end;

procedure Tfrm_grupo_item.dbedt_cd_aux_creExit(Sender: TObject);
begin
  with datm_grupo_item do
  begin
    if ( Trim( dbedt_cd_acesso_cre.Text ) <> '' ) and ( Trim( dbedt_cd_aux_cre.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_.Close;
      qry_ct_contabil_unica_.ParamByName('CD_ACESSO_AUX').AsString := Trim( dbedt_cd_acesso_cre.Text ) + Trim( dbedt_cd_aux_cre.Text );
      qry_ct_contabil_unica_.Prepare;
      qry_ct_contabil_unica_.Open;
      if qry_ct_contabil_unica_.RecordCount > 0 then
      begin
        if qry_grupo_item_.State in [dsEdit, dsInsert] then qry_grupo_item_.FieldByName('CD_CT_CONTABIL_CRE').AsString := qry_ct_contabil_unica_.FieldByName('CD_CT_CONTABIL').AsString;
      end
      else
      begin
        BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2 );
      end;
      qry_ct_contabil_unica_.Close;
    end;
  end;
end;

procedure Tfrm_grupo_item.dbedt_cd_ct_contabil_creKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = dbedt_cd_ct_contabil_cre     then btn_co_ct_contabil_creClick(btn_co_ct_contabil_cre)    else
    if Sender = dbedt_cd_ct_contabil_deb     then btn_co_ct_contabil_debClick(btn_co_ct_contabil_deb);
  end;
end;

procedure Tfrm_grupo_item.btn_co_ct_contabil_creClick(Sender: TObject);
begin
  if datm_grupo_item.qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
  begin
    If Sender Is TSpeedButton Then
    Begin
      If Not PoeEmEdicao(datm_grupo_item.qry_grupo_item_) Then exit;
      datm_grupo_item.qry_grupo_item_CD_CT_CONTABIL_CRE.AsString := ConsultaOnLineExSQL('SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "' + str_cd_coligada + '"',
                                                                                  'Contas Contábeis', ['CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL'], ['Código','Conta','Descrição'], 'CD_CT_CONTABIL', nil);
      btn_mi( False, True, True, False );
    End
    Else
      edt_nm_ct_contabil_cre.Text := ConsultaLookUPSQL('SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "' + str_cd_coligada + '" and CD_CT_CONTABIL = "' + dbedt_cd_ct_contabil_cre.Text + '"','NM_CONTATO');
  end
  else
  begin
    if Sender Is TSpeedButton Then
    begin
      if not PoeEmEdicao(datm_grupo_item.qry_grupo_item_) Then exit;
      datm_grupo_item.qry_grupo_item_CD_CT_CONTABIL_CRE.AsString := ConsultaOnLineEx('TCT_CONTABIL','Contas Contábeis',['CD_CT_CONTABIL', 'NM_CT_CONTABIL'],['Código','Descrição'],'CD_CT_CONTABIL',nil);
      btn_mi( False, True, True, False );
    end
    else
      edt_nm_ct_contabil_cre.Text := ConsultaLookUP('TCT_CONTABIL','CD_CT_CONTABIL',dbedt_cd_ct_contabil_cre.Text,'NM_CT_CONTABIL');
  end;
end;

procedure Tfrm_grupo_item.btn_co_ct_contabil_debClick(Sender: TObject);
begin
  if datm_grupo_item.qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
  begin
    if Sender Is TSpeedButton Then
    begin
      If Not PoeEmEdicao(datm_grupo_item.qry_grupo_item_) Then exit;
      datm_grupo_item.qry_grupo_item_CD_CT_CONTABIL_DEB.AsString := ConsultaOnLineExSQL('SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "' + str_cd_coligada + '"',
                                                                                  'Contas Contábeis', ['CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL'], ['Código','Conta','Descrição'], 'CD_CT_CONTABIL', nil);
      btn_mi( False, True, True, False );
    end
    else
      edt_nm_ct_contabil_deb.Text := ConsultaLookUPSQL('SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "' + str_cd_coligada + '" and CD_CT_CONTABIL = "' + dbedt_cd_ct_contabil_deb.Text + '"','NM_CONTATO');
  end
  else
  begin
    if Sender Is TSpeedButton Then
    begin
      if not PoeEmEdicao(datm_grupo_item.qry_grupo_item_) Then exit;
      datm_grupo_item.qry_grupo_item_CD_CT_CONTABIL_DEB.AsString := ConsultaOnLineEx('TCT_CONTABIL','Contas Contábeis',['CD_CT_CONTABIL', 'NM_CT_CONTABIL'],['Código','Descrição'],'CD_CT_CONTABIL',nil);
      btn_mi( False, True, True, False );
    end
    else
      edt_nm_ct_contabil_deb.Text := ConsultaLookUP('TCT_CONTABIL','CD_CT_CONTABIL',dbedt_cd_ct_contabil_deb.Text,'NM_CT_CONTABIL');
  end;
end;

procedure Tfrm_grupo_item.dbedt_cd_acesso_debExit(Sender: TObject);
begin
  with datm_grupo_item do
  begin
    if ( Trim( dbedt_cd_acesso_deb.Text ) <> '' ) and ( Trim( dbedt_cd_aux_deb.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_.Close;
      qry_ct_contabil_unica_.ParamByName('CD_ACESSO_AUX').AsString := Trim( dbedt_cd_acesso_deb.Text ) + Trim( dbedt_cd_aux_deb.Text );
      qry_ct_contabil_unica_.Prepare;
      qry_ct_contabil_unica_.Open;
      if qry_ct_contabil_unica_.RecordCount > 0 then
      begin
        if qry_grupo_item_.State in [dsEdit, dsInsert] then  qry_grupo_item_.FieldByName('CD_CT_CONTABIL_DEB').AsString := qry_ct_contabil_unica_.FieldByName('CD_CT_CONTABIL').AsString;
      end
      else
      begin
        BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2);
      end;
      qry_ct_contabil_unica_.Close;
    end;
  end;
end;

procedure Tfrm_grupo_item.dbedt_cd_aux_debExit(Sender: TObject);
begin
  with datm_grupo_item do
  begin
    if ( Trim( dbedt_cd_acesso_deb.Text ) <> '' ) and ( Trim( dbedt_cd_aux_deb.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_.Close;
      qry_ct_contabil_unica_.ParamByName('CD_ACESSO_AUX').AsString := Trim( dbedt_cd_acesso_deb.Text ) + Trim( dbedt_cd_aux_deb.Text );
      qry_ct_contabil_unica_.Prepare;
      qry_ct_contabil_unica_.Open;
      if qry_ct_contabil_unica_.RecordCount > 0 then
      begin
        if qry_grupo_item_.State in [dsEdit, dsInsert] then qry_grupo_item_.FieldByName('CD_CT_CONTABIL_DEB').AsString := qry_ct_contabil_unica_.FieldByName('CD_CT_CONTABIL').AsString;
      end
      else
      begin
        BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2 );
      end;
      qry_ct_contabil_unica_.Close;
    end;
  end;
end;

procedure Tfrm_grupo_item.dbedt_cd_ct_contabil_creExit(Sender: TObject);
begin
  if Trim( dbedt_cd_ct_contabil_cre.Text ) <> '' then
  begin
    if ( edt_nm_ct_contabil_cre.Text = '' ) then
    begin
      BoxMensagem('Código da Contra Partida inválido!',2);
      dbedt_cd_ct_contabil_cre.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_grupo_item.dbedt_cd_ct_contabil_debExit(Sender: TObject);
begin
  if Trim( dbedt_cd_ct_contabil_deb.Text ) <> '' then
  begin
    if ( edt_nm_ct_contabil_deb.Text = '' ) then
    begin
      BoxMensagem('Código da Contra Partida inválido!',2);
      dbedt_cd_ct_contabil_deb.SetFocus;
      Exit;
    end;
  end;
end;

end.
