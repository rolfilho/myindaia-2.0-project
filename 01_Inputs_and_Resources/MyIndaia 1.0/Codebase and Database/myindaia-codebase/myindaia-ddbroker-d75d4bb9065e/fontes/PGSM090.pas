unit PGSM090;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Mask, Buttons, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, Funcoes, DbTables, DateUtils;

type
  Tfrm_Favor = class(TForm)
    pgctrl_favor: TPageControl;
    ts_lista: TTabSheet;
    dbg_favor: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_favor: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    lbl_ativo: TLabel;
    Label5: TLabel;
    dbedt_cd_favor: TDBEdit;
    dbedt_nm_favor: TDBEdit;
    dblkpcbox_ativo_favor: TDBLookupComboBox;
    dbedt_nm_sigla: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    Label6: TLabel;
    dbedt_END_FAVORECIDO: TDBEdit;
    Label7: TLabel;
    dbedt_END_NUMERO: TDBEdit;
    Label8: TLabel;
    dbedt_END_CIDADE: TDBEdit;
    Label9: TLabel;
    dbedt_END_BAIRRO: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    dbedt_END_CEP: TDBEdit;
    Label12: TLabel;
    dbedt_NR_FONE: TDBEdit;
    Label13: TLabel;
    dbedt_NR_FAX: TDBEdit;
    Label14: TLabel;
    dbedt_NM_CONTATO: TDBEdit;
    Label15: TLabel;
    dbedt_TX_CARGO: TDBEdit;
    Label16: TLabel;
    dbedt_TX_DEPARTAMENTO: TDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    dbedt_CNPJ_EMPRESA: TDBEdit;
    Label19: TLabel;
    dbedt_CPF_EMPRESA: TDBEdit;
    Label20: TLabel;
    dbedt_IE_EMPRESA: TDBEdit;
    Label21: TLabel;
    dbedt_DT_INCLUSAO: TDBEdit;
    dblkpcbox_controla_ir: TDBLookupComboBox;
    Label22: TLabel;
    DBComboBox1: TDBComboBox;
    lbl_ct_contabil: TLabel;
    dbedt_cd_ct_contabil: TDBEdit;
    dbedt_nm_ct_contabil: TDBEdit;
    btn_co_ct_contabil: TSpeedButton;
    Label24: TLabel;
    dbedt_cd_recol: TDBEdit;
    btn_co_recol: TSpeedButton;
    dbedt_nm_natureza: TDBEdit;
    dblkpcbox_tp_pessoa: TDBLookupComboBox;
    Label25: TLabel;
    dbedt_NR_INSS: TDBEdit;
    Label26: TLabel;
    dblkpcbox_transp: TDBLookupComboBox;
    Label31: TLabel;
    dbedt_END_COMPLEMENTO: TDBEdit;
    lbl_banco: TLabel;
    dbedt_cd_banco: TDBEdit;
    dbedt_nm_banco: TDBEdit;
    btn_co_banco: TSpeedButton;
    lbl_acesso: TLabel;
    lbl_aux: TLabel;
    dbedt_cd_acesso: TDBEdit;
    dbedt_cd_aux: TDBEdit;
    pnl_cadastro: TPanel;
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
    Label23: TLabel;
    DBEdit1: TDBEdit;
    Label27: TLabel;
    DBEdit2: TDBEdit;
    Label28: TLabel;
    DBEdit3: TDBEdit;
    tsContas: TTabSheet;
    pgctrl_favor_contas: TPageControl;
    tsListaContas: TTabSheet;
    DBGrid1: TDBGrid;
    Label29: TLabel;
    BtncontaContabil: TSpeedButton;
    EditCdContabil: TDBEdit;
    EditNMContabil: TEdit;
    Label30: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label34: TLabel;
    DBEdit4: TDBEdit;
    dbedtIRFF: TDBEdit;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    dbedtINSS: TDBEdit;
    dbedtISS: TDBEdit;
    dbedtPisCofins: TDBEdit;
    lbl_cd_ct_custo: TLabel;
    btn_rateio: TSpeedButton;
    dbedt_nm_rateio: TEdit;
    dbedt_cd_rateio: TDBEdit;
    tsDadosBasicosContas: TTabSheet;
    DBEdit5: TDBEdit;
    Label39: TLabel;
    dbedt_contabil_reduzida: TDBEdit;
    Label40: TLabel;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_favorChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_favorDblClick(Sender: TObject);
    procedure dbg_favorKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_nm_favorChange(Sender: TObject);
    procedure pgctrl_favorChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbedt_CNPJ_EMPRESAExit(Sender: TObject);
    procedure dbedt_CPF_EMPRESAExit(Sender: TObject);
    procedure btn_co_ct_contabilClick(Sender: TObject);
    procedure dblkpcbox_controla_irExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_co_recolClick(Sender: TObject);
    procedure dbedt_cd_recolExit(Sender: TObject);
    procedure dbedt_cd_recolKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblkpcbox_tp_pessoaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure dbedt_cd_bancoExit(Sender: TObject);
    procedure dbedt_cd_acessoEnter(Sender: TObject);
    procedure dbedt_cd_auxEnter(Sender: TObject);
    procedure dbedt_cd_acessoExit(Sender: TObject);
    procedure dbedt_cd_auxExit(Sender: TObject);
    procedure dbedt_cd_ct_contabilExit(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtncontaContabilClick(Sender: TObject);
    procedure btn_rateioClick(Sender: TObject);
    procedure dbedt_cd_rateioExit(Sender: TObject);
  private
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modulo, st_rotina : String;
    cd_acesso, cd_aux : String[1];
    lNaoConsiste, lCNPJ, lCPF : Boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure Cancelar;
  public
    st_modificar, st_incluir, st_excluir, lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
    procedure TipoPessoa;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
  end;

var
  frm_Favor: Tfrm_Favor;

implementation

uses PGSM089, GSMLIB, PGGP001, PGGP017, PGSM041, ConsOnLineEx;

{$R *.DFM}

procedure Tfrm_Favor.FormCreate(Sender: TObject);
begin
  // Cria o DataModule do Favorecido
  pgctrl_favor.ActivePage := ts_lista;

  Application.CreateForm(Tdatm_favor, datm_favor );

  st_modulo := vStr_cd_modulo;
  st_rotina := str_cd_rotina;

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  with datm_favor do
  begin
    tbl_yesno_.Close;
    tbl_yesno_.Open;

    qry_ct_contabil_.Close;
    qry_ct_contabil_.Prepare;
    qry_ct_contabil_.Open;

    qry_favor_.Close;
    qry_favor_.SQL[2] := 'NM_FAVORECIDO';
    qry_favor_.Prepare;
    qry_favor_.Open;

    qry_ct_contabilRM_.Close;
    qry_ct_contabilRM_.Prepare;
    qry_ct_contabilRM_.Open;

    qry_param_.Close;
    qry_param_.Prepare;
    qry_param_.Open;
    if qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then  // RM Saldus
    begin
      // Acesso
      lbl_acesso.Visible                      := False;
      dbedt_cd_acesso.Visible                 := False;
      // Aux
      lbl_aux.Visible                         := False;
      dbedt_cd_aux.Visible                    := False;
      // Conta Contábil
      lbl_ct_contabil.Left                    := lbl_acesso.Left;
      dbedt_cd_ct_contabil.Left               := dbedt_cd_acesso.Left;
      dbedt_nm_ct_contabil.Left               := dbedt_cd_acesso.Left + 80;
      dbedt_nm_ct_contabil.Width              := dbedt_nm_ct_contabil.Width + 90;
      dbedt_nm_ct_contabil.DataField          := 'LookCtContabilRM';
      qry_favor_.FieldByName('CD_CT_CONTABIL').EditMask := '';
    end
    else
    begin // ContMaster/SI
      // Acesso
      lbl_acesso.Visible                      := True;
      dbedt_cd_acesso.Visible                 := True;
      // Aux
      lbl_aux.Visible                         := True;
      dbedt_cd_aux.Visible                    := True;
      // Conta Contábil
      dbedt_nm_ct_contabil.DataField          := 'LookCtContabil';
      //qry_favor_.FieldByName('CD_CT_CONTABIL').EditMask := '999.99.99999;0;_';
    end;
  end;

  a_str_indices[0] := 'CD_FAVORECIDO';
  a_str_indices[1] := 'NM_FAVORECIDO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;
  vStr_cd_modulo:='22';
  str_cd_rotina:='2208';

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  datm_favor.ds_favor.AutoEdit     := st_modificar;
  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;
end;

procedure Tfrm_Favor.btn_incluirClick(Sender: TObject);
begin
  If (pgctrl_favor.ActivePage = ts_dados_basicos) Or (pgctrl_favor.ActivePage = ts_lista) Then
  Begin
    btn_incluir.Enabled := False;
    mi_incluir.Enabled  := False;
    btn_excluir.Enabled := False;
    mi_excluir.Enabled  := False;
    with datm_favor do
    begin
      qry_favor_.DisableControls;
      qry_favor_.Cancel;
      qry_favor_.Append;
      qry_favor_.EnableControls;
      qry_ult_favor_.Open;
      pgctrl_favor.ActivePage:=ts_dados_basicos;
      qry_favor_.FieldByName('CD_FAVORECIDO').AsString   := UltCod( qry_ult_favor_, qry_ult_favor_ULTIMO );
      qry_favor_.FieldByName('IN_ATIVO').AsString        := '1';
      qry_favor_.FieldByName('IN_CONTROLA_IR').AsBoolean := False;
      qry_favor_.FieldByName('CD_TIPO_PESSOA').AsString  := '1';
      TipoPessoa;
    end;
    dbedt_nm_favor.SetFocus;
  End
  Else If (pgctrl_favor.ActivePage = tsContas) Then
  Begin
    with datm_favor do
    begin
      qry_favor_contas.DisableControls;
      qry_favor_contas.Cancel;
      qry_favor_contas.Append;
      qry_favor_contas.EnableControls;
      pgctrl_favor_contas.ActivePage := tsDadosBasicosContas;
    end;
    EditCdContabil.SetFocus;
  End;
end;

procedure Tfrm_Favor.btn_salvarClick(Sender: TObject);
begin

  // Verifica se já existe um favorecido com o CNPJ digitado. Caso exista, apresenta uma mensagem de erro
  // ao usuário e cancela a operação.                    Eric, 23/07/2012 09:19h
  if dbedt_contabil_reduzida.Text = '' then
  begin
    BoxMensagem( 'Favor preencher a conta reduzida!', 2 );
    dbedt_contabil_reduzida.SetFocus;
    Exit;
  end;

  If Trim(dbedt_CNPJ_EMPRESA.Text) <> '' Then
  begin
    with TQuery.Create(Application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Add('SELECT CD_FAVORECIDO');
      SQL.Add('FROM TFAVORECIDO');
      SQL.Add('WHERE CGC_EMPRESA = ' + QuotedStr(dbedt_CNPJ_EMPRESA.Text));
      SQL.Add('  AND CD_FAVORECIDO <> ' + QuotedStr(dbedt_cd_favor.Text));
      Open;

      If RecordCount <> 0 then
      begin
        Showmessage('Erro! Já existe uma empresa cadastrada com este CNPJ. Por favor, tente novamente.');
        Exit;
      end
      else
      begin
        ActiveControl := nil;
        if Not Consiste then Exit;
        if Not Grava then Exit;
      end;
    end;
  end
end;

procedure Tfrm_Favor.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_Favor.Cancelar;
begin
  try
    If (pgctrl_favor.ActivePage = ts_dados_basicos) Or (pgctrl_favor.ActivePage = ts_lista) Then
    Begin
      if datm_favor.qry_favor_.State in [dsInsert, dsEdit] then
      begin
        datm_favor.qry_favor_.Cancel;
        pgctrl_favor.ActivePage := ts_dados_basicos;
        dbedt_nm_favor.SetFocus;
      end;
    End
    Else If (pgctrl_favor.ActivePage = tsContas) Then
    Begin
      if datm_favor.qry_favor_contas.State in [dsInsert, dsEdit] then
      begin
        datm_favor.qry_favor_contas.Cancel;
        pgctrl_favor_contas.ActivePage := tsDadosBasicosContas;
        EditCdContabil.SetFocus;
      end;
    End;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_Favor.btn_excluirClick(Sender: TObject);
begin
  If (pgctrl_favor.ActivePage = ts_dados_basicos) Or (pgctrl_favor.ActivePage = ts_lista) Then
  Begin
    if BoxMensagem( 'Este Favorecido será excluído! Confirma exclusão?', 1 ) Then
    try
      datm_main.db_broker.StartTransaction;
      datm_favor.qry_favor_.Delete;
      datm_main.db_broker.Commit;
      pgctrl_favor.ActivePage:=ts_lista;
    except
      on E: Exception do
      begin
        TrataErro(E);
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end
  Else If (pgctrl_favor.ActivePage = tsContas) Then
  Begin
    if BoxMensagem( 'Esta Conta será excluída! Confirma exclusão?', 1 ) Then
    try
      With TQuery.Create(Application) Do
      Begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQl.Add('DELETE FROM TFAVORECIDO_CONTAS');
        SQl.Add('where CD_FAVORECIDO =:CD_FAVORECIDO');
        SQl.Add('AND CD_CT_CONTABIL =:CD_CT_CONTABIL');
        ParamByName('CD_FAVORECIDO').AsString  := datm_favor.qry_favor_contasCD_FAVORECIDO.AsString;
        ParamByName('CD_CT_CONTABIL').AsString := datm_favor.qry_favor_contasCD_CT_CONTABIL.AsString;
        ExecSql;
        Free;
      End;
      datm_favor.qry_favor_contas.Close;
      datm_favor.qry_favor_contas.Open;
      pgctrl_favor.ActivePage := tsListaContas;
    except
      on E: Exception do
      begin
        TrataErro(E);
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  End;
end;

procedure Tfrm_Favor.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Favor.edt_chaveChange(Sender: TObject);
begin
   Localiza(datm_favor.qry_favor_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_Favor.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_favor.qry_favor_CD_FAVORECIDO.AsString;
  // Apaga o campo de pesquisa 
  edt_chave.Text := '';
  datm_favor.qry_favor_.Close;
  datm_favor.qry_favor_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_favor.qry_favor_.Open;
  Localiza(datm_favor.qry_favor_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_Favor.pgctrl_favorChange(Sender: TObject);
begin
  if (pgctrl_favor.ActivePage = ts_lista ) then
  begin
    dbnvg.Enabled := True;
    edt_chave.Enabled := True;
    cb_ordem.Enabled := True;
  end
  else if (pgctrl_favor.ActivePage = ts_dados_basicos ) then
  begin
    dbnvg.Enabled := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled := False;
  end
  Else If (pgctrl_favor.ActivePage = tsContas ) then
  Begin
    pgctrl_favor_contas.ActivePage := tsListaContas;
    datm_favor.qry_favor_contas.Close;
    datm_favor.qry_favor_contas.ParamByname('CD_FAVORECIDO').AsString := datm_favor.qry_favor_CD_FAVORECIDO.AsString;
    datm_favor.qry_favor_contas.Open;
  End;
end;

function Tfrm_favor.Grava;
begin
  If (pgctrl_favor.ActivePage = ts_dados_basicos) Or (pgctrl_favor.ActivePage = ts_lista) Then
  Begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_favor.qry_favor_.State in [dsInsert, dsEdit] ) then
         datm_favor.qry_favor_.Post;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
         datm_favor.qry_favor_.Cancel;
         if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
         TrataErro(E);
         Grava := False;
      end;
    end;
  End
  Else If (pgctrl_favor.ActivePage = tsContas) Then
  Begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_favor.qry_favor_contas.State in [dsInsert, dsEdit] ) then
         datm_favor.qry_favor_contas.Post;
      datm_main.db_broker.Commit;
      datm_favor.qry_favor_contas.Close;
      datm_favor.qry_favor_contas.Open;
      Grava := True;
    except
      on E: Exception do
      begin
         datm_favor.qry_favor_contas.Cancel;
         if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
         TrataErro(E);
         Grava := False;
      end;
    end;
  End;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_favor.Consiste;
begin
  if Not lNaoConsiste then
  begin
    if dbedt_nm_favor.Text = '' then
    begin
      BoxMensagem('Campo "Descrição" deve ser preenchido!', 2);
      dbedt_nm_favor.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  // C.G.C.
  if Not CNPJ(dbedt_cnpj_empresa.Text) then
  begin
    pgctrl_favor.ActivePage := ts_dados_basicos;
    dbedt_cnpj_empresa.SetFocus;
    lCNPJ    := True;
    Consiste := False;
    Exit;
  end;

  // C.P.F.
  if Not CPF(dbedt_cpf_empresa.Text) then
  begin
    pgctrl_favor.ActivePage := ts_dados_basicos;
    dbedt_cpf_empresa.SetFocus;
    lCPF := True;
    Consiste := False;
    Exit;
  end;

  // Conta Contábil
  if Not lNaoConsiste then
  begin
    if ( Trim( dbedt_cd_ct_contabil.Text ) = '' ) then
    begin
      BoxMensagem('Campo Conta Contábil deve ser preenchido!', 2);
      pgctrl_favor.ActivePage := ts_dados_basicos;
      dbedt_cd_ct_contabil.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  if ( Trim( dbedt_cd_ct_contabil.Text ) <> '' ) and
     ( Trim( dbedt_nm_ct_contabil.Text ) = '' ) then
  begin
     if datm_favor.qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then // RM Saldus
       BoxMensagem( 'Conta inválida!', 2 )
    else // ContMaster/SI
       BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2 );
    pgctrl_favor.ActivePage := ts_dados_basicos;
    dbedt_cd_ct_contabil.SetFocus;
    Consiste := False;
    Exit;
  end;

  if datm_favor.qry_favor_.State in [dsEdit, dsInsert] then
  begin
    ValidCodigo( dbedt_cd_banco );
    if dbedt_cd_banco.Text <> '' Then
    begin
      if dbedt_nm_banco.Text = '' Then
      begin
        BoxMensagem('Código do Banco inválido!',2);
        Consiste := False;
        dbedt_cd_banco.SetFocus;
        Exit;
      end;
    end;

    ValidCodigo( dbedt_cd_recol );
    if dbedt_cd_recol.Text <> '' Then
    begin
      if dbedt_nm_natureza.Text = '' Then
      begin
        BoxMensagem('Código do Recolhimento inválido!',2);
        Consiste := False;
        dbedt_cd_recol.SetFocus;
        Exit;
      end;
    end;
  end;

  if pgctrl_favor_contas.ActivePage = tsDadosBasicosContas then
  begin
    if dbedt_cd_rateio.Text <> '' then
    begin
      if dbedt_nm_rateio.Text = '' Then
      begin
        BoxMensagem('Código do Rateio inválido!',2);
        pgctrl_favor.ActivePage := tsDadosBasicosContas;
        Consiste := False;
        dbedt_cd_rateio.SetFocus;
        Exit;
      end;
    end;
  end;
  Consiste := True;
end;

procedure Tfrm_favor.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_Favor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_favor do
    begin
      qry_ct_contabil_.Close;
      qry_ct_contabilRM_.Close;
      qry_favor_.Close;
      tbl_yesno_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_Favor.dbg_favorDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_favor.qry_favor_CD_FAVORECIDO.AsString;
    except
      try
        Cons_Online_Texto := datm_favor.qry_favor_CD_FAVORECIDO.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código do Favorecido !', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_Favor.dbg_favorKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbg_favorDblClick(Sender);
end;

procedure Tfrm_Favor.dbedt_nm_favorChange(Sender: TObject);
begin
  if ( datm_favor.qry_favor_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_Favor.pgctrl_favorChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_Favor.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_favor.qry_favor_.State in [dsEdit] ) and st_modificar ) or
     ( datm_favor.qry_favor_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Favorecido foi alterado.' + #13#10 +
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

procedure Tfrm_Favor.dbedt_CNPJ_EMPRESAExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_Favor.dbedt_CPF_EMPRESAExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_Favor.btn_co_ct_contabilClick(Sender: TObject);
begin
  if datm_favor.qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
  begin
    Cons_On_line( 'DBBROKER', 'TCONTABIL_PLANO', datm_favor.qry_favor_CD_CT_CONTABIL,
                  'Contas Contábeis', 8,
                  'SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "' + str_cd_coligada + '"',
                  'TQuery' );
  end
  else
  begin
    Cons_On_line( 'DBBROKER', 'TCT_CONTABIL',
                  datm_favor.qry_favor_CD_CT_CONTABIL,
                  'Contas Contábeis', 37, '' ,'TTable');
  end;
  dbedt_cd_ct_contabilExit(nil);
end;

procedure Tfrm_Favor.dblkpcbox_controla_irExit(Sender: TObject);
begin
  if datm_favor.qry_favor_IN_CONTROLA_IR.AsBoolean then
  begin
    // dbedt_cd_ct_contabil.Color    := clWindow;
    // dbedt_cd_ct_contabil.ReadOnly := False;
    // dbedt_cd_ct_contabil.TabStop  := True;
    // btn_co_ct_contabil.Enabled := True;
    dbedt_cd_recol.Color       := clWindow;
    dbedt_cd_recol.ReadOnly    := False;
    dbedt_cd_recol.TabStop     := True;
    btn_co_recol.Enabled       := True;
  end
  else
  begin
    if datm_favor.qry_favor_.State in [dsInsert, dsEdit] then
    begin
      // datm_favor.qry_favor_CD_CT_CONTABIL.AsString := '';
      datm_favor.qry_favor_CD_RECOL.AsString := '';
    end;
    // dbedt_nm_ct_contabil.Text  := '';
    // dbedt_cd_ct_contabil.Color    := clMenu;
    // dbedt_cd_ct_contabil.ReadOnly := True;
    // dbedt_cd_ct_contabil.TabStop  := False;
    // btn_co_ct_contabil.Enabled := False;
    dbedt_nm_natureza.Text     := '';
    dbedt_cd_recol.Color       := clMenu;
    dbedt_cd_recol.ReadOnly    := True;
    dbedt_cd_recol.TabStop     := False;
    btn_co_recol.Enabled       := False;
    // if pgctrl_favor.ActivePage = ts_dados_basicos then dbedt_nm_favor.SetFocus;
  end;
end;

procedure Tfrm_Favor.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;


procedure Tfrm_Favor.btn_co_recolClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TCD_RECOL_IR',
                datm_favor.qry_favor_CD_RECOL ,
                'Recolhimento de I.R.', 25, '' ,'TTable');
end;

procedure Tfrm_Favor.dbedt_cd_recolExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_Favor.dbedt_cd_recolKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_recol       then btn_co_recolClick(btn_co_recol);
    if Sender = dbedt_cd_ct_contabil then btn_co_ct_contabilClick(btn_co_ct_contabil);
    if Sender = dbedt_cd_banco       then btn_co_bancoClick(btn_co_banco);
    if Sender = EditCdContabil       then BtncontaContabilClick(BtncontaContabil);
    if Sender = dbedt_cd_rateio      then btn_rateioClick(btn_rateio);
  end;
end;

procedure Tfrm_Favor.dblkpcbox_tp_pessoaClick(Sender: TObject);
begin
  TipoPessoa;
end;

procedure Tfrm_Favor.TipoPessoa;
begin
  if datm_favor.qry_favor_CD_TIPO_PESSOA.AsString = '1' then
  begin
    dbedt_CNPJ_EMPRESA.Enabled := True;
    dbedt_IE_EMPRESA.Enabled   := True;
    dbedt_CNPJ_EMPRESA.Color   := clWindow;
    dbedt_IE_EMPRESA.Color     := clWindow;

    dbedt_CPF_EMPRESA.Enabled  := False;
    dbedt_NR_INSS.Enabled      := False;
    dbedt_CPF_EMPRESA.Color    := clMenu;
    dbedt_NR_INSS.Color        := clMenu;

    dblkpcbox_transp.Enabled   := False;
    dblkpcbox_transp.Color     := clMenu;

    if datm_favor.qry_favor_.State in [dsEdit, dsInsert] then
    begin
      datm_favor.qry_favor_CPF_EMPRESA.AsString := '';
      datm_favor.qry_favor_NR_INSS.AsString     := '';
    end;
  end
  else
  begin
    dbedt_CNPJ_EMPRESA.Enabled := False;
    dbedt_IE_EMPRESA.Enabled   := False;
    dbedt_CNPJ_EMPRESA.Color   := clMenu;
    dbedt_IE_EMPRESA.Color     := clMenu;

    dbedt_CPF_EMPRESA.Enabled  := True;
    dbedt_NR_INSS.Enabled      := True;
    dbedt_CPF_EMPRESA.Color    := clWindow;
    dbedt_NR_INSS.Color        := clWindow;

    dblkpcbox_transp.Enabled  := True;
    dblkpcbox_transp.Color    := clwindow;

    if datm_favor.qry_favor_.State in [dsEdit, dsInsert] then
    begin
      datm_favor.qry_favor_CGC_EMPRESA.AsString := '';
      datm_favor.qry_favor_IE_EMPRESA.AsString  := '';
    end;
  end
end;

procedure Tfrm_Favor.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  edt_chave.SetFocus;
end;

procedure Tfrm_Favor.btn_co_bancoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2216';
  Application.CreateForm(Tfrm_banco, frm_banco);
  frm_banco.Cons_OnLine := datm_favor.qry_favor_CD_BANCO;
  with frm_banco do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_favor.qry_favor_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
         datm_favor.qry_favor_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_favor do
  begin
    qry_banco_.Close;
    qry_banco_.Prepare;
    qry_banco_.Open;
  end;
  vStr_cd_modulo := st_modulo;
  str_cd_rotina := st_rotina;
  dbedt_cd_bancoExit(nil);
end;

procedure Tfrm_Favor.dbedt_cd_bancoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;


procedure Tfrm_Favor.dbedt_cd_acessoEnter(Sender: TObject);
begin
  cd_acesso := dbedt_cd_acesso.Text;
end;

procedure Tfrm_Favor.dbedt_cd_auxEnter(Sender: TObject);
begin
  cd_aux := dbedt_cd_aux.Text;
end;

procedure Tfrm_Favor.dbedt_cd_acessoExit(Sender: TObject);
begin
  if dbedt_cd_acesso.Text = cd_acesso then Exit;
  with datm_favor do
  begin
    if ( Trim( dbedt_cd_acesso.Text ) <> '' ) and ( Trim( dbedt_cd_aux.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_.Close;
      qry_ct_contabil_unica_.ParamByName('CD_ACESSO_AUX').AsString := Trim( dbedt_cd_acesso.Text ) + Trim( dbedt_cd_aux.Text );
      qry_ct_contabil_unica_.Prepare;
      qry_ct_contabil_unica_.Open;
      if qry_ct_contabil_unica_.RecordCount > 0 then
      begin
        if qry_favor_.State in [dsEdit, dsInsert] then  qry_favor_CD_CT_CONTABIL.AsString := qry_ct_contabil_unica_CD_CT_CONTABIL.AsString;
      end
      else
      begin
        BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2);
      end;
      qry_ct_contabil_unica_.Close;
    end;
  end;
end;

procedure Tfrm_Favor.dbedt_cd_auxExit(Sender: TObject);
begin
  if dbedt_cd_aux.Text = cd_aux then Exit;
  with datm_favor do
  begin
    if ( Trim( dbedt_cd_acesso.Text ) <> '' ) and ( Trim( dbedt_cd_aux.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_.Close;
      qry_ct_contabil_unica_.ParamByName('CD_ACESSO_AUX').AsString := Trim( dbedt_cd_acesso.Text ) + Trim( dbedt_cd_aux.Text );
      qry_ct_contabil_unica_.Prepare;
      qry_ct_contabil_unica_.Open;
      if qry_ct_contabil_unica_.RecordCount > 0 then
      begin
        if qry_favor_.State in [dsEdit, dsInsert] then qry_favor_CD_CT_CONTABIL.AsString := qry_ct_contabil_unica_CD_CT_CONTABIL.AsString;
      end
      else
      begin
        BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2 );
      end;
      qry_ct_contabil_unica_.Close;
    end;
  end;
end;

procedure Tfrm_Favor.dbedt_cd_ct_contabilExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_Favor.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbg_favorDblClick(nil);
end;
                     
procedure Tfrm_Favor.BtncontaContabilClick(Sender: TObject);
begin
  if Sender Is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_favor.qry_favor_contas) then Exit;
    Btn_Mi( False, True, True, False );
    datm_favor.qry_favor_contasCD_CT_CONTABIL.AsString := ConsultaOnLineExSQL('select CD_CT_CONTABIL, NM_CT_CONTABIL, CD_ACESSO, CD_AUX from TCT_CONTABIL where ANO_CONTA = ' + IntToStr(YearOf(dt_server)), 'Contas Contábeis',
                                                                             ['CD_CT_CONTABIL', 'NM_CT_CONTABIL', 'CD_ACESSO', 'CD_AUX'],
                                                                             ['Código',         'Descrição',      'Acesso',    'Aux'   ],
                                                                             'CD_CT_CONTABIL', nil, EditCdContabil.Text);
  end
  else
    EditNMContabil.Text                                := ConsultaLookUpSQL('select NM_CT_CONTABIL from TCT_CONTABIL ' +
                                                                            ' WHERE CD_CT_CONTABIL = "' + EditCdContabil.Text + '" ' +
                                                                            ' AND ANO_CONTA = ' + IntToStr(YearOf(dt_server)),'NM_CT_CONTABIL');
end;

procedure Tfrm_Favor.btn_rateioClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_favor.qry_favor_contas) then Exit;
      datm_favor.qry_favor_contasCD_RATEIO.AsString := ConsultaOnLineEx('TRATEIO','Rateios',['CD_RATEIO','NM_RATEIO'],['Código','Descrição'],'CD_RATEIO',frm_main.mi_cad_fin_conta_gerencial)
  end
  else
    dbedt_nm_rateio.Text := ConsultaLookUP('TRATEIO','CD_RATEIO',dbedt_cd_rateio.Text,'NM_RATEIO')
end;

procedure Tfrm_Favor.dbedt_cd_rateioExit(Sender: TObject);
begin
  if Trim(dbedt_cd_rateio.Text) <> '' then
    dbedt_cd_rateio.Text := Copy('0000', 1, 4 - Length( dbedt_cd_rateio.Text)) +  dbedt_cd_rateio.Text;
end;

end.

