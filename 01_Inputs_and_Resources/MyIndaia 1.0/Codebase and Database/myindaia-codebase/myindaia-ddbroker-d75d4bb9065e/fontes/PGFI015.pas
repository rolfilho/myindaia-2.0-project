unit PGFI015;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls;

type
  Tfrm_financeiro_fech_data = class(TForm)
    Panel1: TPanel;
    lbl_periodo: TLabel;
    msk_dt_inicio: TMaskEdit;
    lbl_a: TLabel;
    msk_dt_fim: TMaskEdit;
    btn_sair: TButton;
    btn_ok: TButton;
    procedure msk_dt_inicioExit(Sender: TObject);
    procedure msk_dt_inicioEnter(Sender: TObject);
    procedure msk_dt_fimEnter(Sender: TObject);
    procedure msk_dt_fimExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_financeiro_fech_data: Tfrm_financeiro_fech_data;

implementation

uses PGFI001, GSMLIB;

{$R *.DFM}



procedure Tfrm_financeiro_fech_data.msk_dt_inicioExit(Sender: TObject);
begin
  try
    dt_valida := StrToDateTime ( frm_financeiro_fech_data.msk_dt_inicio.Text );
  except
    msk_dt_inicio.Text := str_data_valida;
  end;
end;

procedure Tfrm_financeiro_fech_data.msk_dt_inicioEnter(Sender: TObject);
begin
  str_data_valida := msk_dt_inicio.Text;
end;

procedure Tfrm_financeiro_fech_data.msk_dt_fimEnter(Sender: TObject);
begin
  str_data_valida := msk_dt_fim.Text;

end;

procedure Tfrm_financeiro_fech_data.msk_dt_fimExit(Sender: TObject);
begin
  try
    dt_valida := StrToDateTime ( frm_financeiro_fech_data.msk_dt_fim.Text );
  except
    msk_dt_fim.Text := str_data_valida;
  end;

end;

procedure Tfrm_financeiro_fech_data.FormShow(Sender: TObject);
begin
  msk_dt_inicio.Text := DateToStr( date );
  msk_dt_fim.Text := DateToStr( date );

end;

procedure Tfrm_financeiro_fech_data.btn_okClick(Sender: TObject);
begin

  if Trim(msk_dt_inicio.Text) = '/  /' then
  begin
    BoxMensagem( 'Data de Início deve ser preenchida !', 2 );
    msk_dt_inicio.SetFocus;
    Exit;
  end;
  if Trim(msk_dt_fim.Text) = '/  /' then
  begin
    BoxMensagem( 'Data de Término deve ser preenchida !', 2 );
    msk_dt_fim.SetFocus;
    Exit;
  end;

  frm_financeiro.dDataInicio := StrToDate( msk_dt_inicio.Text );
  frm_financeiro.dDataFim    := StrToDate( msk_dt_fim.Text );
  frm_financeiro.lFechFinOK  := True;

  frm_financeiro_fech_data.Close;

  
end;

procedure Tfrm_financeiro_fech_data.btn_sairClick(Sender: TObject);
begin
  frm_financeiro.lFechFinOK  := False;
end;

end.


