unit PGSM182;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, Funcoes, DBTables;

type
  Tfrm_termo_pagto = class(TForm)
    pgctrl_termo_pagto: TPageControl;
    ts_lista: TTabSheet;
    dbgrd_termo_pagto: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_cnt: TPanel;
    lbl_ativo: TLabel;
    dblkpcbox_ativo: TDBLookupComboBox;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    Label3: TLabel;
    dbedt_cd_termo_pagto: TDBEdit;
    Label4: TLabel;
    dbedt_nm_termo_pagto: TDBEdit;
    lbl_exportador: TLabel;
    btn_co_exportador: TSpeedButton;
    dbedt_cd_exportador: TDBEdit;
    dbedt_nm_exportador: TDBEdit;
    dbedt_nr_periodicidade: TDBEdit;
    lbl_periodicidade: TLabel;
    lbl_indicador: TLabel;
    dblckpbox_via_transp: TDBLookupComboBox;
    Label6: TLabel;
    dbedt_nr_parcelas: TDBEdit;
    Label7: TLabel;
    btn_co_modalidade_trans: TSpeedButton;
    dbedt_cd_modalidade_trans: TDBEdit;
    dbedt_nm_modalidade_trans: TDBEdit;
    lbl_enquad_op: TLabel;
    btn_co_enquad_op: TSpeedButton;
    dbedt_cd_enquad_op: TDBEdit;
    dbedt_nm_enquad_op: TDBEdit;
    pgctrl_desc_termo_pagto: TPageControl;
    ts_termo_port: TTabSheet;
    ts_termo_ingles: TTabSheet;
    ts_termo_esp: TTabSheet;
    dbm_termo_port: TDBMemo;
    dbm_termo_ingles: TDBMemo;
    dbm_termo_esp: TDBMemo;
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
    procedure pgctrl_termo_pagtoChange(Sender: TObject);
    procedure dbgrd_termo_pagtoDblClick(Sender: TObject);
    procedure dbgrd_termo_pagtoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedt_cd_bancoExit(Sender: TObject);
    procedure pgctrl_termo_pagtoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dblkpcbox_ativoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dbedt_cd_termo_pagtoChange(Sender: TObject);
    procedure dbedt_cd_termo_pagtoExit(Sender: TObject);
    procedure dbedt_nm_termo_pagtoExit(Sender: TObject);
    procedure btn_co_exportadorClick(Sender: TObject);
    procedure dbedt_cd_exportadorExit(Sender: TObject);
    procedure dbedt_cd_exportadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_modalidade_transExit(Sender: TObject);
    procedure dbedt_cd_enquad_opExit(Sender: TObject);
    procedure btn_co_modalidade_transClick(Sender: TObject);
    procedure btn_co_enquad_opClick(Sender: TObject);
  private
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir   : boolean;
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
  frm_termo_pagto: Tfrm_termo_pagto;

implementation

uses PGSM183, GSMLIB, PGGP001, PGGP017, PGSM103, PGSM162, PGSM178, PGSM104;

{$R *.DFM}

procedure Tfrm_termo_pagto.btn_incluirClick(Sender: TObject);
begin
   btn_incluir.Enabled := False;
   mi_incluir.Enabled  := False;
   btn_excluir.Enabled := False;
   mi_excluir.Enabled  := False;

   with datm_termo_pagto do
   begin
     qry_termo_pagto_.DisableControls;
     qry_termo_pagto_.Cancel;
     qry_termo_pagto_.Append;
     qry_termo_pagto_.EnableControls;
     qry_termo_pagto_CD_TERMO_PAGTO.AsString := UltCod( qry_ult_termo_pagto_, qry_ult_termo_pagto_ULTIMO );
     qry_termo_pagto_TP_INDICADOR.AsString   := '0';
     qry_termo_pagto_IN_ATIVO.AsString := '1';
   end;
   pgctrl_termo_pagto.ActivePage := ts_dados_basicos;
   dbedt_nm_termo_pagto.SetFocus;
end;

procedure Tfrm_termo_pagto.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_termo_pagto.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_termo_pagto.Cancelar;
begin
  try
    if datm_termo_pagto.qry_termo_pagto_.State in [dsInsert, dsEdit] then
    begin
      datm_termo_pagto.qry_termo_pagto_.Cancel;
      pgctrl_termo_pagto.ActivePage := ts_dados_basicos;
      dbedt_nm_termo_pagto.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_termo_pagto.btn_excluirClick(Sender: TObject);
var
  Pesquisa: String;
begin
  if BoxMensagem( 'Este Termo de Pagamento será excluído!' + #13#10 +
                  'Confirma exclusão?', 1 ) then
  try
    datm_main.db_broker.StartTransaction;
    Pesquisa := datm_termo_pagto.qry_termo_pagto_CD_TERMO_PAGTO.AsString;
    datm_termo_pagto.qry_termo_pagto_.Delete;
    datm_main.db_broker.Commit;
    with TQuery.Create(application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add(' DELETE FROM MYINDAIA.DBO.TTERMO_PAGTO WHERE CD_TERMO_PAGTO = ''' + Pesquisa  + ''' ');
      ExecSQL;
      Free;
    end;
    pgctrl_termo_pagto.ActivePage := ts_lista;
  except
    on E: Exception do
    begin
      datm_termo_pagto.qry_termo_pagto_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
end;

procedure Tfrm_termo_pagto.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_termo_pagto.edt_chaveChange(Sender: TObject);
begin
   Localiza( datm_termo_pagto.qry_termo_pagto_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_termo_pagto.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_termo_pagto.qry_termo_pagto_CD_enquad_op.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_termo_pagto.qry_termo_pagto_.Close;
  datm_termo_pagto.qry_termo_pagto_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_termo_pagto.qry_termo_pagto_.Prepare;
  datm_termo_pagto.qry_termo_pagto_.Open;
  Localiza( datm_termo_pagto.qry_termo_pagto_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_termo_pagto.pgctrl_termo_pagtoChange(Sender: TObject);
begin
  if ( pgctrl_termo_pagto.ActivePage = ts_lista ) then
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
end;

procedure Tfrm_termo_pagto.dbgrd_termo_pagtoDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_termo_pagto.qry_termo_pagto_CD_TERMO_PAGTO.AsString;
    except
      try
        Cons_Online_Texto := datm_termo_pagto.qry_termo_pagto_CD_TERMO_PAGTO.AsString;
      except
        BoxMensagem( 'Não foi possível retornar o Código do Termo de Pagamento!', 2 );
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_termo_pagto.dbgrd_termo_pagtoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbgrd_termo_pagtoDblClick(nil);
end;

procedure Tfrm_termo_pagto.FormCreate(Sender: TObject);
begin
  { Cria o DataModule do Termo de Pagamento}

  Application.CreateForm( Tdatm_termo_pagto, datm_termo_pagto );

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  with datm_termo_pagto do
  begin
    tbl_yesno_.Open;
    qry_termo_pagto_.Close;
    qry_termo_pagto_.SQL[2] := 'NM_TERMO_PAGTO';
    qry_termo_pagto_.Prepare;
    qry_termo_pagto_.Open;
  end;

  a_str_indices[0] := 'CD_TERMO_PAGTO';
  a_str_indices[1] := 'NM_TERMO_PAGTO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;
  AtribuiDireitos( st_modificar, st_incluir, st_excluir );

  datm_termo_pagto.ds_termo_pagto.AutoEdit := st_modificar;

  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;
end;

procedure Tfrm_termo_pagto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_termo_pagto do
    begin
      qry_termo_pagto_.Close;
      qry_empresa_nac_.Close;
      qry_modalidade_trans_.Close;
      qry_enquad_op_.Close;
      qry_tp_indicador_periodo_.Close;
      tbl_yesno_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

function Tfrm_termo_pagto.Grava;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_termo_pagto.qry_termo_pagto_.State in [dsInsert, dsEdit] ) then
    begin
      Pesquisa := datm_termo_pagto.qry_termo_pagto_CD_TERMO_PAGTO.AsString;
      datm_termo_pagto.qry_termo_pagto_.Post;
      datm_termo_pagto.qry_termo_pagto_.Locate( 'CD_TERMO_PAGTO', Pesquisa, [loCaseInsensitive] );
    end;
    datm_main.db_broker.Commit;

    with TQuery.Create(application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add(' DELETE FROM MYINDAIA.DBO.TTERMO_PAGTO WHERE CD_TERMO_PAGTO = ''' + Pesquisa  + ''' ');
      ExecSQL;
      SQL.Clear;
      SQL.Add(' INSERT INTO MYINDAIA.DBO.TTERMO_PAGTO (  ');
      SQL.Add(' CD_TERMO_PAGTO, NM_TERMO_PAGTO, CD_EXPORTADOR, NR_PERIODICIDADE, TP_INDICADOR, NR_PARCELAS,  ');
      SQL.Add(' CD_MODALIDADE_TRANS, CD_ENQUAD_OP )   ');
      SQL.Add(' SELECT CD_TERMO_PAGTO, NM_TERMO_PAGTO, CD_EXPORTADOR, NR_PERIODICIDADE, TP_INDICADOR, NR_PARCELAS, ');
      SQL.Add(' CD_MODALIDADE_TRANS, CD_ENQUAD_OP ');
      SQL.Add(' FROM TTERMO_PAGTO ( NOLOCK ) WHERE IN_ATIVO = ''1'' AND CD_TERMO_PAGTO = ''' + Pesquisa + ''' ');
      ExecSQL;
      Free;
    end;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_termo_pagto.qry_termo_pagto_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi( st_incluir, False, False, st_excluir );
end;

function Tfrm_termo_pagto.Consiste : Boolean;
begin
  Consiste := True;

  {Código}
  if Not lNaoConsiste then
  begin
    if dbedt_cd_termo_pagto.Text = '' then
    begin
      BoxMensagem( 'Campo Código do Termo Pagamento deve ser preenchido!', 2);
      dbedt_cd_termo_pagto.SetFocus;
      Consiste := False;
      Exit;
    end;

    {Descrição}
    if dbedt_nm_termo_pagto.Text = '' then
    begin
      BoxMensagem('Campo Descrição deve ser preenchido!', 2);
      dbedt_nm_termo_pagto.SetFocus;
      Consiste := False;
      Exit;
    end;

    {Exportador}
    if dbedt_cd_exportador.Text = '' then
    begin
      BoxMensagem('Campo ''Exportador'' deve ser preenchido!', 2);
      dbedt_cd_exportador.SetFocus;
      Consiste := False;
      Exit;
    end;

  end;

  {Exportador}
  if datm_termo_pagto.qry_termo_pagto_.State in [dsInsert, dsEdit] then
     ValidCodigo( dbedt_cd_exportador );

  if dbedt_cd_exportador.Text <> '' then
  begin
    if dbedt_nm_exportador.Text = '' then
    begin
      BoxMensagem('Código do Exportador inválido!', 2);
      pgctrl_termo_pagto.ActivePage := ts_dados_basicos;
      dbedt_cd_exportador.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  {Modalidade de Transação}
  if datm_termo_pagto.qry_termo_pagto_.State in [dsInsert, dsEdit] then
     ValidCodigo( dbedt_cd_modalidade_trans );

  if dbedt_cd_modalidade_trans.Text <> '' then
  begin
    if dbedt_nm_modalidade_trans.Text = '' then
    begin
      BoxMensagem('Código da Modalidade de Transação inválida!', 2);
      pgctrl_termo_pagto.ActivePage := ts_dados_basicos;
      dbedt_cd_modalidade_trans.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;


  {Enquadramento}
  if datm_termo_pagto.qry_termo_pagto_.State in [dsInsert, dsEdit] then
     ValidCodigo( dbedt_cd_enquad_op );

  if dbedt_cd_enquad_op.Text <> '' then
  begin
    if dbedt_nm_enquad_op.Text = '' then
    begin
      BoxMensagem('Código do Enquadramento da Operação inválida!', 2);
      pgctrl_termo_pagto.ActivePage := ts_dados_basicos;
      dbedt_cd_enquad_op.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;
end;

procedure Tfrm_termo_pagto.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_termo_pagto.dbedt_cd_bancoExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_termo_pagto.pgctrl_termo_pagtoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_termo_pagto.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_termo_pagto.qry_termo_pagto_.State in [dsEdit] ) and st_modificar ) or
     ( datm_termo_pagto.qry_termo_pagto_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Enquadramento da Operação foi alterado.' + #13#10 +
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

procedure Tfrm_termo_pagto.dblkpcbox_ativoExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_termo_pagto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_termo_pagto.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_termo_pagto.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_termo_pagto.dbedt_cd_termo_pagtoChange(Sender: TObject);
begin
  if ( datm_termo_pagto.qry_termo_pagto_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_termo_pagto.dbedt_cd_termo_pagtoExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_termo_pagto.dbedt_nm_termo_pagtoExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_termo_pagto.btn_co_exportadorClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2203';

  Application.CreateForm(Tfrm_cliente_co, frm_cliente_co);
  frm_cliente_co.Cons_OnLine := datm_termo_pagto.qry_termo_pagto_CD_EXPORTADOR;

  with frm_cliente_co do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_termo_pagto.qry_termo_pagto_.State in [dsEdit, dsInsert] ) and
           ( st_modificar ) then
         datm_termo_pagto.qry_termo_pagto_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_termo_pagto do
  begin
    qry_empresa_nac_.Close;
    qry_empresa_nac_.Prepare;
    qry_empresa_nac_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2241';
  dbedt_cd_exportadorExit(nil);
end;

procedure Tfrm_termo_pagto.dbedt_cd_exportadorExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_termo_pagto.dbedt_cd_exportadorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_exportador       then btn_co_exportadorClick(nil);
    if Sender = dbedt_cd_modalidade_trans then btn_co_modalidade_transClick(nil);
    if Sender = dbedt_cd_enquad_op        then btn_co_enquad_opClick(nil);
  end;
end;

procedure Tfrm_termo_pagto.dbedt_cd_modalidade_transExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_termo_pagto.dbedt_cd_enquad_opExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_termo_pagto.btn_co_modalidade_transClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2244';
  Application.CreateForm( Tfrm_modalidade_trans, frm_modalidade_trans );
  frm_modalidade_trans.Cons_OnLine := datm_termo_pagto.qry_termo_pagto_CD_MODALIDADE_TRANS;
  with frm_modalidade_trans do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_termo_pagto.qry_termo_pagto_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
         datm_termo_pagto.qry_termo_pagto_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_termo_pagto do
  begin
    qry_modalidade_trans_.Close;
    qry_modalidade_trans_.Prepare;
    qry_modalidade_trans_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2241';
  dbedt_cd_modalidade_transExit(nil);
end;

procedure Tfrm_termo_pagto.btn_co_enquad_opClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2238';
  Application.CreateForm( Tfrm_enquad_op, frm_enquad_op );
  frm_enquad_op.Cons_OnLine := datm_termo_pagto.qry_termo_pagto_CD_ENQUAD_OP;
  with frm_enquad_op do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_termo_pagto.qry_termo_pagto_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
         datm_termo_pagto.qry_termo_pagto_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_termo_pagto do
  begin
    qry_enquad_op_.Close;
    qry_enquad_op_.Prepare;
    qry_enquad_op_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2241';
  dbedt_cd_enquad_opExit(nil);
end;

end.

