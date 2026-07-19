unit PGSM242;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, ToolEdit, RXLookup, RXDBCtrl, Funcoes;
  

type
  Tfrm_cliente_agente = class(TForm)
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
    pgctrl_cliente_agente: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_agente: TLabel;
    lbl_in_ativo: TLabel;
    dbedt_nm_agente: TDBEdit;
    dbedt_cd_agente: TDBEdit;
    dblkpcbox_ativo: TDBLookupComboBox;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    ts_demurrage: TTabSheet;
    pgctrl_cliente_ag_dem: TPageControl;
    ts_lista2: TTabSheet;
    dbg_contatos: TDBGrid;
    ts_dados_basicos2: TTabSheet;
    Panel1: TPanel;
    btn_co_moeda: TSpeedButton;
    dbedt_cd_moeda: TDBEdit;
    dbedt_nm_moeda: TDBEdit;
    lbl_Cliente: TLabel;
    dbedt_cd_cliente: TDBEdit;
    dbedt_nm_cliente: TDBEdit;
    lbl_unid_neg: TLabel;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    lbl_produto: TLabel;
    dbedt_cd_produto: TDBEdit;
    dbedt_nm_produto: TDBEdit;
    Label1: TLabel;
    dbedt_cd_cliente3: TDBEdit;
    dbedt_nm_cliente3: TDBEdit;
    Label2: TLabel;
    dbedt_cd_unid_neg3: TDBEdit;
    dbedt_nm_unid_neg3: TDBEdit;
    Label3: TLabel;
    dbedt_cd_produto3: TDBEdit;
    dbedt_nm_produto3: TDBEdit;
    lblAgente: TLabel;
    dbedt_cd_agente2: TDBEdit;
    dbedt_nm_agente2: TDBEdit;
    Label4: TLabel;
    dbedt_cd_cliente2: TDBEdit;
    dbedt_nm_cliente2: TDBEdit;
    Label5: TLabel;
    dbedt_cd_unid_neg2: TDBEdit;
    dbedt_nm_unid_neg2: TDBEdit;
    Label6: TLabel;
    dbedt_cd_produto2: TDBEdit;
    dbedt_nm_produto2: TDBEdit;
    btn_co_agente: TSpeedButton;
    Label7: TLabel;
    dbedt_cd_cliente4: TDBEdit;
    dbedt_nm_cliente4: TDBEdit;
    Label8: TLabel;
    dbedt_cd_unid_neg4: TDBEdit;
    dbedt_nm_unid_neg4: TDBEdit;
    Label9: TLabel;
    dbedt_cd_produto4: TDBEdit;
    dbedt_nm_produto4: TDBEdit;
    Label10: TLabel;
    dbedt_cd_agente3: TDBEdit;
    dbedt_nm_agente3: TDBEdit;
    lbl_moeda: TLabel;
    dbedt_vl_diaria: TDBEdit;
    lbl_vl_diaria: TLabel;
    lbl_in_ativo2: TLabel;
    dblckpbox_tp_cntr: TDBLookupComboBox;
    Label13: TLabel;
    dbedt_nr_dias_free_time: TDBEdit;
    dbedt_nr_periodo: TDBEdit;
    lbl_nr_periodo: TLabel;
    dbedt_nr_dias: TDBEdit;
    lbl_nr_dias_periodo: TLabel;
    Label11: TLabel;
    dblckpbox_in_isento: TDBLookupComboBox;
    Label12: TLabel;
    Label14: TLabel;
    dbedt_dt_ini_vig: TDBDateEdit;
    dbedt_dt_term_vig: TDBDateEdit;
    lbl_transportadora: TLabel;
    dbedt_nm_transp: TDBEdit;
    dbedt_cd_transp: TDBEdit;
    btn_co_transp: TSpeedButton;
    lbl_transp: TLabel;
    dbedt_cd_transp2: TDBEdit;
    dbedt_nm_transp2: TDBEdit;
    Label15: TLabel;
    dbedt_cd_transp3: TDBEdit;
    dbedt_nm_transp_3: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure dbnvgBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure dbedt_cd_agenteChange(Sender: TObject);
    procedure dbedt_cd_moedaChange(Sender: TObject);
    procedure dbedt_cd_agenteExit(Sender: TObject);
    procedure dbedt_cd_moedaExit(Sender: TObject);
    procedure btn_co_agenteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrl_cliente_agenteChange(Sender: TObject);
    procedure pgctrl_cliente_agenteChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_agenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cb_ordemClick(Sender: TObject);
    procedure btn_co_moedaClick(Sender: TObject);
    procedure dbedt_dt_ini_vigChange(Sender: TObject);
    procedure dbedt_dt_fim_vigChange(Sender: TObject);
    procedure dbedt_dt_ini_vigExit(Sender: TObject);
    procedure dbedt_dt_fim_vigExit(Sender: TObject);
    procedure dbedt_dt_term_vigChange(Sender: TObject);
    procedure dbedt_dt_term_vigExit(Sender: TObject);
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
    procedure btn_co_transpClick(Sender: TObject);
    procedure dbedt_cd_transpExit(Sender: TObject);
    procedure dbedt_cd_transpChange(Sender: TObject);
  private
    Pesquisa : String;
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..1] Of String[60];
    st_modificar, st_incluir, st_excluir : Boolean;
    procedure Abertura;
    function Consiste : Boolean;
    function Grava    : Boolean;
    function VerAlt   : Boolean;
    procedure Cancelar;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
  public
    str_cliente, str_unid, str_produto : String;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;
var
  frm_cliente_agente: Tfrm_cliente_agente;

implementation

uses GSMLIB, PGGP001, PGGP017, PGSM048, uAg, PGSM243, PGSM096, PGSM148,
  PGSM019;
{$R *.DFM}

procedure Tfrm_cliente_agente.FormCreate(Sender: TObject);
begin
  { Inicializa o Data Module para Agentes}
  Application.CreateForm( Tdatm_cliente_agente, datm_cliente_agente );
end;

procedure Tfrm_cliente_agente.FormShow(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  with datm_cliente_agente do
  begin
    ds_cliente_ag.AutoEdit := st_modificar;
    ds_cliente_ag_dem.AutoEdit := st_modificar;

    qry_yes_no_.Close;
    qry_yes_no_.Prepare;
    qry_yes_no_.Open;

    qry_empresa_nac_.Close;
    qry_empresa_nac_.Prepare;
    qry_empresa_nac_.Open;

    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;

    qry_ag_.Close;
    qry_ag_.Prepare;
    qry_ag_.Open;

    qry_tp_cntr_.Close;
    qry_tp_cntr_.Prepare;
    qry_tp_cntr_.Open;

    Abertura;
  end;

  a_str_indices[0] := 'CD_AGENTE';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    ItemIndex := 0;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

  lNaoConsiste := False;

  pgctrl_cliente_agente.ActivePage := ts_lista;

  edt_chave.SetFocus;
end;

procedure Tfrm_cliente_agente.btn_incluirClick(Sender: TObject);
begin
  if ( pgctrl_cliente_agente.ActivePage = ts_dados_basicos ) or
     ( pgctrl_cliente_agente.ActivePage = ts_lista ) then
  begin
    btn_incluir.Enabled := False;
    mi_incluir.Enabled  := False;
    btn_excluir.Enabled := False;
    mi_excluir.Enabled  := False;

    with datm_cliente_agente do
    begin
      qry_cliente_ag_.DisableControls;
      qry_cliente_ag_.Cancel;
      qry_cliente_ag_.Append;
      qry_cliente_ag_.EnableControls;
      qry_cliente_ag_CD_CLIENTE.AsString  := str_cliente;
      qry_cliente_ag_CD_UNID_NEG.AsString := str_unid;
      qry_cliente_ag_CD_PRODUTO.AsString  := str_produto;
      qry_cliente_ag_IN_ATIVO.AsString    := '1';
    end;
    pgctrl_cliente_agente.ActivePage := ts_dados_basicos;
    dbedt_cd_agente.SetFocus;
  end
  else
  begin
    btn_incluir.Enabled := False;
    mi_incluir.Enabled  := False;
    btn_excluir.Enabled := False;
    mi_excluir.Enabled  := False;

    with datm_cliente_agente do
    begin
      if qry_cliente_ag_.RecordCount = 0  then
      begin
         BoxMensagem('Selecione um Agente!', 2);
         pgctrl_cliente_agente.ActivePage := ts_lista;
         Cancelar;
         Exit;
      end;

      qry_cliente_ag_dem_.DisableControls;
      qry_cliente_ag_dem_.Cancel;
      qry_cliente_ag_dem_.Append;
      qry_cliente_ag_dem_.EnableControls;
      qry_cliente_ag_dem_CD_CLIENTE.AsString  := str_cliente;
      qry_cliente_ag_dem_CD_UNID_NEG.AsString := str_unid;
      qry_cliente_ag_dem_CD_PRODUTO.AsString  := str_produto;
      qry_cliente_ag_dem_CD_AGENTE.AsString   := qry_cliente_ag_CD_AGENTE.AsString;
      qry_cliente_ag_dem_CD_TRANSPORTADOR.AsString   := qry_cliente_ag_CD_TRANSPORTADOR.AsString;
    end;
    pgctrl_cliente_ag_dem.ActivePage := ts_dados_basicos2;
    dbedt_nr_periodo.SetFocus;
  end
end;

procedure Tfrm_cliente_agente.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_cliente_agente.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_cliente_agente.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_cliente_agente.Cancelar;
begin
  try
    if ( pgctrl_cliente_agente.ActivePage = ts_dados_basicos ) or
       ( pgctrl_cliente_agente.ActivePage = ts_lista ) then
    begin
      datm_cliente_agente.qry_cliente_ag_.CancelUpdates;
      pgctrl_cliente_agente.ActivePage := ts_dados_basicos;
      Abertura;
      dbedt_cd_agente.SetFocus;
    end
    else
    begin
      {Agente X Demurrage}
      datm_cliente_agente.qry_cliente_ag_dem_.CancelUpdates;
      pgctrl_cliente_ag_dem.ActivePage := ts_dados_basicos2;
      Abertura;
      dbedt_cd_moeda.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_cliente_agente.btn_excluirClick(Sender: TObject);
begin
  with datm_cliente_agente do
  begin
    if ( pgctrl_cliente_agente.ActivePage = ts_dados_basicos ) or
       ( pgctrl_cliente_agente.ActivePage = ts_lista ) then
    begin
      if BoxMensagem( 'Este Agente será excluído! Confirma exclusão?', 1 ) Then
      try
        datm_main.db_broker.StartTransaction;
        qry_cliente_ag_.Delete;
        qry_cliente_ag_.ApplyUpdates;
        Abertura;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          qry_cliente_ag_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      pgctrl_cliente_agente.ActivePage := ts_lista;
    end
    else
    begin
      if qry_cliente_ag_dem_.RecordCount = 0 then Exit;
      if BoxMensagem( 'Este Período será excluído! Confirma exclusão?', 1 ) Then
      try
        datm_main.db_broker.StartTransaction;
        qry_cliente_ag_dem_.Delete;
        qry_cliente_ag_dem_.ApplyUpdates;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          qry_cliente_ag_dem_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      pgctrl_cliente_ag_dem.ActivePage := ts_lista2;
    end;
  end;
end;

procedure Tfrm_cliente_agente.dbnvgBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if ( pgctrl_cliente_agente.ActivePage = ts_dados_basicos ) or
     ( pgctrl_cliente_agente.ActivePage = ts_lista ) then
    datm_cliente_agente.qry_cliente_ag_.Cancel
  else
    datm_cliente_agente.qry_cliente_ag_dem_.Cancel;
end;

procedure Tfrm_cliente_agente.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_cliente_agente.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_cliente_agente.qry_cliente_ag_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

function Tfrm_cliente_agente.Consiste : Boolean;
begin
  Consiste := True;

  if pgctrl_cliente_agente.ActivePage = ts_dados_basicos then
  begin
    {Agente}
    if Not lNaoConsiste then
    begin
      if dbedt_cd_agente.Text = '' then
      begin
        BoxMensagem('Campo Agente deve ser preenchido!', 2);
        pgctrl_cliente_agente.ActivePage := ts_dados_basicos;
        dbedt_cd_agente.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Transportador}
    if Not lNaoConsiste then
    begin
      if dbedt_cd_transp.Text = '' then
      begin
        BoxMensagem('Campo Transportador deve ser preenchido!', 2);
        pgctrl_cliente_agente.ActivePage := ts_dados_basicos;
        dbedt_cd_transp.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if Not ( datm_cliente_agente.qry_cliente_ag_.State in [dsEdit, dsInsert] ) then Exit;
    ValidCodigo( dbedt_cd_agente );
    ValidCodigo( dbedt_cd_transp );
    if dbedt_cd_agente.Text <> '' Then
    begin
      if dbedt_nm_agente.Text = '' Then
      begin
        BoxMensagem( 'Código do Agente inválido!', 2 );
        dbedt_cd_agente.SetFocus;
        Consiste := False;
        Exit;
      end
      else
      if dbedt_cd_transp.Text <> '' Then
      begin
        if dbedt_nm_transp.Text = '' Then
        begin
          BoxMensagem( 'Código de Transportador inválido!', 2 );
          dbedt_cd_transp.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end
  else
  if ( pgctrl_cliente_agente.ActivePage = ts_demurrage ) and
     ( pgctrl_cliente_ag_dem.ActivePage = ts_dados_basicos2 ) then
  begin
    {Período}
    if Not lNaoConsiste then
    begin
      if dbedt_nr_periodo.Text = '' then
      begin
        BoxMensagem( 'Campo Nº Período deve ser preenchido!', 2 );
        pgctrl_cliente_agente.ActivePage := ts_demurrage;
        pgctrl_cliente_agente.ActivePage := ts_dados_basicos2;
        dbedt_nr_periodo.SetFocus;
        Consiste := False;
        Exit;
      end;

      if datm_cliente_agente.qry_cliente_ag_dem_.State in [dsInsert, dsEdit] then
      begin
        if datm_cliente_agente.qry_cliente_ag_dem_DT_INI_VIG.AsString = '' then
        begin
          BoxMensagem( 'Data Inicio Vigência deve ser preenchido!', 2 );
          dbedt_dt_ini_vig.SetFocus;
          Consiste := False;
        end;
      end;

      if datm_cliente_agente.qry_cliente_ag_dem_.State in [dsInsert, dsEdit] then
      begin
        if datm_cliente_agente.qry_cliente_ag_dem_DT_FIM_VIG.AsString = '' then
        begin
          BoxMensagem( 'Data Término Vigência deve ser preenchido!', 2 );
          dbedt_dt_term_vig.SetFocus;
          Consiste := False;
        end;
      end;
    end;

    if Not ( datm_cliente_agente.qry_cliente_ag_dem_.State in [dsEdit, dsInsert] ) then Exit;
    ValidCodigo( dbedt_nr_periodo );

    {Moeda}
    ValidCodigo( dbedt_cd_moeda );
    if dbedt_cd_moeda.Text <> '' Then
    begin
      if dbedt_nm_moeda.Text = '' Then
      begin
        BoxMensagem( 'Código da Moeda inválido!', 2 );
        pgctrl_cliente_agente.ActivePage := ts_demurrage;
        pgctrl_cliente_agente.ActivePage := ts_dados_basicos2;
        dbedt_cd_moeda.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;
end;

function Tfrm_cliente_agente.Grava : Boolean;
begin
  if ( pgctrl_cliente_agente.ActivePage = ts_dados_basicos ) or
     ( pgctrl_cliente_agente.ActivePage = ts_lista ) then
  begin
    Grava := Commit( datm_cliente_agente.qry_cliente_ag_ );
  end
  else {Agente X Demurrage}
  begin
    Grava := Commit( datm_cliente_agente.qry_cliente_ag_dem_ );
  end;

  Abertura;

  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_cliente_agente.dbedt_cd_agenteChange(Sender: TObject);
begin
 If ( datm_cliente_agente.qry_cliente_ag_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_cliente_agente.dbedt_cd_moedaChange(Sender: TObject);
begin
  if ( datm_cliente_agente.qry_cliente_ag_dem_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_cliente_agente.dbedt_cd_agenteExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_cliente_agente.dbedt_cd_moedaExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_cliente_agente.btn_co_agenteClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  Application.CreateForm( Tfrm_ag, frm_ag );
  frm_ag.Cons_OnLine := datm_cliente_agente.qry_cliente_ag_CD_AGENTE;
  with frm_ag do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_cliente_agente.qry_cliente_ag_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_agente.qry_cliente_ag_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_agente do
  begin
    qry_empresa_nac_.Close;
    qry_empresa_nac_.Prepare;
    qry_empresa_nac_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_agenteExit(Sender);
end;

procedure Tfrm_cliente_agente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_cliente_agente do
    begin
      qry_yes_no_.Close;
      qry_empresa_nac_.Close;
      qry_unid_neg_.Close;
      qry_produto_.Close;
      qry_ag_.Close;
      qry_cliente_ag_.Close;
      qry_cliente_ag_dem_.Close;
      Free;
    end;
    Action := caFree;
  end
  else
    Action := caNone;
end;

procedure Tfrm_cliente_agente.pgctrl_cliente_agenteChange(Sender: TObject);
begin
  if ( pgctrl_cliente_agente.ActivePage = ts_lista ) or
     ( pgctrl_cliente_agente.ActivePage = ts_dados_basicos ) then
     dbnvg.DataSource := datm_cliente_agente.ds_cliente_ag
  else
     dbnvg.DataSource := datm_cliente_agente.ds_cliente_ag_dem;

  if ( pgctrl_cliente_agente.ActivePage = ts_lista ) or
     ( ( pgctrl_cliente_agente.ActivePage = ts_demurrage ) and
       ( pgctrl_cliente_ag_dem.ActivePage = ts_lista2 ) ) then
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

procedure Tfrm_cliente_agente.pgctrl_cliente_agenteChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_cliente_agente.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( pgctrl_cliente_agente.ActivePage = ts_dados_basicos ) then
  begin
    if ( ( datm_cliente_agente.qry_cliente_ag_.State in [dsEdit] ) and st_modificar ) or
       ( datm_cliente_agente.qry_cliente_ag_.State in [dsInsert] ) then
    begin
      if BoxMensagem( 'Cadastro de Agentes foi alterado.' + #13#10 +
         'Deseja salvar as alterações?', 1 ) then
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
  else {Agente X Demurrage}
  begin
    if ( ( datm_cliente_agente.qry_cliente_ag_dem_.State in [dsEdit] ) and st_modificar ) or
         ( datm_cliente_agente.qry_cliente_ag_dem_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Períodos foi alterado.' + #13#10 +
         'Deseja salvar as alterações?', 1) then
      begin
        if Not Consiste then Exit;
        if Not Grava then Exit;
      end
      else
        Cancelar;
    end;
  end;
end;

procedure Tfrm_cliente_agente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_cliente_agente.dbedt_cd_agenteKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_agente then btn_co_agenteClick(nil);
    if Sender = dbedt_cd_moeda  then btn_co_moedaClick(nil);
    if Sender = dbedt_cd_transp  then btn_co_transpClick(nil);
  end;
end;

procedure Tfrm_cliente_agente.cb_ordemClick(Sender: TObject);
begin
  with datm_cliente_agente do
  begin
    Pesquisa := qry_cliente_ag_.FieldByName('CD_AGENTE').AsString;
    { Apaga o campo de pesquisa }
    edt_chave.Text := '';
    qry_cliente_ag_.Close;
    qry_cliente_ag_.SQL[5] := a_str_indices[cb_ordem.ItemIndex];
    qry_cliente_ag_.Prepare;
    qry_cliente_ag_.Open;
    Localiza( qry_cliente_ag_, Pesquisa, a_str_indices[0] );
    edt_chave.SetFocus;
  end;
end;

procedure Tfrm_cliente_agente.btn_co_moedaClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_moeda, frm_moeda );
  frm_moeda.Cons_OnLine := datm_cliente_agente.qry_cliente_ag_dem_CD_MOEDA;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_agente.qry_cliente_ag_dem_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
      datm_cliente_agente.qry_cliente_ag_dem_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_agente do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  dbedt_cd_moedaExit(Sender);
end;

procedure Tfrm_cliente_agente.Abertura;
begin
  with datm_cliente_agente do
  begin
    qry_cliente_ag_.Close;
    qry_cliente_ag_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
    qry_cliente_ag_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_cliente_ag_.ParamByName('CD_PRODUTO').AsString  := str_produto;
    qry_cliente_ag_.Prepare;
    qry_cliente_ag_.Open;

    if qry_cliente_ag_.RecordCount > 0 then
    begin
      qry_cliente_ag_dem_.Close;
      qry_cliente_ag_dem_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
      qry_cliente_ag_dem_.ParamByName('CD_UNID_NEG').AsString := str_unid;
      qry_cliente_ag_dem_.ParamByName('CD_PRODUTO').AsString  := str_produto;
      qry_cliente_ag_dem_.ParamByName('CD_AGENTE').AsString   := qry_cliente_ag_CD_AGENTE.AsString;
      qry_cliente_ag_dem_.ParamByName('CD_TRANSPORTADOR').AsString := qry_cliente_ag_CD_TRANSPORTADOR.AsString;
      qry_cliente_ag_dem_.Prepare;
      qry_cliente_ag_dem_.Open;
    end;
  end;
end;

procedure Tfrm_cliente_agente.dbedt_dt_ini_vigChange(Sender: TObject);
begin
  if ( datm_cliente_agente.qry_cliente_ag_dem_.State in [ dsInsert, dsEdit ] ) then
      Btn_Mi( False, True, True, False );
end;

procedure Tfrm_cliente_agente.dbedt_dt_fim_vigChange(Sender: TObject);
begin
  if ( datm_cliente_agente.qry_cliente_ag_dem_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_cliente_agente.dbedt_dt_ini_vigExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_cliente_agente.dbedt_dt_fim_vigExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;


procedure Tfrm_cliente_agente.dbedt_dt_term_vigChange(Sender: TObject);
begin
  if ( datm_cliente_agente.qry_cliente_ag_dem_.State in [ dsInsert, dsEdit ] ) then
      Btn_Mi( False, True, True, False );
end;

procedure Tfrm_cliente_agente.dbedt_dt_term_vigExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_cliente_agente.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
begin

  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo           := nCodigo;
  datm_consulta_padrao.Tabela.TableName := cNomeTabela;

  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.Cons_OnLine       := fCampo;

  with frm_consulta_padrao do
  begin
    Caption := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_cliente_agente.btn_co_transpClick(Sender: TObject);
begin
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  Application.CreateForm( Tfrm_transportador_itl, frm_transportador_itl );
  frm_transportador_itl.Cons_OnLine := datm_cliente_agente.qry_cliente_ag_CD_TRANSPORTADOR;
  with frm_transportador_itl do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_cliente_agente.qry_cliente_ag_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_agente.qry_cliente_ag_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_agente do
  begin
    qry_empresa_nac_.Close;
    qry_empresa_nac_.Prepare;
    qry_empresa_nac_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_transpExit(Sender);
end;
end;

procedure Tfrm_cliente_agente.dbedt_cd_transpExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_cliente_agente.dbedt_cd_transpChange(Sender: TObject);
begin
 If ( datm_cliente_agente.qry_cliente_ag_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

end.
