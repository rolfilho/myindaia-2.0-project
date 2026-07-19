unit PGSM149;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Menus, Mask, Grids, DBGrids, ComCtrls, Buttons,
  ExtCtrls, Db;

type
  Tfrm_disp_legal = class(TForm)
    pgctrl_disp_legal: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    Label3: TLabel;
    lblNome: TLabel;
    lblTributo: TLabel;
    dbedt_cd_disp_legal: TDBEdit;
    dbedt_nm_disp_legal: TDBEdit;
    dblkpcbox_tratamento: TDBLookupComboBox;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    dbm_disp_legal: TDBMemo;
    Label4: TLabel;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_excluir: TSpeedButton;
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
    procedure pgctrl_disp_legalChange(Sender: TObject);
    procedure pgctrl_disp_legalChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
  private
    { Private declarations }
    OnChanging : Boolean;
    a_str_indices : Array[0..1] Of String[60];
    st_modificar, st_incluir, st_excluir : Boolean;
    Pesquisa : String;
    lnm_disp_legal : Boolean;
    function VerAlt   : Boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    procedure Cancelar;
    procedure Verifica_Botoes( habilita : Boolean );
  public
    { Public declarations }
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_disp_legal: Tfrm_disp_legal;

implementation

uses GSMLIB, PGSM150, PGGP017, PGGP001;

{$R *.DFM}




procedure Tfrm_disp_legal.btn_incluirClick(Sender: TObject);
begin

  with datm_disp_legal do
  begin
    qry_disp_legal_.DisableControls;
    qry_disp_legal_.Cancel;
    qry_disp_legal_.Append;
    qry_disp_legal_.EnableControls;
    qry_disp_legal_CD_EX.AsString  := UltCod( qry_ult_disp_legal_, qry_ult_disp_legal_ULTIMO );
    qry_disp_legal_CD_TRIB.AsString  := '1';
    dbnvg.Enabled := False;
  end;
  pgctrl_disp_legal.ActivePage := ts_dados_basicos;
  dbedt_nm_disp_legal.SetFocus;

end;

procedure Tfrm_disp_legal.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;

  Verifica_botoes( True );
end;

procedure Tfrm_disp_legal.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;

  dbnvg.Enabled := True;
  Verifica_Botoes( True );

  if datm_disp_legal.qry_disp_legal_.RecordCount = 0 then
  begin
     btn_excluir.Enabled := False;
     mi_excluir.Enabled := False;
     pgctrl_disp_legal.ActivePage := ts_lista;
  end;

end;


procedure Tfrm_disp_legal.btn_excluirClick(Sender: TObject);
begin
  if (pgctrl_disp_legal.ActivePage = ts_lista) or (pgctrl_disp_legal.ActivePage = ts_dados_basicos) then
  begin
    if BoxMensagem( 'Este Dispositivo Legal será excluído! Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        datm_disp_legal.qry_disp_legal_.Delete;
        datm_disp_legal.qry_disp_legal_.Close;
        datm_disp_legal.qry_disp_legal_.Prepare;
        datm_disp_legal.qry_disp_legal_.Open;
        datm_main.db_broker.Commit;

        if datm_disp_legal.qry_disp_legal_.RecordCount > 0 then
        begin
           btn_excluir.Enabled := True;
           mi_excluir.Enabled := True;
        end
        else
        begin
           btn_excluir.Enabled := False;
           mi_excluir.Enabled := False;
           pgctrl_disp_legal.ActivePage := ts_lista;
        end;

      except
        on E: Exception do
        begin
          datm_disp_legal.qry_disp_legal_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
  end;

end;

procedure Tfrm_disp_legal.pgctrl_disp_legalChange(Sender: TObject);
begin
  OnChanging := False;

  if lnm_disp_legal then
  begin
    lnm_disp_legal := False;
    pgctrl_disp_legal.ActivePage := ts_dados_basicos;
    dbedt_nm_disp_legal.SetFocus;
    Exit;
  end;

  if (pgctrl_disp_legal.ActivePage = ts_lista ) then
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

procedure Tfrm_disp_legal.pgctrl_disp_legalChanging(Sender: TObject;
  var AllowChange: Boolean);
begin

  OnChanging := True;

  If datm_disp_legal.qry_disp_legal_.RecordCount = 0 then
     AllowChange := False;

  VerAlt;
end;

function Tfrm_disp_legal.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_disp_legal.qry_disp_legal_.State in [dsEdit] ) and st_modificar ) or
     ( datm_disp_legal.qry_disp_legal_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Dispositivo Legal foi alterado.' + #13#10 +
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

function Tfrm_disp_legal.Consiste : Boolean;
begin
  if dbedt_nm_disp_legal.Text = '' then
  begin
    BoxMensagem('Campo Descrição deve ser preenchido!', 2);
    pgctrl_disp_legal.ActivePage := ts_dados_basicos;
    dbedt_nm_disp_legal.SetFocus;
    lnm_disp_legal := True;
    Consiste := False;
    Exit;
  end;
  Consiste := True;
end;

function Tfrm_disp_legal.Grava : Boolean;
begin
  dbnvg.Enabled := True;
  try
    datm_main.db_broker.StartTransaction;
    If ( datm_disp_legal.qry_disp_legal_.State in [dsInsert, dsEdit] ) then
    begin
      datm_disp_legal.qry_disp_legal_.Post;
      Pesquisa := datm_disp_legal.qry_disp_legal_CD_EX.AsString;
      datm_disp_legal.qry_disp_legal_.Close;
      datm_disp_legal.qry_disp_legal_.Prepare;
      datm_disp_legal.qry_disp_legal_.Open;
      Localiza(datm_disp_legal.qry_disp_legal_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_disp_legal.qry_disp_legal_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
end;


procedure Tfrm_disp_legal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  if Not VerAlt then Exit;

  with datm_disp_legal do
  begin
    qry_disp_legal_.Close;
    qry_trat_tribut_.Close;
//    Destroy;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_disp_legal.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_disp_legal.qry_disp_legal_CD_EX.AsString;
  edt_chave.Text := '';
  datm_disp_legal.qry_disp_legal_.Close;
  datm_disp_legal.qry_disp_legal_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_disp_legal.qry_disp_legal_.Open;
  Localiza(datm_disp_legal.qry_disp_legal_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;

end;

procedure Tfrm_disp_legal.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_disp_legal.qry_disp_legal_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_disp_legal.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_disp_legal.ActivePage := ts_lista;

  If datm_disp_legal.qry_disp_legal_.RecordCount > 0 then
  begin
    btn_excluir.Enabled := True;
    mi_excluir.Enabled := True;
  end
  else
  begin
    btn_excluir.Enabled := False;
    mi_excluir.Enabled := False;
  end;

  edt_chave.SetFocus;

end;

procedure Tfrm_disp_legal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
end;

procedure Tfrm_disp_legal.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  Application.CreateForm( Tdatm_disp_legal, datm_disp_legal );

  with datm_disp_legal do
  begin
    ds_disp_legal.AutoEdit := st_modificar;
    qry_disp_legal_.Close;
    qry_disp_legal_.Prepare;
    qry_disp_legal_.SQL[2] := 'NM_EX';
    qry_disp_legal_.Open;
    qry_trat_tribut_.Close;
    qry_trat_tribut_.Prepare;
    qry_trat_tribut_.Open;
  end;

  a_str_indices[0] := 'CD_EX';
  a_str_indices[1] := 'NM_EX';

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
  mi_excluir.Enabled := st_excluir;

end;

procedure Tfrm_disp_legal.dbg_cadastroDblClick(Sender: TObject);
begin

  If lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_disp_legal.qry_disp_legal_CD_EX.AsString;
    except
      try
        Cons_Online_Texto := datm_disp_legal.qry_disp_legal_CD_EX.AsString;
      except
        BoxMensagem('Não consegui retornar Código do Dispositivo Legal!', 2);
      end;
    end;
    Close;
  end;

end;

procedure Tfrm_disp_legal.Cancelar;
begin
  try
    if datm_disp_legal.qry_disp_legal_.State in [dsInsert, dsEdit] then
    begin
      datm_disp_legal.qry_disp_legal_.Cancel;
      pgctrl_disp_legal.ActivePage := ts_dados_basicos;
      dbedt_nm_disp_legal.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
end;

procedure Tfrm_disp_legal.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_disp_legal.Verifica_Botoes( habilita : Boolean );
begin
  btn_incluir.Enabled  := habilita;
  mi_incluir.Enabled   := habilita;
  btn_excluir.Enabled  := habilita;
  mi_excluir.Enabled   := habilita;
  btn_salvar.Enabled   := not habilita;
  mi_salvar.Enabled    := not habilita;
  btn_cancelar.Enabled := not habilita;
  mi_cancelar.Enabled  := not habilita;
end;

end.
