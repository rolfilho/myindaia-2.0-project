unit frmAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TformAjuda = class(TForm)
    Panel1: TPanel;
    btnOk: TButton;
    imgAjuda: TImage;
    pnlCorpo: TPanel;
    txtDescricaoAjuda: TMemo;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    class function Execute(aTextoAjuda, aCaminhoImagem: string;
      aMostraImagem: Boolean): Boolean;
  
    { Public declarations }
  end;

var
  formAjuda: TformAjuda;

implementation

{$R *.dfm}


class function TformAjuda.Execute(aTextoAjuda, aCaminhoImagem: string;
  aMostraImagem: Boolean): Boolean;
var
  form: TformAjuda;
begin
  form := TformAjuda.Create(nil);
  try
    form.txtDescricaoAjuda.Text := aTextoAjuda;
    form.imgAjuda.Visible := aMostraImagem;
    if aMostraImagem then
    if FileExists(aCaminhoImagem) then
      form.imgAjuda.Picture.LoadFromFile(aCaminhoImagem)
    else
      form.txtDescricaoAjuda.Text := form.txtDescricaoAjuda.Text + #10#13 +
                                     '*Não existe imagem no caminho: ' + aCaminhoImagem;
    form.ShowModal;
  finally
    form.Free;
  end;
end;

procedure TformAjuda.btnOkClick(Sender: TObject);
begin
  Close;
  ModalResult := mrOk;
end;

end.
