unit PGNM013;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls;

type
  Tfrm_solic_cheque = class(TForm)
    pnl_cadastro: TPanel;
    btn_nova_solinum: TSpeedButton;
    btn_sair: TSpeedButton;
    menu_cadastro: TMainMenu;
    mi_nova_solinum: TMenuItem;
    btn_excluir_solinum: TSpeedButton;
    mi_saida: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_imprimir_solinum: TMenuItem;
    btn_itens_solinum: TSpeedButton;
    mi_consultar: TMenuItem;
    Bevel1: TBevel;
    btn_imprimir_solinum: TSpeedButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Query1: TQuery;
    procedure btn_sairClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    i_seletor : Integer;
    i_Height : Integer;
    i_Width : Integer;
    i_dif_Height : Integer;
    i_dif_Width : Integer;
    cState : String[1];
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    str_cd_unid_neg : string[2];
    str_cd_produto : string[2];
    nr_processo : string[11];
    nr_solicitacao : string[3];
    { Public declarations }
  end;

var
  frm_solic_cheque: Tfrm_solic_cheque;

implementation

uses gsmlib, PGDI001, PGDI006, PGGP002, PGGP001, PGDI004, PGDI005, PGGP011,
  PGGP012, PGGP010, PGDI010, PGNM003, PGNM011;

{$R *.DFM}

procedure Tfrm_solic_cheque.btn_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_solic_cheque.FormResize(Sender: TObject);
begin
  i_dif_Height := Height - i_Height;
  i_dif_Width := Width - i_Width;
  pnl_cadastro.Width := pnl_cadastro.Width + i_dif_Width;
  i_Height := Height;
  i_Width := Width;
end;

procedure Tfrm_solic_cheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_solic_cheque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 27 then Close;
end;

procedure Tfrm_solic_cheque.FormCreate(Sender: TObject);
begin
  { salva as dimensoes atuais }
  i_Height := Height;
  i_Width := Width;
end;

end.
