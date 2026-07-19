unit uFormDuimpView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw;

type
  TFormDuimpView = class(TForm)
    WebBrowser: TWebBrowser;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDuimpView: TFormDuimpView;

implementation

{$R *.dfm}

end.
