unit PGSM127;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Mask, Buttons, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, DBTAbles;

type
  Tfrm_ag = class(TForm)
    pgctrl_ag: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_ag: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    lbl_ativo: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btn_co_tx_exp: TSpeedButton;
    btn_co_tx_imp: TSpeedButton;
    dbedt_cd_ag: TDBEdit;
    dbedt_nm_ag: TDBEdit;
    dblkpcbox_ativo_ag: TDBLookupComboBox;
    dbedt_cd_tx_exp: TDBEdit;
    dbedt_cd_tx_imp: TDBEdit;
    dblkpcbox_nm_tx_imp: TDBEdit;
    dblkpcbox_nm_tx_exp: TDBEdit;
    pnl_btn_ag: TPanel;
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
    dbg_ag: TDBGrid;
    Label5: TLabel;
    dbedt_cgc_agente: TDBEdit;
    procedure btn_co_tx_impClick(Sender: TObject);
    procedure btn_co_tx_expClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbg_agDblClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure dbedt_nm_agChange(Sender: TObject);
    procedure dbedt_cd_tx_impExit(Sender: TObject);
    procedure dbedt_cd_tx_expExit(Sender: TObject);
    procedure pgctrl_agChange(Sender: TObject);
    procedure dbg_agKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_agChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_tx_impKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CodExits;
    procedure dbedt_cgc_agenteExit(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir: Boolean;

    function Consiste : Boolean;
    function Grava    : Boolean;
    function Veralt   : Boolean;
    function jaExisteCGC( cnpj: String ): Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    lDi, lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_ag: Tfrm_ag;

implementation

uses GSMLIB, PGGP001, PGGP017, PGSM128, PGSM126;

{$R *.DFM}

function Tfrm_ag.jaExisteCGC( cnpj: String ): Boolean;
var qry_: TQuery;
begin
   qry_ := TQuery.Create( frm_ag );
   with qry_ do
   begin
      Close;
      DataBaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) CONT from TAGENTE WHERE NR_CGC_AGENTE = "' + cnpj + '"');
      Open;
      if datm_ag.qry_ag_.State in [dsInsert] then
      begin
        if FieldByname('CONT').AsInteger > 0 then Result := True
        else Result := False;
      end
      else
      begin
        if datm_ag.qry_ag_.State in [dsEdit] then
        begin
          if FieldByname('CONT').AsInteger > 1 then Result := True
          else Result := False;
        end
        else Result := False;
      end;
      Close;
      Free;
   end;
end;

procedure Tfrm_ag.btn_co_tx_impClick(Sender: TObject);
begin
  str_cd_modulo := '22';
  str_cd_rotina := '2230';
  Application.CreateForm(Tfrm_ag_tx, frm_ag_tx);
  frm_ag_tx.Cons_OnLine := datm_ag.qry_ag_CD_TAXA_IMP;
  with frm_ag_tx do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_ag.qry_ag_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_ag.qry_ag_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_ag do
  begin
    qry_ag_tx_.Close;
    qry_ag_tx_.Prepare;
    qry_ag_tx_.Open;
  end;
  str_cd_modulo := '22';
  str_cd_rotina := '2229';
  dbedt_cd_tx_impExit(nil);
end;

procedure Tfrm_ag.btn_co_tx_expClick(Sender: TObject);
begin
  str_cd_modulo := '22';
  str_cd_rotina := '2230';
  Application.CreateForm(Tfrm_ag_tx, frm_ag_tx);
  frm_ag_tx.Cons_OnLine := datm_ag.qry_ag_CD_TAXA_EXP;
  with frm_ag_tx do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_ag.qry_ag_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_ag.qry_ag_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_ag do
  begin
    qry_ag_tx_.Close;
    qry_ag_tx_.Prepare;
    qry_ag_tx_.Open;
  end;
  str_cd_modulo := '22';
  str_cd_rotina := '2229';
  dbedt_cd_tx_expExit(nil);
end;

procedure Tfrm_ag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_ag do
    begin
      qry_ag_.Close;
      tbl_yesno_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_ag.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  {Inicializa o DataModule para Agentes}
  Application.CreateForm(Tdatm_ag, datm_ag );

  with datm_ag do
  begin
    ds_ag.AutoEdit := st_modificar;

    qry_ag_.SQL[2] := 'NM_AGENTE';
    qry_ag_.Prepare;
    qry_ag_.Open;
  end;

  a_str_indices[0] := 'CD_AGENTE';
  a_str_indices[1] := 'NM_AGENTE';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;

  btn_incluir.Enabled := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_incluir.Enabled  := st_incluir;
  mi_excluir.Enabled  := st_excluir;

  lDi                 := False;

end;

procedure Tfrm_ag.dbg_agDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      if lDi then Cons_OnLine.AsString := datm_ag.qry_ag_NR_CGC_AGENTE.AsString
      else Cons_OnLine.AsString := datm_ag.qry_ag_CD_AGENTE.AsString;
    except
      try
         if lDi then Cons_OnLine_Texto := datm_ag.qry_ag_NR_CGC_AGENTE.AsString
         else Cons_OnLine_Texto := datm_ag.qry_ag_CD_AGENTE.AsString;
      except
        if lDi then BoxMensagem('Não foi possível retornar o C.N.P.J. do Agente !', 2)
        else BoxMensagem('Não foi possível retornar o Código do Agente !', 2)
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_ag.btn_incluirClick(Sender: TObject);
begin
  with datm_ag do
  begin
    qry_ag_.DisableControls;
    qry_ag_.Cancel;
    qry_ag_.Append;
    qry_ag_.EnableControls;
    qry_ag_.FieldByName('CD_AGENTE').AsString := UltCod( qry_ult_ag_, qry_ult_ag_ULTIMO );
    qry_ag_.FieldByName('IN_ATIVO').AsString  := '1';
  end;
  pgctrl_ag.ActivePage := ts_dados_basicos;
  dbedt_nm_ag.SetFocus;
  btn_mi( False, False, False, False );
end;

procedure Tfrm_ag.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_ag.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_ag.Cancelar;
begin
  try
    if datm_ag.qry_ag_.State in [dsInsert, dsEdit] then
    begin
      datm_ag.qry_ag_.Cancel;
      pgctrl_ag.ActivePage := ts_dados_basicos;
      dbedt_nm_ag.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente!', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_ag.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este agente será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
  try
    datm_main.db_broker.StartTransaction;
    datm_ag.qry_ag_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_ag.qry_ag_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  pgctrl_ag.ActivePage := ts_lista;
end;

function Tfrm_ag.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_ag.qry_ag_.State in [dsInsert, dsEdit] ) then
    begin
      datm_ag.qry_ag_.Post;
      Pesquisa := datm_ag.qry_ag_CD_AGENTE.AsString;
      datm_ag.qry_ag_.Close;
      datm_ag.qry_ag_.Prepare;
      datm_ag.qry_ag_.Open;
      Localiza(datm_ag.qry_ag_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_ag.qry_ag_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_ag.Consiste : Boolean;
begin
  {Descrição do agente}
  if Not lNaoConsiste then
  begin
    if dbedt_nm_ag.Text = '' then
    begin
      BoxMensagem('Campo ''Descrição'' deve ser preenchido!', 2);
      pgctrl_ag.ActivePage := ts_dados_basicos;
      dbedt_nm_ag.SetFocus;
      Consiste := False;
      Exit;
    end;

    if Trim( dbedt_cgc_agente.Text ) = '' then
    begin
      BoxMensagem('Campo ''C.N.P.J.'' deve ser preenchido!', 2);
      pgctrl_ag.ActivePage := ts_dados_basicos;
      dbedt_cgc_agente.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  {Taxa de Importação}
  if ( datm_ag.qry_ag_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_tx_imp );
    if dbedt_cd_tx_imp.Text <> '' then
    begin
      if dblkpcbox_nm_tx_imp.Text = '' then
      begin
        BoxMensagem('Código de taxa imp. inválido!',2);
        pgctrl_ag.ActivePage := ts_dados_basicos;
        dbedt_cd_tx_imp.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  {CNPJ do agente}
  if Trim( dbedt_cgc_agente.text ) <> '' then
  begin
    if Not CNPJ( dbedt_cgc_agente.text ) then
    begin
       pgctrl_ag.ActivePage := ts_dados_basicos;
       dbedt_cgc_agente.SetFocus;
       Consiste := False;
       Exit;
    end
    else if jaExisteCGC( dbedt_cgc_agente.text ) then
    begin
       BoxMensagem('CNPJ já cadastrado. Verifique e tente gravar novamente.',3);
       pgctrl_ag.ActivePage := ts_dados_basicos;
       dbedt_cgc_agente.SetFocus;
       Consiste := False;
       Exit;
    end;
  end;

  {Taxa de Exportação}
  if ( datm_ag.qry_ag_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_tx_exp );
    if dbedt_cd_tx_exp.Text <> '' then
    begin
      if dblkpcbox_nm_tx_exp.Text = '' then
      begin
        BoxMensagem('Código de taxa exp. inválido!',2);
        pgctrl_ag.ActivePage := ts_dados_basicos;
        dbedt_cd_tx_exp.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;
  Consiste := True;
end;

procedure Tfrm_ag.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_ag.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ag.edt_chaveChange(Sender: TObject);
begin
   Localiza(datm_ag.qry_ag_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_ag.dbedt_nm_agChange(Sender: TObject);
begin
  if ( datm_ag.qry_ag_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_ag.dbedt_cd_tx_impExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_ag.dbedt_cd_tx_expExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_ag.pgctrl_agChange(Sender: TObject);
begin
  if ( pgctrl_ag.ActivePage = ts_lista ) then
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

procedure Tfrm_ag.dbg_agKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbg_agDblClick(Sender);
end;

procedure Tfrm_ag.FormShow(Sender: TObject);
begin
  lNaoConsiste         := False;
  pgctrl_ag.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_ag.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_ag.qry_ag_CD_AGENTE.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_ag.qry_ag_.Close;
  datm_ag.qry_ag_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_ag.qry_ag_.Prepare;
  datm_ag.qry_ag_.Open;
  Localiza(datm_ag.qry_ag_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_ag.pgctrl_agChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_ag.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_ag.qry_ag_.State in [dsEdit] ) and st_modificar ) or
     ( datm_ag.qry_ag_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Agentes foi alterado.' + #13#10 +
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

procedure Tfrm_ag.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_ag.dbedt_cd_tx_impKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = dbedt_cd_tx_imp then btn_co_tx_impClick(nil);
    if Sender = dbedt_cd_tx_exp then btn_co_tx_expClick(nil);
  end;
end;

procedure Tfrm_ag.CodExits;
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;


procedure Tfrm_ag.dbedt_cgc_agenteExit(Sender: TObject);
begin
  if trim( dbedt_cgc_agente.text ) <> '' then
     if Not CNPJ( dbedt_cgc_agente.text ) then
        dbedt_cgc_agente.SetFocus;
end;

procedure Tfrm_ag.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then dbg_agDblClick(nil);
end;

end.
