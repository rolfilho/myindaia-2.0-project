unit PGGA027;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Menus, Mask, DBCtrls, Buttons, ExtCtrls;

type
  Tfrm_proc_vinc_realiza = class(TForm)
    menu_manut: TMainMenu;
    mi_sair: TMenuItem;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    edt_nr_processo: TEdit;
    dbedt_nr_processo_vinc: TDBEdit;
    Label2: TLabel;
    Panel1: TPanel;
    dbnvg: TDBNavigator;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mi_sairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    str_processo : String;
    str_servico  : String;
  end;

var
  frm_proc_vinc_realiza: Tfrm_proc_vinc_realiza;

implementation

uses PGGA028;

{$R *.DFM}

procedure Tfrm_proc_vinc_realiza.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_proc_vinc_realiza.mi_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_proc_vinc_realiza.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_proc_vinc_realiza, datm_proc_vinc_realiza);
end;

procedure Tfrm_proc_vinc_realiza.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_proc_vinc_realiza.qry_processo_.Close;
  datm_proc_vinc_realiza.qry_tfollowup_.Close;

  datm_proc_vinc_realiza.Free;
end;

procedure Tfrm_proc_vinc_realiza.FormShow(Sender: TObject);
begin
  with datm_proc_vinc_realiza do
  begin
    with qry_processo_ do
    begin
      Close;
      ParamByName('NR_PROCESSO').asString := str_processo;
      Prepare;
      Open;
    end;

    edt_nr_processo.Text := Copy(str_processo, 5, 14);

    with qry_tfollowup_ do
    begin
      Close;
      ParamByName('NR_PROCESSO_VINC').asString := qry_processo_CD_UNID_NEG_VINC.asString +
                                                  qry_processo_CD_PRODUTO_VINC.asString  +
                                                  qry_processo_NR_PROCESSO_VINC.asString;
      ParamByName('CD_SERVICO').asString       := str_servico;
      Prepare;
      Open;
    end;
  end;
end;








procedure Tfrm_proc_vinc_realiza.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.
