unit frAjuda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyDgOk, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TformAjuda = class(TformMyDgOk)
    pnlTxt: TPanel;
    pnlImg: TPanel;
    txtDescricaoAjuda: TMemo;
    imgAjuda: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
    class function Execute(aTextoAjuda, aCaminhoImagem: string; aMostraImagem: Boolean; aTitulo: String = ''): Boolean;
  end;

var
  formAjuda: TformAjuda;

implementation

{$R *.dfm}

{ TformMyDgOk1 }


{ TformAjuda }

class function TformAjuda.Execute(aTextoAjuda, aCaminhoImagem: string;
  aMostraImagem: Boolean; aTitulo: String = ''): Boolean;
var
  form: TformAjuda;
begin
  form := TformAjuda.Create(nil);
  try
    form.txtDescricaoAjuda.Text := aTextoAjuda;
    form.imgAjuda.Visible := aMostraImagem;
    if aMostraImagem then
    begin
      if FileExists(aCaminhoImagem) then
        form.imgAjuda.Picture.LoadFromFile(aCaminhoImagem)
      else
        form.txtDescricaoAjuda.Text := form.txtDescricaoAjuda.Text + #10#13 +
                                       '*Não existe imagem no caminho: ' + aCaminhoImagem;
    end
    else
    begin
      form.pnlImg.visible := false;
      form.height := 300;
      form.width := 850;
      form.pnlTxt.Align := alClient;
    end;

    if aTitulo <> '' then
      form.Caption := aTitulo;

    form.ShowModal;
  finally
    form.Free;
  end;
end;

end.
