unit PGGP041;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, Menus, StdCtrls, ComCtrls, Db, FileText, Grids,
  DBGrids, Mask, DbTables;

type
  Tfrm_integra_jump = class(TForm)
    menu_: TMainMenu;
    mi_integrar_: TMenuItem;
    mi_sair_: TMenuItem;
    pnl_integra: TPanel;
    btn_integrar: TSpeedButton;
    speed_sair_: TSpeedButton;
    open_file_: TOpenDialog;
    Panel3: TPanel;
    msk_dt_inicio: TMaskEdit;
    Label7: TLabel;
    msk_dt_fim: TMaskEdit;
    Label2: TLabel;
    procedure btn_integrarClick(Sender: TObject);
    procedure speed_sair_Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mi_sair_Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure msk_dt_inicioExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tp_saida : Byte;
  end;

var
  frm_integra_jump: Tfrm_integra_jump;
  Arquivo  : TFileText;
  cItem    : String[3];
  Stri     : String;
  nr_itens : LongInt;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP042, PGGP017;


procedure Tfrm_integra_jump.btn_integrarClick(Sender: TObject);
begin

  try
    datm_main.db_broker.StartTransaction;

    Screen.Cursor := crHourGlass;

    with datm_integra_jump do
    begin
      sp_integra_jump.ParamByName('@dt_inicio').AsDateTime := StrToDate( msk_dt_inicio.Text );
      sp_integra_jump.ParamByName('@dt_fim').AsDateTime    := StrToDate( msk_dt_fim.Text );
      ExecStoredProc( sp_integra_jump );
      CloseStoredProc( sp_integra_jump );
    end;

    datm_main.db_broker.Commit;
    BoxMensagem( 'Integração realizada com sucesso!', 3 );
  except
    on E: Exception do
    begin
      BoxMensagem( 'Erro na Integração. Operação Cancelada !!', 3 );
      TrataErro(E);
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
    end;
  end;

  Screen.Cursor := crArrow;
end;

procedure Tfrm_integra_jump.speed_sair_Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_integra_jump.FormCreate(Sender: TObject);
 begin
  Application.CreateForm( Tdatm_integra_jump, datm_integra_jump );
end;


procedure Tfrm_integra_jump.mi_sair_Click(Sender: TObject);
begin
  speed_sair_Click(nil);
end;


procedure Tfrm_integra_jump.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;


procedure Tfrm_integra_jump.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_integra_jump.free;
  Action := caFree;
end;


procedure Tfrm_integra_jump.msk_dt_inicioExit(Sender: TObject);
begin
  if (Trim(msk_dt_inicio.Text) <> '/  /') and (Trim(msk_dt_inicio.Text) = '/  /') then
     msk_dt_inicio.Text := DateToStr( date );

end;


end.

