(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGSM232.PAS - Cadastro de Indicado Por

AUTOR: Leandro Stipanich

DATA: 08/10/2001

Manutenção: Leandro Stipanich

Data: 08/10/2001

*************************************************************************************************)
unit PGSM232;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, DBCtrls, Grids, DBGrids, ComCtrls, StdCtrls, Menus, Buttons,
  ExtCtrls, Db, DBTables;

type
  Tfrm_cliente_indicado = class(TForm)
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pgctrl_cliente_indicado: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    Panel1: TPanel;
    dbgrd_indicado: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbedt_cd_indicado: TDBEdit;
    dbedt_nm_indicado: TDBEdit;
    dbedt_email_indicado: TDBEdit;
    dbedt_cd_depto: TDBEdit;
    dbedt_cd_cargo: TDBEdit;
    dbedt_nm_depto: TDBEdit;
    dbedt_nm_cargo: TDBEdit;
    btn_co_depto: TSpeedButton;
    btn_co_cargo: TSpeedButton;
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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedt_cd_indicadoChange(Sender: TObject);
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    function  Consiste : Boolean;
    function  Grava    : Boolean;
    function  VerAlt   : Boolean;
    procedure dbedt_cd_deptoExit(Sender: TObject);
    procedure dbedt_cd_cargoExit(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure dbedt_nm_indicadoExit(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure dbgrd_indicadoDblClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure pgctrl_cliente_indicadoChange(Sender: TObject);
    procedure pgctrl_cliente_indicadoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure btn_co_deptoClick(Sender: TObject);
    procedure dbedt_cd_deptoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_cargoClick(Sender: TObject);
  private
    { Private declarations }
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
  public
    { Public declarations }
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_cliente_indicado: Tfrm_cliente_indicado;

implementation

uses PGSM233, GSMLIB, PGGP017, PGSM234, PGSM236;

{$R *.DFM}


procedure Tfrm_cliente_indicado.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_cliente_indicado,datm_cliente_indicado );

  a_str_indices[0] := 'CD_CLIENTE_INDICADO';
  a_str_indices[1] := 'NM_CLIENTE_INDICADO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Nome');
    ItemIndex := 1;
  end;
end;

procedure Tfrm_cliente_indicado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_cliente_indicado do
  begin
    qry_lista_.Close;
    qry_lista_.UnPrepare;

    qry_depto_.Close;
    qry_depto_.UnPrepare;

    qry_cargo_.Close;
    qry_cargo_.UnPrepare;

    datm_cliente_indicado.Free;
  end;

  Action := caFree;
end;

procedure Tfrm_cliente_indicado.dbedt_cd_indicadoChange(Sender: TObject);
begin
  if ( datm_cliente_indicado.qry_indicado_.State in [ dsInsert,dsEdit ] ) then
    btn_mi( False,True,True,False );
end;

procedure Tfrm_cliente_indicado.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_cliente_indicado.dbedt_cd_deptoExit(Sender: TObject);
begin
  if ( datm_cliente_indicado.qry_indicado_.State in [ dsInsert,dsEdit ] ) then
  begin
    if Trim( dbedt_cd_depto.Text ) = '' then Exit;

    ValidCodigo( dbedt_cd_depto );
    if Trim( dbedt_nm_depto.Text ) = '' then
    begin
      BoxMensagem( 'Departamento Inválido!',2 );
      dbedt_cd_depto.SetFocus;
    end;
  end;
end;

procedure Tfrm_cliente_indicado.dbedt_cd_cargoExit(Sender: TObject);
begin
  if ( datm_cliente_indicado.qry_indicado_.State in [ dsInsert,dsEdit ] ) then
  begin
    if Trim( dbedt_cd_cargo.Text ) = '' then Exit;

    ValidCodigo( dbedt_cd_cargo );
    if Trim( dbedt_cd_cargo.Text ) = '' then
    begin
      BoxMensagem( 'Cargo Inválido!',2 );
      dbedt_cd_cargo.SetFocus;
    end;
  end;
end;

procedure Tfrm_cliente_indicado.btn_incluirClick(Sender: TObject);
begin
  with datm_cliente_indicado do
  begin
    ActiveControl := nil;
    qry_indicado_.DisableControls;
    qry_indicado_.Cancel;
    qry_indicado_.Append;
    qry_indicado_.EnableControls;
    qry_indicado_CD_CLIENTE_INDICADO.AsString := UltCod( qry_ult_indicado_, qry_ult_indicado_ULTIMO );
  end;
  btn_mi( False,True,True,False );
  pgctrl_cliente_indicado.ActivePage := ts_dados_basicos;
  dbedt_nm_indicado.SetFocus;
end;

procedure Tfrm_cliente_indicado.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then Close else
  if Key = #13 then dbgrd_indicadoDblClick(nil);
end;

procedure Tfrm_cliente_indicado.FormShow(Sender: TObject);
begin
  with datm_cliente_indicado do
  begin
    qry_lista_.Close;
    qry_lista_.UnPrepare;
    qry_lista_.Prepare;
    qry_lista_.Open;

    btn_mi( True,False,False,qry_lista_.RecordCount > 0 );
  end;

  pgctrl_cliente_indicado.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_cliente_indicado.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este Indicado será excluído! Confirma exclusão?', 1 ) then
  begin
    try
      datm_main.db_broker.StartTransaction;
      datm_cliente_indicado.qry_indicado_.Delete;
      datm_cliente_indicado.qry_lista_.Close;
      datm_cliente_indicado.qry_lista_.Prepare;
      datm_cliente_indicado.qry_lista_.Open;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_cliente_indicado.qry_indicado_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    pgctrl_cliente_indicado.ActivePage := ts_lista;

    btn_mi( True,False,False,datm_cliente_indicado.qry_lista_.RecordCount > 0 );
  end;
end;

procedure Tfrm_cliente_indicado.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_cliente_indicado.Cancelar;
begin
  try
    if datm_cliente_indicado.qry_indicado_.State in [dsInsert, dsEdit] then
    begin
      datm_cliente_indicado.qry_indicado_.Cancel;
      datm_cliente_indicado.qry_lista_.Close;
      datm_cliente_indicado.qry_lista_.Prepare;
      datm_cliente_indicado.qry_lista_.Open;
      pgctrl_cliente_indicado.ActivePage := ts_dados_basicos;
      dbedt_nm_indicado.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;

  btn_mi( True,False,False,datm_cliente_indicado.qry_lista_.RecordCount > 0 );
end;

procedure Tfrm_cliente_indicado.btn_salvarClick(Sender: TObject);
begin
  if not Consiste then Exit;
  if not Grava    then Exit;
end;

function Tfrm_cliente_indicado.Consiste : Boolean;
begin
  Consiste := True;

  { Nome }
  if Trim( dbedt_nm_indicado.Text ) = '' then
  begin
    BoxMensagem('Campo Nome deve ser preenchido!', 2);
    Consiste := False;
    pgctrl_cliente_indicado.ActivePage := ts_dados_basicos;
    dbedt_nm_indicado.SetFocus;
    Exit;
  end;

  { Departamento }
  if Trim( dbedt_cd_depto.Text ) <> '' then
  begin
    if Trim( dbedt_nm_depto.Text ) = '' then
    begin
      BoxMensagem('Departamento Inválido!', 2);
      Consiste := False;
      pgctrl_cliente_indicado.ActivePage := ts_dados_basicos;
      dbedt_cd_depto.SetFocus;
      Exit;
    end;
  end;

  { Cargo }
  if Trim( dbedt_cd_cargo.Text ) <> '' then
  begin
    if Trim( dbedt_nm_cargo.Text ) = '' then
    begin
      BoxMensagem('Cargo Inválido!', 2);
      Consiste := False;
      pgctrl_cliente_indicado.ActivePage := ts_dados_basicos;
      dbedt_cd_cargo.SetFocus;
      Exit;
    end;
  end;
end;

function Tfrm_cliente_indicado.Grava : Boolean;
begin
  Grava := True;
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_cliente_indicado.qry_indicado_.State in [dsInsert, dsEdit] ) then
    begin
      datm_cliente_indicado.qry_indicado_.Post;
      Pesquisa := datm_cliente_indicado.qry_indicado_CD_CLIENTE_INDICADO.AsString;
      datm_cliente_indicado.qry_lista_.Close;
      datm_cliente_indicado.qry_lista_.Prepare;
      datm_cliente_indicado.qry_lista_.Open;
      Localiza( datm_cliente_indicado.qry_lista_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_cliente_indicado.qry_indicado_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  btn_mi( True,False,False,datm_cliente_indicado.qry_lista_.RecordCount > 0 );
end;

procedure Tfrm_cliente_indicado.dbedt_nm_indicadoExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_cliente_indicado.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_cliente_indicado.qry_lista_CD_CLIENTE_INDICADO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_cliente_indicado.qry_lista_.Close;
  datm_cliente_indicado.qry_lista_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_cliente_indicado.qry_lista_.Open;
  Localiza( datm_cliente_indicado.qry_lista_,Pesquisa,a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_cliente_indicado.edt_chaveChange(Sender: TObject);
begin
  Localiza( datm_cliente_indicado.qry_lista_,edt_chave.Text,a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_cliente_indicado.dbgrd_indicadoDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_cliente_indicado.qry_indicado_CD_CLIENTE_INDICADO.AsString;
    except
      try
        Cons_Online_Texto := datm_cliente_indicado.qry_indicado_CD_CLIENTE_INDICADO.AsString;
      except
        BoxMensagem( 'Não foi possível retornar o Código do Indicado!', 2 );
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_cliente_indicado.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_cliente_indicado.pgctrl_cliente_indicadoChange(
  Sender: TObject);
begin
  dbnvg.Enabled := pgctrl_cliente_indicado.ActivePage = ts_lista;
end;

procedure Tfrm_cliente_indicado.pgctrl_cliente_indicadoChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_cliente_indicado.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( datm_cliente_indicado.qry_indicado_.State in [ dsEdit,dsInsert ] ) then
  begin
    if BoxMensagem('Cadastro de Indicados foi alterado.' + #13#10 + 'Deseja salvar as alterações?', 1) then
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

procedure Tfrm_cliente_indicado.btn_co_deptoClick(Sender: TObject);
begin
  with datm_cliente_indicado do
  begin
    Application.CreateForm( Tfrm_depto, frm_depto );
    with frm_depto do
    begin
      Cons_OnLine  := qry_indicado_CD_DEPTO;
      Caption      := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if Not ( qry_indicado_.State in [ dsEdit,dsInsert ] ) then qry_indicado_.Edit;
      ShowModal;
      lCons_OnLine := False;
    end;
    qry_depto_.Close;
    qry_depto_.Prepare;
    qry_depto_.Open;
  end;
  dbedt_cd_deptoExit(nil);
end;

procedure Tfrm_cliente_indicado.dbedt_cd_deptoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_depto then btn_co_deptoClick(nil) else
    if Sender = dbedt_cd_cargo then btn_co_cargoClick(nil);
  end;
end;

procedure Tfrm_cliente_indicado.btn_co_cargoClick(Sender: TObject);
begin
  with datm_cliente_indicado do
  begin
    Application.CreateForm( Tfrm_depto_cargo, frm_depto_cargo );
    with frm_depto_cargo do
    begin
      Cons_OnLine  := qry_indicado_CD_CARGO;
      Caption      := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if Not ( qry_indicado_.State in [ dsEdit,dsInsert ] ) then qry_indicado_.Edit;
      ShowModal;
      lCons_OnLine := False;
    end;
    qry_cargo_.Close;
    qry_cargo_.Prepare;
    qry_cargo_.Open;
  end;
  dbedt_cd_cargoExit(nil);
end;

end.
