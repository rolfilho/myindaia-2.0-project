(*************************************************************************************************
SISTEMA: MyIndaiá - Indaiá Logística
PROGRAMA: PGSM018.PAS - Form Cadastro de Unidades de Negócio
DATA: dd/mm/yyyy
Manutenção:
*************************************************************************************************)
unit PGSM018;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, DBCGrids, PGGP001, Funcoes;

type
  Tfrm_unidade = class(TForm)
    pnl_unid_neg: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pgctrl_unidade: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbl_usuatio_ativo: TLabel;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    dbedt_ap_unid_neg: TDBEdit;
    dblkpcbox_ativo: TDBLookupComboBox;
    ts_produto: TTabSheet;
    dbg_unidade: TDBGrid;
    pgctrl_unid_neg_produto: TPageControl;
    ts_lista_unid_neg_produto: TTabSheet;
    Label10: TLabel;
    dbedt_cd_unid_neg2: TDBEdit;
    dbedt_nm_unid_neg2: TDBEdit;
    dbg_produto: TDBGrid;
    ts_dados_basicos_unid_neg_produto: TTabSheet;
    Panel2: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    btn_co_produto: TSpeedButton;
    Label13: TLabel;
    Label14: TLabel;
    dbedt_cd_produto_unid_neg_prod: TDBEdit;
    dblkpcbox_ativo_unid_neg_prod: TDBLookupComboBox;
    dbedt_nm_produto_unid_neg_prod: TDBEdit;
    dbmemo_tx_numerario_obs: TDBMemo;
    dbedt_nm_unidade_unid_neg_prod: TDBEdit;
    dbedt_cd_unidade_unid_neg_prod: TDBEdit;
    dbmemo_tx_numerario_ass: TDBMemo;
    Label6: TLabel;
    dbedt_end_unid_neg: TDBEdit;
    dbedt_no_unid_neg: TDBEdit;
    Label11: TLabel;
    dbedt_bairro_unid_neg: TDBEdit;
    Label12: TLabel;
    Label15: TLabel;
    dbedt_cidade_unid_neg: TDBEdit;
    Label16: TLabel;
    dbedt_uf_unid_neg: TDBEdit;
    dbedt_cep_unid_neg: TDBEdit;
    Label17: TLabel;
    dbedt_ie_unid_neg: TDBEdit;
    Label18: TLabel;
    Label19: TLabel;
    dbedt_tel_unid_neg: TDBEdit;
    lbl_fax1: TLabel;
    dbdt_nr_fax1: TDBEdit;
    lbl_fax2: TLabel;
    dbedt_nr_fax2: TDBEdit;
    lbl_cnpj: TLabel;
    dbedt_cgc_unid_neg: TDBEdit;
    lbl_nm_slogan: TLabel;
    dbedt_nm_slogan: TDBEdit;
    lbl_email: TLabel;
    dbedt_nm_email: TDBEdit;
    btn_duplica: TSpeedButton;
    mi_duplica: TMenuItem;
    ts_diretorios: TTabSheet;
    Label20: TLabel;
    dbedt_cd_unid_neg3: TDBEdit;
    dbedt_nm_unid_neg3: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    dbedt_path_rel: TDBEdit;
    dbedt_path_siscomex: TDBEdit;
    dbedt_path_rei: TDBEdit;
    grpbx_livro_fiscal: TGroupBox;
    Label24: TLabel;
    dbedt_nm_diretor: TDBEdit;
    Label25: TLabel;
    dbedt_nm_contador: TDBEdit;
    Label26: TLabel;
    dbedt_nm_procurador: TDBEdit;
    Label27: TLabel;
    dbedt_cpf_diretor: TDBEdit;
    Label28: TLabel;
    dbedt_crc_contador: TDBEdit;
    Label29: TLabel;
    dbedt_procurador_cpf: TDBEdit;
    Label30: TLabel;
    dbedt_cd_pais: TDBEdit;
    dbedt_nm_pais: TDBEdit;
    btn_co_pais: TSpeedButton;
    lbl_aliq_iss: TLabel;
    dbedt_vl_aliq_iss: TDBEdit;
    lbl_insc_mun: TLabel;
    dbedt_im_unid_neg: TDBEdit;
    Label31: TLabel;
    dbedt_nr_proc_nf_pref: TDBEdit;
    lbl_livro: TLabel;
    dbedt_nr_livro: TDBEdit;
    dbedt_nm_sigla: TDBEdit;
    Label32: TLabel;
    Label33: TLabel;
    dbedt_cd_banco: TDBEdit;
    dbedt_nm_banco: TDBEdit;
    btn_co_banco: TSpeedButton;
    Image2: TImage;
    Label34: TLabel;
    dbedt_cd_custo: TDBEdit;
    dbedt_nm_custo: TDBEdit;
    btn_co_cd_custo: TSpeedButton;
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure dbnvgBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure dbedt_cd_unid_negChange(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure dbedt_cd_produto_unid_neg_prodExit(Sender: TObject);
    procedure dbmemo_tx_numerario_obsChange(Sender: TObject);
    procedure dbg_unidadeDblClick(Sender: TObject);
    procedure dbg_unidadeKeyPress(Sender: TObject; var Key: Char);
    procedure pgctrl_unidadeChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure Cancelar;
    procedure pgctrl_unidadeChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cgc_unid_negExit(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_duplicaClick(Sender: TObject);
    procedure btn_co_paisClick(Sender: TObject);
    procedure dbedt_cd_paisExit(Sender: TObject);
    procedure dbedt_cd_paisKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_nm_siglaChange(Sender: TObject);
    procedure dbedt_cd_bancoExit(Sender: TObject);
    procedure dbedt_cd_bancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure btn_co_cd_custoClick(Sender: TObject);
    procedure dbedt_cd_custoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_custoChange(Sender: TObject);
    procedure dbedt_cd_custoExit(Sender: TObject);
  private
    a_str_indices : Array[0..1] Of String[60];
    b_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    function Consiste : Boolean;
    function Grava    : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_unidade: Tfrm_unidade;

implementation

uses gsmlib, PGGP017, PGSM105, PGSM010, PGSM220, ConsOnLineEx;

{$R *.DFM}

procedure Tfrm_unidade.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_unidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_unidade.qry_usuario_habilitacao_unidade_.Close;
  datm_unidade.qry_usuario_habilitacao_produto_.Close;
  datm_unidade.qry_produto_.Close;
  datm_unidade.qry_unid_neg_.Close;
  datm_unidade.qry_unid_neg_produto_.Close;
  datm_unidade.qry_ult_unid_neg_.Close;
  datm_unidade.tbl_yesno_.Close;
  datm_unidade.Free;
  Action := caFree;
end;

procedure Tfrm_unidade.FormCreate(Sender: TObject);
begin
  // Cria o DataModule de Unid Neg 
  Application.CreateForm(Tdatm_unidade, datm_unidade );
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
  with datm_unidade do
  begin
    tbl_yesno_.Open;

    qry_usuario_habilitacao_unidade_.Close;
    qry_usuario_habilitacao_unidade_.ParamByName('CD_CARGO').AsString   := str_cd_cargo;
    qry_usuario_habilitacao_unidade_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_usuario_habilitacao_unidade_.SQL[8] := 'NM_UNID_NEG';
    qry_usuario_habilitacao_unidade_.Open;

    qry_usuario_habilitacao_produto_.Close;
    qry_usuario_habilitacao_produto_.ParamByName('CD_USUARIO').AsString:=str_cd_usuario;
    qry_usuario_habilitacao_produto_.SQL[7] := 'CD_PRODUTO';
    qry_usuario_habilitacao_produto_.Open;

    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    qry_unid_neg_produto_.Close;
    qry_unid_neg_produto_.Prepare;
    qry_unid_neg_produto_.Open;

    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;

  end;

  a_str_indices[0] := 'CD_UNID_NEG';
  a_str_indices[1] := 'NM_UNID_NEG';

  b_str_indices[0] := 'CD_UNID_NEG';
  b_str_indices[1] := 'NM_UNID_NEG';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;
  vStr_cd_modulo:='23';
  str_cd_rotina:='2301';

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  datm_unidade.ds_unid_neg.AutoEdit            := st_modificar;
  datm_unidade.ds_unid_neg_produto.AutoEdit    := st_modificar;
  datm_unidade.ds_produto.AutoEdit             := st_modificar;

  btn_incluir.Enabled   := st_incluir;
  btn_excluir.Enabled   := st_excluir;
  mi_incluir.Enabled    := st_incluir;
  mi_excluir.Enabled    := st_excluir;
  btn_duplica.Enabled   := st_incluir;
  mi_duplica.Enabled    := st_incluir;
end;


procedure Tfrm_unidade.btn_excluirClick(Sender: TObject);
begin
  if (pgctrl_unidade.ActivePage = ts_lista) or (pgctrl_unidade.ActivePage = ts_dados_basicos) then
  begin
    if BoxMensagem( 'Esta unidade de negócio será excluída! Confirma exclusão?', 1 ) then
    begin
      try
        Screen.Cursor := crHourGlass;

        datm_main.db_broker.StartTransaction;
        datm_unidade.qry_unid_neg_.Locate( 'CD_UNID_NEG', datm_unidade.qry_usuario_habilitacao_unidade_CD_UNID_NEG.AsString, [loCaseInsensitive] );
        datm_unidade.qry_unid_neg_.Delete;
        datm_unidade.qry_usuario_habilitacao_unidade_.Close;
        datm_unidade.qry_usuario_habilitacao_unidade_.Prepare;
        datm_unidade.qry_usuario_habilitacao_unidade_.Open;
        datm_unidade.qry_unid_neg_.Close;
        datm_unidade.qry_unid_neg_.Prepare;
        datm_unidade.qry_unid_neg_.Open;

        Screen.Cursor := crArrow;

        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          datm_unidade.qry_unid_neg_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      pgctrl_unidade.ActivePage := ts_lista;
    end;
  end
  else if pgctrl_unidade.ActivePage=ts_produto then
  begin
    if BoxMensagem( 'Este relacionamento de unidade de negocio por produto será excluído! Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        datm_unidade.qry_unid_neg_produto_.Delete;
        datm_main.db_broker.Commit;
        datm_unidade.qry_usuario_habilitacao_produto_.Close;
        datm_unidade.qry_usuario_habilitacao_produto_.Prepare;
        datm_unidade.qry_usuario_habilitacao_produto_.Open;
      except
        on E: Exception do
        begin
          datm_unidade.qry_unid_neg_produto_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      pgctrl_unidade.ActivePage := ts_produto;
      pgctrl_unid_neg_produto.ActivePage := ts_lista_unid_neg_produto;
  end;
end;

procedure Tfrm_unidade.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava    then Exit;
end;

procedure Tfrm_unidade.btn_cancelarClick(Sender: TObject);
begin
   Cancelar;
end;

procedure Tfrm_unidade.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_unidade.qry_usuario_habilitacao_unidade_CD_UNID_NEG.AsString;
  edt_chave.Text := '';
  datm_unidade.qry_usuario_habilitacao_unidade_.DisableControls;
  datm_unidade.qry_usuario_habilitacao_unidade_.Close;
  datm_unidade.qry_usuario_habilitacao_unidade_.ParamByName('CD_CARGO').AsString   := str_cd_cargo;
  datm_unidade.qry_usuario_habilitacao_unidade_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
  datm_unidade.qry_usuario_habilitacao_unidade_.SQL[8] := a_str_indices[cb_ordem.ItemIndex];
  datm_unidade.qry_usuario_habilitacao_unidade_.Open;
  datm_unidade.qry_usuario_habilitacao_unidade_.EnableControls;
  Localiza(datm_unidade.qry_usuario_habilitacao_unidade_, Pesquisa, b_str_indices[0]);
  edt_chave.SetFocus;
end;

procedure Tfrm_unidade.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_unidade.qry_usuario_habilitacao_unidade_, edt_chave.Text, b_str_indices[cb_ordem.ItemIndex]);
end;

procedure Tfrm_unidade.FormShow(Sender: TObject);
begin
  pgctrl_unidade.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_unidade.btn_incluirClick(Sender: TObject);
begin
  if (pgctrl_unidade.ActivePage=ts_lista) or (pgctrl_unidade.ActivePage=ts_dados_basicos) then
  begin
    with datm_unidade do
    begin
      qry_unid_neg_.DisableControls;
      qry_unid_neg_.Cancel;
      qry_unid_neg_.Append;
      qry_unid_neg_.EnableControls;
      qry_unid_neg_CD_UNID_NEG.AsString := UltCod( qry_ult_unid_neg_, qry_ult_unid_neg_ULTIMO );
      qry_unid_neg_IN_ATIVO.AsString    := '1';
    end;
    PgCtrl_unidade.ActivePage := ts_dados_basicos;
    dbedt_nm_unid_neg.SetFocus;
  end
  else if pgctrl_unidade.ActivePage=ts_produto then
  begin
    with datm_unidade do
    begin
      qry_unid_neg_produto_.DisableControls;
      qry_unid_neg_produto_.Cancel;
      qry_unid_neg_produto_.Append;
      qry_unid_neg_produto_.EnableControls;
      qry_unid_neg_produto_CD_PRODUTO.AsString := '';
      qry_unid_neg_produto_IN_ATIVO.AsString   := '1';
    end;
    pgctrl_unidade.ActivePage := ts_produto;
    pgctrl_unid_neg_produto.ActivePage := ts_dados_basicos_unid_neg_produto;
    datm_unidade.qry_unid_neg_produto_CD_UNID_NEG.AsString := datm_unidade.qry_unid_neg_CD_UNID_NEG.AsString;
    dbedt_cd_produto_unid_neg_prod.ReadOnly := False;
    dbedt_cd_produto_unid_neg_prod.color := clWindow;
    dbedt_cd_produto_unid_neg_prod.SetFocus;
    btn_co_produto.Enabled := True;
  end;

  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  dbnvg.Enabled := False;
  edt_chave.Enabled := False;
  cb_ordem.Enabled := False;
end;


procedure Tfrm_unidade.dbnvgBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  datm_unidade.qry_unid_neg_.Cancel;
  datm_unidade.qry_unid_neg_produto_.Cancel;
end;

procedure Tfrm_unidade.dbedt_cd_unid_negChange(Sender: TObject);
begin
  if ( datm_unidade.qry_unid_neg_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_unidade.btn_co_produtoClick(Sender: TObject);
begin
  vStr_cd_modulo:='23';
  str_cd_rotina := '2302';

  Application.CreateForm(Tfrm_produto, frm_produto);
  frm_produto.Cons_OnLine := datm_unidade.qry_unid_neg_produto_CD_PRODUTO;
  with frm_produto do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_unidade.qry_unid_neg_produto_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_unidade.qry_unid_neg_produto_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';

  with datm_unidade do
  begin
    datm_unidade.qry_produto_.Close;
    datm_unidade.qry_produto_.Prepare;
    datm_unidade.qry_produto_.Open;
  end;
  dbedt_cd_produto_unid_neg_prodExit(Sender);
end;


procedure Tfrm_unidade.dbedt_cd_produto_unid_neg_prodExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_unidade.dbmemo_tx_numerario_obsChange(Sender: TObject);
begin
  if ( datm_unidade.qry_unid_neg_produto_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_unidade.dbg_unidadeDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_unidade.qry_usuario_habilitacao_unidade_CD_UNID_NEG.AsString;
    except
       try
          Cons_Online_Texto := datm_unidade.qry_usuario_habilitacao_unidade_CD_UNID_NEG.AsString;
       except
          BoxMensagem('Não foi possível retornar o Código da Unidade !', 2);
       end;
    end;
    Close;
  end;
end;


procedure Tfrm_unidade.dbg_unidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbg_unidadeDblClick(Sender);
end;

function Tfrm_unidade.Consiste : Boolean;
begin
  Consiste := True;
  if (pgctrl_unidade.ActivePage=ts_dados_basicos) then
  begin
    if dbedt_nm_unid_neg.Text = '' then
    begin
      BoxMensagem('Campo Nome deve ser preenchido!', 2);
      pgctrl_unidade.ActivePage := ts_dados_basicos;
      dbedt_nm_unid_neg.SetFocus;
      Consiste := False;
      exit;
    end;

    if dbedt_ap_unid_neg.Text = '' then
    begin
      BoxMensagem('Campo Apelido deve ser preenchido!', 2);
      pgctrl_unidade.ActivePage := ts_dados_basicos;
      dbedt_ap_unid_neg.SetFocus;
      Consiste := False;
      Exit;
    end;

    // C.N.P.J.
    if Not CNPJ( dbedt_cgc_unid_neg.Text ) then
    begin
      pgctrl_unidade.ActivePage := ts_dados_basicos;
      dbedt_cgc_unid_neg.SetFocus;
      Consiste := False;
      Exit;
    end;
  end
  else if (pgctrl_unid_neg_produto.ActivePage=ts_dados_basicos_unid_neg_produto) then
  begin
    if dbedt_cd_produto_unid_neg_prod.Text = '' then
    begin
      BoxMensagem('Campo Código deve ser preenchido!', 2);
      pgctrl_unidade.ActivePage := ts_produto;
      pgctrl_unid_neg_produto.ActivePage := ts_dados_basicos_unid_neg_produto;
      dbedt_cd_produto_unid_neg_prod.SetFocus;
      Consiste := False;
      Exit;
    end;

    if Not ( datm_unidade.qry_unid_neg_produto_.State in [dsEdit, dsInsert] ) then Exit;
    ValidCodigo( dbedt_cd_produto_unid_neg_prod );
    if dbedt_cd_produto_unid_neg_prod.Text <> '' then
    begin
      if dbedt_nm_produto_unid_neg_prod.Text = '' then
      begin
        BoxMensagem('Código de produto inválido!',2);
        pgctrl_unidade.ActivePage := ts_produto;
        pgctrl_unid_neg_produto.ActivePage := ts_dados_basicos_unid_neg_produto;
        dbedt_cd_produto_unid_neg_prod.SetFocus;
      end;
    end;

    Localiza(datm_unidade.qry_produto_, datm_unidade.qry_unid_neg_produto_CD_PRODUTO.AsString , 'CD_PRODUTO' );
    if datm_unidade.qry_produto_IN_ATIVO.AsString = '0' then
    begin
      BoxMensagem('Este produto não está ativo !', 2);
      pgctrl_unidade.ActivePage := ts_produto;
      pgctrl_unid_neg_produto.ActivePage := ts_dados_basicos_unid_neg_produto;
      dbedt_cd_produto_unid_neg_prod.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;
  Consiste := True;
end;

function Tfrm_unidade.Grava : Boolean;
begin
  Grava := False;
  if (pgctrl_unidade.ActivePage = ts_dados_basicos) or
     (pgctrl_unidade.ActivePage = ts_diretorios) then
  begin
    with datm_unidade do
    begin
      try
        datm_main.db_broker.StartTransaction;
        if ( qry_unid_neg_.State in [dsInsert, dsEdit] ) then
        begin
          if ( qry_unid_neg_.State in [dsEdit] ) then  //consiste in_ativo
          begin
            CloseStoredProc( sp_ativar_desativar_unidade);
            sp_ativar_desativar_unidade.ParamByName('@CD_UNID_NEG').AsString := qry_unid_neg_CD_UNID_NEG.AsString;
            sp_ativar_desativar_unidade.ParamByName('@IN_ATIVO').AsString    := qry_unid_neg_IN_ATIVO.AsString;
            ExecStoredProc( sp_ativar_desativar_unidade);
            CloseStoredProc( sp_ativar_desativar_unidade);
          end;
          qry_unid_neg_.Post;

          // Atualizando Variáveis
          cDir_Rpt := AllTrim( qry_unid_neg_PATH_RELATORIOS.AsString );
          cDir_Scx := AllTrim( qry_unid_neg_PATH_SISCOMEX.AsString );
          cDir_Rei := AllTrim( qry_unid_neg_PATH_REI.AsString );

          Pesquisa := qry_unid_neg_CD_UNID_NEG.AsString;
          datm_main.db_broker.Commit;
          qry_usuario_habilitacao_unidade_.Close;
          qry_usuario_habilitacao_unidade_.Prepare;
          qry_usuario_habilitacao_unidade_.Open;
          qry_usuario_habilitacao_unidade_.Locate( 'CD_UNID_NEG', Pesquisa, [loCaseInsensitive] );

          qry_unid_neg_.Close;
          qry_unid_neg_.Prepare;
          qry_unid_neg_.Open;
          qry_unid_neg_.Locate( 'CD_UNID_NEG', Pesquisa, [loCaseInsensitive] );
        end;
        Grava := True;
      except
        on E: Exception do
        begin
          qry_unid_neg_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
          Grava := False;
        end;
      end;
    end;
  end
  else
  if ( pgctrl_unid_neg_produto.ActivePage = ts_dados_basicos_unid_neg_produto ) then
  begin
    try
      if ( datm_unidade.qry_unid_neg_produto_.State in [dsInsert, dsEdit] ) then
      begin
        datm_main.db_broker.StartTransaction;
        datm_unidade.qry_unid_neg_produto_.Post;
        datm_main.db_broker.Commit;
        Pesquisa := datm_unidade.qry_unid_neg_produto_CD_UNID_NEG.AsString+datm_unidade.qry_unid_neg_produto_CD_PRODUTO.AsString;
        datm_unidade.qry_usuario_habilitacao_produto_.Close;
        datm_unidade.qry_usuario_habilitacao_produto_.Prepare;
        datm_unidade.qry_usuario_habilitacao_produto_.Open;
        datm_unidade.qry_usuario_habilitacao_produto_.Locate( 'CD_UNID_NEG;CD_PRODUTO', VarArrayOf ([ Copy( Pesquisa, 1, 2), Copy( Pesquisa, 3, 2) ]), [loCaseInsensitive]);
        dbedt_cd_produto_unid_neg_prod.ReadOnly := True;
        dbedt_cd_produto_unid_neg_prod.color    := clMenu;
        btn_co_produto.Enabled                  := False;
      end;
      Grava := True;
    except
      on E: Exception do
      begin
        datm_unidade.qry_unid_neg_produto_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;
  btn_incluir.Enabled  := pgctrl_unidade.ActivePage <> ts_diretorios;
  mi_incluir.Enabled   := pgctrl_unidade.ActivePage <> ts_diretorios;
  btn_excluir.Enabled  := pgctrl_unidade.ActivePage <> ts_diretorios;
  mi_excluir.Enabled   := pgctrl_unidade.ActivePage <> ts_diretorios;
  btn_duplica.Enabled  := pgctrl_unidade.ActivePage <> ts_diretorios;
  mi_duplica.Enabled   := pgctrl_unidade.ActivePage <> ts_diretorios;
  btn_salvar.Enabled   := False;
  mi_salvar.Enabled    := False;
  btn_cancelar.Enabled := False;
  mi_cancelar.Enabled  := False;
end;

function Tfrm_unidade.VerAlt : Boolean;
begin
  VerAlt := True;
  if (pgctrl_unidade.ActivePage = ts_dados_basicos) or
     (pgctrl_unidade.ActivePage = ts_diretorios) then
  begin
    if ( ( datm_unidade.qry_unid_neg_.State in [dsEdit] ) and st_modificar ) or
       ( datm_unidade.qry_unid_neg_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Unidades de Negócio foi alterado.' + #13#10 +
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
  if ( pgctrl_unid_neg_produto.ActivePage = ts_dados_basicos_unid_neg_produto ) then
  begin
    if ( ( datm_unidade.qry_unid_neg_produto_.State in [dsEdit] ) and st_modificar ) or
       ( datm_unidade.qry_unid_neg_produto_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Produtos por Unidades de Negócio foi alterado.' + #13#10 +
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

procedure Tfrm_unidade.Cancelar;
begin
  if (pgctrl_unidade.ActivePage = ts_dados_basicos) or
     (pgctrl_unidade.ActivePage = ts_diretorios) then
  begin
    try
      if datm_unidade.qry_unid_neg_.State in [dsInsert, dsEdit] then
      begin
        datm_unidade.qry_unid_neg_.Cancel;
        if pgctrl_unidade.ActivePage = ts_dados_basicos then
          dbedt_nm_unid_neg.SetFocus;
      end;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
  end
  else
  if (pgctrl_unid_neg_produto.ActivePage=ts_dados_basicos_unid_neg_produto) then
  begin
    try
      if datm_unidade.qry_unid_neg_produto_.State in [dsInsert, dsEdit] then
      begin
        datm_unidade.qry_unid_neg_produto_.Cancel;
        pgctrl_unidade.ActivePage := ts_produto;
        pgctrl_unid_neg_produto.ActivePage := ts_dados_basicos_unid_neg_produto;
        dbedt_nm_produto_unid_neg_prod.SetFocus;

        dbedt_cd_produto_unid_neg_prod.ReadOnly := True;
        dbedt_cd_produto_unid_neg_prod.color := clMenu;
        btn_co_produto.Enabled := False;
      end;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
  end;
  btn_incluir.Enabled  := pgctrl_unidade.ActivePage <> ts_diretorios;
  mi_incluir.Enabled   := pgctrl_unidade.ActivePage <> ts_diretorios;
  btn_excluir.Enabled  := pgctrl_unidade.ActivePage <> ts_diretorios;
  mi_excluir.Enabled   := pgctrl_unidade.ActivePage <> ts_diretorios;
  btn_duplica.Enabled  := pgctrl_unidade.ActivePage <> ts_diretorios;
  mi_duplica.Enabled   := pgctrl_unidade.ActivePage <> ts_diretorios;
  btn_salvar.Enabled   := False;
  mi_salvar.Enabled    := False;
  btn_cancelar.Enabled := False;
  mi_cancelar.Enabled  := False;
end;

procedure Tfrm_unidade.pgctrl_unidadeChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_unidade.pgctrl_unidadeChange(Sender: TObject);
begin
  if (pgctrl_unidade.ActivePage=ts_lista) or
     (pgctrl_unidade.ActivePage=ts_dados_basicos) then
     dbnvg.DataSource := datm_unidade.ds_usuario_habilitacao_unidade
  else
     dbnvg.DataSource := datm_unidade.ds_usuario_habilitacao_produto;

  if (pgctrl_unidade.ActivePage = ts_lista ) or
     ((pgctrl_unidade.ActivePage = ts_produto ) and
      (pgctrl_unid_neg_produto.ActivePage = ts_lista_unid_neg_produto ) ) then
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

  btn_incluir.Enabled := pgctrl_unidade.ActivePage <> ts_diretorios;
  mi_incluir.Enabled  := pgctrl_unidade.ActivePage <> ts_diretorios;
  btn_excluir.Enabled := pgctrl_unidade.ActivePage <> ts_diretorios;
  mi_excluir.Enabled  := pgctrl_unidade.ActivePage <> ts_diretorios;
  btn_duplica.Enabled := pgctrl_unidade.ActivePage <> ts_diretorios;
  mi_duplica.Enabled  := pgctrl_unidade.ActivePage <> ts_diretorios;
end;

procedure Tfrm_unidade.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_unidade.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_unidade.dbedt_cgc_unid_negExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_unidade.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then dbg_unidadeDblClick(nil);
end;

procedure Tfrm_unidade.btn_duplicaClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_duplica_unid, frm_duplica_unid );
  frm_duplica_unid.ShowModal;
  Application.ProcessMessages;
  Screen.Cursor  := crArrow;

  with datm_unidade do
  begin
    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    qry_unid_neg_produto_.Close;
    qry_unid_neg_produto_.Prepare;
    qry_unid_neg_produto_.Open;

    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;

    qry_usuario_habilitacao_unidade_.Close;
    qry_usuario_habilitacao_unidade_.ParamByName('CD_CARGO').AsString   := str_cd_cargo;
    qry_usuario_habilitacao_unidade_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_usuario_habilitacao_unidade_.SQL[8] := 'NM_UNID_NEG';
    qry_usuario_habilitacao_unidade_.Open;

    qry_usuario_habilitacao_produto_.Close;
    qry_usuario_habilitacao_produto_.ParamByName('CD_USUARIO').AsString:=str_cd_usuario;
    qry_usuario_habilitacao_produto_.SQL[7] := 'CD_PRODUTO';
    qry_usuario_habilitacao_produto_.Open;
  end;
end;


procedure Tfrm_unidade.btn_co_paisClick(Sender: TObject);
begin
  Cons_On_Line( 'DBBROKER', 'TPAIS', datm_unidade.qry_unid_neg_CD_PAIS, 'País', 1, '', 'TQuery' );
  dbedt_cd_paisExit(nil);
end;

procedure Tfrm_unidade.dbedt_cd_paisExit(Sender: TObject);
begin
  if not dbedt_cd_pais.Modified then Exit;
  ValidCodigo( dbedt_cd_pais );
end;

procedure Tfrm_unidade.dbedt_cd_paisKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then btn_co_paisClick(nil);
end;

procedure Tfrm_unidade.dbedt_nm_siglaChange(Sender: TObject);
begin
  if ( datm_unidade.qry_unid_neg_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_unidade.dbedt_cd_bancoExit(Sender: TObject);
begin
  if not dbedt_cd_banco.Modified then Exit;
  ValidCodigo( dbedt_cd_banco );
end;

procedure Tfrm_unidade.dbedt_cd_bancoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then btn_co_bancoClick(nil);
end;

procedure Tfrm_unidade.btn_co_bancoClick(Sender: TObject);
begin
  Cons_On_Line( 'DBBROKER', 'TBANCO', datm_unidade.qry_unid_neg_CD_BANCO_CONCILIACAO, 'Banco', 61, '', 'TQuery' );
  dbedt_cd_bancoExit(nil);
end;

procedure Tfrm_unidade.btn_co_cd_custoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_unidade.qry_unid_neg_) then exit;
      datm_unidade.qry_unid_neg_CD_CT_CUSTO.AsString := ConsultaOnLineEx('TCONTABIL_CUSTO','Centro de Custo',['CD_CT_CUSTO','NM_CT_CUSTO'],['Código','Descrição'],'CD_CT_CUSTO',frm_main.mi_cad_fin_centro_custos)
  end
  else
    dbedt_nm_custo.Text := ConsultaLookUP('TCONTABIL_CUSTO','CD_CT_CUSTO',dbedt_cd_custo.Text,'NM_CT_CUSTO')
end;

procedure Tfrm_unidade.dbedt_cd_custoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then btn_co_cd_custoClick(btn_co_cd_custo);
end;

procedure Tfrm_unidade.dbedt_cd_custoChange(Sender: TObject);
begin
  if ( datm_unidade.qry_unid_neg_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
  dbedt_nm_custo.Text := ConsultaLookUP('TCONTABIL_CUSTO','CD_CT_CUSTO',dbedt_cd_custo.Text,'NM_CT_CUSTO');
end;

procedure Tfrm_unidade.dbedt_cd_custoExit(Sender: TObject);
begin
  if not dbedt_cd_custo.Modified then Exit;
  ValidCodigo( dbedt_cd_custo );
end;

end.
