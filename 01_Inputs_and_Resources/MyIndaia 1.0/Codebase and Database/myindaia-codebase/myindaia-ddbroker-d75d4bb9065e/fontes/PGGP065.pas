unit PGGP065;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, DBCtrls,
  Mask, ComCtrls, StdCtrls;

type
  Tfrm_release = class(TForm)
    pnl_release: TPanel;
    Panel3: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    cb_ordem: TComboBox;
    btn_incluir: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    menu_release: TMainMenu;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_excluir: TMenuItem;
    dbnvg: TDBNavigator;
    pgctrl_release: TPageControl;
    ts_lista: TTabSheet;
    ts_info: TTabSheet;
    Label1: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    dbedt_nr_versao: TDBEdit;
    dbedt_nr_item: TDBEdit;
    dbedt_path_tela: TDBEdit;
    dbm_pendencia: TDBMemo;
    dbm_alteracoes: TDBMemo;
    dbm_release: TDBMemo;
    dbg_release: TDBGrid;
    msk_edt_chave: TMaskEdit;
    dblckpbox_release: TDBLookupComboBox;
    Label9: TLabel;
    btn_frm_release: TSpeedButton;
    mi_release: TMenuItem;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_cancelarClick(Sender: TObject);
    procedure cb_ordemChange(Sender: TObject);
    procedure pgctrl_releaseChange(Sender: TObject);
    procedure pgctrl_releaseChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbedt_nr_versaoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure dbedt_nr_itemChange(Sender: TObject);
    procedure dbedt_path_telaChange(Sender: TObject);
    procedure dbm_releaseChange(Sender: TObject);
    procedure dbm_pendenciaChange(Sender: TObject);
    procedure dbm_alteracoesChange(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure msk_edt_chaveChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblckpbox_releaseClick(Sender: TObject);
    procedure btn_frm_releaseClick(Sender: TObject);


  private
    { Private declarations }
    OnChanging : boolean;
    a_str_indices : Array[0..1] Of String[60];
    st_modificar, st_incluir, st_excluir : Boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    { Public declarations }
    Pesquisa : String;
  end;

var
  frm_release: Tfrm_release;

implementation

{$R *.DFM}

uses PGGP066, PGGP017, GSMLIB, PGGP001;

procedure Tfrm_release.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_release.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

function Tfrm_release.Grava : Boolean;
var nr_versao : String[4];
    nr_item   : String[3];
begin
  try
     datm_main.db_broker.StartTransaction;
     if ( datm_release.qry_lista_.State in [dsInsert, dsEdit] ) then
     begin
       with datm_release.qry_lista_ do
       begin
         Post;
         nr_versao := datm_release.qry_lista_NR_VERSAO.AsString;
         nr_item   := datm_release.qry_lista_NR_ITEM.AsString;
         Close;
         Prepare;
         Open;
         Locate('NR_VERSAO;NR_ITEM', VarArrayOf([nr_versao, nr_item]), [loCaseInsensitive]);
       end;
     end;
     datm_main.db_broker.Commit;
     Grava := True;
  except
    on E: Exception do
    begin
      datm_release.qry_lista_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  btn_mi( True, False, False, True );
end;

procedure Tfrm_release.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_release do
    begin
      qry_lista_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_release.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_release.Cancelar;
begin
  with datm_release do
  begin
    try
      if ( qry_lista_.State in [dsInsert, dsEdit] ) then
      begin
        qry_lista_.Cancel;
        btn_mi( True, False, False, True );
      end;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
  end;
end;

function Tfrm_release.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_release.qry_lista_.State in [dsEdit] ) and st_modificar )  or
     ( datm_release.qry_lista_.State in [dsInsert] ) then
  begin
    if BoxMensagem('O item da versão foi alterado.' + #13#10 +
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

procedure Tfrm_release.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled    := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := canc;  mi_cancelar.Enabled  := Canc;
end;

function Tfrm_release.Consiste : Boolean;
begin
  Consiste := True;
  {Versão}
  if dbedt_nr_versao.Text = '' then
  begin
    BoxMensagem('Campo Número da Versão deve ser preenchido!', 2);
    dbedt_nr_versao.SetFocus;
    Consiste := False;
    Exit;
  end;

  {Caminho - Path Tela}
  if dbedt_path_tela.Text = '' then
  begin
    BoxMensagem( 'Campo Disponível em deve ser preenchido!', 2 );
    dbedt_path_tela.SetFocus;
    Consiste := False;
    Exit;
  end;

  {Alterações}
  if dbm_alteracoes.Text = '' then
  begin
    BoxMensagem( 'Campo Alterações deve ser preenchido!', 2 );
    dbm_alteracoes.SetFocus;
    Consiste := False;
    Exit;
  end;

  {Release}
  if dbm_release.Text = '' then
  begin
    BoxMensagem( 'Campo Release deve ser preenchido!', 2 );
    dbm_alteracoes.SetFocus;
    Consiste := False;
    Exit;
  end;

  {Combo - Classificação}
  if dblckpbox_release.Text = '' then
  begin
    BoxMensagem ( 'Classificação prescisa ser preenchido!', 2 );
    dblckpbox_release.SetFocus;
    Consiste := False;
    Exit;
  end;
end;

procedure Tfrm_release.cb_ordemChange(Sender: TObject);
begin
  Pesquisa := datm_release.qry_lista_NR_VERSAO.AsString;
  { Apaga o campo de pesquisa }
  msk_edt_chave.Text := '';
  datm_release.qry_lista_.Close;
  datm_release.qry_lista_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_release.qry_lista_.Open;
  Localiza(datm_release.qry_lista_, Pesquisa, a_str_indices[0] );
  msk_edt_chave.SetFocus;
end;

procedure Tfrm_release.pgctrl_releaseChange(Sender: TObject);
begin
  OnChanging := False;
  if ( pgctrl_release.ActivePage = ts_info ) then
  begin
    dbnvg.Enabled         := False;
    msk_edt_chave.Enabled := False;
    cb_ordem.Enabled      := False;
  end
  else
  begin
    dbnvg.Enabled         := True;
    msk_edt_chave.Enabled := True;
    cb_ordem.Enabled      := True;
    msk_edt_chave.SetFocus;
  end;
end;

procedure Tfrm_release.pgctrl_releaseChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_release.dbedt_nr_versaoChange(Sender: TObject);
begin
  if ( datm_release.qry_lista_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_release.FormCreate(Sender: TObject);
begin
  st_modificar := True;
  st_incluir   := True;
  st_excluir   := True;

//  st_modificar := False;
//  st_incluir   := False;
//  st_excluir   := False;

  //AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  Application.CreateForm( Tdatm_release, datm_release );

  with datm_release do
  begin

    ds_lista.AutoEdit := st_modificar;

    qry_lista_.Close;
    qry_lista_.SQL[2] := 'NR_VERSAO DESC, NR_ITEM';
    qry_lista_.Prepare;
    qry_lista_.Open;

    qry_ttp_release_.Close;
    qry_ttp_release_.Prepare;
    qry_ttp_release_.Open;
  end;

  a_str_indices[0] := 'NR_VERSAO';
  a_str_indices[1] := 'NR_ITEM';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Versão');
    Items.Add('N. do Item');
    ItemIndex := 0;
  end;

  btn_incluir.Enabled := True;
  mi_incluir.Enabled  := True;
  btn_excluir.Enabled := True;
  mi_excluir.Enabled  := True;
end;

procedure Tfrm_release.FormShow(Sender: TObject);
begin
  pgctrl_release.ActivePage := ts_lista;
  msk_edt_chave.SetFocus;
end;

procedure Tfrm_release.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled  := False;
  mi_incluir.Enabled   := False;
  btn_excluir.Enabled  := False;
  mi_excluir.Enabled   := False;
  btn_salvar.Enabled   := True;
  mi_salvar.Enabled    := True;
  btn_cancelar.Enabled := True;
  mi_cancelar.Enabled  := True;

  with datm_release do
  begin
    qry_lista_.DisableControls;
    qry_lista_.Cancel;
    qry_lista_.Append;
    qry_lista_.EnableControls;
    qry_lista_NR_VERSAO.AsString := nr_versao;
  end;
  pgctrl_release.ActivePage := ts_info;
  dbedt_nr_versao.SetFocus;
end;

procedure Tfrm_release.dbedt_nr_itemChange(Sender: TObject);
begin
  if ( datm_release.qry_lista_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_release.dbedt_path_telaChange(Sender: TObject);
begin
  if ( datm_release.qry_lista_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_release.dbm_releaseChange(Sender: TObject);
begin
  if ( datm_release.qry_lista_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_release.dbm_pendenciaChange(Sender: TObject);
begin
  if ( datm_release.qry_lista_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_release.dbm_alteracoesChange(Sender: TObject);
begin
  if ( datm_release.qry_lista_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_release.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este item da versão será excluído!' +#13#10 + 'Confirma exclusão?', 1 ) then
  try
    datm_main.db_broker.StartTransaction;
    datm_release.qry_lista_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      TrataErro(E);
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  pgctrl_release.ActivePage := ts_lista;
end;

procedure Tfrm_release.msk_edt_chaveChange(Sender: TObject);
begin
  Localiza( datm_release.qry_lista_, msk_edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_release.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_release.dblckpbox_releaseClick(Sender: TObject);
begin
  if ( datm_release.qry_lista_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_release.btn_frm_releaseClick(Sender: TObject);
begin
  with datm_main do
  begin
    qry_release_.Close;
    qry_release_.Prepare;
    qry_release_.ParamByName('NR_VERSAO').AsString := datm_release.qry_lista_.FieldByName('NR_VERSAO').AsString;
    qry_release_.Open;
    ppRepRelease.Template.FileName := cDir_RPT + '\RBREL001.rtm';
    ppRepRelease.Print;
  end;
end;

end.

