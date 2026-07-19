unit PGSM210;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBTables, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls;

type
  Tfrm_pais = class(TForm)
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pgctrl_pais: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    lbl_cd_pais: TLabel;
    lbl_nm_pais: TLabel;
    dbedt_cd_pais: TDBEdit;
    dbedt_nm_pais: TDBEdit;
    dbedt_nm_port: TDBEdit;
    dbedt_nm_ing: TDBEdit;
    dbedt_nm_esp: TDBEdit;
    lbl_nm_port: TLabel;
    lbl_nm_ing: TLabel;
    lbl_nm_esp: TLabel;
    lbl_cd_scx_exp: TLabel;
    dbedt_cd_scx_exp: TDBEdit;
    Label3: TLabel;
    dbedt_nm_sigla_crt: TDBEdit;
    dblckpbox_naladi_fat: TDBLookupComboBox;
    lbl_naladi_fat: TLabel;
    lbl_ncm_fat: TLabel;
    dblckpbox_ncm_fat: TDBLookupComboBox;
    Label4: TLabel;
    dblckpbox_aladi: TDBLookupComboBox;
    Label5: TLabel;
    dblckpbox_fumigacao: TDBLookupComboBox;
    pnl_cadastro: TPanel;
    pnl_pesquisa: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    Label6: TLabel;
    dblkpbox_nm_continente: TDBComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrl_paisChange(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbedt_cd_paisExit(Sender: TObject);
    procedure dbedt_nm_paisChange(Sender: TObject);
    procedure pgctrl_paisChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    OnChanging: Boolean;
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    lnm_pais : Boolean;

    function Consiste : Boolean;
    function Grava    : Boolean;
    function Veralt   : Boolean;
    procedure Cancelar;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_pais: Tfrm_pais;

implementation

{$R *.DFM}

uses PGGP001, GSMLIB, PGSM211, PGGP017;

procedure Tfrm_pais.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
  lnm_pais     := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  Application.CreateForm( Tdatm_pais, datm_pais );

  with datm_pais do
  begin
    ds_pais.AutoEdit := st_modificar;
    tbl_yesno_.Open;

    qry_pais_broker_.SQL[2] := 'NM_PAIS';
    qry_pais_broker_.Prepare;
    qry_pais_broker_.Open;
  end;

  a_str_indices[0] := 'CD_PAIS';
  a_str_indices[1] := 'NM_PAIS';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

end;

procedure Tfrm_pais.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_pais.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_pais.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if VerAlt then
  begin
   with datm_pais do
    begin
     tbl_yesno_.Close;
     qry_pais_broker_.Close;
     Free;
     Action := caFree;
    end;
   end
  else
    begin
     Action := caNone;

    end; 
end;


procedure Tfrm_pais.pgctrl_paisChange(Sender: TObject);
begin
  OnChanging := False;

  if lnm_pais then
  begin
    lnm_pais := False;
    pgctrl_pais.ActivePage := ts_dados_basicos;
    dbedt_nm_pais.SetFocus;
    Exit;
  end;

  if (pgctrl_pais.ActivePage=ts_lista) or
     (pgctrl_pais.ActivePage=ts_dados_basicos) then
     dbnvg.DataSource := datm_pais.ds_pais;

  if (pgctrl_pais.ActivePage = ts_lista ) then
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

  if (pgctrl_pais.ActivePage=ts_dados_basicos) then
  begin
    dbedt_cd_pais.ReadOnly := True;
    dbedt_nm_pais.SetFocus;
  end;

end;

procedure Tfrm_pais.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  with datm_pais do
  begin
    qry_pais_broker_.DisableControls;
    qry_pais_broker_.Cancel;
    qry_pais_broker_.Append;
    qry_pais_broker_.EnableControls;
  end;

  pgctrl_pais.ActivePage := ts_dados_basicos;
  dbedt_cd_pais.ReadOnly := False;
  dbedt_cd_pais.SetFocus;

end;

procedure Tfrm_pais.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_pais.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_pais.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_pais.Cancelar;
begin
 try
  if datm_pais.qry_pais_broker_.State in [dsInsert, dsEdit] then
   datm_pais.qry_pais_broker_.Cancel;
   pgctrl_pais.ActivePage := ts_dados_basicos;
   dbedt_cd_pais.SetFocus
 except
   BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;


procedure Tfrm_pais.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este País será excluído! Confirma exclusão?', 1 ) Then
  begin
    try
      datm_main.db_broker.StartTransaction;
      datm_pais.qry_pais_broker_.Delete;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_pais.qry_pais_broker_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;

  pgctrl_pais.ActivePage := ts_lista;

end;

procedure Tfrm_pais.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_pais.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_pais.qry_pais_broker_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_pais.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_pais.qry_pais_broker_cd_pais.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_pais.qry_pais_broker_.Close;
  datm_pais.qry_pais_broker_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_pais.qry_pais_broker_.Open;
  Localiza(datm_pais.qry_pais_broker_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_pais.dbedt_cd_paisExit(Sender: TObject);
begin
     If datm_pais.qry_pais_broker_.State in [dsInsert, dsEdit] then
     ValidCodigo( dbedt_cd_pais );
end;

procedure Tfrm_pais.dbedt_nm_paisChange(Sender: TObject);
begin
 if ( datm_pais.qry_pais_broker_.State in [ dsInsert, dsEdit ] ) then
   btn_mi( False, True, True, False );
end;

function Tfrm_pais.Consiste : Boolean;
begin
  Consiste := True;
  if ( pgctrl_pais.ActivePage = ts_dados_basicos ) or
     ( pgctrl_pais.ActivePage = ts_lista ) then
  begin
    if dbedt_cd_pais.Text = '' then
    begin
      BoxMensagem('Campo Código deve ser preenchido!', 2);
      pgctrl_pais.ActivePage := ts_dados_basicos;
      dbedt_cd_pais.SetFocus;
      lnm_pais := True;
      Consiste := False;
      Exit;
    end;
    if dbedt_nm_pais.Text = '' then
    begin
      BoxMensagem('Campo Descrição deve ser preenchido!', 2);
      pgctrl_pais.ActivePage := ts_dados_basicos;
      dbedt_nm_pais.SetFocus;
      lnm_pais := True;
      Consiste := False;
      Exit;
    end;
  end;
end;

function Tfrm_pais.Grava : Boolean;
var cd_pais : String[3];
begin
  cd_pais := '';

  try
    datm_main.db_broker.StartTransaction;
    If ( datm_pais.qry_pais_broker_.State in [dsInsert, dsEdit] ) then
    begin
      datm_pais.qry_pais_broker_.Post;
      Pesquisa := datm_pais.qry_pais_broker_cd_pais.AsString;
      datm_pais.qry_pais_broker_.Close;
      datm_pais.qry_pais_broker_.Prepare;
      datm_pais.qry_pais_broker_.Open;
      Localiza(datm_pais.qry_pais_broker_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_pais.qry_pais_broker_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;

  Btn_Mi(st_incluir, False, False, st_excluir );

end;

procedure Tfrm_pais.pgctrl_paisChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  OnChanging := True;
  VerAlt;
end;

function Tfrm_pais.Veralt;
begin
  Veralt := True;
  if ( pgctrl_pais.ActivePage = ts_dados_basicos ) then
  begin
    if ( ( datm_pais.qry_pais_broker_.State in [dsEdit] ) and st_modificar ) or
       ( datm_pais.qry_pais_broker_.State in [dsInsert] ) then
    begin
     if BoxMensagem('Cadastro de Países foi alterado.' + #13#10 +
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
  end;
end;

procedure Tfrm_pais.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #27 then Close;
end;

procedure Tfrm_pais.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_pais.qry_pais_broker_CD_PAIS.AsString;
    except
      try
        Cons_Online_Texto := datm_pais.qry_pais_broker_CD_PAIS.AsString;
      except
        BoxMensagem( 'Não foi possível retornar o Código do País!', 2 );
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_pais.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_pais.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbg_cadastroDblClick(Sender);
end;





end.
