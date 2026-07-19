unit PGSM290;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RxDBComb, Mask, DBCtrls, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, Menus,DB;

type
  Tfrm_cntr = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pgctrl_cntr: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    lbl_cd_pais: TLabel;
    lbl_nm_pais: TLabel;
    dbedt_cd_pais: TDBEdit;
    dbedt_nm_cntr: TDBEdit;
    RxDBComboBox1: TRxDBComboBox;
    Label3: TLabel;
    MainMenu1: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    RxDBComboBox2: TRxDBComboBox;
    Label4: TLabel;
    pnl_pesquisa: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    Label5: TLabel;
    dbedtCdIso: TDBEdit;
    procedure RxDBComboBox1Change(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure pgctrl_cntrChange(Sender: TObject);
    procedure pgctrl_cntrChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cb_ordemClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    a_str_indices : Array[0..1] Of String[60];
    st_modificar, st_incluir, st_excluir : Boolean;
    function Consiste : Boolean;
    function Grava    : Boolean;
    function Veralt   : Boolean;
    procedure Cancelar;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
  public
    { Public declarations }
     lCons_OnLine : Boolean;
     Cons_OnLine : TStringField;
     Cons_OnLine_Texto : String;
  end;

var
  frm_cntr: Tfrm_cntr;

implementation

uses PGSM291, GSMLIB, PGGP017;

{$R *.DFM}

procedure Tfrm_cntr.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_cntr.Cancelar;
begin
  if datm_cntr.qry_cntr_.State in [dsEdit,dsinsert] then
    datm_cntr.qry_cntr_.cancel;
  btn_mi(st_incluir,false,false,st_excluir);
end;

function Tfrm_cntr.Consiste: Boolean;
begin
 consiste:=true;
  if dbedt_nm_cntr.Text = '' then
    begin
     Boxmensagem('Deve ser Inserido a Descrição do Contanier.',2);
     dbedt_nm_cntr.SetFocus;
     consiste:=false;
     Exit;
    end

end;

function Tfrm_cntr.Grava: Boolean;
begin
 try
    datm_main.db_broker.StartTransaction;
    If ( datm_cntr.qry_cntr_.State in [dsInsert, dsEdit] ) then
    begin
      datm_cntr.qry_cntr_.Post;

    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      datm_cntr.qry_cntr_.Cancel;
      Grava := False;
      TrataErro(E);      
    end;
  end;

  Btn_Mi(st_incluir, False, False, st_excluir );

end;

procedure Tfrm_cntr.RxDBComboBox1Change(Sender: TObject);
begin
  if datm_cntr.qry_cntr_.State in [dsEdit,dsInsert] then
     btn_mi(false,st_modificar,st_modificar,false);
end;

function Tfrm_cntr.Veralt: Boolean;
begin
  Veralt := True;
  if ( pgctrl_cntr.ActivePage = ts_dados_basicos ) then
  begin
    if ( ( datm_cntr.qry_cntr_.State in [dsEdit] ) and st_modificar ) or
       ( datm_cntr.qry_cntr_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Contanier foi alterado.' + #13#10 +
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

procedure Tfrm_cntr.btn_incluirClick(Sender: TObject);
begin
  with datm_cntr do
  begin
    qry_cntr_.DisableControls;
    qry_cntr_.Cancel;
    qry_cntr_.Append;
    qry_cntr_.EnableControls;
    qry_cntr_IN_ATIVO.AsString:='1';
  end;
  dbnvg.Enabled:=false;
  pgctrl_cntr.ActivePage := ts_dados_basicos;
  dbedt_nm_cntr.SetFocus;
 btn_mi(false,st_modificar,st_modificar,false);
end;

procedure Tfrm_cntr.btn_salvarClick(Sender: TObject);
begin
if not consiste then exit;
if not grava then exit;
end;

procedure Tfrm_cntr.btn_cancelarClick(Sender: TObject);
begin
Cancelar;
end;

procedure Tfrm_cntr.btn_excluirClick(Sender: TObject);
begin
 if BoxMensagem( 'Este Contanier será excluído! Confirma exclusão?', 1 ) Then
  begin
    try
      datm_main.db_broker.StartTransaction;
      datm_cntr.qry_cntr_.Delete;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_cntr.qry_cntr_.Cancel;
        TrataErro(E);
      end;
    end;
  end;
    
  pgctrl_cntr.ActivePage := ts_lista;
end;

procedure Tfrm_cntr.pgctrl_cntrChange(Sender: TObject);
begin
  if pgctrl_cntr.ActivePage = ts_lista then dbnvg.Enabled:=true
    else dbnvg.Enabled:=false;
end;

procedure Tfrm_cntr.pgctrl_cntrChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
AllowChange:=VerAlt;
end;

procedure Tfrm_cntr.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;


  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  Application.CreateForm( Tdatm_cntr, datm_cntr );

  with datm_cntr do
  begin
    ds_cntr.AutoEdit := st_modificar;

    qry_cntr_.Close;
    qry_cntr_.Prepare;
    qry_cntr_.Open;
  end;

  a_str_indices[0] := 'TP_CNTR';
  a_str_indices[1] := 'NM_TP_CNTR';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;

  btn_mi(st_incluir,false,false,st_excluir);

end;

procedure Tfrm_cntr.edt_chaveChange(Sender: TObject);
begin
 Localiza(datm_cntr.qry_cntr_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_cntr.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_cntr.cb_ordemClick(Sender: TObject);
var
  pesquisa : string;
begin
  Pesquisa := datm_cntr.qry_cntr_TP_CNTR.AsString;
  edt_chave.Text := '';
  datm_cntr.qry_cntr_.Close;
  datm_cntr.qry_cntr_.SQL[3] := a_str_indices[cb_ordem.ItemIndex];
  datm_cntr.qry_cntr_.Open;
  Localiza(datm_cntr.qry_cntr_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_cntr.btn_sairClick(Sender: TObject);
begin
  datm_cntr.Free;
  Close;
end;

procedure Tfrm_cntr.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_cntr.qry_cntr_TP_CNTR.AsString;
    except
      try
        Cons_Online_Texto := datm_cntr.qry_cntr_TP_CNTR.AsString;
      except
        BoxMensagem( 'Não foi possível retornar o Código do Contanier!', 2 );
      end;
    end;
    Close;
  end;

end;

procedure Tfrm_cntr.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then dbg_cadastroDblClick(Sender);
end;

end.
