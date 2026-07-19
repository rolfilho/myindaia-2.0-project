unit dgChaveValor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmChaveValor = class(TForm)
    lblChave: TLabel;
    edChave: TEdit;
    lblValor: TLabel;
    edValor: TEdit;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    class function Execute(const TituloForm, TituloChave, TituloValor: string; var Chave, Valor: string): Boolean;
  end;

var
  frmChaveValor: TfrmChaveValor;

implementation

{$R *.dfm}

procedure TfrmChaveValor.Button1Click(Sender: TObject);
begin
  Close;
  ModalResult := mrOk;
end;

procedure TfrmChaveValor.Button2Click(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;

class function TfrmChaveValor.Execute(const TituloForm, TituloChave, TituloValor: string; var Chave,
  Valor: string): Boolean;
var
  Form: TfrmChaveValor;
begin
  Form := TfrmChaveValor.Create(nil);
  try
    Form.Caption := TituloForm;
    Form.lblChave.Caption := TituloChave;
    Form.lblValor.Caption := TituloValor;
    Result := Form.ShowModal = mrOk;
    Chave := Form.edChave.Text;
    Valor := Form.edValor.Text;
  finally
    Form.Free;
  end;
end;

end.
