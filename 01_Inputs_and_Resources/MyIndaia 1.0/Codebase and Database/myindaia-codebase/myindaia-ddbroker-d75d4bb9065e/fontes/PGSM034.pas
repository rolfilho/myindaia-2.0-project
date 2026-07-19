unit PGSM034;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, DBCtrls,
  Mask, ComCtrls;

type
  Tfrm_etapa = class(TForm)
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    mi_salvar: TMenuItem;
    pgctrl_etapa: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    dbg_cadastro: TDBGrid;
    pnl_entrada_de_dados: TPanel;
    lbl_descricao: TLabel;
    lbl_codigo: TLabel;
    lblAtivo: TLabel;
    dbedt_descricao: TDBEdit;
    dbedt_codigo: TDBEdit;
    dblkpcbox_ativo: TDBLookupComboBox;
    mi_cancelar: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    dbnvg: TDBNavigator;
    btn_excluir: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_incluir: TSpeedButton;
    btn_sair: TSpeedButton;
    lbl_pesquisa: TLabel;
    edt_chave: TEdit;
    lbl_ordem_pesquisa: TLabel;
    cb_ordem: TComboBox;
    DBCheckBox1: TDBCheckBox;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbedt_descricaoChange(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure pgctrl_etapaChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pgctrl_etapaChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    OnChanging : Boolean;
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    lnm_etapa : Boolean;

    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    { Public declarations }
    lCons_OnLine : Boolean;
    Cons_OnLine  : TStringField;
    Cons_OnLine_Texto  : String;
  end;

var
  frm_etapa: Tfrm_etapa;

implementation

uses GSMLIB, PGSM035, PGGP017, PGGP001;

{$R *.DFM}

procedure Tfrm_etapa.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_etapa.btn_incluirClick(Sender: TObject);
begin
  with datm_etapa do
  begin
    qry_etapa_.DisableControls;
    qry_etapa_.Cancel;
    qry_etapa_.Append;
    qry_etapa_.EnableControls;
    qry_etapa_CD_ETAPA.AsString      := UltCod( qry_ult_etapa_, qry_ult_etapa_ULTIMO );
    qry_etapa_IN_ATIVO.AsString      := '1';
    qry_etapa_IN_RETRABALHO.AsString := '0';
  end;
  pgctrl_etapa.ActivePage := ts_dados_basicos;
  dbedt_descricao.SetFocus;

  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  dbnvg.Enabled := False;
  edt_chave.Enabled := False;
  cb_ordem.Enabled := False;

end;

procedure Tfrm_etapa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_etapa.tbl_yesno_.Close;
  datm_etapa.qry_etapa_.Close;
//  datm_etapa.Destroy;
  datm_etapa.Free;
  Action := caFree;
end;

procedure Tfrm_etapa.dbg_cadastroDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_etapa.qry_etapa_CD_ETAPA.AsString;
    except
      try
        Cons_Online_Texto := datm_etapa.qry_etapa_CD_ETAPA.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código da Etapa!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_etapa.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_etapa.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

 { Inicializa o Data Module para Etapa}
  Application.CreateForm( Tdatm_etapa, datm_etapa );

  with datm_etapa do
  begin
    ds_etapa.AutoEdit := st_modificar;
    tbl_yesno_.Open;
    qry_etapa_.Prepare;
    qry_etapa_.SQL[2] := 'NM_ETAPA';
    qry_etapa_.Open;
  end;

  a_str_indices[0] := 'CD_ETAPA';
  a_str_indices[1] := 'NM_ETAPA';

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

procedure Tfrm_etapa.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Esta etapa será excluída! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_etapa.qry_etapa_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_etapa.qry_etapa_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  pgctrl_etapa.ActivePage := ts_lista;
end;

procedure Tfrm_etapa.FormShow(Sender: TObject);
begin
  pgctrl_etapa.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_etapa.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_etapa.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_etapa.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_etapa.qry_etapa_CD_ETAPA.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_etapa.qry_etapa_.Close;
  datm_etapa.qry_etapa_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_etapa.qry_etapa_.Open;
  Localiza(datm_etapa.qry_etapa_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_etapa.dbedt_descricaoChange(Sender: TObject);
begin
  If ( datm_etapa.qry_etapa_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_etapa.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_etapa.qry_etapa_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

function Tfrm_etapa.Consiste : Boolean;
begin
  if dbedt_descricao.Text = '' then
  begin
    BoxMensagem('Campo Descrição deve ser preenchido!', 2);
    pgctrl_etapa.ActivePage := ts_dados_basicos;
    dbedt_descricao.SetFocus;
    lnm_etapa := True;
    Consiste := False;
    Exit;
  end;
  Consiste := True;
end;

function Tfrm_etapa.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_etapa.qry_etapa_.State in [dsInsert, dsEdit] ) then
    begin
      datm_etapa.qry_etapa_.Post;
      Pesquisa := datm_etapa.qry_etapa_CD_ETAPA.AsString;
      datm_etapa.qry_etapa_.Close;
      datm_etapa.qry_etapa_.Prepare;
      datm_etapa.qry_etapa_.Open;
      Localiza(datm_etapa.qry_etapa_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_etapa.qry_etapa_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_etapa.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_etapa.qry_etapa_.State in [dsEdit] ) and st_modificar ) or
     ( datm_etapa.qry_etapa_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Tabela de Etapas foi alterada.' + #13#10 +
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

procedure Tfrm_etapa.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_etapa.Cancelar;
begin
  try
    if datm_etapa.qry_etapa_.State in [dsInsert, dsEdit] then
    begin
      datm_etapa.qry_etapa_.Cancel;
      pgctrl_etapa.ActivePage := ts_dados_basicos;
      dbedt_descricao.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_etapa.pgctrl_etapaChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  OnChanging := True;
  VerAlt;
end;

procedure Tfrm_etapa.pgctrl_etapaChange(Sender: TObject);
begin
  OnChanging := False;

  if lnm_etapa then
  begin
    lnm_etapa := false;
    pgctrl_etapa.ActivePage := ts_dados_basicos;
    dbedt_descricao.SetFocus;
    Exit;
  end;

  if (pgctrl_etapa.ActivePage = ts_lista ) then
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

procedure Tfrm_etapa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

end.
