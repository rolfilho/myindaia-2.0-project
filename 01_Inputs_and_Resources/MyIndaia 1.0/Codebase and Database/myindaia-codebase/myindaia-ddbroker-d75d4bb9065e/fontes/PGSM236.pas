(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGSM236.PAS - Cadastro de Cargos

AUTOR: Leandro Stipanich

DATA: 08/10/2001

Manutenção: Leandro Stipanich

Data: 08/10/2001

************************************************************************************************)
unit PGSM236;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, DBCtrls, Grids, DBGrids, ComCtrls, Buttons, StdCtrls, ExtCtrls,
  Menus, Db, DBTables;

type
  Tfrm_depto_cargo = class(TForm)
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pgctrl_cargo: TPageControl;
    ts_lista: TTabSheet;
    dbgrd_cargo: TDBGrid;
    ts_dados_basicos: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dbedt_cd_cargo: TDBEdit;
    dbedt_nm_cargo: TDBEdit;
    Query1: TQuery;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    function  Grava    : Boolean;
    function  Consiste : Boolean;
    function  VerAlt   : Boolean;
    procedure dbedt_nm_cargoChange(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure pgctrl_cargoChange(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure dbgrd_cargoDblClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_chaveChange(Sender: TObject);
    procedure pgctrl_cargoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
  private
    { Private declarations }
    a_str_indices     : Array [0..1] of String[60];
    Pesquisa          : String;
  public
    { Public declarations }
    lCons_OnLine      : Boolean;
    Cons_OnLine       : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_depto_cargo: Tfrm_depto_cargo;

implementation

uses PGSM237, GSMLIB, PGGP017;

{$R *.DFM}

procedure Tfrm_depto_cargo.dbedt_nm_cargoChange(Sender: TObject);
begin
  if ( datm_depto_cargo.qry_cargo_.State in [ dsInsert,dsEdit ] ) then
    btn_mi( False,True,True,False );
end;

procedure Tfrm_depto_cargo.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_depto_cargo.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_depto_cargo.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if not Consiste then Exit;
  if not Grava    then Exit;
end;

procedure Tfrm_depto_cargo.pgctrl_cargoChange(Sender: TObject);
begin
  dbnvg.Enabled := pgctrl_cargo.ActivePage = ts_lista;
end;

procedure Tfrm_depto_cargo.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_depto_cargo.dbgrd_cargoDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_depto_cargo.qry_cargo_CD_DEPTO_CARGO.AsString;
    except
      try
        Cons_Online_Texto := datm_depto_cargo.qry_cargo_CD_DEPTO_CARGO.AsString;
      except
        BoxMensagem( 'Não foi possível retornar o Código do Indicado!', 2 );
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_depto_cargo.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_depto_cargo.qry_cargo_CD_DEPTO_CARGO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_depto_cargo.qry_cargo_.Close;
  datm_depto_cargo.qry_cargo_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_depto_cargo.qry_cargo_.Open;
  Localiza( datm_depto_cargo.qry_cargo_,Pesquisa,a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_depto_cargo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close else
  if Key = #13 then dbgrd_cargoDblClick(nil);
end;

procedure Tfrm_depto_cargo.edt_chaveChange(Sender: TObject);
begin
  Localiza( datm_depto_cargo.qry_cargo_,edt_chave.Text,a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_depto_cargo.Cancelar;
begin
  try
    if datm_depto_cargo.qry_cargo_.State in [dsInsert, dsEdit] then
    begin
      datm_depto_cargo.qry_cargo_.Cancel;
      datm_depto_cargo.qry_cargo_.Close;
      datm_depto_cargo.qry_cargo_.Prepare;
      datm_depto_cargo.qry_cargo_.Open;
      pgctrl_cargo.ActivePage := ts_dados_basicos;
      dbedt_nm_cargo.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;

  btn_mi( True,False,False,datm_depto_cargo.qry_cargo_.RecordCount > 0 );
end;

function Tfrm_depto_cargo.Grava : Boolean;
begin
  Grava := True;
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_depto_cargo.qry_cargo_.State in [dsInsert, dsEdit] ) then
    begin
      datm_depto_cargo.qry_cargo_.Post;
      Pesquisa := datm_depto_cargo.qry_cargo_CD_DEPTO_CARGO.AsString;
      datm_depto_cargo.qry_cargo_.Close;
      datm_depto_cargo.qry_cargo_.Prepare;
      datm_depto_cargo.qry_cargo_.Open;
      Localiza( datm_depto_cargo.qry_cargo_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_depto_cargo.qry_cargo_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  btn_mi( True,False,False,datm_depto_cargo.qry_cargo_.RecordCount > 0 );
end;

function Tfrm_depto_cargo.Consiste : Boolean;
begin
  Consiste := True;

  {Nome}
  if Trim( dbedt_nm_cargo.Text ) = '' then
  begin
    BoxMensagem( 'Campo Nome dever ser preenchido!',2 );
    Consiste := False;
    pgctrl_cargo.ActivePage := ts_dados_basicos;
    dbedt_nm_cargo.SetFocus;
    Exit;
  end;
end;

function Tfrm_depto_cargo.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( datm_depto_cargo.qry_cargo_.State in [ dsInsert,dsEdit ] ) then
  begin
    if BoxMensagem('Cadastro de Cargos foi alterado.' + #13#10 + 'Deseja salvar as alterações?', 1) then
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
    else Cancelar;
  end;
end;

procedure Tfrm_depto_cargo.pgctrl_cargoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_depto_cargo.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_depto_cargo,datm_depto_cargo );

  datm_depto_cargo.qry_cargo_.Close;
  datm_depto_cargo.qry_cargo_.Prepare;
  datm_depto_cargo.qry_cargo_.Open;

  btn_mi( True,False,False,datm_depto_cargo.qry_cargo_.RecordCount > 0 );
end;

procedure Tfrm_depto_cargo.FormShow(Sender: TObject);
begin
  a_str_indices[0] := 'CD_DEPTO_CARGO';
  a_str_indices[1] := 'NM_DEPTO_CARGO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Nome');
    ItemIndex := 1;
  end;
end;

procedure Tfrm_depto_cargo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_depto_cargo.qry_cargo_.Close;
  datm_depto_cargo.qry_cargo_.UnPrepare;

  datm_depto_cargo.Free;

  Action := caFree;
end;

procedure Tfrm_depto_cargo.btn_incluirClick(Sender: TObject);
begin
  with datm_depto_cargo do
  begin
    qry_cargo_.DisableControls;
    qry_cargo_.Cancel;
    qry_cargo_.Append;
    qry_cargo_.EnableControls;
    qry_cargo_CD_DEPTO_CARGO.AsString := UltCod( qry_ult_cargo_, qry_ult_cargo_ULTIMO );
  end;
  btn_mi( False,True,True,False );
  pgctrl_cargo.ActivePage := ts_dados_basicos;
  dbedt_nm_cargo.SetFocus;
end;

procedure Tfrm_depto_cargo.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este Cargo será excluído! Confirma exclusão?', 1 ) then
  begin
    try
      datm_main.db_broker.StartTransaction;
      datm_depto_cargo.qry_cargo_.Delete;
      datm_depto_cargo.qry_cargo_.Close;
      datm_depto_cargo.qry_cargo_.Prepare;
      datm_depto_cargo.qry_cargo_.Open;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_depto_cargo.qry_cargo_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    pgctrl_cargo.ActivePage := ts_lista;

    btn_mi( True,False,False,datm_depto_cargo.qry_cargo_.RecordCount > 0 );
  end;
end;

end.
