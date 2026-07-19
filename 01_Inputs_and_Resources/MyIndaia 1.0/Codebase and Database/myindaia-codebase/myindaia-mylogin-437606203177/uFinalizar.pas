unit uFinalizar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, sSkinProvider;

type
  TfrmFinalizar = class(TForm)
    pnlFinalizar: TsPanel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFinalizar: TfrmFinalizar;

implementation

{$R *.dfm}

procedure TfrmFinalizar.FormShow(Sender: TObject);
begin
  Application.NormalizeTopMosts;
  SetWindowPos(Self.Handle, HWND_NOTOPMOST, Self.Left, Self.Top, Self.Width, Self.Height, 0);
  Application.RestoreTopMosts;
end;

end.
