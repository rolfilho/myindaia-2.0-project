(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGSM234.PAS - Cadastro de Departamentos

AUTOR: Leandro Stipanich

DATA: 08/10/2001

Manutenção: Leandro Stipanich

Data: 08/10/2001

************************************************************************************************)
unit PGSM234;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, DBCtrls, Grids, DBGrids, ComCtrls, Buttons, StdCtrls, ExtCtrls,
  Menus, Db, DBTables;

type
  Tfrm_depto = class(TForm)
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    cb_ordem: TComboBox;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pgctrl_depto: TPageControl;
    ts_lista: TTabSheet;
    dbgrd_depto: TDBGrid;
    ts_dados_basicos: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dbedt_cd_depto: TDBEdit;
    dbedt_nm_depto: TDBEdit;
    edt_chave: TEdit;
    function  VerAlt   : Boolean;
    function  Grava    : Boolean;
    function  Consiste : Boolean;
    procedure Cancelar;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrl_deptoChange(Sender: TObject);
    procedure pgctrl_deptoChanging(Sender: TObject; var AllowChange: Boolean);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_nm_deptoChange(Sender: TObject);
    procedure dbgrd_deptoDblClick(Sender: TObject);
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
  frm_depto: Tfrm_depto;

implementation

uses PGSM235, PGGP017, GSMLIB;

{$R *.DFM}

procedure Tfrm_depto.btn_incluirClick(Sender: TObject);
begin
  with datm_depto do
  begin
    qry_depto_.DisableControls;
    qry_depto_.Cancel;
    qry_depto_.Append;
    qry_depto_.EnableControls;
    qry_depto_CD_DEPTO.AsString := UltCod( qry_ult_depto_, qry_ult_depto_ULTIMO );
  end;
  btn_mi( False,True,True,False );
  pgctrl_depto.ActivePage := ts_dados_basicos;
  dbedt_nm_depto.SetFocus;
end;

procedure Tfrm_depto.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if not Consiste then Exit;
  if not Grava    then Exit;
end;

procedure Tfrm_depto.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_depto.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este Departamento será excluído! Confirma exclusão?', 1 ) then
  begin
    try
      datm_main.db_broker.StartTransaction;
      datm_depto.qry_depto_.Delete;
      datm_depto.qry_depto_.Close;
      datm_depto.qry_depto_.Prepare;
      datm_depto.qry_depto_.Open;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_depto.qry_depto_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    pgctrl_depto.ActivePage := ts_lista;

    btn_mi( True,False,False,datm_depto.qry_depto_.RecordCount > 0 );
  end;
end;

procedure Tfrm_depto.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_depto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close else
  if Key = #13 then dbgrd_deptoDblClick(nil);
end;

procedure Tfrm_depto.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_depto,datm_depto );

  a_str_indices[0] := 'CD_DEPTO';
  a_str_indices[1] := 'NM_DEPTO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Nome');
    ItemIndex := 1;
  end;
end;

procedure Tfrm_depto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_depto.qry_depto_.Close;
  datm_depto.qry_depto_.UnPrepare;

  datm_depto.Free;
  Action := caFree;
end;

procedure Tfrm_depto.pgctrl_deptoChange(Sender: TObject);
begin
  dbnvg.Enabled := pgctrl_depto.ActivePage = ts_lista;
end;

procedure Tfrm_depto.pgctrl_deptoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_depto.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( datm_depto.qry_depto_.State in [ dsInsert,dsEdit ] ) then
  begin
    if BoxMensagem('Cadastro de Departamentos foi alterado.' + #13#10 + 'Deseja salvar as alterações?', 1) then
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

function Tfrm_depto.Consiste : Boolean;
begin
  Consiste := True;

  {Nome}
  if Trim( dbedt_nm_depto.Text ) = '' then
  begin
    BoxMensagem( 'Nome deve ser Preenchido',2 );
    Consiste := False;
    pgctrl_depto.ActivePage := ts_dados_basicos;
    dbedt_nm_depto.SetFocus;
    Exit;
  end;
end;

function Tfrm_depto.Grava : Boolean;
begin
  Grava := True;
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_depto.qry_depto_.State in [dsInsert, dsEdit] ) then
    begin
      datm_depto.qry_depto_.Post;
      Pesquisa := datm_depto.qry_depto_CD_DEPTO.AsString;
      datm_depto.qry_depto_.Close;
      datm_depto.qry_depto_.Prepare;
      datm_depto.qry_depto_.Open;
      Localiza( datm_depto.qry_depto_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_depto.qry_depto_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  btn_mi( True,False,False,datm_depto.qry_depto_.RecordCount > 0 );
end;

procedure Tfrm_depto.Cancelar;
begin
  try
    if datm_depto.qry_depto_.State in [dsInsert, dsEdit] then
    begin
      datm_depto.qry_depto_.Cancel;
      datm_depto.qry_depto_.Close;
      datm_depto.qry_depto_.Prepare;
      datm_depto.qry_depto_.Open;
      pgctrl_depto.ActivePage := ts_dados_basicos;
      dbedt_nm_depto.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;

  btn_mi( True,False,False,datm_depto.qry_depto_.RecordCount > 0 );
end;

procedure Tfrm_depto.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_depto.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_depto.qry_depto_CD_DEPTO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_depto.qry_depto_.Close;
  datm_depto.qry_depto_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_depto.qry_depto_.Open;
  Localiza( datm_depto.qry_depto_,Pesquisa,a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_depto.edt_chaveChange(Sender: TObject);
begin
  Localiza( datm_depto.qry_depto_,edt_chave.Text,a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_depto.FormShow(Sender: TObject);
begin
  with datm_depto do
  begin
    qry_depto_.Close;
    qry_depto_.UnPrepare;
    qry_depto_.Prepare;
    qry_depto_.Open;

    btn_mi( True,False,False,qry_depto_.RecordCount > 0 );
  end;

  pgctrl_depto.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_depto.dbedt_nm_deptoChange(Sender: TObject);
begin
  if ( datm_depto.qry_depto_.State in [ dsInsert,dsEdit ] ) then
    btn_mi( False,True,True,False );
end;

procedure Tfrm_depto.dbgrd_deptoDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_depto.qry_depto_CD_DEPTO.AsString;
    except
      try
        Cons_Online_Texto := datm_depto.qry_depto_CD_DEPTO.AsString;
      except
        BoxMensagem( 'Não foi possível retornar o Código do Indicado!', 2 );
      end;
    end;
    Close;
  end;
end;

end.
