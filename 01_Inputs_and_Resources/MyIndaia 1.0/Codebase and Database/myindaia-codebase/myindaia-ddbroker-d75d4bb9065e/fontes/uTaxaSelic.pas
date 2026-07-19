unit uTaxaSelic;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBTables, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, ToolEdit, CurrEdit, RXDBCtrl, RxGrdCpt;

type
  Tfrm_taxaSelic = class(TForm)
    pgctrl_Taxa: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    lbl_cd_moeda: TLabel;
    lbl_nm_moeda: TLabel;
    dbedt_cd_moeda: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
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
    Label3: TLabel;
    dbedt_dt_inicio: TDBDateEdit;
    dbedt_dt_fim: TDBDateEdit;
    lbl_tx_cambio: TLabel;
    dbedt_tx_cambio: TDBEdit;
    panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pgctrl_TaxaChange(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbedt_cd_moeda_scxExit(Sender: TObject);
    procedure dbedt_tx_cambioExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
  private
    OnChanging: Boolean;
    a_str_indices : Array[0..2] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    lcd_moeda_scx, lap_moeda, lnm_moeda, ldt_inicio, ldt_termino : Boolean;

    function Consiste : Boolean;
    function Grava    : Boolean;
    function Veralt   : Boolean;
    procedure Cancelar;
  public
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
  end;

var
  frm_taxaSelic: Tfrm_taxaSelic;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, dTaxaSelic;

procedure Tfrm_taxaSelic.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  // Inicializa o Data Module para Moedas
  Application.CreateForm( Tdatm_TaxaSelic, datm_TaxaSelic );

  With datm_TaxaSelic Do
  Begin
    qry_TaxaSelic.Open;
    qry_ListaTaxaSelic.Open;
  End; 

  a_str_indices[0] := 'CODIGO';
{  a_str_indices[1] := 'NM_MOEDA';
  a_str_indices[2] := 'AP_MOEDA';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    Items.Add('Sigla');
    ItemIndex := 1;
  end;}

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

end;

procedure Tfrm_taxaSelic.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_Taxa.ActivePage := ts_lista;
//  dbedt_dt_inicio.SetFocus;
end;

procedure Tfrm_taxaSelic.pgctrl_TaxaChange(Sender: TObject);
begin
{  OnChanging := False;

  if ldt_termino then
  begin
    ldt_termino := False;
    pgctrl_Taxa.ActivePage := ts_taxa_cambio;
    pgctrl_taxa_cambio.ActivePage := ts_dados_basicos2;
    dbedt_dt_termino_vig.SetFocus;
    Exit;
  end;

  if ldt_inicio then
  begin
    ldt_inicio := False;
    pgctrl_Taxa.ActivePage := ts_taxa_cambio;
    pgctrl_taxa_cambio.ActivePage := ts_dados_basicos2;
    dbedt_dt_inicio_vig.SetFocus;
    Exit;
  end;

  if lnm_moeda then
  begin
    lnm_moeda := False;
    pgctrl_Taxa.ActivePage := ts_dados_basicos;
    dbedt_nm_moeda.SetFocus;
    Exit;
  end;

  if lap_moeda then
  begin
    lap_moeda := False;
    pgctrl_Taxa.ActivePage := ts_dados_basicos;
    dbedt_ap_moeda.SetFocus;
    Exit;
  end;

  if lcd_moeda_scx then
  begin
    lcd_moeda_scx := False;
    pgctrl_Taxa.ActivePage := ts_dados_basicos;
    dbedt_cd_moeda_scx.SetFocus;
    Exit;
  end;

  if (pgctrl_Taxa.ActivePage=ts_lista) or
     (pgctrl_Taxa.ActivePage=ts_dados_basicos) then
     dbnvg.DataSource := datm_moeda.ds_moeda
  else
     dbnvg.DataSource := datm_moeda.ds_taxa_cambio;

  if (pgctrl_Taxa.ActivePage = ts_lista ) or
     ((pgctrl_Taxa.ActivePage = ts_taxa_cambio ) and
      (pgctrl_taxa_cambio.ActivePage = ts_lista2 ) ) then
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

  if (pgctrl_Taxa.ActivePage=ts_dados_basicos) then
  begin
    dbedt_cd_moeda.ReadOnly := True;
    dbedt_nm_moeda.SetFocus;
  end;
}
end;

procedure Tfrm_taxaSelic.btn_incluirClick(Sender: TObject);
begin
  if ( pgctrl_Taxa.ActivePage = ts_dados_basicos ) or
     ( pgctrl_Taxa.ActivePage = ts_lista ) then
  begin
    btn_incluir.Enabled := False;
    mi_incluir.Enabled  := False;
    btn_excluir.Enabled := False;
    mi_excluir.Enabled  := False;

    with datm_TaxaSelic do
    begin
      qry_TaxaSelic.DisableControls;
      qry_TaxaSelic.Cancel;
      qry_TaxaSelic.Append;
      qry_TaxaSelic.EnableControls;
    end;
    pgctrl_Taxa.ActivePage := ts_dados_basicos;
    dbedt_dt_inicio.SetFocus;
  end;
end;

procedure Tfrm_taxaSelic.btn_salvarClick(Sender: TObject);
begin
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_taxaSelic.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_taxaSelic.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_taxaSelic.Cancelar;
begin
  try
    if ( pgctrl_Taxa.ActivePage = ts_dados_basicos ) or
       ( pgctrl_Taxa.ActivePage = ts_lista ) then
    begin
      if datm_TaxaSelic.qry_TaxaSelic.State in [dsInsert, dsEdit] then
         datm_TaxaSelic.qry_TaxaSelic.Cancel;
      pgctrl_Taxa.ActivePage := ts_dados_basicos;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
end;

procedure Tfrm_taxaSelic.btn_excluirClick(Sender: TObject);
begin
  if ( pgctrl_Taxa.ActivePage = ts_dados_basicos ) or
     ( pgctrl_Taxa.ActivePage = ts_lista ) then
  begin
    if BoxMensagem( 'Esta Taxa Selic será excluída! Confirma exclusão?', 1 ) Then
    try
      datm_main.db_broker.StartTransaction;
      datm_TaxaSelic.qry_TaxaSelic.Delete;
      datm_TaxaSelic.qry_ListaTaxaSelic.Close;
      datm_TaxaSelic.qry_ListaTaxaSelic.Open;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_TaxaSelic.qry_TaxaSelic.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    pgctrl_Taxa.ActivePage := ts_lista;
  end;
end;

procedure Tfrm_taxaSelic.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_taxaSelic.edt_chaveChange(Sender: TObject);
begin
//  Localiza(datm_moeda.qry_moeda_broker_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_taxaSelic.cb_ordemClick(Sender: TObject);
begin
{  Pesquisa := datm_moeda.qry_moeda_broker_CD_MOEDA.AsString;
  // Apaga o campo de pesquisa
  edt_chave.Text := '';
  datm_moeda.qry_moeda_broker_.Close;
  datm_moeda.qry_moeda_broker_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_moeda.qry_moeda_broker_.Open;
  Localiza(datm_moeda.qry_moeda_broker_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;}
end;

procedure Tfrm_taxaSelic.dbedt_cd_moeda_scxExit(Sender: TObject);
begin
  if Not OnChanging then
  begin
    Consiste;
    lcd_moeda_scx := False;
  end;
end;

procedure Tfrm_taxaSelic.dbedt_tx_cambioExit(Sender: TObject);
begin
  if dbedt_tx_cambio.Text = '' then dbedt_tx_cambio.Text := '0';
end;

function Tfrm_taxaSelic.Consiste : Boolean;
begin
  Consiste := True;
  if ( pgctrl_Taxa.ActivePage = ts_dados_basicos ) or
     ( pgctrl_Taxa.ActivePage = ts_lista ) then
  begin
    if dbedt_dt_inicio.Date = 0 then
    begin
      BoxMensagem('Campo Data de Início deve ser preenchido!', 2);
      pgctrl_Taxa.ActivePage := ts_dados_basicos;
      dbedt_dt_inicio.SetFocus;
      Consiste := False;
      Exit;
    end;

    if dbedt_dt_fim.Date = 0 then
    begin
      BoxMensagem('Campo Data Final deve ser preenchido!', 2);
      pgctrl_Taxa.ActivePage := ts_dados_basicos;
      dbedt_dt_fim.SetFocus;
      Consiste := False;
      Exit;
    end;

    if dbedt_tx_cambio.Text = '' then
    begin
      BoxMensagem('Campo Taxa Selic deve ser preenchido!', 2);
      pgctrl_Taxa.ActivePage := ts_dados_basicos;
      dbedt_tx_cambio.SetFocus;
      Consiste := False;
      Exit;
    end;
  end
end;

Function Tfrm_taxaSelic.Grava : Boolean;
Var
  cd_moeda : String[3];
  dt_inicio_vig, dt_termino_vig : TDateTime;
begin
  If ( pgctrl_Taxa.ActivePage = ts_dados_basicos ) Or
     ( pgctrl_Taxa.ActivePage = ts_lista ) Then
  Begin
    try
      datm_main.db_broker.StartTransaction;
      If ( datm_TaxaSelic.qry_TaxaSelic.State in [dsInsert, dsEdit] ) then
      begin
        datm_TaxaSelic.qry_TaxaSelic.Post;
        Pesquisa := datm_TaxaSelic.qry_TaxaSelicCODIGO.AsString;
        datm_TaxaSelic.qry_TaxaSelic.Close;
        datm_TaxaSelic.qry_TaxaSelic.Prepare;
        datm_TaxaSelic.qry_TaxaSelic.Open;
        Localiza(datm_TaxaSelic.qry_TaxaSelic, Pesquisa, a_str_indices[0] );
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        datm_TaxaSelic.qry_TaxaSelic.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;
end;

function Tfrm_taxaSelic.Veralt;
begin
  Veralt := True;
  if ( pgctrl_Taxa.ActivePage = ts_dados_basicos ) then
  begin
    if ( ( datm_TaxaSelic.qry_TaxaSelic.State in [dsEdit] ) and st_modificar ) or
       ( datm_TaxaSelic.qry_TaxaSelic.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Taxa Selic foi alterada.' + #13#10 +
         'Deseja salvar as alterações?', 1) then
      begin
        if Not Consiste then
        begin
          Veralt := False;
          Exit;
        end;
        if Not Grava then
        begin
          Veralt := False;
          Exit;
        end;
      end
      else
        Cancelar;
    end;
  end
end;

procedure Tfrm_taxaSelic.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_taxaSelic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_TaxaSelic do
    begin
      qry_ListaTaxaSelic.Close;
      qry_TaxaSelic.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_taxaSelic.dbg_cadastroDblClick(Sender: TObject);
begin
  pgctrl_Taxa.ActivePage := ts_dados_basicos;
end;

end.
