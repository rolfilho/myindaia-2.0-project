unit PGSM190;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB;

type
  Tfrm_cabecalho = class(TForm)
    pgctrl_cabecalho: TPageControl;
    ts_lista: TTabSheet;
    dbg_cabecalho: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_cabecalho: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbedt_cd_cabecalho: TDBEdit;
    dbedt_nm_cabecalho: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    dbm_texto: TDBMemo;
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
    procedure pgctrl_cabecalhoChange(Sender: TObject);
    procedure dbedt_nm_cabecalhoChange(Sender: TObject);
    procedure dbg_cabecalhoDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrl_cabecalhoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    OnChanging : Boolean;
    a_str_indices : Array[0..2] Of String[60];
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
  frm_cabecalho: Tfrm_cabecalho;

implementation

Uses PGSM191, PGGP017, GSMLIB, PGGP001;

{$R *.DFM}


procedure Tfrm_cabecalho.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;
  with datm_cabecalho do
  begin
    qry_cabecalho_.DisableControls;
    qry_cabecalho_.Cancel;
    qry_cabecalho_.Append;
    qry_cabecalho_.EnableControls;

    qry_ultimo_.Open;

    qry_cabecalho_.FieldByName('CODIGO').AsString := UltCod( qry_ultimo_, qry_ultimo_ULTIMO );

    pgctrl_cabecalho.ActivePage:=ts_dados_basicos;
  end;

  dbedt_cd_cabecalho.Color := clWindow;
  dbedt_cd_cabecalho.ReadOnly := False;

  dbedt_cd_cabecalho.SetFocus;
end;

procedure Tfrm_cabecalho.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;

  pgctrl_cabecalho.SetFocus;
  dbedt_cd_cabecalho.Color := clBtnFace;
  dbedt_cd_cabecalho.ReadOnly := True;
  
end;

procedure Tfrm_cabecalho.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_cabecalho.Cancelar;
begin
  try
    if datm_cabecalho.qry_cabecalho_.State in [dsInsert, dsEdit] then
    begin
      datm_cabecalho.qry_cabecalho_.Cancel;
      pgctrl_cabecalho.ActivePage := ts_dados_basicos;
      dbedt_nm_cabecalho.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );

  dbedt_cd_cabecalho.Color := clBtnFace;
  dbedt_cd_cabecalho.ReadOnly := True;

end;

procedure Tfrm_cabecalho.btn_excluirClick(Sender: TObject);
begin
        if BoxMensagem( 'Esta cabecalho será excluído! Confirma exclusão?', 1 ) Then
        try
          datm_main.db_broker.StartTransaction;
          datm_cabecalho.qry_cabecalho_.Delete;
          datm_main.db_broker.Commit;
          pgctrl_cabecalho.ActivePage:=ts_lista;
        except
          on E: Exception do
          begin
            datm_cabecalho.qry_cabecalho_.Cancel;
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
end;

procedure Tfrm_cabecalho.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_cabecalho.edt_chaveChange(Sender: TObject);
begin
   Localiza(datm_cabecalho.qry_cabecalho_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_cabecalho.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_cabecalho.qry_cabecalho_CODIGO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_cabecalho.qry_cabecalho_.Close;
  datm_cabecalho.qry_cabecalho_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_cabecalho.qry_cabecalho_.Open;
  Localiza(datm_cabecalho.qry_cabecalho_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_cabecalho.pgctrl_cabecalhoChange(Sender: TObject);
begin
  OnChanging := False;

  if (pgctrl_cabecalho.ActivePage = ts_lista ) then
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
    dbedt_cd_cabecalho.Color := clBtnFace;
    dbedt_cd_cabecalho.ReadOnly := True;
  end;

end;

procedure Tfrm_cabecalho.dbedt_nm_cabecalhoChange(Sender: TObject);
begin
  if ( datm_cabecalho.qry_cabecalho_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_cabecalho.dbg_cabecalhoDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_cabecalho.qry_cabecalho_CODIGO.AsString;
    except
      try
        Cons_Online_Texto := datm_cabecalho.qry_cabecalho_CODIGO.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código do cabecalho !', 2);
      end;
    end;
    Close;
  end;
end;

function Tfrm_cabecalho.Grava;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_cabecalho.qry_cabecalho_.State in [dsInsert, dsEdit] ) then
    begin
      datm_cabecalho.qry_cabecalho_.Post;
    end;
    datm_main.db_broker.Commit;
    Grava:=True;
  except
    on E: Exception do
    begin
      datm_cabecalho.qry_cabecalho_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_cabecalho.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

function Tfrm_cabecalho.Consiste;
begin
  if dbedt_nm_cabecalho.Text = '' then
  begin
    BoxMensagem('Campo ''Nome'' deve ser preenchido!', 2);
    dbedt_nm_cabecalho.SetFocus;
    Consiste := False;
    exit;
  end;

  Consiste := True;
end;

procedure Tfrm_cabecalho.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_cabecalho, datm_cabecalho );

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  with datm_cabecalho do
  begin
    tbl_yesno_.Open;
    qry_cabecalho_.SQL[2] := 'NOME';
    qry_cabecalho_.Prepare;
    qry_cabecalho_.Open;
  end;

  a_str_indices[0] := 'CODIGO';
  a_str_indices[1] := 'NOME';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Nome');
    ItemIndex := 1;
  end;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  datm_cabecalho.ds_cabecalho.AutoEdit   := st_modificar;

  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;

  datm_cabecalho.qry_cabecalho_.Close;
  datm_cabecalho.qry_cabecalho_.Open;

end;

procedure Tfrm_cabecalho.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_cabecalho.qry_cabecalho_.Close;
  datm_cabecalho.tbl_yesno_.Close;
  datm_cabecalho.destroy;
  Action := caFree;
end;

procedure Tfrm_cabecalho.pgctrl_cabecalhoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  OnChanging := True;
  VerAlt;
end;

function Tfrm_cabecalho.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_cabecalho.qry_cabecalho_.State in [dsEdit] ) and st_modificar ) or
     ( datm_cabecalho.qry_cabecalho_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de cabecalho foi alterado.' + #13#10 +
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


procedure Tfrm_cabecalho.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_cabecalho.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
end;

end.
