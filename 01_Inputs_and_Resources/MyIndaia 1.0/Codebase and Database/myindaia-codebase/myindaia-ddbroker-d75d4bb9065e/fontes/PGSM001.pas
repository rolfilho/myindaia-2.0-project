unit PGSM001;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, DBCtrls, Buttons, Menus, StdCtrls, Mask,
  ComCtrls,DB;

type
  Tfrm_modulo = class(TForm)
    pnl_modulo_rotina: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pgctrl_modulo: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbedt_cd_modulo: TDBEdit;
    dbedt_nm_modulo: TDBEdit;
    dbedt_ap_modulo: TDBEdit;
    ts_rotina: TTabSheet;
    pgctrl_modulo_rotina: TPageControl;
    ts_lista_modulo_rotina: TTabSheet;
    Label10: TLabel;
    dbg_cadastro_modulo_rotina: TDBGrid;
    dbedt_cd_modulo2: TDBEdit;
    dbedt_nm_modulo2: TDBEdit;
    ts_dados_basicos_modulo_rotina: TTabSheet;
    Label13: TLabel;
    Label6: TLabel;
    Label14: TLabel;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    dbedt_cd_modulo_modulo_rotina: TDBEdit;
    dbedt_nm_modulo_modulo_rotina: TDBEdit;
    dbedt_cd_rotina_modulo_rotina: TDBEdit;
    dbedt_nm_rotina_modulo_rotina: TDBEdit;
    Label7: TLabel;
    dbedit_nm_menu_modulo_rotina: TDBEdit;
    Label8: TLabel;
    dbedit_nm_form_modulo_rotina: TDBEdit;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_nm_moduloChange(Sender: TObject);
    procedure dbedt_nm_modulo_modulo_rotinaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure pgctrl_moduloChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pgctrl_moduloChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    OnChanging: Boolean;
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar : boolean;
    st_incluir   : boolean;
    st_excluir   : boolean;
    lcd_modulo   : boolean;
    lnm_modulo   : boolean;
    lap_modulo   : boolean;
    lcd_rotina_modulo_rotina   : boolean;
    lnm_rotina_modulo_rotina   : boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    { Public declarations }
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_modulo: Tfrm_modulo;

implementation

uses PGSM050, GSMLIB, PGGP017, PGGP001;

{$R *.DFM}

procedure Tfrm_modulo.btn_incluirClick(Sender: TObject);
begin
  if (pgctrl_modulo.ActivePage=ts_lista) or (pgctrl_modulo.ActivePage=ts_dados_basicos) then
  begin
    with datm_modulo do
    begin
      qry_modulo_.DisableControls;
      qry_modulo_.Cancel;
      qry_modulo_.Append;
      qry_modulo_.EnableControls;
    end;
    pgctrl_modulo.ActivePage := ts_dados_basicos;
    dbedt_cd_modulo.SetFocus;
  end
  else if (pgctrl_modulo_rotina.ActivePage=ts_lista_modulo_rotina) or
          (pgctrl_modulo_rotina.ActivePage=ts_dados_basicos_modulo_rotina) then
  begin
    with datm_modulo do
    begin
      qry_modulo_rotina_.DisableControls;
      qry_modulo_rotina_.Cancel;
      qry_modulo_rotina_.Append;
      qry_modulo_rotina_.EnableControls;
    end;
    pgctrl_modulo.ActivePage := ts_rotina;
    PgCtrl_modulo_rotina.ActivePage := ts_dados_basicos_modulo_rotina;
    datm_modulo.qry_modulo_rotina_CD_MODULO.AsString := datm_modulo.qry_modulo_CD_MODULO.AsString;

    //sugere o codigo para o usuario
    datm_modulo.qry_ult_modulo_rotina_.Close;
    datm_modulo.qry_ult_modulo_rotina_.ParamByName('CD_MODULO').AsString:=datm_modulo.qry_modulo_.FieldByName('CD_MODULO').AsString;
    datm_modulo.qry_ult_modulo_rotina_.Open;
    if datm_modulo.qry_ult_modulo_rotina_ULTIMO.Text = '0000' then
       datm_modulo.qry_modulo_rotina_CD_ROTINA.AsString:=datm_modulo.qry_modulo_rotina_CD_MODULO.AsString+'01'
    else
       datm_modulo.qry_modulo_rotina_CD_ROTINA.AsString:=StrZero(datm_modulo.qry_ult_modulo_rotina_ULTIMO.AsInteger+1,4);
    dbedt_cd_rotina_modulo_rotina.SetFocus;
  end;

  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  dbnvg.Enabled := False;
  edt_chave.Enabled := False;
  cb_ordem.Enabled := False;
end;

procedure Tfrm_modulo.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_modulo.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_modulo.btn_excluirClick(Sender: TObject);
begin
  if (pgctrl_modulo.ActivePage=ts_lista) or (pgctrl_modulo.ActivePage=ts_dados_basicos) then
  begin
    if BoxMensagem( 'Este módulo será excluído! Confirma exclusão?', 1 ) Then
    try
      datm_main.db_broker.StartTransaction;
      datm_modulo.qry_modulo_.Delete;
      CloseStoredProc(datm_modulo.sp_atz_controle_acesso);
      ExecStoredProc(datm_modulo.sp_atz_controle_acesso);
      CloseStoredProc(datm_modulo.sp_atz_controle_acesso);
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_modulo.qry_modulo_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    pgctrl_modulo.ActivePage := ts_lista;
  end
  else if (pgctrl_modulo_rotina.ActivePage=ts_lista_modulo_rotina) or
          (pgctrl_modulo_rotina.ActivePage=ts_dados_basicos_modulo_rotina) then
  begin
    if BoxMensagem( 'Esta rotina será excluída! Confirma exclusão?', 1 ) Then
      try
        datm_main.db_broker.StartTransaction;
        datm_modulo.qry_modulo_rotina_.Delete;
        CloseStoredProc(datm_modulo.sp_atz_controle_acesso);
        ExecStoredProc(datm_modulo.sp_atz_controle_acesso);
        CloseStoredProc(datm_modulo.sp_atz_controle_acesso);
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          datm_modulo.qry_modulo_rotina_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      PgCtrl_modulo_rotina.ActivePage := ts_lista_modulo_rotina;
  end;
end;

procedure Tfrm_modulo.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_modulo.qry_modulo_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_modulo.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_modulo.qry_modulo_CD_MODULO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_modulo.qry_modulo_.Close;
  datm_modulo.qry_modulo_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_modulo.qry_modulo_.Open;
  Localiza(datm_modulo.qry_modulo_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_modulo.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_modulo.dbg_cadastroDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_modulo.qry_modulo_CD_MODULO.AsString;
    except
      try
        Cons_Online_Texto := datm_modulo.qry_modulo_CD_MODULO.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código do Módulo !', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_modulo.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_modulo.dbedt_nm_moduloChange(Sender: TObject);
begin
  If ( datm_modulo.qry_modulo_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_modulo.dbedt_nm_modulo_modulo_rotinaChange(Sender: TObject);
begin
  If ( datm_modulo.qry_modulo_rotina_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_modulo.FormCreate(Sender: TObject);
begin
  { Cria o DataModule do Modulo }

  Application.CreateForm(Tdatm_modulo, datm_modulo );

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
  lnm_modulo   := False;

  with datm_modulo do
  begin
    tbl_yesno_.Open;
    qry_modulo_.SQL[2] := 'NM_MODULO';
    qry_modulo_.Prepare;
    qry_modulo_.Open;
  end;

  a_str_indices[0] := 'CD_MODULO';
  a_str_indices[1] := 'NM_MODULO';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  datm_modulo.ds_modulo.AutoEdit                   := st_modificar;
  datm_modulo.ds_modulo_rotina.AutoEdit            := st_modificar;

  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;
end;

procedure Tfrm_modulo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_modulo.qry_modulo_.Close;
  datm_modulo.tbl_yesno_.Close;
//datm_modulo.destroy;
  datm_modulo.Free;
  Action := caFree;
end;

procedure Tfrm_modulo.FormShow(Sender: TObject);
begin
  pnl_modulo_rotina.Color := clMenuBroker;
  pgctrl_modulo.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

function Tfrm_modulo.Grava : Boolean;
var
insert : boolean;
begin
  Grava := False;
  insert := False;
  if (pgctrl_modulo.ActivePage=ts_dados_basicos) then
  begin
    Pesquisa := datm_modulo.qry_modulo_CD_MODULO.AsString;
    try
      datm_main.db_broker.StartTransaction;
      if datm_modulo.qry_modulo_.State = dsInsert then insert := true;
      if ( datm_modulo.qry_modulo_.State in [dsInsert, dsEdit] ) then datm_modulo.qry_modulo_.Post;
      if insert then
      begin
        CloseStoredProc(datm_modulo.sp_atz_controle_acesso);
        ExecStoredProc(datm_modulo.sp_atz_controle_acesso);
        CloseStoredProc(datm_modulo.sp_atz_controle_acesso);
      end;
      datm_main.db_broker.Commit;
      datm_modulo.qry_modulo_.Close;
      datm_modulo.qry_modulo_.Open;
      Localiza(datm_modulo.qry_modulo_, Pesquisa, a_str_indices[0] );
      Grava:=True;
    except
      on E: Exception do
      begin
        datm_modulo.qry_modulo_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava:=False;
      end;
    end;
  end
  else if (pgctrl_modulo_rotina.ActivePage=ts_dados_basicos_modulo_rotina) then
  begin
    Pesquisa := datm_modulo.qry_modulo_rotina_CD_ROTINA.AsString;
    try
      datm_main.db_broker.StartTransaction;
      if datm_modulo.qry_modulo_rotina_.State = dsInsert then insert := true;
      if ( datm_modulo.qry_modulo_rotina_.State in [dsInsert, dsEdit] ) then
      begin
        datm_modulo.qry_modulo_rotina_.Post;
      end;
      if insert then
      begin
        CloseStoredProc(datm_modulo.sp_atz_controle_acesso);
        ExecStoredProc(datm_modulo.sp_atz_controle_acesso);
        CloseStoredProc(datm_modulo.sp_atz_controle_acesso);
      end;
      datm_main.db_broker.Commit;
      datm_modulo.qry_modulo_rotina_.Close;
      datm_modulo.qry_modulo_rotina_.Open;
      Localiza(datm_modulo.qry_modulo_rotina_, Pesquisa, 'CD_ROTINA' );
      Grava:=True;
    except
      on E: Exception do
      begin
        datm_modulo.qry_modulo_rotina_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_modulo.Consiste : Boolean;
begin
  if (pgctrl_modulo.ActivePage=ts_dados_basicos) then
  begin
    if dbedt_cd_modulo.Text = '' then
    begin
      BoxMensagem('Campo ''Código'' deve ser preenchido!', 2);
      pgctrl_modulo.ActivePage := ts_dados_basicos;
      dbedt_cd_modulo.SetFocus;
      lcd_modulo := True;
      Consiste := False;
      Exit;
    end;

    if dbedt_nm_modulo.Text = '' then
    begin
      BoxMensagem('Campo ''Descrição'' deve ser preenchido!', 2);
      pgctrl_modulo.ActivePage := ts_dados_basicos;
      dbedt_nm_modulo.SetFocus;
      lnm_modulo := True;
      Consiste := False;
      Exit;
    end;

    if dbedt_ap_modulo.Text = '' then
    begin
      BoxMensagem('Campo ''Apelido'' deve ser preenchido!', 2);
      pgctrl_modulo.ActivePage := ts_dados_basicos;
      dbedt_ap_modulo.SetFocus;
      lap_modulo := True;
      Consiste := False;
      Exit;
    end;
  end
  else if (pgctrl_modulo_rotina.ActivePage=ts_dados_basicos_modulo_rotina) then
  begin
    if dbedt_cd_rotina_modulo_rotina.Text = '' then
    begin
      BoxMensagem('Campo ''Codigo'' deve ser preenchido!', 2);
      pgctrl_modulo.ActivePage := ts_rotina;
      PgCtrl_modulo_rotina.ActivePage := ts_dados_basicos_modulo_rotina;
      dbedt_cd_rotina_modulo_rotina.SetFocus;
      lcd_rotina_modulo_rotina := True;
      Consiste := False;
      Exit;
    end;

    if dbedt_nm_rotina_modulo_rotina.Text = '' then
    begin
      BoxMensagem('Campo ''Descrição'' deve ser preenchido!', 2);
      pgctrl_modulo.ActivePage := ts_rotina;
      PgCtrl_modulo_rotina.ActivePage := ts_dados_basicos_modulo_rotina;
      dbedt_nm_rotina_modulo_rotina.SetFocus;
      lnm_rotina_modulo_rotina := True;
      Consiste := False;
      Exit;
    end;
  end;
  Consiste := True;
end;

procedure Tfrm_modulo.pgctrl_moduloChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  OnChanging := True;
  VerAlt;
end;

procedure Tfrm_modulo.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

function Tfrm_modulo.VerAlt : Boolean;
begin
  VerAlt := True;
  if (pgctrl_modulo.ActivePage=ts_dados_basicos) then
  begin
    if ( ( datm_modulo.qry_modulo_.State in [dsEdit] ) and st_modificar ) or
       ( datm_modulo.qry_modulo_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Módulos foi alterado.' + #13#10 +
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
  else
  if (pgctrl_modulo_rotina.ActivePage=ts_dados_basicos_modulo_rotina) then
  begin
    if ( ( datm_modulo.qry_modulo_rotina_.State in [dsEdit] ) and st_modificar ) or
       ( datm_modulo.qry_modulo_rotina_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Rotinas por Módulo foi alterado.' + #13#10 +
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

procedure Tfrm_modulo.Cancelar;
begin
  if (pgctrl_modulo.ActivePage=ts_dados_basicos) then
  begin
    try
      if datm_modulo.qry_modulo_.State in [dsInsert, dsEdit] then
      begin
        datm_modulo.qry_modulo_.Cancel;
        pgctrl_modulo.ActivePage := ts_dados_basicos;
        dbedt_nm_modulo.SetFocus;
      end;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
  end
  else if (pgctrl_modulo_rotina.ActivePage=ts_dados_basicos_modulo_rotina) then
  begin
    try
      if datm_modulo.qry_modulo_rotina_.State in [dsInsert, dsEdit] then
      begin
        datm_modulo.qry_modulo_rotina_.Cancel;
        pgctrl_modulo.ActivePage := ts_rotina;
        pgCtrl_modulo_rotina.ActivePage := ts_dados_basicos_modulo_rotina;
        dbedt_nm_rotina_modulo_rotina.SetFocus;
      end;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_modulo.pgctrl_moduloChange(Sender: TObject);
begin
  OnChanging := False;

  if lcd_rotina_modulo_rotina then
  begin
    lcd_rotina_modulo_rotina := False;
    pgctrl_modulo.ActivePage := ts_rotina;
    pgctrl_modulo_rotina.ActivePage := ts_dados_basicos;
    dbedt_cd_rotina_modulo_rotina.SetFocus;
    Exit;
  end;

  if lnm_rotina_modulo_rotina then
  begin
    lnm_rotina_modulo_rotina := False;
    pgctrl_modulo.ActivePage := ts_rotina;
    pgctrl_modulo_rotina.ActivePage := ts_dados_basicos;
    dbedt_nm_rotina_modulo_rotina.SetFocus;
    Exit;
  end;

  if lcd_modulo then
  begin
    lcd_modulo := False;
    pgctrl_modulo.ActivePage := ts_dados_basicos;
    dbedt_cd_modulo.SetFocus;
    Exit;
  end;

  if lnm_modulo then
  begin
    lnm_modulo := False;
    pgctrl_modulo.ActivePage := ts_dados_basicos;
    dbedt_nm_modulo.SetFocus;
    Exit;
  end;

  if lap_modulo then
  begin
    lap_modulo := False;
    pgctrl_modulo.ActivePage := ts_dados_basicos;
    dbedt_ap_modulo.SetFocus;
    Exit;
  end;

  if (pgctrl_modulo.ActivePage=ts_lista) or
     (pgctrl_modulo.ActivePage=ts_dados_basicos) then
     dbnvg.DataSource := datm_modulo.ds_modulo
  else
     dbnvg.DataSource := datm_modulo.ds_modulo_rotina;

  if (pgctrl_modulo.ActivePage = ts_lista ) or
     ((pgctrl_modulo.ActivePage = ts_rotina ) and
      (pgctrl_modulo_rotina.ActivePage = ts_lista_modulo_rotina ) ) then
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

procedure Tfrm_modulo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #27 then Close;
end;

end.
