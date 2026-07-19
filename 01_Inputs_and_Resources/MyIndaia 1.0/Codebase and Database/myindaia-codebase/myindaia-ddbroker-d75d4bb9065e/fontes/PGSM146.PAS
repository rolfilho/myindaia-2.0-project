unit PGSM146;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, UCRPE32, Grids, DBGrids, Funcoes;

type
  Tfrm_log_erro_calculo = class(TForm)
    Panel1: TPanel;
    dbg_erros: TDBGrid;
    btn_ok: TBitBtn;
    procedure btn_okClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_log_erro_calculo: Tfrm_log_erro_calculo;

implementation

{$R *.DFM}
uses GSMLIB, PGSM147, PGGP001, PGGP017;

procedure Tfrm_log_erro_calculo.btn_okClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_log_erro_calculo.FormShow(Sender: TObject);
begin
 { Inicializa o Data Module para Seleção de Movimentos do Financeiro}
  Application.CreateForm( Tdatm_log_erro_calculo, datm_log_erro_calculo );

  with datm_log_erro_calculo do
  begin
    qry_log_erro_calculo_.Close;
    qry_log_erro_calculo_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_log_erro_calculo_.Prepare;
    qry_log_erro_calculo_.Open;
  end;
end;

procedure Tfrm_log_erro_calculo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_log_erro_calculo do
  begin
    qry_log_erro_calculo_.Close;
//    Destroy;
    Free;
  end;
  Action := caFree;
end;

end.
