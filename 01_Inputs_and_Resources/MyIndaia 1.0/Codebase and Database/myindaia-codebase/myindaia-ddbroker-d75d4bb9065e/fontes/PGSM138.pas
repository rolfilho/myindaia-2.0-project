unit PGSM138;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, Funcoes;

type
  Tfrm_mod_follow_up = class(TForm)
    pgctrl_mod_follow_up: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_codigo: TLabel;
    lbl_nome: TLabel;
    dbedt_cd_follow_up: TDBEdit;
    dbedt_descricao: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    dbg_cadastro: TDBGrid;
    dblkpcbox_ativo: TDBLookupComboBox;
    lblAtivo: TLabel;
    ts_mod_follow_up_evento: TTabSheet;
    pgctrl_mod_follow_up_evento: TPageControl;
    ts_lista2: TTabSheet;
    dbg_eventos: TDBGrid;
    ts_dados_basicos2: TTabSheet;
    Panel1: TPanel;
    lbl_evento: TLabel;
    lbl_ordem: TLabel;
    btn_co_evento: TSpeedButton;
    lbl_mod_follow_up: TLabel;
    dbedt_ordem: TDBEdit;
    dbedt_cd_evento: TDBEdit;
    dbedt_nm_evento: TDBEdit;
    Label3: TLabel;
    dbedt_cd_follow_up2: TDBEdit;
    dbedt_descricao2: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dbedt_cd_follow_up3: TDBEdit;
    dbedt_descricao3: TDBEdit;
    dblkpcbox_embarcacao: TDBLookupComboBox;
    dblkpcbox_mercadoria: TDBLookupComboBox;
    dblkpcbox_obs: TDBLookupComboBox;
    dblkpcbox_arm_desc: TDBLookupComboBox;
    dblkpcbox_nr_di: TDBLookupComboBox;
    pnl_cadastro: TPanel;
    pnl_pesquisa: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_mod_follow_upChange(Sender: TObject);
    procedure dbedt_cd_eventoExit(Sender: TObject);
    procedure btn_co_eventoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure pgctrl_mod_follow_upChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure Cancelar;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    function Consiste : Boolean;
    function Grava    : Boolean;
    function Veralt   : Boolean;
    procedure pgctrl_mod_follow_up_eventoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure ts_lista2Enter(Sender: TObject);
    procedure dbedt_cd_eventoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_Online_Texto : String;
  end;

var
  frm_mod_follow_up: Tfrm_mod_follow_up;

implementation

uses GSMLIB, PGSM139, PGSM036, PGGP001, PGGP017;

{$R *.DFM}

procedure Tfrm_mod_follow_up.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_mod_follow_up.btn_incluirClick(Sender: TObject);
begin
  if ( pgctrl_mod_follow_up.ActivePage = ts_dados_basicos ) or
     ( pgctrl_mod_follow_up.ActivePage = ts_lista ) then
  begin
    with datm_mod_follow_up.qry_mod_follow_up_ do
    begin
      DisableControls;
      Cancel;
      Append;
      EnableControls;
    end;

    with datm_mod_follow_up.qry_sel_cd_mod_follow_up do
    begin
      Prepare;
      Open;
      if RecordCount = 0
      then datm_mod_follow_up.qry_mod_follow_up_.FieldByName('cd_follow_up').AsString:= '01'
      else datm_mod_follow_up.qry_mod_follow_up_.FieldByName('cd_follow_up').AsString:=
             StrZero(FieldByName('Cd_follow_up').AsInteger + 1, 2);
      Close;
    end;

//    btn_mi(False, True, True, False);
    pgctrl_mod_follow_up.ActivePage := ts_dados_basicos;
    dbedt_descricao.SetFocus;
  end
  else {Follow_up X Evento}
  begin
    with datm_mod_follow_up, qry_mod_follow_up_evento_ do
    begin
      if qry_mod_follow_up_.RecordCount = 0  then
      begin
         BoxMensagem('Selecione um Modelo de Follow_up!', 2);
         pgctrl_mod_follow_up.ActivePage := ts_lista;
         Cancelar;
         Exit
      end;
      DisableControls;
      Cancel;
      pgctrl_mod_follow_up_evento.ActivePage := ts_dados_basicos2;
      Append;
      EnableControls;
    end;
    dbedt_cd_evento.SetFocus;
//    btn_mi( False, True, True, False );
    dbnvg.Enabled := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled := False;
  end;

end;

procedure Tfrm_mod_follow_up.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_mod_follow_up do
    begin
      tbl_yesno_.Close;
      qry_evento_.Close;
      qry_mod_follow_up_evento_.Close;
      qry_mod_follow_up_.Close;
      free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_mod_follow_up.dbg_cadastroDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_mod_follow_up.qry_mod_follow_up_CD_FOLLOW_UP.AsString;
    except
      try
         Cons_Online_Texto := datm_mod_follow_up.qry_mod_follow_up_CD_FOLLOW_UP.AsString;
      except
         BoxMensagem('Não foi possível retornar o Código do Serviço!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_mod_follow_up.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_mod_follow_up.FormCreate(Sender: TObject);
begin
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
  Application.CreateForm( Tdatm_mod_follow_up, datm_mod_follow_up );

  pgctrl_mod_follow_up.ActivePage:= ts_lista;
  pgctrl_mod_follow_up_evento.ActivePage:= ts_lista2;
  
  with datm_mod_follow_up do
  begin
    ds_mod_follow_up.AutoEdit := st_modificar;
    ds_mod_follow_up_evento.AutoEdit := st_modificar;

    tbl_yesno_.Open;

    qry_evento_.Close;
    qry_evento_.Prepare;
    qry_evento_.Open;

    qry_mod_follow_up_.Close;
    qry_mod_follow_up_.Prepare;
    qry_mod_follow_up_.Open;

    qry_mod_follow_up_Evento_.Close;
    qry_mod_follow_up_Evento_.Prepare;
    qry_mod_follow_up_Evento_.Open;


  end;

  a_str_indices[0] := 'CD_FOLLOW_UP';
  a_str_indices[1] := 'NM_FOLLOW_UP';

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

procedure Tfrm_mod_follow_up.btn_excluirClick(Sender: TObject);
begin
  if ( pgctrl_mod_follow_up.ActivePage = ts_dados_basicos ) or
     ( pgctrl_mod_follow_up.ActivePage = ts_lista ) then
  begin
    if BoxMensagem( 'Este Modelo será excluído! Confirma exclusão?', 1 ) Then
    try
      datm_main.db_broker.StartTransaction;
      datm_mod_follow_up.qry_mod_Follow_up_.Delete;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_mod_follow_up.qry_mod_follow_up_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    pgctrl_mod_follow_up.ActivePage := ts_lista;
  end
  else
  begin
    if datm_mod_follow_up.qry_mod_follow_up_evento_.RecordCount = 0 then Exit;
    if BoxMensagem( 'Este Modelo x Evento será excluído! Confirma exclusão?', 1 ) Then
    try
      datm_main.db_broker.StartTransaction;
      datm_mod_follow_up.qry_mod_follow_up_evento_.Delete;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_mod_follow_up.qry_mod_follow_up_evento_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    pgctrl_mod_follow_up_evento.ActivePage := ts_lista2;
  end;
end;

procedure Tfrm_mod_follow_up.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  lNaoConsiste := False;
  pgctrl_mod_follow_up.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_mod_follow_up.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_mod_follow_up.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_mod_follow_up.qry_mod_follow_up_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )
end;

procedure Tfrm_mod_follow_up.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_mod_follow_up.qry_mod_follow_up_CD_FOLLOW_UP.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  with datm_mod_follow_up.qry_mod_follow_up_ do
  begin
   Close;
   SQL[2] := a_str_indices[cb_ordem.ItemIndex];
   Open;
   Localiza(datm_mod_follow_up.qry_mod_follow_up_, Pesquisa, a_str_indices[0] );
   edt_chave.SetFocus;
  end;
end;

procedure Tfrm_mod_follow_up.pgctrl_mod_follow_upChange(Sender: TObject);
begin
  if ( pgctrl_mod_follow_up.ActivePage = ts_dados_basicos ) or
     ( pgctrl_mod_follow_up.ActivePage = ts_lista ) then
    dbnvg.DataSource := datm_mod_follow_up.ds_mod_follow_up
  else
    dbnvg.DataSource := datm_mod_follow_up.ds_mod_follow_up_evento;

  if (pgctrl_mod_follow_up.ActivePage = ts_lista ) or
     ((pgctrl_mod_follow_up.ActivePage = ts_mod_follow_up_evento ) and
      (pgctrl_mod_follow_up_evento.ActivePage = ts_lista2 ) ) then
  begin
    dbnvg.Enabled := True;
  end
  else
  begin
    dbnvg.Enabled := False;
  end;

  if (pgctrl_mod_follow_up.ActivePage = ts_lista ) then
  begin
    edt_chave.Enabled := True;
    cb_ordem.Enabled := True;
  end
  else
  begin
    edt_chave.Enabled := False;
    cb_ordem.Enabled := False;
  end;

end;

procedure Tfrm_mod_follow_up.dbedt_cd_eventoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_mod_follow_up.btn_co_eventoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2304';
  Application.CreateForm(Tfrm_evento, frm_evento);
  frm_evento.Cons_OnLine := datm_mod_follow_up.qry_mod_follow_up_evento_CD_EVENTO;
  With frm_evento Do Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_mod_follow_up.qry_mod_follow_up_evento_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_mod_follow_up.qry_mod_follow_up_evento_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_mod_follow_up do
  begin
    qry_evento_.Close;
    qry_evento_.Prepare;
    qry_evento_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2231';
  dbedt_cd_eventoExit(Sender);
end;

procedure Tfrm_mod_follow_up.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

function Tfrm_mod_follow_up.Consiste : Boolean;
begin
  if ( pgctrl_mod_follow_up.ActivePage = ts_dados_basicos ) or
     ( pgctrl_mod_follow_up.ActivePage = ts_lista ) then
  begin
    {Descrição do serviço}
    if Not lNaoConsiste then
    begin
      if dbedt_descricao.Text = '' then
      begin
        BoxMensagem('Campo Descrição deve ser preenchido!', 2);
        pgctrl_mod_follow_up.ActivePage := ts_dados_basicos;
        dbedt_descricao.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

  end
  else {Follow_UP X Evento}
  begin
    {Evento nulo}
    if Not lNaoConsiste then
    begin
      if dbedt_cd_evento.Text = '' then
      begin
        BoxMensagem('Campo Evento deve ser preenchido!', 2);
        pgctrl_mod_follow_up_evento.ActivePage := ts_dados_basicos2;
        dbedt_cd_evento.SetFocus;
        Consiste := False;
        Exit;
      end;

      {Nº Ordem Nulo}
      if dbedt_ordem.Text = '' then
      begin
        BoxMensagem('Campo Ordem deve ser preenchido!', 2);
        pgctrl_mod_follow_up_evento.ActivePage := ts_dados_basicos2;
        dbedt_ordem.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if dbedt_cd_evento.Text <> '' Then
    begin
      if datm_mod_follow_up.qry_mod_follow_up_evento_.state in [dsedit, dsinsert]
      then ValidCodigo( dbedt_cd_evento );
      if dbedt_nm_evento.Text = '' Then
      begin
        BoxMensagem('Código do Evento inválido!',2);
        pgctrl_mod_follow_up_evento.ActivePage := ts_dados_basicos;
        dbedt_cd_evento.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;
  Consiste := True;
end;

function Tfrm_mod_follow_up.Grava : Boolean;
begin
  if ( pgctrl_mod_follow_up.ActivePage = ts_dados_basicos ) or
     ( pgctrl_mod_follow_up.ActivePage = ts_lista ) then
  begin
    try
      datm_main.db_broker.StartTransaction;
      If ( datm_mod_follow_up.qry_mod_follow_up_.State in [dsInsert, dsEdit] ) then
      begin
        datm_mod_follow_up.qry_mod_follow_up_.Post;
        Pesquisa := datm_mod_follow_up.qry_mod_follow_up_CD_FOLLOW_UP.AsString;
        datm_mod_follow_up.qry_mod_follow_up_.Close;
        datm_mod_follow_up.qry_mod_follow_up_.Prepare;
        datm_mod_follow_up.qry_mod_follow_up_.Open;
        Localiza(datm_mod_follow_up.qry_mod_follow_up_, Pesquisa, a_str_indices[0] );
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        datm_mod_follow_up.qry_mod_follow_up_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
    end;
    end;
  end
  else {Follou_up X Evento}
  begin
    try
      datm_main.db_broker.StartTransaction;
      If ( datm_mod_follow_up.qry_mod_follow_up_evento_.State in [dsInsert, dsEdit] ) then
      begin
        with datm_mod_follow_up do
        begin
          qry_mod_follow_up_evento_.FieldByName('cd_follow_up').AsString:= dbedt_cd_follow_up2.text;
          qry_mod_follow_up_evento_.Post;
          Pesquisa := qry_mod_follow_up_evento_CD_EVENTO.AsString;
          qry_mod_follow_up_evento_.Close;
          qry_mod_follow_up_evento_.Prepare;
          qry_mod_follow_up_evento_.Open;
          Localiza(qry_mod_follow_up_evento_, Pesquisa, 'CD_EVENTO' );
        end;
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        datm_mod_follow_up.qry_mod_follow_up_evento_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_mod_follow_up.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_mod_follow_up.pgctrl_mod_follow_upChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  If datm_mod_follow_up.qry_mod_follow_up_.RecordCount = 0 then
  begin
    AllowChange:= False;
    exit;
  end;
  AllowChange := VerAlt;
end;

function Tfrm_mod_follow_up.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( pgctrl_mod_follow_up.ActivePage = ts_dados_basicos ) then
  begin
    if ( ( datm_mod_follow_up.qry_mod_follow_up_.State in [dsEdit] ) and st_modificar ) or
       ( datm_mod_follow_up.qry_mod_follow_up_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Tabela de Serviços foi alterada.' + #13#10 +
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
  if (pgctrl_mod_follow_up.ActivePage = ts_mod_follow_up_evento) and
     (pgctrl_mod_follow_up_evento.ActivePage = ts_dados_basicos2) then
  begin
    if ( ( datm_mod_follow_up.qry_mod_follow_up_evento_.State in [dsEdit] ) and st_modificar ) or
       ( datm_mod_follow_up.qry_mod_follow_up_evento_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Tabela de Modelo de Follow_up X Eventos foi alterada.' + #13#10 +
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

procedure Tfrm_mod_follow_up.Cancelar;
begin
  try
    if ( pgctrl_mod_follow_up.ActivePage = ts_dados_basicos ) or
       ( pgctrl_mod_follow_up.ActivePage = ts_lista ) then
    begin
      {Modelo de Follow_up}
      if datm_mod_follow_up.qry_mod_follow_up_.State in [dsInsert, dsEdit] then
        datm_mod_follow_up.qry_mod_follow_up_.Cancel;
      pgctrl_mod_follow_up.ActivePage := ts_dados_basicos;
      dbedt_descricao.SetFocus;
    end
    else if (pgctrl_mod_follow_up.ActivePage = ts_mod_follow_up_evento) then
    begin
      {Modelo de Follow_up X Evento}
      if datm_mod_follow_up.qry_mod_follow_up_evento_.State in [dsInsert, dsEdit] then
        datm_mod_follow_up.qry_mod_follow_up_evento_.Cancel;
      pgctrl_mod_follow_up_evento.ActivePage := ts_dados_basicos2;
      dbedt_cd_evento.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_mod_follow_up.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #27 then Close;
end;

procedure Tfrm_mod_follow_up.pgctrl_mod_follow_up_eventoChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  If datm_mod_follow_up.qry_mod_follow_up_evento_.RecordCount = 0 then
  begin
    AllowChange:= False;
    exit;
  end;
  AllowChange := VerAlt;
end;

procedure Tfrm_mod_follow_up.ts_lista2Enter(Sender: TObject);
begin
  a_str_indices[0] := 'CD_FOLLOW_UP';
  a_str_indices[1] := 'look_evento';
end;

procedure Tfrm_mod_follow_up.dbedt_cd_eventoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = VK_F5 then
  begin
    if Sender = dbedt_cd_evento then btn_co_eventoClick(nil);
  end;
end;

end.
