(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGGP018.PAS - frm_manut_proc - Manutenção de Processos
AUTOR: Leandro Stipanich
DATA: 09/10/2001
Manutenção:
Data: 29/03/2005
*************************************************************************************************)
unit PGSM051;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, DBTables;

type
  Tfrm_transp_rod = class(TForm)
    pgctrl_transp_rod: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    lbl_cd_transp_rod: TLabel;
    lbl_nm_transp_rod: TLabel;
    lblAtivo: TLabel;
    lbl_ap_transp_rod: TLabel;
    dbedt_nm_transp_rod: TDBEdit;
    dblkpcbox_ativo: TDBLookupComboBox;
    dbedt_ap_transp_rod: TDBEdit;
    ts_taxa: TTabSheet;
    pgctrl_taxa: TPageControl;
    ts_lista2: TTabSheet;
    lbl_transp_rod: TLabel;
    dbg_cad_transp_rod: TDBGrid;
    dbedt_cd_transp_rod2: TDBEdit;
    dbedt_nm_transp_rod2: TDBEdit;
    ts_dados_basicos2: TTabSheet;
    Panel1: TPanel;
    lbl_transp_rod2: TLabel;
    dbedt_cd_transp_rod3: TDBEdit;
    dbedt_nm_transp_rod3: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    lbl_cd_taxa: TLabel;
    dbedt_cd_taxa: TDBEdit;
    lbl_nm_taxa: TLabel;
    dbedt_nm_taxa: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    lbl_me: TLabel;
    lbl_md: TLabel;
    lbl_vl_cntr_20_me: TLabel;
    dbedt_vl_cntr_20_me: TDBEdit;
    lbl_vl_cntr_20_md: TLabel;
    lbl_vl_cntr_40_me: TLabel;
    lbl_vl_cntr_40_md: TLabel;
    lbl_vl_cntr_20_me_RORO: TLabel;
    lbl_vl_cntr_20_md_RORO: TLabel;
    lbl_vl_cntr_40_me_RORO: TLabel;
    lbl_vl_cntr_40_md_RORO: TLabel;
    lbl_vl_c_solta_me: TLabel;
    lbl_vl_c_solta_me_RORO: TLabel;
    lbl_vl_c_solta_md: TLabel;
    lbl_vl_c_solta_md_RORO: TLabel;
    dbedt_vl_cntr_40_me: TDBEdit;
    dbedt_vl_cntr_20_me_RORO: TDBEdit;
    dbedt_vl_cntr_40_me_RORO: TDBEdit;
    dbedt_vl_c_solta_me: TDBEdit;
    dbedt_vl_c_solta_me_RORO: TDBEdit;
    dbedt_vl_cntr_20_md: TDBEdit;
    dbedt_vl_cntr_40_md: TDBEdit;
    dbedt_vl_cntr_20_md_RORO: TDBEdit;
    dbedt_vl_cntr_40_md_RORO: TDBEdit;
    dbedt_vl_c_solta_md_RORO: TDBEdit;
    dbedt_vl_c_solta_md: TDBEdit;
    dbedt_cd_transp_rod: TDBEdit;
    lbl_cnpj_transp_rod: TLabel;
    dbedt_cnpj_transp_rod: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dbedt_end_transp_rod: TDBEdit;
    dbedt_end_cidade: TDBEdit;
    dbedt_end_uf: TDBEdit;
    ts_dner: TTabSheet;
    Label8: TLabel;
    dbedt_cd_transp_rod1: TDBEdit;
    cd_nm_transp_rod1: TDBEdit;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    Label11: TLabel;
    dbedt_transp_rod_dner: TDBEdit;
    Label9: TLabel;
    dbedt_ie_transp_rod: TDBEdit;
    Label10: TLabel;
    dbedt_cpf_transp_rod: TDBEdit;
    lbl_fabr_pais_origem: TLabel;
    btn_co_pais: TSpeedButton;
    dbedt_cd_pais: TDBEdit;
    dbedt_nm_pais: TDBEdit;
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
    ts_contatos: TTabSheet;
    Label12: TLabel;
    dbedt_cd_grupo: TDBEdit;
    dbedt_nm_grupo: TDBEdit;
    btn_co_grupo: TSpeedButton;
    Label13: TLabel;
    dbedt_cd_empresa: TDBEdit;
    dbedt_nm_empresa: TDBEdit;
    btn_co_empresa: TSpeedButton;
    Label14: TLabel;
    dbg_contato: TDBGrid;
    Bevel1: TBevel;
    Label15: TLabel;
    dbedt_cd_via_transp: TDBEdit;
    dbedt_nm_via_transp: TDBEdit;
    btn_cd_via_transp: TSpeedButton;
    DBText1: TDBText;
    Label16: TLabel;
    dbedt_email: TDBMemo;
    dbmmoNM_EMAIL: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_nm_taxaChange(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure dbnvgBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_transp_rodChange(Sender: TObject);
    procedure pgctrl_transp_rodChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbedt_nm_transp_rodChange(Sender: TObject);
    procedure dbg_cad_transp_rodDblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_nm_transp_rodExit(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_transp_rod_dnerChange(Sender: TObject);
    procedure dbedt_transp_rod_dnerExit(Sender: TObject);
    procedure btn_co_paisClick(Sender: TObject);
    procedure dbedt_cd_paisExit(Sender: TObject);
    procedure dbedt_cd_paisKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ContatoChange(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure btn_co_empresaClick(Sender: TObject);
    procedure dbedt_cd_grupoExit(Sender: TObject);
    procedure dbedt_cd_empresaExit(Sender: TObject);
    procedure btn_cd_via_transpClick(Sender: TObject);
    procedure dbedt_cd_via_transpExit(Sender: TObject);
  private
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..2] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;

    function Permite  : Boolean; // by carlos - 08/07/2011 (controlar acesso aos contatos)
    function Consiste : Boolean;
    function Grava    : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    { Private declarations }
  public
    str_cd_transp_rod : String;
    lCons_OnLine, lCons_OnLine2 : Boolean;
    Cons_OnLine,  Cons_OnLine2  : TStringField;
    Cons_OnLine_Texto : String;
    str_pre_abertura : String[1];
    { Public declarations }
  end;

var
  frm_transp_rod: Tfrm_transp_rod;

implementation

{$R *.DFM}

uses GSMLIB, ConsOnLineEx, PGGP001, PGGP017, PGSM052, PGSM210;

procedure Tfrm_transp_rod.FormCreate(Sender: TObject);
begin
  st_modificar   := False;
  st_incluir     := False;
  st_excluir     := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  // Inicializa o Data Module para Transportadores Rodoviários
  Application.CreateForm( Tdatm_transp_rod, datm_transp_rod );

  with datm_transp_rod do
  begin
    ds_transp_rod.AutoEdit := st_modificar;
    ds_transp_rod_contato.AutoEdit := st_modificar;
    ds_taxa.AutoEdit := st_modificar;

    btn_co_grupo.Enabled      := (st_modificar or st_incluir);
    btn_co_empresa.Enabled    := (st_modificar or st_incluir);
    btn_cd_via_transp.Enabled := (st_modificar or st_incluir);


    tbl_yesno_.Open;

    qry_transp_rod_.SQL[2] := 'NM_TRANSP_ROD';
    qry_transp_rod_.Prepare;
    qry_transp_rod_.Open;

    qry_taxa_.DisableControls;
    qry_taxa_.Close;
    qry_taxa_.ParamByName('CD_TRANSP_ROD').AsString := qry_transp_rod_CD_TRANSP_ROD.AsString;
    qry_taxa_.Prepare;
    qry_taxa_.Open;
    qry_taxa_.EnableControls;

    qry_transp_rod_contato.Open;
  end;

  a_str_indices[0] := 'CD_TRANSP_ROD';
  a_str_indices[1] := 'NM_TRANSP_ROD';
  a_str_indices[2] := 'AP_TRANSP_ROD';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Nome');
    Items.Add('Nome Reduzido');
    ItemIndex := 1;
  end;

  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_transp_rod.FormShow(Sender: TObject);
begin
  lNaoConsiste := False;
  if lCons_OnLine and ( Not lCons_OnLine2 ) then
  begin
    ts_taxa.Enabled := False;
  end;
  if lCons_OnLine2 then
  begin
    if str_cd_transp_rod <> '' then
      Localiza(datm_transp_rod.qry_transp_rod_, str_cd_transp_rod, a_str_indices[0] );
    pgctrl_transp_rod.ActivePage := ts_taxa;
  end
  else
  begin
    pgctrl_transp_rod.ActivePage := ts_lista;
  end;
  edt_chave.SetFocus;
  pnl_cadastro.Color := clMenuBroker;
end;

procedure Tfrm_transp_rod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_transp_rod do
    begin
      tbl_yesno_.Close;
      qry_taxa_.Close;
      qry_transp_rod_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_transp_rod.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_transp_rod.qry_transp_rod_CD_TRANSP_ROD.AsString;
    except
      try
        Cons_Online_Texto := datm_transp_rod.qry_transp_rod_CD_TRANSP_ROD.AsString;
      except
        BoxMensagem('Não consegui retornar Código do Transportador Rodoviário!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_transp_rod.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_transp_rod.dbedt_nm_taxaChange(Sender: TObject);
begin
  if ( datm_transp_rod.qry_taxa_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_transp_rod.btn_incluirClick(Sender: TObject);
begin
  if ( pgctrl_transp_rod.ActivePage = ts_dados_basicos ) or
     ( pgctrl_transp_rod.ActivePage = ts_lista ) then
  begin
    with datm_transp_rod do
    begin
      qry_transp_rod_.DisableControls;
      qry_transp_rod_.Cancel;
      qry_transp_rod_.Append;
      qry_transp_rod_.EnableControls;
      qry_transp_rod_CD_TRANSP_ROD.AsString := UltCod( qry_ult_transp_rod_, qry_ult_transp_rod_ULTIMO );
      qry_transp_rod_IN_ATIVO.AsString := '1';
    end;
    pgctrl_transp_rod.ActivePage := ts_dados_basicos;
    dbedt_nm_transp_rod.SetFocus;
  end
  else if pgctrl_transp_rod.ActivePage = ts_taxa then
  begin
    with datm_transp_rod do
    begin
      if qry_transp_rod_.RecordCount = 0  then
      begin
         BoxMensagem('Selecione um Transportador!', 2);
         pgctrl_transp_rod.ActivePage := ts_lista;
         Cancelar;
         Exit;
      end;

      qry_taxa_.DisableControls;
      qry_taxa_.Cancel;
      qry_taxa_.Append;
      qry_taxa_.EnableControls;

      // Verificando número da última taxa
      qry_ult_taxa_.Close;
      qry_ult_taxa_.ParamByName('CD_TRANSP_ROD').AsString := qry_transp_rod_CD_TRANSP_ROD.AsString;
      qry_ult_taxa_.Open;
      qry_taxa_CD_TAXA.AsString := UltCod( qry_ult_taxa_, qry_ult_taxa_ULTIMO );
      qry_taxa_CD_TRANSP_ROD.AsString := qry_transp_rod_CD_TRANSP_ROD.AsString;
      qry_ult_taxa_.Close;

      qry_taxa_IN_ATIVO.AsString := '1';
      qry_taxa_VL_CNTR_20_ME.AsFloat := 0;
      qry_taxa_VL_CNTR_20_MD.AsFloat := 0;
      qry_taxa_VL_CNTR_20_ME_RORO.AsFloat := 0;
      qry_taxa_VL_CNTR_20_MD_RORO.AsFloat := 0;
      qry_taxa_VL_CNTR_40_ME.AsFloat := 0;
      qry_taxa_VL_CNTR_40_MD.AsFloat := 0;
      qry_taxa_VL_CNTR_40_ME_RORO.AsFloat := 0;
      qry_taxa_VL_CNTR_40_MD_RORO.AsFloat := 0;
      qry_taxa_VL_C_SOLTA_ME.AsFloat := 0;
      qry_taxa_VL_C_SOLTA_MD.AsFloat := 0;
      qry_taxa_VL_C_SOLTA_ME_RORO.AsFloat := 0;
      qry_taxa_VL_C_SOLTA_MD_RORO.AsFloat := 0;
    end;
    pgctrl_taxa.ActivePage := ts_dados_basicos2;
    dbedt_nm_taxa.SetFocus;
  end
  else if pgctrl_transp_rod.ActivePage = ts_dner then
  begin
    datm_transp_rod.qry_dner_.DisableControls;
    datm_transp_rod.qry_dner_.Cancel;
    datm_transp_rod.qry_dner_.Append;
    datm_transp_rod.qry_dner_.EnableControls;
    dbedt_transp_rod_dner.ReadOnly := False;
    dbedt_transp_rod_dner.SetFocus;
  end
  else if pgctrl_transp_rod.ActivePage = ts_contatos then
  begin
    datm_transp_rod.qry_transp_rod_contato.Cancel;
    datm_transp_rod.qry_transp_rod_contato.Append;
    dbedt_cd_grupo.SetFocus;
  end;



  btn_mi( False, True, True, False );

  dbnvg.Enabled     := False;
  edt_chave.Enabled := False;
  cb_ordem.Enabled  := False;

end;

procedure Tfrm_transp_rod.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_transp_rod.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_transp_rod.btn_excluirClick(Sender: TObject);
var Arquivo, Pesquisa: String;
begin
  if ( pgctrl_transp_rod.ActivePage = ts_dados_basicos ) or
     ( pgctrl_transp_rod.ActivePage = ts_lista ) then
  begin
    if BoxMensagem( 'Este Transportador Rodoviário será excluído! Confirma exclusão?', 1 ) Then
    try
      Pesquisa := datm_transp_rod.qry_transp_rod_CD_TRANSP_ROD.AsString;
      // Deleta no banco NovaNota.GDB
      Arquivo := cDir_Rpt + '\AtualizaBanco.EXE ' + '3' + ' ' + '03' + ' ' + datm_transp_rod.qry_transp_rod_CD_TRANSP_ROD.AsString;
      //WinExec(PChar(Arquivo), SW_SHOW); // Não executa mais - Michel - 08/11/2011

      datm_main.db_broker.StartTransaction;
      datm_transp_rod.qry_transp_rod_.Delete;
      datm_main.db_broker.Commit;

      with TQuery.Create(application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add(' DELETE FROM MYINDAIA.DBO.TTRANSP_ROD WHERE CD_TRANSP_ROD = ''' + Pesquisa  + ''' ');
        ExecSQL;
        Free;
      end;

    except
      on E: Exception do
      begin
        datm_transp_rod.qry_transp_rod_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    pgctrl_transp_rod.ActivePage := ts_lista;
  end
  else if ( pgctrl_transp_rod.ActivePage = ts_taxa ) then
  begin
    if datm_transp_rod.qry_taxa_.RecordCount = 0 then Exit;
    if BoxMensagem( 'Esta Taxa será excluída! Confirma exclusão?', 1 ) Then
    try
      datm_main.db_broker.StartTransaction;
      datm_transp_rod.qry_taxa_.Delete;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_transp_rod.qry_taxa_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    pgctrl_taxa.ActivePage := ts_lista2;
  end
  else if ( pgctrl_transp_rod.ActivePage = ts_dner ) then
  begin
    if datm_transp_rod.qry_dner_.RecordCount = 0 then Exit;
    if BoxMensagem( 'Este Código DNER será excluído! Confirma exclusão?', 1 ) Then
    try
      datm_main.db_broker.StartTransaction;
      datm_transp_rod.qry_dner_.Delete;
      datm_main.db_broker.Commit;
      dbedt_transp_rod_dner.ReadOnly := datm_transp_rod.qry_dner_.RecordCount = 0;
    except
      on E: Exception do
      begin
        datm_transp_rod.qry_dner_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end
  else if ( pgctrl_transp_rod.ActivePage = ts_contatos ) then
  begin
    if datm_transp_rod.qry_transp_rod_contato.RecordCount = 0 then Exit;

    if BoxMensagem( 'Este Contato será excluído! Confirma exclusão?', 1 ) Then
    try
      datm_main.db_broker.StartTransaction;
      datm_transp_rod.qry_transp_rod_contato.Delete;
      datm_main.db_broker.Commit;

    except
      on E: Exception do
      begin
        datm_transp_rod.qry_transp_rod_contato.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;

end;

procedure Tfrm_transp_rod.dbnvgBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if ( pgctrl_transp_rod.ActivePage = ts_dados_basicos ) or
     ( pgctrl_transp_rod.ActivePage = ts_lista ) then
    datm_transp_rod.qry_transp_rod_.Cancel
  else
    datm_transp_rod.qry_taxa_.Cancel;
end;

procedure Tfrm_transp_rod.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_transp_rod.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_transp_rod.qry_transp_rod_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_transp_rod.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_transp_rod.qry_transp_rod_CD_TRANSP_ROD.AsString;
  //  Apaga o campo de pesquisa 
  edt_chave.Text := '';
  datm_transp_rod.qry_transp_rod_.Close;
  datm_transp_rod.qry_transp_rod_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_transp_rod.qry_transp_rod_.Open;
  Localiza(datm_transp_rod.qry_transp_rod_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

function Tfrm_transp_rod.Consiste : Boolean;
begin
  if ( pgctrl_transp_rod.ActivePage = ts_dados_basicos ) or
     ( pgctrl_transp_rod.ActivePage = ts_lista ) then
  begin
    // Nome
    if Not lNaoConsiste then
    begin
      if dbedt_nm_transp_rod.Text = '' then
      begin
        BoxMensagem('Campo Nome deve ser preenchido!', 2);
        pgctrl_transp_rod.ActivePage := ts_dados_basicos;
        dbedt_nm_transp_rod.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
    // Nome Reduzido
    if Not lNaoConsiste then
    begin
      if dbedt_ap_transp_rod.Text = '' then
      begin
        BoxMensagem('Campo Nome Reduzido deve ser preenchido!', 2);
        pgctrl_transp_rod.ActivePage := ts_dados_basicos;
        dbedt_ap_transp_rod.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
    // C.N.P.J.
    if Not CNPJ(dbedt_cnpj_transp_rod.Text) then
    begin
      pgctrl_transp_rod.ActivePage := ts_dados_basicos;
      dbedt_cnpj_transp_rod.SetFocus;
      Consiste := False;
      Exit;
    end;
    // C.P.F.
    if Not CPF(dbedt_cpf_transp_rod.Text) then
    begin
      pgctrl_transp_rod.ActivePage := ts_dados_basicos;
      dbedt_cpf_transp_rod.SetFocus;
      Consiste := False;
      Exit;
    end;
    // País
    if ( datm_transp_rod.qry_transp_rod_.State in [dsEdit, dsInsert] ) then
    begin
      ValidCodigo( dbedt_cd_pais );
      if dbedt_cd_pais.Text <> '' then
      begin
        if dbedt_nm_pais.Text = '' then
        begin
          BoxMensagem('Código do País inválido!',2);
          pgctrl_transp_rod.ActivePage := ts_dados_basicos;
          dbedt_cd_pais.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end
  else if ( pgctrl_transp_rod.ActivePage = ts_taxa ) then
  begin
    // Nome da Taxa
    if Not lNaoConsiste then
    begin
      if dbedt_nm_taxa.Text = '' then
      begin
        BoxMensagem('Campo Nome deve ser preenchido!', 2);
        pgctrl_taxa.ActivePage := ts_dados_basicos2;
        dbedt_nm_taxa.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end
  else if ( pgctrl_transp_rod.ActivePage = ts_dner ) then
  begin
    // Número DNER
    if Not lNaoConsiste then
    begin
      if ( Trim( dbedt_transp_rod_dner.Text ) = '' ) or
         ( Trim( dbedt_transp_rod_dner.Text ) = '0000' ) then
      begin
        BoxMensagem('Campo DNER deve ser preenchido!', 2);
        pgctrl_taxa.ActivePage := ts_dner;
        dbedt_transp_rod_dner.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end
  else if ( pgctrl_transp_rod.ActivePage = ts_taxa ) then
  begin
    // Nome da Taxa
    if Not lNaoConsiste then
    begin
      if dbedt_nm_taxa.Text = '' then
      begin
        BoxMensagem('Campo Nome deve ser preenchido!', 2);
        pgctrl_taxa.ActivePage := ts_dados_basicos2;
        dbedt_nm_taxa.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end
  else if ( pgctrl_transp_rod.ActivePage = ts_contatos ) then
  begin
    // Grupo
    if not lNaoConsiste then begin

      if ( Trim( dbedt_cd_grupo.Text ) = '' ) or ( Trim( dbedt_nm_grupo.Text ) = '' ) then begin
        BoxMensagem('Campo GRUPO deve ser preenchido!', 2);
        pgctrl_taxa.ActivePage := ts_contatos;
        dbedt_cd_grupo.SetFocus;
        Consiste := False;
        Exit;
      end;


      if ( Trim( dbedt_cd_empresa.Text ) <> '' ) and ( Trim( dbedt_nm_empresa.Text ) = '' ) then begin
        BoxMensagem('Campo CLIENTE Inválido!', 2);
        pgctrl_taxa.ActivePage := ts_contatos;
        dbedt_cd_empresa.SetFocus;
        Consiste := False;
        Exit;
      end;


      if ( Trim( dbedt_cd_via_transp.Text ) = '' ) or ( Trim( dbedt_nm_via_transp.Text ) = '' ) then begin
        BoxMensagem('Campo VIA TRANSPORTE deve ser preenchido!', 2);
        pgctrl_taxa.ActivePage := ts_contatos;
        dbedt_cd_via_transp.SetFocus;
        Consiste := False;
        Exit;
      end;

      if ( Trim( dbedt_email.Text ) = '' ) then begin
        BoxMensagem('Campo EMAIL(s) deve ser preenchido!', 2);
        pgctrl_taxa.ActivePage := ts_contatos;
        dbedt_email.SetFocus;
        Consiste := False;
        Exit;
      end;


    end;
  end;

  Consiste := True;
end;

function Tfrm_transp_rod.Grava : Boolean;
var cTransp, cTaxa, Arquivo, Acao : String;
begin
  Grava := False;

  if ( pgctrl_transp_rod.ActivePage = ts_dados_basicos ) or
     ( pgctrl_transp_rod.ActivePage = ts_lista ) then
  begin
    try
      datm_main.db_broker.StartTransaction;
      If ( datm_transp_rod.qry_transp_rod_.State in [dsInsert, dsEdit] ) then
      begin
        if datm_transp_rod.qry_transp_rod_.State in [dsInsert] then
          Acao := '1'         // inclui
        else
          Acao := '2';         // atualiza

        // Inclui/Altera no banco NovaNota.GDB
        Arquivo := cDir_Rpt + '\AtualizaBanco.EXE ' + Acao + ' ' + '03' + ' ' + datm_transp_rod.qry_transp_rod_CD_TRANSP_ROD.AsString;
        //WinExec(PChar(Arquivo), SW_SHOW); // Não executa mais - Michel - 08/11/2011
        datm_transp_rod.qry_transp_rod_.Post;

        Pesquisa := datm_transp_rod.qry_transp_rod_CD_TRANSP_ROD.AsString;
        datm_transp_rod.qry_transp_rod_.Close;
        datm_transp_rod.qry_transp_rod_.Prepare;
        datm_transp_rod.qry_transp_rod_.Open;
        Localiza(datm_transp_rod.qry_transp_rod_, Pesquisa, a_str_indices[0] );
        Grava := True;
      end;
      datm_main.db_broker.Commit;

      with TQuery.Create(application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add(' DELETE FROM MYINDAIA.DBO.TTRANSP_ROD WHERE CD_TRANSP_ROD = ''' + Pesquisa  + ''' ');
        ExecSQL;
        SQL.Clear;
        SQL.Add(' INSERT INTO MYINDAIA.DBO.TTRANSP_ROD (   ');
        SQL.Add(' CD_TRANSP_ROD, NM_TRANSP_ROD, AP_TRANSP_ROD, NM_EMAIL, CD_PAIS_TRANSP, CD_TRANSP_ARMAZEM_FABRICA ) ');
        SQL.Add(' SELECT CD_TRANSP_ROD, NM_TRANSP_ROD, AP_TRANSP_ROD, NM_EMAIL, CD_PAIS_TRANSP, CD_TRANSP_ARMAZEM_FABRICA ');
        SQL.Add(' FROM TTRANSP_ROD (NOLOCK) WHERE CD_TRANSP_ROD = ''' + Pesquisa + ''' ');
        ExecSQL;
        Free;
      end;
    except
      on E: Exception do
      begin
        datm_transp_rod.qry_transp_rod_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end
  else if ( pgctrl_transp_rod.ActivePage = ts_taxa ) then
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_transp_rod.qry_taxa_.State in [dsInsert, dsEdit] ) then
      begin
        with datm_transp_rod do
        begin
          if qry_taxa_.State in [dsInsert] then
            qry_taxa_.Post;
          cTransp := qry_taxa_CD_TRANSP_ROD.asString;
          cTaxa := qry_taxa_CD_TAXA.asString;
          qry_taxa_.Close;
          qry_taxa_.Prepare;
          qry_taxa_.Open;
          qry_taxa_.Locate('CD_TRANSP_ROD;CD_TAXA', VarArrayOf([ cTransp, cTaxa ]), []);
          Grava := True;
        end;
      end;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_transp_rod.qry_taxa_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end
  else if ( pgctrl_transp_rod.ActivePage = ts_dner ) then
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_transp_rod.qry_dner_.State in [dsInsert, dsEdit] ) then
      begin
        with datm_transp_rod do
        begin
          if qry_dner_.State in [dsInsert, dsEdit] then
          begin
            qry_dner_CD_TRANSP_ROD.asString := qry_transp_rod_CD_TRANSP_ROD.asString;
            qry_dner_.Post;
            qry_dner_.Close;
            qry_dner_.ParamByName('CD_TRANSP_ROD').asString := qry_transp_rod_CD_TRANSP_ROD.asString;
            qry_dner_.Prepare;
            qry_dner_.Open;
            Grava := True;
          end;
        end;
      end;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_transp_rod.qry_dner_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end
  else if ( pgctrl_transp_rod.ActivePage = ts_contatos ) then
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_transp_rod.qry_transp_rod_contato.State in [dsInsert, dsEdit] ) then
      begin
        with datm_transp_rod do
        begin

            if datm_transp_rod.qry_transp_rod_contato.State in [dsInsert] then begin
               qry_transp_rod_contato.Post;
               qry_transp_rod_contato.close;
               qry_transp_rod_contato.open;
               qry_transp_rod_contato.Last;
            end else
               qry_transp_rod_contato.Post;



            Grava := True;
        end;
      end;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_transp_rod.qry_transp_rod_contato.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;
  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_transp_rod.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_transp_rod.pgctrl_transp_rodChange(Sender: TObject);
begin
  if ( pgctrl_transp_rod.ActivePage = ts_dados_basicos ) or
     ( pgctrl_transp_rod.ActivePage = ts_lista ) then
  begin
    if pgctrl_transp_rod.ActivePage = ts_dados_basicos then
    begin
       edt_chave.Enabled := false;
       cb_ordem.Enabled := false;
       dbnvg.Enabled := false;
    end
    else
    begin
       edt_chave.Enabled := true;
       cb_ordem.Enabled := true;
       dbnvg.Enabled := true;
    end;

     dbnvg.DataSource := datm_transp_rod.ds_transp_rod;
  end
  else if ( pgctrl_transp_rod.ActivePage = ts_taxa ) then
  begin
    if pgctrl_taxa.ActivePage = ts_lista2 then
    begin
      edt_chave.Enabled := True;
      cb_ordem.Enabled  := True;
      dbnvg.Enabled     := True;
    end
    else
    begin
      edt_chave.Enabled := False;
      cb_ordem.Enabled  := False;
      dbnvg.Enabled     := False;
    end;
    dbnvg.DataSource := datm_transp_rod.ds_taxa;
  end
  else if ( pgctrl_transp_rod.ActivePage = ts_dner ) then
  begin
    with datm_transp_rod do
    begin
      qry_dner_.Close;
      qry_dner_.ParamByName('CD_TRANSP_ROD').asString := qry_transp_rod_CD_TRANSP_ROD.asString;
      qry_dner_.Prepare;
      qry_dner_.Open;
      dbedt_transp_rod_dner.ReadOnly := qry_dner_.RecordCount = 0;
      dbnvg.DataSource := ds_dner;
      dbnvg.Enabled    := True;
    end;
  end;
end;

procedure Tfrm_transp_rod.pgctrl_transp_rodChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_transp_rod.dbedt_nm_transp_rodChange(Sender: TObject);
begin
  if ( datm_transp_rod.qry_transp_rod_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_transp_rod.dbg_cad_transp_rodDblClick(Sender: TObject);
begin
  if lCons_OnLine2 then
  begin
    try
      Cons_OnLine.AsString  := datm_transp_rod.qry_taxa_CD_TRANSP_ROD.AsString;
      Cons_OnLine2.AsString := datm_transp_rod.qry_taxa_CD_TAXA.AsString;
    except
      BoxMensagem('Não consegui retornar Código da Taxa do Transportador Rodoviário!', 2);
    end;
    Close;
  end;
end;

procedure Tfrm_transp_rod.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

function Tfrm_transp_rod.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( pgctrl_transp_rod.ActivePage = ts_dados_basicos ) then
  begin
    if ( ( datm_transp_rod.qry_transp_rod_.State in [dsEdit] ) and st_modificar ) or
       ( datm_transp_rod.qry_transp_rod_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Transportadores Rodoviários foi alterado.' + #13#10 +
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
  else if ( pgctrl_transp_rod.ActivePage = ts_dner ) then
  begin
    if datm_transp_rod.qry_dner_.State in [dsInsert,dsEdit] then
    begin
      if BoxMensagem('Cadastro de DNER foi alterado.' + #13#10 + 'Deseja salvar as Alterações?', 1) then
      begin
        if not Grava then
        begin
          VerAlt := False;
          Exit;
        end;
      end
      else Cancelar;
    end;
  end;
  if ( pgctrl_transp_rod.ActivePage = ts_taxa ) and
     ( pgctrl_taxa.ActivePage = ts_dados_basicos2 ) then
  begin
    if ( ( datm_transp_rod.qry_taxa_.State in [dsEdit] ) and st_modificar ) or
       ( datm_transp_rod.qry_taxa_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Taxas para Transportadore Rodiviários foi alterado.' + #13#10 +
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

procedure Tfrm_transp_rod.Cancelar;
begin
  try
    if ( pgctrl_transp_rod.ActivePage = ts_dados_basicos ) or
       ( pgctrl_transp_rod.ActivePage = ts_lista ) then
    begin
      // Transportador Rodoviário
      if datm_transp_rod.qry_transp_rod_.State in [dsInsert, dsEdit] then
         datm_transp_rod.qry_transp_rod_.Cancel;
      pgctrl_transp_rod.ActivePage := ts_dados_basicos;
      dbedt_nm_transp_rod.SetFocus
    end
    else if ( pgctrl_transp_rod.ActivePage = ts_taxa ) then
    begin
      // Taxas do transportador
      if datm_transp_rod.qry_taxa_.State in [dsInsert, dsEdit] then
         datm_transp_rod.qry_taxa_.Cancel;
      pgctrl_taxa.ActivePage := ts_dados_basicos2;
      dbedt_nm_taxa.SetFocus;
    end
    else if ( pgctrl_transp_rod.ActivePage = ts_dner ) then
    begin
      if datm_transp_rod.qry_dner_.State in [dsInsert, dsEdit] then
         datm_transp_rod.qry_dner_.Cancel;
      dbedt_transp_rod_dner.ReadOnly := datm_transp_rod.qry_dner_.RecordCount = 0;
      dbedt_transp_rod_dner.SetFocus;
    end
    else if ( pgctrl_transp_rod.ActivePage = ts_contatos ) then
    begin
      if datm_transp_rod.qry_transp_rod_contato.State in [dsInsert, dsEdit] then
         datm_transp_rod.qry_transp_rod_contato.Cancel;

    end;

  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_transp_rod.dbedt_nm_transp_rodExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_transp_rod.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then dbg_cadastroDblClick(nil);
end;

procedure Tfrm_transp_rod.dbedt_transp_rod_dnerChange(Sender: TObject);
begin
  if ( datm_transp_rod.qry_dner_.State in [ dsInsert, dsEdit ] ) then
    btn_mi( False, True, True, False );
end;

procedure Tfrm_transp_rod.dbedt_transp_rod_dnerExit(Sender: TObject);
var
  nNumero : Real;
begin
  try
    nNumero                    := StrToFloat(dbedt_transp_rod_dner.Text);
    dbedt_transp_rod_dner.Text := StrZero( nNumero, dbedt_transp_rod_dner.MaxLength );
  except
  end;
end;

procedure Tfrm_transp_rod.btn_co_paisClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_pais, frm_pais);
  frm_pais.Cons_OnLine := datm_transp_rod.qry_transp_rod_CD_PAIS_TRANSP;
  with frm_pais do
  begin
    lCons_OnLine := True;
    if (st_modificar) and Not (datm_transp_rod.qry_transp_rod_.State in [dsEdit]) then
       datm_transp_rod.qry_transp_rod_.Edit;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_transp_rod do
  begin
    qry_pais_.Close;
    qry_pais_.Prepare;
    qry_pais_.Open;
  end;
  dbedt_cd_paisExit(nil);
end;

procedure Tfrm_transp_rod.dbedt_cd_paisExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_transp_rod.dbedt_cd_paisKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then btn_co_paisClick(nil);
end;

procedure Tfrm_transp_rod.ContatoChange(Sender: TObject);
begin
  if ( datm_transp_rod.qry_transp_rod_contato.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );

end;

procedure Tfrm_transp_rod.btn_co_grupoClick(Sender: TObject);
begin
  If Not( PoeEmEdicao(datm_transp_rod.qry_transp_rod_contato) ) Then Exit;
  if not permite then exit;

  dbedt_cd_grupo.SetFocus;
  dbedt_cd_grupo.Text := ConsultaOnLineEx('TGRUPO','Grupos',['CD_GRUPO','NM_GRUPO'],['Código','Nome'],'CD_GRUPO');
  dbedt_nm_grupo.SetFocus;
end;

procedure Tfrm_transp_rod.btn_co_empresaClick(Sender: TObject);
begin
  If Not PoeEmEdicao(datm_transp_rod.qry_transp_rod_contato) Then Exit;
  if not permite then exit;

  dbedt_cd_empresa.SetFocus;
  dbedt_cd_empresa.Text := ConsultaOnLineEx('TEMPRESA_NAC','Clientes',['CD_EMPRESA','NM_EMPRESA','AP_EMPRESA'],['Código','Nome','Apelido'],'CD_EMPRESA');
  dbedt_nm_empresa.SetFocus;
end;

procedure Tfrm_transp_rod.dbedt_cd_grupoExit(Sender: TObject);
begin
  if dbedt_cd_grupo.Text='' then exit;
  if not ( datm_transp_rod.qry_transp_rod_contato.State in [dsedit,dsInsert]) then exit;
  datm_transp_rod.qry_transp_rod_contatoCD_GRUPO.AsString := Copy('000', 1, 3 - Length( dbedt_cd_grupo.Text)) +  dbedt_cd_grupo.Text;
end;

procedure Tfrm_transp_rod.dbedt_cd_empresaExit(Sender: TObject);
begin
  if dbedt_cd_empresa.Text='' then exit;
  if not ( datm_transp_rod.qry_transp_rod_contato.State in [dsedit,dsInsert]) then exit;
  datm_transp_rod.qry_transp_rod_contatoCD_EMPRESA.AsString := Copy('00000', 1, 5 - Length( dbedt_cd_empresa.Text)) +  dbedt_cd_empresa.Text;
end;

procedure Tfrm_transp_rod.btn_cd_via_transpClick(Sender: TObject);
begin
  if not PoeEmEdicao(datm_transp_rod.qry_transp_rod_contato) then Exit;
  if not permite then exit;

  datm_transp_rod.qry_transp_rod_contatoCD_VIA_TRANSP.AsString := ConsultaOnLineEx('TVIA_TRANSPORTE','Vias de Transporte',['CD_VIA_TRANSPORTE','NM_VIA_TRANSPORTE'],['Código','Descrição'],'CD_VIA_TRANSPORTE',nil, 1, dbedt_cd_via_transp.Text);

end;

procedure Tfrm_transp_rod.dbedt_cd_via_transpExit(Sender: TObject);
begin
  if dbedt_cd_via_transp.Text='' then exit;
  if not ( datm_transp_rod.qry_transp_rod_contato.State in [dsedit,dsInsert]) then exit;
  datm_transp_rod.qry_transp_rod_contatoCD_VIA_TRANSP.AsString := Copy('00', 1, 2 - Length( dbedt_cd_via_transp.Text)) +  dbedt_cd_via_transp.Text;

end;

function Tfrm_transp_rod.Permite: Boolean;
begin
  result:=True;
  if datm_transp_rod.qry_transp_rod_contato.State in [dsEdit] then
     if not st_modificar then
        result:=False;

  if datm_transp_rod.qry_transp_rod_contato.State in [dsInsert] then
     if not st_incluir then
        result:=False;

end;

end.
