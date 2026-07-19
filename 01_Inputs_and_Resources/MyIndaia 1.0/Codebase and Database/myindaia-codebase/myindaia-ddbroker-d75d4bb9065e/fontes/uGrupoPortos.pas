(*******************************************************************************

Sistema: DD Broker - Bysoft

PROGRAMA: PGSM259.PAS - frm_grupo_portos

AUTOR: Ricardo Giacomi Lopes

DATA: 27/06/2002

Manutenção: Ricardo Giacomi Lopes

Data: 28/06/2002 - ADBC-0006 - Cadastro de Portos

********************************************************************************)

unit uGrupoPortos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, Menus, Mask, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, Funcoes;

type
  Tfrm_grupo_portos = class(TForm)
    pgctrl_grupo_portos: TPageControl;
    ts_lista: TTabSheet;
    dbg_grupo_portos: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    dbedt_cd_grupo_portos: TDBEdit;
    dbedt_nm_grupo_portos: TDBEdit;
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
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_grupo_portosChange(Sender: TObject);
    procedure pgctrl_grupo_portosChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbg_grupo_portosDblClick(Sender: TObject);
    procedure dbg_grupo_portosKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dbedt_nm_grupo_portosChange(Sender: TObject);
  private
    { Private declarations }
    function Consiste : Boolean;
    function Grava    : Boolean;
    function VerAlt   : Boolean;
    procedure Cancelar;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );


  public
    { Public declarations }
    Pesquisa : String;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
    st_modificar, st_incluir, st_excluir: Boolean;
  end;

var
  frm_grupo_portos: Tfrm_grupo_portos;

implementation

uses GSMLIB, PGGP001, dGrupoPortos, PGGP017;

{$R *.DFM}

procedure Tfrm_grupo_portos.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;
  with datm_grupo_portos do
  begin
    qry_grupo_portos_.DisableControls;
    qry_grupo_portos_.Cancel;
    qry_grupo_portos_.Append;
    qry_grupo_portos_.EnableControls;
    qry_grupo_portos_CD_GRUPO_PORTO.AsString  := UltCod( qry_ult_grupo_portos_, qry_ult_grupo_portos_ULTIMO );
  end;
  pgctrl_grupo_portos.ActivePage := ts_dados_basicos;
  dbedt_nm_grupo_portos.SetFocus;

end;

function Tfrm_grupo_portos.Grava : Boolean;
begin
 try
    datm_main.db_broker.StartTransaction;
    if ( datm_grupo_portos.qry_grupo_portos_.State in [dsInsert, dsEdit] ) then
    begin
      datm_grupo_portos.qry_grupo_portos_.Post;
      Pesquisa := datm_grupo_portos.qry_grupo_portos_CD_GRUPO_PORTO.AsString;
      datm_grupo_portos.qry_grupo_portos_.Close;
      datm_grupo_portos.qry_grupo_portos_.Prepare;
      datm_grupo_portos.qry_grupo_portos_.Open;
      Localiza(datm_grupo_portos.qry_grupo_portos_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      datm_grupo_portos.qry_grupo_portos_.Cancel;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );

end;

function Tfrm_grupo_portos.Consiste : Boolean;
begin
  Consiste := False;
  if dbedt_cd_grupo_portos.text = '' then
   begin
    BoxMensagem('Deve se inserir o Código do Grupo de Porto!', 2);
    pgctrl_grupo_portos.ActivePage := ts_dados_basicos;
    Consiste := False;
    Exit;
   end;
  if dbedt_nm_grupo_portos.Text = '' then
  begin
    BoxMensagem('Campo Descrição deve ser preenchido!', 2);
    pgctrl_grupo_portos.ActivePage := ts_dados_basicos;
    dbedt_nm_grupo_portos.SetFocus;
    Consiste := False;
    Exit;
  end;
  Consiste := True;
end;

procedure Tfrm_grupo_portos.btn_salvarClick(Sender: TObject);
begin
  if Not Consiste then Exit;
  if Not Grava then Exit;

end;

procedure Tfrm_grupo_portos.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;


procedure Tfrm_grupo_portos.Cancelar;
begin
  try
    if datm_grupo_portos.qry_grupo_portos_.State in [dsInsert, dsEdit] then
    begin
      datm_grupo_portos.qry_grupo_portos_.Cancel;
      pgctrl_grupo_portos.ActivePage := ts_dados_basicos;
      dbedt_nm_grupo_portos.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente!', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_grupo_portos.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_grupo_portos.btn_excluirClick(Sender: TObject);
begin
  if datm_grupo_portos.qry_grupo_portos_.IsEmpty then
   begin
      BoxMensagem( 'Não existe Registro para ser excluído!', 2 );
      exit;
     end;

  if BoxMensagem( 'Este cadastro será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
  try
    datm_main.db_broker.StartTransaction;
    datm_grupo_portos.qry_grupo_portos_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      datm_grupo_portos.qry_grupo_portos_.Cancel;
      TrataErro(E);
    end;
  end;
  Pesquisa := datm_grupo_portos.qry_grupo_portos_CD_GRUPO_PORTO.AsString;
  Localiza (datm_grupo_portos.qry_grupo_portos_, Pesquisa, a_str_indices[0]);
  pgctrl_grupo_portos.ActivePage := ts_lista;

end;

function Tfrm_grupo_portos.VerAlt: Boolean;
begin
  VerAlt := True;
  if ( ( datm_grupo_portos.qry_grupo_portos_.State in [dsEdit] ) and st_modificar ) or
     ( datm_grupo_portos.qry_grupo_portos_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Grupo de Portos foi alterado.' + #13#10 +
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

procedure Tfrm_grupo_portos.btn_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_grupo_portos.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_grupo_portos.qry_grupo_portos_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_grupo_portos.edt_chaveKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then dbg_grupo_portosDblClick(nil); // trabalha c/ dbgrid
end;

procedure Tfrm_grupo_portos.cb_ordemClick(Sender: TObject);
begin
   Pesquisa := datm_grupo_portos.qry_grupo_portos_CD_GRUPO_PORTO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_grupo_portos.qry_grupo_portos_.Close;
  datm_grupo_portos.qry_grupo_portos_.SQL[3] := a_str_indices[cb_ordem.ItemIndex];
  datm_grupo_portos.qry_grupo_portos_.Prepare;
  datm_grupo_portos.qry_grupo_portos_.Open;
  Localiza(datm_grupo_portos.qry_grupo_portos_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;

end;

procedure Tfrm_grupo_portos.pgctrl_grupo_portosChange(Sender: TObject);
begin
  if (pgctrl_grupo_portos.ActivePage = ts_lista ) then
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

  if (pgctrl_grupo_portos.ActivePage = ts_dados_basicos) then
    dbedt_nm_grupo_portos.SetFocus;

end;

procedure Tfrm_grupo_portos.pgctrl_grupo_portosChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_grupo_portos.dbg_grupo_portosDblClick(Sender: TObject);
begin
If lCons_OnLine Then
  begin
    try
//      Cons_OnLine.AsString := datm_grupo_portos.qry_grupo_portos_CD_GRUPO_PORTO.AsString;
      Cons_Online_Texto := datm_grupo_portos.qry_grupo_portos_CD_GRUPO_PORTO.AsString;
    except
      BoxMensagem('Não foi possível retornar o Código do Grupo do Porto !', 2);
    end;
    Close;
  end;

end;

procedure Tfrm_grupo_portos.dbg_grupo_portosKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #13 then dbg_grupo_portosDblClick(Sender);
end;

procedure Tfrm_grupo_portos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_grupo_portos.qry_grupo_portos_.Close;
  datm_grupo_portos.free;
  action:= cafree;
end;

procedure Tfrm_grupo_portos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   VerAlt;
end;

procedure Tfrm_grupo_portos.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_grupo_portos, datm_grupo_portos);

  datm_grupo_portos.qry_grupo_portos_.Close;
  datm_grupo_portos.qry_grupo_portos_.SQL[3] := 'NM_GRUPO_PORTO';
  datm_grupo_portos.qry_grupo_portos_.Prepare;
  datm_grupo_portos.qry_grupo_portos_.Open;

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  btn_incluir.Enabled   := st_incluir;
  btn_excluir.Enabled   := st_excluir;
  mi_incluir.Enabled    := st_incluir;
  mi_excluir.Enabled    := st_excluir;
  dbnvg.Enabled := True;
  datm_grupo_portos.ds_grupo_portos.AutoEdit          := st_modificar;

  a_str_indices[0] := 'CD_GRUPO_PORTO';
  a_str_indices[1] := 'NM_GRUPO_PORTO';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Nome');
    ItemIndex := 1;
  end;

end;

procedure Tfrm_grupo_portos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
  if key = #13 then dbg_grupo_portosDblClick(Sender);

end;

procedure Tfrm_grupo_portos.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_grupo_portos.ActivePage:= ts_lista;
  edt_chave.setfocus;
end;

procedure Tfrm_grupo_portos.dbedt_nm_grupo_portosChange(Sender: TObject);
begin
  if ( datm_grupo_portos.qry_grupo_portos_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );

end;

end.
