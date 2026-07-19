unit PGSM192;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB;

type
  Tfrm_local_emissao = class(TForm)
    pgctrl_local: TPageControl;
    ts_lista: TTabSheet;
    dbg_local: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_local: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbedt_cd_local: TDBEdit;
    dbedt_nm_local: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    dbedt_uf_local: TDBEdit;
    Label6: TLabel;
    dbedt_cd_pais: TDBEdit;
    btn_co_local_emissao: TSpeedButton;
    dbedt_nm_pais: TDBEdit;
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
    procedure pgctrl_localChange(Sender: TObject);
    procedure dbedt_nm_localChange(Sender: TObject);
    procedure dbg_localDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrl_localChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_co_local_emissaoClick(Sender: TObject);
    procedure dbedt_cd_paisExit(Sender: TObject);
    procedure dbedt_cd_paisKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure CodExits;

  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
    lNaoConsiste : Boolean;
  end;

var
  frm_local_emissao: Tfrm_local_emissao;

implementation

Uses PGSM193, PGGP017, GSMLIB, PGGP001;

{$R *.DFM}


procedure Tfrm_local_emissao.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;
  with datm_local_emissao do
  begin
    qry_local_emis_.DisableControls;
    qry_local_emis_.Cancel;
    qry_local_emis_.Append;
    qry_local_emis_.EnableControls;
    pgctrl_local.ActivePage:=ts_dados_basicos;
  end;

  dbedt_cd_local.Color := clWindow;
  dbedt_cd_local.ReadOnly := False;

  dbedt_cd_local.SetFocus;
end;

procedure Tfrm_local_emissao.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;

  pgctrl_local.SetFocus;
  dbedt_cd_local.Color := clBtnFace;
  dbedt_cd_local.ReadOnly := True;
  
end;

procedure Tfrm_local_emissao.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_local_emissao.Cancelar;
begin
  try
    if datm_local_emissao.qry_local_emis_.State in [dsInsert, dsEdit] then
    begin
      datm_local_emissao.qry_local_emis_.Cancel;
      pgctrl_local.ActivePage := ts_dados_basicos;
      dbedt_nm_local.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );

  dbedt_cd_local.Color := clBtnFace;
  dbedt_cd_local.ReadOnly := True;

end;

procedure Tfrm_local_emissao.btn_excluirClick(Sender: TObject);
begin
        if BoxMensagem( 'Local da Emissão será excluído! Confirma exclusão?', 1 ) Then
        try
          datm_main.db_broker.StartTransaction;
          datm_local_emissao.qry_local_emis_.Delete;
          datm_main.db_broker.Commit;
          pgctrl_local.ActivePage:=ts_lista;
        except
          on E: Exception do
          begin
            datm_local_emissao.qry_local_emis_.Cancel;
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
end;

procedure Tfrm_local_emissao.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_local_emissao.edt_chaveChange(Sender: TObject);
begin
   Localiza(datm_local_emissao.qry_local_emis_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_local_emissao.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_local_emissao.qry_local_emis_CODIGO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_local_emissao.qry_local_emis_.Close;
  datm_local_emissao.qry_local_emis_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_local_emissao.qry_local_emis_.Open;
  Localiza(datm_local_emissao.qry_local_emis_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_local_emissao.pgctrl_localChange(Sender: TObject);
begin
  OnChanging := False;

  if (pgctrl_local.ActivePage = ts_lista ) then
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
    dbedt_cd_local.Color := clBtnFace;
    dbedt_cd_local.ReadOnly := True;
  end;

end;

procedure Tfrm_local_emissao.dbedt_nm_localChange(Sender: TObject);
begin
  if ( datm_local_emissao.qry_local_emis_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_local_emissao.dbg_localDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_local_emissao.qry_local_emis_CODIGO.AsString;
    except
      try
        Cons_Online_Texto := datm_local_emissao.qry_local_emis_CODIGO.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código do Local da Emissão !', 2);
      end;
    end;
    Close;
  end;
end;

function Tfrm_local_emissao.Grava;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_local_emissao.qry_local_emis_.State in [dsInsert, dsEdit] ) then
    begin
      datm_local_emissao.qry_local_emis_.Post;
    end;
    datm_main.db_broker.Commit;
    Grava:=True;
  except
    on E: Exception do
    begin
      datm_local_emissao.qry_local_emis_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_local_emissao.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

function Tfrm_local_emissao.Consiste;
begin

  if datm_local_emissao.qry_local_emis_.State in [dsInsert, dsEdit] then
  begin
    if dbedt_nm_local.Text = '' then
    begin
      BoxMensagem('Campo ''Nome'' deve ser preenchido!', 2);
      dbedt_nm_local.SetFocus;
      Consiste := False;
      exit;
    end;

    {País de Procedência}
    if dbedt_cd_pais.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_pais );
      if ( dbedt_nm_pais.Text = '' ) then
      begin
        BoxMensagem('Código do País inválido!',2);
        pgctrl_local.ActivePage := ts_dados_basicos;
        dbedt_cd_pais.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  Consiste := True;
end;

procedure Tfrm_local_emissao.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_local_emissao, datm_local_emissao );

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  with datm_local_emissao do
  begin
    qry_local_emis_.SQL[2] := 'NOME';
    qry_local_emis_.Prepare;
    qry_local_emis_.Open;
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

  datm_local_emissao.ds_local_emis.AutoEdit   := st_modificar;

  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;

  datm_local_emissao.qry_local_emis_.Close;
  datm_local_emissao.qry_local_emis_.Open;

end;

procedure Tfrm_local_emissao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_local_emissao.qry_local_emis_.Close;
  datm_local_emissao.destroy;
  Action := caFree;
end;

procedure Tfrm_local_emissao.pgctrl_localChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  OnChanging := True;
  VerAlt;
end;

function Tfrm_local_emissao.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_local_emissao.qry_local_emis_.State in [dsEdit] ) and st_modificar ) or
     ( datm_local_emissao.qry_local_emis_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Local da Emissão foi alterado.' + #13#10 +
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


procedure Tfrm_local_emissao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;


procedure Tfrm_local_emissao.btn_co_local_emissaoClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TPAIS',
                datm_local_emissao.qry_local_emis_PAIS,
                'Países', 1, '', 'TQuery');
  dbedt_cd_paisExit(nil);
end;

procedure Tfrm_local_emissao.dbedt_cd_paisExit(Sender: TObject);
begin
  CodExits;
end;


procedure Tfrm_local_emissao.CodExits;
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_local_emissao.dbedt_cd_paisKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_pais   then btn_co_local_emissaoClick(nil);
  end;

end;

procedure Tfrm_local_emissao.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  edt_chave.SetFocus;
end;

procedure Tfrm_local_emissao.edt_chaveKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then dbg_localDblClick(nil);
end;

end.
