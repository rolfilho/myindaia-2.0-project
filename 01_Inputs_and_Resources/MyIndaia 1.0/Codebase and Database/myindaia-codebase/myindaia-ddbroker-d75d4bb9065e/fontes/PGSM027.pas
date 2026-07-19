unit PGSM027;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, DBCGrids, PGGP001;

type
  Tfrm_sda = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    pnl_pesquisa: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    dbnvg: TDBNavigator;
    pgctrl_sda: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    Label6: TLabel;
    lbl_codigo: TLabel;
    dbedt_codigo: TDBEdit;
    lbl_descricao: TLabel;
    dbedt_descricao: TDBEdit;
    lbl_pc_taxa: TLabel;
    dbedt_pc_taxa: TDBEdit;
    lbl_vl_minimo: TLabel;
    dbedt_vl_minimo: TDBEdit;
    lbl_vl_maximo: TLabel;
    dbedt_vl_maximo: TDBEdit;
    lbl_pc_contr_sind: TLabel;
    dbedt_pc_assist_social: TDBEdit;
    dbg_cadastro: TDBGrid;
    lbl_urgente_im: TLabel;
    dblckbox_calc_fob: TDBLookupComboBox;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_descricaoChange(Sender: TObject);
    procedure pgctrl_sdaChange(Sender: TObject);
    procedure pgctrl_sdaChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    OnChanging : Boolean;
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    lDescricao : Boolean;
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
  frm_sda: Tfrm_sda;

implementation

uses GSMLIB, PGSM116, PGGP017;

{$R *.DFM}

procedure Tfrm_sda.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_sda.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  with datm_sda do
  begin
    qry_sda_.DisableControls;
    qry_sda_.Cancel;
    qry_sda_.Append;
    qry_sda_.EnableControls;
    qry_sda_CD_SDA.AsString  := UltCod( qry_ult_sda_, qry_ult_sda_ULTIMO );
    qry_sda_PC_ASSIST_SOCIAL.AsFloat := 0;
    qry_sda_PC_TAXA.AsFloat := 0;
    qry_sda_VL_MAXIMO.AsFloat := 0;
    qry_sda_VL_MINIMO.AsFloat := 0;
    qry_sda_IN_CALC_FOB.AsString := '0';
  end;
  pgctrl_sda.ActivePage := ts_dados_basicos;
  dbedt_descricao.SetFocus;
end;

procedure Tfrm_sda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_sda.qry_sda_.Close;
  datm_sda.Free;
  Action := caFree;
end;

procedure Tfrm_sda.dbg_cadastroDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_sda.qry_sda_CD_SDA.AsString;
    except
      try
         Cons_Online_Texto := datm_sda.qry_sda_CD_SDA.AsString;
      except
        BoxMensagem('Não consegui retornar Código da Tabela SDA!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_sda.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  { Inicializa o Data Module para S.D.A.}
  Application.CreateForm( Tdatm_sda, datm_sda );

  with datm_sda do
  begin
    ds_sda.AutoEdit := st_modificar;
    qry_sda_.Prepare;
    qry_sda_.SQL[2] := 'TX_DESCRICAO';
    qry_sda_.Open;

    tbl_yesno_.Close;
    tbl_yesno_.Open;
  end;

  a_str_indices[0] := 'CD_SDA';
  a_str_indices[1] := 'TX_DESCRICAO';

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

procedure Tfrm_sda.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Esta Tabela de S.D.A. será excluída! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_sda.qry_sda_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_sda.qry_sda_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  pgctrl_sda.ActivePage := ts_lista;
end;

procedure Tfrm_sda.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_sda.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_sda.Cancelar;
begin
  try
    if datm_sda.qry_sda_.State in [dsInsert, dsEdit] then
    begin
      datm_sda.qry_sda_.Cancel;
      pgctrl_sda.ActivePage := ts_dados_basicos;
      dbedt_descricao.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_sda.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_sda.qry_sda_CD_SDA.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_sda.qry_sda_.Close;
  datm_sda.qry_sda_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_sda.qry_sda_.Open;
  Localiza(datm_sda.qry_sda_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_sda.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_sda.qry_sda_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_sda.FormShow(Sender: TObject);
begin
  pgctrl_sda.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_sda.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_sda.dbedt_descricaoChange(Sender: TObject);
begin
  If ( datm_sda.qry_sda_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

function Tfrm_sda.Consiste : Boolean;
begin
  if dbedt_descricao.Text = '' then
  begin
    BoxMensagem('Campo Descrição deve ser preenchido!', 2);
    pgctrl_sda.ActivePage := ts_dados_basicos;
    dbedt_descricao.SetFocus;
    lDescricao := True;
    Consiste := False;
    Exit;
  end;
  Consiste := True;
end;

function Tfrm_sda.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    If ( datm_sda.qry_sda_.State in [dsInsert, dsEdit] ) then
    begin
      datm_sda.qry_sda_.Post;
      Pesquisa := datm_sda.qry_sda_CD_SDA.AsString;
      datm_sda.qry_sda_.Close;
      datm_sda.qry_sda_.Prepare;
      datm_sda.qry_sda_.Open;
      Localiza(datm_sda.qry_sda_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_sda.qry_sda_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;
procedure Tfrm_sda.pgctrl_sdaChange(Sender: TObject);
begin
  OnChanging := False;

  if lDescricao then
  begin
    lDescricao := False;
    pgctrl_sda.ActivePage := ts_dados_basicos;
    dbedt_descricao.SetFocus;
    Exit;
  end;

  if (pgctrl_sda.ActivePage = ts_lista ) then
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

procedure Tfrm_sda.pgctrl_sdaChanging(Sender: TObject;
var AllowChange: Boolean);
begin
  OnChanging := True;
  VerAlt;
end;

function Tfrm_sda.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_sda.qry_sda_.State in [dsEdit] ) and st_modificar ) or
     ( datm_sda.qry_sda_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Tabela de SDA foi alterada.' + #13#10 +
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

procedure Tfrm_sda.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_sda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #27 then Close;
end;


end.
