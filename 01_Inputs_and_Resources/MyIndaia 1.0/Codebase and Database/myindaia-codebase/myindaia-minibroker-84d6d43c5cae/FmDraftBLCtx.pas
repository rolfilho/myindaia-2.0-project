unit FmDraftBLCtx;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyDgOk, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;


type
  TOpcoesCtxDraft = record
    CopiarDoProcesso: boolean;
    CopiarDoAmend: boolean;
    NrAmend: Integer;
    Idioma : Integer;
  end;

type
  TfrmDraftBlCtx = class(TformMyDgOk)
    pnlFundo: TPanel;
    Label1: TLabel;
    lblNrAmend: TLabel;
    rgCopiarProcesso: TRadioButton;
    rgCopiarAmend: TRadioButton;
    edtNrAmend: TEdit;
    rgIdiomaMerc: TRadioGroup;
    procedure rgCopiarProcessoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function Execute(var Opcoes : TOpcoesCtxDraft): Boolean;
  end;
  const
  iPORTUGUES = 0;
  iINGLES    = 1;
  iESPANHOL  = 2;


var
  frmDraftBlCtx: TfrmDraftBlCtx;

implementation

{$R *.dfm}

class function TfrmDraftBlCtx.Execute(var Opcoes : TOpcoesCtxDraft): Boolean;
var
  form: TfrmDraftBlCtx;
begin
  form := TfrmDraftBlCtx.Create(nil);
  try
    if opcoes.NrAmend = 0 then
    begin
      form.rgCopiarAmend.enabled := false;
      form.edtNrAmend.enabled    := false;
      form.lblNrAmend.enabled    := false;
    end;
    form.edtNrAmend.Text          := inttostr(opcoes.NrAmend);
    form.rgCopiarProcesso.Checked := opcoes.CopiarDoProcesso;
    form.rgCopiarAmend.Checked    := opcoes.CopiarDoAmend;
    form.rgIdiomaMerc.ItemIndex   := opcoes.Idioma;
    form.rgIdiomaMerc.Enabled     := form.rgCopiarProcesso.Enabled;

    form.ShowModal;

    Result := form.ModalResult = mrOk;
    if Result then
    begin
      if form.rgCopiarAmend.Checked then
        if trim(form.edtNrAmend.Text) = '' then
        begin
          showMessage('Informe o número do amend.');
          abort;
        end;

      Opcoes.CopiarDoProcesso := form.rgCopiarProcesso.Checked;
      Opcoes.CopiarDoAmend    := form.rgCopiarAmend.Checked;
      if form.edtNrAmend.Text <> '' then
        Opcoes.NrAmend          := strtoint(form.edtNrAmend.Text);
    end;
  finally
    form.Free
  end;
end;


procedure TfrmDraftBlCtx.rgCopiarProcessoClick(Sender: TObject);
begin
  inherited;
  rgIdiomaMerc.Enabled :=  rgCopiarProcesso.Enabled;

end;

end.
