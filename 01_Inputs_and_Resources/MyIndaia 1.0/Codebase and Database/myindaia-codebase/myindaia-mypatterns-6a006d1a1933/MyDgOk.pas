unit MyDgOk;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyForm, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TformMyDgOk = class(TformMyForm)
    Panel1: TPanel;
    btnOk: TButton;
    btnCancela: TSpeedButton;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMyDgOk: TformMyDgOk;

implementation

{$R *.dfm}

procedure TformMyDgOk.btnOkClick(Sender: TObject);
begin
  inherited;
  Close;
  ModalResult := mrOk;
end;

procedure TformMyDgOk.btnCancelaClick(Sender: TObject);
begin
  inherited;
  Close;
  ModalResult := mrCancel;
end;

end.
