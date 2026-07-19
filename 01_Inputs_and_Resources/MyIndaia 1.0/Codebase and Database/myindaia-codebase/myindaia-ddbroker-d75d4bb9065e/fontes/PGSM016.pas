unit PGSM016;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, DBCGrids, Funcoes, ConsOnLineEx, strUtils,Variants,
  OleCtrls, SHDocVw;

const
  //_CHARS_SENHA = '!@#$%&0123456789!@#$%&abcdefghijklmnopqrstuvwxyz!@#$%&ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%&';
  _CHARS_SENHA = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';

type
  Tfrm_usuario = class(TForm)
    pgctrl_usuario: TPageControl;
    ts_lista: TTabSheet;
    dbg_usuario: TDBGrid;
    ts_dados_basicos: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;                                                                  
    dbedt_cd_usuario: TDBEdit;
    dbedt_nm_usuario: TDBEdit;
    dbedt_ap_usuario: TDBEdit;
    ts_habilitacao: TTabSheet;
    lbl_cargo: TLabel;
    btn_co_cargo: TSpeedButton;
    lbl_ativo: TLabel;
    dbedt_cd_cargo: TDBEdit;
    dbedt_nm_cargo: TDBEdit;
    dblkpcbox_ativo: TDBLookupComboBox;
    pgctrl_habilitacao: TPageControl;
    ts_lista_habilitacao: TTabSheet;
    Label7: TLabel;
    dbg_habilitacao: TDBGrid;
    dbedt_cd_usuario2: TDBEdit;
    dbedt_nm_usuario2: TDBEdit;
    ts_dados_basicos_habilitacao: TTabSheet;
    Label8: TLabel;
    btn_co_produto: TSpeedButton;
    btn_co_unidade: TSpeedButton;
    Label17: TLabel;
    Label18: TLabel;
    Label9: TLabel;
    Label16: TLabel;
    dbedt_nm_usuario_habilitacao: TDBEdit;
    dbedt_cd_usuario_habilitacao: TDBEdit;
    dbedt_cd_produto_habilitacao: TDBEdit;
    dbedt_nm_produto_habilitacao: TDBEdit;
    dbedt_cd_unidade_habilitacao: TDBEdit;
    dbedt_nm_unidade_habilitacao: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pnl_modulo_rotina: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    dblkpcbox_ativo_hab: TDBLookupComboBox;
    Label6: TLabel;
    Label10: TLabel;
    dblkpcbox_default_habilitacao: TDBLookupComboBox;
    pnl_habilitacao: TPanel;
    lbl_nm_email: TLabel;
    Label11: TLabel;
    dblckpbox_aviso_po: TDBLookupComboBox;
    Label12: TLabel;
    btn_co_celula: TSpeedButton;
    dbedt_cd_celula: TDBEdit;
    dbedt_nm_celula: TDBEdit;
    ts_permissoes_mi_habilitacao: TTabSheet;
    Label13: TLabel;
    dbedt_cd_usuario_permissao: TDBEdit;
    dbedt_nm_usuario_permissao: TDBEdit;
    Label14: TLabel;
    dbedt_nm_cliente: TDBEdit;
    dbedt_cd_cliente: TDBEdit;
    btn_co_cliente: TSpeedButton;
    dbg_cliente: TDBGrid;
    lbl_cliente_ativo: TLabel;
    dblkpcbox_clienteativo: TDBLookupComboBox;
    Label15: TLabel;
    dblkpcbox_acesso_site: TDBLookupComboBox;
    ts_permissoes_mi_habilitacao_area: TTabSheet;
    Label19: TLabel;
    Label20: TLabel;
    btn_co_area: TSpeedButton;
    Label21: TLabel;
    dbedt_cd_usuario_area: TDBEdit;
    dbedt_nm_usuario_area: TDBEdit;
    dbedt_nm_area: TDBEdit;
    dbedt_cd_area: TDBEdit;
    dblkpcbox_areaativa: TDBLookupComboBox;
    dbg_area: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    lblTransportadora: TLabel;
    dbedtCodigoTransportadora: TDBEdit;
    edtNomeTransportadora: TEdit;
    btnConsultaTransportadora: TSpeedButton;
    dbchkSelecionado: TDBCheckBox;
    dbchkIN_ALT_STATUS_RECEB: TDBCheckBox;
    ts_permissoes_mi_habilitacao_Empresa: TTabSheet;
    Label23: TLabel;
    Label24: TLabel;
    btnConsultaEmpresaEst: TSpeedButton;
    Label25: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    dbedt_nm_empresa: TDBEdit;
    dbedt_cd_empresa: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    dblck_tp_lingua: TDBLookupComboBox;
    Label47: TLabel;
    btn_co_chefia: TSpeedButton;
    dbedt_nm_chefia: TEdit;
    dbedt_cd_chefia: TDBEdit;
    Label22: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    CheckBox1: TCheckBox;
    ts_permissoes_mi_grupo: TTabSheet;
    Label26: TLabel;
    Label27: TLabel;
    btn_grupo: TSpeedButton;
    Label28: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    dbedt_nm_grupo: TDBEdit;
    dbedt_cd_grupo: TDBEdit;
    dbg_grupo: TDBGrid;
    dblkpcbox_grupoativo: TDBLookupComboBox;
    ts_permissoes_mi_myindaiaweb: TTabSheet;
    WebBrowser1: TWebBrowser;
    Panel2: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    dbedt_nm_email: TDBMemo;
    dblck_grupo_detalhes: TDBLookupComboBox;
    dblck_grupo_rap: TDBLookupComboBox;
    Label32: TLabel;
    Label33: TLabel;
    dbchk_inmanager: TDBCheckBox;
    SpeedButton1: TSpeedButton;
    Label34: TLabel;
    dbedt_cd_superior_direto: TDBEdit;
    Label35: TLabel;
    dbedt_nm_superior_direto: TEdit;
    btn_co_superior_direto: TSpeedButton;
    gpbAcesso: TGroupBox;
    Label36: TLabel;
    edtNovaSenha: TEdit;
    Label37: TLabel;
    edtConfirmaSenha: TEdit;
    btnAlterarSenha: TBitBtn;
    btnRecriarAcessos: TBitBtn;
    btnBloquearUsuario: TBitBtn;
    btnDesbloquearUsuario: TBitBtn;
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_usuarioDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure pgctrl_usuarioChange(Sender: TObject);
    procedure dbedt_nm_usuarioChange(Sender: TObject);
    procedure pgctrl_usuarioChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure btn_co_cargoClick(Sender: TObject);
    procedure dbedt_cd_cargoExit(Sender: TObject);
    procedure dbedt_cd_unidade_habilitacaoChange(Sender: TObject);
    procedure btn_co_unidadeClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure dbedt_cd_unidade_habilitacaoExit(Sender: TObject);
    procedure dbedt_cd_produto_habilitacaoExit(Sender: TObject);
    procedure pgctrl_habilitacaoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dblkpcbox_ativo_habClick(Sender: TObject);
    procedure dblkpcbox_default_habilitacaoClick(Sender: TObject);
    procedure dblkpcbox_ativo_habExit(Sender: TObject);
    procedure dblkpcbox_default_habilitacaoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_unidade_habilitacaoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure dbg_usuarioKeyPress(Sender: TObject; var Key: Char);
    procedure btn_co_celulaClick(Sender: TObject);
    procedure dbedt_cd_celulaExit(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure dbedt_cd_clienteExit(Sender: TObject);
    procedure dbedt_cd_grupoChan(Sender: TObject);
    procedure btn_co_areaClick(Sender: TObject);
    procedure dbedt_cd_areaChange(Sender: TObject);
    procedure dbedt_cd_areaExit(Sender: TObject);
    procedure btnConsultaTransportadoraClick(Sender: TObject);
    procedure btnConsultaEmpresaEstClick(Sender: TObject);
    procedure dbedt_cd_empresaExit(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure btn_co_chefiaClick(Sender: TObject);
    procedure dbedt_cd_chefiaExit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure btn_grupoClick(Sender: TObject);
    procedure dbedt_cd_grupoChange(Sender: TObject);
    procedure dbedt_cd_grupoExit(Sender: TObject);
    procedure dbedt_cd_clienteChange(Sender: TObject);
    procedure btn_co_superior_diretoClick(Sender: TObject);
    procedure dbedt_cd_superior_diretoExit(Sender: TObject);
    procedure btnRecriarAcessosClick(Sender: TObject);
    procedure btnAlterarSenhaClick(Sender: TObject);
    procedure edtNovaSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure btnBloquearUsuarioClick(Sender: TObject);
    procedure btnDesbloquearUsuarioClick(Sender: TObject);
  private
    lNaoConsiste : Boolean;
    a_str_indices : Array[0..3] Of String[60];
    Pesquisa : String;
    lcd_modulo, lcd_rotina : string;
    st_modificar, st_incluir, st_excluir : Boolean;

    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    procedure CodExits;
    function ValidaCaracteresSenha(const s: AnsiString; tipoValida : string): Boolean;
  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
    cd_usuario : String[4];
    cd_cargo : String[3];
  end;

var
  frm_usuario: Tfrm_usuario;

implementation

uses PGGP001, GSMLIB, PGSM058, PGGP017, PGSM015, PGSM018, PGSM010, PGSM044, PGSM096, PGSM024;

{$R *.DFM}

function GeraSenha: String;
var
  I: Integer;
begin
  Randomize;
  Result := '';
  for I := 1 to 8 do
    Result := Result + _CHARS_SENHA[Random(Length(_CHARS_SENHA)-1)+1]
end;

procedure Tfrm_usuario.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_usuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_usuario do
    begin
      qry_usuario_habilitacao_.Close;
      qry_usuario_.Close;
      qry_usuario_lista_.Close;
      qry_usuario_permissao_.Close;
      qry_permissao_area_.Close;
      SqlPermissao_EmpresaEst.Close;
      tbl_yesno_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_usuario.dbg_usuarioDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_usuario.qry_usuario_CD_USUARIO.AsString;
    except
      try
         Cons_Online_Texto := datm_usuario.qry_usuario_CD_USUARIO.AsString;
      except
         BoxMensagem('Não foi possível retornar o Código do Usuário!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_usuario.FormCreate(Sender: TObject);
begin
  // Cria o DataModule do Usuario
  Application.CreateForm(Tdatm_usuario, datm_usuario );

  lcd_modulo := vStr_cd_modulo;
  lcd_rotina := str_cd_rotina;
  cd_usuario := str_cd_usuario;
  cd_cargo   := str_cd_cargo;
end;

procedure Tfrm_usuario.btn_excluirClick(Sender: TObject);
var ap_usuario : String[15];
  Pesquisa : String;
begin
  Pesquisa := datm_usuario.qry_usuario_CD_USUARIO.AsString;
  if (pgctrl_usuario.ActivePage=ts_lista) or (pgctrl_usuario.ActivePage=ts_dados_basicos) then
  begin
    if BoxMensagem( 'Este usuário será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) Then
    begin
      if datm_usuario.qry_usuario_habilitacao_.RecordCount > 0 then
      begin
        BoxMensagem('Não posso excluir usuário pois existem habilitações cadastradas para o mesmo!' + #13#10 +
                    'Exclua primeiro as habilitações!', 2);
        Exit;
      end;

      with datm_main, datm_usuario do
      begin
        try
          ap_usuario := qry_usuario_AP_USUARIO.AsString;
          qry_usuario_.Delete;

          db_broker.Connected := False;
          db_broker.Params[0] := 'USER NAME=SA';
          db_broker.Params[1] := 'PASSWORD=123';
          db_broker.Connected := True;

          CloseStoredProc(sp_exclui_login);
          sp_exclui_login.ParamByName('@USUARIO').AsString := ap_usuario;
          ExecStoredProc(sp_exclui_login);
          CloseStoredProc(sp_exclui_login);

          db_broker.Connected := False;
          db_broker.Params[0] := 'USER NAME=' + str_ap_usuario;
          db_broker.Params[1] := 'PASSWORD=' + str_senha_usuario;
          db_broker.Connected := True;

        except
          on E: Exception do
          begin
            TrataErro(E);
          end;
        end;

        qry_lista_.Close;
        qry_lista_.Prepare;
        qry_lista_.Open;
      end;
    end;
    pgctrl_usuario.ActivePage := ts_lista;
  end
  else if pgctrl_usuario.ActivePage = ts_habilitacao then
  begin
    if pgctrl_habilitacao.ActivePage = ts_permissoes_mi_habilitacao then
    begin
      if BoxMensagem( 'Este cliente será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) Then
      try
        datm_main.db_broker.StartTransaction;
        datm_usuario.qry_usuario_permissao_.Delete;
        datm_usuario.qry_usuario_permissao_.Close;
        datm_usuario.qry_usuario_permissao_.Open;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          datm_usuario.qry_usuario_permissao_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      PgCtrl_habilitacao.ActivePage := ts_permissoes_mi_habilitacao;
    end
    else
    if pgctrl_habilitacao.ActivePage = ts_permissoes_mi_grupo then
    begin
      if BoxMensagem( 'Este grupo será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) Then
      try
        datm_main.db_broker.StartTransaction;
        datm_usuario.qry_permissao_grupo_.Delete;
        datm_usuario.qry_permissao_grupo_.Close;
        datm_usuario.qry_permissao_grupo_.Open;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          datm_usuario.qry_permissao_grupo_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      PgCtrl_habilitacao.ActivePage := ts_permissoes_mi_grupo;
    end
    else
    begin
      if pgctrl_habilitacao.ActivePage=ts_permissoes_mi_habilitacao_area then
      begin
        if BoxMensagem( 'Esta área será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) Then
        try
          datm_main.db_broker.StartTransaction;
          datm_usuario.qry_permissao_area_.Delete;
          datm_usuario.qry_permissao_area_.Close;
          datm_usuario.qry_permissao_area_.Open;
          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            datm_usuario.qry_permissao_area_.Cancel;
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
        PgCtrl_habilitacao.ActivePage := ts_permissoes_mi_habilitacao_area;
      end
      else if pgctrl_habilitacao.ActivePage = ts_permissoes_mi_habilitacao_Empresa then
      begin
        if BoxMensagem( 'Esta Empresa será excluída das permissões de acesso!' + #13#10 + 'Confirma exclusão?', 1 ) Then
        try
          datm_main.db_broker.StartTransaction;
          datm_usuario.SqlPermissao_EmpresaEst.Delete;
          datm_usuario.SqlPermissao_EmpresaEst.Close;
          datm_usuario.SqlPermissao_EmpresaEst.Open;
          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            datm_usuario.SqlPermissao_EmpresaEst.Cancel;
            if datm_main.db_broker.InTransaction then
              datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
        PgCtrl_habilitacao.ActivePage := ts_permissoes_mi_habilitacao_Empresa;
      end
      else
      begin
        if BoxMensagem( 'Esta Habilitação será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) Then
        try
          datm_main.db_broker.StartTransaction;
          datm_usuario.qry_usuario_habilitacao_.Delete;
          datm_usuario.qry_usuario_habilitacao_.Close;
          datm_usuario.qry_usuario_habilitacao_.Open;
          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            datm_usuario.qry_usuario_habilitacao_.Cancel;
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
        PgCtrl_habilitacao.ActivePage := ts_lista_habilitacao;
      end;
    end;
  end;

  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add(' DELETE FROM MYINDAIA.DBO.TUSUARIO_HABILITACAO WHERE CD_USUARIO = ''' + Pesquisa   + ''' ');
    ExecSQL;
    SQL.Clear;
    SQL.Add(' DELETE FROM MYINDAIA.DBO.TUSUARIO WHERE CD_USUARIO = ''' + Pesquisa + ''' ');
    ExecSQL;
    SQL.Clear;
    SQL.Add(' DELETE FROM MYINDAIA.DBO.TPERMISSAO WHERE CD_USUARIO = ''' + Pesquisa + ''' ');
    ExecSQL;
    SQL.Clear;
    SQL.Add(' DELETE FROM MYINDAIA.DBO.TPERMISSAO_AREA WHERE CD_USUARIO = ''' + Pesquisa + ''' ');
    ExecSQL;
    SQL.Clear;
    SQL.Add(' DELETE FROM MYINDAIA.DBO.TPERMISSAO_GRUPO WHERE CD_USUARIO = ''' + Pesquisa + ''' ');
    ExecSQL;
    Free;
  end;
end;

procedure Tfrm_usuario.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
  dbedt_cd_produto_habilitacao.ReadOnly:=True;
  dbedt_cd_unidade_habilitacao.ReadOnly:=True;
end;

procedure Tfrm_usuario.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_usuario.cb_ordemClick(Sender: TObject);
begin
  with datm_usuario do
  begin
    Pesquisa := qry_usuario_lista_CD_USUARIO.AsString;
    // Apaga o campo de pesquisa
    edt_chave.Text := '';
    qry_lista_.Close;
    qry_lista_.SQL[6] := a_str_indices[cb_ordem.ItemIndex];
    qry_lista_.Prepare;
    qry_lista_.Open;
    Localiza(datm_usuario.qry_lista_, Pesquisa, a_str_indices[0] );
    pgctrl_usuario.ActivePage := ts_lista;
    edt_chave.SetFocus;
  end;
end;

procedure Tfrm_usuario.edt_chaveChange(Sender: TObject);
begin
   Localiza(datm_usuario.qry_lista_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_usuario.FormShow(Sender: TObject);
begin
  gpbAcesso.Visible := (str_cd_cargo = '001') or (str_cd_cargo = '104');

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  with datm_usuario do
  begin
    tbl_yesno_.Open;
    qry_lista_.Close;
    qry_lista_.SQL[4] := ' U.IN_ATIVO IN (''1'')';
   // qry_lista_.SQL[11] := 'NM_USUARIO';
    qry_lista_.Prepare;
    qry_lista_.Open;
  end;

  a_str_indices[0] := 'AP_USUARIO';
  a_str_indices[1] := 'NM_USUARIO';
  a_str_indices[2] := 'CD_USUARIO';
  a_str_indices[3] := 'NM_CARGO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Apelido');
    Items.Add('Nome Completo');
    Items.Add('Código');
    Items.Add('Cargo');
    ItemIndex := 1;
  end;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  datm_usuario.ds_usuario.AutoEdit                    := st_modificar;
  datm_usuario.ds_usuario_habilitacao.AutoEdit        := st_modificar;

  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;

  lNaoConsiste              := False;
  pgctrl_usuario.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;
//------------------------------------------
procedure Tfrm_usuario.btn_incluirClick(Sender: TObject);
begin
  if (pgctrl_usuario.ActivePage=ts_lista) or (pgctrl_usuario.ActivePage=ts_dados_basicos) then
  begin
    btn_incluir.Enabled := False;
    mi_incluir.Enabled  := False;
    btn_excluir.Enabled := False;
    mi_excluir.Enabled  := False;
    with datm_usuario do
    begin
      qry_usuario_.DisableControls;
      qry_usuario_.Cancel;
      qry_usuario_.Append;
      qry_usuario_.EnableControls;
      qry_ult_usuario_.Open;
      qry_usuario_CD_USUARIO.AsString           := UltCod( qry_ult_usuario_, qry_ult_usuario_ULTIMO );
      qry_usuario_NM_SENHA_INICIAL.AsString     := GeraSenha;
      qry_usuario_IN_ATIVO.AsString             := '0';
      qry_usuario_IN_AVISO_PO.AsString          := '1';
      qry_usuario_IN_ALT_STATUS_RECEB.AsString  := '0';
      qry_usuario_IN_MODO_PREVIEW.AsString      := '0';
      qry_usuario_IN_FECHAR_MOV_FINANC.AsString := '0';
      qry_usuario_IN_ZERA_LIQUIDACAO.AsString   := '0';
    end;
    pgctrl_usuario.ActivePage := ts_dados_basicos;
    dbedt_nm_usuario.SetFocus;
  end
  else if pgctrl_usuario.ActivePage = ts_habilitacao then
  begin
    btn_incluir.Enabled := False;
    mi_incluir.Enabled  := False;
    btn_excluir.Enabled := False;
    mi_excluir.Enabled  := False;

    if pgctrl_habilitacao.ActivePage = ts_permissoes_mi_habilitacao then
    begin
      dbedt_cd_cliente.ReadOnly:=False;
      with datm_usuario do
      begin
        qry_usuario_permissao_.DisableControls;
        qry_usuario_permissao_.Cancel;
        qry_usuario_permissao_.Append;
        qry_usuario_permissao_.EnableControls;
        qry_usuario_permissao_CD_USUARIO.AsString:=qry_usuario_CD_USUARIO.AsString;
        qry_usuario_permissao_.FieldByName('IN_ATIVO').AsString  := '1';
      end;
      pgctrl_usuario.ActivePage := ts_habilitacao;
      pgctrl_habilitacao.ActivePage := ts_permissoes_mi_habilitacao;
      dbedt_cd_cliente.SetFocus;
    end
    else
    if pgctrl_habilitacao.ActivePage = ts_permissoes_mi_grupo then
    begin
      dbedt_cd_grupo.ReadOnly:=False;
      with datm_usuario do
      begin
        qry_permissao_grupo_.DisableControls;
        qry_permissao_grupo_.Cancel;
        qry_permissao_grupo_.Append;
        qry_permissao_grupo_.EnableControls;
        qry_permissao_grupo_CD_USUARIO.AsString:=qry_usuario_CD_USUARIO.AsString;
        qry_permissao_grupo_.FieldByName('IN_ATIVO').AsString  := '1';
      end;
      pgctrl_usuario.ActivePage := ts_habilitacao;
      pgctrl_habilitacao.ActivePage := ts_permissoes_mi_grupo;
      dbedt_cd_grupo.SetFocus;
      Btn_Mi(False, True, True, False );
    end
    else
    begin
      if pgctrl_habilitacao.ActivePage=ts_permissoes_mi_habilitacao_area then
      begin
        dbedt_cd_area.ReadOnly:=False;
        with datm_usuario do
        begin
          qry_permissao_area_.DisableControls;
          qry_permissao_area_.Cancel;
          qry_permissao_area_.Append;
          qry_permissao_area_.EnableControls;
          qry_permissao_area_CD_USUARIO.AsString:=qry_usuario_CD_USUARIO.AsString;
          qry_permissao_area_.FieldByName('IN_ATIVO').AsString  := '1';
        end;
        pgctrl_usuario.ActivePage := ts_habilitacao;
        pgctrl_habilitacao.ActivePage := ts_permissoes_mi_habilitacao_area;
        dbedt_cd_area.SetFocus;
      end
      else if pgctrl_habilitacao.ActivePage=ts_permissoes_mi_habilitacao_Empresa then
      begin
        dbedt_cd_empresa.ReadOnly:=False;
        with datm_usuario do
        begin
          SqlPermissao_EmpresaEst.DisableControls;
          SqlPermissao_EmpresaEst.Cancel;
          SqlPermissao_EmpresaEst.Append;
          SqlPermissao_EmpresaEst.EnableControls;
          SqlPermissao_EmpresaEstCD_USUARIO.AsString := qry_usuario_CD_USUARIO.AsString;
          SqlPermissao_EmpresaEst.FieldByName('IN_ATIVO').AsString  := '1';
        end;
        pgctrl_usuario.ActivePage := ts_habilitacao;
        pgctrl_habilitacao.ActivePage := ts_permissoes_mi_habilitacao_Empresa;
        dbedt_cd_empresa.SetFocus;
        Btn_Mi(False, True, True, False );
      end
      else
      begin
        dbedt_cd_produto_habilitacao.ReadOnly:=False;
        dbedt_cd_unidade_habilitacao.ReadOnly:=False;
        with datm_usuario do
        begin
          qry_usuario_habilitacao_.DisableControls;
          qry_usuario_habilitacao_.Cancel;
          qry_usuario_habilitacao_.Append;
          qry_usuario_habilitacao_.EnableControls;
          qry_usuario_habilitacao_CD_USUARIO.AsString:=qry_usuario_CD_USUARIO.AsString;
          qry_usuario_habilitacao_.FieldByName('IN_ATIVO').AsString  := '1';
          qry_usuario_habilitacao_.FieldByName('IN_DEFAULT').AsString  := '0';
          qry_usuario_habilitacao_.FieldByName('DT_HABILITACAO').AsDateTime := now;
        end;
        pgctrl_usuario.ActivePage := ts_habilitacao;
        pgctrl_habilitacao.ActivePage := ts_dados_basicos_habilitacao;
        dbedt_cd_unidade_habilitacao.SetFocus;
      end;
    end;
  end;
  dbnvg.Enabled := False;
  edt_chave.Enabled := False;
  cb_ordem.Enabled := False;
end;

function Tfrm_usuario.VerAlt : Boolean;
begin
  VerAlt := True;
  if (pgctrl_usuario.ActivePage=ts_dados_basicos) then
  begin
    if ( ( datm_usuario.qry_usuario_.State in [dsEdit] ) and st_modificar ) or
       ( datm_usuario.qry_usuario_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Usuários foi alterado.' + #13#10 +
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
  else if (pgctrl_usuario.ActivePage=ts_habilitacao) and
          (pgctrl_habilitacao.ActivePage=ts_dados_basicos_habilitacao) then
        begin
          if ( ( datm_usuario.qry_usuario_habilitacao_.State in [dsEdit] ) and st_modificar ) or
             ( datm_usuario.qry_usuario_habilitacao_.State in [dsInsert] ) then
          begin
            if BoxMensagem('Cadastro de Habilitação de Usuários foi alterado.' + #13#10 +
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
   if (pgctrl_usuario.ActivePage=ts_habilitacao) and
      (pgctrl_habilitacao.ActivePage=ts_permissoes_mi_habilitacao) then
   begin
     if ( ( datm_usuario.qry_usuario_permissao_.State in [dsEdit] ) and st_modificar ) or
          ( datm_usuario.qry_usuario_permissao_.State in [dsInsert] ) then
     begin
       if BoxMensagem('Cadastro de Habilitação de Cliente foi alterado.' + #13#10 +
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
   if (pgctrl_usuario.ActivePage=ts_habilitacao) and
      (pgctrl_habilitacao.ActivePage=ts_permissoes_mi_habilitacao_area) then
   begin
     if ( ( datm_usuario.qry_permissao_area_.State in [dsEdit] ) and st_modificar ) or
          ( datm_usuario.qry_permissao_area_.State in [dsInsert] ) then
     begin
       if BoxMensagem('Cadastro de Habilitação de Área foi alterado.' + #13#10 +
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
   if (pgctrl_usuario.ActivePage=ts_habilitacao) and
      (pgctrl_habilitacao.ActivePage=ts_permissoes_mi_habilitacao_Empresa) then
   begin
     if ( ( datm_usuario.SqlPermissao_EmpresaEst.State in [dsEdit] ) and st_modificar ) or
          ( datm_usuario.SqlPermissao_EmpresaEst.State in [dsInsert] ) then
     begin
       if BoxMensagem('Cadastro de Habilitação de Empresa foi alterado.' + #13#10 +
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

function Tfrm_usuario.Grava;
var
  cd_usuario : String[4];
  ap_usuario : String[15];
  nm_usuario : String;
  nm_senha   : String;
  nm_email   : String;
  cd_idioma  : String;
  lInclui    : Boolean;
  Body       : TStrings;
  Pesquisa   : String;
begin
  with datm_usuario, datm_main do
  begin
    Pesquisa := qry_usuario_CD_USUARIO.AsString;
    Grava   := False;
    lInclui := ( qry_usuario_.State = dsInsert );
    if ( pgctrl_usuario.ActivePage = ts_lista ) or ( pgctrl_usuario.ActivePage = ts_dados_basicos ) then
    begin
      try
        db_broker.StartTransaction;
        if ( qry_usuario_.State in [dsInsert, dsEdit] ) then
        begin
          //Grava Usuario no Banco
          cd_usuario := qry_usuario_CD_USUARIO.AsString;
          ap_usuario := qry_usuario_AP_USUARIO.AsString;
          nm_usuario := qry_usuario_NM_USUARIO.AsString;
          nm_senha   := qry_usuario_NM_SENHA_INICIAL.AsString;
          cd_idioma  := qry_usuario_CD_IDIOMA.AsString;
          nm_email   := qry_usuario_NM_EMAIL.AsString;

          if (qry_usuario_.State = dsEdit) and (qry_usuario_IN_ATIVO.AsString = '0') and
             (qry_usuario_IN_ATIVO.OldValue <> qry_usuario_IN_ATIVO.NewValue) then
          begin
            if MessageDlg('Você está deixando o usuário " '+qry_usuario_CD_USUARIO.AsString+' - '+qry_usuario_AP_USUARIO.AsString+' " inativo. Automaticamente o '+#13+#10+
                          'sistema irá excluir esse usuário da listagem geral de alertas '+#13+#10+
                          'automáticos. Deseja realmente deixa-lo inativo ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
            begin
              with TQuery.Create(application) do
              begin
                DatabaseName := 'DBBROKER';
                SQL.Clear;
                SQL.Add('DELETE FROM TFILA_AGENDA');
                SQL.Add('WHERE NM_PATH_EDI LIKE ''%CD_USUARIO="' + qry_usuario_CD_USUARIO.AsString + '"%''');
                ExecSQL;
                SQL.Clear;
                SQL.Add('DELETE FROM TRELATORIOS_MAIL_AUT_USUARIOS');
                SQL.Add('WHERE CD_USUARIO = ''' + qry_usuario_CD_USUARIO.AsString + '''');
                ExecSQL;
                Free;
              end;
            end else begin
              if db_broker.InTransaction then
                db_broker.Rollback;
              Exit;
            end;
          end;

          qry_usuario_.Post;
        end;
        db_broker.Commit;




        // Criar conexão para SA
        if lInclui then
        begin
          try
            db_broker.Connected := False;
            db_broker.Params[0] := 'USER NAME=SA';
            db_broker.Params[1] := 'PASSWORD=123';
            db_broker.Connected := True;

            CloseStoredProc(sp_inclui_login);
            sp_inclui_login.ParamByName('@USUARIO').AsString := ap_usuario;
            sp_inclui_login.ParamByName('@SENHA').AsString   := nm_senha;
            ExecStoredProc(sp_inclui_login);
            CloseStoredProc(sp_inclui_login);

            db_broker.Connected := False;
            db_broker.Params[0] := 'USER NAME=' + str_ap_usuario;
            db_broker.Params[1] := 'PASSWORD=' + str_senha_usuario;
            db_broker.Connected := True;
          except
            on E: Exception do
            begin
              TrataErro(E);
            end;
          end;
        end
        // IF para verificar se está ativo, se o IN_ATIVO foi alterado e se o login foi criado hoje - Michel - 15/07/2010
        //RETIRADA VERIFICAÇÃO SE LOGIN FOI CRIADO HOJE - GUILHERME - 03/08/2011
        else if (datm_usuario.qry_usuario_IN_ATIVO.AsString = '1') and
           (datm_usuario.qry_usuario_IN_ATIVO.OldValue <> datm_usuario.qry_usuario_IN_ATIVO.AsString) then
        begin
          Body := TStringList.Create;
          Body.LoadFromFile('H:\DDBroker\email novo usuário\E-mail_' + cd_idioma + '.htm');
          Body.Text := StringReplace(Body.Text, '$NOME$', nm_usuario, []);
          Body.Text := StringReplace(Body.Text, '$LOGIN$', ap_usuario, []);
          Body.Text := StringReplace(Body.Text, '$SENHA$', nm_senha, []);
          EnviaEmailHtml('[MyIndaiáWeb] Seja bem vindo(a) ao MyIndaiáWeb', Body.Text, nm_email +';ti@myindaia.com.br');
          //EnviaEmailHtml('[MyIndaiáWeb] Seja bem vindo(a) ao MyIndaiáWeb', Body.Text, 'guilherme.devezas@myindaia.com.br');
        end;
        qry_lista_.Close;
        qry_lista_.Prepare;
        qry_lista_.Open;
        qry_lista_.Locate('CD_USUARIO', cd_usuario, []);
        //Localiza( qry_lista_, cd_usuario, 'CD_USUARIO' );

        Grava := True;
      except
        on E: Exception do
        begin
          qry_usuario_.Cancel;
          if db_broker.InTransaction then db_broker.Rollback;
          TrataErro(E);
          Grava := False;
        end;
      end;
    end
    else if pgctrl_usuario.ActivePage = ts_habilitacao then
    begin
     if pgctrl_habilitacao.ActivePage = ts_permissoes_mi_habilitacao then
     begin
       try
         db_broker.StartTransaction;
         if ( qry_usuario_permissao_.State in [dsInsert, dsEdit] ) then
         begin
           // Grava Usuario no Banco
           qry_usuario_permissao_.Post;
           qry_usuario_permissao_.Close;
           qry_usuario_permissao_.Prepare;
           qry_usuario_permissao_.Open;

           Grava := True;
         end;
         db_broker.Commit;
       except
         on E: Exception do
         begin
           qry_usuario_permissao_.Cancel;
           if db_broker.InTransaction then db_broker.Rollback;
           TrataErro(E);
           Grava := False;
         end;
       end;
     end
     else
     if pgctrl_habilitacao.ActivePage = ts_permissoes_mi_grupo then
     begin
       try
         db_broker.StartTransaction;
         if ( qry_permissao_grupo_.State in [dsInsert, dsEdit] ) then
         begin
           // Grava Usuario no Banco
           qry_permissao_grupo_.Post;
           qry_permissao_grupo_.Close;
           qry_permissao_grupo_.Prepare;
           qry_permissao_grupo_.Open;

           Grava := True;
         end;
         db_broker.Commit;
       except
         on E: Exception do
         begin
           qry_permissao_grupo_.Cancel;
           if db_broker.InTransaction then db_broker.Rollback;
           TrataErro(E);
           Grava := False;
         end;
       end;
     end
     else
     begin
       if pgctrl_habilitacao.ActivePage = ts_permissoes_mi_habilitacao_area then
       begin
         try
           db_broker.StartTransaction;
           if ( qry_permissao_area_.State in [dsInsert, dsEdit] ) then
           begin
             // Grava Usuario no Banco
             qry_permissao_area_.Post;
             qry_permissao_area_.Close;
             qry_permissao_area_.Prepare;
             qry_permissao_area_.Open;

             Grava := True;
           end;
           db_broker.Commit;
         except
           on E: Exception do
           begin
             qry_permissao_area_.Cancel;
             if db_broker.InTransaction then db_broker.Rollback;
             TrataErro(E);
             Grava := False;
           end;
         end;
       end
       else if pgctrl_habilitacao.ActivePage = ts_permissoes_mi_habilitacao_Empresa then
       begin
         try
           db_broker.StartTransaction;
           if ( SqlPermissao_EmpresaEst.State in [dsInsert, dsEdit] ) then
           begin
             // Grava Usuario no Banco
             SqlPermissao_EmpresaEst.Post;
             SqlPermissao_EmpresaEst.Close;
             SqlPermissao_EmpresaEst.Prepare;
             SqlPermissao_EmpresaEst.Open;

             Grava := True;
           end;
           db_broker.Commit;
           Btn_Mi(st_incluir, False, False, st_excluir );
         except
           on E: Exception do
           begin
             SqlPermissao_EmpresaEst.Cancel;
             if db_broker.InTransaction then
               db_broker.Rollback;
             TrataErro(E);
             Grava := False;
           end;
         end;
       end
       else
       begin
        try
          db_broker.StartTransaction;
          if ( qry_usuario_habilitacao_.State in [dsInsert, dsEdit] ) then
          begin
            // Grava Habilitacao
            qry_usuario_habilitacao_.Post;
            CloseStoredProc(sp_atz_habilitacao_padrao);
            sp_atz_habilitacao_padrao.ParamByName('@CD_USUARIO').AsString  := qry_usuario_habilitacao_CD_USUARIO.AsString;
            sp_atz_habilitacao_padrao.ParamByName('@CD_UNID_NEG').AsString := qry_usuario_habilitacao_CD_UNID_NEG.AsString;
            sp_atz_habilitacao_padrao.ParamByName('@CD_PRODUTO').AsString  := qry_usuario_habilitacao_CD_PRODUTO.AsString;
            sp_atz_habilitacao_padrao.ParamByName('@IN_DEFAULT').AsString  := qry_usuario_habilitacao_IN_DEFAULT.AsString;
            ExecStoredProc(sp_atz_habilitacao_padrao);
          end;

          if sp_atz_habilitacao_padrao.ParamByName('Result').AsInteger > 0 then
          begin
            db_broker.Rollback;
            BoxMensagem('Não existe nenhuma habilitação ativa para definir como Padrão!', 2);
            Grava := False;
          end
          else
          begin
            db_broker.Commit;
            qry_usuario_habilitacao_.Close;
            qry_usuario_habilitacao_.Open;
            Grava := True;
          end;
          CloseStoredProc(sp_atz_habilitacao_padrao);
        except
          on E: Exception do
          begin
            qry_usuario_habilitacao_.Cancel;
            if db_broker.InTransaction then db_broker.Rollback;
            TrataErro(E);
            Grava := False;
          end;
        end;
      end;
     end;
    end;
  end;
  with TQuery.Create(application) do
          begin
            DatabaseName := 'DBBROKER';
            SQL.Clear;
            SQL.Add(' DELETE FROM MYINDAIA.DBO.TUSUARIO_HABILITACAO WHERE CD_USUARIO = ''' + Pesquisa   + ''' ');
            ExecSQL;
            SQL.Clear;
            SQL.Add(' INSERT INTO MYINDAIA.DBO.TUSUARIO_HABILITACAO ( ');
            SQL.Add(' CD_USUARIO, CD_UNID_NEG, CD_PRODUTO, IN_DEFAULT, IN_ACESSO_SITE, IN_DIREITOS ) ');
            SQL.Add(' SELECT CD_USUARIO, CD_UNID_NEG, CD_PRODUTO, IN_DEFAULT, IN_ACESSO_SITE, IN_DIREITOS ');
            SQL.Add(' FROM TUSUARIO_HABILITACAO ( NOLOCK ) WHERE IN_ATIVO = ''1'' AND CD_USUARIO = ''' + Pesquisa  + ''' ');
            ExecSQL;
            SQL.Clear;
            SQL.Add(' DELETE FROM MYINDAIA.DBO.TUSUARIO WHERE CD_USUARIO = ''' + Pesquisa + ''' ');
            ExecSQL;
            SQL.Clear;
            SQL.Add(' INSERT INTO MYINDAIA.DBO.TUSUARIO ( ');
            SQL.Add(' CD_USUARIO, CD_SENHA, CD_CARGO, NM_USUARIO, AP_USUARIO, NM_EMAIL, CD_CELULA, CD_TRANSP_ROD, CD_EMPRESA ) ');
            SQL.Add(' SELECT   CD_USUARIO, CD_SENHA, CD_CARGO, NM_USUARIO, AP_USUARIO, NM_EMAIL, CD_CELULA, CD_TRANSP_ROD, CD_EMPRESA ');
            SQL.Add(' FROM TUSUARIO ( NOLOCK ) WHERE IN_ATIVO = ''1'' AND CD_USUARIO = ''' + Pesquisa + ''' ');
            ExecSQL;
            SQL.Clear;
            SQL.Add(' DELETE FROM MYINDAIA.DBO.TPERMISSAO WHERE CD_USUARIO = ''' + Pesquisa + ''' ');
            ExecSQL;
            SQL.Clear;
            SQL.Add(' INSERT INTO MYINDAIA.DBO.TPERMISSAO ( CD_USUARIO, CD_CLIENTE ) ');
            SQL.Add(' SELECT P.CD_USUARIO, P.CD_CLIENTE                                    ');
            SQL.Add(' FROM TPERMISSAO       P ( NOLOCK )                                   ');
            SQL.Add(' INNER JOIN TUSUARIO U ( NOLOCK ) ON ( U.CD_USUARIO = P.CD_USUARIO )  ');
            SQL.Add(' WHERE P.IN_ATIVO = ''1'' AND U.IN_ATIVO = ''1''  AND P.CD_USUARIO = ''' + Pesquisa + ''' ');
            ExecSQL;
            SQL.Clear;
            SQL.Add(' DELETE FROM MYINDAIA.DBO.TPERMISSAO_AREA WHERE CD_USUARIO = ''' + Pesquisa + ''' ');
            ExecSQL;
            SQL.Clear;
            SQL.Add(' INSERT INTO MYINDAIA.DBO.TPERMISSAO_AREA ( CD_USUARIO, CD_AREA ) ');
            SQL.Add(' SELECT P.CD_USUARIO, P.CD_AREA                                         ');
            SQL.Add(' FROM TPERMISSAO_AREA  P ( NOLOCK )                                     ');
            SQL.Add(' INNER JOIN TUSUARIO U ( NOLOCK ) ON ( U.CD_USUARIO = P.CD_USUARIO )    ');
            SQL.Add(' WHERE P.IN_ATIVO = ''1'' AND U.IN_ATIVO = ''1''   AND P.CD_USUARIO = ''' + Pesquisa + ''' ');
            ExecSQL;
            SQL.Clear;
            SQL.Add(' DELETE FROM MYINDAIA.DBO.TPERMISSAO_GRUPO WHERE CD_USUARIO = ''' + Pesquisa + ''' ');
            ExecSQL;
            SQL.Clear;
            SQL.Add(' INSERT INTO MYINDAIA.DBO.TPERMISSAO_GRUPO ( CD_USUARIO, CD_GRUPO )  ');
            SQL.Add(' SELECT P.CD_USUARIO, P.CD_GRUPO                                           ');
            SQL.Add(' FROM TPERMISSAO_GRUPO  P ( NOLOCK )                                       ');
            SQL.Add(' INNER JOIN TUSUARIO U ( NOLOCK ) ON ( U.CD_USUARIO = P.CD_USUARIO )       ');
            SQL.Add(' WHERE P.IN_ATIVO = ''1'' AND U.IN_ATIVO = ''1'' AND P.CD_USUARIO = ''' + Pesquisa + ''' ');
            ExecSQL;
            Free;
          end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_usuario.Consiste;
var
  conta : integer;
begin
  Consiste := False;
  if (pgctrl_usuario.ActivePage = ts_dados_basicos) then
  begin
    if Not ( datm_usuario.qry_usuario_.State in [dsEdit, dsInsert] ) then Exit;
    ValidCodigo( dbedt_cd_cargo );
    if dbedt_cd_cargo.Text <> '' then
    begin
      if dbedt_nm_cargo.Text = '' then
      begin
        BoxMensagem('Código de cargo inválido!',2);
        pgctrl_usuario.ActivePage := ts_dados_basicos;
        dbedt_cd_cargo.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    // localiza cargo para ver o ativo
    Localiza(datm_usuario.qry_cargo_, datm_usuario.qry_usuario_CD_CARGO.AsString , 'CD_CARGO');
    if dbedt_nm_usuario.Text = '' then
    begin
      BoxMensagem('Campo ''Descrição'' deve ser preenchido!', 2);
      Consiste := False;
      Exit;
    end;

    if dbedt_ap_usuario.Text = '' then
    begin
      BoxMensagem('Campo ''Apelido'' deve ser preenchido!', 2);
      Consiste := False;
      Exit;
    end
    else
    begin
      with datm_usuario do
      begin
        qry_apelido_.Close;
        qry_apelido_.ParamByName('CD_USUARIO').AsString := Trim(dbedt_cd_usuario.Text);
        qry_apelido_.ParamByName('AP_USUARIO').AsString := Trim(dbedt_ap_usuario.Text);
        qry_apelido_.Prepare;
        qry_apelido_.Open;
        if qry_apelido_TOT.AsInteger > 0 then
        begin
          qry_apelido_.Close;
          BoxMensagem('Campo "Apelido" já existente!', 2);
          Consiste := False;
          Exit;
        end;
        qry_apelido_.Close;
      end;
    end;

    if dbedt_cd_cargo.Text = '' then
    begin
      BoxMensagem('Campo ''Cod. Cargo'' deve ser preenchido!', 2);
      Consiste := False;
      Exit;
    end;

    if datm_usuario.qry_CARGO_IN_ATIVO.AsString = '0' then
    begin
      BoxMensagem('Este cargo não está ativo!', 2);
      Consiste := False;
      Exit;
    end;

    ValidCodigo( dbedt_cd_celula );
    if dbedt_cd_celula.Text <> '' then
    begin
      if dbedt_nm_celula.Text = '' then
      begin
        BoxMensagem( 'Código da Célula inválido!', 2 );
        pgctrl_usuario.ActivePage := ts_dados_basicos;
        dbedt_cd_celula.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if (Length(Trim(datm_usuario.qry_usuario_NM_EMAIL.AsString)) < 10) or (Pos('@', datm_usuario.qry_usuario_NM_EMAIL.AsString) < 1 ) then
    begin
      BoxMensagem('É necessário que seja informado um endereço de e-mail do usuário.', 2);
      pgctrl_usuario.ActivePage := ts_dados_basicos;
      dbedt_nm_email.SetFocus;
      Result := False;
      Exit;
    end;

    Consiste := True;
  end
  else if (pgctrl_usuario.ActivePage=ts_habilitacao) and (pgctrl_habilitacao.ActivePage=ts_dados_basicos_habilitacao) then
    begin
      datm_usuario.qry_pesquisa_default_.ParamByName('CD_USUARIO').AsString:=datm_usuario.qry_usuario_CD_USUARIO.AsString;
      datm_usuario.qry_pesquisa_default_.Close;
      datm_usuario.qry_pesquisa_default_.Open;
      datm_usuario.qry_traz_default_.ParamByName('CD_USUARIO').AsString:=datm_usuario.qry_usuario_CD_USUARIO.AsString;
      datm_usuario.qry_traz_default_.Close;
      datm_usuario.qry_traz_default_.Open;
      // Localiza produto e unidade para ver futuramente se estao ativos
      Localiza(datm_usuario.qry_produto_, datm_usuario.qry_usuario_habilitacao_CD_PRODUTO.AsString , 'CD_PRODUTO' );
      Localiza(datm_usuario.qry_unid_neg_, datm_usuario.qry_usuario_habilitacao_CD_UNID_NEG.AsString , 'CD_UNID_NEG');

      // Unidade de Negócio
      if Not lNaoConsiste then
      begin
        if dbedt_cd_unidade_habilitacao.Text = '' then
        begin
          BoxMensagem('Campo ''Codigo da Unidade'' deve ser preenchido!', 2);
          pgctrl_usuario.ActivePage := ts_habilitacao;
          pgctrl_habilitacao.ActivePage := ts_dados_basicos_habilitacao;
          dbedt_cd_unidade_habilitacao.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      if not ( datm_usuario.qry_usuario_habilitacao_.State in [dsEdit, dsInsert] ) then Exit;
      ValidCodigo( dbedt_cd_unidade_habilitacao );
      if dbedt_cd_unidade_habilitacao.Text <> '' then
      begin
        if dbedt_nm_unidade_habilitacao.Text = '' then
        begin
          BoxMensagem('Código de unidade inválido!',2);
          pgctrl_usuario.ActivePage := ts_habilitacao;
          pgctrl_habilitacao.ActivePage := ts_dados_basicos_habilitacao;
          dbedt_cd_unidade_habilitacao.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      // Produto
      if Not lNaoConsiste then
      begin
        if dbedt_cd_produto_habilitacao.Text = '' then
        begin
          BoxMensagem('Campo ''Código do produto'' deve ser preenchido!', 2);
          pgctrl_usuario.ActivePage := ts_habilitacao;
          pgctrl_habilitacao.ActivePage := ts_dados_basicos_habilitacao;
          dbedt_cd_produto_habilitacao.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      if not ( datm_usuario.qry_usuario_habilitacao_.State in [dsEdit, dsInsert] ) then Exit;
      ValidCodigo( dbedt_cd_produto_habilitacao );
      if dbedt_cd_produto_habilitacao.Text <> '' then
      begin
        if dbedt_nm_produto_habilitacao.Text = '' then
        begin
          BoxMensagem('Código de produto inválido!',2);
          pgctrl_usuario.ActivePage := ts_habilitacao;
          pgctrl_habilitacao.ActivePage := ts_dados_basicos_habilitacao;
          dbedt_cd_produto_habilitacao.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      if datm_usuario.qry_produto_IN_ATIVO.AsString = '0' then
      begin
        BoxMensagem('Este produto não está ativo !', 2);
        Consiste := False;
        Exit;
      end;

      if datm_usuario.qry_unid_neg_IN_ATIVO.AsString = '0' then
      begin
        BoxMensagem('Esta unidade não está ativa !', 2);
        Consiste := False;
        Exit;
      end;

      if ( datm_usuario.qry_usuario_habilitacao_IN_ATIVO.AsString = '0' ) and
         ( datm_usuario.qry_usuario_habilitacao_IN_DEFAULT.AsString = '1' ) then
      begin
        BoxMensagem( 'Não pode existir habilitação inativa e padrão.', 2 );
        pgctrl_usuario.ActivePage := ts_habilitacao;
        pgctrl_habilitacao.ActivePage := ts_dados_basicos_habilitacao;
        dblkpcbox_ativo_hab.SetFocus;
        Consiste := False;
        Exit;
      end;
      Consiste := True;
    end;

    if (pgctrl_usuario.ActivePage=ts_habilitacao) and
       (pgctrl_habilitacao.ActivePage=ts_permissoes_mi_habilitacao) then
    begin
      if Not ( datm_usuario.qry_usuario_permissao_.State in [dsEdit, dsInsert] ) then Exit;
        ValidCodigo( dbedt_cd_cliente );

      if Trim( dbedt_cd_cliente.Text ) <> '' then
      begin
        if Trim( dbedt_nm_cliente.Text ) = '' then
        begin
          BoxMensagem('Código de cliente inválido!', 2);
          pgctrl_usuario.ActivePage := ts_habilitacao;
          pgctrl_habilitacao.ActivePage := ts_permissoes_mi_habilitacao;
          dbedt_cd_cliente.SetFocus;
          Consiste := False;
          Exit;
        end;

        With TQuery.Create(Application) do
        begin
          DataBaseName := 'DBBROKER';
          Close;
          SQL.Add('SELECT CD_USUARIO FROM TPERMISSAO WHERE ( CD_USUARIO = "'+ dbedt_cd_usuario_permissao.Text +'" ) AND');
          SQL.Add(' ( CD_CLIENTE = "'+ dbedt_cd_cliente.Text  +'" )');
          Prepare;
          Open;
          Conta := RecordCount;
          Free;

          if ((Conta > 0) and (datm_usuario.qry_usuario_permissao_.State in [dsInsert]))then
          begin
            BoxMensagem('Esse cliente já está associado ao usuário!', 2);
            Consiste := False;
            Cancelar;
            Exit;
          end;
        end;
      end;
    end;

    if (pgctrl_usuario.ActivePage=ts_habilitacao) and (pgctrl_habilitacao.ActivePage=ts_permissoes_mi_habilitacao_area) then
    begin
      if Not ( datm_usuario.qry_permissao_area_.State in [dsEdit, dsInsert] ) then Exit;
        ValidCodigo( dbedt_cd_area );
        if Trim( dbedt_cd_area.Text ) <> '' then
        begin
          if Trim( dbedt_nm_area.Text ) = '' then
          begin
            BoxMensagem('Código da área inválido!',2);
            pgctrl_usuario.ActivePage := ts_habilitacao;
            pgctrl_habilitacao.ActivePage := ts_permissoes_mi_habilitacao_area;
            dbedt_cd_cliente.SetFocus;
            Consiste := False;
            Exit;
          end;

          With TQuery.Create(Application) do
          begin
            DataBaseName := 'DBBROKER';
            Close;
            SQL.Add('SELECT CD_USUARIO FROM TPERMISSAO WHERE ( CD_USUARIO = "'+ dbedt_cd_usuario_permissao.Text +'" ) AND');
            SQL.Add(' ( CD_CLIENTE = "'+ dbedt_cd_cliente.Text  +'" )');
            Prepare;
            Open;
            Conta := RecordCount;
            Free;

            if ((Conta > 0) and (datm_usuario.qry_usuario_permissao_.State in [dsInsert]))then
              begin
                BoxMensagem('Esse cliente já está associado ao usuário!',2);
                Consiste := False;
                Cancelar;
                Exit;
              end;
          end;
        end;
    end;

    if (pgctrl_usuario.ActivePage = ts_habilitacao) and (pgctrl_habilitacao.ActivePage = ts_permissoes_mi_habilitacao_Empresa) then
    begin
      if Not ( datm_usuario.SqlPermissao_EmpresaEst.State in [dsEdit, dsInsert] ) then Exit;
        ValidCodigo( dbedt_cd_empresa );
        if Trim( dbedt_cd_empresa.Text ) <> '' then
        begin
          if Trim( dbedt_nm_empresa.Text ) = '' then
          begin
            BoxMensagem('Código da Empresa inválido!',2);
            pgctrl_usuario.ActivePage := ts_habilitacao;
            pgctrl_habilitacao.ActivePage := ts_permissoes_mi_habilitacao_Empresa;
            dbedt_cd_empresa.SetFocus;
            Consiste := False;
            Exit;
          end;

          {With TQuery.Create(Application) do
          begin
            DataBaseName := 'DBBROKER';
            Close;
            SQL.Add('SELECT CD_USUARIO FROM TPERMISSAO WHERE ( CD_USUARIO = "'+ dbedt_cd_usuario_permissao.Text +'" ) AND');
            SQL.Add(' ( CD_CLIENTE = "'+ dbedt_cd_cliente.Text  +'" )');
            Prepare;
            Open;
            Conta := RecordCount;
            Free;

            if ((Conta > 0) and (datm_usuario.qry_usuario_permissao_.State in [dsInsert]))then
              begin
                BoxMensagem('Esse cliente já está associado ao usuário!',2);
                Consiste := False;
                Cancelar;
                Exit;
              end;
          end;}
        end;
    end;

    if (pgctrl_usuario.ActivePage = ts_habilitacao) and (pgctrl_habilitacao.ActivePage = ts_permissoes_mi_grupo) then
    begin
      if Not ( datm_usuario.qry_permissao_grupo_.State in [dsEdit, dsInsert] ) then Exit;
        ValidCodigo( dbedt_cd_grupo );
        if Trim( dbedt_cd_grupo.Text ) <> '' then
        begin
          if Trim( dbedt_nm_grupo.Text ) = '' then
          begin
            BoxMensagem('Código do Grupo inválido!',2);
            pgctrl_usuario.ActivePage := ts_habilitacao;
            pgctrl_habilitacao.ActivePage := ts_permissoes_mi_grupo;
            dbedt_cd_grupo.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
    end;

    Consiste := True;
end;

procedure Tfrm_usuario.pgctrl_usuarioChange(Sender: TObject);
var in_tipo: String;
    cont_acesso: Integer;
begin
  if (pgctrl_usuario.ActivePage=ts_lista) or
     (pgctrl_usuario.ActivePage=ts_dados_basicos) then
    dbnvg.DataSource := datm_usuario.ds_usuario_lista
  else
    dbnvg.DataSource := datm_usuario.ds_usuario_habilitacao;

  if pgctrl_usuario.ActivePage=ts_dados_basicos then
  begin
    lblTransportadora.Visible         := (datm_usuario.qry_usuario_CD_CARGO.AsString = '055');
    dbedtCodigoTransportadora.Visible := (datm_usuario.qry_usuario_CD_CARGO.AsString = '055');
    edtNomeTransportadora.Visible     := (datm_usuario.qry_usuario_CD_CARGO.AsString = '055');
    btnConsultaTransportadora.Visible := (datm_usuario.qry_usuario_CD_CARGO.AsString = '055');
    btnDesbloquearUsuario.visible     := (datm_usuario.qry_usuario_QT_SENHA_INCORRETA.asInteger >= 5);
    btnBloquearUsuario.visible        := (datm_usuario.qry_usuario_QT_SENHA_INCORRETA.asInteger < 5);
  end;

  if (pgctrl_usuario.ActivePage = ts_lista ) or
     ((pgctrl_usuario.ActivePage = ts_habilitacao ) and
      (pgctrl_habilitacao.ActivePage = ts_lista_habilitacao ) ) then
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

  if ( datm_usuario.qry_usuario_CD_CARGO.AsString = '040' ) or
     ( datm_usuario.qry_usuario_CD_CARGO.AsString = '131' ) or
     ( datm_usuario.qry_usuario_CD_CARGO.AsString = '055' ) or
     ( datm_usuario.qry_usuario_CD_CARGO.AsString = '060' ) then
  begin
    frm_usuario.ts_permissoes_mi_habilitacao.TabVisible      := True;
    frm_usuario.ts_permissoes_mi_habilitacao_area.TabVisible := True;
    frm_usuario.ts_permissoes_mi_grupo.TabVisible            := True;
    frm_usuario.ts_lista_habilitacao.TabVisible              := False;
    frm_usuario.ts_dados_basicos_habilitacao.TabVisible      := False;
  end
  else
  begin
    frm_usuario.ts_permissoes_mi_habilitacao.TabVisible      := False;
    frm_usuario.ts_permissoes_mi_habilitacao_area.TabVisible := False;
    frm_usuario.ts_permissoes_mi_grupo.TabVisible            := False;
    frm_usuario.ts_lista_habilitacao.TabVisible              := True;
    frm_usuario.ts_dados_basicos_habilitacao.TabVisible      := True;
  end;

  ts_permissoes_mi_habilitacao_Empresa.TabVisible := datm_usuario.qry_usuario_CD_CARGO.AsString = '088';  //importador

  if pgctrl_habilitacao.ActivePage = ts_permissoes_mi_myindaiaweb then
  begin
    with TQuery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      Close;
      SQL.Add('SELECT M09_CD_USUARIO FROM MYINDAIA.DBO.M09_ACESSO WHERE M09_CD_USUARIO = '''+ datm_usuario.qry_usuario_CD_USUARIO.AsString  +''' ');
      Prepare;
      Open;
      cont_acesso := RecordCount;
      Free;
    end;

    if cont_acesso = 0 then
      in_tipo := 'novo'
    else
      in_tipo := 'editar';

  WebBrowser1.Navigate('http://www.myindaiaweb.com.br/admin/usuario/permissao_edt2.asp?cd_menu=00&cd_subm=02&cd_docto=0002-D0001&tx_campo=NM_USUARIO&tx_ordem=ASC&nr_pagina=10&in_acao='+in_tipo+'&cd_user='+datm_usuario.qry_usuario_CD_USUARIO.AsString);
  end;
end;

procedure Tfrm_usuario.dbedt_nm_usuarioChange(Sender: TObject);
begin
  if ( datm_usuario.qry_usuario_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_incluir.Enabled  := False;
    mi_incluir.Enabled   := False;
    btn_excluir.Enabled  := False;
    mi_excluir.Enabled   := False;
    btn_salvar.Enabled   := True;
    mi_salvar.Enabled    := True;
    btn_Cancelar.Enabled := True;
    mi_Cancelar.Enabled  := True;
  end;
end;

procedure Tfrm_usuario.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_usuario.pgctrl_usuarioChanging(Sender: TObject;
var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_usuario.btn_co_cargoClick(Sender: TObject);
begin
  vStr_cd_modulo := '24';
  str_cd_rotina := '2401';
  Application.CreateForm(Tfrm_cargo, frm_cargo);
  frm_cargo.Cons_OnLine := datm_usuario.qry_usuario_CD_CARGO;
  With frm_cargo Do
  Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_usuario.qry_usuario_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_usuario.qry_usuario_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_usuario do
  begin
    qry_cargo_.Close;
    qry_cargo_.Prepare;
    qry_cargo_.Open;
  end;
  vStr_cd_modulo := lcd_modulo;
  str_cd_rotina := lcd_rotina;
  dbedt_cd_cargoExit(nil);
end;

procedure Tfrm_usuario.dbedt_cd_cargoExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_usuario.dbedt_cd_unidade_habilitacaoChange(Sender: TObject);
begin
  if ( datm_usuario.qry_usuario_habilitacao_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_incluir.Enabled  := False;
    mi_incluir.Enabled   := False;
    btn_excluir.Enabled  := False;
    mi_excluir.Enabled   := False;
    btn_salvar.Enabled   := True;
    mi_salvar.Enabled    := True;
    btn_Cancelar.Enabled := True;
    mi_Cancelar.Enabled  := True;
  end;
end;

procedure Tfrm_usuario.btn_co_unidadeClick(Sender: TObject);
begin
  if datm_usuario.qry_usuario_habilitacao_.State in [dsEdit, dsBrowse] then exit;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  frm_unidade.Cons_OnLine := datm_usuario.qry_usuario_habilitacao_CD_UNID_NEG;
  With frm_unidade Do Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_usuario.qry_usuario_habilitacao_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_usuario.qry_usuario_habilitacao_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_usuario do
  begin
    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;
  end;
  vStr_cd_modulo := lcd_modulo;
  str_cd_rotina := lcd_rotina;
  dbedt_cd_unidade_habilitacaoExit(nil);
end;

procedure Tfrm_usuario.btn_co_produtoClick(Sender: TObject);
begin
  if datm_usuario.qry_usuario_habilitacao_.State in [dsEdit, dsBrowse] then exit;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';
  Application.CreateForm(Tfrm_produto, frm_produto);
  frm_produto.Cons_OnLine := datm_usuario.qry_usuario_habilitacao_CD_PRODUTO;
  With frm_produto Do Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if not ( datm_usuario.qry_usuario_habilitacao_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_usuario.qry_usuario_habilitacao_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_usuario do
  begin
    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;
  end;
  vStr_cd_modulo := lcd_modulo;
  str_cd_rotina := lcd_rotina;
  dbedt_cd_produto_habilitacaoExit(nil);
end;

procedure Tfrm_usuario.dbedt_cd_unidade_habilitacaoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_usuario.dbedt_cd_produto_habilitacaoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_usuario.pgctrl_habilitacaoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  VerAlt;
end;

procedure Tfrm_usuario.Cancelar;
begin
  if (pgctrl_usuario.ActivePage=ts_lista) or (pgctrl_usuario.ActivePage=ts_dados_basicos) then
  begin
    try
      if datm_usuario.qry_usuario_.State in [dsInsert, dsEdit] then
      begin
        datm_usuario.qry_usuario_.Cancel;
        pgctrl_usuario.ActivePage := ts_dados_basicos;
        dbedt_nm_usuario.SetFocus;
      end;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
  end
  else if pgctrl_usuario.ActivePage=ts_habilitacao then
  begin
    try
      if datm_usuario.qry_usuario_habilitacao_.State in [dsInsert, dsEdit] then
      begin
        datm_usuario.qry_usuario_habilitacao_.Cancel;
        pgctrl_usuario.ActivePage := ts_habilitacao;
        pgctrl_habilitacao.ActivePage := ts_dados_basicos_habilitacao;
        dbedt_cd_unidade_habilitacao.SetFocus;
      end;

      if datm_usuario.qry_usuario_permissao_.State in [dsInsert, dsEdit] then
      begin
        datm_usuario.qry_usuario_permissao_.Cancel;
        pgctrl_usuario.ActivePage := ts_habilitacao;
        pgctrl_habilitacao.ActivePage := ts_permissoes_mi_habilitacao;
        dbedt_cd_cliente.SetFocus;
      end;

      if datm_usuario.qry_permissao_area_.State in [dsInsert, dsEdit] then
      begin
        datm_usuario.qry_permissao_area_.Cancel;
        pgctrl_usuario.ActivePage := ts_habilitacao;
        pgctrl_habilitacao.ActivePage := ts_permissoes_mi_habilitacao_area;
        dbedt_cd_area.SetFocus;
      end;

      if datm_usuario.qry_permissao_grupo_.State in [dsInsert, dsEdit] then
      begin
        datm_usuario.qry_permissao_grupo_.Cancel;
        pgctrl_usuario.ActivePage := ts_habilitacao;
        pgctrl_habilitacao.ActivePage := ts_permissoes_mi_grupo;
        dbedt_cd_grupo.SetFocus;
      end;

      if datm_usuario.SqlPermissao_EmpresaEst.State in [dsInsert, dsEdit] then
      begin
        datm_usuario.SqlPermissao_EmpresaEst.Cancel;
        pgctrl_usuario.ActivePage := ts_habilitacao;
        pgctrl_habilitacao.ActivePage := ts_permissoes_mi_habilitacao_Empresa;
        dbedt_cd_empresa.SetFocus;
      end;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;
//----------------------------------------------------------------------------------------------------
procedure Tfrm_usuario.dblkpcbox_ativo_habClick(Sender: TObject);
begin
  dbedt_cd_unidade_habilitacaoChange(nil);
end;

procedure Tfrm_usuario.dblkpcbox_default_habilitacaoClick(Sender: TObject);
begin
  dbedt_cd_unidade_habilitacaoChange(nil);
end;

procedure Tfrm_usuario.dblkpcbox_ativo_habExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_usuario.dblkpcbox_default_habilitacaoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_usuario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then close;
end;

procedure Tfrm_usuario.dbedt_cd_unidade_habilitacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_cargo               then btn_co_cargoClick(nil);
    if Sender = dbedt_cd_grupo               then btn_grupoClick(nil);
    if Sender = dbedt_cd_unidade_habilitacao then btn_co_unidadeClick(nil);
    if Sender = dbedt_cd_produto_habilitacao then btn_co_produtoClick(nil);
    if Sender = dbedt_cd_celula              then btn_co_celulaClick(nil);
    if Sender = dbedt_cd_cliente             then btn_co_clienteclick(nil);
    if Sender = dbedt_cd_area                then btn_co_areaclick(nil);
    if Sender = dbedtCodigoTransportadora    then btnConsultaTransportadoraClick(nil);
    if Sender = dbedt_cd_empresa             then btnConsultaEmpresaEstClick(btnConsultaEmpresaEst);
  end;
end;

procedure Tfrm_usuario.CodExits;
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_usuario.dbg_usuarioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbg_usuarioDblClick(Sender);
end;

procedure Tfrm_usuario.btn_co_celulaClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2218';
  Application.CreateForm(Tfrm_celula, frm_celula);
  frm_celula.Cons_OnLine := datm_usuario.qry_usuario_CD_CELULA;
  with frm_celula do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_usuario.qry_usuario_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_usuario.qry_usuario_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_usuario do
  begin
    qry_celula_.Close;
    qry_celula_.Prepare;
    qry_celula_.Open;
  end;
  vStr_cd_modulo := lcd_modulo;
  str_cd_rotina := lcd_rotina;
  dbedt_cd_celulaExit(nil);
end;

procedure Tfrm_usuario.dbedt_cd_celulaExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_usuario.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbg_usuarioDblClick(nil);
end;

procedure Tfrm_usuario.btn_co_clienteClick(Sender: TObject);
begin
  dbedt_cd_cliente.Text := ConsultaOnLineExSQL('SELECT CD_EMPRESA, NM_EMPRESA FROM TEMPRESA_NAC WHERE CD_GRUPO IN (SELECT CD_GRUPO FROM TPERMISSAO_GRUPO WHERE CD_USUARIO = '''+ datm_usuario.qry_usuario_CD_USUARIO.AsString +''')','Empresa',['CD_AREA','NM_AREA'],['Código','Descrição'],'CD_EMPRESA',frm_main.mi_cad_cli);
  dbedt_nm_cliente.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',dbedt_cd_cliente.Text,'NM_EMPRESA');
  dbedt_cd_clienteExit(nil);
end;

procedure Tfrm_usuario.dbedt_cd_clienteExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_usuario.dbedt_cd_grupoChan(Sender: TObject);
begin
  if ( datm_usuario.qry_usuario_permissao_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_incluir.Enabled  := False;
    mi_incluir.Enabled   := False;
    btn_excluir.Enabled  := False;
    mi_excluir.Enabled   := False;
    btn_salvar.Enabled   := True;
    mi_salvar.Enabled    := True;
    btn_Cancelar.Enabled := True;
    mi_Cancelar.Enabled  := True;
  end;
end;

procedure Tfrm_usuario.btn_co_areaClick(Sender: TObject);
begin
  dbedt_cd_area.Text := ConsultaOnLineEx('TAREA','Área',['CD_AREA','NM_AREA'],['Código','Descrição'],'CD_AREA',frm_main.mi_cad_area);
  dbedt_nm_area.Text := ConsultaLookUP('TAREA','CD_AREA',dbedt_cd_area.Text,'NM_AREA');
  dbedt_cd_areaExit(nil);
end;

procedure Tfrm_usuario.dbedt_cd_areaChange(Sender: TObject);
begin
  if ( datm_usuario.qry_permissao_area_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_incluir.Enabled  := False;
    mi_incluir.Enabled   := False;
    btn_excluir.Enabled  := False;
    mi_excluir.Enabled   := False;
    btn_salvar.Enabled   := True;
    mi_salvar.Enabled    := True;
    btn_Cancelar.Enabled := True;
    mi_Cancelar.Enabled  := True;
  end;
end;

procedure Tfrm_usuario.dbedt_cd_areaExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_usuario.btnConsultaTransportadoraClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_usuario.qry_usuario_) then Exit;
    datm_usuario.qry_usuario_CD_TRANSP_ROD.Value := ConsultaOnLineEx('TTRANSP_ROD','Transportadora',['CD_TRANSP_ROD','NM_TRANSP_ROD'],['Código','Tranportadora'],'CD_TRANSP_ROD',nil);
    dbedt_nm_usuarioChange(nil);
  end
  else
    edtNomeTransportadora.Text := ConsultaLookUp('TTRANSP_ROD','CD_TRANSP_ROD',dbedtCodigoTransportadora.Text,'NM_TRANSP_ROD');
end;

procedure Tfrm_usuario.btnConsultaEmpresaEstClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_usuario.SqlPermissao_EmpresaEst) then
      Exit;
    datm_usuario.SqlPermissao_EmpresaEstCD_EMPRESA.Value := ConsultaOnLineEx('TEMPRESA_EST','Empresa Estrangeira',['CD_EMPRESA','NM_EMPRESA'],['Código','Empresa'],'CD_EMPRESA',nil);
    dbedt_nm_usuarioChange(nil);
  end
  else
  begin
    dbedt_nm_usuarioChange(nil);
    dbedt_nm_empresa.Text := ConsultaLookUp('TEMPRESA_EST','CD_EMPRESA',dbedt_cd_empresa.Text,'NM_EMPRESA');
  end;
end;

procedure Tfrm_usuario.dbedt_cd_empresaExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_usuario.DBLookupComboBox1Click(Sender: TObject);
begin
  if ( datm_usuario.SqlPermissao_EmpresaEst.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_incluir.Enabled  := False;
    mi_incluir.Enabled   := False;
    btn_excluir.Enabled  := False;
    mi_excluir.Enabled   := False;
    btn_salvar.Enabled   := True;
    mi_salvar.Enabled    := True;
    btn_Cancelar.Enabled := True;
    mi_Cancelar.Enabled  := True;
  end;
end;

procedure Tfrm_usuario.btn_co_chefiaClick(Sender: TObject);
begin
  if ( datm_usuario.qry_usuario_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_incluir.Enabled  := False;
    mi_incluir.Enabled   := False;
    btn_excluir.Enabled  := False;
    mi_excluir.Enabled   := False;
    btn_salvar.Enabled   := True;
    mi_salvar.Enabled    := True;
    btn_Cancelar.Enabled := True;
    mi_Cancelar.Enabled  := True;
  end;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_usuario.qry_usuario_) then Exit;
    datm_usuario.qry_usuario_CD_CHEFIA.Value := ConsultaOnLineEx('TUSUARIO','Usuário',['CD_USUARIO','NM_USUARIO'],['Código','Usuário'],'CD_USUARIO',nil);
    dbedt_nm_usuarioChange(nil);
  end
  else
    dbedt_nm_chefia.Text := ConsultaLookUp('TUSUARIO','CD_USUARIO',dbedt_cd_chefia.Text,'NM_USUARIO');
end;

procedure Tfrm_usuario.dbedt_cd_chefiaExit(Sender: TObject);
begin
  dbedt_nm_chefia.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', dbedt_cd_chefia.Text,'NM_USUARIO');
end;

procedure Tfrm_usuario.CheckBox1Click(Sender: TObject);
begin
with datm_usuario do begin
    qry_lista_.Close;
    if CheckBox1.Checked then
       qry_lista_.SQL[4] := ' ISNULL(U.IN_ATIVO,''0'') IN (''0'',''1'')'
    else
       qry_lista_.SQL[4] := ' U.IN_ATIVO IN (''1'')';
    qry_lista_.Prepare;
    qry_lista_.Open;
    //ShowMessage(qry_lista_.SQL.Text);
  end;
end;

procedure Tfrm_usuario.btn_grupoClick(Sender: TObject);
begin
  dbedt_cd_grupo.Text := ConsultaOnLineEx('TGRUPO','Grupo',['CD_GRUPO','NM_GRUPO'],['Código','Descrição'],'CD_GRUPO',frm_main.mi_cad_cli);
  dbedt_nm_grupo.Text := ConsultaLookUP('TGRUPO','CD_GRUPO',dbedt_cd_grupo.Text,'NM_GRUPO');
  dbedt_cd_grupoExit(nil);
end;

procedure Tfrm_usuario.dbedt_cd_grupoChange(Sender: TObject);
begin
  if ( datm_usuario.qry_permissao_grupo_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_incluir.Enabled  := False;
    mi_incluir.Enabled   := False;
    btn_excluir.Enabled  := False;
    mi_excluir.Enabled   := False;
    btn_salvar.Enabled   := True;
    mi_salvar.Enabled    := True;
    btn_Cancelar.Enabled := True;
    mi_Cancelar.Enabled  := True;
  end;
end;

procedure Tfrm_usuario.dbedt_cd_grupoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_usuario.dbedt_cd_clienteChange(Sender: TObject);
begin
  if ( datm_usuario.qry_usuario_permissao_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_incluir.Enabled  := False;
    mi_incluir.Enabled   := False;
    btn_excluir.Enabled  := False;
    mi_excluir.Enabled   := False;
    btn_salvar.Enabled   := True;
    mi_salvar.Enabled    := True;
    btn_Cancelar.Enabled := True;
    mi_Cancelar.Enabled  := True;
  end;
end;

procedure Tfrm_usuario.btn_co_superior_diretoClick(Sender: TObject);
begin
  if ( datm_usuario.qry_usuario_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_incluir.Enabled  := False;
    mi_incluir.Enabled   := False;
    btn_excluir.Enabled  := False;
    mi_excluir.Enabled   := False;
    btn_salvar.Enabled   := True;
    mi_salvar.Enabled    := True;
    btn_Cancelar.Enabled := True;
    mi_Cancelar.Enabled  := True;
  end;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_usuario.qry_usuario_) then Exit;
    datm_usuario.qry_usuario_CD_SUPERIOR_DIRETO.Value := ConsultaOnLineEx('TUSUARIO','Usuário',['CD_USUARIO','NM_USUARIO'],['Código','Usuário'],'CD_USUARIO',nil);
    dbedt_nm_usuarioChange(nil);
  end
  else
    dbedt_nm_superior_direto.Text := ConsultaLookUp('TUSUARIO','CD_USUARIO',dbedt_cd_superior_direto.Text,'NM_USUARIO');
end;

procedure Tfrm_usuario.dbedt_cd_superior_diretoExit(Sender: TObject);
begin
  dbedt_nm_superior_direto.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', dbedt_cd_superior_direto.Text,'NM_USUARIO');
end;

procedure Tfrm_usuario.btnRecriarAcessosClick(Sender: TObject);
begin
  if datm_usuario.qry_usuario_.State in [dsEdit, dsInsert] then
    MessageDlg('O usuário está em edição.'#13'Salve/Cancele as alterações antes de efetuar a operação.', mtInformation, [mbOk], 0)
  else
    try
     { CloseStoredProc(datm_main.SP_REINCLUIR_USUARIO_BANCOS);
      datm_main.SP_REINCLUIR_USUARIO_BANCOS.ParamByName('@USUARIO').AsString := Trim(datm_usuario.qry_usuario_AP_USUARIO.AsString);
      ExecStoredProc(datm_main.SP_REINCLUIR_USUARIO_BANCOS);}

      // SP_REINCLUIR_USUARIO_BANCOS está no banco MASTER
      datm_main.qrySP_ALTERAR_USUARIO.close;
      datm_main.qrySP_ALTERAR_USUARIO.Sql.Text := ' USE MASTER EXEC SP_REINCLUIR_USUARIO_BANCOS '
                                                  +QuotedStr(Trim(datm_usuario.qry_usuario_AP_USUARIO.AsString));
      datm_main.qrySP_ALTERAR_USUARIO.ExecSQL;

      ShowMessage('Operação executada com sucesso.');
    except
      on E: Exception do
        MessageDlg('Erro executando a operação.'#13 + E.Message, mtError, [mbOk], 0);
    end;
end;

procedure Tfrm_usuario.btnAlterarSenhaClick(Sender: TObject);
begin
  if datm_usuario.qry_usuario_.State in [dsEdit, dsInsert] then
    MessageDlg('O usuário está em edição.'#13'Salve/Cancele as alterações antes de efetuar a operação.', mtInformation, [mbOk], 0)
  else
  if edtNovaSenha.Text = '' then
  begin
    edtNovaSenha.SetFocus;
    MessageDlg('É necessário informar uma senha para efetuar a alteração.', mtInformation, [mbOk], 0);
  end
  else
  if edtConfirmaSenha.Text <> edtNovaSenha.Text then
  begin
    edtConfirmaSenha.SetFocus;
    MessageDlg('Confirmação difere da nova senha.', mtInformation, [mbOk], 0);
  end
  else
  if length(edtNovaSenha.Text) < 10  then
  begin
    edtNovaSenha.SetFocus;
    MessageDlg('A senha deve ter pelo menos 10 caracteres.', mtInformation, [mbOk], 0);
  end
  else
  if not ValidaCaracteresSenha(edtNovaSenha.Text, 'Upper') then
  begin
    edtNovaSenha.SetFocus;
    MessageDlg('A senha deve conter pelo menos um caracter maiúsculo.', mtInformation, [mbOk], 0);
  end
  else
  if not ValidaCaracteresSenha(edtNovaSenha.Text, 'Lower') then
  begin
    edtNovaSenha.SetFocus;
    MessageDlg('A senha deve conter pelo menos um caracter minúsculo.', mtInformation, [mbOk], 0);
  end
  else
  if not ValidaCaracteresSenha(edtNovaSenha.Text, 'Numero') then
  begin
    edtNovaSenha.SetFocus;
    MessageDlg('A senha deve conter pelo menos um numero.', mtInformation, [mbOk], 0);
  end
  else
  if not ValidaCaracteresSenha(edtNovaSenha.Text, 'Especial') then
  begin
    edtNovaSenha.SetFocus;
    MessageDlg('A senha deve conter pelo menos um caracter especial.', mtInformation, [mbOk], 0);
  end
  else
    try
     { CloseStoredProc(datm_main.SP_ALTERA_SENHA);
      datm_main.SP_ALTERA_SENHA.ParamByName('@usuario').AsString   := Trim(datm_usuario.qry_usuario_AP_USUARIO.AsString);
      datm_main.SP_ALTERA_SENHA.ParamByName('@senha_new').AsString := Trim(edtNovaSenha.Text);
      datm_main.SP_ALTERA_SENHA.ParamByName('@senha_old').AsString := '';
      ExecStoredProc(datm_main.SP_ALTERA_SENHA);
      }

      datm_main.qrySP_ALTERAR_USUARIO.close;
      datm_main.qrySP_ALTERAR_USUARIO.Sql.Text :=
      'EXEC SP_ALTERA_SENHA '+QuotedStr('')+
                         ', '+QuotedStr( Trim(edtNovaSenha.Text))+
                         ', '+QuotedStr(Trim(datm_usuario.qry_usuario_AP_USUARIO.AsString));
      datm_main.qrySP_ALTERAR_USUARIO.ExecSQL;

      ShowMessage('Operação executada com sucesso.');
    except
      on E: Exception do
        MessageDlg('Erro executando a operação.'#13 + E.Message, mtError, [mbOk], 0);
    end;
end;

procedure Tfrm_usuario.edtNovaSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnAlterarSenha.Click;
end;

procedure Tfrm_usuario.btnDesbloquearUsuarioClick(Sender: TObject);
var
  UsuarioAlterado :integer;
begin
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Add(' UPDATE TUSUARIO                  '+
            '    SET QT_SENHA_INCORRETA = 0    '+
            '   FROM TUSUARIO (NOLOCK)         '+
            '  WHERE CD_USUARIO = '''+ datm_usuario.qry_usuario_CD_USUARIO.AsString  +''' ');
    Prepare;
    ExecSql;
    UsuarioAlterado := RowsAffected;
    Free;
  end;
  if UsuarioAlterado > 0 then
  begin
    btnDesbloquearUsuario.visible := false;
    btnBloquearUsuario.visible    := true;
  end
  else
    ShowMessage('Erro ao desbloquear o usuario.');
end;

procedure Tfrm_usuario.btnBloquearUsuarioClick(Sender: TObject);
var
  UsuarioAlterado :integer;
begin
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Add(' UPDATE TUSUARIO                  '+
            '    SET QT_SENHA_INCORRETA = 10   '+
            '   FROM TUSUARIO (NOLOCK)         '+
            '  WHERE CD_USUARIO = '''+ datm_usuario.qry_usuario_CD_USUARIO.AsString  +''' ');
    Prepare;
    ExecSql;
    UsuarioAlterado := RowsAffected;
    Free;
  end;
  if UsuarioAlterado > 0 then
  begin
    btnDesbloquearUsuario.visible :=true;
    btnBloquearUsuario.visible    :=false;
  end
  else
    ShowMessage('Erro ao bloquear o usuario.');
end;


function Tfrm_usuario.ValidaCaracteresSenha(const s: AnsiString; tipoValida : string): Boolean;
var
  i: integer;
  achou : Boolean;
begin
  achou := false;
  for i := 1 to Length(s) do
  begin
    case s[i] of
      'A'..'Z':begin
                  if tipoValida = 'Upper' then
                    achou := true
               end;

      'a'..'z': begin
                  if tipoValida = 'Lower' then
                    achou := true
                end;

      '0'..'9': begin
                  if tipoValida = 'Numero' then
                    achou := true;
                end;

      '[', ']', '!', '@',
      '#', '$', '%', '^',
      '&', '*', '(', ')',
      '_', '+', '-', '=',
      '{', '}', ';', '''',
      ':', '"', '\', '/',
      '|', ',', '<', '>',
      '.', '?' : begin
                   if tipoValida = 'Especial' then
                    achou := true;
                 end;
    end;
    
    if achou then
      break;
  end;

  Result := achou;
end;

end.
