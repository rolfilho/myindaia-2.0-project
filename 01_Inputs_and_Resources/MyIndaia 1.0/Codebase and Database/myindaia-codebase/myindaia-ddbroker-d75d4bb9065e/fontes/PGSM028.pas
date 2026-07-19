unit PGSM028;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Buttons, ExtCtrls, StdCtrls, Db, Mask, DBCtrls, DBTABLES, Grids,
  DBGrids, ComCtrls;

type
  Tfrm_serv_classif = class(TForm)
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
    pgctrl_serv_classif: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_codigo: TLabel;
    lbl_nome: TLabel;
    dbedt_cd_classif: TDBEdit;
    dbedt_nm_classif: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbedt_nm_classifChange(Sender: TObject);
    procedure pgctrl_serv_classifChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pgctrl_serv_classifChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;

    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;

  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_serv_classif: Tfrm_serv_classif;

implementation

uses gsmlib, PGSM020, PGGP017;

{$R *.DFM}

procedure Tfrm_serv_classif.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_serv_classif.btn_salvarClick(Sender: TObject);
begin
  ActiveControl :=nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_serv_classif.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_serv_classif.FormShow(Sender: TObject);
begin
  pgctrl_serv_classif.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_serv_classif.dbg_cadastroDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_serv_classif.qry_serv_classif_CD_CLASSIFICACAO.AsString;
    except
      try
        Cons_OnLine_Texto := datm_serv_classif.qry_serv_classif_CD_CLASSIFICACAO.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código da Classificação de Serviços!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_serv_classif.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  { Inicializa o Data Module para Classificação de Serviços}
  Application.CreateForm( Tdatm_serv_classif, datm_serv_classif );

  with datm_serv_classif do
  begin
    ds_serv_classif.AutoEdit := st_modificar;
    qry_serv_classif_.SQL[2] := 'NM_CLASSIFICACAO';
    qry_serv_classif_.Prepare;
    qry_serv_classif_.Open;
  end;

  a_str_indices[0] := 'CD_CLASSIFICACAO';
  a_str_indices[1] := 'NM_CLASSIFICACAO';

  With cb_ordem do
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

procedure Tfrm_serv_classif.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_serv_classif.qry_serv_classif_.Close;
  datm_serv_classif.Free;
  Action := caFree;
end;

procedure Tfrm_serv_classif.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_serv_classif.btn_incluirClick(Sender: TObject);
begin
  with datm_serv_classif do
  begin
    qry_serv_classif_.DisableControls;
    qry_serv_classif_.Cancel;
    qry_serv_classif_.Append;
    qry_serv_classif_.EnableControls;
    qry_serv_classif_CD_CLASSIFICACAO.AsString  := UltCod( qry_ult_serv_classif_, qry_ult_serv_classif_ULTIMO );
  end;
  pgctrl_serv_classif.ActivePage := ts_dados_basicos;
  dbedt_nm_classif.SetFocus;

  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  dbnvg.Enabled := False;
  edt_chave.Enabled := False;
  cb_ordem.Enabled := False;

end;

procedure Tfrm_serv_classif.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Esta Classificação será excluída! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_serv_classif.qry_serv_classif_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  pgctrl_serv_classif.ActivePage := ts_lista;
end;

procedure Tfrm_serv_classif.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_serv_classif.qry_serv_classif_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_serv_classif.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_serv_classif.qry_serv_classif_CD_CLASSIFICACAO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_serv_classif.qry_serv_classif_.Close;
  datm_serv_classif.qry_serv_classif_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_serv_classif.qry_serv_classif_.Prepare;
  datm_serv_classif.qry_serv_classif_.Open;
  Localiza(datm_serv_classif.qry_serv_classif_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_serv_classif.dbedt_nm_classifChange(Sender: TObject);
begin
  If ( datm_serv_classif.qry_serv_classif_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

function Tfrm_serv_classif.Consiste : Boolean;
begin
  if dbedt_nm_classif.Text = '' then
  begin
    BoxMensagem('Campo Nome deve ser preenchido!', 2);
    pgctrl_serv_classif.ActivePage := ts_dados_basicos;
    dbedt_nm_classif.SetFocus;
    Consiste := False;
    Exit;
  end;
  Consiste := True;
end;

function Tfrm_serv_classif.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    If ( datm_serv_classif.qry_serv_classif_.State in [dsInsert, dsEdit] ) then
    begin
      datm_serv_classif.qry_serv_classif_.Post;
      Pesquisa := datm_serv_classif.qry_serv_classif_CD_CLASSIFICACAO.AsString;
      datm_serv_classif.qry_serv_classif_.Close;
      datm_serv_classif.qry_serv_classif_.Prepare;
      datm_serv_classif.qry_serv_classif_.Open;
      Localiza(datm_serv_classif.qry_serv_classif_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_serv_classif.qry_serv_classif_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_serv_classif.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_serv_classif.qry_serv_classif_.State in [dsEdit] ) and st_modificar ) or
     ( datm_serv_classif.qry_serv_classif_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Tabela de Classificação de Serviços foi alterada.' + #13#10 +
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

procedure Tfrm_serv_classif.Cancelar;
begin
  try
    if datm_serv_classif.qry_serv_classif_.State in [dsInsert, dsEdit] then
    begin
      datm_serv_classif.qry_serv_classif_.Cancel;
      pgctrl_serv_classif.ActivePage := ts_dados_basicos;
      dbedt_nm_classif.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_serv_classif.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_serv_classif.pgctrl_serv_classifChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_serv_classif.pgctrl_serv_classifChange(Sender: TObject);
begin
  if (pgctrl_serv_classif.ActivePage = ts_lista ) then
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

procedure Tfrm_serv_classif.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #27 then Close;
end;

end.
