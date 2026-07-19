(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGSM041.PAS - Formulário - Cadastro de Contas Bancárias - frm_banco
Manutenção:
DATA:
*************************************************************************************************)
unit PGSM041;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBTables, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, Funcoes, DateUtils;

type
  Tfrm_banco = class(TForm)
    pgctrl_banco: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_nome: TLabel;
    lbl_cd_banco: TLabel;
    lblAtivo: TLabel;
    dbedt_nm_banco: TDBEdit;
    dbedt_cd_banco: TDBEdit;
    dblkpcbox_ativo: TDBLookupComboBox;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    dbedt_ap_banco: TDBEdit;
    lbl_apelido: TLabel;
    lbl_nr_conta: TLabel;
    dbedt_nr_conta: TDBEdit;
    Label2: TLabel;
    lbl_cd_agencia: TLabel;
    dbedt_cd_agencia: TDBEdit;
    lbl_nr_banco: TLabel;
    dbedt_nr_banco: TDBEdit;
    lbl_dac_agencia: TLabel;
    dbedt_dac_agencia: TDBEdit;
    lbl_ct_contabil: TLabel;
    dbedt_cd_ct_contabil: TDBEdit;
    btn_co_ct_contabil: TSpeedButton;
    lbl_acesso: TLabel;
    lbl_aux: TLabel;
    dbedt_cd_acesso: TDBEdit;
    dbedt_cd_aux: TDBEdit;
    lbl_nr_cheque: TLabel;
    dbedt_nr_cheque: TDBEdit;
    btn_co_nr_banco: TSpeedButton;
    dbedt_nm_bco: TDBEdit;
    dbedt_path_cob_aut_trans: TDBEdit;
    lbl_path_cob_aut_trans: TLabel;
    lbl_path_cob_aut_imp: TLabel;
    dbedt_path_cob_aut_imp: TDBEdit;
    lbl_tx_instrucao: TLabel;
    dbedt_tx_instrucao: TDBEdit;
    dbedt_nr_remessa: TDBEdit;
    Label1: TLabel;
    ts_ajuste_impressao: TTabSheet;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    dbedt_lvalor: TDBEdit;
    dbedt_cvalor: TDBEdit;
    dbedt_lextenso: TDBEdit;
    dbedt_cextenso: TDBEdit;
    dbedt_lextenso2: TDBEdit;
    dbedt_cextenso2: TDBEdit;
    dbedt_lfavor: TDBEdit;
    dbedt_cfavor: TDBEdit;
    dbedt_lcidade: TDBEdit;
    dbedt_ccidade: TDBEdit;
    dbedt_cdia: TDBEdit;
    dbedt_cmes: TDBEdit;
    dbedt_cano: TDBEdit;
    dbedt_anomask: TDBEdit;
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
    dbedt_nr_DOC: TDBEdit;
    Label14: TLabel;
    dbedt_nm_ct_contabil: TEdit;
    dbedt_ct_reduzida: TDBEdit;
    Label15: TLabel;
    dbcheck_integra: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_bancoChange(Sender: TObject);
    procedure pgctrl_bancoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_co_ct_contabilClick(Sender: TObject);
    procedure dbedt_cd_ct_contabilExit(Sender: TObject);
    procedure dbedt_cd_ct_contabilKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_acessoEnter(Sender: TObject);
    procedure dbedt_cd_auxEnter(Sender: TObject);
    procedure dbedt_cd_acessoExit(Sender: TObject);
    procedure dbedt_cd_auxExit(Sender: TObject);
    procedure dbedt_nr_chequeExit(Sender: TObject);
    procedure btn_co_nr_bancoClick(Sender: TObject);
    procedure dbedt_nr_bancoExit(Sender: TObject);
    procedure dbedt_nr_remessaExit(Sender: TObject);
    procedure dbedt_nr_remessaChange(Sender: TObject);
    procedure dbedt_lvalorChange(Sender: TObject);
    procedure dbedt_nr_DOCExit(Sender: TObject);
    procedure dbcheck_integraClick(Sender: TObject);
  private
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa, st_modulo, st_rotina : String;
    st_modificar, st_incluir, st_excluir : Boolean;
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
  frm_banco: Tfrm_banco;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGSM042, PGSM168, ConsOnLineEx;

procedure Tfrm_banco.FormCreate(Sender: TObject);
begin
  st_modulo    := vStr_cd_modulo;
  st_rotina    := str_cd_rotina;

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  // Inicializa o Data Module para Banco
  Application.CreateForm( Tdatm_banco, datm_banco );

  with datm_banco do
  begin
    ds_banco.AutoEdit := st_modificar;
    tbl_yesno_.Open;
    qry_banco_.Prepare;
    qry_banco_.SQL[2] := 'NM_BANCO';
    qry_banco_.DisableControls;
    qry_banco_.Open;
    qry_banco_.EnableControls;

    qry_bco_.Close;
    qry_bco_.Prepare;
    qry_bco_.Open;

  end;

  a_str_indices[0] := 'CD_BANCO';
  a_str_indices[1] := 'NM_BANCO';

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

procedure Tfrm_banco.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_banco.ActivePage := ts_lista;
  edt_chave.SetFocus;

  with datm_banco do
  begin
    qry_ct_contabilRM_.Close;
    qry_ct_contabilRM_.Prepare;
    qry_ct_contabilRM_.Open;

    qry_param_.Close;
    qry_param_.Prepare;
    qry_param_.Open;
    if qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then // RM Saldus
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
    end;
  end;
end;

procedure Tfrm_banco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_banco do
  begin
    qry_ct_contabil_.Close;
    qry_ct_contabilRM_.Close;
    qry_bco_.Close;
    tbl_yesno_.Close;
    qry_banco_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_banco.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine_Texto := datm_banco.qry_banco_CD_BANCO.AsString;
      except
        BoxMensagem('Não consegui retornar Código do Banco!', 2);
      end;
    Close;
  end;
end;

procedure Tfrm_banco.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_banco.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  with datm_banco do
  begin
    qry_banco_.DisableControls;
    qry_banco_.Cancel;
    qry_banco_.Append;
    qry_banco_.EnableControls;
    qry_banco_CD_BANCO.AsString  := UltCod( qry_ult_banco_, qry_ult_banco_ULTIMO );
    qry_banco_IN_ATIVO.AsString  := '1';
  end;
  pgctrl_banco.ActivePage := ts_dados_basicos;
  dbedt_nm_banco.SetFocus;
end;

procedure Tfrm_banco.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if (dbcheck_integra.Checked=True) and (dbedt_ct_reduzida.Text='')   then
  begin
    BoxMensagem('Campo conta reduzida deve ser preenchido se o banco for para integração!', 2);
    dbedt_ct_reduzida.SetFocus;
    Exit;
  end;
  if Not Consiste then Exit;
  if Not Grava    then Exit;
end;

procedure Tfrm_banco.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_banco.Cancelar;
begin
  try
    if datm_banco.qry_banco_.State in [dsInsert, dsEdit] then
    begin
      datm_banco.qry_banco_.Cancel;
      pgctrl_banco.ActivePage := ts_dados_basicos;
      dbedt_nm_banco.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_banco.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este banco será excluído! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_banco.qry_banco_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_banco.qry_banco_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  pgctrl_banco.ActivePage := ts_lista;
end;

procedure Tfrm_banco.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_banco.qry_banco_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_banco.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_banco.qry_banco_CD_BANCO.AsString;
  // Apaga o campo de pesquisa 
  edt_chave.Text := '';
  datm_banco.qry_banco_.Close;
  datm_banco.qry_banco_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_banco.qry_banco_.DisableControls;
  datm_banco.qry_banco_.Open;
  datm_banco.qry_banco_.EnableControls;
  Localiza(datm_banco.qry_banco_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

function Tfrm_banco.Consiste : Boolean;
begin
  if dbedt_nm_banco.Text = '' then
  begin
    BoxMensagem('Campo Nome deve ser preenchido!', 2);
    pgctrl_banco.ActivePage := ts_dados_basicos;
    dbedt_nm_banco.SetFocus;
    Consiste := False;
    Exit;
  end;

  // Conta Contábil
  if Not lNaoConsiste then
  begin
    if ( Trim( dbedt_cd_ct_contabil.Text ) = '' ) then
    begin
      BoxMensagem('Campo Conta Contábil deve ser preenchido!', 2);
      pgctrl_banco.ActivePage := ts_dados_basicos;
      dbedt_cd_ct_contabil.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  if ( Trim( dbedt_cd_ct_contabil.Text ) <> '' ) and
     ( Trim( dbedt_nm_ct_contabil.Text ) = '' ) then
  begin
    if datm_banco.qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then // RM Saldus
       BoxMensagem( 'Conta inválida!', 2 )
    else // ContMaster/SI
       BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2 );
    pgctrl_banco.ActivePage := ts_dados_basicos;
    dbedt_cd_ct_contabil.SetFocus;
    Consiste := False;
    Exit;
  end;

  // Nº Banco
  if datm_banco.qry_banco_.State in [dsInsert, dsEdit] then
  begin
    ValidCodigo( dbedt_nr_banco );
    if Trim( dbedt_nr_banco.Text ) <> '' then
    begin
      if ( dbedt_nm_bco.Text = '' ) then
      begin
        BoxMensagem( 'Nº Banco inválido ou inexistente!', 2);
        pgctrl_banco.ActivePage := ts_dados_basicos;
        dbedt_nr_banco.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  Consiste := True;
end;

function Tfrm_banco.Grava : Boolean;
begin
  // ATENÇÃO: Em 09/12/2004 o campo FORMCONT foi colocado como default "1".
  // Esse campo é utilizado na impressão de cheques e o banco que estiver como FORMCONT=1 não tem seu
  // cheque impresso duas vezes.
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_banco.qry_banco_.State in [dsInsert, dsEdit] ) then
    begin
      datm_banco.qry_banco_.Post;
      Pesquisa := datm_banco.qry_banco_CD_BANCO.AsString;
      datm_banco.qry_banco_.Close;
      datm_banco.qry_banco_.Prepare;
      datm_banco.qry_banco_.DisableControls;
      datm_banco.qry_banco_.Open;
      datm_banco.qry_banco_.EnableControls;
      Localiza(datm_banco.qry_banco_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_banco.qry_banco_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_banco.pgctrl_bancoChange(Sender: TObject);
begin
  if (pgctrl_banco.ActivePage = ts_lista ) then
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

  if (pgctrl_banco.ActivePage = ts_ajuste_impressao ) then
  begin
    Btn_Mi(false,false,false,false);
  end
  else
  begin
    Btn_Mi(true,false,false,true);
  end;
  
end;

procedure Tfrm_banco.pgctrl_bancoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_banco.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_banco.qry_banco_.State in [dsEdit] ) and st_modificar ) or
     ( datm_banco.qry_banco_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Contas Bancárias foi alterado.' + #13#10 +
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

procedure Tfrm_banco.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_banco.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_banco.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_banco.btn_co_ct_contabilClick(Sender: TObject);
begin
  if datm_banco.qry_banco_.State in [dsInsert, dsEdit] then
    Btn_Mi( False, True, True, False );

  if datm_banco.qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
  begin
    Cons_On_line( 'DBBROKER', 'TCONTABIL_PLANO', datm_banco.qry_banco_CD_CT_CONTABIL,
                  'Contas Contábeis', 8,
                  'SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "' + str_cd_coligada + '"',
                  'TQuery' );
  end
  else
  begin
    //Cons_On_line( 'DBBROKER', 'TCT_CONTABIL', datm_banco.qry_banco_CD_CT_CONTABIL, 'Contas Contábeis', 37, '' ,'TTable');
    if Sender Is TSpeedButton then
    begin
      if not PoeEmEdicao(datm_banco.qry_banco_) then
        Exit;
      datm_banco.qry_banco_CD_CT_CONTABIL.AsString := ConsultaOnLineExSQL('select CD_CT_CONTABIL, NM_CT_CONTABIL, CD_ACESSO, CD_AUX from TCT_CONTABIL where ANO_CONTA = ' + IntToStr(YearOf(dt_server)), 'Contas Contábeis',
                                                                               ['CD_CT_CONTABIL', 'NM_CT_CONTABIL', 'CD_ACESSO', 'CD_AUX'],
                                                                               ['Código',         'Descrição',      'Acesso',    'Aux'   ],
                                                                               'CD_CT_CONTABIL', frm_main.mi_cad_fin_conta_contabil, dbedt_cd_ct_contabil.Text);

    end
    else
    begin
      dbedt_nm_ct_contabil.Text                                := ConsultaLookUpSQL('select NM_CT_CONTABIL from TCT_CONTABIL ' +
                                                                                    ' WHERE CD_CT_CONTABIL = "' + dbedt_cd_ct_contabil.Text + '" ' +
                                                                                    ' AND ANO_CONTA = ' + IntToStr(YearOf(dt_server)),'NM_CT_CONTABIL');
    end;

  end;
//  dbedt_cd_ct_contabilExit(nil);
end;

procedure Tfrm_banco.dbedt_cd_ct_contabilExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_banco.dbedt_cd_ct_contabilKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_nr_banco       then btn_co_nr_bancoClick(btn_co_nr_banco);
    if Sender = dbedt_cd_ct_contabil then btn_co_ct_contabilClick(btn_co_ct_contabil);
  end;
end;

procedure Tfrm_banco.dbedt_cd_acessoEnter(Sender: TObject);
begin
  cd_acesso := dbedt_cd_acesso.Text;
end;

procedure Tfrm_banco.dbedt_cd_auxEnter(Sender: TObject);
begin
  cd_aux := dbedt_cd_aux.Text;
end;

procedure Tfrm_banco.dbedt_cd_acessoExit(Sender: TObject);
begin
  if dbedt_cd_acesso.Text = cd_acesso then Exit;
  with datm_banco do
  begin
    if ( Trim( dbedt_cd_acesso.Text ) <> '' ) and ( Trim( dbedt_cd_aux.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_.Close;
      qry_ct_contabil_unica_.ParamByName('CD_ACESSO_AUX').AsString := Trim( dbedt_cd_acesso.Text ) + Trim( dbedt_cd_aux.Text );
      qry_ct_contabil_unica_.Prepare;
      qry_ct_contabil_unica_.Open;
      if qry_ct_contabil_unica_.RecordCount > 0 then
      begin
        if qry_banco_.State in [dsEdit, dsInsert] then  qry_banco_CD_CT_CONTABIL.AsString := qry_ct_contabil_unica_CD_CT_CONTABIL.AsString;
      end
      else
      begin
        BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2);
      end;
      qry_ct_contabil_unica_.Close;
    end;
  end;
end;

procedure Tfrm_banco.dbedt_cd_auxExit(Sender: TObject);
begin
  if dbedt_cd_aux.Text = cd_aux then Exit;
  with datm_banco do
  begin
    if ( Trim( dbedt_cd_acesso.Text ) <> '' ) and ( Trim( dbedt_cd_aux.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_.Close;
      qry_ct_contabil_unica_.ParamByName('CD_ACESSO_AUX').AsString := Trim( dbedt_cd_acesso.Text ) + Trim( dbedt_cd_aux.Text );
      qry_ct_contabil_unica_.Prepare;
      qry_ct_contabil_unica_.Open;
      if qry_ct_contabil_unica_.RecordCount > 0 then
      begin
        if qry_banco_.State in [dsEdit, dsInsert] then qry_banco_CD_CT_CONTABIL.AsString := qry_ct_contabil_unica_CD_CT_CONTABIL.AsString;
      end
      else
      begin
        BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2);
      end;
      qry_ct_contabil_unica_.Close;
    end;
  end;
end;

procedure Tfrm_banco.dbedt_nr_chequeExit(Sender: TObject);
begin
  if datm_banco.qry_banco_.State in [dsEdit, dsInsert] then
  begin
    ValidCodigo( dbedt_nr_cheque );
  end;
end;

procedure Tfrm_banco.btn_co_nr_bancoClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TBCO',
                datm_banco.qry_banco_NR_BANCO,
                'Bancos', 47, '','TTable');
  dbedt_nr_bancoExit(nil);
end;

procedure Tfrm_banco.dbedt_nr_bancoExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_banco.dbedt_nr_remessaExit(Sender: TObject);
begin
  if datm_banco.qry_banco_.State in [dsEdit, dsInsert] then
  begin
    ValidCodigo( dbedt_nr_remessa );
  end;
end;

procedure Tfrm_banco.dbedt_nr_remessaChange(Sender: TObject);
begin

  if ( datm_banco.qry_banco_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;


procedure Tfrm_banco.dbedt_lvalorChange(Sender: TObject);
begin
  if ( datm_banco.qry_banco_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_banco.dbedt_nr_DOCExit(Sender: TObject);
begin
  if datm_banco.qry_banco_.State in [dsEdit, dsInsert] then
  begin
    ValidCodigo( dbedt_nr_DOC );
  end;
end;

procedure Tfrm_banco.dbcheck_integraClick(Sender: TObject);
begin
  if ( datm_banco.qry_banco_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

end.
