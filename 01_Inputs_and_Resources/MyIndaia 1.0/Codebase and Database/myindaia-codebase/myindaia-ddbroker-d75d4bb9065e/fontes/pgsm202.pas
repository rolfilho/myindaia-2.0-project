unit PGSM202;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, ExtCtrls, Menus, ComCtrls, Grids, DBGrids,
  Db, Mask, DBTables;

type
  Tfrm_naladi_ncca_exp = class(TForm)
    MainMenu1: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pgctrl_naladi: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    Bevel1: TBevel;
    dbgrd_naladi: TDBGrid;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    pnl_entrada_de_dados: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dbedt_cd_naladi: TDBEdit;
    dbedt_nm_naladi: TDBEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbedt_cd_naladiChange(Sender: TObject);
    procedure pgctrl_naladiChange(Sender: TObject);
    procedure edt_chaveExit(Sender: TObject);
    procedure pgctrl_naladiChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure edt_chaveChange(Sender: TObject);
    procedure dbgrd_naladiDblClick(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    a_str_indices : Array[0..1] of String[16];
    st_modificar, st_incluir, st_excluir : Boolean;
    Pesquisa : String;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    { Public declarations }
    lCons_OnLine : Boolean;

    Cons_OnLine : TStringField;
    Cons_OnLineSeq : TIntegerField;

    Cons_OnLine_Texto : String;
    Cons_OnLine_Integer : Integer;
  end;

var
  frm_naladi_ncca_exp: Tfrm_naladi_ncca_exp;

implementation

uses PGSM203, GSMLIB, PGGP017;

{$R *.DFM}

procedure Tfrm_naladi_ncca_exp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_naladi_ncca_exp.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Application.CreateForm(Tdatm_naladi_ncca_exp, datm_naladi_ncca_exp);
  pgctrl_naladi.ActivePage := ts_lista;
  datm_naladi_ncca_exp.qry_naladi_.Close;
  datm_naladi_ncca_exp.qry_naladi_.Prepare;
  datm_naladi_ncca_exp.qry_naladi_.Open;
  with cb_ordem do
  begin
     Items.Clear;
     Items.Add('Código');
     Items.Add('Descrição');
     ItemIndex := 0;
  end;
  a_str_indices[0] := 'CODIGO';
  a_str_indices[1] := 'DESCRICAO';
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
  AtribuiDireitos( st_modificar, st_incluir, st_excluir);
  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

  Screen.Cursor := crDefault;
  Application.ProcessMessages;
end;

procedure Tfrm_naladi_ncca_exp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_naladi_ncca_exp do
  begin
    if qry_naladi_.State in [ dsInsert, dsEdit ] then
    begin
      if BoxMensagem('O cadastro de NALADI/NCCA foi alterado.'+ #13 + 'Deseja salvar alterações antes de sair?', 1 ) then
      begin
        try
          datm_main.db_broker.StartTransaction;
          qry_naladi_.Post;
          datm_main.db_broker.Commit;
        except
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          BoxMensagem('Não foi possível para o sistema atualizar o cadastro.',2 );
          qry_naladi_.Cancel;
        end;
      end
    end;
    Free;
  end;
  Screen.Cursor := crDefault;
end;
procedure Tfrm_naladi_ncca_exp.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_naladi_ncca_exp.btn_incluirClick(Sender: TObject);
begin
  if st_incluir then
  begin
     pgctrl_naladi.ActivePage := ts_dados_basicos;
     dbedt_cd_naladi.SetFocus;
     datm_naladi_ncca_exp.qry_naladi_.Insert;
  end;

  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;
end;

procedure Tfrm_naladi_ncca_exp.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_naladi_ncca_exp.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_naladi_ncca_exp.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este registro de NALADI/NCCA será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
  try
    datm_main.db_broker.StartTransaction;
    datm_naladi_ncca_exp.qry_naladi_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_naladi_ncca_exp.qry_naladi_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  pgctrl_naladi.ActivePage := ts_lista;
end;

procedure Tfrm_naladi_ncca_exp.cb_ordemClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Pesquisa := datm_naladi_ncca_exp.qry_naladi_CODIGO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_naladi_ncca_exp.qry_naladi_.Close;
  datm_naladi_ncca_exp.qry_naladi_.SQL[3] := a_str_indices[cb_ordem.ItemIndex];
  datm_naladi_ncca_exp.qry_naladi_.Prepare;
  datm_naladi_ncca_exp.qry_naladi_.Open;
  Localiza(datm_naladi_ncca_exp.qry_naladi_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
  Screen.Cursor := crDefault;
  Application.ProcessMessages;
end;

procedure Tfrm_naladi_ncca_exp.dbedt_cd_naladiChange(Sender: TObject);
begin
  if ( datm_naladi_ncca_exp.qry_naladi_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_naladi_ncca_exp.pgctrl_naladiChange(Sender: TObject);
begin
  if (pgctrl_naladi.ActivePage = ts_lista ) then
  begin
    dbnvg.Enabled     := True;
    edt_chave.Enabled := True;
    cb_ordem.Enabled  := True;
  end
  else
  begin
    dbnvg.Enabled     := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled  := False;
  end;
end;

procedure Tfrm_naladi_ncca_exp.edt_chaveExit(Sender: TObject);
begin
  if datm_naladi_ncca_exp.qry_naladi_.Locate( a_str_indices[ cb_ordem.ItemIndex ], edt_chave.text, [lopartialKey] ) then
  dbgrd_naladi.SetFocus;
end;

function Tfrm_naladi_ncca_exp.Grava : Boolean;
var
  cd_naladi : String;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_naladi_ncca_exp.qry_naladi_.State in [dsInsert] ) then
    begin
      datm_naladi_ncca_exp.qry_naladi_.Post;
      cd_naladi := datm_naladi_ncca_exp.qry_naladi_CODIGO.AsString;

      datm_naladi_ncca_exp.qry_verifica_.Close;
      datm_naladi_ncca_exp.qry_verifica_.ParamByName('CODIGO').AsString := cd_naladi;
      datm_naladi_ncca_exp.qry_verifica_.Prepare;
      datm_naladi_ncca_exp.qry_verifica_.Open;

      datm_naladi_ncca_exp.qry_naladi_.Edit;
      if datm_naladi_ncca_exp.qry_verifica_.RecordCount > 1 then
         datm_naladi_ncca_exp.qry_naladi_NR_SEQ.AsInteger := 1
      else
         datm_naladi_ncca_exp.qry_naladi_NR_SEQ.AsInteger := datm_naladi_ncca_exp.qry_verifica_NR_SEQ.AsInteger + 1;
      datm_naladi_ncca_exp.qry_verifica_.Close;
      datm_naladi_ncca_exp.qry_naladi_.Post;

      datm_naladi_ncca_exp.qry_naladi_.Close;
      datm_naladi_ncca_exp.qry_naladi_.Prepare;
      datm_naladi_ncca_exp.qry_naladi_.Open;
      Localiza(datm_naladi_ncca_exp.qry_naladi_, cd_naladi, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
    pgctrl_naladi.SetFocus;
  except
    on E: Exception do
    begin
      datm_naladi_ncca_exp.qry_naladi_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  btn_mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_naladi_ncca_exp.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_naladi_ncca_exp.qry_naladi_.State in [dsEdit] ) and st_modificar ) or
     ( datm_naladi_ncca_exp.qry_naladi_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de NALADI/NCCA foi alterado.' + #13#10 +
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

procedure Tfrm_naladi_ncca_exp.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_naladi_ncca_exp.Cancelar;
begin
  try
    if datm_naladi_ncca_exp.qry_naladi_.State in [dsInsert, dsEdit] then
    begin
      datm_naladi_ncca_exp.qry_naladi_.Cancel;
      pgctrl_naladi.ActivePage := ts_dados_basicos;
      dbedt_cd_naladi.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;


procedure Tfrm_naladi_ncca_exp.pgctrl_naladiChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_naladi_ncca_exp.Consiste : Boolean;
begin
  Consiste := True;

  if dbedt_cd_naladi.Text = '' then
  begin
    BoxMensagem('Campo Código deve ser preenchido!', 2);
    pgctrl_naladi.ActivePage := ts_dados_basicos;
    dbedt_cd_naladi.SetFocus;
    Consiste := False;
    Exit;
  end;

  if dbedt_nm_naladi.Text = '' then
  begin
    BoxMensagem('Campo Descrição deve ser preenchido!', 2);
    pgctrl_naladi.ActivePage := ts_dados_basicos;
    dbedt_nm_naladi.SetFocus;
    Consiste := False;
    Exit;
  end;
end;

procedure Tfrm_naladi_ncca_exp.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_naladi_ncca_exp.qry_naladi_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_naladi_ncca_exp.dbgrd_naladiDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString     := datm_naladi_ncca_exp.qry_naladi_CODIGO.AsString;
      Cons_OnLineSeq.AsInteger := datm_naladi_ncca_exp.qry_naladi_NR_SEQ.AsInteger;
    except
      try
        Cons_Online_Texto   := datm_naladi_ncca_exp.qry_naladi_CODIGO.AsString;
        Cons_OnLine_Integer := datm_naladi_ncca_exp.qry_naladi_NR_SEQ.AsInteger;
      except
        BoxMensagem( 'Não foi possível retornar o Código do NALADI/NCCA Exportação!', 2 );
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_naladi_ncca_exp.edt_chaveKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then dbgrd_naladiDblClick(nil);
end;

procedure Tfrm_naladi_ncca_exp.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
end;

end.
