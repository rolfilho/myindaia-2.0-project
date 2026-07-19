unit PGGP004;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  Tfrm_splash = class(TForm)
    pnl_logo: TPanel;
    lbl_smagalhaes: TLabel;
    bvl_linha_sobre_smag: TBevel;
    lbl_loding: TLabel;
    img_sgm: TImage;
    Relogio: TTimer;
    procedure RelogioTimer(Sender: TObject);
  end;

var
  frm_splash: Tfrm_splash;

implementation

{$R *.DFM}


procedure Tfrm_splash.RelogioTimer(Sender: TObject);
begin
  If Font.Color = clBlack Then
     Font.Color := clSilver
  Else   
     Font.Color := clBlack;
  Application.ProcessMessages;
end;

end.
