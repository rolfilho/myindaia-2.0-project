unit PGPO020;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Buttons, ExtCtrls, Db, SpellChk, DBTables;

type
  Tfrm_flp_po_obs = class(TForm)
    pnl_dados: TPanel;
    Label1: TLabel;
    mi_menu: TMainMenu;
    mi_clear: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    dbm_obs: TDBMemo;
    Panel1: TPanel;
    pnl_obs: TPanel;
    btn_sair: TSpeedButton;
    btn_clear: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    pnl_procs: TPanel;
    Label2: TLabel;
    lbl_nr_po: TLabel;
    lbl_evento: TLabel;
    Label4: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    SpeedButton1: TSpeedButton;
    spell: TSpellCheck;
    qryAtzObsPO: TQuery;
    qryAtzObsPOTX_OBS: TMemoField;
    dsAtzObsPO: TDataSource;
    procedure btn_clearClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbm_obsChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    procedure VerAlt;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_flp_po_obs: Tfrm_flp_po_obs;

implementation

uses GSMLIB, PGGP017, PGPO018;

{$R *.DFM}

procedure Tfrm_flp_po_obs.VerAlt;
begin
  if frm_po_flp.qryFollowupPO.State in [dsEdit, dsInsert] then begin
    if BoxMensagem('O campo de observações foi alterado.' + #13#10 +
       'Deseja salvar as alterações?', 1) then
    begin
      qryAtzObsPO.Post;
    end
    else qryAtzObsPO.Cancel;
  end;
end;

procedure Tfrm_flp_po_obs.btn_clearClick(Sender: TObject);
begin
  if BoxMensagem('Deseja apagar a observação?' + #13#10 , 1) then begin
    if Not ( qryAtzObsPO.State in [dsInsert, dsEdit] ) then qryAtzObsPO.Edit;
    dbm_obs.Text := '';
  end;
  dbm_obs.SetFocus;
end;

procedure Tfrm_flp_po_obs.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  qryAtzObsPO.Post;
  btn_salvar.Enabled   := qryAtzObsPO.State in [dsInsert, dsEdit];
  btn_cancelar.Enabled := qryAtzObsPO.State in [dsInsert, dsEdit];
  mi_salvar.Enabled    := qryAtzObsPO.State in [dsInsert, dsEdit];
  mi_cancelar.Enabled  := qryAtzObsPO.State in [dsInsert, dsEdit];
end;

procedure Tfrm_flp_po_obs.btn_cancelarClick(Sender: TObject);
begin
  qryAtzObsPO.Cancel;
  btn_salvar.Enabled   := qryAtzObsPO.State in [dsInsert, dsEdit];
  btn_cancelar.Enabled := qryAtzObsPO.State in [dsInsert, dsEdit];
  mi_salvar.Enabled    := qryAtzObsPO.State in [dsInsert, dsEdit];
  mi_cancelar.Enabled  := qryAtzObsPO.State in [dsInsert, dsEdit];
end;

procedure Tfrm_flp_po_obs.btn_sairClick(Sender: TObject);
begin
  VerAlt;
  frm_flp_po_obs.Close;
end;

procedure Tfrm_flp_po_obs.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
  Begin
     VerAlt;
     Close;
  End;
end;

procedure Tfrm_flp_po_obs.dbm_obsChange(Sender: TObject);
begin
  btn_salvar.Enabled   := qryAtzObsPO.State in [dsInsert, dsEdit];
  mi_salvar.Enabled    := qryAtzObsPO.State in [dsInsert, dsEdit];
  btn_cancelar.Enabled := qryAtzObsPO.State in [dsInsert, dsEdit];
  mi_cancelar.Enabled  := qryAtzObsPO.State in [dsInsert, dsEdit];
end;

procedure Tfrm_flp_po_obs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_flp_po_obs.FormShow(Sender: TObject);
begin
  Panel1.Color := clMenuBroker;
  Shape1.Brush.Color := clPnlClaroBroker;
end;

procedure Tfrm_flp_po_obs.SpeedButton1Click(Sender: TObject);
begin
  PoeEmEdicao(qryAtzObsPO);
  Spell.Language := wdBrazilianPortuguese;
  Spell.CheckMemoTextSpelling(dbm_obs);
end;

end.
