unit PGSM093;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, Funcoes;

type
  Tfrm_conta = class(TForm)
    pgctrl_conta: TPageControl;
    ts_lista: TTabSheet;
    dbg_conta: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_cnt: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    lbl_ativo: TLabel;
    Label5: TLabel;
    dbedt_cd_conta: TDBEdit;
    dbedt_nm_conta: TDBEdit;
    dblkpcbox_ativo_conta: TDBLookupComboBox;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    dblkpcbox_tipo_conta: TDBLookupComboBox;
    lbl_ct_contabil: TLabel;
    dbedt_cd_banco: TDBEdit;
    Label8: TLabel;
    btn_co_banco: TSpeedButton;
    dbedt_nm_banco: TDBEdit;
    dbedt_cd_coligada: TDBEdit;
    dbedt_nm_coligada: TDBEdit;
    Label10: TLabel;
    btn_co_coligada: TSpeedButton;
    lbl_in_baixa_acerto: TLabel;
    dblkpcbox_in_baixa_acerto: TDBLookupComboBox;
    lbl_acesso: TLabel;
    dbedt_cd_acesso: TDBEdit;
    lbl_aux: TLabel;
    dbedt_cd_aux: TDBEdit;
    dbedt_cd_ct_contabil: TDBEdit;
    dbedt_nm_ct_contabil: TDBEdit;
    btn_co_ct_contabil: TSpeedButton;
    lbl_exibe: TLabel;
    dblckpbox_exibe: TDBLookupComboBox;
    Label6: TLabel;
    btn_co_unid_neg: TSpeedButton;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
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
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_contaChange(Sender: TObject);
    procedure dbg_contaDblClick(Sender: TObject);
    procedure dbg_contaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedt_nm_contaChange(Sender: TObject);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure dbedt_cd_bancoExit(Sender: TObject);
    procedure pgctrl_contaChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure btn_co_coligadaClick(Sender: TObject);
    procedure dbedt_cd_coligadaExit(Sender: TObject);
    procedure dbedt_cd_ct_contabilExit(Sender: TObject);
    procedure dblkpcbox_tipo_contaClick(Sender: TObject);
    procedure dbedt_cd_contaExit(Sender: TObject);
    procedure dbedt_nm_contaExit(Sender: TObject);
    procedure dblkpcbox_tipo_contaExit(Sender: TObject);
    procedure dblkpcbox_ativo_contaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_coligadaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dbedt_cd_acessoEnter(Sender: TObject);
    procedure dbedt_cd_auxEnter(Sender: TObject);
    procedure dbedt_cd_acessoExit(Sender: TObject);
    procedure dbedt_cd_auxExit(Sender: TObject);
    procedure btn_co_ct_contabilClick(Sender: TObject);
    procedure dbedt_cd_ct_contabilRMExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure dbedt_cd_unid_negExit(Sender: TObject);
  private
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir   : boolean;
    cd_acesso, cd_aux : String[1];
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    lNaoConsiste : Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_conta: Tfrm_conta;

implementation

uses PGSM018, PGSM094, GSMLIB, PGGP001, PGGP017, PGSM041, PGSM096, PGSM148;

{$R *.DFM}

procedure Tfrm_conta.btn_incluirClick(Sender: TObject);
begin
   btn_incluir.Enabled := False;
   mi_incluir.Enabled  := False;
   btn_excluir.Enabled := False;
   mi_excluir.Enabled  := False;
   with datm_conta do
   begin
     qry_conta_.DisableControls;
     qry_conta_.Cancel;
     qry_conta_.Append;
     qry_conta_.EnableControls;
     qry_conta_CD_COLIGADA.AsString := str_cd_coligada;
     qry_conta_IN_ATIVO.AsString    := '1';
     qry_conta_TP_CONTA.AsString    := '1';
     qry_conta_IN_BAIXA_ACERTO.AsString := '1';
     qry_conta_IN_EXIBE.AsString := '1';
   end;
   pgctrl_conta.ActivePage:=ts_dados_basicos;
   dbedt_cd_coligada.SetFocus;
   pgctrl_contaChange(nil);
   dblkpcbox_tipo_contaClick(Nil);
end;

procedure Tfrm_conta.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_conta.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_conta.Cancelar;
begin
  try
    if datm_conta.qry_conta_.State in [dsInsert, dsEdit] then
    begin
      datm_conta.qry_conta_.Cancel;
      pgctrl_conta.ActivePage := ts_dados_basicos;
      dbedt_nm_conta.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_conta.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Esta Conta será excluída! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_conta.qry_conta_.Delete;
    datm_main.db_broker.Commit;
    pgctrl_conta.ActivePage:=ts_lista;
  except
    on E: Exception do
    begin
      datm_conta.qry_conta_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
end;

procedure Tfrm_conta.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_conta.edt_chaveChange(Sender: TObject);
begin
   Localiza(datm_conta.qry_conta_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_conta.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_conta.qry_conta_CD_conta.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_conta.qry_conta_.Close;
  datm_conta.qry_conta_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_conta.qry_conta_.Open;
  Localiza(datm_conta.qry_conta_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_conta.pgctrl_contaChange(Sender: TObject);
begin
  if (pgctrl_conta.ActivePage = ts_lista ) then
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

procedure Tfrm_conta.dbg_contaDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_conta.qry_conta_CD_CONTA.AsString;
    except
      try
        Cons_Online_Texto := datm_conta.qry_conta_CD_CONTA.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código da Conta !', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_conta.dbg_contaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbg_contaDblClick(Sender);
end;

procedure Tfrm_conta.FormCreate(Sender: TObject);
begin
  { Cria o DataModule da conta }

  Application.CreateForm(Tdatm_conta, datm_conta );

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  with datm_conta do
  begin
    tbl_yesno_.Open;

    qry_ct_contabilRM_.Close;
    qry_ct_contabilRM_.ParamByName('CD_COLIGADA').AsString := str_cd_coligada;
    qry_ct_contabilRM_.Prepare;
    qry_ct_contabilRM_.Open;

    qry_param_.Close;
    qry_param_.Prepare;
    qry_param_.Open;
    if qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then {RM Saldus}
    begin
      {Acesso}
      lbl_acesso.Visible                      := False;
      dbedt_cd_acesso.Visible                 := False;
      {Aux}
      lbl_aux.Visible                         := False;
      dbedt_cd_aux.Visible                    := False;
      {Conta Contábil}
      lbl_ct_contabil.Left                    := lbl_acesso.Left;
      dbedt_cd_ct_contabil.Left               := dbedt_cd_acesso.Left;
      dbedt_nm_ct_contabil.Left               := dbedt_cd_acesso.Left + 80;
      dbedt_nm_ct_contabil.Width              := dbedt_nm_ct_contabil.Width + 90;
      dbedt_nm_ct_contabil.DataField          := 'LookCtContabilRM';
      qry_conta_.FieldByName('CD_CT_CONTABIL').EditMask := '';
    end
    else
    begin {ContMaster/SI}
      {Acesso}
      lbl_acesso.Visible                      := True;
      dbedt_cd_acesso.Visible                 := True;
      {Aux}
      lbl_aux.Visible                         := True;
      dbedt_cd_aux.Visible                    := True;
      {Conta Contábil}
      dbedt_nm_ct_contabil.DataField          := 'LookCtContabil';
      qry_conta_.FieldByName('CD_CT_CONTABIL').EditMask := '999.99.99999;0;_';
    end;

    qry_coligada_.Open;
    qry_tp_conta_.Open;
    qry_banco_.Open;
    qry_conta_.SQL[2] := 'NM_CONTA';
    qry_conta_.Prepare;
    qry_conta_.Open;
  end;

  a_str_indices[0] := 'CD_CONTA';
  a_str_indices[1] := 'NM_CONTA';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir );

  datm_conta.ds_conta.AutoEdit     := st_modificar;

  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;
end;

procedure Tfrm_conta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_conta do
    begin
      qry_ct_contabilRM_.Close;
      qry_ct_contabil_.Close;
      qry_coligada_.Close;
      qry_tp_conta_.Close;
      qry_banco_.Close;
      qry_conta_.Close;
      qry_param_.Close;
      tbl_yesno_.Close;
      free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

function Tfrm_conta.Grava;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_conta.qry_conta_.State in [dsInsert, dsEdit] ) then
    begin
      datm_conta.qry_conta_.Post;
    end;
    datm_main.db_broker.Commit;
    Grava:=True;
  except
    on E: Exception do
    begin
      datm_conta.qry_conta_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_conta.Consiste : Boolean;
begin
  Consiste := True;
  {Coligada}
  if Not lNaoConsiste then
  begin
    if dbedt_cd_coligada.Text = '' then
    begin
      BoxMensagem('Campo Coligada deve ser preenchido!', 2);
      dbedt_cd_coligada.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  if datm_conta.qry_conta_.State in [dsInsert, dsEdit] then
  ValidCodigo( dbedt_cd_coligada );
  if dbedt_cd_coligada.Text <> '' Then
  begin
    if ( dbedt_nm_coligada.Text = '' ) then
    begin
      BoxMensagem('Coligada inválida!',2);
      dbedt_cd_coligada.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  {Unidade de Negócio}
  if Not lNaoConsiste then
  begin
    if dbedt_cd_unid_neg.Text = '' then
    begin
      BoxMensagem('Campo Unidade de Negócio deve ser preenchido!', 2);
      dbedt_cd_unid_neg.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  if datm_conta.qry_conta_.State in [dsInsert, dsEdit] then
  ValidCodigo( dbedt_cd_unid_neg );
  if dbedt_cd_unid_neg.Text <> '' Then
  begin
    if ( dbedt_nm_unid_neg.Text = '' ) then
    begin
      BoxMensagem( 'Unidade de Negócio inválida!', 2 );
      dbedt_cd_unid_neg.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  {Conta Caixa}
  if datm_conta.qry_conta_.State in [dsInsert, dsEdit] then
  ValidCodigo( dbedt_cd_conta );
  if Not lNaoConsiste then
  begin
    if dbedt_cd_conta.Text = '' then
    begin
      BoxMensagem('Campo Conta Caixa deve ser preenchido!', 2);
      dbedt_cd_conta.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  {Descrição}
  if Not lNaoConsiste then
  begin
    if dbedt_nm_conta.Text = '' then
    begin
      BoxMensagem('Campo ''Descrição'' deve ser preenchido!', 2);
      dbedt_nm_conta.SetFocus;
      Consiste := False;
      exit;
    end;
  end;

  {Banco}
  if datm_conta.qry_conta_TP_CONTA.AsString = '2' then
  begin
    if Not lNaoConsiste then
    begin
      if dbedt_cd_banco.Text = '' then
      begin
        BoxMensagem('Campo Banco deve ser preenchido!', 2);
        dbedt_cd_banco.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  if datm_conta.qry_conta_.State in [dsInsert, dsEdit] then
  ValidCodigo( dbedt_cd_banco );
  if dbedt_cd_banco.Text <> '' Then
  begin
    if dbedt_nm_banco.Text = '' then
    begin
      BoxMensagem('Código do banco inválido!',2);
      dbedt_cd_banco.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  {Conta Contábil}
  if Not lNaoConsiste then
  begin
    if ( Trim( dbedt_cd_ct_contabil.Text ) = '' ) then
    begin
      BoxMensagem('Campo Conta Contábil deve ser preenchido!', 2);
      pgctrl_conta.ActivePage := ts_dados_basicos;
      dbedt_cd_ct_contabil.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  if ( Trim( dbedt_cd_ct_contabil.Text ) <> '' ) and
     ( Trim( dbedt_nm_ct_contabil.Text ) = '' ) then
  begin
     if datm_conta.qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then {RM Saldus}
       BoxMensagem( 'Conta inválida!', 2 )
    else {ContMaster/SI}
       BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2 );
    pgctrl_conta.ActivePage := ts_dados_basicos;
    dbedt_cd_ct_contabil.SetFocus;
    Consiste := False;
    Exit;
  end;
end;

procedure Tfrm_conta.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_conta.dbedt_nm_contaChange(Sender: TObject);
begin
  if ( datm_conta.qry_conta_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_conta.btn_co_bancoClick(Sender: TObject);
begin
  vStr_cd_modulo:='22';
  str_cd_rotina := '2216';

  if not ( datm_conta.qry_conta_.State in [dsInsert, dsEdit] ) then
    datm_conta.qry_conta_.Edit;

  Application.CreateForm(Tfrm_banco, frm_banco);
  frm_banco.Cons_OnLine := datm_conta.qry_conta_CD_BANCO;
  With frm_banco Do Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_conta.qry_conta_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
       datm_conta.qry_conta_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  vStr_cd_modulo:='22';
  str_cd_rotina := '2227';

  with datm_conta do
  begin
    datm_conta.qry_banco_.Close;
    datm_conta.qry_banco_.Prepare;
    datm_conta.qry_banco_.Open;
  end;
  dbedt_cd_bancoExit(Sender);
end;

procedure Tfrm_conta.dbedt_cd_bancoExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_conta.pgctrl_contaChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_conta.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_conta.qry_conta_.State in [dsEdit] ) and st_modificar ) or
     ( datm_conta.qry_conta_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Conta Caixa foi alterado.' + #13#10 +
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

procedure Tfrm_conta.btn_co_coligadaClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo              := 14;
  datm_consulta_padrao.Tabela.DatabaseName := 'DBBROKER';
  datm_consulta_padrao.Tabela.TableName    := 'TCOLIGADA';

  datm_consulta_padrao.Tabela.Filtered     := False;
  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.st_modificar         := True; // st_modificar;

  with frm_consulta_padrao do
  begin
    Caption := Caption + ' Contas Contábeis ';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;

  if not ( datm_conta.qry_conta_.State in [dsInsert, dsEdit] ) then
    datm_conta.qry_conta_.Edit;
  dbedt_cd_coligada.Text := frm_consulta_padrao.Cons_OnLine_Texto;
  dbedt_cd_coligadaExit(nil);

end;

procedure Tfrm_conta.dbedt_cd_coligadaExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_conta.dbedt_cd_ct_contabilExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_conta.dblkpcbox_tipo_contaClick(Sender: TObject);
begin
  if datm_conta.qry_conta_TP_CONTA.AsString = '3' then
  begin
    lbl_in_baixa_acerto.Visible       := True;
    dblkpcbox_in_baixa_acerto.Visible := True;
  end
  else
  begin
    lbl_in_baixa_acerto.Visible       := False;
    dblkpcbox_in_baixa_acerto.Visible := False;
  end;

  if datm_conta.qry_conta_TP_CONTA.AsString = '2' then
  begin
     dbedt_cd_banco.Enabled := True;
     dbedt_cd_banco.Color   := clWindow;
     dbedt_cd_banco.TabStop := True;
     btn_co_banco.Enabled   := True;
  end
  else
  begin
     dbedt_cd_banco.Enabled := False;
     dbedt_cd_banco.Color   := clMenu;
     dbedt_cd_banco.TabStop := False;
     btn_co_banco.Enabled   := False;
     dbedt_cd_banco.Text    := '';
     dbedt_nm_banco.Text    := '';
     datm_conta.qry_conta_CD_BANCO.AsString := '';
  end;

  if ( datm_conta.qry_conta_TP_CONTA.AsString = '2' ) or
     ( datm_conta.qry_conta_TP_CONTA.AsString = '1' ) then
  begin
    dbedt_cd_ct_contabil.Enabled := True;
    dbedt_cd_ct_contabil.Color   := clWindow;
    dbedt_cd_ct_contabil.TabStop := True;
    btn_co_ct_contabil.Enabled   := True;
  end
  else
  begin
    dbedt_cd_ct_contabil.Enabled := False;
    dbedt_cd_ct_contabil.Color   := clMenu;
    dbedt_cd_ct_contabil.TabStop := False;
    btn_co_ct_contabil.Enabled   := False;
    dbedt_cd_ct_contabil.Text    := '';
    datm_conta.qry_conta_CD_CT_CONTABIL.AsString := '';
  end;

  dbedt_nm_contaChange(nil);

end;

procedure Tfrm_conta.dbedt_cd_contaExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_conta.dbedt_nm_contaExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_conta.dblkpcbox_tipo_contaExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_conta.dblkpcbox_ativo_contaExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;


procedure Tfrm_conta.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_conta.dbedt_cd_coligadaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_coligada      then btn_co_coligadaClick(nil);
    if Sender = dbedt_cd_banco         then btn_co_bancoClick(nil);
    if Sender = dbedt_cd_ct_contabil   then btn_co_ct_contabilClick(nil);
    if Sender = dbedt_cd_unid_neg      then btn_co_unid_negClick(nil);
  end;
end;

procedure Tfrm_conta.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_conta.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_conta.dbedt_cd_acessoEnter(Sender: TObject);
begin
  cd_acesso := dbedt_cd_acesso.Text;
end;

procedure Tfrm_conta.dbedt_cd_auxEnter(Sender: TObject);
begin
  cd_aux := dbedt_cd_aux.Text;
end;

procedure Tfrm_conta.dbedt_cd_acessoExit(Sender: TObject);
begin
  if dbedt_cd_acesso.Text = cd_acesso then Exit;
  with datm_conta do
  begin
    if ( Trim( dbedt_cd_acesso.Text ) <> '' ) and ( Trim( dbedt_cd_aux.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_.Close;
      qry_ct_contabil_unica_.ParamByName('CD_ACESSO_AUX').AsString := Trim( dbedt_cd_acesso.Text ) + Trim( dbedt_cd_aux.Text );
      qry_ct_contabil_unica_.Prepare;
      qry_ct_contabil_unica_.Open;
      if qry_ct_contabil_unica_.RecordCount > 0 then
      begin
        if qry_conta_.State in [dsEdit, dsInsert] then  qry_conta_CD_CT_CONTABIL.AsString := qry_ct_contabil_unica_CD_CT_CONTABIL.AsString;
      end
      else
      begin
        BoxMensagem( 'Conta Contábil inválida!', 2);
      end;
      qry_ct_contabil_unica_.Close;
    end;
  end;
end;

procedure Tfrm_conta.dbedt_cd_auxExit(Sender: TObject);
begin
  if dbedt_cd_aux.Text = cd_aux then Exit;
  with datm_conta do
  begin
    if ( Trim( dbedt_cd_acesso.Text ) <> '' ) and ( Trim( dbedt_cd_aux.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_.Close;
      qry_ct_contabil_unica_.ParamByName('CD_ACESSO_AUX').AsString := Trim( dbedt_cd_acesso.Text ) + Trim( dbedt_cd_aux.Text );
      qry_ct_contabil_unica_.Prepare;
      qry_ct_contabil_unica_.Open;
      if qry_ct_contabil_unica_.RecordCount > 0 then
      begin
        if qry_conta_.State in [dsEdit, dsInsert] then qry_conta_CD_CT_CONTABIL.AsString := qry_ct_contabil_unica_CD_CT_CONTABIL.AsString;
      end
      else
      begin
        BoxMensagem( 'Conta Contábil inválida!', 2 );
      end;
      qry_ct_contabil_unica_.Close;
    end;
  end;
end;

procedure Tfrm_conta.btn_co_ct_contabilClick(Sender: TObject);
begin
  if datm_conta.qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
  begin
    Cons_On_line( 'DBBROKER', 'TCONTABIL_PLANO', datm_conta.qry_conta_CD_CT_CONTABIL,
                  'Contas Contábeis', 8,
                  'SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "' + str_cd_coligada + '"',
                  'TQuery' );
  end
  else
  begin
    Cons_On_line( 'DBBROKER', 'TCT_CONTABIL',
                  datm_conta.qry_conta_CD_CT_CONTABIL,
                  'Contas Contábeis', 37, '' ,'TTable');
  end;
  dbedt_cd_ct_contabilExit(nil);
end;


procedure Tfrm_conta.dbedt_cd_ct_contabilRMExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_conta.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_conta do
  begin
    Application.CreateForm( Tfrm_unidade, frm_unidade );
    with frm_unidade do
    begin
      Cons_OnLine := qry_conta_CD_UNID_NEG;
      lCons_OnLine := True;
      if ( st_modificar ) and Not ( qry_conta_.State in [dsEdit] ) then
         qry_conta_.Edit;
      Caption := Caption + ' [Consulta On-Line]';
      ShowModal;
      lCons_OnLine := False;
    end;

    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    dbedt_cd_unid_negExit(nil);
  end;
end;

procedure Tfrm_conta.dbedt_cd_unid_negExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

end.

