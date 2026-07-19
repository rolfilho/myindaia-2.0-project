unit PGPO027;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Buttons, ExtCtrls, DBTables, Db;

type
  Tfrm_flp_po_item_obs = class(TForm)
    pnl_obs: TPanel;
    btn_sair: TSpeedButton;
    btn_clear: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    pnl_dados: TPanel;
    Label1: TLabel;
    dbm_obs: TDBMemo;
    pnl_procs: TPanel;
    Label2: TLabel;
    lbl_nr_po: TLabel;
    lbl_evento: TLabel;
    Label4: TLabel;
    mi_menu: TMainMenu;
    mi_clear: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_clearClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbm_obsChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_flp_po_item_obs: Tfrm_flp_po_item_obs;

implementation

uses GSMLIB, PGGP017, PGPO019;

{$R *.DFM}

procedure VerAlt;
begin
  if datm_po_flp.qry_flp_po_.State in [dsEdit, dsInsert] then
  begin
    if BoxMensagem('O campo de observações foi alterado.' + #13#10 +
       'Deseja salvar as alterações?', 1) then
    begin
       try
          datm_po_flp.qry_atz_obs_po_item_.Post;
       except
       end;
    end
    else datm_po_flp.qry_atz_obs_po_item_.Cancel;
  end;
end;

procedure Tfrm_flp_po_item_obs.btn_salvarClick(Sender: TObject);
begin
  with datm_po_flp do
  begin
    ActiveControl := nil;
    qry_atz_obs_po_item_.Post;
    btn_salvar.Enabled   := qry_atz_obs_po_item_.State in [dsInsert, dsEdit];
    btn_cancelar.Enabled := qry_atz_obs_po_item_.State in [dsInsert, dsEdit];
    mi_salvar.Enabled    := qry_atz_obs_po_item_.State in [dsInsert, dsEdit];
    mi_cancelar.Enabled  := qry_atz_obs_po_item_.State in [dsInsert, dsEdit];
  end;
end;

procedure Tfrm_flp_po_item_obs.btn_cancelarClick(Sender: TObject);
begin
  with datm_po_flp do
  begin
    qry_atz_obs_po_item_.Cancel;
    btn_salvar.Enabled   := qry_atz_obs_po_item_.State in [dsInsert, dsEdit];
    btn_cancelar.Enabled := qry_atz_obs_po_item_.State in [dsInsert, dsEdit];
    mi_salvar.Enabled    := qry_atz_obs_po_item_.State in [dsInsert, dsEdit];
    mi_cancelar.Enabled  := qry_atz_obs_po_item_.State in [dsInsert, dsEdit];
  end;
end;

procedure Tfrm_flp_po_item_obs.btn_clearClick(Sender: TObject);
begin
  if BoxMensagem('Deseja apagar a observação?' + #13#10 , 1) then
  begin
    if Not ( datm_po_flp.qry_atz_obs_po_item_.State in [dsInsert, dsEdit] ) then
    begin
      datm_po_flp.qry_atz_obs_po_item_.Edit;
    end;
    dbm_obs.Text := '';
  end;
  dbm_obs.SetFocus;
end;

procedure Tfrm_flp_po_item_obs.btn_sairClick(Sender: TObject);
begin
  VerAlt;
  frm_flp_po_item_obs.Close;
end;

procedure Tfrm_flp_po_item_obs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_flp_po_item_obs.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
  Begin
     VerAlt;
     Close;
  End;
end;

procedure Tfrm_flp_po_item_obs.dbm_obsChange(Sender: TObject);
begin
  with datm_po_flp do
  begin
    btn_salvar.Enabled   := qry_atz_obs_po_item_.State in [dsInsert, dsEdit];
    mi_salvar.Enabled    := qry_atz_obs_po_item_.State in [dsInsert, dsEdit];
    btn_cancelar.Enabled := qry_atz_obs_po_item_.State in [dsInsert, dsEdit];
    mi_cancelar.Enabled  := qry_atz_obs_po_item_.State in [dsInsert, dsEdit];
  end;
end;

end.
