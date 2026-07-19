unit uWalletSelecionaImpostos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyDgOk, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TOpcoesCtx = record
    Destino: integer;
    Tipo: integer;
  end;

type
  TfrmWalletSelecionaImpostos = class(TformMyDgOk)
    rgDestino: TRadioGroup;
    rgTipo: TRadioGroup;
    Panel2: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  class function Execute(fixarDestinoIndaia : boolean; var Opcoes : TOpcoesCtx): Boolean;
  end;

  const
    FIXAR_DESTINO_INDAIA = True;
    NAO_FIXAR_DESTINO_INDAIA = FALSE;

    IMPOSTOS_FEDERAIS = 0;
    SOMENTE_ICMS = 1;
    AMBOS = 2;
var
  frmWalletSelecionaImpostos: TfrmWalletSelecionaImpostos;

implementation

{$R *.dfm}

class function TfrmWalletSelecionaImpostos.Execute(fixarDestinoIndaia : boolean; var Opcoes : TOpcoesCtx): Boolean;
var
  form: TfrmWalletSelecionaImpostos;
begin
  form := TfrmWalletSelecionaImpostos.Create(nil);
  try
    if fixarDestinoIndaia then
    begin
      form.rgDestino.itemindex := 0;
      form.rgDestino.enabled   := false;
    end;

    form.ShowModal;
    Result := form.ModalResult = mrOk;
    if Result then
    begin
      Opcoes.Destino := form.rgDestino.ItemIndex;
      Opcoes.Tipo    := form.rgTipo.ItemIndex;
    end;
  finally
    form.Free
  end;
end;

end.
