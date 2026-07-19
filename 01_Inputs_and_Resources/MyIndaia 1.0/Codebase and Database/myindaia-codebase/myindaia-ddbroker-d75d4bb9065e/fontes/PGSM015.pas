unit PGSM015;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, DBCGrids, Funcoes;

type
  Tfrm_cargo = class(TForm)
    pgctrl_cargo: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    ts_controle_acesso: TTabSheet;
    dbctrlg_modulo: TDBCtrlGrid;
    dbtxt_nome_modulo: TDBText;
    dbchkbox_in_ativo: TDBCheckBox;
    dbctrlg_rotina: TDBCtrlGrid;
    dbtxt_nome_rotina: TDBText;
    dbchkbox_in_acesso: TDBCheckBox;
    dbchkbox_in_incluir: TDBCheckBox;
    dbchkbox_in_modificar: TDBCheckBox;
    dbchkbox_in_excluir: TDBCheckBox;
    pnl_modulo_rotina: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    Label4: TLabel;
    dbedt_cd_cargo_pai: TDBEdit;
    dbedt_nm_cargo_pai: TDBEdit;
    lbl_usuatio_ativo: TLabel;
    dblkpcbox_ativo: TDBLookupComboBox;
    Label6: TLabel;
    Label7: TLabel;
    dbedt_cd_cargo: TDBEdit;
    dbedt_nm_cargo: TDBEdit;
    dbg_cargo_lista: TDBGrid;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    Label1: TLabel;
    edt_chave: TEdit;
    Label2: TLabel;
    cb_ordem: TComboBox;
    dbchkSelecionado: TDBCheckBox;
    dbchkTipoHelpDesk: TDBCheckBox;
    ts_DocumentosDigitalizados: TTabSheet;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    dbctrlgrdTabelasDigitalizacao: TDBCtrlGrid;
    dbctrlgrdDocumentosDigitalizacao: TDBCtrlGrid;
    dbtxt_NomeTabela: TDBText;
    dbedt_NomeTipoDocumento: TDBText;
    dbchkVisualizacao: TDBCheckBox;
    dbchkAlteracao: TDBCheckBox;
    btnMarcarVisualizar: TSpeedButton;
    btnMarcarAlterar: TSpeedButton;
    btnCopiarAcesso: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    btn_NovaTabela: TSpeedButton;
    btn_NovoTipoDocumento: TSpeedButton;
    pm_duplica_acesso_sistema: TPopupMenu;
    mi_recebe_configuracao: TMenuItem;
    mi_envia_configuracao: TMenuItem;
    ts_controle_acesso_novo: TTabSheet;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBCtrlGrid4: TDBCtrlGrid;
    DBText4: TDBText;
    DBCtrlGrid5: TDBCtrlGrid;
    DBText5: TDBText;
    DBCtrlGrid6: TDBCtrlGrid;
    DBText6: TDBText;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    pnl_duplica: TPanel;
    pnl_duplica_cargo: TPanel;
    Shape3: TShape;
    Shape4: TShape;
    lbl_duplica: TLabel;
    Shape2: TShape;
    lblFechar: TLabel;
    btnCoProcesso: TSpeedButton;
    Label12: TLabel;
    Button1: TButton;
    edt_cd_cargo_duplica: TEdit;
    edt_cargo_duplica: TEdit;
    SpeedButton1: TSpeedButton;
    pm_duplica_acesso_modulo: TPopupMenu;
    ReceberConfiguraesdeAcesso1: TMenuItem;
    EnviarConfiguraesdeAcesso1: TMenuItem;
    dbchkCargoInterno: TDBCheckBox;
    dbchkDashWeb: TDBCheckBox;
    dbchkIN_LIBERA_TRANSMISSAO_DI: TDBCheckBox;
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure dbchkbox_in_ativoClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure pgctrl_cargoChange(Sender: TObject);
    procedure pgctrl_cargoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbedt_nm_cargoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure dbctrlg_moduloExit(Sender: TObject);
    procedure dbchkbox_in_acessoClick(Sender: TObject);
    procedure dbchkbox_in_incluirClick(Sender: TObject);
    procedure dbchkbox_in_modificarClick(Sender: TObject);
    procedure dbchkbox_in_excluirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ts_DocumentosDigitalizadosShow(Sender: TObject);
    procedure btnMarcarVisualizarClick(Sender: TObject);
    procedure btnMarcarAlterarClick(Sender: TObject);
    procedure dbchkVisualizacaoClick(Sender: TObject);
    procedure dbchkAlteracaoClick(Sender: TObject);
    procedure btnCopiarAcessoClick(Sender: TObject);
    procedure btn_NovaTabelaClick(Sender: TObject);
    procedure btn_NovoTipoDocumentoClick(Sender: TObject);
    procedure DBCtrlGrid1Exit(Sender: TObject);
    procedure btnCoProcessoClick(Sender: TObject);
    procedure edt_cd_cargo_duplicaChange(Sender: TObject);
    procedure mi_recebe_configuracaoClick(Sender: TObject);
    procedure mi_envia_configuracaoClick(Sender: TObject);
    procedure lblFecharClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBCtrlGrid1Click(Sender: TObject);
    procedure DBCtrlGrid2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBCtrlGrid6Exit(Sender: TObject);
    procedure DBCheckBox12Click(Sender: TObject);
    procedure DBCheckBox11Click(Sender: TObject);
    procedure ReceberConfiguraesdeAcesso1Click(Sender: TObject);
    procedure EnviarConfiguraesdeAcesso1Click(Sender: TObject);
  private
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar : boolean;
    st_incluir   : boolean;
    st_excluir   : boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerALt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
    in_recebe,vSistema_Modulo,VCOPIAMODULO : string;
  end;

var
  frm_cargo: Tfrm_cargo;

implementation

uses gsmlib, PGGP001, PGGP017, PGSM053, ConsOnlineEx;

{$R *.DFM}

procedure Tfrm_cargo.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_cargo.qry_cargo_CD_CARGO.AsString;
    except
      try
         Cons_Online_Texto := datm_cargo.qry_cargo_CD_CARGO.AsString;
      except
         BoxMensagem('Não foi possível retornar o Código do Cargo!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_cargo.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_cargo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
  begin
    if pgctrl_cargo.ActivePage = ts_dados_basicos Then
      if btn_Salvar.Enabled Then
         btn_SalvarClick(Sender)
      else
         Cancelar;
    if pgctrl_cargo.ActivePage = ts_lista Then
      pgctrl_cargo.ActivePage := ts_dados_basicos;
  end;
end;

procedure Tfrm_cargo.FormCreate(Sender: TObject);
begin
  { Cria o DataModule de controle acesso }

  Application.CreateForm(Tdatm_cargo, datm_cargo );

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
//  ts_controle_acesso.TabVisible := lControleAcesso;
  ts_controle_acesso.TabVisible := True;

  with datm_cargo do
  begin
    qry_cargo_lista_.Close;
    qry_cargo_lista_.ParamByName('CD_CARGO').AsString := str_cd_cargo;
    qry_cargo_lista_.SQL[7] := 'NM_CARGO';
    qry_cargo_lista_.Prepare;
    qry_cargo_lista_.Open;

    qry_cargo_.Close;
    qry_cargo_.Prepare;
    qry_cargo_.Open;

    qry_cargo_modulo_.Close;
    qry_cargo_modulo_.Prepare;
    qry_cargo_modulo_.Open;

    qry_controle_acesso_.Close;
    qry_controle_acesso_.Prepare;
    qry_controle_acesso_.Open;

    qry_controle_acesso_sistema.Close;
    qry_controle_acesso_sistema.Prepare;
    qry_controle_acesso_sistema.Open;

    qry_controle_acesso_modulo.Close;
    qry_controle_acesso_modulo.Prepare;
    qry_controle_acesso_modulo.Open;

    qry_controle_acesso_rotina.Close;
    qry_controle_acesso_rotina.Prepare;
    qry_controle_acesso_rotina.Open;

  end;

  a_str_indices[0] := 'CD_CARGO';
  a_str_indices[1] := 'NM_CARGO';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;

  datm_cargo.ds_cargo.AutoEdit            := st_modificar;
  datm_cargo.ds_cargo_modulo.AutoEdit     := st_modificar;

  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;
end;

procedure Tfrm_cargo.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_cargo.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_cargo.Cancelar;
begin
  if (pgctrl_cargo.ActivePage=ts_lista) or (pgctrl_cargo.ActivePage=ts_dados_basicos) then
  begin
    try
      if datm_cargo.qry_cargo_.State in [dsInsert, dsEdit] then
      begin
        datm_cargo.qry_cargo_.Cancel;
        pgctrl_cargo.ActivePage := ts_dados_basicos;
        dbedt_nm_cargo.SetFocus;
      end;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_cargo.dbchkbox_in_ativoClick(Sender: TObject);
begin
  with datm_cargo do
  begin
    if ( qry_cargo_modulo_.State in [dsedit] ) and
       ( str_cd_cargo <> '001' ) then
    begin
      qry_cargo_modulo_p_.Close;
      qry_cargo_modulo_p_.ParamByName('CD_CARGO').AsString := str_cd_cargo;
      qry_cargo_modulo_p_.ParamByName('CD_MODULO').AsString := qry_cargo_modulo_CD_MODULO.AsString;
      qry_cargo_modulo_p_.Prepare;
      qry_cargo_modulo_p_.Open;
      if ( Not qry_cargo_modulo_p_IN_ATIVO.AsBoolean ) and
         ( dbchkbox_in_ativo.Checked ) then
      begin
        dbchkbox_in_ativo.Checked := False;
        qry_cargo_modulo_IN_ATIVO.AsBoolean := False;
        BoxMensagem( 'Não pode habilitar este módulo', 2 )
      end;
    end;
  end;
end;

procedure Tfrm_cargo.cb_ordemClick(Sender: TObject);
begin
  with datm_cargo do
  begin
    Pesquisa := qry_cargo_modulo_CD_CARGO.AsString;
    { Apaga o campo de pesquisa }
    edt_chave.Text := '';
    qry_cargo_lista_.Close;
    qry_cargo_lista_.ParamByName('CD_CARGO').AsString := str_cd_cargo;
    qry_cargo_lista_.SQL[7] := a_str_indices[cb_ordem.ItemIndex];
    qry_cargo_lista_.Prepare;
    qry_cargo_lista_.Open;
    Localiza(qry_cargo_lista_, Pesquisa, a_str_indices[0] );
  end;
  pgctrl_cargo.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_cargo.edt_chaveChange(Sender: TObject);
begin
   Localiza(datm_cargo.qry_cargo_lista_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_cargo.FormShow(Sender: TObject);
begin
  pgctrl_cargo.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_cargo.btn_incluirClick(Sender: TObject);
begin
  if (pgctrl_cargo.ActivePage=ts_lista) or (pgctrl_cargo.ActivePage=ts_dados_basicos) then
  begin
    with datm_cargo do
    begin
      qry_cargo_.DisableControls;
      qry_cargo_.Cancel;
      qry_cargo_.Append;
      qry_cargo_.EnableControls;
      qry_cargo_CD_CARGO.AsString  := UltCod( qry_ult_cargo_, qry_ult_cargo_ULTIMO);
      qry_cargo_CD_CARGO_PAI.AsString  := str_cd_cargo;
      qry_cargo_IN_ATIVO.AsString  := '1';
    end;
    pgctrl_cargo.ActivePage := ts_dados_basicos;
    dbedt_nm_cargo.SetFocus;
  end;

  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  dbnvg.Enabled := False;
  edt_chave.Enabled := False;
  cb_ordem.Enabled := False;
end;

function Tfrm_cargo.Grava : Boolean;
var
insert : boolean;
begin
  insert := false;
  Grava := False;
  if (pgctrl_cargo.ActivePage=ts_lista) or (pgctrl_cargo.ActivePage=ts_dados_basicos) then
  begin
    Pesquisa := datm_cargo.qry_cargo_CD_CARGO.AsString;
    try
      datm_main.db_broker.StartTransaction;
      if datm_cargo.qry_cargo_.State = dsInsert then insert := true;
      if ( datm_cargo.qry_cargo_.State in [dsInsert, dsEdit] ) then
      begin
        datm_cargo.qry_cargo_.Post;
      end;

      CloseStoredProc(datm_cargo.sp_atz_cargo_desc);
      ExecStoredProc(datm_cargo.sp_atz_cargo_desc);
      CloseStoredProc(datm_cargo.sp_atz_cargo_desc);
      if insert then
      begin
        CloseStoredProc(datm_cargo.sp_atz_controle_acesso);
        ExecStoredProc(datm_cargo.sp_atz_controle_acesso);
        CloseStoredProc(datm_cargo.sp_atz_controle_acesso);

        // Controle de acesso a digitalizacao
        CloseStoredProc(datm_cargo.sp_atz_controle_acesso_digitalizacao);
        datm_cargo.sp_atz_controle_acesso_digitalizacao.ParamByName('@CD_CARGO').AsString := 'XXX';
        ExecStoredProc(datm_cargo.sp_atz_controle_acesso_digitalizacao);
        CloseStoredProc(datm_cargo.sp_atz_controle_acesso_digitalizacao);
      end;

      datm_main.db_broker.Commit;

      datm_cargo.qry_cargo_lista_.Close;
      datm_cargo.qry_cargo_lista_.Open;

      datm_cargo.qry_vw_cargo_.Close;
      datm_cargo.qry_vw_cargo_.Open;

      Localiza(datm_cargo.qry_cargo_lista_, Pesquisa, a_str_indices[0] );

      Grava:=True;
    except
      on E: Exception do
      begin
        datm_cargo.qry_cargo_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_cargo.Consiste : Boolean;
begin
  if (pgctrl_cargo.ActivePage=ts_lista) or (pgctrl_cargo.ActivePage=ts_dados_basicos) then
  begin
    if dbedt_nm_cargo.Text = '' then
    begin
      BoxMensagem('Campo ''Descrição'' deve ser preenchido!', 2);
      pgctrl_cargo.ActivePage := ts_dados_basicos;
      dbedt_nm_cargo.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;
  Consiste := True;
end;

procedure Tfrm_cargo.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_cargo.pgctrl_cargoChange(Sender: TObject);
begin
  if (pgctrl_cargo.ActivePage = ts_lista) or
     (pgctrl_cargo.ActivePage = ts_dados_basicos) then
  begin
    dbnvg.DataSource := datm_cargo.ds_cargo_lista;
    if str_cd_rotina <> '2401' then
    begin
      vStr_cd_modulo := '24';
      str_cd_rotina := '2401';
      str_cd_mod    := vStr_cd_modulo;
      str_cd_rot    := str_cd_rotina;
    end;
  end
  else
  begin
    dbnvg.DataSource := datm_cargo.ds_controle_acesso;
    vStr_cd_modulo := '24';
    str_cd_rotina := '2496';
    str_cd_mod    := vStr_cd_modulo;
    str_cd_rot    := str_cd_rotina;
  end;
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  if (pgctrl_cargo.ActivePage = ts_lista ) then
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

  if (pgctrl_cargo.ActivePage = ts_controle_acesso ) then
  begin
    datm_cargo.ds_cargo_modulo.AutoEdit    := st_modificar;
    datm_cargo.ds_controle_acesso.AutoEdit := st_modificar;
  end;

end;

procedure Tfrm_cargo.pgctrl_cargoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_cargo.dbedt_nm_cargoChange(Sender: TObject);
begin
  if ( datm_cargo.qry_cargo_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_cargo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_cargo do
    begin
      qry_cargo_lista_.Close;
      qry_cargo_.Close;
      qry_cargo_modulo_.Close;
      qry_controle_acesso_.Close;
      qry_tipos_documento_.Close;
      qry_acesso_documento_.Close;
      qry_tabelas_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

function Tfrm_cargo.VerAlt : Boolean;
begin
  VerAlt := True;
  if (pgctrl_cargo.ActivePage=ts_dados_basicos) or (pgctrl_cargo.ActivePage=ts_lista) then
  begin
    if ( datm_cargo.qry_cargo_.State in [dsInsert, dsEdit] ) then
    begin
      if BoxMensagem('Cadastro de Cargo foi alterado.' + #13#10 +'Deseja salvar as alterações?', 1) then
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

procedure Tfrm_cargo.btn_sairClick(Sender: TObject);
begin
  if datm_cargo.qry_cargo_modulo_.State in [dsedit] then
     datm_cargo.qry_cargo_modulo_.Post;
  if datm_cargo.qry_controle_acesso_.State in [dsedit] then
     datm_cargo.qry_controle_acesso_.Post;
  Close;
end;

procedure Tfrm_cargo.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este Cargo será excluído! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_cargo.qry_cargo_.Delete;
    CloseStoredProc(datm_cargo.sp_atz_controle_acesso);
    ExecStoredProc(datm_cargo.sp_atz_controle_acesso);
    CloseStoredProc(datm_cargo.sp_atz_controle_acesso);

    // Controle de acesso a digitalizacao
    CloseStoredProc(datm_cargo.sp_atz_controle_acesso_digitalizacao);
    datm_cargo.sp_atz_controle_acesso_digitalizacao.ParamByName('@CD_CARGO').AsString := 'XXX';
    ExecStoredProc(datm_cargo.sp_atz_controle_acesso_digitalizacao);
    CloseStoredProc(datm_cargo.sp_atz_controle_acesso_digitalizacao);

    datm_main.db_broker.Commit;
    datm_cargo.qry_cargo_lista_.Close;
    datm_cargo.qry_cargo_lista_.Open;
    datm_cargo.qry_vw_cargo_.Close;
    datm_cargo.qry_vw_cargo_.Open;
  except
    on E: Exception do
    begin
      datm_cargo.qry_cargo_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
end;

procedure Tfrm_cargo.dbctrlg_moduloExit(Sender: TObject);
begin
  if datm_cargo.qry_cargo_modulo_.State in [dsedit] then
     datm_cargo.qry_cargo_modulo_.Post;

end;

procedure Tfrm_cargo.dbchkbox_in_acessoClick(Sender: TObject);
begin
  with datm_cargo do
  begin
    if ( qry_controle_acesso_.State in [dsedit] ) and
       ( str_cd_cargo <> '001' ) then
    begin
      qry_controle_acesso_p_.Close;
      qry_controle_acesso_p_.ParamByName('CD_CARGO').AsString  := str_cd_cargo;
      qry_controle_acesso_p_.ParamByName('CD_MODULO').AsString := qry_controle_acesso_CD_MODULO.AsString;
      qry_controle_acesso_p_.ParamByName('CD_ROTINA').AsString := qry_controle_acesso_CD_ROTINA.AsString;
      qry_controle_acesso_p_.Prepare;
      qry_controle_acesso_p_.Open;
      if ( Not qry_controle_acesso_p_IN_ACESSO.AsBoolean ) and
         ( dbchkbox_in_acesso.Checked ) then
      begin
        dbchkbox_in_acesso.Checked := False;
        qry_controle_acesso_IN_ACESSO.AsBoolean := False;
        BoxMensagem( 'Não pode habilitar o acesso a esta Rotina', 2 )
      end;
    end;
  end;
end;

procedure Tfrm_cargo.dbchkbox_in_incluirClick(Sender: TObject);
begin
  with datm_cargo do
  begin
    if ( qry_controle_acesso_.State in [dsedit] ) and
       ( str_cd_cargo <> '001' ) then
    begin
      qry_controle_acesso_p_.Close;
      qry_controle_acesso_p_.ParamByName('CD_CARGO').AsString := str_cd_cargo;
      qry_controle_acesso_p_.ParamByName('CD_MODULO').AsString := qry_controle_acesso_CD_MODULO.AsString;
      qry_controle_acesso_p_.ParamByName('CD_ROTINA').AsString := qry_controle_acesso_CD_ROTINA.AsString;
      qry_controle_acesso_p_.Prepare;
      qry_controle_acesso_p_.Open;
      if ( Not qry_controle_acesso_p_IN_INCLUIR.AsBoolean ) and
         ( dbchkbox_in_incluir.Checked ) then
      begin
        dbchkbox_in_incluir.Checked := False;
        qry_controle_acesso_IN_INCLUIR.AsBoolean := False;
        BoxMensagem( 'Não pode habilitar a inclusão para esta Rotina', 2 )
      end;
    end;
  end;
end;

procedure Tfrm_cargo.dbchkbox_in_modificarClick(Sender: TObject);
begin
  with datm_cargo do
  begin
    if ( qry_controle_acesso_.State in [dsedit] ) and
       ( str_cd_cargo <> '001' ) then
    begin
      qry_controle_acesso_p_.Close;
      qry_controle_acesso_p_.ParamByName('CD_CARGO').AsString := str_cd_cargo;
      qry_controle_acesso_p_.ParamByName('CD_MODULO').AsString := qry_controle_acesso_CD_MODULO.AsString;
      qry_controle_acesso_p_.ParamByName('CD_ROTINA').AsString := qry_controle_acesso_CD_ROTINA.AsString;
      qry_controle_acesso_p_.Prepare;
      qry_controle_acesso_p_.Open;
      if ( Not qry_controle_acesso_p_IN_MODifICAR.AsBoolean ) and
         ( dbchkbox_in_modificar.Checked ) then
      begin
        dbchkbox_in_modificar.Checked := False;
        qry_controle_acesso_IN_MODifICAR.AsBoolean := False;
        BoxMensagem( 'Não pode habilitar a alteração para esta Rotina', 2 )
      end;
    end;
  end;
end;

procedure Tfrm_cargo.dbchkbox_in_excluirClick(Sender: TObject);
begin
  with datm_cargo do
  begin
    if ( qry_controle_acesso_.State in [dsedit] ) and
       ( str_cd_cargo <> '001' ) then
    begin
      qry_controle_acesso_p_.Close;
      qry_controle_acesso_p_.ParamByName('CD_CARGO').AsString := str_cd_cargo;
      qry_controle_acesso_p_.ParamByName('CD_MODULO').AsString := qry_controle_acesso_CD_MODULO.AsString;
      qry_controle_acesso_p_.ParamByName('CD_ROTINA').AsString := qry_controle_acesso_CD_ROTINA.AsString;
      qry_controle_acesso_p_.Prepare;
      qry_controle_acesso_p_.Open;
      if ( Not qry_controle_acesso_p_IN_EXCLUIR.AsBoolean ) and
         ( dbchkbox_in_excluir.Checked ) then
      begin
        dbchkbox_in_excluir.Checked := False;
        qry_controle_acesso_IN_EXCLUIR.AsBoolean := False;
        BoxMensagem( 'Não pode habilitar a exclusão para esta Rotina', 2 )
      end;
    end;
  end;
end;

procedure Tfrm_cargo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_cargo.ts_DocumentosDigitalizadosShow(Sender: TObject);
begin
  if datm_cargo.qry_tipos_documento_.Active then
    datm_cargo.qry_tipos_documento_.Close;
  datm_cargo.qry_tipos_documento_.Open;
  if datm_cargo.qry_tabelas_.Active then
    datm_cargo.qry_tabelas_.Close;
  datm_cargo.qry_tabelas_.Open;
  if datm_cargo.qry_acesso_documento_.Active then
    datm_cargo.qry_acesso_documento_.Close;
  datm_cargo.qry_acesso_documento_.Open;
end;

procedure Tfrm_cargo.btnMarcarVisualizarClick(Sender: TObject);
var
  Tipo: Integer;
begin
  if str_cd_cargo <> '001' then
  begin
    datm_cargo.qry_acesso_documento_IN_VISUALIZACAO.AsString := '0';
    MessageDlg('Você não tem permissão para efetuar esta operação.'#13'Solicite ao TI.', mtInformation, [mbOk], 0);
  end
  else
  begin
    Tipo := datm_cargo.qry_acesso_documento_CD_TIPO_DOCTO.AsInteger;
    datm_cargo.qry_acesso_documento_.First;
    while not datm_cargo.qry_acesso_documento_.Eof do
    begin
      if datm_cargo.qry_acesso_documento_IN_VISUALIZACAO.AsString <> '1' then
      begin
        datm_cargo.qry_acesso_documento_.Edit;
        datm_cargo.qry_acesso_documento_IN_VISUALIZACAO.AsString := '1';
      end;
      datm_cargo.qry_acesso_documento_.Next;
    end;
    datm_cargo.qry_acesso_documento_.Locate('CD_TIPO_DOCTO', Tipo, []);
  end;
end;

procedure Tfrm_cargo.btnMarcarAlterarClick(Sender: TObject);
var
  Tipo: Integer;
begin
  if str_cd_cargo <> '001' then
  begin
    datm_cargo.qry_acesso_documento_IN_VISUALIZACAO.AsString := '0';
    MessageDlg('Você não tem permissão para efetuar esta operação.'#13'Solicite ao TI.', mtInformation, [mbOk], 0);
  end
  else
  begin
    Tipo := datm_cargo.qry_acesso_documento_CD_TIPO_DOCTO.AsInteger;
    datm_cargo.qry_acesso_documento_.First;
    while not datm_cargo.qry_acesso_documento_.Eof do
    begin
      if datm_cargo.qry_acesso_documento_IN_ALTERACAO.AsString <> '1' then
      begin
        datm_cargo.qry_acesso_documento_.Edit;
        datm_cargo.qry_acesso_documento_IN_ALTERACAO.AsString := '1';
      end;
      datm_cargo.qry_acesso_documento_.Next;
    end;
    datm_cargo.qry_acesso_documento_.Locate('CD_TIPO_DOCTO', Tipo, []);
  end;
end;

procedure Tfrm_cargo.dbchkVisualizacaoClick(Sender: TObject);
begin
  if str_cd_cargo <> '001' then
  begin
    datm_cargo.qry_acesso_documento_IN_VISUALIZACAO.AsString := '0';
    MessageDlg('Você não tem permissão para efetuar esta operação.'#13'Solicite ao TI.', mtInformation, [mbOk], 0);
  end;
end;

procedure Tfrm_cargo.dbchkAlteracaoClick(Sender: TObject);
begin
  if str_cd_cargo <> '001' then
  begin
    datm_cargo.qry_acesso_documento_IN_ALTERACAO.AsString := '0';
    MessageDlg('Você não tem permissão para efetuar esta operação.'#13'Solicite ao TI.', mtInformation, [mbOk], 0);
  end;
end;

procedure Tfrm_cargo.btnCopiarAcessoClick(Sender: TObject);
var
  CargoOrigem: String;
begin
  if str_cd_cargo <> '001' then
  begin
    MessageDlg('Você não tem permissão para efetuar esta operação.'#13'Solicite ao TI.', mtInformation, [mbOk], 0);
    Exit;
  end;
  CargoOrigem := ConsultaOnLineExFiltro('TCARGO', 'Selecione o cargo do qual deseja copiar o acesso',
     ['CD_CARGO', 'NM_CARGO'], ['Código', 'Nome'], 'CD_CARGO', 'IN_ATIVO = "1" AND CD_CARGO <> "' +
        datm_Cargo.qry_cargo_lista_CD_CARGO.AsString + '"', nil);
  if CargoOrigem <> '' then
  begin
    datm_cargo.sp_copia_acesso_digitalizacao.Close;
    datm_Cargo.sp_copia_acesso_digitalizacao.ParamByName('@CD_CARGO_ORIGEM').AsString  := CargoOrigem;
    datm_Cargo.sp_copia_acesso_digitalizacao.ParamByName('@CD_CARGO_DESTINO').AsString := datm_Cargo.qry_cargo_lista_CD_CARGO.AsString;
    datm_Cargo.sp_copia_acesso_digitalizacao.ExecProc;
    datm_Cargo.sp_copia_acesso_digitalizacao.Close;
    datm_cargo.qry_tipos_documento_.Close;
    datm_cargo.qry_tabelas_.Close;
    datm_cargo.qry_tabelas_.Open;
    datm_cargo.qry_tipos_documento_.Open;
    datm_cargo.qry_acesso_documento_.Open;
  end;
end;

procedure Tfrm_cargo.btn_NovaTabelaClick(Sender: TObject);
begin
  if str_cd_cargo <> '001' then
  begin
    MessageDlg('Você não tem permissão para efetuar esta operação.'#13'Solicite ao TI.', mtInformation, [mbOk], 0);
    Exit;
  end;
end;

procedure Tfrm_cargo.btn_NovoTipoDocumentoClick(Sender: TObject);
begin
  if str_cd_cargo <> '001' then
  begin
    MessageDlg('Você não tem permissão para efetuar esta operação.'#13'Solicite ao TI.', mtInformation, [mbOk], 0);
    Exit;
  end;
end;

procedure Tfrm_cargo.DBCtrlGrid1Exit(Sender: TObject);
begin
   if datm_cargo.qry_controle_acesso_sistema.State in [dsedit] then
     datm_cargo.qry_controle_acesso_sistema.Post;
end;

procedure Tfrm_cargo.btnCoProcessoClick(Sender: TObject);
begin
  edt_cd_cargo_duplica.Text :=ConsultaOnLineExSQL('select CD_CARGO,NM_CARGO from TCARGO','CARGO',['CD_CARGO','NM_CARGO'],['Cód.','Cargo'],'CD_CARGO',nil,edt_cd_cargo_duplica.Text);
end;

procedure Tfrm_cargo.edt_cd_cargo_duplicaChange(Sender: TObject);
begin
edt_cargo_duplica.Text:= ConsultaLookUPSQL('SELECT NM_CARGO FROM TCARGO WHERE CD_CARGO ='''+ edt_cd_cargo_duplica.Text +'''','NM_CARGO');
end;

procedure Tfrm_cargo.mi_recebe_configuracaoClick(Sender: TObject);
begin
 in_recebe := '1';
 VCOPIAMODULO := '0';
 pnl_duplica.Visible:=true;
 lbl_duplica.Caption:= 'Escolha o Cargo para receber as configurações de Acesso:';
end;

procedure Tfrm_cargo.mi_envia_configuracaoClick(Sender: TObject);
begin
  in_recebe := '0';
  VCOPIAMODULO := '0';
  pnl_duplica.Visible:=true;
  lbl_duplica.Caption:= 'Escolha o Cargo para enviar as configurações de Acesso:';
end;

procedure Tfrm_cargo.lblFecharClick(Sender: TObject);
begin
  edt_cargo_duplica.Clear;
  edt_cd_cargo_duplica.Clear;
  pnl_duplica.Visible := False;
end;

procedure Tfrm_cargo.Button1Click(Sender: TObject);
var
  Localiza,Localiza2:string;
begin
   datm_cargo.sp_copia_controle_acesso_novo.Close;
   if VCOPIAMODULO <> '1' then
    Localiza := datm_cargo.qry_controle_acesso_sistemaCD_SISTEMA.AsString
   else
   begin
    Localiza := datm_cargo.qry_controle_acesso_moduloCD_modulo.AsString;
    Localiza2 := datm_cargo.qry_controle_acesso_sistemaCD_SISTEMA.AsString
   end;
   //Verifica se as configurações irão ser recebidas ou enviadas desse cargo
   if in_recebe='0' then
   begin
    datm_Cargo.sp_copia_controle_acesso_novo.ParamByName('@CD_CARGO_ORIGEM').AsString  := edt_cd_cargo_duplica.Text;
    datm_Cargo.sp_copia_controle_acesso_novo.ParamByName('@CD_CARGO_DESTINO').AsString := datm_cargo.qry_cargo_CD_CARGO.AsString;
    datm_Cargo.sp_copia_controle_acesso_novo.ParamByName('@CD_SISTEMA').AsString := datm_cargo.qry_controle_acesso_sistemaCD_SISTEMA.AsString;
    datm_Cargo.sp_copia_controle_acesso_novo.ParamByName('@CD_MODULO').AsString := datm_cargo.qry_controle_acesso_moduloCD_MODULO.AsString;
    datm_Cargo.sp_copia_controle_acesso_novo.ParamByName('@VCOPIAMODULO').AsString := VCOPIAMODULO;
   end
   else
   begin
    datm_Cargo.sp_copia_controle_acesso_novo.ParamByName('@CD_CARGO_ORIGEM').AsString  :=  datm_cargo.qry_cargo_CD_CARGO.AsString;
    datm_Cargo.sp_copia_controle_acesso_novo.ParamByName('@CD_CARGO_DESTINO').AsString := edt_cd_cargo_duplica.Text;
    datm_Cargo.sp_copia_controle_acesso_novo.ParamByName('@CD_SISTEMA').AsString := datm_cargo.qry_controle_acesso_sistemaCD_SISTEMA.AsString;
    datm_Cargo.sp_copia_controle_acesso_novo.ParamByName('@CD_MODULO').AsString := datm_cargo.qry_controle_acesso_moduloCD_MODULO.AsString;
    datm_Cargo.sp_copia_controle_acesso_novo.ParamByName('@VCOPIAMODULO').AsString :=VCOPIAMODULO;
   end;
   datm_Cargo.sp_copia_controle_acesso_novo.ExecProc;

   datm_Cargo.sp_copia_controle_acesso_novo.Close;
   datm_cargo.qry_controle_acesso_sistema.Close;
   datm_cargo.qry_controle_acesso_modulo.Close;
   datm_cargo.qry_controle_acesso_rotina.Close;
   datm_cargo.qry_controle_acesso_sistema.Open;
   datm_cargo.qry_controle_acesso_modulo.Open;
   datm_cargo.qry_controle_acesso_rotina.Open;

   If Localiza <> '' then
   begin
    if VCOPIAMODULO <> '1' then
    begin
      datm_cargo.qry_controle_acesso_sistema.Locate('CD_SISTEMA',Localiza, [loCaseInsensitive])
    end
    else
    begin
      datm_cargo.qry_controle_acesso_sistema.Locate('CD_SISTEMA',Localiza2, [loCaseInsensitive]);
      datm_cargo.qry_controle_acesso_modulo.Locate('CD_MODULO',Localiza, [loCaseInsensitive]);
    end;
   end;

   edt_cd_cargo_duplica.Clear;
   edt_cargo_duplica.Clear;
   pnl_duplica.Visible:=false;
end;

procedure Tfrm_cargo.DBCtrlGrid1Click(Sender: TObject);
begin
  vSistema_Modulo:='1';
end;

procedure Tfrm_cargo.DBCtrlGrid2Click(Sender: TObject);
begin
  vSistema_Modulo:='0';
end;

procedure Tfrm_cargo.SpeedButton1Click(Sender: TObject);
var
  vSistema,vRotina:string;
begin
  vSistema:=ConsultaOnLineExFiltro('MYLOGIN.dbo.TB_SISTEMA', 'Sistema',['CD_SISTEMA', 'NM_SISTEMA'],
                                                           ['Código', 'Descrição'], 'CD_SISTEMA',
                                                           'CD_SISTEMA not in (select DISTINCT CD_SISTEMA from MYLOGIN.dbo.TB_CONTROLE_ACESSO where CD_CARGO = CONVERT(INT,'''+ datm_cargo.qry_cargo_CD_CARGO.AsString +''')) ' , nil);

  if vSistema <> '' then
  begin
    vRotina := ConsultaLookUPSQL('SELECT COUNT (*) as qtd FROM MYLOGIN.dbo.TB_ROTINA WHERE CD_SISTEMA = '''+ vSistema +''' ','qtd');
    if vRotina <> '0' then
    begin
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.ADD('INSERT INTO [MYLOGIN].[dbo].TB_CONTROLE_ACESSO (CD_SISTEMA,CD_MODULO,CD_ROTINA,CD_CARGO,IN_ATIVO,IN_VISIVEL)');
        SQL.ADD('select CD_SISTEMA,CD_MODULO,CD_ROTINA,'''+ datm_cargo.qry_cargo_CD_CARGO.AsString +''',''0'',''0''          ');
        SQL.ADD('from [MYLOGIN].[dbo].TB_ROTINA                                                                              ');
        SQL.ADD('where CD_SISTEMA='''+ vSistema +'''                                                                         ');
        ExecSql;

        SQL.Clear;
        SQL.ADD('INSERT INTO [MYLOGIN].[dbo].TB_CARGO_SISTEMA (CD_SISTEMA,CD_CARGO,IN_ATIVO)                                 ');
        SQL.ADD('select distinct CD_SISTEMA,'''+ datm_cargo.qry_cargo_CD_CARGO.AsString +''',''1''                           ');
        SQL.ADD('from [MYLOGIN].[dbo].TB_ROTINA                                                                              ');
        SQL.ADD('where CD_SISTEMA='''+ vSistema +'''                                                                         ');
        ExecSql;
        Free;
        datm_cargo.qry_controle_acesso_sistema.Close;
        datm_cargo.qry_controle_acesso_modulo.Close;
        datm_cargo.qry_controle_acesso_rotina.Close;
        datm_cargo.qry_controle_acesso_sistema.Open;
        datm_cargo.qry_controle_acesso_modulo.Open;
        datm_cargo.qry_controle_acesso_rotina.Open;
      end;
    end
    else
    showmessage('Não existe rotinas cadastradas para esse Sistema!');
  end;
end;

procedure Tfrm_cargo.DBCtrlGrid6Exit(Sender: TObject);
begin
   if datm_cargo.qry_controle_acesso_rotina.State in [dsedit] then
     datm_cargo.qry_controle_acesso_rotina.Post;

end;

procedure Tfrm_cargo.DBCheckBox12Click(Sender: TObject);
var
  Localiza: string;
begin
 if datm_cargo.qry_controle_acesso_rotina.State in [dsedit] then
 begin
  Localiza:= datm_cargo.qry_controle_acesso_rotinaCD_ROTINA.AsString;
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.ADD('update [MYLOGIN].[dbo].TB_CONTROLE_ACESSO ');
    if DBCheckBox12.Checked then
      SQL.ADD('set in_ativo=''1''                        ')
    else
      SQL.ADD('set in_ativo=''0''                        ');
    SQL.ADD('where CD_SISTEMA= convert(int,'''+ datm_cargo.qry_controle_acesso_rotinaCD_sistema.AsString +''')   and    ');
    SQL.ADD(' CD_modulo=convert(int,'''+ datm_cargo.qry_controle_acesso_rotinaCD_MODULO.AsString +''')           and    ');
    SQL.ADD(' CD_rotina=convert(int,'''+ datm_cargo.qry_controle_acesso_rotinaCD_ROTINA.AsString +''')           and    ');
    SQL.ADD(' CD_cargo=convert(int,'''+ datm_cargo.qry_controle_acesso_rotinaCD_cargo.AsString +''')                    ');
    ExecSql;
    Free;
    datm_cargo.qry_controle_acesso_rotina.Close;
    datm_cargo.qry_controle_acesso_rotina.Open;
    datm_cargo.qry_controle_acesso_rotina.Locate('CD_ROTINA',Localiza, [loCaseInsensitive]);
  end;
 end;
end;

procedure Tfrm_cargo.DBCheckBox11Click(Sender: TObject);
var
  Localiza: string;
begin
  if datm_cargo.qry_controle_acesso_rotina.State in [dsedit] then
  begin
    Localiza:= datm_cargo.qry_controle_acesso_rotinaCD_ROTINA.AsString;
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.ADD('update [MYLOGIN].[dbo].TB_CONTROLE_ACESSO ');
      if DBCheckBox11.Checked then
        SQL.ADD('set in_visivel=''1''                        ')
      else
      SQL.ADD('set in_visivel=''0''                        ');
      SQL.ADD('where CD_SISTEMA= convert(int,'''+ datm_cargo.qry_controle_acesso_rotinaCD_sistema.AsString +''')   and    ');
      SQL.ADD(' CD_modulo=convert(int,'''+ datm_cargo.qry_controle_acesso_rotinaCD_MODULO.AsString +''')           and    ');
      SQL.ADD(' CD_rotina=convert(int,'''+ datm_cargo.qry_controle_acesso_rotinaCD_ROTINA.AsString +''')           and    ');
      SQL.ADD(' CD_cargo=convert(int,'''+ datm_cargo.qry_controle_acesso_rotinaCD_cargo.AsString +''')                    ');
      ExecSql;
      Free;
      datm_cargo.qry_controle_acesso_rotina.Close;
      datm_cargo.qry_controle_acesso_rotina.Open;
      datm_cargo.qry_controle_acesso_rotina.Locate('CD_ROTINA',Localiza, [loCaseInsensitive]);
    end;
  end;
end;

procedure Tfrm_cargo.ReceberConfiguraesdeAcesso1Click(Sender: TObject);
begin
 in_recebe := '1';
 VCOPIAMODULO := '1';
 pnl_duplica.Visible:=true;
 lbl_duplica.Caption:= 'Escolha o Cargo para receber as configurações de Acesso:';
end;

procedure Tfrm_cargo.EnviarConfiguraesdeAcesso1Click(Sender: TObject);
begin
  in_recebe := '0';
  VCOPIAMODULO := '1';
  pnl_duplica.Visible:=true;
  lbl_duplica.Caption:= 'Escolha o Cargo para enviar as configurações de Acesso:';
end;

end.
